Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82668262E9F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 14:38:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFzMd-0000qd-U5; Wed, 09 Sep 2020 12:38:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rxpi=CS=arm.com=diego.sueiro@srs-us1.protection.inumbo.net>)
 id 1kFzMc-0000qY-JQ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 12:38:14 +0000
X-Inumbo-ID: 6f68731e-9279-4984-ac10-35af309ca154
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.63]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f68731e-9279-4984-ac10-35af309ca154;
 Wed, 09 Sep 2020 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rCnPxAf56q4NDSxG80F9hQB69WZxrgA6V8E/jsIqwU=;
 b=5QoS50ojXN3HZfy8a0RJ8rPHOAP9cWJBARNHBHih08bNmZVBLV0ams/vNCU+7Q/xcUthesRacfkvMdfCehv+An85WNX6EyITWPVQfy82GjCI9dgb/wdaKvI133RF5oePo1qoFIDL/tSLF+KmAggvOFDqZaAePx+hjcSvxhD2omI=
Received: from AM5PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:206:1::26)
 by DB8PR08MB5385.eurprd08.prod.outlook.com (2603:10a6:10:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 12:38:11 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::e5) by AM5PR04CA0013.outlook.office365.com
 (2603:10a6:206:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 12:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 12:38:10 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Wed, 09 Sep 2020 12:38:10 +0000
X-CR-MTA-TID: 64aa7808
Received: from b91da9cabfaf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92C91841-3C2B-4516-9D66-69931155130C.1; 
 Wed, 09 Sep 2020 12:38:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b91da9cabfaf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Sep 2020 12:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsX0WCg+quo1jFpMr1pnPZGfu1sggFYDuXHwWFu5oET9DvnPOKjZ3m4ZSMQ+rR5EP9FzfhBUp41Q92qqki5A8HNcmua/V0j10NcBabYqnXGtALFHhAEZxv9Kmd2OiX/crdKZA+nuIVzgwM69uDqKUXlhelVQJgKlJBOaFWLBQSmCT3MBrUX3qW1qqdoMMJfgROoibZ1GXTWQidCGnnmo9nTusuA0GsNRaSI39PBa3KrbEdzqZw0pohb9/3TMFNCGaBHJIAT34gN0BXGqZeaJ7uFTm6GFUg2EvBiMYoMnX2j9wDZz1wD59tyNznIdpX0zqWpoE3GSElEcA/+6qPw/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rCnPxAf56q4NDSxG80F9hQB69WZxrgA6V8E/jsIqwU=;
 b=bbF4nrMrmrMeP0B1sE58YfkeJw9o2XHbOr8sNKSFulvcKIGD08+htKjiP+GBBJQCzOP4GScP5bxAYvyVbrspKWaMLwDTExMf7y04Zz18wfkJ2x4qNp+Jlf7yEX44gQyxFMX6YU68Fy5A6fUAxuUdOE/8U8tsLMDqVWRHj3zQfmlmbjZLEQ5y1eVaNLIW4oWb7mMNNnEGtxXPnoHQ7AjYH9ucjs7IQB/9kDvoIcSIQMRb0xGHUpcDdJkV0nozbxlcnDsckWlkWkF/mpJiOc/V8byYAhxFggFs5aSVXHPRpKiRoXjKewOnz0JrRkNmJRuQILBFU1QFtft4ZYNynxMDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rCnPxAf56q4NDSxG80F9hQB69WZxrgA6V8E/jsIqwU=;
 b=5QoS50ojXN3HZfy8a0RJ8rPHOAP9cWJBARNHBHih08bNmZVBLV0ams/vNCU+7Q/xcUthesRacfkvMdfCehv+An85WNX6EyITWPVQfy82GjCI9dgb/wdaKvI133RF5oePo1qoFIDL/tSLF+KmAggvOFDqZaAePx+hjcSvxhD2omI=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3302.eurprd08.prod.outlook.com (2603:10a6:209:41::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 12:38:03 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 12:38:03 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd
 <nd@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: RE: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Topic: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Thread-Index: AQHWduEcCYgO9CTqnUq3GyJB7RikoaldWqeAgAAHKICAAAI2AIAC+exA
Date: Wed, 9 Sep 2020 12:38:03 +0000
Message-ID: <AM6PR08MB34617439F1BE12AF7988316C92260@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
 <20200907143601.iuuk5yrzgv2stpze@liuwe-devbox-debian-v2>
 <4FA762CA-FAF0-46AC-A634-9F6D93287668@arm.com>
 <20200907150932.mylpejk57553ygtv@liuwe-devbox-debian-v2>
In-Reply-To: <20200907150932.mylpejk57553ygtv@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 1590FD13CDCC66478181CBD2A6983524.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.205.40.148]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b6207c6-254c-4fff-70c2-08d854bd35f4
x-ms-traffictypediagnostic: AM6PR08MB3302:|DB8PR08MB5385:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB53853A71ED99B30F383D0FD592260@DB8PR08MB5385.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +T/6YAUtCXVq9G7PNhYCX4yPoDNA+Yjey+F+aqeb8S3/CLfgOxVqf5kchfJLNXwNIVTUsyD8mo5HAB2bMjwxKstCKEdDcwsdl6LMVKqOlL5K3gZwdP+uposTYBSYMStSQQqMbmQUIw1B4c6i5p4t4YRsJqy0E6WvZKAzaXeFEu94D1ZAdFMFVFzJ61oKq+RjUWr6YpPtklKlDpcMe+v0h+vbEl7MNbXRxAhSsvt+EX62pdDLT0sbdhwU1hjw6XU6aMwgk5hun6/nJuo7s0U3j1ykIgjuVYEba9220IviHlK3TlO1mE/QNazF2KA8RCMLBjDD3zK+d3LMAgYNuq5RMg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3461.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(478600001)(4326008)(53546011)(6506007)(5660300002)(6636002)(64756008)(83380400001)(8936002)(86362001)(71200400001)(9686003)(55016002)(66446008)(33656002)(66476007)(66946007)(66556008)(26005)(186003)(316002)(7696005)(8676002)(52536014)(54906003)(2906002)(76116006)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: n0Bx/TwoXBaKyKIMnQDjysnanCiQ9+xmJJ+0ZgmwrWdJHnw7SoFaf/r2P9xKqswd1j0X0zFbxF6PN2ZylejrRYwD1eOgvZXOLzfqBrxWVM31g1wo0oSELPGpliIygKWPOC5/cyoBIPg7xEnIp4DfH3J5w7aCQ/KZvjau6s2C5A05xCWlCvpcOUwgrY2KzEt8GWB221W7MyQ+Ir2rBoKCuoRmHg1PEmdpTVk8rsGgt8RuTgWW0QYNYvEUpn+uSLeDa55xFyUXMA3Amx1u7tJWdR1KKgP8GiqM5sIgUzlzWNEuSmbOuyu7mImRAhVYIB+/By0VH1mvVneRBG6X9Y3v3exSRSLVF5bzTlP2fnFI/Hrra3Bw2ZVs1l8Fh1mvQBVLXwhjwNui3bNguWtsT6M4OPfC4MFM9a94KNLclKsDOLlaaW0gy++d8geh/8Qn5MRMmNRA3IxHIKgFISUOfJprTjf6TG4AL4lGGLmVOipU6ylJqnn3UK20tYOFQ2Px2fWMhMB8jdGX63+WpNOIMeDxuWCGLSRtBQqPHAjBIMCY7KmZLo3lRuaywAls3//3AnXk9I2ijbYKM8CMa8g5Q4nWMc6H0I082SUzmXCVa4MG41HzBk96kgQ9pi1M9xNHFstu5+gp36A3ruK3a7MT0dPp6Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3302
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c9a3e36c-64fe-4a9b-99b7-08d854bd31ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CSRcbC7JI3sv4XECIIHgatoQkKu2QJtrpIhIyMJAJqmwI+8yo2FOS81oOVfFsRFU5a5H6aSi8Ekyep1P8F5jDvAK2RopdTOilz4OgqYbqi09jfKbwTiCZNBl5JyeGBcrBWo8wkbqyXlN+Fb+f9+TACFtMbAjWnRLX5WWRSDVi9WoSfypgAl2vhglv0zadSn1WmKiosJQXcTN/tbnACVSTGG+wjNHQGYnq5FDgRQxd438ap6RJdZqT9lk1vR39r+1SGbkdjQon8RbTeOM1ZkdwOpp5fNZSzZri77r2FbY5hfwLaYtoYVpavUJxX1eUIzxzKqa0zYeDUSt7j+t/II33pJrGBcvPcX8DgLf6B5jOrS4+A5wHvJpSlN2aO0uUTr7Lm6NdkvcxNIxynFbbIrTlw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(316002)(7696005)(82310400003)(70206006)(70586007)(83380400001)(8676002)(4326008)(86362001)(6506007)(53546011)(52536014)(356005)(107886003)(33656002)(81166007)(26005)(47076004)(8936002)(54906003)(82740400003)(5660300002)(186003)(36906005)(336012)(9686003)(55016002)(478600001)(2906002)(6636002)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 12:38:10.2629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6207c6-254c-4fff-70c2-08d854bd35f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5385
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

>-----Original Message-----
>From: Wei Liu <wl@xen.org>
>Sent: 07 September 2020 16:10
>To: Bertrand Marquis <Bertrand.Marquis@arm.com>
>Cc: Wei Liu <wl@xen.org>; Diego Sueiro <Diego.Sueiro@arm.com>; xen-
>devel@lists.xenproject.org; nd <nd@arm.com>; Ian Jackson
><ian.jackson@eu.citrix.com>
>Subject: Re: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-n=
at
>
>On Mon, Sep 07, 2020 at 03:01:37PM +0000, Bertrand Marquis wrote:
>> Hi Wei,
>>
>> > On 7 Sep 2020, at 15:36, Wei Liu <wl@xen.org> wrote:
>> >
>> > On Thu, Aug 20, 2020 at 12:00:23PM +0100, Diego Sueiro wrote:
>> >> Copy temp files used to add/remove dhcpd configurations to avoid
>> >> replacing potential symlinks.
>> >>
>> >
>> > Can you clarify the issue you saw a bit?
>> >
>> > Which one of the parameter is a symlink (I assume the latter) and
>> > what problem you see with replacing the symlinks?
>>
>> Maybe i can explain here.
>>
>> If you have this:
>> /etc/dhcp.conf -> dhcp.conf.real
>>
>> mv will create a new file dhcp.conf where cp will actually modify
>> dhcp.conf.real instead of replacing the symlink with a real file.
>>
>> This prevents some mistakes where the user will actually continue to
>> modify dhcp.conf.real where it would not be the one used anymore.
>
>OK. Now I understand the use case. Thanks.
>
>I think you explanation should be part of the commit message.
>
>Diego, can you please incorporate Bertrand's explanation and deal with my
>comment below?
>

Done and v2 sent to the mailing list. Thanks for your review.

--
Diego Sueiro

>> >> ---
>> >> tools/hotplug/Linux/vif-nat | 12 +++++++-----
>> >> 1 file changed, 7 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git a/tools/hotplug/Linux/vif-nat
>> >> b/tools/hotplug/Linux/vif-nat index 2614435..1ab80ed 100644
>> >> --- a/tools/hotplug/Linux/vif-nat
>> >> +++ b/tools/hotplug/Linux/vif-nat
>> >> @@ -99,7 +99,8 @@ dhcparg_remove_entry()
>> >>   then
>> >>     rm "$tmpfile"
>> >>   else
>> >> -    mv "$tmpfile" "$dhcpd_arg_file"
>> >> +    cp "$tmpfile" "$dhcpd_arg_file"
>> >> +    rm "$tmpfile"
>> >>   fi
>> >
>> > You could've simplified the code a bit here and below now that both
>> > branches issue the same rm command.
>
>Wei.


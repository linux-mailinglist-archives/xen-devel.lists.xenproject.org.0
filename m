Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8EE252B38
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 12:15:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAsT7-00077K-OH; Wed, 26 Aug 2020 10:15:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ynE=CE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAsT6-00077E-A3
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 10:15:48 +0000
X-Inumbo-ID: 4dc7bb02-4bf5-4925-94d4-6a3dd9e62cea
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dc7bb02-4bf5-4925-94d4-6a3dd9e62cea;
 Wed, 26 Aug 2020 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9GNL5T+U3dOgDrKBGrjZvVLU5Ek/eYlPl4zEs5+l9s=;
 b=DcTCnujixSg8ZK/gZZJnQ+HUCW/IwOeVKzdjXE8Nhg8dq8KBEpOAzlwyJYkc7m7ALTFE7BZFl4P8lTfLoDNVoZRGUPdIP4YOMsyoNMhouwzDjHgwISDOeuKWDWDMqGP1VLVWkGXc2GOiUbG9f5J9XqJWB7Q91wKisMhSIbWeZT4=
Received: from MR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::23) by
 AM0PR08MB4930.eurprd08.prod.outlook.com (2603:10a6:208:157::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 26 Aug
 2020 10:15:45 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::4e) by MR2P264CA0011.outlook.office365.com
 (2603:10a6:500:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Wed, 26 Aug 2020 10:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 10:15:44 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Wed, 26 Aug 2020 10:15:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91175cc88a0b44cd
X-CR-MTA-TID: 64aa7808
Received: from d47f5bc8cb79.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B90C2F2B-0067-49D3-94E7-D245E72FB179.1; 
 Wed, 26 Aug 2020 10:15:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d47f5bc8cb79.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Aug 2020 10:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqUC8Dzuof/FRpSORrbp++bVfCxHtAasEhOr/tVUPV+wJcxd2yxfi3020mw9xNXjkuCyJFaNpOzsAySVCBxNedWd9LnXhb01IBvZ0XJyK6eJRDNFlTBHXLA6DbHpn+rGgE+913fzULjCOXqTXG03J23NrSXpa7ICKph9GiYIGa1wxWDEuqdcgcxTolUxhnukWpBK5jmjj7iljZ8MVxAxK95or1Xa3RFHBGHJUpD4QKEgWik8RZCtn9FRaknqEQ8jGwJRw+PCV80SA7p9eEO3wfkcafnLEk8l8VRmKPEQd592COQjaPh1RCMrBtrk6G+8I5tEMgm6tABt8huqo9lfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9GNL5T+U3dOgDrKBGrjZvVLU5Ek/eYlPl4zEs5+l9s=;
 b=AeHTcyxQerutDjdBYu1trQ00v+TxUuO9nWbbA1kCaV3XwD7Z3nEAZs8Xxi9zVzYwwGYHr4u+1+LA1QsT9/MFzpYlf/LZAzqlYRVCVYzAqdRAlY1J4FISdO3i7hv1EAwQwmrfNJ6651ibWa7DBQr6uIrKmcjzsbrqIdfx/6ymwU9FvGkCcivzID535164u7pwsN0I9I9ZQ1IvjI4cwKxM1fAxLGPswLRO682EkI7tgqcXLtWhmVVSH5mlVOvzSRf+6RnYGoKI/77EIRdjRcbPrs5yaCE7j0Z0B33XZslEsacPyd+iWtXMZY38hHZLbCirQYjEWwensT4RJ3462TkcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9GNL5T+U3dOgDrKBGrjZvVLU5Ek/eYlPl4zEs5+l9s=;
 b=DcTCnujixSg8ZK/gZZJnQ+HUCW/IwOeVKzdjXE8Nhg8dq8KBEpOAzlwyJYkc7m7ALTFE7BZFl4P8lTfLoDNVoZRGUPdIP4YOMsyoNMhouwzDjHgwISDOeuKWDWDMqGP1VLVWkGXc2GOiUbG9f5J9XqJWB7Q91wKisMhSIbWeZT4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3033.eurprd08.prod.outlook.com (2603:10a6:5:17::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 10:15:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Wed, 26 Aug 2020
 10:15:37 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
Thread-Topic: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
Thread-Index: AQHWewnUkkU6H1K20kyXPZAlyrTVA6lKBAsAgAAex4CAAArJgA==
Date: Wed, 26 Aug 2020 10:15:37 +0000
Message-ID: <80467605-DD8B-4DF3-9959-56043713E0FF@arm.com>
References: <20200825174208.11070-1-julien@xen.org>
 <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
 <c38ad53f-0a95-cb89-1a1a-c896ecb10ff0@xen.org>
In-Reply-To: <c38ad53f-0a95-cb89-1a1a-c896ecb10ff0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27c37354-f2f0-4ab5-67e8-08d849a8feb7
x-ms-traffictypediagnostic: DB7PR08MB3033:|AM0PR08MB4930:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4930F525DE85F8C5663729699D540@AM0PR08MB4930.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:983;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fXdzWXExX4K2maHfM3EptrkdzrzHYvsjvBTT/cAS67FDgSziuIzvpNj9szb6N19TEGyxkXH8gsaD+7QDSiSwiKvR4d53aX5C3jDaNNtQLotMhllQwDA/X/+N2XG9ZMmWgwmDPQEbg6pjHxDIqwdeGjQm2K6m7l4W0i2irSxJuteQ21DO7lojfRSO6ahhZfh15bwMwIidbzH/8lBWlrdDoYt6019jv2ERcxCr0SPwDZFntdvtceXfv4RArWi+ilSVyCO3eHk89vpEcLw77edppVPYgP9AkgXQ7xIqrvaBF6XlzEQQF2AyyT85/0hMwWa1014+zcPDmk+upozlrsB6Gw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(83380400001)(186003)(6506007)(53546011)(2906002)(15650500001)(2616005)(26005)(4326008)(36756003)(76116006)(91956017)(86362001)(66446008)(64756008)(66556008)(66476007)(66946007)(8676002)(33656002)(8936002)(6486002)(71200400001)(316002)(6916009)(54906003)(5660300002)(6512007)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cwZ1ov85Q6Rbh9AMod96Cbq1cLjogzI9SwxQWdiC8b1fLtFXMtTRGHfWwEU+4lkkpUq0wOyLhrzENg0dUlFBoPs8L3C5vfBtjLPzcFdnNDJArSFz2pwcnSidDsQ3ffzH8uRf+5iRCvdapTEoLC+JbxR/0Xr9mJXLFkjZZI1hjRgxJjxE6YR9YCDu9LYlJme6Hei7E0RQJi8ixHrnDzaEazUi3kqJy1JIEMqIwlIgM3vCBIZVY9tJSCPAtsAZMzVawSCledOLNv/P3/ufnFJyXvvemMoNkOSWyKyJKLHLEPrvT9h1+Ld2dGmUzH2e1dB24JWOyiqR+H67BbFWtZzgU/eBv2xEqbUmpFf43zGZa81NSZV4PmGZS592ilN33BHXCqLug5Bjzw//0DhBbgzuzW746wvhWapjm/zCaNqag7KnPFIfXCme7dnBDP9DUgoH0JDOqg/V9FSg2xQCzPJYvQzzB779ooWZAEuO/1ORkRtLSN6LMqKiDVqxoEudcIOOtjRLM3eFNTT+JxZAozXAJIAko6Q03ScoG/3G68jc0QRHtXNS5cnqPIuf+vxJ6dGkxmT1Rg6/ZTFvXl4sXSmtDtBxQwjBBXyoYsTW1V9A5HdMNObQxyJunnpO4+389K0YMBifld09i0vLfg57Aj4XBw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <95EFFA76B206CE42A23B03B6F1EB7221@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3033
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 08c96475-f723-4d9a-ffc4-08d849a8fa27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4YSpwar+Kt3ISc23UrhAY63ufk3PDsd9IOnjhzrjxAz68sCr3TNRMzjSh6bnHr00AsUKAwY7ko+F0M/xoHcafPxGUjH2RzNlgOjX+7XmmY91yDXRjkWxQHPcvioprRG0FOyGEQuY+rgmntbWDfUpMhXuxvJu3kPsrCvHcvIedi1ohD6X2lyp7hV8+6MIga6e9qosLz8zv5IyUb26L9uyQe5n9mncKD2Cic07BojA6LZi8VDVzvsTl23cV3bnK+A0EYbXgYngRqzOql1JZuNmNM7CXSUuWdqdiE3ip/ab0Z6DH69ubftZ92nN4WPO0ekynsEpT2QCkO8P/uroLrgxv1afZbNEGiUciDF4Y9RhgliQ3drVKg9i6ycUENXhAl9L+zV8qpYwOlGyW00kaENeA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(46966005)(6506007)(53546011)(356005)(4326008)(6486002)(82310400002)(336012)(81166007)(47076004)(82740400003)(70586007)(2616005)(86362001)(33656002)(70206006)(186003)(6512007)(2906002)(8676002)(478600001)(107886003)(26005)(36756003)(6862004)(36906005)(316002)(83380400001)(5660300002)(54906003)(15650500001)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 10:15:44.8281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c37354-f2f0-4ab5-67e8-08d849a8feb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4930
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



> On 26 Aug 2020, at 10:37, Julien Grall <julien@xen.org> wrote:
>
>
>
> On 26/08/2020 08:46, Bertrand Marquis wrote:
>>> On 25 Aug 2020, at 18:42, Julien Grall <julien@xen.org> wrote:
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
>>> added a new erratum but forgot to update silicon-errata.txt.
>>>
>>> Update the file accordingly to keep track of errata workaround in Xen.
>> Oh i should have done that as part of my patch.
>> Nice catch.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> docs/misc/arm/silicon-errata.txt | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-e=
rrata.txt
>>> index 11e5a9dcec2c..ee070e723a5f 100644
>>> --- a/docs/misc/arm/silicon-errata.txt
>>> +++ b/docs/misc/arm/silicon-errata.txt
>>> @@ -51,4 +51,5 @@ stable hypervisors.
>>> | ARM            | Cortex-A57      | #1319537        | N/A             =
        |
>>> | ARM            | Cortex-A72      | #1319367        | N/A             =
        |
>>> | ARM            | Cortex-A76      | #1165522        | N/A             =
        |
>>> +| ARM            | Neoverse        | #1165522        | N/A
>> Should be Neoverse-N1 here (E1 for example is not impacted by this errat=
a)
>
> Ah, right. Would you be happy if I do the change on commit?

Sure then you have my:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>
> Cheers,
>
> --
> Julien Grall

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.


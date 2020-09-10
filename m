Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9726479F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGN8H-0001X5-Nl; Thu, 10 Sep 2020 14:01:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBJY=CT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGN8F-0001Wb-JZ
 for xen-devel@lists.xen.org; Thu, 10 Sep 2020 14:00:59 +0000
X-Inumbo-ID: 913342ed-ca8e-426d-ad75-68ff5093ddfe
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 913342ed-ca8e-426d-ad75-68ff5093ddfe;
 Thu, 10 Sep 2020 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2F3YD54fA1R5OuQLYQ/G60SOEUvUIGKHDFGV1yuG1A=;
 b=q9ZmVsoe8o4dU6KO1E6A8cjuVxq8hxfeeLFAJJGNU4zbR1rkCbHRAYUgGgkau4eySWR2PwZmCfy1LF5kSj6wF0WAUrFVCV9i1uRBu/T9NcQLOnS5S7KkOkf2RX5K9grBEgFNp1N6l73vaTZKFxLRyXbN5MPicQpCRYkaV+9yGlk=
Received: from DB6PR0301CA0064.eurprd03.prod.outlook.com (2603:10a6:4:54::32)
 by DBBPR08MB4888.eurprd08.prod.outlook.com (2603:10a6:10:db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 14:00:56 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::ef) by DB6PR0301CA0064.outlook.office365.com
 (2603:10a6:4:54::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 14:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 14:00:56 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Thu, 10 Sep 2020 14:00:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a74b82117aefaace
X-CR-MTA-TID: 64aa7808
Received: from 894de25df1b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32559267-50E0-45D2-BA44-60B1AC6CB21E.1; 
 Thu, 10 Sep 2020 14:00:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 894de25df1b5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Sep 2020 14:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1OstiSkcgKR/NKhEIVLb/QyJHc1m2Nm3eKJ1dn+J/lV4NxRpaEOe8Aa/+lkOtU/OSJBmYtfgEgAlHpsoTBTfFAZ4WrhT2Or46tcGgSP0DT6qLbN7iZd7uoI/EzIuGS69t1kCTnCUVI8iPjdFQBBUBNDgXSkJJ7XY/U4Ju42gdvTtQ8+PqQ6q5EpaRqYbR1A6hBFyH69hU2bliSp9erR93/eb1x72GxaBzpesTk0KJZzZqGsfUN6NW6xGutwJrVE0N1xaYSIl+639o9qazBLA7ijpnFWyuBJA3zi8zimr/TM0EgI61F8uKvLaD8N46EBHJhiPiq/Be35Cozo9DeJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2F3YD54fA1R5OuQLYQ/G60SOEUvUIGKHDFGV1yuG1A=;
 b=QesdFpxDHXRYguz44Oa+yJrIn5imbTdfM5f/fwNdId9y0cgyieJ0RI4yKCAE7oNBTQbhHWMmVGSFTy66/ft+nyjh4J5xNWrE112eQoKdlwEDTHOQRdUuN5q9X51TUfhC6iS0OvmRbAulk/NKP4smv8tFi1YyA9ub4RHMdjignPmPxtS3lJekP6PNzIe8G4A4p77Xug2IOuAmcK/CkuydDAUzU6DDOR8VIvdJBMNynQbWKmzhdfGBpT0ptblothxEsE+n+pb9+XFpnVwkbKe+AiVt/bd6iEfM+L8rPdy9YgiDKNXRaOJv4mzK1axdMSh3iMURX6vqZSuQdH+xqB7JMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2F3YD54fA1R5OuQLYQ/G60SOEUvUIGKHDFGV1yuG1A=;
 b=q9ZmVsoe8o4dU6KO1E6A8cjuVxq8hxfeeLFAJJGNU4zbR1rkCbHRAYUgGgkau4eySWR2PwZmCfy1LF5kSj6wF0WAUrFVCV9i1uRBu/T9NcQLOnS5S7KkOkf2RX5K9grBEgFNp1N6l73vaTZKFxLRyXbN5MPicQpCRYkaV+9yGlk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1654.eurprd08.prod.outlook.com (2603:10a6:4:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Thu, 10 Sep
 2020 14:00:39 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 14:00:39 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <stefanos@xilinx.com>, George Dunlap
 <George.Dunlap@citrix.com>
Subject: Re: Runstate hypercall and Linux KPTI issues
Thread-Topic: Runstate hypercall and Linux KPTI issues
Thread-Index: AQHWh3jMy0NFQnBtL0aR33AwNuevPKlh5ViAgAABPYA=
Date: Thu, 10 Sep 2020 14:00:39 +0000
Message-ID: <2AD6A14F-AA25-464D-9E9E-6067F2F43F29@arm.com>
References: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
 <8b9d8bc8-254e-01db-6ba3-ec41bc9cd2c7@suse.com>
In-Reply-To: <8b9d8bc8-254e-01db-6ba3-ec41bc9cd2c7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4fa31a9-969a-47d3-0de1-08d85591f01f
x-ms-traffictypediagnostic: DB6PR0801MB1654:|DBBPR08MB4888:
X-Microsoft-Antispam-PRVS: <DBBPR08MB4888E703B7B7C979FA8077029D270@DBBPR08MB4888.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fkY7HfPUPV5ttZ+dCBhUSqcF74hcFKgXfzewynDAcaff/V3mAv+NW9skPvE8ux7plwFqfXvn/GOd1L5vxhmkTUtPNBsXQ+bIyAYB39JlA37YFzpWqxgsdPGMiSgS4TJNO1IksX4zQjdKIZvHq8DSg3u0GXrOkgV5i2kLy37FnzSMTnodoXH9ueMMjVASbZJGeALMGl+EcL+5QSPh82y0Uhk1zJAL2aytBBCG2HGsaAB/NvwC0nVbjt++Odh2FpcPvFbONUz8wTMVkHuqobx/6A/hbmqBqlz7RwT+3jGmANWtiWnEl1XLGLbYUmvcwJpSXMTrn7y8WNtzXXLbtJaiUg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(316002)(8936002)(33656002)(478600001)(54906003)(186003)(86362001)(26005)(5660300002)(2616005)(53546011)(6506007)(71200400001)(2906002)(6916009)(36756003)(6486002)(66476007)(8676002)(91956017)(64756008)(83380400001)(76116006)(4326008)(66446008)(66946007)(66556008)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cOrTmo3I0ogk4AzJRBi9FU43hxMEkHmgkFVhABIWtv/pgI9BxJe7cnX5U+c6Eob9d/VbnhMF2miA/dfht8WivTIgxrpOmh4sT0u+fqpWxJvcoK3+7y+GbVKrx4mxUvFo1IETEj7QW+cFYYNpNWI+oiZog+xbN20xWG4bkOW/tjgbHE6hChI27ChDUxs6fFRZRWLtAR3od1xXnwj8TZf4VKrUI2Ez7nvvDwF1WhqK+RlmkiGPQxDojEDk4HFWt+u1jZerf22fiXVjHLe8jDIH4avQOm6g3FcLJVWb2Xi5+sHloedkVHdQrgH2j23gNE8SfLNR25MpTjKgnyz9EU528uo88qKR5kbkhj3/vwV+OikfDyNiw7O0rhFM54DfPHw293CZb9A1D7cwY1pkVB8XVUy4uA4P2RpU5cdB06e+AVKIS4HFJrukP75Rv4iauU9Px8TO6ZA3rL9ECY7vHx1gi+aj6SBRHPZEZnsodUFm5AuPHv+NktFpkKQeb2nV/G5557UUUZydgDsblq62A7f8BhE+M65VvXUTe/6GuvcDeP8JPPeVC6za/a0Fv9kxfhmZh0EsSKvtKgZAxMI+L6GFQrMOYPBqeUkqjumQxYoG7FWIvjjdxRkvwLtxnncsQ/U187xnR6Us91ovALRF7tRkkw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27CA584AC05D3546A9BAAD8758847B53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1654
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 73f89375-868e-4785-46cb-08d85591e68c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMPtS7pYHggSla7dFw2nqLB7lJjLkztGW/LHCtJUlbT9lwAgbkqGXY0FedtaJ97ECsTOdXipbuAaoEvUJkamE9xp41jzrMFqTetFEINbOJlvtFSN8E4e3kh+P2X/H4wYLneMcfjZfItIN5kYi4nGZwYqM3eKjg/M5JuaXYit4X/KhWbQGrH3fG2D31XTqLWNNjuRQjTsu7LJi7SKJSKjQWMsMS9DEa3XctuClXMWXmpZcdsxI6ycihb8qP2JvLzEjreQZAs2WiFWNr+sbsYuwkX3O5MdpzFpayY8j9Ox1auoAvAoXOpymowasVoqfEjFTMj2BM3aa2ediGv/q0r2mnvdKArl7RRouLMn6rvrCyUJaiU+6vY02jem4bTpRRfrUqXnaFW/pxiK0XaMU36BZA==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(26005)(316002)(8676002)(83380400001)(336012)(6506007)(47076004)(53546011)(70586007)(6486002)(70206006)(2616005)(4326008)(107886003)(33656002)(478600001)(6512007)(54906003)(81166007)(186003)(2906002)(82740400003)(86362001)(356005)(82310400003)(8936002)(5660300002)(36756003)(6862004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 14:00:56.0041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fa31a9-969a-47d3-0de1-08d85591f01f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4888
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



> On 10 Sep 2020, at 14:56, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.09.2020 15:46, Bertrand Marquis wrote:
>> Some open questions:
>> - should we allow to register an area using both hypercalls or should it=
 be exclusive ?
>
> I thought it was already clarified that to a certain degree both need
> to remain usable at least in sequence, to allow transitioning control
> between entirely independent entities (bootloader -> kernel -> dump-
> kernel, for example).

Sorry my wording was not clear here

Should we allow to register 2 areas at the same time using both hypercalls =
(one with
virtual address and one with physical address) or should they be exclusive =
ie one or
the other but not both at the same time

>
>> - should we backport the support for this hypercall in older kernel rele=
ases ?
>
> It's a bug fix to KPTI, and as such ought to be at least eligible for
> considering doing so?

That will mean also backport in Linux. What should be the scope ?

Bertrand

>
> Jan

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.


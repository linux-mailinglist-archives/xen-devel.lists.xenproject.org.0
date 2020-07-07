Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F7216918
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 11:33:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsjy3-0007Mu-0w; Tue, 07 Jul 2020 09:32:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YS/2=AS=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jsjy1-0007Mm-3O
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 09:32:45 +0000
X-Inumbo-ID: cf03f6e6-c034-11ea-bb8b-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf03f6e6-c034-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLX/AhMbkhWFC2C3uVjyTAejozWL1ODt5MuHslyzkZA=;
 b=C9ySjCriTnZfQNYzmr9QtxOxRmSMS26vS7v3fmflEGHZII6m70/Yo5HirL29p3fGjrO+cpbqT5vdJo1LKLMI0T434kvapL1IwzDyBee1Z9mMUiDl7hHSe//WOBxqWeBY/PNJ5z5J2hXjqJUaZvlbvy/4g9kGDlxuCrzElwzXCf4=
Received: from PR3P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::12)
 by AM6PR08MB3767.eurprd08.prod.outlook.com (2603:10a6:20b:84::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Tue, 7 Jul
 2020 09:32:42 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:52:cafe::2d) by PR3P189CA0007.outlook.office365.com
 (2603:10a6:102:52::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Tue, 7 Jul 2020 09:32:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Tue, 7 Jul 2020 09:32:41 +0000
Received: ("Tessian outbound 4e683f4039d5:v62");
 Tue, 07 Jul 2020 09:32:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82f1e06f8c9aead7
X-CR-MTA-TID: 64aa7808
Received: from 66edd43d0094.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0270E046-079D-4288-B40E-A1AA269BDB94.1; 
 Tue, 07 Jul 2020 09:32:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66edd43d0094.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Jul 2020 09:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR7SXE4ImEahstAbnENAkBE13lFzb20kPnG790EOp/8htJlvAJf1Ir/j3rqRxMHZidMW3Uk7l3n9bsPHF2NbBj+ysp94SC51FCdp3eCPv7eH4s+uFTgl+bhX5WRR4peqT4ZnFM7cG1TVYKT11YCQgasKHrma4U51DnCbbpT96TwtnTeSeEtIu3D4EvVhBO2HW0dYRQr2mGXjWk+O12ni2iYzKV88Mz4yFTqiqdCR+ho1rKnugByif1VnFyx0I0zti1d5YV6o9uCpo3IQ83uuRsvVwVn7GtI9b2d5MZwQJAhLRNQAoNfa+9WqErqlnVk+Awa9xbRr88Qtu9SEbCazgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLX/AhMbkhWFC2C3uVjyTAejozWL1ODt5MuHslyzkZA=;
 b=JaB/l5oCy6JXb8bk+ZmmBi6X3C6+0YhU2Wd9XCZqN7RaDBU2oL47N/zhxBnvTQBSu9NCzICT2ZyQPpuNd4H8nGKAbtkPR8s1Mco5OnPnllOy14aSxLvKOWh+Nc23WphZTL0fIRfZP6jB9a29vgGMpkRIjABI+yGgFh0FBsmmq5nZumIyra/ozfGL/xo8eMbrEYOkxHKByZoPO6acZiRYY82R/4M54sIMQMgc14QsoVkMs5pYmBWZ14G77LVDzGHiQSQaIpcA0NWEwT8tZehJkz9b/u5xIle7h3yxXc0eftYUdPNZIBud7vhuwVH+cFLTKaNCakD73wAFDvbvzILQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLX/AhMbkhWFC2C3uVjyTAejozWL1ODt5MuHslyzkZA=;
 b=C9ySjCriTnZfQNYzmr9QtxOxRmSMS26vS7v3fmflEGHZII6m70/Yo5HirL29p3fGjrO+cpbqT5vdJo1LKLMI0T434kvapL1IwzDyBee1Z9mMUiDl7hHSe//WOBxqWeBY/PNJ5z5J2hXjqJUaZvlbvy/4g9kGDlxuCrzElwzXCf4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2166.eurprd08.prod.outlook.com (2603:10a6:4:85::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 09:32:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 09:32:34 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
Subject: Re: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgA==
Date: Tue, 7 Jul 2020 09:32:34 +0000
Message-ID: <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
In-Reply-To: <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8eb80588-e6ac-4420-efe3-08d82258b254
x-ms-traffictypediagnostic: DB6PR0802MB2166:|AM6PR08MB3767:
X-Microsoft-Antispam-PRVS: <AM6PR08MB37677AE749CF8538A091FC2C9D660@AM6PR08MB3767.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
x-forefront-prvs: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jrn1mZIs5x08dsTXj0MRuTg5S9oI09OiYBLt5R5+R8yXwfOkANwEp1Z92F3ioanZRaKypCKZubR1DcYmo4v9tOmZUH5FlsqslKTkL3LLV3v4QbarTeGTsUs4wyAcs2sfir3K45PyqCnAZYh6/CCMMTAmF/dRR4F+MqBaNxAu4pJrkcQl/mc8fs8V8X1BIsMd1uH/9SYVVUSHcZITUzFpp/YvFofF7gHQe8+U8jXqfEcZLE0+oX3QDIQbsOKm+JBCMQAPdZNsKLTiZC0LO4ufZrqJqgVkqz4YJxG6rsobsEdP5abnQ23AX7XGY4xZp/VM
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(5660300002)(33656002)(8936002)(478600001)(54906003)(316002)(6916009)(4326008)(66556008)(66476007)(66946007)(66446008)(64756008)(6506007)(53546011)(186003)(71200400001)(6486002)(2906002)(91956017)(26005)(76116006)(4744005)(8676002)(86362001)(2616005)(36756003)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: OMPYw9yDIGX7WRWu1Zufo0li7ZDY8uL5FR45PpQuSxPSDuWRKvdHr4K0TNOQMQQO2H1zSWnOGre0D9TKy6ptfUrZ0y0AscCA6QFHxX3hr3dmiw4345yIVW11ac00XIIOkUcLaaqeVg66n2QSae3vfX9c8tmtPc0ZYd7xmtGS8qxzvVPBQ/q6uwdknshjzaUUN5bWhySPopvFvcvs3d/01nkUWbpShaaEE0EhfaZfgMJoQnot0JWI7b44mRnnks15iqlZSAvPbEYy+iBreQxexcYg2mObmrgSaNhlNYhLQrjefFJ5sKXjYhRc5MleZikIqjIexpZue5X1b3WV3xhojY2PF1n8boBhVXmK0wrHTkg0AC/P/Y69GOuQm2CQX/bVFf55i66bscU+cAygD7aGcGyad7tDpuGAkuXd6k9uPe2kYoQBqdJSmwkoVmL5zC1gv6iQmLNPF7YGr9Mhd+Gl0Y0kf1tDllV88t3y9ufID07g6QF2b86qPsQYoe4oASOp
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <357DED9AE18EFB40A90A0DA46882C0F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2166
Original-Authentication-Results: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(4744005)(26005)(8676002)(33656002)(70206006)(53546011)(82310400002)(4326008)(6862004)(70586007)(36906005)(478600001)(86362001)(356005)(8936002)(6506007)(81166007)(36756003)(82740400003)(316002)(5660300002)(2906002)(47076004)(186003)(6486002)(54906003)(2616005)(6512007)(336012);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f3726b4-12da-4b86-c4c5-08d82258ade2
X-Forefront-PRVS: 0457F11EAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //qZu1JywtYL4fsSVB8wsFBVAxA30uLilGdqaapDBU9RArf2ADZIHnXsixrtXURSvtONRAdgrgmL9G4ywsXlIRT1ppsr4ab5Q5QDC1gYVaRzFEXKvbfgnIHmECkq3ildhmpuiz6XUY+V8FThQXIYQJegArxex3C9w5Od/8J0ubof/ScljrTNOD5zeij0u3xE1x51fJWzZQZ/EMxK35cCxb/QOES8POoGzqgh6Zst7qVCFuEvz7wRGLPkrqHa0hOwmVE4DNxT4D/sEL3zdg2MmagCUcmjFt8XXJYF+P23S8k3sSC6OvuVNcYaIoP+SRlJGd8Xc3CGk8mT3ct99UtfVzAv9xP2TdtLdbkDILfy7LbVSsJqSDQDwV1ydmgdgu4oCYsNWhM5Fekp9xJ2ILaoEw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 09:32:41.6083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb80588-e6ac-4420-efe3-08d82258b254
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3767
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
Cc: nd <nd@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 7 Jul 2020, at 10:28, Manikandan Chockalingam (RBEI/ECF3) <Manikandan.=
Chockalingam@in.bosch.com> wrote:
>=20
> Hello Bertrand,
>=20
> Thanks for your quick response. I tired switching to dunfell branch and b=
uild gives parse error as below.
>=20
> bitbake core-image-weston
> ERROR: ParseError in /home/manikandan/yocto_2.19/build/meta-virtualizatio=
n/classes/: not a BitBake file
>=20
> Is there any additional changes required here?

I do not have this on my side when building using dunfell.
You might need to restart from a fresh build and checkout (you need dunfell=
 branch on all layers).

Bertrand



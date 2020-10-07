Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0457285DC5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 13:04:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3425.9873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ7F5-0008BV-5L; Wed, 07 Oct 2020 11:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3425.9873; Wed, 07 Oct 2020 11:04:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ7F5-0008B5-1t; Wed, 07 Oct 2020 11:04:19 +0000
Received: by outflank-mailman (input) for mailman id 3425;
 Wed, 07 Oct 2020 11:04:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ7F2-0008B0-OX
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:04:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68c9cada-2760-402c-9ff2-4dec5642f0a3;
 Wed, 07 Oct 2020 11:04:14 +0000 (UTC)
Received: from AM6P193CA0077.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::18)
 by HE1PR0802MB2252.eurprd08.prod.outlook.com (2603:10a6:3:c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 11:04:12 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::d7) by AM6P193CA0077.outlook.office365.com
 (2603:10a6:209:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 11:04:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 11:04:12 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Wed, 07 Oct 2020 11:04:12 +0000
Received: from cf65fd090020.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE2B7E3B-39FF-4523-818B-0351DD80B87D.1; 
 Wed, 07 Oct 2020 11:03:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf65fd090020.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Oct 2020 11:03:38 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 7 Oct
 2020 11:03:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 11:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ7F2-0008B0-OX
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:04:17 +0000
X-Inumbo-ID: 68c9cada-2760-402c-9ff2-4dec5642f0a3
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.71])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 68c9cada-2760-402c-9ff2-4dec5642f0a3;
	Wed, 07 Oct 2020 11:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT54h2fksZ7J5I+P+9j4aKZF2pB581qOXG4XdEteP84=;
 b=MpYEyeylTt5S6+EwXPvrEzRzumihtR/d2TPdnA5k8Pscuq9NX97ml9V60is6Ey3+IhnyavL4tUkxCEntfeXCMb7Mg0dvzw4wGtO/k0rTCIUf32eBkfpnKrTzNrMtwmoL/VSztfRC5PYMwNczqOyQe4wAR7aqQ6LdbL5fq0bjfAM=
Received: from AM6P193CA0077.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::18)
 by HE1PR0802MB2252.eurprd08.prod.outlook.com (2603:10a6:3:c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 11:04:12 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::d7) by AM6P193CA0077.outlook.office365.com
 (2603:10a6:209:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 11:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 11:04:12 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Wed, 07 Oct 2020 11:04:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc8eff64858f2eb4
X-CR-MTA-TID: 64aa7808
Received: from cf65fd090020.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DE2B7E3B-39FF-4523-818B-0351DD80B87D.1;
	Wed, 07 Oct 2020 11:03:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf65fd090020.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Oct 2020 11:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5gw9KtdAtZg2dq/UfvjGswJQKyWiSm40/Rr86QlbFMoi7/eEvy49X2QH8fMMQKLXilYCGreY5mrBv6ACa9nodBsK6hVte6FlgqWda+Ou7CxCEL2omS0FzLQSc9Xl62Bi33QcSZwD4Pg856rSpkwEAMeqoxYuEZf470Jl2auO+SyhfDX0uTr2pA8L6KomdcwsJC+W9ta2G/LKiUOZX1iFGhfz1Y9Cf2n8BLAq7KU/rWLnfqoE03V55z3/V2OtgKN7Zxw83b93u1FXQS62hkgiROzfgYShnOnfTAhCS4cB4UGfLL1YWTjp/V07qcIf0e2UxFGzmC5uO60OhlIV2F+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT54h2fksZ7J5I+P+9j4aKZF2pB581qOXG4XdEteP84=;
 b=I9rDNbITyqE4FWBLVEBGw/NoCv/CsaQJ5DS/CmkuUqycKR3z0SfUFXIUkIyYQrl9wb/YWbUWqNa3M2nbsZIGVBwWggJVC9k6p4qoRMB6SsjckWY6WYbK9OFUg0U4x2jSWd/r6tvH/eqsTHY93KvwdaUVAR//TklnHxw05mxNuytXlAcZErD0kJsfoBz/xNXtzZjjcjcX39cufZ67+YP2Srkoh6U+Pz13/y66A8cihwYZcG3RaF961cnoom+26wZ+hdEVVKIQL7oRNT5Z9K9XoqHDNnZSjo0uspmyGQMumAZmRHFw1oktDIXnqNbjbi3W8Gf5ShPXAUEcMfEZHVLItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT54h2fksZ7J5I+P+9j4aKZF2pB581qOXG4XdEteP84=;
 b=MpYEyeylTt5S6+EwXPvrEzRzumihtR/d2TPdnA5k8Pscuq9NX97ml9V60is6Ey3+IhnyavL4tUkxCEntfeXCMb7Mg0dvzw4wGtO/k0rTCIUf32eBkfpnKrTzNrMtwmoL/VSztfRC5PYMwNczqOyQe4wAR7aqQ6LdbL5fq0bjfAM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 7 Oct
 2020 11:03:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 11:03:37 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Topic: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Index: AQHWmKjTj7VmlPYcLkSjqrrhNFG5S6mEOTwAgAfIdAA=
Date: Wed, 7 Oct 2020 11:03:37 +0000
Message-ID: <78C4CCD0-403B-4670-A2C2-C1BB2AD498FD@arm.com>
References:
 <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
 <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
In-Reply-To: <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27060cbd-5b46-4ae1-3d5c-08d86ab0b91e
x-ms-traffictypediagnostic: DB8PR08MB5324:|HE1PR0802MB2252:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2252F6550799F65CE8C502869D0A0@HE1PR0802MB2252.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K4BebxKZ3lCEx7K8vtmIOgeuaRNWx/FLtp10vLotJq1jzid2IXWXqFaGV3CU3X+kfA2nqkLtZ3WjgB64zlkvQcKtOKuXsHKT+/YpZDCyzC+GJ2g2ul4CNNzGtYuQ4eZoUQ1a0/StTEoc/+pfJHpNu/28AyDs/gDpKbkEEGZ74OacrMjJkuzKwqAxjUQ3zSHjeqOHkEY275CWEhsHgtHTQJ/TpaLBwmyLO2Aay0MOM6/5QW6sxe49aO/Itc8AudrQLvgm7eH7oAVPIE5rRU+Rm3Evs7jddMhq8yqRepY2WO+JcOp+dC3vzs/Fwq6vMtRIrXUOWHM/fCeRajUwH1e8kA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(136003)(346002)(396003)(86362001)(2616005)(33656002)(478600001)(71200400001)(4744005)(66556008)(66476007)(66946007)(64756008)(76116006)(91956017)(66446008)(5660300002)(2906002)(8676002)(8936002)(7416002)(36756003)(6512007)(4326008)(6486002)(316002)(54906003)(6916009)(6506007)(53546011)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 E+FH79Mf7HaPQBUg3BOPSZkkmiMK/2mdtFnOaSNq32vfz7nVNSUU7bVzLHge2UlY2CwKmCB24afZ94wapATb25ONtpzQQAY/6fnDiYqEoQ2DHfvT4FbGMs90y7kvwdATjAx3hfF/LFB8KGSRV9/vtMDotuNJrPE6mLoYy/b+lgulIoHv16YUoqMbjbQ6rLay50MGzMO0SYXU8Fj/qvCse2QjgayNylpRWj383rVC9C0if26sXnkycvnZoGLbfZL9lNipT2HIiDOnRKvIml9MJHZoIoIXKy7GvIKkKucW1ovDdFnEj7DGqJIAMVU3E760VOtO6GUzq2JhnStgLw1+M1arbqwosQfHiV8+vfAF/6ybzkobk74rzFjkEQ+AjkACsumbNAibw6gPamNICQYySNZrgBgIk6VxCxMKBppq/uMa+qYLBGe19DtwiCNUiuTTFIHRKWerVnH8KfMDejvQ7XXpMem5Q49atvPm8EQQUVdNCAX/habfpE580SZ+QKL63Webx8VG49buJYER5qGLE8X9dUJyioKRdxMbNrsUzqV+fdqH+uQMt1CTaukWURW1Dh3FxSVQZ9t/5uqylizeC0D5wJdsyXmV28K77wGQbAlVQ+mnyZdnQ1iT15GotkfgLLsXWdzP8HflRUP8JWI0ig==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F63C67BAA1B2C14180990FE52197FDBA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d7d6ee7-13dd-4b5f-5d5d-08d86ab0a401
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lAQRDqBCke+FGF7KigxwfeBDMzq+hIcaeBicXLz/R6ryg/HuSqJrmCPJOcNt28Q2cJiibh9raTQVqsRQuo97hCWb5knEPk/v81QanN9XFmPffAKi+0kuXj5ngzUygSAfBrVRIeU0g5d11UnCehyomkJg0Z0BtZXgfiGxhCWqO3uO0W3d4y0pYCBHeiLZJCjSghdNh9enpoDe0aYq7XqFnnNQGZx3s9xpUPic4qCz1UBD4HJbIRF/m5ihyN1FrX3SRr2PwVXa8gpifMkEw0uA9Hxyqz+3WxmAZO+EdMNlyUSxEBNMSKkeJ7EW4ANfoNzQFRbgEZBoKeIyvXnmhfTlYiikqdjWIZKBMcEjDahlJvvqjDjEfizaX8nq8HB0n6vpOTAmJcBRBTW6ya++v+K3ag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966005)(70206006)(82310400003)(6512007)(81166007)(2616005)(47076004)(5660300002)(356005)(4744005)(70586007)(82740400003)(26005)(6506007)(478600001)(336012)(4326008)(53546011)(86362001)(54906003)(2906002)(316002)(36756003)(6486002)(8676002)(36906005)(8936002)(33656002)(6862004)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 11:04:12.4911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27060cbd-5b46-4ae1-3d5c-08d86ab0b91e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2252



> On 2 Oct 2020, at 13:12, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 02.10.2020 12:42, Bertrand Marquis wrote:
>> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
>>=20
>> This is removing the dependency to xen subdirectory preventing using a
>> wrong configuration file when xen subdirectory is duplicated for
>> compilation tests.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> (but more for the slight tidying than the purpose you name)

Ping: Could this be pushed ?

Thanks
Bertrand



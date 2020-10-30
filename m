Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646A2A0431
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 12:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15683.38760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYSfA-0008Gv-Fg; Fri, 30 Oct 2020 11:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15683.38760; Fri, 30 Oct 2020 11:33:44 +0000
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
	id 1kYSfA-0008GW-CN; Fri, 30 Oct 2020 11:33:44 +0000
Received: by outflank-mailman (input) for mailman id 15683;
 Fri, 30 Oct 2020 11:33:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kYSf8-0008GR-My
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:33:42 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 787a24a7-1e8b-46c3-83ec-badb7adef874;
 Fri, 30 Oct 2020 11:33:39 +0000 (UTC)
Received: from AM6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::49)
 by DB6PR0801MB1910.eurprd08.prod.outlook.com (2603:10a6:4:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 11:33:36 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::31) by AM6P191CA0072.outlook.office365.com
 (2603:10a6:209:7f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 11:33:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 11:33:36 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Fri, 30 Oct 2020 11:33:35 +0000
Received: from 2805b5e93a1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F59DCC22-F060-40FE-8114-77FF9587D29A.1; 
 Fri, 30 Oct 2020 11:33:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2805b5e93a1c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 11:33:30 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB3911.eurprd08.prod.outlook.com (2603:10a6:20b:80::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 11:33:29 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 11:33:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kYSf8-0008GR-My
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:33:42 +0000
X-Inumbo-ID: 787a24a7-1e8b-46c3-83ec-badb7adef874
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown [40.107.1.72])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 787a24a7-1e8b-46c3-83ec-badb7adef874;
	Fri, 30 Oct 2020 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2qMybRCDFhgG6MNeBGmhEN/2We65xIKDLyNqtdOX5g=;
 b=vxMrH4BY9s4Kds4h7FH1kUwkLzlM3Q7ka74BPYEq+bqQXQNx/1RDKWuyiK+PqKhOnD9lf5JOwID+Sgap1DlDNDaFoVGtaJgDuBDHLx57/9pVgsrvRC4oDy2gUSXNmLZa+TahXJQlREelxgGwRWLGJr3vFetkxTyxgLGeF6XTOQU=
Received: from AM6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::49)
 by DB6PR0801MB1910.eurprd08.prod.outlook.com (2603:10a6:4:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 11:33:36 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::31) by AM6P191CA0072.outlook.office365.com
 (2603:10a6:209:7f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 11:33:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 11:33:36 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Fri, 30 Oct 2020 11:33:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0092c98987175636
X-CR-MTA-TID: 64aa7808
Received: from 2805b5e93a1c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F59DCC22-F060-40FE-8114-77FF9587D29A.1;
	Fri, 30 Oct 2020 11:33:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2805b5e93a1c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 11:33:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUv1EJVUJ6kZqLgnlNAR7JsARWTteCCCLX9ifXoYZRAaOVYRexFFNZCvDTCi0mOYRBb/34kHMn/Zf+Ybj0Rh+HrvqCu5urObIZwc5QpAFW0EbdU/hC63nPK6+Eyv7EDcITHqug9g49NiYdbdfOOn6r9vkSRLbtonXXXbNQtPrPXBO5tiLHi1BFe6W0Qv+aFSny0ZpFkMGUR63Mx97mKvY+UtDY2/gaLRMschobu568jEd0D3hDhIUts8QpdawcsTE+VN/toEIx3cRCnmLx5c9uN9o4H9HX6+H1gG0PeRPLIB1hygH/nDxYTzBCkTaZYF5SPjbqu5MAKCAp9XGo8Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2qMybRCDFhgG6MNeBGmhEN/2We65xIKDLyNqtdOX5g=;
 b=fSTa9GSTLD78iG00KF+E1W33cwtWAvrUcChF4EHOc7I6bXgMQJRGfxKDJge+pQIhuiBaO1g05glkT2CI1YR4w75U3i+lfPFHNtclao1RDziimlTcXDYTIFu9sKxXOh5HmKDNi9iRyo2+5tCGjJ93V0GIDOu7vQxniLpssvRnBlRpaIW7U1dcUV+JqwLNmxXCck0Z8BqMKDRL/Fs7xmqhfoQbS/vgtB3HOd913fJLWzntJCI544H+SrmGw9yNF8snQOfwFhilG5giIdtgTp1LY8uoh1iRLN+SP2EhX29+JIb8c2bLXTrWR6kXf+4Rk9V3Wg/YqR6sDd64cgogNUrRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2qMybRCDFhgG6MNeBGmhEN/2We65xIKDLyNqtdOX5g=;
 b=vxMrH4BY9s4Kds4h7FH1kUwkLzlM3Q7ka74BPYEq+bqQXQNx/1RDKWuyiK+PqKhOnD9lf5JOwID+Sgap1DlDNDaFoVGtaJgDuBDHLx57/9pVgsrvRC4oDy2gUSXNmLZa+TahXJQlREelxgGwRWLGJr3vFetkxTyxgLGeF6XTOQU=
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB3911.eurprd08.prod.outlook.com (2603:10a6:20b:80::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 11:33:29 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 11:33:29 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQCAAWIugIABA+CAgADBXICAABfBAIAAGI6AgAAOSACABG94AIADrVCAgAFBfQCAAGM1gIAA0RiAgAAJ+ACAAAarAIAABWQAgAAYtgA=
Date: Fri, 30 Oct 2020 11:33:29 +0000
Message-ID: <E52CE228-0D19-491E-BA47-04ED7599DDCE@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
 <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
 <bc697327-2750-9a78-042d-d45690d27928@xen.org>
 <92A7B6FF-A2CE-4BB1-831A-8F12FB5290B8@arm.com>
 <alpine.DEB.2.21.2010291316290.12247@sstabellini-ThinkPad-T480s>
 <1BE06E0F-26CF-453A-BB06-808CC0F3E09B@arm.com>
 <aae5892a-2532-04f8-02af-84c4d4c4f3fd@xen.org>
 <226DA6DB-D03C-41A7-A68C-53000DFA70F6@arm.com>
 <e5ce30c5-e0e0-90c8-962d-c86b65a82ccd@xen.org>
In-Reply-To: <e5ce30c5-e0e0-90c8-962d-c86b65a82ccd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 40b8455a-5586-44a9-8f90-08d87cc7a3fe
x-ms-traffictypediagnostic: AM6PR08MB3911:|DB6PR0801MB1910:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1910864F262630D08D12BB0EFC150@DB6PR0801MB1910.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nFNxemlv7JUNCkpuPjTFYRMXpwIkNKh6bJ8uIzCew/JPFsXGZ6zFqidiwB6bqRGVDiP0EtnJ8hCHRfj+hDGKxWPHMaS/ftTpSSgXTtaGzFVFfYZCBMUrIlY5IPhaJ2slzAiMIW4Q8g3xaqqkPypo97Btw/VZkkTAQpxW2yADBrfYR5Nupv5UeKvlokSm+MwqUCAq1GExdg7VXX0kI4geeBBKfsXtmaNyOb7Nw9nOx4IFtDUl8LHux4n9UcQ68OxcKv04EojHr58OTz6kt5yaGJQWY34frpq94oMWx4XEdcWvnpdGAOcZdch/93msjMkzPayH7m30BHGbWorApYCbMvY1u0VEf8wg7uktbQbTfXr1EBUvXI+bSHrsEiwVL8Zrl0HRPXKp09jz3lJ9J96yFw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3496.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(33656002)(36756003)(83380400001)(55236004)(26005)(6506007)(186003)(53546011)(6916009)(316002)(4326008)(76116006)(91956017)(478600001)(66446008)(6512007)(54906003)(2616005)(6486002)(8936002)(66476007)(8676002)(64756008)(2906002)(66556008)(86362001)(966005)(66946007)(71200400001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 TdSMMA6EAAya4WmiJwCSAHuuNWG7IvpDdNpPCivp+g5h4t+qhtuWT4iYUJ/WLQ64nwVMDFzEUxs3BqjcOWLf4iNulrTJ0kWjphQodruSSKHsCcxVKyoDt3wEm59GAQ9FmmlR+V1wNzJRQ/O84Iz+Vt/9ahUH2uxNOK7VWidhtMYg6QuFCgBUfyVgR6ifarBuX8GmnqSx1xghbqIMRoc39+iafsiXf8mkxY0PBEnvFTAvkXHm+0XsQpy3KaGvCxSYelYQ+GMXGvUWMqHYSbED76XuhApUB5zDlThUayHTq3gB480UcilvrAxfplwgqr8J4/tI341EvZJ3xmAhRir5S0IuQWSHWZLTEwBCQnBqSZIMJ8Jopjn93Cf6MLvgGHu/DNrnVdoTFeYRRne3LnDdZxnHffcZ+aTt3hIhpwlfT+QVCbn97hPg5ubI3PPSLOoU9kZrPg0TgFrO704GikLOkTDc6Ik5IDS3/WNlsmHXqmANqS8AqmUO7h2VNoLQ13cxKoLTdsk4gbXYP+0VupxRVGQqFn/VcRCkuLNAtxfgrkiO6cDwjZk9w4rqrgP7xL48XsJW8RIG/Vz0pDGG5RXNa2rKohW5SFuFxayJXm1M0cvCaEMsWp3NrYp5lIds0okcYMjRHjYoxUKa4Brqc1YA0Q==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65395984F5DED74A919BFF61F4F68EBC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3911
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bae2347a-cc23-47fd-0dd4-08d87cc79f9c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PyHIxHDJOHU5TaW0+o6zFNoWiuqhTO6FqbjN1nzVQxY10l48FjViUJ8c8BcRdv1NivbVPcGQHj6M4Fbya/iseCkttKCYGoxi9ZykoayxaSSFNi0iTgeZ1hzzYaLtpBkJKijpT2BeHLqikCk8NYenXBBYoASW5gbTpmhPWsD2D823zR4DFZ7Z5yxbFMzbheiRnxlGr5RCL2KttcL6AwCGxhO7NAK98u2O5sK5oqFyvWOipMEYsOSg6tRU+f1Nv10IRcWB7cHiaDTgedaG3C8H8VDZnpcfQWjkytxac9p8uFD1YHvytJkQguzp63gu0+gYeOJluNtIiFOvSaNo5E4T2KD6cGtbswS4RUvqF0YvkJ0V2OoAyS7LUT3t9nymbn15kEtH0XSRpnEPJFLOdv+HV4WUzoOZF+8C9Iu8kUTWzc2tgBMQ7F7TxZT9cpW2IIcqqBtk8vXJfhinD3FwgqSyp7gG8wyaY4egtUcXx+UuA7o=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(336012)(8676002)(36906005)(8936002)(82310400003)(316002)(478600001)(2616005)(6512007)(86362001)(26005)(356005)(54906003)(83380400001)(33656002)(70206006)(6506007)(6486002)(70586007)(55236004)(53546011)(966005)(107886003)(5660300002)(36756003)(186003)(2906002)(6862004)(47076004)(4326008)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 11:33:36.2631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b8455a-5586-44a9-8f90-08d87cc7a3fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1910

Hello Julien,

> On 30 Oct 2020, at 10:05 am, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 30/10/2020 09:45, Rahul Singh wrote:
>> Hello Julien,
>>> On 30 Oct 2020, at 9:21 am, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 30/10/2020 08:46, Rahul Singh wrote:
>>>> Ok Yes when I ported the driver I port the command queue operation fro=
m the previous commit where atomic operations is not used and rest all the =
code is from the latest code. I will again make sure that any bug that is f=
ixed in Linux should be fixed in XEN also.
>>>=20
>>> I would like to seek some clarifications on the code because there seem=
 to be conflicting information provided in this thread.
>>>=20
>>> The patch (the baseline commit is provided) and the discussion with Ber=
trand suggests that you took a snapshot of the code last year and adapted f=
or Xen.
>>>=20
>>> However, here you suggest that you took an hybrid approach where part o=
f the code is based from last year and other part is based from the latest =
code (I assume v5.9).
>>>=20
>>> So can you please clarify?
>>>=20
>>> Cheers,
>> Approach I took is to first merge the code  from the commit ( Jul 2, 201=
9 7c288a5b27934281d9ea8b5807bc727268b7001a ) the snapshot before atomic ope=
ration is used in SMMUv3 code for command queue operations.
>> After that I fixed  the other code( not related to command queue operati=
ons.)  from the latest code so that no bug is introduced in XEN because of =
using the last year commit.
>=20
> Ok. That was definitely not clear from the commit message. Please make th=
is clearer in the commit message.
>=20

Ok. I will make this clearer in the commit message.

> Anway, it means we need to do a full review of the code (rather than a li=
ght one) because of the hybrid model.
>=20
> I am still a bit puzzle to why it would require almost of a restart of th=
e implementation in order to sync the latest code. Does it imply that you a=
re mostly using the old code?
>=20

SMMuv3 code is divided into below parts :

1. Low-level/High level queue manipulation functions.
2. Context descriptor manipulation functions.
3. Stream table manipulation functions.
4. Interrupt handling.
5. Linux IOMMU API functions.
6. Driver initialisation functions( probe/reset ).

Low-level/High-level queue manipulation functions are from the old code, re=
st is the new code whenever it was possible.

I started with porting the latest code but there are many dependencies for =
the queue manipulation function so we decided to use the old queue manipula=
tion function.=20
As the queue manipulation function is a big part of the code it will requir=
e a lot of effort and testing to sync with the latest code once the atomic =
operation is in place to use.

Once atomic operation is available in XEN we have merge the below commit fr=
om Linux to XEN to make XEN in sync with Linux code.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/iommu/arm-smmu-v3.c?h=3Dv5.8&id=3D587e6c10a7ce89a5924fdbeff2ec524fbd=
6a124b

> Cheers,
>=20
> --=20
> Julien Grall

Regards,
Rahul



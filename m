Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455892A01B3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 10:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15565.38568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYQys-0005aR-BK; Fri, 30 Oct 2020 09:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15565.38568; Fri, 30 Oct 2020 09:45:58 +0000
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
	id 1kYQys-0005a3-8K; Fri, 30 Oct 2020 09:45:58 +0000
Received: by outflank-mailman (input) for mailman id 15565;
 Fri, 30 Oct 2020 09:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kYQyq-0005Zy-At
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 09:45:56 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79a78a1f-639c-4cae-a3dd-2034078f0f2b;
 Fri, 30 Oct 2020 09:45:53 +0000 (UTC)
Received: from AM0PR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::26) by AM6PR08MB5173.eurprd08.prod.outlook.com
 (2603:10a6:20b:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 09:45:51 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:168:cafe::38) by AM0PR01CA0121.outlook.office365.com
 (2603:10a6:208:168::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 09:45:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 09:45:51 +0000
Received: ("Tessian outbound c579d876a324:v64");
 Fri, 30 Oct 2020 09:45:50 +0000
Received: from 6a88fe7a7c9c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 418A6E8F-F37D-4EAC-ACFD-BA7A6A16FC84.1; 
 Fri, 30 Oct 2020 09:45:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a88fe7a7c9c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 09:45:45 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AS8PR08MB6056.eurprd08.prod.outlook.com (2603:10a6:20b:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 09:45:44 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 09:45:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kYQyq-0005Zy-At
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 09:45:56 +0000
X-Inumbo-ID: 79a78a1f-639c-4cae-a3dd-2034078f0f2b
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown [40.107.0.48])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 79a78a1f-639c-4cae-a3dd-2034078f0f2b;
	Fri, 30 Oct 2020 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+XAE+Tgudorm68WDbKIYoFOWYX6Cb5xc02saLZogKQ=;
 b=KBmMSp/V45G243AjurihWjDvOWGUym2M9ItnF9LKXefM+DxI9IP38sbTnwt/NPkV9vmjh/6Bxp5peCEejKDjJA7Mgf3re0fgSujX0nkEJeli70wfpbYABgGS511wv9dYQrag9vpCu21EyfZG6Ns2RIpmkTy77g8jf/QJJXvs2A4=
Received: from AM0PR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::26) by AM6PR08MB5173.eurprd08.prod.outlook.com
 (2603:10a6:20b:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 09:45:51 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:168:cafe::38) by AM0PR01CA0121.outlook.office365.com
 (2603:10a6:208:168::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 09:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 09:45:51 +0000
Received: ("Tessian outbound c579d876a324:v64"); Fri, 30 Oct 2020 09:45:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a93da2af9c724ba
X-CR-MTA-TID: 64aa7808
Received: from 6a88fe7a7c9c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 418A6E8F-F37D-4EAC-ACFD-BA7A6A16FC84.1;
	Fri, 30 Oct 2020 09:45:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a88fe7a7c9c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 09:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nK2BnITnKhWaFyE8dumR2qt+EmGj0JMEm7w8HQlRSMM497ETeh6p07Fs93Mpo1r5gRlws3Vd78cz1HDs6qnQyJKtKRi3HUVcRH9kXfl3oIp1PGvmwZHYC6AuXOBqKCl0Cwy2Zl8tSlxA3dcK9TOkKeHAhVNd5Lv4vj7KlwwnveFBqEyUBSpX65IGc5+cCfkojAFyW6fUdFc3qb2IqwieqWILcLKusq3ip4np8pnq4N/GZpRwzqxWC1zQPhmI3TxKKsa/xa1m1pZlxhky6ZQlHUNXdDEksqOnt4kxiqRxK3vg6vp/xlfDs+KLDQVlZQPCSjqwk+y3tASxOKVSk8uiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+XAE+Tgudorm68WDbKIYoFOWYX6Cb5xc02saLZogKQ=;
 b=Wey6TZjhFUuxK55BBcDA8/ntkZUlCL3Iwt7lFRuYfYceODWgjqa7PGrehpr1ITFKo92Y+nu3ivnJJk6UaFQvWeA8FKYBTwwDQTuRWmAyftPC9tpp0qZNu/HWtTroQbxP2AyeUQbhQnbqU4HAlv+WbHsc76OgUpAfTOeZ2ZUBvx8p0Vdgf9NdL7aqtrXOSzsaIqB+cAFJNWJ1yekOOKuFyFBVVs/VatTnIxDOtsdExSS2jJlkQOUvzSDtUYuUpgcglN+xl2S1qWrQPbL27R9q5TM1HuI+QzwrWoQk9vrlYD0924oEf+HC4Stnm/lNBIlU34ZTCQn0yuS/EdjLXtVOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+XAE+Tgudorm68WDbKIYoFOWYX6Cb5xc02saLZogKQ=;
 b=KBmMSp/V45G243AjurihWjDvOWGUym2M9ItnF9LKXefM+DxI9IP38sbTnwt/NPkV9vmjh/6Bxp5peCEejKDjJA7Mgf3re0fgSujX0nkEJeli70wfpbYABgGS511wv9dYQrag9vpCu21EyfZG6Ns2RIpmkTy77g8jf/QJJXvs2A4=
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AS8PR08MB6056.eurprd08.prod.outlook.com (2603:10a6:20b:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 09:45:44 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 09:45:44 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQCAAWIugIABA+CAgADBXICAABfBAIAAGI6AgAAOSACABG94AIADrVCAgAFBfQCAAGM1gIAA0RiAgAAJ+ACAAAarAA==
Date: Fri, 30 Oct 2020 09:45:44 +0000
Message-ID: <226DA6DB-D03C-41A7-A68C-53000DFA70F6@arm.com>
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
In-Reply-To: <aae5892a-2532-04f8-02af-84c4d4c4f3fd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 707e313b-0cd1-483b-df05-08d87cb89674
x-ms-traffictypediagnostic: AS8PR08MB6056:|AM6PR08MB5173:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB51737DB2F01FDD46F6B32254FC150@AM6PR08MB5173.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J+UW7QAWr5Ecc1XSNqeSEOBun6t3gmOUmBqMDit0NEdIACqq24ktoZwL3uz+aXLW6MiqSiDlNNPVCxGvelhPduLUsalvwyFtbAyuknSnaR/5o5pahUM1K+caCNySuKtNc9x4tvhUBY/Elf8qK3ZMc+gs90TC0gaeP3X9QxXnig0g5LrUg/NufVz69vtkFOnd1e53P0KLlJ0JtCxdnQhYAjBxHa+WM0P4zTUkzfQwBi/Srwi+0RbCZxJvA8vWmnL+IXrAAK/p9SvNkra7Nwii6QQJtp0mWV64fbMkKqWUaNWUb+pdP8uOV1ycQr182VYMcO9AK/z8p/FoOn8ouH7ryg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3496.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(366004)(53546011)(6506007)(6916009)(71200400001)(36756003)(26005)(54906003)(186003)(8936002)(316002)(55236004)(2616005)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(6486002)(91956017)(86362001)(6512007)(2906002)(4326008)(5660300002)(8676002)(478600001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 a8FY6RjSgPdEvD2pwTogH9uF//e8S44/vmlIu9UHsop6cd1GbwUgUfnhCziW+Uv6QT6U56S/yh6Vd82KaOVrllnwBzyUDxQnSx5MhRpnkOzhAfQzj5e+TaURrJ1ejgOTCDuBHZ7HErSUs5EwpxPgv0E/iqk5ICqGKg5bDFIdcbsu+uqDJB8Odh1/pKE76BhpLiWUARt9GhvtmKXMby0HElMBOouSCZr0oDwnbaMl8Nhq/kU9omEgn8i5bpv5s7LTdNum4fjUHO2cfw0MELDp/8Io3vq0QjdW9cKIkIX/GXCGKE6dzAPnwcDe2XfTZs2BskHSOmuJolDOffQHHNPxhbdOfgyqp+u3vlN4DYrU2lQRNDOIqYB38nZBEZ6VPJKMIjoVXMteMpNA2vGjrPE323dRBJmGkFd161B3ArEzWiVvogC5mg3A8JZj44pgWZvDfS/xIer1J5i9DFkmIqJW4PHnfiNu0Q9X3LYYv88bwT8VtCesOGZjR0o6poiixeTRsX7ynRNir4fjF32v7N4QtCmXFVW2uK2/j4YHz5y14/irl1WaGGeczRKD6PV0lpYtg71MXgdB/oS/xYyFu1i8Isaq9SVoKg6VQUlDAVVqXDW+96Xc7ljwShAQ9BcOEV2b2VkYJrAaRl9ysnEk3RkyuQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <360B5411BA1936419D1AF71F622A44CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6056
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8db2b812-602b-4b4d-97c2-08d87cb8923f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uvVqBhikS7/xgrAymhYppctkVqUf3aGQQTTg81dkaOlhsDCX/AqMqFiaXy7xm/vs5Izz0L4G2Ptpwf7qVjAzcrJWX4hDr36Iww5anOUD4RlXbDTudyAMkGLUW5ohhpYYqDIpvauy4adroHjWIJSxWi8Qv+LPtE4KtkTuefc2S8c53wRkCH6pfcGvjBG+lTHCSxhEesYMLtHE3XCIdoFTehzLSjvIbjxVn59wBRROkZ2/J9cWeCY0O8jnDbJtgdLSqC9YYJs1Fv53EqLbf3A1GtsWdy2V+sYReCDhoDtJniHDz6VbR2k/5+VrpI2wqgf/cjVIpbwpF1WHUG3boEHpQZl8XlCWawOmf/eW3WNunRzJ2P6HRZCEESUDMvz8GldHaMvu8rHkJNIkM2UDFRI10g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(5660300002)(81166007)(478600001)(86362001)(70206006)(8936002)(107886003)(36906005)(2906002)(356005)(36756003)(6506007)(55236004)(6512007)(33656002)(2616005)(82740400003)(53546011)(8676002)(336012)(47076004)(316002)(26005)(70586007)(6486002)(82310400003)(6862004)(186003)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 09:45:51.1904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 707e313b-0cd1-483b-df05-08d87cb89674
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5173

Hello Julien,

> On 30 Oct 2020, at 9:21 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 30/10/2020 08:46, Rahul Singh wrote:
>> Ok Yes when I ported the driver I port the command queue operation from =
the previous commit where atomic operations is not used and rest all the co=
de is from the latest code. I will again make sure that any bug that is fix=
ed in Linux should be fixed in XEN also.
>=20
> I would like to seek some clarifications on the code because there seem t=
o be conflicting information provided in this thread.
>=20
> The patch (the baseline commit is provided) and the discussion with Bertr=
and suggests that you took a snapshot of the code last year and adapted for=
 Xen.
>=20
> However, here you suggest that you took an hybrid approach where part of =
the code is based from last year and other part is based from the latest co=
de (I assume v5.9).
>=20
> So can you please clarify?
>=20
> Cheers,

Approach I took is to first merge the code  from the commit ( Jul 2, 2019 7=
c288a5b27934281d9ea8b5807bc727268b7001a ) the snapshot before atomic operat=
ion is used in SMMUv3 code for command queue operations.

After that I fixed  the other code( not related to command queue operations=
.)  from the latest code so that no bug is introduced in XEN because of usi=
ng the last year commit.

>=20
> --=20
> Julien Grall

Regards,
Rahul=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C129714E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 16:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11029.29281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVy37-0002Bv-DX; Fri, 23 Oct 2020 14:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11029.29281; Fri, 23 Oct 2020 14:28:09 +0000
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
	id 1kVy37-0002BW-9x; Fri, 23 Oct 2020 14:28:09 +0000
Received: by outflank-mailman (input) for mailman id 11029;
 Fri, 23 Oct 2020 14:28:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP8M=D6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kVy35-0002BR-CW
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:28:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aea0c86f-7828-475e-99ee-edcdfdce41c3;
 Fri, 23 Oct 2020 14:28:04 +0000 (UTC)
Received: from AM0PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:208:69::16)
 by DB7PR08MB4217.eurprd08.prod.outlook.com (2603:10a6:10:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 23 Oct
 2020 14:28:02 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:69:cafe::6b) by AM0PR03CA0075.outlook.office365.com
 (2603:10a6:208:69::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 23 Oct 2020 14:28:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 14:28:02 +0000
Received: ("Tessian outbound c189680f801b:v64");
 Fri, 23 Oct 2020 14:28:01 +0000
Received: from 9d30bc132b10.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ECE2E7B6-E366-48D1-86B3-E0CCFAF129CA.1; 
 Fri, 23 Oct 2020 14:27:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d30bc132b10.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Oct 2020 14:27:56 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4322.eurprd08.prod.outlook.com (2603:10a6:208:148::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 14:27:54 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 14:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SP8M=D6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kVy35-0002BR-CW
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:28:07 +0000
X-Inumbo-ID: aea0c86f-7828-475e-99ee-edcdfdce41c3
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.82])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aea0c86f-7828-475e-99ee-edcdfdce41c3;
	Fri, 23 Oct 2020 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm9mTcOrrvUkLftjAZ0Ecc6q0i/efpX7Re7SPqS6ZFw=;
 b=sCJOz2AJh7tFjENTkJzWE9m8IVdp2csvjDrwLGCMeobIr9mGGTNr/qRpSWd13apt/qmOPjx2RsuJO4L0xIqzr/EPwBfbWDxYkzv3qbpHf3yYuUpuS6jmcWPpW+V1ZbpV3P7H50i30iXTRV6InmGYscvoL2BiNikRtQ9NvgZwg1M=
Received: from AM0PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:208:69::16)
 by DB7PR08MB4217.eurprd08.prod.outlook.com (2603:10a6:10:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 23 Oct
 2020 14:28:02 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:69:cafe::6b) by AM0PR03CA0075.outlook.office365.com
 (2603:10a6:208:69::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 23 Oct 2020 14:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 14:28:02 +0000
Received: ("Tessian outbound c189680f801b:v64"); Fri, 23 Oct 2020 14:28:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95dcc42c71afbb43
X-CR-MTA-TID: 64aa7808
Received: from 9d30bc132b10.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ECE2E7B6-E366-48D1-86B3-E0CCFAF129CA.1;
	Fri, 23 Oct 2020 14:27:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d30bc132b10.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 23 Oct 2020 14:27:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQnfDxitdb1NmqiLIAqWan3L5rLfXTiTMr8lgd10kYtl/eSk2t8BpkR53gkFa3Ug48FVdQY1qpFEpfdOu1DOfW3mpkrMX94gq5/tIVVVecElDXL0fbbcBNrzRnPkujEVREJxMYHq2ZOX5jb1fQSlycdFjEZpCf9N9iOdklqRYen0+KthKu8/YzK+Q6bCXvBc/7X1CEY42NW0S+obGLi9+CIDzVv3WLW9zafrIGmHIwXtQxVjySoQRTGOQo/qrzCDdwCfCGCGPYNGTiD1AlDO4oqaqy4uwc824sW45TnupbAPpWRmByLDG8V8IN8wuFoC53waKj1JS2Yb3lj3//TGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm9mTcOrrvUkLftjAZ0Ecc6q0i/efpX7Re7SPqS6ZFw=;
 b=m2snCqoMsgKggrG4u7Vsbo/JUneq7422mYyZy/8qzbHFGzz4y7kx3WGM8zqVU0M37WCfqlNqm1wcvrocUqILSyrwrSVrK4NTua9rPl3zhLowxW5gmH4bjM6oUzIC0VHPEGN828N/hFZMhmZ60CibqqB9MQJWP31BXA9/SHEpTQvlohutKzKOgVrUxmKu6Sp0sySeMfarswbH7z6b1G1RX/0n+BSQJMJFnfLQmW6lG8QoPajrn146HzC/WliOAWPtWsw6x5O89lmqvFp/MCqOT1xQ9VtzwkZ0vwGXPJ9CmwpE8M9/1TbvbfJSyOGJrMNqYTq3wCgUxyXlm1PSLDwKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm9mTcOrrvUkLftjAZ0Ecc6q0i/efpX7Re7SPqS6ZFw=;
 b=sCJOz2AJh7tFjENTkJzWE9m8IVdp2csvjDrwLGCMeobIr9mGGTNr/qRpSWd13apt/qmOPjx2RsuJO4L0xIqzr/EPwBfbWDxYkzv3qbpHf3yYuUpuS6jmcWPpW+V1ZbpV3P7H50i30iXTRV6InmGYscvoL2BiNikRtQ9NvgZwg1M=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4322.eurprd08.prod.outlook.com (2603:10a6:208:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 14:27:54 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 14:27:54 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQCAAWIugIABA+CAgADBXICAABfBAIAAGI6A
Date: Fri, 23 Oct 2020 14:27:54 +0000
Message-ID: <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
In-Reply-To: <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed7a999a-4689-488e-96ab-08d8775fd93a
x-ms-traffictypediagnostic: AM0PR08MB4322:|DB7PR08MB4217:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB4217C089031383681F8117D1FC1A0@DB7PR08MB4217.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yl6yeMhhbpT5rqmoZgVnP/vXCG1FYuZHmtTjjQ/05gHKLZLoKvfGLFfrhbpKID47TpN0RpgDIKd72gCPsaC62WfjqVB42x+dzTNHoy8kX7UwDWJ5TWre0b+bfzTs8Qm1FF/mkKA2UpdK5+K9KzU5VF6ekfTuBaeEp6eL2pG/d6UjEqL9c3bI6FX3E3w1II+VW3qP0ccomrEYK+nT4ehCGfWbXV982pQ8ePB5/ac3nSAMYnuTz9XbC8DqGJkCbh7rqaspr+g8l1KlarE5hIz55Mc8vYfKhNaDiLvOJBUqXfXv/LSJVbgP19gS/+wAs+rfCYc1jfKYB9nM7jyt5HNoyA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(2616005)(36756003)(8676002)(54906003)(86362001)(8936002)(4326008)(2906002)(26005)(316002)(6506007)(6916009)(53546011)(186003)(33656002)(5660300002)(64756008)(76116006)(478600001)(6512007)(71200400001)(66446008)(66946007)(83380400001)(66476007)(66556008)(6486002)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 lNFhFvFqf3Bd9uZQO2NguR9nZ6bgiegq9vSpvVGH/DorY10dKD5a58/XED+CfbTlhawV2Wd/5VNVhfxj8+Lb1Xb2+QwaC3HpZONNZcFPqnqXqbHul+1eGfLKbhwUbdNn+Lt9+jWSWalX0bJNJH3Xd6HwSCs+WDbMMNpycfivzMvXBkjd3PXYhmd+2fTt7AHIaDoWBxHBAey/EnAPyTqg7agBzY0YlfxlPjAc2GtGM2FV3/jSKjRqg6qoZNSvN4BvVwvX0sriY8qC7Jt1yX0vRF4sXrtdqMNUr7ChmjIyknWoI9QvDyXuI/jNrveKF3ZRAnL5xCtkEkoe9UF0v9uuGXrtk1+eIN0JEKzcHpf9GhrxZkNhGqX3I+2y445qvMuliFl/5JK7xTgMw9E5SE996pjU8NZwiSwXfOMR8rfVOdPCxdaew8zyQi7iQMPPhaVmSv26YP3vNeKAL5HX1xW4z6K/2ZFAg+mo3j9vkKewoZdvpnvM1A/7RTfr3aG0/+56Ja/iVSa7VTEC/T8nauVQ8vU+jaH9BPR9PgofCnGgOOgAVffzWvAjMWHnSaO3OUxSKLKXGXQcBeBjKYyRWHzWqcMZaV71JwiYB4bgeY0wHWIjHUzBk37ohZFNfRLvg5LoJa3KIxrdo9BzOiQgbYwozQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A1FFAA1CE5D894696315E8CEFF931E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4322
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6548902c-6b5e-481c-4439-08d8775fd4a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z0NMmMIiAPztH2hCYrE5Zw6jOxiOrvPobLq5cuc2TPxiYVTF1q7qkiOzFGcenT7UCnxx3ZMgbIzIuuMgZbfI5FbBpgUvtWGBSGhX4TdSCY0m5tZOb0dxQjuO1F3DvAN9smQb5FEsG2PZrPXnEaxb6AK9TMF5h3iqklvVBgf3hpj5DhtuGwyrRV/RdRXgjbhYKO5HFcUJoN88HxQVQ23V+f/mlOYrT2y6a1EVtFhbVILnd1y3CBP6vFk6Nr3UmoOgf8tFB/R+thu2rdpzjBpSPKyGscNR/mLOzL17L+x5Ij4e4V3KJSEV+0vrrfc+zbF3WhMoUYOrKTPF9PI32Ggxt4sjY6/ZdIHVu00CTcNVOFiR7hC8SWX9a0XPUkYJ/Da9q1KWYwE63r0UsWFdNZsbmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966005)(316002)(6862004)(186003)(54906003)(2906002)(478600001)(6506007)(33656002)(36906005)(26005)(53546011)(2616005)(336012)(83380400001)(6512007)(8936002)(47076004)(81166007)(36756003)(70206006)(107886003)(5660300002)(356005)(70586007)(8676002)(6486002)(4326008)(82310400003)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 14:28:02.2445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7a999a-4689-488e-96ab-08d8775fd93a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4217

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDIzIE9jdCAyMDIwLCBhdCAyOjAwIHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjMvMTAvMjAyMCAx
MjozNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIZWxsbywNCj4+PiBPbiAyMyBPY3QgMjAyMCwg
YXQgMTowMiBhbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3
cm90ZToNCj4+PiANCj4+PiBPbiBUaHUsIDIyIE9jdCAyMDIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+Pj4+Pj4gT24gMjAvMTAvMjAyMCAxNjoyNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+
IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0ZWQgU01NVXYzIGltcGxlbWVudGF0aW9ucy4g
SXQgaXMgYmFzZWQgb24NCj4+Pj4+Pj4gdGhlIExpbnV4IFNNTVV2MyBkcml2ZXIuDQo+Pj4+Pj4+
IE1ham9yIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIExpbnV4IGRyaXZlciBhcmUgYXMgZm9sbG93
czoNCj4+Pj4+Pj4gMS4gT25seSBTdGFnZS0yIHRyYW5zbGF0aW9uIGlzIHN1cHBvcnRlZCBhcyBj
b21wYXJlZCB0byB0aGUgTGludXggZHJpdmVyDQo+Pj4+Pj4+ICAgIHRoYXQgc3VwcG9ydHMgYm90
aCBTdGFnZS0xIGFuZCBTdGFnZS0yIHRyYW5zbGF0aW9ucy4NCj4+Pj4+Pj4gMi4gVXNlIFAyTSAg
cGFnZSB0YWJsZSBpbnN0ZWFkIG9mIGNyZWF0aW5nIG9uZSBhcyBTTU1VdjMgaGFzIHRoZQ0KPj4+
Pj4+PiAgICBjYXBhYmlsaXR5IHRvIHNoYXJlIHRoZSBwYWdlIHRhYmxlcyB3aXRoIHRoZSBDUFUu
DQo+Pj4+Pj4+IDMuIFRhc2tsZXRzIGlzIHVzZWQgaW4gcGxhY2Ugb2YgdGhyZWFkZWQgSVJRJ3Mg
aW4gTGludXggZm9yIGV2ZW50IHF1ZXVlDQo+Pj4+Pj4+ICAgIGFuZCBwcmlvcml0eSBxdWV1ZSBJ
UlEgaGFuZGxpbmcuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGFza2xldHMgYXJlIG5vdCBhIHJlcGxhY2Vt
ZW50IGZvciB0aHJlYWRlZCBJUlEuIEluIHBhcnRpY3VsYXIsIHRoZXkgd2lsbA0KPj4+Pj4+IGhh
dmUgcHJpb3JpdHkgb3ZlciBhbnl0aGluZyBlbHNlIChJT1cgbm90aGluZyB3aWxsIHJ1biBvbiB0
aGUgcENQVSB1bnRpbA0KPj4+Pj4+IHRoZXkgYXJlIGRvbmUpLg0KPj4+Pj4+IA0KPj4+Pj4+IERv
IHlvdSBrbm93IHdoeSBMaW51eCBpcyB1c2luZyB0aHJlYWQuIElzIGl0IGJlY2F1c2Ugb2YgbG9u
ZyBydW5uaW5nDQo+Pj4+Pj4gb3BlcmF0aW9ucz8NCj4+Pj4+IA0KPj4+Pj4gWWVzIHlvdSBhcmUg
cmlnaHQgYmVjYXVzZSBvZiBsb25nIHJ1bm5pbmcgb3BlcmF0aW9ucyBMaW51eCBpcyB1c2luZyB0
aGUNCj4+Pj4+IHRocmVhZGVkIElSUXMuDQo+Pj4+PiANCj4+Pj4+IFNNTVV2MyByZXBvcnRzIGZh
dWx0L2V2ZW50cyBiYXNlcyBvbiBtZW1vcnktYmFzZWQgY2lyY3VsYXIgYnVmZmVyIHF1ZXVlcyBu
b3QNCj4+Pj4+IGJhc2VkIG9uIHRoZSByZWdpc3Rlci4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcs
IGl0IGlzIHRpbWUtY29uc3VtaW5nIHRvDQo+Pj4+PiBwcm9jZXNzIHRoZSBtZW1vcnkgYmFzZWQg
cXVldWVzIGluIGludGVycnVwdCBjb250ZXh0IGJlY2F1c2Ugb2YgdGhhdCBMaW51eA0KPj4+Pj4g
aXMgdXNpbmcgdGhyZWFkZWQgSVJRIHRvIHByb2Nlc3MgdGhlIGZhdWx0cy9ldmVudHMgZnJvbSBT
TU1VLg0KPj4+Pj4gDQo+Pj4+PiBJIGRpZG7igJl0IGZpbmQgYW55IG90aGVyIHNvbHV0aW9uIGlu
IFhFTiBpbiBwbGFjZSBvZiB0YXNrbGV0IHRvIGRlZmVyIHRoZQ0KPj4+Pj4gd29yaywgdGhhdOKA
mXMgd2h5IEkgdXNlZCB0YXNrbGV0IGluIFhFTiBpbiByZXBsYWNlbWVudCBvZiB0aHJlYWRlZCBJ
UlFzLiBJZg0KPj4+Pj4gd2UgZG8gYWxsIHdvcmsgaW4gaW50ZXJydXB0IGNvbnRleHQgd2Ugd2ls
bCBtYWtlIFhFTiBsZXNzIHJlc3BvbnNpdmUuDQo+Pj4+IA0KPj4+PiBTbyB3ZSBuZWVkIHRvIG1h
a2Ugc3VyZSB0aGF0IFhlbiBjb250aW51ZSB0byByZWNlaXZlcyBpbnRlcnJ1cHRzLCBidXQgd2Ug
YWxzbw0KPj4+PiBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGEgdkNQVSBib3VuZCB0byB0aGUgcENQ
VSBpcyBhbHNvIHJlc3BvbnNpdmUuDQo+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBJZiB5b3Uga25vdyBh
bm90aGVyIHNvbHV0aW9uIGluIFhFTiB0aGF0IHdpbGwgYmUgdXNlZCB0byBkZWZlciB0aGUgd29y
ayBpbg0KPj4+Pj4gdGhlIGludGVycnVwdCBwbGVhc2UgbGV0IG1lIGtub3cgSSB3aWxsIHRyeSB0
byB1c2UgdGhhdC4NCj4+Pj4gDQo+Pj4+IE9uZSBvZiBteSB3b3JrIGNvbGxlYWd1ZSBlbmNvdW50
ZXJlZCBhIHNpbWlsYXIgcHJvYmxlbSByZWNlbnRseS4gSGUgaGFkIGEgbG9uZw0KPj4+PiBydW5u
aW5nIHRhc2tsZXQgYW5kIHdhbnRlZCB0byBiZSBicm9rZW4gZG93biBpbiBzbWFsbGVyIGNodW5r
Lg0KPj4+PiANCj4+Pj4gV2UgZGVjaWRlZCB0byB1c2UgYSB0aW1lciB0byByZXNjaGVkdWxlIHRo
ZSB0YXNsa2V0IGluIHRoZSBmdXR1cmUuIFRoaXMgYWxsb3dzDQo+Pj4+IHRoZSBzY2hlZHVsZXIg
dG8gcnVuIG90aGVyIGxvYWRzIChlLmcuIHZDUFUpIGZvciBzb21lIHRpbWUuDQo+Pj4+IA0KPj4+
PiBUaGlzIGlzIHByZXR0eSBoYWNraXNoIGJ1dCBJIGNvdWxkbid0IGZpbmQgYSBiZXR0ZXIgc29s
dXRpb24gYXMgdGFza2xldCBoYXZlDQo+Pj4+IGhpZ2ggcHJpb3JpdHkuDQo+Pj4+IA0KPj4+PiBN
YXliZSB0aGUgb3RoZXIgd2lsbCBoYXZlIGEgYmV0dGVyIGlkZWEuDQo+Pj4gDQo+Pj4gSnVsaWVu
J3Mgc3VnZ2VzdGlvbiBpcyBhIGdvb2Qgb25lLg0KPj4+IA0KPj4+IEJ1dCBJIHRoaW5rIHRhc2ts
ZXRzIGNhbiBiZSBjb25maWd1cmVkIHRvIGJlIGNhbGxlZCBmcm9tIHRoZSBpZGxlX2xvb3AsDQo+
Pj4gaW4gd2hpY2ggY2FzZSB0aGV5IGFyZSBub3QgcnVuIGluIGludGVycnVwdCBjb250ZXh0Pw0K
Pj4+IA0KPj4gIFllcyB5b3UgYXJlIHJpZ2h0IHRhc2tsZXQgd2lsbCBiZSBzY2hlZHVsZWQgZnJv
bSB0aGUgaWRsZV9sb29wIHRoYXQgaXMgbm90IGludGVycnVwdCBjb25leHQuDQo+IA0KPiBUaGlz
IGRlcGVuZHMgb24geW91ciB0YXNrbGV0LiBTb21lIHdpbGwgcnVuIGZyb20gdGhlIHNvZnRpcnEg
Y29udGV4dCB3aGljaCBpcyB1c3VhbGx5IChmb3IgQXJtKSBvbiB0aGUgcmV0dXJuIG9mIGFuIGV4
Y2VwdGlvbi4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIGluZm8uIEkgd2lsbCBjaGVjayBhbmQgd2ls
bCBnZXQgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YgdGhlIHRhc2tsZXQgaG93IGl0IHdpbGwgcnVu
IGluIFhFTi4NCg0KPj4+IA0KPj4+Pj4+PiA0LiBMYXRlc3QgdmVyc2lvbiBvZiB0aGUgTGludXgg
U01NVXYzIGNvZGUgaW1wbGVtZW50cyB0aGUgY29tbWFuZHMgcXVldWUNCj4+Pj4+Pj4gICAgYWNj
ZXNzIGZ1bmN0aW9ucyBiYXNlZCBvbiBhdG9taWMgb3BlcmF0aW9ucyBpbXBsZW1lbnRlZCBpbiBM
aW51eC4NCj4+Pj4+PiANCj4+Pj4+PiBDYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxzPw0KPj4+
Pj4gDQo+Pj4+PiBJIHRyaWVkIHRvIHBvcnQgdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHRoZSBTTU1V
djMgY29kZSB0aGFuIEkgb2JzZXJ2ZWQgdGhhdA0KPj4+Pj4gaW4gb3JkZXIgdG8gcG9ydCB0aGF0
IGNvZGUgSSBoYXZlIHRvIGFsc28gcG9ydCBhdG9taWMgb3BlcmF0aW9uIGltcGxlbWVudGVkDQo+
Pj4+PiBpbiBMaW51eCB0byBYRU4uIEFzIGxhdGVzdCBMaW51eCBjb2RlIHVzZXMgYXRvbWljIG9w
ZXJhdGlvbiB0byBwcm9jZXNzIHRoZQ0KPj4+Pj4gY29tbWFuZCBxdWV1ZXMgKGF0b21pY19jb25k
X3JlYWRfcmVsYXhlZCgpLGF0b21pY19sb25nX2NvbmRfcmVhZF9yZWxheGVkKCkgLA0KPj4+Pj4g
YXRvbWljX2ZldGNoX2FuZG5vdF9yZWxheGVkKCkpIC4NCj4+Pj4gDQo+Pj4+IFRoYW5rIHlvdSBm
b3IgdGhlIGV4cGxhbmF0aW9uLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gaW1wb3J0IHRo
ZSBhdG9taWMNCj4+Pj4gaGVscGVycyBhbmQgdXNlIHRoZSBsYXRlc3QgY29kZS4NCj4+Pj4gDQo+
Pj4+IFRoaXMgd2lsbCBlbnN1cmUgdGhhdCB3ZSBkb24ndCByZS1pbnRyb2R1Y2UgYnVncyBhbmQg
YWxzbyBidXkgdXMgc29tZSB0aW1lDQo+Pj4+IGJlZm9yZSB0aGUgTGludXggYW5kIFhlbiBkcml2
ZXIgZGl2ZXJnZSBhZ2FpbiB0b28gbXVjaC4NCj4+Pj4gDQo+Pj4+IFN0ZWZhbm8sIHdoYXQgZG8g
eW91IHRoaW5rPw0KPj4+IA0KPj4+IEkgdGhpbmsgeW91IGFyZSByaWdodC4NCj4+IFllcywgSSBh
Z3JlZSB3aXRoIHlvdSB0byBoYXZlIFhFTiBjb2RlIGluIHN5bmMgd2l0aCBMaW51eCBjb2RlIHRo
YXQncyB3aHkgSSBzdGFydGVkIHdpdGggdG8gcG9ydCB0aGUgTGludXggYXRvbWljIG9wZXJhdGlv
bnMgdG8gWEVOICB0aGVuIEkgcmVhbGlzZWQgdGhhdCBpdCBpcyBub3Qgc3RyYWlnaHRmb3J3YXJk
IHRvIHBvcnQgYXRvbWljIG9wZXJhdGlvbnMgYW5kIGl0IHJlcXVpcmVzIGxvdHMgb2YgZWZmb3J0
IGFuZCB0ZXN0aW5nLiBUaGVyZWZvcmUgSSBkZWNpZGVkIHRvIHBvcnQgdGhlIGNvZGUgYmVmb3Jl
IHRoZSBhdG9taWMgb3BlcmF0aW9uIGlzIGludHJvZHVjZWQgaW4gTGludXguDQo+IA0KPiBIbW1t
Li4uIEkgd291bGQgbm90IGhhdmUgZXhwZWN0ZWQgYSBsb3Qgb2YgZWZmb3J0IHJlcXVpcmVkIHRv
IGFkZCB0aGUgMyBhdG9taWNzIG9wZXJhdGlvbnMgYWJvdmUuIEFyZSB5b3UgdHJ5aW5nIHRvIGFs
c28gcG9ydCB0aGUgTFNFIHN1cHBvcnQgYXQgdGhlIHNhbWUgdGltZT8NCg0KVGhlcmUgYXJlIG90
aGVyIGF0b21pYyBvcGVyYXRpb25zIHVzZWQgaW4gdGhlIFNNTVV2MyBjb2RlIGFwYXJ0IGZyb20g
dGhlIDMgYXRvbWljIG9wZXJhdGlvbiBJIG1lbnRpb24uIEkganVzdCBtZW50aW9uIDMgb3BlcmF0
aW9uIGFzIGFuIGV4YW1wbGUuIEkgdHJpZWQgdG8gcG9ydCBhdCB0aGF0IHRpbWUgYnV0IHdoZW4g
SSBzdGFydCBwb3J0aW5nIEkgcmVhbGlzZWQgdGhhdCBvbmUgYXRvbWljIG9wZXJhdGlvbiBkZXBl
bmQgb24gYW5vdGhlciBvbmUgc28gSSBkZWNpZGVkIG5vdCB0byBwcm9jZWVkIGZ1cnRoZXIuDQoN
Cj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KDQpSZWdhcmRzLA0K
UmFodWw=


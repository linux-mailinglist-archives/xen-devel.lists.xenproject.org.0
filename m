Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B806E298B4C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 12:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12232.32001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX0IB-0000cz-Dd; Mon, 26 Oct 2020 11:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12232.32001; Mon, 26 Oct 2020 11:03:59 +0000
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
	id 1kX0IB-0000ca-AH; Mon, 26 Oct 2020 11:03:59 +0000
Received: by outflank-mailman (input) for mailman id 12232;
 Mon, 26 Oct 2020 11:03:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kX0I9-0000cV-Cy
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 11:03:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63733462-244e-4225-9cce-d36b7d8855fd;
 Mon, 26 Oct 2020 11:03:55 +0000 (UTC)
Received: from AM5PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:203:69::29) by AM0PR08MB3425.eurprd08.prod.outlook.com
 (2603:10a6:208:db::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 11:03:51 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::dd) by AM5PR0202CA0019.outlook.office365.com
 (2603:10a6:203:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Mon, 26 Oct 2020 11:03:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 11:03:51 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Mon, 26 Oct 2020 11:03:51 +0000
Received: from 094e56be3056.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C653325-3BAE-474D-954E-A635C5CECE6F.1; 
 Mon, 26 Oct 2020 11:03:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 094e56be3056.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Oct 2020 11:03:13 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4179.eurprd08.prod.outlook.com (2603:10a6:208:12b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 11:03:02 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 11:03:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kX0I9-0000cV-Cy
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 11:03:57 +0000
X-Inumbo-ID: 63733462-244e-4225-9cce-d36b7d8855fd
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.44])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 63733462-244e-4225-9cce-d36b7d8855fd;
	Mon, 26 Oct 2020 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6gHBiLAEBapWfu7nOf/sBDSoCp+v6xj7jdAjy1f9/k=;
 b=8aOw2Q7ZCFERkr3AY0KzBHQ6DSj++RufO0ewLgay5WFlXnVUNAp9i+0fnrxRy1MgRKTmH32HXPM9KtaX/mn3xuJLO6/RA0vf/eW5EEsSsxbvurWSYEMEugDF1NDLWBfbcv7syI9jN6MngTUwmFa114blkOjeZ3gCfXDYvKSGtFc=
Received: from AM5PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:203:69::29) by AM0PR08MB3425.eurprd08.prod.outlook.com
 (2603:10a6:208:db::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 11:03:51 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::dd) by AM5PR0202CA0019.outlook.office365.com
 (2603:10a6:203:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Mon, 26 Oct 2020 11:03:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 11:03:51 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Mon, 26 Oct 2020 11:03:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad426e3378c2b8d0
X-CR-MTA-TID: 64aa7808
Received: from 094e56be3056.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1C653325-3BAE-474D-954E-A635C5CECE6F.1;
	Mon, 26 Oct 2020 11:03:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 094e56be3056.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Oct 2020 11:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV7HvWrJ5LXFPuXgBFi9gO0ONM76IsGuk86EOOV1XHr1/7B2urFeh/n3YA8xvMJYh4ltLNVAMxflajJDSBx9WF0rhk2oPKjfUKIdpXFEpx1sTwl9gbNWY8I7danBF3Jou2EkxD1ulKckcRDrWTAybhpx5tY52y8rurYLZJMNwZCBUx84sgEp04uHLnzeMT8FFCbLWysiSpIMAVuCNAMFjvcGLV1uHjMO4MrPs2k+10eBOolSQBPNMjBc1OMKh2SK3aSU+cKvOPzMJabNCpzDOCyadmN16iMgY2fsCi2+845WmK3FJA9urLnMJfLwD4e/fZHzRRdv/Lqk1Sk0f+feuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6gHBiLAEBapWfu7nOf/sBDSoCp+v6xj7jdAjy1f9/k=;
 b=BLON6442q/qFddQJG/oIWQ/jtUesApNSNUWEePtSa8YFT+t7Sl4NX4md7Cc8Q3q/sL+G/tZKS0SjEudh52Wujv0qaVA265+D2xU5XC/g+rs584vqWXJNQYeMxif72d4lbkJLmtxX6u276YbwLAXCLuISQ25WAUg6KLyj2nNtqW+Yn3C0BjOEL9bGIM3+jmlqrmJ9FGNZrL/NkDl8c112afy3ugCV2oL3aVAP0OF67pOCIy4lq9SCIr12SkPWARdFrY3I2MPEVtW1b2+KN4i5TPQhBpJcpyoDefyYZkNNNgET/vFUKIVpQRVQMwXtH0GhRHWAX+cVK/5tR/9xHDra/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6gHBiLAEBapWfu7nOf/sBDSoCp+v6xj7jdAjy1f9/k=;
 b=8aOw2Q7ZCFERkr3AY0KzBHQ6DSj++RufO0ewLgay5WFlXnVUNAp9i+0fnrxRy1MgRKTmH32HXPM9KtaX/mn3xuJLO6/RA0vf/eW5EEsSsxbvurWSYEMEugDF1NDLWBfbcv7syI9jN6MngTUwmFa114blkOjeZ3gCfXDYvKSGtFc=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4179.eurprd08.prod.outlook.com (2603:10a6:208:12b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 11:03:02 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 11:03:02 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQCAAWIugIABA+CAgADBXICAABfBAIAAGI6AgAAOSACABG94AA==
Date: Mon, 26 Oct 2020 11:03:02 +0000
Message-ID: <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
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
In-Reply-To: <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ecdb2a65-e4bb-45a9-49d8-08d8799ed26a
x-ms-traffictypediagnostic: AM0PR08MB4179:|AM0PR08MB3425:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3425B005E05B5CBEC16C2205FC190@AM0PR08MB3425.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Wct1RX+xtBNtxPsw4/ZJGhfhM/dlE0OhaaZl2W5LRZlAKbKAN5Do1AjPlU2+Ktsybl/zk3BPwoXTLklY5frKE9XV5KIecK/GIxH7gL4puR+8KYcpSA1TpYdr0SUhL/1lIR1yJpR3oVj8Q8kz4NOWMC4R1AFH+SqlpcjQ2eZEZRttwarZCXR6g6tWPDpzbN8MTU5tdtqrH2bXhh2xgJdfbzFBHjyajqY8YLUVom0QYDBQqUIAbc1cxWywr/fbUvgJO9FR0qoTbeKPmNcKQAQp93B6Oix38hwO1nsdB5aEy2aGepVoncIEQi0DLZnhzcybgGvbq6w7dJDe/O9oEyGvAg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(8936002)(6506007)(26005)(186003)(66556008)(66476007)(4326008)(66946007)(478600001)(83380400001)(71200400001)(53546011)(5660300002)(55236004)(6486002)(33656002)(2616005)(8676002)(316002)(66446008)(54906003)(76116006)(2906002)(36756003)(86362001)(6916009)(6512007)(64756008)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 pxHmoqlF11edzwXGa9CMOc49c5Qj9euK6Ga9PkbzbFoukbI/cH12Bo2ZgaMlpwTjphWaPnu84ZDKzZqVYGLwLwPByBgTzwuBgRTqv6YuMt446m60Mf9eK/dX+Q4Y1WQaBkDPz+2f7H383FGmMgr4djtxqRqtK9sY69Fwds/Fhs5ziHE6vcsk3a2ULm+vAW1sRfkOcgGIWxnWQppM0b/6OTFnPvQv4jJ7t/mtVTaGn1zqXw1XgFd6X2GYN9tAAhe26lpL89UaFHPABqufp3WwCeGfKPjdwhR7QbNYMJ/tHZ1BoTLtvl44X8EUfo45CHNZKbBSX7Cyr8g9KfnlpaClBDeGv4SiLF93LxgKXoS52hDr5+k1pkcYADio4qjp46aL1pqUz7DO8Da8Jg4hzWYOMxqQrXHyJfSRKMrDCZl/P0fVL1siw//qlYFRi8KNr62c4cBlHlQ0AgNJQ69EyiQMzrGaQBTV39AFLlb3T5Sqxl335rP1SzCIUMUZpR18H1NLH9rRlh+IIBKGgjI76BBhc/QDyaVnBLQY/ESHNe6p6tESKDlJbMtFL2NeE/UkHbilxxVCEPoMTjND7PKveAcNar86U9hxaKTI4UmuTgMPckkeTKUa7GRUxDZh3FyuY44cRj47eGpPhzCesWgkqWNhMQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB3E0BD265A2E24DBBEB60B488362047@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4179
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6b81dc7-223d-46c9-32b6-08d8799eb52c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YPn1P0wVfcBJriuQRnaOAJ2nR263yMb4mtBWw55cLhJUlixDpPUDv+l5QdS7uJ600CjU5vPW0Panz8FeOw6kltwyppZOMRtQ8hNKwWihK5n72ZfqhNTVWb/J/nPoyKXMZw3uKfONp+4kLTiN/7QbYaFbu436F6wRy2y2WvydsOI/J/5x1TKNw+ikSKlkL+x59Sl1tUeJfailoz8BojhTlVUy7ZB8+6k9HtFccUMd71MyJk1D5L/0LWXiGm1AR3TWBkaY9YLExpCyuivTNJ+BOrD42fwADR5wwfN/+z5jxvmxwNuVzwpjFkHLED4gDlzvYyYsf+wQbIiX5s3M9cNqIN9UKS+cApVITj+v3g+QEdh4VU7d/ht+ln4NKhPBvXYATCbkM24OeC17MJPLOGucrQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(70206006)(316002)(5660300002)(6486002)(4326008)(2906002)(33656002)(36906005)(2616005)(70586007)(86362001)(54906003)(6512007)(83380400001)(6862004)(82740400003)(6506007)(82310400003)(107886003)(53546011)(47076004)(36756003)(356005)(8676002)(81166007)(186003)(26005)(336012)(478600001)(55236004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 11:03:51.4060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdb2a65-e4bb-45a9-49d8-08d8799ed26a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3425

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDIzIE9jdCAyMDIwLCBhdCA0OjE5IHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjMvMTAvMjAyMCAx
NToyNywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIZWxsbyBKdWxpZW4sDQo+Pj4gT24gMjMgT2N0
IDIwMjAsIGF0IDI6MDAgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDIzLzEwLzIwMjAgMTI6MzUsIFJhaHVsIFNpbmdoIHdy
b3RlOg0KPj4+PiBIZWxsbywNCj4+Pj4+IE9uIDIzIE9jdCAyMDIwLCBhdCAxOjAyIGFtLCBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+
Pj4+PiBPbiBUaHUsIDIyIE9jdCAyMDIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+PiBP
biAyMC8xMC8yMDIwIDE2OjI1LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+PiBBZGQgc3Vw
cG9ydCBmb3IgQVJNIGFyY2hpdGVjdGVkIFNNTVV2MyBpbXBsZW1lbnRhdGlvbnMuIEl0IGlzIGJh
c2VkIG9uDQo+Pj4+Pj4+Pj4gdGhlIExpbnV4IFNNTVV2MyBkcml2ZXIuDQo+Pj4+Pj4+Pj4gTWFq
b3IgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgTGludXggZHJpdmVyIGFyZSBhcyBmb2xsb3dzOg0K
Pj4+Pj4+Pj4+IDEuIE9ubHkgU3RhZ2UtMiB0cmFuc2xhdGlvbiBpcyBzdXBwb3J0ZWQgYXMgY29t
cGFyZWQgdG8gdGhlIExpbnV4IGRyaXZlcg0KPj4+Pj4+Pj4+ICAgIHRoYXQgc3VwcG9ydHMgYm90
aCBTdGFnZS0xIGFuZCBTdGFnZS0yIHRyYW5zbGF0aW9ucy4NCj4+Pj4+Pj4+PiAyLiBVc2UgUDJN
ICBwYWdlIHRhYmxlIGluc3RlYWQgb2YgY3JlYXRpbmcgb25lIGFzIFNNTVV2MyBoYXMgdGhlDQo+
Pj4+Pj4+Pj4gICAgY2FwYWJpbGl0eSB0byBzaGFyZSB0aGUgcGFnZSB0YWJsZXMgd2l0aCB0aGUg
Q1BVLg0KPj4+Pj4+Pj4+IDMuIFRhc2tsZXRzIGlzIHVzZWQgaW4gcGxhY2Ugb2YgdGhyZWFkZWQg
SVJRJ3MgaW4gTGludXggZm9yIGV2ZW50IHF1ZXVlDQo+Pj4+Pj4+Pj4gICAgYW5kIHByaW9yaXR5
IHF1ZXVlIElSUSBoYW5kbGluZy4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gVGFza2xldHMgYXJlIG5v
dCBhIHJlcGxhY2VtZW50IGZvciB0aHJlYWRlZCBJUlEuIEluIHBhcnRpY3VsYXIsIHRoZXkgd2ls
bA0KPj4+Pj4+Pj4gaGF2ZSBwcmlvcml0eSBvdmVyIGFueXRoaW5nIGVsc2UgKElPVyBub3RoaW5n
IHdpbGwgcnVuIG9uIHRoZSBwQ1BVIHVudGlsDQo+Pj4+Pj4+PiB0aGV5IGFyZSBkb25lKS4NCj4+
Pj4+Pj4+IA0KPj4+Pj4+Pj4gRG8geW91IGtub3cgd2h5IExpbnV4IGlzIHVzaW5nIHRocmVhZC4g
SXMgaXQgYmVjYXVzZSBvZiBsb25nIHJ1bm5pbmcNCj4+Pj4+Pj4+IG9wZXJhdGlvbnM/DQo+Pj4+
Pj4+IA0KPj4+Pj4+PiBZZXMgeW91IGFyZSByaWdodCBiZWNhdXNlIG9mIGxvbmcgcnVubmluZyBv
cGVyYXRpb25zIExpbnV4IGlzIHVzaW5nIHRoZQ0KPj4+Pj4+PiB0aHJlYWRlZCBJUlFzLg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gU01NVXYzIHJlcG9ydHMgZmF1bHQvZXZlbnRzIGJhc2VzIG9uIG1lbW9y
eS1iYXNlZCBjaXJjdWxhciBidWZmZXIgcXVldWVzIG5vdA0KPj4+Pj4+PiBiYXNlZCBvbiB0aGUg
cmVnaXN0ZXIuIEFzIHBlciBteSB1bmRlcnN0YW5kaW5nLCBpdCBpcyB0aW1lLWNvbnN1bWluZyB0
bw0KPj4+Pj4+PiBwcm9jZXNzIHRoZSBtZW1vcnkgYmFzZWQgcXVldWVzIGluIGludGVycnVwdCBj
b250ZXh0IGJlY2F1c2Ugb2YgdGhhdCBMaW51eA0KPj4+Pj4+PiBpcyB1c2luZyB0aHJlYWRlZCBJ
UlEgdG8gcHJvY2VzcyB0aGUgZmF1bHRzL2V2ZW50cyBmcm9tIFNNTVUuDQo+Pj4+Pj4+IA0KPj4+
Pj4+PiBJIGRpZG7igJl0IGZpbmQgYW55IG90aGVyIHNvbHV0aW9uIGluIFhFTiBpbiBwbGFjZSBv
ZiB0YXNrbGV0IHRvIGRlZmVyIHRoZQ0KPj4+Pj4+PiB3b3JrLCB0aGF04oCZcyB3aHkgSSB1c2Vk
IHRhc2tsZXQgaW4gWEVOIGluIHJlcGxhY2VtZW50IG9mIHRocmVhZGVkIElSUXMuIElmDQo+Pj4+
Pj4+IHdlIGRvIGFsbCB3b3JrIGluIGludGVycnVwdCBjb250ZXh0IHdlIHdpbGwgbWFrZSBYRU4g
bGVzcyByZXNwb25zaXZlLg0KPj4+Pj4+IA0KPj4+Pj4+IFNvIHdlIG5lZWQgdG8gbWFrZSBzdXJl
IHRoYXQgWGVuIGNvbnRpbnVlIHRvIHJlY2VpdmVzIGludGVycnVwdHMsIGJ1dCB3ZSBhbHNvDQo+
Pj4+Pj4gbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBhIHZDUFUgYm91bmQgdG8gdGhlIHBDUFUgaXMg
YWxzbyByZXNwb25zaXZlLg0KPj4+Pj4+IA0KPj4+Pj4+PiANCj4+Pj4+Pj4gSWYgeW91IGtub3cg
YW5vdGhlciBzb2x1dGlvbiBpbiBYRU4gdGhhdCB3aWxsIGJlIHVzZWQgdG8gZGVmZXIgdGhlIHdv
cmsgaW4NCj4+Pj4+Pj4gdGhlIGludGVycnVwdCBwbGVhc2UgbGV0IG1lIGtub3cgSSB3aWxsIHRy
eSB0byB1c2UgdGhhdC4NCj4+Pj4+PiANCj4+Pj4+PiBPbmUgb2YgbXkgd29yayBjb2xsZWFndWUg
ZW5jb3VudGVyZWQgYSBzaW1pbGFyIHByb2JsZW0gcmVjZW50bHkuIEhlIGhhZCBhIGxvbmcNCj4+
Pj4+PiBydW5uaW5nIHRhc2tsZXQgYW5kIHdhbnRlZCB0byBiZSBicm9rZW4gZG93biBpbiBzbWFs
bGVyIGNodW5rLg0KPj4+Pj4+IA0KPj4+Pj4+IFdlIGRlY2lkZWQgdG8gdXNlIGEgdGltZXIgdG8g
cmVzY2hlZHVsZSB0aGUgdGFzbGtldCBpbiB0aGUgZnV0dXJlLiBUaGlzIGFsbG93cw0KPj4+Pj4+
IHRoZSBzY2hlZHVsZXIgdG8gcnVuIG90aGVyIGxvYWRzIChlLmcuIHZDUFUpIGZvciBzb21lIHRp
bWUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhpcyBpcyBwcmV0dHkgaGFja2lzaCBidXQgSSBjb3VsZG4n
dCBmaW5kIGEgYmV0dGVyIHNvbHV0aW9uIGFzIHRhc2tsZXQgaGF2ZQ0KPj4+Pj4+IGhpZ2ggcHJp
b3JpdHkuDQo+Pj4+Pj4gDQo+Pj4+Pj4gTWF5YmUgdGhlIG90aGVyIHdpbGwgaGF2ZSBhIGJldHRl
ciBpZGVhLg0KPj4+Pj4gDQo+Pj4+PiBKdWxpZW4ncyBzdWdnZXN0aW9uIGlzIGEgZ29vZCBvbmUu
DQo+Pj4+PiANCj4+Pj4+IEJ1dCBJIHRoaW5rIHRhc2tsZXRzIGNhbiBiZSBjb25maWd1cmVkIHRv
IGJlIGNhbGxlZCBmcm9tIHRoZSBpZGxlX2xvb3AsDQo+Pj4+PiBpbiB3aGljaCBjYXNlIHRoZXkg
YXJlIG5vdCBydW4gaW4gaW50ZXJydXB0IGNvbnRleHQ/DQo+Pj4+PiANCj4+Pj4gIFllcyB5b3Ug
YXJlIHJpZ2h0IHRhc2tsZXQgd2lsbCBiZSBzY2hlZHVsZWQgZnJvbSB0aGUgaWRsZV9sb29wIHRo
YXQgaXMgbm90IGludGVycnVwdCBjb25leHQuDQo+Pj4gDQo+Pj4gVGhpcyBkZXBlbmRzIG9uIHlv
dXIgdGFza2xldC4gU29tZSB3aWxsIHJ1biBmcm9tIHRoZSBzb2Z0aXJxIGNvbnRleHQgd2hpY2gg
aXMgdXN1YWxseSAoZm9yIEFybSkgb24gdGhlIHJldHVybiBvZiBhbiBleGNlcHRpb24uDQo+Pj4g
DQo+PiBUaGFua3MgZm9yIHRoZSBpbmZvLiBJIHdpbGwgY2hlY2sgYW5kIHdpbGwgZ2V0IGJldHRl
ciB1bmRlcnN0YW5kaW5nIG9mIHRoZSB0YXNrbGV0IGhvdyBpdCB3aWxsIHJ1biBpbiBYRU4uDQo+
Pj4+PiANCj4+Pj4+Pj4+PiA0LiBMYXRlc3QgdmVyc2lvbiBvZiB0aGUgTGludXggU01NVXYzIGNv
ZGUgaW1wbGVtZW50cyB0aGUgY29tbWFuZHMgcXVldWUNCj4+Pj4+Pj4+PiAgICBhY2Nlc3MgZnVu
Y3Rpb25zIGJhc2VkIG9uIGF0b21pYyBvcGVyYXRpb25zIGltcGxlbWVudGVkIGluIExpbnV4Lg0K
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBDYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxzPw0KPj4+Pj4+
PiANCj4+Pj4+Pj4gSSB0cmllZCB0byBwb3J0IHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGUgU01N
VXYzIGNvZGUgdGhhbiBJIG9ic2VydmVkIHRoYXQNCj4+Pj4+Pj4gaW4gb3JkZXIgdG8gcG9ydCB0
aGF0IGNvZGUgSSBoYXZlIHRvIGFsc28gcG9ydCBhdG9taWMgb3BlcmF0aW9uIGltcGxlbWVudGVk
DQo+Pj4+Pj4+IGluIExpbnV4IHRvIFhFTi4gQXMgbGF0ZXN0IExpbnV4IGNvZGUgdXNlcyBhdG9t
aWMgb3BlcmF0aW9uIHRvIHByb2Nlc3MgdGhlDQo+Pj4+Pj4+IGNvbW1hbmQgcXVldWVzIChhdG9t
aWNfY29uZF9yZWFkX3JlbGF4ZWQoKSxhdG9taWNfbG9uZ19jb25kX3JlYWRfcmVsYXhlZCgpICwN
Cj4+Pj4+Pj4gYXRvbWljX2ZldGNoX2FuZG5vdF9yZWxheGVkKCkpIC4NCj4+Pj4+PiANCj4+Pj4+
PiBUaGFuayB5b3UgZm9yIHRoZSBleHBsYW5hdGlvbi4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0
IHRvIGltcG9ydCB0aGUgYXRvbWljDQo+Pj4+Pj4gaGVscGVycyBhbmQgdXNlIHRoZSBsYXRlc3Qg
Y29kZS4NCj4+Pj4+PiANCj4+Pj4+PiBUaGlzIHdpbGwgZW5zdXJlIHRoYXQgd2UgZG9uJ3QgcmUt
aW50cm9kdWNlIGJ1Z3MgYW5kIGFsc28gYnV5IHVzIHNvbWUgdGltZQ0KPj4+Pj4+IGJlZm9yZSB0
aGUgTGludXggYW5kIFhlbiBkcml2ZXIgZGl2ZXJnZSBhZ2FpbiB0b28gbXVjaC4NCj4+Pj4+PiAN
Cj4+Pj4+PiBTdGVmYW5vLCB3aGF0IGRvIHlvdSB0aGluaz8NCj4+Pj4+IA0KPj4+Pj4gSSB0aGlu
ayB5b3UgYXJlIHJpZ2h0Lg0KPj4+PiBZZXMsIEkgYWdyZWUgd2l0aCB5b3UgdG8gaGF2ZSBYRU4g
Y29kZSBpbiBzeW5jIHdpdGggTGludXggY29kZSB0aGF0J3Mgd2h5IEkgc3RhcnRlZCB3aXRoIHRv
IHBvcnQgdGhlIExpbnV4IGF0b21pYyBvcGVyYXRpb25zIHRvIFhFTiAgdGhlbiBJIHJlYWxpc2Vk
IHRoYXQgaXQgaXMgbm90IHN0cmFpZ2h0Zm9yd2FyZCB0byBwb3J0IGF0b21pYyBvcGVyYXRpb25z
IGFuZCBpdCByZXF1aXJlcyBsb3RzIG9mIGVmZm9ydCBhbmQgdGVzdGluZy4gVGhlcmVmb3JlIEkg
ZGVjaWRlZCB0byBwb3J0IHRoZSBjb2RlIGJlZm9yZSB0aGUgYXRvbWljIG9wZXJhdGlvbiBpcyBp
bnRyb2R1Y2VkIGluIExpbnV4Lg0KPj4+IA0KPj4+IEhtbW0uLi4gSSB3b3VsZCBub3QgaGF2ZSBl
eHBlY3RlZCBhIGxvdCBvZiBlZmZvcnQgcmVxdWlyZWQgdG8gYWRkIHRoZSAzIGF0b21pY3Mgb3Bl
cmF0aW9ucyBhYm92ZS4gQXJlIHlvdSB0cnlpbmcgdG8gYWxzbyBwb3J0IHRoZSBMU0Ugc3VwcG9y
dCBhdCB0aGUgc2FtZSB0aW1lPw0KPj4gVGhlcmUgYXJlIG90aGVyIGF0b21pYyBvcGVyYXRpb25z
IHVzZWQgaW4gdGhlIFNNTVV2MyBjb2RlIGFwYXJ0IGZyb20gdGhlIDMgYXRvbWljIG9wZXJhdGlv
biBJIG1lbnRpb24uIEkganVzdCBtZW50aW9uIDMgb3BlcmF0aW9uIGFzIGFuIGV4YW1wbGUuIA0K
PiANCj4gT2suIERvIHlvdSBoYXZlIGEgbGlzdCB5b3UgY291bGQgc2hhcmU/DQo+IA0KDQpZZXMu
IFBsZWFzZSBmaW5kIHRoZSBsaXN0IHRoYXQgd2UgaGF2ZSB0byBwb3J0IHRvIHRoZSBYRU4gaW4g
b3JkZXIgdG8gbWVyZ2UgdGhlIGxhdGVzdCBTTU1VdjMgY29kZS4gDQoNCklmIHdlIHN0YXJ0IHRv
IHBvcnQgdGhlIGJlbG93IGxpc3Qgd2UgbWlnaHQgaGF2ZSB0byBwb3J0IGFub3RoZXIgYXRvbWlj
IG9wZXJhdGlvbiBiYXNlZCBvbiB3aGljaCBiZWxvdyBhdG9taWMgb3BlcmF0aW9ucyBhcmUgaW1w
bGVtZW50ZWQuIEkgaGF2ZSBub3Qgc3BlbnQgdGltZSBvbiBob3cgdGhlc2UgYXRvbWljIG9wZXJh
dGlvbnMgYXJlIGltcGxlbWVudGVkIGluIGRldGFpbCBidXQgYXMgcGVyIG15IHVuZGVyc3RhbmRp
bmcsIGl0IHJlcXVpcmVkIGFuIGVmZm9ydCB0byBwb3J0IHRoZW0gdG8gWEVOIGFuZCByZXF1aXJl
ZCBhIGxvdCBvZiB0ZXN0aW5nLg0KDQoxLiBhdG9taWNfc2V0X3JlbGVhc2UNCjIuIGF0b21pY19m
ZXRjaF9hbmRub3RfcmVsYXhlZA0KMy4gYXRvbWljX2NvbmRfcmVhZF9yZWxheGVkDQo0LiBhdG9t
aWNfbG9uZ19jb25kX3JlYWRfcmVsYXhlZA0KNS4gYXRvbWljX2xvbmdfeG9yDQo2LiBhdG9taWNf
c2V0X3JlbGVhc2UNCjcuIGF0b21pY19jbXB4Y2hnX3JlbGF4ZWQgbWlnaHQgYmUgd2UgY2FuIHVz
ZSBhdG9taWNfY21weGNoZyB0aGF0IGlzIGltcGxlbWVudGVkIGluIFhFTiBuZWVkIHRvIGNoZWNr
Lg0KOC4gYXRvbWljX2RlY19yZXR1cm5fcmVsZWFzZQ0KOS4gYXRvbWljX2ZldGNoX2luY19yZWxh
eGVkDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQpSZWdhcmRzLA0K
UmFodWwNCg0K


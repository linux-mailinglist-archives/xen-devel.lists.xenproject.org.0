Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C62B6AB3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 17:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29156.58416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf4EM-00084f-OC; Tue, 17 Nov 2020 16:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29156.58416; Tue, 17 Nov 2020 16:53:22 +0000
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
	id 1kf4EM-00084G-JR; Tue, 17 Nov 2020 16:53:22 +0000
Received: by outflank-mailman (input) for mailman id 29156;
 Tue, 17 Nov 2020 16:53:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ssn=EX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kf4EK-00084B-UP
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:53:20 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9e6cb6f-8c91-4f8b-8a99-298280765a7b;
 Tue, 17 Nov 2020 16:53:17 +0000 (UTC)
Received: from DU2PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:10:234::18)
 by VI1PR08MB4366.eurprd08.prod.outlook.com (2603:10a6:803:fc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 16:53:14 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::ed) by DU2PR04CA0043.outlook.office365.com
 (2603:10a6:10:234::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26 via Frontend
 Transport; Tue, 17 Nov 2020 16:53:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 16:53:14 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Tue, 17 Nov 2020 16:53:12 +0000
Received: from aa5df48f51f4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FC84D46-9E92-4C39-939B-DFC932CEB5F3.1; 
 Tue, 17 Nov 2020 16:52:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa5df48f51f4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Nov 2020 16:52:58 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4284.eurprd08.prod.outlook.com (2603:10a6:10:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 16:52:56 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 16:52:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/ssn=EX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kf4EK-00084B-UP
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:53:20 +0000
X-Inumbo-ID: d9e6cb6f-8c91-4f8b-8a99-298280765a7b
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe08::60b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d9e6cb6f-8c91-4f8b-8a99-298280765a7b;
	Tue, 17 Nov 2020 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+oQyniPepmnOVJ6lwHyL6t/EAAi8uZDDV9+CNCxSl4=;
 b=nAYaz8FBCysvRNX376/Rv3QilFw6G3zLSCWECpmyCkMRa2OHhrWOfA6gFMKLL/acCXVrsZNNwdLp3kHnPHTwowQV3kDWHAzmj+UyBwRR4KHZR6DxJ4VIQgaCo/0t5THNey2yjC2XRV+ld+tC8RxF6+OUCfDGepIYW7oITJJ5rTE=
Received: from DU2PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:10:234::18)
 by VI1PR08MB4366.eurprd08.prod.outlook.com (2603:10a6:803:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 16:53:14 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::ed) by DU2PR04CA0043.outlook.office365.com
 (2603:10a6:10:234::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26 via Frontend
 Transport; Tue, 17 Nov 2020 16:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 16:53:14 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Tue, 17 Nov 2020 16:53:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: da46682fd13d9f54
X-CR-MTA-TID: 64aa7808
Received: from aa5df48f51f4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0FC84D46-9E92-4C39-939B-DFC932CEB5F3.1;
	Tue, 17 Nov 2020 16:52:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa5df48f51f4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 16:52:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYk+MsV32nmsY9qMTK/M/bwtFtA21yzfVv5gaR1U8e6HMfBdtdzbdgtNL6fc0hoXoGIT7rcMC1UEKzsfi/lE1fjrO5JJrAqMq2XrJtBOfVQ8syP5O+jlHvfmn0i7UUmnvZmMbWojesQoi920btplOwzsqm0WnJDnwjk3tJoge7vctMaOhb2rHvF7mIXDOtmgFjV6xhJASaINTbv8Yqf22Hn360jp3ooy9s8fWbqHn6DbWqFC5TQpBJNAKgJRrTKI0BWUTe9SMuRoe9OIc4GCb7cLS0ZALl8sYQnMPT3zeb0YmGCV+GULpTJfwyi1B07Z+XGo+HBn4+4/2pd3dv31Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+oQyniPepmnOVJ6lwHyL6t/EAAi8uZDDV9+CNCxSl4=;
 b=hTyInCmf1co6FRsGU7oxMxKYQfWW9OkxgUfGxV4YwbaXeb9QhE/nssrhrUraye32vUj3IQCnKwE6n70nvbU+f/UtvYXPhpM4eqRO+NYRr2kaFlIRMM4zyUGUf6Qmp0xeNeU/urC0yWhLX/HGpu4wDhxvLk2NF5aDTun19RQz7bvESwvzx671LOihZDrsAE3iR/WSQN+zhP5bU6enf3GAT3V4Ib/P+zzRFC+BFh8Ay5eXdlaKBFBda3VohYvvefa9BIOtYvO12K7SkpNox9MQ+5CmQfH0qNNsq3znwExUMIE0YXzNK0SJKa6G5LmV8cCbkAcdE++sYbPK+Xgtld+u4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+oQyniPepmnOVJ6lwHyL6t/EAAi8uZDDV9+CNCxSl4=;
 b=nAYaz8FBCysvRNX376/Rv3QilFw6G3zLSCWECpmyCkMRa2OHhrWOfA6gFMKLL/acCXVrsZNNwdLp3kHnPHTwowQV3kDWHAzmj+UyBwRR4KHZR6DxJ4VIQgaCo/0t5THNey2yjC2XRV+ld+tC8RxF6+OUCfDGepIYW7oITJJ5rTE=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4284.eurprd08.prod.outlook.com (2603:10a6:10:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 16:52:56 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 16:52:56 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/3] xen/pci: Move x86 specific code to x86 directory.
Thread-Topic: [PATCH v3 2/3] xen/pci: Move x86 specific code to x86 directory.
Thread-Index: AQHWvBPDynVNQDWjWUaLWbo/nKPcx6nMKoUAgABhhIA=
Date: Tue, 17 Nov 2020 16:52:56 +0000
Message-ID: <232F5C48-745B-44E3-A56F-3F492A7E7D60@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <a84005e5aa6733043e043b015cde4983719c8535.1605527997.git.rahul.singh@arm.com>
 <a6e6d884-93c0-f9ac-c2b4-b264c5a72db1@suse.com>
In-Reply-To: <a6e6d884-93c0-f9ac-c2b4-b264c5a72db1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8a0a63a-707b-40f5-78d4-08d88b194647
x-ms-traffictypediagnostic: DBBPR08MB4284:|VI1PR08MB4366:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4366539CCAEE09CD8E9BD02BFCE20@VI1PR08MB4366.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +ohGQD3cdKeUdEjB47uosJQ+EiGLSExGWNVMee9gHSUv4nHoYfi7MlRWldtc08QdjNL1oCXp4f9fRCc67jD5HqvbIs8Z9KII98tzuQ30cooQizw6nXM0CMiFp1i6A+IXIk65C6WBVFHZIzZvZoEHNYwc4dvu+uTxxn7IxaYYOozqqbx1I9ZPLb7D3Gnc/4OgBxR9wIKuSh2TAEsnKsXC01QpvQtaIOFEiNLpa/pnqJAw/lgMwnUb3FD0jCTeOk4UfDPIpYdRVK6UZyipuVDrfKcoISDb2T/nLejw7OVrM1oghAOTCD2QhbsNxUm0KpAP
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(6916009)(86362001)(91956017)(6486002)(6512007)(8676002)(8936002)(83380400001)(33656002)(2906002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(4326008)(53546011)(6506007)(316002)(54906003)(26005)(478600001)(5660300002)(186003)(2616005)(71200400001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 3afkM+5NNJ/poR/xpcGBAKRgMv/kHDfttHREBDM5d2/YWcqV7DxArxf2sBKHqaN2lX1YKMJLTxvR4ppno04sroRJeqaPnjoL2PNdMs/u0fwp7/02Euq7GPpx80akBfK8k10WD2YgdhNatDvDbjF9fdMPNUQoMwgqbh3zdMUP7cH3khpYBMzTnh4K24OaQoWWLqzwYKuLuSGdFqqZ8Ik6CiJYTrMdTigWhMxEPziYuaotINJyMkP9rqoi6Xcdi+7+wE4AK9FI+jFWZawPLlBaRWyrwMPUAPmLhlXG90IezHntqqtAXiZuSUDvF3DW4SKqgUq6Wivi14x9eU6FVrgUNlUMvWnF1wfUYjDQJNXC8CxYx2nAbzrppWrRjLvcs5B6w5JEGtYgAZL06JAJhmh2XwAcKS7RE45YlFYQqwYnKeIjdsw4hjfxmi8Wg4O4/4JvQQMhV10rUR1SpGbwlFMOQGwYR2Dz6VG12EMQCxrlBLPXfQOXeIhoilhgW/7Dtr8q+2oA21kdK/qMQ6b+WYhGsqdvl2br1c6YhaNcExuKYPazPxGKFW5oisuuXJAdBIqBxQP5ooOhAHxc9pfmoOknpFbqRPDgkGBnpjxzmcgxNLiPuscWHlLTBYoxerxf3miFR2Gj51cNSbGV9bLkGI4a7CiWOeL8/73b9QDmpbSQKrSR5h5vmXAsu1+efj0RULcpymPnTv+FHGpnBTWLtjSZgfECM7dy1n/cuKg2Cj38abfaCdHcI4lwhaH2JfVCKfPr71gg9iaMKAjsKFLpeOfRzUetlF/6YfphQ9AABZS+bwdR3r6+TIUKVDnfbifsbDEfvNUAHpMjwC0WLYkSP4+9IcpviDqi77sRVoNN7v1oA1uBTgoCDg4N81+S1QFhLPpqT3AoEsh0njvar2vIK4DF4Q==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <56CB40668698484FBF37A2418118DA12@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4284
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd634b85-117e-41eb-38c6-08d88b193bc6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OWF+cieLWkzxYpFpJ1DTrFOHgPYO0tWBDF6LcLWHQ3zkZAk0TV77ECaXUQNLnm9JvWOVQMz+m2OqVZk+0yOSnm3Riz+Z1Zol7stiOnbPzNBzYe/KmcvVLjN3k06vrLH6YT9JPDzC1YxZ6XuqRespEiV0zEqAjdp/T+4LVWf6NW+yqjzBsJ/xqHEDl+VDdoXGyvQx6qlbBIOCerJTKmBcG0x8tq8B+bovOK1gfPXoAjQVtA6UEXhM2V/hT/mZrQMl4uyOhgALKF9F2cUSOy7OpdBvkSWLmgFEFz1+sWGuLemfbT3DWXQcb5Z0CaA9CzTUNa090cNtyLsADBa08Fw0lXMuMwnPKapqWZoV4I06wtYfLtDVImeuKBWl7p5TTGY4gXWJLLwfcg1VTgDIpeEHPg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(53546011)(36756003)(6506007)(6486002)(8936002)(478600001)(83380400001)(82310400003)(6512007)(33656002)(26005)(6862004)(4326008)(8676002)(70206006)(86362001)(186003)(5660300002)(336012)(81166007)(316002)(70586007)(356005)(54906003)(47076004)(82740400003)(2616005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 16:53:14.2237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a0a63a-707b-40f5-78d4-08d88b194647
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4366

Hello Jan,

> On 17 Nov 2020, at 11:03 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 16.11.2020 13:25, Rahul Singh wrote:
>> passthrough/pci.c file is common for all architecture, but there is x86
>> specific code in this file.
>=20
> In how far is ...
>=20
>> @@ -1370,13 +1301,6 @@ static int __init setup_dump_pcidevs(void)
>> }
>> __initcall(setup_dump_pcidevs);
>>=20
>> -int iommu_update_ire_from_msi(
>> -    struct msi_desc *msi_desc, struct msi_msg *msg)
>> -{
>> -    return iommu_intremap
>> -           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg)=
 : 0;
>> -}
>=20
> ... this code x86-specific? The hook being called lives in a
> #ifdef CONFIG_HAS_PCI section, and MSI is a general PCI sub-
> feature. IOW if this is another workaround, it should be
> called so (if there's really no other way to address whatever
> issue there is), which in turn likely means it wants to be in
> a separate patch.
>=20

As of now there is no implementation for ARM to remap the interrupt and int=
errupt remapping is enabled for x86 only so I thought I will move this code=
 to x86 file as this function is called from the x86 specific code only.

I will remove this code form this patch and will fix this once once will ha=
ve proper MSI implementation for ARM.

> Jan



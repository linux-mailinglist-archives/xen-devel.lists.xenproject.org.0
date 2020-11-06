Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC992A966D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 13:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20734.46757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb1AV-0002c0-6y; Fri, 06 Nov 2020 12:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20734.46757; Fri, 06 Nov 2020 12:48:39 +0000
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
	id 1kb1AV-0002bT-2h; Fri, 06 Nov 2020 12:48:39 +0000
Received: by outflank-mailman (input) for mailman id 20734;
 Fri, 06 Nov 2020 12:48:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kb1AU-0002a1-30
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 12:48:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.63]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa0781e5-22b9-4bc9-a396-4a741deb25e8;
 Fri, 06 Nov 2020 12:48:34 +0000 (UTC)
Received: from AM6P194CA0057.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::34)
 by DB6PR0801MB1845.eurprd08.prod.outlook.com (2603:10a6:4:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 12:48:30 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::a) by AM6P194CA0057.outlook.office365.com
 (2603:10a6:209:84::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 12:48:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 12:48:30 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71");
 Fri, 06 Nov 2020 12:48:30 +0000
Received: from 7ec34fa4adea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0C735FD-E81A-46F1-81DB-822416D04178.1; 
 Fri, 06 Nov 2020 12:48:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ec34fa4adea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Nov 2020 12:48:20 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0801MB1958.eurprd08.prod.outlook.com (2603:10a6:4:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 12:48:17 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 12:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kb1AU-0002a1-30
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 12:48:38 +0000
X-Inumbo-ID: fa0781e5-22b9-4bc9-a396-4a741deb25e8
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.63])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa0781e5-22b9-4bc9-a396-4a741deb25e8;
	Fri, 06 Nov 2020 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd6T/AmA/q63fvcIN0Kr5awQuDyw2DvGj5Pn/xCbQT0=;
 b=NMG1LnVzXoo82xB8ZNbkPTsyt7986RS0j3pj2MU5SD9TvjLYQWsWKANKaZnSV6rM/5v2Wh5nf3LOTp06Tw4jGau1s3M3XK31VqAzT+G1f6ROdeZKKl024Y1B++tnOLKGJTqctSeYu4nj/lHIwdFVlRMQPlT7XeqPqXD7Pw1QJZM=
Received: from AM6P194CA0057.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::34)
 by DB6PR0801MB1845.eurprd08.prod.outlook.com (2603:10a6:4:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 12:48:30 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::a) by AM6P194CA0057.outlook.office365.com
 (2603:10a6:209:84::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 12:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 12:48:30 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Fri, 06 Nov 2020 12:48:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48339c812ce88691
X-CR-MTA-TID: 64aa7808
Received: from 7ec34fa4adea.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F0C735FD-E81A-46F1-81DB-822416D04178.1;
	Fri, 06 Nov 2020 12:48:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ec34fa4adea.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 12:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlF+l+Jq/0jyWR3OVO4KhBrByp58NicI1jQoS1Gaceh2IWMXmTnvgN3swPIIXYLDeJHaFODpJT9j09wXkz/OoZxbhGxSbLulcVqxAkrRb1lFguz6XubglWI2xCUPjX069NWbg0sCe32GopVa9meYcoFhoKVN40mjCsdeYfpBmnIKSToy3GAUXGq8gW1Ai2FJcxpPuRl8CV93rZf4jfrjgUw5JAWCx9bQN50/Mzm/D+XUuXCOd6n3iiyK8A5MonpY7VxwR0jKyHQQHuV7UDNqNklEjsyt/kqO3REl382oeYjeE5ovVR1UnzPeS5bXwlAy2ai+GTEwreESITtnp0JBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd6T/AmA/q63fvcIN0Kr5awQuDyw2DvGj5Pn/xCbQT0=;
 b=NQH8zlkncvCtKi1aKytHITnmKsbm84JUst11zmPcyXS8UqtYHhsYt/sQ12JAi+/fw1An/7kj5TdvU9ZHKd+Lk0aevRxovKNlsd9DBXLjjAdmR4QmhndkM5d2EVAJLAqLRHItMogEAKER5cr3gJAV1Zlm4ZvJdjbozDCx/FhC05a9v7ErZ8FoZV9bHWqCNf1A+v75/k/l9BFUHcf/G/A3P//EpDAbsdDj0gqFpxh0FEZnD8FbSV5Y1rXumyulyocEX1jpQvMT/OQ/7MSr9taHtGS6jRwDboS6aemDowBPlmHEUPSpD5OKVQt4iWK6HO/2fYYg+Cj236oaYFphN3SSiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd6T/AmA/q63fvcIN0Kr5awQuDyw2DvGj5Pn/xCbQT0=;
 b=NMG1LnVzXoo82xB8ZNbkPTsyt7986RS0j3pj2MU5SD9TvjLYQWsWKANKaZnSV6rM/5v2Wh5nf3LOTp06Tw4jGau1s3M3XK31VqAzT+G1f6ROdeZKKl024Y1B++tnOLKGJTqctSeYu4nj/lHIwdFVlRMQPlT7XeqPqXD7Pw1QJZM=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0801MB1958.eurprd08.prod.outlook.com (2603:10a6:4:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 12:48:17 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 12:48:17 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<andr2000@gmail.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamwEIWAgABuPwCAA/gngIAAQvMAgAAErACABnTvAA==
Date: Fri, 6 Nov 2020 12:48:17 +0000
Message-ID: <5F09F481-DC27-4FC3-8CE5-F4F97FDF6DF9@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
 <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
In-Reply-To: <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7fe82ee0-40f1-4d25-9ef0-08d882524375
x-ms-traffictypediagnostic: DB6PR0801MB1958:|DB6PR0801MB1845:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1845BEC38A3FD6082D316E8EFCED0@DB6PR0801MB1845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Xfyh1IlS5rnU8liWb9lQz1WPfJJzCa9mtkU7MpsqYAaUmbBhJqJbSgaethUifUy9i0F0Pbg+GbT85TOh6n/msontaxCliJ5igws9CnWIEBeolhewDwnqrrEGNeQBOmOdU1Ngns7SY41CJM4TJDRggwS1vLYA8SnPANFWYBcuaulvJqgfRoc5y/dDkT4aUaPECGSJaiTIUR0xUCnGkNPXEx074i55UZrKDvQ4L3AHwLvQ9XjEtJAeH06m+6xt/rYBepBzXZIr653uKXtTwihc1fcghnNx8u1f33BKE+GKtzJDkgSVzfYAQjccc8bh4Yik5JmxDEYTTd6LHCbZD6Jqgw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(2906002)(36756003)(8936002)(83380400001)(8676002)(33656002)(66556008)(66446008)(316002)(6916009)(6486002)(6512007)(76116006)(86362001)(26005)(91956017)(66476007)(2616005)(64756008)(71200400001)(53546011)(6506007)(54906003)(186003)(66946007)(5660300002)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 wLVWUoOHySoSg1IKXu7m87ufbHcHLady19Ql2Cq0JbpOTglnV6xbHFhuWeoOMe+SRoFvJBMABWpGlMiyi9+s1pJ0e3uJrERdR6r0u2RAjs1fQ04t5TpePxR+aTvI06vXBcky1iyTXbvBYLbYdneSE7CqAanw9OGjWv1MvCziw3s93sPRcMUIpV26u5LKSfYBJB/IydYjuBEtTPRLw03I01qJ6ryaU3awEDL8+i+8BMIr90MOYN3+0ASibaB4pVJgHvv/zrZ/z9IkXoiafwW8MM40mwB8Yc5QBxgFCw9eOj4mg7fVtHfkoyCmSGWDDbm8Up/QpU30RCYB/qVHeNmcGr62Bndq5xl8m241jrIWJ6Pwouqa+Cmz46g+03TQ5Wql7ZpkpBaR/DMJnf7Ti9USr4USlrC2rqrHZQ7vCcJpmFfxqrrMHlCNvUu92NiMAEFUXR3TmkC/ahfwq7a9BFIQ1dA7iT/rpviH6XOXvDH1ts0wT0LRJj8Y4j4wPkychrruqksdh8UjzM+o8D9AtWrTcJO720uctk9HUmLLUtrUcUijvOROPBgTyK8c9Qz72iOjmRcgXQ3RgzvyI3bHE5w8BE5d5UGDXMjbujxIMqSkXyQ1twxRJVC7YOpx1+v/QcPLJ62IvpBii/jTdGY4dWf0/w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4ED7B644A6CB545BBA2F390371D1D56@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1958
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	00f85abc-22de-4c0f-46b3-08d882523bb9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BKpvtKJx3Lavhn9Dbksx8bfu7D1XlW4qFseoYuUzVREWfharWLdSh8Atq/ayHohbB1hYaOa5/nnBKJmM4uzhvUxXNdFfGyttziCNco4g16F4KPWA1QQUBFxZtLqqrSjMfUoBmjPlK2a5+x7hYBG9BQsm+l1+jn4WMLEVWpKCbt2n47lcU1bxTet2XxQa4BgOLcMNXiZ7AX5pHwXhbPCM1AkJ6AdQtddIjHUxKkdsKyNxsUlo8IAhU4jSp0aM1d9SslkvXy7QiSQwdRLG0qcdTmdq8tjSi/VrBbQW1S91l1vN3OkjTuD86ClweOMkztQ14By7Y/QsKUXW5up4eaE7McU4xySdT9GxOvwv4yz9e/Gtfqsnx9pudvaBwAg8lOeFsgzUe1TTG8ExyBTaaPFkOg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(83380400001)(478600001)(8676002)(33656002)(2906002)(36756003)(82740400003)(356005)(6506007)(4326008)(26005)(86362001)(186003)(53546011)(8936002)(2616005)(6862004)(47076004)(54906003)(6486002)(36906005)(82310400003)(316002)(6512007)(5660300002)(336012)(70586007)(107886003)(70206006)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 12:48:30.3097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe82ee0-40f1-4d25-9ef0-08d882524375
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1845

SGVsbG8gT2xla3NhbmRyLA0KDQo+IE9uIDIgTm92IDIwMjAsIGF0IDEwOjEyIGFtLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+IHdyb3Rl
Og0KPiANCj4gSGksDQo+IA0KPiBPbiAxMS8yLzIwIDExOjU1IEFNLCBCZXJ0cmFuZCBNYXJxdWlz
IHdyb3RlOg0KPj4gSGksDQo+PiANCj4+PiBPbiAyIE5vdiAyMDIwLCBhdCAwNTo1NSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPGFuZHIyMDAwQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
SGksIEp1bGllbiENCj4+PiANCj4+PiBPbiAxMC8zMC8yMCA3OjE4IFBNLCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4gDQo+Pj4+IE9uIDMwLzEwLzIwMjAgMTA6
NDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4gT24gMTAvMjAvMjAgNjoy
NSBQTSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4gQWRkIHN1cHBvcnQgZm9yIEFSTSBhcmNo
aXRlY3RlZCBTTU1VdjMgaW1wbGVtZW50YXRpb25zLiBJdCBpcyBiYXNlZCBvbg0KPj4+Pj4+IHRo
ZSBMaW51eCBTTU1VdjMgZHJpdmVyLg0KPj4+Pj4+IA0KPj4+Pj4+IE1ham9yIGRpZmZlcmVuY2Vz
IGJldHdlZW4gdGhlIExpbnV4IGRyaXZlciBhcmUgYXMgZm9sbG93czoNCj4+Pj4+PiAxLiBPbmx5
IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMgc3VwcG9ydGVkIGFzIGNvbXBhcmVkIHRvIHRoZSBMaW51
eCBkcml2ZXINCj4+Pj4+PiAgICAgIHRoYXQgc3VwcG9ydHMgYm90aCBTdGFnZS0xIGFuZCBTdGFn
ZS0yIHRyYW5zbGF0aW9ucy4NCj4+Pj4+IEZpcnN0IG9mIGFsbCB0aGFuayB5b3UgZm9yIHRoZSBl
ZmZvcnRzIQ0KPj4+Pj4gDQo+Pj4+PiBJIHRyaWVkIHRoZSBwYXRjaCB3aXRoIFFFTVUgYW5kIHdv
dWxkIGxpa2UgdG8ga25vdyBpZiBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3QNCj4+Pj4+IA0KPj4+
Pj4gdGhhdCB0aGlzIGNvbWJpbmF0aW9uIHdpbGwgbm90IHdvcmsgYXMgb2Ygbm93Og0KPj4+Pj4g
DQo+Pj4+PiAoWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1MDAwMDogU01NVXYzOiBEVCB2YWx1ZSA9
IGV2ZW50cQ0KPj4+Pj4gKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9tZT0weDE5NDAwMTAN
Cj4+Pj4+IChYRU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAweDQwMDMxMDAwIG9uIENQVTAgdmlh
IFRUQlIgMHgwMDAwMDAwMGI4NDY5MDAwDQo+Pj4+PiAoWEVOKSAwVEhbMHgwXSA9IDB4MDAwMDAw
MDBiODQ2OGY3Zg0KPj4+Pj4gDQo+Pj4+PiBbc25pcF0NCj4+Pj4+IA0KPj4+Pj4gSWYgdGhpcyBp
cyBleHBlY3RlZCB0aGVuIGlzIHRoZXJlIGFueSBwbGFuIHRvIG1ha2UgUUVNVSB3b3JrIGFzIHdl
bGw/DQo+Pj4+PiANCj4+Pj4+IEkgc2VlIFsxXSBzYXlzIHRoYXQgIk9ubHkgc3RhZ2UgMSBhbmQg
QUFyY2g2NCBQVFcgYXJlIHN1cHBvcnRlZC4iIG9uIFFFTVUgc2lkZS4NCj4+Pj4gSnVzdCBmb3Ig
Y2xhcmljYXRpb24sIHlvdSBhcmUgdHJ5aW5nIHRvIGJvb3QgWGVuIG9uIFFFTVUsIHJpZ2h0Pw0K
Pj4+IEV4YWN0bHkNCj4+Pj4gWW91IG1pZ2h0IGJlIGFibGUgdG8gdXNlIHRoZSBzdGFnZS0xIHBh
Z2UtdGFibGVzIHRvIGlzb2xhdGUgZWFjaCBkZXZpY2UgaW4gWGVuLiBIb3dldmVyLCBJIGRvbid0
IHRoaW5rIHlvdSB3aWxsIGJlIGFibGUgdG8gc2hhcmUgdGhlIFAyTSBiZWNhdXNlIHRoZSBwYWdl
LXRhYmxlcyBsYXlvdXQgYmV0d2VlbiBzdGFnZS0xIGFuZCBzdGFnZS0yIGlzIGRpZmZlcmVudC4N
Cj4+PiBTbywgaXQgaXMgZXZlbiBtb3JlIHdvcmsgdGhlbg0KPj4gT3ZlcmFsbCBpdCB3b3VsZCBt
YWtlIG1vcmUgc2Vuc2UgdG8gc3BlbmQgc29tZSB0aW1lIGFkZGluZyBwcm9wZXIgc3VwcG9ydCBp
biBRZW11IHRoZW4gdHJ5aW5nIHRvIG1vZGlmeSB0aGUgZHJpdmVyIHRvIHN1cHBvcnQgUWVtdSBy
aWdodCBub3cuDQo+PiANCj4+Pj4+IA0KPj4+Pj4gV2UgYXJlIGludGVyZXN0ZWQgaW4gUUVNVS9T
TU1VdjMgYXMgYSBmbGV4aWJsZSBwbGF0Zm9ybSBmb3IgUENJIHBhc3N0aHJvdWdoDQo+Pj4+PiAN
Cj4+Pj4+IGltcGxlbWVudGF0aW9uLCBzbyBpdCBjb3VsZCBhbGxvdyB0ZXN0aW5nIGRpZmZlcmVu
dCBzZXR1cHMgYW5kIGNvbmZpZ3VyYXRpb25zIHdpdGggUUVNVS4NCj4+Pj4gSSB3b3VsZCByZWNv
bW1lbmQgdG8gZ2V0IHRoZSBTTU1VIHN1cHBvcnRpbmcgc3VwcG9ydGluZyBzdGFnZS0yIHBhZ2Ut
dGFibGVzLg0KPj4+IFlvdSBtZWFuIGluIFFFTVU/DQo+PiBTZWUgYmVmb3JlLg0KPj4gDQo+Pj4+
IFJlZ2FyZGxlc3MgdGhhdCwgSSB0aGluayBYZW4gc2hvdWxkIGJlIGFibGUgdG8gc2F5IHRoZSBT
TU1VIGlzIG5vdCBzdXBwb3J0ZWQgcmF0aGVyIHRoYW4gY3Jhc2hpbmcuDQo+Pj4gWWVzLCB0aGF0
IHdvdWxkIGJlIG5pY2UNCj4+IEZ1bGx5IGFncmVlIGFuZCB3ZSB3aWxsIGxvb2sgaW50byB0aGF0
Lg0KPj4gDQo+PiBBbnl0aGluZyB5b3UgY291bGQgc2hhcmUgc28gdGhhdCB3ZSBjb3VsZCBxdWlj
a2x5IHJlcHJvZHVjZSB5b3VyIHNldHVwIHdvdWxkIGJlIG1vcmUgdGhlbiBncmVhdC4NCj4gDQo+
IE5vdGhpbmcgc3BlY2lhbCwNCj4gDQo+IHFlbXUvYWFyY2g2NC1zb2Z0bW11L3FlbXUtc3lzdGVt
LWFhcmNoNjQgLW1hY2hpbmUgdHlwZT12aXJ0IC1tYWNoaW5lIHZpcnQsZ2ljLXZlcnNpb249MiBc
DQo+IA0KPiAtbWFjaGluZSB2aXJ0dWFsaXphdGlvbj10cnVlIC1jcHUgY29ydGV4LWE1NyAtc21w
IDQgLW0gMjA0OCAtbmljIHVzZXIsaG9zdGZ3ZD10Y3A6MTI3LjAuMC4xOjIyMjItOjIyIFwNCj4g
DQo+IC1ub2dyYXBoaWMgLXNlcmlhbCBtb246c3RkaW8gWy4uc25pcC4uXQ0KPiANCj4gSSBhbHNv
IHNldCBpb21tdSB0byBzbW11djMgaW4gbXkgdGVzdHMsIFFFTVUgZW11bGF0b3IgdmVyc2lvbiA0
LjIuMQ0KDQpJIGp1c3QgY2hlY2tlZCBhbmQgY29uZmlybWVkIHRoYXQgUUVNVSBpcyBib290aW5n
IHdpdGggWEVOIFNNTVV2MyBwYXRjaCBhbmQgWEVOIGlzIGFibGUgdG8gc2F5IFNNTVUgdHJhbnNs
YXRpb24gaXMgbm90IHN1cHBvcnRlZC4gQXMgWEVOIHN1cHBvcnRzIFN0YWdlLTIgdHJhbnNsYXRp
b24gYW5kIFFFTVUgc3VwcG9ydHMgU3RhZ2UtMSBvbmx5Lg0KDQoNCihYRU4pIFNNTVV2MzogL3Nt
bXV2M0A5MDUwMDAwOiBTTU1VdjM6IERUIHZhbHVlID0gZXZlbnRxDQooWEVOKSBTTU1VdjM6IC9z
bW11djNAOTA1MDAwMDogSURSMC5DT0hBQ0Mgb3ZlcnJpZGRlbiBieSBGVyBjb25maWd1cmF0aW9u
IChmYWxzZSkNCihYRU4pIFNNTVV2MzogL3NtbXV2M0A5MDUwMDAwOiBubyB0cmFuc2xhdGlvbiBz
dXBwb3J0IQ0KKFhFTikgSS9PIHZpcnR1YWxpc2F0aW9uIGRpc2FibGVkDQoNCk9ubHkgZGlmZmVy
ZW5jZSBJIG9ic2VydmVkIGlzIHRoYXQgeW91IGhhdmUgdG8gYWRkIG9wdGlvbiAiLW1hY2hpbmUg
dmlydCxpb21tdT1zbW11djMg4oCcIHdoZW4gbGF1bmNoaW5nIHRoZSBRRU1VLg0KDQpQbGVhc2Ug
bGV0IG1lIGtub3cgaWYgaXQgYWxzbyB3b3JrcyBmb3IgeW91Lg0KIA0KPiANCj4+IA0KPj4gUmVn
YXJkcw0KPj4gQmVydHJhbmQNCj4+IA0KPj4+PiBDaGVlcnMsDQo+Pj4+IA0KPj4+IFRoYW5rIHlv
dSwNCj4+PiANCj4+PiBPbGVrc2FuZHINCg0K


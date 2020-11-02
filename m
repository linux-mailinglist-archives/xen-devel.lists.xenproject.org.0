Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08832A278C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 10:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17561.42360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZWZ9-0007Sx-19; Mon, 02 Nov 2020 09:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17561.42360; Mon, 02 Nov 2020 09:55:55 +0000
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
	id 1kZWZ8-0007SY-UE; Mon, 02 Nov 2020 09:55:54 +0000
Received: by outflank-mailman (input) for mailman id 17561;
 Mon, 02 Nov 2020 09:55:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prqF=EI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kZWZ7-0007ST-Be
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 09:55:53 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fbcc601-24ef-463e-9750-32015307dbe5;
 Mon, 02 Nov 2020 09:55:51 +0000 (UTC)
Received: from DB7PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:10:2e::35)
 by HE1PR0801MB1882.eurprd08.prod.outlook.com (2603:10a6:3:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 09:55:46 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::d3) by DB7PR05CA0058.outlook.office365.com
 (2603:10a6:10:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 09:55:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 09:55:45 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Mon, 02 Nov 2020 09:55:45 +0000
Received: from 37cb86306c1b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 375AA55F-F668-4FFC-BA20-7B42D580659F.1; 
 Mon, 02 Nov 2020 09:55:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37cb86306c1b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Nov 2020 09:55:31 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 09:55:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 09:55:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=prqF=EI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kZWZ7-0007ST-Be
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 09:55:53 +0000
X-Inumbo-ID: 8fbcc601-24ef-463e-9750-32015307dbe5
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe1e::61c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8fbcc601-24ef-463e-9750-32015307dbe5;
	Mon, 02 Nov 2020 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0gDik8R7PSzlglryaKEUqXXKkBxBVwE4A9c2jEMqk0=;
 b=SEZYp1Tm6b680BpNk226f+UMamtHWFqx0zYjkiRIPVaR9v+7U6/aM4R5cis4dTpL+2bWv3z2BA6IZM6J+RlaMOa3FONr6EzvomfUkgVZI3E1mILG0LeIjwvRBzahX7SNMpYWH2KSG/sRyKuQqZdr3Py+RZQC/McuV6Nu9sMetkQ=
Received: from DB7PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:10:2e::35)
 by HE1PR0801MB1882.eurprd08.prod.outlook.com (2603:10a6:3:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 09:55:46 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::d3) by DB7PR05CA0058.outlook.office365.com
 (2603:10a6:10:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 09:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 09:55:45 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Mon, 02 Nov 2020 09:55:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d167d128e151492
X-CR-MTA-TID: 64aa7808
Received: from 37cb86306c1b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 375AA55F-F668-4FFC-BA20-7B42D580659F.1;
	Mon, 02 Nov 2020 09:55:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37cb86306c1b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Nov 2020 09:55:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWVB0dYJtJ4JA60s1Fu9TGrXGJUIt+io6YOoGzkIkd3w8lLUVvZx58njiPstBHm6vWitUzchyvfYPIFuP+GpMYZtSVEWwf8uJ3gzwht5rhtRFxClvOK/zL4zNjiAEAZPCsv9qVaXqyLXNTpuGwPz6/kUHDeyryZI+zl+xTuvaIin9e9LxDlGHyXimmxxF/LuOo1BkRMuSWUBfwhseIUwCQFnmzWhLpTZ32GCDBqfxZ7oM537dZyKtR/wzRb1JshYx9dAGISts/gUlhmKEi29VZYHWHzUw3b0cPqA1besxJqqstEtP/7w2wsm0BdoiJSlaRBOeKzX98dBPfOEhURxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0gDik8R7PSzlglryaKEUqXXKkBxBVwE4A9c2jEMqk0=;
 b=aSgGdjFZOmyk4BL/+ujOJKNDakmu9qaGG/gy3gMoeP7sq/QIQXCigiX5oX4Hifk/Y/gGfZcxJdZXf9AQhscSBWkoKMZF8+ihtdVU+WqLqA+6kY501U+N4SPbhx/9zyhHaNmh76XhncvHUvT8SwkrGo6+ZZVo3TX3as/4ra4zTetfch2xzLQ9YZARv807v6nGEgqet+jU1hk0VTlSKkxeTresvzSd8Vp+Ehm6VnXxYHJYhHAFVxWS5lwiKzRkttZeOa6beuiJGeOR+dFQS58gogIHw9zzjRbQJMjaT+MruoC4DrDbEcohjWNCSEAIVWzeQ5un0CQfwNmh5bfJ3NIFfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0gDik8R7PSzlglryaKEUqXXKkBxBVwE4A9c2jEMqk0=;
 b=SEZYp1Tm6b680BpNk226f+UMamtHWFqx0zYjkiRIPVaR9v+7U6/aM4R5cis4dTpL+2bWv3z2BA6IZM6J+RlaMOa3FONr6EzvomfUkgVZI3E1mILG0LeIjwvRBzahX7SNMpYWH2KSG/sRyKuQqZdr3Py+RZQC/McuV6Nu9sMetkQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 09:55:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 09:55:29 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: Julien Grall <julien@xen.org>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWoVvyGh0jWzCHpk6w/U7XN+08x6mwEIWAgABuPwCAA/gngIAAQvMA
Date: Mon, 2 Nov 2020 09:55:28 +0000
Message-ID: <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
In-Reply-To: <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7183759b-8108-4077-1299-08d87f1577a4
x-ms-traffictypediagnostic: DB8PR08MB5324:|HE1PR0801MB1882:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1882A6D0CA2AA222930858DA9D100@HE1PR0801MB1882.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gmhycnIQWvczKt+r04VjLG9SGDE45UWz9kMr2f5fwCEgXuUPROkCDwfbXEIlJ+OYmPKOnmtBcfkA/8Uzv2vpP1TtwweHYC8wRgYigiAQQNa6VuyxiyWbMCZTRANlHaWKg4ak7unnLQbexpKPbEkS96RcgOPfPGS/s4K0vXpyYG5Q/BCmYN55CMqYdgsKaMZ1m35O8a2kd0wGd+PVagOzNMMLpa1SiJoAXLwjOzwKRooSPjBlMFwC2VALNlOYIkXDmksSvJmUOKQh2PziwUHcW7W6VOM3PqYFPJjzNMmAOb9YN9CNLnOJMsmm2DwhGVDPkWRZ5XeZZXCf1CwGdRsgtQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(8936002)(66946007)(66446008)(64756008)(8676002)(53546011)(316002)(6916009)(478600001)(6486002)(186003)(2906002)(91956017)(66556008)(4326008)(66476007)(5660300002)(54906003)(76116006)(36756003)(33656002)(2616005)(86362001)(71200400001)(6506007)(26005)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 jHyB7bYeeqaloQ/ho29RfCVbgiOnKWAlPl6k5gppsheq5JWvr/6mSyidbcxjyU2lMGxPSxWdosVEN2Urm3Zj/Wnzs6vj5JGBRRZ8JVnryqkkU5DzCHnTQMH/4pd4RbUwk61F53jnF5sfzFZW1Gld1zzKriQ/kYOhc+2EOn21sP2crBFov72bG9mrE04zPUyX6Fe7uno9SAwkaX2PxvuWXgSgXl2QpjlX/9TTz2lK+u27Lnr2+PjT78uWFj/GHw4FC7NyNxSA+0uqSuTdh+NAEVgzCAWThWGIflJSW7kCGkMCRtH6RlGjV9fDJrrD4kQX7s16QFfyCCXqjMfZ4Z6pWMHZJ9JF8G7RIrgiK5rjsVrcHFhOkwr0zThlmgbrp1gmJSj43vVuEoP/tzAZyngSESPjbbVNHs7KwORrrPRP8go593wYGFp6Zg17ruvpv+h349mjKEgYGL7KSZLgsjDy8+TCm93ZFJEYxWW3QmYGugkv9U5sNpVLS8oLgO7X/IxZqTATxLn09O7aLeT3TuCTKVVc8f+WdPeE6LFDM/NakCqZMQL9bQvZsulfIuX1MYudLQnAWaPToRlppb9LM/9sL/1dYsgJD3WgBQaaAjrnaM4SNwFPMKtYOxv5PrDDXyezkNd60Iavezy6FH++Jzcjqg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4636A511809D2E409C1A878D561BE447@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09ae4d72-eff8-4c24-f918-08d87f156e18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TNVMaUjxaRXl+En1QEQtpDCXWmmRO7IO5mLaYK+lPqNODdHo+/X4ZGXHuAbbSiUNPAJ68RvmXNfyHmHSUv25OhI4/Rp9oeoI3rRd3d7pVuzzO3aOKlnKABBjjFOtzbvJ8MUPsZ2zhPNKvMQIfsyMxEdji0fSef/V616py+wqvGBjZOHvCul9tFGT5EYzND4JYC0ZYiTd7RZ+jhUfXOycUTH0SFoZIEXSWIqqezekvmb/pPYWLe79OZP+BEHJJFYebPiz9WuTcFALnAXO4dnPW15nYVIXAPOPeA8PHeyPUi/A9UnnWwdw8nAZrsJV6ZiBGBu/3T5e9fNNeN2RVRRaGKkD4pdcteZ+2ZRo9MNIITYsbdbuAJ7F5YKKDhGgtHRlZuqXX+pVL9p/JdXr++Ra7Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(6862004)(107886003)(26005)(4326008)(70206006)(70586007)(6512007)(186003)(8936002)(5660300002)(336012)(2616005)(6486002)(54906003)(82740400003)(8676002)(53546011)(316002)(47076004)(478600001)(2906002)(36756003)(356005)(86362001)(82310400003)(6506007)(33656002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 09:55:45.1087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7183759b-8108-4077-1299-08d87f1577a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1882

Hi,

> On 2 Nov 2020, at 05:55, Oleksandr Andrushchenko <andr2000@gmail.com> wro=
te:
>=20
> Hi, Julien!
>=20
> On 10/30/20 7:18 PM, Julien Grall wrote:
>> Hi Oleksandr,
>>=20
>> On 30/10/2020 10:44, Oleksandr Andrushchenko wrote:
>>> On 10/20/20 6:25 PM, Rahul Singh wrote:
>>>> Add support for ARM architected SMMUv3 implementations. It is based on
>>>> the Linux SMMUv3 driver.
>>>>=20
>>>> Major differences between the Linux driver are as follows:
>>>> 1. Only Stage-2 translation is supported as compared to the Linux driv=
er
>>>>      that supports both Stage-1 and Stage-2 translations.
>>>=20
>>> First of all thank you for the efforts!
>>>=20
>>> I tried the patch with QEMU and would like to know if my understanding =
correct
>>>=20
>>> that this combination will not work as of now:
>>>=20
>>> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value =3D eventq
>>> (XEN) Data Abort Trap. Syndrome=3D0x1940010
>>> (XEN) Walking Hypervisor VA 0x40031000 on CPU0 via TTBR 0x00000000b8469=
000
>>> (XEN) 0TH[0x0] =3D 0x00000000b8468f7f
>>>=20
>>> [snip]
>>>=20
>>> If this is expected then is there any plan to make QEMU work as well?
>>>=20
>>> I see [1] says that "Only stage 1 and AArch64 PTW are supported." on QE=
MU side.
>>=20
>> Just for clarication, you are trying to boot Xen on QEMU, right?
> Exactly
>>=20
>> You might be able to use the stage-1 page-tables to isolate each device =
in Xen. However, I don't think you will be able to share the P2M because th=
e page-tables layout between stage-1 and stage-2 is different.
> So, it is even more work then

Overall it would make more sense to spend some time adding proper support i=
n Qemu then trying to modify the driver to support Qemu right now.

>>=20
>>>=20
>>>=20
>>> We are interested in QEMU/SMMUv3 as a flexible platform for PCI passthr=
ough
>>>=20
>>> implementation, so it could allow testing different setups and configur=
ations with QEMU.
>>=20
>> I would recommend to get the SMMU supporting supporting stage-2 page-tab=
les.
> You mean in QEMU?

See before.

>>=20
>> Regardless that, I think Xen should be able to say the SMMU is not suppo=
rted rather than crashing.
> Yes, that would be nice

Fully agree and we will look into that.

Anything you could share so that we could quickly reproduce your setup woul=
d be more then great.

Regards
Bertrand

>>=20
>> Cheers,
>>=20
> Thank you,
>=20
> Oleksandr



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0118D298CB2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 13:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12272.32044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX1Lg-0006pW-1b; Mon, 26 Oct 2020 12:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12272.32044; Mon, 26 Oct 2020 12:11:40 +0000
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
	id 1kX1Lf-0006p7-UM; Mon, 26 Oct 2020 12:11:39 +0000
Received: by outflank-mailman (input) for mailman id 12272;
 Mon, 26 Oct 2020 12:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RWh=EB=arm.com=ash.wilding@srs-us1.protection.inumbo.net>)
 id 1kX1Le-0006p1-Qz
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 12:11:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 182fb024-048d-4da1-86e4-24b37402d229;
 Mon, 26 Oct 2020 12:11:35 +0000 (UTC)
Received: from AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::28)
 by DB6PR0801MB1781.eurprd08.prod.outlook.com (2603:10a6:4:3c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 12:11:33 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::2d) by AM5PR1001CA0015.outlook.office365.com
 (2603:10a6:206:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Mon, 26 Oct 2020 12:11:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 12:11:33 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Mon, 26 Oct 2020 12:11:32 +0000
Received: from 36b14b03cd5b.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 261000BE-B563-4EAD-A940-FD4F4E867D8A.1; 
 Mon, 26 Oct 2020 12:10:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36b14b03cd5b.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Oct 2020 12:10:55 +0000
Received: from DBBPR08MB4428.eurprd08.prod.outlook.com (2603:10a6:10:ce::21)
 by DBBPR08MB4839.eurprd08.prod.outlook.com (2603:10a6:10:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 12:10:51 +0000
Received: from DBBPR08MB4428.eurprd08.prod.outlook.com
 ([fe80::59b6:8468:7c17:b23a]) by DBBPR08MB4428.eurprd08.prod.outlook.com
 ([fe80::59b6:8468:7c17:b23a%3]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 12:10:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9RWh=EB=arm.com=ash.wilding@srs-us1.protection.inumbo.net>)
	id 1kX1Le-0006p1-Qz
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 12:11:38 +0000
X-Inumbo-ID: 182fb024-048d-4da1-86e4-24b37402d229
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.50])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 182fb024-048d-4da1-86e4-24b37402d229;
	Mon, 26 Oct 2020 12:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzH2AXF6wZ2geie3ElaMTpTH+sb1YH5ncsADnPXMFeY=;
 b=0tO/cmCQEJYQ+eFPm/DrOwQR6/mhHR/+kxfTehslWMpt1Uk0pcyLnNDrVBZCkVgM8YzWMESNcUhzeNSYccSDy++wlh2q5x1bIAHHh+WkseQfMS5oNnM7wKz1RDp83ja9HZTObqxdhlyV7mhUvZ0ARZvl97IYF4n/r+CgsFiTUXQ=
Received: from AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::28)
 by DB6PR0801MB1781.eurprd08.prod.outlook.com (2603:10a6:4:3c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 12:11:33 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::2d) by AM5PR1001CA0015.outlook.office365.com
 (2603:10a6:206:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Mon, 26 Oct 2020 12:11:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 12:11:33 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Mon, 26 Oct 2020 12:11:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a94cd087977e158e
X-CR-MTA-TID: 64aa7808
Received: from 36b14b03cd5b.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 261000BE-B563-4EAD-A940-FD4F4E867D8A.1;
	Mon, 26 Oct 2020 12:10:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36b14b03cd5b.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Oct 2020 12:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJz0xg2HoyAgIGzILf/3/3YCm/J9PMXQrgfKuIOoSYlkwEzaCD0TX6oxOH6iIPUCQ6rw+Lp/xmd9uYpEUNN4cBLCbwjg4OxseBmoO5hJJlaKwYxoEuAwEb+TBiY9ahnVAEurTWO4P1LDcWXa6rRjyDYb0AHEurCxbvues6fJiYvjfpaF4jUGEP2Isk+v1HN0g/WmGPoW630MBp1D8LDToiBZn48KZdgAy9flkocUPcjBKEJqVmAePLiGlEGtE8kiChG9+xlxFVA4DbsbkikTHcFiY84pBsbQnBYfmAMPObkWzQS9nTZJ5PQwMifayNhzrYucmeAY/Y8B3Zx3kCkGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzH2AXF6wZ2geie3ElaMTpTH+sb1YH5ncsADnPXMFeY=;
 b=Toa9Pxig8cT/G/uqM0Xwrv6uXFwmUDXiXx8aqxL7ieXw3NyZ8c/RWDt2jZG0YautAv8rfZp+C2lTL1i7+JXSsQmgqTKU2j7DqtA7tbPjJxv93Q3NC6nc7arbMNBn+UzsWtmgsPM/Iu6qTnUKcnGZgdCKABdw7zv7t2lmr1hwMrlCKMnx8DKrc8jH9yOwlggbIqDFKU+nK9l+pGOmq0kllLCCtJ9UeLjXLaPASM4ai3/tbrWH8ojQBmhqThJM+1g0rYRWPpeUstlQd3cNEYQn1DOvdj1sD0Q0Q+LsNYNcxWvG84dQMIvBJzFpOdk0p1JACLaIAR+swddzl0BQeN7cKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzH2AXF6wZ2geie3ElaMTpTH+sb1YH5ncsADnPXMFeY=;
 b=0tO/cmCQEJYQ+eFPm/DrOwQR6/mhHR/+kxfTehslWMpt1Uk0pcyLnNDrVBZCkVgM8YzWMESNcUhzeNSYccSDy++wlh2q5x1bIAHHh+WkseQfMS5oNnM7wKz1RDp83ja9HZTObqxdhlyV7mhUvZ0ARZvl97IYF4n/r+CgsFiTUXQ=
Received: from DBBPR08MB4428.eurprd08.prod.outlook.com (2603:10a6:10:ce::21)
 by DBBPR08MB4839.eurprd08.prod.outlook.com (2603:10a6:10:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 12:10:51 +0000
Received: from DBBPR08MB4428.eurprd08.prod.outlook.com
 ([fe80::59b6:8468:7c17:b23a]) by DBBPR08MB4428.eurprd08.prod.outlook.com
 ([fe80::59b6:8468:7c17:b23a%3]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 12:10:51 +0000
From: Ash Wilding <Ash.Wilding@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWpwMtpf2reu1cBEaQzJxkZyPH86mh66MAgAFiLYCAAQPggIAAwV4AgAAXwACAABiPAIAADkcAgARvegCAABLxAA==
Date: Mon, 26 Oct 2020 12:10:51 +0000
Message-ID: <BF2E5EF7-575B-4A8F-BC00-3F2B73754886@arm.com>
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
In-Reply-To: <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Microsoft-MacOutlook/16.42.20101102
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c09b70d9-fece-4685-7e36-08d879a84767
x-ms-traffictypediagnostic: DBBPR08MB4839:|DB6PR0801MB1781:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1781610A645539A2A28D2B67E9190@DB6PR0801MB1781.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FSEdRFTpu/HwG37CPoi6V+OrMIcdYe8FrA3T3uW3JE8d27O78KtXNfBiXxglROVrvGcSwNFX0usT2wvro3kwwacdyae0kLDpn7OFVRQn7r4GAGiC9r6vt+qa8zMFy2bZb4OgqzFtyO3oeNyx67kJLFHY7iqR/K3rIkcGZZyUjbOBP2lnU0JjleT6zlAz/Ld9vj6wjCDRMo987ac7NCnrc1Wo+bgl7W1UyvATqLlgpvUCARNT621ZdYJvr7Czw7QUgD7wWcbijthTl4MaEqT6pY6MulF89M5Ajyjo7ggltQYl2FkmpTBddgWvhIGMqc008JNFL0j1GPWwRlxis+erByOeEAg2CZe+n0gTvj1tBsM3Kb3OCLvY+rrE353Ub6EbIvrpTrbB+j93fRYe6tifMw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4428.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(316002)(8676002)(110136005)(54906003)(66556008)(2616005)(966005)(6486002)(76116006)(186003)(8936002)(33656002)(66946007)(71200400001)(478600001)(91956017)(36756003)(64756008)(66476007)(26005)(86362001)(2906002)(66446008)(6506007)(4326008)(6512007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 d825Mk0SjCof3rLHSy1sp0DDdLqkt51SL57eE+jBXs1dO4M5lJn3vGNHGXfRtjmLP1emTjq2h2JaTwYQhwur6h2MgNjsPc5fhZtwzc+7WefxG4aN4wJVo5+cZEgPauzWOkhnmgtjQXh99vADFuKgWJUgNbPjgMpZbZVfB8eBbGLvkhiNSEXwEbQFO8wOwIXXuoQWFehD0NVvnLMVcSc7OfA95jzd1fadIYd/yNuNki7eIbvxLZHxCv7hCP63cQDSv9ismbfuCMotk7wjPgNFCdJM0gEQ4CLJ0PTSMPmuVXadd6LNWW7dsb9eB+Z80XwfiYYjUSUfb40eN7BG7dYL03CUbfWpYXuprFJ6e2uSEUaLR4B9YEETa9xqoEKbicSO7yV8+i0tEdazcZZ5i1b3ojuI6NfNB8yz71AOqG6hTZlYrE6QOYkEnJXDzgdg/tv+Gyvyv3wDE+8tHOh6sEud6dM1qQrQNytil3snGyJbQrNrwSvfwW9bEgYcNNKrkQYp77OOI19kHS6SEeFBceK1w3u8R6SIoVkfvBjECuEG4MBshv95uR+yOi5gvx0oAiI6Z/ZnnhXg9E9LfMKDiWidQPBmNy6Fn9EEi05+R+Rd0A2OAR8+FeoaRzBQMmbJs2ao81a/rptLK6ORNCWO4bJr0w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FF34A7A152DB34BB60C0122779D2AF7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4839
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1c3074a-035b-4866-28f5-08d879a82e8c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2FzVtluKJD9RbLHGI3nKaR76c/cs9PZZRGhQMJObPmb2U7iEJhy1tENler8Pmr8k+q8ptEjmO5ZSorLjklO/CksKdX4XX5Eq1cGlzkJOuHCHUcY64CJLmS4SQSF4X6tfHAemXU6Z5u/MdB936mCWvLfMNyZz/ZuuEvKeIDVb1wcrXpEQDNTjIqHZWAoYXILZF8oHCDAWq3nbo9CKdS7iIhIIggL1AB3ghnlJeK2Y4OJJdm+J9FgiJEf9hlSPf5qSs2FFaCdImkQbTfPx1iNYHEfscrFOvo/hQGJivigAY/GVSjZfiiaGijHGZ8qxoQmNhFaLenHX0IcABKGNLM3P93m1cvfXfek0SD8KEaiUZbgfcx2i5EO5qmOtwvWii77u5AN5jtNzdpHeluXFdTnA78MaGPS5XiohccZSTsSdUueJfKJxoznZgRUxgpE43NQxgON/IsyUAiFYxih1rSgnhtc5oOs/FIK71x3pKELzrOE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966005)(82310400003)(8676002)(82740400003)(8936002)(47076004)(6512007)(6486002)(356005)(2906002)(26005)(966005)(4326008)(107886003)(86362001)(478600001)(6506007)(81166007)(186003)(70586007)(2616005)(33656002)(110136005)(5660300002)(54906003)(36906005)(336012)(36756003)(316002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 12:11:33.1627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c09b70d9-fece-4685-7e36-08d879a84767
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1781

SGksDQoNCj4gMS4gYXRvbWljX3NldF9yZWxlYXNlDQo+IDIuIGF0b21pY19mZXRjaF9hbmRub3Rf
cmVsYXhlZA0KPiAzLiBhdG9taWNfY29uZF9yZWFkX3JlbGF4ZWQNCj4gNC4gYXRvbWljX2xvbmdf
Y29uZF9yZWFkX3JlbGF4ZWQNCj4gNS4gYXRvbWljX2xvbmdfeG9yDQo+IDYuIGF0b21pY19zZXRf
cmVsZWFzZQ0KPiA3LiBhdG9taWNfY21weGNoZ19yZWxheGVkIG1pZ2h0IGJlIHdlIGNhbiB1c2Ug
YXRvbWljX2NtcHhjaGcgdGhhdCBpcw0KPiAgICBpbXBsZW1lbnRlZCBpbiBYRU4gbmVlZCB0byBj
aGVjay4NCj4gOC4gYXRvbWljX2RlY19yZXR1cm5fcmVsZWFzZQ0KPiA5LiBhdG9taWNfZmV0Y2hf
aW5jX3JlbGF4ZWQNCg0KDQpJZiB3ZSdyZSBnb2luZyB0byBwdWxsIGluIExpbnV4J3MgaW1wbGVt
ZW50YXRpb25zIG9mIHRoZSBhYm92ZSBhdG9taWNzDQpoZWxwZXJzIGZvciBTTU1VdjMsIGFuZCBn
aXZlbiB0aGUgbWFqb3JpdHkgb2YgU01NVXYzIHN5c3RlbXMgYXJlIHY4LjErDQp3aXRoIExTRSwg
cGVyaGFwcyB0aGlzIHdvdWxkIGJlIGEgZ29vZCB0aW1lIHRvIGRyb3AgdGhlIGN1cnJlbnQNCmF0
b21pYy5oIGluIFhlbiBjb21wbGV0ZWx5IGFuZCBwdWxsIGluIGJvdGggTGludXgncyBMTC9TQyBh
bmQgTFNFDQpoZWxwZXJzLCB0aGVuIHVzZSBhIG5ldyBLY29uZmlnIHRvIHRvZ2dsZSBiZXR3ZWVu
IHRoZW0/DQoNCkJhY2sgaW4gNWQ0NWVjYWJlMyBbMV0gSmFuIG1lbnRpb25lZCB3ZSBwcm9iYWJs
eSB3YW50IHRvIGF2b2lkIHJlbHlpbmcNCm9uIGdjYyBhdG9taWNzIGhlbHBlcnMgYXMgd2UgY2Fu
J3Qgc3dpdGNoIGJldHdlZW4gTEwvU0MgYW5kIExTRQ0KYXRvbWljcy4gV2l0aCB0aGUgYWJvdmUg
d2UnZCBiZSBhYmxlIHRvIGRyb3AgdGhlIHJlZmVyZW5jZSB0byBnY2Mncw0KYnVpbHQtaW4gX19z
eW5jX2ZldGNoX2FuZF9hZGQoKSBpbiB4ZW4vaW5jbHVkZS9hc20tYXJtL3N5c3RlbS5oIGJ5DQpt
YWtpbmcgYXJjaF9mZXRjaF9hbmRfYWRkKCkgcHVsbCBpbiB0aGUgZXhwbGljaXQgaW1wbGVtZW50
YXRpb24gb2YgdGhlDQpoZWxwZXIuDQoNClRob3VnaHRzPw0KDQpUaGFua3MsDQpBc2guDQoNClsx
XSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdDtoPTVk
NDVlY2FiZTMNCg0KDQo=


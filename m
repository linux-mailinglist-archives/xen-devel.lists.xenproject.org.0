Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B4C2FB8C
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 08:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155571.1485032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGBoy-0000Ac-EL; Tue, 04 Nov 2025 07:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155571.1485032; Tue, 04 Nov 2025 07:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGBoy-00008z-BN; Tue, 04 Nov 2025 07:51:16 +0000
Received: by outflank-mailman (input) for mailman id 1155571;
 Tue, 04 Nov 2025 07:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0gP=5M=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vGBow-00008n-U6
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 07:51:15 +0000
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c405::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 015991e5-b953-11f0-980a-7dc792cee155;
 Tue, 04 Nov 2025 08:51:00 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SEZPR06MB6060.apcprd06.prod.outlook.com
 (2603:1096:101:ed::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 07:50:53 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 07:50:53 +0000
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
X-Inumbo-ID: 015991e5-b953-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fl8jtECy71FC3NObj1odYS+78KJ7ek287xIyPgIvPZ9wRNc8mKxqV9UNkLq4tZxqGN5f8M5GYhPL6jWlpaNtatkpPjDXJF5YljX2+hNBTmN/svEohIjQlZ6kUtlWsJHkCts4kyio+Y9WVne2HjOg44CUUpGrby5B18MTpEbBWYRYGGI+GQFS90b3TF4BBqrdsvDkbYRaSdNIp9TYmpU9WnwwWN+BHFDKbiwkhKLZ/QBAb8lypGjw4VnbX2IkWk8HnE7oowNczrBuD3iUyWz+TGPuqCIwGUBmjAtPfa1I4Xno21opRw0VrTWJWgNaH9A2bnLxMNwbeI0AfCOlFp/Gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kvm+t/xGsiM+lbZlrTAwyM+EuKzV8yz6WhcROFyS78o=;
 b=scbDI8RzQ30zbgII8g4GWrDvKVuEi19ESap5T48h99izYzlCFyK6SnwbBWtOAm3Ud96tV6pegB5SmyMMjAwo1N2+tapoGz966nx41oLeibnF+aVpWPKx6AVVP7RN3NnDNl2mkUm3qbWY0XHKnZw0UgSoBFm9PYkFSRZ+8ES4EwuG6dXToflr7HDLH2DCtYkgUOhCMKUqImQG04613f7czAnYkAr2RVy0e+SnWRA4vYZYFLvYqh/1zOvAYco9ybYFj70e5D/nwRJk8GMbyxeviFypyox+c/Pzt201OsRXzyQB4K7BfcrEZoS7+Xn4JzejalU0UstXMreujkByP14x8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kvm+t/xGsiM+lbZlrTAwyM+EuKzV8yz6WhcROFyS78o=;
 b=n+gee6Ecig9qWGjyt5xQat2alEdjO9KT1X4F+CTHnxpUfrdTd9yy3ND2UwqgbSE7asmZGeuSIQ2kCwskMdcCIIEvYXpPwN62X4qeUnZOvH6yiQoaemAXNe8x6fk65I43FVoFnTeRpTZHPCJw2K+PXShlkDF1kLKD4/ipvxsmyk66d/MT1QAtTj14vyVtg2tFgNwjPaijlVcRpLtle/SABDW5BfQDwsrLHkxZrXmFQik78Ryoxgeqt+5M39w5kQo8U17TMcRNW2NIe1peWV05KcSRl46P7+lp9m/kd65z/Y4Mmt5rRFffuGq7dAueYyyw0VBbdjCi9FUtflKHHNwB9A==
From: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>
To: Julien Grall <julien@xen.org>, Mohamed Mediouni <mohamed@unpredictable.fr>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, "Driscoll, Dan"
	<dan.driscoll@siemens.com>, "Bachtel, Andrew" <andrew.bachtel@siemens.com>,
	"fahad.arslan@siemens.com" <fahad.arslan@siemens.com>,
	"noor.ahsan@siemens.com" <noor.ahsan@siemens.com>,
	"brian.sheppard@siemens.com" <brian.sheppard@siemens.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: Limitations for Running Xen on KVM Arm64
Thread-Topic: Limitations for Running Xen on KVM Arm64
Thread-Index:
 AQHcSVi3paxtnyIgIkOf6jhuJCbvfrTalv6cgABtkgCAAFoJgIAABxcAgACWJ4CAABonw4ACEJkAgAKjdLSAAEALAIABEzaE
Date: Tue, 4 Nov 2025 07:50:53 +0000
Message-ID:
 <KL1PR0601MB4588FE9914010324E0CFE328E6C4A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
References:
 <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
 <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
 <01527182-ccef-43a5-be55-a5450eb7919f@xen.org>
 <KL1PR0601MB45883069D3725975B49761D0E6C7A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <0fd2b8e4-bdea-4d01-a2dd-8d2e4b37090d@xen.org>
In-Reply-To: <0fd2b8e4-bdea-4d01-a2dd-8d2e4b37090d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-04T07:50:52.767Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SEZPR06MB6060:EE_
x-ms-office365-filtering-correlation-id: 4d6da19e-dc39-4ad8-538c-08de1b76e177
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|31052699007|39142699007|376014|366016|1800799024|8096899003|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kugjGI0M32SyfCQguCPGRhdK5Z7KVHktwIbQua+l7IYSa0HYoHmKGmZm0v?=
 =?iso-8859-1?Q?uMighUHe014++1qimF8L9dvfId/s9XBd2xgU5ZmEhMMKfbLuRjrsjA0Rmr?=
 =?iso-8859-1?Q?mBrhon/TDa83JZ+E7/CNjd7pUU51uwQdS+VdBakqKgwavVwKIHiZD1mLCH?=
 =?iso-8859-1?Q?Asj+r9EQMcTh/tdq8c/6WdivNpqvNfeyBtTPIf8tPJdlicSHThPaT4/ehq?=
 =?iso-8859-1?Q?EMmp9Q0hqRRT0lpyLNKc2M2l/ZAwZjVtYjbRUNaL+F4WzBkDE2LC6NO+rf?=
 =?iso-8859-1?Q?ftT/3SN0Ct5kQH9c8PsRR1f3CuXOWm7BedLKcmXX8jerkJT3fQM7gcG3Mw?=
 =?iso-8859-1?Q?X/qYi1iWcCvvXuWiBwnFq+kGHwGOsSERhyhrRqCIFzGuADb6doY99kRoKp?=
 =?iso-8859-1?Q?Y6tqLWhLVRAJ/ZLUJPmoHLb9W+iOt27zSxySxDEkkPD0oOYdk9/gqmS6Pu?=
 =?iso-8859-1?Q?3783HfvFYA0YNP9rVvIJWNH1wa0yx1RD6cgRPZiy3+G7QAX9AG11JCfnNF?=
 =?iso-8859-1?Q?9M9Bq5Ho9U0QjWFcHde+5JV4jZNM5nrXF+Rg5Jc52urA+IGyfwu5vo/to+?=
 =?iso-8859-1?Q?MKrTVT/6qcAQGP2dSkyanKLJwddfkV2sD/COPaGsKsYgqjMSvHAYvvdGLs?=
 =?iso-8859-1?Q?9c8f+oKFrZwzvvmvfkcvlNB9vRyLPRT3tKCsmn/L0SXw6fzO6SumNj3tQw?=
 =?iso-8859-1?Q?ZGe1fQ8gChISb720AOWUSDxTnxN/plKOSl4yz3r7CS+g1wwuQsDaZwYyRa?=
 =?iso-8859-1?Q?0yLa5r+/Eqk8WBdNLopqh3wthfVJ088idqWUecyR8XpwBEJClgIi+K7rEY?=
 =?iso-8859-1?Q?sdTxY7xawRCRPqwhD0LHdY4XiSzRl1IZpVEuEYs5t7jYs94ajmHwldhuNF?=
 =?iso-8859-1?Q?tAtxQx59YCzW6mkL8tDl2VeBeYS9I1svJyd+xxiW3qA7DQlG2/UR9bpPUK?=
 =?iso-8859-1?Q?OGfvWfFLmwCarc2kYv4MhuQuM52jEAo8RxFns5S38Prk02XBQ7RCj8FpO5?=
 =?iso-8859-1?Q?nEMYN05j+fMHXOeCX92RJPynvFwy6bvVNwbtYeOgbhTf1ox32YSsG5KWGo?=
 =?iso-8859-1?Q?C9VZ0wwt9AWkfDyllpS1d9CN7AAlATZ8Gfa2UZHyU9tLcjE/q8lmRo+C6T?=
 =?iso-8859-1?Q?DGTQEidfh70L9s5W55KhTi5H0MPUI5SZDL8xX1kjkowq7063KRd8ic7wGz?=
 =?iso-8859-1?Q?5lEvX/5GFp6cAZSbge8cHwZqhTo0KFPkVJHfBjrnk5iBAFpV/Pw7JrqdKv?=
 =?iso-8859-1?Q?9ELR6B8UpKh5b1MoLN+F/eDJQwi+fKUnr6aFL3GsgVuYCL1vogOBUkEJ9h?=
 =?iso-8859-1?Q?DBNo/Ip+sI+0vG/EDCsvhc565SFBE86fqr1Z0uRonq5ann9mxs/AfoAUY2?=
 =?iso-8859-1?Q?56DnbzzrTG7RuxmKqlQQz7MInHtWfyiDmz7OBJYKF0oeiObyR5w+8cqjAl?=
 =?iso-8859-1?Q?uqOsOFjMHm3q0D8cVYkFbP4XVHwoe4dx+OF7xtWgHCkhCvHiydHkEvgwvD?=
 =?iso-8859-1?Q?UYtZVO9XWNV7wq/m/DVn0bQMSiKoGFM6OwGBsPLsaD9Xo5atU7rzW3jfDv?=
 =?iso-8859-1?Q?kP7Nxr7RaspqhAzuSnefydbkD5wE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(31052699007)(39142699007)(376014)(366016)(1800799024)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?isRPdAkViJ3thg3dPcytPxVJFOzAYd0cf51oIlSeO3TyFyY5Sq23S2OZ9+?=
 =?iso-8859-1?Q?QtCiUQo1S4SYIH7/uaD083QLo1zLQzPxG96rfWTUMp5NTorc2PLvsNR7cF?=
 =?iso-8859-1?Q?0cd3a5IhYgVwaj7sjqrfPfxfvsaVEvDWgX0wBohhCxRmNIJcGUvuHPldJS?=
 =?iso-8859-1?Q?Mddkv5LsWqLuMItgs/iMRH5Y2QwnDfx3c4+qHZMixHPt3x8lw4zmIj2+T2?=
 =?iso-8859-1?Q?oGfioqwc0eopfWZUf1e1eKJjAlqKA09YQ8u7D96cA3SDPzsrcR96GJ3lOu?=
 =?iso-8859-1?Q?kj8qVcau5jO4rt0Brrj/D6RXeE+dwed/m+1xGM+HZ/+eHl7gldeuXwVAXS?=
 =?iso-8859-1?Q?LLyZxvw32U9YKr2L2IZBGaOYCUDvfhhReqyzWFKc9nd5dmvYoTMA32QAg3?=
 =?iso-8859-1?Q?Af81AWVAlkA0DyFRyzuTfxg0PDwKIzKx771NaPxbYAc939QUSS0hTd3SZG?=
 =?iso-8859-1?Q?xRfgvbti5jyF9fAzCHeoPt4BRbHHfP4VUfMue1RRi9dhU5t7262CzEt6b+?=
 =?iso-8859-1?Q?fml4a1a+pentyDOouXS40TslFBQ7NLpAyNSLgOVSVoE7hOOD8M1hRp3A0q?=
 =?iso-8859-1?Q?hgOiE9JgZGNx9sghkrEpYkTad3OA2U+RZp5E76WA9JX60V4vvUxIFAHLry?=
 =?iso-8859-1?Q?kTISBmtuo30sXjaw1tSe2A/0NsNCOnBFXRuTC+nDFEX7AgMFuUTPjfOjNR?=
 =?iso-8859-1?Q?r6kfH4M+iV5LdhEuT5+fmzo18fUo8RbuwURsfMUnkVWc2F7Xx7t4eTkstO?=
 =?iso-8859-1?Q?dhF3YtkTLWXuGSnAe9PoupAzKbwg3IIOt9MuzIWqAjS+sTXUJK3XbdW4Y4?=
 =?iso-8859-1?Q?fN+fVCRXK+b+Bx5S1pep8yd1JhqUzY0k2Oon3eyWr56GrOIMheTYvGBzDq?=
 =?iso-8859-1?Q?f5MEsCRJVaZfdEDzkcnYLcTAHx4uU6/dIa9rRONHePMzZeuhAsnpEN8O0W?=
 =?iso-8859-1?Q?nLDWtrtDRsy2WCz5Id4gI3YgTd3iVYj/G7iVg/gGJz9zfRRt30K3UGJw99?=
 =?iso-8859-1?Q?lUxA7rLdoBRs5Mcs2vNJdnuQwAayjqgGOKePbGbk4zG+jUgW9+pkbeeB8F?=
 =?iso-8859-1?Q?bCRuOqVo7ryjjqNLD5gpxJneuGbzjPlO7Ce86SFBextx8NBNfpN6JeOOe7?=
 =?iso-8859-1?Q?jRkpdzl4FRMMQYZVeGEGhzzOR+zgYiT/AHUS8DY3xxYQCIohICya/U0YEj?=
 =?iso-8859-1?Q?SFDmxRfZ+U6aqtDSCTHf75J6s0dsTD9ZCZH+NHxCzRSyVuMH93N3zm0xAx?=
 =?iso-8859-1?Q?3zkwRv+THmR86Xh2hh3fuBQwIv4de1ZUzAD1Xo8Wiw1hQTiz3YHshouN13?=
 =?iso-8859-1?Q?X10asBrC21uB7XuhAYZaOnWhrxjN2BXkwsXEv7isaLWqUBHELYobhp6M8q?=
 =?iso-8859-1?Q?7ofQk5oA0CUtmPW8M2yWDr66k05/XPUelHVCUHBYtrPtkWsjeKnbLJL29i?=
 =?iso-8859-1?Q?ju9TBO0hA3M++m+5TKvRuVrKQ9XXmLZ0KAJEmfzvU+8CCLD7wZIXVi1QxJ?=
 =?iso-8859-1?Q?piFYpmF0IFvUHVKC/OKXbKE/KGLLfl+m5E5rMHmjfs7/cOh92P5uz1B0ul?=
 =?iso-8859-1?Q?B3B2H5Zy71SZb4qm0la9NiI1M1KaYI6oLFRaZorwjXFUQ34BicpwMJtTrY?=
 =?iso-8859-1?Q?HsEYDsMQpuuAqk1Kju79rMvlPk2fZI2YTz?=
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0601MB4588FE9914010324E0CFE328E6C4AKL1PR0601MB4588_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6da19e-dc39-4ad8-538c-08de1b76e177
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 07:50:53.5836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yHn2z9mFiPGIoyy5tFjtCNZCAw9iCQOPOcn6cZU0+7SWTmuK9yRGBPv0slpcJnUfIkFsWYNfikHHZhbcNkJWKA0CO9dVmBjJI532yeNX5oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6060

--_000_KL1PR0601MB4588FE9914010324E0CFE328E6C4AKL1PR0601MB4588_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

> Does this mean only one ioctl call will be issue per blob will be used?
Yes, one ioctl is issued to add all pages to physmap IOCTL_PRIVCMD_MMAPBATC=
H_V2 then all pages are removed from physmap as a result of munmap().

> At least to me, it feels like switching to TLBI range (or a series os IPA=
S2E1IS) is an easier win. But if you feel like doing the larger rework, I w=
ould be happy to have a look to check whether it would be an acceptable cha=
nge for upstream.
Thank you. Yes, I agree. I just wanted a solution that also works for older=
 CPUs. A series of IPAS2E1IS can work for older CPUs but there will be a lo=
t of invocations (222815 * 4K, using the same example). Although, each invo=
cation would be much less costly as compared to VMALLS12E1IS, so still seem=
s like a viable solution. I shall evaluate this and let you know.

> IPAS2E1IS only allows you to invalidate one address at the time and is av=
ailable on all processors. The R version is only available when the process=
or support TLBI range and allow you to invalidate multiple contiguous addre=
ss.
Thanks, got it.

Regards,
Haseeb


--_000_KL1PR0601MB4588FE9914010324E0CFE328E6C4AKL1PR0601MB4588_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi,</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">&gt; Does this mean only one ioctl call will be issue per blob will be u=
sed?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Yes, one ioctl is issued to add all pages to physmap IOCTL_PRIVCMD_MMAPBATC=
H_V2 then all pages are removed from physmap as a result of munmap().</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; At least to me, it feels like switching to TLBI range (or a series os =
IPAS2E1IS) is an easier win. But if you feel like doing the larger rework, =
I would be happy to have a look to check whether it would be an acceptable =
change for upstream.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Thank you. Yes, I agree. I just wanted a solution that also works for older=
 CPUs. A series of IPAS2E1IS can work for older CPUs but there will be a lo=
t of invocations (222815 * 4K, using the same example). Although, each invo=
cation would be much less costly
 as compared to VMALLS12E1IS, so still seems like a viable solution. I shal=
l evaluate this and let you know.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; IPAS2E1IS only allows you to invalidate one address at the time and is=
 available on all processors. The R version is only available when the proc=
essor support TLBI range and allow you to invalidate multiple contiguous ad=
dress.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks, got it.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Haseeb</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_KL1PR0601MB4588FE9914010324E0CFE328E6C4AKL1PR0601MB4588_--


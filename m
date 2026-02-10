Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBvsNR5Vi2k1UAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:56:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2511CD24
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226563.1533072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq5o-0005Pv-6v; Tue, 10 Feb 2026 15:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226563.1533072; Tue, 10 Feb 2026 15:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq5o-0005Nd-3h; Tue, 10 Feb 2026 15:56:00 +0000
Received: by outflank-mailman (input) for mailman id 1226563;
 Tue, 10 Feb 2026 15:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpq5n-0005NX-KE
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:55:59 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc71c8b8-0698-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 16:55:57 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5175.namprd03.prod.outlook.com (2603:10b6:610:a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:55:54 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:55:54 +0000
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
X-Inumbo-ID: fc71c8b8-0698-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vi+j4kAP0EZ6lkKcEYZpFLHZ8VvurnKARfG/NDuSynQEV4+TCJqM9D/AeAH5f30FAWGQNRe2HCEa6JACJb2KNkc2r8b/0Y81iNUjsnDQ7cvbsGDBHNBavIiC72kQm+QCRPOliZKEsMOO3Tts4NWHiOe4YL7t505YR7WC5yDeGpO1hoQBH2DWLAGJy/OWyDMYSzaB71x1h7TSQ2r+jPgcPkag6Na2opzcA3iXLMK8KIhHv9JaNt/AMhpd74e0HpPXPkgZn1uYJxYd7mTtDn2nXfmb8+Bqp3lKoyUxJYHbSYM/KRG/6Hi25h9TziFDmrSp1Xxn09vJMcTnJcV0RhhFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU/OUTdKK3QclasN6C8ruoy+zrF4efU83FNzRvbIbTM=;
 b=lK11hSu/SuRQc4Krz/5TLn/qZN4g6k2UBmyekrMb/QA85dDY51n1TSnDYkWUKBUjaz9PmF0kukKTstKfWp2zldq4t2akamcuVZs2tdJXeOCYzKFAo8QVaYF9xfjQ061Kfk/RtGlMCWEJPBElXS+2VsLdoe/A/+jXd2IPk3+bW0lAPoqwSbyurnzbw0zG2FmYCxvM79Fk4Y8U74ApgERepVXeoEqDto6Yiyr5VwOqN/RcgTF2GHwlxUQ2IHpVwERZCLauZoJ3TYxUAuntA/kf+efZN9YtkP7pFyTj3wloTS47a57Y8hi/VNM1WJCRPYm2OSJgf8embxp1HU/Ign20iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU/OUTdKK3QclasN6C8ruoy+zrF4efU83FNzRvbIbTM=;
 b=cAM1wMXBhJEO6rcLUnkiqWpvxUI4gXJ86UQRgDLtmJ0a2SqJTu5lIBvaGNCFAAv8o7aIYa6RKcZhdf3CKZK7xQHla9W5NDEoeWZKZYTgewemtdtGg5i6RUxSaEcZX83UQVWSdfKFpWcvS/lXW206C9l+xSJQu82ugl5rqyvbgRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 16:55:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
Message-ID: <aYtVBuHVcfZE-L-a@Mac.lan>
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com>
X-ClientProxiedBy: MR1P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbdffb1-f07d-4277-f92f-08de68bcdf5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnZNWWVhSE5HSDh3a1daVEZNTTVLL0tSUlpDamxOdVdsQTNaKzlyNWNnMWtw?=
 =?utf-8?B?TTcyT2FyYTcvT1JacU9KdkdKZ1hXMmFzNEwwNzEzZlRCdUI3Mnp4U3pGTzJ4?=
 =?utf-8?B?dldqekdKY1k1Nm9RUVZsOG9qdDAvYmlidlloSWE1UFdCakpESGc5RG9RVjBG?=
 =?utf-8?B?ZCtXVnY5OHViRklrdTR4WjZjcHk5VEdTd0t4ZmQrRVFJZUlPZjQ3ajlVeFZl?=
 =?utf-8?B?NEIyTFRTdzQ1aWNuZmNhbHM0RllLNWViY01WMnpYODZnV0hUbWM1c3dOSWxv?=
 =?utf-8?B?SzVqZUFSWks4UUlQd1hqbUoycS9mTXB4b0F2R1ZzQ1ltUUFlaU92QS9Dckhp?=
 =?utf-8?B?U0hSVTB1bHhGWm5odHVBWlJlMVZZUTVmMEJnU2ZERkVDL3lmUlZQTHpkR2Jt?=
 =?utf-8?B?U0haSXlNQVBWQk9od1pLSUJQcjRoamQ4b0pxWXBHd29sSk04WTBvN0FxMWYz?=
 =?utf-8?B?V2t2dG8ybDloaUZHa0lXYktrOFdGOVhvS0ltbTdPQityc1pOY3owL3ZwQmRn?=
 =?utf-8?B?cUlmU2RlejFUN1pXK1ZZTVpZOXFJVG1DMGF1NE5LR0xQK3A5Q1AvOGZTeVBt?=
 =?utf-8?B?REFoVzNEbitmb2M1ZVRqNVVJTVVrR1BGMVJzZWZKMHRETEVPelY4eGVhTzQ3?=
 =?utf-8?B?MlNYYVJ5WGJPTWxZbEtIRjZtQ09oYm1weW5sSmRPU3JlNHlJVjFtL2N4aDF4?=
 =?utf-8?B?RjN6MitOd1phY1Q0UDZobld2YTkyVU9wcjdOb1RnVWJMVWFVRjZjdUZ6T1I4?=
 =?utf-8?B?Rll6NGFmbndKc3ZrbC9jODNqbEE3ZWpYU3UyR0dMWFgzQkxlVnlYTEZzVzcy?=
 =?utf-8?B?eS9Da3hmc1ZxanEyRWs2ZDVOVXFqWEJFVzdHNjBySjIrb3pRY0RVV3IwMmFV?=
 =?utf-8?B?SHQraG03a2ZseEFlVFliaFpVRnF5UVBnQXJzZDV0RllQMFVvbG1JTkwzbm1x?=
 =?utf-8?B?dkRZV3h4WjFKeFRtd2dXUmdHdktqYzRtbDN6N2w0RVlud28xODRjR0RCVnht?=
 =?utf-8?B?d1V5UWhGNWs5dEVkRE1QcUZaRFBvMW1nZlZMWDZYRVVrTWN2TnJTZS9mbi9T?=
 =?utf-8?B?cXQxTDRqaHJaNlJhTHptVDJDV1Z6dTBEbE1aSWNxdTZEKzV6OXNZeDdNbHN5?=
 =?utf-8?B?V3J2RDJnZTNUSHczK0xiNmwvNlIxWXRSRXNaSXYzQWxUeXJlOFNhMTBRU2hV?=
 =?utf-8?B?NDNTcGpQbFF2ZHRhbXlNVnNZMUVBMEpRaENFaERmK0JZdjdXTDRwZTVBUzhR?=
 =?utf-8?B?TlZLbStLeWVFWHVIRk5DeHlHOC9XNk44d1ArTytqZzNleHdjRlUzbURsYXZ2?=
 =?utf-8?B?amtHaUNTRi9udG5ONXdONE9Xb0UyMHJkNzhHZnF4SlJXckFVeC9BZVpmTkQw?=
 =?utf-8?B?MnE4NTNiNStWT2FBSWxncFdxZDNjN0hWTVk3aitBSnJvVkc1U3lsa2oyZEYw?=
 =?utf-8?B?bFFGOUUwYlU4RVJzcGF1eHlVdytCRjBuM3BndEJBSUN3cEM1MlpnT3l4YnBG?=
 =?utf-8?B?ekx6Z2NLak5YOTNIUW9jay9YbHU4YWo3S0h6NVNxT21ITGlrTjNLSTV6Smt2?=
 =?utf-8?B?L1RXLzNmc3RyaVFtTHlkc0Foamk2WkRCWjd1KzBXWTZ1eWFtUUtJaUdKZGIw?=
 =?utf-8?B?bUh6OVFSc3ZKZy9pdUpTVEc5QWhzajNzck52ZVo5aG9EWUZzME1MTndsZExS?=
 =?utf-8?B?bjcxMDNLbWdqTHdOMzNPRzZzNktSR3FoZElxczRGRUlBVHpXRWUySWsxYnhj?=
 =?utf-8?B?ajNKUk9BeUZnbHMvWlFyeDBpczNMcWE2K0JSUWRZZWtOZm5sbWY2R29oQkgz?=
 =?utf-8?B?b0dHU3pDSHc2MkdRcHEzWXdjZTNvVGtSaW8yWGI1QlFKbzYwZkRtYXpjejRM?=
 =?utf-8?B?Q3NqM0U5M1BWbGxGWHpidlJPWWRxZElwYjRMLzhid044ck14UTFTcTNjQ3Bk?=
 =?utf-8?B?dzRTc2ZQV0dFMk1QdWhJakZMbEppeWpYcy92TEdUc3BCQndyRVExNCtCUmlM?=
 =?utf-8?B?M0Q5dXJHdE8rRVNsMC84RW9JR2ZBNFdXcjhJeGZJNEVKOEgyNnVGeC9lWHhP?=
 =?utf-8?B?MWs5aGRpV3BiL2l3QmlHY3Z5QnNDK0Y1cmMwRWpFNlUxSkhFWnMvZ0NHWW5y?=
 =?utf-8?Q?zMhM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCtYSXF2VjlIdklyL0lIWUtCeGcvOHpmMWo2VzJOeHpTdExuQTZZS25McXc4?=
 =?utf-8?B?WDlLR1ZjRnE5OG03WGU2NktqWm1sQndGeHVJbXB1blQ5MS80ajNVbWlCQlRs?=
 =?utf-8?B?dlcxc0FTUVpEVlBjYTdDaXN4bnExaG1WUDJNdDQvS0p2ZVJ4cnFuc0FJNGRy?=
 =?utf-8?B?dTV5K2pnNXFiRVkrNGlkblB4RjlCNXZEblJlY2Zuczk4RFg3Tk4wbFM2ODF1?=
 =?utf-8?B?L1psNU5aVEtjOHJFQmZWQ2FudmYwb2lPWVdwaThXaU9RczdNb0hEREp4SGtx?=
 =?utf-8?B?WEQ1S0VCQ2E0aFdJbFN4K1J3Q2xDVjZNL3dOTDJqbjlIdzNEMmJndTQrbDFS?=
 =?utf-8?B?UDBHaXNkQ2Q1OUgyd04ramV1Y0RabmhlVU1qRWtDb0NVOVVwNlByY1ZkYXNZ?=
 =?utf-8?B?bnJ6TnNzUnNpYjZ5SGJsUmJGMDhqY2RPbDdpb08wR2d3citEUkUwYThtUDUr?=
 =?utf-8?B?N1lHRDhOM3BEdllocjRaaVd3UDg0ZkY0TWhGUHlvMVZLQ2RFdDVINnhIbjNw?=
 =?utf-8?B?RldFaFVzQ2RsUU9nMDEyaW0waU1nWC9FTWVzbU10SmI3Z0dlcHlqYXR5OEJX?=
 =?utf-8?B?QjY5MjFGcyt1ZlZ4U3RMMGthUHllNHBFanloanhtaDNXTGpmdGlDTllWN3dG?=
 =?utf-8?B?SXdqcU5JaEM2b0o0Uzh3T3dBbzBLd0dWYm1PdUQ4WUw2YWQ5TnpLdi9Hc2Fi?=
 =?utf-8?B?YUxEMGZyUFVKQ2hCdDlNeEpmNFBDR1NjUnBUWk9BeDBLWldub0dsM2NLUXRO?=
 =?utf-8?B?aHRYcHB1T0JWa2ZWek5WQ0U4cGJJSEVZck5idUpXZ0Z4SC91N1MydTVYcW9R?=
 =?utf-8?B?RTk0NkRLaUY0NktvZmJuanVNb084UnROMlNnSzlwZWNmZDhCbnMxUXI3Rk4v?=
 =?utf-8?B?dWIrWUFZeTc4TVdqV0FPTlovd0tRbVNJMFNZWG5OUDZ3NTVubmoxLzlhdGgz?=
 =?utf-8?B?dUVUSVpvVU00cEJ4VXp6cExPRnY5SkxMeS9seU9zRjRoUEpOWDBrY2ZwVW13?=
 =?utf-8?B?NzRheGYvUlQrQWtmcjZwS2pLakNibFN0SFhOSC9qSXNncmZ4R3hJRjFEMWxG?=
 =?utf-8?B?clM3ZzFPWlBrMEZNbmRIc2dJd3pHWTRyL01hUldhZzFtSTV3ckc2ZFJmK2kx?=
 =?utf-8?B?dG9EdldhU0RsbUc2MVBva2xjUjhrOFRvQVFtMWp5VmV2ZHU4SzR3eU5TTkJh?=
 =?utf-8?B?L1BxRWNBWGJLTGp3N3lVcWh6azNTRi9iZUpzK242amg3cUZBS1A0NVRKcHhS?=
 =?utf-8?B?QUt6YWJUWjFVZGFqWG9IN2pwanR2RGNPYlhRWS8xVFV3OUdyb0c3UmNwdFBm?=
 =?utf-8?B?UXJWY2JNT3lPNE5kZGxkQkVKQjJsYjE5czZCT2FFblFWYkM5QnNBN1FaV2sz?=
 =?utf-8?B?TUJHVlRlbnAyS2lSZVRyWFVHekpxWDUvM2JGQW82aSs3ZXlFdjVJc1NWM1JX?=
 =?utf-8?B?UEc2ODU4dENqdHZhNUEvVCtBZXpVckRva1h0TW5oSXU2RkpwbVpHTmdwM3hy?=
 =?utf-8?B?TEgzMHpBN1JwTlFiNUZxYTNGbVJZczZ2WHFoQTR1a3JyMVM0YnhVWFlMTzBF?=
 =?utf-8?B?UU0wWlZrWVVKSllMRjhJTEF2Y0hKeWtkcUlJa1NqOUhFVEJGVitEYTJ3akFH?=
 =?utf-8?B?WThQa05vblBlUHFiMWczTG9oRzh3U0cvSjRLNk9ZSGUxMWoxcFoxMTIxNFFx?=
 =?utf-8?B?QnJlU00ybzFUbTNhaUg4emNNT2wzNzdWMnJVbW91cWUzSkFESEpsYldPb0Mx?=
 =?utf-8?B?bjJSeGIyT1NsZ0lWMUVEazRITUpLRU5KclNYNTA0TjFPTzVEUENSVjdLMk4w?=
 =?utf-8?B?a3Y0dEpTeUhscEJQelhBa1pYRHM4SjdWRnZWODZzN244UmphenlrRDJ6cE5m?=
 =?utf-8?B?dkp4R1BQL0t5RUY0Z0FIa0hVQTFoOVJxbWFSMzl4b0I4Y0dUNUJrWittWkQv?=
 =?utf-8?B?T1FuRDQ3eFRCSlBoT0p3V2RuNVFqSmozRlRYdy9BcGJ6SUdtUXRwTitVKyt0?=
 =?utf-8?B?VWljeVhZbjYvUlgyUy9oZnl3d21PZHkreWEvMnlTL3A0aGkwMnJncE5rcXdr?=
 =?utf-8?B?N3NETmdWbVgrNXlQVVM5VC96cmtOZDhyUlExTnV1c1NlV2FOWUthalpWZ2F4?=
 =?utf-8?B?TDQ2ODUwSWg4MytndEFrbmZtZmNSSzBRbkZHY0xKU0gxQW5GMDdRS29ta3dF?=
 =?utf-8?B?VnpFNGxOdmlCS2E2N1U2Z0hsVjcwaVhQK1NzRVlUb2RTMnJ6aURwRTh5dEdr?=
 =?utf-8?B?VE5STTFnZ0VnRDFncmgwZEtaNzJuNTljcHZLdDE0SmZqUWExdkRyQkhtZ0di?=
 =?utf-8?B?d2poN3prNzBIS3hwYVFuNHRwTFJDRnJKNGVLWE9uQUN1NmtsOCtPdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbdffb1-f07d-4277-f92f-08de68bcdf5a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:55:54.5041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Skz7yJ6ossYuWixWzbxEKNolESITqDdx5xHyS+Q5Fo84eV08tMPUjC3ZyirspHEKM3Lv/UGx1k5Hop8DmM5buQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4DE2511CD24
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 03:44:33PM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 10 Feb 2026, at 16:11, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > 
> > GNU assembler will consider '/' as the start of comment marker on some
> > platforms.  This is incorrect with Xen's usage, which does use '/' in
> > assembly files as a mathematical operator.
> > 
> > The behavior of the assembler can be altered by passing the --divide
> > option; unconditionally pass this option when available to force the
> > expected behavior.
> 
> This is solving the issue and I can build for arm with what and further
> for x86 on mac os but it fails on check-endbr.sh:
> 
> /bin/sh ../tools/check-endbr.sh xen-syms
> stat: illegal option -- c

Yeah, I know.  I've fixed the stat issue, but there's a further one
about an illegal bit sequence in grep.  I'm looking into that.

Thanks, Roger.


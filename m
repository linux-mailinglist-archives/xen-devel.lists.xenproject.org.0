Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0664CC5915
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 01:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188504.1509660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVfA0-0004fM-6K; Wed, 17 Dec 2025 00:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188504.1509660; Wed, 17 Dec 2025 00:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVfA0-0004di-3B; Wed, 17 Dec 2025 00:12:56 +0000
Received: by outflank-mailman (input) for mailman id 1188504;
 Wed, 17 Dec 2025 00:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9rb=6X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vVf9y-0004dc-RA
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 00:12:54 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212d5950-dadd-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 01:12:53 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AM7PR03MB6420.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 00:12:49 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9412.005; Wed, 17 Dec 2025
 00:12:49 +0000
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
X-Inumbo-ID: 212d5950-dadd-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i36HzgjFeM+8g0yqy/8ocrvh4rHzRUUhkeBkkJS8bSn77F0YvFcSpVDlzisHI0yOc3vNeD83qw05e6GAd79rsAfaIgAySE/T7ZcQ4j6qdnurNwd0P5Xzf8s13p3PbT5Oi2ZRtQ/4Vmql0CEYCD1/qvPdRJLkDMv6OyMmTzLhjC7755/Tmw8Naz+JVZYQGTfcaHMoZjX5zJ2L/uUjwDfeVeunxEn243QF4+12vGtDgSZuEBKozWdqxMa45t9IX0YEaHIbt2RAU0aekQGoYzuirJR7hcFO3TFb+6k9KVb/Y2wzDSbyDvsB+RP7Ovt29NxdkYSFZp0w7EkcdOwKFyhyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFUbE3p72+wwdKnvgqJdaG/E+aUr9A2b5Hc0E6XhN1U=;
 b=HG1SGW/fAmdq8mrO1UaK76fky+ntCXb8oShmf9R9wtwAeJkObaMKh4Y4lcgA4XpzzC6GF7mdifrkXzFjP9hi17YQ8bZrJ+NPbD0zgG/wjXVTSPPanqzPZ0pkjWoe7cq9kizHl1qJ2FJD257+VYKNlHtZE/jL+w1CIsAzi9MNZA/SSOXi2wkNxU9hzMds7vPTTNWY3x57FRKvWqFKc2g6Td8+a3PV3EbKAHkHbEsmYnxtcupHXf+SSyXbKIks+Md7PzbLPFLvfnde5Di84W6FRLI/wcP/hFSG07x6hSsS6h3EgpLoK39ONLpRcCOlCcXcSyDOhd1BQui17CuLC3P24w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFUbE3p72+wwdKnvgqJdaG/E+aUr9A2b5Hc0E6XhN1U=;
 b=nH9BZHf4tcvWYFlMz/yKqreZkdYwV21vL0rWbh67mxJprspLbzPknPZocnC1K5C2AdrtNitFdHYnd4b9dnzEzuqkwIXGoPS6ATVkQHZr6LhEWkIVED9UM3kiv0/hsvz+OvFQIdubzi8p+b0twmWSO4fxSwMxNY5OUdiULJh/VXoD3jECVFCgqmQVaBXltOQ08fw5S0EMJYtZxYpTcNaOKFF6yuAXk87ziJT3CoMynyjW0hCMQklslYEZha6TMupSr5QoG7PkTLWhhdheqmo7O75duJC7SwRGPJuJw7R8jAcIIYu0jCrlD3OyCgAI1h3CcmJQLWFq9p8ccUxXedIw5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0066dae8-a05b-488e-8dfb-0685e1e9f700@epam.com>
Date: Wed, 17 Dec 2025 02:12:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: X86: build failure
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ee2e801-9a3a-414d-9df9-113f419e02e9@epam.com>
 <63b6f29f-29ca-458e-8d6f-3408e84173e9@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <63b6f29f-29ca-458e-8d6f-3408e84173e9@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AM7PR03MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3b0bce-c17e-473d-1208-08de3d010380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elNuVTFnTXZrMzByTjJWVy91Y1JwTnpjdVhyVnNRc3pzMVNud1RqTU8xaFBB?=
 =?utf-8?B?WHVMK3ZPMWp1YVE0UGxzelJmS2hJV0FVNjQzZ1FkTkxaM2VMSStjbUxzYmh2?=
 =?utf-8?B?cnFDRTJrNXljQ2ZzdUFPcSs4VzJ5eUdiNWZVWlhOMGJzRVlIc1ArSzlwYmdJ?=
 =?utf-8?B?eDVYREVMWitYbXNXWXVxckt3U0twMmFUT1VObDJqdHhDQVN6OVAvaXBLWEVB?=
 =?utf-8?B?Y1ZlRU45eVA4ODNlc2VMZHRBVU50MThFTGhzYmRhZzVFempFT1NVUzQvZDAw?=
 =?utf-8?B?Yng1eDRxRUpJek5RaytYWWpLbUg3UnlHV2lBZ3NQaHZtcFgxWTJqeHJnSTB4?=
 =?utf-8?B?V0pQM3g0U2dEcnRGWmNrM0pBZkNER3hOYjRJb2hWYmVjWGR2QlU2UElwN3VQ?=
 =?utf-8?B?K2EvMG1yQkhQUEw2Q2lpQVdHcC9ra2RRcUdBNlhGdmNkWG42dStkeVJRd2NN?=
 =?utf-8?B?M3R5czRQWEJKZ1hOVHFCWWRiKzZlZ0t4RlFNM2pqWnkySC9MSmVWUTQxcit5?=
 =?utf-8?B?dCtBSUdVU2FYOUVzWHV4Rk0wczNNVVc1UUpoSzV4eFJjdm5NQkZIeFFWZlRy?=
 =?utf-8?B?YUh4SVk4aWNFMjdicUNPa20za01PUmxWa0QrSmJDaEhNUDR2akZydUxyWjVu?=
 =?utf-8?B?K3pQNExJaVo3bHZEbFhWakpXeUJKOVlmeDNKVlJSZUViSTRwVmM3QWl4bGtU?=
 =?utf-8?B?dVUvVnJKbzFyRjJwdmpYUXhKanhGSmt0U3B5OFY2ZWJ4MDNMbnFkNUFvL1p1?=
 =?utf-8?B?Q3RVZVQ0M05QSVdtOTlvVjZlY3dEanorQy9RaU1OeXh4ckJkYzBmaGY1a0dW?=
 =?utf-8?B?V2ZKY0xwRHVFeDBKalJGODYvMm5CdzViNituUW5RUjNIbzB1WUd0dWU5ZXNv?=
 =?utf-8?B?MWt1cnJkTlZ2ZVM1REthQ0VrM0FaVzdYeWJiUWE5b1ZnSDBCeWtYbnJwMGVE?=
 =?utf-8?B?cnNxTWlFbEQvWXV2d2g1YzVQbExEMGk0Q2wxNndOTUQydldWL2xreW9pWXdt?=
 =?utf-8?B?ZUFHREVlRXlpZFhSL2NtU2dIWkJBTFJMem0vYWE5YXNNUWlxSHZVTHRaWE5x?=
 =?utf-8?B?cWg3N3labkJ1WE1oVzM5c0gyS01EUExBbVFLUHZKc084SXRKVWR0NnJsOVps?=
 =?utf-8?B?QUhEQlBFeTdMS2dNNWEzeXB1V2JYRSs3RzZSb2N3QnFXWDkweTJDMEdxR1pI?=
 =?utf-8?B?VXRmZWlnd09FWktveGswVlRXUHBuSVpwWEFRbDdTWlk5bWVtNFkyRW1HNDZa?=
 =?utf-8?B?UEp5VmU0SEI0cXZxNXBITVcrYUZacEp5NFR2ODdQT3hjMWs4Ly9ROXlRcTdw?=
 =?utf-8?B?amY0dlZwWmNjUjZPaUtRV1c2S0ZrTUdPYTZLK0V3dE5Hc29YUWRtZUdCR1ZY?=
 =?utf-8?B?ME0xZWJEWWdabDJVaVk1ZmtmWEkyVkQzUnJBWmJoS0tvY3RWSU5SMFNCQkJV?=
 =?utf-8?B?SnpDVG4zMHpNbmhTOXduYSszL2pSVlFCU0JQU01EV0J0VmdWWVdWaDVTOFdN?=
 =?utf-8?B?RjNONktZZDk1aHdrdmdJanpVMXRjYmtQQ2U2bXdNaDRDdUJ0anQvaXZ0YzNT?=
 =?utf-8?B?WFcyYlRZTkM3WFMvZ0RkTjNUQzVNN1VQUW9Nc2ViWm5TMUhrMXh3VVAzOXFT?=
 =?utf-8?B?RnNCT2pLaUVhK0JwL3lCUWlGNU0yRWhndXZheGlPSlgvbGppbU5UV1RjUFVw?=
 =?utf-8?B?dkY4aTV6emkvbjRvbWJzU2lSWjZqQWxsZjh1dDhsaVBXZDF4SWJXZi91QlJy?=
 =?utf-8?B?NW10NXpQNk5XSml1c2k0U1lIZjVxWHNxUW0raDFhUTB4ZnZuOGtDeXFwSTBE?=
 =?utf-8?B?WnhQSUNVZ0FrQTRmby9iTGZWM1RMSXp6RjJTVkJmUHpVYWd1LzdVS1NQaHIz?=
 =?utf-8?B?L1hnbFJkV2NLMm5qUCtZQ0xxM2VmSzlxT0RjdzVJS0hHdjcvV3FDOXRQTktF?=
 =?utf-8?Q?iNG4bLACOJgQWLk2rfnRLVRIdHPVPAr6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTZGMC80QS94ZXFCYnJocldrU1JFckxxWmhGeWZHWUJJS05QWTVUbjg5c3hp?=
 =?utf-8?B?TzVZNVB0U29lYnhyVFREV0Q5Vk5tNnFUdTBaQmJDRjFVNSsvdWhzeGhkUnN6?=
 =?utf-8?B?c2ltMXI2dkNkamVwY1BRYnlObi9lRGRiZVQzR3BUNHBCWjUxWGxZZ3psVFBW?=
 =?utf-8?B?amtOTjZvMEdldFByaGxQU1IzMU1YMFcxTWVhSkgxS2paeTkwK0NVTENOV3Zp?=
 =?utf-8?B?WStvQVZNcmpseWczcWZJREpEYUJlQmFjc1lFcHVSY0FGSENQVS9LaW5XVVJm?=
 =?utf-8?B?VUI2R0Jib0NVRzhtc3g5dWErMWxLcFRRaUI4d1MvTWkvRkVqa054Y0RwanRE?=
 =?utf-8?B?cklCVERtMlhDcFZBYlZac1Q1YnZZbFlCeWVFWVpJRkVNdThzaElYWTIxQ0Zw?=
 =?utf-8?B?eS9vcWFtRnRlc3BMNWdPdi96bTJINVc1b3l3SVNxRkxISG1xSjVrT1E0TjZT?=
 =?utf-8?B?dFJTMjJoWkpCZHFremlwR0JuQlBnMUJSZ2dNYmQyTFZsS2pINFVYS0VEZHFz?=
 =?utf-8?B?NytHdUliREhMSE1GbFo3ZHZtTlAzdnRrTnFFZXR5MWlJUWN6ZjRiK2dJMFpO?=
 =?utf-8?B?dVFyeDF0S2IzUW9GaURpZm5ScnZmSU9OcWR6ZWpyRG5VV0hZald1elpDOXg2?=
 =?utf-8?B?NGV0OXdNbDNuWnBSU05wbE1TbEpxemJGeW5JMVFYTm5uM3JCR3RGWWZVZkY1?=
 =?utf-8?B?YW10WGxYYmcvQzd4RlFTTUJ3NDg3NkExZy80YnduRWVRMkJ0QVBhQWZZYmF2?=
 =?utf-8?B?WXhOV1N6QnBrVU5wdGpiNHpEL0pJOWVLT2lYL3o3R20xUTg1Q0RCb3U4Nm1L?=
 =?utf-8?B?MWZmWGpWN3JzaVpMSE5IaEFXMVBWRWZaRFlxWmRGUE5SSmVhdVIwNDdzdXN3?=
 =?utf-8?B?cU80eURPNmhEd0s5TXlaR0pWbkY0T1hiSEhjQ2V1Z25XeUtBOHN3bmJMQ3pm?=
 =?utf-8?B?MSt6VGpXWXRlWDNhSlRmRmhGdDJkMTFxb2dhT3RlcXkzTVc0ODJGeVVpT2lL?=
 =?utf-8?B?N0RaV2hVVGlSNTVLTXlvV2FCYW5VZytKUCt6UmFiQlh1dGVpOHZOVUJCMFlK?=
 =?utf-8?B?WFFLVnZQWFBoYytuaGFrUjdaU01uVDBpeWNLa1ViR2d6ODMwSmROak0wRVZs?=
 =?utf-8?B?KzFCbUM0Vk9KMUNXdXJuM0U3WW1zNTRGU01HU3I5NHpYL0hab2NJTTgzeUlk?=
 =?utf-8?B?cGNpMDNRc3I4NWNYMnpHYzlVZjUwNHpjV3VDVUdpOUNPY2F1UmpRK3NtVTZE?=
 =?utf-8?B?NGpDREs1TjFNM3QrVnZSbUVBUTI2Zm0rQkJET1dndjZFdGFRQTVjWEtuRmdm?=
 =?utf-8?B?akFqOFZqeUE5MTNwNGcvYi9CV0VUdzJqb09UNVFIVnk2bFNVWHJIV29JWE55?=
 =?utf-8?B?cGFSRGp1SU1YVFBncEw1WU1oTzMyRUpkNmFZdEJvRGl1ZHJVRWhMM01sVVhm?=
 =?utf-8?B?TC9nUWhnZFBrTitTQk5WRmV2YThpd2x0ZzZJaGM2SkhqOVZlRVl1cVdVTnB0?=
 =?utf-8?B?R3pFS1A1eUdza0FBOWxlVEdOdHpkalpxTThoR1daWmZISUJPNm5xOWpPVXhz?=
 =?utf-8?B?cDZPbU1XZEw3NEtBaFpwVnpNMmM3ejNoSkFPNHJmNnQ4T3hWR2pZV2gvVzFj?=
 =?utf-8?B?RGNHZTFUU3NEMlRMaitEUkFZS1NFNm5mcVFVSU00Skh3L0pOTlV4WlRpMnd1?=
 =?utf-8?B?c08xVlFETDdaaFJzT2QxOGp1TTYzRzdOTytPRVQ5a1ZUdVVyb2NyNHIvNlpz?=
 =?utf-8?B?ZmMzemVYN1M3UkZ5cG9SclpHTlhPeHZoRjU5UlpzYTJKOHZHZVRBUFdEaVBl?=
 =?utf-8?B?blVzVTczRFQ5c2JuSnpPdEtZWUcvanh2UTBrS29LT2tHd1owbWlqaWJiNjZk?=
 =?utf-8?B?SVNBZXc0T3ZHUzRQSWhjZkJTUHVTNEJKTW51aGJBUEk5blJBZFpxaVZaUmpG?=
 =?utf-8?B?UTZTb0NNTjNsU1BFMThteTVJeWMyRGVNaVdmeWFYQm9oVGN5Z0Z4ZkQrT0RT?=
 =?utf-8?B?YzRUaitmUDlUTkJYZDZ4M24wTGs0OFNDS2RjcWdhbG10SVh6N0dFVlYzZ2FC?=
 =?utf-8?B?UW1UU3NaNjBvZWdJL3RranNDYW9HUWFWN2wza0JDOXJFbkJLWU92R1VqY1lH?=
 =?utf-8?B?TWNsamNtbEpKQldKNEpxZE9UbDlQNGlZNkhaV09GdGZQbXRwWU8vZFBBUSs3?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3b0bce-c17e-473d-1208-08de3d010380
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 00:12:49.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxlrJu8T6XVnh2Qa8hQtLEDmj72VvqhicGBWxbCnQsiGFeG3m7aOdyOBowpc5O8O8XkrXNGqBb9tkb1RkYdBzmHSbNSGX7t3pHrMAxjpzNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6420

Hi Andrew,

On 17.12.25 01:54, Andrew Cooper wrote:
> On 16/12/2025 11:35 pm, Grygorii Strashko wrote:
>> Hi All,
>>
>> I experience build failure with following Kconfig combination:
>>   CONFIG_DEBUG=n and CONFIG_XEN_IBT=n
>>
>> with gcc:
>>   gcc --version
>>   gcc (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0
>>   Copyright (C) 2021 Free Software Foundation, Inc.
>>   This is free software; see the source for copying conditions.  There
>> is NO
>>   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>> PURPOSE.
>>
>> Is this known issue?
>>
>> ====== log ===============
>>    CC      arch/x86/x86_emulate.o
>> In file included from arch/x86/x86_emulate.c:27:
>> arch/x86/x86_emulate/x86_emulate.c: In function ‘x86_emulate’:
>> arch/x86/x86_emulate/x86_emulate.c:70:36: error: writing 1 byte into a
>> region of size 0 [-Werror=stringop-overflow=]
>>     70 |     gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 :
>> 0x8f; \
>> arch/x86/x86_emulate/x86_emulate.c:78:9: note: in expansion of macro
>> ‘copy_VEX’
>>     78 |         copy_VEX(ptr, vex); \
>>        |         ^~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:8140:13: note: in expansion of
>> macro ‘copy_REX_VEX’
>>   8140 |             copy_REX_VEX(opc, rex_prefix, vex);
>>        |             ^~~~~~~~~~~~
>> In file included from arch/x86/x86_emulate/x86_emulate.c:11,
>>                   from arch/x86/x86_emulate.c:27:
>> arch/x86/x86_emulate/private.h:691:17: note: at offset [0, 4095] into
>> destination object of size [0, 9223372036854775807] allocated by
>> ‘map_domain_page’
>>    691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
>>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:60:21: note: in expansion of macro
>> ‘get_stub’
>>     60 |     uint8_t *buf_ = get_stub(stub); \
>>        |                     ^~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:3354:15: note: in expansion of
>> macro ‘init_prefixes’
>>   3354 |         opc = init_prefixes(stub);
>>        |               ^~~~~~~~~~~~~
>> arch/x86/x86_emulate/private.h:691:17: note: at offset [1, 4096] into
>> destination object of size [0, 9223372036854775807] allocated by
>> ‘map_domain_page’
>>    691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
>>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:94:21: note: in expansion of macro
>> ‘get_stub’
>>     94 |     uint8_t *buf_ = get_stub(stub); \
>>        |                     ^~~~~~~~
>> arch/x86/x86_emulate/x86_emulate.c:3402:15: note: in expansion of
>> macro ‘init_evex’
>>   3402 |         opc = init_evex(stub);
>> [...]
>>
> 
> Hmm - that looks like more of the GCC 11 bounds bugs, but that's what
> the gcc11_wrap() visible at the top is supposed to be fixing.
> 
> Neither of those CONFIG options ought to be relevant.
> 
> Which Ubuntu is this?  Is it something local, or from one of our CI
> containers?  Is this on staging, or local?

Local. Nothing special - "Ubuntu 22.04.5 LTS"

======== apt show gcc
Package: gcc
Version: 4:11.2.0-1ubuntu1
Priority: optional
Build-Essential: yes
Section: devel
Source: gcc-defaults (1.193ubuntu1)
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian GCC Maintainers <debian-gcc@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 51,2 kB
Provides: c-compiler, gcc-x86-64-linux-gnu (= 4:11.2.0-1ubuntu1)
Depends: cpp (= 4:11.2.0-1ubuntu1), gcc-11 (>= 11.2.0-1~)
Recommends: libc6-dev | libc-dev
Suggests: gcc-multilib, make, manpages-dev, autoconf, automake, libtool, flex, bison, gdb, gcc-doc
Conflicts: gcc-doc (<< 1:2.95.3)
Task: ubuntustudio-video, ubuntustudio-publishing, ubuntu-mate-core, ubuntu-mate-desktop
Download-Size: 5 112 B
APT-Manual-Installed: yes
APT-Sources: http://ua.archive.ubuntu.com/ubuntu jammy/main amd64 Packages
Description: GNU C compiler
  This is the GNU C compiler, a fairly portable optimizing compiler for C.
  .
  This is a dependency package providing the default GNU C compiler.



-- 
Best regards,
-grygorii



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85170D1DA8E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202785.1518222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxQ1-0005Kb-Uf; Wed, 14 Jan 2026 09:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202785.1518222; Wed, 14 Jan 2026 09:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxQ1-0005J8-Ri; Wed, 14 Jan 2026 09:44:01 +0000
Received: by outflank-mailman (input) for mailman id 1202785;
 Wed, 14 Jan 2026 09:44:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47rf=7T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vfxQ0-0005J2-V6
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:44:00 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4bdd65-f12d-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:43:58 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by CH4PR03MB7553.namprd03.prod.outlook.com (2603:10b6:610:23e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 09:43:43 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 09:43:43 +0000
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
X-Inumbo-ID: 8c4bdd65-f12d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC0qqZVe7zViXaAbaAxP2mhJIlp0AVyAmiC0nBUXNYrWmKndLaajeqWpX0rTYiVXmwVHSV729R82QWwEaSDG5PoUgguXymC3Z9znVCDjxCo5g4jgkohg3Xzkxk7ns6q1Fc7anG8zrnBttezU9E4w5zV0dS70a2GrZ9LvfSnEgf+oGrblxToNdfXHTgbZYGJbA9HrezX3uBfVpmxDLSi38VOZsfObMTgfncjxOJ++a4RK0jRmCaNBJQN5ZJvjTKM0M0nSdwLDNlKtGrsTl4gD5RzIm5FNE2KtDszH/4Ruvn9mJq5fJAobb86+atXQi1BSnlPyBv0qsJpxyGg66rX+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiWWT5Lh5nvaMONFcR3IhJHMprnxl+EuIn9KkumOadA=;
 b=BDOp8eRsfeYhYADnWR7vRpLNIjgT7jyBRtQhS4i1Z1QDkxEbcLXwnQKA6AkOwhUrcgICv9wxTYq/Z9ZKBrsy+USFKKTuz9S/mnDZ25ea/cO2qjQw8TYCRBhh+NzpnKk7C/FaY47pLYdDEhxzZwQrc/3O3/RvwlFRHCnhtKhDgkIASh4RmzWAGuYk8HTZ9zqXf06rEr+cekk5p0vAgBCHv7gbnFBXFH6KUXJsIMplCY7dB8LkAMxltMG/qw8LKW/ubsiUtjlNE8zZlJvyq7+b28EDr84sc9tVldlar3neubRAqkaAQ6zzYraiVAcD8kg1SmVl21iTuYE9bLmjQ+fHZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiWWT5Lh5nvaMONFcR3IhJHMprnxl+EuIn9KkumOadA=;
 b=kKgfTdYLMC2gV9gB1peeUfajo2oW72/1SFtmANGKi5mp0kzTcWv/EEfsmHzx0mtEAhibTC58AwmA8hF4Tb6k9TEn8ZM34sq1eRpVNenPJMkOZVe8MDxL9EcOK2bYDY9IHEXFti9xQrdOaVvwVY6JEfH3YfT1mDo4z/jTtHBtm2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Jan 2026 10:43:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/time: gtsc_to_gtime() is HVM-only
Message-ID: <aWdlSkpL-jR66Maa@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <79c32e1e-15d6-4b9a-9645-1429a21e63ec@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79c32e1e-15d6-4b9a-9645-1429a21e63ec@suse.com>
X-ClientProxiedBy: MA2P292CA0023.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::18)
 To BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|CH4PR03MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: ff44b11f-2a61-4623-ad31-08de535167a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmxLbzBnQndoOHZPd29iLzczRFgrRldZTngyWTQ2eVlhVTRQeWd4MXBHZEc4?=
 =?utf-8?B?UXFjejJldWVRUXlMZlhoUWw1MjkyMVZORWh2b0xub2ZTMllKV2NSdk91WEtU?=
 =?utf-8?B?NzNLNmJaTDlmbjVkSjlUTEtKK1lqT3AvTHdzQldONFNJdlRBUnlMNlRQZ0E2?=
 =?utf-8?B?ZFAyVUhQRk5wSTh0VkxWNGFCNGJic0lBVWlTYTl5SlRFNTRlL1dxMGYrTTFS?=
 =?utf-8?B?OHlwVERvajI5Y3ZtSU9WdDJ2ZjFaS0ZXOTRqT20wc3NHalVEQzQ5RkNOSXZ6?=
 =?utf-8?B?eHd0dmV3M2N4SUREenVNcHovZmxtdVV2dWI2VmVnSVhwTFZVZEthM1ZUbnA2?=
 =?utf-8?B?eXdvS3dQVTRNSkFxajJXUHRZSHZEN2tyL3ljK20yS05wV1hIZUs3MnB4YUF2?=
 =?utf-8?B?b0E4QnYxS0JDY3Z2Q3ZZTFpCWllLMllMK3RTTmxWUDB5elJ5RHRFaklKeU1r?=
 =?utf-8?B?d2dSeVRjWHhaQ3Z2bVhhdmx1UHNPMUJ4bHlJOHQ2THdIeis0dklkeUE5QWNP?=
 =?utf-8?B?azZwTmdST1FYU0RGRUgxV1YxODVMZzZxQkdnSDkzUWRQVjdUcXlub2h3ZDdr?=
 =?utf-8?B?OXIwTmhrQ3IwTThOOWw3WUdpR3Y3Mkt2dy9JeTE3N3FlUHJLd0U3bVhGdWI0?=
 =?utf-8?B?TXVkSVhxTzg1U1UxMko3QkVaaExxcjhpZU9UUVFySXpOZEsyTDlGdFNndlNF?=
 =?utf-8?B?SUl0dmdWMXI2RnBSSnpzTVdlRWZQWFlsaWRvQ0lxejlJUWt6NWg4aVR6ck1Q?=
 =?utf-8?B?SlNIK0ZONXI2cVBUbG51eG1QdDNNeUI5SW1wYXpYRzhWLytoWjdXZjF6eGky?=
 =?utf-8?B?Tjd0M0lDR1hiV2c2Z3lMRWFFMFhRMlYwZVlNUXphSlZWcjRQWVN6b2Yza2xI?=
 =?utf-8?B?QkYrOU1CYUpSVTdFOERlakdIK0I5STM4eWNmaTN5REZ0QmFyNTk4TjZVNkhU?=
 =?utf-8?B?TWtscGlLYWZiZWZ5aHczUUFKU2prR09XOC95Ty9YanZ3SHB1bmZSZVprT3hL?=
 =?utf-8?B?SkFIZkNyTlhBZGd3ZmxWSDRXVGl1cGt3c0NzaGVUU1RhOEFFWEU0RkxwWFB1?=
 =?utf-8?B?MjhQay90L2hOWkN3RjRxMEJWMlpXb3B6aFlvbURHazFIS3pLZi9reWdHbjhr?=
 =?utf-8?B?RUQzRFlLM01BNm9tVUxSQzVadUE3U2J5YkM3L1lPQ204ZFdaNitmaERrRExX?=
 =?utf-8?B?MmljV204dWpnd1d1SW9nY1g3bVFvZWxXL0ZsQ3FHeFc3Z2pPY2dEd1VZSThN?=
 =?utf-8?B?M3hxWk9ZQmFtaE9oaXVBMTB3UlVyNHA4Z0hESXJicnJyZ25NbWpqNjJnVUpO?=
 =?utf-8?B?ZlBhNmhZamV4VjBwQUdSVmJSa3dMd29ob2RzZnJPQUx6S1F6MHdLN0VyZHRJ?=
 =?utf-8?B?cEdvQnZwdTdiZGxnWlozMDJaZnRyK09ScVJVRGNHT29SY3lsdDBid1doOFpT?=
 =?utf-8?B?N3FQUEs3SUlsNFpRbmo0U0xnbDI4Rk0vU2VoL2NxcER1Y2plSFo4NnplTlFQ?=
 =?utf-8?B?QkZvQ3lrWE1vQzVuMUdlZXdMY0lKTTY0QkIvMGhoVktlQ3pmY2xBQ0hVVFVF?=
 =?utf-8?B?V0xTL3R2NGc1NXRMOW1taW5NS3BsditUZHI5Z0ozZEVia05JUis0R0wzNDRE?=
 =?utf-8?B?cVdRaFJZNFhhVE40NGJJWTVLSU55aXhlWjN0bkIvWE9LSW5XM3RBSEJVRnlQ?=
 =?utf-8?B?eEtHd2IyOEdlbnU1ZTVNVHNvSStSdHFoaFB6akJMR2E2aExDVFBzR21lSktB?=
 =?utf-8?B?TE9vcTdaWXE0cnRja0tzaWRpelZIT0RXNXZOdnNyTGRUS2JuaUtMSzlQR1My?=
 =?utf-8?B?cW5MNVVXQmhWb1lKR0VUdjBaZ3dsUHcvalIxMUhkU2ordWxFcjBHY2FTWWRi?=
 =?utf-8?B?N3VqaHVNL29YQ3k1MDBrK2JmOElXN3hoaE1jakZ3VHFZb0pTQnhJTFlpdUJY?=
 =?utf-8?Q?VEyzOkLvLmr938iKWemxPKwirK1a5v7l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pZL2hzYlpzNk9Gb1YxaUluTERTYSszKzMySE1YeDdqU0poTEUzUkRncnZx?=
 =?utf-8?B?dW5aK1BXbkxqQVJaVng4QUh0QzVzVHNiVWdid0p4RmZqWmdoNWxYTG1EN01G?=
 =?utf-8?B?Q2F2UzZMcXJoeUtEOTd2UHFyWjRaaUFwSHh4WlpvTUNrdDJqTVdpTDdvRURQ?=
 =?utf-8?B?V01pSDNyK1BRQjl2bFRYbVdzZmtUTlBLbkJOcEQvNGtmNm1tRzJiU2Nqc3di?=
 =?utf-8?B?cldzZUFSdS8raUloOWJMbmcyajN0TCtwVDE0YXpSWmxOSVZXSzYySUJqc2c4?=
 =?utf-8?B?VDhiMHBHSEpsNHljRXQ0eXEzWXNDZ2NnQTNzRFRybGRUa2MzV2pGWjVVSE5m?=
 =?utf-8?B?ZkVJK1FkbVFkWDk4R2MwdkJ3aCtqUmZnMXg5WStOQ3hlSUpLU0V0ekhYTmM4?=
 =?utf-8?B?NWh6aTVHaXl6NnhlTHp5MjJaNmdIVmRVUE9pZjZxWjhOSTNlMSt3ZTkvd3Z5?=
 =?utf-8?B?UGFFOGpmamZNd1JRSWlFUHcvYkVrekVreDV1L0srMUdLSElBLzVtVHgvOTVK?=
 =?utf-8?B?MmlsRjF5Syt4d3hxbHNYT2VBUEhTajlYRUZ1SVg2aHBFaFB5QlZKVVJ5ZlJG?=
 =?utf-8?B?ZHVWN2ZCTnFWTTkwUXdpNjJ2MFM4V2l0dUNObmM2Y0hIQWtGczVsck50YldT?=
 =?utf-8?B?MGdteDBYeEExYTFqZnpsR2U0NGRMUGt4WmNZaXRveDJrdGtkbzh5SVJHNFhK?=
 =?utf-8?B?K3h6U0dxd1ZhNlhUL2tzQk43UWFGSFhmZzdaZ3UvR2NNb01xcU8vZVVEMDhX?=
 =?utf-8?B?VWVmNUFtQ3Y1T08xaTk3V09KNHYyVmJFMFVOR2NmZjRldjVBaG0wRDMrNEtv?=
 =?utf-8?B?YWJXZzJoUGdJd0h0RU9NTmFqYTlFREZEMmNpUkdtd0FEbEc0UkZWNVpkS1JO?=
 =?utf-8?B?cU9Yeko2a0N4dVlyeWtXMkFJaHIzSHlNRTBneDFYU203SS9vbFFYR1JoNnlt?=
 =?utf-8?B?cDQ0dzlDdlVsb05xa0pKVDdUeXp4d3ZGRTdsRURHUDhzalZlVG1NZVVVc2tS?=
 =?utf-8?B?MVpiUXUwVFVsck5wTWJSZ0lXbVFZUGU0NDhwbWgrd05IcW1GZmZsU0VUdk9p?=
 =?utf-8?B?ZHhKRHFEZnZhZ3llMFBubm9xazltemNIUHI2UEhWZXIwM1N0ek1hODNMTUZp?=
 =?utf-8?B?dEJwYVpGSENNeEg3TFhKL0FJQkF2OUNTaVV6MTMybGEyWTlQK2lqMUFzT0V5?=
 =?utf-8?B?RExIRDRsSjNYaEhGYi9VcDJ0ZzgrSmx0THd0bHlyMXc0M3czb2FKQXVmSjVx?=
 =?utf-8?B?M25Vb3hpMTNnVEFZQmIvQTVpQVZ1d0htV3l6NDVXQ0VWZGtsaE4wYkNTTVJI?=
 =?utf-8?B?VmphZUZ4eURqWEQ4ZDdNSkpVTjNockM2b2FETTRtNmhIOFYrK1RnbUVBS2ZM?=
 =?utf-8?B?ZldTaDhKbHI5SmZGeit1T3RpMTRDRFBTMFFBVGM1eGVRd3gxQU10Q01Lem9F?=
 =?utf-8?B?V0NwOU8xTWtSMG52NXZoSVM2b1FhKzZ6cW1IRlFhczJQeXp6bTh6TmpnWnVF?=
 =?utf-8?B?Vk9vR3JIbVRLeWlhbVpEV1U5ZmtXa3Y0aWZQTkl6bFFNeFExd3A3c2VwZkhm?=
 =?utf-8?B?Qm9mUUpFSnE5Umlub2UvSzh2TEtBbnJaV04wblYvbnBHNlNOMTdGY0RWeFVj?=
 =?utf-8?B?dkdXZkZBT0JIdVpZcy92MzRxU2ZycWFyNUN4TEY2WkJsN1J3OGpzWUYzamVi?=
 =?utf-8?B?S0kxOU1XRFFJY0doV0wzZEJvL1BlT09TMnlDZlllMWpYTEZKVHcxNzF6ZEJ5?=
 =?utf-8?B?Q3hBT25xUWU2ZXpZMmdTQTFaVER6dlhRanlhUmNlYzhuOTMvalFvT0wvOFR6?=
 =?utf-8?B?M1lzcWpHNm5QcWJtZnpTb0l3Vng1VlhjUzVraVhjckJ3YjV3aEt0TzJuZjNy?=
 =?utf-8?B?TjFKWFI1OHVjZVcwK0g4VU5GakpKcVJvOHRoUktQYWw3d25OaW1MOEtWUlNC?=
 =?utf-8?B?Z2l0UmtkbVlTbzY3dllPbW12UjNncTJqKzlGa1NhSjJCVUNrUmdtQkptOWk0?=
 =?utf-8?B?L05IKzhHekFxOEpjY2x0SWhncUMvejRQUEdqTDYyeEFTamRZaXpxSUdSTGU2?=
 =?utf-8?B?Q2RYMXNSd201R3JHcGtGTHFVVjYxd2d4aExLZUM4OU9zaDV1c1oxbDBxOE9Z?=
 =?utf-8?B?eFZHN3RiVDlQRjFyVEwyVlRmTzlRTUdnenM2MDVkNTY2aTd0L0xZTXRtcjF0?=
 =?utf-8?B?TmlwYlhjOUp5RVJKNXRsaGNXZkpPcVA0VVFLK1cxMUF0Ynlpb2tVNXJ3R0Vy?=
 =?utf-8?B?YldUK2NtVGtPcVJJc2xSMDFwaDdZblM4SERRaDg5YkliT2NuUFdZL0lVdlFq?=
 =?utf-8?B?NHBKa3lLTWYxZlNjRjhUTjhMNFpPQ05ha29Yc2pLK3NxOFhybTV4QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff44b11f-2a61-4623-ad31-08de535167a3
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:43:43.2491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8OvsU9lBwcOxn3f74yRbA2UYxL5w5QPfDfkqG7RvGLuf8Gpt58YPm7TSFoDcKjTTrOvmlXRl1bdlz+7+cqmfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7553

On Tue, Jan 06, 2026 at 02:59:43PM +0100, Jan Beulich wrote:
> Omit the function when HVM=n. With that the !HVM logic can also go away;
> leave an assertion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2840,14 +2840,13 @@ uint64_t gtime_to_gtsc(const struct doma
>      return scale_delta(time, &d->arch.ns_to_vtsc);
>  }
>  
> +#ifdef CONFIG_HVM
>  uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc)
>  {
> -    u64 time = scale_delta(tsc, &d->arch.vtsc_to_ns);
> -
> -    if ( !is_hvm_domain(d) )
> -        time += d->arch.vtsc_offset;
> -    return time;
> +    ASSERT(is_hvm_domain(d));
> +    return scale_delta(tsc, &d->arch.vtsc_to_ns);
>  }
> +#endif /* CONFIG_HVM */

Seeing this is solely used by the vlapic code, did you consider
keeping scale_delta() non-static, and then moving gtsc_to_gtime() into
vlapic.c?

It would result in less ifdefery overall.

Thanks, Roger.


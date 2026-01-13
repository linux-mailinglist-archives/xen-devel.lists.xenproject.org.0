Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F599D1ADE7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 19:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202296.1517909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfjKA-0002yt-IH; Tue, 13 Jan 2026 18:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202296.1517909; Tue, 13 Jan 2026 18:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfjKA-0002wN-Er; Tue, 13 Jan 2026 18:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1202296;
 Tue, 13 Jan 2026 18:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vfjK9-0002wH-7O
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 18:41:01 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 672e0b3a-f0af-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 19:40:59 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7649.namprd03.prod.outlook.com (2603:10b6:610:23f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 18:40:56 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 18:40:56 +0000
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
X-Inumbo-ID: 672e0b3a-f0af-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkz7pMsmkDSEal90D29QnCK0znwB3hOUXzPdx8Dxr5hPlPkptrt3KPUvWHQEKX12GKAIMAfY1ylw2VuNiUQA7JtRqU3qnIw2/OXvC5yd6YpsSPrNRL5+AwfhQDn6MA5GPonBzbKGpq1fLVwXNJH+sYLggMEKcoF/K5A27mOmMGFguUuQFugdvJZCcoNu1LdB+CpvDlgzEL1irOK5AufPtCE3j0dgtOn3Losri5+mZ9ty+/7jRnFjQlgH49TvaAPsZzvRiqT6N03zbQcFwE8GW+V0dSArN71UHEEoBP5ZI72lK698x4XA0JcyUSRyT/Ei48oyrGnALXjoMJHKbf7diA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvmvAcuzt7ZHT14NUqgLWQpOs0IhFoOyX6G+ZVUh7T8=;
 b=fJYIFM8sMxeXGZ5o866oJz20p4Aq5cPGGu5fufXAHuJZ59gykprAhwG2KmDIZY9ePk16ShNMfRjJdsxYtl5iklruN5UAeUN6iGCIoVgrg8ttrSpaInSGU9+XT3dT/EWByuRt4taJv8s2EGzRPbJDgmLzGEfRlsxtnl1HrzGhzXgeo58+cNVcErYy3T79+XAkmslprDO4nIJQ/aTJj//cVEtEm/4gcyNf6OZRPswWu+rCU12vL4kKw+4R/KZ7f7fG9ROy1xuKXW57Wlp2umxq3fv3o6BRheCaG9SIs5BwSppGpW65L5SaYtHs9EtG/N84iHzmnhm2tZ2cq8ZQwLnrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvmvAcuzt7ZHT14NUqgLWQpOs0IhFoOyX6G+ZVUh7T8=;
 b=z8M2mkUflwgvcUEWzh/OgtfbgzbrOopWpspLvM7lDw2DKHfPy8X5EU9iM5nkRXbAtDUkjtFWeU4xabw2VHbTkeqKjfNQq/IEZXLTwqhWlAZG8+FEr0aKpbrK0/ztWJa7+4V78EWpU7h4zMu4B2xwrR5PvmjrGB7FZq3rCRQtD8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Jan 2026 19:40:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86/time: scale_delta() can be static
Message-ID: <aWaRtNZ2obZ09KYR@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <ccaba595-aba4-409e-be36-ea5004cd6484@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccaba595-aba4-409e-be36-ea5004cd6484@suse.com>
X-ClientProxiedBy: PR1P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 84faf625-efc1-4e4f-1bbb-08de52d349bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGUyR0hhcVcwMERlZ0pLOUNGbi92RGpYQnlabGpZVUlhNEVOS09yL3JUdXNC?=
 =?utf-8?B?Wk1ER0Z4cWxBcGdKQmsvN3FmbmRsbG56bFMwVkwwT3RhS3NPSDJNRWJFb0VI?=
 =?utf-8?B?Wk44WTZMc3NRR0FwbGNSYm1wdXJJQlZtRnpaYTFHM1V3MEZLelJQQ3RBdnI3?=
 =?utf-8?B?QXlQUnhoTis0eTlTMVBpS3BDTWE2TURMT2lvY2Yva2dscVd0VDZGblgxYXp5?=
 =?utf-8?B?SG1nMmoxaGMvOUVXSTVuVDlNZVl4QU5QQUNadUYvTzZvV3lpdkFvWnB4bDkr?=
 =?utf-8?B?RU92WWpBdS82bk1LR2ZGOFFKWU5hMUZKd2FHZWxHTG16amZoRmRhc3EvNEVs?=
 =?utf-8?B?SVVVblVmTzAwWlJ6RERpUFpqejk1SDdDazZtWEZrOFdCZG5VR09XL25sUXlU?=
 =?utf-8?B?dmxYaTlhRWZENXh4ODBkcEFxcFdkZnRGZURGU3FnVituenZtNjhzVzd6WnFw?=
 =?utf-8?B?Z2FYbTY2UGdKdCtlbXlYZDRHYXpoM2doUjNZMzAvTElDYmozSGgvQ3N3bnIy?=
 =?utf-8?B?TlgrTlVYaTFqR25ZUUpjY25EalVvcFhLLzJadkVpL3NPSmpkelFrSkYzb1Qr?=
 =?utf-8?B?U2dybm1GRG1zM0NKKzMzZ2tGdjkrOTA4T2N4c1BDcElmUmw4bFNoQTNMUENh?=
 =?utf-8?B?ZjB0Q3Yza1Z0Q1pmaXpITnlRMVpqZVh1MU8wTUw5T1UrSzd5dFpMWWFXVWRP?=
 =?utf-8?B?SkF2TEpUaVlXeFpzN3JucTNkQTRlRjgvcTM2eGVrQ0h5aGkyblVmZlEzRUlo?=
 =?utf-8?B?SkZaQzRVOGJFQmZobE1UZVVCVjBSQTArUWhvR25yd2JkNXdBZlhzZVI4QWdl?=
 =?utf-8?B?Qmg3cjBMZ21sWm1JUUNieWtKa1ZQOUsvMEk1aGpwRWhBaTkyNG53MzgvVEcv?=
 =?utf-8?B?bzFya0h5NTdKMkwxTWNKQ1d1UlNicVFIRGxReTJDTDRVVDFxM3lhR0Voc2pX?=
 =?utf-8?B?LzRzc1AxTXE5aGdKWVhPN3U5SG5kRnpkdzJsTnB5OC9PcEJQTGZXbWJmNXpq?=
 =?utf-8?B?VVJSMHQ5bWhTQ2Vac2RJbUJqSW9KL0djTEhTYXJpelBZbU1ITHZpSjZYZThR?=
 =?utf-8?B?TktQbU1FbjQwOUxrbzM0d0JUaU1iMkNsdXNuUCtyZC8vMVdlbUcydk4ydDhU?=
 =?utf-8?B?ZlZPQW1zcGg2T3RXa1VUcUt3bzB5b3Fya3Bra2w0RUlkM2hhVUJVZnVadlEr?=
 =?utf-8?B?TUkzVTNsK21DRjF2a1NrOGZ3OXVQQ0xzWWQ3ZzkrNGJoenV4NWhFQWJoaTk1?=
 =?utf-8?B?S0VCb0NCZ3pTVTVBR3JWRmJsM3lTb1BDc3g1elE5dTVlUmsvMXlMVUd2M2hU?=
 =?utf-8?B?eUsyckpKZk9nb3Y5ZzZNS1pKWVlxSCtrTHdaYlNlaEpJaERaUGFkcEQwak9t?=
 =?utf-8?B?REJYaXkrOGU2eVMyY0xEVUw3aE5JSnFzSkRFM3FDeVpMNUs2WUkxc3RWenJO?=
 =?utf-8?B?empEeGtPeGRVUFFNWWNHTThZV2JLbTlFRG5MMzlHb3h2azVCdGZEb0Zrc3Mv?=
 =?utf-8?B?bmRFUFp2aWtYUUJGOG9MbGxaekNoQmRld0xVQktKb3dsMXVqNFEzcGxVb1JK?=
 =?utf-8?B?bW5QSFRWdUd2NTdvS2REVUE4Rll1RVdLbW9OcFVLclh4RWRaMHAwVVg4RDl0?=
 =?utf-8?B?NUUwU3BkUUpuNkFKeU9oZzVBZXV4clJFV1dQOTFGWk5sd1RsUGlNUGVGKzdZ?=
 =?utf-8?B?UG1sS21pdTBnbEE2NTFNMEVIYlJyeXdKWnhVcWw4SDNWTVN6ZXlyR0VLYXNY?=
 =?utf-8?B?NkFuV0JyRHRsRy9oVXErWWV0NjhwbCtxOEhiZDNTN1FYdHZDbGloQTZrZEFi?=
 =?utf-8?B?aW1McEcwdnJicUlJN2JWN2VZZ0dGZStOclprbnpnUHd0UG4yV2N0SDkzM0FS?=
 =?utf-8?B?ZjRyYW1nNlV1WlA2REl2N1kvbmFna1gwVm8wQTByM1p2b1ZmN3V4YTJ4QlA4?=
 =?utf-8?Q?7GFUvH98GpE5CoJTqkfqwp0m4AgyUXCd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RThWV2toNm0waGNVR3NFa2NzU3gvL015dFY3dFZhQWxxNTFlem9pcVJUYVp0?=
 =?utf-8?B?TFVhTTlpZlNtNk5tc2d1Y3RzYlIzWlFyc3pjYnZkdGQxT0MvMnhna1ludjMy?=
 =?utf-8?B?SHM3TzRLVXcrYUdsaEZKZ01aTS8vTnBXSDJzNmgyRzJ4MUlsYXhDRngxbTU3?=
 =?utf-8?B?OFZyTG92Slk0YWhKclFtOWkyTGJVTWtlbGEreDRnY1YxRkRIeEdXYU81VVBh?=
 =?utf-8?B?NlVFelZaN2gwbjgwZDFFbE0za0R4WnpDVU9WenJkU2xaOGFYK2thMXkwMXBs?=
 =?utf-8?B?ZFJnYTVTNHpkSE12WjVKNHAyRGZwYWE3NnB0UXBkWmFiL1Y3Y2hKaExoeW5B?=
 =?utf-8?B?TzdNR3hvZmpSZFViT3pDU2pSMXkwdWh1UTM0RjVYNnFkNFR5ZDFYaFRKVGty?=
 =?utf-8?B?WHVVZkErSUp3UXR5Umt3aXBPU2VkdVV4VXl4aW1Yb2NtUkFFanQ0cWtyZGhu?=
 =?utf-8?B?WUs3RXFUeVhsTThJWXhBMjZpeXpSR05RVlVaOG5rVThmamRZWjBjczRXV1JE?=
 =?utf-8?B?YUFZZ3BrYXhpcGJVanRCTHh2UzRLUllERXNQOFNtSEI3bS9SMlZSeGtNWE5W?=
 =?utf-8?B?ajg0SkEvTHZZYnRzRllCYkdtZ0dyYzkyTDNMVUMxakt4Uy9qaFRaaGxPRHdV?=
 =?utf-8?B?dkE5clpVa0Y3OGwxWC82Q3RidUoyV1FXbXJuMWxHSlJsUEdDNlY1MDJvYmFn?=
 =?utf-8?B?cWc1MjQ5eVpLV28wRHVZT0pqb25KQ2xxODZudVdnYTF2VVhPNGtkeXhTTVd1?=
 =?utf-8?B?cE9rd240TzZUbFlTSGRQWmNIUm9rQWJDVWtMcllENG1wL1dHRlN4TllrcSt4?=
 =?utf-8?B?cmhoTEx4cmhYVmljRUFUaVZCMFI3dmQrUTI0RU1QNzFsRHErZFNXQ3lxbVRI?=
 =?utf-8?B?UHlnZnh1RTBFemRXZUxTOEVBaEdINklLdndXNm1NbFhYVG1NV1lidkNMS1N3?=
 =?utf-8?B?em5NcFVwRnA3UW5Na0xkS1d4S0ZBbHBGa0lVNHkxOXN3YWE2VEQ5ME5pMDZH?=
 =?utf-8?B?bFNXRTlOaUZ0NmtLT01pUTdmRFVad1czQ0xkSHZVOTNIOGRhUUNuUDM5cllw?=
 =?utf-8?B?bng3a3NvemVEYkVEeGpob0o0L1RYS21CeDFsWVZ6bFlmTlNNNEU0Ui96b01p?=
 =?utf-8?B?Vmw3aW5UNW1RWG1JWHF3a1ZiRlljUXBOMFdJdnVjRFZYZWdOMzBYbiswdXRw?=
 =?utf-8?B?MWVXU3V0by9LUXowNytDdnZRZ0FMZEJOQVpZQTZiNVh0WjJLK0JPdUZYakIz?=
 =?utf-8?B?bmN2UE5WbkNCNFJTaHUxRUxCcHQwMEtkaTZ3NlNFZUxBMGJ4SU5RV2psYVZ3?=
 =?utf-8?B?TTBoSUFqb05OaGFuTUpOWE1pMEpIMDJVZll3OEg3RCtvUVI4dE1qRE9CaVh3?=
 =?utf-8?B?cVlmWURNLysrNzVBMHhJZEYveFNMMlAyU3hxWHQwMFJVanZJQkJhcDAxRUNq?=
 =?utf-8?B?dmI1ZmZMZzZ0Q0xRZW5yL3pmbG91cUUrN3pvM2NkL0JIWXdrbk1rT3J3K24r?=
 =?utf-8?B?OFR5NFhXMXArNlpSekZjVGNDRWpiakkvWHMwZWtJRzNYNDRPejV6eXZmVnJ3?=
 =?utf-8?B?RHJrVjlFUCsvbGU3R3Z5WENMZ0xyUHpzMTVLRWpXcEQ2b29wTFc0RXJ4eUZY?=
 =?utf-8?B?T3pEcHM2NGNMcDNGVjk5dlpjZ0kyLzlGSmt2dndHYVZSTDd1Y1N0OGcvUmdq?=
 =?utf-8?B?N09nZHVESmw1dFpmYTIyVWl1OE52RktHUzB6WkFGWHZtUENlWmdYWi9NZWNs?=
 =?utf-8?B?c0duSjJUaHFWRFBEaUFpdjFpQXBDalY4VHl3MVhMaEZ3MTlvNVFtc1FmaTUw?=
 =?utf-8?B?OUhiblNFUzFHQ0NMaHVNcUtjeG83WnBVZ25mcFdwdDUwcWE3ZURvN0VZbEcy?=
 =?utf-8?B?Ty9pcmNTTkw1bWZjV2htUmp2ckhwTm85QTJHYmVSNHZPWklRcHJQVTVPSXEy?=
 =?utf-8?B?Sm9jTDhBY0hhdGw4SjNYazV3WlAzNjg5SktNWkFuVTVzUFNBT08ranhBZVg5?=
 =?utf-8?B?MEp0VUl3N2JId0EvWnYyRWhWa240KzZNU0pFb3RGSzVpWmFHT0RmU3hqQU1R?=
 =?utf-8?B?ekNQOWNQVDFOM3hJQWxpVm0vQVV0ZmkrRHR3WUIyU0tqUEJZUFRnMVYrQlZW?=
 =?utf-8?B?L0pDMXdCVERnNnUxNWRneXQ2dzRSUXR6bUorQVovL2dGdXk0ZzJlWWpxZzlD?=
 =?utf-8?B?MjBpdXI5NkhBaDdIaW9mVVhGUUdweFkzdnZhZEpvSEZhWXgyTkZzdFljWEE5?=
 =?utf-8?B?dkZVbVhvMGdoSXdISVJ4NTdBV0xJUGs0eEVXcVMrRkZiYXpzVmtFTGRTUGZy?=
 =?utf-8?B?eUc2cXZINWlPcHZkNGJPdjRpaWVaRDB6dGh0OXUvSDlqbExpM0F1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84faf625-efc1-4e4f-1bbb-08de52d349bc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 18:40:56.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTOLa/DSc+p3+/kuPs9J/9UmDoXj3sbTwB9loqPZC1e1FbVOlitAM4W7Zpj5QukpJ8TpG6DTsrhvxTY2sbBCrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7649

On Tue, Jan 06, 2026 at 02:58:29PM +0100, Jan Beulich wrote:
> It's used in time.c alone. Modernize types while there.
> 
> Amends: 5a82d598d2d ("viridian: unify time sources")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4827D1D9E6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202767.1518203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxMX-0004GR-A5; Wed, 14 Jan 2026 09:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202767.1518203; Wed, 14 Jan 2026 09:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxMX-0004Ex-6h; Wed, 14 Jan 2026 09:40:25 +0000
Received: by outflank-mailman (input) for mailman id 1202767;
 Wed, 14 Jan 2026 09:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47rf=7T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vfxMV-0004Er-9Y
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:40:23 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0afa870a-f12d-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 10:40:22 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by CH4PR03MB7553.namprd03.prod.outlook.com (2603:10b6:610:23e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 09:40:18 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 09:40:17 +0000
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
X-Inumbo-ID: 0afa870a-f12d-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcnSbFcZAT+i8b4PuTsv2y7qfmmEA+qmmQM3LTy6hZuFirpFY/0tVjOd9rbFeywymubOlzvNTeXL9+yhGXmn43j1qitL6CCT7yo0Mliq96/4oQ1n02w/2bZ2Bi7xM1g6rLbe8Cgg6QbJ+j/SkkhHxeX8Fc9q8CzeDu9SUHaPaE/lNXAtVB1Asvf5b9uzryTUKfph17xTXWBO7pV+0Cgh2pbjiHZ9zMukiZ15evieCvmb7cuvnLRqaNJ+N3W1RzmI7any/4t49219HgRZdPNsdYfSwjd2ddtmijnHRa0NGS9Yrr2ird5hgZnBP9TMpV0Basw4wucGW/HMoVk3DdtJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5Mf0X4KCin0qKB4UwdyPfmCEa8E3uKgTWUnpr2obR4=;
 b=Anru0lMRxMEPJuXNoQiP97dEX54rvvUcGHq1AHSzclGeIons072Qe+fvm/rGewaqls4MTc3lh0CxI1eSo6qMDtR6CX9tHcA8c2ZCT2VML5FMSJWvH1DatZzsfg1CWuweVb7r9M62GjZ88/7wi0lV9650fGLjG0qUancXLPLb1JCLJvVSEuMFzd662toKYkY6VfKXSMku4jE7OS+82XWeJ15YdvJKyLAecQvjf+mp3UuLqI1+HNFrYqQPDPcG2/hTuGccCj6KDwHwxNLbwWNp5J4H9aG/lTHuklqS/i+zEAFc+ZHPc0sQffTO96Ha0RuwU4Wyc6sTxY5PGfVEwNtyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5Mf0X4KCin0qKB4UwdyPfmCEa8E3uKgTWUnpr2obR4=;
 b=BLM9/gL0pEyQj89VfE8TRKzy+GWHJabUzjLsjyRBHWshI0vSaqNrPobtYCcyKrJ3h67mp+jB94mQgmqr4R6+55+nWmfg4yFmsj9b5W0wZchJzwUcd/XlDJgiQf6I2zC0Ym7rDyrOMU85yRdqC8Mmd119r3qpAidclhvH75Iz21Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Jan 2026 10:40:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/HVM: drop at_tsc parameter from
 ->set_tsc_offset() hook
Message-ID: <aWdkfRGtk7QDH3T5@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <366597a9-c506-4183-bdee-8ef3d1045669@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <366597a9-c506-4183-bdee-8ef3d1045669@suse.com>
X-ClientProxiedBy: PR3P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::29) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|CH4PR03MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: db7372f8-1094-4c90-7483-08de5350ed35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUg2bWg0cm1aY2dVUmdZMFdhUzM1SWRNa2FGNnFEVytNSTF1RVZmVkt6U3hl?=
 =?utf-8?B?cm5tMWxyR1cyZXpHS1NjVEhObmZQdVBOQUFBNFYwMGxvTnRGQVBRNy9sY1Q1?=
 =?utf-8?B?TTYvS1pVdWtiYmlXN1FqdDNVL2xSdklJTXA3Qzc1ZnI3NHFFZ1pHYWdLaWo4?=
 =?utf-8?B?MlVsVGppNS9obHN5YkUyWWVuQ1NsU1JKZHFHMG4rZzNZMmRQaEQxMDZMQWpJ?=
 =?utf-8?B?VmorZXlUNTBMS0R3QUlndTZ3TTVLdFp1dVdCemFKQWRCeVJHSEhqWG1BcXA1?=
 =?utf-8?B?VjZSZm5ORnNQVnExaGVsUDhIdERRZDNPelRGV2pCTHZZWGYxSVMxdjRTcWdP?=
 =?utf-8?B?akNDNGhCeENUV1BEZHRmVFRwQUs0V211WVpyYTFtdk82NGFHZjFIOHlKUWFP?=
 =?utf-8?B?Z1krWm4rU1ExaitkT051OWtXU1dDY1oxQ05WTldiWEtPN082SkJlZjB3WlJV?=
 =?utf-8?B?VFJXSTR3UGxWM3VreGJzN1hnYXVseUYzaEkwVmNSbHBzK3JuY0dUTXZDNDJs?=
 =?utf-8?B?T3FhNWVZQTBjYjdka0JkSnlSZWo2N3hDeHJIWmdON3J2NnBiSjZRUWRQaGE4?=
 =?utf-8?B?dFNrNzZSaUlQK3pIY05LNGFMNGZyNzBtOVkrR3NHOVdqUTk3NXFwd01zQzBM?=
 =?utf-8?B?cnpUL25iaC9USjhhWFZMOHhSemZ2RCs5NGFvOXc2ejQ1VGlRR3RWVmloU25E?=
 =?utf-8?B?WTZsRUQzZ0hGSFNzY1VWVEwrcERjNlBSdGtGcmpUdWQrWHpGejRoNUlFLy9W?=
 =?utf-8?B?OC9rQnhXNlZXMEhMOW5aYlpJdkFWanZzV1F1QzFab3BpOTdMR1NmSjFoN1k1?=
 =?utf-8?B?WnRZNmxHVEtXYlRnMWxldDlQcnpFZEVBWVM2WUxMbGpnN01FUkJuRHVLRXJF?=
 =?utf-8?B?K08rRTV3NEZySWxvZlBhR2FrbzdPQnpFRzNOaFFLL0NJdGJGclEwRzU3eWdo?=
 =?utf-8?B?QVVobmF2VmxHZ0c5NFhCbjlPMlhaREhDckExRlpiMW9mM1lmaEVPaDFTbjJG?=
 =?utf-8?B?TzNxL2pJbEg5YTMvS2EyamRHazZsTGRLdDJTUHVwdWlpYnk1R1RicW5ZQ2Fn?=
 =?utf-8?B?TGoyTzhLYjV2bEtEbUt4NGlmdE9aTkRySjZMRE1PeXdWeWVlZlhMRHhEU1Z5?=
 =?utf-8?B?eGErZis4U2dpK2N4TTdpSFJYZmlCOU1BTWkzTjhLNGJTNDFVNXU1a2NTa1ZH?=
 =?utf-8?B?cUZkZnl6cCtRTW9iWWlZeUdiVHh2dWRFV3drRlZ2S043QTFxSFk2NzlzcmZR?=
 =?utf-8?B?T3RsMkg3YURlVkJ1aWx2eDVaVG12YzJsWXAyOSsxbWYxa0VvVUZqN1I1dXQx?=
 =?utf-8?B?U0I1d00wQ2RjRnRXVkd2VmJIRU9oMFcyQlFxZk5TcUZKVklKT0UzUGpJRXl2?=
 =?utf-8?B?aVhvYVhDNU5SZGtxUTJudFlIcndZMlpJZWRMZUt4d0RFcU4yS0ZZVWVyS2Fu?=
 =?utf-8?B?NkxOZ3A2UmdjVmxTL05MbEZaaEkyZmFkN2gzeTdQZmlWQkwxcGgvTDRsaHFq?=
 =?utf-8?B?MkszMjFROWNZc1RXM3EvQW9EdysyKzNIUEx3SWRIRkFjOG9QTE1pYWJXcExr?=
 =?utf-8?B?UzBxbkMxOUJoTExLRFR0S3c4aitnbjFCTDVXVU1aN3ptU0xBSVBvQk1VYi9v?=
 =?utf-8?B?V2hsMkpvT2lKTXQ2U1J2OFhVY3k1MUs0cWlLK0tNNWpIYkpINlRYRmU3cDB0?=
 =?utf-8?B?aGNRbnEwKzUzNlZzNVlGNHlrZ1JOcC9Dc1lFbG5kYWZjZ0NwaUxVbDlFSHZw?=
 =?utf-8?B?eGFPd3o3a0gxMkVBTTZmU2FZY09EQVlkSUkvdUxzS1pGOWtPNUJCYWZsTzFP?=
 =?utf-8?B?WlU5YjVpVGdxeWg4QlZTclo4Ky82cm15MG5wVjNsdUhFdmkrWWgzbTBkb05l?=
 =?utf-8?B?TlRWekhhNEZkK0FnL3pNVEhxQjdISHNtdktaWDd4VWZ6RGFwNGZUYnR5Z2R3?=
 =?utf-8?Q?pAWlt29pZG31CKMUWOlBRGLOeChl4kcL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V09DWlhjQUJVaVdLZ0lLODBnemJzdW93VDhVdnFwck9zZmUvNk5pazcvK0FE?=
 =?utf-8?B?VmxCeU5qa2x6M3JIOUpmNjVYdG9EQkNHbXJ5UmZoUzNoeUJBTGFZNWZVSnBq?=
 =?utf-8?B?QVJ1THpaT0o2NVBvcFhCRzI2RGZXYndOWFFIT2MzTHJqblVQZm9heEF6OFJ0?=
 =?utf-8?B?aWdHRElMcmxVK0E5M2g2NUdnZzl5UDlSZGgvdWZGbXBuQitiZWVoNS8vUjEz?=
 =?utf-8?B?aXB0dDN2dUdPYlhKYkVSZHR3UTNHbVhpRHZoR0liM1NzZkZFWFNIakMyZXBG?=
 =?utf-8?B?cnMrZ0FJdC9saXh2Zlc2ajlEZzZIVEJLbDZLa2xKZDQ0ckpuazN5WS92WHNT?=
 =?utf-8?B?alJkQ1ZEVGlOMXhvUmtCQ1EyNFlzYkxsTklvdDVVb2pEMlJzVVh3ZDFwd2V5?=
 =?utf-8?B?QU5BTkNOSXB1QWJaZVhLK1JZSWovOFR4WWJwbUhlZE55SkgrY1d2bW1keTgr?=
 =?utf-8?B?Mk5nbStZeFgvQ3BuR0lTbXMzeHBRMXMrV2tPQVhVdFFBU3lFRlJyQlNQbERG?=
 =?utf-8?B?TGJvTko0TG5CWUJualRKdlYxOUp5Q25scG9PdWcvaEZxVFJQakRha1F6OVVn?=
 =?utf-8?B?Y2tUdWJTTnBYM1FHeTExUkhkb3J2NzRnYWRqRnFwVW94VS96NW9OaWhIdlpL?=
 =?utf-8?B?T0tuRUsrQjFUY1oxT1FvTUNRbjAxWnhpVllRWWhHcnFNOElBVHlnOW9lbVpD?=
 =?utf-8?B?TWRXM0R5M1FKa08yV0ZQN0M4eGY1UUZQQVhJSVNqYW9rLzVoNWhGK3c3c3Jw?=
 =?utf-8?B?aXdLYUk5Mm81d2RWL3hIeFFQSnFEYzRpR2IzWHFyT3B6eU5vcW9EWVRyZlF3?=
 =?utf-8?B?WG9KNndCSGdRNHREOTBnUTBwUnZ6RE1VajRhMGM2cjgyMHUvY3NlZmQ0akkv?=
 =?utf-8?B?TEZBQTczS2VzaVFMRjhCZVFiYXM1aG5CM0U0QnQ0SERQWGlJNmxzMXc0MDZa?=
 =?utf-8?B?SSt3MVF3cFNGUFVKdVl1OEtGYkdIdFJDaEc0UzFaMkZZak9FNnhueFBYM2Vo?=
 =?utf-8?B?eFh5K1p4YzdFMEdmNnVtZDQ5Y01Ma0ozY2hRcU1PYjNJQVh0N1duY2hPdERS?=
 =?utf-8?B?THNKdmN4dUxocGYvYWw0Zy9oUFFmOTVkNkFZcUIyRTU3eEg3QnpYWHY4SkNv?=
 =?utf-8?B?MWh2WTloS20vcndKUU1pcTZkNUx6RnE3Q3BJUGs5V3djdGhkTnRQbmFGNWsw?=
 =?utf-8?B?VitoYzczbUZDZEVNWUR2Q2ZPaTNCajZiaTRyVW1JYk9yUWU4RkZtQTJ2RWFV?=
 =?utf-8?B?UmtZcGE4UHJpa2Q1UjVUMTc3VjRRR3YyTytWS3FvUjZuS0xPNWJ4RDl4UjBT?=
 =?utf-8?B?T1B1dlduUkZ0Q3RKM090alhTZnd4VGYrblVLWm1neWdxRVFYM2xlVy9WZW9z?=
 =?utf-8?B?aUxOL2lGTFdSQlRwTnBvS0x1em8wNittekFybzNIem1jYW9rL0NlQTVXOWJG?=
 =?utf-8?B?UnVNdzZ1czdjMytFLzBseUllalIxZGtCRzMwVjUvcGJ0eklnWWk0RUJqQ3Yr?=
 =?utf-8?B?QnkwWjdrd2w1LytUZ2JIZUg0akJjN0ZieURWcFRadk9HNlE0UWFpNUhTU0xj?=
 =?utf-8?B?a2ZUMWhoejBxUVZaNFhhcmVFMlhLTzNWRkROaGlSQkNRSE5BSnN2cks1VmZM?=
 =?utf-8?B?M01lU1hQeUo2WWhEVU5CQWpSenluR3NYWHdwMCtjVC80U2hyYjlJa1Q4dXZH?=
 =?utf-8?B?R2ZXQlFLZXlJaHhROUc3QTcxVys0My9mc3V3a3RmU0VOSytkaHNCVFJvSXVm?=
 =?utf-8?B?Slo2RE9UR1FlSzVxZFZJQ1hZQU5CL3N4dDZEUG9wUTFMQmt6VExqcVJwazJr?=
 =?utf-8?B?L2JCTnJnZUxjd3pMOHZwK3JxVXJ1amJXY3U2V2dQNmFXbWNzb01VMEtzdHRJ?=
 =?utf-8?B?L09jNjQvend3TnRrSVdBWDZXYUp4cmVwaDJmY2RWSFVVaEM4aFNLWDBhZzkz?=
 =?utf-8?B?M1g4L0FIYlVxb3VMQ01ZT2d0OCt4WFdwV29Cc1dCTTdyWStSc2phUUpwaTQ3?=
 =?utf-8?B?TWZUUmZZdXZ1Wm91cngwV0FjTVZQc1Byb3lEb3d2eVUzQWZ2MlhDTWgrZG1p?=
 =?utf-8?B?OU9KZ2dCS1JwU2dKR1orZHQzd1J3UXRGV1phb243K1ZaUFhxZGl2VWVqSVBz?=
 =?utf-8?B?Z2pWZVFIVUI4azVIbkhmZUF6R0RXankyOEhiSVdvSlB3M0lBelF3RGFtblZC?=
 =?utf-8?B?U0JhU1hpVHl3WGI2Qi9GMVVTQmJmcWJSODBhejMxclNraFdZemtuNXcySmFy?=
 =?utf-8?B?cGlSdGhPU3Z6ZHBSU0pIbDd1em5Lc1NIdjNjZldoZ0lwZlFUMjM2dHE0RThr?=
 =?utf-8?B?OFg4THJySDZnSHJpaDMzcVk0WW94QU8yazZjOXBWTElXY2ROaGIzUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7372f8-1094-4c90-7483-08de5350ed35
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:40:17.8559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5IfrpLD0HPhnVmvaTkFcSpmru1o3SJr8jxGyGFQAVn1L9+AJgkoaBcIZnJE8GUJ093ujlVCb3C68R/409//wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7553

On Tue, Jan 06, 2026 at 02:58:54PM +0100, Jan Beulich wrote:
> While the VMX hook never used the parameter, the SVM one lost its sole use
> some time ago (while the original use of the parameter had gone away even
> earlier).
> 
> Again modernize types while there.
> 
> Amends: 0cd50753eb40 ("nestedsvm: Disable TscRateMSR")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


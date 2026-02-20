Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGNrNIc+mGneDwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:59:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1637A1671D5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237026.1539508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtODx-0007rz-Ez; Fri, 20 Feb 2026 10:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237026.1539508; Fri, 20 Feb 2026 10:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtODx-0007pc-Bc; Fri, 20 Feb 2026 10:59:05 +0000
Received: by outflank-mailman (input) for mailman id 1237026;
 Fri, 20 Feb 2026 10:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNHm=AY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vtODw-0007pW-NE
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 10:59:04 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29fbcf52-0e4b-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 11:59:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7183.namprd03.prod.outlook.com (2603:10b6:806:2e5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 10:58:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 10:58:57 +0000
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
X-Inumbo-ID: 29fbcf52-0e4b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oo2QpABFR3hy2GtsCjCG2vncbGuF5Qx7utDYtbwpRXD35FvD7l/CNrllTUpaBVyWuQ9OrKysphoCzsOuL9mFaeP9E4jSzXq5lIPe47tkthjZypGJEBwGJkVYA2G56oAYEGtGfGbio3Iwu7ktobZNTRFEYBfuAlBlqu6G0UjfIQAKKSlJwhPdKQZ4D3Wb9DiEb7gC/0158EQgZF/Eo97QwcOcVeAhv+wJc8Mq1h/HKYLQ34M5RvRaFJvpuZ9WufEQxwKs0K7ghta5uQ6dcP9hnpyPPuaq3+qCyY2Qe2bLEEuz3fBU5Nm6Z/Vs8JwHwofmPqAX/MdxVcZIuEDPQ58Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VErCTf+x3zse7ZXw6pMHjldFOdikMbOkcUOnjiKh8w=;
 b=DvLdSj6LODb5D5G+BzuxSgeTAQ+7ma6hbbsUoOnwl7SBo9hfRqFSFSJSc4pdiMPNycsF+XmRkg2dJcnqZYcDGC29iPqKv1YV9UebSnzzdTe8n4Bd/sFvwV2vImGCK0/Cu0BJGtCnJYmzZgaaFnuYNOpHJsdADWD47hDv3qH7PTm7KC7NNDKIj10GBH8MGFjJz+JTQbyp+rJukzX0qPq/mF9icufowzFqTQH85ENrSKv1nbRyS/OCtzrvF7s+4zilNNvQLFHsDCAYsve9sNUfdUzwyeKIC0iKrrwEHDEeVRaCljaYmWE3Gj5Y+z36Ng9Mzhltrp1KRsR+oU6DAeJfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VErCTf+x3zse7ZXw6pMHjldFOdikMbOkcUOnjiKh8w=;
 b=bE2q73GmcMmuHb5Pn734HdbLFBSvJ1rGSnNu9zaR0gFCHL6Z9gPnXO1rJgAiVBXPM9dGYTOGVmhpDU+ekk1jKTyhRV5Agy12L67+0rKdSUwvtpYMQCM/+savxelhh/n2iuHBFqYyQ29SEF9CgX7yPu6QhiwbMtmUK0LPU8jFX3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Feb 2026 11:58:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, jbeulich@suse.com,
	kevin.lampis@citrix.com
Subject: Re: [PATCH] x86/cpu/intel: Limit the non-architectural constant_tsc
 model checks
Message-ID: <aZg-bU0sjjeWJ18C@macbook.local>
References: <20260220104257.3405712-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220104257.3405712-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0016.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::10) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: d065dd69-c664-4025-4da0-08de706f0b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXdqNFpZL0pnTzdCWHErY3lsZVdaMWhHeE92MmZ5SnV1NFlMK2drblM4S0hD?=
 =?utf-8?B?L1ovOWVwUWlyM1FkczVzMjBUekozYkY0YlRhUHVzVVhpN0NDUHQzM2oxYmRW?=
 =?utf-8?B?OG01NjFTYW80SnlTbGVrVDVZbXlNc09mR0V1ZUhjWGZ0L0FjWFJHNkJwaFZq?=
 =?utf-8?B?SFNsK3gwMVBFbFFWTjcvWmZzWWpVVVdjeWg1WmI5OVRXak5vYzg2Uzk0Sk5E?=
 =?utf-8?B?WGlhT0EwRzJ3ZEd2VUo1TmJmeVZ1bzNpdTVsYzkxbkFlUVFYc3h0Z3NVV1Bm?=
 =?utf-8?B?QnEvQVE0azg0R29HZlF5YmttbmtRemhKanV1RUhsc1Mxd2c1UjZzMW5OZTRI?=
 =?utf-8?B?WDhYM0ZremZlOHJ6NjY2ampybkFlc0lPaGpWOHZzRFdiS0ZXVmFYdmJsU09B?=
 =?utf-8?B?MEJwb3lxSmdpRHI3U2tkbXlZcUVNMFV4VmJnZnZJa09WTWo3NUo5a25FWE9v?=
 =?utf-8?B?K3BjZE8rZis4TGRWdXQ1Y3NYV05KNXEvWE1xUXkzQ3haNDFaNCtxOWZ2TDdZ?=
 =?utf-8?B?VzZ0a3NDNEgrR2dpWUhOWlI2d0hQOFpwWjB6WVUrMU1zeWlrOXlTcERxNHJG?=
 =?utf-8?B?V3d1Mk9tR2k2TGU2bDB0bjhLb3QwY3d5OVhLSkZadXQzVStZR1piZVpBM2hW?=
 =?utf-8?B?UWVjT2wwWlVFd2gza0hIbFo4UTAyTGt0dWVtbHJ1eE5sWWEzbXJoeGYyejUz?=
 =?utf-8?B?WWdsS2k5ZHNpQ3dDOWlFa2RxWG0zdjF0ZFYrRTdrc05vbTYybVdWeTAxWm9X?=
 =?utf-8?B?a0pCa1JTK05nalRnU3BmcHZYMWFkZlk3ejdlUndSMWtaV3lIekFIZzRVOUoz?=
 =?utf-8?B?RHc4SHlyNkZUZCtMUXphd3NicVU3YjB6Y2x6SHoxdzNGdTRPTERESWRXaGNH?=
 =?utf-8?B?NDhUTHhXblEwQUpCRW1JUFA3dm1sU2lnT2gwWHFwV1E4VllkWWVoVGx4VlJF?=
 =?utf-8?B?MTd1NFMrQzJsa1ZoMGJSWWVxUzBnc24way95Y2pZQXBCczVFOEVMdkVFK3Mr?=
 =?utf-8?B?TFZWdEg0ZzZrRjA2c3VrSjB5cEVLelNkNzRWNzBiMktuMjgzM1FZc2lFemkx?=
 =?utf-8?B?WERvdTYwd09QVUJvNG5tbWVXbDJaWGV5c0IzRVVRTWZJYUdzNGRlTEFGaFhz?=
 =?utf-8?B?RlNxQ0tHMWNzZnk3WVdLcUR5eUswK2RIN2VWa1Yydlg5b1oyQUlydWgwYnQv?=
 =?utf-8?B?T2NZbGh2amlWMUlRRGxSQU5veVQyWlFpWGxZVFpuTndFUXlONjhIY09wNG5R?=
 =?utf-8?B?Nis3YkhPS0w3QisrTmNqbmlabFZSSVR5STBlbW5maUFKZVJ6SkY3SGYxcGcz?=
 =?utf-8?B?NjVoZ285TUtNK2VQTkNrblYwN29pQzRSekVXQktsOUorVFAwaG5oM0FkV1lK?=
 =?utf-8?B?c1JHTnBXeG1zYml4WXhJWkhkT0cwN2xwY3BVcVNickhJelpNTGUwYnJ5UHQw?=
 =?utf-8?B?SDZ0MXdRTjF6M3dSekowZ2crdnQ4eVVUQVZxNnNWQ0s4bnRkbGJROUphWDZ4?=
 =?utf-8?B?Rjh1c2RGM0FGQklwNk5DdGFWYXZFN1BXWDFOaWtvU25YcDhKT0lZMkZUSWZy?=
 =?utf-8?B?ZjRUZGxRWW12WW1ZTkNleStOeTJRZGVnYWhYanZmQytqRDQ1TWQ5WFFVWkpv?=
 =?utf-8?B?TjV1T2dRSDB1Q3UvK1NYelVmbXRnbjZmUHJMVSt1V3RMcVMxdVBkOEZDeHMv?=
 =?utf-8?B?QWZKQXVMWEthMEJrWUFUdlJVYVl3U2RPQVhqUW5KSGIraXhOaWd1eVZWOG8r?=
 =?utf-8?B?NzAwY3orMjRWdURkaVVIMzUyWS80MGU1ako2UGtKSzU4SS9wUW9WbDBJdzNq?=
 =?utf-8?B?ZG5tZEttSVdqUUFCWnJmdjhhVlI3RVFHU3g3ektTNWV2bi9hZGt5eE9hOW5L?=
 =?utf-8?B?ajdJaE9oLzkyS0dtZmdSa2hqNUdXTnJpZlBta3dQRnpNQTkyT0RaRi9EUUwx?=
 =?utf-8?B?T1ZEa3FydHFvTVlPRzNJa0dKRGZ0U2IydDdITHNhYlR6b0dOb0VvRHV2VWN4?=
 =?utf-8?B?MDRINzlzVSsyY2tHMCtjemlFWEJuMzM3SXRsSkVXQ3NNTFN1UjdRc2pzYmhm?=
 =?utf-8?B?eGpTQUZpQ3lyQXdJaE8zM0RIdEY3VTdrRXBNWmZaeVJ3Y2Ewb01jVVNuWG9S?=
 =?utf-8?Q?12Ko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UktRNzBqRUI1eFJNZm9JQVIwdVBaYzJZQnN2TlVObDd0OFdSalgwZU9PTWVZ?=
 =?utf-8?B?QVErbE1KZjV4ZFZ6YXJJWU1KN3p6UFVtY1V4RkNLK3B3MUF5dGpPd1FzYjlt?=
 =?utf-8?B?Q1V5d05tZThnNnVRSklLa0Z3V3cyQkwzaEJWdXlKL0ZYbTZDcHZqVUZ5dURv?=
 =?utf-8?B?MjN4YnFPbG4xcklVV3lkdjlaWHlGQk94SUZXdmdHWHc1UjVXNmJTaVA2Nmxq?=
 =?utf-8?B?ZlRjbTF5cnRuUmJ1NVI1cndSeWFnS0V4cUV5M09lNFBTV0JoajV0ZE9lbjh6?=
 =?utf-8?B?MFdndXZPdjFEdXZmSFF3ZisyNFpobjZaNUh2Z0xCYXVBSFV0M0ZSSHJzR1Vw?=
 =?utf-8?B?d050M0RrcWRtMkRrSGQ5bXNBdVpvM0tTWEczT2JwSzMrMFg0OVd1YldKSS9C?=
 =?utf-8?B?a0lCRXN3cENLTzZwc1lsbTNiSUw2Y1BBbjJDRVIvdXkrdWo4dHJ5YUREQWZB?=
 =?utf-8?B?QmFTam1QaWJTcjlNd3dGY1U2NVFHQUh4MHZ1UTZvLzN3Yms3aXkrelNKSjBI?=
 =?utf-8?B?L0xKRFBmdmNtQVViR21DQXE1cWxjaWtuNTErVU1DUG4zVkhiNjVLeXplaHBZ?=
 =?utf-8?B?WDlsWWJwcGk5ZXlaZVZTNFlrcXFGQlRyb0loc0lxY3BHNlp3b1VvMGx6MFFl?=
 =?utf-8?B?YjZHZVZuRTVoZ1Nub28zd0pSOTl6bVh2OWxuUnV5elZXZ2UwNUZOekt3aXRo?=
 =?utf-8?B?Z0lXK1RocUNQVmcxQUhLL0w5WW1rVkRoYkJyNzVvVGxxNm1wWkFXRitiWUgr?=
 =?utf-8?B?M2lEQ1cxbDlHQXFDUC9vS0IvUUpaY2lVNnVjOURLbk1kUDR0L3ZaS2ZZOENO?=
 =?utf-8?B?aWVnTFVkVUpJYW9aeGlCLzM3K0Zvd0RTU3doKzZzK1NsMFpxQ2FyZjdnMXVD?=
 =?utf-8?B?eEtETXdzSEh4RldaeG1LV3haQXEzWk9DUjdMUTF0OHE1cVRGRFZ3bkgxN29y?=
 =?utf-8?B?OWtNRFY5MXRyYUJVWWJueXJHZkRkRnNURk5DVi9kWTUrOVhCQW55YmQrS2hB?=
 =?utf-8?B?WVJzTkl4WG1ELy8wOE9IOFNHMGI3YXZQSjJhQ0J3V05jbjZQR20zdlVNNzNF?=
 =?utf-8?B?b2dCZHFvL1N2NDIwOEtWV1FzN0pPTnU5VFV3cGFhR29FWGdHUU9LOHkwdEd5?=
 =?utf-8?B?Q0x0V0x1SW5FMXFZS1hVUU9lNVQ4c0FUek1NbDhzdmVKdnJVeC9hVlcwdE9C?=
 =?utf-8?B?QnRtQjhyWk94cmxYNWlJYmFFWmpaNXJzZEt4aXdOdzlEVmplSkdMZkFuRUNJ?=
 =?utf-8?B?TTFldm9hV0s0MEpOdGRBZ3drVXBDZXZ0NTdnREU3ZnBCR2FJT3AzeGo1MzVJ?=
 =?utf-8?B?Q3R1RjhVSzRmQmpIRnBTVlZ3dG5sRDA2bEhBeFpLNmFRWHBHZE5mRU5CeEg3?=
 =?utf-8?B?UVVESnMyS0ptZTEwWjhoaWlxbXpmZXoxcmF3MDNUMXJVQkRmMGZYeFZCNFky?=
 =?utf-8?B?WGFhVEUxalhzUFEzSGllYm9Wb20xb2dZMWh4R0NiaThtbWJqTTdGQTlib1NW?=
 =?utf-8?B?Z3d5YWlJTCs4UXRSc2V0NnV6S2ROM3JqMkE5NHArc3UzYThlakY0aSs0ZE9p?=
 =?utf-8?B?Qmcyc2gyVDFRUlp4ajlqZytMU212UzV4VlpqMnVoL2xRUWlQdWswVHo4Rm1S?=
 =?utf-8?B?TU01VHl3eDh2UXBrb3VHbGdUd04zUkVFNjJhU2FZMS9uTGVvY0dmbnhBaGd2?=
 =?utf-8?B?NnUyZU9hdThxR3U4VUhkQmNmZFBkSVdtK1g1cXF2dWFRc2NiUlhRaHZ4L0d0?=
 =?utf-8?B?eGJDV0E0ZG5ZQjJDMXZORnZCbDJ3L2N3V09FYi9BTmRvOEpkUHl5ZDA0VVJK?=
 =?utf-8?B?UVozVWtSbGJMcVhTT1lPcUxIYlVaM3Z0MjJpREw4QW1oVzAzTTN6VU0rVnZM?=
 =?utf-8?B?SXBoVjZSR1VrMi9EL1ZxdFQ5aDdtdFpNaG8zVURGcVJncjdlYis4S25lUlJL?=
 =?utf-8?B?N01MS3NzNXZkL2toTVhqTnpHT3J1dm1USG1QdjZ2cmk0cmJnSms1VkppV3I1?=
 =?utf-8?B?eUo3S0RxY2NMc3M2SExiWFczRExiTkV2a054cnNMOE13dXEvcWlWQkNLaEhy?=
 =?utf-8?B?SDNDOC9oRnpPU2lPVDRBWW5yZWxTSWxSLzdzSjVXZElSeUQ2Y1JSOXh0a2hn?=
 =?utf-8?B?TURkdE5PWXgvLzZCbmwvRzNwajZaalphZHQzaytmQVBEUjgvYWg3QXpCdnR2?=
 =?utf-8?B?WEFUZUszaThzUUVHemlERGRCQ1pBYzV5cStJbTliYTBWeGpiNkFvMEJwVDVy?=
 =?utf-8?B?bC93M2UvcmxtQzBEbXFtMXh4Q0Y0VWl3M3BTbHYvdVArTU5TYUJJdng1MG56?=
 =?utf-8?B?VHBLVG9ZN0d4aVhpSmY3WFUzWTd3dVE2dDVYdk9Tc2tVMklUQ1c1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d065dd69-c664-4025-4da0-08de706f0b45
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:58:57.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6dnBw5Lk4UdyExhXuwnDfEjscEqc2fZEn+tLWrh7Hk74LxDhZ2DGlMIdU2nm5SogvqmpFeWBn3LkinBCydGvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1637A1671D5
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:42:57AM +0000, Andrew Cooper wrote:
> From: Sohil Mehta <sohil.mehta@intel.com>
> 
> X86_FEATURE_CONSTANT_TSC is a Linux-defined, synthesized feature flag.
> It is used across several vendors. Intel CPUs will set the feature when
> the architectural CPUID.80000007.EDX[1] bit is set. There are also some
> Intel CPUs that have the X86_FEATURE_CONSTANT_TSC behavior but don't
> enumerate it with the architectural bit.  Those currently have a model
> range check.
> 
> Today, virtually all of the CPUs that have the CPUID bit *also* match
> the "model >= 0x0e" check. This is confusing. Instead of an open-ended
> check, pick some models (INTEL_IVYBRIDGE and P4_WILLAMETTE) as the end
> of goofy CPUs that should enumerate the bit but don't.  These models are
> relatively arbitrary but conservative pick for this.
> 
> This makes it obvious that later CPUs (like Family 18+) no longer need
> to synthesize X86_FEATURE_CONSTANT_TSC.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Link: https://lore.kernel.org/r/20250219184133.816753-14-sohil.mehta@intel.com
> Link: https://git.kernel.org/tip/fadb6f569b10bf668677add876ed50586931b8f3
> [Port to Xen]
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


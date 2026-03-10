Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDa1BYHfr2nkdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:08:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C4B247F00
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249884.1547258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzt46-00086x-5s; Tue, 10 Mar 2026 09:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249884.1547258; Tue, 10 Mar 2026 09:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzt46-00084N-2s; Tue, 10 Mar 2026 09:07:46 +0000
Received: by outflank-mailman (input) for mailman id 1249884;
 Tue, 10 Mar 2026 09:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDYK=BK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vzt43-00084H-Ve
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 09:07:44 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 970c0dc9-1c60-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 10:07:41 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by PH0PR03MB5861.namprd03.prod.outlook.com (2603:10b6:510:3a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Tue, 10 Mar
 2026 09:07:37 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%4]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 09:07:37 +0000
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
X-Inumbo-ID: 970c0dc9-1c60-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ul/bd23rdLsXEPxmituoioCMijPWUsQGYsWTsEPplNmsvbCieEo4IVjXgyuNRKV/Agf+V6o5HEa0OFf3cb9N7jlFk6McypwD6+Z6qz1Ym5RD8vo1UWP5RkLzipJbWvJbPHtxQplfIr9JFaY11mhP4zVfuaoQaD1P/r3lK/+6Kw1/aUXZ0QgnUhWwJQ0BQBDBxg2RqcaJhfKIPwiOJTWeiBN/728n67+Py3jG4qyrfQejmEyWXmhdGe5FmiuqCcodiQ0yy6OXEqIWdJuRmjdQZ03uAMw/LLrsAmZlEwCalxXnLWwizIxudmTj/jKzHVjLltcyDTF2F9jA6VWhRfE1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V59VMzch7YVpTMT8Le0sHR09r5yilpvHjOVWb5ku7Nk=;
 b=sd05CIU17Q8D3Z4uVVMpJPKrDaooQV4dihoKkk2DfHGiCz+D27BCNfDQPtf0QMWe3dzYCCnlXrukKtX1fgxkvwuALpuodYYB+mL1wEVxqY1LsZ1JYaMnfbl1SFB1Zr8CYrXs0EQgD3uGcnX5UUsX9UUM/tFsnBohyMeSHvKkPEiLp95G9VEarb7gGlTIwbIcR1ianSECLOshM4R6pKmFGw6UHBsuimomX36Q656XBLyuxF3MGDBusZuOmKDj+6G2RPR2eHX02YdrmjtHgsfmFv8Ns6fWTCEps3iyxUBVB/QwXFUhZEPrJrDcnXCgTU38MA16n88JjHDIBzLMXDcZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V59VMzch7YVpTMT8Le0sHR09r5yilpvHjOVWb5ku7Nk=;
 b=SPyqERMjle39aKk4DiP/GV1q7L5tmJLZ5a40BKaa+PIFLr9H281J4kN26OAz+Z1Cnt+MVs0eszscd1XncUPc4jpJnMIFcO5hl3woXlQ+kkrtcDtmdqalaAJo0cAttVJ5XHMFEC0elZD2CYHz7mMlgcUjJUyCLG/jDRQfyFw0Vzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Mar 2026 10:07:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] core-parking: shrink core_parking_cpunum[]
Message-ID: <aa_fUpLqaPDal_-l@macbook.local>
References: <29922662-8b95-4a69-9401-11480df59cdf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29922662-8b95-4a69-9401-11480df59cdf@suse.com>
X-ClientProxiedBy: MA2P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|PH0PR03MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbb1d06-c6e1-45a0-8605-08de7e847750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	N1t31VkKIZm4gmyv4USPAWMUQTL4CAzhp8yH4C59R3FHAJ6Ee6zHKPRVroseeFuhCxMQuv2AmduKjlz2uNObOqB3wcPMczBru3KE8u7XfvO2gIU1ZrM+ls3/0Hn4t0G0StISIua/eETp1COS2olyuGSbTWgamFA369gNXWj3NIEzETZ95bsK+MQCCvhCQYf/eAgxk+e11Atg2yUXhiEJRwTlKWImy+fSy9n4M/SiEIrOVbxpqturbwOszmXRdMEWcsCnTLWlf94GSXIbe8vQDYEOgy9yN0XjM0WaDc9pmTcNUXISilcSCZ4hPTv1rvq7Uov1057Rg8XZGYdnohQ99SzaR6cIpBxGQTsnYW8syyvitfW8/AD00fUJ4gUN0UBpufkZYwEYPNPRVMB0w8NhdUU6dlD41mWf+yN4TlZNLE+fsU7IFYncxKEoY34iPz0VkMx4I7RDJm46G7psl6cWoGe2kITc/yGeKTXOiOxUyJCA2GyszlSBMHdrYf5E7GV0q7VMLkyWg6bOXS7UE/hEn3OwOQBLka6NOAJVi2uMuMp/5qZWDSrzQNLpbQyBdi2rxMhf5Ea9VyH1wu8vNzDMIMLtEVgsVgF1Wb9KvtaU6ld2vHAOBdskR8HnRVsVXSXUvmQKuukSJmYgFu0u1+BcvCjxAaQnZKNOC9kwgVjxim0/w+CzSzy0R1a7xmgSNGYIWUhIkrfmWg5YJe68Uc4JM1U/VdXkxqBOwMFvYxJO9iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmFpTUxGUWw3eHpqWXh2Vk1EanEzR3ZrTGRzYjVPRm1WRHkxLzlxZlRSVUsv?=
 =?utf-8?B?bU81dk95QjhFWkpaYmIrUWdRODF1RGVjcUFhNkFndjVhcjczZjhncUlBQkdn?=
 =?utf-8?B?S3BBRmMzWmZIa053WkNpZ01oR0ZUM0JZRy95c29ldXZGdjZFTnpyazkyRmxX?=
 =?utf-8?B?VEVOdUlQQ3l2OEhXYnk2RGxwZGlFSld6RkNjWDNOTWJmTEdXNFBaU2tuMWts?=
 =?utf-8?B?UDdNZ3I0d1g4L0tHdUJlMTUwbFo1T2hnNVpUSU1TSHdwR0l0a3ZlRjR3d2F0?=
 =?utf-8?B?bWtxQVZxa3VMVk0rOWhjRHFYaW5qVHdwZXdSUEN6V3Rtb2lVT0EvSVQ4V3Fi?=
 =?utf-8?B?bm9pK3pnaXRCMzBaOVdodGR0TnFFRzY4b0xsbUJLV2VvRkg0SHo1VEFyTUNo?=
 =?utf-8?B?eGQzUTl1Z1Juc1VRaWs0T01OaGpFQnVGNUMxc3VTcE9VYURqZ1NlZGhjMFJu?=
 =?utf-8?B?bEpCdXpZYzZxdGIwZElJcFVWWUxCcmdoakFVa1JVcVlXWE5HT0ppSUVxS2Y5?=
 =?utf-8?B?RUIyckp6Ym4vOXM0KzNCMmJiYzNLWGpGaG10bkFmaFk0ckg3T2lvS1J0NG5N?=
 =?utf-8?B?aHBGbkJORTJNQUZZV2ZVbEZ4TFdDb0NtTzVWVEViNHY3L2taaHlVOU1zWG9W?=
 =?utf-8?B?V2psVlZmRmpqeWlxU21BUFQ0TGpNQVRJMTBJbzFpOHp1VmQ2QU5jM1JTUThM?=
 =?utf-8?B?RkNSdDRwMzZrbkxSb2VrQ1QzbGpVVXRXZEo3WFJwVEpJa3VBeTJSZGt3QlR0?=
 =?utf-8?B?VWVaYUNPaGJPdFZYWm5ZeGhhMXV4OURJb1hDNy9vc1ROOTUrcHE0Ym9MZUk2?=
 =?utf-8?B?Nzl1OUZscC9GMEZLbmlNdWRMVkltUnFsMkdvZU12a1hGK2dQM3V5dC9idmQv?=
 =?utf-8?B?Y1cxYWViMHFQWGNGK0o4TjFyUERmUnM4dFJWZENaa0tmYnI4UGsvbnVTMUcz?=
 =?utf-8?B?NFdWa3FiZTYxcXoyQXl2bzYvOFlEcVhQaWpBMWpGVklHUWpkNTJXcThudVk1?=
 =?utf-8?B?NkNwWk50U3dtOTVwRENXTlhBd0x3MHhQYUs2NlVhOUw5K2ZDWmZUbGszTUlz?=
 =?utf-8?B?TWkvcklRblFMVjZad2drbHhCZ2pWNUJSTyt0R0Y4QXhCWWhpTFh4WFdmdmhX?=
 =?utf-8?B?WEZxbnMxckxVaW0yRGV4K094NXJHbVE3cjFjb0pEM2htWGhGOHppRUpVZ2xM?=
 =?utf-8?B?MjZWeDZTRWVSaUNwalpWZTU3VmNTZW44RmtNZjF2UExIS2JEQ1lNVGFGNkVM?=
 =?utf-8?B?c09jNm4xKytTa0hGY2JkekNKa1hEYk9nVVZ2UHZFM1AvdTd5T3NIQnRGblpZ?=
 =?utf-8?B?eTNheFJVZmVQMlA1U0s5MFFSV0xaMkk0N3JkSk5PV0xoWmp3bDZsUk5nc29S?=
 =?utf-8?B?WG9kdnMyL3pWZXF1dzlWZkU0ZjJiV21KejB0MGNHeHlLZWlLUjAxZTJvc0NV?=
 =?utf-8?B?KzBmVFBHNFNhYUZxdmYrbEYzSHBlWWFNTXRwYzlFSXdMOXhUVGtkcENEUm1r?=
 =?utf-8?B?QS9MMXR3ZmxTMVJRbUt1d3BLK25WRm80MDd1c2tORUxINGtwK2xZZ3NQM0VG?=
 =?utf-8?B?NUEwZkFFQ2ZWQ1lUQ3M5aUx0UzVMZ1lJY2Z5QmtRWjZLSmdxTUN4YkN3L05h?=
 =?utf-8?B?dWFrb3FNZGQxNURUSmdsNXJsUWJvenNKcUJYdmZXVC8wTTV1V1RPS3dpY25s?=
 =?utf-8?B?NDEzOVRFd1FuRXZJdm9TSXNmbkJ0b1k0VjlVajd5ZEd6cDduSjZENzh3Z3Fn?=
 =?utf-8?B?c3Y0Y1M4SWV1L3Vlald0aFdlNlVhRWU0R0xob0Q0LzN6UVFWVVZPTUtkL1kz?=
 =?utf-8?B?UEMxR29DcmpxMjE5UjFCWDZUdFZvVFhlTE15TXJMc1p1K2VFdHdIK3pjdnVs?=
 =?utf-8?B?YUljUUJNR3VHTU9iczgrME5OTUxNa1pHMkVnTTlzaHVlYWNScnZackpJQ084?=
 =?utf-8?B?SGF0YmJwUXRZbVRSNkJmMDZVSkRWeEQ1NjMyWmhZVFZoU3FlanlHbHhzNTdi?=
 =?utf-8?B?emsyTkFRKy8zR1BsTUloRm51dlJXK0hDWHFKNUhUNlE1NS9qU2ZhSHJJSHM3?=
 =?utf-8?B?eUdWWTFMbVpDNGV5b3hSZnZBTmlzc3FjbHprbVJOa2dwZlU0N2UxZ3JrWXp1?=
 =?utf-8?B?cjNJOGlIOFRwcGZMdGdCU2hYMTVOcWxBZGp1UGRzeWJFQVVEZ1dvaGVBY3Fr?=
 =?utf-8?B?Um1xNWNxT3FVNlhOMWd1OGhWRUhGVWVKTkU1ZEd6YmpSSUMrdGNFRE4xbEVn?=
 =?utf-8?B?V1FQN1ZlVGdjdWZ4bUswdmdwR0w0N1FPSy9sbXd6bTVKOWNHZTlEc0MxNmFv?=
 =?utf-8?B?QmhhOG5BNXBkSUI4S2VYNlFCbXVodktPNS9PYjhPdjd1SE9jVkNvUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbb1d06-c6e1-45a0-8605-08de7e847750
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:07:37.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zitMzcQBGw/fAYrvSJSMn+Fei6beppJADGH4CK2ESbhWSJK82Znuow2osjZ9rmHIeHUkJ7gDzZfALqnrwUFIoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5861
X-Rspamd-Queue-Id: 65C4B247F00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

You possibly want to adjust the subject, instead of shrink I would use
"dynamically allocate" or similar.

On Mon, Mar 09, 2026 at 04:35:34PM +0100, Jan Beulich wrote:
> This NR_CPUS-dimensioned array is likely unused on most installations.
> Therefore it is especially wasteful for it to consume more space than
> really needed. Allocate it dynamically ahead of registering the hooks.
> 
> Further the array having all fields set to -1 is actually useless. Nothing
> relies on it, and core_parking_remove() doesn't restore the sentinel for
> vacated slots. Drop the initializers altogether, rather than replacing
> them.
> 
> Also take the opportunity and update an adjacent variable's type, where
> a fixed-width type was pretty clearly inappropriate to use.
> 
> Finally drop the redundant initializer from core_parking_init().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I assume there is a reason this is acting (mostly) as a LIFO. Else a
> simple cpumask_t would suffice.
> 
> num_possible_cpus() would be the more correct thing to use as array
> dimension, yet we don't maintain cpu_possible_map on x86.
> ---
> v2: Use dynamic allocation.
> 
> --- a/xen/common/core_parking.c
> +++ b/xen/common/core_parking.c
> @@ -20,6 +20,7 @@
>  #include <xen/cpumask.h>
>  #include <xen/init.h>
>  #include <xen/param.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <asm/smp.h>
>  
> @@ -27,8 +28,8 @@
>  #define CORE_PARKING_DECREMENT 2
>  
>  static DEFINE_SPINLOCK(accounting_lock);
> -static uint32_t cur_idle_nums;
> -static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ... NR_CPUS-1] = -1};
> +static unsigned int cur_idle_nums;
> +static unsigned int *__ro_after_init core_parking_cpunum;

Don't you need some kind of check in core_parking_remove() to prevent a
NULL pointer dereference if core_parking_cpunum hasn't been allocated?

Callers of XEN_SYSCTL_cpu_hotplug can set fn = smt_up_down_helper, and
that would call core_parking_remove().  core_parking_helper() already
contains a check that prevents accessing core_parking_cpunum if no
policy has been registered.

Thanks, Roger.


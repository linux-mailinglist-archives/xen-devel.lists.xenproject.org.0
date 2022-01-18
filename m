Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C55492ADA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 17:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258602.445554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9r6d-0004iq-Ry; Tue, 18 Jan 2022 16:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258602.445554; Tue, 18 Jan 2022 16:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9r6d-0004go-OC; Tue, 18 Jan 2022 16:13:11 +0000
Received: by outflank-mailman (input) for mailman id 258602;
 Tue, 18 Jan 2022 16:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9r6b-0004gi-V8
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 16:13:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860bdd63-7879-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 17:13:07 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-_fisqoFkMTKaigKpTddzJg-1; Tue, 18 Jan 2022 17:13:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 16:13:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 16:13:04 +0000
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
X-Inumbo-ID: 860bdd63-7879-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642522387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UFVMblRFW7m+oaFwR03YITvijHcUty1Y7Fdf1lt1cU=;
	b=lghL6J8yexyJ72yXPJ89+Qkda4HI18c6EMdM1SijOibvupVI92t0vnGCovImbHnzQA81ne
	7HcPOxFWEJDgOJ8F475v6OyNXiPj08evtlRPNbSK6dl8qtM3mRfeWdSux1FKFG9BYwKsIx
	JkwtSgtefez+1/Unxsd6/yhtWeWP8Rk=
X-MC-Unique: _fisqoFkMTKaigKpTddzJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKqv757hjc4vnEmOdLnvYIRSqF4oEKcHAUfINxq/if9QcGSZMgNTqOEzGT7HlNIiMd2XJGzlQU7+uYeG+gp5veWHDSDpFqwualAk115lIdNCKQcfGlKqY9DA+o8CM6YsDNO+P5yUSTWhbAEozs/nFfdHsZUyH8iZz5Jf9aBZ3fMPFdyaIZSi4WlwZRrZRNFYRlmaQ3Nh0WCPSI4XYcc6VFCizPtBgdt+NBw4s2TAlJjbKoJx+l300WMkai6OhMErci2IorKfyt0Fd0kQKBNmtzEMxny9Uj8rFufrfALlSyaig7YJ7kf6hVzR2MPH9kt4YRUetxhr0DL2qeJM8K4vAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UFVMblRFW7m+oaFwR03YITvijHcUty1Y7Fdf1lt1cU=;
 b=i1EG/31tFCQFLhHRecTW94P6VR+3EoEekRurgWZLRvz9lQ0TWi9ehxmd/PfffP8nnQV9oGFXDnKnmaIKGKOwO5xdiarTf8LGbKOp7G7IUvGFCR0fz02jm1n5HdFNlccyF/XFvbO46HoNDjsqL9bpTPvaw/Z+htYT2MRXB5CFZ5L0AR6Ei5LFdJ4QB+Lxtwo6UmxjcSkfCJqAxkUB3Jmh2mfjjoLx2KgYkCQfEWCUqyC5boJoKCKHLSfK8A+6plQutetWH98vMFPqI+b8xoOxDhMuXt3A17v49pxIYvU4f4dBiiLYNLwmSfPTmUvi4cMb9DWv1TGLBB0K0jIGzFfvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3fe681fa-d01f-d5df-23f2-6c6d8089fd8a@suse.com>
Date: Tue, 18 Jan 2022 17:13:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-9-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-9-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa384769-b6f0-426e-5fca-08d9da9d687d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5618:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB56189324B3154058F5470354B3589@AM0PR04MB5618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x7Pv9UndX8M+YksT1915ecSwXI/EeNbT+zddlVpwgn85HOayabELJ8XEyxPdvBcF1ejqmyl0kmvsb0MHPHZJ+mBsVBPbwMh7Mhl6cOxNtVuiR5+2dSOVcAh15xGqSmctCeM3lJNJjVhPtCDi5dNQtzYmGI/d59oTd1OcVP0v/Tb+ebPJoZw8vv07N2vaolpwR+Eb33nAzVJ5hhzJorB+iIU1wFbgbzDQNnVhZSFzvmztJu2ZdZzECOS45suLEaTni8A5P4gj6K2ACTZRfrcMgbmKbc7O/IWt7Ot7rh1sjw/XCKjltsjdvtydMAigrNa9mB3Xn3LYlSNblfZtuzmt/WMl+S1j/shpH2DlIZrBi+pleh16ZkOPwoiPMLrYJa4ripRoDqzHVGrqCFNzWSEPBLt2HCBhSd0/Evg1m8g0joIOyQQ9sMImu7iAuDeKzF/d1rtxHWzk47OKa/cYFxBPnZWzIoBihwaBlqBPjzfcSWNdkvcZi5TKAuf2YFaFKbx1jo0h0v2Nk5ptf31BqtMc4458nef2O54Odya2gC96Eeb80E28emQJpjUb4xF9MmmRX4a9Y0Yt1hLxmkhS/lGH50s2zwCYdNvnKPNy3jHtlDTaHApl/rCUt4Dr3zcaEs+Jj85pngWFt+ph8dLJHaIsl5AopeajAy191LjoXEC6X/gMhhymLEcYVBm3QqPsLK7mBdqYrAfRwR6hN4JgECZsIiEtfiN0M7+Xb/q1Mao6yPag9PYOo0pc+bBoyJe3szQE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(5660300002)(8676002)(8936002)(36756003)(2616005)(31696002)(2906002)(6916009)(38100700002)(83380400001)(508600001)(186003)(6486002)(26005)(66556008)(66476007)(86362001)(31686004)(66946007)(6506007)(316002)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUJuR1VXWE4xWHNDQU51RHBkYjlSVU14NnlHeFEyWnpPZGdKbnJ0UlJicnps?=
 =?utf-8?B?YWpQR2p0UGFaaDNEMDJZK2UrSjZCRjZHRDBjQXExcGZKSjZnWitFYnJCKzdI?=
 =?utf-8?B?WEpJTHk0eHFaZjc2bStyMzREOWo4bTNLbUNVUVloSExrakliaFpjUXFKREtj?=
 =?utf-8?B?TmtIRDhjZVBaa2RuQzdNRGJQVE9aM0grUTZuQW1LOFZlaFZJYWdFZDZGcW01?=
 =?utf-8?B?NzVnZmdyenJPL2hUYmVxK0U3UmlxVDZqVzlJVDdPZFByMGJJVXZSNFFHQjlF?=
 =?utf-8?B?NkpiNTBQN2lWWFd5bVVYMlgxdkJCQzVveXVRN3BFdmV0R2pyYS9OV1Y3QXJl?=
 =?utf-8?B?WUpzTUpyV014L2dMcElGYUJQdTRSUHAxM0FBUGF0bElBUmtXKzZKZm00Wmt2?=
 =?utf-8?B?MHZQa1lDaUQzZGpSR1g0S1ZGazNPak4wdk44SmhyUm55ckZ3QWlpd2RONzVV?=
 =?utf-8?B?RFAxNzR1MWhrYVRSSUVyaXhmQ3ljVElsVFA2dStrYityNFRlOWRpU3BJZUJr?=
 =?utf-8?B?VGpxVC9pSUI2empXL3BldSttUzdsWFVxMUhUY3haVmF3T1pOWCtrU2h1NUxR?=
 =?utf-8?B?UXdDUmkvanYzTmZhQkFjb2RkeWdORmlqeGdzakFMUVd4WDd1WS9FVGdBOXBK?=
 =?utf-8?B?SkVwcnRtS09hYmpaU0d6a3piaFhmUlN5bUk0Kzd4RVVDUThvUEFFWURFUmxD?=
 =?utf-8?B?N3hta09OdkZLVjNRZDNGYWtGcnlYN043UVcxN21DanlLL3N0VXlpTlpvWWF3?=
 =?utf-8?B?azVwRVZGOFFUZDdES0Q5WTZlVlg3dVdsZDhCdTZsbnBNNTlYRTFtU1FURi96?=
 =?utf-8?B?MlF0YnFaM3UvMzBuY3Vpekc2MStlUTl2WWVHRTNuZ3BwVVNRdjlUZDIzaVVY?=
 =?utf-8?B?M2tHZVVRTm5na1o3azVWcmkwTncwUDBsR1ZMc1BMRTIrQUF6bVFJSnY2NTN5?=
 =?utf-8?B?azY3Tmg4dmIrTzZMdHMxRzFzL3B3dDV3bytLMkhrUTZCOGlKMU1vRnA4S2VH?=
 =?utf-8?B?YTFYZ2JCUkdBTkJyTHVHTDhFTHo2eE15SVJwRFJsU3VoNjN0V3ZFQkFvZmFo?=
 =?utf-8?B?YjNFZmpWQy83T203a1JIRTZnQnpZQmwxYWZMY1JDZXg2bnlQNjJzcmxyN2to?=
 =?utf-8?B?VU9xRy9KV3gxWXN1QVNxY3NUeHZqeVJZdFQ3VEhHZUJLaVRad25sTDJyUlRT?=
 =?utf-8?B?cHlPN3FuQlZTSG9iVzI5Sm5OZGlYZ0NuTmdiMnlKRGk4UU16SEFETWZmY2I0?=
 =?utf-8?B?REovNnFuaFpHUVU2SFpDcHFPeHE1Y2huOGt0bWpNdFJ4NmlvRjBWM2NJaFZj?=
 =?utf-8?B?WnRUMDJxcFo5emUrVWhDVndWN1liL3BwRGdDcExlRExqdHVHMGVBanVxb2xI?=
 =?utf-8?B?TzlyMlZ5MFM5Mmc0QjI4MXlxSFNuK0Uxdk9vQzVDUnRWbkF0eEZlbk5VZW41?=
 =?utf-8?B?Q2dpZzlZaXZNczgycVdnVXQvTjkySVU0d3dJNytGTy8ydksxQUhmTWZHVG90?=
 =?utf-8?B?bXI2eE0wcmNKdzBZV00zbndhNll2OTFPQ1hteXBPUTdkOHpBTUFRcGxsYVlL?=
 =?utf-8?B?NERNU3lFemlKTUNmd3BYNXRYSngzM2xteVdRUXQrZFgxaHk0cU84VGlVei9x?=
 =?utf-8?B?U2hUZElWalVxVi9oRk1iRXk0eWdnRis4VlpGK2M5ODFJSmVkcVhYMHlPbU5M?=
 =?utf-8?B?VDFYdDYvTzNjU3oxSEkvSTRnQjhyeUZsNnlkb1JCUHJ0bEJSZkhzaFdwb0Vt?=
 =?utf-8?B?b29EQ1JSWTN5ZVZoWFR0Nno5dzJWdXB4ZnlmdDVRb25hNkNnVnp5cTV2M1hk?=
 =?utf-8?B?RmtpSTlCN0J4NStLRUxUbFNsUk1QQm45NWFPaEREN0RFbWhaa2plb25qL0hN?=
 =?utf-8?B?cHd0MkVQeHR3cml4TW01UzRyZm4yN2Y3ZzQ1UUhjeUdWY2dHb00rTFFWcElL?=
 =?utf-8?B?VUdPYnNpSmp0Yk1JcjVXQlB5cHF5ZmlHMUNFZERyWnN5a2ZqWHJ1YXpzakox?=
 =?utf-8?B?REpMdlBNWWRJcmMzYU1DTHdHODZKNW1qRi9Kd3BlMEs1SGVsTDlzZFJQajBR?=
 =?utf-8?B?c3NNOFJmSjRZVkpaSUhVVWFDQmMyR3BzTnpNeDBrbnpDNnl3d1VnZXlRQlFy?=
 =?utf-8?B?Tmc3YmFVOHlHNk1SNGsvUk1wcm1Uald0MGRNZGVvUUtwTEVxZlE0dm42RmFX?=
 =?utf-8?Q?BljZ9TPJHSri3pKrDg0QiAo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa384769-b6f0-426e-5fca-08d9da9d687d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 16:13:04.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cpht0QS/YZmDjhxkWOb/Kcn/RqcghEh8eb+2B7dZSU7ipZfKa9T7B6uN3TkzgOfgpoXPme8scULq75XZBfPm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5618

On 23.09.2021 14:02, Wei Chen wrote:
> One NUMA node may contain several memory blocks. In current Xen
> code, Xen will maintain a node memory range for each node to cover
> all its memory blocks. But here comes the problem, in the gap of
> one node's two memory blocks, if there are some memory blocks don't
> belong to this node (remote memory blocks). This node's memory range
> will be expanded to cover these remote memory blocks.
> 
> One node's memory range contains othe nodes' memory, this is obviously
> not very reasonable. This means current NUMA code only can support
> node has continous memory blocks. However, on a physical machine, the
> addresses of multiple nodes can be interleaved.
> 
> So in this patch, we add code to detect discontinous memory blocks
> for one node. NUMA initializtion will be failed and error messages
> will be printed when Xen detect such hardware configuration.

Luckily what you actually check for isn't as strict as "discontinuous":
What you're after is no interleaving of memory. A single nod can still
have multiple discontiguous ranges (and that'll often be the case on
x86). Please adjust description and function name accordingly.

> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -271,6 +271,36 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
>  		       pxm, pa->apic_id, node);
>  }
>  
> +/*
> + * Check to see if there are other nodes within this node's range.
> + * We just need to check full contains situation. Because overlaps
> + * have been checked before by conflicting_memblks.
> + */
> +static bool __init is_node_memory_continuous(nodeid_t nid,
> +    paddr_t start, paddr_t end)

This indentation style demands indenting like ...

> +{
> +	nodeid_t i;

... variable declarations at function scope, i.e. in a Linux-style
file by a tab.

> +
> +	struct node *nd = &nodes[nid];
> +	for_each_node_mask(i, memory_nodes_parsed)

Please move the blank line to be between declarations and statements.

Also please make nd pointer-to const.

> +	{

In a Linux-style file opening braces do not belong on their own lines.

> +		/* Skip itself */
> +		if (i == nid)
> +			continue;
> +
> +		nd = &nodes[i];
> +		if (start < nd->start && nd->end < end)
> +		{
> +			printk(KERN_ERR
> +			       "NODE %u: (%"PRIpaddr"-%"PRIpaddr") intertwine with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",

s/intertwine/interleaves/ ?

> @@ -344,6 +374,12 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  				nd->start = start;
>  			if (nd->end < end)
>  				nd->end = end;
> +
> +			/* Check whether this range contains memory for other nodes */
> +			if (!is_node_memory_continuous(node, nd->start, nd->end)) {
> +				bad_srat();
> +				return;
> +			}

I think this check would better come before nodes[] gets updated? Otoh
bad_srat() will zap everything anyway ...

Jan



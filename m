Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F584087A6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 10:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185561.334262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhlb-000803-VQ; Mon, 13 Sep 2021 08:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185561.334262; Mon, 13 Sep 2021 08:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhlb-0007xk-Rw; Mon, 13 Sep 2021 08:56:43 +0000
Received: by outflank-mailman (input) for mailman id 185561;
 Mon, 13 Sep 2021 08:56:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPhla-0007xe-Ul
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 08:56:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a77c48e6-3e3c-4092-bf75-aa1f37b17549;
 Mon, 13 Sep 2021 08:56:42 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-ZqIHGITUMlGU0FZzTE3kvg-1; Mon, 13 Sep 2021 10:56:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6670.eurprd04.prod.outlook.com (2603:10a6:803:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 08:56:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:56:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0069.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 08:56:37 +0000
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
X-Inumbo-ID: a77c48e6-3e3c-4092-bf75-aa1f37b17549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631523401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JALDp/VUGx0Jw78BgXO6MzlUdZlfU4RREqGisKbNKd4=;
	b=BuUdeDHQyhIg39Bw7ohl87kveHpaSxuOeLl+4mi1lKO9Us2KSFtbNt5OjUdjADVWBRaNuo
	ByNoOMyj5TiT/JgrJ+DwIbXM9Gf//5OrtJr7NDVJnN3Tiadwgn5K3KdtTvmkk7eCRkideo
	I1bwvlBhr2LRRJJq51DfQ3lZY2s6X7Q=
X-MC-Unique: ZqIHGITUMlGU0FZzTE3kvg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExUOR10L7Jw54nTUh4OUr4O7H3ggtjlFpB5hJQkbStFdRoj1armjEu/yxO2UzGpM7IQvvwVdthZ73Te6j5QmeKnKLbeCVF9T1e92dHd+Ybezilczmyd83LLQjEcTgj5A2KfNgZJCIInJmrkt6GF2nCqOxlNIP/F6ZKnTBcZWQ5OFz4UQ8wlkyslS7EQxlQ0iv6t8v7qStccmfzXMZJr7zq4ifXs9EWmR76+GG7RHZQYmhJ2kRgjOacTBBHIk4eG/uQFG3DwBcxtUYLSALI5V8RZPQe/PXpxE4MIM31dctoCrLB2fhXIphtCL/njNCeHQowAc3nEYDwUQEsm8m98jnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JALDp/VUGx0Jw78BgXO6MzlUdZlfU4RREqGisKbNKd4=;
 b=AjqPcBsCTG0hpTIC5Nkc+Noymvh/yWJ+FE/lA+HkSMq1uMMQ5Z+gf8DMBnX78uL6R7lHq3VyvfmwI4+8ORdriO1xMG6HO/1xK5AZCAiejaiwlSNEir8b78N2/zjlhBp2y0bwBxP9xJFevbHxPmgcJkYZMtG6KsGl2xt1eZQJ8O9sSoj3UN96RMcdIOEltGEt0MDMGHgFKllz+F5h3PwcDrr/VxdzctJhRtH2pMT0toaa07KFAfOY8LwHBYsb62QVVCrDbatZaiXlccgNtg78DR7BpxRU4luMRyFUWDfX4umnKoiJOWFxhzgko4GIaXaHZlO7eNdjTLHlKZmsffLfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] x86/mm: tidy XENMEM_{get,set}_pod_target handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ff324215-ccad-bb05-e36e-d711ff7c960f@suse.com>
 <34f6a6b7-1ffb-5820-afcb-bc1ded0f0005@suse.com>
Message-ID: <9bb167bf-1542-32d7-9d24-2d865820e08c@suse.com>
Date: Mon, 13 Sep 2021 10:56:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <34f6a6b7-1ffb-5820-afcb-bc1ded0f0005@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eec97f5-7a9a-49f9-9e94-08d97694658e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6670:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB667032B12DF74AD4E544667BB3D99@VE1PR04MB6670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t2bqGAFp73XVDWiXtQVIzBcFBKwGKgDIr6JUKKrJaYnPK+2Mlu6M8msABYcdDzglq40J8JeLIczxLq2Mo7ac2kFJAYlF8kATlQ3be6dewuTgKJLES3dVjbHKEUewGhp+ZsAECgF8IviQetOAfPrlcyJFO86fQFvo+3HC6UWCuOC0+ud8HL5JWRy18/z5Zn5EKIZk0dvH9gfWkqBWvkTtcp+IsKFH+6O6XA/Hb2EVG7FVNqKh3LqoS8JehizOq4pxGWTUfPhFhahyZW2PdtbvTO5NJqZumSh+kG/yWUgzXVzo81fvbnVsOVIgZJQ5JJp3QxcyrUszqZar9GvrOaZE3IUbnJs4i+bHmf3FS7uTQzdtGm3QYHVviocBa3l+8oU+BI/xYxoCUqj1AmpGQa8jSAXVixpO6GQyI7ffQzwD6vA7qeQI7fsWfAK09nIRU0xmkHNOasiZ9fm/0x1Fc75qjATcBTeH/HG9a8bxpaCYMYuZkztjRjhqVslgS8FjYsHW97+8eZKocXlHlpwskOxGEFjcLfjZ7blr6hdnNAFT1ENvl2M4DJzeW4yunPrFSPfyIaHP/6xMSGdyNi1346SXO4DWGmS1+B0cIqQOCW4+yU4FWlKAg31pe3+3yHcIbO2qojfC6blHYsBMSUuUnckJiAoSayfzH1jkRMHt2Hhu9JeethJ6J1+JUyzYzLnTu3+hUZW84Bdpz9J3I8gKVm2tRRPqpa2TwWJvitZ9KE2+MlccQYyWb2p2e+RKlmw74l6G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(366004)(136003)(396003)(8676002)(31696002)(956004)(316002)(31686004)(36756003)(53546011)(478600001)(66556008)(66476007)(5660300002)(16576012)(54906003)(2906002)(66946007)(6486002)(6916009)(38100700002)(4326008)(86362001)(186003)(2616005)(26005)(83380400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlArZTFpbnpFcURkNlFzcjIrTVJvZUdWNjV5SXEvZ00wYTNGVE9idEI2YStx?=
 =?utf-8?B?c3JVeFNIUEJyaW1XbUx1UjlnZHZHczdsTm96VUNGaHVFSG4vbnVBa2VMamZT?=
 =?utf-8?B?di9RL096Q3VPcGVYbWZ1MVVkY3RIeEZXVGVvVnFQTERJQjZKZFZFb0k1NFRy?=
 =?utf-8?B?bE1lNzNZL1VjdFJjTUJ3K3ZXZHE1Y0ZRYmFJK01Jci9KZWJHajJUVGt4QUI0?=
 =?utf-8?B?U3BCK0xBTklhWktDUnl6b2h5S1ZMVE92TUltNHVpSi8vRFMySldycitpdFZm?=
 =?utf-8?B?SXkwakJoYjhNYXJYeWg1ZWY4cEFJejlsRzVjcG9RVVFIYm5tK0hxL2lsV0h3?=
 =?utf-8?B?NmZBMWJJTDJSK3liUnAwOG5IVkg5K1pQYk9JTTRabGVhNjBnVzJGWmdoQzdz?=
 =?utf-8?B?V2VoazRaVlJhbk9tSFNzVlk0ZjJRbnlmd1BDRWpHOUhGUC9BOHhJcGhlTWtY?=
 =?utf-8?B?US9rdllTQXpXWmMyTWFlcEMwVDhSVmFYaEdqc2c3YXJ3akhtZDdrN0lNYXYy?=
 =?utf-8?B?dFQyUG00cy81a3hZWVF4MTM1c2ZiSFNQUXRsSVAwQSsrTlRUOHNEZFc0bDNl?=
 =?utf-8?B?aC8yVzcySExCb3ZSM1Z3di9QUlAyOCt3WDBXUkcvaG42Q3A0OXdvN21lbTAx?=
 =?utf-8?B?TmlwWFpnSG54aU1OSkhBK2tBUlhXaGF0NWpiVkRnQU16OXR3NmhTQ3dSczhh?=
 =?utf-8?B?L2VKTWNKek1jUzdneUJnaVVObVozRFQ3V0lRRXVYSHlBR25jemF4bG9HZnh3?=
 =?utf-8?B?Z3ZVelBNanlabmxzcXZWNW9rdkd0dWtIS21samxGajZ0OVowd0h4c0hNWXZ5?=
 =?utf-8?B?OTlrQStzWjgzaGpHN2VpK3J4YVpDVzZzNnhEbUhKQS9xcmZwZ3Jlay83Sk5i?=
 =?utf-8?B?Vjg4cmx0TzJvWlR2Y2ZxcHk2aktCMDRlYTlSUUlyQzgwL3QyTFRQcTJNc0Va?=
 =?utf-8?B?VHZQbGNQR2ROcENkSmNqVmRjMzlscjN0Z1VBZkxSQ053cmRFVStFWmVYazVi?=
 =?utf-8?B?b1FIWUZVM1BsZjBBOW4rZTBMY1hrV0FFeVowTEpnd2dXVWd4VXNGL3hTMUcx?=
 =?utf-8?B?cEt5RXN5U1huNkNzVHJaYUtlbmJ1am44UHNuT3BDVDVjNllIMjNnMDEvNzNo?=
 =?utf-8?B?cXBGK0dpMVZxbUZCVUdNdVBCeFViYkZUN0xmWU41RlFBQnJleWdlZThBSFkx?=
 =?utf-8?B?c3NKeWREZDBFSjdkTFVtelJWdTU3cnNES09MRDlsdFVscjRjd3BqWE41dTl3?=
 =?utf-8?B?RjNLT3hWZDNTSXRuN2lRQWhsTFU0VHlQQXB5c2dLSHpuR2ZVTWVoRzMxOWhG?=
 =?utf-8?B?MjBvVWFPZHBBSit0ZTZCZ2NvSmdqbjhFRXZtS0xpcWgzZHR3TWFSUHp3V0NL?=
 =?utf-8?B?dCtlNjZrZy9Ocml0T2RVVjhwWjVEZ2JDZTB0UVFvVmxyUlpzTGFEL3JEM1BB?=
 =?utf-8?B?UmIzUXZYNlNQV2VsaGYvdVZNRXVkYWZlVVFBRDVzMUF2YjUyN1czZCs5Y1dF?=
 =?utf-8?B?OVdYc2NvUmYvSVJJdlV2RkkvREN3aTZZcXpJS1JIUWpYNWxuTXpwSXVJWTMw?=
 =?utf-8?B?RzJrWlA5L25ianVtcjEvcEFjeWRHb1I1RW9OQWE0VHFDQ2gwYTJGT29CaXN6?=
 =?utf-8?B?aEFVUVlSODZDL3RhQ25vRUR5S0owbG1WcjVGUzlINUVEdDF6ZlJUbVFCS2NT?=
 =?utf-8?B?SlpjeDBDa2ZwbDVpUEZ4MnZ2ajdsZXovbkpKR3g0ZHRacW82cnF0eVRrZDdr?=
 =?utf-8?Q?G/CweCHr2thPHjZv8iGo61+Izr49ytoMMLYmQOF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eec97f5-7a9a-49f9-9e94-08d97694658e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:56:38.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6VLKneqRCkcg+Hwb3KPgo16immyk/QgPPp0dZQ82jYkdvkbyu8qO/sRI7DEoNHVqvVUEfvt695vu8NNdgj7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670

On 13.09.2021 10:55, Jan Beulich wrote:
> Do away with the "pod_target_out_unlock" label. In particular by folding
> if()-s, the logic can be expressed with less code (and no goto-s) this
> way.
> 
> Limit scope of "p2m", constifying it at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

And this is of course patch 2/2. I'm sorry for the screw-up.

Jan

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4777,7 +4777,6 @@ long arch_memory_op(unsigned long cmd, X
>      {
>          xen_pod_target_t target;
>          struct domain *d;
> -        struct p2m_domain *p2m;
>  
>          if ( copy_from_guest(&target, arg, 1) )
>              return -EFAULT;
> @@ -4789,23 +4788,17 @@ long arch_memory_op(unsigned long cmd, X
>          if ( !is_hvm_domain(d) )
>              rc = -EINVAL;
>          else if ( cmd == XENMEM_set_pod_target )
> -            rc = xsm_set_pod_target(XSM_PRIV, d);
> -        else
> -            rc = xsm_get_pod_target(XSM_PRIV, d);
> -
> -        if ( rc != 0 )
> -            goto pod_target_out_unlock;
> -
> -        if ( cmd == XENMEM_set_pod_target )
>          {
> -            if ( target.target_pages > d->max_pages )
> -            {
> +            rc = xsm_set_pod_target(XSM_PRIV, d);
> +            if ( rc )
> +                ASSERT(rc < 0);
> +            else if ( target.target_pages > d->max_pages )
>                  rc = -EINVAL;
> -                goto pod_target_out_unlock;
> -            }
> -
> -            rc = p2m_pod_set_mem_target(d, target.target_pages);
> +            else
> +                rc = p2m_pod_set_mem_target(d, target.target_pages);
>          }
> +        else
> +            rc = xsm_get_pod_target(XSM_PRIV, d);
>  
>          if ( rc == -ERESTART )
>          {
> @@ -4814,19 +4807,16 @@ long arch_memory_op(unsigned long cmd, X
>          }
>          else if ( rc >= 0 )
>          {
> -            p2m = p2m_get_hostp2m(d);
> +            const struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
>              target.tot_pages       = domain_tot_pages(d);
>              target.pod_cache_pages = p2m->pod.count;
>              target.pod_entries     = p2m->pod.entry_count;
>  
>              if ( __copy_to_guest(arg, &target, 1) )
> -            {
> -                rc= -EFAULT;
> -                goto pod_target_out_unlock;
> -            }
> +                rc = -EFAULT;
>          }
>  
> -    pod_target_out_unlock:
>          rcu_unlock_domain(d);
>          return rc;
>      }
> 
> 



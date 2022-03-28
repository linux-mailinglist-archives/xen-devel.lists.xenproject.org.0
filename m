Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69B4E98DC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 16:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295454.502777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpxG-00033q-Lg; Mon, 28 Mar 2022 14:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295454.502777; Mon, 28 Mar 2022 14:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpxG-00031q-Ic; Mon, 28 Mar 2022 14:02:46 +0000
Received: by outflank-mailman (input) for mailman id 295454;
 Mon, 28 Mar 2022 14:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYpxE-00031k-Np
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 14:02:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd16829-ae9f-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 16:02:43 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-QtZuhqQCN0WGLSZFwKyXYA-1; Mon, 28 Mar 2022 16:02:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:02:39 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:02:39 +0000
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
X-Inumbo-ID: bcd16829-ae9f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648476163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkZZGbFQopAsIAhzn7WIyzzHOx6GY3IahxcyuC1w5Jc=;
	b=KcbuRiEJz4gTtHKr1DC8Wf13PRtKAxhDlfx6J2K0k26g8UCFF8bXID/6tm3VDqrKwMQtZ7
	6McGtcTmQYnpmdKeUAldJ00foMbTipU2g63Bab8TFhceu322R8Uz5cCsT+qL5eHfz6/Wza
	CBNhUjVxOxY3uaMctPEhN28i2KvgN/8=
X-MC-Unique: QtZuhqQCN0WGLSZFwKyXYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMVR1aG2Mv/a0k85EMnOeFC7EU9fHCXOF98dcPdQwOsSnskF5NmMk08T2UrJSRWBF+TjR7KvW81VquFARP8tLSoNWR04P35PdUCDSlUs7YzJbqObpJuYLHbsCwn0OlMXQDxyot0hmj8Uvngv28/jfEj8GjssbC7fmpRdp+k48cCpd06ANvG7UBZjhsXisV2tx1pgbm/bXT4oYwUp8cdRTritZNyRVhQW4DDXvnaX3xCksokr4RCHr9W5LlJAOkErl1PgfUYI+ZuZTqVo1jz52FCPZGTRdug7ncyVZ3cjW+XB3B/pPOW//djZlOYS18f20JiZ3DdRz4PpjSALaFyBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkZZGbFQopAsIAhzn7WIyzzHOx6GY3IahxcyuC1w5Jc=;
 b=PbWIFODQpMcnNbrWiAIgHhJS22cBPjsPj2+3ACGBavorumwNji8rC0Qtg5wb1w4RRo2Rl9sJqh2yfVIxZcfyO6JnTraBW5knWa+k3zNAdqH/VWkE2E/D592Np3BU160jY/GQ+EjvMKGVKvUVzUysZ5fBJTiLjBzeBOYBPC0Dwa4q8+Pm4SkfsoYtiYKkxkvokQcqUJYNy4iWuOx47kWyHG0vgng+6Ugj0mJx3n9lXK/H+liDtoTEIjZlbWxHq58TNVQHxa8TgTK+d82mH4PGkWHR8athSePwCOzbkPAn+qNQA/8xtw/OC7JVDUQsJxEDN6/xvIzWMK1fz7jYRYNlRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <033ec463-f20a-a6d0-d877-51e4f476a316@suse.com>
Date: Mon, 28 Mar 2022 16:02:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220315141807.22770-1-roger.pau@citrix.com>
 <20220315141807.22770-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220315141807.22770-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 071176f8-d1d3-43df-fdfb-08da10c39ea8
X-MS-TrafficTypeDiagnostic: PA4PR04MB7664:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB76648E1D95535CF28AB29A8BB31D9@PA4PR04MB7664.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RaaPCBbSlZ6jAOIdO/qrq8nG3GKwQgvMX+icrRV6bWo+GhMaKr0zuF2w7PGDUUVPzrbasWnIrjS0CvpcDA71briqy/TAH5mfvQ+LTRFTGa4nDH93z9BS2MyHuyKQ05BKMu38zr7yZcBrOwASmUo6kH4Lhsw+MQHBe+DPuRxeeMbt/a4tPNu6alErMDc7XxeJeFUkZzgap6m6MVNtwmdFdCTYF9JbvJWNOU7CbSdixBU9q2/QhOW1OiwtCXufHey793kX/p5mFcaALBp1xH0UkvRQqwJTJFhePvTXXUKkXezqb0HtpdYzD+1RXrEG1aIQyTQsmDxs9z3CUE4xg1vmVdNfdZ6YnCkaaywDyX1H/5VUs6GhjiZJm44QfooqbOs4fNs242K1IeoHCg797zWYxxS4IPfoXVPUV7vg0eIpDqsGBQpGirE437Z5dencqa5Ta9QCWIBLK/XQCgBDAoO/h5J2MXbhgkgrVo5YfgK4OHCyGTAyoYWWG0JaWd2c0oahXDYSLj2+g0FZOoF97W6R4Y4scn3AE+zpDm4zdz3sWhB4lCnPkitz/s8wOtyelwYmWc8AB/wtAxZa39Zkzx59CFTeYpg0FG/+sT7w3xcFYg3jyQTJmXlpj7yffO06aD/EZlvQxC7k7RMIIlQEC7PbPxytI0b8Dz6yi+OKWJ/CHfPQJ6tNzH1gaE47ZWFC5WEyT2abCBCgPHZrvMothUFzvQgwE2pf4nvyekavgHqKA5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(8936002)(86362001)(6916009)(6506007)(31696002)(66946007)(83380400001)(5660300002)(38100700002)(2906002)(36756003)(53546011)(508600001)(54906003)(6486002)(2616005)(6666004)(8676002)(26005)(66556008)(31686004)(4326008)(316002)(186003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTVjR1p0VURUa2lZcjVxL3plNHE5c0c1Q1N2OU8rVHJBaUtJa3hGUFFUa0sr?=
 =?utf-8?B?bk5jT2FGRzIxRnZYdERSdG9MQnNjbGRxWU1WSlRUdG81YnBUVEszVm9pSEpC?=
 =?utf-8?B?d0hxWTV2UURBRUcvM21weE9EcmJCMFZ3WWZlSDRMVUtqc1lPODR2TVAwbGRn?=
 =?utf-8?B?L0l6RjZSZ1JGVVgraG1YaVcyckZIZGpJOURQYUJLcFUwd3B4dFExNHVWMktQ?=
 =?utf-8?B?QkE1VFpLR1hBWXFYZCtrL0FyWVg1VFBONFRUcTFVN0cvQUNMeGxSRmZlVzMy?=
 =?utf-8?B?a3NrUjZjSDc2QTM3alljS1V6ZjVCSkZQMVprZmhtMExRQWFITHJNVG9vY1dJ?=
 =?utf-8?B?c2pXVWZuSVZnTTFCbUx2WDljWmJSODE4aC9sbjIzekppMjhwSTM3ZHVWSVla?=
 =?utf-8?B?WFl2L0F4bHB1YUREajNqaEw1UGlZcUlJbkRhVTdUckUyRGhHMlB3QUVZOVBY?=
 =?utf-8?B?YWxQN1MxVjFteFdSUUxBeWdFR0ZraVpyNVUrSnJUeXkrR1RaMVRtRTRXN2JL?=
 =?utf-8?B?TGVwbEtxbnBZRGtUNU5raFZNUGhVeHh2VGZqdFhXbmJyUjZEOE13NlNwWlpw?=
 =?utf-8?B?YjNHNkpYbnpJeXplanZ1TjdQSXQ0MEcwdExVbmxjK3I4UUpEK0pFYUxHWjVk?=
 =?utf-8?B?WkNkS2EvZFRPVU14eXB2dSt6R3dBTnRYS00xK28yTTI3dGNNeXUrdHB5Nml2?=
 =?utf-8?B?RExZVDkvS05PK0JTQnJpN1NoU0NMc0RsOHR5SG5CY25kVDFBQWVHbGNaZkdp?=
 =?utf-8?B?cVBsdk5XU0tkdlpobDYrbnFsZ1NLYjFaOVRkSUl2N0RkMVl6ejZKU3RBNDhK?=
 =?utf-8?B?NU8wMmF6WSt0bVpiS3l3Y2hxVjhLQ3pERGY0SUx3Z042NFVxTWN5SjdGZk54?=
 =?utf-8?B?M1ZxL3llN25xLzBwRXcrYlNndCtmRlZTSTZ5N2Z4bWJTMDYrNU1FNHd6NmxS?=
 =?utf-8?B?QjcrbEVvM2tqdHo3SHRwb3hLUHBwWm96cFlIZ21MaGJIQW1jMkI2SEU2Z0tw?=
 =?utf-8?B?V2UxUXpTMHdhOTdraDJsWlg3dnNLNFRqVnluYzR1Z3U5Zkxram1TcUhuSkRW?=
 =?utf-8?B?TlJ6d2FzZkpIZmhmYmszMWZpSzExUVIyZzM0ak9LR0ZpNHJzRzVIV1Q5NDBJ?=
 =?utf-8?B?Tnkya0VqQXJsWmE5cGtCWXd4WU5Ra3J6cnJGbFdDdlpYUUo0eFdOTHR0MjUw?=
 =?utf-8?B?TGtLcXR4R1Jwb0huNG9IcC9iWW5HbkxMUjRrZDZKaWIyejBvVzRIZTVSRkl5?=
 =?utf-8?B?TmUwdllQMFVQN3I1d2xzOU5MT2tpMGloM1BhRWlQQi9OSktCQVRoK2IzZ0o5?=
 =?utf-8?B?UktyelVSTGFWQjVIVmJaUTUrcGZSdkF0cUlMdnZiR1BPZjFTL1ZLTEplTUFW?=
 =?utf-8?B?a05UQU1aY205aWJMbFBMYm85clBQQ3cyekY2QkpXL0o2WDUvZ1pyUGx0SjN3?=
 =?utf-8?B?SDhHdjFObUN2MEo1NkJ1VDE2OTZucm1wTFhtYVlmUGRHV0xFZVpYbnQydjdl?=
 =?utf-8?B?T1ljcWI1WkQrOTBsNG1ZaEg0ak5KVTkrSGVwOE13MzZZYmRqam5leUpyOUov?=
 =?utf-8?B?R012eldUL2NNelJPYWxJbnRVSkNrdmhCaGN6aitiTlZiQTRIWFZvNG1mT2hH?=
 =?utf-8?B?bTZYY3oyWHYxY01keTdZZlArRkFuZmdpSWZUR3VIbHBvN01wMUpnK0ZRMnV4?=
 =?utf-8?B?UTUzTENiYWxtNmJONnhBZTJUQ3VnUm5rMEpWTitzUGRUcHB4UjVLQXVZeEVz?=
 =?utf-8?B?UG56NTR3ajVsOVUvcVViM1R0UE9qYTFDVkFHazhKRFUvUlA1YjNhWjR6eWY1?=
 =?utf-8?B?a0dkQkFGYXlDVENoVGpSaWJWUmorRjFNeDNMbjF1eENjbVpZd3BHNnIvSWdk?=
 =?utf-8?B?SFJKUDFxR1pXdlVRSFZZekVKQXVuNDFRWjNsdG5zbzc4d3duZ3MvdlBWUElp?=
 =?utf-8?B?V3BYNmh2eDBnK2dKa3lYd3hqbkVVcTVETzBxLzdsb3hlNGhqVko4NE5ZR0RI?=
 =?utf-8?B?VGNSdjhLSEk3TDZxNjBRRGYvTFEwRGNqcUJYd3N1R1lncWdYM0RoVnZlTUVo?=
 =?utf-8?B?akV3MzFCbkVPWmgxSCsvNnBId2VscnZXQnliK0RmaVZCU3lUbVlEbmg4R2xq?=
 =?utf-8?B?QlFsNTlQckJRZGt6Q1B1SlVFV1pEZGJFRi8wV0VwNFYvb3R3Nmk0NG8xV09X?=
 =?utf-8?B?L3R3NURiRkRYMExQMnB5YVNoM0M2WEdNenFhaXhuaksvRFRsTHVlVlE1Zmly?=
 =?utf-8?B?TjhwUnlUMmtFZGpmbGtmeEVkR243aDV1djVtd044WTNrUDVTOHpwTlVWcmM0?=
 =?utf-8?B?WVl6dXQ0UmhFYjhLcHNhOEhEZUxKY1J3eHBFKzNFR3F5Y2lESmZTQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071176f8-d1d3-43df-fdfb-08da10c39ea8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:02:39.4294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXoflHhCXgBr0qdm9Y04kPAxvsqPRFYdbkIsCJrPyvMfohv2kCQVPm79UMf44dkHH7qtecdi+VMdyAOhDNnNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664

On 15.03.2022 15:18, Roger Pau Monne wrote:
> Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
> hardware has support for it. This requires adding logic in the
> vm{entry,exit} paths for SVM in order to context switch between the
> hypervisor value and the guest one. The added handlers for context
> switch will also be used for the legacy SSBD support.
> 
> Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
> to signal whether VIRT_SPEC_CTRL needs to be handled on guest
> vm{entry,exit}.
> 
> Note the change in the handling of VIRT_SSBD in the featureset
> description. The change from 's' to 'S' is due to the fact that now if
> VIRT_SSBD is exposed by the hardware it can be passed through to HVM
> guests.

But lower vs upper case mean "(do not) expose by default", not whether
underlying hardware exposes the feature. In patch 1 you actually used
absence in underlying hardware to justify !, not s.

> @@ -610,6 +611,14 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
>      svm_intercept_msr(v, MSR_SPEC_CTRL,
>                        cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
>  
> +    /*
> +     * Give access to MSR_VIRT_SPEC_CTRL if the guest has been told about it
> +     * and the hardware implements it.
> +     */
> +    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
> +                      cp->extd.virt_ssbd && cpu_has_virt_ssbd ?

Despite giving the guest direct access guest_{rd,wr}msr() can be hit
for such guests. Don't you need to update what patch 1 added there?

Also, is there a reason the qualifier here is not in sync with ...

> @@ -3105,6 +3114,36 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
>      vmcb_set_vintr(vmcb, intr);
>  }
>  
> +/* Called with GIF=0. */
> +void vmexit_virt_spec_ctrl(void)
> +{
> +    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
> +
> +    if ( cpu_has_virt_ssbd )

... this one? Since the patching is keyed to VIRT_SC_MSR_HVM, which in
turn is enabled only when cpu_has_virt_ssbd, it would seem to me that
if any asymmetry was okay here, then using cp->extd.virt_ssbd without
cpu_has_virt_ssbd.

> @@ -1069,6 +1072,10 @@ void __init init_speculation_mitigations(void)
>              setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
>      }
>  
> +    /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
> +    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
> +        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);

In cpuid.c the comment (matching the code there) talks about exposing
by default. I can't bring this in line with the use of !cpu_has_amd_ssbd
here.

Jan



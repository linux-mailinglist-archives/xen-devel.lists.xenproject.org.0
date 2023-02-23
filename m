Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E1F6A0688
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:48:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500203.771468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV98E-0001Zc-1Q; Thu, 23 Feb 2023 10:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500203.771468; Thu, 23 Feb 2023 10:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV98D-0001WF-UM; Thu, 23 Feb 2023 10:47:21 +0000
Received: by outflank-mailman (input) for mailman id 500203;
 Thu, 23 Feb 2023 10:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV98C-0001W7-T5
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:47:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ff8133-b367-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 11:47:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9136.eurprd04.prod.outlook.com (2603:10a6:150:27::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 10:47:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:47:15 +0000
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
X-Inumbo-ID: 70ff8133-b367-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itDUbXRl6w+N+vZBX5lxT9/CtAdZGdIQl+LDIRDokeKRee0TYAgTaogaeKVEyxuntHs/VThIJ5plqOv4gWX8ead1+3O7ZrCaA+U1MVdxTHSUBwES4jHACAPo5BYpH3I4Tclye+5Vyxj/o9NsMTEFYIz9QS9ad+XKg6gOZPrYyjmeRj/iUDKLJYgiiIOzLsKgxnjtlFzrgZs8VDY5KKi5ldQLv1AN0y14Qy+3RdZbNZ/LQ4MaSfR4Lo2MEhY6Zfa3m5g+QFzXXzBlVuOUzIWjxQWRU37xT0PeJAme0/tIgWNDls9DHMLGtmKV9glVkzIwoE2cEhUeklPE89F+AnhwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLX1JbNCaYIFdv8qRmLWUgI/pW3BQV7SvINfOnJS+Nk=;
 b=KnRUnVxZYxyPcLy5jGdBnCB8KPjoy7i+NcL5pQ7eJjQtLW3I9czzl6RZqoNhlLMAH7KHBIiVSh6HGUOyNR5usnHedGHWfVpfHHxLU6Ugt/9qzspYf4vbj9SWCcrsS4BfxhLW15g5tZWAnzO+hRdpTNo4etDhT/lcgp8x4uEI8FKlUVBtxwQDxkTABDRIK2v3lWhJmvTz8X4WBlRiYyslkqShng8zqe8HIqGRYPLGrSY06DZXLdHS4/4QYhIBH9SSodr9SoHoxUYLrsnR+5YvZ2HbAyvPxnfPTaBeSp/lr1WaVu1VFwEh5IvOLu01fR+WASfKval0PxaBRscDz/83Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLX1JbNCaYIFdv8qRmLWUgI/pW3BQV7SvINfOnJS+Nk=;
 b=asknoQG9r0I/0iT2nP4UW8lXZ5ZmtQn3uFQlkLfjzLnt14j11RlrRsnKb8rmVhUBjnXWSxA77aWbY5CNQG2W+vxBqK7XE4OsqgUvdTN+kpfd7Y+rvHrdTvQJ8mXahon4afKEgEWvTzgRYAhv4mbLdmcR0KPV7dmIe4gaHEUb/GmIiYnu9lFb8IuUl6qywx7mJSdET5v28fL6xsPVx7qtef752IMRZS2TxChDRzhKRYiWSJ+1e5Dla0TrIgD5cS8PfcEAvC6foG/KIeHDBifiLPcAtgPD/wHuHc8E5DuAjXaMJfmW1DJijrXz3zjIxA3h7m4Vw70Ba4Y0Pwp20F9jOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f169088-53bc-afe5-8f10-970c17f261b7@suse.com>
Date: Thu, 23 Feb 2023 11:47:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/9] x86/vmx: move declations used only by vmx code
 from vmx.h to private header
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-7-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-7-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 708ad89b-95b4-4810-b592-08db158b53a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5JOfTeDrX/C9dHNL71gbFbyAvPHCKKMZA+nkbM/oN2pnXpEOTEOeuykyCs2PpSyuN8yPpMY47mf8oOyCYfk09Z7I9tZ1lZ7JwLL+Si8ef4Be7+oMnQ6yHrs5GKYa9KytxlMXGLbZBBdST5znn29dFmQXZHaV1+dKr22b4TugFzZrKg1gPN85hwmz6fh3hzkH387segs8SoIxaaSVrU7FeRjYWprslgz/qLIcGjcqMj25OQbNmNpz26m/t+DiOBWzRkn37HzhFE10nn1y197+FARZqhLTJFd2tE/c1WdCb9B5dLFTLDMPUvsPjc55RamZk4ft53+RG6rW6cmMS0N6p9vh8XysGahw/VdnMMGXo5cbtdvukMYCdNTp7q2dZLl/rlJvHs1wRkTSrcsekwzK3+dlqC7SrCNFGOdon32Vc/pJA2yIDb4PDwcX/zlwhSmQtjX2As8Y3Dkxka7dbuH05vQHumMR6KcFRl95f4oeYBfXnCX2c0q5DJ7z85reXIl40YGFswfcO4fg6n/jscf0JF2o35QN4tedgMTliFHwZUU0rf4D5rfh+yBYpbNn/nH9RVxTfxE34eLV10qbVUn6EYOCXYxllNkVwc1ftUq7VnaW5koBfxQNroEvIZ5gWwP6MddXtpduKiwC96mO80g81wiwOkPHbQG0fQ8gzO+AEy3IeR0WK6aRZjqeNChfY3MqtdgVb+Ti4uUXMUvnRJq3MAg/vQmS3hXhGx420m7CAtM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199018)(31686004)(30864003)(2906002)(5660300002)(8936002)(41300700001)(83380400001)(66946007)(4326008)(8676002)(66476007)(66556008)(316002)(6666004)(36756003)(478600001)(6486002)(26005)(186003)(53546011)(6506007)(31696002)(2616005)(38100700002)(86362001)(6512007)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2tOajJrRytoZlBVWUhoV1d0WWhacStmVFpIZnRmZDFab05aMkwrMXZ1S1RR?=
 =?utf-8?B?UTE4clFoUlZIMmkrb3dOK2VHTDF2TVFFaEVuTzVzeDA1RXlseVZQMEJrdXND?=
 =?utf-8?B?am9GV1BmMHcyM0NNVVBsNkhSdXBJaVpjbER6VFpHSlY2UVVrSTFKbVhaeGRm?=
 =?utf-8?B?eUN0dWpkaE5tNS9JVk1iaE5DM2NRWDVtUVh2c01XQnJ1azg1Y1ZlSktTSito?=
 =?utf-8?B?UzBjVGVLdmVxdXRDK2wzOTA2ZC96VnJTY0c2VldXSlc4SmtBUnFvQmtiTk1M?=
 =?utf-8?B?RGsvODJUOFA4SXdhU1ppeHl4TG1BRXlybi9rNExUd0xzUWl3a1g1ZmZEU3BC?=
 =?utf-8?B?WTFZS3FKNTh6WnBJb1QybUZvZDB0UTVDaEJ5OVpHTzJsVCthc3BoNzVoREsx?=
 =?utf-8?B?a2xzMm8xL3RvM3JJRnlUdmhIUGpveXJ3MjdVQlBvRVV6RC9aZ3J6M1ZEMzdI?=
 =?utf-8?B?aVZxZnovblVxWGtJcjZxSEdvSWpzN3VzQ1ZpOHhPRk9TKzdQTXJJOWJtendN?=
 =?utf-8?B?QVVCVWx6MExTOGlncUVwREZiUEROSTVhRCtvWjRFd0RuVGJRMHIxakZleWRJ?=
 =?utf-8?B?WlhuT0JsZnVsUmxiTGdHSWJWbklCQ1RlbTdOcEVDVHNwVUVSUHlwMlY3NDVD?=
 =?utf-8?B?eXNoNVFVNFJuWkkzT3FSdDNJbDhvZml3WWlaaEQ3RU1Bb3NGell1TWFWT3pr?=
 =?utf-8?B?VWl1citLZTI4anRBNXNSbUdyTjgwSUtBZ3NYZlMvYXNKSXh1VGFBZUtwQWpw?=
 =?utf-8?B?Z0N3YjdDeHp4L21XUkJwVk05K0liWWZ0cVFNdjFwWDlWMnVOTXVLejNuQjFm?=
 =?utf-8?B?b2QwdUJ0SXZNWjJXUCtqeUVyT0xGNjE0TWxjZEVhU3VyUElXaDNad2RWZUZZ?=
 =?utf-8?B?dDBEdGFFSlpRZTRQNThSbWlQcG16WG5hRWV1b0YwTlF0enBlOVlZMFQ1aHRF?=
 =?utf-8?B?Rk9wUDlZTlZVa011MThHMDRBaTVzV2JTMlJMNFlnSmlTUWRRZFM2V2p3QUo3?=
 =?utf-8?B?RUd2bk41MkJaS0VqUFh2SGhTazdIYlZBUVpGNDlKM05rck5weis5UXVNckoy?=
 =?utf-8?B?bmFHc1Q0U1JxclJHMnFqc0hoaS8vNzJEcHB1Sm0wZ081Mlo4N3JZZGdjQ0RB?=
 =?utf-8?B?bUNhSGhEbWJlNXFZbVlZTVFGUVhHZDQwNmtodk91cG03aFZlL1JoNk5HVHE1?=
 =?utf-8?B?cEpKRzVOcTNHK2tPL2NLaytWOXRNa3RrNHF6bnR5eVRmTnN3bml0Q2ZjSFNN?=
 =?utf-8?B?MGFaV3pyNTV2c3NxZnR5R0Z5V2VNSEV3clE2RkZsYzl4RE5EampQVE0vdDls?=
 =?utf-8?B?K2NpdnIwV01lVjRwbVR3Y3lIM2hxRHRXUDhBTnRXRkgyOFpXNFZYWlU3Mi9z?=
 =?utf-8?B?K2V1WjljdGhSWC83M0VRSE1FVVArRXdXdEVsV3RvaXJjcWRHcTcvelBNSmMv?=
 =?utf-8?B?ejZiSnh4RTJiamp3RDN2Y201a0ZJSm9Vclh5Ni92Y09ITXVxZnFvUmdFM0RB?=
 =?utf-8?B?aDlyVlNUNzZueU4vNmFJREpmL0NJcjJjdUZ0ZFlZQmdicGZWczRsYkNSWW5B?=
 =?utf-8?B?N3ViWGJkRVVnaTlkRTk1VjZLVFFlRkJsQkJvN1lOUVVLMnp6SG5CbXVGTUEy?=
 =?utf-8?B?N3BYSFZnMnlKclZvNlVwSnY1Y1haMWZzRDZIYzUrdEJ6TkdCYmVHVnl6NmZt?=
 =?utf-8?B?djQxUGtWY0w1MS9vYUUrTUhqUUFQczBnd21UbjFLSGlBZnVOZXRsV25oT2tT?=
 =?utf-8?B?ejVhTlkwWjhJR3YzWkFhQXJ4T1MwK0YrekkyU3loWHJsZFR6RFFMWnNNQ1Nr?=
 =?utf-8?B?SnppbFVzSUpZb3NBUzhMbW1vR1hTRjI5SmxaVnExNWhQQWRqWDRyTjhrZHlZ?=
 =?utf-8?B?RjFsME9OdmVBY0Y5azJyRHZJZE00NlpQRnduTEpvcmhUaFFjS2VJaGtHN0lN?=
 =?utf-8?B?WldBRWdCT1pjQVRPZ3pOc1VsRk1Pa2d0WjBpVFE5R0pXdWhmWHY5OXFLb3pQ?=
 =?utf-8?B?UVp6bHdzN095SVpscG9rODlRQ2VYOXVBRlBFZm5rYUFsTXNDWTZ3dHNJYjNC?=
 =?utf-8?B?SVBUOFZXVVhUb0xCTnJyM05NcGJVMDFBQWxER1dNRmlWZHVKNjZlVWlBTExE?=
 =?utf-8?Q?8ddM9TlQ9c77dpX4/rt/CrPsV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708ad89b-95b4-4810-b592-08db158b53a0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:47:15.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2luPLUmKsEBnqZStOiL1ImuU7c80qnSwHwyE02fh8YYlOSR/dNe19D7Vuw1uxkHvxA1/IOdK8khDjq1gaIasA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9136

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> --- /dev/null
> +++ b/xen/arch/x86/hvm/vmx/vmx.h
> @@ -0,0 +1,459 @@
> +#include <xen/sched.h>
> +
> +#include <asm/asm_defns.h>
> +#include <asm/hvm/vmx/vmcs.h>
> +#include <asm/hvm/vmx/vmx.h>
> +#include <asm/types.h>

As in the earlier patch, please use xen/types.h right away.

> +extern int8_t opt_ept_exec_sp;
> +
> +#define PI_xAPIC_NDST_MASK      0xFF00
> +
> +void vmx_asm_vmexit_handler(struct cpu_user_regs);

Even if it was like this originally, this is bogus. This not-really-a-
function doesn't take any parameters. It's declaration also looks to be
missing cf_check - Andrew, was this deliberate?

> +void vmx_intr_assist(void);
> +void noreturn cf_check vmx_do_resume(void);
> +void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
> +void vmx_realmode(struct cpu_user_regs *regs);
> +void vmx_update_debug_state(struct vcpu *v);
> +void vmx_update_exception_bitmap(struct vcpu *v);
> +void vmx_update_cpu_exec_control(struct vcpu *v);
> +void vmx_update_secondary_exec_control(struct vcpu *v);
> +
> +#define POSTED_INTR_ON  0
> +#define POSTED_INTR_SN  1
> +static inline int pi_test_and_set_pir(uint8_t vector, struct pi_desc *pi_desc)

Nit: Blank line please after the #define-s.

> +{
> +    return test_and_set_bit(vector, pi_desc->pir);
> +}
> +
> +static inline int pi_test_pir(uint8_t vector, const struct pi_desc *pi_desc)
> +{
> +    return test_bit(vector, pi_desc->pir);
> +}
> +
> +static inline int pi_test_and_set_on(struct pi_desc *pi_desc)
> +{
> +    return test_and_set_bit(POSTED_INTR_ON, &pi_desc->control);
> +}
> +
> +static inline void pi_set_on(struct pi_desc *pi_desc)
> +{
> +    set_bit(POSTED_INTR_ON, &pi_desc->control);
> +}
> +
> +static inline int pi_test_and_clear_on(struct pi_desc *pi_desc)
> +{
> +    return test_and_clear_bit(POSTED_INTR_ON, &pi_desc->control);
> +}
> +
> +static inline int pi_test_on(struct pi_desc *pi_desc)
> +{
> +    return pi_desc->on;
> +}
> +
> +static inline unsigned long pi_get_pir(struct pi_desc *pi_desc, int group)
> +{
> +    return xchg(&pi_desc->pir[group], 0);
> +}
> +
> +static inline int pi_test_sn(struct pi_desc *pi_desc)
> +{
> +    return pi_desc->sn;
> +}
> +
> +static inline void pi_set_sn(struct pi_desc *pi_desc)
> +{
> +    set_bit(POSTED_INTR_SN, &pi_desc->control);
> +}
> +
> +static inline void pi_clear_sn(struct pi_desc *pi_desc)
> +{
> +    clear_bit(POSTED_INTR_SN, &pi_desc->control);
> +}

Considering all of these are currently used by vmx.c only I wonder whether
we shouldn't go a step further and put the posted-interrupt stuff in its
own private header.

> +/*
> + * Interruption-information format
> + *
> + * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
> + * field for EPT violations, PML full and SPP-related event vmexits.
> + */
> +#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
> +#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
> +#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
> +#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
> +#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
> +#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
> +
> +/*
> + * Exit Qualifications for NOTIFY VM EXIT
> + */
> +#define NOTIFY_VM_CONTEXT_INVALID       1u
> +
> +/*
> + * Exit Qualifications for MOV for Control Register Access
> + */
> +enum {
> +    VMX_CR_ACCESS_TYPE_MOV_TO_CR,
> +    VMX_CR_ACCESS_TYPE_MOV_FROM_CR,
> +    VMX_CR_ACCESS_TYPE_CLTS,
> +    VMX_CR_ACCESS_TYPE_LMSW,
> +};
> +typedef union cr_access_qual {

Nit: Blank line please again above here.

> +    unsigned long raw;
> +    struct {
> +        uint16_t cr:4,
> +                 access_type:2,  /* VMX_CR_ACCESS_TYPE_* */
> +                 lmsw_op_type:1, /* 0 => reg, 1 => mem   */
> +                 :1,
> +                 gpr:4,
> +                 :4;
> +        uint16_t lmsw_data;
> +        uint32_t :32;
> +    };
> +} __transparent__ cr_access_qual_t;
> +
> +/*
> + * Access Rights
> + */
> +#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
> +#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
> +#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
> +#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
> +#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
> +#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
> +#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
> +#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
> +#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
> +
> +extern uint8_t posted_intr_vector;
> +
> +#define INVEPT_SINGLE_CONTEXT   1
> +#define INVEPT_ALL_CONTEXT      2
> +
> +#define INVVPID_INDIVIDUAL_ADDR                 0
> +#define INVVPID_SINGLE_CONTEXT                  1
> +#define INVVPID_ALL_CONTEXT                     2
> +#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
> +
> +static always_inline void __vmptrld(u64 addr)
> +{
> +    asm volatile (
> +#ifdef HAVE_AS_VMX
> +                   "vmptrld %0\n"
> +#else
> +                   VMPTRLD_OPCODE MODRM_EAX_06
> +#endif
> +                   /* CF==1 or ZF==1 --> BUG() */
> +                   UNLIKELY_START(be, vmptrld)
> +                   _ASM_BUGFRAME_TEXT(0)
> +                   UNLIKELY_END_SECTION
> +                   :
> +#ifdef HAVE_AS_VMX
> +                   : "m" (addr),
> +#else
> +                   : "a" (&addr),
> +#endif
> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> +                   : "memory");
> +}
> +
> +static always_inline void __vmpclear(u64 addr)
> +{
> +    asm volatile (
> +#ifdef HAVE_AS_VMX
> +                   "vmclear %0\n"
> +#else
> +                   VMCLEAR_OPCODE MODRM_EAX_06
> +#endif
> +                   /* CF==1 or ZF==1 --> BUG() */
> +                   UNLIKELY_START(be, vmclear)
> +                   _ASM_BUGFRAME_TEXT(0)
> +                   UNLIKELY_END_SECTION
> +                   :
> +#ifdef HAVE_AS_VMX
> +                   : "m" (addr),
> +#else
> +                   : "a" (&addr),
> +#endif
> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> +                   : "memory");
> +}
> +
> +static always_inline void __vmwrite(unsigned long field, unsigned long value)
> +{
> +    asm volatile (
> +#ifdef HAVE_AS_VMX
> +                   "vmwrite %1, %0\n"
> +#else
> +                   VMWRITE_OPCODE MODRM_EAX_ECX
> +#endif
> +                   /* CF==1 or ZF==1 --> BUG() */
> +                   UNLIKELY_START(be, vmwrite)
> +                   _ASM_BUGFRAME_TEXT(0)
> +                   UNLIKELY_END_SECTION
> +                   :
> +#ifdef HAVE_AS_VMX
> +                   : "r" (field) , "rm" (value),
> +#else
> +                   : "a" (field) , "c" (value),
> +#endif
> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> +        );
> +}
> +
> +
> +#ifdef HAVE_AS_VMX

Nit: No double blank lines please (there's at least one more instance
further down).

> +# define GAS_VMX_OP(yes, no) yes
> +#else
> +# define GAS_VMX_OP(yes, no) no
> +#endif
> +
> +static inline enum vmx_insn_errno vmread_safe(unsigned long field,
> +                                              unsigned long *value)
> +{
> +    unsigned long ret = VMX_INSN_SUCCEED;
> +    bool fail_invalid, fail_valid;
> +
> +    asm volatile ( GAS_VMX_OP("vmread %[field], %[value]\n\t",
> +                              VMREAD_OPCODE MODRM_EAX_ECX)
> +                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
> +                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
> +                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
> +                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid),
> +                     [value] GAS_VMX_OP("=rm", "=c") (*value)
> +                   : [field] GAS_VMX_OP("r", "a") (field));
> +
> +    if ( unlikely(fail_invalid) )
> +        ret = VMX_INSN_FAIL_INVALID;
> +    else if ( unlikely(fail_valid) )
> +        __vmread(VM_INSTRUCTION_ERROR, &ret);
> +
> +    return ret;
> +}
> +
> +static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
> +                                               unsigned long value)
> +{
> +    unsigned long ret = VMX_INSN_SUCCEED;
> +    bool fail_invalid, fail_valid;
> +
> +    asm volatile ( GAS_VMX_OP("vmwrite %[value], %[field]\n\t",
> +                              VMWRITE_OPCODE MODRM_EAX_ECX)
> +                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
> +                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
> +                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
> +                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid)
> +                   : [field] GAS_VMX_OP("r", "a") (field),
> +                     [value] GAS_VMX_OP("rm", "c") (value));
> +
> +    if ( unlikely(fail_invalid) )
> +        ret = VMX_INSN_FAIL_INVALID;
> +    else if ( unlikely(fail_valid) )
> +        __vmread(VM_INSTRUCTION_ERROR, &ret);
> +
> +    return ret;
> +}
> +
> +#undef GAS_VMX_OP
> +
> +
> +static always_inline void __invept(unsigned long type, uint64_t eptp)
> +{
> +    struct {
> +        uint64_t eptp, rsvd;
> +    } operand = { eptp };
> +
> +    /*
> +     * If single context invalidation is not supported, we escalate to
> +     * use all context invalidation.
> +     */
> +    if ( (type == INVEPT_SINGLE_CONTEXT) &&
> +         !cpu_has_vmx_ept_invept_single_context )
> +        type = INVEPT_ALL_CONTEXT;
> +
> +    asm volatile (
> +#ifdef HAVE_AS_EPT
> +                   "invept %0, %1\n"
> +#else
> +                   INVEPT_OPCODE MODRM_EAX_08
> +#endif
> +                   /* CF==1 or ZF==1 --> BUG() */
> +                   UNLIKELY_START(be, invept)
> +                   _ASM_BUGFRAME_TEXT(0)
> +                   UNLIKELY_END_SECTION
> +                   :
> +#ifdef HAVE_AS_EPT
> +                   : "m" (operand), "r" (type),
> +#else
> +                   : "a" (&operand), "c" (type),
> +#endif
> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> +                   : "memory" );
> +}
> +
> +static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
> +{
> +    struct __packed {
> +        u64 vpid:16;
> +        u64 rsvd:48;
> +        u64 gva;
> +    }  operand = {vpid, 0, gva};

I don't think __packed is needed here. I wonder if it could be dropped as
you move the code. In any event, here and elsewhere, u64 -> uint64_t (and
alike) please.

> +    /* Fix up #UD exceptions which occur when TLBs are flushed before VMXON. */
> +    asm volatile ( "1: "
> +#ifdef HAVE_AS_EPT
> +                   "invvpid %0, %1\n"
> +#else
> +                   INVVPID_OPCODE MODRM_EAX_08
> +#endif
> +                   /* CF==1 or ZF==1 --> BUG() */
> +                   UNLIKELY_START(be, invvpid)
> +                   _ASM_BUGFRAME_TEXT(0)
> +                   UNLIKELY_END_SECTION "\n"
> +                   "2:"
> +                   _ASM_EXTABLE(1b, 2b)
> +                   :
> +#ifdef HAVE_AS_EPT
> +                   : "m" (operand), "r" (type),
> +#else
> +                   : "a" (&operand), "c" (type),
> +#endif
> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> +                   : "memory" );
> +}
> +
> +static inline void ept_sync_all(void)
> +{
> +    __invept(INVEPT_ALL_CONTEXT, 0);
> +}
> +
> +static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
> +{
> +    int type = INVVPID_INDIVIDUAL_ADDR;
> +
> +    /*
> +     * If individual address invalidation is not supported, we escalate to
> +     * use single context invalidation.
> +     */
> +    if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
> +        goto execute_invvpid;
> +
> +    type = INVVPID_SINGLE_CONTEXT;
> +
> +    /*
> +     * If single context invalidation is not supported, we escalate to
> +     * use all context invalidation.
> +     */
> +    if ( !cpu_has_vmx_vpid_invvpid_single_context )
> +        type = INVVPID_ALL_CONTEXT;
> +
> +execute_invvpid:

Nit (style): Labels indented by at least one blank please.

> +    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
> +}
> +
> +static inline void vpid_sync_all(void)
> +{
> +    __invvpid(INVVPID_ALL_CONTEXT, 0, 0);
> +}
> +
> +static inline void __vmxoff(void)
> +{
> +    asm volatile (
> +        VMXOFF_OPCODE
> +        : : : "memory" );

All on a single line perhaps?

> +}
> +
> +static inline int __vmxon(u64 addr)
> +{
> +    int rc;
> +
> +    asm volatile (
> +        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
> +        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
> +        "2:\n"
> +        ".section .fixup,\"ax\"\n"
> +        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
> +        ".previous\n"
> +        _ASM_EXTABLE(1b, 3b)
> +        : "=q" (rc)
> +        : "0" (0), "a" (&addr)
> +        : "memory");

Nit: Missing blank before final parenthesis. Would also be nice if the
comments lined up.

> +    return rc;
> +}
> +
> +int cf_check vmx_guest_x86_mode(struct vcpu *v);
> +unsigned int vmx_get_cpl(void);
> +void vmx_inject_extint(int trap, uint8_t source);
> +void vmx_inject_nmi(void);
> +
> +void update_guest_eip(void);
> +
> +void vmx_pi_per_cpu_init(unsigned int cpu);
> +void vmx_pi_desc_fixup(unsigned int cpu);
> +
> +void vmx_sync_exit_bitmap(struct vcpu *v);
> +
> +#define APIC_INVALID_DEST           0xffffffff
> +
> +/* #VE information page */
> +typedef struct {
> +    u32 exit_reason;
> +    u32 semaphore;
> +    u64 exit_qualification;
> +    u64 gla;
> +    u64 gpa;
> +    u16 eptp_index;
> +} ve_info_t;
> +
> +/* VM-Exit instruction info for LIDT, LGDT, SIDT, SGDT */
> +typedef union idt_or_gdt_instr_info {
> +    unsigned long raw;
> +    struct {
> +        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
> +                                :5,  /* bits 6:2 - Undefined */
> +        addr_size               :3,  /* bits 9:7 - Address size */
> +                                :1,  /* bit 10 - Cleared to 0 */
> +        operand_size            :1,  /* bit 11 - Operand size */
> +                                :3,  /* bits 14:12 - Undefined */
> +        segment_reg             :3,  /* bits 17:15 - Segment register */
> +        index_reg               :4,  /* bits 21:18 - Index register */
> +        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
> +        base_reg                :4,  /* bits 26:23 - Base register */
> +        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
> +        instr_identity          :1,  /* bit 28 - 0:GDT, 1:IDT */
> +        instr_write             :1,  /* bit 29 - 0:store, 1:load */
> +                                :34; /* bits 30:63 - Undefined */
> +    };
> +} idt_or_gdt_instr_info_t;
> +
> +/* VM-Exit instruction info for LLDT, LTR, SLDT, STR */
> +typedef union ldt_or_tr_instr_info {
> +    unsigned long raw;
> +    struct {
> +        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
> +                                :1,  /* bit 2 - Undefined */
> +        reg1                    :4,  /* bits 6:3 - Reg1 */
> +        addr_size               :3,  /* bits 9:7 - Address size */
> +        mem_reg                 :1,  /* bit 10 - Mem/Reg */
> +                                :4,  /* bits 14:11 - Undefined */
> +        segment_reg             :3,  /* bits 17:15 - Segment register */
> +        index_reg               :4,  /* bits 21:18 - Index register */
> +        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
> +        base_reg                :4,  /* bits 26:23 - Base register */
> +        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
> +        instr_identity          :1,  /* bit 28 - 0:LDT, 1:TR */
> +        instr_write             :1,  /* bit 29 - 0:store, 1:load */
> +                                :34; /* bits 31:63 - Undefined */
> +    };
> +} ldt_or_tr_instr_info_t;

One file wide remark: I assume you've put things here in the order they
were in originally. I think it would be nice if some re-arrangement was
done, e.g. all structures first (unless there's a reason speaking
against doing so, and of course not including any which are local to
specific inline functions), then all variable decalarations, all function
delarations, and finally all inline functions.

Jan


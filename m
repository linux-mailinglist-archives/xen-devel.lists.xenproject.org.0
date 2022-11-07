Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B877961FAB1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 17:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439518.693536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os5Ro-0006qn-4w; Mon, 07 Nov 2022 16:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439518.693536; Mon, 07 Nov 2022 16:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os5Ro-0006nx-1q; Mon, 07 Nov 2022 16:58:08 +0000
Received: by outflank-mailman (input) for mailman id 439518;
 Mon, 07 Nov 2022 16:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1os5Rm-0006nr-GQ
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 16:58:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58af280d-5ebd-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 17:58:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 16:58:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:58:03 +0000
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
X-Inumbo-ID: 58af280d-5ebd-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek8c9VvBWA3N0TSm+1vQxJHsZ5grOfgbwR67pjDAm5gUucu11NkrdvjPVybOtTe55SZmvegJQy+7mj89LGtp+ynaDoe6GjEVu/duXXRul7cb2+/D+TorFZyBzp4fZn/prW/YxWl924iPKW9Uscu2LjQOT6As0mW+ZC4lDgm2eb/BQOXsO09ewV7LZDu+eiRbK1h4BJZQQjXiZs6dGa3JgDvngy+xGMCozleXZ0Lz8rzA8ugzgeZKmig/kKwQj61itySwwMPxkXrMDJWFVscd0cefqoa28X7vfTJ+AGHEmn9xwpHOiePTfR9icybpXvtY7kMRmC+wx4HVTAyqDAGPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJfLxzj4Aen0EOaZb5flGHyz7PKsrvFaIHE7OOYdv1o=;
 b=ADh0pwfUubDLWEPFfBaKyoNHHSx2mSB8ctzZitmsJ3I1UGRuw08Ljg/iUTP0Knn6BhcYt/bMwarbL/HOpRcDz8enXhWJiQlpoTrfg1hjNu1QORffxCQ+Yhc+C98NriQk+tNUgN8SW18YHnsXiLW+1QGC7ujGQAdCm+HHQv8PquaGpD6iFVPufny4ScEjHh1j6TEOiHFu2SIX7/JPAk0dZ23XC7T5qbeO/WFNtfo9K03nLgBlwQsbb9ehBUHoU/FbscNc7ez49vh6J+T3Qr4RAoDgqUOotwSSvaxdZfmL8BkDOXSJWpd8nnZkn7Obs/iM7vGvTcz37uqt1mGPAK/ugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJfLxzj4Aen0EOaZb5flGHyz7PKsrvFaIHE7OOYdv1o=;
 b=gwuVazyX2Chf/48jW3MQIYo814xW/YH9UI+FKyCfXG3Wp+/uvEqflWu83vvCrcCOiMmMXYFwDqz8IvMbPlpelzqifwljRROs0TV6ckNBFCFSlL3GBMnJdtQzaYhvAxEC5h6a3JivSu3Ki8vfUmCGY59xvV1PLIliNedwaPsv4I1fOAGmgedEupo/NU517Vk/AHb3mXPWs/KHEQ3T15HVeD88CYu0y2Gv5RXrBpmiTxRGQIsHhRcCXCAfZ7igE2aOhZd4OnWOSDfpmLFGvveCYqXGXntBXw01KYNmzIQnM2zfXG/SBrKCjBj+3+F7RYTdGncWG7/t8wyXFCIKk/BpYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c8d31de-539a-4252-f0a1-617b220eadc2@suse.com>
Date: Mon, 7 Nov 2022 17:58:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20221104161815.38007-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221104161815.38007-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9e727b-0bda-4911-13eb-08dac0e13bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qAPSM/HpVfecvN+ehF9eQOU/wkK5SEKPFahLsy5VjbmtI1tk00kxTt47rPwMJTEyrNgu1xt4/fpIaLK/4sL3F9hLZ29ShTiSAHU9KN9o1Me3DvL7if9Hqh9fE9bTYU9G7sUgvzSYrDihEW1jdPcJtC2SEpIVp+xFHbTyZmQ6jecOIDy16SmnNVppfws5fpkLKeueoshq7jGPGoNeFQp6AN6hJzWTAAga9DukNhQDTqjadsGCCsbiSm8J8PTO/w70nf8k3DjPoB+tE0m5N5SQP+YB/xxvUCfzdqs931+njm8Ak/sygOKnT+a9sW6a2VwH7iKnyq09kwOEXkwPAIoPA8pP/ij5PhvyfKr/5v5d606hvBWl68JjszKHUOK8N8qE4PiA7mzO4OaOMyCtMkSshhsYME/sBot0BscilJWBCWK/bOuWzD7ls26siRbDct7PsRAAUzkZsgDWOfHIpxOos7tWjG56rZPaaNbZtEykLrnh/6c312wE3MJKBOJcTymApdYZLb1TGviZWF52XkuWHG5D/Msqxqu04MeVLGW9UO5Kz5+pEoPDktdo8k3b1qiYXiuc9cHXXjQu1X7RchtDt4ROjB0B68ZcYUP+2eITMjv6/6S5BxFc4QbTS16UwvPvDRzePbgQb/5UoFC7ajgk2d8cYfvjR18CJ9uSyYRw0jvvzbNVSbBUKMQimZ3gYF97itlBo7AyfxJ+Z3JgN9lMOT9vGpPSqHjQwo8pCPEAexSSQ81LlyHQ7wJvIFTo+00HeqMKC8vBt+1rF0oP9mWaEz2yG21HjF14rmkkEVVLAvc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(2616005)(83380400001)(6506007)(186003)(31686004)(53546011)(6512007)(26005)(66476007)(6486002)(4326008)(66946007)(66556008)(478600001)(36756003)(8936002)(38100700002)(8676002)(2906002)(86362001)(31696002)(5660300002)(316002)(41300700001)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDc4UmkyL2RFRGttUndqOXk2OTR2M0JXNkRrVnhZazZWUlhhSlkyakg3Qmdu?=
 =?utf-8?B?bGRwUGoxbnRKbS9VTDdYRUovdVI2ZU5XMHB5SzY5ZEM3NzNYSXlWR0pmNnF2?=
 =?utf-8?B?WURpOVV0TDRUeFRaODU4Zit0UWJXZVM4MG0rRzhYNGZhSGhxcFROZDRYRHZO?=
 =?utf-8?B?dmNLNWJrWmx2LzZFNXQ2L0tDSUNDMGF5T05mV08xMmR3aHhNWll3QWFHS0hP?=
 =?utf-8?B?Zm5nQ2R2VGk1UFQvUVBxNVRjMjB5NERtbjVBRG5yWHkrajQ4NlJHYituS3ZS?=
 =?utf-8?B?SDQ0czlOY3FvSExQL2JkeGR1RFNycnNYWjRCV212S1BGZFJMeVVTdUpMc3pk?=
 =?utf-8?B?TzY5MjQrNkVkVlZnK2ZmYkNHbmgwczNiaDJGNEhFZkZ1QjBOZjlHZThBNHpN?=
 =?utf-8?B?Rm9UeVpaY1V6eExMMk5qaUsycnlobU5ENmVBbTRZeVVNMGd6TnVTQmZBQThX?=
 =?utf-8?B?RXpxUnFjNHFESUJVZVJ0Vk5ZSEVSR2lvc3lRUHNnc3J0ZmZxVi82MTZEbStT?=
 =?utf-8?B?dmUxc1d4QjBCYlBOUnJkZEc0RU9zT2tpOEV5Wkh1VXVlNEQrSnUxZ2ZMR2NR?=
 =?utf-8?B?c29veGhxQW0wTnFha0VjYTJ6ZC95Vk1Eb2cwaitIOEdZU1pZb2xwK3VGSk93?=
 =?utf-8?B?MTRpQ01uWUwzdlhPbFVTQkxEdksvSlRwY0pFR3hiTTg4RHpoeHR1UnNyNGU0?=
 =?utf-8?B?d2x0NlUrR0IwYlNoY0FyVmM5aWNtMlpidHk4dUp4WkNxa1QwL0RlY214OEcx?=
 =?utf-8?B?eWwzdkE3QUNJaWlKelg3MEFRemlKaU9EOUlBZEhEcDU1Yis2OEU2ZFBRNWtJ?=
 =?utf-8?B?UGdYUndEbkpMa3ZvMGhDNXhvRnNLdURmRDZhcm9ES0lZVVp4QmlJRnBNK3VJ?=
 =?utf-8?B?Tk1EZndENmxYNVVMZlRTeHptM3h5T2lpam8xMVVwWHhOeTlNOWVVZE9neVNE?=
 =?utf-8?B?SEJETWF3VnBzSmU2WVMvcnJQdzR4a2tzS1R1cjFYa1VrK3RDL3R0ZE9EeHhS?=
 =?utf-8?B?UWh3ZmVYOGdmckJhWGRqNzdqdlBTVkwyNXFoVzVtS0hjZGxEa2VpdFd4WFJU?=
 =?utf-8?B?ME9YUTk5VE8rVmU1L25pYUU1aHZKeWdIcWxJVmF1S3RFZ1BkVG1RblI0S1Uv?=
 =?utf-8?B?OS9aUzVCb3paWUZKWUNsN3lMejhWYkVUQms0dXZJWk15N0lmb3VmNDVWWVV6?=
 =?utf-8?B?UTdrUEI2SVM3ZHRINnd5bDR1d0FJbE1WMXZjQUN4QlJFcHBJTzZCaVdqSTB4?=
 =?utf-8?B?TmZWMEVjcGhKeVpDQm1XeDdsdDJzMmpUejNHb1ZVaTBob0FjbkFydldTSnBH?=
 =?utf-8?B?aFVLMktGUlpLbmUrd0RKYXNtVHppRXIwbnJlZGFVM0p4WW1ZU0FmUnJHaHN4?=
 =?utf-8?B?SXFQRDFza2VLRDlPNU5mdHUwSnA5eUlMRG1lcWRLMnEyU0lMQXJmdDBncU5E?=
 =?utf-8?B?MzVGR05laGhEUEN3TXM4WG9SWE94RnZMS0tBc3JuUDIvMWwzNHlna3MvRzJ1?=
 =?utf-8?B?TzRyV01hN29vYzZta3RaMG9DU2dhVnJLZW1mMjZIdGdZMGRqNk5lSEpPTjNp?=
 =?utf-8?B?Y3ZuaUpCZlh2ci9zVjEzcHQvbnZmcHBhRHlSUjB3UzFxZ2wvQXl4eEJpb09y?=
 =?utf-8?B?QVllanpaeWh3WXJDR1ZtakI5NEQ1Wkw2WFR1cGx1ZGJod3BXVzlkenlwdXRF?=
 =?utf-8?B?L0w3VDh4OE9iWTU1NnBmeWJyaHVBUC9mcWtFbGw5NVdWZGZQWlFUUU1EZzhC?=
 =?utf-8?B?QzZOWmFmU1hUVnQ5QnBBTXpzL1dyMnpmdGEyRzRHTE5vZS80MWZPSS9OaUYz?=
 =?utf-8?B?L2J5a1I4YlZVNFpzYk9QM284Q0t1WmM2ZURLTmpvbmlGVTVkdFQ4dFpHREJN?=
 =?utf-8?B?UXFuZjR3aDhPd3psSi9RWXdoSmV2cjZUbTRPSUhDM2VpRjdVT2JjRy9uTjFR?=
 =?utf-8?B?MGh4WFduVDFnYmdKTkpHRGJZeDR6QmhycWFkOU9kSllzODF6eW1RaXRGZ3Rr?=
 =?utf-8?B?WTlEYXdFemRDQkZmdU0yUmNHeWpqcGRaYjZ0NnEvNklGbGZFNWRBeEdHd3Na?=
 =?utf-8?B?MEI1SVlMUFo5LzI0dWlCQ1lVaHpnZm5hanZKcTBvSC93TU1QSXNUWUt6dVRX?=
 =?utf-8?Q?wL9kFT/6FBlyWdNAzRuQ2TSV2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9e727b-0bda-4911-13eb-08dac0e13bde
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:58:03.2962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcfYylEcPNYIsZBKlUJ96uKBdbm3gwOAtDd2yvzSbewQeKOoQaj3YJJLME19wg5EhDf3zsH8/PrJmMAqj+7RZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

On 04.11.2022 17:18, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>          res->a = CPUID4A_RELAX_TIMER_INT;
>          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> -        if ( !cpu_has_vmx_apic_reg_virt )
> +        if ( !has_assisted_xapic(d) )
>              res->a |= CPUID4A_MSR_BASED_APIC;

Isn't this too restrictive when considering x2APIC? IOW is there anything
wrong with leaving this as is?

> @@ -3432,6 +3436,10 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
>                  vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
>                  vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
>                  vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
> +
> +                v->arch.hvm.vmx.secondary_exec_control |=
> +                    SECONDARY_EXEC_APIC_REGISTER_VIRT;
> +
>              }

Nit: stray trailing blank line inside the block.

Everything else looks plausible to me, but from prior discussion I
wonder whether the result isn't still going to be too coarse grained
for Andrew's taste.

Jan


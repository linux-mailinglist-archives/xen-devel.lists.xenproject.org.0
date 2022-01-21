Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEED496072
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 15:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259357.447598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAuYk-0000Nq-T2; Fri, 21 Jan 2022 14:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259357.447598; Fri, 21 Jan 2022 14:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAuYk-0000Kq-P5; Fri, 21 Jan 2022 14:06:34 +0000
Received: by outflank-mailman (input) for mailman id 259357;
 Fri, 21 Jan 2022 14:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAuYj-0000Kk-7B
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 14:06:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55eaf0f9-7ac3-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 15:06:32 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-_duEfGJeOES_WZZoD6poHg-1; Fri, 21 Jan 2022 15:06:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Fri, 21 Jan
 2022 14:06:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 14:06:29 +0000
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
X-Inumbo-ID: 55eaf0f9-7ac3-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642773991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mukw2TsNT5gvUSY3f/x3PNsjn46v23w76n+ZGVEwkKY=;
	b=do3/ACtJjAzzL4FDl/xKbHIcvb3mPVF9O80TI7CakzHwYfH6h/ny7w7M8ZkEMt7ir4Qni+
	ZyWpgb5ekBPfQKAX7p6hFRV6WZ8Lpbj8sj2tzZ8X18auwS+W5A5CraiaWnsxgNvrJkXUak
	gJy6R7mpCZLmadBxCwWa85UnNQ8fHKI=
X-MC-Unique: _duEfGJeOES_WZZoD6poHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iscIq0bFwVkXQPlspdIyW0tiIICFGkB2HidtKA+eNDMLGV94VIoMLq+kdgylRSxbpdTwl1Ic9OLm+o4zp0GDVbfD1heSZSkFC8+4Xn+3XMt/PnxPoYinpn/vlrRNuRpqD7KkQLeg6+4V7FHs8Nuh9mvOS8CNiq7mimMNVJ05HYrw/Fma/RuXSzJFyXmE6BsoblUiiavRUSHfHqUTyo0CLd8di9/8rQqxD/t25kclRCuaRzu0KNxuuXbR2sM1LekBsMUCINFv7r0+cb10aJ/5tlVAR2jEnbBLjPco/RLTWNBb7uo47nujkDdMPRzOQnEVe6itDq24/wfo8eL7DxIVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mukw2TsNT5gvUSY3f/x3PNsjn46v23w76n+ZGVEwkKY=;
 b=aT7sPHNkFJ/h+TM3mhAVoIu6yQOrDGkioLlKqYc9a0qK8kYaKdHrNst95uFLqevbCXcj3/vHvBBdMFoEzXHZwCc2kkRGuWRqkUw4X4dWJWR4tvrJAVlV2Z0+JZAe7rWHUjn9RikmH/wZFkn496zw7EjFfEi8ckgjNPKEXt0VtVSB40hQ85ORZbdYUq0Ds8ovI6vziQ9mFTnOX0sMTRVV2KwKA0ROYvsk/8arm0g8cfmGrPHvCU5CWgKu/2rcM4cLvfHanU3DW5CxK7KkLvkckKiMFzqLIw1l25/wtuuffygs3G48NgW7QMTIkhbZcEW3vVKvkkNfgDOZEi3iJmUxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56851e47-abfe-fae3-59bc-ea9b0b7d7bca@suse.com>
Date: Fri, 21 Jan 2022 15:06:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/hvm: Drop get_shadow_gs_base() hook and use
 hvm_get_reg()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220121112241.19277-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220121112241.19277-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0032.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5bd99fc-2088-4169-80ac-08d9dce7383f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389E60C5B036D58675371C0B35B9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vkqGC/baA6UwWuppMT8E5Mwl15r2xcachakWk2Pbr6JmXxzoL05LuC8wJNa/SpiTAIogyu+ffDz7wLmsM6DqkoUWmItb9zovev/ZAZgUMM2wJO72dMdPuI98R/Dcdj8cULvcGc2MHvEdUN7wS5iaVt+UmjtLPNSsu35EwO/4blW2v3GPROLUAOqvVQoV9Az45dKdcbIjprv8eKWZUyMGkXhDriq5XKkAUcV5GcF74jJ7ADFhhjA5qS38D+72Jy3QUhgyiMxMqhM1H34guIhRRQXl6jZDxJLF09Ybr0koPyG6Hqrwdu6xH7siWxKzMBXxbVJSfKTW2xDN5qZFtr5nJosLlvUPYU+oOMq0e8q/3NvGHnnbWvzpR0DAbWrZEMA1Y1/DwdJzTrOfvhKi32z4iCUvZjdkpgeyfIa1L4vLmDEcfap+m3KOjCOyC0v8O/kMi6LENBXtt7OVTjpmJe+CaD5FOOUO5iEbb8LF95CcNDWuxJO8F0zJiN1YwqzU+MzLwphaE0aSmwHaif3QG49F3VWR57LFzTmW+sPyaiOLbEdZDyoRCCA0tMm4rJ3K6NXUvBBh71ZpCFom4rXuA4eAQOBokl04xvpYScI2qO+udwhDBmcYNJ+1Iq39RKHjlv5OStRdxghDodlfry0ryOnrpLgpmlonmPiUGJj0JoW3lI+7pC7Is1Zh40OL/WRuklKWaeFrGMdQkYKg2HvEOo1VnGoeN5ZEFOzxnC14QJ8NiMMC+U0m8QPC+SU8yU7f/BRs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(86362001)(66556008)(8936002)(8676002)(66476007)(6506007)(26005)(53546011)(6916009)(38100700002)(66946007)(83380400001)(6486002)(316002)(31696002)(54906003)(508600001)(4326008)(2616005)(36756003)(5660300002)(31686004)(2906002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlJudjhPVFgzYTRWdE9PTVFZcTdwcXV0bUliU3FkV0VpeWVqUzBuQWZtWjNt?=
 =?utf-8?B?SDBKSyt6cTJtN0ZzQkZUWElDL0pOOFVTWnNaTy9STTFxeURucWhrd0Q0REdU?=
 =?utf-8?B?dy9nQmc4L0dMVklaUmkvcmh4emR0QVRTMWNFNldrWHBTV0hEMTNQWmRtTmZo?=
 =?utf-8?B?eDZZVU9HS05jREwzclZFUGhOY2xOcGF4WmlFQ3RucXZTWmdkSDZ0NDRNUGta?=
 =?utf-8?B?blZIRHpGSm95THlYMmJZQ1dyWmNocjZxTkJaQmpGSExtNjRQYUVZWkN5WTNO?=
 =?utf-8?B?QUhaU0p0VjBLbml0cDRqSUJrN3p6ZGhSNm02ak94WG5Xd3V1dmZvUXo1bWVi?=
 =?utf-8?B?VUwrQWMxUmoyWHpQbDhuNXh6Yy9neE5ZVUZHRHBHbTB1bHRFMVNpS0dZOUxC?=
 =?utf-8?B?bWVMZHRqTWd2d2x1cDNLR1luSWdOeXJoNGpGb3ZtVFI4NzRrZ0R4aHltV0tT?=
 =?utf-8?B?NWZFSHd3MGp1dk1JOFRkN0o5WGtiTDRXUGN4QVRselhNSTVSbE1sUk1ndDFu?=
 =?utf-8?B?c0dEYWd1a3pZdVFBTU1zVVZjcHZGTUxFVkQwTC9jRFhoWVdtQVdJTDMyM1hx?=
 =?utf-8?B?SUh1TE9FMDhjZHpnVUJOY3l3U3FOVVdkZlZhdysydTRIWnVWYzNqbm9kRFhF?=
 =?utf-8?B?WHljZG9rMHNEUWE2dTFPRVM5ekdObXoxNDM0a2c1MVpEZWFYbktDcmkrYWxW?=
 =?utf-8?B?UE80T1UxM1pvRHBpQWdyUDk2eDEwdmhqNzFlOHVRQ09qMUhqbnFGdUlFWVQ4?=
 =?utf-8?B?bmcxWUhGRkNPeTFZSlJsWGxocjlvYm5sM0dkN3pZWS9ZUUNDV05PSklyeVkz?=
 =?utf-8?B?VDhheVBvbkZtV2NnTkIwMjNnNGoyUDQrTEw4OHdXOVFaQTJ1LzRab3NYSUdR?=
 =?utf-8?B?emJYOW9WUHBjb3libDRDUEM1bmEvdVo4b29ENDJuWFVtUkdYckhhZkpXcnpq?=
 =?utf-8?B?QnNPYXNFdEx5d1A2NXV6d2JRWXF6Q0RFTTM2NTFaQWVnTU5XU0NsL0Nkb3h5?=
 =?utf-8?B?STB5b0Z1QVBnQjk4YlA1ZkhjMlFudmVLTVBVWUFKUitkMjU0Vk02KzVnM29u?=
 =?utf-8?B?ZXoycUkzbzk2NjZVRnZNY0hzR21WZ1o4RkhZWFFyT2h6eDhYZE82TmpXK05v?=
 =?utf-8?B?VlNuRyt3QWV2QkhqVmRzb1dWZVBHYUY4N2czQnBjeURiWmpOamM1SE1Tbm1T?=
 =?utf-8?B?QWZWa0s2L3ZsRHdudGoxTUNKSUYwMW9RVkVKWms3cnhRY3ptMzJKTXNRUnEx?=
 =?utf-8?B?cWpvemwyYzdnbDZxUkx6bXRXNm4zTjhwVXBUVXRSZFpKc09TZVdJOTBNdGls?=
 =?utf-8?B?amxLZko0R3lJUnhwNVVsZDJiUVpOYzVjWDQ0Qi9ndEJCeVJ0ZUZpMDhXMkxE?=
 =?utf-8?B?cTNhbExWQ3JQR3A3SUYwM05HNGZkQjFYblZ0MU0wODZQMUs3WHNHK1pVTXZF?=
 =?utf-8?B?N3Rvb0hieHJ0Q3R6NnpwLy9XRUg2VndURmcwaGgzNDZEaDZKTC9PY2JwNjJ2?=
 =?utf-8?B?ZTFqMXMxdVo2aXZhd28wQ2wzb1FSQmVBeTBHUzNvMUpzUWM1eksvZjE5SnJs?=
 =?utf-8?B?dzBxVkxSalRieTc3RTRmVHV5UWJRZWhXWjkwTUdYT2RoUm0wbDYyaHdlQUNI?=
 =?utf-8?B?cVlGOGdJUHZ4cU1ZSG9iYk15UXUvUU9ubmdVMDN1SXF2ZkF1dnh6bFY2L2Uy?=
 =?utf-8?B?YklHTVBCUUhSZE9jT0ZVUldRejlKSEVnMmtEQnNoak5hTytkRGhrY2VpMW1P?=
 =?utf-8?B?dW9mOC9qOUlyYzhxQ3ljYTFKQ3pnZCszZk5SR1ZMTjlGUmhsWFFvRmhWcytk?=
 =?utf-8?B?Zm5Ed25LSHFSM1JmYnNLUStBVW5hUGdtTU9TNUo5bStpeHhNakhWVjFrRWJJ?=
 =?utf-8?B?aXZBblgwbDRZR3JKY3Z4Q1p2eVRYNmJmRDcvUEpaSTUrNVI2N3NEdDRSeHVB?=
 =?utf-8?B?Y1hlbGZqeUpuNENKc0F1VmFDMUVjY0Zld2Nqc2ZCUUVlYU0vbnExUlZnWkpO?=
 =?utf-8?B?YmpzczBNTDRmT2FDaFhBVGxic3hvUW4wRzdzMTJ6QjRuQU40Mll0YlZ6L2hD?=
 =?utf-8?B?azB1ZU0wZDc4Z2JZeFY4Tk9xREZkVzFzK1I4S0tnUGgyWjE5TjR3MmFsZEgv?=
 =?utf-8?B?Vlp3NVkwV09xU1AvQ21KREx2TnRlVURHZjM3ZC9WeHNZOHRDbzN5bW9Ld2tE?=
 =?utf-8?Q?gi/TyvEf53YXp+xGMer9hnA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bd99fc-2088-4169-80ac-08d9dce7383f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 14:06:29.0256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Va0iNuC/xuTfAwFmQpgNabyueqDiWSzQPZaeKZxHqeMO4G2kWF5ENjyiqHDu3+EOPZUAs2sMVYMqJTbLl2sZwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 21.01.2022 12:22, Andrew Cooper wrote:
> This is a trivial accessor for an MSR, so use hvm_get_reg() rather than a
> dedicated hook.  In arch_get_info_guest(), rework the logic to read GS_SHADOW
> only once.
> 
> get_hvm_registers() is called on current, meaning that diagnostics print a
> stale GS_SHADOW from the previous vcpu context switch.  Adjust both
> implementations to obtain the correct value.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Just one minor request for consideration at the end.

> If we care to backport the bugfix aspect, a far less invasive option would be
> to read MSR_SHADOW_GS_BASE directly.
> 
> The only case where that goes wrong is when vmcb->kerngsbase has been modified
> and is pending a VMLOAD.  I'm fairly sure this can only occur when we need
> vcpu diagnostics, after an emulated write of MSR_SHADOW_GS_BASE.

Hmm. Maybe best to leave alone in stable trees?

> @@ -2417,6 +2413,15 @@ static uint64_t vmx_get_reg(struct vcpu *v, unsigned int reg)
>              domain_crash(d);
>          }
>          return val;
> +
> +    case MSR_SHADOW_GS_BASE:
> +        if ( v == curr )
> +        {
> +            rdmsrl(MSR_SHADOW_GS_BASE, val);
> +            return val;
> +        }
> +        else
> +            return v->arch.hvm.vmx.shadow_gs;
>      }

I think it wasn't too long ago that I saw you ask for an "else" like
this one to be dropped (in someone else's patch). May I ask that you
consider doing so here, perhaps going straight to the more compact

    case MSR_SHADOW_GS_BASE:
        if ( v != curr )
            return v->arch.hvm.vmx.shadow_gs;
        rdmsrl(MSR_SHADOW_GS_BASE, val);
        return val;

?

Actually, as I notice only now: Would you mind making "curr" here and
in the VMX equivalent pointer-to-const?

Jan



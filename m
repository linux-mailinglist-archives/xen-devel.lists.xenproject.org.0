Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D552CC36
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 08:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332727.556483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nra00-000531-4g; Thu, 19 May 2022 06:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332727.556483; Thu, 19 May 2022 06:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nra00-0004zX-1E; Thu, 19 May 2022 06:51:04 +0000
Received: by outflank-mailman (input) for mailman id 332727;
 Thu, 19 May 2022 06:51:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrZzy-0004zR-Ge
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 06:51:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b74f39d-d740-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 08:51:01 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-vrB51aNsNpugYgGSpVNDbg-1; Thu, 19 May 2022 08:50:59 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 06:50:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 06:50:57 +0000
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
X-Inumbo-ID: 0b74f39d-d740-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652943061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9rEtgbWEYWkZBXaiTG6KlCNdTdef+KS8OdNeXAHESrg=;
	b=accL4y79F+suTgjS5uCkqPIDPjuJV43TFDNkYd2LsOu1gIRrS99HyK2vOAMPgzYAZoim0/
	8jxbUA61r7WCBSukXD3KACwt0xdRAW3UFE/omXK7MZg2d/hrFY59qQYjNL4RVf7RCHZM1+
	08PNokEHH+1UI9Pgi05iZ5dGaPnUuWY=
X-MC-Unique: vrB51aNsNpugYgGSpVNDbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4Au3eVppV+zbVGTSOhGDckHGU4SZE4MltRqZjfgLikQ699TEa3VSXoa3rlLqRgm6kfpprJHO0gHu7OoPu84rU6aJVYndXhdSCmFcpTLtWyw9LmVwfauj6VjRRUhKrB8KwaVRuaVqrm1US/XmVQ3uv6YsTd40c5hY2PPQ4Q1HpNoBch2NU2KlZg7CC0oMnXXBZv0Ci2HibkCXbvpz5mEnWYyWQixDiQm+qIotTV5tZL7wQ1Vo7PwcBetXV48N1ORQCEZT01TwLv9z3uzsoXRwFQShNZqRhazEoL8uBaibIyWV8EYld9L1XlFnXZz8iRr44ZX/eHSGeXgzDkXY6IaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rEtgbWEYWkZBXaiTG6KlCNdTdef+KS8OdNeXAHESrg=;
 b=e44XvF4O2/99irkAcr0j3pYBy+7L17e4jEQ6CEBpKK0ZnWAnFlL8V5d+AFmlUSxnNh9JKsmOlujIOTPpaadKRg7V4na5lOQ2waDQWfoIarBxaPfNQ+kF2QPJX7NCXU/xKnurncao5S2zK0jgrZw7aoRjOhkJ0R4iZtLtXpdILpYVIlilqP6gJz5RrBpHVy9f9Wg2bfNsebzSyH+QYSQ0jxdtXlrcHaurXgeHMeFruDFi9SRVhgKPQ56NwcjAVuAGjnJ8+02biicBR9QCkFAJMKK4vmF+uiDJYlr3Qh8FNNTOB5COZONssjgv4AtstgcKYikZw5CfUbtAi4K/PE893g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cf98549-6fc0-67f7-a882-0778e7ab6f98@suse.com>
Date: Thu, 19 May 2022 08:50:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220517132130.38185-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c13e3816-5c06-4333-4fb8-08da3963ed6b
X-MS-TrafficTypeDiagnostic: AS8PR04MB8134:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8134F5DCC0204CDBFE231E3BB3D09@AS8PR04MB8134.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+dkdylaB9wmp76FDt0cOKRzI0psYHAMnpu8YjMYDWFVe2NKCFsa90T9XSzdxnyntQqwxxr7HiPCtim9JjTRzCmEJIyX6ctsRRbKPGls0KIQqO8NXzpRgBx30eA1TYGw5yeNftzmuk2vFRKw+TByzmnm9RX4UNtw4Asd6L3Yn7/KO/cQ+/Ihe6ZJYwLTLQNEc7/5pH09cGNRm25HMCONdnEpfr2GOgSnp+e9oDrGRGNqZyELwAyGElhC+yixPYqNPDssbtQDrU9R4VTyeyAb/1W4/QEg/QTi/14atEjp5ZFf2Y8pQov9unOv4Id3PGTK0dnLiF9i8+5iC89b1MmNsS2e39pnmbushZClhEq2DimWqx5wEnOsahDSdUvNXTbVuROKKA4ds5WkE7bC2EFaCw9xx4PvVAIzShoir1rzB/CL9rGNjMD3wJ9BrqZygPIG327Vdvu56V1gVf0WkENKKTO5gQP7l2o9CHIYhCyFvrRoAlFR+1FW7Sxr/CRo5gO48VwnHGlU3lERudJxaOPztbHGjY0zkD3/AwJF9yH0eifpCFBj3BgoZF7af2zi3AMbCO2L5OvvvD/wFBSpYQPKpNLqiUXeK4NBTksj37OR+1NMXSooi6/mgKO34mdRHmGY/SbhazTeQTQnwDub0phFMuXF+ubGb3WOgMRAfbnr4cRsrCdAoDneYxaRW/7ODkIIHhYEC4+B0tcfIDDujE+FTwEOgBjFiy+2v0kigRgzUo4g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6916009)(6486002)(66946007)(508600001)(8676002)(54906003)(66556008)(66476007)(6506007)(6512007)(4326008)(53546011)(31686004)(8936002)(5660300002)(36756003)(2906002)(2616005)(31696002)(186003)(83380400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3p2VmpySGhFaHVNUlp4VDFOcWdPb1JyL1YwdGJnL1lrdWdIYjh5YS90RVEx?=
 =?utf-8?B?c01GcHp1QzBUbFhueUVJZEJYNnFKSGlsdnlyV2tKRzI2MUNWcytyNFFJV0ha?=
 =?utf-8?B?QWdEbHVXdWVra1lIRnRsS0lHR25LdHRFclNXbisyNlAzMzM3c3NXU3pEOFlI?=
 =?utf-8?B?T2FhbWs1aEhzSVJ0NDFibTJqZnJ6bmVGYWF0NytCU2FPUmpyRjQ1TFo5aXJV?=
 =?utf-8?B?WTFrak03QnlmeDdnQ2dpYmZXR0NWVjNiM2RCQ1hZTGZPWTNYdVNhK21pZklJ?=
 =?utf-8?B?RXh1Z2RIcG1TMmZxa24yeGZuK2EzbFlFMXFkNk15QkpDZ2xUNlpiMDBoY1ky?=
 =?utf-8?B?WnNlK3JNdWRLOTFVZVJ0RkVjcWJvdFdTcWJyanJvUmYwT3hRNVhkQ21qWHMz?=
 =?utf-8?B?akxNMzdtTTY3dFgzNS9QYVJ6TDJJdFJYNUprakVkVVhxVmwzZ2N1cStBUDFm?=
 =?utf-8?B?ZUFGNFZSZTJpNkkrRW80Y2Y3TTNMeGlyTWxENHZKcCs1ZnRZUEY3Q2xxV3Vz?=
 =?utf-8?B?ODRQYWprN3ZSVlBtYk84Y2FKVERMYWhzSDB3VGVZM21NOXc5MzJybk9SM2N2?=
 =?utf-8?B?T3hWUy9Sb1dlRnZ6UElWTUxqc3QybW1DU08vemtYMU9Fc29OdldBZnM0cHBX?=
 =?utf-8?B?V25samtEZnRQc01BUFhhM3Q2Wi9ETW5WRjBia1hQTE1RQlk1QWRXSmRWRU9W?=
 =?utf-8?B?VjhJMXFQZE8yVGtDTlA2MmU0TFVEQk5mdFF5Ni9ZMTdMSXVtUGUxakpGcFRi?=
 =?utf-8?B?eUtpNzFwY2ZZUTFhYjY3TnNaZjdOT2NWOTgyTTBjczlGdWg1WWpaak9nODJi?=
 =?utf-8?B?d2xicG1JU3BYV3h2Q2RXai84c2tSYVRJeWl6bFBnc2JnaTN0ZzBPOHB2YTRk?=
 =?utf-8?B?V2tTSjZ6QW56SXBaK1FDRlRKUnc0cDlCM1QwdTZVd3JUSlFhV0ZWZkhpWXJG?=
 =?utf-8?B?eWorZ1AyWWh4K1lKTHdneS91R2tnekNTNGQxQ2tHMzBpQ0w1Uy81ZWhudmhY?=
 =?utf-8?B?L1JlRUNWOGNIL0s0T0JIbnRYV2dWNjJhUFhRSG95Rkg5VHN0SmQ1aGZWQzFk?=
 =?utf-8?B?VUo0amwyMk9uZ3lOdnVuR2NTZFM4Zzc1eTZnWnNhL0pSc3V4STl5SFVQT1VK?=
 =?utf-8?B?MURwWnY3WEJCcWxMdU5XdTRKeUpKYUR3aVBiZXZ0WmI2bXVOTU9JSGNRS3BW?=
 =?utf-8?B?THpIc1A4SXYrUmQ4b09BbWpaR3Z0cmxSN0NhclN0R3h3eHhKb1M2UUhqemY3?=
 =?utf-8?B?UVZzUElzemdBUCtSMStVUThDcnhSWHk0REtqdDFsdTBRNTRqRzYySThXK3Zj?=
 =?utf-8?B?bHdMZ2libUR6UU5vSThldTQ3Ry9OVjlIYVlSYTByVnpUL2hyMkdxKzBWWEpX?=
 =?utf-8?B?SmEydW5TQzdQeDZXay9ZaC8zZ0tYUGVJaFhVRS9kTmwyeEgvYWRKTkE2bXdQ?=
 =?utf-8?B?Zzk1WWJUSzdQeFpmSUhVeXV5OGFNVTJodzdzWmJ0Qk9Md1FzWVJabXVMVjZR?=
 =?utf-8?B?cDJqNWJnZkVqL2gwU3UwVzYyakphc1NsdzRhOTZIOUN5dDRvekxwd0hBaGoy?=
 =?utf-8?B?WTNZWjA1emk4T3RQaVJqeTZzK0tidy9Vb1RLZi9EUHNRUXhCbDBPYXl6MURT?=
 =?utf-8?B?czc5a3hyQ0ZlUVp0djhSMEFTQ3VheHJXTWNJdGdQb25VTkZQYkFnYWgwNTVJ?=
 =?utf-8?B?ZlZZbjUvY25TNk5YTmZJejA4V1dUaUFjano5cE5ORzdKTnVmYmFHS0ZrTEpR?=
 =?utf-8?B?OVplTWcreUc0QnNpSjBHa1FZN3ZpUWJWRmQvYlhFV1daM3ZSbC84RENGY09T?=
 =?utf-8?B?MDdBVWxsRk4wb0JFOXEzcHU0VXVrczhzUE84NmF6ZXRoSjJ3YmtKNDBVSWhv?=
 =?utf-8?B?Q1JjWmc0ZUxqTG1qNVBVR1VnZ20zN3hTemgwYXhNWmVsRFloSXZESEVobm1n?=
 =?utf-8?B?YisrNHRTM25aRXdVaVIrb2NHV2dqRndVek10bnpxQ0hZaVhQQXJqem1oTzhO?=
 =?utf-8?B?TU5NQkxiSGtsRWl3Q3ErckR5N2diSlFWMzlMZFF3WmJOYU1VSkVNc2FxeVRK?=
 =?utf-8?B?ZVlpeDZqMHk2ZUxYV0FBamEwN3lkbnZzRXlKK0l1SEM5SzRibTROVWt4aXRY?=
 =?utf-8?B?ZG9wRzg2OXhGcDdMWDlWeVBOc1hBQUl5Ly9jL0QycHFCRy9OL3ZjbUlrVTRi?=
 =?utf-8?B?dzBiMkkvVTI5Q1l1UjQ3eWx3R0ZhMExJa1ZNWUMxbmZGNGFiaFNnWlB4M0ZX?=
 =?utf-8?B?WnVOUy83bTlhaTlESjE1NlhLZWVwWEtselhlY0RoMXZJNWttbVpFWXRRQ0ls?=
 =?utf-8?B?SHE5S2h6OE4vMFprMitoNjFKanlMeHliVFdOMS9FZWc1NmJyN3N5dkN5VnAw?=
 =?utf-8?Q?BZSsgatvDapAPatLH8gaz9E+OoHrEY2EFwdHfCI+iHNKw?=
X-MS-Exchange-AntiSpam-MessageData-1: J4K2r/Z3y4l9Gw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13e3816-5c06-4333-4fb8-08da3963ed6b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 06:50:57.5531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIUN+ICq8EmVm9qk+YRwEOfEkc44B76waoI/26wLDQaBtUUkI1y5RbEgrdTAws5zbH+Wx+8CjOuIKS+mi65Etg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

On 17.05.2022 15:21, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
>  static unsigned int __read_mostly ple_window = 4096;
>  integer_param("ple_window", ple_window);
>  
> +static int __read_mostly vm_notify_window;

__ro_after_init?

> @@ -1333,6 +1338,19 @@ static int construct_vmcs(struct vcpu *v)
>          rc = vmx_add_msr(v, MSR_FLUSH_CMD, FLUSH_CMD_L1D,
>                           VMX_MSR_GUEST_LOADONLY);
>  
> +    if ( cpu_has_vmx_notify_vm_exiting && vm_notify_window >= 0 )

The assumption then is that values >= 2^^31 are nonsense? Generally
I'd think we want to special case merely ~0u, giving the variable
unsigned type. However, I also don't see where you disable use of
the feature in that case: Merely skipping the VMCS update here isn't
enough, is it? The field itself doesn't know any special case
values (like ~0) as per the doc I'm looking at. So I guess the OR-ing
in of SECONDARY_EXEC_NOTIFY_VM_EXITING in vmx_init_vmcs_config()
wants to be conditional.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4567,6 +4567,30 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>           */
>          break;
>  
> +    case EXIT_REASON_NOTIFY:
> +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> +
> +        if ( exit_qualification & NOTIFY_VM_CONTEXT_INVALID )
> +        {
> +            perfc_incr(vmnotify_crash);

Is this a useful event to count? We don't count other crash causes,
iirc.

Jan



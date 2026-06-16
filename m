Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7D9AKLASMWrIbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:09:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213468D631
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:09:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=To1dW4DO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338866.1599939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPmp-00050c-5f; Tue, 16 Jun 2026 09:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338866.1599939; Tue, 16 Jun 2026 09:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPmp-0004zB-2p; Tue, 16 Jun 2026 09:08:47 +0000
Received: by outflank-mailman (input) for mailman id 1338866;
 Tue, 16 Jun 2026 09:08:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPmn-0004z1-Ht
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:08:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPmm-009MIu-Uf
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:08:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311293-e002-0a2a0a5209dd-0a2a4506ca8a-18
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:08:44 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a31129c-7371-0a2a45060019-d155dd29c98c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:08:44 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-45efb698ef2so2290754f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:08:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa5120esm62220735e9.8.2026.06.16.02.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:08:43 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781600924; x=1782205724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3JUDVRgeMDZPIQkKrHMxp07axqEpk6Xa+nbtqsCBslc=;
        b=To1dW4DOEDl21wt6dJ60gVzQyhwj1JeNDXyWDn9Ihn4MFhxjCa/Rz4/88VJ9K2gvpo
         RiPsnTTQODUvHr18awHuOcqghP9ioGqWocY002tDJ0IgDwT8Em3/ntdj6Pf8m/H4Rp8u
         Fn60Ji1vze98I8/ZGTBb2TLixOn9j2jWDea/M4ulOuGK1XyjFCTsnIvpjHEcC61xHxZg
         h1k6h1CzHX9IGCm+1J4FZkXyiL1FmiDbgAfxjF/afTVeXZ8sqqupNP6Z5O6WN3U/Byak
         O0dI0Dc4uhVuYTdn8tgVFYVEm1gLosZH6XwdSdz7lnE08sZxW517y/tnDL0OtPxQlSj3
         XAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600924; x=1782205724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JUDVRgeMDZPIQkKrHMxp07axqEpk6Xa+nbtqsCBslc=;
        b=tPUVUIKvsIibAF/kNyscm7XqF73EYO1WytjXklRPR0ME3h3/JJK+Muj6w23JdHOlQg
         WiHk2e2+1ME2Lyg2ZoC4W7K54oxjgeDGYkb71on6jpdQvZQK1K7jWNmfSzXCSPOg1PL6
         XydkH7XLdVezlfSe/4kgpdSwO1l4ZnD+uzh1hktOzD0Xh8GKdMyfjcEXM0CowyQufFS7
         AY3toY3DaKdUdBkNqD8PSvcvxA94HdBkEWKZA+0UkxGF4MHcJQ/fuX4JW+3aaZEcVAUR
         IPgkBu/aX955inZc2R9pQk9tCHSMuVZE1E6j90qBjbkG90SyhNDLcSiDEWWfLJigLnE/
         A1kA==
X-Gm-Message-State: AOJu0YyZEAkfKOVFdm5vr74DU7uCVqh9GhJ1oMpGmydbeSunRGRSeY/A
	z88lltRDXpJXawuPvswVy5sCGKg+W9cHHmhkWNVhKLN5IBiIKEZ3oTmlFWb6nT5G/A==
X-Gm-Gg: Acq92OGid9TldTylCstBOd80owgGHDi8ZilZVI+/2ovHSzv9/M2oM9s+uzr2ArbQ7jT
	arhu1J4gTO+6ccT9AHKvrkvSjK5FXgPbec9sC9EgZb7iHVWpuheT8jqU61iMVixfJQk/bpZZelp
	Y24Cc/0/ubGjbeDMemZ+ABT2CA6QFXEm/C766D3a44PGjU1GqdpbPsIkxvHcIy+5NnHENBF0tf9
	E/dsSxQUiLUub7/tXEpAOcpKS0W0kftEZBf4rjNEeXsuJLg01eRz5WqIlgndOeoToQxK224I9RO
	6LIP73K8kENnIRuePyuiuHVbo26uZ3qblRb6wM1ombacGBrFx4/WQyb8GZtvVe7u4AkDxbxtedY
	GiWTJO+d9GGynwd2xvPt6/Ukoo00iXZABJz2zc+2eBTgDuO+OdzEbVjjTGw3CZaut8q6E1ZF8wB
	L898uups+zbc3Kg9iKP9hblAIqTupO0UWw9GRx83HelUJsIA25v3BIR6y9QvRiaFGukS3mq+wVw
	wMXq95XzckwFvU=
X-Received: by 2002:a05:600c:4e0e:b0:492:2e1c:1d19 with SMTP id 5b1f17b1804b1-4922e1c1d3dmr75537485e9.31.1781600924055;
        Tue, 16 Jun 2026 02:08:44 -0700 (PDT)
Message-ID: <178ae0e7-158b-4532-8edd-a11acaa858ee@suse.com>
Date: Tue, 16 Jun 2026 11:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 6/9] domctl: handle XEN_DOMCTL_getvcpuinfo
 without acquiring domctl lock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <0e38793c-e201-4cbe-8cee-6cd26996173a@suse.com>
 <ajEP0N9_VYAnPxKH@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ajEP0N9_VYAnPxKH@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781600924-8C87AD75-67578D72/0/0
X-purgate-type: clean
X-purgate-size: 2134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,xen.org:url];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1213468D631

On 16.06.2026 10:56, Roger Pau Monné wrote:
> On Mon, Jun 15, 2026 at 04:15:12PM +0200, Jan Beulich wrote:
>> Like for XEN_DOMCTL_getdomaininfo there's no need to hold the domctl
>> lock for XEN_DOMCTL_getvcpuinfo. While moving the code also switch to
>> using domain_vcpu().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tentatively-acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -546,6 +546,33 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>>      if ( ret )
>>          goto domctl_out_unlock_rcuonly;
>>  
>> +    switch ( op->cmd )
>> +    {
>> +    case XEN_DOMCTL_getvcpuinfo:
>> +    {
>> +        const struct vcpu *v;
>> +
>> +        if ( (v = domain_vcpu(d, op->u.getvcpuinfo.vcpu)) == NULL )
> 
> Since you are moving the code anyway, I would rather do:
> 
>         const struct vcpu *v = domain_vcpu(d, op->u.getvcpuinfo.vcpu);
> 
>         if ( !v )
>             ...

Ah yes, I agree.

>> +        {
>> +            ret = -ENOENT;
>> +            goto domctl_out_unlock_rcuonly;
>> +        }
>> +
>> +        op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
>> +        op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
>> +        op->u.getvcpuinfo.running  = v->is_running;
>> +        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
>> +        op->u.getvcpuinfo.cpu      = v->processor;
>> +
>> +        copyback = true;
>> +        goto domctl_out_unlock_rcuonly;
>> +    }
>> +
>> +    default:
>> +        /* Everything else handled further up or further down. */
>> +        break;
>> +    }
> 
> As you are introducing this here, we might want to also move
> XEN_DOMCTL_shadow_op handling into this new switch block: with the RCU
> taken and after the xsm_domctl() call.

Indeed, as indicated yesterday in [1]. Meanwhile I have a patch ready to
include in a possible v2 of this series.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-06/msg00861.html


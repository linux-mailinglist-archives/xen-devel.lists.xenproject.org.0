Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDn9ERdNsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:55:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCC25520E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250371.1547840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Mo-0007iY-LU; Tue, 10 Mar 2026 16:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250371.1547840; Tue, 10 Mar 2026 16:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Mo-0007gV-I9; Tue, 10 Mar 2026 16:55:34 +0000
Received: by outflank-mailman (input) for mailman id 1250371;
 Tue, 10 Mar 2026 16:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w00Mm-0007gP-RY
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:55:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b4a817-1ca1-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 17:55:31 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso107282585e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 09:55:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48534fa65a6sm172083335e9.2.2026.03.10.09.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 09:55:30 -0700 (PDT)
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
X-Inumbo-ID: f2b4a817-1ca1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773161731; x=1773766531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yifBnf9TlEonB14TYREFh6/NspZbrRBdgUShsp6cVUA=;
        b=BrmRzpMzs4PDAeDxCLgSrFx/iHsz7QUs9cf/qr8wvKAelja+sWL4oYZ8aUO2AYq5wu
         CTy3uODFG/gJkKPVw8YN4CbU9CCcWvFGcoePIxT2wMODCUy7gWan21ema23EPT3vjblH
         ryGnc293yUj/VKs8q3aiua6uAQuTeFiuaYaeKSP+wMXpgBLbQ1JGFfLuiIm5QWm6prCR
         qNkJRTymZaBjH3SJg6SGCW8YylvOQzXC5DGbt8ucqtWqzffnKqjDSj15ngFcrG6xONjE
         klITRg/Clr3E075At88wm2azskTWZFd/T0mF24ctETQrm+0lwa5a+s6Kcu1MunTqrWcS
         LVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773161731; x=1773766531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yifBnf9TlEonB14TYREFh6/NspZbrRBdgUShsp6cVUA=;
        b=p1ejcFgXhYfuBSx4k8NGL+bUwbBGWwOS/EdkxJTcuoCBGFW/1tDIMfYu/RoXxdUhyb
         PoKLqLLeAyAfDJh2LTayQojsbd3bqAl5Gr5dWyDxpbmtv6o9okEN7vSo4GuMYMoTV3Zf
         YYuEy7sklgXiUBClmUUiKZz638mtWf8OE+FJ+FIKpzm1Vw/1OAsfcVGpIyGDFBFCJ9Xq
         YKoO06U0L/2SXx7TsR2YmlQ/bxj40+PiltjvcUJSYrAY+QXiicAI+ZkjTzLOcxhlk0dd
         2ucCNmI1hrCQIM0Lp7kUQd6O7IvPeruAYQdis20kSPtQKpDG337tuHec2yGFSMDXxMgh
         rzFw==
X-Forwarded-Encrypted: i=1; AJvYcCVFGE1ERbEoAs2Lw7ULpC0zUS8UE8JxCDdq73t+MQbN+7W7wxV/22MakDN+CEeHIQpsmc7VOtGahLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7EomEahZqTMG6PUdUnZSABJXB/yeDIZTWoxEMPgoH7BmEbwyf
	g5lxvYO18RIh+AAwNes3aacDUoZXxyyvIYgar+pTprO20M35cRDFsBjZU2eULVuwXQ==
X-Gm-Gg: ATEYQzxkkUyRAUZsUF5cTOWi5jh6DAs0+FCEkfOcmBQiC3rgRQDimJMBf2zTYgEkreG
	veTsIUPrCmnesStMb/hruUL3wiYyt1vlTvml06jS4YWLh5/2nIbpI7vrk6I5c/hNKplaJKvzL0i
	Y8jWDCiKZMsZI1i8QWnj4xfD3N0b2ADs76z7nxt+VJZQ+7XH1KqeWPD/v4cIo1+4aQ1VfnMLCGY
	HuNCkFWrFQbObMQOsk2l858DB3Le+oEyLZFBvgOjMaxgSxSVsGVy9sj+SKcxUjY88/D0ECLWEvS
	AbrxKjTR1nHoBpcqenw/EexErt0qOxse1/xXj5nxNul4kr87huoO+tsRYd7iZMaQOZYcnS4Bf/g
	5DR1CTZViyoTgHtrgdPAOCN2AJsfGiUpKjQDEgppaqiBo4zIvn0tJuVHlIVEYiP8ojgHLGoYjra
	MUbNei4OvjejsIx6VKQlIqQ7iHCc1XkP0JPc7yEN7FVdLuNu6MaqIbySISdamexjBvqoWHlo4aD
	ZhBnpO21PX77hM=
X-Received: by 2002:a05:600c:a4a:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-4852691e00dmr256773305e9.14.1773161730685;
        Tue, 10 Mar 2026 09:55:30 -0700 (PDT)
Message-ID: <b68a356b-2cc7-49be-bc8e-eea36d316175@suse.com>
Date: Tue, 10 Mar 2026 17:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] x86/vioapic: Add ioapic_check() to validate
 IO-APIC state before restore
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
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
In-Reply-To: <20260309123055.880050-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AECCC25520E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 09.03.2026 13:31, Julian Vetter wrote:
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -594,6 +594,35 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
>      return vioapic->redirtbl[pin].fields.trig_mode;
>  }
>  
> +static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h)
> +{
> +    const HVM_SAVE_TYPE(IOAPIC) *s;
> +    unsigned int i;
> +
> +    if ( !has_vioapic(d) )
> +        return -ENODEV;
> +
> +    s = hvm_get_entry(IOAPIC, h);
> +    if ( !s )
> +        return -ENODATA;
> +
> +    for ( i = 0; i < ARRAY_SIZE(s->redirtbl); i++ )
> +    {
> +        const union vioapic_redir_entry *e = &s->redirtbl[i];
> +
> +        /*
> +         * Check to-be-loaded values are within valid range, for them to
> +         * represent actually reachable state.
> +         */
> +        if ( e->fields.reserve ||
> +             e->fields.reserved[0] || e->fields.reserved[1] ||
> +             e->fields.reserved[2] || e->fields.reserved[3] )
> +            return -EINVAL;

Are comment and code actually in sync? I can't spot anything preventing the
reserved fields to be set by a guest. Such setting would simply be ignored.
(And this is actually why I was asking you to add such a function: By adding
the checks you should have noticed that the fields can be non-zero if a guest
writes them this way. Which in turn may pose a problem for your extid
intentions.)

> +    }
> +
> +    return 0;
> +}

If it wasn't for the above, something like this may do for starters. Would
be nice if base_address, ioregsel, and id also had some sanity checking
applied.

However, does this build at all with the function unused? You lack ...

>  static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
>  {
>      const struct domain *d = v->domain;

... a hunk altering the HVM_REGISTER_SAVE_RESTORE() further down.

Jan


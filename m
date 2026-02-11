Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DFVA7+RjGlQrAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:27:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72204125357
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227717.1534149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBBB-0008Uk-Vq; Wed, 11 Feb 2026 14:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227717.1534149; Wed, 11 Feb 2026 14:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBBB-0008TJ-Sg; Wed, 11 Feb 2026 14:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1227717;
 Wed, 11 Feb 2026 14:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqBBB-0008TD-2e
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 14:26:57 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b790b3f3-0755-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 15:26:56 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso18698175e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 06:26:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835bc6ddcbsm18613025e9.16.2026.02.11.06.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 06:26:55 -0800 (PST)
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
X-Inumbo-ID: b790b3f3-0755-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770820015; x=1771424815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u86qJZK/8TZNS6k6MRdcLV7wGkae6xtAu/qyMW+Eev0=;
        b=g4zjuwnNa4YfAiNTPUdmftpGA5gxkPu6CwoWs+j6euDGVITJVFV6c2a5+VTHih04rJ
         EH6hsU7/YMZm92zrvyN/Y118r1dqjpzAanSfC99rVFKpu9CBE5R2p3tLd2UrffVH+qzQ
         a8oikyWfgBGAXrBI1ev7IID4/VImh1/8JA+/qZDxPgFZMmx/V4Fih/u3LrOnvzemZG5g
         R56jhcOajR8bPnNglTr/AcRwJ9Wpi+l7WG5V0LduamzVAqdlMoBUXb3eCkVoptW9AUvF
         VY46MHaY++/19JTM20/Ue5UsP6BrLrxbVqbqv3Nit381paEu6ZX9EvjJfPWUbIlx2LrD
         pCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770820015; x=1771424815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u86qJZK/8TZNS6k6MRdcLV7wGkae6xtAu/qyMW+Eev0=;
        b=MiZ7wx64bQtfLspR8a3K+lUtt569A+w0soI+cMMO2SL7ScrkbRnlTVcJ/+AYGufsPj
         hPkLDMbSQyHH9CY4V/bTmFNnyg/iT4C7kJPKNXAUlji/lp8rQh1tQtMbjmFpTTD71sCS
         KGDK6TPRNBjCpnvWrf5js/Tsg8xptCs1x6m2YdZHz34bGVtp/g/cok0AEhEPzOZ1iWGr
         E97lcYB0Wjz6mdQNMOk55lvw5uE41u+bTmmX1kASqhQkq3wKY6bdV702s4nl0WVS/eDp
         uyqhFhfvk3k+Y1oRtZE27KlLiVK2uraNIAYUqGiFBmuiG8Jkp7/UziuJlgxuLtj/daTL
         zBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4CNrnWJAbyBpYug6SJm/GkWweHq09MASmaxRkah7qHQceFXhtbZC5NkKgvLHwPNyu8E7V5J7FJX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu8k0VmiMaKJwiRKef0MhQIZazP4Q5wBIs4ttKNtVnTGODVE3d
	pF1Y6VdIdWef13ne2oyjQNF5dAr/zGCkWtl6GNg1PJgDuoXbmmAPG7xzyd4IGcql1w==
X-Gm-Gg: AZuq6aLhVbyPNQyK+d58PYw5kmlCJ4Y5KeexX2GimU+4K8p5aiabCmbGfXxRJfNnkNI
	YMfnurlXTqwoSnbD0XBK+J7jLI+KnMtcVkWow4IuuiXX3ayg677Bp5IWVI11e9QlSfBFr3ZqHlx
	m/hvZEo5LSy9UXUr/Wm57p6UwMKhoAQ0VG7r/u08lBkoZWRrWB6R7fBhe1PsWwO+440sUePzaDg
	llN5V/SLsSCcUANctTaL8RmAg3EVZ73NP6b80dOFcynvUhlBsNKbzzx8K2JDgklzUbH0yUNtz+K
	kCxZKmvuxnlGsmGAoFW4N8JpudK/TplOkYBKZmVzkQbZ0MwACcgKMRmKSTO24w5OE+AD6xHLYVO
	qBGUGLWGkveNmQHxK+UUqOKizRzoGg2cO+IRUa0VPmGV/2OWXmmvq8UbSk24meoFcNf8pJ+/goR
	CrnJ/7z/AoCmD5zrPxnMczJr294g0FGyEO/+3FVb4+BC1SkIRYlRHvIRcoiuIhOwXFJPnuWf0u8
	YEs7lAx587HWRw=
X-Received: by 2002:a05:600c:3f08:b0:480:46c6:bf4b with SMTP id 5b1f17b1804b1-483201dadb6mr271014615e9.5.1770820015418;
        Wed, 11 Feb 2026 06:26:55 -0800 (PST)
Message-ID: <2f50ee9a-b2f3-4e33-a2a9-fbf066e93f8d@suse.com>
Date: Wed, 11 Feb 2026 15:26:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <a81d2873c901c825a08f817d962a8cef09167447.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a81d2873c901c825a08f817d962a8cef09167447.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 72204125357
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> This patch is based on Linux kernel 6.16.0.
> 
> Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
> interrupt tracking introduced in part 1 (for producers). According, to the
> design only one consumer is possible, and it is vCPU itself.
> vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
> to the lack of functionality) before the hypervisor returns control to the
> guest.
> 
> Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
> irqs_pending_mask is performed only by the consumer via xchg() (with aquire &
> release semantics).

Where the release part isn't relevant here, aiui.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -194,3 +194,36 @@ void vcpu_sync_interrupts(struct vcpu *v)
>  #   error "Update v->arch.vsieh"
>  #endif
>  }
> +
> +static void vcpu_update_hvip(const struct vcpu *v)
> +{
> +    csr_write(CSR_HVIP, v->arch.hvip);
> +}
> +
> +void vcpu_flush_interrupts(struct vcpu *v)
> +{
> +    register_t *hvip = &v->arch.hvip;

Why not in the if()'s scope, when it's used only there?

> +    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
> +    {
> +        unsigned long mask, val;
> +
> +        mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
> +        val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;

Make these the initializers of the variables?

> +        *hvip &= ~mask;
> +        *hvip |= val;
> +
> +        /*
> +         * Flush AIA high interrupts.
> +         *
> +         * It is necessary to do only for CONFIG_RISCV_32 which isn't
> +         * supported now.
> +         */
> +#ifdef CONFIG_RISCV_32
> +        #   error "Update v->arch.hviph"

Ehem. I really dislike having to give the same comment over and over again.
Please have the # of a pre-processor directive always in the first column.

Also, isn't this misplaced? The containing if() checks irqs_pending_mask[0],
yet aiui irqs_pending_mask[1] would be of interest for hviph?

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -172,6 +172,8 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>  static void check_for_pcpu_work(void)
>  {
>      vcpu_sync_interrupts(current);
> +
> +    vcpu_flush_interrupts(current);
>  }

Ah, okay - here comes a 2nd call from this function. However, please latch
current into a local variable (already in the earlier patch perhaps); no
need to fetch it from per-CPU data twice (or yet more times, if further
stuff was going to appear here).

Jan


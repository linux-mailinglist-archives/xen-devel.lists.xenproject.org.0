Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOUkDl2AlGmwFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:51:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8F14D4E6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235109.1538155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMPf-0000MF-EP; Tue, 17 Feb 2026 14:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235109.1538155; Tue, 17 Feb 2026 14:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsMPf-0000Ju-Ar; Tue, 17 Feb 2026 14:50:55 +0000
Received: by outflank-mailman (input) for mailman id 1235109;
 Tue, 17 Feb 2026 14:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsMPd-0000Jo-RA
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:50:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e3c7f4d-0c10-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 15:50:52 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4837634de51so14585625e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:50:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483709f8812sm196258605e9.0.2026.02.17.06.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:50:51 -0800 (PST)
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
X-Inumbo-ID: 0e3c7f4d-0c10-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771339852; x=1771944652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hL6gJuAhqkWwCk2BuqZmJOE1LypbiaDp8JQBFCKWYl4=;
        b=J1AK1ynwcCBTcQszhKLp0sMEsnL0ZEarlKWtbJC95i9rRL01Tvt3QKMCG0R6AxsFav
         t+IPpSssVJaIwI+2cXj9T+0slN/SsFbYQGnpNG6u3yfKrbed6VmW+c/7ZTgxY8h/3aZq
         4wbR8SLIIYvNSAXduNq4pebf0PGpi3wJ81purj37uhoMMrmhIvqn7tMSnF4R1s660u+p
         OXuHOfb682XZ0sDFEtsmHfWAsl7NT8vH8D3yJ0BNlYt4zt1uP3+EC8N6VRUTiaAv7Qu6
         ++a1IdcwVtvVAvLmSEMRE/DowPymATrzlarlloKifNUqWa1AziCsanDsr+aw1MfCK+IU
         +urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339852; x=1771944652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL6gJuAhqkWwCk2BuqZmJOE1LypbiaDp8JQBFCKWYl4=;
        b=Z5WZ2wi2DnEkaS+518w0xbK6uSYY+geernZOL5jLWzSolk3f4UKZ4qZzV3tjiVt3ly
         a3SakPL7AVhiU1NwSh1BO8Y+x3xgFaS1xJbublphxDb3hzf1A3kvqc7ppfKJym+wKmuJ
         LLfASuOIPtrSMP9WiwXkr8RVV+toTH1SuEHI5eqzX+o7L3qExMdlpNhl18iT54mccIdy
         SkmY2Owu5yPseyhs/aJcAPrtbLyqdlhOzs2BwQm/s6PpyPOLsU6JtJTsXyAnIcR9Xk2E
         JZSRmIRPppkj9HDoOIY4aeZujWmgS65boUziiGaHylCbJ9UyhDnusTMejIxCTNpSdJua
         WHfw==
X-Forwarded-Encrypted: i=1; AJvYcCUslRR8liissW06Jr+Fxtz/SWnGHBQMQGNUt88zorQ5IwZ+oAlewGkpFwGH69PhVVUAUi2XQn1AJH8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtTxX1zMRMquOB2/C/KREkdUWb7j8pOyUUiOg5T+Ny2dq0h2WL
	0p80jOJaxmk5hC2mfi1NKoCtmcq7G/p5HitESwwhXuzckGLOaw4f62ctVsOUwItDVg==
X-Gm-Gg: AZuq6aIr5qxXi1pAIsjF8usId31uwglWOpss+wi3LpkOpqr2F1Rel+2i6mkG6hTyh+s
	Bp5QGfouTYVra4Ij7GM+Qynql4xPWhtJf6yNZd0TCNhc07tGPc5uMN/iFip0T0rg3YkQ/2Kv1wJ
	hyd6TKayTHKT4jwyusLM9b1vSGv9LU1Tk1YTKGlqLZV2mvPM/AekmdLTIZBojjrg29nQvd5n/s8
	d5+PMJOWINhoOFodVnjLiq2dK9RZ9KFBBcDfaeddWQEsokjaCM40Y61d3Ajgm/g29BHWaUwSzRh
	wlmHwEkxQn2uLKAkwHPs3IlxIPvznNdCDSN+0Ond28qB4r1OyAwj6g/j9D/cUBdaNFxrh814koc
	oHEpfnq6K5qRzi9M12xksPt4AH+GOjXFWp7L9FDtI/y3ZB7tSOVwaQs74mgL1vc2YwXVu5/6eLb
	WSmtDT6xCgAVtYLxNURmx82Oxgsw/Wm3xtnkDdAn/1QETYuRu36/Km8cLQRdCIvfQUiZ9X6kG3m
	xUvdW9OWRWHyC8Gryy4eezAdQ==
X-Received: by 2002:a05:600c:c3dc:20b0:483:7631:befa with SMTP id 5b1f17b1804b1-4837631c7c9mr187444715e9.5.1771339851863;
        Tue, 17 Feb 2026 06:50:51 -0800 (PST)
Message-ID: <692bfb04-ed05-4c8b-a0d8-1a5ed383c877@suse.com>
Date: Tue, 17 Feb 2026 15:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <4e10c95d883c0d447b9e33a6d6a92e911aed6a23.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4e10c95d883c0d447b9e33a6d6a92e911aed6a23.1770999383.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 84C8F14D4E6
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -198,3 +198,34 @@ void vcpu_sync_interrupts(struct vcpu *v)
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
> +    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
> +    {
> +        register_t *hvip = &v->arch.hvip;
> +
> +        unsigned long mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
> +        unsigned long val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;

Nit: As mentioned before, blank lines should not normally occur between
declarations (unless there are overly many of them). With the blank line
removed, personally I think things would end up slightly neater if hvip
was declared last.

> +        *hvip &= ~mask;
> +        *hvip |= val;
> +
> +        vcpu_update_hvip(v);
> +    }
> +
> +/*
> + * Flush AIA high interrupts.
> + *
> + * It is necessary to do only for CONFIG_RISCV_32 which isn't
> + * supported now.
> + */
> +#ifdef CONFIG_RISCV_32

May I suggest for this to move ahead of the comment, and for the comment
to be properly indented by one level?

With the adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan



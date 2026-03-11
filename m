Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNCyFBossWkBrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:47:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9225FA34
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250864.1548212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0FDa-0000UM-Fq; Wed, 11 Mar 2026 08:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250864.1548212; Wed, 11 Mar 2026 08:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0FDa-0000Su-Cs; Wed, 11 Mar 2026 08:47:02 +0000
Received: by outflank-mailman (input) for mailman id 1250864;
 Wed, 11 Mar 2026 08:47:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0FDZ-0000Sn-9T
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 08:47:01 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dde0aaaf-1d26-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 09:46:59 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso9684433f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 01:46:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81fcd65sm5509623f8f.26.2026.03.11.01.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 01:46:58 -0700 (PDT)
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
X-Inumbo-ID: dde0aaaf-1d26-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773218819; x=1773823619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oGFDLZX5gM93eSepe3XqoJ7xXgEg+qZIyv9kXP118Mo=;
        b=XxyHItVWsbE4CaQFqmOoLX8/aGVDEV7FMMwwJ8xLDbx2cEqxHY837LTnHfyfonQtCm
         H2ioINfFATVIC9v+n51HTH98aD3wrLyRTO3VpONn/4s1NupKPGLmPWArDOFluTmI9RXQ
         Y9XMilbp93nNUZdlxgEK8OPUSyUxWUQjXilnSBiWYI5VA4C+j44QqEN1vf+5gnt1E1a/
         nD6oa6e3SQQrV3S52PnIWeAB6rgSyZoGs969DnV/J9RLLUmmeK7RVjv4aBO9agyqBLXW
         V6bsDi8H5RCLYxEe6jhrInvIa2UwY6KcQga3CD/UH+Q33mAjroJtVIuyyrEcm24WpOR4
         iPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218819; x=1773823619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGFDLZX5gM93eSepe3XqoJ7xXgEg+qZIyv9kXP118Mo=;
        b=BUdpvBFgQpi/rpgfMf9c8MjaBniTvMwL3PfHOZRRDqkOR8ByH4JQdvt+8b3NN+uNlb
         svHgjD3jjtDPfznHTGT7L93E7aH+9R2kPMCA5xsOCvXhLwtPMRftDj4mvmzCuNLjwb77
         VB2aPZWvr/2KZL8FOPqbv2aTfo7GkgMl5EosVj4BarwUJblthnTE1vOQ5+Hsy3c5y9IF
         4AbCmHZgqNCnAv+XC0safLWRmRvN90GVf+1LDENLcLNg2j9Yn/LfkN0Ui311w9ecatrV
         MllCeOI7zl2APiG/g0mnYFzAyX7H1sAGIeCJLqa1NfoG3mzkqyAL64OXsBSEQi//kSal
         tFew==
X-Forwarded-Encrypted: i=1; AJvYcCWR3cx9zAHxMBShNBscvPLBXXgreNUfgGlv2yPV8uM34PqlvlPavEL4ooGB/Qn+rVYIMVOTqcGQvp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzKLDmPhbORWbXN+k40ICxOpoK+8x25bD7Tfap+U59dRyUN/uU
	lF75Sn9u9E9QKQjU3gLzzQzS5G4WLIfcMT/rn03JeGj3Om7JK9weA2isd0qCz591tw==
X-Gm-Gg: ATEYQzyk051vkLk6/JuVVn31OiIEK9AU8Ak2isRvK65DFDe1TsjRe6azMiby75Bog+o
	FbXKmaz2idoKiQBjp7WRRDEqm6XKsAzROCfRVajf/umzKaM7xrD3SZc+mX9beDPUtTykrJecW4c
	JvkCcJZPN90zK9GpPv3vkvdaIU6xWR2XqDxE3LWOcP2NwMKuohmg2PUiDQCoVozhtVULWLjNap4
	k0FNgWy3yMQWw+MuvJvO2hdKYrRAZeP/X7wBQ6StPdw1I/wmrtD/wEFG5e3inlUSOOWcMkbpab9
	lgBmhnWql1oUBGQ29VHn8YpbyfIid0sHnQjwiSrxxgXcx6l984m3NPxohNvnnAnh2Knm5iMgXqx
	Se2rXy3dmU3Dnr4rcgL/hE42FgF3aifrtHg0cFdopGJYsP6X3hpRSF0rwMUzz4Zrwnb3/C5RKo0
	zlV54QsJy7u90+s7frxRUBLz3W4rjIuUCmms3mPk2poehHSHKgfVHiaf2RtO9jYVsnsnr0pLPgq
	/9HesFVY734dvY=
X-Received: by 2002:a5d:6702:0:b0:439:cba2:2294 with SMTP id ffacd0b85a97d-439f822a750mr2433089f8f.37.1773218819150;
        Wed, 11 Mar 2026 01:46:59 -0700 (PDT)
Message-ID: <f63e2fa3-65b9-4dcd-983f-4e753ea21bd0@suse.com>
Date: Wed, 11 Mar 2026 09:46:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/svm: Drop emulation of Intel's SYSENTER
 behaviour on AMD systems
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-5-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260213114232.42996-5-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B1A9225FA34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 13.02.2026 12:42, Alejandro Vallejo wrote:
> @@ -501,6 +492,9 @@ static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
>  {
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>  
> +    data->sysenter_cs      = vmcb->sysenter_cs;
> +    data->sysenter_esp     = vmcb->sysenter_esp;
> +    data->sysenter_eip     = vmcb->sysenter_eip;
>      data->shadow_gs        = vmcb->kerngsbase;
>      data->msr_lstar        = vmcb->lstar;
>      data->msr_star         = vmcb->star;

May I suggest to do writes by increasing address order? I.e. while this
already looks fine, ...

> @@ -512,11 +506,14 @@ static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
>  {
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>  
> -    vmcb->kerngsbase = data->shadow_gs;
> -    vmcb->lstar      = data->msr_lstar;
> -    vmcb->star       = data->msr_star;
> -    vmcb->cstar      = data->msr_cstar;
> -    vmcb->sfmask     = data->msr_syscall_mask;
> +    vmcb->sysenter_cs  = data->sysenter_cs;
> +    vmcb->sysenter_esp = data->sysenter_esp;
> +    vmcb->sysenter_eip = data->sysenter_eip;
> +    vmcb->kerngsbase   = data->shadow_gs;
> +    vmcb->lstar        = data->msr_lstar;
> +    vmcb->star         = data->msr_star;
> +    vmcb->cstar        = data->msr_cstar;
> +    vmcb->sfmask       = data->msr_syscall_mask;
>      v->arch.hvm.guest_efer = data->msr_efer;
>      svm_update_guest_efer(v);
>  }

... your additions would want to move down here (and the other writes may
then want re-ordering as well). Preferably with that:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


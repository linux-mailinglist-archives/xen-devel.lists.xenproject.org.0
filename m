Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3482BEAF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666750.1037610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEvG-00021A-Rn; Fri, 12 Jan 2024 10:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666750.1037610; Fri, 12 Jan 2024 10:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEvG-0001xu-OO; Fri, 12 Jan 2024 10:37:58 +0000
Received: by outflank-mailman (input) for mailman id 666750;
 Fri, 12 Jan 2024 10:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOEvF-0001wY-C8
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:37:57 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a50b8628-b136-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 11:37:55 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so4056207f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:37:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b0040d62f97e3csm9125465wmq.10.2024.01.12.02.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:37:54 -0800 (PST)
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
X-Inumbo-ID: a50b8628-b136-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705055874; x=1705660674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5zB/pswNIYdGg53pgkOeVVwidGfVcoPooKMr+TVH30=;
        b=In5+fGGP+GdwFOal1AAP2pF97Z5fGzFi8Ep3tYWDLgY+TLrjXYJjDc/nb8COHu5nRi
         N7ChxwlnB7l+/wxQR0r9O9KzJ8/XvHw906KCcMDSR/dZHNqBGYCVDT2Dc0hcMIQPpywv
         jdvYGlC+h3y5dOWcJheKmutFrqoYorkX0IijR72Ylq8DXzSL2WWUEfSrAL1lBXlaZUFo
         iPHPxv7ilcAxBGj0AXpLc5QWPO5MssPA9iNPmxWvngxvWmzplnSOdoc5wnnnvcK9FuGt
         VQWnQT39ljBToRIvcW4cTO7Q5G336gDN+VlVWG6ETnTc8PoM7ZMzDMtQqRCBZpH5DjjG
         3iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055874; x=1705660674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5zB/pswNIYdGg53pgkOeVVwidGfVcoPooKMr+TVH30=;
        b=HkRihjrXNmsWkE8W8gA1PFcqeM3CUudBe5u3A+H4hJsrLLnmckFKsxflpuwlZdXrgY
         719ju1FwMbq6OOKxmMyxJ91HjbWgjb83zCpLhVvAaXP9RSYzI7oq5KIsJVUwEp74oAze
         niKXvVt6vltOf8zmBC0+sEd8HSindc4Eci4mJ0qY5VQDCnpONFaljb0XJbkl1DWhvgwP
         9Twa6rEOUbs+I1HYJ5MnYfS87lDmaTCEKPfp445wOZ2IrnGiOGnVV2qQTYiNFcODBSmf
         JBE2i45xCELFNtZKEUxxkPBJI690xnmoG7Sb9T2il0lShUYkj1UTOcVTFK+xGJWoYFQ1
         bSrw==
X-Gm-Message-State: AOJu0YzuPJ8fz8LERWMZHRkWFk5caRGnwv10xhF894evr93tONuOf4xk
	GNG6nn4nT+UV+XXauF+qE4P/BeePfGYa
X-Google-Smtp-Source: AGHT+IEcUxWmGHUDJGhKvKW9klyhPv0ZXcz2QsshCCWZGa6mNfsjE6zyo/enLtK9j2c0l4PMko6osQ==
X-Received: by 2002:a05:600c:3147:b0:40d:5d0a:cf4a with SMTP id h7-20020a05600c314700b0040d5d0acf4amr690707wmo.34.1705055874575;
        Fri, 12 Jan 2024 02:37:54 -0800 (PST)
Message-ID: <d9d9ee2b-ff95-4d5e-bb81-b1722681a4a5@suse.com>
Date: Fri, 12 Jan 2024 11:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/vmx: Disallow the use of inactivity states
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
 <20240111231323.4043461-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240111231323.4043461-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2024 00:13, Andrew Cooper wrote:
> Right now, vvmx will blindly copy L12's ACTIVITY_STATE into the L02 VMCS and
> enter the vCPU.  Luckily for us, nested-virt is explicitly unsupported for
> security bugs.
> 
> The inactivity states are HLT, SHUTDOWN and WAIT-FOR-SIPI, and as noted by the
> SDM in Vol3 27.7 "Special Features of VM Entry":
> 
>   If VM entry ends with the logical processor in an inactive activity state,
>   the VM entry generates any special bus cycle that is normally generated when
>   that activity state is entered from the active state.
> 
> Also,
> 
>   Some activity states unconditionally block certain events.
> 
> I.e. A VMEntry with ACTIVITY=SHUTDOWN will initiate a platform reset, while a
> VMEntry with ACTIVITY=WAIT-FOR-SIPI will really block everything other than
> SIPIs.
> 
> Both of these activity states are for the TXT ACM to use, not for regular
> hypervisors, and Xen doesn't support dropping the HLT intercept either.
> 
> There are two paths in Xen which operate on ACTIVITY_STATE.
> 
> 1) The vmx_{get,set}_nonreg_state() helpers for VM-Fork.
> 
>    As regular VMs can't use any inactivity states, this is just duplicating
>    the 0 from construct_vmcs().  Retain the ability to query activity_state,
>    but crash the domain on any attempt to set an inactivity state.
> 
> 2) Nested virt, because of ACTIVITY_STATE in vmcs_gstate_field[].
> 
>    Explicitly hide the inactivity states in the guest's view of MSR_VMX_MISC,
>    and remove ACTIVITY_STATE from vmcs_gstate_field[].
> 
>    In virtual_vmentry(), we should trigger a VMEntry failure for the use of
>    any inactivity states, but there's no support for that in the code at all
>    so leave a TODO for when we finally start working on nested-virt in
>    earnest.
> 
> Reported-by: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark/suggestion:

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1551,7 +1551,10 @@ static void cf_check vmx_set_nonreg_state(struct vcpu *v,
>  {
>      vmx_vmcs_enter(v);
>  
> -    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
> +    if ( nrs->vmx.activity_state )
> +        domain_crash(v->domain, "Attempt to set activity_state %#lx\n",
> +                     nrs->vmx.activity_state);

Might be useful to log the offending vCPU here?

Jan


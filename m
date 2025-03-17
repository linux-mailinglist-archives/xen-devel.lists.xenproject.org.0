Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F11A646A7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916347.1321452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6Ta-0004Ji-TO; Mon, 17 Mar 2025 09:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916347.1321452; Mon, 17 Mar 2025 09:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6Ta-0004H3-QO; Mon, 17 Mar 2025 09:09:38 +0000
Received: by outflank-mailman (input) for mailman id 916347;
 Mon, 17 Mar 2025 09:09:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu6TZ-0004Gx-2x
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:09:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c1bf511-030f-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:09:36 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so11797815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:09:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60b46sm97764855e9.32.2025.03.17.02.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:09:35 -0700 (PDT)
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
X-Inumbo-ID: 8c1bf511-030f-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742202575; x=1742807375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RiKWfJGPR/KIrbaVCD/SIYFMzHga2Pq3dPGZybCPlGg=;
        b=BbZjx4TM75Kb9XQeFSq4Cu4QrU5jGpCFrxgh0XUjftt1pTQxwc8fWeXHSYWecugnn+
         mqcECS9smWXhdpB0qMWvTooalwH5Xw5bNPnzdsPQkNUaAlf9iEPBORZOJvRueZBzrmlf
         s1l7BVpXHegGU0iacga9YKLg5uRlCgQmijQGM+BwRmPGw3B5PRS0d50/6tg3SVFTcjcE
         w/QflWo9gGIhtXbMq3qGOhHdWMInE2olgsNvDc8sY7zt8aQPwtjJdA2sxjywvfKnjNyl
         XabXxpvphXP9sepqrSasBntqGA+qx0WZJe8w+cVpzfzF3z8tamKD44EB7lvear8yVNCy
         KmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202575; x=1742807375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiKWfJGPR/KIrbaVCD/SIYFMzHga2Pq3dPGZybCPlGg=;
        b=Bzf5k6c9yC+Pw2UXgXi+1850SKpGKlbRKjPT2ZT80UDnRJOsQ6Yadea1oP5h4XJdxj
         hdBlRzoqAMs22xAU6FbvvYOmMjzBiDUni+Dv2nUTdj4AQSCWSEUnJ7MyYx0NpZH+RihI
         sn2stmwCeSlES7wyPeloZHh3A43hKBgA6D0fwA0mMOY9UM1LItn/lqiA+KEp8oPfsGoa
         T+5NT6IGGWUO7f18IySotxiohHtNvpDVwbW33zUDS+kSBJV/FLUuvIVWAxcx9tGe0suK
         rHRXgjmrtMSSOnwG8GVrUBYHc4jXjV9MXcVVvWBRPkmLPm+aJlRsTzrptBdSoaSg8M2P
         U3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCG4kg5k4UAhZavE0vewihi+sJm/7UOO6ogYEdskiEWFe6bJ4i+nsquTPRoBIq+L0bFi/LwubyoH8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzt3gTWPu0bhe2A7JMgCCQBxBPcSVvu5gV7Cv21liFvan1zKYVM
	bjp/Sbq+0pJE064q5jhuRM9W1lm5tTpwkWSzeNpTJPYKbV9rimtH+4Z3h/Ouow==
X-Gm-Gg: ASbGncv/6faTf9L3/57waHa05WfLbivc1CX0pvOcrKfl4RPmvc6fOpv3W709Q/EhL5X
	CUoXVtuuoWgea7staX07sRVLPby8qdbL5qPd4npjftK7nns7YuKKOctB+l3t4TdeBAYvOE61HwG
	PRM0aSKY8M3c2/JaM34pkSq8fIdEJnSQi22H6iEBzAo4+yYs1ZaCRkGcAVVewmlPkBrf+sRTq4u
	Ze3I+OEF4B5yVz3BqGUN5A/cin8MWMJyi9EQZ4hIdW01LsuvbuMGkbxpfQlMkESWCdWQr+wXunf
	AURKqtBOS2WJpJNFWPs840vuuVlnYuOeylTXCkXWTCQfkWik0tCQRig5pmJUkOFeP89goCs7DbD
	QJCE54J1EfUM239t2TePpsr0/gDLvLw==
X-Google-Smtp-Source: AGHT+IFd7F6YSJKAKnKcGqxTupKpYobG1QHUEJdzk+Inl4z3km/6diocTfK2VvX5Qcp8e2ul26cF9w==
X-Received: by 2002:a05:6000:4025:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-3971d51fec1mr13833195f8f.16.1742202575440;
        Mon, 17 Mar 2025 02:09:35 -0700 (PDT)
Message-ID: <781a020c-351d-4211-ae51-8057646c28e2@suse.com>
Date: Mon, 17 Mar 2025 10:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314204920.118065-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250314204920.118065-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 21:49, Andrew Cooper wrote:
> ... which is more consise than the opencoded form, and more efficient when
> compiled.
> 
> For production VMs, ~100% of emulations are simple MOVs, so it is likely that
> there are no segments to write back.
> 
> Furthermore, now that find_{first,next}_bit() are no longer in use, the
> seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
> they do need to remain unsigned int because of __set_bit() elsewhere.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I still can't persuade GCC to do the early exit prior to establishing the
> stack frame, and unlike do_livepatch_work(), it's not critical enough to
> require noinline games.

Then is ...

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -3022,18 +3022,16 @@ void hvm_emulate_init_per_insn(
>  void hvm_emulate_writeback(
>      struct hvm_emulate_ctxt *hvmemul_ctxt)
>  {
> -    enum x86_segment seg;
> +    struct vcpu *curr;
> +    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
>  
> -    seg = find_first_bit(&hvmemul_ctxt->seg_reg_dirty,
> -                         ARRAY_SIZE(hvmemul_ctxt->seg_reg));
> +    if ( likely(!dirty) )
> +        return;

... this worthwhile at all? I'm surprised anyway that I see you use likely()
here, when generally you argue against its use.

Jan


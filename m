Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGwkBP5k/GkqPgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:10:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C34E680F
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302513.1576424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKvfH-00046P-IE; Thu, 07 May 2026 10:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302513.1576424; Thu, 07 May 2026 10:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKvfH-00043o-Ex; Thu, 07 May 2026 10:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1302513;
 Thu, 07 May 2026 10:09:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKvfF-00043d-UI
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:09:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKvfF-005jZ7-BD
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 12:09:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc64b6-e002-0a2a0a5209dd-0a2a450ab3e6-16
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:09:05 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc64bd-56b3-0a2a450a0019-d1558030bcdd-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:09:02 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso6518515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 03:09:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53895f0asm125067055e9.2.2026.05.07.03.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 03:08:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778148541; x=1778753341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HbtRJw+QEI5mtSKcpsiS8KnHqX7Lm7TwkaVuPue5Dlo=;
        b=Wt4C2oTQNdTFdPiKcCdIppAZLuxL/a3S6kXmRoCWY/0OC31tUQVrYQwMINr6Vj7nwq
         E/1mPc5SweF5asBMLgbJFuN1px8MCJiXZvJkeFwqg4PPrYvbqjnsYngcFwx+60EyYmh3
         yKeS2mrYcj59dMxpRBvn8OoMRFZ8V+9Dl4D0MesSpuZxhSmpiIvi2fzgETaznewEBDdp
         oc8RGNWAMCZHUSDKuUda2uI4HtZTdFiT6eyfpIsaPMrGzxdWwLl0dzdnD6uJyd8ae0bH
         z1wp8q3pq319N0xD34KGsQcwRF6Bd5ICLdrPq+jTXpQ82mu4rxj/ZuJWCWgsSVAmOatZ
         ukdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148541; x=1778753341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbtRJw+QEI5mtSKcpsiS8KnHqX7Lm7TwkaVuPue5Dlo=;
        b=ifxkVUjkYNy6bUGUCaVGTfRfIEw5aXMdgAC7k/DHyCWbW9U4ImtHxZLq3CWUgimFF0
         pMascjq/xATC3weUfVZsAnu0o6ZoXviYctfl69Tu6rjPet7BduaWZOLuoIxZbckjdZTY
         vYQmUo6Hm6ZDxl9HnCQn7WllH03dR/pBQ8pP1ZU5BXhz18PYm997DBTEiYBYPOFKz3bN
         uzJVBv6iqayGlp78RXY6jKaWksWSNDpsomBhE9qkWSz0Jr7xd7hRgVr46soZJJPcIJ/J
         NcayrZKcqMNRFRoeHeFWHFb7yQTJyaYjo5UnPf09dqXdYaZELIdLcu5N2uSTAF2nHg6m
         lvdg==
X-Forwarded-Encrypted: i=1; AFNElJ8u1nmju0ElaHPDmfFVLhs+Dr/hOvlY70cKF78rf++MlL/ADqLXtLQgn1o53aO95HbiKLjteISNay0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyfek841ZGDzMYfMvhg0ANAiLH86zjshSXdz6zBAxnSyB8YXD+I
	7c4C448cTKofdAwgd43X6q4OrbQqxZQJoD4onHiwy8MR9Pd83FF+Cjj2995UfkZbGA==
X-Gm-Gg: AeBDieto+f+wyIHGeA6EgG2WHZVwMYEHHE1CQqLfpDacmpkj9bxp7V1QqqiPhbQUwxo
	xCxZQMz+Bi0DQ7jN9S3BCOq65G+DPzDWqjQ9X46h2EZEWKDY5NrFG/WN9amxnYosDtJuBymUFmg
	TAZbNLIm0BIWHw4u6BduDch31F/pjzzg+zX21fBEB9Pp9S6F9YlLWjpzqgaWVNsHaDzYKXcdHpe
	2oXTFlBZlEa2qy5VBKf9qXwgc7dOTAq3Ibg6W5oO+zNZkHt1Rvu8E5ExdaEqYUxkoMM6og2JDLx
	N0g7xh5zjxk5sJTIQ4e12JRbxz+/+h8SrUXfYJz/WZI+YIGzjqKgXfriQEqMDV+wJYs1OHHx3Zr
	TTJ8ahxGQxbglP9TrLeLyb4vzkQ/Q8bu06TDYs21gfYnRgPEit9G4E/utVXushvPsP6J4Y7o+HW
	dhXnFI6qNi3UZuObmmEb/GpjC38IgkRH1NN4rCkhWtBQsVrfZAT7SKZQrQJM3DQdq/TGRIl99Ia
	rg2rmuXyEXBsO71yTrn4XwIB44vlTvY
X-Received: by 2002:a05:600c:3b17:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48e51e1a870mr117954375e9.8.1778148541463;
        Thu, 07 May 2026 03:09:01 -0700 (PDT)
Message-ID: <cc93dd58-7501-4610-bd1f-9f2c403baa9f@suse.com>
Date: Thu, 7 May 2026 12:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix MMIO alignment check in imsic_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260507093155.105950-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20260507093155.105950-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1778148542-7397E8B7-A98FF364/10/73395122804
X-purgate-type: spam
X-purgate-size: 521
X-Rspamd-Queue-Id: 664C34E680F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 11:31, Oleksii Kurochko wrote:
> The MMIO alignment check in imsic_init() incorrectly uses cpu as
> the index into mmios[]. The loop index should be used instead.
> Otherwise, the alignment check may be performed on the wrong MMIO
> address.
> 
> Fix the index used in the alignment check and corresponding printk.
> 
> Fixes: c9bd8b322ecbb ("xen/riscv: imsic_init() implementation")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



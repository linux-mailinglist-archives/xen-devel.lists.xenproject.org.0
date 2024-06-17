Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F090AAA8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 12:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742087.1148800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ9DC-0003Ii-1U; Mon, 17 Jun 2024 10:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742087.1148800; Mon, 17 Jun 2024 10:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ9DB-0003GZ-UR; Mon, 17 Jun 2024 10:03:41 +0000
Received: by outflank-mailman (input) for mailman id 742087;
 Mon, 17 Jun 2024 10:03:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJ9D9-0002z7-OO
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 10:03:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddca29e7-2c90-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 12:03:38 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so519669366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 03:03:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f42ddfsm504024966b.171.2024.06.17.03.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 03:03:37 -0700 (PDT)
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
X-Inumbo-ID: ddca29e7-2c90-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718618617; x=1719223417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nSMDGcOXBS91cZZPSxa6N5d2Ejw8Vm3ipq+/3jGSiY4=;
        b=F2b8ZMysvaVMd+mGfzY8wFEpMbgHq69leJEJNV1YpRaoDzhzhD2f5jUMKFmg+LtIRY
         4ersN3mEyd8yLTYegjkGk6hGzAfGe2yJHpe9xyDiQpaeE+Y4c0C0q1dkYVgkxiySVXkN
         Cj6wHZ7CJP1vw71/7uPlkNrIzyLc28y4l95CWJpCI5f5AEhaNAifSKk92tlXe2CtaAAS
         kNfebTk0wUVyDR6q3b+c7wX2U2Txgf0TXIKjW2Kkcyk0YWsRIUgAeB8ecaKD44nPSwHw
         XiLAsLyTCZlrzIOE6g/MN4R5mhpy65NoE1oW4gTra29I2N+Yj3GmBByICBs2x0v2663B
         GS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618617; x=1719223417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSMDGcOXBS91cZZPSxa6N5d2Ejw8Vm3ipq+/3jGSiY4=;
        b=jo0UzEZkCteFgiCetskkBvZ1hxD4BaCFA8qKB13cDgpuTHZbz21gUhtboQaeFK3cve
         MFvHen9uvRqzvP52w27ivp8dP88Pk9qAN3RnQMqY4jxMTzzbxFoILiKF/327TO/lj+i4
         +0ix6xa5zFuo0bCG193POtmSLcX2aw20i6BqZAL1XFnzazlF4hYzZauhRfnpmUFU51xg
         VcaNgQQCP9NsHu/1ThsrUaip8NApXCSgKI65V5Nt39F9ntmj1mNZ94xCvTK5fZbIDDgf
         pK1dwCKxW8anSZWy/PpAQar+REBli3hbGuMi3Uh5YQs8dgmdpyq6EcA1uZHIi4Mx4m7x
         TZEg==
X-Forwarded-Encrypted: i=1; AJvYcCWVYHLy1RCEAxhf9e6cNTT+gmY6s3wgCqf3qL/mKVJehZNROI0b4GnS9URP03atAVGJ2IYidi+marjtXcwXb2zpoidGMY5vFOwLOQe4TC8=
X-Gm-Message-State: AOJu0Ywc0EUPEYTz6XPLENuj59q9fCrPsLlg7xxixY3JikWgp2YhvyED
	bf8C29/M1MN0bofInoBs2pOYyD8TECcyGuZ80rDdlWYRvuHftm54wKVAWruGeg==
X-Google-Smtp-Source: AGHT+IEZSkyFbOsWkPvyzLY/9hXwOgu70r6KcgOnVUoASsxro+kK7R4gjX+m+Gb+5w7N7E66DHPeRw==
X-Received: by 2002:a17:906:dfe9:b0:a6f:4de6:79f with SMTP id a640c23a62f3a-a6f60d45630mr580378066b.40.1718618617335;
        Mon, 17 Jun 2024 03:03:37 -0700 (PDT)
Message-ID: <058a6cc6-bf84-4140-a3fb-12ec648536b0@suse.com>
Date: Mon, 17 Jun 2024 12:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: add explicit comment to identify notifier
 patterns
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <96a1b98d7831154c58d39b85071b9670de94aed0.1718617636.git.federico.serafini@bugseng.com>
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
In-Reply-To: <96a1b98d7831154c58d39b85071b9670de94aed0.1718617636.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 11:49, Federico Serafini wrote:
> MISRA C Rule 16.4 states that every `switch' statement shall have a
> `default' label" and a statement or a comment prior to the
> terminating break statement.
> 
> This patch addresses some violations of the rule related to the
> "notifier pattern": a frequently-used pattern whereby only a few values
> are handled by the switch statement and nothing should be done for
> others (nothing to do in the default case).
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

I guess I shouldn't outright NAK this, but I certainly won't ack it. This
is precisely the purely mechanical change that in earlier discussions some
(including me) have indicated isn't going to help safety. However, if
others want to ack something purely mechanical like this, then my minimal
requirement would be that somewhere it is spelled out what falls under

> ---
>  xen/arch/arm/cpuerrata.c            | 1 +
>  xen/arch/arm/gic.c                  | 1 +
>  xen/arch/arm/irq.c                  | 4 ++++

giv-v3-lpi.c has a similar instance, yet you don't adjust that. This may
be because that possibly is the one where it was previously indicated that
it may in fact be a mistake that the dying/dead case isn't handled, but
then at the very least I'd have expected that you explicitly mention cases
where the adjustment is (deliberately) not made.

Jan


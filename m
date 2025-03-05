Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F2EA5019B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902344.1310294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppYn-00039D-HZ; Wed, 05 Mar 2025 14:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902344.1310294; Wed, 05 Mar 2025 14:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppYn-000370-Dr; Wed, 05 Mar 2025 14:17:21 +0000
Received: by outflank-mailman (input) for mailman id 902344;
 Wed, 05 Mar 2025 14:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tppYm-00036u-5D
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:17:20 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8934201d-f9cc-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 15:17:14 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bcad638efso14272145e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:17:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39123deda7asm1427727f8f.77.2025.03.05.06.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:17:13 -0800 (PST)
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
X-Inumbo-ID: 8934201d-f9cc-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741184234; x=1741789034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v9l2j/mqu/NnnMgHbOB063ysco/0wxFxFm3Teev+Ai4=;
        b=A7l61gcxe6qhGAugEbIdvvPMUlDUgGo7Zxs/lVImpZDv0GugKWT/CSMohH3FMjbqAk
         UunrgADkS0gxS1tx/aLPsxPYSNifwyQwg5csWMc03UuoIKuaE9Y8RciTkGXSNqHv/WRa
         NqB1YU8DLjuhnN6bWeg5r6J7+85pBbaJxl1n/ZMkTbWmOXjaO6iBurODdCu2O5voD1ar
         cave/Q+t/lzc1jP3n1KmjsJX8+tAGhV4LzzsHEuC96w7csuesvwvIp3Lzaa5Eb0lGt0D
         IvkJpf1XULqSLoKeS3qWFqy3L65SQQgWNV3v+2Bf9pYiwUG8y0IGVYdzJxaSN5p3bcPY
         7Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184234; x=1741789034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9l2j/mqu/NnnMgHbOB063ysco/0wxFxFm3Teev+Ai4=;
        b=gcJBX3npI/3HFyzhyJ4JvYcPfuzFvEURudOWKGBT4AZoTmvV1JtAK4vMlBirneEGJ7
         h1ZIo9v/UxkyKtim8wl9QBUSmsAoCZ5rlT1ejsmtM74leVKrzeQg8QilnAzAvYObLXK/
         9kyEI9p51cr5kj8ZddObcVCi4dphXYX4LRFSqHLOwTLl0lB0rmZ1Fl0cnd6elE+ZWlK3
         U3dCgt05sLB29E9KhvHkGyVuiOI8mqxN3l0Axe36q1Q4r39d6hlkQMCZS1NSnP+GhEcV
         Ubsc9R75u1aTUQM0l3ak6ENnpzoEAbBUaLoBxm7leYHw2gGt/f4ITdiiGkfrHKloRfCs
         cZkw==
X-Forwarded-Encrypted: i=1; AJvYcCV5/PE/+I0nBltOZ/FOL33W4bDRJhurp9uV6wpERyhJp6xk5w3cQpGBmdmZHNa6Srvd81LTQFKMXNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTqXGs2L4JlnhAgbVlJ6miZo4DIG7cK1mauGOdA2294w4E8jD8
	TNE+A+ZzKqPEZf0WHJeuGdet6mosVkvS6HQafRh90XAWcPt1DhCxEG+xTXNrlQ==
X-Gm-Gg: ASbGncunCUFTvZr9FfEooxavUWYoSiGnThXYzVoZLQLjt7F4pJwS2DYmxlS/tcOEbkT
	8Vf9AwW4AR0+uhEdb+EUYJOhhIX3JBdqAPuhGxKxosFaE1th3KyT7/Jy7lSrg/RMwN78t5RV0NO
	ENvZkElwUOxR3eyuSxOxYb0OBL3FAcWT/RejR7BRletkvPkodp/l2zNBHivFavay+osyT17UEgL
	KUfMu7tZKL1Cb/yjDj2NAfs1y/Vrj68WUx47JwV7E0RhNUbeX2BaENvKpNgjm6tk5Y4xiwSRXIC
	5ngahQrstTZv7wVOIWVEXZsutgw/bvuBx2VX5XNARnd/EYjQ9xbKWG2mnfAHEck9zkFohRhqlpQ
	Vq5ORpf0u47FK27lY0ItmiS/T37A59w==
X-Google-Smtp-Source: AGHT+IF+RkBSdwGIL4v0Q56Ej31C1TM7EYLlmaMHVoE5vbUmmN55JO1ZUaSoo8ay4EJ2w3k0EWKrFQ==
X-Received: by 2002:a05:600c:444c:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-43bd29c6a29mr28681255e9.11.1741184233790;
        Wed, 05 Mar 2025 06:17:13 -0800 (PST)
Message-ID: <fc6c0113-484d-4eb5-8b66-0ef547d8dbf1@suse.com>
Date: Wed, 5 Mar 2025 15:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/rt: address violation of MISRA C Rule 8.2
To: sstabellini@kernel.org
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1740476096.git.nicola.vetrini@bugseng.com>
 <e3c6457e50d61daa05fd9c3a7c71b06d912216a0.1740476096.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <e3c6457e50d61daa05fd9c3a7c71b06d912216a0.1740476096.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 10:38, Nicola Vetrini wrote:
> Rule 8.2 states: "Function types shall be in prototype form with
> named parameters".
> 
> The parameter name is missing from the function pointer type
> that constitutes the first parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
> Changes in v2:
> - renamed function parameter name to "elem"
> - changed prefix to xen/rt since only that scheduler is touched

Looks like you committed v1 of this, and without a maintainer ack?

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74098405A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802446.1212673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0pc-00073i-Rd; Tue, 24 Sep 2024 08:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802446.1212673; Tue, 24 Sep 2024 08:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0pc-00072B-Oc; Tue, 24 Sep 2024 08:23:36 +0000
Received: by outflank-mailman (input) for mailman id 802446;
 Tue, 24 Sep 2024 08:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st0pb-000725-Jx
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:23:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a5304a9-7a4e-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 10:23:34 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso11973053a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 01:23:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cad24sm54503966b.108.2024.09.24.01.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 01:23:33 -0700 (PDT)
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
X-Inumbo-ID: 4a5304a9-7a4e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727166214; x=1727771014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bA3p5pA8UJNxJY42KwktPk2riKwnADRASTvqy/5qWZM=;
        b=b5VdJFqJwKLhv8d/YaSobeMpTMHJ6ccTCabTGQTiewNHvSI13SWtXpYx77ugKEQIRZ
         ZVoeQWO40ifAaGX+lMGoZVY1+8UYuBZOTLp7FL+JkESP9tnqEv1+rZF+KNrloJxT+pt2
         dVeifOU6pXvGPuoqPUoB8joVi457R0Bu95iso/oVLR16Dc3o6f8xrdmW3vd6TqepBNCT
         VJUgegZlypX+fezh25QJQwHBHWzpYIIC833PVj3LKAJyZUG591RFRjX242lckhda5tqL
         PSAN5KfnCsBbENngg5SXj1MebpYy3Em2VfRbqP2Twrvmqt4GwmjwWD6LyFrM9Ynn8/JI
         sjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727166214; x=1727771014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA3p5pA8UJNxJY42KwktPk2riKwnADRASTvqy/5qWZM=;
        b=l/ymBR8sOro5ntcO9ZGNM5cdUyUcrtIeT9nWViI4H0bSH6AhvwzC6N0uJ1ep0Psr3b
         +FFtfKrlADTBKjafGKNEld1gW98GY+gf3fb/7IXpxgDowOMEdMthCk4qnnnWeIOWNqDr
         DPg3YspxiH7/kiYZxDVmX0KM/Or5GunrnSTnbQ9Ag7Pp0wBpNz47ouF5W4TN4r/CDVRq
         JHVrLb9Nt9lx1HQTiu86IT4OL1cQs8DdjhdinfzLiSZ+1v8P//462vhLtzDwVg7+LpoX
         5AJHw+/8PhLtJCbJXaV48hIYNzH1mIM2LLMLMiQbjNNZdbMZLdaB8vhoRhIYKGq8eddI
         WQMg==
X-Forwarded-Encrypted: i=1; AJvYcCV12czCjPIHReSdmf23lBQGKawE+4glUl1bYOgUa+yPVA3xSxyHWCscGnj9muVxlR7GkP8OF3zMAfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOKGTjsHBS8LQKACjfUZ/4vjw0nbC2gIds0wkhWodb0b/T70kc
	vx+3WzjP2sDiIhy+Tu15UWUxnmBONzV9JU9c8MVP9DxcnQtIauzCctSRJTw8Jj6fkZ7rmVqeD2A
	=
X-Google-Smtp-Source: AGHT+IGSc1U83kFEudb3cyeZpgdZ33gCi/bSu+W8xS6XH965AgYI7Q9pThGKnuzd+zM1VEbESF9law==
X-Received: by 2002:a17:907:7e98:b0:a8d:2fdb:b449 with SMTP id a640c23a62f3a-a92c4856102mr221029766b.16.1727166214079;
        Tue, 24 Sep 2024 01:23:34 -0700 (PDT)
Message-ID: <ae7a87c6-8388-4c83-b35b-ddf74065c727@suse.com>
Date: Tue, 24 Sep 2024 10:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeature: Reposition cpu_has_{lfence_dispatch,nscb}
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240923171517.125089-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240923171517.125089-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2024 19:15, Andrew Cooper wrote:
> LFENCE_DISPATCH used to be a synthetic feature, but was given a real CPUID bit
> by AMD.  The define wasn't moved when this was changed.
> 
> NSCB has always been a real CPUID bit, and was misplaced when introduced in
> the synthetic block alongside LFENCE_DISPATCH.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




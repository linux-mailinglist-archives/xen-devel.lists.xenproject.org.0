Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26891611D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747430.1154832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1Vx-0007TK-23; Tue, 25 Jun 2024 08:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747430.1154832; Tue, 25 Jun 2024 08:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1Vw-0007Rn-VJ; Tue, 25 Jun 2024 08:26:56 +0000
Received: by outflank-mailman (input) for mailman id 747430;
 Tue, 25 Jun 2024 08:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM1Vv-0007Rh-BB
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:26:55 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adb34fe1-32cc-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 10:26:54 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso55044461fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:26:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7066aeeaa5asm5426274b3a.29.2024.06.25.01.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 01:26:53 -0700 (PDT)
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
X-Inumbo-ID: adb34fe1-32cc-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719304013; x=1719908813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wK8t7berKrAIWDrZKMUCIeRP677TszPve5OZDAogxCw=;
        b=INx1ODyLI/Ec6NrV4u/I5G0TgVZQiCOiNYBosxNyDuhe28bSEGOnNxDIddTV0i+GYb
         jpqwxxN785acV4mDDP51cmE8f5mRa7C9+kMtN2aI3xDBDqTMM6dBT9XD0I8djegzZ7pK
         ryc1vb577pwZsj5Afc1uLkT2v3hA/ZnCMC/BfUKct4bq8M1d1rDvyGRJHdGuatT3aobc
         nclENjPckyIABGulOBhKHjI+rvaz2a7eT6vAmZenD+1v/rIQKUFPOxNLMAPvRgMa7rBA
         0aieBzY9zlDE2/ZxcXhcNweDutQVYyTq1rl1Jg0cTUle50mnzNSfU3Ew94BVAOQeaRvj
         jcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304013; x=1719908813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK8t7berKrAIWDrZKMUCIeRP677TszPve5OZDAogxCw=;
        b=a2toIsq00ct47GOPh0/Jy4hW/purqn+pXf6Hxnrz6RdXKNlgbmjpfHFGleiPu8caPU
         MVaU3/J3vAXUojDpkLht3FnxpvopU82sh6Flj0HbNCtJcJuwkUm+X17WOf4fsYHa8mce
         BtJdTn5/mRpXjpu/Gxob0SHWnzM6qwsfanvbGS/T8Ku5j5t8Sr5fL7PeH34V2I8tnJrj
         o8I+jtqTye/K39UTgffexX87w4JUAFSSj8tgBkGUOXU8e0ei/5BofizflE+ERGvRWIDt
         r2H4n1LVNQLd7zEEIs7i+rzEABv8MLLV+QLrRGLHx+wKAPsYFclewGtwesLkmU249+SV
         buzg==
X-Forwarded-Encrypted: i=1; AJvYcCVOh5ODQr47t2lS6Ov6scvz44gMNDbRijpnXgCuqszd5t5pm/vdukDh07vmEU8vvWzr+3DAHOzm69w2wmV2pFu/iqLj1tQF+40c77UiQwc=
X-Gm-Message-State: AOJu0Yymas14rMFScUJw0lWS6ziEI9jDyOpvucNy+l44e4yuJssXcYSI
	WjnTwcMk7ZoYXPYoYLC/KqY2qrj22hh43WCy7HUd5BAsbXAIp/c4BJ/io3sIHg==
X-Google-Smtp-Source: AGHT+IFBSA3UNSm5+ik7FwRzhYhX3Iq7bLfrqlQtnPKgZPkSkIGPRNaWY/SxoiqdJAS7fI6+Wg9vZQ==
X-Received: by 2002:a2e:8792:0:b0:2ec:4eca:748b with SMTP id 38308e7fff4ca-2ec5b2a011dmr37985311fa.14.1719304013586;
        Tue, 25 Jun 2024 01:26:53 -0700 (PDT)
Message-ID: <c0519803-8753-4933-8193-fa036f626b36@suse.com>
Date: Tue, 25 Jun 2024 10:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] Config.mk: update MiniOS commit
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
 <52373e0cea119ff04ebb997f3d0aea6bd3c9dc41.camel@gmail.com>
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
In-Reply-To: <52373e0cea119ff04ebb997f3d0aea6bd3c9dc41.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 10:10, Oleksii wrote:
> On Tue, 2024-06-25 at 09:57 +0200, Jan Beulich wrote:
>> Pull in the gcc14 build fix there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Probably nice to reference a gcc14-clean MiniOS tree from what is
>> going
>> to be 4.19.
> I would like to ask what do you mean by gcc14-clean here?

Being able to build successfully with (recently released) gcc14, out of
the box.

Jan


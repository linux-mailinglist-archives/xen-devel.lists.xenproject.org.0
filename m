Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENH5M5kycmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:22:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814767DD2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211155.1522682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZR-0006cF-6H; Thu, 22 Jan 2026 14:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211155.1522682; Thu, 22 Jan 2026 14:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivZR-0006Ze-0z; Thu, 22 Jan 2026 14:22:01 +0000
Received: by outflank-mailman (input) for mailman id 1211155;
 Thu, 22 Jan 2026 14:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vivZP-0006ZC-30
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:21:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b50f3f7b-f79d-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 15:21:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47eddddcdcfso6118685e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 06:21:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804704b712sm68649175e9.8.2026.01.22.06.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 06:21:55 -0800 (PST)
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
X-Inumbo-ID: b50f3f7b-f79d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769091716; x=1769696516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KWBtxKj07s4HLwGJTh9AK3keI4THEAKode/ZcAbQeyE=;
        b=QprBXNybt+jmnR21NTXQH2PYEQBk5EoeU+CGc5pJ544DoF5ek9ISjEjw2y4MhUpfxr
         DlcgQZUg0YLhNntYEjWSw1NmMc4+vcBAger0362/tte5w2jmW7/VxTGwNsB6ZsseJ1i2
         0ILMAcNjipHHQqb4OoU9wM2EYFc7n0fi+Pe5Yqgy4nxYO4/brIzHbV5r8f+QvEJyRdCu
         2pur9uYyZi8ZU7qL+EJrHJNl3xaZEBufdnk3j7JfhMUYsJdUmcSgQTQInvmGlDk7/rVK
         mbJi3tgQhZxZTk5PAlH3EEK8uOy2jHhjnnEoZtB1kq8TV3ZnUUyMKlZiqbk7wLsCVQ7A
         YYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769091716; x=1769696516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWBtxKj07s4HLwGJTh9AK3keI4THEAKode/ZcAbQeyE=;
        b=q/O1HJMlOTUJzOCOQ0AI+JS3/PLHcdYzNX5TIdMBxz5U1IHsPtVKL9DR31J4Fr/ekK
         SyF8ReCyG1ObDJzpIBDR0OqxesqtpmaBKODtXv7AML+0VIRQ9GR9CQ5GfKQET67e2TDk
         UtlK+rA7Nds3+ozNf0zd6MPzJ5OG7mLOLVauP0/GXNmGrmSh1aEqUhAMRPALU9YBaxOI
         +XbyxW1OLKwB7cxJUD8ugAnOj5ICTsF3ZvqDR2NLLBVF+MgHgw7N0LZSab0f237oOIl5
         keAw+0WmD8KAKt4sX92EuWVbGwinJibezQW9986isSQeHphWYf4SSvillgpR5MyDJg9+
         VKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtP4u//IsY8j2RluJmsm37HK1bDumufdYTJkefKlncxanfwGLawF+3fTllbWUyeE0wApLIuvgX3iA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDZErms5Il2Bm2EdcVvCuBJ02YC8ZKjE+AMM+O0k+DV8T++V7p
	2eAusGk3JJU95lBymwJXQqRst4jfSj4Tqmk6THNgNuO+ybUgjFfSGh6nIYhvod4/VA==
X-Gm-Gg: AZuq6aKv8/yvMVhTwX/QNwPWFXEoYMXHw3lzH5fcORqaDamIkjQN810AjFgcrCprDpf
	ikFw880Rms6bb4E9nBzthnE5JgZQNTsAaB+bhubrim72Se6+f8hcX+Dy5z5VhFxGKbEKWF8rwx/
	P1NFFeyq0H2tdXOWxZ9vbIL2cfXGBQKuMWv7ogMrijKEohLewbS67vPXlXOcl91l0aIOStpTBvC
	yP1U5AHlBQQ49Yh+it3j44c5TrdBy1uxAd5KeFqsHg7O5LeSEta3SBUHhEcwR5o9OHQkjYzfU24
	U6aKtery74eFj8PCeq4LfTUkn5fgV312MEy+s0S39uHBI/z0T0K/X2S72kBZ+rXo4qjoElCigRA
	dylwIILCa7ixw7BrhvptuUAYF6uHx6pSOL43q0nR35sx5FrgxxpwUzEzwARQ4krQkaRABMziPJ8
	Vb2XyGEUgCuU9LaHTNrA+5ltI/QYI9taYWLbscJXLaQWt3annP9Ta1ir4GkNDG0FS0ThbsXLItc
	/PPSKugKGKRqg==
X-Received: by 2002:a05:600c:1552:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-4801eb0e021mr302727105e9.27.1769091716256;
        Thu, 22 Jan 2026 06:21:56 -0800 (PST)
Message-ID: <60e77689-7fed-432d-ab8d-621690e6a323@suse.com>
Date: Thu, 22 Jan 2026 15:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mcelog: simplify MCE_GETCLEAR_FLAGS using xchg()
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260122141754.116129-1-ubizjak@gmail.com>
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
In-Reply-To: <20260122141754.116129-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ubizjak@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8814767DD2
X-Rspamd-Action: no action

On 22.01.2026 15:17, Uros Bizjak wrote:
> The MCE_GETCLEAR_FLAGS ioctl retrieves xen_mcelog.flags while
> atomically clearing it. This was previously implemented using a
> cmpxchg() loop.
> 
> Replace the cmpxchg() loop with a single xchg(), which provides the
> same atomic get-and-clear semantics, avoids retry spinning under
> contention, and simplifies the code.
> 
> The code on x86_64 improves from:
> 
>     186:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx
>     18c:	89 d0                	mov    %edx,%eax
>     18e:	f0 0f b1 0d 00 00 00 	lock cmpxchg %ecx,0x0(%rip)
>     195:	00
>     196:	39 c2                	cmp    %eax,%edx
>     198:	75 ec                	jne    186 <...>
> 
> to just:
> 
>     186:	87 05 00 00 00 00    	xchg   %eax,0x0(%rip)
> 
> No functional change intended.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



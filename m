Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B36A286B6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882023.1292196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbrV-0004dV-EJ; Wed, 05 Feb 2025 09:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882023.1292196; Wed, 05 Feb 2025 09:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbrV-0004ay-Bh; Wed, 05 Feb 2025 09:38:25 +0000
Received: by outflank-mailman (input) for mailman id 882023;
 Wed, 05 Feb 2025 09:38:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANbf=U4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tfbrU-0004as-82
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:38:24 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0552c49-e3a4-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 10:38:22 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38da88e6db0so831020f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 01:38:22 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38db0e2f479sm3061238f8f.57.2025.02.05.01.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:38:20 -0800 (PST)
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
X-Inumbo-ID: f0552c49-e3a4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738748301; x=1739353101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7c3hH/C0ty80foBKuB31iqczubI+r+OraZ1ZxIaqE7Y=;
        b=UjhMkkwySzbNwmnjwx+9I+MRhh7gXQVTNxZjtSweV1YIzLKyPb48KFftpPBBuEaYT0
         Wjlo3on39tRLg0Diy/5Frhv+BNbNpRcQbSSNo1Qb78fZkqUriFoVlHqZBIaYWX14lJWK
         /hUxVBiyY82sWgbDENL70uDvN/4Lbh6D8c57I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738748301; x=1739353101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c3hH/C0ty80foBKuB31iqczubI+r+OraZ1ZxIaqE7Y=;
        b=UMu2+53W5YS5he10J9WX8xogNKA7IbYwggywLY3bf8Z8mlHB/pC2owUMjm/Qf6ycZi
         ilPgrffdFtgegFfB0mBw4u4XIMbEyP9sm6cO7c+p9i+1KBJeCtSIp6LmFrjQYz9VMIxr
         XGmPnWs6Bs2tR8Q9sVabTBOkGf0jG27QEw7pgtR1dQZ2ylSZZWHB6NnlBmjFZAzuRYA5
         /UKq2tREKoRTdgPoU80+2eMKzRU6EY7e4lBnVpQf4LZfqgjdx84v6uwA12Bm1IP1f5o4
         awdHbrERGpCKXWNA6AXFEReAntgWCxYt0u/HCnM04PjqOiTIuZNBNainuUm7F+nTvl3X
         2/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN/FplUA7ZNLzi5PXGS21wg3fSqBIvLA+nqEKWBwQsWpQJfLMHVORe8FXsWcFh86wb2u+YBjW3YQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw15Yiti5lXSlHMbASew0cue6HzCPhOXOlmj5MPCWQpVNJpUQvr
	LaTGQT1yoz/ROJX9SRHmHoeoTiiloIVDDx9vxtsPAIevjYnT1LQ3X4Tq+kCW1hE=
X-Gm-Gg: ASbGnctp99upaz7NyTTMrd5+e/dn2EWkmHbug+2R9o6q+l/SLVWbVwlSJ0Qml/CxlDP
	yzymLwb1b0AytyYA/+qdMbTk8aFPmy+eOhZ2Taj3nxHfkwYzN8sUiorR8MBokhFD7zJY0WrrzPL
	W7LfYb/uOwjNJLOoO7uahDsuCpkS0OZZ4DV8xpwJlOByGpARG0GPU06R1zxOcOyYGT+AC6yv2T+
	WXly7zg2xGe9VZ6OY9XtMyAtDsjunDAC+a5hQUtIlsi6GCTwRh3iHXeFq3cvMcj1UfipL5EykCG
	cDZRH4RZALYAxEmrUsooa6TMAT9dC0Q4LB5Hn56mLp6A0NeESwC6L4c=
X-Google-Smtp-Source: AGHT+IGKiCTY7NdXJy7RVGHpio2VSFkQcy1N+pRmbgyKzcOOLI6LKDmi0Hp5/VBrGDDXcgZfdTMBvQ==
X-Received: by 2002:a5d:47cc:0:b0:38b:ece5:5fe3 with SMTP id ffacd0b85a97d-38db48a3fbdmr1234354f8f.1.1738748301323;
        Wed, 05 Feb 2025 01:38:21 -0800 (PST)
Message-ID: <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>
Date: Wed, 5 Feb 2025 09:38:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
 <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2025 9:17 am, Jürgen Groß wrote:
> On 05.02.25 10:16, Andrew Cooper wrote:
>> On 05/02/2025 9:10 am, Juergen Gross wrote:
>>> xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
>>> most only once during early boot, is clobbering %rbx. Depending on
>>> whether the caller relies on %rbx to be preserved across the call or
>>> not, this clobbering might result in an early crash of the system.
>>>
>>> This can be avoided by not modifying %rbx in xen_hypercall_hvm().
>>>
>>> Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   arch/x86/xen/xen-head.S | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
>>> index 9252652afe59..4378b817ed32 100644
>>> --- a/arch/x86/xen/xen-head.S
>>> +++ b/arch/x86/xen/xen-head.S
>>> @@ -117,8 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>>
>> The 32bit case, out of context up here, also clobbers %ebx.
>>
>> ~Andrew
>>
>>>       pop %ebx
>
> It does not, as this part of the context is showing.

Hmm, so it is, and worse, it can't be changed to match the 64bit side. 
That's nasty.

But while I'm here looking at the code, what's up with

#ifdef CONFIG_FRAME_POINTER
        pushq $0        /* Dummy push for stack alignment. */
#endif

?

That's covered by FRAME_{START,END} normally, and Linux's preferred
stack alignment is 8 not 16.

~Andrew


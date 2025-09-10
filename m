Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE8B517F4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 15:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118257.1464110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKut-0005l1-CK; Wed, 10 Sep 2025 13:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118257.1464110; Wed, 10 Sep 2025 13:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKut-0005i0-9P; Wed, 10 Sep 2025 13:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1118257;
 Wed, 10 Sep 2025 13:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwKur-0005hu-6o
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 13:31:17 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d2f3ba0-8e4a-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 15:31:16 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3df726ecff3so3603385f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 06:31:16 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7521ca22esm7509346f8f.18.2025.09.10.06.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:31:14 -0700 (PDT)
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
X-Inumbo-ID: 6d2f3ba0-8e4a-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757511075; x=1758115875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3MkGfz3VUq3hV2r7iXh77w3Mca/dAE9rQocE9HyDvFg=;
        b=exJBG9wVJvhOnxBrqS3gB84gCBd0Q4nVNWfodNsYbkw3oSoRBcXf0kdWYU45LU3UpJ
         eGQh4DJcGbIahYlzpfzjPiyHG4VOnbZ2+RSH+7mItw1ooY1SbNbjb/PseNd4rFhYsUjv
         bNhx4Uwi8a+SWwiNGbuhj9CNJdXAd0+UHmyEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511075; x=1758115875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MkGfz3VUq3hV2r7iXh77w3Mca/dAE9rQocE9HyDvFg=;
        b=U8vAFJrzPb+GG7eFqkg2MewouvUx87nIKKdjX8r0AYuvN8VcZ5YfHjOcO40CdwbS87
         7/xTkvlbXHAJO169NNgw17G6DobOmgDzu2xX57zTc+hCZRVkbovuGVbFDCFUf+QnHML9
         nWUL0yxyDwQHognC2AB5to7Q8gr2iSwOQTBhhS7+yphsqkB0D+oT4iCXQwgJF5D2TEwu
         uLOGOegSVCd/b+29kK5r2tvyLltkk9KWNbH9w7N+tBdYPc/Qn6WfVlKGhsAaKOfa0tcX
         m5vdyv6Oe2gKj2dn8yRQhrohxktgLGS/Jkut3kC/2xNwp/HBjqq6iTwfMFrjQYIlH1ek
         qfxA==
X-Forwarded-Encrypted: i=1; AJvYcCWQoL+s9hFj+RdkOYbuzLea8T/CRo5pNKiULFsi6jbwjnCmSTh2hg5/Ho+uoVBFH0LRPbV0dIp5At0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEEt6k3BfWqQPLaH5Lw5R3FN9wWNNe7bbSAhOsQzQ4mGwQQciZ
	GthHdevBNUi0f2oebMn1mQe2DVJMptfgZ4EFvzhXnUIk9f8Aknqd8dmmI2haabKrpe8=
X-Gm-Gg: ASbGncv6HZ/f9nQqHgu5eWeNO7Gia0I1VUHCg+w+TiIWplz49+l5Ih60kCg8tKwFhS7
	J1nMTsKPARfCwi76PUSBbaXpHWFWa+1K4TioOs3thKGt29qhDriX5M0xtgP8nwOQkzbhoZQC7Pt
	Wpowmeux5TYD7+cQzyI+DKaGek0PagRLpe964rTAGJ4AOalaGgtctAJ1TZKgMz34FRobaW5lSQO
	YAWym9P4kE/BmpurUkZTRTHhuqx8wpLI1zFIuUZDWETnMEl8+ehZYmrLPB7B47JwUcDP96tqepK
	7XmR6VyKH0HXSLf1rwdMwO64qCyjXLX0yAPKYgh6/DpOOBOOxkPjecSNY3aJsb4wN83cYaZErGb
	0BjJiBFCHODadN4S9FxjU4Mx3v3yfQr5B8n4SwpqbqpTE7jKTaZPKJDQ1ff1KEFeYSP35
X-Google-Smtp-Source: AGHT+IETzShO/bkLQIEEBmlENUpxbqlf3kZMYCjRdhPOSyGuCiy/UYsCGFCFoO0oZlp+cnHoaknRUw==
X-Received: by 2002:a05:6000:26d2:b0:3df:b9e7:35ba with SMTP id ffacd0b85a97d-3e6440f0674mr12375342f8f.57.1757511075270;
        Wed, 10 Sep 2025 06:31:15 -0700 (PDT)
Message-ID: <cfe16ba2-2940-4a64-bf80-97cb66e84f92@citrix.com>
Date: Wed, 10 Sep 2025 14:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/IO-APIC: drop io_apic_get_unique_id()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
 <80c035e0-54f6-4632-a5c2-a10d2c1c8422@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <80c035e0-54f6-4632-a5c2-a10d2c1c8422@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2025 8:56 am, Jan Beulich wrote:
> Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
> said, the function is dead logic as well: All 64-bit capable Intel systems
> have (at least) xAPIC (if not x2APIC).
>
> Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
> code; we didn't accept that yet, but - where possible - we probably would
> better follow it). Depending on one's reading, this code may actually be a
> violation of rule 2.1 (unreachable), which we did accept:
>
> "Code is unreachable if, ..., there is no combination of program inputs
>  that can cause it to be executed."
>
> Otoh it's "only" __init code.
>
> As this removes the last user of APIC_XAPIC(), remove the macro as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Same feedback as with the previous patch, albeit about the middle 3
paragraphs.  Again with a strong preference for those to be removed,
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'd not even spotted that APIC_XAPIC() existed.  This being explicit
conformation of where XAPIC starts would have been helpful when doing
archaeology.


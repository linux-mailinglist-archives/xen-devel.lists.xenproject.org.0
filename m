Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BF6C0E6E7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 15:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151639.1482161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDOFY-0005Iv-JY; Mon, 27 Oct 2025 14:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151639.1482161; Mon, 27 Oct 2025 14:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDOFY-0005Gr-Gw; Mon, 27 Oct 2025 14:31:08 +0000
Received: by outflank-mailman (input) for mailman id 1151639;
 Mon, 27 Oct 2025 14:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4SB=5E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vDOFX-0005Gl-4E
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 14:31:07 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ee561e-b341-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 15:31:05 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so1008428466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 07:31:05 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85369675sm778799266b.28.2025.10.27.07.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:31:04 -0700 (PDT)
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
X-Inumbo-ID: 91ee561e-b341-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761575465; x=1762180265; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWsQYdmSEA3AYPPNF1u/HnsB2NQEgzlOOS+xrBhNF4A=;
        b=HT5PE04Nlll7rHhDI5yZz19ykikM6tQsxHr01RtfRrVLkdzv8XgVlutvt9Qml20jrZ
         AXYsQSkCb7PsjGqV4rdXU/gPEEvpHbVDUX9+4AmtrJXCRe7dDyXIOgxiXZqt6RRt8Nbx
         Kjp3Kt7qWyXWsCw73DO6JU+3lY2WQyMlXN3E0mqhm7uGPO46WtycSWjokTg9Y2Y52ejC
         YGaazENCppJliXnCYm6PVmSg8pVVJD7zYPw0NOh1Ams1iABaQH5Tzqvl9EjDlh0q7pu/
         SM9VX87H41RVgQVA2mcs7J+Dhs85azCNrP+ec0PoxiTsXPijK2ZIYrms8XxnENKTjsrW
         h40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761575465; x=1762180265;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWsQYdmSEA3AYPPNF1u/HnsB2NQEgzlOOS+xrBhNF4A=;
        b=qTUdO7jpK71R25K7cLWDJAbYnU94gqWdKzeuf3evzR9lp3b/J+vxiGCfB8V2V89Syn
         UZCImhuQk+xh1kY0ubBp6AwbEsHaCht5S977DZRd4eLWw3/ZmJcEo2WjnsJur4pxKmeT
         CEmuUQfitnDxAIgWcZszh3biSq/6L3TVwC6qM8ILMlSx8mQGrKxgihSvBra7KHNsQlv4
         wptjVo6Bc3JkDAAoRL+rU/7GJc+IuEbTI0Yyj/N5PzrDTglFftoY6XuZ1+8rjWwYddhd
         Mywf03RE6y8CsuRHTqgLPzIR1SaTkgLasQcpzWVdv/E/jKhtErsgPcZKzOIwSOmUmfyw
         9V3Q==
X-Gm-Message-State: AOJu0YyctRsza6bFNZtLVY+8I43QbdkpZbWqweTfNiLM75O5ji8RxpO7
	cbfkXMbEU3NeUPV4Iz7mncW86gV6C8JTtFbLWknhJc1FVPun4B5qB+BO
X-Gm-Gg: ASbGncvWCBChk3P0LIn6CML8y2e5kT08f7P8NlyamilflGpU65m8SIscm3Zx77lx+XA
	Wlz+DxD6VBP1ih4yN8xrgZGnpYg/eFV1kFUIVKS4k6224f1YbJkJkKevbZMk0erqKsdBfqaYTsZ
	QFl16iwrz3IcyToKII7FgcincGikIomyvqyGS+9Fzf+xxeZqlS/j3yD9q3ZtMy6eiERiuH1JqU/
	ZisTseL5nbyc3Sh7WSPdyHn1Vd7Chwb+Q88HYZqjHRmwQ4AnYuslFUQdtR/1MWSSiMw6RKm75+6
	lu/a+06p3TfNE2hQPWIUfkMmvU5c/wYHSu0IjtZYOYBPrizzscbXZadtazjxCY6WxYehZQ3euCH
	mCOZnqI3RvLo6DmbsxbtSn6OR3s3qxAYwJu5dl6PBBwDl4+HB1B5Qoms5qhgE0P9y/5zpi1W7nZ
	55yC/+b7yVWkKuSFsU547xmMRYnRAAkzAJ1upifIvLNyWupzcaBhS5CSaN7FxR
X-Google-Smtp-Source: AGHT+IGqzEU8NfhfhawBx9/p4FVKFX3kG51rKMutNy1tpwEf0DRYXtjw9R2yDzefiW/BDTB2MPgo+Q==
X-Received: by 2002:a17:907:3c89:b0:b04:32ff:5d3a with SMTP id a640c23a62f3a-b6dba1d92fbmr17752766b.0.1761575464382;
        Mon, 27 Oct 2025 07:31:04 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------IcZUoRiqwiT8kiWUm8eoTfFW"
Message-ID: <90670a5b-49e9-4463-9169-f1f4ac6028d5@gmail.com>
Date: Mon, 27 Oct 2025 15:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: randconfig fixes
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2510231051270.495094@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2510231051270.495094@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------IcZUoRiqwiT8kiWUm8eoTfFW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Stefano,


On 10/23/25 7:51 PM, Stefano Stabellini wrote:
> Hi Oleksii,
>
> The two patches solved the problem and survived 1000 iterations on
> gitlab. They are reviewed and acked.

Good to hear that the solution has been found, so ...

>
> Can I go ahead and commit them to staging so that they will be in RC3?

... lets go with this solution:

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks!

~ Oleksii

> On Wed, 22 Oct 2025, Stefano Stabellini wrote:
>> Hi all,
>>
>> I tested the two fixes together for 1000 randconfig build tests here:
>> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2114931367
>>
>> And also locally on my workstation for a full day successfully.
>>
>>
>> Jan Beulich (1):
>>        x86/mm: correct PG_log_dirty definition again
>>
>> Stefano Stabellini (1):
>>        xen: fix randconfig build problems after introducing SYSCTL
>>
>>   xen/arch/x86/hvm/Kconfig          | 1 +
>>   xen/arch/x86/include/asm/paging.h | 2 +-
>>   xen/common/Kconfig                | 1 +
>>   xen/include/hypercall-defs.c      | 4 ++--
>>   4 files changed, 5 insertions(+), 3 deletions(-)
>>
--------------IcZUoRiqwiT8kiWUm8eoTfFW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Stefano,</pre>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/25 7:51 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2510231051270.495094@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">Hi Oleksii,

The two patches solved the problem and survived 1000 iterations on
gitlab. They are reviewed and acked.</pre>
    </blockquote>
    <pre>Good to hear that the solution has been found, so ...</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2510231051270.495094@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

Can I go ahead and commit them to staging so that they will be in RC3?</pre>
    </blockquote>
    <pre>... lets go with this solution:

Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks!

~ Oleksii</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2510231051270.495094@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">
On Wed, 22 Oct 2025, Stefano Stabellini wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi all,

I tested the two fixes together for 1000 randconfig build tests here:
<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2114931367">https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2114931367</a>

And also locally on my workstation for a full day successfully.


Jan Beulich (1):
      x86/mm: correct PG_log_dirty definition again

Stefano Stabellini (1):
      xen: fix randconfig build problems after introducing SYSCTL

 xen/arch/x86/hvm/Kconfig          | 1 +
 xen/arch/x86/include/asm/paging.h | 2 +-
 xen/common/Kconfig                | 1 +
 xen/include/hypercall-defs.c      | 4 ++--
 4 files changed, 5 insertions(+), 3 deletions(-)

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------IcZUoRiqwiT8kiWUm8eoTfFW--


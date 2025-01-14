Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852EA10514
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:12:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871162.1282203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeq9-0006yj-8N; Tue, 14 Jan 2025 11:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871162.1282203; Tue, 14 Jan 2025 11:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeq9-0006wm-4n; Tue, 14 Jan 2025 11:12:09 +0000
Received: by outflank-mailman (input) for mailman id 871162;
 Tue, 14 Jan 2025 11:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXeq7-0006wg-SY
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:12:07 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63861655-d268-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 12:12:06 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30615661f98so29568601fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:12:06 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0f749dsm17164511fa.59.2025.01.14.03.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:12:04 -0800 (PST)
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
X-Inumbo-ID: 63861655-d268-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736853125; x=1737457925; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJgVkffNfW5g6Y2STd8bV05bXLNIV0U2zEcDWhNpHxk=;
        b=NMlJt+7womNQcXmmfOyP2MApSLAmC5p2j1IJgthf6XOrEMGfCleAuGQV9HiCzG1fSV
         w45g6wqntDiOhzKwWiOddbrsJ9HOFcpkIrZp1Fl2EMxXaEcy8W8PDJgj8FckqCG4TNSk
         cPMWXBOF6+1Q8NQbCd+jVzNOyK1Ie7mOtxhzKV1a4e9qMLHIeAaa9eGYk84K06FawBTf
         qFayP2QeajVToNjlYVA4jnzm8HX/aRyyL6x3vKyjaLGNP9ARxXjGtRLpby+4LNj1WkOy
         9ZJe1oEvco4kNBN5EpErm9h/UmAGXdTSuOEHZzsI8VcaxVshq2xIsilW8tRkLLIUSetY
         TKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853125; x=1737457925;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJgVkffNfW5g6Y2STd8bV05bXLNIV0U2zEcDWhNpHxk=;
        b=p/MaPwY7MHRilyXWeyP6jXjx6sei6TFp+QfO/s9gRt1GOmTyLByHlg8Er/BbxK5h23
         InKR/cK5Ph41c9yG31BUljwRTuOKV6NzPB4jN7xx3MgLS0XYCAXdEwqjmXaUX24GWk5a
         0a1W4qVn/66u/VLyS727BJ6WWoBfsSNOjOSkSXRbgslF0sYa1Sm6tgtilCYTefnsud4k
         8+qGDxtL1N/JohSwSEPJ7ezxelgBpvN1dQ2+ile0y9hKus9SCwm5u8Swwx3NNYQ9xwCR
         laSHD46qEY0Mtd4UOKG6/z4qujVK3LJpVnOsMvDqhNigQjJvXUJB6nYui/jhz9jhhvSJ
         0BaA==
X-Gm-Message-State: AOJu0YyLg+CISX3KPXbaNJOfUgzSuAwmSkSEIzGpMR4IlIsnCmPf3OH9
	Qnm1EZK3iUM4UPJpFcyvs26CEJrhXf7L+oUGmu2hzzhFUJWoC8Su
X-Gm-Gg: ASbGncuWHFIXDLzLj4/H7MaBIzcAVkG5l1EzdrN8w9ZEcO0q5Cib+Wb+46R6WoYXGqt
	IrckLApsv3IoYzjVvMFbHPvlVoY+7LjgaAXdH6/MdGso8HV4+R16iOClpC1jJ4NhVxiUXGcOsSu
	MBxPUEedxWNx2HRHuw/SFup3c5DodHd9iMbGzkwgw5rhDsxDgjJxWDmCGKzvpXk6UydMVdupO4a
	1kltCe9oOh4tddiJCdfYxOS9dpunhArMv5zdyQZFAmFyteJznl5PwUp01v0TyTaquarjg==
X-Google-Smtp-Source: AGHT+IEu1ECxH5uvD64E2SASd0GS/CfaQ/EE3RE8jLmsD/VYsJ4Z3fRu5Agc895Ov92pXw4q4X1rbw==
X-Received: by 2002:a05:651c:2118:b0:302:1e65:f2a1 with SMTP id 38308e7fff4ca-305f4550c2bmr82313821fa.12.1736853125055;
        Tue, 14 Jan 2025 03:12:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Y37JJYZznLiPdWkkbGeIstdp"
Message-ID: <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>
Date: Tue, 14 Jan 2025 12:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com> <Z4U6WxtmaqGkqOqe@mail-itl>
 <Z4VS88REbzn5uasy@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z4VS88REbzn5uasy@macbook.local>

This is a multi-part message in MIME format.
--------------Y37JJYZznLiPdWkkbGeIstdp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/13/25 6:52 PM, Roger Pau Monné wrote:
> On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
>> On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
>>> Allow setting the used wallclock from the command line.  When the option is set
>>> to a value different than `auto` the probing is bypassed and the selected
>>> implementation is used (as long as it's available).
>>>
>>> The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
>>> supported built-in) or from UEFI firmware respectively.
>>>
>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>> Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
> Thanks for the review.
>
> Oleksii, can I get your opinion as Release Manager about whether this
> (and the following patch) would be suitable for committing to staging
> given the current release state?
>
> It's a workaround for broken EFI implementations that many downstreams
> carry on their patch queue.

Based on your commit message, I understand this as addressing a bug ( but not very critical
as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
reviewed and tested, we should consider including it in the current release.

IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
value over time. After that, we could consider making "auto" the default.
That said, I am not particularly strict about following this approach.

~ Oleksii


>
> Thanks, Roger.
--------------Y37JJYZznLiPdWkkbGeIstdp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/13/25 6:52 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z4VS88REbzn5uasy@macbook.local">
      <pre wrap="" class="moz-quote-pre">On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Allow setting the used wallclock from the command line.  When the option is set
to a value different than `auto` the probing is bypassed and the selected
implementation is used (as long as it's available).

The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
supported built-in) or from UEFI firmware respectively.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Reviewed-by: Marek Marczykowski-Górecki <a class="moz-txt-link-rfc2396E" href="mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisiblethingslab.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks for the review.

Oleksii, can I get your opinion as Release Manager about whether this
(and the following patch) would be suitable for committing to staging
given the current release state?

It's a workaround for broken EFI implementations that many downstreams
carry on their patch queue.</pre>
    </blockquote>
    <pre>Based on your commit message, I understand this as addressing a bug ( but not very critical
as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
reviewed and tested, we should consider including it in the current release.

IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
value over time. After that, we could consider making "auto" the default.
That said, I am not particularly strict about following this approach.</pre>
    <pre>
~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:Z4VS88REbzn5uasy@macbook.local">
      <pre wrap="" class="moz-quote-pre">

Thanks, Roger.
</pre>
    </blockquote>
  </body>
</html>

--------------Y37JJYZznLiPdWkkbGeIstdp--


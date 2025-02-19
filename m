Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A661A3BDE6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892788.1301737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkj2C-0004JZ-EW; Wed, 19 Feb 2025 12:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892788.1301737; Wed, 19 Feb 2025 12:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkj2C-0004Gp-BE; Wed, 19 Feb 2025 12:18:36 +0000
Received: by outflank-mailman (input) for mailman id 892788;
 Wed, 19 Feb 2025 12:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tkj2A-0004Gj-SX
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:18:34 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2bf9981-eebb-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:18:32 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-307c13298eeso9183651fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:18:32 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a2a9190f7sm11935841fa.19.2025.02.19.04.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:18:31 -0800 (PST)
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
X-Inumbo-ID: a2bf9981-eebb-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739967512; x=1740572312; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZYHZNIuMiGZBimogYDUy/x1TpiAlFEAHYichbKrBto=;
        b=Ts+g27iJE97Tirk2Z4gYie/4o1jDmL83Xc8cnb2aerKn6JAVa57+bZPK3gQnWesA4P
         CfeL5DYQPvcvPOLaw8b+3Iq9qHPYHwxr9Lym3dzsRhKJQXOack82N/c3TcOotWmM4vDO
         NDOgm2YahR/z1s6b+wHybSMOZScaSqZNHiXI+sHzSOX01KQi7P8TnZacgZADXDxpF78A
         jXu7iF1tge6cKUsw5CWPHezS61ZapxspYCmjf9Bq221A6ao1MgwAPLwggHaycyilCC+7
         AsuHRALoomVyB/rHccFebrl3ORpNyljgFaI3OcabX/VgDbFfrsFG6pE4f3wUQ8tWJOid
         3P9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739967512; x=1740572312;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZYHZNIuMiGZBimogYDUy/x1TpiAlFEAHYichbKrBto=;
        b=II/Qi4DREKf6EVFpgSet7hVqr6wc28cb0G3edZqEXIYmOpfeRKdjwsHqKglJjJ/bFZ
         OglQWAUbnCiIBvHPAJqQuOCVZAtEbWk4VYhb4g7PcOQF7ozAKuZ96wFKB20qHVGvMj+v
         xn5T6EoWKG4VgqAl5eGogv3njgVYTRzD079+GPJw1BU6B1dt5CwHVr4RkGtIAAGriSIy
         QBbr69Zzw8pvV4bSax/3JVoK5OZzLjzEu72LrfKR0i0vR2rDMs7QwCGmfPIrP9IiB4Zc
         qMLkk30gUJkcEyyTo6vXNlVQX33KaueJRXdjgYshTEAsaigISK6h+7G1dPJGtq4gqt8H
         gJ9A==
X-Gm-Message-State: AOJu0YxIp4mGRDcPpjVb4302A49+Aa69szQkwhLyGndp2o1Q0is9FNU1
	CJNxV6Deu9Z5DUvV0bUhvW+GKZP7W7Q3VmwpdiCMLLQ0Zn2pESlX
X-Gm-Gg: ASbGncsyXqqSQE3QzeSxfJzvM6m6oI1LFXcSaRnVq3xLlz9va0K4qC3sGQhCiwjVWLw
	VkyRUlcy4odCRqE7g3a1rUo6VjnLCM7o1Zsp59zbaCDwa6bQuGk7ISyITzrsHmczh3j/AwUFANc
	tZn5RuKxCTo3bwQv3JxJZiUd73+XF6ZlhX4FhWdAwq5sNEUvV5PeOfUrmKy3GK0QddlwvMZjmjv
	gyuDV0irfKkxYdSRVmjuRlTbDEiCbA6I6W32hyS5I0Q1WXOWUM1emRDYguLiIkjTq0e7Sg5F9Zx
	8eMBe18vaeG9pA8sTSHzigyX
X-Google-Smtp-Source: AGHT+IHxMs+FdALH9VCZeXbNXTaxWAC4l2VgyV2CjvlTfwJVTfeOMj928K43jni3qkHn5cWzdl+Ixw==
X-Received: by 2002:a2e:9d86:0:b0:308:e521:591 with SMTP id 38308e7fff4ca-30a4416eb33mr12865611fa.16.1739967511989;
        Wed, 19 Feb 2025 04:18:31 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------5dPbh438csLFhGuKnVNdvkI8"
Message-ID: <07314a75-bb49-4748-b3e4-3641799715ff@gmail.com>
Date: Wed, 19 Feb 2025 13:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/svm: Separate STI and VMRUN instructions in
 svm_asm_do_resume()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20250217161241.537168-1-andrew.cooper3@citrix.com>
 <20250218143739.623451-1-andrew.cooper3@citrix.com>
 <799c5a1b-d083-4b93-be44-a204a8b845f8@suse.com>
 <22d66aba-45e7-46c7-9aaf-7809a9fadb80@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <22d66aba-45e7-46c7-9aaf-7809a9fadb80@citrix.com>

This is a multi-part message in MIME format.
--------------5dPbh438csLFhGuKnVNdvkI8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/18/25 3:45 PM, Andrew Cooper wrote:
> On 18/02/2025 2:42 pm, Jan Beulich wrote:
>> On 18.02.2025 15:37, Andrew Cooper wrote:
>>> There is a corner case in the VMRUN instruction where its INTR_SHADOW state
>>> leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
>>> example of this could be taking #NPF due to event injection.
>>>
>>> Xen can safely execute STI anywhere between CLGI and VMRUN, as CLGI blocks
>>> external interrupts too.  However, an exception (while fatal) will appear to
>>> be in an irqs-on region (as GIF isn't considered), so position the STI after
>>> the speculation actions but prior to the GPR pops.
>>>
>>> Link:https://lore.kernel.org/all/CADH9ctBs1YPmE4aCfGPNBwA10cA8RuAk2gO7542DjMZgs4uzJQ@mail.gmail.com/
>>> Fixes: 66b245d9eaeb ("SVM: limit GIF=0 region")
>>> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich<jbeulich@suse.com>
>>> ---
>>> v2:
>>>   * Move after the speculation actions.
>>>
>>> Emailed out just for completeness.  I've queued it in my for-4.21 branch.
>> It'll want backporting, so I wonder if we should persuade Oleksii into
>> taking it for 4.20.

Based on that ...

> If Oleksii is happy, I can put it into 4.20.

... Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------5dPbh438csLFhGuKnVNdvkI8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/18/25 3:45 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:22d66aba-45e7-46c7-9aaf-7809a9fadb80@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 18/02/2025 2:42 pm, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 18.02.2025 15:37, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">There is a corner case in the VMRUN instruction where its INTR_SHADOW state
leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
example of this could be taking #NPF due to event injection.

Xen can safely execute STI anywhere between CLGI and VMRUN, as CLGI blocks
external interrupts too.  However, an exception (while fatal) will appear to
be in an irqs-on region (as GIF isn't considered), so position the STI after
the speculation actions but prior to the GPR pops.

Link: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/CADH9ctBs1YPmE4aCfGPNBwA10cA8RuAk2gO7542DjMZgs4uzJQ@mail.gmail.com/">https://lore.kernel.org/all/CADH9ctBs1YPmE4aCfGPNBwA10cA8RuAk2gO7542DjMZgs4uzJQ@mail.gmail.com/</a>
Fixes: 66b245d9eaeb ("SVM: limit GIF=0 region")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
v2:
 * Move after the speculation actions.

Emailed out just for completeness.  I've queued it in my for-4.21 branch.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">It'll want backporting, so I wonder if we should persuade Oleksii into
taking it for 4.20.</pre>
      </blockquote>
    </blockquote>
    <pre>Based on that ...</pre>
    <pre type="cite"
    cite="mid:22d66aba-45e7-46c7-9aaf-7809a9fadb80@citrix.com"><blockquote
    type="cite"><pre wrap="" class="moz-quote-pre"><pre wrap=""
    class="moz-quote-pre">If Oleksii is happy, I can put it into 4.20.</pre></pre></blockquote></pre>
    <pre>... Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------5dPbh438csLFhGuKnVNdvkI8--


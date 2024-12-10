Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC569EADFD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 11:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852007.1265938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxV6-0007x6-9b; Tue, 10 Dec 2024 10:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852007.1265938; Tue, 10 Dec 2024 10:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxV6-0007uO-6l; Tue, 10 Dec 2024 10:29:56 +0000
Received: by outflank-mailman (input) for mailman id 852007;
 Tue, 10 Dec 2024 10:29:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tKxV4-0007tz-1L
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 10:29:54 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ddb979-b6e1-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 11:29:52 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso1582879e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 02:29:52 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401b7d350asm812878e87.238.2024.12.10.02.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 02:29:50 -0800 (PST)
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
X-Inumbo-ID: b0ddb979-b6e1-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733826592; x=1734431392; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e56HJFEuP8xSKu7tpdVZwz0YulVxvs3x9gEPcdQhG60=;
        b=nej2/mAy9fEPaBhkkwOeGV5GMaH0Q8MgEJ89dMthKHaDrwoyWS1EoHl9N86ebKVv8D
         rk9qnO50aBOChH56Dn8BfcjdTaNBpz+r4c0NUSaSRANdkQEQHbd3hw9GblW8FrG+iJaa
         nqxahTAOjDmHOxtLe0AHXlbGMIs+Mpv8fOPJq2Q2cK42XYdvegZCLI8KrI354HmgQrKp
         a4agnn/Z7exe8tBRFw0wKrBjeSbcXRmD2Mm64ubPyPlcIx58JQWrCsWXxE/SrRK1n2rz
         W27TGJL5QeU3ib17pvVfFOHbh4fJmiN66nuGLVT32+mwwT9GYQu4y6QcsM3MhUQaJeCn
         X3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733826592; x=1734431392;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e56HJFEuP8xSKu7tpdVZwz0YulVxvs3x9gEPcdQhG60=;
        b=ifvro0BzKnkfSgXGIkizFMSVw2E1ORztJ9hTR1/0lLbSrIPqRnOKRF5Tmu2aPQ4kOA
         KWz+cAioD9rkc1b6xsj4hS4etAoz0c4ZQzrAku5jTO/McTM54ATdct/EnrD+oSJ1x4OZ
         l5RGz9hlrbWNxLxV+C8ac+WlXvlMjkPnsvZqOlAKERaxlBKxdlhGtdV6FDI3bOhYg55m
         +7eAjIPZPt5kmcC+XvzS5mtKhGDkjcZtOgQGa4D2LApWjlWGFmC/+P2M/5S6a1nfhJuK
         9e2AQvsRueGX84ZlXjX2kMRJo3TRGm1nzW9vwUWBd+jRTpl4rRkYzvBbcT4RIlJIZLCr
         eSjw==
X-Forwarded-Encrypted: i=1; AJvYcCX/frzblRhyFS9JY49lpUpfxpVTWuVSiGV64DeW6mEtJjg8W+mAMbgkwdFL9Mr0tGD9iaDDhZmSa0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypPKTPkmYyfeWfVQyQeFi3ccFMLoGvSyQWWiLigjDbTwoQsZms
	vm3advoiR/S+1akhO29UzHX/rVIKgqxaALgpurdawU0NwPRG7OR9
X-Gm-Gg: ASbGncvkdLlVjy7K1Nx00ckmOYSSJ1aGekZ+AuMtvaYvL8UFTpxzNhlQNpnoSctm4zq
	QYtwIgbV1JnAM78VJwNWD1oHWLbFTlPwwkm7fkQDjkmvCyx8tO7+5dIvfet1jDF5j2KnJ1h5Qhh
	uVGF043I0/vR2uu9sSEoYtOPCp6An2lxzvUCJwQZReUtI5nvFD1HE2zebuQlNirxGaMFK0FIF9b
	EmiV9hFLUJ5zW1BwxrZ+ft6k87hUqeGBIHIWbfQNBDMWpvNx9wLVRvmknZQPvJttUY=
X-Google-Smtp-Source: AGHT+IFEhK3Pb7KyI7IehUsjMIScysqERkg6gQLVRPFbMGMyzXi8FSCSr9nH00fU5bscgVYl+GYiUQ==
X-Received: by 2002:a05:6512:e88:b0:540:20a9:9abd with SMTP id 2adb3069b0e04-540240ac5ecmr1407854e87.6.1733826591289;
        Tue, 10 Dec 2024 02:29:51 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Nj5vBLRcso470spXc9TpPFbO"
Message-ID: <412fabb2-04e2-49cd-a204-340fea3ad940@gmail.com>
Date: Tue, 10 Dec 2024 11:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [November]
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org, kelly.choi@cloud.com,
 xen-devel@lists.xenproject.org
References: <20241204102035.22505-1-oleksii.kurochko@gmail.com>
 <3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com>

This is a multi-part message in MIME format.
--------------Nj5vBLRcso470spXc9TpPFbO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/24 12:01 PM, Jan Beulich wrote:
> On 04.12.2024 11:20, Oleksii Kurochko wrote:
>> === x86 ===
>>
>> *  Expose consistent topology to guests (v7)
>>    -  Alejandro Vallejo
>>    -https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b
>>
>> *  Boot modules for Hyperlaunch (v8 -> v9)
>>    -  Daniel P. Smith
>>    -https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/
>>
>> *  x86/mm: miscellaneous fixes (v2 -> v3)
>>    -  Roger Pau Monne
>>    -https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.com/
> This went in, didn't it?

Yes, you are right. It is fully in staging now.


>
>> *  Address Space Isolation FPU preparations (v2)
>>    -  Alejandro Vallejo
>>    -https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d
>>
>> *  x86/alternatives: Adjust all insn-relative fields (v2)
>>    -  Andrew Cooper
>>    -https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
>>
>> *  Support device passthrough when dom0 is PVH on Xen (v16)
>>    -  Jiqian Chen
>>    -https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
> Some of this went in too, I think?

"Support device passthrough when dom0 is PVH on Xen" should be moved to Completed. ( Accidentally did a grep for the cover letter subject not
for the subject of the 1st patch so though that 1st patch isn't merged.

And it seems to me that it should be mentioned in CHANGELOG.md, shouldn't it?

>
>> *  x86emul: misc additions (v5 -> v7)
>>    -  Jan Beulich
>>    -https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/
>>
>> *  x86/HVM: emulation (MMIO) improvements (v2)
>>    -  Jan Beulich
>>    -https://lore.kernel.org/xen-devel/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com/
>>
>> *  x86: support AVX10.1 (v2)
>>    -  Jan Beulich
>>    -https://lore.kernel.org/xen-devel/bcfea345-57c1-43d9-82b3-240b685486cc@suse.com/
> In v2 the title had changed to "x86: support AVX10", dealing with a first
> aspect of AVX10.2 as well. I have long completed AVX10.2 work, yet there
> was little reason to re-post without having got any feedback.

Thanks, I will update the subject.


>
>> *  APX support (v?)
>>    -  Jan Beulich
>>    -  ?
> I think you want to remove this from the list. While I have completed work
> there, I'm not fancying re-basing ahead of the AVX10 work, and hence that
> needs to go in first anyway. Which seems unlikely enough at this point, for
> 4.20.
>
>> *  VT-d: SATC handling; ATS: tidying (v2)
>>    -  Jan Beulich
>>    -https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/
>>
>> *  x86: parallelize AP bring-up during boot (v1)
>>    -  Krystian Hebel
>>    -https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
>>
>> *  x86: memcpy() / memset() (non-)ERMS flavors plus (v3)
>>    -  Jan Beulich
>>    -https://lore.kernel.org/xen-devel/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/
> Isn't this the same as ...
>
>> *  x86/spec-ctrl: IBPB improvements (v4)
>>    -  Jan Beulich
>>    -https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/
>>
>> *  Move some boot code from assembly to C (v2)
>>    -  Frediano Ziglio
>>    -https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/
>>
>> *  Hyperlaunch device tree for dom0 (v1)
>>    -  Daniel P. Smith
>>    -https://patchew.org/Xen/20241123182044.30687-1-dpsmith@apertussolutions.com/
>>
>> *  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v3)
>>    -  Jan Beulich
>>    -https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/
> ... this?

This is the same and one of them I will drop for the next report.


>
>> *  amd-pstate CPU Performance Scaling Driver (v1)
>>    -  Penny Zheng
>>    -https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/
> This series was posted only this week, and upon asking it was clarified that
> it's indeed not aiming at 4.20.

Yes, it is definitely not for the current one release. Probably it would 
make sense to add the extra line information

that it is for the next one release.

~ Oleksii

--------------Nj5vBLRcso470spXc9TpPFbO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/4/24 12:01 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 04.12.2024 11:20, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">=== x86 === 

*  Expose consistent topology to guests (v7)
  -  Alejandro Vallejo
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b">https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vallejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b</a>

*  Boot modules for Hyperlaunch (v8 -&gt; v9)
  -  Daniel P. Smith
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/">https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/</a>

*  x86/mm: miscellaneous fixes (v2 -&gt; v3)
  -  Roger Pau Monne
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.com/">https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.com/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This went in, didn't it?</pre>
    </blockquote>
    <pre><font face="monospace">Yes, you are right. It is fully in staging now.</font></pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">*  Address Space Isolation FPU preparations (v2)
  -  Alejandro Vallejo
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d">https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d</a>

*  x86/alternatives: Adjust all insn-relative fields (v2)
  -  Andrew Cooper
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129">https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129</a>

*  Support device passthrough when dom0 is PVH on Xen (v16)
  -  Jiqian Chen
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526">https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Some of this went in too, I think?</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">"Support device passthrough when dom0 is PVH on Xen" should be moved to Completed. ( Accidentally did a grep for the cover letter subject not
for the subject of the 1st patch so though that 1st patch isn't merged.

And it seems to me that it should be mentioned in CHANGELOG.md, shouldn't it?

</pre>
    <p></p>
    <blockquote type="cite"
      cite="mid:3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">*  x86emul: misc additions (v5 -&gt; v7)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/">https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/</a>

*  x86/HVM: emulation (MMIO) improvements (v2)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com/">https://lore.kernel.org/xen-devel/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com/</a>

*  x86: support AVX10.1 (v2)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/bcfea345-57c1-43d9-82b3-240b685486cc@suse.com/">https://lore.kernel.org/xen-devel/bcfea345-57c1-43d9-82b3-240b685486cc@suse.com/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In v2 the title had changed to "x86: support AVX10", dealing with a first
aspect of AVX10.2 as well. I have long completed AVX10.2 work, yet there
was little reason to re-post without having got any feedback.</pre>
    </blockquote>
    <p><font face="monospace">Thanks, I will update the subject.</font></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">*  APX support (v?)
  -  Jan Beulich
  -  ?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think you want to remove this from the list. While I have completed work
there, I'm not fancying re-basing ahead of the AVX10 work, and hence that
needs to go in first anyway. Which seems unlikely enough at this point, for
4.20.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">*  VT-d: SATC handling; ATS: tidying (v2)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/">https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/</a>

*  x86: parallelize AP bring-up during boot (v1)
  -  Krystian Hebel
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/">https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/</a>

*  x86: memcpy() / memset() (non-)ERMS flavors plus (v3)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/">https://lore.kernel.org/xen-devel/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Isn't this the same as ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">*  x86/spec-ctrl: IBPB improvements (v4)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/">https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/</a>

*  Move some boot code from assembly to C (v2)
  -  Frediano Ziglio
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/">https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/</a>

*  Hyperlaunch device tree for dom0 (v1)
  -  Daniel P. Smith
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241123182044.30687-1-dpsmith@apertussolutions.com/">https://patchew.org/Xen/20241123182044.30687-1-dpsmith@apertussolutions.com/</a>

*  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v3)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/">https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this?</pre>
    </blockquote>
    <p><font face="monospace">This is the same and one of them I will
        drop for the next report.</font></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:3e4e504e-f4d4-4ac2-be66-3f32a9f31c9a@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">*  amd-pstate CPU Performance Scaling Driver (v1)
  -  Penny Zheng
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/">https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This series was posted only this week, and upon asking it was clarified that
it's indeed not aiming at 4.20.</pre>
    </blockquote>
    <pre><font face="monospace">Yes, it is definitely not for the current one release. Probably it would make sense to add the extra line information</font></pre>
    <pre><font face="monospace">that it is for the next one release.</font></pre>
    <pre><font face="monospace">
</font></pre>
    <pre><font face="monospace">~ Oleksii</font>
</pre>
  </body>
</html>

--------------Nj5vBLRcso470spXc9TpPFbO--


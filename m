Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE7A195FE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 17:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875985.1286377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tadAu-000738-9R; Wed, 22 Jan 2025 16:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875985.1286377; Wed, 22 Jan 2025 16:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tadAu-00070W-6g; Wed, 22 Jan 2025 16:01:52 +0000
Received: by outflank-mailman (input) for mailman id 875985;
 Wed, 22 Jan 2025 16:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=32Vc=UO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tadAs-00070L-4o
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 16:01:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fed3085-d8da-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 17:01:49 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so14384484a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 08:01:49 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73edbaffsm8826378a12.66.2025.01.22.08.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 08:01:46 -0800 (PST)
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
X-Inumbo-ID: 2fed3085-d8da-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737561708; x=1738166508; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uR6wsqFlwBpyRXiy4j2Zc9iFSAkkHWXDs0GCAz7Ziw=;
        b=GPblWV455scQKyIAysOkegXvY/Qy4Ect/oAxkzLlJrXdeyCjFAqBs13vco+J7Q4Hgs
         Y/O8n0LmIlWLEF/sPDxNWAxbMmhM8XgP/U+BVpSRtnPRy8kU0ldb3j5ob+elTZlXsIeq
         JkypPUcbRcQnpmDdIaEA6MYWzWMPJIXIM19YheUgrkoSvpoa82FIKuEvuxGsz3XfwFLY
         ZziiGcnw0927v85ZEohagq45PhSWTpPNIGwf6AWF8vHHUCHaD96NG8L8fwbAgSenXdku
         lKz4RAyzKxUcmHYIoDebJYjzBR8EkpXk+mNmpj8hpcNwfi8i5+ZgWS35TAaYEnAfObTt
         QN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737561708; x=1738166508;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8uR6wsqFlwBpyRXiy4j2Zc9iFSAkkHWXDs0GCAz7Ziw=;
        b=hRW9KgqxnHVqrdyOAnMrsvHUl8j8GO+iwReL86cLTXc7OnFuLtk9EHys5IXNji+x9I
         0MRyoJW4uTQ/2SlrLkcC5t8cc0CA36mE+xhoyhxX6oIf8u4uWofb9X4p5GAYKN4rSN0c
         78PIGVDZeZVqNdEiF/Csw1m7Fa7Vywk3+QblIGPWLR5EC/B6CItc1Vqwkm2XSBe9Qvdn
         1SrjcjmWTElJBpe8uuxt6ImC/zD6ReFIqq6H9ILoi2e8udYy+p5IIkWqbx6TGapIGoHV
         g2xleZRYu7VBgYPJQ2V3QSoh2TwD2IVofopShWZi/Tw67IJ3G7BsouS6lx7rgNexjiEH
         juqQ==
X-Gm-Message-State: AOJu0YzUl35L27k0wmcsd7A/ohP4kP/AjOKXz/8NP2Cuosl1q1LSxuSC
	nW580Jc3xzwSPOg9aSSW8+ll7CqdYAtYLHs7iq2ucQZjrcB+qOqU
X-Gm-Gg: ASbGncv0/LLtHmT7pIGo3UMPmDjbf2VI7Bd1sip6ybw3KnB0EKcq2KogvPOiJ495nSD
	NdO5olp06Z85gkbihwV78TbmCA6g6O00m+4U6n+XnlChKM9v3w/F9eO1aatDqZqTK6Dqz88hMFC
	GosMA/m2sRQZ8P/ySwHBbTkjjNHkTM1dZKebaKa5p5ItlrmC9f0mc5jPwBcoKf6xtgcM5LjQ8Dj
	VYRoPKofYolIvLl/JpdnXHol2NIU1r+MboZVfqXLphzjubPocutB5YQ6gAjbDXjNemK1kj9XAla
	2ry2mmI=
X-Google-Smtp-Source: AGHT+IGZS1PwZcjjzqbcIiM0wjykbuA/dZyUpYPyp+ZmhfemWabxVFjf2TZV3vHHchCFDWuWWhRWgw==
X-Received: by 2002:a05:6402:1ec1:b0:5d3:f6cb:73e7 with SMTP id 4fb4d7f45d1cf-5db7d2fc234mr21005799a12.13.1737561706755;
        Wed, 22 Jan 2025 08:01:46 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------UmrOygGyndRTXyq57w1EU0b8"
Message-ID: <7dcee103-1f3d-4b0c-b9c3-d9f37d4735b2@gmail.com>
Date: Wed, 22 Jan 2025 17:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86emul: further correct 64-bit mode zero count
 repeated string insn handling
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2e81cf29-65fd-74fc-db4f-95c453acc327@suse.com>
 <Z5DHOknjrhMoAGz6@macbook.local>
 <24885d31-e536-4ff4-8457-300c9a028701@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <24885d31-e536-4ff4-8457-300c9a028701@suse.com>

This is a multi-part message in MIME format.
--------------UmrOygGyndRTXyq57w1EU0b8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/22/25 2:29 PM, Jan Beulich wrote:
> On 22.01.2025 11:23, Roger Pau Monné wrote:
>> On Fri, Aug 04, 2023 at 07:58:21AM +0200, Jan Beulich wrote:
>>> In an entirely different context I came across Linux commit 428e3d08574b
>>> ("KVM: x86: Fix zero iterations REP-string"), which points out that
>>> we're still doing things wrong: For one, there's no zero-extension at
>>> all on AMD. And then while RCX is zero-extended from 32 bits uniformly
>>> for all string instructions on newer hardware, RSI/RDI are only for MOVS
>>> and STOS on the systems I have access to. (On an old family 0xf system
>>> I've further found that for REP LODS even RCX is not zero-extended.)
>>>
>>> Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>> Acked-by: Roger Pau Monné<roger.pau@citrix.com>
> Thanks. I'm uncertain though whether with concerns Andrew had voiced (maybe
> just on irc/Matrix) I may go ahead and commit this. Andrew?
>
> In any event - Oleksii, I guess I'd need a release ack here (or an indication
> to defer to 4.21).

If Andrew has no objections to this patch, then:|R-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>|

Otherwise, it would be better to defer the patch to 4.21 or wait until the objections are resolved or clarified as unnecessary.


~ Oleksii

>
>>> ---
>>> Partly RFC for none of this being documented anywhere (and it partly
>>> being model specific); inquiry pending.
>> Did you get any reply on this?
> No, and to be honest I also didn't have much hope I would get any reply.
>
> Jan
--------------UmrOygGyndRTXyq57w1EU0b8
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
    <div class="moz-cite-prefix">On 1/22/25 2:29 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:24885d31-e536-4ff4-8457-300c9a028701@suse.com">
      <pre wrap="" class="moz-quote-pre">On 22.01.2025 11:23, Roger Pau Monné wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Fri, Aug 04, 2023 at 07:58:21AM +0200, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">In an entirely different context I came across Linux commit 428e3d08574b
("KVM: x86: Fix zero iterations REP-string"), which points out that
we're still doing things wrong: For one, there's no zero-extension at
all on AMD. And then while RCX is zero-extended from 32 bits uniformly
for all string instructions on newer hardware, RSI/RDI are only for MOVS
and STOS on the systems I have access to. (On an old family 0xf system
I've further found that for REP LODS even RCX is not zero-extended.)

Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Acked-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks. I'm uncertain though whether with concerns Andrew had voiced (maybe
just on irc/Matrix) I may go ahead and commit this. Andrew?

In any event - Oleksii, I guess I'd need a release ack here (or an indication
to defer to 4.21).</pre>
    </blockquote>
    <pre>If Andrew has no objections to this patch, then: <code>R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></code></pre>
    <pre>Otherwise, it would be better to defer the patch to 4.21 or wait until the objections are resolved or clarified as unnecessary.</pre>
    <pre>

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:24885d31-e536-4ff4-8457-300c9a028701@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">---
Partly RFC for none of this being documented anywhere (and it partly
being model specific); inquiry pending.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Did you get any reply on this?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No, and to be honest I also didn't have much hope I would get any reply.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------UmrOygGyndRTXyq57w1EU0b8--


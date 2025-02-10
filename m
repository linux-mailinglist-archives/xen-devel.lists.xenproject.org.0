Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C7A2E785
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 10:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884468.1294170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPye-0005RV-Vz; Mon, 10 Feb 2025 09:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884468.1294170; Mon, 10 Feb 2025 09:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPye-0005Oj-T6; Mon, 10 Feb 2025 09:21:16 +0000
Received: by outflank-mailman (input) for mailman id 884468;
 Mon, 10 Feb 2025 09:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thPyd-0005Ob-6N
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 09:21:15 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f2a791f-e790-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 10:21:13 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5450475df04so1883765e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 01:21:13 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450dcf8dc8sm158429e87.138.2025.02.10.01.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 01:21:11 -0800 (PST)
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
X-Inumbo-ID: 5f2a791f-e790-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739179272; x=1739784072; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D525hbePQgtnnYOoOCY2IFJ6CuWrLH/iZkbdxsZV0bc=;
        b=fmOPtre7b4NnizH51aL2nmn/a5AqDmEJKfy4x5809za8+SYctffaLkvaWmL7ePvIf1
         2fmbBbqC3j345elsSKSbMbl/OgpLEhXpcxMgSMXIbp4EwMClAPN/vtFXaSBkSeVqzIOv
         qsonffZ5Z9Us6/QTnevlJ6UN8nHrFmlPm14f+dS3jc/U7B6HIfr9ABOqDWYsL/lgIu0N
         vN9QebG6do0uJ9hviu1iu1NLrfxQNdTamkGbvCHR8GZhVftHjW4PaLLy/rbqBjoM/Jdy
         RuiUIfcF5E4xfokPOYHZ91eqJ3caD/PmFKFWaGHGXsk28gZq8pGDjPb6D0ZxIGoG4B/c
         9KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179272; x=1739784072;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D525hbePQgtnnYOoOCY2IFJ6CuWrLH/iZkbdxsZV0bc=;
        b=KMaWRi/dSv7z/UZRmTwaTAjfUEklBcqeLiM0vBp2S01Dqd/tKIMMOOvjEgtu2E0p8b
         agKJnB4B82GoSApeV3E9blGHg34CDq1xGqSNLePYONJmbXwwNRDtY94RZ5sUSaQety5F
         WGKpvcLqn5YCwBrYkwgNPrJuvOUbSNl8dxJQh6x0HogZ/b0ReKmr1GNepmsP3GP+Nv70
         0HODEvvosLl+STmGDwuWJc6xNOaBDtZNIr7q1IYi7dQHQcaud3DjTdnRljudsZMpKbRf
         JRuAyaTMUajRi7s3EBh2OyxIKqPPgjWuPwJyBu+PGv0Z3HdZQIA2US5tNbD0+WwA1HKC
         N5sg==
X-Forwarded-Encrypted: i=1; AJvYcCW8MuyzdtPxyYtx33BsLKFDgM94zfDCk470i1vYc3eOrf6Pv3XqcRAujhSDzJpqB5Vw7yoOYtF0Hf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6Ww5lfya4e09z10Mzv4OJTUyBpFKGOXjzLXFmxorCXT2aON2a
	ab0yvreVPeAMT2rFJR+pU7wedF4fqtmsKtmFfWYLym7xOdQODoZ6
X-Gm-Gg: ASbGncvXbzUBi08+l1lPTuMgFFNNJ2+YgwOWS2f7THyrxKKVH1JwxA0IcT4StsuHBSd
	/rr7TubEjRO/6l4Q1Dq6eq2KBh7yh0Sz65ut76WhQGiJgAv82apwKgvFT4cjNfymD3rPOIhgIK5
	e0ExXPI1Vuzu6duF/Zbt15nOX/kdZ9bnHW5pODo0+irt1eN9z/cLVih3sU0t9t4RhxkHfmUJfcF
	MUzW2NUfTlR1ghH7rZHdS5mHEBWGqpHddFenH+8RPq4XI+cNe2F0RFvUUQLdSzv1KvdMo3e/TdG
	tgjyhF1GfpJoDePuNJxx67LekdI=
X-Google-Smtp-Source: AGHT+IGQvt3kaQ0svoZ7m9ggNOjp391nhJDhUyZWs2jyy5pZ9n9sNgUy8v/AnOlJ3FOWrM7kp50ViA==
X-Received: by 2002:ac2:58d8:0:b0:545:60b:f381 with SMTP id 2adb3069b0e04-545060bf49amr1637904e87.29.1739179272214;
        Mon, 10 Feb 2025 01:21:12 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------nJAGmTgkYIlIrFTtODqeHb0z"
Message-ID: <59a3a09b-d05f-4ad7-867a-bb41bf6e6c54@gmail.com>
Date: Mon, 10 Feb 2025 10:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: Fix register constraints in
 run_in_exception_handler()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250208000256.431883-3-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------nJAGmTgkYIlIrFTtODqeHb0z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/8/25 1:02 AM, Andrew Cooper wrote:
> Right now, run_in_exception_handler() takes an input in an arbitrary register,
> and clobbers BUG_FN_REG.  This causes the compiler to calculate fn in the
> wrong regsiter.

Probably, we should give a chance for the patch which suggests to use GENERIC_BUG_FRAME:
   https://lore.kernel.org/xen-devel/8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com/

~ Oleksii

> Instead, use `register asm()` which is the normal way of tying register
> constraints to exact registers.
>
> Bloat-o-meter reports:
>
>    ARM64:
>      Function                                     old     new   delta
>      dump_registers                               356     348      -8
>
>    ARM32:
>      ns16550_poll                                  52      48      -4
>      dump_registers                               432     428      -4
>
> The other instruction dropped in ARM64's dump_registers() is an alignment nop.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ----
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
>   xen/arch/arm/include/asm/bug.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
> index cacaf014ab09..8bf71587bea1 100644
> --- a/xen/arch/arm/include/asm/bug.h
> +++ b/xen/arch/arm/include/asm/bug.h
> @@ -59,15 +59,15 @@ struct bug_frame {
>    * be called function in a fixed register.
>    */
>   #define  run_in_exception_handler(fn) do {                                  \
> -    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
> -         "1:"BUG_INSTR"\n"                                                  \
> +    register unsigned long _fn asm (STR(BUG_FN_REG)) = (unsigned long)(fn); \
> +    asm ("1:"BUG_INSTR"\n"                                                  \
>            ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
>            "             \"a\", %%progbits\n"                                 \
>            "2:\n"                                                             \
>            ".p2align 2\n"                                                     \
>            ".long (1b - 2b)\n"                                                \
>            ".long 0, 0, 0\n"                                                  \
> -         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
> +         ".popsection" :: "r" (_fn) );                                      \
>   } while (0)
>   
>   #define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
--------------nJAGmTgkYIlIrFTtODqeHb0z
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
    <div class="moz-cite-prefix">On 2/8/25 1:02 AM, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250208000256.431883-3-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Right now, run_in_exception_handler() takes an input in an arbitrary register,
and clobbers BUG_FN_REG.  This causes the compiler to calculate fn in the
wrong regsiter.</pre>
    </blockquote>
    <pre>Probably, we should give a chance for the patch which suggests to use GENERIC_BUG_FRAME:
  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com/">https://lore.kernel.org/xen-devel/8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com/</a>

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20250208000256.431883-3-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
Instead, use `register asm()` which is the normal way of tying register
constraints to exact registers.

Bloat-o-meter reports:

  ARM64:
    Function                                     old     new   delta
    dump_registers                               356     348      -8

  ARM32:
    ns16550_poll                                  52      48      -4
    dump_registers                               432     428      -4

The other instruction dropped in ARM64's dump_registers() is an alignment nop.

No functional change.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
----
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 xen/arch/arm/include/asm/bug.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index cacaf014ab09..8bf71587bea1 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -59,15 +59,15 @@ struct bug_frame {
  * be called function in a fixed register.
  */
 #define  run_in_exception_handler(fn) do {                                  \
-    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
-         "1:"BUG_INSTR"\n"                                                  \
+    register unsigned long _fn asm (STR(BUG_FN_REG)) = (unsigned long)(fn); \
+    asm ("1:"BUG_INSTR"\n"                                                  \
          ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
          "             \"a\", %%progbits\n"                                 \
          "2:\n"                                                             \
          ".p2align 2\n"                                                     \
          ".long (1b - 2b)\n"                                                \
          ".long 0, 0, 0\n"                                                  \
-         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
+         ".popsection" :: "r" (_fn) );                                      \
 } while (0)
 
 #define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
</pre>
    </blockquote>
  </body>
</html>

--------------nJAGmTgkYIlIrFTtODqeHb0z--


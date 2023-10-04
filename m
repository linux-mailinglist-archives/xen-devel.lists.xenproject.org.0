Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1407B7E0A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 13:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612500.952427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnzsw-0001uA-6n; Wed, 04 Oct 2023 11:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612500.952427; Wed, 04 Oct 2023 11:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnzsw-0001rO-3X; Wed, 04 Oct 2023 11:17:46 +0000
Received: by outflank-mailman (input) for mailman id 612500;
 Wed, 04 Oct 2023 11:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZBSc=FS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qnzsu-0001rI-B8
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 11:17:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a25805dc-62a7-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 13:17:41 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53636f98538so3518916a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Oct 2023 04:17:41 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c280700b00405391f485fsm1249930wmb.41.2023.10.04.04.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 04:17:41 -0700 (PDT)
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
X-Inumbo-ID: a25805dc-62a7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696418261; x=1697023061; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qa1HJPdUhSniKTixvdDGEhALqGOZ6dnaZU3zY0iVqLw=;
        b=F8zbnd2IqRsodypzGbOAQCaZXHf/op6EWCqGAxmFMxPh9v/dKt5X4pZZSl2LvJ2V0M
         TAUSKpK545s5bvfVCH9dEccscj05iMey81tVJfyId0TJ02K1DL0mRIxjSMU0SMRvT06Y
         T2+dakkrqmO44snBcIZxEBqL666Yj/GVB9RWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696418261; x=1697023061;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qa1HJPdUhSniKTixvdDGEhALqGOZ6dnaZU3zY0iVqLw=;
        b=uaQ8VmqLrc5Q/nYgBkyj6zVtaC9RPwru3O3igAheBf8XFMMHIAAD6JvuubckNmJ5s0
         9S15I5LT3GRPE7/5dWwvRh+Uu21nuou9J7GVPvkHvyFQ3B2QNu1WYzFhtk3QYZumZHFr
         G57ETnTL22jeuLP8KDG16vOcWJooUWC7Z0a9aZI+O/Kp7qu1bH4WCycdtEgMoP5L2Pb+
         mUpAcPw9lHh0tMPlKktZIXnqjoJra8KKSPy1JTvO7eFvmeqoDDwY5yb6dVj00PgPOwJg
         C9BrXsziPb1ND6lumMpwfkZecARxkMuxucrdbPfnyp3NwQrPSac7QONd1ADMF1pKU2Ch
         52tw==
X-Gm-Message-State: AOJu0YyRY8Mp7jNypt7g9MjXTUt/9NJCrWLgBpV3KncQ8DX+DyRYFTTX
	uH1mICwabq9bW381uQs4Ii9jIw==
X-Google-Smtp-Source: AGHT+IEvkHTAURIMWiJgJSA/qhGbv8X6+WHcNFaKdy3+rn1xKwAB/bgEj8cqsyLZvo6zmdcOWsn5Lw==
X-Received: by 2002:a17:906:104c:b0:9b2:74a1:6b30 with SMTP id j12-20020a170906104c00b009b274a16b30mr1559590ejj.33.1696418261331;
        Wed, 04 Oct 2023 04:17:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------abQ0Z5pnN7yNbqhn0hkAp1nU"
Message-ID: <23802fca-7aaf-4792-a57c-2a3b2502ca70@citrix.com>
Date: Wed, 4 Oct 2023 12:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>

This is a multi-part message in MIME format.
--------------abQ0Z5pnN7yNbqhn0hkAp1nU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/10/2023 11:52 am, Luca Fancellu wrote:
> From the documentation:
>
>     In the Xen codebase, these tags will be used to document and suppress findings:
>
>     - SAF-X-safe: This tag means that the next line of code contains a finding, but
>       the non compliance to the checker is analysed and demonstrated to be safe.
>
> I understand that Eclair is capable of suppressing also the line in which the in-code suppression
> comment resides, but these generic Xen in-code suppression comment are meant to be used
> by multiple static analysis tools and many of them suppress only the line next to the comment
> (Coverity, cppcheck).
>
> So I’m in favour of your approach below, clearly it depends on what the maintainers feedback is:
>
>>                          /* SAF-2-safe */
>>   if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) &&
>>                          /* SAF-2-safe */
>>       (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>                          /* SAF-2-safe */
>>       (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) )

To be clear, this is illegible and a non-starter from a code maintenance
point of view.

It is bad enough needing annotations to start with, but the annotations
*must* not interfere with the prior legibility.

The form with comments on the end, that do not break up the tabulation
of the code, is tolerable, providing the SAF turns into something
meaningful.

~Andrew

P.S. to be clear, I'm not saying that an ahead-of-line comments are
unacceptable generally.  Something like

    /* $FOO-$N-safe */
    if ( blah )

might be fine in context, but that is a decision that needs to be made
based on how the code reads with the comment in place.
--------------abQ0Z5pnN7yNbqhn0hkAp1nU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 04/10/2023 11:52 am, Luca Fancellu
      wrote:<span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
      cite="mid:B00BC78B-E707-4043-A0B4-D320C6717472@arm.com">
      <pre class="moz-quote-pre" wrap="">From the documentation:

    In the Xen codebase, these tags will be used to document and suppress findings:

    - SAF-X-safe: This tag means that the next line of code contains a finding, but
      the non compliance to the checker is analysed and demonstrated to be safe.

I understand that Eclair is capable of suppressing also the line in which the in-code suppression
comment resides, but these generic Xen in-code suppression comment are meant to be used
by multiple static analysis tools and many of them suppress only the line next to the comment
(Coverity, cppcheck).

So I’m in favour of your approach below, clearly it depends on what the maintainers feedback is:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
                         /* SAF-2-safe */
  if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) &amp;&amp;
                         /* SAF-2-safe */
      (modrm_reg &amp; 7) == MASK_EXTR(instr_modrm, 0070) &amp;&amp;
                         /* SAF-2-safe */
      (modrm_rm &amp; 7)  == MASK_EXTR(instr_modrm, 0007) )</pre>
      </blockquote>
    </blockquote>
    <br>
    To be clear, this is illegible and a non-starter from a code
    maintenance point of view.<br>
    <br>
    It is bad enough needing annotations to start with, but the
    annotations *must* not interfere with the prior legibility.<br>
    <br>
    The form with comments on the end, that do not break up the
    tabulation of the code, is tolerable, providing the SAF turns into
    something meaningful.<br>
    <br>
    ~Andrew<br>
    <br>
    P.S. to be clear, I'm not saying that an ahead-of-line comments are
    unacceptable generally.  Something like<br>
    <br>
        /* $FOO-$N-safe */<br>
        if ( blah )<br>
    <br>
    might be fine in context, but that is a decision that needs to be
    made based on how the code reads with the comment in place.<br>
  </body>
</html>

--------------abQ0Z5pnN7yNbqhn0hkAp1nU--


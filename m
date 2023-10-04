Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2317B7CAD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 11:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612466.952367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnybz-0007m5-8N; Wed, 04 Oct 2023 09:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612466.952367; Wed, 04 Oct 2023 09:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnybz-0007kG-3l; Wed, 04 Oct 2023 09:56:11 +0000
Received: by outflank-mailman (input) for mailman id 612466;
 Wed, 04 Oct 2023 09:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZBSc=FS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qnybx-0007kA-7f
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 09:56:09 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c62218e-629c-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 11:56:06 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-327be5fe4beso1747004f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Oct 2023 02:56:06 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r2-20020a5d4982000000b00323330edbc7sm3611375wrq.20.2023.10.04.02.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 02:56:05 -0700 (PDT)
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
X-Inumbo-ID: 3c62218e-629c-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696413366; x=1697018166; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EzZseEEdk2ifdFw51Fm29zuvHh069FGL6J24VL3vbcI=;
        b=sn95haF+H6yGGi7Pmr4kQ0Di7R5hIIj+CS1q/3y/PkWRvxTQBOJPw5kJbyPcZhEqYC
         1sWujBHg+lg1mrsyUzRamwQlhS8eNozKhxCMxmEKtX51xKI6l7IsqVPxy48lW/lkImNy
         FQ0qhWq9Xq09mqwwsuvaW+ql7dlwGG5g73mPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696413366; x=1697018166;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzZseEEdk2ifdFw51Fm29zuvHh069FGL6J24VL3vbcI=;
        b=rfDsbcjdAHbo5PyGuJjK1iGejIZYxCS/9b8UjEG9zT/soNFXDmVpkDvj++yyS3B073
         4p72EhdudGtF+lbyKHZQBTTe04Qc5MkVVsuFJwDWD3EcX/h7d3UuQztdpi1dlZLJ6EOF
         cdluAVGS1ebqIQAXGeomxBN4Xw7mgCbFboRincPlEkFa91ogiU5Hmb3ha5uVCQBrvNOU
         r/EWhxdeqWauD71LlabqXQVF+50XPjCt9wHIM+enHLPe2TiRPJSx5Ic3L872U+CSh+/C
         zzBmUqP2SkufWg4k8TbxbSMu/9VzBMAwVZcZC4iuH+YSXgvWBPzjTewTAU74ME2Wxvr6
         bskA==
X-Gm-Message-State: AOJu0YwTtEFU2ZnjmB92rRPJx/B2rCom9BKWqUX8zpx6l7C2KzRqjOTP
	tWGquKLq9S2wQTo9YWLiEFQ7Pw==
X-Google-Smtp-Source: AGHT+IHL7s0FOiaHwYVgrsUf2c5WGSw3alwUp2bmaWb9Z8V3FwEFuTKRIL8M9QJKtxc8LmnWoFjstw==
X-Received: by 2002:adf:e74e:0:b0:321:504a:bc9a with SMTP id c14-20020adfe74e000000b00321504abc9amr1436803wrn.71.1696413365822;
        Wed, 04 Oct 2023 02:56:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------mGradkmxElIXCPeEscQw9VOP"
Message-ID: <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
Date: Wed, 4 Oct 2023 10:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: andrew.cooper3@citrix.com
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, roger.pau@citrix.com, Henry.Wang@arm.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------mGradkmxElIXCPeEscQw9VOP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/2023 9:46 pm, Stefano Stabellini wrote:
> On Tue, 3 Oct 2023, Nicola Vetrini wrote:
>> As specified in rules.rst, these constants can be used
>> in the code.
>> Their deviation is now accomplished by using a SAF comment,
>> rather than an ECLAIR configuration.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> "SAF" discussion aside that can be resolved elsewhere:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Well no.  "SAF" aside (and SAF does need fixing before reposting this
patch, otherwise it's just unnecessary churn), ...

>> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
>> index d2a781fc3fb5..d0623b72ccfa 100644
>> --- a/xen/arch/x86/hvm/svm/svm.h
>> +++ b/xen/arch/x86/hvm/svm/svm.h
>> @@ -57,14 +57,23 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
>>  #define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
>>  #define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
>>  #define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
>> +/* SAF-2-safe */
>>  #define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
>> +/* SAF-2-safe */
>>  #define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
>> +/* SAF-2-safe */
>>  #define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
>> +/* SAF-2-safe */
>>  #define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
>> +/* SAF-2-safe */
>>  #define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
>> +/* SAF-2-safe */
>>  #define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
>> +/* SAF-2-safe */
>>  #define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
>> +/* SAF-2-safe */
>>  #define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
>> +/* SAF-2-safe */
>>  #define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
>>  #define INSTR_INVD        INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>  #define INSTR_WBINVD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)

... this has broken a tabulated structure to have comments ahead of
lines with octal numbers, while ...

>> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
>> index aa2c61c433b3..c5e3341c6316 100644
>> --- a/xen/arch/x86/hvm/svm/emulate.c
>> +++ b/xen/arch/x86/hvm/svm/emulate.c
>> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
>>          if ( !instr_modrm )
>>              return emul_len;
>>  
>> -        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &&
>> -             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>> -             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )
>> +        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe */
>> +             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe */
>> +             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* SAF-2-safe */
>>              return emul_len;
>>      }

... this has comments at the end of lines with octal numbers.

So which is it?

~Andrew
--------------mGradkmxElIXCPeEscQw9VOP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 03/10/2023 9:46 pm, Stefano
      Stabellini wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop">
      <pre class="moz-quote-pre" wrap="">On Tue, 3 Oct 2023, Nicola Vetrini wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As specified in rules.rst, these constants can be used
in the code.
Their deviation is now accomplished by using a SAF comment,
rather than an ECLAIR configuration.

Signed-off-by: Nicola Vetrini <a class="moz-txt-link-rfc2396E" href="mailto:nicola.vetrini@bugseng.com">&lt;nicola.vetrini@bugseng.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
"SAF" discussion aside that can be resolved elsewhere:

Reviewed-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a></pre>
    </blockquote>
    <br>
    Well no.  "SAF" aside (and SAF does need fixing before reposting
    this patch, otherwise it's just unnecessary churn), ...<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index d2a781fc3fb5..d0623b72ccfa 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -57,14 +57,23 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
 #define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
 #define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
 #define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
+/* SAF-2-safe */
 #define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
+/* SAF-2-safe */
 #define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
+/* SAF-2-safe */
 #define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
+/* SAF-2-safe */
 #define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
+/* SAF-2-safe */
 #define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
+/* SAF-2-safe */
 #define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
+/* SAF-2-safe */
 #define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
+/* SAF-2-safe */
 #define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
+/* SAF-2-safe */
 #define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
 #define INSTR_INVD        INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
 #define INSTR_WBINVD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)</pre>
      </blockquote>
    </blockquote>
    <br>
    ... this has broken a tabulated structure to have comments ahead of
    lines with octal numbers, while ...<br>
    <br>
    <blockquote type="cite">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index aa2c61c433b3..c5e3341c6316 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
         if ( !instr_modrm )
             return emul_len;
 
-        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &amp;&amp;
-             (modrm_reg &amp; 7) == MASK_EXTR(instr_modrm, 0070) &amp;&amp;
-             (modrm_rm  &amp; 7) == MASK_EXTR(instr_modrm, 0007) )
+        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &amp;&amp; /* SAF-2-safe */
+             (modrm_reg &amp; 7) == MASK_EXTR(instr_modrm, 0070) &amp;&amp; /* SAF-2-safe */
+             (modrm_rm  &amp; 7) == MASK_EXTR(instr_modrm, 0007) )  /* SAF-2-safe */
             return emul_len;
     }</pre>
      </blockquote>
    </blockquote>
    <br>
    ... this has comments at the end of lines with octal numbers.<br>
    <br>
    So which is it?<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------mGradkmxElIXCPeEscQw9VOP--


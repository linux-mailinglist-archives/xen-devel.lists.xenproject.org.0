Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F99AB2054
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 01:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980538.1367075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDXQH-0000ON-Au; Fri, 09 May 2025 23:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980538.1367075; Fri, 09 May 2025 23:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDXQH-0000LX-85; Fri, 09 May 2025 23:46:33 +0000
Received: by outflank-mailman (input) for mailman id 980538;
 Fri, 09 May 2025 23:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDXQF-0000LR-Qy
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 23:46:31 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4fef3b3-2d2f-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 01:46:31 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso27539065e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 16:46:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm86866955e9.39.2025.05.09.16.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 16:46:30 -0700 (PDT)
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
X-Inumbo-ID: d4fef3b3-2d2f-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746834390; x=1747439190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AzTEoxE9eD7tVfQPW14WwTZ0Djka5W2LriqmxdoQyfg=;
        b=SqSD4FITkaXHxZ2+WF+Av1rJjMCn2mXM9EEPmkEW/u4CNtORLEhsTdrFzr07PWboWU
         4SX0vcWeT3F1IXceaPE9h2u4SByNcsK+HfTFRLNsGW66kp/5Y+seVqcQg5M/OphWv4/a
         6A91UY2XNHxMRsm2gUQLuu0QjqIGkUGyDKtt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746834390; x=1747439190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzTEoxE9eD7tVfQPW14WwTZ0Djka5W2LriqmxdoQyfg=;
        b=Cy9mVqU+OWfQZ8+8chNM0NNJSbtIoWiLNdqjTpkrV26XGyJx09YkAn4HuFOaDEIrkh
         iNgjkAYuIZBryjMFYWtYOzVBYudh0ltzORZxjDuu/QhZWuHp4HkqLVsCAc5wvVpMh5QD
         H4xhb3pvu/6DRN88MFWc74wJN+KFnmUliDtIYyJaeqp0ugJHVC/lw0XsZ5gkEG1uaPaL
         qf+ZJywS/vHSGNTTDecbvLTVbF071HRSJgMECs8zmnhWWfuOVtkOxVb2Z0nzEGszbmIr
         VrjsNtvXhWbkZYKdIzJwuxSlEVohx05nn7pQYOzhr4V5ehdK+2buwoivVV8DKW7g0ZNG
         tNpA==
X-Forwarded-Encrypted: i=1; AJvYcCUFTquaXDkeweYX7o7Zftwo6HgQWejGI8GWSgpPLl9zt0hjobytRdRS3TN9gOIStVuq3PvVwdzxTCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziqSb4aSCcZKf5QIqQRgGu1y/lkFp4c5sy0wT3gGzPmgte6KCp
	hciyUauKoaxok68Od8s+k0OiX7j0mJteWNN4NNRN2h/EvS38k7qNv4Pd+v/AQpk=
X-Gm-Gg: ASbGncuwXabEOwvCqK6Jl/DtI0uLxXlJ+uxUBeHu25n+4WeiKFXnJuKDTCiB45rc0V6
	cplG7Wsez8wEQv+tp/3cjPpT3V2/TD7TwzJU/FN0ED1Da4EugKvSMKMGl7LKjAlt9XSpBtqi10i
	lomMMMgDFKY+Z+1wr7hwrdiNCq783Jh1MAI4o/Qck/g4GwBhatVJHEFxRWOocIhPPcRH0eNq+vk
	OMa00pVyms8EMsWLD9YSWo/6u2DTwyLBMolNG5k6Q60T7SWG4I6AvODOOSvUv1D1bcUfADsJyUQ
	xy0z0k5ufYFxYvrrjyRitjHx5MsZ/lxbTygPAOm7a7eaNF1RVw1o3nuuFPC0/NNZ/qhFlX8i9bW
	v7RBOjwhPQ8HXlbVE8tZumdukUGI=
X-Google-Smtp-Source: AGHT+IGwM6KhKJEJ1+Tt7faTOPl6uXUm9FjGeX2Dpg3CwrlFV8sfdAxRYP9iV6wEuaUwt+ESzWy6Jw==
X-Received: by 2002:a05:600c:6487:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-442d6d516efmr48458015e9.19.1746834390394;
        Fri, 09 May 2025 16:46:30 -0700 (PDT)
Message-ID: <82b13a72-5b14-4e3c-ad98-fff1e13308ab@citrix.com>
Date: Sat, 10 May 2025 00:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] x86: x86_emulate: address violation of MISRA C
 Rule 13.2
To: victorm.lira@amd.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2025 11:46 pm, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>
> Rule 13.2 states: "The value of an expression and its persistent
> side effects shall be the same under all permitted evaluation orders".
>
> The full expansion of macro "commit_far_branch" contains an assignment to
> variable "rc", which is also assigned to the result of the GNU statement
> expression which "commit_far_branch" expands to.
>
> To avoid any dependence on the order of evaluation, the latter assignment
> is moved inside the macro.

The (mostly expanded) and reformatted expression is:

> if ( (rc = load_seg(x86_seg_cs, src.val, 1, &cs, ctxt, ops)) ||
>      (rc = ({
>              ({
>                  if ( sizeof(dst.val) <= 4 )
>                  {
>                      do {
>                          if ( __builtin_expect(!!(!(!ctxt->lma)),0) )
>                              ASSERT();
>                      } while ( 0 );
>                      ({
>                          if ( ((dst.val) > (&cs)->limit) )
>                          {
>                              x86_emul_hw_exception(13, mkec(13, 0, 0), ctxt);
>                              rc = 2;
>                              goto done;
>                          }
>                      });
>                  }
>                  else
>                      ({
>                          if ( (ctxt->lma && (&cs)->l
>                                ? !(((long)(dst.val) >> 47) == ((long)(dst.val) >> 63))
>                                : (dst.val) > (&cs)->limit) )
>                          {
>                              x86_emul_hw_exception(13, mkec(13, 0, 0), ctxt);
>                              rc = 2;
>                              goto done;
>                          }
>                      });
>              });
>              _regs.rip = (dst.val);
>              singlestep = _regs.eflags & 0x00000100;
>              ops->write_segment(x86_seg_cs, &cs, ctxt);
>          })) )

And I can't identify anywhere where there is an ambiguous order of
evaluation.

The problem with this patch is that, while the existing logic is not
exactly great, ...

> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index 8e14ebb35b..7108fe7b30 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -337,7 +337,7 @@ do {                                                                    \
>      validate_far_branch(cs, newip);                                     \
>      _regs.r(ip) = (newip);                                              \
>      singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
> -    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
> +    rc = ops->write_segment(x86_seg_cs, cs, ctxt);                      \
>  })
>
>  int x86emul_get_fpu(
> @@ -2382,7 +2382,7 @@ x86_emulate(
>               (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes + src.val),
>                                &src.val, op_bytes, ctxt, ops)) ||
>               (rc = load_seg(x86_seg_cs, src.val, 1, &cs, ctxt, ops)) ||
> -             (rc = commit_far_branch(&cs, dst.val)) )
> +             commit_far_branch(&cs, dst.val) )
>              goto done;

... this is breaking a visual layout pattern where you can always see
the update to rc beside the "goto done".

This code is complicated enough without making it harder.

One option which might work is this:

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c
b/xen/arch/x86/x86_emulate/x86_emulate.c
index 3350303f8634..dab4373ece1e 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -333,12 +333,14 @@ do
{                                                                    \
                               : (ip) > (cs)->limit, X86_EXC_GP, 0);     \
 })
 
-#define commit_far_branch(cs, newip) ({                                 \
-    validate_far_branch(cs, newip);                                     \
-    _regs.r(ip) = (newip);                                              \
-    singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
-    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
-})
+#define commit_far_branch(cs, newip) (                                  \
+        ({                                                              \
+            validate_far_branch(cs, newip);                             \
+            _regs.r(ip) = (newip);                                      \
+            singlestep = _regs.eflags & X86_EFLAGS_TF;                  \
+        }),                                                             \
+        ops->write_segment(x86_seg_cs, cs, ctxt)                        \
+    )
 
 int x86emul_get_fpu(
     enum x86_emulate_fpu_type type,


This rearranges commit_far_branch() to use the comma operator, but
maintains the previous property that it's still overall an assignment to rc.

However, I don't have much confidence that Eclair is going to like it more.

~Andrew


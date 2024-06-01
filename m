Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E108D7197
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 20:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734304.1140490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDToT-0000T9-Ux; Sat, 01 Jun 2024 18:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734304.1140490; Sat, 01 Jun 2024 18:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDToT-0000Qb-SO; Sat, 01 Jun 2024 18:50:45 +0000
Received: by outflank-mailman (input) for mailman id 734304;
 Sat, 01 Jun 2024 18:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKEA=ND=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sDToR-0000QV-RJ
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 18:50:43 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7df33ec-2047-11ef-b4bb-af5377834399;
 Sat, 01 Jun 2024 20:50:41 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-43fc2ad049aso17966661cf.3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jun 2024 11:50:41 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43ff23a1774sm21231491cf.11.2024.06.01.11.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jun 2024 11:50:38 -0700 (PDT)
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
X-Inumbo-ID: d7df33ec-2047-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717267839; x=1717872639; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQSShu5GxLPHIpCDN9m0CmfiigJxy5okrqlnR5CvZiA=;
        b=dy/euO0rG78NNECVBCJ94vgYwftZOrkhAfMO2oP0mlfVjyvH7PuK/fuk4rB8LmhonM
         x9oe3a8IWi7+ZoU+DsbUVwdMZDT9ne1xMl8MpTZM85OUIZUvNXk3F58/8iazLAuWoBIr
         t37F6Fcan/88N6Jtk+lcgyuallt2+wd2BU1oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717267839; x=1717872639;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQSShu5GxLPHIpCDN9m0CmfiigJxy5okrqlnR5CvZiA=;
        b=h0NacXeYXIv8OdP92q8KuK9kCXfbmtmzLlGgZlVEOJcTwyc6hb6SlLWUwCD3e60/U2
         cifZOUBa5BKn0VP4IJWSq7C3jAILTO6ICJO+lHnwevTHNtIYtgVWtviZ7qQS7FUDrvUa
         MTFxW2vqzOStSWmZvMsRX/ElBix8ID5bqepozjhz12dBPiLB9McMyb3RH7AAMw1C7IC1
         wHiVK/og/5ZnbcP3YR//elkejeOW49tpr+9grlk6n3aHbxnHNlK/4sv0XfRuaH3h0wig
         7azTphKjwqu1TkoaeldA5nvsLM5H1mjG9wvUzcSkLcwhVQuDE20Ish1BStYSWAKdYW8t
         dxoA==
X-Gm-Message-State: AOJu0Yy87GkD4UShh97upXnA5beuve8iGSZ442Q93BbtMHnQFV3SL/nF
	fq1I648Fld7+q4C2pCYIYTGzjqJkJZikUQeUTyzHijwoj1VXc4th8WxOhu6oYfttEmTt17sqs56
	x
X-Google-Smtp-Source: AGHT+IEBCtpYJlMNcECJhXNfmhU1deFeKmww44th3qp4Zu2R21F4tCx8fTKcF4G/5ClGyp5HqLZgzg==
X-Received: by 2002:ac8:5f46:0:b0:43a:eac7:cfff with SMTP id d75a77b69052e-43ff54ff734mr52452491cf.41.1717267839151;
        Sat, 01 Jun 2024 11:50:39 -0700 (PDT)
Message-ID: <3bb4e3fa-376b-4641-824d-61864b4e1e8e@citrix.com>
Date: Sat, 1 Jun 2024 19:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: vcpumask_to_pcpumask() case study
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One of the followon items I had from the bitops clean-up is this:

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 648d6dd475ba..9c3a017606ed 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3425,7 +3425,7 @@ static int vcpumask_to_pcpumask(
             unsigned int cpu;
 
             vcpu_id = ffsl(vmask) - 1;
-            vmask &= ~(1UL << vcpu_id);
+            vmask &= vmask - 1;
             vcpu_id += vcpu_bias;
             if ( (vcpu_id >= d->max_vcpus) )
                 return 0;

which yields the following improvement:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-34 (-34)
  Function                                     old     new   delta
  vcpumask_to_pcpumask                         519     485     -34


While I (the programmer) can reason the two expressions are equivalent,
the compiler can't, so we really are saving a SHL to re-calculate (1 <<
vcpu_id) and swapping it for a LEA -1(vmask) which happens to be hoisted
above the ffsl() call.

However, the majority of the savings came from the fact that the old
code used to hold 1 in %r15 (across the entire function!) so it could
calculate (1 << vcpu_id) on each loop iteration.  With %r15 now free for
other use, we one fewer thing spilt to the stack.

Anyway - while it goes to show that while/ffs logic should be extra
careful to use x &= x - 1 for it's loop condition logic, that's not all.

The rest of this function is crazy.  We're reading a guest-word at a
time in order to make a d->max_vcpus sized bitmap (with a reasonable
amount of opencoded logic to reassemble the fragments back into a vcpu
number).

PVH dom0 can reach here, and because it's not pv32, will be deemed to
have a guest word size of 64.  Also, word-at-time for any HVM guest is
an insane overhead in terms of the pagewalks behind the copy_from_hvm()
infrastructure.

Instead, we should calculate the size of the bitmap at
DIV_ROUND_UP(d->max_vcpus, 8), copy the bitmap in one whole go, and then
just have a single for_each_set_bit() looping over it.  Importantly this
avoids needing to know or care about the guest word size.

This removes 4 of the 6 hiding lfences; the pair for calculating
is_native to start with, and then one of the two pairs behind the use of
is_native to select the type of the access.

The only complications is this:  Right now, PV max vCPUS is 8k, so we
could even get away with this being an on-stack bitmap.  However, the
vast majority of PV guests small and a 64-bit bitmap would do fine.

But, given this is just one example, wouldn't it be better if we just
unconditionally had a marshalling buffer for hypercalls?  There's the
XLAT area but it doesn't exist PV64, and we've got various other pieces
of scratch per-cpu data.

If not, having a 128/256-bit bitmap on the stack will still be good
enough in practice, but still ok at amortising the PVH dom0 costs.

Thoughts?

~Andrew



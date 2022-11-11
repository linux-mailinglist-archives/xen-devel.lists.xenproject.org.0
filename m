Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC7625E3E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 16:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442644.697027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVqi-0007HC-E2; Fri, 11 Nov 2022 15:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442644.697027; Fri, 11 Nov 2022 15:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVqi-0007Dm-BN; Fri, 11 Nov 2022 15:21:44 +0000
Received: by outflank-mailman (input) for mailman id 442644;
 Fri, 11 Nov 2022 15:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1aq=3L=redhat.com=vkuznets@srs-se1.protection.inumbo.net>)
 id 1otVqg-0007Dg-Jt
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 15:21:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a1e7511-61d4-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 16:21:40 +0100 (CET)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-jt7WmHpEMculnadCQ5nRdg-1; Fri, 11 Nov 2022 10:21:38 -0500
Received: by mail-qv1-f71.google.com with SMTP id
 do17-20020a056214097100b004c6183e6ce4so2061017qvb.11
 for <xen-devel@lists.xenproject.org>; Fri, 11 Nov 2022 07:21:38 -0800 (PST)
Received: from ovpn-194-83.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020ae9e10a000000b006fa4cac54a5sm1505749qkm.72.2022.11.11.07.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 07:21:33 -0800 (PST)
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
X-Inumbo-ID: 8a1e7511-61d4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668180099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/2KUIcNea2iSiMMtPiiwN4PyC8vWPzRYRSCfguAA+4=;
	b=OiZTfLLH3s+wVl7cdae38GXXvw8WavqSCGFV65snoTCmuXdb3a5FUi7wDMhmHVgLYCtxhn
	FbCobhNG8OGwxTPQFJiVQylU0gVvnKir5zju4Rh6XtdMuL1336XywmstFr2tBBextJM+H+
	2fzZ8AsqnNqXxm6IBbF5jBuKqmWIHLA=
X-MC-Unique: jt7WmHpEMculnadCQ5nRdg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/2KUIcNea2iSiMMtPiiwN4PyC8vWPzRYRSCfguAA+4=;
        b=zU/SKBFSPPsD0/797VTafRkof7jLUNB2GW+gW7APwauR/kVeR0oQ0mlHlAx+PQ7irM
         AlIeft6RLfz1bGJNLa0boLMAPqjIuqgZqk9VVi1SQidMW96hT9tGx0dTe4M9mOTeOvVU
         ZvMi/AAb8crDnepRmhA3/Wpj7Aone3IW32nssodOjyDSgJzWV3HLFS820QKSDbsMmsFf
         DGwiaqsVEcgNjzPWdyfQR/bmLgggpulB8yNT0KK+LgcHRT7q/B8enToyGTJ3lsFvep/Q
         soHCndtBSE2uXTh+4r5XlMCiOQowSxRPuM1h9zQPr3N8o3M3COUEAjgcSXmCAOQHTGm1
         Q+Ag==
X-Gm-Message-State: ANoB5plabXDrl/4KxXqnqJzkNK0HMWDobz09+w49SznxMBYurnPLveEd
	OPfH8EKN45zu5GGZ8qmJl03GdRVguWa03AXpbPMqlPYzbj5gFOXRjhaI1DdmE8kd4FxKgeDG1al
	sd0yqg32sHA8x3QeyfBPaReiBJJM=
X-Received: by 2002:a37:a809:0:b0:6fa:1e46:291b with SMTP id r9-20020a37a809000000b006fa1e46291bmr1465831qke.494.1668180094471;
        Fri, 11 Nov 2022 07:21:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4obT3Iyq7MtRwR9wMVvHN14BtAVf2chkJjW7Rv7zzWBQO/nMTwoZWfZ6eZpZKrZsTfLu+riQ==
X-Received: by 2002:a37:a809:0:b0:6fa:1e46:291b with SMTP id r9-20020a37a809000000b006fa1e46291bmr1465801qke.494.1668180094202;
        Fri, 11 Nov 2022 07:21:34 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Alexander Potapenko <glider@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Juergen Gross <jgross@suse.com>,
 srivatsa@csail.mit.edu
Subject: Re: Making KMSAN compatible with paravirtualization
In-Reply-To: <CAG_fn=W0vXvFrQdRhZiCriz7JjM+zLzKQY+z36j+UqPYnsmq_Q@mail.gmail.com>
References: <CAG_fn=W0vXvFrQdRhZiCriz7JjM+zLzKQY+z36j+UqPYnsmq_Q@mail.gmail.com>
Date: Fri, 11 Nov 2022 16:21:30 +0100
Message-ID: <875yflo6th.fsf@ovpn-194-83.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Alexander Potapenko <glider@google.com> writes:

> Hi,
>
> While investigating KMSAN's incompatibilities with the default Ubuntu
> config (https://github.com/google/kmsan/issues/89#issuecomment-1310702949),
> I figured out that a kernel won't boot with both CONFIG_KMSAN=y and
> CONFIG_XEN_PV=y.
>
> In particular, it may crash in load_percpu_segment():
>
>         __loadsegment_simple(gs, 0);
>         wrmsrl(MSR_GS_BASE, cpu_kernelmode_gs_base(cpu));
>
> Here the value of %gs between __loadsegment_simple() and wrmsrl() is
> zero, so when KMSAN's __msan_get_context_state() instrumentation
> function is called before the actual WRMSR instruction is performed,
> it will attempt to access percpu data and crash.
>
> Unless instructed otherwise (by noinstr or __no_sanitize_memory on the
> source level, or by KMSAN_SANITIZE := n on the Makefile level), KMSAN
> inserts instrumentation at function prologue for every non-inlined
> function, including native_write_msr().
>
> Marking native_write_msr() noinstr actually makes the kernel boot for
> me, but I am not sure if this is enough. In fact we'll need to fix
> every situation in which instrumentation code may be called with
> invalid %gs value. Do you think this is feasible? Overall, should we
> care about KMSAN working with paravirtualization?

I think XEN PV is really special, let's Cc: xen-devel@ first.

-- 
Vitaly



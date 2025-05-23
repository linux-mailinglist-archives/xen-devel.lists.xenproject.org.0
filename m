Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48112AC2514
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 16:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995818.1377986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uITSw-0006Js-4t; Fri, 23 May 2025 14:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995818.1377986; Fri, 23 May 2025 14:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uITSw-0006I5-1I; Fri, 23 May 2025 14:33:42 +0000
Received: by outflank-mailman (input) for mailman id 995818;
 Fri, 23 May 2025 14:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4aiS=YH=flex--seanjc.bounces.google.com=3QIcwaAYKCVkJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@srs-se1.protection.inumbo.net>)
 id 1uITSt-0006Hz-QF
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 14:33:39 +0000
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [2607:f8b0:4864:20::54a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e10396-37e2-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 16:33:38 +0200 (CEST)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-b26e4fe0c08so5576687a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 07:33:38 -0700 (PDT)
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
X-Inumbo-ID: e9e10396-37e2-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748010817; x=1748615617; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uvu6aXDIrLF08vsxpzyNfXk0GOFzmWSaZdsX/BEX7c=;
        b=2FoHgpKqd4XgsPJLmFoMnyWQrnLjU1898pRbBgOkjlb9qiCpc1CnQSDP3tZ3JFv8XO
         bfr0bQNBcJcW30H+tu1IQkI/4ElEFugvKqUTeLaZSShhH04e+9YQII0NQIu3Hl7x0zdL
         6FGRs3cdcORoJiGtg2iGDaFAaymCFyd3VbI6mFXcl87E0M5wb6nxl/N/Apy9DLCvx6F4
         dpC1Rc51mBAgUO3TMAJ9igHcKuIfs2z39ltyaIBo7Alq1cJAHuQqje0djMsw8EJHOrhr
         xDK6CvgaUEob5nNVkmqXlAg6ZrvxjybYVk9YBuJgag79XrJhF4/SeQgz7VKX2fd6QghK
         lU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010817; x=1748615617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uvu6aXDIrLF08vsxpzyNfXk0GOFzmWSaZdsX/BEX7c=;
        b=xDOrvjDbWLSkuHMXRYe6bU0/3H3eLLDP7jD4Jdiyb7DWA3AxrbX5l4hKWF9J3g62N5
         bYdBnrejE2oWms671leJPJPkt5MAaLV3xXCOIilbDPzZb7l6Y3ZTm+eNMtAL9QhhAx7G
         w+xmjPpfUf5jx4h0T6wi5a12Z+CI+rMvIOGZeiBHPCyEKf2VT39Wi6bpkyRMsJGxQUQi
         8u0Yjde8NjCGNJh7aobA8B61zh3eSFOA/J/yQ8xo3S93o00d7Cn6Ktmao5fKKKrG12e/
         8bCLrHx07M71lCZpFZUlluVhQW6Ko98BjrVQPg5RkFWYwijcUC1FZfViE1jd2vtZuBU6
         rzFg==
X-Forwarded-Encrypted: i=1; AJvYcCUmd8+tnwW0ud+c79VPfUxWkbjd5rAsyuLdDk1JdYC2EwczO7KZDtmVRwymOdAsQ9r38epPldmRHDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoF38FXYIaZ+p/ttRT1jn8xpOEp5YZoXAMtfosTVJZm0wACMWh
	caM1+08mbWltql7wtqV/x5yzWsdv4DQDXWnaFIM+BRSoYBGcHEQsOzOjXorod2NRb2O9nLYNRTj
	a4X6tFQ==
X-Google-Smtp-Source: AGHT+IHsZ0QnOLBFT5oLqgFlsou+V6RqzdnkAMpT1uyTVqCC/FSYHIecluEf4Yy5p3wiVYxCHPutaUGV15c=
X-Received: from pjbmf7.prod.google.com ([2002:a17:90b:1847:b0:30e:7b26:f68b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1846:b0:301:9f62:a944
 with SMTP id 98e67ed59e1d1-30e7d5ca287mr50858908a91.33.1748010816755; Fri, 23
 May 2025 07:33:36 -0700 (PDT)
Date: Fri, 23 May 2025 07:33:30 -0700
In-Reply-To: <2c52daad-0b64-48a9-8e73-d1aba977993b@amd.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com> <20250522235223.3178519-14-seanjc@google.com>
 <2c52daad-0b64-48a9-8e73-d1aba977993b@amd.com>
Message-ID: <aDB-2lcq4jJm9-OV@google.com>
Subject: Re: [PATCH v3 13/13] KVM: selftests: Add a KVM_IRQFD test to verify
 uniqueness requirements
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 23, 2025, Sairaj Kodilkar wrote:
> On 5/23/2025 5:22 AM, Sean Christopherson wrote:
> 
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	pthread_t racing_thread;
> > +	int r, i;
> > +
> > +	/* Create "full" VMs, as KVM_IRQFD requires an in-kernel IRQ chip. */
> > +	vm1 = vm_create(1);
> > +	vm2 = vm_create(1);
> > +
> > +	WRITE_ONCE(__eventfd, kvm_new_eventfd());
> > +
> > +	kvm_irqfd(vm1, 10, __eventfd, 0);
> > +
> > +	r = __kvm_irqfd(vm1, 11, __eventfd, 0);
> > +	TEST_ASSERT(r && errno == EBUSY,
> > +		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
> > +
> > +	r = __kvm_irqfd(vm2, 12, __eventfd, 0);
> > +	TEST_ASSERT(r && errno == EBUSY,
> > +		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
> > +
> > +	kvm_irqfd(vm1, 11, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 12, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 13, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> > +	kvm_irqfd(vm1, 14, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
> 
> Hi Sean,
> I dont see any allocation for the GSI 13 and 14..
> Is there any reason for the deassigning these two GSIs ?

Yes, KVM's rather bizarre ABI is that DEASSIGN is allowed even if the VM doesn't
have a corresponding assigned irqfd.  The reason I added these early DEASSIGN
calls is so that there will be an easier-to-debug failure if KVM's behavior
changes (the racing threads part of the test abuses KVM's ABI).  I didn't add a
comment because the helpers already have comments, but looking at this again, I
agree that main() needs a better comment.


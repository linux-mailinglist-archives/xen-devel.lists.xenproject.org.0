Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F7944B971
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 00:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224159.387281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaor-00019S-2D; Tue, 09 Nov 2021 23:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224159.387281; Tue, 09 Nov 2021 23:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkaoq-00017J-VF; Tue, 09 Nov 2021 23:46:24 +0000
Received: by outflank-mailman (input) for mailman id 224159;
 Tue, 09 Nov 2021 23:46:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j19n=P4=google.com=seanjc@srs-se1.protection.inumbo.net>)
 id 1mkaop-00017D-2s
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 23:46:23 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d82c237-41b7-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 00:46:22 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id m14so911649pfc.9
 for <xen-devel@lists.xenproject.org>; Tue, 09 Nov 2021 15:46:21 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id y130sm14619421pfg.202.2021.11.09.15.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 15:46:19 -0800 (PST)
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
X-Inumbo-ID: 3d82c237-41b7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6chuTYfgRvTDMG+7/4r5PAEJkXMffm8xsv4fOhQYrHg=;
        b=padV+5xbNxU2BtdwvYLqgobnJgC7jdztrJVhn7K2+WlRuLp3u+7Em538emsInI8ZW0
         EzZn9v91Us4jfHf9Lmmw5fjJNJZXyPueYr0bLHlmaEwNiw9/mnseW7q3iUQMF0MSrqY7
         fh/rdp+bFUiYM2Q6wMsioJo1q+LB3h94uhn4IoA8l8Oi2FnmukHc/WcnpMyQdwGZgNcX
         quegTOwOZXl16pimaWjp8HrU55UW3cRaxZ+73lXvIy+5zw7YWqG84GnZJq4QA8qj+lfZ
         30vSgeoxKWa3Pm11ldKt4T1NH7NtZdcF3NNQhyDYYMuoCBmAmEhAxO9jY6+vIZP5JAti
         sSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6chuTYfgRvTDMG+7/4r5PAEJkXMffm8xsv4fOhQYrHg=;
        b=FSFWG4aZytMLd/nOHXqEP+D0t8CGH/cb1fgahjcrqWTdX5pGLUK/c77NZ9X2xJZRO4
         +gO1lRJiKZSeca2yIMLI4N6LaA/3j44pX2ZZX2I2OLeWsNGgcwoLBHR1wP1IBxZXtHGX
         GrewsfKcvxv46HFMG2UQDqA3QUvgRhpDtLz6KAt9C/7CeLbvQFY09SYAnRwyObHeLUu4
         FgaieI3NXnSSPF8qolpeV9432IFDSVHcKGc2WVrw0z6ESJt1at8jncEEy1g4uID8HFAN
         9WAUUpBWwxZdIC/xoamvKcp8VH2LxJ5SFTWBZcleZwGmVSg8IV9myGk3mOIQCXuo+d19
         k3Ew==
X-Gm-Message-State: AOAM530G0lVATLdtmTBC+X1YIVufpN5EUDVwVZyVfVCZAt8a4OLENflb
	zjc8qB4suERoValSuPYT8AzrGg==
X-Google-Smtp-Source: ABdhPJwm4B0oaMVW7WsgOG0J14c3t+T/mSfRgwMmqW6RiSnYPS/pCOwWjFlWP8+tiDx9Ql84OwTCuA==
X-Received: by 2002:a65:6a47:: with SMTP id o7mr8900284pgu.439.1636501580110;
        Tue, 09 Nov 2021 15:46:20 -0800 (PST)
Date: Tue, 9 Nov 2021 23:46:15 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v3 08/16] perf: Force architectures to opt-in to guest
 callbacks
Message-ID: <YYsIR/yEYm2nAz/p@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-9-seanjc@google.com>
 <f2ad98e2-ddfb-c688-65af-7ecbd8bc3b3d@redhat.com>
 <YUtCWOYJwCUYDYtW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUtCWOYJwCUYDYtW@google.com>

On Wed, Sep 22, 2021, Sean Christopherson wrote:
> On Wed, Sep 22, 2021, Paolo Bonzini wrote:
> > On 22/09/21 02:05, Sean Christopherson wrote:
> > > @@ -1273,6 +1274,11 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
> > >   }
> > >   extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> > >   extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> > > +#else
> > > +static inline unsigned int perf_guest_state(void)		 { return 0; }
> > > +static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
> > > +static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
> > > +#endif /* CONFIG_GUEST_PERF_EVENTS */
> > 
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > 
> > Having perf_guest_handle_intel_pt_intr in generic code is a bit off.  Of
> > course it has to be in the struct, but the wrapper might be placed in
> > arch/x86/include/asm/perf_event.h as well (applies to patch 7 as well).
> 
> Yeah, I went with this option purely to keep everything bundled together.  I have
> no strong opinion.

Scratch, that, I do have an opinion.  perf_guest_handle_intel_pt_intr() is in
common code because the callbacks themselves and perf_get_guest_cbs() are defined
in linux/perf_event.h, _after_ asm/perf_event.h is included.

arch/x86/include/asm/perf_event.h is quite bereft of includes, so there's no
obvious landing spot for those two things, and adding a new header seems like
overkill.


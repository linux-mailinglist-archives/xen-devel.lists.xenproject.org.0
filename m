Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE74141DB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 08:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192151.342445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvl0-0001a1-EJ; Wed, 22 Sep 2021 06:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192151.342445; Wed, 22 Sep 2021 06:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvl0-0001X6-As; Wed, 22 Sep 2021 06:29:26 +0000
Received: by outflank-mailman (input) for mailman id 192151;
 Wed, 22 Sep 2021 06:29:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybNQ=OM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSvky-0001Sc-OR
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 06:29:24 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f891e790-5375-4533-b9e4-3427f57cdc13;
 Wed, 22 Sep 2021 06:29:23 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-4tPbb6voMQGrgd5LJjbOyw-1; Wed, 22 Sep 2021 02:29:22 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so1107656wrt.21
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 23:29:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n26sm4980232wmi.43.2021.09.21.23.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:29:20 -0700 (PDT)
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
X-Inumbo-ID: f891e790-5375-4533-b9e4-3427f57cdc13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632292163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/tHH9wLLtazV94QpN+BmGuu66vagS3lkpjDcUcpVzA=;
	b=PGPf9ZzB33LZyiZilg2aozwZm5TDj5p0O5vz/gJCSjvz+UFxd649DuOMY96TZ0C7Yhswar
	Jo7WK7EKH7drHXehvlque90NgI8miKqAqdhI8I3mYPRJ1+VBPU59VAOBjhjFTrRdyNQnyy
	WXSIXoeyFvkhHyhwswuM+UhVvVnYRvw=
X-MC-Unique: 4tPbb6voMQGrgd5LJjbOyw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E/tHH9wLLtazV94QpN+BmGuu66vagS3lkpjDcUcpVzA=;
        b=b1kBC0hcAgzTMWCAKT1GlpBxEV0XGv/EqJ13OcCH4F7p8HDl4G0txW4pMePOWuu3Qz
         pbbT6s5wSt+T7qWQBVPncjoJrxsuMH/f8U6p0TprzfftMb/g+0LiBZh7n2lyiH58B74X
         T53JV2F2wGtLJ1P92hpBYnziO+j3AmJjSlHLt3vKzSV9vLxvIGto3mPqYhTI7a2TOMyA
         htrsHB2+8Z4W+/jYQ7CwYx/I0Zj3DkAJEFZ0uGazzEJD/9mcgAWkLb0YpwJngdrGD1jj
         +J+5XTFvqcU6klZ2nrzzHqC+hPMkeK0ZHEHcD8k3DKw2XWOgo/He04VJvhd5ao2lrV8j
         azqg==
X-Gm-Message-State: AOAM531hl5tsGo+sVRSQ2R7Qy45os3xTps4MtfkGrBs2pZKE4L18NVM5
	LldDJypvfI1HNDAdVrRFHSDvAqkxYRQmSOk6JUvhGR/U40dZnukjRrF5XdnGXgpGhRBq8X3l/mE
	pPWr4Lc6qOTN/1ZMR2blZBGKMi1w=
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr39506109wrp.171.1632292161047;
        Tue, 21 Sep 2021 23:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhBqcw62XwXR9WbHiblbcM9n6+4WHbybrr5/MkhCq7T4dnVdh+qdYz2KsHuqdWFBJH3F6z5Q==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr39506073wrp.171.1632292160784;
        Tue, 21 Sep 2021 23:29:20 -0700 (PDT)
Subject: Re: [PATCH v3 16/16] perf: Drop guest callback (un)register stubs
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-17-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <74d2e94f-fbd3-522e-8fc5-da5a0a575838@redhat.com>
Date: Wed, 22 Sep 2021 08:29:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-17-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/21 02:05, Sean Christopherson wrote:
> Drop perf's stubs for (un)registering guest callbacks now that KVM
> registration of callbacks is hidden behind GUEST_PERF_EVENTS=y.  The only
> other user is x86 XEN_PV, and x86 unconditionally selects PERF_EVENTS.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   include/linux/perf_event.h | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index d582dfeb4e20..20327d1046bb 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1505,11 +1505,6 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
>   static inline void
>   perf_bp_event(struct perf_event *event, void *data)			{ }
>   
> -static inline void perf_register_guest_info_callbacks
> -(struct perf_guest_info_callbacks *cbs)					{ }
> -static inline void perf_unregister_guest_info_callbacks
> -(struct perf_guest_info_callbacks *cbs)					{ }
> -
>   static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
>   
>   typedef int (perf_ksymbol_get_name_f)(char *name, int name_len, void *data);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>



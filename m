Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750D5A9099
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 09:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396279.636368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTepT-0007o3-9j; Thu, 01 Sep 2022 07:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396279.636368; Thu, 01 Sep 2022 07:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTepT-0007lg-6u; Thu, 01 Sep 2022 07:41:35 +0000
Received: by outflank-mailman (input) for mailman id 396279;
 Thu, 01 Sep 2022 07:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cf3+=ZE=redhat.com=bristot@srs-se1.protection.inumbo.net>)
 id 1oTelB-0006uW-61
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 07:37:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0c24e2e-29c8-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 09:37:07 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-AEx0cldFPCGqgVkYkJxgAQ-1; Thu, 01 Sep 2022 03:37:02 -0400
Received: by mail-ej1-f70.google.com with SMTP id
 qf22-20020a1709077f1600b00741638c5f3cso5352653ejc.23
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 00:37:02 -0700 (PDT)
Received: from [192.168.0.198] (host-87-8-60-205.retail.telecomitalia.it.
 [87.8.60.205]) by smtp.gmail.com with ESMTPSA id
 u24-20020aa7d998000000b0043a61f6c389sm898086eds.4.2022.09.01.00.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 00:37:00 -0700 (PDT)
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
X-Inumbo-ID: e0c24e2e-29c8-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662017825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w/uTT8lnpogUVhwkYNDxdhGZzOyBXG3eWWImkgPiyoM=;
	b=U7yVPFohHFIyKhWjeD/a2FQMSEWaNaw1al34+kWnpCjsE8xHB0FjQFiRDLCyLVRvPuKYci
	Tl7ncjw8hAbtETyDdMGEBzMElgsOZ5CInRgP6qgC1VPIHKoh3sJomAFPgDOn1dzCXG30tI
	qACbc4Vs13n3W5g3iWCQqcwYlsKBNeM=
X-MC-Unique: AEx0cldFPCGqgVkYkJxgAQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=w/uTT8lnpogUVhwkYNDxdhGZzOyBXG3eWWImkgPiyoM=;
        b=iYFoMMK0HAgka1mEzT9S1P6wyKtfJN7t4xjN7QEDQq2G2YUfS5yaBXwB2JlbQXgIo8
         pO022JnkY5hhlb/s1n+QVuTEg5S5oYM/72zFzeHfHdm86bqDhgIpBZSkCl47BhsHIBoG
         SGTHJBsZuwh+minZJgXWev3npt9YyYG7qurHlzsz23JQJR5E3eEFWD6sdUu/UnV6zqoA
         eCpWg8up+UHJDqot1J23DAZPkXdTUilIs6LrTQEyAhFhHyrhQa+ETA47paCegTNSXBeY
         qbKGLTxkJwPJVtBKgzBU/nDZ/xxuagYrVatxi0Vo29cFaQhZdQ6GEeLT+xWZ/N2TPFeD
         +BeA==
X-Gm-Message-State: ACgBeo3BPwWEispbyasTV03RPClFEqF5U3K7v5GDvkrt0k+9rKC6+p2J
	7ufnYo+QWOUfBRL1z5qm3PeRqXfyvBL/Y5qs9Z+Mlf23G+O/pwVvYzeacZRZCuGgwfGGVOCe/6W
	A8ELbjpt2LKiWj98fH/RVRAfOfqQ=
X-Received: by 2002:aa7:d90e:0:b0:447:986d:b71e with SMTP id a14-20020aa7d90e000000b00447986db71emr27210707edr.235.1662017821491;
        Thu, 01 Sep 2022 00:37:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6JkW4ed1WqDsotybL6CAAiG40VbkLtzaIPBaAypGnjlWDX5j26Jhqen11PzZwUzZ8Rc1KOjQ==
X-Received: by 2002:aa7:d90e:0:b0:447:986d:b71e with SMTP id a14-20020aa7d90e000000b00447986db71emr27210669edr.235.1662017821253;
        Thu, 01 Sep 2022 00:37:01 -0700 (PDT)
Message-ID: <37a66a8d-859d-5a8b-e298-d0c32e2028e7@redhat.com>
Date: Thu, 1 Sep 2022 09:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Peter Zijlstra <peterz@infradead.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mel Gorman <mgorman@suse.de>, Suren Baghdasaryan <surenb@google.com>,
 akpm@linux-foundation.org, mhocko@suse.com, vbabka@suse.cz,
 hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
 willy@infradead.org, liam.howlett@oracle.com, void@manifault.com,
 juri.lelli@redhat.com, ldufour@linux.ibm.com, peterx@redhat.com,
 david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
 nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
 iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
 elver@google.com, dvyukov@google.com, shakeelb@google.com,
 songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com,
 rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
 kernel-team@android.com, linux-mm@kvack.org, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
 linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <20220831155941.q5umplytbx6offku@moria.home.lan>
 <YxBZv1pZ6N2vwcP3@hirez.programming.kicks-ass.net>
From: Daniel Bristot de Oliveira <bristot@redhat.com>
In-Reply-To: <YxBZv1pZ6N2vwcP3@hirez.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/22 09:05, Peter Zijlstra wrote:
>> Also, ftrace can drop events. Not really ideal if under system load your memory
>> accounting numbers start to drift.
> You could attach custom handlers to tracepoints. If you were to replace
> these unconditional code hooks of yours with tracepoints then you could
> conditionally (say at boot) register custom handlers that do the
> accounting you want.

That is strategy in RV (kernel/trace/rv/). It is in C, but I am also
adding support for monitors in bpf. The osnoise/timerlat tracers work this
way too, and they are enabled on Fedora/Red Hat/SUSE... production. They
will also be enabled in Ubuntu and Debian (the interwebs say).

The overhead of attaching code to tracepoints (or any "attachable thing") and
processing data in kernel is often lower than consuming it in user-space.
Obviously, when it is possible, e.g., when you respect locking rules, etc.

This paper (the basis for RV) shows a little comparison:
https://bristot.me/wp-content/uploads/2019/09/paper.pdf

By doing so, we also avoid problems of losing events... and you can also
generate other events from your attached code.

(It is also way easier to convince a maintainer to add a tracepoints or a trace
events than to add arbitrary code... ;-)

-- Daniel



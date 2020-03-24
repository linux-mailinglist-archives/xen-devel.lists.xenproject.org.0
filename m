Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80699190A55
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:12:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGgTl-0000Px-QD; Tue, 24 Mar 2020 10:08:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2LnZ=5J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGgTk-0000Ps-PW
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:08:12 +0000
X-Inumbo-ID: 5e333e6a-6db7-11ea-bec1-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e333e6a-6db7-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 10:08:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s1so20638620wrv.5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 03:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S7owupj8W2u371Wog5MnVvD9Vhjs1qBXbbgXbFzEWgE=;
 b=GsdJbaFUy3i7GICffmC33rzbJCZCiMnlnixyqRYn2KtG8OT9PPsYqnbqRvfaw18uor
 8ngQ9IHSYSJTPtmKuxmAJh+CXsRuHvfsMDbmenZwEIMIAfdQ5ClI89Dy4C6zcoIhCix+
 qoAtv5dW5Co1f3xPhT7rvsSMSY7O0pZimLT7J3MLh3gUvNkXnUdMuy3lPa/TGBMXEEfo
 BSOlfDyQo/1ecUw+ohLAZXSmww9kjlLS9CeJn5F37AQ/2KChnCRVTizUkTarTW/EzX9q
 hwcTNPbkH86z8YATJ2S6nMdiJTChGB6iQiTjVjxB2pea+eqI+hfd20wmED0ojgkhhlZc
 VDrQ==
X-Gm-Message-State: ANhLgQ36QO+mkX+aqDSZJuBNwxjlQFIqUMjgav2sYAvl/Z2emPOk+766
 oNjeU97CqY612/tNo7WdRJU=
X-Google-Smtp-Source: ADFU+vvKEiKOVSMGAS46JEvmW0nt/ONJnKyI3glki/cLRVZLmt1QSxFRAtb6lJFfBPtic6HizdlsLA==
X-Received: by 2002:a5d:550c:: with SMTP id b12mr19686244wrv.304.1585044491008; 
 Tue, 24 Mar 2020 03:08:11 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id p10sm23144548wrm.6.2020.03.24.03.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 03:08:10 -0700 (PDT)
To: David Woodhouse <dwmw2@infradead.org>, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>
 <20200319212150.2651419-1-dwmw2@infradead.org>
 <20200319212150.2651419-2-dwmw2@infradead.org>
 <004701d5febc$3632bfe0$a2983fa0$@xen.org>
 <45c147a12565cb1b0ca34217a8d66289a91ec35c.camel@infradead.org>
 <3018bb93-b79c-9182-30cc-364fb59ec2fd@xen.org>
 <d86994c7fa3bf73136d1caf4999181223d7bdf2c.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <8efd11af-7603-c823-62db-468f07a49790@xen.org>
Date: Tue, 24 Mar 2020 10:08:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d86994c7fa3bf73136d1caf4999181223d7bdf2c.camel@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce
 PGC_state_uninitialised
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, hongyxia@amazon.com,
 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi David,

On 23/03/2020 10:55, David Woodhouse wrote:
> On Mon, 2020-03-23 at 09:34 +0000, Julien Grall wrote:
>> For liveupdate, we will need a way to initialize a page but mark it as
>> already inuse (i.e in the same state as they would be if allocated
>> normally).
> 
> I am unconvinced of the veracity of this claim.
> 
> We don't want to turn specific details of the current Xen buddy
> allocator part into of the implicit ABI of live update. That goes for
> the power-of-two zone boundaries, amongst other things.

Why would you to do that? Marking the page as already used is no 
different to "PGC_state_unitialized" except the "struct page_info" and 
the internal of the buddy allocator would be properly setup for start 
rather than at free.

> 
> What if Xen receives LU state in which *all* pages in a given zone are
> marked as already in use? That's one of the cases in which we *really*
> want to pass through init_heap_pages() instead of just
> free_heap_pages(), in order to allocate the zone data structures for
> the first pages that get freed into that zone.
> 
> What if Xen starts to exclude more pages, like the exclusion at zero?
> 
> What if new Xen wants to exclude an additional page due to a hardware
> erratum? It can't take it away from existing domains (especially if
> there are assigned PCI devices) but it could be part of the vetting in
> init_heap_pages(), for example.

I don't think it would be safe to continue to run a guest using pages 
that were excluded for an HW erratum. It would be safer to not restart 
the domain (or replace the page) in the target Xen if that's hapenning.

> 
> My intent for PGC_state_uninitialised was to mark pages that haven't
> been through init_heap_pages(), whatever init_heap_pages() does in the
> current version of Xen.
> 
> The pages which are "already in use" because they're inherited through
> LU state should be in PGC_state_uninitialised, shouldn't they?

I think using "PGC_state_unitialised" for preserved page is an abuse. I 
understand this is existing in other part of Xen (particularly on x86), 
but I would rather not try to add more.

The PGC_state_unitialised may work for the current allocator because 
most of the fields are not going to be used after allocation. But it may 
not hold for any new allocator (I know the embedded folks are working on 
a new one).

> 
> Perhaps if there's a need for a helper, it could be a companion
> function to init_heap_pages() which would return a boolean saying,
> "nah, I didn't want to do anything to this page anyway", which could
> short-circuit it into the PGC_state_inuse state. But I'm not sure I see
> the need for such an optimisation.

I don't view it as an optimisation but as a way to avoid spreading the 
current misbehavior.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69D6B8FFE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509534.785448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1tF-0005dD-I2; Tue, 14 Mar 2023 10:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509534.785448; Tue, 14 Mar 2023 10:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1tF-0005aW-EM; Tue, 14 Mar 2023 10:28:21 +0000
Received: by outflank-mailman (input) for mailman id 509534;
 Tue, 14 Mar 2023 10:28:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8puR=7G=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pc1tD-0005aK-QA
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:28:19 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id effcd2db-c252-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 11:28:18 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id p16so9869421wmq.5
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 03:28:18 -0700 (PDT)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a7bc38e000000b003ed2b6da0d2sm1641181wmj.9.2023.03.14.03.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 03:28:17 -0700 (PDT)
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
X-Inumbo-ID: effcd2db-c252-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678789698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sRzKmk1xbHb3MknVY+gPdpMizh7lgWxaZRluitztog8=;
        b=HurPedIj8hIMluBGowPZzAM4noedo5b3fCa+nMkd+65cNmN3LcxBaVcjWKOI9zziwS
         1RGkGG3hJcDjpiJtR5IfH+WAFWEXD4tApyPFRA89AELES0yBUI4DUQlq3mwR/hlPEWTv
         w+CAlnCe35CeizA8a/zKJZnP9pjJTF8f9r2K1RzhW8bRsS0Nedd1vWbqXFwtE5JWKE8w
         CXKFYPlPzOWeELF/S3tEaLt4FV0iHtQGKg4kd52W5S445eEkZMc5QBmWXLQnhEYbX7ue
         dvA+D4WR52WveGuXzC5OxCqBOtOLfffLyQz6m4EoEYzMU/PCp+yizvrjYTVu1hEOJBVq
         Om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678789698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRzKmk1xbHb3MknVY+gPdpMizh7lgWxaZRluitztog8=;
        b=WzeclxZqp3aNg4p/K9d/r2ibtb/LdV4KK3Q2+6tuDEs0eHghDNi52vPHA1EAiXf1Sr
         M+e2aNwUvoKZPN3AAm0KU3VluTx+hG/7RKbPSr68evw6hBHA9bIHu5e1VrGDW16r1YxA
         NTvD/CDmfA2VVsHb6p7GJcmmYaB3JxyUgtMNAX76mOTzIO4ycHJcDYQUAByu5cNZyJYZ
         wcWVabpb6wE37VU14/edvi9sD2SWJucLr/rUbzqQau1ipJbGDirkQ5EEbf9NTGBxq18L
         wkoQl6jUn2fFghZr7iBQflSLWfBzAGjOAHJ+yEVrf/d5g/+b9p7HBizwIUc0gUNXZSPa
         V5CQ==
X-Gm-Message-State: AO0yUKV1aynW9vxHwettAq0Ek1T6uintPM2yyJh0Hv3BeN5pUkY8Ezb9
	42oQO52413vCPuCZnSB5QLPpR5tWd5XSnw==
X-Google-Smtp-Source: AK7set8EVgFGDByuMWOdSBeDdxiZ7jskXn0CVsBVwioLw4d5h6VsQFVUlOYCZqpLwPvEEllYB1tGtQ==
X-Received: by 2002:a1c:f213:0:b0:3ea:d611:f8 with SMTP id s19-20020a1cf213000000b003ead61100f8mr14699884wmc.38.1678789698147;
        Tue, 14 Mar 2023 03:28:18 -0700 (PDT)
Date: Tue, 14 Mar 2023 11:28:15 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to
 query vcpu statistics
Message-ID: <20230314102815.GA4225@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
 <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
 <20230308115410.GA1108824@horizon>
 <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>
 <20230309103825.GA1221165@horizon>
 <645fcd9a-755a-e2a2-f332-93c5e571b9e5@suse.com>
 <20230310105800.GA1285481@horizon>
 <84e0cf30-d4f6-b1d2-b99c-7a297f5c5c2c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84e0cf30-d4f6-b1d2-b99c-7a297f5c5c2c@suse.com>

On Fri, Mar 10, 2023 at 12:34:33PM +0100, Jan Beulich wrote:
> On 10.03.2023 11:58, Matias Ezequiel Vara Larsen wrote:
> > Oh, I see, thanks for the clarification. To summarise, these are the current
> > options:
> > 1. Use a "uint64_t" field thus limiting the number of counters to 64. The
> > current vcpu_runstate_info structure is limited to 4 counters though, one for
> > each RUNSTATE_*. 
> > 2. Use a dynamic array but this makes harder to use the interface.
> > 3. Eliminate stats_active and set to ~0 the actual stats value to mark inactive
> > counters. This requires adding a "nr_stats" field to know how many counters are.
> 
> While nr_stats can indeed be seen as a generalization of the earlier
> stats_active, I think it is possible to get away without, as long as
> padding fields also are filled with the "inactive" marker.
> 

Understood.

> > Also, this requires to make sure to saturate at 2^^64-2.
> 
> Thinking of it - considering overflowed counters inactive looks like a
> reasonable model to me as well (which would mean saturating at 2^^64-1).
> 
> > I might miss some details here but these are the options to evaluate. 
> > 
> > I would go with a variation of 1) by using two uint64_t, i.e., up to 128 vcpu's
> > counters, which I think it would be enough. I may be wrong.
> 
> Well, to me it doesn't matter whether it's 32, 64, or 128 - my concern
> is with any kind of inherent upper bound. Using 128 right away might
> look excessive, just like 32 might look too little. Hence my desire to
> get away without any built-in upper bound. IOW I continue to favor 3,
> irrespective of the presence or absence of nr_stats.
> 
I see. 3) layout would look like:

struct vcpu_shmem_stats {
#define VCPU_STATS_MAGIC 0xaabbccdd
    uint32_t magic;
    uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats), cacheline_size)
    uint32_t size;    // sizeof(vcpu_stats)
    uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
};

struct vcpu_stats {
    /*
     * If the least-significant bit of the seq number is set then an update
     * is in progress and the consumer must wait to read a consistent set of
     * values. This mechanism is similar to Linux's seqlock.
     */
    uint32_t seq;
    uint32 _pad;
    /*
     * If the most-significant bit of a counter is set then the counter
     * is inactive and the consumer must ignore its value. Note that this
     * could also indicate that the counter has overflowed.
     */
    uint64_t stats_a; // e.g., runstate_running_time
    ...
};

All padding fields shall be marked as "inactive". The consumer can't
distinguish inactive from overflowed. Also, the consumer shall always verify
before reading that:

offsetof(struct vcpu_stats, stats_y) < size. 

in case the consumer knows about a counter, e.g., stats_y, that Xen does not
it.

Matias 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E045A82BE19
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666718.1037538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOETA-0001xm-5O; Fri, 12 Jan 2024 10:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666718.1037538; Fri, 12 Jan 2024 10:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOETA-0001v0-2s; Fri, 12 Jan 2024 10:08:56 +0000
Received: by outflank-mailman (input) for mailman id 666718;
 Fri, 12 Jan 2024 10:08:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvc=IW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rOET7-0001uu-Uu
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:08:53 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 968b3dab-b132-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 11:08:52 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3376d424a79so4230435f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:08:52 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 e16-20020a5d65d0000000b003365951cef9sm3417296wrw.55.2024.01.12.02.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 02:08:52 -0800 (PST)
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
X-Inumbo-ID: 968b3dab-b132-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705054132; x=1705658932; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XC1nUnroBTR3MD1SKJe6TqIqJfhJyXvoLRJCpKfBaYY=;
        b=YY0tZ+Oy94ew+fVsJEK17Eaojc0n1KmwuEnZDaeYej8y57a6B/vrcm1qt3qOKvDAMz
         idQKI//EML8/9vSbpE1VfM3PRtLjsUQ2IFEVRtArzNlGxoRHFiq6dzipFAfWlygyYxI6
         gofGDDMN161iD1IMnyuYzeDcYYq8asdm8cXRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054132; x=1705658932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XC1nUnroBTR3MD1SKJe6TqIqJfhJyXvoLRJCpKfBaYY=;
        b=V9Ygna8bzJM0E220u1OKiu6B0f5VqNGkvXu8e/CTIPOvsI36rUwUDzl8UXafPAkSuw
         +VdRlzCIqkBl66kEoLK61eTdxE3YA5F6AVo2TuAwm14MK7Lm56YyeYAKM8yJaphkvIj0
         E++FQ0HjswuM5SN+AdQnlDS87NmtVcWNsqxI7N6dDXX2z1bsxfROxYKrP14L6WCDjmOF
         8k1bjDLIGVa1zxsYOcsn/JUU5CzRTvmEyPeD7KAJ1N7kYslJHL8oy6g//eGSDoDK1xTv
         3K4ePovwlSchj/9UoiGbCEGkB73vq4IPA8qAiWNqsbps/qJZAcbZjNuZLXrEn4MPMZ8M
         KsnA==
X-Gm-Message-State: AOJu0YyPnhMBTuTcvi5yO8gfWew6rYamO0mropteZqxvI5hnd9doWSvh
	dno7kO5s9vysPuVlhZpCnddnUDX7dnLRcA==
X-Google-Smtp-Source: AGHT+IEKqGXbLV6JwEo6LUq5DIIQhCtaRbE5wpDEdn14UpiyhE7VvGCn/JtmKxcRfksuCpWZqFta/Q==
X-Received: by 2002:a05:6000:400c:b0:333:3f5d:63d2 with SMTP id cp12-20020a056000400c00b003333f5d63d2mr689184wrb.3.1705054132354;
        Fri, 12 Jan 2024 02:08:52 -0800 (PST)
Date: Fri, 12 Jan 2024 11:08:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Message-ID: <ZaEPs5Y0SUgcOb3c@macbook>
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com>
 <ZZ_FjFa9mILtDZgv@macbook>
 <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com>
 <ZZ_di8pZB8bWtBuX@macbook>
 <b1e76a5f-297b-4030-a69e-33cdf179c0ce@suse.com>
 <ZZ_4HSvdg0R9Dv1Y@macbook>
 <4574c9d6-eb6d-4b73-a9e1-20b5635b32db@suse.com>
 <ZaAdEqHzbD8L_mRo@macbook>
 <b2412d90-e368-405f-813f-20a95f99ff21@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2412d90-e368-405f-813f-20a95f99ff21@suse.com>

On Fri, Jan 12, 2024 at 08:42:27AM +0100, Jan Beulich wrote:
> On 11.01.2024 17:53, Roger Pau Monné wrote:
> > On Thu, Jan 11, 2024 at 04:52:04PM +0100, Jan Beulich wrote:
> >> On 11.01.2024 15:15, Roger Pau Monné wrote:
> >>> On Thu, Jan 11, 2024 at 03:01:01PM +0100, Jan Beulich wrote:
> >>>> On 11.01.2024 13:22, Roger Pau Monné wrote:
> >>>>> Oh, indeed, can adjust on this same patch if that's OK (seeing as the
> >>>>> issue was already there previous to my change).
> >>>>
> >>>> Well, I'm getting the impression that it was deliberate there, i.e. set
> >>>> setting of the feature flag may want to remain thus constrained.
> >>>
> >>> Hm, I find it weird, but the original commit message doesn't help at
> >>> all.  Xen itself only uses PMC0, and I don't find any other
> >>> justification in the current code to require at least 2 counters in
> >>> order to expose arch performance monitoring to be present.
> >>>
> >>> Looking at the SDM vol3, the figures there only contain PMC0 and PMC1,
> >>> so someone only reading that manual might assume there must always be
> >>> 2 global PMCs?
> >>
> >> That may have been the impression at the time. It may have been wrong
> >> already back then, or ...
> >>
> >>> (vol4 clarifies the that the number of global PMCs is variable).
> >>
> >> ... it may have been clarified in the SDM later on. My vague guess is
> >> that the > 1 check was to skip what may have been "obviously buggy"
> >> back at the time.
> > 
> > Let me know if you are OK with the adjustment in v3, or whether you
> > would rather leave the > 1 check as-is (or maybe adjust in a different
> > patch).
> 
> Well, I haven't been able to make up my mind as to whether the original
> check was wrong. Without clear indication, I think we should retain the
> original behavior by having the __set_bit() gated by an additional if().
> Then, since the line needs touching anyway, a further question would be
> whether to properly switch to setup_force_cpu_cap() at the same time.

Having looked at Linux, it has exactly the same check for > 1, which I
guess is to be expected since the code in Xen is quite likely adapted
from the code in Linux.

Overall, it might be best to leave the check as > 1.  It's possible (as
I think you also mention in a previous email) that there's simply no
hardware with 1 counter.  This might no longer be true when
virtualized, but given the current checks in both Xen and Linux any
virtualization environment that attempts to expose arch perf support
would need to expose at least 2 PMCs.

My suggestion is to leave the cnt > 1 check as it is in v2.

I can send a v4 with that check fixed if there's nothing else in v3
that needs fixing.

IMO doing the adjustment to PERF_GLOBAL_CTRL without setting
ARCH_PERFMON would be contradictory.  Either we set ARCH_PERFMON
support and consequently adjust PERF_GLOBAL_CTRL, or we don't.

Thanks, Roger.


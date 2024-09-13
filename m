Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E1C977A2D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798030.1208164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp11G-00020t-Vp; Fri, 13 Sep 2024 07:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798030.1208164; Fri, 13 Sep 2024 07:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp11G-0001zO-RE; Fri, 13 Sep 2024 07:47:06 +0000
Received: by outflank-mailman (input) for mailman id 798030;
 Fri, 13 Sep 2024 07:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnXM=QL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sp11F-0001zG-GQ
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:47:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e5ae581-71a4-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 09:47:04 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cc8782869so17448895e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 00:47:04 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b21sm16067179f8f.49.2024.09.13.00.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:47:02 -0700 (PDT)
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
X-Inumbo-ID: 5e5ae581-71a4-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726213624; x=1726818424; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e2Tz+WzfBzvmAglbjVa4Bxg7SeFEinL8RXQVhGdD5x0=;
        b=iG5RAccrBqWy+QZ5443twZRSEy5ayoHuovpVJa4gLwer6ElD00UvMp8A+SKfYAEH7w
         MebxC2TqT1ofEVvQfEhLKJQZ3LHbyVeLgFVVD0e4fkcMjnZ9GdcjSVHk5dYCBFKF0432
         /inGyzvLkGXPRLNHbZHvQQJGa9H1HACGO1c+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726213624; x=1726818424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2Tz+WzfBzvmAglbjVa4Bxg7SeFEinL8RXQVhGdD5x0=;
        b=k4DpiQyuKDpfYwN94ZOpidw1OvB9HszAh8Aw1C0pAkCZBLD8Hs2T17eAEWkQUQsBdO
         6VXk99cry55JRGlhyFR9giNSxX8v1MCE3AA2v0oFJgiV4AOhkznl5cXge3yRSL7q7RD4
         aLDiO5GJ7bvRBlmEnsPoZfx5c6PrP6BTvWv0pyhLRBiHWvNxdHcYHDKmUY1rvIvOG6V5
         TVpYWXTpRSzr9FIvHikk1wx9PGyUaC5av16M/6KOpHqki9sOe5E5dlFCwswsqRkU/s4Y
         s6e3mGJcLialseWjJUXPsV/yXwFKjFGeaxfs5hOvjfXb60ErEEfqhpRH+WdfQ9JaYi0P
         kztQ==
X-Gm-Message-State: AOJu0Yxj+RPv9FyirLKGjqh+BnWC2l6bVC1RZpYl1+WKS0ZTINAQlGYx
	mafRXCYabHblbLK9bs45t4Dlvxg2AVRNuJD5WRGyaMI3A7KGICtzWbhpuHMCVCamSagJZBCpj1T
	H
X-Google-Smtp-Source: AGHT+IEYZV4WSN0nra7OsB/CgzNshjvA1Vk1p/gOtQXbbDG7DrmOEtw02+IpeVXJpbAPemDJqyvKGg==
X-Received: by 2002:a05:6000:1fa4:b0:374:ba2c:3028 with SMTP id ffacd0b85a97d-378c2d4c6f6mr3936455f8f.36.1726213622997;
        Fri, 13 Sep 2024 00:47:02 -0700 (PDT)
Date: Fri, 13 Sep 2024 09:47:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] Fix two problems in the microcode parsers
Message-ID: <ZuPt9eROADYZqs4o@macbook.local>
References: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
 <a7dcfa4c8d4ca16fc734d729b34dbd693ec56f45.1726174797.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7dcfa4c8d4ca16fc734d729b34dbd693ec56f45.1726174797.git.demi@invisiblethingslab.com>

On Thu, Sep 12, 2024 at 05:11:32PM -0400, Demi Marie Obenour wrote:
> The microcode might come from a questionable source, so it is necessary
> for the parsers to treat it as untrusted.  The CPU will validate the
> microcode before applying it, so loading microcode from unofficial
> sources is actually a legitimate thing to do in some cases.

As said by Jan I think this needs expanding as to what's actually
being fixed, to give readers context.

Additionally you want to add one or more "Fixes" tags if this is a
bugfix.

Thanks, Roger.


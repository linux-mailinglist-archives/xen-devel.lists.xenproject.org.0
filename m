Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DD881349
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695950.1086314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwtz-000112-Qn; Wed, 20 Mar 2024 14:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695950.1086314; Wed, 20 Mar 2024 14:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwtz-0000z1-NR; Wed, 20 Mar 2024 14:26:47 +0000
Received: by outflank-mailman (input) for mailman id 695950;
 Wed, 20 Mar 2024 14:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmwty-0000yv-Bm
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:26:46 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00f52d4-e6c5-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 15:26:44 +0100 (CET)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3c3775ce48fso3709101b6e.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:26:44 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 iw14-20020a0562140f2e00b0069154e0670asm7936133qvb.90.2024.03.20.07.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 07:26:42 -0700 (PDT)
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
X-Inumbo-ID: e00f52d4-e6c5-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710944803; x=1711549603; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iRQBOFOQNXkfZj3H8gzR5SexlsVHOAyq+SBM60zqi8g=;
        b=aTPzXJfFKkfHUx7v9nlDkRsJ+LOyUbxZAaToyFYGHOdZG+5p9a/FldEyEhRTKZoOdE
         LWDFqP4DcSOXm7AUSY3JrdEqYfHUY9In0TkaRzvDwhYIYY5EVOzWurYAKZiPF7RVmI14
         2LcpoT/CSkaqg8VqpEz0cHJ6x6GF6i9j2nvE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710944803; x=1711549603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRQBOFOQNXkfZj3H8gzR5SexlsVHOAyq+SBM60zqi8g=;
        b=putX+cmgce68DE0NlAT5pbuwSMVO7oZw75Obq8pm+VX406dA+4pcsHTpIEi1YG9dMA
         qFyBF4XR6VCIf+OMFB5hA+cjDuA/VvDt3g+Y3L+qiLjRxQSEqo+6AB1UC5aelmUQ1WKb
         vI5f+0+xOBUlCzYY/nWki5pk0kSL1Sk5YggaahusVn+wVKMQZC8cgi6pB7TFnvUCEHG/
         2HJ7qEJNtBqTMnRXz693rR9cJxg5J/lPeayrLE4kFXbdyH0HHKBUklll/HqqyJZy8mw0
         ltFXCMVBNNX0jcgyhxTCRnMz5fSDQU6nvrndicW643b3GFVPqOMNxUu5ySi+uXOnu+Ch
         fMQw==
X-Gm-Message-State: AOJu0YxBczxptWH5zB0Aet/X7zS0g5wLzQ5fESWmH/iJZUDw9qIkR4uE
	Ft1diISfM5EIJ8/lo9nndU7h8NK/gr1nSnGQI1dxu4llKf1ZpyBxDAhP30C+3g0=
X-Google-Smtp-Source: AGHT+IHp7ZFrptBZHii3Y/XeLjLmBvUMj+HlNpj4p9Z2TAyl6uTzybqP+/FARn/w11DLTeeKM2wOoA==
X-Received: by 2002:a05:6808:4c8e:b0:3c2:39c8:435f with SMTP id lt14-20020a0568084c8e00b003c239c8435fmr18223845oib.51.1710944802970;
        Wed, 20 Mar 2024 07:26:42 -0700 (PDT)
Date: Wed, 20 Mar 2024 15:26:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Message-ID: <ZfryIBR6RECujayD@macbook>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com>

On Wed, Mar 20, 2024 at 02:06:27PM +0000, Andrew Cooper wrote:
> On 20/03/2024 1:57 pm, Roger Pau Monne wrote:
> > There's no reason to force HVM guests to have a valid vcpu_info area when
> > initializing a vCPU, as the vCPU can also be brought online using the local
> > APIC, and on that path there's no requirement for vcpu_info to be setup ahead
> > of the bring up.  Note an HVM vCPU can operate normally without making use of
> > vcpu_info.
> >
> > Restrict the check against dummy_vcpu_info to only apply to PV guests.
> >
> > Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks for looking into this.  But, do we actually need to force this on
> PV either?

Possibly, having now taken a look at the users it does seem they could
cope with unpopulated vcpu_info_area.

Part of my understanding was that this was some kind of courtesy to PV
guests in order to prevent starting them without a vcpu_info, which
strictly speaking is not mandatory, but otherwise the guest vCPU won't
be able to receive interrupts, not even IPIs.

> The only interesting user of dummy_vcpu_info now is vcpu_info_populate()
> which can cope with any arbitrary vCPU.
> 
> I have a suspicion that we can (now) delete these two checks, delete the
> dummy_vcpu_info object, and use a regular NULL pointer in
> vcpu_info_{populate,reset}(), and in doing so, remove one of the bigger
> pieces of PV-absurdity from Xen.

I was expecting this to be something we can backport.  OTOH removing
the check completely (or even getting rid of dummy_vcpu_info) is not
something that we would want to backport.

I would rather do the removal of dummy_vcpu_info as followup work.

> I can entirely believe that this is only safe to do with Jan's physical
> registration changes in place.

Quite possible.

Thanks, Roger.


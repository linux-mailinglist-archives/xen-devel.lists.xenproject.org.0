Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0DA677D7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919317.1323806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYuO-0001P1-O8; Tue, 18 Mar 2025 15:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919317.1323806; Tue, 18 Mar 2025 15:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYuO-0001MT-LQ; Tue, 18 Mar 2025 15:31:12 +0000
Received: by outflank-mailman (input) for mailman id 919317;
 Tue, 18 Mar 2025 15:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuYuM-0001ML-NR
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:31:10 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ca8a20-040e-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:31:08 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e5b572e45cso10991678a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:31:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e816ad3937sm8247932a12.49.2025.03.18.08.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 08:31:08 -0700 (PDT)
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
X-Inumbo-ID: 03ca8a20-040e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742311868; x=1742916668; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0TCyUw42Drct+CIBpJPNucYKzAypB6tbAMuyvXz2II=;
        b=nHQIZZ2yL5sFWiD6PGzyl3IPM43xYFyyc9Q7Tpp/K9L04IjLAzUTtNYZPC4JNkAmkx
         +ccI30jf5Z9IM3U7etJYE/0r/0dp1jmYfDYhIZ3tQng870MAJ3iA+eijH0ZbpSWQARI0
         Ek9zAKlqfOpfuyD/+sFUp9gddleIsYwyESxoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311868; x=1742916668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0TCyUw42Drct+CIBpJPNucYKzAypB6tbAMuyvXz2II=;
        b=S9q4IyRk2vjqbWsoTT3fg1jw0l4lWiQBvPoEQ+lO3/OrXld33gY4SHSQhAm2pjRkMu
         ZPStb72Khg8Sd67KyytFeZIJjAsYWUElCEVAb9dG5N8xb8kV++J2dr8qO4pTaqR3E9Oz
         AVtOu3vff+fluS4Z6ic9iA2r1cZ7qiYcZ5VAShmBdr6jIHQFwlaxxQ66dovagDmdWXuy
         1LQV9m/eh0zoyI+T8uzUITOJnEXdjMnWrHaIG4SnbUJqLEHDs2qpGsJNvTnImVrBeIGy
         PsCFnayNCYg2R/tHoiIDnYinRe9RSxMqY6H1ykYYo1y9aVFE62tjD+9B4n4+p5XZawd2
         1Abg==
X-Forwarded-Encrypted: i=1; AJvYcCVsPgCHBJD+ADW3YJCYTl6rB3K56ErmZoP5tsIOkYHPoC+J5DQvttX6NdcoPCxLlUWgfxKrd7SD1is=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIz3bhTkxGu+L6/xDCoi19b0uduc7/AHiYXy6XrQoAVBdrYY81
	V/9j510ldv1UJcoKc2uC3R3vL5hi3LHpbUBecR+D/amGlvkAFRZHMxFRFI2nkZA=
X-Gm-Gg: ASbGnctig0rwyDon3VOqXkcAsmZt+yi4DYVFZpqbWkeplcsDpgP0k1ZJx5EkOlPgdso
	TBTa9hTqSLiaCbQTeQMgKTNXU/m9YmXwBWgacncfLZwpFrmhgG3vQElAtd8yR/6aoYZCCCa+Oz3
	G6UPcHL7QD5Ukv5emF1xnwmTB9Ofhal5yRohHNEOcWg6NKDz/zej5dOIfU7FL/s1oK0oKp2GyYN
	IB4W9yXK2XtvwbZDNCIoIMKBQatk5v1hwLzt1N8FSHbcRbk2sdbjqrVkgJ6ESUVPjjul5TnNUuU
	62zZ+c4Xck4fJcRAntz+CSjhlT1tunlrG/B1sToohSwB7ydsqzZngBY=
X-Google-Smtp-Source: AGHT+IFcXXF3/Unqvr9paJVcRVvtSOWg/095m5lxNtfARfO6cyFetbZ8tMsDPr54HcJXVDoHnUofpQ==
X-Received: by 2002:a05:6402:2551:b0:5e7:b015:c636 with SMTP id 4fb4d7f45d1cf-5e89f24f212mr18065104a12.6.1742311868381;
        Tue, 18 Mar 2025 08:31:08 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:31:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/5] x86/vga: fix mapping of the VGA text buffer
Message-ID: <Z9mRu3JCwgffgEKd@macbook.local>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-3-roger.pau@citrix.com>
 <cc882f93-b5d0-45ad-bb2a-1c6b9455509b@citrix.com>
 <f2fa59b3-83cd-41e4-a921-5c6eaa89e759@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2fa59b3-83cd-41e4-a921-5c6eaa89e759@suse.com>

On Tue, Mar 18, 2025 at 03:28:32PM +0100, Jan Beulich wrote:
> On 18.03.2025 14:11, Andrew Cooper wrote:
> > On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> >> The call to ioremap_wc() in video_init() will always fail, because
> >> video_init() is called ahead of vm_init_type(), and so the underlying
> >> __vmap() call will fail to allocate the linear address space.
> >>
> >> Fix by reverting to the previous behavior and using ioremap() for the VGA
> >> text buffer.
> >>
> >> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > This is somewhat ugly.
> > 
> > ioremap() isn't really any better than ioremap_wc(); this only works
> > because plain ioremap() has a special case for the bottom 1M where it
> > does nothing and exits.
> 
> And this is exactly why I screwed up back then. Imo we would be better
> off moving to using __va() directly here. Otherwise the same mistake
> could be made again by someone (perhaps even me) noticing the less
> efficient ioremap(), when ioremap_wc() really would be wanted.

I can switch to using __va(), that's fine.  I guess we should then
remove the special casing for the low 1MB in ioremap()?

Thanks, Roger.


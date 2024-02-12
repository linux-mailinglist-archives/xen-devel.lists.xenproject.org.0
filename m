Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D730485105D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 11:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679513.1056947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTHm-0005jx-3B; Mon, 12 Feb 2024 10:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679513.1056947; Mon, 12 Feb 2024 10:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTHm-0005hc-0K; Mon, 12 Feb 2024 10:11:38 +0000
Received: by outflank-mailman (input) for mailman id 679513;
 Mon, 12 Feb 2024 10:11:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbWo=JV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZTHk-0005hW-Iq
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 10:11:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19efdc7c-c98f-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 11:11:34 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-410ed9f8621so2262925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 02:11:34 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b0040fc56712e8sm8177384wmo.17.2024.02.12.02.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:11:34 -0800 (PST)
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
X-Inumbo-ID: 19efdc7c-c98f-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707732694; x=1708337494; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJn1GjhiDpMwzcbKVeGFs/v2i5m08gdiaVt7JZm4M4s=;
        b=tA5p/ssR3yUF/z799+h/zhiZqEqg7c7+2bpbHvgVGK//y5eVjmU6ccVzg6fhHdX/LF
         j1qQdjvarwqmViUsNagad21ydPHURKzCWPoRcwk2UpnxaZ1pju8/yh8N/ceW+cchAia8
         30KjY3QGUDMDKzlyr31z8RbQIb6B2UyKj6img=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707732694; x=1708337494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJn1GjhiDpMwzcbKVeGFs/v2i5m08gdiaVt7JZm4M4s=;
        b=vyg+9fZFrnIlTC7kr9ldWUhy0/3Os7C0wmO1htID45qgRNXxAXPXPDTLQKBp1DfEJv
         peCUbbBZVRhPbNATIZ7SQmpS0X21//Ho7OZ+G0VhzuaaRhy57+FA5ljXNBxvsOQc70l3
         5jm4a46KYQ6zd4uNufPVGelcyAUGuziiWmeIqUVXR8V+XqMc8/Vs2R6lPT+qymcYbgj2
         S4MZaMYmjBhZjcg23Zfon9as6H6NUONRg9AV4/LEOWBYdhfMZMGifSvqsxxvZ0/H4dAe
         1kZiohylA3YG/laIcpWpGGjeV7w5WwLgherYb7UCP/Z4RwEYtFYPfvXfVDjz8eQxivcv
         w7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVcpw2Sg7u7FeETR8Pdx6J+gIR/YSp5baAW6G6gzAmYR0blSSO+s4TxBUbf0igwV0WcD8jkM0td/wx5EP/amCM2MWd0Qqr+SKktoRbiPVE=
X-Gm-Message-State: AOJu0YzvNLrjtqfnBwqxw0pjrftnr/8RA4+ECEUROAUF247Gku7KoOKZ
	Ew9mOcEXn+PPwOcVtxmKi8zaEe8ZNQ07TPL7aZUHxqFne933b2qBsThE7jB4OOM=
X-Google-Smtp-Source: AGHT+IEWL0sbI65hxb2TgU0UIhxc32dWpWvcXEdwJaP0/NnAazqkqgcoJbwS+n+8VibdyQLNH17eXQ==
X-Received: by 2002:a05:600c:1c85:b0:410:ec61:5e90 with SMTP id k5-20020a05600c1c8500b00410ec615e90mr605542wms.10.1707732694419;
        Mon, 12 Feb 2024 02:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1H3xHWQJBENnH1PPk6F9ckQh7S6OSQL9yqehdIubhvNS7iB3/AiJrgTjHaINjrWTwTYds6JXlFfl1kZkArKQqvJcTimXfz1j778Br0WmMmT2ObThQUAOuGYh8yMsjlhYCv7CW6Mn+C8urm+idbo+FtljfPNlUlKFGKx170+P/D/g1rxqyzYfntnQGD2YeEADGkptNkII7Bbkb/O4BuHnhybBYPuNb9p4/F79rth0c3OB+vJQpaH2GO4M=
Date: Mon, 12 Feb 2024 11:11:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 7/7] VT-d: move {,un}map_vtd_domain_page()
Message-ID: <Zcnu1en6aZuYoVpZ@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <22e7036c-cf49-4160-bd26-fbba6b67ff5d@suse.com>
 <ZcXkpk8XxJmGO1EM@macbook>
 <561102e1-7f02-4928-86c1-9e058a405c4b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <561102e1-7f02-4928-86c1-9e058a405c4b@suse.com>

On Mon, Feb 12, 2024 at 10:46:55AM +0100, Jan Beulich wrote:
> On 09.02.2024 09:39, Roger Pau Monné wrote:
> > On Mon, Feb 05, 2024 at 02:57:30PM +0100, Jan Beulich wrote:
> >> ..., thus allowing them to become static. There's nothing x86-specific
> >> about these functions anyway.
> >>
> >> Since only the "iommu_inclusive_mapping" parameter declaration would be
> >> left in the file, move that as well. There's nothing VT-d specific about
> >> it (anymore?): "dom0-iommu=map-inclusive" is similarly generic, and
> >> documentation also doesn't say anything.
> > 
> > Hm, I guess documentation should at least say that
> > iommu_inclusive_mapping is x86 specific, because it's not parsed on
> > Arm and hence might give the wrong impression that it's actually
> > acknowledged there.
> 
> In v2 I'm adding "(x86)" there.

Maybe part of this should be done as a separate patch so it can be
backported to stable branches?

> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > Albeit I think it would be better to put the parsing in generic
> > iommu.c, so that the option gets parsed on Arm and
> > arch_iommu_hwdom_init() can print a warning message about it not
> > supported on Arm.
> 
> Hmm, I would have considered doing things the other way around - make
> that part of parsing in parse_dom0_iommu_param() x86-only. I would
> feel odd to introduce an option to Arm, just to be able to report
> that it's unsupported. The more when generic option parsing code will
> already log unrecognized options (sadly such log messages aren't seen
> in the serial log, for being issued too early). But let's ask Arm
> folks what they'd prefer, by adding all of them to To:.

FWIW, that (moving part of the parsing of parse_dom0_iommu_param() to
x86-only code) would also be fine.  As long as both
dom0-iommu=map-inclusive and iommu_inclusive_mapping are handled
equally and the documentation is updated to reflect that.

Thanks, Roger.


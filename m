Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87A254419
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:07:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFkS-0001k2-1V; Thu, 27 Aug 2020 11:07:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFkQ-0001jx-P7
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:07:14 +0000
X-Inumbo-ID: c41950ca-5497-4180-aa06-7b745ec926c3
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c41950ca-5497-4180-aa06-7b745ec926c3;
 Thu, 27 Aug 2020 11:07:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x9so4729876wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=krdHB0T17yso0XQslDL7P2NVkV899rCNBbQ1IizSC0Y=;
 b=P7FL+WM4c/D0pLYGvrchu3syREOVrTq6wQoWS0zjhVa5Yi8zzAc4eamf/jXyVFwfE4
 tk9jFcXoCnBLit+39x0lQamcztC3GqfsADuP/AE2CizPy/9SvR60lL56UK17TzabTq2G
 YhTRN6w2yWfbjAKlljOHZiLB5E5BGemKdGyXDjwoosIJah3ML3qxJlgPlzMngnn4TRHC
 YQVyGMWe4QSzp/L6/kXNiEvq4wz8n/XNWValWnbJVNaiyrWy7YbfmqiAV+bixxFPmdvA
 8U6DdTwnz5AzXsaspZZYwtAydkyZw56h7JJ+pZMUaIVLfvb2AbggfkiWek9LWnmqjhuE
 AsOA==
X-Gm-Message-State: AOAM530hgF/8B8N3FD890oid2uOLroxAgj9ktQHhhfdzqEc79HWpAvRf
 hjLNJRaUfPSbUF2LCxEFM3M=
X-Google-Smtp-Source: ABdhPJy1wuW3D2p214dMQ6VlZ04tG7ZYZUKwZvqiNe2tVzuyvTimt/JHm8dwP9NH5gkBTNMRYMfjjA==
X-Received: by 2002:a1c:a746:: with SMTP id q67mr2352862wme.128.1598526431922; 
 Thu, 27 Aug 2020 04:07:11 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p6sm4282544wmg.0.2020.08.27.04.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:07:11 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:07:09 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Yang Hongyang <imhy.yang@gmail.com>
Subject: Re: [PATCH v3 00/38] tools: move most libraries into tools/libs
Message-ID: <20200827110709.pj4aaa3roviekuyu@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:34:41AM +0200, Juergen Gross wrote:
> Move most remaining libraries under tools/libs, including libxenctrl
> and libxl. This is resulting in a lot of cleanup work regarding
> building libs and restructuring of the tools directory.
> 

One thing to point out is that libs was originally only supposed to be
the home for _stable_ libraries.

I have no objection to turning it into the home for all libraries
though. I think this series is definitely an improvement over the status
quo.

> After this huge cleanup all dependencies between libraries are defined
> in a single rather small file tools/libs/uselibs.mk, which is used to
> create the needed make variables and to control the stubdom build
> dependencies as well.
> 
> Another bonus of the rework is the automation of setting the versions
> of unstable libraries. This removes the need to bump those versions
> manually for each Xen release.
> 
> libfsimage is not moved by this series, as IMO there are some open
> questions:
> - should it really be unstable?
> - is the support of adding external fs-support used in practice, i.e.
>   shouldn't the fs-specific sub-libraries be just included into
>   libfsimage instead of being loaded dynamically?

My impression is that nowadays it is only consumed by pygrub, so it
wouldn't really make a difference if we make it stable or not. It surely
has not been changed for years though.

Not entirely sure why it is designed to load dynamically different
modules either. I don't have an opinion on this one way or another.

I think your energy will have better ROI if you spend it somewhere else
than trying to figure out definitive answers to these two questions.

Wei.


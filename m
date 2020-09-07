Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804025FCA8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 17:10:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFIm1-0004k7-H5; Mon, 07 Sep 2020 15:09:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFIm0-0004k2-Qm
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 15:09:36 +0000
X-Inumbo-ID: ac9413bd-7eab-43f4-b7f2-698ae0a59546
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac9413bd-7eab-43f4-b7f2-698ae0a59546;
 Mon, 07 Sep 2020 15:09:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c18so16125700wrm.9
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 08:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Auwcqalz2dXZnHFJ5WoujDFbEX2U+TEKAdh30TonWQ4=;
 b=FKl4Fn95kiOwR+xZDma1vmMAJwDCzOUbUko7sva8ieOZkNm3oi82b8sJ072oQVpTy8
 S9nKVhALzOH0bKclEYT3nYufE/uke/zK7GNuheZAwIhGT00VIHLzWruwhAGq4GhygCU6
 7f8k74NzRVpzAY7eSEFD7sEWPnZ/4Ru/8sz5RB99Kxk7wAt8ix3ypJ/f7FLA5aRX+itX
 k/Xj7p8Kp+Y6SCcFW+6VEbrTNZ3gl8I3W8rVcSYMk8227OHb8heGxfBprIkj0Bh4zv8v
 OqT7z3rg6+msGfZKpf66Rjf/WFh5t9Aby/o6PigHbXp8Ycobi0sQq8y18i98wZrmHtY1
 AVrw==
X-Gm-Message-State: AOAM530PuMLYMJAvyaeKzB+Y+Y7gQLuuQYxnm59HPFMDkbF/B7/vkjtG
 SVrGxABW4rBgE5to/kiqsOvaYoDO1EM=
X-Google-Smtp-Source: ABdhPJznbvfkgHQZ+yFaxAu3TtjSRQugHyjAxh67rifRmspKmslsz2P1akhuFvopfYmjFZ522GZWdg==
X-Received: by 2002:a5d:5404:: with SMTP id g4mr21023668wrv.134.1599491374488; 
 Mon, 07 Sep 2020 08:09:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z14sm26393646wrh.14.2020.09.07.08.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 08:09:33 -0700 (PDT)
Date: Mon, 7 Sep 2020 15:09:32 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Wei Liu <wl@xen.org>, Diego Sueiro <Diego.Sueiro@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Message-ID: <20200907150932.mylpejk57553ygtv@liuwe-devbox-debian-v2>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
 <20200907143601.iuuk5yrzgv2stpze@liuwe-devbox-debian-v2>
 <4FA762CA-FAF0-46AC-A634-9F6D93287668@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4FA762CA-FAF0-46AC-A634-9F6D93287668@arm.com>
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

On Mon, Sep 07, 2020 at 03:01:37PM +0000, Bertrand Marquis wrote:
> Hi Wei,
> 
> > On 7 Sep 2020, at 15:36, Wei Liu <wl@xen.org> wrote:
> > 
> > On Thu, Aug 20, 2020 at 12:00:23PM +0100, Diego Sueiro wrote:
> >> Copy temp files used to add/remove dhcpd configurations to avoid
> >> replacing potential symlinks.
> >> 
> > 
> > Can you clarify the issue you saw a bit?
> > 
> > Which one of the parameter is a symlink (I assume the latter) and what
> > problem you see with replacing the symlinks?
> 
> Maybe i can explain here.
> 
> If you have this:
> /etc/dhcp.conf -> dhcp.conf.real
> 
> mv will create a new file dhcp.conf where cp will actually modify
> dhcp.conf.real instead of replacing the symlink with a real file.
> 
> This prevents some mistakes where the user will actually continue to
> modify dhcp.conf.real where it would not be the one used anymore.

OK. Now I understand the use case. Thanks.

I think you explanation should be part of the commit message.

Diego, can you please incorporate Bertrand's explanation and deal with
my comment below?

> >> ---
> >> tools/hotplug/Linux/vif-nat | 12 +++++++-----
> >> 1 file changed, 7 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
> >> index 2614435..1ab80ed 100644
> >> --- a/tools/hotplug/Linux/vif-nat
> >> +++ b/tools/hotplug/Linux/vif-nat
> >> @@ -99,7 +99,8 @@ dhcparg_remove_entry()
> >>   then
> >>     rm "$tmpfile"
> >>   else
> >> -    mv "$tmpfile" "$dhcpd_arg_file"
> >> +    cp "$tmpfile" "$dhcpd_arg_file"
> >> +    rm "$tmpfile"
> >>   fi
> > 
> > You could've simplified the code a bit here and below now that both
> > branches issue the same rm command.

Wei.


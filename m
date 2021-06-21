Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842793AEDB1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 18:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145618.267794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMeA-0005Jf-BE; Mon, 21 Jun 2021 16:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145618.267794; Mon, 21 Jun 2021 16:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMeA-0005Ho-6q; Mon, 21 Jun 2021 16:19:38 +0000
Received: by outflank-mailman (input) for mailman id 145618;
 Mon, 21 Jun 2021 16:19:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHMo=LP=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lvMe8-0005Hi-Bm
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 16:19:36 +0000
Received: from mail-qk1-x72d.google.com (unknown [2607:f8b0:4864:20::72d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81a0a5fb-9272-4fbe-9261-c797ce43203a;
 Mon, 21 Jun 2021 16:19:35 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id w21so18109011qkb.9
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jun 2021 09:19:35 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id 9sm3813425qkj.123.2021.06.21.09.19.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jun 2021 09:19:34 -0700 (PDT)
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
X-Inumbo-ID: 81a0a5fb-9272-4fbe-9261-c797ce43203a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=V7QToCOyN8s1F99hOvuuZdcA0iA3LZFYKSsCWLq+9vg=;
        b=MxG9drfY/W60SkzgHIcpFgyX91L4nLM/SJsK9B5lwHCthIYMFSXm9vgCCW04m8XQW7
         fVHR43tgexLKh45Lrx/WRtdWGvJ5GdgS1kOmN41iPHldjuaAGzeC2v4IdqHorQ3t0fMb
         c4dOTZQewtVS6qV9gZOigK4g5jxopAkS9Q7hoxcj8FoSkBbomuJJHGzOBTwYu7xJcc1W
         HF87Y53vZVjxEOICDKVz90M9PGMuv6DgKnhpHBla8KKo9nXhRopxtOrP406BCoY7uI1l
         o/Z43RF0UXcb1YzRDDm6HvL/3BMVGWQFyh8bQiHgB5c41iW+JvTf1O4yW7wwlegJVzSg
         zY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=V7QToCOyN8s1F99hOvuuZdcA0iA3LZFYKSsCWLq+9vg=;
        b=uWR7SNuXbStjo5oCDhrf03N5WQqMALGUuE12v9i4AcqVKZ66gEEwJwZp325/yAECzn
         zSai1//1SZAyT0MkM+fucHKcr9iS+utwV+mm3GWVKRtRgTTtEs0PAZarp/A2bWrLBtIM
         Mrqr8ZehF41SppqZRsRiAFrLW5KxAXDVsoGZPrIMXWAliYBb+V66jLj8/dC8cdD7KMWE
         sIf31enCa6Yz16TZNzeCKe1aSZfpG6cd8gVr7VPqAtemmz/UWbIa4JpofVYL2L9fKd1v
         cRPmCNhkepApPTh4aKHDLaQN8AlOJe6+pinqWGTQ/0YBCPokBw57lin/CCD92EP70s9e
         LVIw==
X-Gm-Message-State: AOAM533trZmTsqjIEBdG1Zfca2Fbo1CIy/TLmVH+kllKQ77ko3ftncMf
	rF34NM8TXyGcEUCzLF0MF00=
X-Google-Smtp-Source: ABdhPJzxDU7XfQCxb84tsK3YQm6WF/kI6dXosXRxwhKPTYeTeHjB7kuxbpezXRCsv1X5T1pzuvEKOw==
X-Received: by 2002:ae9:c115:: with SMTP id z21mr23962335qki.458.1624292374992;
        Mon, 21 Jun 2021 09:19:34 -0700 (PDT)
Date: Mon, 21 Jun 2021 12:19:31 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 00/12] golang/xenlight: domain life cycle support
Message-ID: <YNC8E1wwSG54RVzC@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <AD0B1F68-3FAE-4F3C-BCF5-9623A76A0A9B@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AD0B1F68-3FAE-4F3C-BCF5-9623A76A0A9B@citrix.com>

On Mon, Jun 21, 2021 at 03:53:39PM +0000, George Dunlap wrote:
> 
> 
> > On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > The primary goal of this patch series is to allow users of the xenlight
> > package to manage a full domain life cycle. In particular, it provides
> > support for receiving domain death events so that domain shutdown,
> > reboot, destroy, etc. can be handled. And, it addresses issues found
> > when using the package to boot domains with various configurations.
> > 
> > These patches address several things (e.g. bug fixes, code style,
> > conveniences, new wrapper functions), but are all work towards the final
> > goal of allowing a package user to manage a full domain life cycle.
> > 
> > Nick Rosbrook (12):
> 
> OK, I’ve checked in the following patches: (1, 2, 4, 5, 6, 9, 10, 11):
> 
> >  golang/xenlight: update generated code
> >  golang/xenlight: fix StringList toC conversion
> >  golang/xenlight: export keyed union interface types
> >  golang/xenlight: use struct pointers in keyed union fields
> >  golang/xenlight: rename Ctx receivers to ctx
> 
> >  golang/xenlight: add DomainDestroy wrapper
> >  golang/xenlight: add SendTrigger wrapper
> >  golang/xenlight: do not negate ret when converting to Error
> 
> The following have not been checked in due outsanding review comments (patches 3, 7, 12), or because they depend on a patch not being checked in (patch 8):
> 
> >  golang/xenlight: fix string conversion in generated toC functions
> >  golang/xenlight: add logging conveniences for within xenlight
> >  golang/xenlight: add functional options to configure Context
> >  golang/xenlight: add NotifyDomainDeath method to Context
> 

Thanks! I am planning on addressing patch 12 comments later today.

-NR


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E09281197
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1998.5917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJcU-0006Ra-L6; Fri, 02 Oct 2020 11:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1998.5917; Fri, 02 Oct 2020 11:53:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJcU-0006RB-Hp; Fri, 02 Oct 2020 11:53:02 +0000
Received: by outflank-mailman (input) for mailman id 1998;
 Fri, 02 Oct 2020 11:53:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkBu=DJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kOJcS-0006R6-RI
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:53:00 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2855a5f1-261f-4f52-9280-8a7e6496c1bc;
 Fri, 02 Oct 2020 11:53:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o5so1478066wrn.13
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 04:53:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q4sm1475935wru.65.2020.10.02.04.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 04:52:58 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MkBu=DJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kOJcS-0006R6-RI
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:53:00 +0000
X-Inumbo-ID: 2855a5f1-261f-4f52-9280-8a7e6496c1bc
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2855a5f1-261f-4f52-9280-8a7e6496c1bc;
	Fri, 02 Oct 2020 11:53:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o5so1478066wrn.13
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 04:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QwGq+Eoo4NWSuRYXk18oyT964WvNmcCXLZuBK/a1N+Y=;
        b=e0gAOBfD5A8hm96S+gcQUcmPouL0pQiR8HVzceL2Cp20GmqVTJ/AtYO9KjdLRrAw7c
         yEKq2pjY0369ei0ZqFju2D/3qOvkGglhTxdUiL7o/8aeurdFLxOR1nhlh1aAIWe0mnpW
         Ve812g76CoIIjJUBjKOxhZIk4XJGCMF7OvOIut7pFJxeHCofRhz6iHavdxtpD3seBA4r
         s1uMxx6zFe6KXeW596rOvxqH8IpQj0F7nV/qmI9KwSWPhqQmmwTgBBijg1ocw6nRrmiq
         u4J4qLk2+tsS6HjHcJCz5eOXD7PZtjU71rodgTI7RsJsBweA8xlWMRDODKFJbkUkKAvF
         d0PA==
X-Gm-Message-State: AOAM531THPgLeZHo6YsukAcPN9mNfaMkrpqs1iuXrKpDxCWxJt+Ko8rL
	YlkYatDLv3pK0Yhjs6iPykU=
X-Google-Smtp-Source: ABdhPJw+mzkq3L6I/6Zxq/N+UzMAWQCTQC6L6Y7/0OrU2dJ7RwxRz648PXe9Rdy+SocFAGo0CjX8lw==
X-Received: by 2002:adf:eecb:: with SMTP id a11mr2653510wrp.356.1601639579188;
        Fri, 02 Oct 2020 04:52:59 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q4sm1475935wru.65.2020.10.02.04.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 04:52:58 -0700 (PDT)
Date: Fri, 2 Oct 2020 11:52:57 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH 0/6] tools/include: adjustments to the population
 of xen/
Message-ID: <20201002115257.crrhxpz6u5jsd34c@liuwe-devbox-debian-v2>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
User-Agent: NeoMutt/20180716

On Thu, Oct 01, 2020 at 06:03:09PM +0200, Jan Beulich wrote:
> On 10.09.2020 14:09, Jan Beulich wrote:
> > While looking at what it would take to move around libelf/
> > in the hypervisor subtree, I've run into this rule, which I
> > think can do with a few improvements and some simplification.
> > 
> > 1: adjust population of acpi/
> > 2: fix (drop) dependencies of when to populate xen/
> > 3: adjust population of public headers into xen/
> > 4: properly install Arm public headers
> > 5: adjust x86-specific population of xen/
> > 6: drop remaining -f from ln invocations
> 
> May I ask for an ack or otherwise here?

While I think I agree with Andrew that getting rid of symlink is better,
we're nowhere near that.

This series is an improvement over the status quo, so:

Acked-by: Wei Liu <wl@xen.org>

> 
> Thanks, Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A42CEC80
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44388.79525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8gH-0004vv-FN; Fri, 04 Dec 2020 10:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44388.79525; Fri, 04 Dec 2020 10:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8gH-0004vW-C8; Fri, 04 Dec 2020 10:51:17 +0000
Received: by outflank-mailman (input) for mailman id 44388;
 Fri, 04 Dec 2020 10:51:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl8gF-0004um-Ih
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:51:15 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 902497ac-0d2a-47af-9aa7-f7d44ddda45a;
 Fri, 04 Dec 2020 10:51:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a3so6591815wmb.5
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 02:51:14 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g192sm2643065wme.48.2020.12.04.02.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:51:13 -0800 (PST)
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
X-Inumbo-ID: 902497ac-0d2a-47af-9aa7-f7d44ddda45a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PpQq+83RAP6AzSMAr/ocqzqnwUcMMjZ/QL02XG/RWw0=;
        b=cxtA6Viu0/73Bd5Z0dJPIEGzodpUlLZOVVjhhKxpOT3QINwxpTJqjH0qxEsoD0i6a2
         pxOciAhyFGLutiXlxfCBzD685pWnkfRhQOARo9jAaVwSAZOea0D9SZq/i7AVEibLtSDS
         P8BYlBpzEf3mvJ1mmjZbPT3SEO+3S59990dXhho04pYGyPDhxI7NdHed9Eh/W9W2Mn64
         qn3qJqAhlZDjum6j7CtwidTOKQKq+MavgzBhSxsrgAehqCw2MtGPvodmwHRUQgQsLIlr
         spobWIoR4ApiISmOIZW0QJQhNScCk5bE5vKURT/uqQ7WBGBEcnLVJvuiowviYD5fAm10
         vfcw==
X-Gm-Message-State: AOAM532jFL8HL5NUg2wCzjkcQRuB5bQZ80AQah0wyDflnTMm+IyOg9OC
	38m+y5iWp80mL6zrs21ekIi+HWaMzlw=
X-Google-Smtp-Source: ABdhPJzw7+wlSWiQ6Gi2AVZBIBDgvX+r9Aw1pV/dU4AMCTQTurraFtpaF8t/XQ3UhuVc0bALkDq/UA==
X-Received: by 2002:a1c:454:: with SMTP id 81mr3509489wme.178.1607079074235;
        Fri, 04 Dec 2020 02:51:14 -0800 (PST)
Date: Fri, 4 Dec 2020 10:51:12 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/hotplug: allow tuning of xenwatchdogd arguments
Message-ID: <20201204105112.5gehzmlsincrtvhu@liuwe-devbox-debian-v2>
References: <20201203063436.4503-1-olaf@aepfle.de>
 <3fc53e0a-c7b4-4c56-9ba8-0b0a55c10f50@suse.com>
 <20201203081939.7265ac3d.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201203081939.7265ac3d.olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 08:19:39AM +0100, Olaf Hering wrote:
> Am Thu, 3 Dec 2020 07:47:58 +0100
> schrieb Jürgen Groß <jgross@suse.com>:
> 
> > Could you please add a section for XENWATCHDOGD_ARGS in
> > tools/hotplug/Linux/init.d/sysconfig.xencommons.in ?
> 
> No. Such details have to go into a to-be-written xencommons(8).
> 
> There will be a xenwatchdogd(8) shortly, which will cover this knob.

The more manpages the better. :-)

Wei.

> 
> 
> Olaf




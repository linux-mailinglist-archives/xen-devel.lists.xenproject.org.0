Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C519D9F8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKO7O-0002Ap-00; Fri, 03 Apr 2020 15:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DmfO=5T=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jKO7M-0002Aj-GF
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:20:24 +0000
X-Inumbo-ID: a371f89a-75be-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a371f89a-75be-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 15:20:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id i19so8161923wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2020 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=paZCOymGUO3uhYNh9MBt/YSXWrRalqdxRoI1h3RgPoU=;
 b=nir+Uytfzgd1nRefyAn0sRuNLpRqDNi+9OfW3hTNnPi/Yu+FJlhhXW6/NemAPGWPPH
 K0rSJi6jQWhr4OZjZxnbSxprl5fr7/N9xBV9ywS+sumIwuy8n0l/TqF17dIJcTQBhts/
 Qy1HYcuw1AXvfHbY/BfIkdPwJimV68p4bhA7+Szt0k+WtYrZBMYODJ+J42N7D2JYOgqP
 F072fztnCOfj8xN8TzrHha0guJbYgOSwNsuYaX4hxDWnKEw5atxm+MptZDUSfUjowDZ7
 n1gIpVGtPjt2hsWG50Wvr0LFIx93nHQWeuxnaJF8QZAKO773gpP6y51OUlqa9LgYi54m
 st+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=paZCOymGUO3uhYNh9MBt/YSXWrRalqdxRoI1h3RgPoU=;
 b=iA4kyciCKZAb8C2tOhDmD5Ht18mQI103gixfdvl97s2Zepa4V3smNhCVQrni7yiQDH
 SqXNuXNrZDY+y6PeVnx5JH5x7RxYNR5ZhG6+aaW7rd5CrtcRKtsBG+sYeYBc165iFs/Z
 tgHhNif9fu9L4m5JrEv1u/PzUsmCVGPETgmkqks6faEUf1kBAaEVJMSIux3Wd6ccvmWM
 r0aSNjUO/7jZJ5GtDijVdvW9u61txfjWi2qP4CrIMRcVUPU3Si0i6fzBr8u41xuQTulq
 R036ZCgsDrfGMyjB4u5S7I1n0X8STcwlz6pzqqr40Y2MQ/6vjN4llfzUWeRCGNU8/osI
 G5Ng==
X-Gm-Message-State: AGi0PubSnhb3ST0aA7HHai3IO01f+PjZ+sATbpddrbuSwGPkP2mGch6R
 +tfuWo3OS86De1uSkE43WKH9W3veih0=
X-Google-Smtp-Source: APiQypLqhwP7eASMSRAAvkljQv0c+We1ZmIbxAbmK+bLdsXWQO9TUrFOCHj5TTVncx/W5l0Wr4GtPg==
X-Received: by 2002:a05:600c:220f:: with SMTP id
 z15mr9712527wml.185.1585927223054; 
 Fri, 03 Apr 2020 08:20:23 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id v9sm477168wrv.18.2020.04.03.08.20.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 08:20:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-4-paul@xen.org>
 <b94676ab-371b-bb69-0d07-dd38fe22ceba@suse.com>
In-Reply-To: <b94676ab-371b-bb69-0d07-dd38fe22ceba@suse.com>
Subject: RE: [PATCH 3/5] tools/misc: add xen-ctx to present domain context
Date: Fri, 3 Apr 2020 16:20:20 +0100
Message-ID: <001e01d609cb$64913fa0$2db3bee0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AIR6g5qAoK3rZqogKoVMA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 30 March 2020 11:54
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH 3/5] tools/misc: add xen-ctx to present domain context
> 
> On 27.03.2020 19:50, Paul Durrant wrote:
> > This tools is analogous to 'xen-hvmctx' which presents HVM context.
> > Subsequent patches will add 'dump' functions when new records are
> > introduced.
> >
> > Signed-off-by: Paul Durrant <paul@xen.org>
> > ---
> > Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> > Cc: Wei Liu <wl@xen.org>
> > ---
> >  .gitignore           |   1 +
> >  tools/misc/Makefile  |   4 ++
> >  tools/misc/xen-ctx.c | 144 +++++++++++++++++++++++++++++++++++++++++++
> 
> Is xen-ctx a good choice of a name, considering we already have not
> only xen-hvmctx, but also xenctx? If the new functionality isn't a
> good fit for either, perhaps its name would better reflect its
> connection to save/restore records? xen-sr-dump looks pretty clumsy
> to me, but still seems better than a name easily mixed up with
> others.

How about xen-domctx?

  Paul

> 
> Jan



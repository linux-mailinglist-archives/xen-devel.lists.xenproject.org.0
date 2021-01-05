Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5CB2EAA9E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61855.109029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlPe-0002gc-5F; Tue, 05 Jan 2021 12:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61855.109029; Tue, 05 Jan 2021 12:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlPe-0002gD-25; Tue, 05 Jan 2021 12:26:10 +0000
Received: by outflank-mailman (input) for mailman id 61855;
 Tue, 05 Jan 2021 12:26:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwlPc-0002g8-6I
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:26:08 +0000
Received: from mail-wm1-f52.google.com (unknown [209.85.128.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7015743-118c-43bd-99bf-b982cc526e6f;
 Tue, 05 Jan 2021 12:26:07 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 190so2866099wmz.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 04:26:06 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id j59sm101907612wrj.13.2021.01.05.04.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 04:26:05 -0800 (PST)
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
X-Inumbo-ID: b7015743-118c-43bd-99bf-b982cc526e6f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=//LosnWBRFpmxXsCn0ziyhNNzlYnv719AO6qTa1fTmY=;
        b=JPGQC8C5Ebg+kD/h8FIipkaI5zZ6Fwk5j0VZaOdSAu3djmSESYGoMcYaSIR7tuf5ez
         ueI/KCOHDVJ6fbz0jipD6W3p7rer+pCx/9nnOvrr50fjw79fUeMK/UXnWzWZZicyTKfe
         zJubogATXcDda+J8benhwfdMxuYOSURVNVhhbkVqgZwPcDLXVWf/K+9Ob25xUkqTL3Z1
         BghwbddROI17//3vCgIoGEOEaQMLv634gqDCeqRq9D2TNlFPhm8yHPc08uM44aKzvoMa
         MxzGevS7n6fFctHgJB9soYSMKcdITHLxEVOSbksbOxSLrpYIIETloSxqTsDw4j3xT0us
         1elA==
X-Gm-Message-State: AOAM531L5HWeRTCGXbJ1FuRphcVWzhismhWpcyC1K4ylKgoSga2WCZUs
	UpKxegsnrblLECdUigNbwCE=
X-Google-Smtp-Source: ABdhPJwlJFyGzYF3tBmpaQZPAH3nPe8WLlW+AgQZ8CohdG08/FdjzAacebuoKNnb8O9RcEwMJlYThw==
X-Received: by 2002:a1c:63d4:: with SMTP id x203mr3219552wmb.28.1609849566183;
        Tue, 05 Jan 2021 04:26:06 -0800 (PST)
Date: Tue, 5 Jan 2021 12:26:04 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v10 00/25] tools/xenstore: support live update for
 xenstored
Message-ID: <20210105122604.x7lbtcw7thbw7ja3@liuwe-devbox-debian-v2>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Dec 15, 2020 at 05:35:38PM +0100, Juergen Gross wrote:
> Today Xenstore is not restartable. This means a Xen server needing an
> update of xenstored has to be rebooted in order to let this update
> become effective.
> 
> This patch series is changing that: The internal state of xenstored
> (the contents of Xenstore, all connections to various clients like
> programs or other domains, and watches) is saved in a defined format
> and a new binary is being activated consuming the old state. All
> connections are being restored and the new Xenstore binary will
> continue where the old one stopped.
> 
> This patch series has been under (secret) development for quite some
> time. It hasn't been posted to xen-devel until now due to the various
> Xenstore related security issues which have become public only today.
> 
> There will be a similar series for oxenstored posted.
> 
> Xenstore-stubdom is not yet supported, but I'm planning to start
> working on that soon.
> 
> Changes in V10 (for the members of the security team):
> - dropped patch 6 as requested by Andrew

I went through this series when it was posted to security@ and didn't
find that many issues. I guess I will wait for Andrew's comment to be
addressed and have a look again.

Wei.


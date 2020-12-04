Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30212CEC71
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44367.79500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8bT-0003rt-Km; Fri, 04 Dec 2020 10:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44367.79500; Fri, 04 Dec 2020 10:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8bT-0003rY-HZ; Fri, 04 Dec 2020 10:46:19 +0000
Received: by outflank-mailman (input) for mailman id 44367;
 Fri, 04 Dec 2020 10:46:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl8bS-0003rS-9x
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:46:18 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdd3fa05-2d14-4d09-b8cf-eff83be0a826;
 Fri, 04 Dec 2020 10:46:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f190so6646299wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 02:46:17 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d8sm2560640wmb.11.2020.12.04.02.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:46:16 -0800 (PST)
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
X-Inumbo-ID: bdd3fa05-2d14-4d09-b8cf-eff83be0a826
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u6WCj7PXxa0WiaVvXHv6H3WzGC6ALrNUNnuUj/qDI0Y=;
        b=Wg8KuVD1DLJytOfS6/Po3PFlYH7eCXHE4CS5UY7AR5q+e6eU+rmPblTJYimD6SbSVM
         emQwO6GiWLESyKL87PXQo5bm5nctNgZgfcFnX5yRFG5PcX86asmIB1rdu0Gm4RLCxLep
         /uSlBrcFCjm3kuyGtb8SQHX9y1f5Hgq8tFyzxQkz+rrxbkJ8Ui4Cu+QIGE9VXn7QQJ0M
         ro4tLzccQ5ECryvuF6zlAJNwnh8rmI3aZ7am5MivSEj1naRdhuFFOwCaJls5IrDQ8cO5
         uka90VFnBnT2+BfLKlpN9ihaGkPnKjF0/+RQfX6+S0ZFb3a6k+3V67qaq/RnVF2Im4Ta
         LR8A==
X-Gm-Message-State: AOAM533FNohLrcvBagIZ7CnQGyVUdtMHGTuu0dCT4H8lOKuRnbiA/8U8
	WYlJti0HFslchC1erCIvZyc=
X-Google-Smtp-Source: ABdhPJyy3eR0gDnAhX3C/HEH14SRnfUcMXfMIdcbSZhbM9HNGfwc60C52iBkI8/ic1dG8y9Z3i4LAg==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr3540085wmj.144.1607078776876;
        Fri, 04 Dec 2020 02:46:16 -0800 (PST)
Date: Fri, 4 Dec 2020 10:46:14 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	xen-devel@lists.xenproject.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH] Fix spelling errors.
Message-ID: <20201204104614.s7wjirrxudrztoe4@liuwe-devbox-debian-v2>
References: <a60e2c98183d7c873f4e306954f900614fcdb582.1606757711.git.didi.debian@cknow.org>
 <3702b443-fd7b-6000-a952-0ecec6fe318c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3702b443-fd7b-6000-a952-0ecec6fe318c@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Dec 02, 2020 at 10:05:31AM +0100, Jan Beulich wrote:
> On 30.11.2020 18:39, Diederik de Haas wrote:
> > Only spelling errors; no functional changes.
> > 
> > In docs/misc/dump-core-format.txt there are a few more instances of
> > 'informations'. I'll leave that up to someone who can properly determine
> > how those sentences should be constructed.
> > 
> > Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> > 
> > Please CC me in replies as I'm not subscribed to this list.
> > ---
> >  docs/man/xl.1.pod.in                   | 2 +-
> >  docs/man/xl.cfg.5.pod.in               | 2 +-
> >  docs/man/xlcpupool.cfg.5.pod           | 2 +-
> >  tools/firmware/rombios/rombios.c       | 2 +-
> >  tools/libs/light/libxl_stream_read.c   | 2 +-
> >  tools/xl/xl_cmdtable.c                 | 2 +-
> 
> Since these are trivial and obvious adjustments, I intend to not wait
> very long for an xl/libxl side ack, before deciding to commit this.
> Perhaps just another day or so.

Please feel free to do this in the future for trivial changes like
fixing typos in comments and manpages.

Acked-by: Wei Liu <wl@xen.org>

> 
> Jan


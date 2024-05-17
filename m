Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8240D8C8D49
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 22:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724432.1129699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84CL-0001k0-9s; Fri, 17 May 2024 20:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724432.1129699; Fri, 17 May 2024 20:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84CL-0001iX-6e; Fri, 17 May 2024 20:29:01 +0000
Received: by outflank-mailman (input) for mailman id 724432;
 Fri, 17 May 2024 20:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s84CJ-0001iR-Tk
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 20:28:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14bf1afa-148c-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 22:28:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 828E7CE19DF;
 Fri, 17 May 2024 20:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E81FC2BD10;
 Fri, 17 May 2024 20:28:48 +0000 (UTC)
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
X-Inumbo-ID: 14bf1afa-148c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715977729;
	bh=sgyR0ItSUktpZeq8+TJLDrrZo9msa4hhF4TyojkEJ4o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CrvSvXGEO2Ptui9B6bf8XRrlVUxPlt3s756t47WRYB/yoQkRw6bAohNoLFg8i9IVr
	 arl6LrswhdvvPfjTtrNFg5YCNhvPsl3Z5YRUFklyYPn1jav5QYlc2tGlCNILlnj07o
	 H2wmB8rLNyVE5XEfFFMyLS1Zi9gaacvXI0AKtucwXBNb+txmmZ9WojqDecouets3bW
	 U97QHdsSoLoVC6StthAQoX3wAXRfvxofqY1tkDVm2jY2CeRskcS66nr4HSGG5c502V
	 C7OrqEWtepAYuYKOtfZszdSe0dbGny+oR3SCuLnINL3o/tXGkWiEu5lkovEiMicffC
	 Xaxw989jhJmbA==
Date: Fri, 17 May 2024 13:28:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
In-Reply-To: <e75ca24e-12fe-44ac-9c67-bcc222ac8752@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405171328250.1052252@ubuntu-linux-20-04-desktop>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com> <11957460-0b2b-432d-ad92-38350306c9ff@suse.com> <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com> <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com> <alpine.DEB.2.22.394.2405161806560.2544314@ubuntu-linux-20-04-desktop>
 <e75ca24e-12fe-44ac-9c67-bcc222ac8752@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 May 2024, Jan Beulich wrote:
> On 17.05.2024 03:21, Stefano Stabellini wrote:
> > On Thu, 16 May 2024, Jan Beulich wrote:
> >> 1) In the discussion George claimed that exposing status information in
> >> an uncontrolled manner is okay. I'm afraid I have to disagree, seeing
> >> how a similar assumption by CPU designers has led to a flood of
> >> vulnerabilities over the last 6+ years. Information exposure imo is never
> >> okay, unless it can be _proven_ that absolutely nothing "useful" can be
> >> inferred from it. (I'm having difficulty seeing how such a proof might
> >> look like.)
> > 
> > Many would agree that it is better not to expose status information in
> > an uncontrolled manner. Anyway, let's focus on the actionable.
> > 
> > 
> >> 2) Me pointing out that the XSM hook might similarly get in the way of
> >> debugging, Andrew suggested that this is not an issue because any sensible
> >> XSM policy used in such an environment would grant sufficient privilege to
> >> Dom0. Yet that then still doesn't cover why DomU-s also can obtain status
> >> for Xen-internal event channels. The debugging argument then becomes weak,
> >> as in that case the XSM hook is possibly going to get in the way.
> >>
> >> 3) In the discussion Andrew further gave the impression that evtchn_send()
> >> had no XSM check. Yet it has; the difference to evtchn_status() is that
> >> the latter uses XSM_TARGET while the former uses XSM_HOOK. (Much like
> >> evtchn_status() may indeed be useful for debugging, evtchn_send() may be
> >> similarly useful to allow getting a stuck channel unstuck.)
> >>
> >> In summary I continue to think that an outright revert was inappropriate.
> >> DomU-s should continue to be denied status information on Xen-internal
> >> event channels, unconditionally and independent of whether dummy, silo, or
> >> Flask is in use.
> > 
> > I think DomU-s should continue to be denied status information on
> > Xen-internal event channels *based on the default dummy, silo, or Flask
> > policy*. It is not up to us to decide the security policy, only to
> > enforce it and provide sensible defaults.
> > 
> > In any case, the XSM_TARGET check in evtchn_status seems to do what we
> > want?
> 
> No. XSM_TARGET permits the "owning" (not really, but it's its table) domain
> access. See xsm_default_action() in xsm/dummy.h.

Sorry I still don't understand. Why is that a problem? It looks like the
wanted default behavior?


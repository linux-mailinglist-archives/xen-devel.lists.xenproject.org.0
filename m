Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF393020E
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758329.1167770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOZf-0006By-LE; Fri, 12 Jul 2024 22:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758329.1167770; Fri, 12 Jul 2024 22:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOZf-00069W-Ii; Fri, 12 Jul 2024 22:17:07 +0000
Received: by outflank-mailman (input) for mailman id 758329;
 Fri, 12 Jul 2024 22:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOZe-00069Q-Hd
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:17:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7720d961-409c-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 00:17:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9CE2CE1B79;
 Fri, 12 Jul 2024 22:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AE2C32786;
 Fri, 12 Jul 2024 22:16:59 +0000 (UTC)
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
X-Inumbo-ID: 7720d961-409c-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720822621;
	bh=4c/a0M44Eti2a9FQqLrhFb0xLlBWBMpRPlQL4b4M/Ng=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pb90QKhd05pLCC20AtutRJ8OsVhZbTRuAy2SvVtBMO7gBGQeh7l738Li/T5m+rcyb
	 dXZ6VNUFJnL9xjVp1qbW5ztZ30f44zHf7p39++EgM9sd/2cMEch8b9D3Dujz+oXaeB
	 2r8tLoPWDLnr130y2idm4oRMERmKElUrYnz/zeddBkz7KLcBlngqDD1jYrbxYJD9YO
	 ynaFfxQM1dDFfKITVRToDVzH6RSeRDGVMJ5DckrEADZ9o5DhK9NyVh58JIccGd//T+
	 +iTqtlJQukyJ4Ie5k6MjHIlPO2GVM3ysZFpnIdOVW21LysygFMRtP03TWBGx4f2cOT
	 L0ZMOupaUkM3Q==
Date: Fri, 12 Jul 2024 15:16:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    nicola.vetrini@bugseng.com, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 09/17] xen: address violations of MISRA C:2012 Directive
 4.10
In-Reply-To: <5f31aa96-52a8-413a-8c10-0ad01d095be9@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407121513300.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <76caa62c49a7aa02e43892f9edd72d90e9f39243.1719829101.git.alessandro.zucchelli@bugseng.com> <5f31aa96-52a8-413a-8c10-0ad01d095be9@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Jul 2024, Jan Beulich wrote:
> On 01.07.2024 15:36, Alessandro Zucchelli wrote:
> > --- a/xen/include/xen/err.h
> > +++ b/xen/include/xen/err.h
> > @@ -1,5 +1,6 @@
> > -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
> > -#define __XEN_ERR_H__
> > +#ifndef INCLUDE_XEN_ERR_H
> > +#define INCLUDE_XEN_ERR_H
> 
> There once was a document (or was it a patch description) describing the
> naming system for these guards. Where did that go? With include files
> typically living under include/, seeing INCLUDE_ as a prefix is, well,
> odd and unnecessary baggage. I also don't recall there having been
> agreement to use names like the ones presented here.

I agree with Jan that INCLUDE_ is unnecessary and looking at patch #0
and our previous discussions it would seem that this case was not
covered.

I think we should just use XEN_ERR_H

The rule could be (to be added to the others in patch #0):
- xen/include/xen -> XEN_<filename>_H


> > +#ifndef __ASSEMBLY__
> >  
> >  #include <xen/compiler.h>
> >  #include <xen/errno.h>
> > @@ -41,4 +42,5 @@ static inline int __must_check PTR_RET(const void *ptr)
> >  	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
> >  }
> >  
> > -#endif /* __XEN_ERR_H__ */
> > +#endif /* __ASSEMBLY__ */
> > +#endif /* INCLUDE_XEN_ERR_H */
> > diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
> > index e798477a7e..8e40c78db7 100644
> > --- a/xen/include/xen/pci_ids.h
> > +++ b/xen/include/xen/pci_ids.h
> > @@ -1,3 +1,6 @@
> > +#ifndef INCLUDE_XEN_PCI_IDS_H
> > +#define INCLUDE_XEN_PCI_IDS_H
> > +
> >  #define PCI_VENDOR_ID_AMD                0x1022
> >  
> >  #define PCI_VENDOR_ID_NVIDIA             0x10de
> > @@ -11,3 +14,5 @@
> >  #define PCI_VENDOR_ID_BROADCOM           0x14e4
> >  
> >  #define PCI_VENDOR_ID_INTEL              0x8086
> > +
> > +#endif /* INCLUDE_XEN_PCI_IDS_H */
> > diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
> > index 33d6f2ecd2..90d4875df7 100644
> > --- a/xen/include/xen/softirq.h
> > +++ b/xen/include/xen/softirq.h
> > @@ -1,5 +1,6 @@
> > -#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
> > -#define __XEN_SOFTIRQ_H__
> > +#ifndef INCLUDE_XEN_SOFTIRQ_H
> > +#define INCLUDE_XEN_SOFTIRQ_H
> > +#ifndef __ASSEMBLY__
> >  
> >  /* Low-latency softirqs come first in the following list. */
> >  enum {
> > @@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
> >   */
> >  void process_pending_softirqs(void);
> >  
> > -#endif /* __XEN_SOFTIRQ_H__ */
> > +#endif /* __ASSEMBLY__ */
> > +#endif /* INCLUDE_XEN_SOFTIRQ_H */
> > diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> > index 0c16baa85f..ec1b6b05e9 100644
> > --- a/xen/include/xen/vmap.h
> > +++ b/xen/include/xen/vmap.h
> > @@ -1,5 +1,6 @@
> > -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> > -#define __XEN_VMAP_H__
> > +#ifndef INCLUDE_XEN_VMAP_H
> > +#define INCLUDE_XEN_VMAP_H
> > +#ifdef VMAP_VIRT_START
> >  
> >  #include <xen/mm-frame.h>
> >  #include <xen/page-size.h>
> > @@ -42,4 +43,5 @@ static inline void vm_init(void)
> >      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
> >  }
> >  
> > -#endif /* __XEN_VMAP_H__ */
> > +#endif /* VMAP_VIRT_START */
> > +#endif /* INCLUDE_XEN_VMAP_H */
> 
> 


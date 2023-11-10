Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B07E75F4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 01:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629869.982396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1FOq-0000si-I4; Fri, 10 Nov 2023 00:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629869.982396; Fri, 10 Nov 2023 00:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1FOq-0000qE-Ev; Fri, 10 Nov 2023 00:29:28 +0000
Received: by outflank-mailman (input) for mailman id 629869;
 Fri, 10 Nov 2023 00:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1FOo-0000q6-IQ
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 00:29:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3013cab7-7f60-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 01:29:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BBFE0CE1361;
 Fri, 10 Nov 2023 00:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66994C433C8;
 Fri, 10 Nov 2023 00:29:10 +0000 (UTC)
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
X-Inumbo-ID: 3013cab7-7f60-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699576152;
	bh=yaUjg1nbC8QuQzNSKMnWTs4sGgS5aZkxEedxBW5MpsE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m0ej2oT+BG5ImC3offzq19AiOihE3JWdkozwb1yQBMECcKq0W6Gb9zt8wBDD+y/IB
	 9ZzqFFTAyd7FL88zZkScsS+P9pXFe0B9EXKdgfzt0Qd0ECt7TBbLmPy8NQfCuMF8T0
	 pvKmAx1+ipbFHe354AwUevGWU6mfGQ/UxQn6m+1wQfIx3xqMY+JFEKnvZf5xgv6LFS
	 Rd56RxTxFGYtAaWVGwD8Qn7zlJUh8UfqgjY1qRNGKWgZi9Zs6B8tYEXg2qjRJN0f68
	 NXiqpjAFtrrkVqBcJsPODV50jI2fWCLzLwduUNr3pdG83n0cIxU3H45StsceKslkxe
	 RZmrDUDqX8lOQ==
Date: Thu, 9 Nov 2023 16:29:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
In-Reply-To: <483f3b34-ebd4-4613-b083-596bebf5ac15@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311091614010.3478774@ubuntu-linux-20-04-desktop>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com> <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com> <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com> <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
 <b407f981-c58c-4272-bc7c-1470a87e2487@xen.org> <4b4583f5-4cdb-6be9-20eb-22466b6aef28@suse.com> <483f3b34-ebd4-4613-b083-596bebf5ac15@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Nov 2023, Julien Grall wrote:
> On 09/11/2023 07:42, Jan Beulich wrote:
> > On 08.11.2023 14:33, Julien Grall wrote:
> > > Hi Jan,
> > > 
> > > On 08/11/2023 11:19, Jan Beulich wrote:
> > > > On 08.11.2023 12:03, Nicola Vetrini wrote:
> > > > > On 2023-11-08 09:24, Jan Beulich wrote:
> > > > > > On 03.11.2023 18:58, Nicola Vetrini wrote:
> > > > > > > Static analysis tools may detect a possible null
> > > > > > > pointer dereference at line 760 (the memcpy call)
> > > > > > > of xen/common/domain.c. This ASSERT helps them in
> > > > > > > detecting that such a condition is not possible
> > > > > > > and also provides a basic sanity check.
> > > > > > 
> > > > > > I disagree with this being a possible justification for adding such
> > > > > > a
> > > > > > redundant assertion. More detail is needed on what is actually
> > > > > > (suspected to be) confusing the tool. Plus it also needs explaining
> > > > > > why (a) adding such an assertion helps and (b) how that's going to
> > > > > > cover release builds.
> > > > > > 
> > > > > 
> > > > > How about:
> > > > > "Static analysis tools may detect a possible null pointer dereference
> > > > > at line 760 (config->handle) due to config possibly being NULL.
> > > > > 
> > > > > However, given that all system domains, including IDLE, have a NULL
> > > > > config and in the code path leading to the assertion only real domains
> > > > > (which have a non-NULL config) can be present."
> > > > > 
> > > > > On point b): this finding is a false positive, therefore even if the
> > > > > ASSERT is
> > > > > expanded to effectively a no-op, there is no inherent problem with
> > > > > Xen's
> > > > > code.
> > > > > The context in which the patch was suggested [1] hinted at avoiding
> > > > > inserting in
> > > > > the codebase false positive comments.
> > > > 
> > > > Which I largely agree with. What I don't agree with is adding an
> > > > assertion which is only papering over the issue, and only in debug
> > > > builds.
> > > 
> > > I expect that the number of issues will increase a lot as soon as we
> > > start to analyze production builds.
> > > 
> > > I don't think it will be a solution to either replace all the ASSERT()
> > > with runtime check in all configuration or even...
> > > 
> > > > So perhaps instead we need a different way of tracking
> > > > false positives (which need to be tied to specific checker versions
> > > > anyway).
> > > 
> > > ... documenting false positive.
> > > 
> > > IMHO, the only viable option would be to have a configuration to keep
> > > ASSERT in production build for scanning tools.
> > 
> > But wouldn't that then likely mean scanning to be done on builds not also
> > used in production? Would doing so even be permitted when certification
> > is a requirement? Or do you expect such production builds to be used with
> > the assertions left in place (increasing the risk of a crash; recall that
> > assertions themselves may also be wrong, and hence one triggering in rare
> > cases may not really be a reason to bring down the system)?
> 
> I will leave Stefano/Nicola to answer from the certification perspective. But
> I don't really see how we could get away unless we replace most of the
> ASSERT() with proper runtime check (which may not be desirable for ASSERT()s
> like this one).

For sure we don't want to replace ASSERTs with runtime checks.

Nicola, do we really need the ASSERT to be implemented as a check, or
would the presence of the ASSERT alone suffice as a tag, the same way we
would be using /* SAF-xx-safe */ or asmlinkage?

If we only need ASSERT as a deviation tag, then production builds vs.
debug build doesn't matter.

If ECLAIR actually needs ASSERT to be implemented as a check, could we
have a special #define to define ASSERT in a special way for static
analysis tools in production builds? For instance:

#ifdef STATIC_ANALYSIS
#define ASSERT(p) \
    do { if ( unlikely(!(p)) ) printk("ASSERT triggered %s:%d", __file__,__LINE__); } while (0)
#endif

Nicola, would that be enough?


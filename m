Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF434E5479
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 15:45:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293923.499510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX2E9-0008LP-1C; Wed, 23 Mar 2022 14:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293923.499510; Wed, 23 Mar 2022 14:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX2E8-0008JO-UH; Wed, 23 Mar 2022 14:44:44 +0000
Received: by outflank-mailman (input) for mailman id 293923;
 Wed, 23 Mar 2022 14:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmH6=UC=verge.net.au=horms@vergenet.net>)
 id 1nX2E7-00083W-Kl
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 14:44:43 +0000
Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6688d50-aab7-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 15:44:43 +0100 (CET)
Received: from madeliefje.horms.nl (86-88-72-229.fixed.kpn.net [86.88.72.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by zeeaster.vergenet.net (Postfix) with ESMTPSA id 3002B200C6;
 Wed, 23 Mar 2022 14:43:42 +0000 (UTC)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
 id D56072ECE; Wed, 23 Mar 2022 15:43:41 +0100 (CET)
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
X-Inumbo-ID: c6688d50-aab7-11ec-a405-831a346695d4
Date: Wed, 23 Mar 2022 15:43:41 +0100
From: Simon Horman <horms@verge.net.au>
To: Raphael Ning <raphning@gmail.com>
Cc: kexec@lists.infradead.org, Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org, Raphael Ning <raphning@amazon.com>
Subject: Re: [PATCH] kexec-xen: Allow xen_kexec_exec() to return in case of
 Live Update
Message-ID: <YjsyHWtQArHXVZYJ@vergenet.net>
References: <20220314092115.48309-1-raphning@gmail.com>
 <Yjsp5zsc1lseY2M9@vergenet.net>
 <b1aea785-1631-2afc-2d8c-c21067903978@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1aea785-1631-2afc-2d8c-c21067903978@gmail.com>
Organisation: Horms Solutions BV
X-Virus-Scanned: clamav-milter 0.103.5 at zeeaster
X-Virus-Status: Clean

On Wed, Mar 23, 2022 at 02:20:52PM +0000, Raphael Ning wrote:
> 
> On 23/03/2022 14:08, Simon Horman wrote:
> > Hi Raphael,
> > thanks for your patch. Overall I think this is good.
> >
> > Unfortunately I am seeing a build failure with this patch applied.
> >
> >  ../../kexec/kexec-xen.c:292:6: error: conflicting types for ‘xen_kexec_exec’
> >   292 | void xen_kexec_exec(uint64_t kexec_flags)
> >       |      ^~~~~~~~~~~~~~
> > In file included from ../../kexec/kexec-xen.c:6:
> > ../../kexec/kexec.h:327:5: note: previous declaration of ‘xen_kexec_exec’ was here
> >   327 | int xen_kexec_exec(uint64_t kexec_flags);
> >       |     ^~~~~~~~~~~~~~
> > make[1]: *** [Makefile:124: kexec/kexec-xen.o] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> >
> > See: https://github.com/horms/kexec-tools/runs/5661629877?check_suite_focus=true
> 
> 
> Hi Simon,
> 
> 
> Thanks for the review.  The conflicting declaration is for the --without-xen build, which I didn't test.  Let me fix that and post a new revision.

Thanks Raphael,

much appreciated.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344C4E5402
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 15:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293908.499478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX1fK-0003JL-MV; Wed, 23 Mar 2022 14:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293908.499478; Wed, 23 Mar 2022 14:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX1fK-0003H7-JN; Wed, 23 Mar 2022 14:08:46 +0000
Received: by outflank-mailman (input) for mailman id 293908;
 Wed, 23 Mar 2022 14:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmH6=UC=verge.net.au=horms@vergenet.net>)
 id 1nX1fI-0003Gy-Hn
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 14:08:44 +0000
Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdc8ec65-aab2-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 15:08:41 +0100 (CET)
Received: from madeliefje.horms.nl (86-88-72-229.fixed.kpn.net [86.88.72.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by zeeaster.vergenet.net (Postfix) with ESMTPSA id 1F39A200C6;
 Wed, 23 Mar 2022 14:08:40 +0000 (UTC)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
 id C82EF2ECE; Wed, 23 Mar 2022 15:08:39 +0100 (CET)
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
X-Inumbo-ID: bdc8ec65-aab2-11ec-8fbc-03012f2f19d4
Date: Wed, 23 Mar 2022 15:08:39 +0100
From: Simon Horman <horms@verge.net.au>
To: Raphael Ning <raphning@gmail.com>
Cc: kexec@lists.infradead.org, Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org, Raphael Ning <raphning@amazon.com>
Subject: Re: [PATCH] kexec-xen: Allow xen_kexec_exec() to return in case of
 Live Update
Message-ID: <Yjsp5zsc1lseY2M9@vergenet.net>
References: <20220314092115.48309-1-raphning@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220314092115.48309-1-raphning@gmail.com>
Organisation: Horms Solutions BV
X-Virus-Scanned: clamav-milter 0.103.5 at zeeaster
X-Virus-Status: Clean

On Mon, Mar 14, 2022 at 09:21:15AM +0000, Raphael Ning wrote:
> From: Raphael Ning <raphning@amazon.com>
> 
> Currently, my_exec() does not expect the Xen KEXEC_CMD_kexec hypercall
> to return on success, because it assumes that the hypercall always
> triggers an immediate reboot. However, for Live Update, the hypercall
> merely schedules the kexec operation and returns; the actual reboot
> happens asynchronously. [1]
> 
> Therefore, rework the Xen code path of my_exec() such that it does not
> treat a successfully processed Live Update request as an error. Also,
> rephrase the comment above the function to remove ambiguity.
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2021-05/msg00286.html
> 
> Signed-off-by: Raphael Ning <raphning@amazon.com>

Hi Raphael,

thanks for your patch. Overall I think this is good.

Unfortunately I am seeing a build failure with this patch applied.

 ../../kexec/kexec-xen.c:292:6: error: conflicting types for ‘xen_kexec_exec’
  292 | void xen_kexec_exec(uint64_t kexec_flags)
      |      ^~~~~~~~~~~~~~
In file included from ../../kexec/kexec-xen.c:6:
../../kexec/kexec.h:327:5: note: previous declaration of ‘xen_kexec_exec’ was here
  327 | int xen_kexec_exec(uint64_t kexec_flags);
      |     ^~~~~~~~~~~~~~
make[1]: *** [Makefile:124: kexec/kexec-xen.o] Error 1
make[1]: *** Waiting for unfinished jobs....

See: https://github.com/horms/kexec-tools/runs/5661629877?check_suite_focus=true


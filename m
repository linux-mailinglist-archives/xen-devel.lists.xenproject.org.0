Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D164667721
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476202.738264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjp-0002jh-TP; Thu, 12 Jan 2023 14:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476202.738264; Thu, 12 Jan 2023 14:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjp-0002dz-Na; Thu, 12 Jan 2023 14:39:29 +0000
Received: by outflank-mailman (input) for mailman id 476202;
 Thu, 12 Jan 2023 14:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdGT=5J=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pFyjm-0002av-PO
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:39:28 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7f3caf7-9286-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 15:39:23 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pFyjn-0057zf-Vo; Thu, 12 Jan 2023 14:39:28 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E8514300C22;
 Thu, 12 Jan 2023 15:39:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id AF0012C539AAE; Thu, 12 Jan 2023 15:39:12 +0100 (CET)
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
X-Inumbo-ID: e7f3caf7-9286-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=dxKp4F/ZypynYhxVQrwpFBE7F8I1udIiZ+qCB0euLH8=; b=Qw76boxsic6bAdPZ+sbUQ2gqH+
	toujE3QAL7Ysrb/kR6kbNWK8+/9lcxeR5snVxN72gLXv54orCAYheJOMSUJTxsIOq6nlVdd9M05yx
	xzAl7+DGS02CDXkNHHjeh7e9nMs5aY0qzl9lI/Ybug1C2cN+L9cUSAyH9scpEzK8O5SsQgYiCg6Y5
	jAK6oY9jXCznsqioTj6bpA+gfUlBJJaabAP8t+fNLnSC0fudkg27IKcOz4kzbhxN1B+GtqFgHO05t
	iG2Tq/6Nx3QTZSzkBCmPsHHW89g1u9fdQigJA6ONkHFfsmbKlG6YcpbLdRrHDBiKoAXxjMOx3j3S3
	79pDM38g==;
Message-ID: <20230112143141.645645775@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 15:31:41 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org,
 Joan Bruguera <joanbrugueram@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Kees Cook <keescook@chromium.org>,
 mark.rutland@arm.com
Subject: [RFC][PATCH 0/6] x86: Fix suspend vs retbleed=stuff

Hi,

I'm thinking these few patches should do the trick -- but I've only compiled
them and looked at the resulting asm output, I've not actually ran them.

Joan, could you kindly test?

The last (two) patches are optional fixes and should probably not go into /urgent.



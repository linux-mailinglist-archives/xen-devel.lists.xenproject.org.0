Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26B66C255
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478648.741984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQca-0003GY-Gb; Mon, 16 Jan 2023 14:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478648.741984; Mon, 16 Jan 2023 14:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQca-0003C1-8v; Mon, 16 Jan 2023 14:38:00 +0000
Received: by outflank-mailman (input) for mailman id 478648;
 Mon, 16 Jan 2023 14:37:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQcW-0002Pk-Pb
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:37:58 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cd572d9-95ab-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:37:55 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHQc7-005csx-17; Mon, 16 Jan 2023 14:37:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E1E283007C5;
 Mon, 16 Jan 2023 15:37:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id A94B22081B292; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 5cd572d9-95ab-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=myQj/MBdPle3LrkO0rdNRoaNXUdtePdBjz6BKLQ5f+E=; b=FLqszaemcNeksY+EzWYCNg5GsL
	/G5G9NGNsU5jSnXxmUVfg9zG6N/3rGrhBPe83E3mCwQJwFiPtv8xLfUsSjfoBhZsvFtKTQ1zUjPJn
	loCzDMF4bI22KL1b9sTSVxk7fHjzXBVSse/Lwsv3dC7P30UtJgbySM1qUCQ7MOTR2TwOglVOWs9hT
	33DfxsJhDNCZvED7aBcJBwNHXcILUuCh/DHiTwhRVuw4HWX/ilGletp3oUrAu2C5nKWm5xshkfTdK
	qREZO4eRXzw9xnacQMHb2wRGQM7vUlh1iTHsSlwu3j+0/G5iySYxx1czWr0FWKGo1MB1E/AVje45d
	zxW+5voA==;
Message-ID: <20230116142533.905102512@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:33 +0100
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
 mark.rutland@arm.com,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 0/7] x86: retbleed=stuff fixes

Hi all,

Patches to address the various callthunk fails reported by Joan.

The first two patches are new (and I've temporarily dropped the
restore_processor_state sealing).

It is my understanding that AP bringup will always use the 16bit trampoline
path, if this is not the case, please holler.




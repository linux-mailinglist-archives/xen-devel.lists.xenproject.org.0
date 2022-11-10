Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF7B624918
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 19:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442109.696144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otBxp-0005t9-BG; Thu, 10 Nov 2022 18:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442109.696144; Thu, 10 Nov 2022 18:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otBxp-0005ph-8N; Thu, 10 Nov 2022 18:07:45 +0000
Received: by outflank-mailman (input) for mailman id 442109;
 Thu, 10 Nov 2022 18:07:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9a/=3K=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1otBxn-0005pb-G7
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 18:07:44 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 915fe572-6122-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 19:07:42 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1otBxJ-00ALFj-P7; Thu, 10 Nov 2022 18:07:14 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5777E30041D;
 Thu, 10 Nov 2022 19:07:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3CDAE2BB18BCD; Thu, 10 Nov 2022 19:07:12 +0100 (CET)
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
X-Inumbo-ID: 915fe572-6122-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TAqMJ9XEgcb7EhZe2sWVJH4nswduJ2xyoOUcpLbLbEM=; b=hfNGu4eXvHj3RG9HNpNohVHc16
	ipyrTZ3rsXdUovuTXkVMvNvcA9s8TrtXk46ii1oNq2be7fSpxn6H9eegzIIAWqSVBXTJcK+Ez8+ME
	pOohQG7JKCGxgTNvUSu6SVJSB8qaAcJEbh+/iu2qYAPFTQHYlwRHmMAHQnvuhFChodjPEahlNbJDM
	aKBfh5GytMaVXtYrg2V4hwEYK9qeBj8H7Jhh6YIPmYGzxi3ntCfEJmDD/eWv0aNF4pkmwcDlko2Kx
	27mtN6UPSwW5ZHDyfQFaxCUgc+ItsGMDVOkBT/pytFNCUiIliVRqVjHseXp0Yyg2bgDiXn6TI70/I
	VDHKTGcA==;
Date: Thu, 10 Nov 2022 19:07:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
	dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
	trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
	jgross@suse.com, boris.ostrovsky@oracle.com,
	andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 2/2] x86: Check return values from early_ioremap calls
Message-ID: <Y2090DOT3q5CX9kV@hirez.programming.kicks-ass.net>
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-3-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110154521.613472-3-ross.philipson@oracle.com>

On Thu, Nov 10, 2022 at 03:45:21PM +0000, Ross Philipson wrote:
> On allocation failures, panic() was used since this seemed
> to be the action taken on other failures in the modules
> touched by this patch.

How is the panic() more useful than the obvious NULL deref that also
splats?


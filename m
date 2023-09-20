Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785BC7A87C5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 17:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605789.943386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiyhJ-0002Mt-W2; Wed, 20 Sep 2023 15:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605789.943386; Wed, 20 Sep 2023 15:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiyhJ-0002K7-TC; Wed, 20 Sep 2023 15:01:01 +0000
Received: by outflank-mailman (input) for mailman id 605789;
 Wed, 20 Sep 2023 15:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GbOY=FE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qiyhI-0002Jz-9h
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 15:01:00 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80cc9386-57c6-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 17:00:57 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qiygf-00Efi6-1Z; Wed, 20 Sep 2023 15:00:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8FF67300348; Wed, 20 Sep 2023 17:00:22 +0200 (CEST)
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
X-Inumbo-ID: 80cc9386-57c6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rWkB7EDNng9M39a7Z5ofZ+3H/5SPbGNHhMrFP2dtGbY=; b=gbBwTJ41KAmMXmjfJHdJuM7m3X
	hExgqa3hFHE8oGJcBGAwWV1T/3bCar8Q/4J6kCFh3lPc6C1w5JSzk0t/sppfTeuOuPqbkwJYbcQCA
	Msu0ZRdMcoOovrESWX3e875PmIMIBSrS4FtQ6mkCe/JdrliuRxauJrt0MJcZjPdo7EqSm+fAmOhwe
	trz1GroFYHwCKDYsYL97k/F/mFR5NvDSXdmntjJExEs8ifO6+1NTZod2ifPXoYaZVSZxEMeqngWfs
	NrrhUFV7r0Gl9W5Rr7JEAOnQhVOOIU0Ua8nWwf0A1uLrrKzCuLGBjfkYGwTe+kgu4Pq9ruGUQXJ33
	qvYYaX6A==;
Date: Wed, 20 Sep 2023 17:00:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: andrew.cooper3@citrix.com
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
	Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, luto@kernel.org,
	pbonzini@redhat.com, seanjc@google.com, jgross@suse.com,
	ravi.v.shankar@intel.com, mhiramat@kernel.org,
	jiangshanlai@gmail.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Message-ID: <20230920150022.GH424@noisy.programming.kicks-ass.net>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com>
 <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com>
 <0e7d37db-e1af-ac40-6eca-5565d1bebcde@zytor.com>
 <6575702e-fea5-61b2-dd61-7b556a8603e8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6575702e-fea5-61b2-dd61-7b556a8603e8@citrix.com>

On Fri, Sep 15, 2023 at 02:16:50AM +0100, andrew.cooper3@citrix.com wrote:

> Juergen has already done the work to delete one of these two patching
> mechanisms and replace it with the other.
> 
> https://lore.kernel.org/lkml/a32e211f-4add-4fb2-9e5a-480ae9b9bbf2@suse.com/
> 
> Unfortunately, it's only collecting pings and tumbleweeds.

Fixed that...


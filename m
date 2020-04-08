Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5761A1F99
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8cD-0002YI-Le; Wed, 08 Apr 2020 11:11:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LAz7=5Y=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1jM8cC-0002YB-Gb
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:11:28 +0000
X-Inumbo-ID: b0117714-7989-11ea-83d8-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0117714-7989-11ea-83d8-bc764e2007e4;
 Wed, 08 Apr 2020 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CGYxPY0UmZ+KsvjUaaa1RrlD6l1Y5r/qTWBeIw/gLCU=; b=qL3pjtMbis9rU768jBizcb/Iy5
 lkgPZ7sOpK/DsPBuKBnqJPwEoh7EzhRMARN9MxfFoYYI+3cRY8PVXlVrCrA0udfxR5EDjqMc0V+re
 nLC3SDkLS8Utb2VXyecpgZfXVUU5LMrwtS04bHrIHbiRDeITZiyVdGtK48rrTsO5hjWT0m0UeuXg1
 tqHJFc/BZHLjSBL8q/xUAIWPg4h93yY40YdgaGCVageZbXlihC5CmwwZiGswbW56qbS7qUjqaFCUs
 xSCtdr8d62RmcMAbt4O+MdMpNnruGMaaKjQTvSpcNi0aZG7iWT2tmw1b7zea1c4rmvcajFYLhz76g
 i4M6h/2g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8c8-0005fM-F0; Wed, 08 Apr 2020 11:11:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C0CD1300130;
 Wed,  8 Apr 2020 13:11:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AC0CC2B120793; Wed,  8 Apr 2020 13:11:22 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:11:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 14/26] x86/alternatives: Handle native insns in
 text_poke_loc*()
Message-ID: <20200408111122.GT20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408050323.4237-15-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-15-ankur.a.arora@oracle.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, hpa@zytor.com, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 10:03:11PM -0700, Ankur Arora wrote:
>  struct text_poke_loc {
>  	s32 rel_addr; /* addr := _stext + rel_addr */
> -	s32 rel32;
> -	u8 opcode;
> +	union {
> +		struct {
> +			s32 rel32;
> +			u8 opcode;
> +		} emulated;
> +		struct {
> +			u8 len;
> +		} native;
> +	};
>  	const u8 text[POKE_MAX_OPCODE_SIZE];
>  };

NAK, this grows the structure from 16 to 20 bytes.


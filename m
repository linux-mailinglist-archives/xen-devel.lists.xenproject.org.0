Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F631A1FB6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:18:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8iP-0002w1-0I; Wed, 08 Apr 2020 11:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LAz7=5Y=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1jM8iN-0002vv-SO
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:17:51 +0000
X-Inumbo-ID: 9571be40-798a-11ea-83d8-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9571be40-798a-11ea-83d8-bc764e2007e4;
 Wed, 08 Apr 2020 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3YJqaOoM4AXHXL0XANzFtbQE1EpTeXAe0og/pFKkpCA=; b=I26DyJnGGGzpg8aW0CSl3TSO8/
 fCLcInYqjvbFiDB3N97TYX+H95E7s7uhQVs1LywnJrxvQAyQKrsXOH4HCqon7QCoisfEoaw6RVFDS
 NQOCO/S4ycVdQoxRL46SZ2UfRTHDCE0HFlkAY/BrTNmWRge1970iZq7hPoYzBfUytDGspcPrPDjhj
 lDsRcJWFs6qo8zxx5srQ71V1LToOn2jGFgto63isvIjWn9uZp/yp5qMXQVuaeLYT2wjloOAyaBt4C
 CZadKhWG7I0rpK07+OqaLbMseS8zTcP0JuX9+Fe8qNltNOQHzKTM5TMcUHTWVQtPsjS20OYk7jLcj
 W3k8stdA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8iL-0000RC-Gm; Wed, 08 Apr 2020 11:17:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C4D5B300130;
 Wed,  8 Apr 2020 13:17:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B0E612BA90A63; Wed,  8 Apr 2020 13:17:47 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:17:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 14/26] x86/alternatives: Handle native insns in
 text_poke_loc*()
Message-ID: <20200408111747.GV20713@hirez.programming.kicks-ass.net>
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
> @@ -1071,10 +1079,13 @@ int notrace poke_int3_handler(struct pt_regs *regs)
>  			goto out_put;
>  	}
>  
> -	len = text_opcode_size(tp->opcode);
> +	if (desc->native)
> +		BUG();
> +

Subject: x86/alternatives: Handle native insns in text_poke_loc*()

That's not really handling, is it..


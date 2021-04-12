Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726735C9CF
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109312.208684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyST-0006H2-SS; Mon, 12 Apr 2021 15:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109312.208684; Mon, 12 Apr 2021 15:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyST-0006Gd-OV; Mon, 12 Apr 2021 15:26:37 +0000
Received: by outflank-mailman (input) for mailman id 109312;
 Mon, 12 Apr 2021 15:26:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVySS-0006GY-N6
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:26:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56436422-1525-4985-9dc1-601ffdf83fc8;
 Mon, 12 Apr 2021 15:26:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 488E1B30F;
 Mon, 12 Apr 2021 15:26:35 +0000 (UTC)
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
X-Inumbo-ID: 56436422-1525-4985-9dc1-601ffdf83fc8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618241195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U45TIDWibRK1VXcX/BDkTpfwb2jtH19hWP99+CyiQXM=;
	b=ar/edU1XgZFp+8cJbTuYgNrg56jlxxuUFf2v1hpNYG63NdytZ9/XfNY9cgzdRBkEnePb3O
	S5LzCiD9oIuV6y6XeMCbNnXEx9xFgiWFGzEC9okV0yV+YN12Zz+pkcbgWjpZ+vbgt+g2ug
	TVJ0+NHgnQ36oQYDGVyiFBoQl5BexQg=
Subject: Re: [PATCH v2] x86/cpuid: Advertise no-lmsl unilaterally to hvm
 guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210412150641.24450-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31e00b90-6a2f-6fdb-9346-2b45dcb256e7@suse.com>
Date: Mon, 12 Apr 2021 17:26:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412150641.24450-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 17:06, Andrew Cooper wrote:
> While part of the original AMD64 spec, Long Mode Segment Limit was a feature
> not picked up by Intel, and therefore didn't see much adoption in software.
> AMD have finally dropped the feature from hardware, and allocated a CPUID bit
> to indicate its absence.
> 
> Xen has never supported the feature for guests, even when running on capable
> hardware, so advertise the feature's absence unilaterally.
> 
> There is nothing specifically wrong with exposing this bit to PV guests, but
> the PV ABI doesn't include a working concept of MSR_EFER in the first place,
> so exposing it to PV guests would be out-of-place.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


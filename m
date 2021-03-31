Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E9C35040F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 18:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104007.198455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRdJ2-0003Xy-8K; Wed, 31 Mar 2021 16:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104007.198455; Wed, 31 Mar 2021 16:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRdJ2-0003Xc-4q; Wed, 31 Mar 2021 16:02:56 +0000
Received: by outflank-mailman (input) for mailman id 104007;
 Wed, 31 Mar 2021 16:02:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRdJ0-0003XX-Jn
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 16:02:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 278084ea-551e-40be-a0f3-adf6d70b4ae5;
 Wed, 31 Mar 2021 16:02:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33513B308;
 Wed, 31 Mar 2021 16:02:52 +0000 (UTC)
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
X-Inumbo-ID: 278084ea-551e-40be-a0f3-adf6d70b4ae5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617206572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNXTuZMlTjXJX8GnpQtGtCjAvrIWn1Bn/qb+aaARyYA=;
	b=J1rt22ZtQLuwbM/rLEqNS7HmtAI7d8sx4TjkzuI34KO9CQtB/c9KZGOUsnz/LsPe2Wolt/
	FRJa8Gs7xkeJhhYmZic87lMD/PfUqo57ERERmTefuoA9s8o1wHe9EzrIPTVP0aPN8zXcCg
	a0daBWHeBkpe7ZMPXbBftwz/tGjzxRI=
Subject: Re: [PATCH v3 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Paul Durrant <pdurrant@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4b66347-e06d-1c34-12cc-324f3097259a@suse.com>
Date: Wed, 31 Mar 2021 18:02:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 12:32, Roger Pau Monne wrote:
> EOIs are always executed in guest vCPU context, so there's no reason to
> pass a vCPU parameter around as can be fetched from current.
> 
> While there make the vector parameter of both callbacks unsigned int.
> 
> No functional change intended.
> 
> Suggested-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
> Changes since v1:
>  - New in this version.

I'm afraid the situation with viridian_synic_wrmsr() hasn't changed
since v2, and hence my previous comment still applies.

Jan


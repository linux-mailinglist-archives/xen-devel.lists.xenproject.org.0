Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E83295935
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10190.26990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVV2a-0004U9-PF; Thu, 22 Oct 2020 07:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10190.26990; Thu, 22 Oct 2020 07:29:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVV2a-0004Tj-Lp; Thu, 22 Oct 2020 07:29:40 +0000
Received: by outflank-mailman (input) for mailman id 10190;
 Thu, 22 Oct 2020 07:29:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVV2Z-0004Te-6g
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:29:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 553d952c-424c-4114-a279-a254f167f95a;
 Thu, 22 Oct 2020 07:29:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93DDEACB0;
 Thu, 22 Oct 2020 07:29:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVV2Z-0004Te-6g
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:29:39 +0000
X-Inumbo-ID: 553d952c-424c-4114-a279-a254f167f95a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 553d952c-424c-4114-a279-a254f167f95a;
	Thu, 22 Oct 2020 07:29:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603351777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHJcY36MeWxdzWNKBChh8Cu+HtOFu3lFHtl8gIkgDuA=;
	b=nNrXMVtM7xvOCWyZThDKJuYJ/fRSnDPCELMLTfv2I0FZlCpIUYNvPbn4QmKIRsxKjl3O0T
	ncNkheAvIoeAng4Xd6fCNk3/5BtvPyvJ1pkHUrnDzAGccb9y0Nrl4u6uBVmzss/paoEVHU
	ixwOFXD9pn92h1hfLgJk4OMs6RTnXZA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93DDEACB0;
	Thu, 22 Oct 2020 07:29:37 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: avoid playing with directmap when self-snoop can
 be relied upon
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <33f7168c-b177-eed5-14e8-5e7a38dee853@suse.com>
 <20201021152321.cw6sdx3biyc2pmtx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48679ecc-3e69-697f-14dd-d12a1ef058ec@suse.com>
Date: Thu, 22 Oct 2020 09:29:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021152321.cw6sdx3biyc2pmtx@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.10.2020 17:23, Roger Pau Monné wrote:
> On Tue, Oct 20, 2020 at 03:51:18PM +0200, Jan Beulich wrote:
>> The set of systems affected by XSA-345 would have been smaller is we had
>> this in place already: When the processor is capable of dealing with
>> mismatched cacheability, there's no extra work we need to carry out.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I guess it's not worth using the alternative framework to patch this
> up at boot in order to avoid the call in the first place?

It being non-trivial (afaict) in cases like this one makes me
think that the price to do so would be higher than the gain
to be had. But I might be wrong ...

Jan


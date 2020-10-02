Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3712812A9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2041.6122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOKBA-0002gE-57; Fri, 02 Oct 2020 12:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2041.6122; Fri, 02 Oct 2020 12:28:52 +0000
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
	id 1kOKBA-0002fp-1w; Fri, 02 Oct 2020 12:28:52 +0000
Received: by outflank-mailman (input) for mailman id 2041;
 Fri, 02 Oct 2020 12:28:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOKB8-0002fj-Li
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:28:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b1044f9-9a90-486c-9ed4-3b5089c75bc0;
 Fri, 02 Oct 2020 12:28:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1922AC6D;
 Fri,  2 Oct 2020 12:28:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOKB8-0002fj-Li
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:28:50 +0000
X-Inumbo-ID: 7b1044f9-9a90-486c-9ed4-3b5089c75bc0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7b1044f9-9a90-486c-9ed4-3b5089c75bc0;
	Fri, 02 Oct 2020 12:28:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601641728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yYm16sD4KHefZ2j8SxaiXlxlMEdlEuTzKyyWhgvMbnE=;
	b=c2K4kOZvGetFDNSdJPBOtMLhEZpL7IJGEsL23DYXqmGx1Bb2pzv7hNqUVpeTh5flK+ur5J
	tKY4+sj3d2uwQAPwhKuRwUFoHTS2uj2i0rrG/HZaHwAVVm3VuIhGlwupBYvknxqoKClF0C
	2Eq3Uk5puW/lVXVXQMIV7ZNrZrWWl4M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C1922AC6D;
	Fri,  2 Oct 2020 12:28:48 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86: fix resource leaks on arch_vcpu_create() error
 path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
 <77106fd6-96c5-4a62-5eee-8a37660db550@suse.com>
 <df700f00-9458-c7f8-90fc-65dc31850b48@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45c132b8-2a86-2e3b-6fe4-76041787d2d4@suse.com>
Date: Fri, 2 Oct 2020 14:28:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <df700f00-9458-c7f8-90fc-65dc31850b48@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.10.2020 13:13, Andrew Cooper wrote:
> On 02/10/2020 11:30, Jan Beulich wrote:
>> {hvm,pv}_vcpu_initialise() have always been meant to be the final
>> possible source of errors in arch_vcpu_create(), hence not requiring
>> any unrolling of what they've done on the error path. (Of course this
>> may change once the various involved paths all have become idempotent.)
> 
> I'd agree that the way the code was previously laid out expected
> {hvm,pv}_vcpu_initialise() to be the final failing option.
> 
> I don't think "has always meant to be" is reasonable, because where is
> the code comment explaining this design choice?

It's probably more a "happened to be that way and then it was easiest
to keep it like this", but I recall the behavior having been the subject
of discussions, with the outcome that it's at least "kind of" intended.

Would adding "kind of" make things look better to you?

>> But even beyond this aspect I think it is more logical to do policy
>> initialization ahead of the calling of these two functions, as they may
>> in principle want to access it.
> 
> Not these MSRs.  They're currently a block of zeroes, and while that
> will eventually change, it will still be a bunch of MSRs in their RESET
> state.
> 
> The interesting MSRs are the domain ones, not the vCPU ones.

If you had said "The more interesting ...", I'd have agreed. What I
was thinking of as possible uses (be it reading or writing) is
e.g. reset state that may depend on certain further properties.

Furthermore I was thinking of code paths that vCPU initialization
simply may re-use, and which expect the policy to at least be
available, irrespective of the individual MSRs' values still
being their reset ones.

>> Fixes: 4187f79dc718 ("x86/msr: introduce struct msr_vcpu_policy")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> although I'd
> prefer some adjustment to the commit message along the indicated lines.

Thanks. As far as adjustments go, I don't really see how to better
reflect what you want, considering my replies above. If you have
any hints ... (I'll hold off committing this for a little while,
but I think I'd like to put it in before I leave for weekend and
vacation.)

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B76B3070BB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 09:11:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76773.138639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l52OX-0005oP-P0; Thu, 28 Jan 2021 08:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76773.138639; Thu, 28 Jan 2021 08:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l52OX-0005o0-Ll; Thu, 28 Jan 2021 08:11:13 +0000
Received: by outflank-mailman (input) for mailman id 76773;
 Thu, 28 Jan 2021 08:11:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l52OW-0005nt-Gq
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 08:11:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef75abb5-48b0-4c56-ac29-06507a48697b;
 Thu, 28 Jan 2021 08:11:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 492CCAC41;
 Thu, 28 Jan 2021 08:11:09 +0000 (UTC)
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
X-Inumbo-ID: ef75abb5-48b0-4c56-ac29-06507a48697b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611821469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQtsh0rjtjgwVo02/JiPeZ77olFt6KVHC33TS4hR1zc=;
	b=aqbgGmjD3imXWyEi+upJgJnPxzZ7DQEXiHtO/2X3ndR6bxtBNOKbeGko+hXmtSKw8qRTfY
	C1q5GklYHLm77uF+FT1k64zE0pmeh6kcdMFLYK+HjSBFL91Jdun1Wqn7plOmHsIyPa2/N8
	98oiVEOy/rdw46V65+ktwBPdJ/Kn3PY=
Subject: Re: more randconfig failures
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, wl@xen.org,
 Bertrand.Marquis@arm.com, "fam@euphon.net" <fam@euphon.net>,
 famzheng@amazon.com, Doug Goldstein <cardoe@cardoe.com>
References: <alpine.DEB.2.21.2101271311470.9684@sstabellini-ThinkPad-T480s>
 <45a1b4b2-afd7-9b70-e857-d0c23f2fd26e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3231c24e-d86f-3d4f-5521-c7d3fcb82275@suse.com>
Date: Thu, 28 Jan 2021 09:11:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <45a1b4b2-afd7-9b70-e857-d0c23f2fd26e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.01.2021 22:23, Andrew Cooper wrote:
> On 27/01/2021 21:16, Stefano Stabellini wrote:
>> Hi all,
>>
>> These are two recent randconfig build failures reported by gitlab (the
>> two patches that triggered the CI-loop are two patches to the
>> MAINTAINERS file -- certainly not the cause of the build issues):
>>
>> x86 randconfig failure:
>> https://gitlab.com/xen-project/patchew/xen/-/jobs/990347647
> 
> This has been known and a source of intermittent failures for ages.
> 
> I already laid out how to fix it, by removing some inappropriate Kconfig
> dependencies.  I'll get around to writing some patches when there aren't
> more important tasks to do for 4.15.

Are you sure? I see

ld: ld: /builds/xen-project/patchew/xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' isn't defined

which rather reminds me of a recent report where DCE doesn't do what we
expect it to do.

Jan


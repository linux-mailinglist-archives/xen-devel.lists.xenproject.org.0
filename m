Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FEF31E90D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:41:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86542.162626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChfX-0008QZ-Ai; Thu, 18 Feb 2021 11:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86542.162626; Thu, 18 Feb 2021 11:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChfX-0008QA-6s; Thu, 18 Feb 2021 11:40:27 +0000
Received: by outflank-mailman (input) for mailman id 86542;
 Thu, 18 Feb 2021 11:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3vz=HU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lChfW-0008Q5-5f
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:40:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14695b22-27e0-48d1-8a49-0424e7033bfd;
 Thu, 18 Feb 2021 11:40:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 221AAAD78;
 Thu, 18 Feb 2021 11:40:24 +0000 (UTC)
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
X-Inumbo-ID: 14695b22-27e0-48d1-8a49-0424e7033bfd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613648424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHtRAmoS/Hgdkg+Xo3Sq2kdtxx+/kmpAVLud7f4+3YE=;
	b=J6nGnTXm4+E+YCtZcyU8eEDGqr8xCNbqfFcXMrVY8JMjKzp3X9t3SbAo6nfBwYxViNCFsb
	LRrIs+soXlJSUfgxS3lHVyx1HXiyW1HCGa0/eTnLC25z2EWqSlKfi1IDprQLjV9vZ8NwjJ
	rw+rmnhc1nRyYXUsw707DWq3aObJgeg=
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 cardoe@cardoe.com, andrew.cooper3@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210213020540.27894-1-sstabellini@kernel.org>
 <20210213135056.GA6191@mail-itl>
 <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com>
 <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s>
 <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
 <alpine.DEB.2.21.2102171529460.3234@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <416e26b7-0e24-a9ee-6f9a-732f77f7e0cc@suse.com>
Date: Thu, 18 Feb 2021 12:40:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102171529460.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.02.2021 00:45, Stefano Stabellini wrote:
> Given this, I take there is no 32bit build env? A bit of Googling tells
> me that gcc on Alpine Linux is compiled without multilib support.
> 
> 
> That said I was looking at the Alpine Linux APKBUILD script:
> https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/xen/APKBUILD
> 
> And I noticed this patch that looks suspicious:
> https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/xen/musl-hvmloader-fix-stdint.patch

Indeed. I find it very odd that they have a bimodal gcc (allowing
-m32) but no suitable further infrastructure (headers). So perhaps
configure should probe for "gcc -m32" producing a uint64_t that is
actually 64 bits wide, and disable hvmloader building otherwise
(and - important - no matter whether it would actually be needed;
alternative being to fail configuring altogether)? Until - as said
before - we've made hvmloader properly freestanding.

Jan


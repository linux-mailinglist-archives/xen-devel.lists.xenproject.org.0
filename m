Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF996899A5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 14:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489188.757526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNw1z-0007py-9Q; Fri, 03 Feb 2023 13:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489188.757526; Fri, 03 Feb 2023 13:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNw1z-0007nF-6R; Fri, 03 Feb 2023 13:23:07 +0000
Received: by outflank-mailman (input) for mailman id 489188;
 Fri, 03 Feb 2023 13:23:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNw1x-0007n9-BM
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 13:23:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNw1w-0005eR-EM; Fri, 03 Feb 2023 13:23:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.5.182]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNw1w-0004Yc-7P; Fri, 03 Feb 2023 13:23:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ksjkzHDtYZ+KrzuTWzg7JKOV1chDVcwz7fstNVZBzBM=; b=Cc9bC8MkdGup4XhXqtN7U2efSo
	2EFzt1PKqfQTBMhMS0eTtzAVdOP+6/77Dm8fpHJapU7Xr3WARzOHGAtc+GhVqOKeQkvcDN2N7JdIw
	33vnOlp1DWBA072zNWQnjJ4aIZIkJjm990XFQk9DcvZkv66Ugkx4PAm7l6le+rzWS0lA=;
Message-ID: <b37d6cd4-0b11-b4f1-4b27-7d90729abd6d@xen.org>
Date: Fri, 3 Feb 2023 13:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
 <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
 <873d4754-0314-0022-96a9-e54ed78ac6ef@xen.org>
 <d41b705904b693e80cf5fdadd46a26e38d1bc596.camel@gmail.com>
 <b5dba106-e7ed-4aa9-ea44-19adacc7fade@xen.org>
 <cb036efce9bf55e9ac87f9d1254915a7d6ac33ad.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb036efce9bf55e9ac87f9d1254915a7d6ac33ad.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2023 13:15, Oleksii wrote:
> Hi Julien,

Hi Oleksii,

> On Wed, 2023-02-01 at 22:11 +0000, Julien Grall wrote:
> I am trying to introduce GENERIC_BUG_FRAME config ( only for ARM now as
> some stuff isn't available now for RISC-V such as find_text_region(),
> printk() and so on... Thereby I will switch to do_bug_frame() to
> generic one a little bit later for RISCV ) so I added the following to
> Kconfig:
> 
>      config GENERIC_DO_BUG_FRAME
>      	bool "Generic implementation of do_bug_frame()"
> 	default y if ARM
> 	default n
> 	help
> 	  ...
> 
> But when I pushed the commit to GitLab all ARM randconfig jobs failed
> because they decided not to set GENERIC_BUG_FRAME=y.
> Could you please give me a suggestion how I can work around this
> problem? ( I thought that it would be enough to use default y but
> randconfig can override it ).

You don't want to allow the user to deselect GENERIC_DO_BUG_FRAME. So
you want config ARM to select it:

(arch/arm/Kconfig)
config ARM
    ...
    select GENERIC_DO_BUG_FRAME


(common/Kconfig)
config GENERIC_DO_BUG_FRAME
    bool

> Or is it needed to provide an empty implementation for do_bug_frame()
> GENERIC_BUG_FRAME=n?
> Also I thought about weak function as an option...
> 
> Here is pipeline for generic bug frame feature and the patch ( of
> course not ready for upstream but at least it shows an idea ):
>   *
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/766581174
>   *
> https://gitlab.com/xen-project/people/olkur/xen/-/commit/6fc6481202852e0aa2c2cb3877f2d71ac0213511
>   
> P.S.: Probably you have some comments ( something that is unacceptable
> even now ) about the patch. I will happy to hear them too.

I will try to have a look next week.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D057F4FB9AF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302920.516818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrK5-0004MJ-VH; Mon, 11 Apr 2022 10:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302920.516818; Mon, 11 Apr 2022 10:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrK5-0004K7-Pc; Mon, 11 Apr 2022 10:31:05 +0000
Received: by outflank-mailman (input) for mailman id 302920;
 Mon, 11 Apr 2022 10:31:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndrK4-00043h-39
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:31:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrK3-0003ji-Nx; Mon, 11 Apr 2022 10:31:03 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrK3-0002d5-HH; Mon, 11 Apr 2022 10:31:03 +0000
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
	bh=wS/mm9pvmGnWCtk8wJsZENRQAA/10j4l8KJLd4hTllY=; b=UayqfZmTCQwMlqNehx5RlL+12h
	VoyvUXeL76uUrjPYm8QPsqtvRx8TBNiIzmBUnPJ4860Bf39P5WN7n3dum9QtjIZ4AqII/rjEDZDRz
	EXrUOL8igTbCnNFw2n80za2bFKpfFqElUWlhlbWqTKyqYSLKYWfkBbgWQgh/3g7lHZHA=;
Message-ID: <346f23d6-14e1-17b8-dc7d-d378ff77f28b@xen.org>
Date: Mon, 11 Apr 2022 11:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v5 0/2] xen: Linker scripts synchronization
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220411070300.77380-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220411070300.77380-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 11/04/2022 08:02, Michal Orzel wrote:
> This patch series aims to do the first step towards linker scripts
> synchronization. Linker scripts for arm and x86 share a lot of common
> sections and in order to make the process of changing/improving/syncing
> them, these sections shall be defined in just one place.
> 
> The first patch creates an empty header file xen.lds.h to store the
> constructs mutual to both x86 and arm linker scripts. It also includes
> this header in the scripts.
> 
> The second patch populates xen.lds.h with the first portion of common
> macros and replaces the original contructs with these helpers.
> 
> Michal Orzel (2):
>    xen: Introduce a header to store common linker scripts content
>    xen: Populate xen.lds.h and make use of its macros

I have committed the two patches.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDBE33D632
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 15:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98337.186486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMB5n-0002b5-7z; Tue, 16 Mar 2021 14:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98337.186486; Tue, 16 Mar 2021 14:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMB5n-0002aF-4h; Tue, 16 Mar 2021 14:54:43 +0000
Received: by outflank-mailman (input) for mailman id 98337;
 Tue, 16 Mar 2021 14:54:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMB5l-0002aA-IK
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:54:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMB5h-00056d-LR; Tue, 16 Mar 2021 14:54:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMB5h-00032Q-9v; Tue, 16 Mar 2021 14:54:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=n2kOiMwSHxMqR8hZj9YfYLH98BsKpldd6abPrGzqNP8=; b=hiwdSbtyhWzngaxtwkieHRzdA7
	Cy9jmabMZ/JRKp8AHEDxjTtgbZhokM1KrB2Fv+lkqN9+LnLsV18rs1JFUrttlBzJVG0ELY5f/5OF/
	BzSG+bPQoIOxcN4uyKaBHLPg5m9Ek/Zo0enAv59eJCvuqR3aR9JKpFa/KAg1TLd1N31c=;
Subject: Re: [PATCH v7] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210315092342.26533-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3473f8d3-c42a-9182-b4fa-c3eacb44338f@xen.org>
Date: Tue, 16 Mar 2021 14:54:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315092342.26533-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 15/03/2021 09:23, Michal Orzel wrote:
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE
> to be able to provide the path to DTB we want to embed
> into Xen image. If no path provided - the dtb will not
> be embedded.
> 
> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
> as it is not needed since Kconfig will define it in a header
> with all the other config options.
> 
> Make a change in the linker script from:
> _sdtb = .;
> to:
> PROVIDE(_sdtb = .);
> to avoid creation of _sdtb if there is no reference to it.

This means that if someone is using #ifdef CONFIG_DTB_FILE rather than 
.ifnes, _sdtb will get defined.

The difference between two is quite subttle and can be easily missed 
during review.

How about defining _sdtb in dtb.S? With that approach, we would get a 
compiler error if someone protect _sdtb with #ifdef rather than .ifnes.

Cheers,

-- 
Julien Grall


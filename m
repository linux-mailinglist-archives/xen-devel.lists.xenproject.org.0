Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E054E4EE174
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 21:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297059.505890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na0DD-0003V2-BJ; Thu, 31 Mar 2022 19:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297059.505890; Thu, 31 Mar 2022 19:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na0DD-0003TD-8B; Thu, 31 Mar 2022 19:12:03 +0000
Received: by outflank-mailman (input) for mailman id 297059;
 Thu, 31 Mar 2022 19:12:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1na0DB-0003T7-Hl
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 19:12:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1na0DA-0004W6-Vl; Thu, 31 Mar 2022 19:12:00 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1na0DA-0004Px-PO; Thu, 31 Mar 2022 19:12:00 +0000
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
	bh=OQ17IXjF+hvka1J9qmYi2WwZ27PyLydCIOm3bQpaVLg=; b=TeL7B7P25TWmjvwq+BUnIzdjDK
	73/tpVuZwSIekbDT0nqL50Gp6C+ZDuu0Zw3wZ0zBHthFTSFmfnZjdlNiM6jCoOiyASqQGrsakNIQh
	61UUNmX0CcG64b6NOdMw1YMJlc3ODgQ82PDFb9uHdJ6BJW8TKwN2a3CEwOfOPrVzup/o=;
Message-ID: <5be58cd7-50f4-5b5b-b4dc-6f6e378b7a11@xen.org>
Date: Thu, 31 Mar 2022 20:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN PATCH v10 1/7] build: grab common EFI source files in arch
 specific dir
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
 <20220322112238.1117737-2-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220322112238.1117737-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 22/03/2022 11:22, Anthony PERARD wrote:
> Rather than preparing the efi source file, we will make the symbolic
> link as needed from the build location.
> 
> The `ln` command is run every time to allow to update the link in case
> the source tree change location.
> 
> This patch also introduce "efi-common.mk" which allow to reuse the
> common make instructions without having to duplicate them into each
> arch.
> 
> And now that we have a list of common source file, we can start to
> remove the links to the source files on clean.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


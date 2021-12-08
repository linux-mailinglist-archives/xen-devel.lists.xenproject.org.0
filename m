Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045AC46DABA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 19:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242564.419503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv1Oa-0003Sg-Im; Wed, 08 Dec 2021 18:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242564.419503; Wed, 08 Dec 2021 18:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv1Oa-0003Qa-Fl; Wed, 08 Dec 2021 18:10:24 +0000
Received: by outflank-mailman (input) for mailman id 242564;
 Wed, 08 Dec 2021 18:10:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mv1OZ-0003QU-BT
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 18:10:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv1OY-0003Eu-2W; Wed, 08 Dec 2021 18:10:22 +0000
Received: from [54.239.6.189] (helo=[192.168.13.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv1OX-0003S7-Rx; Wed, 08 Dec 2021 18:10:21 +0000
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
	bh=de1kNqQAosCqZnXjtvT4iUR9K0c75jRK8GhwDEcLkfY=; b=qhcTMkWpkZzNja3ULI7P+7I0Bj
	OOytoTufAj5o4AYsJrHHawiZaoMb6Ja3FhePc+59OLCoh3xbesAUNvk7raozRFwC2aHePOsLKMR5Q
	4vn8r1r+xdmF5b9kvMVGDldNiafAHR1BJ+CiyUoOWoJfMSjrL1Jb3OQm971g3iJ2EcG4=;
Message-ID: <984732f0-8433-a294-acaf-c4130a2ab341@xen.org>
Date: Wed, 8 Dec 2021 18:10:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] arm/efi: Handle Xen bootargs from both xen.cfg and DT
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211206153658.49727-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211206153658.49727-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 06/12/2021 15:36, Luca Fancellu wrote:
> Currently the Xen UEFI stub can accept Xen boot arguments from
> the Xen configuration file using the "options=" keyword, but also
> directly from the device tree specifying xen,xen-bootargs
> property.
> 
> When the configuration file is used, device tree boot arguments
> are ignored and overwritten even if the keyword "options=" is
> not used.
> 
> This patch handle this case, if xen,xen-bootargs is found in the
> device tree, it is used for xen boot arguments regardless they
> are specified in the Xen configuration file or not.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   docs/misc/efi.pandoc        | 4 ++++
>   xen/arch/arm/efi/efi-boot.h | 7 +++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index abafb3452758..b7d99de87f15 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -249,6 +249,10 @@ UEFI stub for module loading.
>   When adding DomU modules to device tree, also add the property
>   xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
>   Otherwise, Xen will skip the config file and rely on device tree alone.
> +When using the Xen configuration file in conjunction with the device tree, you
> +can specify the Xen boot arguments in the configuration file with the "options="
> +keyword or in the device tree with the "xen,xen-bootargs" property, but be
> +aware that a device tree value has a precedence over the configuration file.

I am not sure I agree with the precedence chosen here. With UEFI 
environment it is a lot easier to update the configuration file over the 
Device-Tree. So this could be used to quickly test a command line before 
updating the Device-Tree.

Also, somewhat unrelated to this patch. Looking at the code, the command 
line is a concatenation of "options=" from the configuration file and 
the extra arguments provided on the command line used to execute the 
UEFI binary.

When using the command line from the Device-Tree, I think it would still 
make sense to append the later because it could allow a user to provide 
a single Device-Tree with extra options on the UEFI command line.

But I think this is a separate subject. So if we are going to go with 
the precedence you suggested, then we should at least clarify in the 
documentation that it will replace both.

Cheers,

-- 
Julien Grall


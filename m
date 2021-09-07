Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72809402640
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 11:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180701.327460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXWL-0003ap-PN; Tue, 07 Sep 2021 09:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180701.327460; Tue, 07 Sep 2021 09:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXWL-0003Yy-Lq; Tue, 07 Sep 2021 09:36:01 +0000
Received: by outflank-mailman (input) for mailman id 180701;
 Tue, 07 Sep 2021 09:36:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNXWK-0003Ys-DX
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 09:36:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNXWH-0000cW-Ju; Tue, 07 Sep 2021 09:35:57 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNXWH-0006k8-D8; Tue, 07 Sep 2021 09:35:57 +0000
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
	bh=zt8g/1egKtbllKcQNJg4DQLiOBnwt0kBFJGt3Sn7rSw=; b=fAU76dfu5dTxcGnb6q78D7EEIf
	vgLRNFq9OK13HumYIYU8rV4V9Dc3a/EA5lUOZ/1g4NUD9j1WPolP5C/z+uaLAQravuRyKTcowdkG9
	wT2w/gpJ33ZqIckMV/iFIheuX4j2h1IgLo9A1veD9Kb+DDfp+kP4lpnw9ZZ/eImULGR4=;
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
Date: Tue, 7 Sep 2021 10:35:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907065228.21794-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 07/09/2021 07:52, Luca Fancellu wrote:
> Add a design describing a proposal to improve the EFI
> configuration file, adding keywords to describe domU
> guests and allowing to start a dom0less system.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   docs/designs/efi-arm-dom0less.md | 105 +++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
>   create mode 100644 docs/designs/efi-arm-dom0less.md
> 
> diff --git a/docs/designs/efi-arm-dom0less.md b/docs/designs/efi-arm-dom0less.md
> new file mode 100644
> index 0000000000..8d8fa2243f
> --- /dev/null
> +++ b/docs/designs/efi-arm-dom0less.md
> @@ -0,0 +1,105 @@
> +# Xen EFI configuration file
> +
> +The current configuration file used by Xen when it is started as an EFI
> +application is considering only the dom0 guest and doesn't have any
> +property to describe and load in memory domU guests.

 From my understanding, the problem is less about properties (we already 
have them in the Device-Tree) but more about where are the binaries 
located in memory as we don't know in advance.

So I would like to propose something that build on top of the 
Device-Tree work we did. Note this is early thoughts.

The problematic nodes in the DT are:

         module@0x4a000000 {
             compatible = "multiboot,kernel", "multiboot,module";
             reg = <0x0 0x4a000000 0xffffff>;
             bootargs = "console=ttyAMA0 init=/bin/sh";
         };

         module@0x4b000000 {
             compatible = "multiboot,ramdisk", "multiboot,module";
             reg = <0x0 0x4b000000 0xffffff>;
         };

In particular the property "reg" cannot be known in advance because the 
UEFI stub will be responsible to load the binaries in memory.

What we could do is providing a list of binaries to load and associate a 
key for each of them. Something like:

binary=<binary> <key>
binary=<binary2> <key2>
....

We can then replace the property "reg" with a new property "uefi,key" 
that will contain the name of the binary.

What do you think?

Cheers,

-- 
Julien Grall


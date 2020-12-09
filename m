Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BB2D46E3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48585.85937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2TG-000881-61; Wed, 09 Dec 2020 16:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48585.85937; Wed, 09 Dec 2020 16:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2TG-00087c-2W; Wed, 09 Dec 2020 16:37:42 +0000
Received: by outflank-mailman (input) for mailman id 48585;
 Wed, 09 Dec 2020 16:37:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn2TE-00087V-Ba
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:37:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn2TB-0004kc-K3; Wed, 09 Dec 2020 16:37:37 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn2TB-0001DO-CE; Wed, 09 Dec 2020 16:37:37 +0000
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
	bh=zq3qs2Y37oE2YD1FWHU1D6FEOZCIvFeODTkcNxNpPe0=; b=GEi5v+CU7P1Og1LNtjD5C36tJP
	CQfvxzQtU6B+2VNzXjKODp8yf7n3se3c2OoMdzQnkg8cPHpdyOerymW6oxMFE0NJdOuShuwXEeCkF
	2qhVasAvWNQp0vTjl12n5Abp+lBVcM/tPXR6fm6L0Y0HSs3v+x8ZLToOKEnYytGxwcYI=;
Subject: Re: [PATCH RFC 2/3] xen/domain: add domain hypfs directories
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201209161618.309-1-jgross@suse.com>
 <20201209161618.309-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <75232058-4626-80cb-6f71-4ce5253f3ef6@xen.org>
Date: Wed, 9 Dec 2020 16:37:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209161618.309-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 09/12/2020 16:16, Juergen Gross wrote:
> Add /domain/<domid> directories to hypfs. Those are completely
> dynamic, so the related hypfs access functions need to be implemented.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   docs/misc/hypfs-paths.pandoc |  10 +++
>   xen/common/Makefile          |   1 +
>   xen/common/hypfs_dom.c       | 137 +++++++++++++++++++++++++++++++++++
>   3 files changed, 148 insertions(+)
>   create mode 100644 xen/common/hypfs_dom.c
> 
> diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
> index e86f7d0dbe..116642e367 100644
> --- a/docs/misc/hypfs-paths.pandoc
> +++ b/docs/misc/hypfs-paths.pandoc
> @@ -34,6 +34,7 @@ not containing any '/' character. The names "." and ".." are reserved
>   for file system internal use.
>   
>   VALUES are strings and can take the following forms (note that this represents
> +>>>>>>> patched

This seems to be a left-over of a merge.

>   only the syntax used in this document):
>   
>   * STRING -- an arbitrary 0-delimited byte string.
> @@ -191,6 +192,15 @@ The scheduling granularity of a cpupool.
>   Writing a value is allowed only for cpupools with no cpu assigned and if the
>   architecture is supporting different scheduling granularities.
>   

[...]

> +
> +static int domain_dir_read(const struct hypfs_entry *entry,
> +                           XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    int ret = 0;
> +    const struct domain *d;
> +
> +    for_each_domain ( d )

This is definitely going to be an issue if you have a lot of domain 
running as Xen is not preemptible.

I think the first step is to make sure that HYPFS can scale without 
hogging a pCPU for a long time.

Cheers,

-- 
Julien Grall


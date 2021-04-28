Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD436D46E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119106.225448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbg7j-0007Ha-IA; Wed, 28 Apr 2021 09:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119106.225448; Wed, 28 Apr 2021 09:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbg7j-0007HB-Eg; Wed, 28 Apr 2021 09:04:47 +0000
Received: by outflank-mailman (input) for mailman id 119106;
 Wed, 28 Apr 2021 09:04:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbg7i-0007H5-AD
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:04:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbg7g-0001c3-QT; Wed, 28 Apr 2021 09:04:44 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbg7g-0001ja-GS; Wed, 28 Apr 2021 09:04:44 +0000
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
	bh=1HhgNlvVh89LsWYdwwB897Go5ylU1RxlYREqwp+CApw=; b=29BppQjSc/AKH5NKCVuU4qykuR
	OrAApK0ik4fiE7J5OgLaz8EfNZtB1kFmliYkCEbomL8IpQ0glg2srW4Jndp7Y9AQhfP6mkNhC+xym
	8cMp2F9JEJsosgWdShfSMtFm6IAia27XcEwND9J7xRCtEb7UmeRcpB07zoWBzrojScHs=;
Subject: Re: [PATCH 2/5] tools/libfsimage: Fix PATH_MAX redefinition error
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <e44209c8981a68604a34f3066d53989f84ce8f49.1619524463.git.costin.lupu@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <9ef85c5b-b757-bbaa-be23-4ceb1d45cddd@xen.org>
Date: Wed, 28 Apr 2021 10:04:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e44209c8981a68604a34f3066d53989f84ce8f49.1619524463.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 27/04/2021 13:05, Costin Lupu wrote:
> If PATH_MAX is already defined in the system (e.g. in /usr/include/limits.h
> header) then gcc will trigger a redefinition error because of -Werror.
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
> ---
>   tools/libfsimage/ext2fs/fsys_ext2fs.c     | 2 ++
>   tools/libfsimage/reiserfs/fsys_reiserfs.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/tools/libfsimage/ext2fs/fsys_ext2fs.c b/tools/libfsimage/ext2fs/fsys_ext2fs.c
> index a4ed10419c..5ed8fce90e 100644
> --- a/tools/libfsimage/ext2fs/fsys_ext2fs.c
> +++ b/tools/libfsimage/ext2fs/fsys_ext2fs.c
> @@ -278,7 +278,9 @@ struct ext4_extent_header {
>   
>   #define EXT2_SUPER_MAGIC      0xEF53	/* include/linux/ext2_fs.h */
>   #define EXT2_ROOT_INO              2	/* include/linux/ext2_fs.h */
> +#ifndef PATH_MAX
>   #define PATH_MAX                1024	/* include/linux/limits.h */
> +#endif

Can we drop it completely and just rely on limits.h?

>   #define MAX_LINK_COUNT             5	/* number of symbolic links to follow */
>   
>   /* made up, these are pointers into FSYS_BUF */
> diff --git a/tools/libfsimage/reiserfs/fsys_reiserfs.c b/tools/libfsimage/reiserfs/fsys_reiserfs.c
> index 916eb15292..10ca657476 100644
> --- a/tools/libfsimage/reiserfs/fsys_reiserfs.c
> +++ b/tools/libfsimage/reiserfs/fsys_reiserfs.c
> @@ -284,7 +284,9 @@ struct reiserfs_de_head
>   #define S_ISDIR(mode) (((mode) & 0170000) == 0040000)
>   #define S_ISLNK(mode) (((mode) & 0170000) == 0120000)
>   
> +#ifndef PATH_MAX
>   #define PATH_MAX       1024	/* include/linux/limits.h */
> +#endif
>   #define MAX_LINK_COUNT    5	/* number of symbolic links to follow */
>   
>   /* The size of the node cache */
> 

-- 
Julien Grall


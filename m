Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98F28DF8E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 13:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6594.17521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeaT-0006v4-1w; Wed, 14 Oct 2020 11:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6594.17521; Wed, 14 Oct 2020 11:04:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeaS-0006uf-VB; Wed, 14 Oct 2020 11:04:52 +0000
Received: by outflank-mailman (input) for mailman id 6594;
 Wed, 14 Oct 2020 11:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSeaR-0006ua-Mo
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:04:51 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5120364f-f58c-4010-943f-74cda842a6f3;
 Wed, 14 Oct 2020 11:04:51 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSeaP-0002Lu-Vo; Wed, 14 Oct 2020 11:04:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSeaP-0003CB-Lf; Wed, 14 Oct 2020 11:04:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSeaR-0006ua-Mo
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:04:51 +0000
X-Inumbo-ID: 5120364f-f58c-4010-943f-74cda842a6f3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5120364f-f58c-4010-943f-74cda842a6f3;
	Wed, 14 Oct 2020 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bYs1e4B6dk8FulF7Wjnn1eQPo1MDL6NA3+DdZL+x0B0=; b=QBlSnn4mPfGuA6ijYGt4cWnSP6
	Jk4uld1GPNeJR4MTRMj6fAx9FNCqwBkR4ADZE8hda7gVS5MxVLSkhjltQB5O8gTUkEgvmQBH06g75
	42/jb9wIA4i1ZT2FdJNJLZ9NVppwwJ079XTxvn2h+pfYfB0vDTpRgPzq0UsGrOtAbX8s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSeaP-0002Lu-Vo; Wed, 14 Oct 2020 11:04:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSeaP-0003CB-Lf; Wed, 14 Oct 2020 11:04:49 +0000
Subject: Re: [PATCH] tools/xenmpd: Fix gcc10 snprintf warning
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <0ade4264c537819c3dd45179fcea2723df66b045.1602672245.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <74625fd9-f2a3-14be-714a-3cfb705434cc@xen.org>
Date: Wed, 14 Oct 2020 12:04:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <0ade4264c537819c3dd45179fcea2723df66b045.1602672245.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 14/10/2020 11:47, Bertrand Marquis wrote:
> Add a check for snprintf return code and ignore the entry if we get an
> error. This should in fact never happen and is more a trick to make gcc
> happy and prevent compilation errors.
> 
> This is solving the gcc warning:
> xenpmd.c:92:37: error: '%s' directive output may be truncated writing
> between 4 and 2147483645 bytes into a region of size 271
> [-Werror=format-truncation=]

IIRC, this is only affecting GCC when building for Arm32 *and* when the 
optimizer is enabled. If so, it would be good to add more details in the 
commit message.

I would also suggest to link to the bug reported on Debian.

Cheers,

> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   tools/xenpmd/xenpmd.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
> index 35fd1c931a..12b82cf43e 100644
> --- a/tools/xenpmd/xenpmd.c
> +++ b/tools/xenpmd/xenpmd.c
> @@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
>       FILE *file = 0;
>       struct dirent *dir_entries;
>       char file_name[284];
> +    int ret;
>       
>       do
>       {
> @@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
>           if ( strlen(dir_entries->d_name) < 4 )
>               continue;
>           if ( battery_info_type == BIF )
> -            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
> +            ret = snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
>                        dir_entries->d_name);
>           else
> -            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
> +            ret = snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
>                        dir_entries->d_name);
> +        /* This should not happen but is needed to pass gcc checks */
> +        if (ret < 0)
> +            continue;
> +        file_name[sizeof(file_name) - 1] = '\0';
>           file = fopen(file_name, "r");
>       } while ( !file );
>   
> 

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5EE7EE8BB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 22:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634649.990132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3jka-0004I8-Rf; Thu, 16 Nov 2023 21:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634649.990132; Thu, 16 Nov 2023 21:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3jka-0004GS-OC; Thu, 16 Nov 2023 21:18:12 +0000
Received: by outflank-mailman (input) for mailman id 634649;
 Thu, 16 Nov 2023 21:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wecx=G5=embeddedor.com=gustavo@srs-se1.protection.inumbo.net>)
 id 1r3jkY-00047l-LY
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 21:18:10 +0000
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a174a5f8-84c5-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 22:18:06 +0100 (CET)
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
 by cmsmtp with ESMTPS
 id 3QG6rk8xEKOkL3jkSrw631; Thu, 16 Nov 2023 21:18:04 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 3jkQrjWYxRQmi3jkRrw92C; Thu, 16 Nov 2023 21:18:03 +0000
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:48450
 helo=[192.168.15.10])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1r3jkQ-00371x-0t;
 Thu, 16 Nov 2023 15:18:02 -0600
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
X-Inumbo-ID: a174a5f8-84c5-11ee-9b0e-b553b5be7939
X-Authority-Analysis: v=2.4 cv=CdcbWZnl c=1 sm=1 tr=0 ts=6556870b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=CB8ylYM2jayAzffc3msA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z7VN5fe7q4a712jMshNesYxaBgFBwUjNIQyqspWv/5g=; b=V2mSew9FN/FY6qQBitJwrrvBWx
	egEJQgRKNQ7oQeoB7qzWxi8d7kDHxlcUi0laaO2uapZQn1kqX2BBhTuOi5F4Tm1aVGZ///ZTEBIao
	Zh/9FlQMbAc5oKvjMx5lRbCAdB+GQfj+t/RPy7NAAdcTj65yoaW+AQZux7QGhiM2s/ucnU+mF+3z+
	JTPf+oMEbE+dSkC9/CC7yC60ER+wwtRdBh5f5C6GiCKEL9ShkfsLWGLLDvIDu7UZEueYdMMjrGHMV
	iUzAPggDiCKVY9wEC7EZT+XUCLgALD3ao9CrAMpXLZ8Ozkouxq5sF5oqVWqvDaES2kJK2fHq/02iM
	H5a+KsZQ==;
Message-ID: <43bf5965-84c4-420e-91fc-7a0973c27d76@embeddedor.com>
Date: Thu, 16 Nov 2023 15:18:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] xen: privcmd: Replace zero-length array with
 flex-array member and use __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <ZVZlg3tPMPCRdteh@work> <202311161307.9422E1896B@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202311161307.9422E1896B@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1r3jkQ-00371x-0t
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:48450
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFXhJYW/1EfLht3zA5yuY0XNZc94lYu5BRK6qEIXXcbqv+OxWcsolxNmKsfkxrEYLy+Yhnl7VDF5YHGfvi4WiZlYsOkj0i0u2sBnJAv16u01cu+GM/kt
 lSrX7LOsIke4XsX63LNWjpRb2W+ScVL83VkEyg9ayTWXwdOy/dwdYlW7YID0RWGhpmxEaaL17xU5hItrUndHuxHK/crPF0OpXu7/HaxDXxdag//xcYvTgvDL



On 11/16/23 15:08, Kees Cook wrote:
> On Thu, Nov 16, 2023 at 12:54:59PM -0600, Gustavo A. R. Silva wrote:
>> Fake flexible arrays (zero-length and one-element arrays) are deprecated,
>> and should be replaced by flexible-array members. So, replace
>> zero-length array with a flexible-array member in `struct
>> privcmd_kernel_ioreq`.
>>
>> Also annotate array `ports` with `__counted_by()` to prepare for the
>> coming implementation by GCC and Clang of the `__counted_by` attribute.
>> Flexible array members annotated with `__counted_by` can have their
>> accesses bounds-checked at run-time via `CONFIG_UBSAN_BOUNDS` (for array
>> indexing) and `CONFIG_FORTIFY_SOURCE` (for strcpy/memcpy-family functions).
>>
>> This fixes multiple -Warray-bounds warnings:
>> drivers/xen/privcmd.c:1239:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
>> drivers/xen/privcmd.c:1240:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
>> drivers/xen/privcmd.c:1241:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
>> drivers/xen/privcmd.c:1245:33: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
>> drivers/xen/privcmd.c:1258:67: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
>>
>> This results in no differences in binary output.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Looks right to me. I can see the allocation:

Yep, I always check for that; in particular, the 'counter' assignment. :)

Do you want me to mention it in the changelog text?

> 
>          size = struct_size(kioreq, ports, ioeventfd->vcpus);
>          kioreq = kzalloc(size, GFP_KERNEL);
>          if (!kioreq)
>                  return ERR_PTR(-ENOMEM);
> 
>          kioreq->dom = ioeventfd->dom;
>          kioreq->vcpus = ioeventfd->vcpus;
> 
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!
--
Gustavo


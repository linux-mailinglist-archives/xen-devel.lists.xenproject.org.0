Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3834360894
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111062.212303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0W0-0006rJ-GA; Thu, 15 Apr 2021 11:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111062.212303; Thu, 15 Apr 2021 11:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0W0-0006qn-Bx; Thu, 15 Apr 2021 11:50:32 +0000
Received: by outflank-mailman (input) for mailman id 111062;
 Thu, 15 Apr 2021 11:50:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0Vz-0006qH-5A
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:50:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0Vx-00079B-3y; Thu, 15 Apr 2021 11:50:29 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX0Vw-0001Fy-Rs; Thu, 15 Apr 2021 11:50:28 +0000
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
	bh=b23a0dhkmTntpY5sTLh/giodqpqTBLVfH1In9PFj6jY=; b=35jtKJNKAc4+pg/DJkJdRIK4OR
	bTOYCz4H/8cP+L1KnGn1wGSSGAcG27iYPEE0jCc/oDMQWWpOGgVNOy0hz0YV7IW0j3U6nRNs6h2mo
	xGyNIRsa7N5XqBZ8FrgtfHM1ForThI2DBJ70QIPpvVWJgK79ZXkKJmmsSlt6gaFQl5b0=;
Subject: Re: [PATCH v3 08/15] bunzip: replace INIT
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <9069acc9-7e86-a0c7-5ec9-e12d674bb834@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <280602b3-3bb4-f476-34c3-890b4a62248e@xen.org>
Date: Thu, 15 Apr 2021 12:50:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9069acc9-7e86-a0c7-5ec9-e12d674bb834@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:51, Jan Beulich wrote:
> While tools/libs/guest/xg_private.h has its own (non-conflicting for our
> purposes) __init, which hence needs to be #undef-ed, there's no other
> need for this abstraction.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v3: New.
> 
> --- a/xen/common/decompress.h
> +++ b/xen/common/decompress.h
> @@ -23,6 +23,10 @@
>   #define INIT
>   #define INITDATA
>   
> +#undef __init /* tools/libs/guest/xg_private.h has its own one */
> +#define __init
> +#define __initdata
> +
>   #define large_malloc malloc
>   #define large_free free
>   
> --- a/xen/common/bunzip2.c
> +++ b/xen/common/bunzip2.c
> @@ -104,7 +104,7 @@ struct bunzip_data {
>   
>   /* Return the next nnn bits of input.  All reads from the compressed input
>      are done through this function.  All reads are big endian */
> -static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
> +static unsigned int __init get_bits(struct bunzip_data *bd, char bits_wanted)
>   {
>   	unsigned int bits = 0;
>   
> @@ -144,7 +144,7 @@ static unsigned int INIT get_bits(struct
>   
>   /* Unpacks the next block and sets up for the inverse burrows-wheeler step. */
>   
> -static int INIT get_next_block(struct bunzip_data *bd)
> +static int __init get_next_block(struct bunzip_data *bd)
>   {
>   	struct group_data *hufGroup = NULL;
>   	int *base = NULL;
> @@ -509,7 +509,7 @@ got_huff_bits:
>      are ignored, data is written to out_fd and return is RETVAL_OK or error.
>   */
>   
> -static int INIT read_bunzip(struct bunzip_data *bd, unsigned char *outbuf, int len)
> +static int __init read_bunzip(struct bunzip_data *bd, unsigned char *outbuf, int len)
>   {
>   	const unsigned int *dbuf;
>   	int pos, xcurrent, previous, gotcount;
> @@ -607,7 +607,7 @@ decode_next_byte:
>   	goto decode_next_byte;
>   }
>   
> -static int INIT nofill(void *buf, unsigned int len)
> +static int __init nofill(void *buf, unsigned int len)
>   {
>   	return -1;
>   }
> @@ -615,8 +615,8 @@ static int INIT nofill(void *buf, unsign
>   /* Allocate the structure, read file header.  If in_fd ==-1, inbuf must contain
>      a complete bunzip file (len bytes long).  If in_fd!=-1, inbuf and len are
>      ignored, and data is read from file handle into temporary buffer. */
> -static int INIT start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
> -			     int (*fill)(void*, unsigned int))
> +static int __init start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
> +			       int (*fill)(void*, unsigned int))
>   {
>   	struct bunzip_data *bd;
>   	unsigned int i, j, c;
> @@ -665,11 +665,11 @@ static int INIT start_bunzip(struct bunz
>   
>   /* Example usage: decompress src_fd to dst_fd.  (Stops at end of bzip2 data,
>      not end of file.) */
> -int INIT bunzip2(unsigned char *buf, unsigned int len,
> -		 int(*fill)(void*, unsigned int),
> -		 int(*flush)(void*, unsigned int),
> -		 unsigned char *outbuf, unsigned int *pos,
> -		 void(*error)(const char *x))
> +int __init bunzip2(unsigned char *buf, unsigned int len,
> +		   int(*fill)(void*, unsigned int),
> +		   int(*flush)(void*, unsigned int),
> +		   unsigned char *outbuf, unsigned int *pos,
> +		   void(*error)(const char *x))
>   {
>   	struct bunzip_data *bd;
>   	int i = -1;
> 
> 

-- 
Julien Grall


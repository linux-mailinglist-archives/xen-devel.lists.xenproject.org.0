Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481481D605B
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 12:21:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZtwQ-0007Hd-8S; Sat, 16 May 2020 10:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2yaN=66=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZtwO-0007HU-VD
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 10:21:12 +0000
X-Inumbo-ID: f6eb066c-975e-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6eb066c-975e-11ea-b07b-bc764e2007e4;
 Sat, 16 May 2020 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OMC3SvG/IDTkGrQ9g09O6JMRuWTkg4XZkRiTl8ST/bc=; b=egWKVjdgs4T+KgXmGLuft1tQqB
 1QNNmtjLUvy1GThhhUWyTFJeF1P0Fk+eqsZbNK7GMxxIRmOznbQZ8muiQ9Z51/IDH82Zs6M/fkDD4
 Z+micIldzFlcClcbOBadYDV0ykRXB1R18MD0fKBOeEqGLKDN4VO+EUWyhA8c8SM4KboY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZtwN-0004P9-1r; Sat, 16 May 2020 10:21:11 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZtwM-0000gh-Rj; Sat, 16 May 2020 10:21:10 +0000
Subject: Re: [PATCH] pvcalls: Document correctly and explicitely the padding
 for all arches
To: xen-devel@lists.xenproject.org
References: <20200516101953.1235-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <3b3a9f13-67d6-1fb2-5735-1b9974a1999c@xen.org>
Date: Sat, 16 May 2020 11:21:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200516101953.1235-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Sorry I forgot to CC the maintainers on the e-mail.

I will resent it.

On 16/05/2020 11:19, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The documentation of pvcalls suggests there is padding for 32-bit x86
> at the end of most the structure. However, they are not described in
> in the public header.
> 
> Because of that all the structures would be 32-bit aligned and not
> 64-bit aligned for 32-bit x86.
> 
> For all the other architectures supported (Arm and 64-bit x86), the
> structure are aligned to 64-bit because they contain uint64_t field.
> Therefore all the structures contain implicit padding.
> 
> The paddings are now corrected for 32-bit x86 and written explicitly for
> all the architectures.
> 
> While the structure size between 32-bit and 64-bit x86 is different, it
> shouldn't cause any incompatibility between a 32-bit and 64-bit
> frontend/backend because the commands are always 56 bits and the padding
> are at the end of the structure.
> 
> As an aside, the padding sadly cannot be mandated to be 0 as they are
> already present. So it is not going to be possible to use the padding
> for extending a command in the future.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>      Changes in v2:
>          - It is not possible to use the same padding for 32-bit x86 and
>          all the other supported architectures.
> ---
>   docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
>   xen/include/public/io/pvcalls.h | 14 ++++++++++++++
>   2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
> index 665dad556c39..c25412868f5d 100644
> --- a/docs/misc/pvcalls.pandoc
> +++ b/docs/misc/pvcalls.pandoc
> @@ -246,9 +246,9 @@ The format is defined as follows:
>       			uint32_t domain;
>       			uint32_t type;
>       			uint32_t protocol;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef CONFIG_X86_32
>       			uint8_t pad[4];
> -    			#endif
> +			#endif
>       		} socket;
>       		struct xen_pvcalls_connect {
>       			uint64_t id;
> @@ -257,16 +257,18 @@ The format is defined as follows:
>       			uint32_t flags;
>       			grant_ref_t ref;
>       			uint32_t evtchn;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef CONFIG_X86_32
>       			uint8_t pad[4];
> -    			#endif
> +			#endif
>       		} connect;
>       		struct xen_pvcalls_release {
>       			uint64_t id;
>       			uint8_t reuse;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef CONFIG_X86_32
>       			uint8_t pad[7];
> -    			#endif
> +			#else
> +			uint8_t pad[3];
> +			#endif
>       		} release;
>       		struct xen_pvcalls_bind {
>       			uint64_t id;
> @@ -276,9 +278,9 @@ The format is defined as follows:
>       		struct xen_pvcalls_listen {
>       			uint64_t id;
>       			uint32_t backlog;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef CONFIG_X86_32
>       			uint8_t pad[4];
> -    			#endif
> +			#endif
>       		} listen;
>       		struct xen_pvcalls_accept {
>       			uint64_t id;
> diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
> index cb8171275c13..590c5e9e41aa 100644
> --- a/xen/include/public/io/pvcalls.h
> +++ b/xen/include/public/io/pvcalls.h
> @@ -65,6 +65,9 @@ struct xen_pvcalls_request {
>               uint32_t domain;
>               uint32_t type;
>               uint32_t protocol;
> +#ifndef CONFIG_X86_32
> +            uint8_t pad[4];
> +#endif
>           } socket;
>           struct xen_pvcalls_connect {
>               uint64_t id;
> @@ -73,10 +76,18 @@ struct xen_pvcalls_request {
>               uint32_t flags;
>               grant_ref_t ref;
>               uint32_t evtchn;
> +#ifndef CONFIG_X86_32
> +            uint8_t pad[4];
> +#endif
>           } connect;
>           struct xen_pvcalls_release {
>               uint64_t id;
>               uint8_t reuse;
> +#ifndef CONFIG_X86_32
> +            uint8_t pad[7];
> +#else
> +            uint8_t pad[3];
> +#endif
>           } release;
>           struct xen_pvcalls_bind {
>               uint64_t id;
> @@ -86,6 +97,9 @@ struct xen_pvcalls_request {
>           struct xen_pvcalls_listen {
>               uint64_t id;
>               uint32_t backlog;
> +#ifndef CONFIG_X86_32
> +            uint8_t pad[4];
> +#endif
>           } listen;
>           struct xen_pvcalls_accept {
>               uint64_t id;
> 

-- 
Julien Grall


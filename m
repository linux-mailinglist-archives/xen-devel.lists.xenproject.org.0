Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69C79D614
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600650.936372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg672-0002WA-RD; Tue, 12 Sep 2023 16:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600650.936372; Tue, 12 Sep 2023 16:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg672-0002TU-Oa; Tue, 12 Sep 2023 16:19:40 +0000
Received: by outflank-mailman (input) for mailman id 600650;
 Tue, 12 Sep 2023 16:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg671-0002SQ-7u
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:19:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba09445-5188-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 18:19:38 +0200 (CEST)
Received: from [192.168.1.9] (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 171D44EE0749;
 Tue, 12 Sep 2023 18:19:38 +0200 (CEST)
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
X-Inumbo-ID: 2ba09445-5188-11ee-8786-cb3800f73035
Message-ID: <a99fce88-8f4c-1883-1b4e-73145b989ca8@bugseng.com>
Date: Tue, 12 Sep 2023 18:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 05/13] xen/ioreq: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <771362e703548e55d4ccc420fa880585a5748c4f.1691053438.git.simone.ballarin@bugseng.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <771362e703548e55d4ccc420fa880585a5748c4f.1691053438.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/23 12:22, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>   xen/common/ioreq.c      | 2 +-
>   xen/include/xen/ioreq.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index 7cb717f7a2..62b907f4c4 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -1182,7 +1182,7 @@ static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
>        *  - the count field is usually used with data_is_ptr and since we don't
>        *    support data_is_ptr we do not waste space for the count field either
>        */
> -    if ( (p->addr > 0xffffful) || p->data_is_ptr || (p->count != 1) )
> +    if ( (p->addr > 0xfffffUL) || p->data_is_ptr || (p->count != 1) )
>           return 0;
>   
>       switch ( p->size )
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index a26614d331..cd399adf17 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -60,7 +60,7 @@ struct ioreq_server {
>   static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
>   {
>       return unlikely(p->df) ?
> -           p->addr - (p->count - 1ul) * p->size :
> +           p->addr - (p->count - 1UL) * p->size :
>              p->addr;
>   }
>   

This patch still applies cleanly on staging, any change of getting an Ack?

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)



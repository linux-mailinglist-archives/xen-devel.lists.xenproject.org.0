Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB9937F5EB
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 12:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126886.238437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8vA-0007rL-5k; Thu, 13 May 2021 10:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126886.238437; Thu, 13 May 2021 10:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8vA-0007pQ-2g; Thu, 13 May 2021 10:50:24 +0000
Received: by outflank-mailman (input) for mailman id 126886;
 Thu, 13 May 2021 10:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQpK=KI=csgroup.eu=christophe.leroy@srs-us1.protection.inumbo.net>)
 id 1lh8v7-0007pK-Q3
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 10:50:21 +0000
Received: from pegase2.c-s.fr (unknown [93.17.235.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e0d02e4-5ff4-4e74-8db9-53e5717950ee;
 Thu, 13 May 2021 10:50:19 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fgncz44FZz9sch;
 Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elzAeS9dJuuJ; Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fgncz368bz9scg;
 Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 313FE8B7F3;
 Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R8jvyF-796Mk; Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B59358B76C;
 Thu, 13 May 2021 12:16:34 +0200 (CEST)
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
X-Inumbo-ID: 5e0d02e4-5ff4-4e74-8db9-53e5717950ee
X-Virus-Scanned: amavisd-new at c-s.fr
X-Virus-Scanned: amavisd-new at c-s.fr
Subject: Re: [PATCH 8/8] xen/hvc: replace BUG_ON() with negative return value
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-9-jgross@suse.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6da4cc91-ccde-fce8-707c-e7544783c2fa@csgroup.eu>
Date: Thu, 13 May 2021 12:16:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513100302.22027-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit



Le 13/05/2021 à 12:03, Juergen Gross a écrit :
> Xen frontends shouldn't BUG() in case of illegal data received from
> their backends. So replace the BUG_ON()s when reading illegal data from
> the ring page with negative return values.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   drivers/tty/hvc/hvc_xen.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index 92c9a476defc..30d7ffb1e04c 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -86,6 +86,11 @@ static int __write_console(struct xencons_info *xencons,
>   	cons = intf->out_cons;
>   	prod = intf->out_prod;
>   	mb();			/* update queue values before going on */
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->out),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;
> +
>   	BUG_ON((prod - cons) > sizeof(intf->out));

Why keep the BUG_ON() ?


>   
>   	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
> @@ -114,7 +119,10 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
>   	 */
>   	while (len) {
>   		int sent = __write_console(cons, data, len);
> -		
> +
> +		if (sent < 0)
> +			return sent;
> +
>   		data += sent;
>   		len -= sent;
>   
> @@ -138,7 +146,10 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
>   	cons = intf->in_cons;
>   	prod = intf->in_prod;
>   	mb();			/* get pointers before reading ring */
> -	BUG_ON((prod - cons) > sizeof(intf->in));
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->in),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;
>   
>   	while (cons != prod && recv < len)
>   		buf[recv++] = intf->in[MASK_XENCONS_IDX(cons++, intf->in)];
> 


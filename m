Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02A37F593
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 12:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126870.238414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8XO-00042F-Ue; Thu, 13 May 2021 10:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126870.238414; Thu, 13 May 2021 10:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8XO-00040E-RC; Thu, 13 May 2021 10:25:50 +0000
Received: by outflank-mailman (input) for mailman id 126870;
 Thu, 13 May 2021 10:25:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFe4=KI=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1lh8XN-0003zk-2T
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 10:25:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1541a77-476a-4da5-b731-7a97c2ac679f;
 Thu, 13 May 2021 10:25:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA2A661104;
 Thu, 13 May 2021 10:25:46 +0000 (UTC)
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
X-Inumbo-ID: f1541a77-476a-4da5-b731-7a97c2ac679f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620901547;
	bh=tGSbnJbV9mpjOtoS4fZRDhnpTdRQz/IXHDW4kTYpYAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1I/jANeD3wLrWb04k8nKmsR8WskdmDEfQnDlB/qG+eYesSbsCu01am3HAH+SUqveR
	 7+y3F7VupADfNGsh3gkbc+FnaFq7W5XgtRmTEB2t2fychkG4zIpPchE/u1K4NCOF8I
	 5m1vFoYGXFebcrvbSvQbM6suE/okEvakNcJNX74Q=
Date: Thu, 13 May 2021 12:25:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 8/8] xen/hvc: replace BUG_ON() with negative return value
Message-ID: <YJz+qK8snI64/TKh@kroah.com>
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513100302.22027-9-jgross@suse.com>

On Thu, May 13, 2021 at 12:03:02PM +0200, Juergen Gross wrote:
> Xen frontends shouldn't BUG() in case of illegal data received from
> their backends. So replace the BUG_ON()s when reading illegal data from
> the ring page with negative return values.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/tty/hvc/hvc_xen.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index 92c9a476defc..30d7ffb1e04c 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -86,6 +86,11 @@ static int __write_console(struct xencons_info *xencons,
>  	cons = intf->out_cons;
>  	prod = intf->out_prod;
>  	mb();			/* update queue values before going on */
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->out),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;

How nice, you just rebooted on panic-on-warn systems :(

> +
>  	BUG_ON((prod - cons) > sizeof(intf->out));

Why keep this line?

Please just fix this up properly, if userspace can trigger this, then
both the WARN_ON() and BUG_ON() are not correct and need to be correctly
handled.


>  
>  	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
> @@ -114,7 +119,10 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
>  	 */
>  	while (len) {
>  		int sent = __write_console(cons, data, len);
> -		
> +
> +		if (sent < 0)
> +			return sent;
> +
>  		data += sent;
>  		len -= sent;
>  
> @@ -138,7 +146,10 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
>  	cons = intf->in_cons;
>  	prod = intf->in_prod;
>  	mb();			/* get pointers before reading ring */
> -	BUG_ON((prod - cons) > sizeof(intf->in));
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->in),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;

Same here, you still just paniced a machine :(

thanks,

greg k-h


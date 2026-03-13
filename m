Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNZdD3eRtGn7qAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 23:36:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9728A7CE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 23:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254586.1550324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1B6a-0007wJ-Eu; Fri, 13 Mar 2026 22:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254586.1550324; Fri, 13 Mar 2026 22:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1B6a-0007u8-C0; Fri, 13 Mar 2026 22:35:40 +0000
Received: by outflank-mailman (input) for mailman id 1254586;
 Fri, 13 Mar 2026 22:35:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEuA=BN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1w1B6Y-0007u2-4J
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 22:35:38 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f39e365a-1f2c-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 23:35:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8179A6183E;
 Fri, 13 Mar 2026 22:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03834C19421;
 Fri, 13 Mar 2026 22:35:32 +0000 (UTC)
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
X-Inumbo-ID: f39e365a-1f2c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773441334;
	bh=NCbvP5f6b/mCFhMJmC9j3yAfcF6UdIqCTsj5FlU2tpw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VcP2stPLlc45efG1ATlBlz89qWp35F/JjEqHryh0F3Y9bmzCUrIvK8yF87waJcNGc
	 SjKO/CMF5u+aetYSJTviVylA5gODS1qGJBfnvoDJ/NXbDFgzMrRFnbTTCztAzTGJ+T
	 K/N6GhQ/HtDORPD/UDERYQzIFc8WQxkHxYYOhfJgoUSmJ8TFt0GP6Y9MJNbkc07Cj6
	 8ufjgksNohKApFW9NTPO4YC8qdeh9jcKhG7/rW9wjkQFs/VzzyrgiRB9uQ0UNA4nwm
	 r0d3OefD5V5LYb1e3xz0prUX/BxkOyU6H9u07+GAenyFQYk5we8A19XiohfzUuwj/+
	 9F2EnCXuH/ZYA==
Date: Fri, 13 Mar 2026 15:35:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] hvc/xen: Check console connection flag
In-Reply-To: <20260312173845.47235-1-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2603131535200.1759048@ubuntu-linux-20-04-desktop>
References: <20260312173845.47235-1-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D6C9728A7CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 11 Mar 2026, Jason Andryuk wrote:
> When the console out buffer is filled, __write_console() will return 0
> as it cannot send any data.  domU_write_console() will then spin in
> `while (len)` as len doesn't decrement until xenconsoled attaches.  This
> would block a domU and nullify the parallelism of Hyperlaunch until dom0
> userspace starts xenconsoled, which empties the buffer.
> 
> Xen 4.21 added a connection field to the xen console page.  This is set
> to XENCONSOLED_DISCONNECTED (1) when a domain is built, and xenconsoled
> will set it to XENCONSOLED_CONNECTED (0) when it connects.

It should be XENCONSOLE_DISCONNECTED


> Update the hvc_xen driver to check the field.  When the field is
> disconnected, drop the write with -ENOTCONN.  We only drop the write
> when the field is XENCONSOLED_DISCONNECTED (1) to try for maximum
> compatibility.  The Xen toolstack has historically zero initialized the
> console, so it should see XENCONSOLED_CONNECTED (0) by default.  If an
> implemenation used uninitialized memory, only checking for
> XENCONSOLED_DISCONNECTED could have the lowest chance of not connecting.
> 
> This lets the hyperlaunched domU boot without stalling.  Once dom0
> starts xenconsoled, xl console can be used to access the domU's hvc0.
> 
> Update the console.h header to bring in the new field.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Aside from the minor comment on the commit message:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/tty/hvc/hvc_xen.c          |  3 +++
>  include/xen/interface/io/console.h | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index 7f0b6262488c..c407592442cd 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -139,6 +139,9 @@ static ssize_t domU_write_console(uint32_t vtermno, const u8 *data, size_t len)
>  	if (cons == NULL)
>  		return -EINVAL;
>  
> +	if (cons->intf->connection == XENCONSOLE_DISCONNECTED)
> +		return -ENOTCONN;
> +
>  	/*
>  	 * Make sure the whole buffer is emitted, polling if
>  	 * necessary.  We don't ever want to rely on the hvc daemon
> diff --git a/include/xen/interface/io/console.h b/include/xen/interface/io/console.h
> index cf17e89ed861..687949bdebb1 100644
> --- a/include/xen/interface/io/console.h
> +++ b/include/xen/interface/io/console.h
> @@ -19,6 +19,19 @@ struct xencons_interface {
>      char out[2048];
>      XENCONS_RING_IDX in_cons, in_prod;
>      XENCONS_RING_IDX out_cons, out_prod;
> +/*
> + * Flag values signaling from backend to frontend whether the console is
> + * connected.  i.e. Whether it will be serviced and emptied.
> + *
> + * The flag starts as disconnected.
> + */
> +#define XENCONSOLE_DISCONNECTED 1
> +/*
> + * The flag is set to connected when the backend connects and the console
> + * will be serviced.
> + */
> +#define XENCONSOLE_CONNECTED    0
> +    uint8_t connection;
>  };
>  
>  #endif /* __XEN_PUBLIC_IO_CONSOLE_H__ */
> -- 
> 2.34.1
> 


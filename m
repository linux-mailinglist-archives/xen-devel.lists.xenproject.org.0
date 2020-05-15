Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8AF1D469D
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 09:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZULN-00028L-TX; Fri, 15 May 2020 07:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yAEg=65=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZULM-00028G-Jz
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 07:01:16 +0000
X-Inumbo-ID: ddb2ffa0-9679-11ea-a529-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddb2ffa0-9679-11ea-a529-12813bfff9fa;
 Fri, 15 May 2020 07:01:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33FC0ACFE;
 Fri, 15 May 2020 07:01:16 +0000 (UTC)
Subject: Re: [PATCH 1/1] xen/manage: enable C_A_D to force reboot
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200513233410.18120-1-dongli.zhang@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e604a96d-087e-573b-c3bf-fc53005f8994@suse.com>
Date: Fri, 15 May 2020 09:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513233410.18120-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: rose.wang@oracle.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joe.jin@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.20 01:34, Dongli Zhang wrote:
> The systemd may be configured to mask ctrl-alt-del via "systemctl mask
> ctrl-alt-del.target". As a result, the pv reboot would not work as signal
> is ignored.
> 
> This patch always enables C_A_D before the call of ctrl_alt_del() in order
> to force the reboot.

Hmm, I'm not sure this is a good idea.

Suppose a guest admin is doing a critical update and wants to avoid a
sudden reboot in between. By masking the reboot this would be possible,
with your patch it isn't.

In case a reboot is really mandatory it would still be possible to just
kill the guest.

I'm not completely opposed to the patch, but I think this is a change
which should not be done easily.


Juergen

> 
> Reported-by: Rose Wang <rose.wang@oracle.com>
> Cc: Joe Jin <joe.jin@oracle.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>   drivers/xen/manage.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
> index cd046684e0d1..3190d0ecb52e 100644
> --- a/drivers/xen/manage.c
> +++ b/drivers/xen/manage.c
> @@ -204,6 +204,13 @@ static void do_poweroff(void)
>   static void do_reboot(void)
>   {
>   	shutting_down = SHUTDOWN_POWEROFF; /* ? */
> +	/*
> +	 * The systemd may be configured to mask ctrl-alt-del via
> +	 * "systemctl mask ctrl-alt-del.target". As a result, the pv reboot
> +	 * would not work. To enable C_A_D would force the reboot.
> +	 */
> +	C_A_D = 1;
> +
>   	ctrl_alt_del();
>   }
>   
> 



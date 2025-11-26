Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7BC8A818
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 16:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173001.1498102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOH0l-0006sl-2L; Wed, 26 Nov 2025 15:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173001.1498102; Wed, 26 Nov 2025 15:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOH0k-0006pd-VD; Wed, 26 Nov 2025 15:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1173001;
 Wed, 26 Nov 2025 15:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojcj=6C=bounce.vates.tech=bounce-md_30504962.6927161d.v1-81fc939274b6493193a05a69d48d5f9e@srs-se1.protection.inumbo.net>)
 id 1vOH0j-0006pX-Fl
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 15:00:49 +0000
Received: from mail136-9.atl41.mandrillapp.com
 (mail136-9.atl41.mandrillapp.com [198.2.136.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afd635ed-cad8-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 16:00:47 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-9.atl41.mandrillapp.com (Mailchimp) with ESMTP id 4dGjRd0QzlzHXYkNb
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 15:00:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 81fc939274b6493193a05a69d48d5f9e; Wed, 26 Nov 2025 15:00:45 +0000
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
X-Inumbo-ID: afd635ed-cad8-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764169245; x=1764439245;
	bh=PzlwzW8LfTD5LkQSEdCXaGr/9PuPACuh6ma9/CPiKIA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PqGrXllkkn+6n/crMZD3RYeL0wnJ5z+7TFcVZpINE6NkKQnPJRGEarWZa3ttfgH53
	 fyEep9dB+9J/zDFGW5X1P4Z4Mw3rXY1B6PXpNDuc6zNZ1zI0yBMSz3YzIMrCMKxdyW
	 A9lDjDmcLZCXKsVVfwSLHSk2B70dq/B4nABZM1HbxW5DpNCuX5FPj0i7ZOJNY2a/lM
	 AVZOpxQnvtLU8RUaBuUIoyR44v3YIc3GbWDM1yVAtOZVGqMLHL9AogqXlu6CfbQ9Kx
	 APYj3fxIQMWk4V5GTqdHKYrNstrRz3wpysvomDhdjaYZ9mEUKjFTCLzEcJr5bTu2aN
	 /XovHHiPqCKUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764169245; x=1764429745; i=yann.sionneau@vates.tech;
	bh=PzlwzW8LfTD5LkQSEdCXaGr/9PuPACuh6ma9/CPiKIA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FZAvEoYTE5oQfmPQzsmfSCtetf5HgyUZdPTEcuNGWuF733hjps31mmL9imfD6IBOT
	 2B4D+TcAKxkioLBkIyiDFsczhgfJHqR8f6+dxebd7sCq8dmeY5NT6KO0P/Y4B3Vsma
	 7XtS0SG1/hvmhkuX0GbyjEn665ARF5eCcwPFIlcBtkuOqVRgHPv5zGwbG4az3qf7Sz
	 DbvX2TsoN0KPTEUIjEIuDouuh95Le1nIwWXgXF0DJYVOMhDz4NBOmVA2XOipB4B7Lp
	 0Y0Srbwfelfx13RKWzzU6RYKJDYeL5auWla1A2AlpffzcDkmPmCyKAe6AjRtHqf5Hg
	 7uUx50dGDbjHg==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20xenbus:=20Use=20.freeze/.thaw=20to=20handle=20xenbus=20devices?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764169243811
Message-Id: <584b282f-4562-4051-b028-b9d36b3d16c6@vates.tech>
To: "Jason Andryuk" <jason.andryuk@amd.com>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20251119224731.61497-1-jason.andryuk@amd.com> <20251119224731.61497-2-jason.andryuk@amd.com>
In-Reply-To: <20251119224731.61497-2-jason.andryuk@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.81fc939274b6493193a05a69d48d5f9e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251126:md
Date: Wed, 26 Nov 2025 15:00:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Jason,

On 11/19/25 23:46, Jason Andryuk wrote:
> The goal is to fix s2idle and S3 for Xen PV devices.  A domain resuming
> from s3 or s2idle disconnects its PV devices during resume.  The
> backends are not expecting this and do not reconnect.
> 
> b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
> resume/chkpt") changed xen_suspend()/do_suspend() from
> PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the
> suspend/resume callbacks remained.
> 
> .freeze/restore are used with hiberation where Linux restarts in a new
> place in the future.  .suspend/resume are useful for runtime power
> management for the duration of a boot.
> 
> The current behavior of the callbacks works for an xl save/restore or
> live migration where the domain is restored/migrated to a new location
> and connecting to a not-already-connected backend.
> 
> Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
> .suspend/resume hook.  This matches the use in drivers/xen/manage.c for
> save/restore and live migration.  With .suspend/resume empty, PV devices
> are left connected during s2idle and s3, so PV devices are not changed
> and work after resume.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>   drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
> index 6d1819269cbe..199917b6f77c 100644
> --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
> +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
> @@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct device *_dev)
>   }
>   
>   static const struct dev_pm_ops xenbus_pm_ops = {
> -	.suspend	= xenbus_dev_suspend,
> -	.resume		= xenbus_frontend_dev_resume,
>   	.freeze		= xenbus_dev_suspend,
>   	.thaw		= xenbus_dev_cancel,
> -	.restore	= xenbus_dev_resume,
> +	.restore	= xenbus_frontend_dev_resume,
>   };
>   
>   static struct xen_bus_type xenbus_frontend = {

I've tried putting Debian 13 to sleep with your patch (echo freeze > 
/sys/power/state) and could not wake up the guest.
Isn't it also mandatory to apply this patch 
https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-events-Add-wakeup-support-to-xen-pirq.patch 
?

With both patches applied, I get the wake up to work.

Regards,

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




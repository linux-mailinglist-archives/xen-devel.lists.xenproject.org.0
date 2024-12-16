Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40389F338C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858216.1270469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCPa-0001s0-Mp; Mon, 16 Dec 2024 14:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858216.1270469; Mon, 16 Dec 2024 14:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCPa-0001pr-KC; Mon, 16 Dec 2024 14:49:30 +0000
Received: by outflank-mailman (input) for mailman id 858216;
 Mon, 16 Dec 2024 14:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y097=TJ=bounce.vates.tech=bounce-md_30504962.67603df5.v1-82e0938de9bb411e81eaa74549021c58@srs-se1.protection.inumbo.net>)
 id 1tNCPZ-0001pl-RH
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:49:30 +0000
Received: from mail133-23.atl131.mandrillapp.com
 (mail133-23.atl131.mandrillapp.com [198.2.133.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f27ca8cb-bbbc-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:49:27 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-23.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4YBjWn5L7Pz35hVQF
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 14:49:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 82e0938de9bb411e81eaa74549021c58; Mon, 16 Dec 2024 14:49:25 +0000
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
X-Inumbo-ID: f27ca8cb-bbbc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734360565; x=1734621065;
	bh=yVc8L/HByx5QGMmakcTUzjf5vsWSBENwyb/0Ge0cI/k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PP7z54uoWWFBVy8YiLz5PGxIenQd4kjGgA1Y+vMI2lhtec6MhQ4WeqGFPSwtAEWjR
	 j5Gk/TB+pI5KjTB88TVvRnbujHIPQtKNZhb4loJ+yu1g1f/vS1e7Kog4zRQk2NZ0ml
	 20HNm2tOCEbsANkJZdm/v6GtutIx1SncPcTE7fNTfRaXMvLoyfZAWNLlIQ8HHvTccH
	 8av9znpdS2tLocLxNVn663A1wA/v/5prHXQrldOWQG3SlXQxSIaDe/qCKKHy1re+OC
	 VssvLmvg+Zcl27qOGyYKsk1J7qIuWTM3CvThbI8PTDBIuiecQ2CCIJC5uqzlITJRCh
	 gTHn0k87B9mYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734360565; x=1734621065; i=anthony.perard@vates.tech;
	bh=yVc8L/HByx5QGMmakcTUzjf5vsWSBENwyb/0Ge0cI/k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xD2pEPM0zS6QGBx0SA3YWyb5FG8k95zQIPBd+ttlmhoiNgGPFRHlYiJWmpuiliQML
	 Lo7aqs8gkLWBIQiPwlniqaxo84fdqPh5zW127FG47iZEqYwFkv6dijaSWrjyj0oNvn
	 oOqA3GBn8+yi0ltJvnfPvVWC53p03oi22lEGpDceszpoH+yG5dvKl/gyYCprM7empm
	 ys9iCcUbXCqGT1X152wcN2/ARtRPayxcl2ZuycKvOo1T23tKm21vSJigIEDAoSZ3AZ
	 8YlYPkT2tPh1QzuP/55I0wxFZYRZ7M6NpKzDD1FTMtPeDtIRRbpzetDi3k0sCL18LE
	 9Kv6MoJp9rieA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=206/7]=20tools/libs:=20add=20a=20new=20libxenmanage=20library?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734360565175
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z2A99DaztQH9161h@l14>
References: <20241213162421.16782-1-jgross@suse.com> <20241213162421.16782-7-jgross@suse.com>
In-Reply-To: <20241213162421.16782-7-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.82e0938de9bb411e81eaa74549021c58?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241216:md
Date: Mon, 16 Dec 2024 14:49:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Dec 13, 2024 at 05:24:20PM +0100, Juergen Gross wrote:
> diff --git a/tools/include/xenmanage.h b/tools/include/xenmanage.h
> new file mode 100644
> index 0000000000..5d169693b0
> --- /dev/null
> +++ b/tools/include/xenmanage.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: LGPL-2.1 */

This should read "LGPL-2.1-only".

> diff --git a/tools/libs/manage/core.c b/tools/libs/manage/core.c
> new file mode 100644
> index 0000000000..b5fa67b036
> --- /dev/null
> +++ b/tools/libs/manage/core.c
> @@ -0,0 +1,168 @@

> +static int xenmanage_do_domctl_get_domain_state(xenmanage_handle *hdl,
> +                                                unsigned int domid_in,
> +                                                unsigned int *domid_out,
> +                                                unsigned int *state,
> +                                                uint64_t *unique_id)
> +{
> +    struct xen_domctl *buf;
> +    int saved_errno;
> +    int ret;
> +
> +    buf = xencall_alloc_buffer(hdl->xcall, sizeof(*buf));
> +    if ( !buf )
> +    {
> +        errno = ENOMEM;

Is this necessary? Isn't xencall_alloc_buffer() going to set `errno`? Or
is it to overwrite `errno` set by system calls which could be other than
ENOMEM?

> +        return -1;
> +    }

Otherwise, patch looks fine to me: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


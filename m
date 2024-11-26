Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40CE9D9C90
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 18:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843977.1259545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzMX-0006sP-V6; Tue, 26 Nov 2024 17:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843977.1259545; Tue, 26 Nov 2024 17:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzMX-0006pU-Ru; Tue, 26 Nov 2024 17:28:33 +0000
Received: by outflank-mailman (input) for mailman id 843977;
 Tue, 26 Nov 2024 17:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=58W+=SV=bounce.vates.tech=bounce-md_30504962.67460538.v1-66637e0ed7a34aef89b0ac50fb23cbee@srs-se1.protection.inumbo.net>)
 id 1tFzMW-0006pO-G2
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 17:28:32 +0000
Received: from mail134-5.atl141.mandrillapp.com
 (mail134-5.atl141.mandrillapp.com [198.2.134.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7d8cb93-ac1b-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 18:28:26 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-5.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4XyV0S5JtGzG0CCNb
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 17:28:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 66637e0ed7a34aef89b0ac50fb23cbee; Tue, 26 Nov 2024 17:28:24 +0000
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
X-Inumbo-ID: d7d8cb93-ac1b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNC41IiwiaGVsbyI6Im1haWwxMzQtNS5hdGwxNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ3ZDhjYjkzLWFjMWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjQyMTA2LjcxMDg3Niwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDYwNTM4LnYxLTY2NjM3ZTBlZDdhMzRhZWY4OWIwYWM1MGZiMjNjYmVlQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732642104; x=1732902604;
	bh=P+qM1w/y12acB8iR/jp4snyiIcnwcoYsTw8t3cVTlN8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lcDJW3d5ojQ/IX5sLj9+9W95CDFdiF64lGC0Rf7bP1DJN/7xSI4syjBGt85uR8KQ9
	 +tqswwyaqEHo+23/ZbG+cHXAU/h151xj0VlTWn0VMUKc98HcXVllYHMCEIxNC0BpYd
	 edJyirTXENmHijh7/pz+QhhHI1deu62SThSTq9bXhtvPSppMWDhyHbcRnEJERzcwUz
	 0r16/Saya0ZG4ydUdD3gH86RULCLwSqOVFv4XFrnyaQBaDr/DLITpv2LU2O03hCe1Z
	 kwBF5nRigk/Pt3ynN5OXVVHmXVFBcTlDHBpE/6YjonthucofAkxr72LKInc2Cbs9ZL
	 4TgzcjXu5m+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732642104; x=1732902604; i=anthony.perard@vates.tech;
	bh=P+qM1w/y12acB8iR/jp4snyiIcnwcoYsTw8t3cVTlN8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0UofJUZLgZWlNnk1UFmQRJMRR9k5XnjJqBXPffkxnAmpAJ8sEBFfog5ph9KH/YR/u
	 DadIlSrWfCSPZsnfOl5SsybIaLh0ptqZB3eMT19HoObHClelEjgj2Tg4GoB7FEZ137
	 lPxWM1vY8ubKMSgG/7uwS6EhxCkcJk970z5v72a9cdu0v+HPpYju7QBwLX3u0eJ5mu
	 RvwaPMbPo4Vk9KwxvWUHrZXjUhkKwDvWujcqf2uDkzxY8F+sCUhsBk9NARCm/L3eJZ
	 ni9VeTCWJhE9USFBTb+gE3Dbq5v2IUsmzWxebsGIhkXIcKaSGABYsoQjxrwYc2B4v0
	 o7YKL6EQ6jYxA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=205/6]=20tools:=20add=20a=20dedicated=20header=20file=20for=20barrier=20definitions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732642104050
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z0YFN13jUJMNb-7h@l14>
References: <20241023131005.32144-1-jgross@suse.com> <20241023131005.32144-6-jgross@suse.com>
In-Reply-To: <20241023131005.32144-6-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.66637e0ed7a34aef89b0ac50fb23cbee?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241126:md
Date: Tue, 26 Nov 2024 17:28:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Oct 23, 2024 at 03:10:04PM +0200, Juergen Gross wrote:
> diff --git a/tools/include/xen-barrier.h b/tools/include/xen-barrier.h
> new file mode 100644
> index 0000000000..62036f528b
> --- /dev/null
> +++ b/tools/include/xen-barrier.h
> @@ -0,0 +1,51 @@
> +/******************************************************************************
> + * xen-barrier.h
> + *
> + * Definition of CPU barriers, part of libxenctrl.

Does it needs to be part of "libxenctrl" ? :-) Since the goal is to be
able to use the header without xenctrl.

> + *
> + * Copyright (c) 2003-2004, K A Fraser.

I'm not sure this copyright line is enough, looking at `git blame`.

Keir introduce xen_barrier macro in 2012, in
8d3f757328e1 ("libxc: Update rmb/wmb for x86.")
Stefano introduced the Arm macro in 2012, in daa314fe1938 ("arm: compile
libxc"), and Ian in 2013 in ae4b6f29a983 ("tools: libxc: arm64
support").
There's been a modification by Andrew in 2020, so Citrix copyright,
in de16a8fa0db7 ("x86: Use LOCK ADD instead of MFENCE for smp_mb()").

So overall, we probably want:
Copyright (C) 2003-2012, K A Fraser.
Copyright (C) 2012-2020 Citrix Systems, Inc.


> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2.1 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef XENBARRIER_H
> +#define XENBARRIER_H

With an extra '_' for the '-' in the header filename?
    XEN_BARRIER_H


Otherwise, the rest of the patch looks fine to me, even without the rest
of the series.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


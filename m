Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1892FC0A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 16:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758081.1167336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGqy-0004X2-Md; Fri, 12 Jul 2024 14:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758081.1167336; Fri, 12 Jul 2024 14:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGqy-0004UR-Jy; Fri, 12 Jul 2024 14:02:28 +0000
Received: by outflank-mailman (input) for mailman id 758081;
 Fri, 12 Jul 2024 14:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KtAg=OM=bounce.vates.tech=bounce-md_30504962.6691376f.v1-7b3f1ee5345a48ff83aa4421e83ad123@srs-se1.protection.inumbo.net>)
 id 1sSGqx-0004UL-Ju
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 14:02:27 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dee78fb-4057-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 16:02:26 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WLCvz3050zB5pRww
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 14:02:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7b3f1ee5345a48ff83aa4421e83ad123; Fri, 12 Jul 2024 14:02:23 +0000
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
X-Inumbo-ID: 5dee78fb-4057-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720792943; x=1721053443;
	bh=BQPqzYGinNVrT3sdRKBjAWc5uEJVx9kuUE70PaYy9EI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WBf45lGMkd3UbAL+FKea/PGUw9BUYpPhwMRlQ3ukkvttpnc2C+TanIH5K+w6bD+o+
	 TnZPRj/OHJzKyZUL3z1kq2m/M8DpBEyrGCCtLEdPKz+kpG9+uH3TT5RGvAkP9sXGmH
	 Z+O9jYDCErXlPPvsJ6Kkm9SPrqohkej69wBAaRd75bIxm02fFj5+p7ROhv2NuqeydA
	 NircV5nLmiICVvV860qoBz/nVh+5MjlCtsh7Y5ozhvi2pC6Snv2RwGycnXKyThJWND
	 benfovm+O+g+gG/55HtKZfEpEsX8V0yf0/g+adWpY5OpufGnV25He7OlRL6SM3xa9K
	 bOB4CQHCvzSqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720792943; x=1721053443; i=anthony.perard@vates.tech;
	bh=BQPqzYGinNVrT3sdRKBjAWc5uEJVx9kuUE70PaYy9EI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IBwEo20uIzKsFkmk9cQ+r0gXSFtesrPl+HqhK427cy5tZflEPvAtvNmS2wFIRv2/j
	 0Xeqrw7uDemp+Pvp24hTM4jrVZ2T9eL7vUOOj4dIOzKuUJAjavFw9BrdQFs/6pxQmx
	 CdT7gr3RFUTWZFW+y2te+z4MVWs+fA0cXlc9tXarH9H0M94bF65DiJuAcF5qsHjD6f
	 YFrszSALLqFS3WETPdhcjSI0mR7e4rL9fSO7osiOI2gAdAscFdcjgV4Jp9QjC2eKu4
	 LB56q8oPIg1YfCaWTwhliY+n2d7WjXTAAcHxlikvKehGvOFgR1xkVaaK7wdd0H77Dd
	 pZqegM3myoUtw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2015/12]=20CI:=20Refresh=20Ubuntu=20Xenial=20container=20as=2016.04-x86=5F64?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720792942192
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpE3bW4GNht0lWci@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240712104829.3237296-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712104829.3237296-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7b3f1ee5345a48ff83aa4421e83ad123?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 14:02:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 11:48:29AM +0100, Andrew Cooper wrote:
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index 0ff53b6fe4e1..5fc41c36a27c 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -52,9 +52,9 @@ case "_${CONTAINER}" in
>      _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
>      _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
>      _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
> -    _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
>      _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
>      _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
> +    _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
>  
>      *) guess_container ;;

I've been wondering why I couldn't apply the patch (and the next one),
and there's these 2 lines of extra context ;-)

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


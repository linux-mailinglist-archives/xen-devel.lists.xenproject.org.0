Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFBB0F41E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054014.1422821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZcV-0003LS-FS; Wed, 23 Jul 2025 13:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054014.1422821; Wed, 23 Jul 2025 13:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZcV-0003IS-Cr; Wed, 23 Jul 2025 13:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1054014;
 Wed, 23 Jul 2025 13:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfeK=2E=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ueZcT-0003Hh-BD
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:34:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ced112cf-67c9-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:34:50 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B11094EE3C3B;
 Wed, 23 Jul 2025 15:34:49 +0200 (CEST)
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
X-Inumbo-ID: ced112cf-67c9-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753277689;
	b=iyXEJnyzf37glc/sE4T111hQVrZKIe0qblePBvlnivHcpXRpw0kKV/yuWfyouvvsiHsG
	 qxQuE7miI/6E5NPBjQRUhcGJDNW9DQBKeQp+Bldjp4SId5J3tl+MGHOXOXoXQiPuY+Cki
	 sdJ35MJcO9KMTOLspp9Qa1z4GZwwGBjRqSDkTpTQcu+WcxeT9Q9XdZQPx5OvIH9uDQKz9
	 vuuzeqioby9pqll0kRqIz08zTHLGNW+ioAKriX92ywUnX02BOPwkkWTGRGotZ5L8iI2h3
	 1IxwTaT1Cvecgvf7bu+QGXfWAZ3MDkqorCkKyHHR2Yt4bGjjlP8p1fhgBw5QjcbsTvOGK
	 6WR55rX+TCrUSnd9m62vXE7kE59wxL8AvCriFYdHRc6P/brkxjtgDQVNVqk1GlQ/R4215
	 H5wGjC+s4gGmX4JY5UBYr/jKV6tcxr/xbE4Oecgu2vgl7nCOvVZ/BqWSG0R0dRC7w/2kO
	 gswvsZ0LnVC5F139zima59+Mrh1gIslQdhyjMV5bSpUtFVRe4kof5zJ3jN+OXLifVn4o4
	 /TCBeBGoO+shcsywco89J15TQmdfRdv3vtVVqk4E7+eq9Xfa3d8qn99PsZ1P/OWBVCrYh
	 kCltF0OmHmT1s6UbAzqtOyJTmirwaJ9NU76aEep81s69Ta2jWhwTjCdDBK4q3ls=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753277689;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=HESR4Qkk+WBzYcfC/IuB8fOLuDZQFKijpxR/51/V+gg=;
	b=elSrVv8vdZBDziLoumnKHQECuusbPjLbYdIBnuCWbIES+WaHFtuqWePgXaGog0UHlqQT
	 4ews+sZTAmll+ftQJ/KA2o9wXPKPb85LLqNSa7TPcp7Sq51hcHJca6VqNHOCt27FQ1/0z
	 6CbFqloqquR937zNJ0tAziaAPYImVKYcM4ZRC/TfW2Dx2j+j0zNR/S3kFto5HxWU0nnqN
	 ebmgRYqVq08PXFBw5WXlndAHaboFBcj+/+f7se3cyuEqYK/prssYeWaQJCPuxsIKW+8MH
	 OE90WRExocLF0IJj5GezQ2yW4cZFEnjXSq719dWmePv6vIuQ19nEOksOA/dypTJPlKEMJ
	 VQTOykghA8yZiDhX0NJ3PafagP3L59V5T8wA7yX1aWsvwjk7PBQt7c/k0LKd6dDquWETe
	 2dRtP2QyPatiKRPyzJq1L6a5iOQhZxWav/0TDORwPYK7V6rhLwr9RQtBhDYY5wnHlhBsS
	 zJq7JmJmr8gLej7b855VEnwNxs8u6zkTGFbfXIMvt/c8QjugZ7MO+SuDbB29OsOAxcZpO
	 sd0DWIkj/yRfvNv1uXSzLTN3iwKhy7SOUcBwSvcIu2upYePxcKI/BCcS43ND3wD1QSefH
	 3Os6D5UFtS392Lu5Yv9Qcx+A0FGR4d/NC3+4zzkYx3yZYhbznYXoHqmGNLiSMPs=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753277689; bh=8utASlJDBGOMaCR/9WgyqPT7uBitRFqqhDevLnwAvw0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DvynqymxwcSmt+qCtk5Q3CwzVviq50S/61QI7Q56qsRqTg4Lke7vio0hNKQoihppA
	 bawgeD7/Qk1GrbAi7y0nDetuNqJKrE+lHqwo2uFzMIj2lH+KvO+aiwU4/daRgdXuiv
	 UQk+fnXRl6NoK53cEsc0DxmlDPuvndSETTJhV82WZgTA4yz3kcZS7X7enrDGxQ+NGv
	 vpwgI3BsZkX+UqrTtmtylIMwHd9vqZdrB/BEvjR8+C38T6BlrbK5oss3z1/JTdur/z
	 90UWZ8JHdpdMwyBkZOamYzShkFXEt0hQid3mxNoYPxLHTYJy6US9COPBo+w4z5U0XL
	 0JQpeN8IMQrOA==
MIME-Version: 1.0
Date: Wed, 23 Jul 2025 15:34:49 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/eclair: monitor rules 11.6, 17.2, 18.3, 21.11,
 21.14-16
In-Reply-To: <2134a233586a6aeb5de740baf082ba87ecb212df.1753271488.git.dmytro_prokopchuk1@epam.com>
References: <2134a233586a6aeb5de740baf082ba87ecb212df.1753271488.git.dmytro_prokopchuk1@epam.com>
Message-ID: <5017349a547a69b666234bdfe4713c96@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-23 15:30, Dmytro Prokopchuk1 wrote:
> Add MISRA C rules to the monitored set.
> All these rules are 'accepted' for XEN, have zero or few violations,
> and should be enabled for the ECLAIR scan.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI: 
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1943607023
> ---
>  automation/eclair_analysis/ECLAIR/monitored.ecl | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

If some have zero violations they should be tagged as "clean" in 
tagging.ecl

> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl 
> b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 00bff9edbe..72698b2eb1 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -45,6 +45,7 @@
>  -enable=MC3A2.R10.2
>  -enable=MC3A2.R11.1
>  -enable=MC3A2.R11.2
> +-enable=MC3A2.R11.6
>  -enable=MC3A2.R11.7
>  -enable=MC3A2.R11.8
>  -enable=MC3A2.R11.9
> @@ -62,12 +63,14 @@
>  -enable=MC3A2.R16.6
>  -enable=MC3A2.R16.7
>  -enable=MC3A2.R17.1
> +-enable=MC3A2.R17.2

This might make sense only to avoid directly recursive functions being 
accidentally introduced. We are working at improving the granularity of 
the reports for indirect recursion, but the rationale of the addition 
should to be mentioned in the description

>  -enable=MC3A2.R17.3
>  -enable=MC3A2.R17.4
>  -enable=MC3A2.R17.5
>  -enable=MC3A2.R17.6
>  -enable=MC3A2.R18.1
>  -enable=MC3A2.R18.2
> +-enable=MC3A2.R18.3
>  -enable=MC3A2.R18.6
>  -enable=MC3A2.R18.8
>  -enable=MC3A2.R19.1
> @@ -83,14 +86,18 @@
>  -enable=MC3A2.R20.14
>  -enable=MC3A2.R21.3
>  -enable=MC3A2.R21.4
> --enable=MC3A2.R21.6
>  -enable=MC3A2.R21.5
> +-enable=MC3A2.R21.6
>  -enable=MC3A2.R21.7
>  -enable=MC3A2.R21.8
>  -enable=MC3A2.R21.9
>  -enable=MC3A2.R21.10
> +-enable=MC3A2.R21.11
>  -enable=MC3A2.R21.12
>  -enable=MC3A2.R21.13
> +-enable=MC3A2.R21.14
> +-enable=MC3A2.R21.15
> +-enable=MC3A2.R21.16
>  -enable=MC3A2.R21.17
>  -enable=MC3A2.R21.18
>  -enable=MC3A2.R21.19

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253


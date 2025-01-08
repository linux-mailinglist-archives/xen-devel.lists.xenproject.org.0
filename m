Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02DA057CC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867100.1278528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT5n-0007Cu-TL; Wed, 08 Jan 2025 10:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867100.1278528; Wed, 08 Jan 2025 10:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT5n-0007AV-Q5; Wed, 08 Jan 2025 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 867100;
 Wed, 08 Jan 2025 10:15:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYhQ=UA=bounce.vates.tech=bounce-md_30504962.677e502e.v1-d03c739cf22d4a4c8b88768a65d2dbc0@srs-se1.protection.inumbo.net>)
 id 1tVT5m-0007AP-Qs
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:15:14 +0000
Received: from mail134-8.atl141.mandrillapp.com
 (mail134-8.atl141.mandrillapp.com [198.2.134.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71f3d10c-cda9-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 11:15:12 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-8.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4YSkLk6Hbhz3sNCr9
 for <xen-devel@lists.xenproject.org>; Wed,  8 Jan 2025 10:15:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d03c739cf22d4a4c8b88768a65d2dbc0; Wed, 08 Jan 2025 10:15:10 +0000
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
X-Inumbo-ID: 71f3d10c-cda9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736331310; x=1736591810;
	bh=znnJs+48Fw1s+VLjr03QiZ20QYHnVQ/14a/O1GbNvtM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=glJ1uKXwgGTF5ZfxJFFkH4Q7lOJvwcRw00DQ6ovIH2psy/jZV+rpKMCl0x7iYinWL
	 pmIPAtH0JKpyleiSPoPFQWKxQXRfuvZ8OTGLsHAm271nLKLSsdGV8q+NiuXALqaW3V
	 p/fRUo06qeaM66dTy6iqxFSHcWZ7EhQFwTVvgp/bzompRWXP2etz2cd4FJCt2PkCND
	 WHxrwIbhlhxCe4Zq3iSTEuaqIhdZXn5i9m7PNtUxZzjXbY/33ekL5a/DWjwsRrCLpL
	 5j7bBNkndT/6brXb11KdB9pvGLNvthqyyv5mpvCx9zdZ1lgFhbtaylYObjeR12jpss
	 z1+eNJ2b657tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736331310; x=1736591810; i=anthony.perard@vates.tech;
	bh=znnJs+48Fw1s+VLjr03QiZ20QYHnVQ/14a/O1GbNvtM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=w1BFXvweXwHygsBKA2wESXB3inwpdIxeLjTq2tI+uscWw5y5G4HRlOJzy8xWy+VDU
	 LvHLS6sTQe1YEHwE5a+gY/oKW9eQMs+5pg8/KehqxgSZsTqWrXjFk+o9zuy+t43Jbb
	 TBkXZsb93bS9bfg/WZSQm5ByJbFoD/4XLarTNh8qdQCKnVdAeRuhYfZoDJ8SUe5HJJ
	 MIOY5sHILLj7eVNJovT+cgV4ncpAXaLhb8yKgCBRe5i/yZgwdT3SUe1mASMsmVDV3l
	 6SrikrdHUhG/DRFTshdhEJmHHQKvc6Q3SkrJ+q34hpRlAXNd29hOQ+aiqq8kprvpS4
	 PreWcYDa4VAEg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=201/2]=20tools/libs:=20remove=20dead=20code?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736331309764
To: "Ariel Otilibili" <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-Id: <Z35QLcQAnbUqRBIm@l14>
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr> <20241224191529.138119-1-Ariel.Otilibili-Anieli@eurecom.fr> <20241224191529.138119-2-Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <20241224191529.138119-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d03c739cf22d4a4c8b88768a65d2dbc0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250108:md
Date: Wed, 08 Jan 2025 10:15:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ariel,

On Tue, Dec 24, 2024 at 08:13:54PM +0100, Ariel Otilibili wrote:
> Default switch cases skip these steps; these instructions are never reached.

The "default" case might skip these statements, but the intention behind
those statements is to make sure that every other cases also skip these,
with "return" or "goto".

There's a comment on each of those statements, so it should be clear
enough that those are not expected to be executed. So I'd rather keep
those two statements.

But thanks.

> Coverity-IDs: 1056148, 1056149
> Fixes: 0a69ea908d ("libxl: ao: convert libxl__spawn_*")
> Fixes: 643b106b40 ("libxl: do not use tap disk backend other than for raw and vhd")
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> ---
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e03599ea99..d0271bef7e 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1890,7 +1890,6 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>          ret = ERROR_INVAL;
>          goto error_out;
>      }
> -    abort(); /* not reached */
>  
>   error_out:
>      assert(ret);
> diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
> index 4faa5fa3bd..96046803e1 100644
> --- a/tools/libs/light/libxl_device.c
> +++ b/tools/libs/light/libxl_device.c
> @@ -392,7 +392,6 @@ static int disk_try_backend(disk_try_backend_args *a,
>          return 0;
>  
>      }
> -    abort(); /* notreached */
>  
>   bad_format:
>      LOG(DEBUG, "Disk vdev=%s, backend %s unsuitable due to format %s",

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


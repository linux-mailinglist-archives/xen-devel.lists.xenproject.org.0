Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863297F36CF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 20:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638145.994491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WSJ-00068Q-1J; Tue, 21 Nov 2023 19:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638145.994491; Tue, 21 Nov 2023 19:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WSI-00065H-Uj; Tue, 21 Nov 2023 19:30:42 +0000
Received: by outflank-mailman (input) for mailman id 638145;
 Tue, 21 Nov 2023 19:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+imu=HC=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r5WSI-00064n-Ak
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 19:30:42 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 748144ba-88a4-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 20:30:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7827D20116;
 Tue, 21 Nov 2023 20:30:40 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60VFFbQzFzMD; Tue, 21 Nov 2023 20:30:40 +0100 (CET)
Received: from begin (unknown [46.231.241.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 61E1A20103;
 Tue, 21 Nov 2023 20:30:40 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r5WSF-0000000GRHO-36JS; Tue, 21 Nov 2023 20:30:39 +0100
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
X-Inumbo-ID: 748144ba-88a4-11ee-98e1-6d05b1d4d9a1
Date: Tue, 21 Nov 2023 20:30:39 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 5/5] Mini-OS: fix 9pfs response receiving
Message-ID: <20231121193039.2ewgrf6s6mvmprpj@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231121094953.22430-1-jgross@suse.com>
 <20231121094953.22430-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121094953.22430-6-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 21 nov. 2023 10:49:53 +0100, a ecrit:
> When copying a 9pfs response chunk from the ring buffer across the
> ring end, the local ring pointer and length field are not updated
> correctly. Fix that.
> 
> Fixes: 0924fec1de58 ("Mini-OS: add 9pfs transport layer")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
> V2:
> - new patch
> ---
>  9pfront.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/9pfront.c b/9pfront.c
> index 43c7409f..35c5552b 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -386,7 +386,9 @@ static void copy_bufs(unsigned char **buf1, unsigned char **buf2,
>              printk("9pfs: short copy (dropping %u bytes)\n", len - *len1);
>              len = *len1;
>          }
> -        memcpy(target, *buf1, *len1);
> +        memcpy(target, *buf1, len);
> +        *buf1 += len;
> +        *len1 -= len;
>      }
>  }
>  
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.


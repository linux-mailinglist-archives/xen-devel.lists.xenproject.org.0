Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1796F8AD059
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 17:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710016.1109096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvK1-0000Ht-O4; Mon, 22 Apr 2024 15:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710016.1109096; Mon, 22 Apr 2024 15:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvK1-0000FV-Jz; Mon, 22 Apr 2024 15:11:09 +0000
Received: by outflank-mailman (input) for mailman id 710016;
 Mon, 22 Apr 2024 15:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryvJz-0000Dq-UI
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 15:11:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a382288-00ba-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 17:11:05 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f55so30710755e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 08:11:05 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b0041a9fc2a6b5sm282992wmo.20.2024.04.22.08.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 08:11:04 -0700 (PDT)
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
X-Inumbo-ID: 8a382288-00ba-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713798665; x=1714403465; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iJyU5R7I1uk1jopWD76u6zKn/7NGqDHiiOtrW6X7dX0=;
        b=RI59Eiu0ESyo9h+6t3d66aA6tkT7wbkgQqfqyJbzQmY3ZKLD/gZrqsl/XEzhfdjcDR
         qFbX8IIpQAwRIuyKROlOiazmlYm6bK3H5OJ3JLivYGRZVeVNvTOnk6VBdnHXn5C653t3
         6Ll1zrlpE1jYMRr+ZCZPppWbGpTLD33qPQh8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713798665; x=1714403465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJyU5R7I1uk1jopWD76u6zKn/7NGqDHiiOtrW6X7dX0=;
        b=NP4EnyBQ3EyKd8u2/fZozpxtMrr1+2aAPWTHA+OS4zfEplmX93n/leN9pHlqHAciBr
         ijWCGzj9sV5dry9ExGTPbSfwtpFZdV5JTTFkEdOKNf2qzcnyGPik+4vW7N2b3Si/u19U
         /FecUHme41pGgd9LE0WyadBlilaOsiQoffOJA++tkWSrCiQDGgWcnPgeX+OefuLT6EgT
         74ki9pLCjbA1y90ghMqN07+bW6bBNDWwzpVGQYIn9VdldxN10u7wubF0v4wQc+orC/KQ
         vbBzVveIDPFgmOiNUPfO/DFx1My6MC8YHUS52sQcsomgdcJUaPnmqlLJNUrHSWRoaxZT
         rRlw==
X-Gm-Message-State: AOJu0Yxpu6ZmAsgJoRSNuDQX0ywsPCIBXhZllx3lOdcKW/WOsKygm0uy
	X0aTp2jLgSlFNodN71D5wTjnbBArI1Zq/afeYn0SViu4msfRIfGORdgJ6QvFxJ++S+WtljUOxAk
	Z
X-Google-Smtp-Source: AGHT+IFPbYQKlRM0Hq7QnH04SReEbBZ6AdTXRwqmpbsuiFntzVgJPbZhPYJ2N6kEZ7p0L6QANW3jpQ==
X-Received: by 2002:a05:600c:350b:b0:418:d4e6:30cf with SMTP id h11-20020a05600c350b00b00418d4e630cfmr7132608wmq.14.1713798665059;
        Mon, 22 Apr 2024 08:11:05 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:11:03 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 1/3] hotplug: Update block-tap
Message-ID: <42f1eaef-d804-4816-b746-ee24d860e0f7@perard>
References: <20240407204953.60442-1-jandryuk@gmail.com>
 <20240407204953.60442-2-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407204953.60442-2-jandryuk@gmail.com>

On Sun, Apr 07, 2024 at 04:49:51PM -0400, Jason Andryuk wrote:
> diff --git a/tools/hotplug/Linux/block-tap b/tools/hotplug/Linux/block-tap
> index 89247921b9..126e472786 100755
> --- a/tools/hotplug/Linux/block-tap
> +++ b/tools/hotplug/Linux/block-tap
> @@ -18,11 +18,11 @@
>  #
>  # Usage:
>  #
> -# Target should be specified using the following syntax:
> +# Disks should be specified using the following syntax:
>  #
> -# script=block-tap,vdev=xvda,target=<type>:<file>
> +# vdev=xvda,backendtype=tap,format=vhd,target=/srv/target.vhd

I still have unanswered question from the previous round:
    Is `block-tap` still going to work with the current example given in
    the script header? That is:
        "script=block-tap,vdev=xvda,target=<type>:<file>"
    Or maybe, that example is already broken?

If it's not broken, there could be users which rely on it. But maybe
it's not really broken, and the new syntax is better anyway.

My guess is that using "script=block-tap,..." might still work, but
we should say something in the CHANGELOG to encourage people to move to
the new syntax, with "backendtype=tap" to avoid issues.


In any case, the patch looks good:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


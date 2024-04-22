Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540618AD30D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 19:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710157.1109234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryx6j-0001sg-VV; Mon, 22 Apr 2024 17:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710157.1109234; Mon, 22 Apr 2024 17:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryx6j-0001q1-St; Mon, 22 Apr 2024 17:05:33 +0000
Received: by outflank-mailman (input) for mailman id 710157;
 Mon, 22 Apr 2024 17:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryx6i-0001pv-CZ
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 17:05:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86782574-00ca-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 19:05:31 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41a523e2888so8923815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 10:05:31 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u11-20020a5d434b000000b0034a2d0b9a4fsm11393939wrr.17.2024.04.22.10.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:05:30 -0700 (PDT)
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
X-Inumbo-ID: 86782574-00ca-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713805531; x=1714410331; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cOZBJO+6eyr+EyLcQ8OVE41bdCb0BivP72oJs6LkXXY=;
        b=QKi6q0nFT5TgzJTt+0vr5/SLESy37IO80eMHd2zIXXs3zdINlZh/bbubJDWSr/DDAt
         o0FujuKBsXf2g2WLP3tK79W9r7IOjVQRKXVE/rY5hls9vQjxCCQAEYAVcvuov2OAPI/n
         gnZdYZtWuHDkF6gwNIQs2RRXhtm7Utf5+SOs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805531; x=1714410331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOZBJO+6eyr+EyLcQ8OVE41bdCb0BivP72oJs6LkXXY=;
        b=kgdKuTdE0aYe4EWxeQX8Z0kUnut2prV4Kfo8fYkXjH7OUd+PaYlkfZx0eiufSKyJ4H
         LzCJpFr26QGut1mZluPhhoO3i97YNAPYLsCjCrY5YZJ1KSWUOfF9qTUOcSRfluobdvNX
         nVyDaWdet+dqSPEc4CcVNBKds/h0c/CrDePnslb7Kl4PC67GwFZvtcEJFkKajtVZWT5S
         4leij3nsfc+4eyoMZ50Qdk4Hfy5aUP+L8ZdgZDlExjgI7UkO4JiYo5U6b9d+1zoa5Iu7
         BKAOAgdPv9pG4NZsKVDsOLw9xClIN/Ydzgr5Ft8DvyvdKhZ5LC/Fv2aq0esQsOjYhLOQ
         LNqQ==
X-Gm-Message-State: AOJu0YyoiYx2IyfIWvVtW4gcifUM1faoEVb1XotXIFTo3ZuWBWTKDHIW
	Sx9b55OJtOBWoEaC90IF7gtiziuLKnQM7gxJZ0S5V5qUNMalIYhoXDB8xYCSgpA=
X-Google-Smtp-Source: AGHT+IEXw8PLxXm/UI9sqA2owx2ed3YwOczKThxZdk9ydTfTwfNEelFzivz9qnmaXcOJ7+myOXRCaw==
X-Received: by 2002:adf:e847:0:b0:346:d2c0:7675 with SMTP id d7-20020adfe847000000b00346d2c07675mr8030800wrn.29.1713805530626;
        Mon, 22 Apr 2024 10:05:30 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:05:29 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v3 3/4] tools/misc: Add xenwatchdogd.c copyright notice
Message-ID: <c1109c99-6552-440c-ba20-a51031ba3426@perard>
References: <20240411182023.56309-1-leigh@solinno.co.uk>
 <20240411182023.56309-4-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411182023.56309-4-leigh@solinno.co.uk>

On Thu, Apr 11, 2024 at 07:20:22PM +0100, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Add copyright notice and description of the program.
> 
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>
> ---
>  tools/misc/xenwatchdogd.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
> index a16d1efc13..2884ca6ca9 100644
> --- a/tools/misc/xenwatchdogd.c
> +++ b/tools/misc/xenwatchdogd.c
> @@ -1,3 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xenwatchdogd.c
> + *
> + * Watchdog based on Xen hypercall watchdog interface.
> + *
> + * Copyright 2010 Citrix Ltd
> + * Copyright 2024 Leigh Brown <leigh@solinno.co.uk>
> + *
> + */

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C665E698589
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 21:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496227.766855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSOM5-0008Eo-UA; Wed, 15 Feb 2023 20:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496227.766855; Wed, 15 Feb 2023 20:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSOM5-0008CR-RU; Wed, 15 Feb 2023 20:26:17 +0000
Received: by outflank-mailman (input) for mailman id 496227;
 Wed, 15 Feb 2023 20:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UCaW=6L=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pSOM4-0008CK-8U
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 20:26:16 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe46fbce-ad6e-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 21:26:14 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id d40so24370488eda.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 12:26:14 -0800 (PST)
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
X-Inumbo-ID: fe46fbce-ad6e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aLKQiduvbwcuWPjLhrIXf/wvw+QwAXw9ADazq8HX33Q=;
        b=Glcjv/lb9axEm8XF/JDrgZBfaUEBjp0C/9ECprCJgqcJptWBs0uYME0yCquVFLcJY1
         y/YNlntbw4x9XxejpH+WE267zIuJmrq8enyKmhTYdGqanc39kqRHDOZjs3d1aEQ+Y4mC
         cvVW3zLzGXAlBdMDbtU1hczj3+vJo3R+pQ9naNaBZQcEr42XoJlrf+Z4juFHHvbmxTW7
         3K7AejLuCfpjGyUNYTQE5LXQkMGhGgnGH+/h61iZZJQl82uJHRT8bYLudF2wj/XNp9l8
         K0CLzjd7UZoNEoIMUFAtQO5UfZHLP6bWLbgkvuapD6FPqDih9UhrPIY8FYDhsOVzA5BP
         3flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLKQiduvbwcuWPjLhrIXf/wvw+QwAXw9ADazq8HX33Q=;
        b=4VqSFIKVQsOJjmkjxFaAXWHLBwPvz5uzwmpkFiJwLFpNEHnQ8wX+mAB7XMzVWZHzyq
         +JGOpXv4ncNs6F8g6uTChblnqzeRbQeLNMFSa7k80KPb7+zjgrjUxePl0hEnuRsc6KQJ
         /3ifA7d50/Z6P4Dfkzqc0mGETEVG0a15+ATXsFNNbFPO2XlusfN+UebvTsuxz5Y2OYcs
         OEANIufcJ4Pe1TsJu/gJWVObZ2Ja8pkt9NVnFltyiV0GyUCVse2YAFwdCGWlaXUDvnpy
         /b3ne/6RbJR0hM7Q6xsBvHLjoh/JIOziJWBRcD23vonkvdqfxya0ZoGvdpG6JtfqY0eA
         qfVA==
X-Gm-Message-State: AO0yUKWUn0cJugrR8bELUfKnnhj6pcx1q4MwtI6Uf8M8TAl9ff3ubkY8
	YyAu8W8YA4w36Y40Zu/ma/3jTOxbyANsZLTjO4E=
X-Google-Smtp-Source: AK7set8bxA8S/WcUsnsUYIDri1yCOs8sT9OjcO/2wEkdp1El4esm/Qk98LVbcXM4BEnRHkn6WWCkRJPG+ThHoh82vrs=
X-Received: by 2002:a17:907:7ba3:b0:88d:ba79:4317 with SMTP id
 ne35-20020a1709077ba300b0088dba794317mr2843563ejc.7.1676492773874; Wed, 15
 Feb 2023 12:26:13 -0800 (PST)
MIME-Version: 1.0
References: <e58ac418-b044-eb26-308c-5ddaa021daa4@suse.com>
In-Reply-To: <e58ac418-b044-eb26-308c-5ddaa021daa4@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 15 Feb 2023 15:26:01 -0500
Message-ID: <CAKf6xptATdEcHPeV4=LKAM8gQtsfr9huMt0OiE5AP3f+iv2uCA@mail.gmail.com>
Subject: Re: [PATCH] libelf: relax ELF_PADDR_OFFSET && !VIRT_BASE check for PVH
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 10:09 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Both values are unconditionally overridden (to 0) in the "hvm" (i.e.
> PVH) case. There's therefore no reason to punish a PVH kernel for
> setting the former but not the latter.
>
> Fixes: 632cbaf1243e ("libelf: improve PVH elfnote parsing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason


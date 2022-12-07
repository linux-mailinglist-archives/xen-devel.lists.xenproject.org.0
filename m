Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACA6452C9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 05:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455794.713362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2lah-0002Mf-BC; Wed, 07 Dec 2022 03:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455794.713362; Wed, 07 Dec 2022 03:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2lah-0002KK-7z; Wed, 07 Dec 2022 03:59:27 +0000
Received: by outflank-mailman (input) for mailman id 455794;
 Wed, 07 Dec 2022 03:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqWv=4F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2laf-0002KE-BA
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 03:59:25 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8889b849-75e3-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 04:59:23 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so290574pjs.4
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 19:59:23 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 p2-20020a170902780200b001869394a372sm889140pll.201.2022.12.06.19.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 19:59:20 -0800 (PST)
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
X-Inumbo-ID: 8889b849-75e3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XIfsQ2d/pYC4OxWF+U4GDK/PMoG6GsV2XxfKhI2zJrQ=;
        b=NwXSi2ZByuVmBPjk8Di09voXTg+lUItpqfIKK+ItpqKaedATgHoKb65SaTK7fgrHwZ
         DEdo8wxzjdmIsCRH5mxDRnE5E424/VUAAWo6Ub8j6pXxQu2CzvBIln0UT6iVJjfawN3w
         4ZLM23zQDhQr8gYqf5m3AsdOHeMFja5Fsgo9VcHIZilAyKZSTXKxOtC8bfUJPbBbVgLL
         YQru3i42b/X2cO5zjvvClm51TtrQUJxMUp+YyKQ6HGOtjAc0+vZFR3J9bPNXN5VVKzq4
         F/6DeT7zWHjhv2u18GiLkEgniFCWwbTBJ57XWAm5lD7Q+GuskxEJ2NeHqjQNyucrV4MX
         MGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIfsQ2d/pYC4OxWF+U4GDK/PMoG6GsV2XxfKhI2zJrQ=;
        b=0YdtLOLqYCG0ntSHQfXBat0o0g0pibI/5iyp2Jv3PTfXySrkGGMW9Uk2ol3GJgupHu
         P2dUPaPSUFL/wviGFsXC3DPnFAt5YzGY/X2e7R9X1ZWmzMvhHgDtHaK/SlFlYIB+VknQ
         S+Akm0/TcIMsoBTcr8KOoqnTlX12QQWPiPU14tnq2buvG9RhBtEDJrfXL3I2M/YC6m32
         db+L59/p4ilRgmpixDn64JoNMr7xDEkFTc6NFoA40fftljnjqZff/suol7l/Il0EjJ2U
         uDCgySMucqX5hV8qAMv6Zi4HYkjuefkqOFnVb+8Gnxlddw9d30xw7EGd1J4t6li0z+fD
         zw1Q==
X-Gm-Message-State: ANoB5pnFnCQhiEcc6PUETVFGrMn61tsGFc8D66opeWu1vXOzGVGjbN2C
	tGqXU9RszRx/yG1lMLgxEfFxTQ==
X-Google-Smtp-Source: AA0mqf5LNiq5+bs1di8KQT+ywimFSN2JAu4sY++dnlji4UcP76zi1ZQkngNyw/vbC8S8nZvhn+eSDA==
X-Received: by 2002:a17:902:b20f:b0:189:a50d:2a33 with SMTP id t15-20020a170902b20f00b00189a50d2a33mr35473221plr.17.1670385561974;
        Tue, 06 Dec 2022 19:59:21 -0800 (PST)
Date: Wed, 7 Dec 2022 09:29:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org
Subject: Re: Virtio-disk updates for latest Xen ?
Message-ID: <20221207035918.amzgrybqub632dyc@vireshk-i7>
References: <CAKohpo=u7qp4URjRRAMM4xEytmZoKZAJOZLw4v0HTk13BrK-fw@mail.gmail.com>
 <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>
 <20221207002138.qulrlav3z3heozk4@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207002138.qulrlav3z3heozk4@vireshk-i7>

On 07-12-22, 05:51, Viresh Kumar wrote:
> I am not sure how to get this working, as there is no finalizing event
> for the directory. Maybe our design is broken from the start and we
> need to do it properly in some recommended way ?

For now this is what I have done to make it work:

diff --git a/xs_dev.c b/xs_dev.c
index a6c8403cfe84..4643394a52a2 100755
--- a/xs_dev.c
+++ b/xs_dev.c
@@ -413,20 +413,7 @@ static int xenstore_get_fe_domid(struct xs_dev *dev)
 
 static int xenstore_poll_be_watch(struct xs_dev *dev)
 {
-    unsigned int num;
-    char **vec;
-    int rc = 0;
-
-    vec = xs_read_watch(dev->xsh, &num);
-    if (!vec)
-        return -1;
-
-    if (!strcmp(vec[XS_WATCH_PATH], dev->path))
-        rc = xenstore_get_fe_domid(dev);
-
-    free(vec);
-
-    return rc;
+    return xenstore_get_fe_domid(dev);
 }

This rns xenstore_get_fe_domid() for each event in the path
"backend/virtio", and in my case it passes with the second event
itself, which came for "backend/virtio/1/0" and this code doesn't run
after that.

Note that I have tested this with my rust counterpart which received a
similar change, I didn't test virtio-disk directly.

-- 
viresh


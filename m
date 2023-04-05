Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE026D775A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518332.804750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyrV-0002UR-Cr; Wed, 05 Apr 2023 08:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518332.804750; Wed, 05 Apr 2023 08:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyrV-0002SV-9r; Wed, 05 Apr 2023 08:51:25 +0000
Received: by outflank-mailman (input) for mailman id 518332;
 Wed, 05 Apr 2023 08:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=enMU=74=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pjyrU-0002SN-5a
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 08:51:24 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08f1d51e-d38f-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:51:21 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id z19so33810165plo.2
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 01:51:21 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 134-20020a63028c000000b0051303d3e3c5sm9018640pgc.42.2023.04.05.01.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:51:18 -0700 (PDT)
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
X-Inumbo-ID: 08f1d51e-d38f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680684679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uTmWh7bgIaShLbjOtPbFopk4h+aCHK0BPMfF7xCsMCU=;
        b=UFReNiOFbZlGWg/34mbH/fROY4+46+yziPEOG/bjniycIzr4dqS8890aZ0MBq0Jor6
         WMIbpW9Z5UvgEEaeKa7nIMnk1id3yjjjk2WipvqX8Asc/XhFswF37HWylXnC/ytFSnWU
         1q9TB0mpl2DiYzIfnkvei/4SZsW4cN6AZBPxzcC0QN3UAxMLYF0nJ+UaDGxuaGKpVmEH
         sumYbxnKAKn2PLt65MN8+REC9QiX/QRbQWaQblDIUJHThY5+f1dzYWwSVMZl6gVtg64n
         sqYOAfw4EzJ9OsPMqfpV6O6dJ03pf6Y4GofSklzYHtrmjDLp8RwpELoNr/+A41W0WOW0
         RxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680684679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTmWh7bgIaShLbjOtPbFopk4h+aCHK0BPMfF7xCsMCU=;
        b=zbUQ7Onk+qNIV2LasL+0z3VVDuQYZMisCEYUs9ti4diYdqITLzq2M43a+e7QactgD5
         Liaje9rKAeWZNbp91xUzliio8U8E+IAgcT8m9oFTFlMiuKQh/8/NJFUZCCyp9AhAZ2wy
         gBgGpaobWDPv2PhlPzsmEKL2RmSilVVlf29sHkWTF7lr16FdD73nj/aS0qDjpXgeT7Mq
         vvCf8nCLzet5yKLqQE++1sdelJDVWOuTgWJn5koS6mUp+xa001DKfa5l10qhejNOpbU2
         Z3l3bzScT53Oo9w7WzHQuCJJGgFATWpWPl7Pt9u2miXGK9+gYQgYNP+8fDprhBGekt94
         pMAw==
X-Gm-Message-State: AAQBX9c9qVdfoQ6LedI+DjmSYMEB4u9MvWb7GVNm3QksYb9gRs9OAYyD
	8FpSAvdHCCK08HSaLaW9bPN9+A==
X-Google-Smtp-Source: AKy350YTW5NK2cxTa4fIkmHliiCG4XUoXoaRsrI6R75HvHS3tlR9YNZmWTYfStMuoue/vx4QD12w/w==
X-Received: by 2002:a05:6a20:38a5:b0:d9:55b0:c0e8 with SMTP id n37-20020a056a2038a500b000d955b0c0e8mr4234722pzf.39.1680684679529;
        Wed, 05 Apr 2023 01:51:19 -0700 (PDT)
Date: Wed, 5 Apr 2023 14:21:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Juergen Gross <jgross@suse.com>, stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xen.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH V2 1/2] docs: Allow generic virtio device types to
 contain device-id
Message-ID: <20230405085115.dayqa6mrkac372sb@vireshk-i7>
References: <c5d2ab978255ca84197c980cbfb9a504e7c625f8.1680653504.git.viresh.kumar@linaro.org>
 <37fa3d37-5ee7-863c-48cd-1ce313c8e296@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37fa3d37-5ee7-863c-48cd-1ce313c8e296@gmail.com>

On 05-04-23, 11:36, Oleksandr Tyshchenko wrote:
> Also a NIT, is this example "like "virtio,device26" for file system device"
> precise?

No :(

I will send the patch again later, this is how it looks now. I have
also updated the documentation to contain the hexadecimal format for
N.

Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Wed Apr 5 05:36:19 2023 +0530

    docs: Allow generic virtio device types to contain device-id

    For generic virtio devices, where we don't need to add compatible or
    other special DT properties, the type field is set to "virtio,device".

    But this misses the case where the user sets the type with a valid
    virtio device id as well, like "virtio,device1a" for file system device.
    The complete list of virtio device ids is mentioned here:

    https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html#x1-2160005

    Update documentation to support that as well.

    Fixes: dd54ea500be8 ("docs: add documentation for generic virtio devices")
    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
    Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 docs/man/xl.cfg.5.pod.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10f37990be57..938aea22c798 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1608,8 +1608,10 @@ example, "type=virtio,device22" for the I2C device, whose device-tree binding is

 L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>

-For generic virtio devices, where we don't need to set special or compatible
-properties in the Device Tree, the type field must be set to "virtio,device".
+For other generic virtio devices, where we don't need to set special or
+compatible properties in the Device Tree, the type field must be set to
+"virtio,device" or "virtio,device<N>", where "N" is the virtio device id in
+hexadecimal format.

 =item B<transport=STRING>

-- 
viresh


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D085679E502
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 12:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601187.937127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNCn-0003ma-DL; Wed, 13 Sep 2023 10:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601187.937127; Wed, 13 Sep 2023 10:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNCn-0003jN-A4; Wed, 13 Sep 2023 10:34:45 +0000
Received: by outflank-mailman (input) for mailman id 601187;
 Wed, 13 Sep 2023 10:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3wF=E5=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qgNCl-0003jF-Il
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 10:34:43 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25bd89d3-5221-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 12:34:42 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-268bc714ce0so608814a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 03:34:42 -0700 (PDT)
Received: from [157.82.204.253] ([157.82.204.253])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a63be05000000b00528513c6bbcsm7566372pgf.28.2023.09.13.03.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 03:34:40 -0700 (PDT)
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
X-Inumbo-ID: 25bd89d3-5221-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694601281; x=1695206081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gsX13CnQ+RiKdonhmGaJWnagAUBmE64zMiE8InJYMY=;
        b=tkaD7elSKRyINY4f2b0Hru7QZw+vTnh/HZDZXshDOPM/7peF/TIChQygB/F3aKERZC
         3amYrpnZq0RvWyOlEnbG7QzdtWoliW7R7dKzwNg/o4e5iDoMhnF9QBocKmBojCe5hMwi
         keQ/jI1+e70EnfQm5p+lT+FDuWvPjI1MY3/45QFnCWKjuRAeW2ZVwe2kxBoK0eVEmcc7
         PWAVrj7d3/VVqOnB9fcxXDj031OUfMYIU1RFektYmAmZteJMJJUrhN4hmw+KN5SuPMxi
         er+n0Uv0zcX6QlMYTX0bjrtvPK/mXSz8FMZtjA9uXFHaAPLnPXNds971Z4TVPPI0Pivn
         Mjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694601281; x=1695206081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gsX13CnQ+RiKdonhmGaJWnagAUBmE64zMiE8InJYMY=;
        b=raIoMNFWIQU5dUcW/N6FVznZg+W5itgRTtaUfMrngqLiXhzrSDdWHOg19Jf/GZDu9r
         VI75iFqDUpm5dHNBSP+EqxIaEYLEiRxRs+pUcC+LMePp1sVR7tQbOhblZSdwF5nHtMJ0
         S8CYkKe9m5cjm1KLbCxDpfVElILtrSxKK30jliL6Nk9EWVOZqL4n6/O5T+Fyq3P9cbFF
         iTg8LniTn4UKSIlgxGIxSqJg2Ju7D5jbpnP7ibrqyOqkE+DoljwqVmKsy4YckPVcCBKe
         6YMLkvJn2rM0UGi4g318fN7N9RPqJLe8X3qj65VhI3vpeMkgZN2NVb0vrpEk2rX9rl9t
         yNgg==
X-Gm-Message-State: AOJu0YzE4LlAt4Ujlg/0lIBHB0L2jvLlmFh9PAu8URwXRe/l0UfESWjL
	6U0YSQJW5XB1gMJe6dyjC3Wlog==
X-Google-Smtp-Source: AGHT+IHTPT0tjzcnAJSUL9nT+wX3MjCaTXTLpkly5af71VyfGqmKrnsGwP6chzxn+R6v3usXUofQAw==
X-Received: by 2002:a17:90a:4101:b0:26d:3e6a:cd93 with SMTP id u1-20020a17090a410100b0026d3e6acd93mr7104225pjf.17.1694601280912;
        Wed, 13 Sep 2023 03:34:40 -0700 (PDT)
Message-ID: <cf99ac00-6f48-4778-b319-6079a931ba5d@daynix.com>
Date: Wed, 13 Sep 2023 19:34:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 10/13] virtio-gpu: Resource UUID
To: Albert Esteve <aesteve@redhat.com>
Cc: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com>
 <11c227e8-a464-41ce-a435-82c570746388@daynix.com>
 <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CADSE00Kc1Jza7sbERRndWbXgoF1s2V-FNxEOWJ6WgvomzgvMPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/13 16:55, Albert Esteve wrote:
> Hi Antonio,
> 
> If I'm not mistaken, this patch is related with: 
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html 
> <https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01853.html>
> IMHO, ideally, virtio-gpu and vhost-user-gpu both, would use the 
> infrastructure from the patch I linked to store the
> virtio objects, so that they can be later shared with other devices.

I don't think such sharing is possible because the resources are 
identified by IDs that are local to the device. That also complicates 
migration.

Regards,
Akihiko Odaki


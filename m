Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294B64D5D3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 05:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463032.721134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5fl7-0000WZ-9U; Thu, 15 Dec 2022 04:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463032.721134; Thu, 15 Dec 2022 04:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5fl7-0000Tj-50; Thu, 15 Dec 2022 04:22:13 +0000
Received: by outflank-mailman (input) for mailman id 463032;
 Thu, 15 Dec 2022 04:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lTo=4N=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5fl5-0000Td-Mf
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 04:22:11 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a0fd971-7c30-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 05:22:09 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id n4so1935753plp.1
 for <xen-devel@lists.xen.org>; Wed, 14 Dec 2022 20:22:09 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 i31-20020a63221f000000b004792ff8ab61sm563959pgi.80.2022.12.14.20.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 20:22:07 -0800 (PST)
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
X-Inumbo-ID: 0a0fd971-7c30-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QrqU72PGZgGOXQe0f/sy6mdR2E3gLTJqWCYdUGHEf9E=;
        b=TaoSGEEe5G5+ojji/LPo5kfxZVzYkStkNATwfAgeNz6VPVnOpZ4CVMueqW7fP+PIxg
         AgmZxXjAD7YGgDo2q0YsQDQ26az1tBiQgL5B2gTejeE/Ooi0ZXiaj81v5n2i333PTqRT
         XnAJH4j7SszcNrcla5ESQVu7ptbEsLlcjkJmQne1+QrxIxiRIASW6SdVajnv0fI1UDjx
         9xOrIzCqZLm1/csFWd5apHh080Bece5RrMWxhNSDFwCMynMH84wxUsgWRVh9ej4C0qGF
         xvVAcNIiyYUmIRUvH/6RHr8OHcPc1X/DaOX5coomE7//lPdYzyPxTqIr/O6ZrL35ZRPR
         PoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrqU72PGZgGOXQe0f/sy6mdR2E3gLTJqWCYdUGHEf9E=;
        b=hXSwbibkGx9SN33gF0e1qmNpskZfFnEKNfmJpiKJStJeXKO+QJHWboQbdxDtsR4PIz
         d//L9q0Cz6Mb20Uc/l2VsuKnloh4hDDE5ghAlCwzH4IHLgOUhZ+pTQ3jsSHaTE0jdd1T
         VKg4JYtwCM3Hj9ViLk7Fc2lg+Zo6f6+DCTqQe6VzsbYERRJQbcakS4f5hyCqouy2aRog
         LHrVZpQGE+Yms4F4BSUdjyUFTQjVus1H0qLxUq6dsL7F0MxneOq8p4V8SlQ0poeGQ2TB
         iOCEYPhjb7ahJ/twHWyPFjS+XXFdMet05SH/lYw7RK8rE1z/UV728OHxk0Ha81LWuQrz
         7uLQ==
X-Gm-Message-State: ANoB5pl+w65ghmJ0Q8xBS99Dpd5kzF4gvXutiZ+uEichXuzM/Hpd7ssG
	nlvlkDr4rOfbpxJo7ax9Mts5Ug==
X-Google-Smtp-Source: AA0mqf5uf5J2Bn83yiphpjZ+4LrnnWTImqjaEMsHjZ1PxSLQAy51LsYTYfWflPDrpgNWE53R9e50uQ==
X-Received: by 2002:a05:6a20:54a5:b0:aa:3e5f:88ab with SMTP id i37-20020a056a2054a500b000aa3e5f88abmr37822235pzk.54.1671078128170;
        Wed, 14 Dec 2022 20:22:08 -0800 (PST)
Date: Thu, 15 Dec 2022 09:52:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org
Subject: Re: Virtio-disk updates for latest Xen ?
Message-ID: <20221215042205.y5565f7rv6asmsw5@vireshk-i7>
References: <CAKohpo=u7qp4URjRRAMM4xEytmZoKZAJOZLw4v0HTk13BrK-fw@mail.gmail.com>
 <CAPD2p-kfhaygmNNutUdk-mApR7z1YDSTYCEhtLgLsXi+-wbv8A@mail.gmail.com>
 <20221207002138.qulrlav3z3heozk4@vireshk-i7>
 <20221207035918.amzgrybqub632dyc@vireshk-i7>
 <f4ba541c-d089-28af-c80b-dcb0fa87a9d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4ba541c-d089-28af-c80b-dcb0fa87a9d7@gmail.com>

On 14-12-22, 17:01, Oleksandr Tyshchenko wrote:
> Today I had a chance to check virtio-disk on my H/W using new Xen branch
> which does include Juergen's series with commit 3a96013a3e17
> ("tools/xenstore: reduce number of watch events").
> 
> Very interesting, but I didn't manage to reproduce an issue the similar to
> what you had already faced with the rust counterparts before (caused by the
> lack of Xenstore watches?). Note that I didn't debug what exactly events I
> had got during guest creation/destruction, I just made sure that backend
> worked as before. I checked that by running the backend in Dom0 and DomD and
> performed a couple of guest power cycles (reboot, destroy/create).
> 
> If you could provide the debug patch which you seem to use to print incoming
> events which you described in previous email, I think I would be able to
> re-check the situation at my side more deeper.

This should be enough to see the new changes I believe.

diff --git a/xs_dev.c b/xs_dev.c
index a6c8403cfe84..8525c6512299 100755
--- a/xs_dev.c
+++ b/xs_dev.c
@@ -421,6 +421,8 @@ static int xenstore_poll_be_watch(struct xs_dev *dev)
     if (!vec)
         return -1;
 
+    printf("%s: %s\n", vec[XS_WATCH_PATH], dev->path);
+
     if (!strcmp(vec[XS_WATCH_PATH], dev->path))
         rc = xenstore_get_fe_domid(dev);

-- 
viresh


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67269DD72
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 10:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498703.769586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPMy-0006OI-5I; Tue, 21 Feb 2023 09:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498703.769586; Tue, 21 Feb 2023 09:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPMy-0006Kv-2P; Tue, 21 Feb 2023 09:55:32 +0000
Received: by outflank-mailman (input) for mailman id 498703;
 Tue, 21 Feb 2023 09:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES0Q=6R=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pUPMw-0006Kp-UY
 for xen-devel@lists.xen.org; Tue, 21 Feb 2023 09:55:31 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df12bfdc-b1cd-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 10:55:30 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id fb30so1975621pfb.13
 for <xen-devel@lists.xen.org>; Tue, 21 Feb 2023 01:55:29 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 k2-20020aa78202000000b005ceb048cfb8sm934520pfi.73.2023.02.21.01.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:55:27 -0800 (PST)
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
X-Inumbo-ID: df12bfdc-b1cd-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FbN7Vg+7W6EgBT1eXd4AMAQsGFDlaH/uiamyNunM1dk=;
        b=AL9LWHYNvJcon5st9kK94O+cD85JePQmSo9uWkb2kCOF1O5QQhgU6oOm2L0+K6PByv
         agHELSdTi7Qds8Rmd5dPjRJGAlSnWlYwZgjhrU7oljt0G5y1S0x8PhOf7ikgPv8RIltT
         T/D+K7FsC1JB2vM0+YXUgib2YgO01189WWkhJ1bbZg+dvyj8OWz5gExJTAFLOq7d9Lxg
         078nv+J/KOqxMcKlmJD1GKSk5YZft4WAGX271yqd/gnt2zg38KtJP/HQ6uEySxHcSb+e
         sxAUyyaS3gqT2o+jbKJuzV1DQq4kVYpYYXnHb0phoYQnJV/UsHlJwcYYlKHMcJnqnDID
         kILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbN7Vg+7W6EgBT1eXd4AMAQsGFDlaH/uiamyNunM1dk=;
        b=CFfZflSTwIjoGGinNPmuPu1Ww/L/bh+aU3UI+wAa5FgY/8OR8zhua/HKCe9Z+LWywp
         9WTjY1zOqt69rZQcMh6PfkWXlGzl/r9aJZGa23owWDNO3IaMWIHpQn06HL7hMIPgPbfM
         m3luUzYoKRdWH7ti/5iB8sSIUwwTWGe01Ma8FTUj3Kcam6BV07nLH7RlA+ybXopUa9jL
         eE0pxg8mWEfdnEEE3PvE0ydCK0q8UxAAPt6v86XQRmVqBJa+7my8aphuzQo6fvltuDWW
         JsFCbN2g4OTKCwcZA6fUmh+fFTZuLxrg4scoRRxof4vpWzoo1YD3A56c4g+gFphweEVn
         gXkg==
X-Gm-Message-State: AO0yUKUSB0lKzRSL1wDbBOllc1b2Yc4DTIjw/9dj2SXH7wHiC33Quw8k
	LRyFGlag+WTcH/yy8yjt7WRNyw==
X-Google-Smtp-Source: AK7set/Te35KUHmo8g3DhdaslU3UfjWgXRygNvBZcfY83tXFrb+j6VN9K8IqISE80+tm9xCOWe+63g==
X-Received: by 2002:aa7:9537:0:b0:5a8:b958:e348 with SMTP id c23-20020aa79537000000b005a8b958e348mr3978595pfp.28.1676973328156;
        Tue, 21 Feb 2023 01:55:28 -0800 (PST)
Date: Tue, 21 Feb 2023 15:25:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	xen-devel@lists.xen.org
Subject: Re: [Discussion] Xen grants and access permissions
Message-ID: <20230221095525.7ty4ctgrpo2ceulb@vireshk-i7>
References: <20230216111325.tprjr7rdr52iqvmm@vireshk-i7>
 <5d945b2d-048a-fc66-023c-377f494b477b@citrix.com>
 <CAPD2p-mAOtfSRUgTOwu88umLfhjFugL4_WEBNJ7EJG90gPng4A@mail.gmail.com>
 <af173093-658c-1206-63c8-03825d66920e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af173093-658c-1206-63c8-03825d66920e@suse.com>

On 20-02-23, 07:13, Juergen Gross wrote:
> There are no permission flags in Xen PV device protocols either. The kind of a
> mapping (RO or RW) in the backend is selected via the I/O operation: in case it
> is a write type operation (guest writing data to a device), the related grants
> are mapper as RO in the backend, in all other cases they are mapped as RW.
> 
> The same applies to granted pages for virtio: the frontend side will grant the
> page as RO in case the I/O operation is flagged as "DMA_TO_DEVICE", and as RW
> in all other cases. The backend should always know, which direction the data is
> flowing, so it should be able to do the mapping with the correct access mode.

Right, so the back-end actually knows the permission details, but it
is getting lost while we do some vhost-user operations.

Anyway, I have taken this in a different direction now and suggested a
change to vhost-user protocol itself. That lets the back-end know that
it is actually running on Xen and then it can do the mapping itself
instead of asking the front-end, which doesn't make us loose the
permission details.

This also lets us write the backends in hypervisor agnostic way,
hypervisor specific stuff is handled in vhost-user protocol's
implementation now.

https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05946.html


-- 
viresh


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E498792A2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 12:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691768.1078089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzsq-00072C-TD; Tue, 12 Mar 2024 11:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691768.1078089; Tue, 12 Mar 2024 11:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzsq-0006zv-QW; Tue, 12 Mar 2024 11:01:24 +0000
Received: by outflank-mailman (input) for mailman id 691768;
 Tue, 12 Mar 2024 11:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiV3=KS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rjzsp-0006zp-Jn
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 11:01:23 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc157419-e05f-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 12:01:22 +0100 (CET)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6e52b9234c0so918192a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 04:01:22 -0700 (PDT)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 x6-20020a05620a098600b0078835bfddb8sm3562169qkx.84.2024.03.12.04.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 04:01:20 -0700 (PDT)
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
X-Inumbo-ID: dc157419-e05f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710241281; x=1710846081; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CkuD7/VKzR/42WmV9g0w5MfXQqoF0FZt+XVoxJxKCaQ=;
        b=BsK7Fn1JPYf0/zvjVDYk4Wz0CfGZewg5gkGR6j1yHRXA9m4nnYr1bH+qhtJLhQOpdD
         vsnVAVEcg4QeMXCtfkvQHql4hjPobsQtAE5/32Xc7QyggI9DLjv7jdiyyaiK6S3gceiL
         3zPb0JzXLohWGGrXjD++tS+v/LH4w7L45uEnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710241281; x=1710846081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkuD7/VKzR/42WmV9g0w5MfXQqoF0FZt+XVoxJxKCaQ=;
        b=f08vMHy8jg92x5lkDwu0T7lidJZfMw5oSVljz5jOsCNIBbIODo21pjpQYRBXOHzegA
         o9p9BGtLaU79+5LrA4+1wAfq/4I8/m9O/2ouUVL29GrcebUEhfq4b1CMohErZYL3pD+9
         Q1YPcMUcu+b0Zib5r8xgF6aBwpL/DoWZm/fZnhIxN7FoedIX4LL1Zru29wdLKWHko6y2
         4BmWqQYvEvP04oSk4w6ZpxTek1iPoPvbcaRPZ40H5cuVvvK+u6+EpqEz3PPBV5EHA4Fu
         YovXPUhhhVMuDgF+LFztJ+cim7YbQjtSKZz1qrFZ8Fg2emXt/mDKmK5zGz51TQ7rK7Yg
         NOEA==
X-Gm-Message-State: AOJu0YwZ9vAyqyEgDYI7iyAUhZBuzQPR2KuOZKeAkuoGANs70TuWRPIk
	/Z9Gy58cEf3L1PigRZM1LptJOzlW91uLRzS/vXkS/Owfk3w4zI1I7ZNQuUXU1HM=
X-Google-Smtp-Source: AGHT+IHIVXpe5ZL0iQ5eq6zRiXO5qWk23xUawDTCs0iz1TSxjCtPDoDIDApJMAPnfVigz8stb9hlyA==
X-Received: by 2002:a9d:7a92:0:b0:6e5:307b:fa70 with SMTP id l18-20020a9d7a92000000b006e5307bfa70mr5505560otn.29.1710241280790;
        Tue, 12 Mar 2024 04:01:20 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:01:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] x86/IOMMU: address violations of MISRA C:2012
 Rule 14.4
Message-ID: <ZfA1_pYQi-aKXH3A@macbook>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
 <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com>

On Wed, Dec 13, 2023 at 05:10:50PM +0100, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean type".
> 
> Add comparisons to avoid using enum constants as controlling expressions
> to comply with Rule 14.4.

If we really want to go this route, we also need to amend the comment
in iommu_intremap definition, as it's no longer valid:

extern enum __packed iommu_intremap {
   /*
    * In order to allow traditional boolean uses of the iommu_intremap
    * variable, the "off" value has to come first (yielding a value of zero).
    */
   iommu_intremap_off,

We no longer allow traditional boolean uses of iommu_intremap.

Thanks, Roger.


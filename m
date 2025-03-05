Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEFA50296
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902379.1310344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq2l-0002xQ-Ol; Wed, 05 Mar 2025 14:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902379.1310344; Wed, 05 Mar 2025 14:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpq2l-0002uY-Kd; Wed, 05 Mar 2025 14:48:19 +0000
Received: by outflank-mailman (input) for mailman id 902379;
 Wed, 05 Mar 2025 14:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCKF=VY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpq2k-0002u0-P1
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:48:18 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df442c2e-f9d0-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 15:48:16 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e52c1c3599so6033072a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:48:16 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e4c3b4aa46sm9671890a12.1.2025.03.05.06.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 06:48:15 -0800 (PST)
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
X-Inumbo-ID: df442c2e-f9d0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741186096; x=1741790896; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BxWOKUn6OG1pyodGJX/u8N6ZDpBqNTF1xQQFBweoPHY=;
        b=AWE7uV4OVzXR6y2YpN3NQOfyF+vzMmR2V94qTI8XP2bwQ5e9IqiMRP7q9yuy0Ykrxg
         p/HwRCKOTBfWgOt/DOS7wHtK6KaPNyV6x2yFeGCfYnACMmC5emFlZJmNlatH45Eyzhim
         y3kNhGW4Kv09B9KoiqeFJThuJY+QpqIQPlBEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186096; x=1741790896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxWOKUn6OG1pyodGJX/u8N6ZDpBqNTF1xQQFBweoPHY=;
        b=bc5o86ySIE2lqd38m4s3Fh77Cp4RbiIc3uGX3R1jvrVEd/7kqYVnP1WDRFfcQo3ZGY
         iL53qFGN10AYJDgmUVlH8kSjJckxUxQZWka3EUwhCZ9LYmiLnnlXx/IEFuqhgOSOBdGZ
         B8hrWd3c5UReghS9S00BtuC8Sxm9/146dMWnA96EgtOWKNXa/2qslpi7EaW+Hg4METOI
         9EUB1Hiz6buXAnqRQxRFGDoojbCoA5gd+cOXQbxccY3OzOk8PdbH5LvvBrlzB14qwWw5
         SvwMMdaDOjTRCP8lU8686anxLxqEJ3GECJNi2SG2aH9e+KRecbL6CGtcv8qKClKQmDsg
         GVDw==
X-Gm-Message-State: AOJu0Yyt9RO4Rzw3OddMZhY56boSGBpggCt9UbG5wA0uXiQu8vsHSPb9
	sMRr2xv0UXOH/axCGuRswlzPYZGHXVD1K8Xbd5ll5osPN91rHWEbhls2TCGI9N4=
X-Gm-Gg: ASbGncsf0erXoz+q5GZREGtvhABtfL/YVlNwR5MXjzCZGEpQvM6KhZtF6YHsbv3z8/n
	0wHpZma8A4F3iIhm3e6qdIqR/O10ZQLUjhpyNBhOs0uf/xPywM6Lw9HfWC7aGREsTZWXoEw7jXK
	eMJSKrq9CUfVt6pmRglL+RwaFydLgBGcvBVykLSLmPUWFRloPsOW5Ccl4KBQEfOf5PBNw8ETopv
	eFVr2zUhg1IUQLyuMHi6cJpkzsGQkMD4Odlypo/2kgAzIwWGJYOCao2WbI7IyzrQ9v1WHIUHFcT
	73VXwIXb22Ec14lN/HMgAJr4o9GonBp4NOBKi3Py9OolNVjvoQ==
X-Google-Smtp-Source: AGHT+IEAM5Jcr6RsbgrnJVwgheVsvSbIOMgaEfnRGx7UyxIrBHw6icQTnJQtR2Ybqnaw/rzCy9Vhlg==
X-Received: by 2002:a05:6402:510d:b0:5dc:7643:4f3d with SMTP id 4fb4d7f45d1cf-5e59f36d02emr3198640a12.1.1741186096144;
        Wed, 05 Mar 2025 06:48:16 -0800 (PST)
Date: Wed, 5 Mar 2025 15:48:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <Z8hkLjMAQfhBR2Cm@macbook.local>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>

On Tue, Feb 25, 2025 at 12:37:00PM +0100, Jan Beulich wrote:
> __init{const,data}_cf_clobber can have an effect only for pointers
> actually populated in the respective tables. While not the case for SVM
> right now, VMX installs a number of pointers only under certain
> conditions. Hence the respective functions would have their ENDBR purged
> only when those conditions are met. Invoke "pruning" functions after
> having copied the respective tables, for them to install any "missing"
> pointers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

However I find this filling slightly ugly, and prone to be forgotten
when further hooks are added.

Would it make sense to delay enabling of IBT until after alternatives
have been applied, and thus simply not use the cf_clobber attribute on
functions that are patched to not be indirectly called?

We could still enable IBT before starting the APs.

Thanks, Roger.


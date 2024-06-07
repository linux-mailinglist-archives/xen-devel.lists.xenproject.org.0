Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB396900482
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 15:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736543.1142641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFZXJ-0001Or-Mb; Fri, 07 Jun 2024 13:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736543.1142641; Fri, 07 Jun 2024 13:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFZXJ-0001NG-JJ; Fri, 07 Jun 2024 13:21:41 +0000
Received: by outflank-mailman (input) for mailman id 736543;
 Fri, 07 Jun 2024 13:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKbl=NJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sFZXI-0001NA-8B
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 13:21:40 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df239a99-24d0-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 15:21:39 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42163fa630aso10637925e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 06:21:39 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c19e719sm53730915e9.3.2024.06.07.06.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:21:37 -0700 (PDT)
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
X-Inumbo-ID: df239a99-24d0-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717766498; x=1718371298; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cdt4iwBEHchdqlJtYkU1ouTy8CVAw8S3ea4y8s3IURA=;
        b=JzazxFXjKaMvw1V1TsG9mXiEl+9zi8pjOLAOJoNI1Gv+mlJsWjwjjl4plOZUHGurjN
         2bl2wQIVnKZZwAhAuu3ovNNjJ2g4nIkPi6pwUQ1cjsUBW/6JspFs3EMAHuUbJ+XBnPKh
         6q56WqlP7yoxH9WN+F+6TIDMaia5fTKrTAZVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717766498; x=1718371298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cdt4iwBEHchdqlJtYkU1ouTy8CVAw8S3ea4y8s3IURA=;
        b=HbaRl1kR7ZYOyyLoSUi/QFSv/whwHWeypupwgEuhfzjth5FnDG4YKg3qc9aZflnkx/
         4kYhv7RSPsl9g0q7097/3Jgix1EKSihocpEW3jmFu/REphr1IRufjVAc6nNtWw6MYw3V
         7bbKaUPD79yiUaCccHjcIHhW7XX64MXqUlsoFqOUoepPLstpWFIY6+qUaro4R8COnYUG
         Yjt+ksSKVvyzHRzeFUmO/KM3dy+7dbmXArRmc9ve/N+hxbqV4TzDMT+hmtPZA7SucmQo
         U1XPFosW4FJhqOsb0GM11j9a6omuQU2jdUDqGZDjZ1B6LFCMX1tIm4O5V5AGDJAyOe9L
         cf3w==
X-Gm-Message-State: AOJu0Ywbo/+L6612UsoRZsP+2EABftQZaHltjeVrfRbFFZqo+IrtTP3o
	Xy64toAdjrfQK545ZlSWo6lUMTbOe0enWNruQfsNcZVxU1Um/G6743+KeBkc6N0qHwpSfwAIIvq
	jvBY=
X-Google-Smtp-Source: AGHT+IGx/oYqPNx6QbddJP2SeSr+K7cPQUspVWa6dIrqoJ2X0/u/2YxRxxGJr9ssMPXV231yStca2A==
X-Received: by 2002:a05:600c:4ec7:b0:421:73e6:faee with SMTP id 5b1f17b1804b1-42173e6ff15mr8170035e9.34.1717766497993;
        Fri, 07 Jun 2024 06:21:37 -0700 (PDT)
Date: Fri, 7 Jun 2024 15:21:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.19] x86/pvh: declare PVH dom0 supported with caveats
Message-ID: <ZmMJYLhXVmLRKyz_@macbook>
References: <20240607100320.11723-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240607100320.11723-1-roger.pau@citrix.com>

On Fri, Jun 07, 2024 at 12:03:20PM +0200, Roger Pau Monne wrote:
> PVH dom0 is functionally very similar to PVH domU except for the domain
> builder and the added set of hypercalls available to it.
> 
> The main concern with declaring it "Supported" is the lack of some features
> when compared to classic PV dom0, hence switch it's status to supported with
> caveats.  List the known missing features, there might be more features missing
> or not working as expected apart from the ones listed.
> 
> Note there's some (limited) PVH dom0 testing on both osstest and gitlab.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Hopefully this will attract more testing an resources to PVH dom0 in order to
> try to finish the missing features.
> ---
>  CHANGELOG.md |  1 +
>  SUPPORT.md   | 15 ++++++++++++++-

Bah, forgot to remove the boot warning message, will send v2.

Sorry, Roger.


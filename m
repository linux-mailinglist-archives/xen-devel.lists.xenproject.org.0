Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5D2775A8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 17:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLTPo-0003nN-Ph; Thu, 24 Sep 2020 15:44:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLTPn-0003nI-D4
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 15:44:11 +0000
X-Inumbo-ID: 732221d9-2355-4da2-9aea-81da88b858f1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 732221d9-2355-4da2-9aea-81da88b858f1;
 Thu, 24 Sep 2020 15:44:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600962249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fdjik8ixJWtmHhu7NVfJnvunR9mjSMJxtMrfBFb5OLo=;
 b=CX6osIlRNx5vhYg49BsBojusUYjxHF+3rF5dTKFv1/Kje+GcU0C0F2WCgw3vJVhhj51Yv7
 J7/3NWM7g6QcC+s1pLa3L5ZrLztfB2KG1h8mQY2fezSPQPTttYwA5gPR7xB6FqDb13mbGb
 Vk0D/MFQKhLo15hJj955mBoID0p25IY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60C08ABD1;
 Thu, 24 Sep 2020 15:44:09 +0000 (UTC)
Subject: Re: [PATCH 03/11 RFC] gitignore: Add/Generalize entries
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <202009092153.089LrA2R039188@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afe1939c-01b9-b6c6-a4d7-9762664b9447@suse.com>
Date: Thu, 24 Sep 2020 17:44:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <202009092153.089LrA2R039188@m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.09.2020 03:08, Elliott Mitchell wrote:
> @@ -33,12 +38,12 @@ cscope.po.out
>  .vscode
>  
>  dist
> -stubdom/*.tar.gz
>  
>  autom4te.cache/
>  config.log
>  config.status
>  config.cache
> +config.h
>  config/Toplevel.mk
>  config/Paths.mk

While in userland config.h may indeed be a typically generated file,
there are three source files by this name under xen/. Patch 6 also
doesn't look to override this in any way for xen/. I think this wants
to move a level down, into tools/ and wherever else it may be
applicable.

Jan


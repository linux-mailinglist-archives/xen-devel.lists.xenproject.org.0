Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA62806F73
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 13:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649203.1013611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAqgV-0008T3-6s; Wed, 06 Dec 2023 12:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649203.1013611; Wed, 06 Dec 2023 12:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAqgV-0008Qn-4K; Wed, 06 Dec 2023 12:07:23 +0000
Received: by outflank-mailman (input) for mailman id 649203;
 Wed, 06 Dec 2023 12:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uU2H=HR=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rAqgU-0008Qh-7x
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 12:07:22 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 021fe59f-9430-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 13:07:21 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso47432045e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 04:07:21 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c5-20020adffb05000000b00333b17432c0sm1189985wrr.28.2023.12.06.04.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 04:07:20 -0800 (PST)
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
X-Inumbo-ID: 021fe59f-9430-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701864440; x=1702469240; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WS9/wmHcxJSV1X0pP6+4BAi+EYzZ1HdoVNxXPhd4+4=;
        b=FdAtirjyuYxpDuMZOwjKIlAYnMOzCU5Nlntgk19+O/4uVWe7JRqwvJJ1gHTR/PqoEf
         5vLTz/Z9iZCr7IKizGqFZ50BTPQusvc+8rjkVbjjS1NolB1q7gtinmIcGwZa8Aim4OtM
         8ykNiv6fveNHOvY/wDo5zt1/J5z9zofpsVokY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701864440; x=1702469240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WS9/wmHcxJSV1X0pP6+4BAi+EYzZ1HdoVNxXPhd4+4=;
        b=MnYcTekGMq0gMXf7h8Xl/pp64FKgfVuKZKR35m75liGAisxItYdZCOIbmf8y2L3NEN
         iiafypKN3agSd9vxy2IkW/6Ng7DtmdcOyT1+ubh/AXZWt5SUmHjoKROI4Mw/q6jb0JOM
         bKA4uFsZVBKtIGZmaGRq9VTm3Yci8vEq4gxAbXwnJ4O3iLvFmfLcUee+Y3r1UCchEqH6
         lUw6tM3Z2hRJV2F2ixD1NPvFj7Qfwh+iTtKkPHIOaIOjjFlal5aK4aN9q5rMhO/OMVpE
         47y2PKiftrE7pvy+rzqf0ryrFqyquzYakfGPTHc8d83tip8hYLEk/g8Pkr3j3Q7MVj2K
         YDSg==
X-Gm-Message-State: AOJu0Yy5nmD38wQVSi1XOqy7utJaIBNJdoZ3IkhY2XG88OPmCOp2sbyE
	HEOhED/2GHwwLtktDxkEERvOlA==
X-Google-Smtp-Source: AGHT+IE6ZQoI7TGzIa238MVFd7sYTxOGl2jFR+cM+inU85v8gLPxbKVZr1a97SD2uWwURREMuLXkDg==
X-Received: by 2002:a7b:c8c7:0:b0:40b:4da4:b985 with SMTP id f7-20020a7bc8c7000000b0040b4da4b985mr546897wml.38.1701864440598;
        Wed, 06 Dec 2023 04:07:20 -0800 (PST)
Date: Wed, 6 Dec 2023 12:07:19 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>, Juergen Gross <jgross@suse.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [PATCH] Only compile the hypervisor with
 -Wdeclaration-after-statement
Message-ID: <40ea40d3-8105-4591-9b15-655a68d42daf@perard>
References: <20231205183226.26636-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205183226.26636-1-julien@xen.org>

On Tue, Dec 05, 2023 at 06:32:26PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Right now, all tools and hypervisor will be complied with the option
> -Wdeclaration-after-statement. While most of the code in the hypervisor
> is controlled by us, for tools we may import external libraries.
> 
> The build will fail if one of them are using the construct we are
> trying to prevent. This is the case when building against Python 3.12
> and Yocto:
> 
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
> |                  from xen/lowlevel/xc/xc.c:8:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> |   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
> |       |     ^~~~~~~~~~~
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> |   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
> |       |     ^~~~~~~~~~
> | cc1: all warnings being treated as errors
> 
> Looking at the tools directory, a fair few directory already add
> -Wno-declaration-after-statement to inhibit the default behavior.
> 
> We have always build the hypervisor with the flag, so for now remove
> only the flag for anything but the hypervisor. We can decide at later
> time whether we want to relax.
> 
> Also remove the -Wno-declaration-after-statement in some subdirectory
> as the flag is now unnecessary.
> 
> Part of the commit message was take from Alexander's first proposal:
> 
> Link: https://lore.kernel.org/xen-devel/20231128174729.3880113-1-alex@linutronix.de/
> Reported-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Tools side of the patch looks good to me, so
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


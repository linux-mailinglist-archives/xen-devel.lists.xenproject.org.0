Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3360230C33
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 16:14:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0QNS-0003sa-Ds; Tue, 28 Jul 2020 14:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0QNR-0003sV-C2
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 14:14:45 +0000
X-Inumbo-ID: af3fc6b0-d0dc-11ea-a8f3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af3fc6b0-d0dc-11ea-a8f3-12813bfff9fa;
 Tue, 28 Jul 2020 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595945684;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tKXRMwykMcTyq4Ew5Chd2SfSrSaptAYVUdFD9NU8Aog=;
 b=iRFGd4FkIvVk/DVnmBFVaUo/ZQlQ5EuNDY0HGmommHhLzbmn8o1ugofV
 1vjSTZYYTK9UMOQbSfIw/cO7z2GFLcXhSQ1sP8zhMtuPKCjIcIiAoQ94h
 0WwLLiQQZUBoksFyJbUYKvrRndL1Ivzs4vptQ+u6Oa1KVd1ehUCNQnAae s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: q+PyR+OGHB9jSQO8KUsBg9ErfHhN9hgSOlYrykfR0Emt8JWehlWGE7BLCY9oR8Kxz9Km5E6ZQB
 o0mcEBhBX8nPx6DBgHVQMlR7KkCd1TGuZmjIAlZXZTHT65ZQmya9A8pgxEdNp+S7BMITBEpxfQ
 cGgi5X3ZhK4wNmEYlkNqVEz/ZJgz6WA4jLKzTKiqDyTwcuc26F0Vb5wM1DAWZOxeSYtCzjmA6y
 lIPBLIcHsZUNzLg10yOE/Ukc2Lc1oT91LLYZxC6LvPyQLRWq+XLLvH0s2mBEKY3ePUq6mz4fGP
 k/s=
X-SBRS: 2.7
X-MesageID: 23540281
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23540281"
Subject: Re: [PATCH 5/5] tools/foreignmem: Support querying the size of a
 resource
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-6-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ed045b42-55aa-7b63-fda9-ff7788e03ff9@citrix.com>
Date: Tue, 28 Jul 2020 15:14:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/07/2020 12:37, Andrew Cooper wrote:
> With the Xen side of this interface fixed to return real sizes, userspace
> needs to be able to make the query.
>
> Introduce xenforeignmemory_resource_size() for the purpose, bumping the
> library minor version and providing compatiblity for the non-Linux builds.
>
> Its not possible to reuse the IOCTL_PRIVCMD_MMAP_RESOURCE infrastructure,
> because it depends on having already mmap()'d a suitably sized region before
> it will make an XENMEM_acquire_resource hypercall to Xen.
>
> Instead, open a xencall handle and make an XENMEM_acquire_resource hypercall
> directly.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>

I've folded:

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5ed5664bf7..b8ccf03ea9 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -123,7 +123,7 @@ LDLIBS_libxencall = $(SHDEPS_libxencall)
$(XEN_LIBXENCALL)/libxencall$(libextens
 SHLIB_libxencall  = $(SHDEPS_libxencall) -Wl,-rpath-link=$(XEN_LIBXENCALL)
 
 CFLAGS_libxenforeignmemory = -I$(XEN_LIBXENFOREIGNMEMORY)/include
$(CFLAGS_xeninclude)
-SHDEPS_libxenforeignmemory = $(SHLIB_libxentoolcore)
+SHDEPS_libxenforeignmemory = $(SHLIB_libxentoolcore) $(SHDEPS_libxencall)
 LDLIBS_libxenforeignmemory = $(SHDEPS_libxenforeignmemory)
$(XEN_LIBXENFOREIGNMEMORY)/libxenforeignmemory$(libextension)
 SHLIB_libxenforeignmemory  = $(SHDEPS_libxenforeignmemory)
-Wl,-rpath-link=$(XEN_LIBXENFOREIGNMEMORY)
 
diff --git a/tools/libs/foreignmemory/Makefile
b/tools/libs/foreignmemory/Makefile
index 8e07f92c59..f3a61e27c7 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 4
 LIBNAME  := foreignmemory
-USELIBS  := toollog toolcore
+USELIBS  := toollog toolcore call
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c

to fix the build in certain containers.

~Andrew


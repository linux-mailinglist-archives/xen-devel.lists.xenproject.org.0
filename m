Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6699477A51
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 18:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248134.427978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuMW-0004Kt-KW; Thu, 16 Dec 2021 17:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248134.427978; Thu, 16 Dec 2021 17:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuMW-0004Hy-HW; Thu, 16 Dec 2021 17:16:12 +0000
Received: by outflank-mailman (input) for mailman id 248134;
 Thu, 16 Dec 2021 17:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxuMU-0004Hs-Ke
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 17:16:10 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dada93bf-5e93-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 18:16:07 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43416)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxuMP-000Eiw-98 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 17:16:05 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 88E1C1FAC8;
 Thu, 16 Dec 2021 17:16:05 +0000 (GMT)
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
X-Inumbo-ID: dada93bf-5e93-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <6af001a9-75a2-2992-59ea-170af8d1627e@srcf.net>
Date: Thu, 16 Dec 2021 17:16:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 19/57] tools/configure.ac: Create ZLIB_LIBS and
 ZLIB_CFLAGS
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-20-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-20-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
> index 8f5f3acd21..1f4b7f7c58 100644
> --- a/tools/libs/guest/Makefile
> +++ b/tools/libs/guest/Makefile
> @@ -103,8 +102,7 @@ NO_HEADERS_CHK := y
>  
>  include $(XEN_ROOT)/tools/libs/libs.mk
>  
> -libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
> -libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(COMPRESSION_LIBS) -lz
> +libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(ZLIB_LIBS) -lz

Looking ZLIB vs the other compression libs, shouldn't -lz be inside
$(ZLIB_LIBS) ?

Also, shouldn't this be LDLIBS rather than APPEND_LDFLAGS ?

~Andrew


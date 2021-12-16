Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E13477B7E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 19:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248184.428089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvRa-0000sK-6q; Thu, 16 Dec 2021 18:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248184.428089; Thu, 16 Dec 2021 18:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvRa-0000pz-3r; Thu, 16 Dec 2021 18:25:30 +0000
Received: by outflank-mailman (input) for mailman id 248184;
 Thu, 16 Dec 2021 18:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxvRZ-0000pt-6H
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 18:25:29 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8af80767-5e9d-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 19:25:28 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43982)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxvRW-00082G-iz (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 18:25:26 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B66821FA9B;
 Thu, 16 Dec 2021 18:25:26 +0000 (GMT)
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
X-Inumbo-ID: 8af80767-5e9d-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9a452b7b-abaf-53bc-0b09-f41bcdb0b470@srcf.net>
Date: Thu, 16 Dec 2021 18:25:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 35/57] tools/xenpaging: Rework makefile
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-36-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-36-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> @@ -39,6 +39,6 @@ distclean: clean
>  
>  .PHONY: TAGS
>  TAGS:
> -	etags -t $(SRCS) *.h
> +	etags -t *.c *.h

/local/xen.git/xen$ git grep -w TAGS: -- :/
../tools/libs/libs.mk:129:TAGS:
../tools/xenpaging/Makefile:41:TAGS:
../tools/xenstore/Makefile:102:TAGS:
Makefile:487:TAGS:

Facilities like this ought to be organised by tools/Makefile, or perhaps
even the root Makefile.

~Andrew


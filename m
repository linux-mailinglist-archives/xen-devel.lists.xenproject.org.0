Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1830B477BB9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 19:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248201.428133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvmk-0005Ln-LK; Thu, 16 Dec 2021 18:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248201.428133; Thu, 16 Dec 2021 18:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvmk-0005JF-Hy; Thu, 16 Dec 2021 18:47:22 +0000
Received: by outflank-mailman (input) for mailman id 248201;
 Thu, 16 Dec 2021 18:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxvmi-0005J9-TB
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 18:47:20 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98c8d617-5ea0-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 19:47:19 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43450)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxvmf-000j6C-9a (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 18:47:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B77281FA9B;
 Thu, 16 Dec 2021 18:47:17 +0000 (GMT)
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
X-Inumbo-ID: 98c8d617-5ea0-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <edc0491b-a778-0ca1-88c6-c7076db3a14b@srcf.net>
Date: Thu, 16 Dec 2021 18:47:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 47/57] libs/stat: Fix and rework python-bindings build
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-48-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-48-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> Fix the dependency on the library, $(SHLIB) variable doesn't exist
> anymore.
>
> Rework dependency on the include file, we can let `swig` generate the
> dependency for us with the use of "-M*" flags.

Hmm.  At no point is swig mentioned in README/etc, and it's not in any
of the CI logic.  I wasn't even aware that we had python bindings here.

Unless someone tries and confirms them not to be broken, I'd be tempted
to drop it all.  I bet this has been dead since we dropped Xend.

~Andrew


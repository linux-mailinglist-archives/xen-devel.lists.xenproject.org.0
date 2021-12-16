Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99446477A6F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 18:19:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248138.427990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuPd-00058O-3n; Thu, 16 Dec 2021 17:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248138.427990; Thu, 16 Dec 2021 17:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuPd-00055Q-0U; Thu, 16 Dec 2021 17:19:25 +0000
Received: by outflank-mailman (input) for mailman id 248138;
 Thu, 16 Dec 2021 17:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxuPc-00055K-4K
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 17:19:24 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f95723c-5e94-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 18:19:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47108)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxuPZ-0002v8-p9 (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 17:19:21 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 798E01FAC8;
 Thu, 16 Dec 2021 17:19:21 +0000 (GMT)
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
X-Inumbo-ID: 4f95723c-5e94-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9cd576e2-956d-a61f-f840-d1dcdfdae2a6@srcf.net>
Date: Thu, 16 Dec 2021 17:19:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 36/57] tools/xenstore: Cleanup makefile
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-37-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-37-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> Regroup *FLAGS together, use $(LDLIBS).
>
> Remove $(LDLIBS_xenstored) which was the wrong name name as it doesn't
> decribe how to link to a potential libxenstored.so, instead add the
> value to $(LDLIBS) of xenstored.
>
> Add SYSTEMD_LIBS into $(LDLIBS) instead of $(LDFLAGS).
>
> Remove the "-I." from $(CFLAGS), it shouldn't be needed.
>
> Removed $(CFLAGS-y) and $(LDFLAGS-y). $(CFLAGS-y) is already included
> in $(CFLAGS) and both aren't used anyway.
>
> Rename ALL_TARGETS to TARGETS.
> Only add programmes we want to build in $(TARGETS), not phony-targets
> (replace "clients").
>
> Store all `xenstored` objs into $(XENSTORED_OBJS-y).
>
> Replace one $< by $^ even if there's only one dependency,
> (xenstore-control).
>
> clean: "init-xenstore-domain" isn't built here, so stop trying to
> remove it, remove $(TARGETS).

"isn't built here any more".  It was, until c/s 89bf86d1eb4a4

I'll tweak on commit.

~Andrew


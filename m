Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2537477B3F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 19:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248174.428067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxv6m-0005vi-2o; Thu, 16 Dec 2021 18:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248174.428067; Thu, 16 Dec 2021 18:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxv6l-0005tv-W4; Thu, 16 Dec 2021 18:03:59 +0000
Received: by outflank-mailman (input) for mailman id 248174;
 Thu, 16 Dec 2021 18:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxv6k-0005tp-8T
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 18:03:58 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8970f1e9-5e9a-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 19:03:57 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44510)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxv6g-000kEg-2o (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 18:03:54 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 985121FB21;
 Thu, 16 Dec 2021 18:03:54 +0000 (GMT)
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
X-Inumbo-ID: 8970f1e9-5e9a-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d10d6034-f0a3-12fd-47f6-daf3333dc5c4@srcf.net>
Date: Thu, 16 Dec 2021 18:03:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-27-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [XEN PATCH 26/57] tools/firmware/hvmloader: rework Makefile
In-Reply-To: <20211206170241.13165-27-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> Setup proper dependencies with libacpi so we don't need to run "make
> hvmloader" in the "all" target. ("build.o" new prerequisite isn't
> exactly proper but a side effect of building the $(DSDT_FILES) is to
> generate the "ssdt_*.h" needed by "build.o".)
>
> Make use if "-iquote" instead of a plain "-I".

So I've read up on what this means, but is it really that important in
the grand scheme of things?

Can't we actually make our problems go away by turning libacpi into a
real static library?  (Also, the "kill hvmloader plans" will turn
libacpi back into only having one single user, so that too)

~Andrew


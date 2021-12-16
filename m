Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00271477B66
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 19:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248179.428078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvN9-0000A7-Iz; Thu, 16 Dec 2021 18:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248179.428078; Thu, 16 Dec 2021 18:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxvN9-00007k-EZ; Thu, 16 Dec 2021 18:20:55 +0000
Received: by outflank-mailman (input) for mailman id 248179;
 Thu, 16 Dec 2021 18:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxvN7-00007e-Te
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 18:20:53 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e71b6754-5e9c-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 19:20:52 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44512)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxvN6-000pwn-0D (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 18:20:52 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D37C41FAB5;
 Thu, 16 Dec 2021 18:20:51 +0000 (GMT)
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
X-Inumbo-ID: e71b6754-5e9c-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5ba424c0-22c3-0c4a-af87-3346027260b6@srcf.net>
Date: Thu, 16 Dec 2021 18:20:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 34/57] tools/xcutils: rework Makefile
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-35-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-35-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> Use TARGETS to collect targets to build
>
> Remove "build" target.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/xcutils/Makefile | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/tools/xcutils/Makefile b/tools/xcutils/Makefile
> index 82d42624c8..198be22a5a 100644
> --- a/tools/xcutils/Makefile
> +++ b/tools/xcutils/Makefile
> @@ -11,7 +11,7 @@
>  XEN_ROOT	= $(CURDIR)/../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  
> -PROGRAMS = readnotes lsevtchn
> +TARGETS := readnotes lsevtchn

(For the future, because I'll commit this patch nowish)

We have at least

tools/xcutils
tools/misc
tools/helpers

of "misc random crap".  We ought to consolidate, and rethink which
binaries get installed where, because there is no coherent logic for
which end up on $PATH by default, and which don't.

~Andrew


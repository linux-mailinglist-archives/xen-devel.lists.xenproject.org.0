Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F649C034
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 01:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260622.450426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWJf-0007FB-8h; Wed, 26 Jan 2022 00:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260622.450426; Wed, 26 Jan 2022 00:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCWJf-0007D8-5N; Wed, 26 Jan 2022 00:37:39 +0000
Received: by outflank-mailman (input) for mailman id 260622;
 Wed, 26 Jan 2022 00:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hAYL=SK=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nCWJd-0007D2-Vl
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 00:37:37 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27d8a5dc-7e40-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 01:37:36 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50972)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nCWJU-000sWE-hR (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 26 Jan 2022 00:37:28 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 370101FBD8;
 Wed, 26 Jan 2022 00:37:28 +0000 (GMT)
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
X-Inumbo-ID: 27d8a5dc-7e40-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <724c92c3-46cb-fb67-f194-5b36b2fceaa5@srcf.net>
Date: Wed, 26 Jan 2022 00:37:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: automation: remove python-dev from unstable-arm64v8.dockerfile
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: cardoe@cardoe.com, anthony.perard@citrix.com, andrew.cooper3@citrix.com,
 wl@xen.org
References: <alpine.DEB.2.22.394.2201251629430.27308@ubuntu-linux-20-04-desktop>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <alpine.DEB.2.22.394.2201251629430.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/01/2022 00:31, Stefano Stabellini wrote:
> Debian unstable doesn't have the legacy python-dev package anymore.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

That's fine, but:

$ git grep python-dev -- automation/build/debian/unstable*
automation/build/debian/unstable-arm64v8.dockerfile:18:        python-dev \
automation/build/debian/unstable-i386.dockerfile:20:        python-dev \
automation/build/debian/unstable.dockerfile:18:        python-dev \

All 3 want editing together, even if we don't have a reason to rebuild
the x86 containers yet.

With that done, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> to
save a trivial repost.


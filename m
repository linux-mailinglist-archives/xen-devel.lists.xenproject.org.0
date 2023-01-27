Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4067E726
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 14:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485578.752903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPBt-0008RM-OR; Fri, 27 Jan 2023 13:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485578.752903; Fri, 27 Jan 2023 13:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPBt-0008Or-LH; Fri, 27 Jan 2023 13:54:53 +0000
Received: by outflank-mailman (input) for mailman id 485578;
 Fri, 27 Jan 2023 13:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gttX=5Y=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pLPBs-0008Ol-ES
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:54:52 +0000
Received: from ppsw-43.srv.uis.cam.ac.uk (ppsw-43.srv.uis.cam.ac.uk
 [131.111.8.143]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29f58a4d-9e4a-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 14:54:49 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:56294)
 by ppsw-43.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pLPBo-000y7V-Th (Exim 4.96) (return-path <amc96@srcf.net>);
 Fri, 27 Jan 2023 13:54:48 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1555C1FBD6;
 Fri, 27 Jan 2023 13:54:48 +0000 (GMT)
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
X-Inumbo-ID: 29f58a4d-9e4a-11ed-b8d1-410ff93cb8f0
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <aca42065-45b4-0e82-c0ba-b283243caaa9@srcf.net>
Date: Fri, 27 Jan 2023 13:54:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230127055421.22945-1-jgross@suse.com>
 <547fab47-d4b5-2c04-74d5-baffa10b9638@srcf.net>
 <260bfbf4-8a6c-d3ea-a4e6-547a51d59ba1@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
In-Reply-To: <260bfbf4-8a6c-d3ea-a4e6-547a51d59ba1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2023 10:55 am, Juergen Gross wrote:
>
> For xenstore-stubdom it is easier, as there is no reason to prefer
> the PV mode over PVH (in fact I'm still working on Xenstore LU for
> the PVH case, making the decision even easier).

I fully support having both PV and PVH options available.  It helps
maintain architecturally "clean" interfaces, and not decisions are about
performance.


But a PVH stub xenstored cannot outperform a equivalent PV stub
xenstored, for x86 architectural reasons.

PV stub xenstored doesn't do any of the usual things that causes PV
guests to be generally slow (different address spaces, user/kernel
context switching), and event/grants to PV guests is architecturally
more efficient than the HVM/PVH equivalents.

PV will never go away fully die, because we've got enough fastpaths
where this matters,  but I do expect that we'll eventually get to a
point where we don't have any general purpose OSes running as PV - only
single-task workloads such as stub xenstored.


The great thing about having both PV and PVH available is that people
will be able to see the concrete data confirming that PV is better,
without having to simply trust me on the matter.

~Andrew


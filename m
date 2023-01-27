Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195E67EC4B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 18:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485817.753220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLSMP-0007Uw-IU; Fri, 27 Jan 2023 17:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485817.753220; Fri, 27 Jan 2023 17:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLSMP-0007SO-F5; Fri, 27 Jan 2023 17:17:57 +0000
Received: by outflank-mailman (input) for mailman id 485817;
 Fri, 27 Jan 2023 17:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gttX=5Y=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pLSMO-0007SI-1b
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 17:17:56 +0000
Received: from ppsw-43.srv.uis.cam.ac.uk (ppsw-43.srv.uis.cam.ac.uk
 [131.111.8.143]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c04f5a-9e66-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 18:17:54 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34326)
 by ppsw-43.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pLSML-000nZM-TQ (Exim 4.96) (return-path <amc96@srcf.net>);
 Fri, 27 Jan 2023 17:17:53 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 014CE1FA74;
 Fri, 27 Jan 2023 17:17:52 +0000 (GMT)
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
X-Inumbo-ID: 88c04f5a-9e66-11ed-a5d9-ddcf98b90cbd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <db17d550-bbf8-f645-8ac4-51e20007aafc@srcf.net>
Date: Fri, 27 Jan 2023 17:17:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230127161739.5596-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20230127161739.5596-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2023 4:17 pm, Juergen Gross wrote:
> When loading a Xenstore stubdom the loader doesn't know whether the
> lo be loaded kernel is a PVH or a PV one. So it tries to load it as
> a PVH one first, and if this fails it is loading it as a PV kernel.
>
> This results in errors being logged in case the stubdom is a PV kernel.
>
> Suppress those errors by setting the minimum logging level to
> "critical" while trying to load the kernel as PVH.
>
> In case PVH mode and PV mode loading fails, retry PVH mode loading
> without changing the log level in order to get the error messages
> logged.
>
> Fixes: f89955449c5a ("tools/init-xenstore-domain: support xenstore pvh stubdom")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

although lets wait for OSStest to unblock before putting this in.

~Andrew


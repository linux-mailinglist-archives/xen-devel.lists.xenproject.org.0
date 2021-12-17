Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC54787ED
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 10:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248492.428620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my9iW-0004JA-Ii; Fri, 17 Dec 2021 09:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248492.428620; Fri, 17 Dec 2021 09:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my9iW-0004Ge-Fg; Fri, 17 Dec 2021 09:39:56 +0000
Received: by outflank-mailman (input) for mailman id 248492;
 Fri, 17 Dec 2021 09:39:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6k1w=RC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1my9iV-0004GY-2P
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 09:39:55 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4919bcb0-5f1d-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 10:39:53 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44750)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1my9iS-000XUT-1J (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 17 Dec 2021 09:39:52 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 275B71FA77;
 Fri, 17 Dec 2021 09:39:52 +0000 (GMT)
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
X-Inumbo-ID: 4919bcb0-5f1d-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <59705f15-3f9b-cd28-ad60-1f033933840f@srcf.net>
Date: Fri, 17 Dec 2021 09:39:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20211217075059.14466-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] tools/xenstore: drop support for running under SunOS
In-Reply-To: <20211217075059.14466-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2021 07:50, Juergen Gross wrote:
> Since several years now xenstored is no longer capable to run under
> SunOS, as the needed libxengnttab interfaces are not available there.
>
> Several attempts to let the SunOS maintainers address this situation
> didn't change anything in this regard.
>
> For those reasons drop SunOS support in xenstored by removing the SunOS
> specific code.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

FWIW, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> -out:
> -	/*
> -	 * 6589130 dtrace -G fails for certain tail-calls on x86
> -	 */
> -	asm("nop");
> -}

Code like this makes me extra sad... It only works for the same reasons
as why asm ("") would be fine as well.

~Andrew


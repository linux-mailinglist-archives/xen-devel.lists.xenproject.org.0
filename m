Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B337A48C30A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256534.440337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bjJ-0007pA-05; Wed, 12 Jan 2022 11:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256534.440337; Wed, 12 Jan 2022 11:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bjI-0007nG-TJ; Wed, 12 Jan 2022 11:23:48 +0000
Received: by outflank-mailman (input) for mailman id 256534;
 Wed, 12 Jan 2022 11:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7bjH-0007n0-US
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:23:47 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ac61e07-739a-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 12:23:45 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48274)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7bjF-000d9t-08 (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 11:23:45 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CE14A1FA84;
 Wed, 12 Jan 2022 11:23:44 +0000 (GMT)
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
X-Inumbo-ID: 1ac61e07-739a-11ec-9c70-5536b2d1e4e1
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <bfa154a6-88e3-8ce9-d959-7220ea7a7e64@srcf.net>
Date: Wed, 12 Jan 2022 11:23:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-10-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 09/12] mini-os: use file_ops and get_file_from_fd() for
 console
In-Reply-To: <20220111151215.22955-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 15:12, Juergen Gross wrote:
> +static int savefile_write(int fd, const void *buf, size_t nbytes)
> +{
> +    int ret = 0, tot = nbytes;
> +    struct file *file = get_file_from_fd(fd);
> +
> +    while ( nbytes > 0 )
> +    {
> +        ret = xencons_ring_send(file->dev, (char *)buf, nbytes);
> +        nbytes -= ret;
> +        buf = (char *)buf + ret;
> +    }
> +
> +    return tot - nbytes;
> +}
> +
> +static int console_write(int fd, const void *buf, size_t nbytes)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    console_print(file->dev, (char *)buf, nbytes);

I've just noticed this while committing the previous series, and I know
it is a preexisting bug, but the casts here are utterly unsafe, because
they're casting away constness.

console_print() is easy to fix, and just requires a prototype
adjustment.  That said, it also desperately also needs to fix 'int
length' to size_t to avoid problems with negative length VLAs on the stack.

xencons_ring_send() already takes const char *, so I'm pretty sure you
can just drop the casts here.  It too ought to not truncate size_t bytes
to "unsigned".

~Andrew


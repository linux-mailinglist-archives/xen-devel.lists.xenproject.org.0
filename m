Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16DD49289A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258571.445462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pfV-000085-Nk; Tue, 18 Jan 2022 14:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258571.445462; Tue, 18 Jan 2022 14:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pfV-00005d-KD; Tue, 18 Jan 2022 14:41:05 +0000
Received: by outflank-mailman (input) for mailman id 258571;
 Tue, 18 Jan 2022 14:41:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9pfU-00005D-RJ
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:41:04 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8804c08-786c-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:41:02 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:52128)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9pfR-000UDf-p2 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 14:41:01 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A48A21FC61;
 Tue, 18 Jan 2022 14:41:01 +0000 (GMT)
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
X-Inumbo-ID: a8804c08-786c-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5dda5d9b-3488-04d2-0692-9ee12ae26ec7@srcf.net>
Date: Tue, 18 Jan 2022 14:41:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [MINIOS PATCH v3 06/12] use alloc_file_type() and
 get_file_from_fd() in blkfront
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-7-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220116083328.26524-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2022 08:33, Juergen Gross wrote:
> diff --git a/blkfront.c b/blkfront.c
> index e3f42bef..ed902702 100644
> --- a/blkfront.c
> +++ b/blkfront.c
> @@ -483,9 +483,13 @@ int blkfront_aio_poll(struct blkfront_dev *dev)
>  
>  moretodo:
>  #ifdef HAVE_LIBC
> -    if (dev->fd != -1) {
> -        files[dev->fd].read = false;
> -        mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */
> +    {
> +        struct file *file = get_file_from_fd(dev->fd);
> +
> +        if ( file ) {

Style, as this is is being indented.

> +            file->read = false;
> +            mb(); /* Make sure to let the handler set read to 1 before we start looking at the ring */

MiniOS is in desperate need of being dragged over to LKMM, and to stop
using inappropriate fences.  Things will go much faster when these have
all been corrected to smp barriers.

~Andrew


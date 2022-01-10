Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E09489FAE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 19:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255539.437917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6zpx-0007HJ-Cv; Mon, 10 Jan 2022 18:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255539.437917; Mon, 10 Jan 2022 18:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6zpx-0007Eq-A2; Mon, 10 Jan 2022 18:56:09 +0000
Received: by outflank-mailman (input) for mailman id 255539;
 Mon, 10 Jan 2022 18:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RiBW=R2=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n6zpv-0007Ek-CJ
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 18:56:07 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5ca4eb9-7246-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 19:56:05 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46776)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n6zpr-000fvH-8G (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 10 Jan 2022 18:56:03 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5E1601FB76;
 Mon, 10 Jan 2022 18:56:03 +0000 (GMT)
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
X-Inumbo-ID: f5ca4eb9-7246-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b7534fde-b132-9822-fc3d-b3dfc28f9b04@srcf.net>
Date: Mon, 10 Jan 2022 18:56:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220107103544.9271-1-jgross@suse.com>
 <20220107103544.9271-3-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/2] tools/libs/gnttab: decouple more from mini-os
In-Reply-To: <20220107103544.9271-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2022 10:35, Juergen Gross wrote:
> @@ -54,8 +70,11 @@ int osdep_gnttab_close(xengnttab_handle *xgt)
>  
>  void minios_gnttab_close_fd(int fd)
>  {
> -    gntmap_fini(&files[fd].gntmap);
> -    files[fd].type = FTYPE_NONE;
> +    struct file *file = get_file_from_fd(fd);
> +
> +    gntmap_fini(file->dev);
> +    free(file->dev);

file->dev = NULL ?

Particularly as this is a pointer in a global files[] array.

Otherwise, LGTM.

~Andrew


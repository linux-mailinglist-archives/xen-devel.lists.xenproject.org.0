Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D848C30F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256539.440348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bkz-0008QG-DZ; Wed, 12 Jan 2022 11:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256539.440348; Wed, 12 Jan 2022 11:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bkz-0008Nj-9n; Wed, 12 Jan 2022 11:25:33 +0000
Received: by outflank-mailman (input) for mailman id 256539;
 Wed, 12 Jan 2022 11:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7bkx-0008NS-JE
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:25:31 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589fc3fb-739a-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 12:25:30 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48276)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7bku-000dS9-3D (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 11:25:29 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C266F1FD4D;
 Wed, 12 Jan 2022 11:25:28 +0000 (GMT)
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
X-Inumbo-ID: 589fc3fb-739a-11ec-bd6f-bfb69f65cdc7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <37ade49f-e277-99a4-4dd7-e1e6cb327ffb@srcf.net>
Date: Wed, 12 Jan 2022 11:25:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 10/12] mini-os: add struct file_ops for file type
 socket
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-11-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220111151215.22955-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 15:12, Juergen Gross wrote:
> +static int socket_write(int fd, const void *buf, size_t nbytes)
> +{
> +    return lwip_write(fd, (void *)buf, nbytes);

This void cast was bogus before, and can be dropped.  lwip_write()
already takes a const pointer.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5507A487686
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 12:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254371.436170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5nSS-0002LJ-37; Fri, 07 Jan 2022 11:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254371.436170; Fri, 07 Jan 2022 11:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5nSR-0002IO-V6; Fri, 07 Jan 2022 11:30:55 +0000
Received: by outflank-mailman (input) for mailman id 254371;
 Fri, 07 Jan 2022 11:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VgWa=RX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n5nSQ-00020S-HU
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 11:30:54 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441da359-6fad-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 12:30:51 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46746)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n5nSM-000tnC-gP (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 07 Jan 2022 11:30:50 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DB11C1FA57;
 Fri,  7 Jan 2022 11:30:49 +0000 (GMT)
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
X-Inumbo-ID: 441da359-6fad-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f1579294-4cc7-a685-0326-967444b69b86@srcf.net>
Date: Fri, 7 Jan 2022 11:30:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/2] mini-os: remove device specific struct file members
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220107104706.9859-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220107104706.9859-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2022 10:47, Juergen Gross wrote:
> This small series is a followup to the series sent recently:
>
> https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00110
>
> It contains the last cleanups related to struct file and can only be
> applied after the Xen libraries have stopped using the related union
> members.
>
> Juergen Gross (2):
>   mini-os: remove event channel specific struct file member
>   mini-os: remove gnttab specific member from struct file
>
>  include/lib.h | 13 -------------
>  1 file changed, 13 deletions(-)
>

This all looks fine.  Even if we don't want to hide struct file,
shouldn't we at least make the files[] array private to the MiniOS
core?  It's another implementation detail which external users mustn't
rely on.

~Andrew


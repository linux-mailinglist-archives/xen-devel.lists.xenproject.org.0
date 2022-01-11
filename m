Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBAB48B7E7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256075.439248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NVH-0004zg-Rj; Tue, 11 Jan 2022 20:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256075.439248; Tue, 11 Jan 2022 20:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NVH-0004xn-OZ; Tue, 11 Jan 2022 20:12:23 +0000
Received: by outflank-mailman (input) for mailman id 256075;
 Tue, 11 Jan 2022 20:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7NVG-0004xQ-9k
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:12:22 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8488c3b-731a-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 21:12:21 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48122)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7NVE-000X9h-2H (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 20:12:20 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7F7E41FBFC;
 Tue, 11 Jan 2022 20:12:20 +0000 (GMT)
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
X-Inumbo-ID: c8488c3b-731a-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d5ae3033-86c5-c2a4-73f8-6f5a4e1e8d26@srcf.net>
Date: Tue, 11 Jan 2022 20:12:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 02/12] mini-os: remove gnttab specific member from
 struct file
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-3-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220111151215.22955-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2022 15:12, Juergen Gross wrote:
> The event channel specific union member in struct file is no longer

Too much copy&paste from the previous patch?

The actual contents look fine.

~Andrew

> needed, so remove it.
>
> The gnttab file type and its associated handling can be removed, too,
> as libxengnttab is now supplying a struct file_ops via a call of
> alloc_file_type().
>
> This removes all contents of CONFIG_LIBXENGNTTAB guarded sections, so
> this config option can be removed.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>



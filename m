Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C822348B78E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 20:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256025.439105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7N2p-0004Dj-HS; Tue, 11 Jan 2022 19:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256025.439105; Tue, 11 Jan 2022 19:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7N2p-0004B7-EE; Tue, 11 Jan 2022 19:42:59 +0000
Received: by outflank-mailman (input) for mailman id 256025;
 Tue, 11 Jan 2022 19:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7N2n-0004Ar-M8
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 19:42:57 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac4d0c9b-7316-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 20:42:56 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47036)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7N2l-000n7l-8W (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 19:42:55 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7B7FD1FBCC;
 Tue, 11 Jan 2022 19:42:55 +0000 (GMT)
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
X-Inumbo-ID: ac4d0c9b-7316-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <da22a929-0226-c3e5-2c04-92b412613219@srcf.net>
Date: Tue, 11 Jan 2022 19:42:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 00/18] mini-os: remove struct file dependency on config
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 14:57, Juergen Gross wrote:
> Today the layout of struct file is depending on the Mini-OS
> configuration. This is especially bad as the layout is exported to
> external users like the Xen libraries built for Mini-OS, and those
> are being built only once for multiple stubdom configurations.
>
> Today there is no direct problem resulting from this, as the main
> difference between struct file layouts is a large union containing all
> the device specific data for the different file types. The largest
> union member is not configuration dependant, so the build is currently
> not broken.
>
> In order to avoid any future problems this patch series is eliminating
> the configuration dependency by replacing most of the device specific
> union members by a single pointer.
>
> The two union members used by Xen libraries can't be replaced yet, as
> those need to be switched to use the generic pointer first.
>
> In order to hide the Mini-OS internal implementation of the files
> array, patches 15-17 are introducing a common framework to access a
> struct file via its file descriptor, and to allocate new file types
> dynamically instead of having them all pre-defined. The file type
> specific operations are supplied via a function vector in order to
> remove the dependency of lib/sys.c on all the various file types.

Patches 1 thru 15 seem fine and ready to go.  Would it help to get those
committed now?

~Andrew


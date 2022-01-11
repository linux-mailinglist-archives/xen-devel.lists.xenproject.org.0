Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59448B88E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256100.439315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NeH-0000be-5F; Tue, 11 Jan 2022 20:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256100.439315; Tue, 11 Jan 2022 20:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NeH-0000Zk-1t; Tue, 11 Jan 2022 20:21:41 +0000
Received: by outflank-mailman (input) for mailman id 256100;
 Tue, 11 Jan 2022 20:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7NeF-0000ZM-55
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:21:39 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13cd31f8-731c-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:21:37 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47054)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7NeC-000t3o-92 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 20:21:36 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 944EA1FBCC;
 Tue, 11 Jan 2022 20:21:36 +0000 (GMT)
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
X-Inumbo-ID: 13cd31f8-731c-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a41f6688-d14a-dad5-1625-1b98f793062e@srcf.net>
Date: Tue, 11 Jan 2022 20:21:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-4-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 03/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in xs
In-Reply-To: <20220111151215.22955-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 15:12, Juergen Gross wrote:
>  void xs_daemon_close(struct xs_handle *h)
>  {
> -    int fd = _xs_fileno(h);
> -    struct xenbus_event *event, *next;
> -    for (event = files[fd].dev; event; event = next)
> -    {
> -        next = event->next;
> -        free(event);
> -    }
> +    close(_xs_fileno(h));
>  }

You've deleted the sole caller of xs_daemon_close() from the main
close() function.

That said, I'm very confused, because nothing in minios declares it. 
The declaration appears to come from xenstore.h, which is clearly
included unconditionally (when it ought not to be), but libxenstore also
defines the function too...

~Andrew


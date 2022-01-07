Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA93487890
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 14:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254462.436306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5ped-0005aq-Gy; Fri, 07 Jan 2022 13:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254462.436306; Fri, 07 Jan 2022 13:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5ped-0005Z1-DZ; Fri, 07 Jan 2022 13:51:39 +0000
Received: by outflank-mailman (input) for mailman id 254462;
 Fri, 07 Jan 2022 13:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VgWa=RX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n5pec-0005Yr-H3
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 13:51:38 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80041a54-6fc0-11ec-81c1-a30af7de8005;
 Fri, 07 Jan 2022 14:48:33 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49930)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n5peX-0001l3-oU (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 07 Jan 2022 13:51:33 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 48DA51FA57;
 Fri,  7 Jan 2022 13:51:33 +0000 (GMT)
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
X-Inumbo-ID: 80041a54-6fc0-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f2a74651-4a10-0bda-85c5-dee0dafcc919@srcf.net>
Date: Fri, 7 Jan 2022 13:51:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCHv2] x86/hvm: add more callback/upcall info to 'I' debug key
Content-Language: en-GB
From: Andrew Cooper <amc96@srcf.net>
To: David Vrabel <dvrabel@cantab.net>, xen-devel@lists.xenproject.org
Cc: David Vrabel <dvrabel@amazon.co.uk>
References: <20220107125523.212649-1-dvrabel@amazon.co.uk>
 <a599bd4f-99a4-1e41-dee7-fb2d01609ad7@srcf.net>
In-Reply-To: <a599bd4f-99a4-1e41-dee7-fb2d01609ad7@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2022 13:45, Andrew Cooper wrote:
> I realise this is all a complete mess, but is via_asserted correct for
> HVMIRQ_callback_vector?  It's mismatched between the two, and the best
> metric that exists is "is pending in IRR".

Urgh.  HVMIRQ_callback_vector is the one that is utterly broken, and
doesn't conform to the Local APIC spec, and must not end up in IRR.

We still need to figure out how to prevent a domain using
HVMIRQ_callback_vector when hardware APIC acceleration is in use, but
that's definitely getting off topic for this patch.

~Andrew


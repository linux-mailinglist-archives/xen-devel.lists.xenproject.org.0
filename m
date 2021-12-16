Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D48477039
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247889.427497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxovo-0008G6-4O; Thu, 16 Dec 2021 11:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247889.427497; Thu, 16 Dec 2021 11:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxovo-0008EE-0n; Thu, 16 Dec 2021 11:28:16 +0000
Received: by outflank-mailman (input) for mailman id 247889;
 Thu, 16 Dec 2021 11:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxovm-0008E8-Qr
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:28:14 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41aeb9bd-5e63-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:28:14 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44412)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxovl-000Pbq-1g (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 11:28:13 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 4B8B51FA9B;
 Thu, 16 Dec 2021 11:28:13 +0000 (GMT)
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
X-Inumbo-ID: 41aeb9bd-5e63-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <31e80b07-9352-b122-da06-3a73ce0dc426@srcf.net>
Date: Thu, 16 Dec 2021 11:28:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hvmloader: tidy pci_mem_{start,end}
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <35cc5395-f88e-f08a-cbaf-5938a508ff29@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <35cc5395-f88e-f08a-cbaf-5938a508ff29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2021 08:24, Jan Beulich wrote:
> For one at least pci_mem_start has to be precisely 32 bits wide, so use
> uint32_t for both. Otherwise expressions like "pci_mem_start <<= 1"
> won't have the intended effect (in their context).
>
> Further since its introduction pci_mem_end was never written to. Mark it
> const to make this explicit.
>
> Finally drop PCI_MEM_END: It is used just once and needlessly
> disconnected from the other constant (RESERVED_MEMBASE) it needs to
> match. Use RESERVED_MEMBASE as initializer of pci_mem_end instead.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


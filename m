Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A40773970
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579518.907525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJI9-0004Zt-1y; Tue, 08 Aug 2023 09:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579518.907525; Tue, 08 Aug 2023 09:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJI8-0004XY-VD; Tue, 08 Aug 2023 09:46:16 +0000
Received: by outflank-mailman (input) for mailman id 579518;
 Tue, 08 Aug 2023 09:46:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+kX=DZ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1qTJI7-0004XQ-W6
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:46:15 +0000
Received: from ppsw-41.srv.uis.cam.ac.uk (ppsw-41.srv.uis.cam.ac.uk
 [131.111.8.141]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69e3550f-35d0-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 11:46:14 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:54378)
 by ppsw-41.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 id 1qTJHu-009IcP-aQ (Exim 4.96) (return-path <amc96@srcf.net>);
 Tue, 08 Aug 2023 10:46:02 +0100
Received: from [10.80.67.25] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D63AB1FC27;
 Tue,  8 Aug 2023 10:46:01 +0100 (BST)
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
X-Inumbo-ID: 69e3550f-35d0-11ee-b280-6b7b168915f2
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <77a9f66f-6535-e64c-6022-8de62b405f64@srcf.net>
Date: Tue, 8 Aug 2023 10:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] common: asm/desc.h is an x86-only header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1ea0cd2e-1821-541d-068f-a18309d1823c@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <1ea0cd2e-1821-541d-068f-a18309d1823c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2023 10:42 am, Jan Beulich wrote:
> From briefly going over 9062553a0dc1 it looks like the #include in what
> was ac_timer.c was added there for no reason. It's unneeded now in any
> event, and it is the sole reason for Arm to have that dummy header.
> Purge that, thus avoiding PPC to also gain one.

And RISC-V too.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'd noticed this too, and was wondering why it had escaped into common
code.  Good riddance.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


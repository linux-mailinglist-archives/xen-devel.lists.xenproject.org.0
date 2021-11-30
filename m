Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF5463C25
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 17:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235365.408363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms6FY-0006Nh-Ff; Tue, 30 Nov 2021 16:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235365.408363; Tue, 30 Nov 2021 16:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms6FY-0006Lx-Ch; Tue, 30 Nov 2021 16:45:00 +0000
Received: by outflank-mailman (input) for mailman id 235365;
 Tue, 30 Nov 2021 16:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms6FW-0006Lr-Nq
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 16:44:58 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7c84232-51fc-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 17:44:54 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43826)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms6FU-000pN7-0f (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 16:44:56 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 0AA0F1FB51;
 Tue, 30 Nov 2021 16:44:56 +0000 (GMT)
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
X-Inumbo-ID: d7c84232-51fc-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <bb4f2e4c-3ab9-a1b9-457b-f46275d34c87@srcf.net>
Date: Tue, 30 Nov 2021 16:44:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/EPT: squash meaningless TLB flush
In-Reply-To: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2021 16:10, Jan Beulich wrote:
> ept_free_entry() gets called after a flush - if one is necessary in the
> first place - was already issued. That behavior is similar to NPT, which
> also doesn't have any further flush in p2m_free_entry(). (Furthermore,
> the function being recursive, in case of recursiveness way too many
> flushes would have been issued.)
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

ept_free_entry() is called either recursively, or after an
ept_split_super_page(), and I agree that it does not want to queue
multiple flushes.

However, I don't see where a suitable flush is in the superpage path. 
Am I overlooking something?

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0546467A9F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 16:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237797.412401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtAqH-0001OS-ND; Fri, 03 Dec 2021 15:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237797.412401; Fri, 03 Dec 2021 15:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtAqH-0001LP-Je; Fri, 03 Dec 2021 15:51:21 +0000
Received: by outflank-mailman (input) for mailman id 237797;
 Fri, 03 Dec 2021 15:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mtAqF-0001LJ-Vp
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 15:51:19 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9d5ce9c-5450-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 16:51:18 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35120)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mtAq9-000XjX-6i (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 15:51:13 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CD5BF1FC17;
 Fri,  3 Dec 2021 15:51:12 +0000 (GMT)
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
X-Inumbo-ID: d9d5ce9c-5450-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9aa6f7bc-225b-3c52-acb7-8676d7dd52a0@srcf.net>
Date: Fri, 3 Dec 2021 15:51:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] EFI: move efi-boot.h inclusion point
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
 <8413bd97-90f5-1b9b-9090-d9fd3bcbcc66@srcf.net>
 <0418bdcc-62eb-3d98-1c1a-6b1af0f75d00@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <0418bdcc-62eb-3d98-1c1a-6b1af0f75d00@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 12:50, Jan Beulich wrote:
> On 03.12.2021 12:21, Andrew Cooper wrote:
>> On 03/12/2021 10:56, Jan Beulich wrote:
>>> When it was introduced, it was imo placed way too high up, making it
>>> necessary to forward-declare way too many static functions. Move it down
>>> together with
>>> - the efi_check_dt_boot() stub, which afaict was deliberately placed
>>>   immediately ahead of the #include,
>>> - blexit(), because of its use of the efi_arch_blexit() hook.
>>> Move up get_value() and set_color() to before the inclusion so their
>>> forward declarations can also be zapped.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Why does blexit() need moving?  It isn't static, and has a real
>> prototype in efi.h
> Correct, but the movement is for the functions it uses from efi-boot.h:
> efi_arch_halt() and efi_arch_blexit() at least (which actually the
> commit message also says, for one of the two at least).

Ah ok.


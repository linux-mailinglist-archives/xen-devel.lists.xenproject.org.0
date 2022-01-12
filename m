Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D813348C006
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256378.439899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Z5I-0003pT-Sz; Wed, 12 Jan 2022 08:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256378.439899; Wed, 12 Jan 2022 08:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Z5I-0003nT-Q7; Wed, 12 Jan 2022 08:34:20 +0000
Received: by outflank-mailman (input) for mailman id 256378;
 Wed, 12 Jan 2022 08:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7Z5H-0003nN-2C
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:34:19 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e227f32-7382-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 09:34:17 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47660)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7Z5E-000AZb-il (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 08:34:16 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id ADEFF1FD4B;
 Wed, 12 Jan 2022 08:34:16 +0000 (GMT)
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
X-Inumbo-ID: 6e227f32-7382-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9be0e9b7-c382-1643-92e6-be320fda37d9@srcf.net>
Date: Wed, 12 Jan 2022 08:34:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-3-jgross@suse.com>
 <b0dec08d-2b94-efbb-cbc8-d67e3529fcc1@srcf.net>
 <6e7dbf91-8c0e-900a-dacc-5afa36b6261d@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 2/3] tools/libs/gnttab: decouple more from mini-os
In-Reply-To: <6e7dbf91-8c0e-900a-dacc-5afa36b6261d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2022 07:27, Juergen Gross wrote:
> On 11.01.22 21:08, Andrew Cooper wrote:
>
>> The least bad way I can think of doing this would be to leave void
>> minios_gnttab_close_fd(int fd) exactly as it was, and instead of
>> converting it's use here, use a separate static function straight away
>> for the file ops.  (Will be necessary anyway if you like my suggestion
>> of passing file too).  Then in the whole function in "tools/libs: final
>> cleanup making mini-os callbacks static", rather than just making it
>> static.
>
> I can change it if you really want.

Well, it will happen as a natural side effect of passing file* rather
than fd, but I do think it is a safer course of action.

~Andrew


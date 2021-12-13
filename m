Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F347341F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 19:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246269.424716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwqAx-0003lx-Ug; Mon, 13 Dec 2021 18:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246269.424716; Mon, 13 Dec 2021 18:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwqAx-0003jS-Rg; Mon, 13 Dec 2021 18:35:51 +0000
Received: by outflank-mailman (input) for mailman id 246269;
 Mon, 13 Dec 2021 18:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4QLc=Q6=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mwqAw-0003jM-Hj
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 18:35:50 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d865394-5c43-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 19:35:49 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:42894)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mwqAt-000b8T-8g (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 13 Dec 2021 18:35:47 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 6A7B9204C9;
 Mon, 13 Dec 2021 18:35:47 +0000 (GMT)
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
X-Inumbo-ID: 7d865394-5c43-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a2a8a913-ee28-87fa-5674-9a65bec94c90@srcf.net>
Date: Mon, 13 Dec 2021 18:35:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20211213175633.30448-1-andrew.cooper3@citrix.com>
 <YbeQZM1dbs4OV267@perard>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] tools/libfsimage: Bump SONAME to 4.17
In-Reply-To: <YbeQZM1dbs4OV267@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/12/2021 18:26, Anthony PERARD wrote:
> On Mon, Dec 13, 2021 at 05:56:33PM +0000, Andrew Cooper wrote:
>> Fixes: a5706b80f42e ("Set version to 4.17: rerun autogen.sh")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Wei Liu <wl@xen.org>
>> CC: Anthony PERARD <anthony.perard@citrix.com>
>> CC: Juergen Gross <jgross@suse.com>
>>
>> This gets forgotten each release.  Any chance we can move libfsimage and/or
>> libacpi into libs/, where this issue would go away.
> libfsimage is a weird kind of library, I don't think it's going to sit
> well in libs/, and I don't think moving it just because MAJOR hasn't been
> bumped is a good reason...

Honestly, the better reasons is "because it's a library, it ought to
live in libs/ with the rest of them", but yeah, it is weird.  Perhaps
instead we want to tie it to pygrub so people have an easier time of
turning the whole lot off.

>
> libacpi isn't a library, not really. It's a collection of source files
> designed to be embedded into other programmes.

We'd normally call that libacpi.a, and it's perhaps a worthwhile change
to make.

>
> You know, we could simply replace "4.16" by
>     $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
> then we can forget libfsimage exist.
>
> Any any case,
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> for this patch, or for using version.sh instead.

Good shout.  I'll double check that

MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)

does the right thing, and commit that version.  One fewer thing to worry
about.

~Andrew


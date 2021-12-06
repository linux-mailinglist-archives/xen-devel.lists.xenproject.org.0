Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E691446A28B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239557.415614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHX0-0000rI-CS; Mon, 06 Dec 2021 17:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239557.415614; Mon, 06 Dec 2021 17:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHX0-0000ou-8Z; Mon, 06 Dec 2021 17:12:02 +0000
Received: by outflank-mailman (input) for mailman id 239557;
 Mon, 06 Dec 2021 17:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMFW=QX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muHWz-0000oo-NB
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:12:01 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e7d875b-56b7-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:12:00 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44694)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muHWv-0011Gn-2G (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 06 Dec 2021 17:11:57 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5B0FE1FDB9;
 Mon,  6 Dec 2021 17:11:57 +0000 (GMT)
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
X-Inumbo-ID: 9e7d875b-56b7-11ec-a5e1-b9374ead2679
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a8519cba-9f63-998a-908c-a87faf8f4a88@srcf.net>
Date: Mon, 6 Dec 2021 17:11:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206142929.29105-1-jgross@suse.com>
 <20211206142929.29105-3-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 2/2] tools/helpers: set event channel for PVH
 xenstore-stubdom console
In-Reply-To: <20211206142929.29105-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 14:29, Juergen Gross wrote:
> In contrast to the PFN of the console ring page the event channel of
> the console isn't being set automatically by xc_dom_build_image().
>
> Call xc_hvm_param_set() explicitly for that reason.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

So, technically, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However...

That said, there is a distinct lack of joined-up thinking in this interface.

It makes no sense whatsoever to for xc_dom_build_image() to build the
grant, but leave the evtchn to the caller.

And indeed,

xg_dom_x86.c: start_info->console.domU.evtchn = dom->console_evtchn;

we set it up on the PV side of things.  So I think the proper fix is to
wire up the HVM side and prevent the callers needing to do this.


Furthermore, I doubt we skip setting up the xenstore connection.

Really, the users of xc_dom_build_image() want a console Y/n, xenstore
Y/n type interface, and judging by the fields we've already got, that
can reasonably be done on the non-zero-ness of *_evtchn

(It is also weird that the caller is required to bind the evtchn, but
that's so baked into the API that I'd need to rearrange code between
Ocaml daemons to make use of a "library code allocates evtchn+grant
together" option.)

~Andrew


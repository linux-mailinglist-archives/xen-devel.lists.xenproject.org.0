Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7044DB852
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 19:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291255.494239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUYrU-0003tf-1K; Wed, 16 Mar 2022 18:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291255.494239; Wed, 16 Mar 2022 18:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUYrT-0003qW-US; Wed, 16 Mar 2022 18:59:07 +0000
Received: by outflank-mailman (input) for mailman id 291255;
 Wed, 16 Mar 2022 18:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EYuC=T3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nUYrS-0003qQ-O2
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 18:59:06 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25878cbf-a55b-11ec-853c-5f4723681683;
 Wed, 16 Mar 2022 19:59:04 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49448)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nUYrI-0006yT-Jx (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 16 Mar 2022 18:58:56 +0000
Received: from [192.168.1.30] (unknown [84.66.49.165])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D916D1FB1C;
 Wed, 16 Mar 2022 18:58:55 +0000 (GMT)
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
X-Inumbo-ID: 25878cbf-a55b-11ec-853c-5f4723681683
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
Date: Wed, 16 Mar 2022 18:58:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
Content-Language: en-GB
To: Raphael Ning <raphning@gmail.com>, xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
References: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/03/2022 18:38, Raphael Ning wrote:
> From: Raphael Ning <raphning@amazon.com>
>
> Currently, evtchn_fifo_set_pending() will mark the event as PENDING even
> if it fails to lock the FIFO event queue(s), or if the guest has not
> initialized the FIFO control block for the target vCPU. A well-behaved
> guest should never trigger either of these cases.
>
> There is no good reason to set the PENDING bit (the guest should not
> depend on this behaviour anyway) or check for pollers in such corner
> cases, so skip that. In fact, both the comment above the for loop and
> the commit message for
>
>  41a822c39263 xen/events: rework fifo queue locking
>
> suggest that the bit should be set after the FIFO queue(s) are locked.
>
> Take the opportunity to rename the was_pending variable (flipping its
> sense) and switch to the standard bool type.
>
> Suggested-by: David Vrabel <dvrabel@amazon.co.uk>
> Signed-off-by: Raphael Ning <raphning@amazon.com>
> ---
>  xen/common/event_fifo.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
> index ed4d3beb10f3..6c74ccebebb7 100644
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -165,7 +165,7 @@ static void cf_check evtchn_fifo_set_pending(
>      unsigned int port;
>      event_word_t *word;
>      unsigned long flags;
> -    bool_t was_pending;
> +    bool_t check_pollers = false;

Considering your commit message, did you intend to change this to bool?

Can be fixed on commit.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

P.S. David - do you want your maintainership back?  None of this code
has undergone any major changes since you wrote it.


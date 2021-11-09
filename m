Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2544AF8B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223961.386952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSCW-0003uA-Js; Tue, 09 Nov 2021 14:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223961.386952; Tue, 09 Nov 2021 14:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSCW-0003sN-Gn; Tue, 09 Nov 2021 14:34:16 +0000
Received: by outflank-mailman (input) for mailman id 223961;
 Tue, 09 Nov 2021 14:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j4nh=P4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mkSCV-0003sH-BC
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:34:15 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b46b8b6-416a-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 15:34:14 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:45654)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mkSCK-000aIK-hd (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 09 Nov 2021 14:34:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3D66E1FCD3;
 Tue,  9 Nov 2021 14:34:04 +0000 (GMT)
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
X-Inumbo-ID: 1b46b8b6-416a-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16] Revert "domctl: improve locking during domain
 destruction"
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Hongyan Xia <hongyxia@amazon.com>,
 Dmitry Isaikin <isaikin-dmitry@yandex.ru>, Ian Jackson <iwj@xenproject.org>
References: <20211109143128.56089-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <fc7465a7-6942-12ae-c3c1-0773c36c32f6@srcf.net>
Date: Tue, 9 Nov 2021 14:34:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211109143128.56089-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 09/11/2021 14:31, Roger Pau Monne wrote:
> This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
>
> Performance analysis has shown that dropping the domctl lock during
> domain destruction greatly increases the contention in the heap_lock,
> thus making parallel destruction of domains slower.
>
> The following lockperf data shows the difference between the current
> code and the reverted one:
>
> lock:  3342357(2.268295505s), block:  3263853(18.556650797s)
> lock:  2788704(0.362311723s), block:   222681( 0.091152276s)
>
> Given the current point in the release, revert the commit and
> reinstate holding the domctl lock during domain destruction. Further
> work should be done in order to re-add more fine grained locking to
> the domain destruction path once a proper solution to avoid the
> heap_lock contention is found.
>
> Reported-by: Hongyan Xia <hongyxia@amazon.com>
> Reported-by: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


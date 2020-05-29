Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C31E8545
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 19:40:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeizg-0005tT-Ae; Fri, 29 May 2020 17:40:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jeizf-0005tN-1l
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 17:40:31 +0000
X-Inumbo-ID: 7d4794f4-a1d3-11ea-a8f4-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d4794f4-a1d3-11ea-a8f4-12813bfff9fa;
 Fri, 29 May 2020 17:40:30 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:38184
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jeizY-000WmB-Jv (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 18:40:24 +0100
Subject: Re: [XEN PATCH] xen/build: introduce CLANG_FLAGS for testing other
 CFLAGS
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200529154343.1616925-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b60a175b-b5f4-c094-6c76-f8a7fd9f3658@citrix.com>
Date: Fri, 29 May 2020 18:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529154343.1616925-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 16:43, Anthony PERARD wrote:
> Commit 534519f0514f ("xen: Have Kconfig check $(CC)'s version")
> introduced the use of CLANG_FLAGS in Kconfig which is used when
> testing for other CFLAGS via $(cc-option ...) but CLANG_FLAGS doesn't
> exist in the Xen build system. (It's a Linux/Kbuild variable that
> haven't been added yet.)
>
> The missing CLANG_FLAGS isn't an issue for $(cc-option ..) but it
> would be when $(as-instr ..) gets imported from Kbuild to tests
> assembly instruction. We need to know if we are going to use clang's
> assembler or not.
>
> CLANG_FLAGS needs to be calculated before we call Kconfig.
>
> So, this patch adds CLANG_FLAGS which may contain two flags which are
> needed for further testing of $(CC)'s capabilities:
>   -no-integrated-as
>     This flags isn't new, but simply tested earlier so that it can be
>     used in Kconfig. The flags is only added for x86 builds like
>     before.
>   -Werror=unknown-warning-option
>     The one is new and is to make sure that the warning is enabled,
>     even though it is by default but could be disabled in a particular
>     build of clang, see Linux's commit e8de12fb7cde ("kbuild: Check
>     for unknown options with cc-option usage in Kconfig and clang")
>
>     It is present in clang 3.0.0, according Linux's commit
>     589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
>     CLANG_FLAGS").
>
> (The "note" that say that the flags was only added once wasn't true
> when tested on CentOS 6, so the patch uses $(or) and the flag will only
> be added once.)
>
> Fixes: 534519f0514f ("xen: Have Kconfig check $(CC)'s version")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


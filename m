Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D29649E0A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 12:38:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459523.717275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4h83-0006Qg-Lm; Mon, 12 Dec 2022 11:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459523.717275; Mon, 12 Dec 2022 11:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4h83-0006Ob-I6; Mon, 12 Dec 2022 11:37:51 +0000
Received: by outflank-mailman (input) for mailman id 459523;
 Mon, 12 Dec 2022 11:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xn9i=4K=citrix.com=prvs=338000f17=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p4h82-0006OV-Gn
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 11:37:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e299d0d-7a11-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 12:37:35 +0100 (CET)
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
X-Inumbo-ID: 5e299d0d-7a11-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670845069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aTKZA/1gccbH94zm8O8zZv6zPAmrKAeut72yR1Y5zpk=;
  b=OOkcrVP2qNJjvge8zQsL1aphP8AEO390WLlTrX2kmw+7K2Cm6DTgoGSP
   wjIaPIeW0//hCecBYu7HKWj96SRiREPWhUFAHLHjIOzSbg3nMs70d3Jxi
   qhDs+2X4eedHwI7NabRXKFx9XzqChhIBxu++ryXA3vzCjefOJds2cU84c
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87878099
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Wd1RZajj/fQMyBzIOiUgVfCoX161ShAKZh0ujC45NGQN5FlHY01je
 htvUDuBPqrZYDGgfogjb4zn804CscLXnNMwQAQ9ry0xRX8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gaEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQZcHMrZC+8td652bGGRbdgluMsIOz0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthbH9
 j2WpzWoav0cHOKx6R/YtTWjuuvogx/pQ4IfGJ+b0Mc/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGr6co81ewZsLgRBD+q3mB1jYZUsBVGvc36ymMzLTV+AeTAmUYTj9HZ8civcVwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRt3jX4iNht1FSVFI8lSfPryI2ucd3t/
 9yUhClmxJMZsvE566qi/m3I3T68gZfFaxFgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarrUKzGLoC6T7wJs8w4ifIQCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoGL9CgeR2mHBllTK7qXXHI/OPiOr2WZJoYe1dbAvmgh4Rs8toXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSFTOHwCkOQOLrTrClM/SAkc5wr5netJl3pNw/4EyY8lP
 xiVBidl9bYIrSSedFXSMCE/Nu2HsFQWhStTABHA9G2AgxALCbtDJo9GH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:Xz1vIaOULwV38MBcTnqjsMiBIKoaSvp037Dk7SFMoHtuA6qlfq
 GV7ZMmPHrP4gr5N0tMpTntAsW9qDbnhP1ICWd4B8bfYOCkghrUEGlahbGSvAEIYheOiNK1t5
 0BT0EOMqyVMbEgt7eC3ODQKb9Jq+VvsprY59s2qU0DcegAUdAE0+4WMGim+2RNNXh7LKt8Op
 qAx9ZN4wGtcW4Qaa2AdwM4dtmGid3XtY7sJSULDR4/6AWIkFqTmcXHOind8BcCci9FhYwv+2
 jdkwD/++GKvvyhxgXHvlWjn6h+qZ/OysZjGMfJsMQTJzn24zzYHLhcZw==
X-IronPort-AV: E=Sophos;i="5.96,238,1665460800"; 
   d="scan'208";a="87878099"
Date: Mon, 12 Dec 2022 11:37:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] libxl: abort on memory allocation errors
Message-ID: <Y5cShXlBnq7sRLuw@perard.uk.xensource.com>
References: <20221211175949.2193629-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221211175949.2193629-1-marmarek@invisiblethingslab.com>

On Sun, Dec 11, 2022 at 06:59:49PM +0100, Marek Marczykowski-Górecki wrote:
> Use abort() instead of just _exit() in libxl__alloc_failed(). This
> is more friendly for debugging, as it will trap into debugger,
> systemd-coredump will collect coredump/backtrace etc. It's much more
> useful than just "libxl: FATAL ERROR: memory allocation failure (...)"
> message without context where it actually failed.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D957C242E72
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 20:17:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5vIT-0002W6-1y; Wed, 12 Aug 2020 18:16:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RYY=BW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k5vIR-0002W1-Sl
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 18:16:19 +0000
X-Inumbo-ID: 421d18f7-1deb-4372-b8ca-41f0d294a485
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 421d18f7-1deb-4372-b8ca-41f0d294a485;
 Wed, 12 Aug 2020 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597256177;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=dqs8azdFCrW+PPEl4fINdO7rMPEeDp57iNlqdLQWVTc=;
 b=SCK0F6xOUQNVcAGMsg5jbvGyi6pSLmVjYPQ2Cb5oKnz58mD0qa/cSQxY
 4XsGR9hYY1W06MN8b+mS7qjuezqkQ0w57yxzwAhEmqcxn7OkptK43bZXK
 joTu5IpEKSpJh8ZJBsuf79HT2LgKstfaaKypnclxFRYzzfI304cYnpVQG k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /X1bc905lcoQ4ecXWdkWwvbEf7IEejbDSMlfqEvjlBOMy9UY7CPQQPk7SjyeiPevMLz2S2wH6A
 cSEU0z8zkORQiA+BRmVnjSf7nzjcV33mor0idJBRtyXUUoK8QcI0BR5uF3rD6SlM/FESCPp+J5
 4E7f2y4xM3XHApCDQI2k6r+xMwr20vl2w6oOb+a/thwbj9z8utSwJp/JS8v+k/HntwPZKTxfDw
 sfQaN5U46SzXIgfGVti5sB96pKLJ7dnq/thUEfA+eAnuYDZ3UY9tn1hMb2a7rXwNldWr23CaDT
 1rA=
X-SBRS: 2.7
X-MesageID: 24728422
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,305,1592884800"; d="scan'208";a="24728422"
Subject: Re: [PATCH] arch/x86/setup.c: Ignore early boot parameters like
 no-real-mode
To: Trammell Hudson <hudson@trmm.net>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <On7D3GbE8WWWH3f-1bSvUFQDxFcHP3yg6NdfvffgKqPRjQmJKsPBKsPgCCEEHbt9r2A3yxvf3gARonkKF9M_n1f3UfLEFpnZ29J2-Jc35ls=@trmm.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c7afab8c-291c-df0d-7269-084093975ea0@citrix.com>
Date: Wed, 12 Aug 2020 19:16:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <On7D3GbE8WWWH3f-1bSvUFQDxFcHP3yg6NdfvffgKqPRjQmJKsPBKsPgCCEEHbt9r2A3yxvf3gARonkKF9M_n1f3UfLEFpnZ29J2-Jc35ls=@trmm.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/08/2020 18:42, Trammell Hudson wrote:
> There are parameters in xen/arch/x86/boot/cmdline.c that
> are only used early in the boot process, so handlers are
> necessary to avoid an "Unknown command line option" in
> dmesg.
>
> This also updates ignore_param() to generate a temporary
> variable name so that the macro can be used more than once
> per file.
>
> Signed-off-by: Trammell hudson <hudson@trmm.net>

Good spot.

However, the use of __LINE__ creates problems for livepatch builds, as
it causes the binary diffing tools to believe these changed, based on a
change earlier in the file.

Instead of opencoding TEMP_NAME(), can we borrow Linux's __UNIQUE_ID()
infrastructure?  __COUNTER__ appears to have existed for ages, and
exists in all of our supported compilers.

If you want, I can sort that out as a prereq patch, and rebase this one
on top?

~Andrew


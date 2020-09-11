Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEF26688A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 21:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGoPL-0000sb-OX; Fri, 11 Sep 2020 19:08:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGoPJ-0000sV-V0
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 19:08:25 +0000
X-Inumbo-ID: efa46f0e-7603-4c3a-a882-77d413dff3a9
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efa46f0e-7603-4c3a-a882-77d413dff3a9;
 Fri, 11 Sep 2020 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599851304;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lauFKpqHseB67zp9+TnEUquCLRLw6tG3qb/HhTkY8Dc=;
 b=OPOiG0rdTfXxxNUZ5qcWl/sp/kSqIM2jQxFRrzpd56SrKnXv8fxzOjJZ
 6L+8mt8hpOpzlkC61xIc8vjI+GIX/Uf+eI3Gm3CDrfJkw2EeEOlJI8KHE
 gqawr+nmGmQTfulZgl/FZBOlQmmOpaFEhk+uFsKKXQoEyQyd5fXVFKjAf 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /PX050qKnpuJHCpxlq1RY23WHMP2dSDV3K1YvUhKFk0AlzMzob67R8GKVoQjNvITiLWM58QFaK
 jkh9zMLnzr3c3/yqFcK/lpmJyZmORJrMS40m0fhWPqrw15Z3vtPWWMkD1mAnzWlH8y7nGfwj1P
 c0S9auIHVbRNe/Kl0wuEKZlMesbZD9lUhhT57KH28TvwZZIcffSrnhgMyY2t0qJ09+qNsodB1o
 oOkEBGsixy1ARP0uYrOjAsGCilOd43SNvyQ76NeZ/uifCNgqj+aBhd1y3A+LULsjuDciDlqpm0
 Pzs=
X-SBRS: 2.7
X-MesageID: 26650820
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,416,1592884800"; d="scan'208";a="26650820"
Subject: Re: [PATCH] tools/libs/stat: fix broken build
To: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <20200911131528.19734-1-jgross@suse.com>
 <20200911175846.ximv7mojq4bujhem@liuwe-devbox-debian-v2>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7a7c4a54-ccfa-a586-6d89-4d8b53e79b70@citrix.com>
Date: Fri, 11 Sep 2020 20:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911175846.ximv7mojq4bujhem@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 11/09/2020 18:58, Wei Liu wrote:
> On Fri, Sep 11, 2020 at 03:15:28PM +0200, Juergen Gross wrote:
>> Making getBridge() static triggered a build error with some gcc versions:
>>
>> error: 'strncpy' output may be truncated copying 15 bytes from a string of
>> length 255 [-Werror=stringop-truncation]
>>
>> Fix that by printing a sane error message and bailing out in case the name of
>> a bridge is too long.
>>
>> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
> But this patch is not the one that created the bug though? It just
> happens to be the last patch that touched that file.

It "created" the bug by making getBridge() static, and therefore inlined
into its sole caller, and therefore able to be analysed in this way by
the compiler.

That said, Gitlab CI says no to this as a viable bugfix.

~Andrew


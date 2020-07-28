Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB04230BF0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 15:59:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Q8h-00024T-M5; Tue, 28 Jul 2020 13:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0Q8h-00024O-3G
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 13:59:31 +0000
X-Inumbo-ID: 8e4abcaa-d0da-11ea-8b61-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e4abcaa-d0da-11ea-8b61-bc764e2007e4;
 Tue, 28 Jul 2020 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595944771;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=v7TjwgpIipnilB9SKQprJ0BZzCL27UD9AeH4NyXe6m4=;
 b=M/Tjz45NOZlupJFcynPLNn2xkiX6rdoDdZPQ2L8jwhxsaWVWNE+18bTP
 hBuKSI2WoZuhPfVtDS8ZAv3z6QKEDKaeDWurkjtwpvK97YMMRlnS1s+vM
 5Q1N+pouydrrq6y2xibBffSsNW2NDGSf7vmA/UBbXv+TbGJi1IjWeXdwx U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EKu8ZImCF3nFbwNS64XopW8AVXuVnC+aBrx8EODBWfsnZeqQ6rmWePstkU8Mq5A4+2lGWXnR/v
 /5E4dZDquyd19hoLD2wwXUdl510KA48SXGBemrIGhFnuO4OYAmJwZ+CTxTlm8yJsspKfluaOTS
 I/m+FlUosxMtagHL4k19OlDfY5W3EjoD0kONvGOHS5vVugmAT1iwK6d6TP4VKzpyT7P+ViDML5
 A9avXKv7Fd5llHcxMaEath0t8hXf/2Q3xhfXArPk1v8JO2/kTkf1EYUBPFWbEMgIfBCOPgC3ge
 F2Y=
X-SBRS: 2.7
X-MesageID: 23685490
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23685490"
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <20200727145526.GR7191@Air-de-Roger>
 <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <868f864b-ae8e-0b01-8cf0-74a0fd3982ee@citrix.com>
Date: Tue, 28 Jul 2020 14:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/07/2020 20:47, Jan Beulich wrote:
> On 27.07.2020 16:55, Roger Pau Monné wrote:
>> On Wed, Jul 15, 2020 at 12:48:14PM +0200, Jan Beulich wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-x86/asm-defns.h
>>
>> Maybe this could be asm-insn.h or a different name? I find it
>> confusing to have asm-defns.h and an asm_defs.h.
>
> While indeed I anticipated a reply to this effect, I don't consider
> asm-insn.h or asm-macros.h suitable: We don't want to limit this
> header to a more narrow purpose than "all sorts of definition", I
> don't think. Hence I chose that name despite its similarity to the
> C header's one.

Roger is correct.  Having asm-defns.h and asm_defs.h is too confusing,
and there is already too much behind the scenes magic here.

What is the anticipated end result, file wise, because that might
highlight a better way forward.

~Andrew


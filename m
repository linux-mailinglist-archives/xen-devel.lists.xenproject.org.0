Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5923DBF8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 18:40:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3iwR-0001fS-PQ; Thu, 06 Aug 2020 16:40:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3iwQ-0001fN-Ml
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 16:40:30 +0000
X-Inumbo-ID: 97cc05d9-200d-4892-9751-66741e1923e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97cc05d9-200d-4892-9751-66741e1923e4;
 Thu, 06 Aug 2020 16:40:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81D1CB734;
 Thu,  6 Aug 2020 16:40:44 +0000 (UTC)
Subject: Re: EFI executable corruption when live patching is turned off
To: Trammell Hudson <hudson@trmm.net>
References: <3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a72c87a1-c725-04d0-2b1c-4092c4170a34@suse.com>
Date: Thu, 6 Aug 2020 18:40:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.08.2020 20:19, Trammell Hudson wrote:
> When building xen from head with almost any combination of options, the resulting xen.efi seems properly formed. When CONFIG_LIVEPATCH is turned off, however, the resulting xen.efi is corrupted in some way and binutils no longer wants to work with it:
> 
> ~/build/xen-clean/xen$ git rev-parse HEAD
> 81fd0d3ca4b2cd309403c6e8da662c325dd35750
> ~/build/xen-clean/xen$ diff .config.orig .config
> 71,72c71
> < CONFIG_LIVEPATCH=y
> < CONFIG_FAST_SYMBOL_LOOKUP=y
> ---
>> # CONFIG_LIVEPATCH is not set
> 105a105
>> # CONFIG_COVERAGE is not set
> ~/build/xen-clean/xen$ objcopy xen-orig.efi test.efi
> ~/build/xen-clean/xen$ objcopy xen.efi test.efi
> objcopy: test.efi: Data Directory size (1c) exceeds space left in section (18)
> objcopy: test.efi: error copying private BFD data: file in wrong format
> ~/build/xen-clean/xen$ objcopy --version | head -1
> GNU objcopy (GNU Binutils for Ubuntu) 2.34
> 
> 
> I spent most of today unsuccessfully trying to figure out what was different between the builds (on multiple build host OS with different binutils), so I'm hoping that perhaps someone else has seen this problem.

I've tried to find a sensible way to fix this in objcopy, but could
come up with only a somewhat hackish variant:
https://sourceware.org/pipermail/binutils/2020-August/112746.html
Let's see what the maintainers there think, or if they have better
suggestions (or are willing to address this themselves). The issue
is pretty certainly not tied to LIVEPATCH, but rather to how much
padding space there is at the end of the .rodata section.

Jan


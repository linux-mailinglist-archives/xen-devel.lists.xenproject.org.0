Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422E41D106B
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 13:01:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYp8Z-0000Vg-BH; Wed, 13 May 2020 11:01:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYp8X-0000Vb-KR
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 11:01:17 +0000
X-Inumbo-ID: 10c6498c-9509-11ea-a353-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10c6498c-9509-11ea-a353-12813bfff9fa;
 Wed, 13 May 2020 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589367676;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CzknWRp/eE8EiDmjOjPFiq/naD4x0PUIefks06Zyxs0=;
 b=iPs4NYKGA8DGs6fVU7JYHIMycdJKZ14rp/6SIveoC6+dshwpl3nGSZK6
 e3sAtUToqqzsuJ9jIZMp3gwUJ2kclCxJftuW6TC+b3mZ/PlI0GPxSKfJ8
 /t2cjhOLKEQjp0Ctr5ntismq+nePHZ7QwkMH68gAL1LmPCBynSFMv5cNI Q=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 9dkxv8eXgsEB8EJbELdPRjgMvApa7EX+GXEz+CbiXxb0AXVNJhxzFubgNC2cYwR1AeSKzjCzet
 lMLS4KYoYyGf037mGBQG+Xt+H1BXhCvRSH/yLRWowkdyifj+BQuFBZSDkhZeb5VscVslDyAZH0
 0RHC3FDzGZNh9YyroxjqWd33hQW0jlTKr0fEtjGEbY8OTFl1pjRGpBrxkiuBwDB65R9SFAXCdr
 lnLJRcBl/xYNtcQ9mjg0VryBQOHrOfhVrJcSuEGtp5BMCFm3D7bSsTTBwEv9wONdq0ZSh0k6K8
 VDM=
X-SBRS: 2.7
X-MesageID: 17671904
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="17671904"
Subject: Re: [PATCH] x86/build: Unilaterally disable -fcf-protection
To: Jason Andryuk <jandryuk@gmail.com>
References: <20200512191116.6851-1-andrew.cooper3@citrix.com>
 <CAKf6xpt-WLVOTaca_FncB4XX0PQ2ZbP6GFWQjinAYex=6mptRA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6b7871d8-903a-20df-4e19-9a6200094aa5@citrix.com>
Date: Wed, 13 May 2020 12:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpt-WLVOTaca_FncB4XX0PQ2ZbP6GFWQjinAYex=6mptRA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Stefan Bader <stefan.bader@canonical.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13/05/2020 03:35, Jason Andryuk wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On Tue, May 12, 2020 at 3:11 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> See comment for details.  Works around a GCC-9 bug which breaks the build on
>> Ubuntu.
>>
>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>
>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>> index 2a51553edb..93e30e4bea 100644
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -67,6 +67,15 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
>>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
>>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
>>
>> +# Xen doesn't support CET-IBT yet.  At a minimum, logic is required to
>> +# enable it for supervisor use, but the Livepatch functionality needs
>> +# to learn not to overwrite ENDBR64 instructions.
> Is the problem that existing functions start with ENDBR64, but the
> livepatch overwrites with a "real" instruction?

We livepatch by creating a new complete copy of the function, and
putting `jmp new` at the head of the old one.

This means we don't need to patch every callsite and track every
function pointer to the old function, and we can fully revert by
replacing the 5 bytes which became `jmp new`.

With CET-IBT in the mix, livepatch will have to learn to spot an ENDBR64
instruction and leave it intact, patching instead the next 5 bytes, so
an old function pointer still lands on the ENDBR64 instruction.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755BA1B6407
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 20:50:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRguh-0004oz-F3; Thu, 23 Apr 2020 18:49:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhWH=6H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jRgug-0004ou-9s
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 18:49:30 +0000
X-Inumbo-ID: 28c4a1b3-8593-11ea-93f5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28c4a1b3-8593-11ea-93f5-12813bfff9fa;
 Thu, 23 Apr 2020 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587667768;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kk5X5yCTAXbomXGohlK0iF7kF+m+7o5Mk6x6xfWmjXk=;
 b=DsgbpK2pCsgR8wnkdgFT8iSG07oDVow4gGN8HXCAwCOzADXrTM1/sUXQ
 vxWip3OuuA1ZDnR6wY1/qK6nNYwo6MlAgYXtc6LtYdpNdqpEjfNkFjOSP
 3jtOt0VIOJvR1cqHeXJzbVXOqJ8W3EbAiCpU6QPwV6baBQRPnN5ghpI6E 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VfkqWQa4mK5hwnHpwUYKZ9m2V1rQyzHWF3XMO5LpZS8R40/GN4bu21d32urIPGLrbpMrVvgclZ
 NEzLkzg07utyMySx3YTkjBYp/MS+989Lzx61CXAzO5xXk0FcHVFGum6kDvuKEGtN4V7/p1uwE7
 SXwxpC4UrEd2PEsosZaobcnAA0r7xKEn0GrWAJcr53HWEdbfhFuFwFua4O1xQX9pXKOYJjx60G
 8K/uV8v1soaxQjyGf+gVqOj4OXCJaoz7hpraSCrcOSJfiQC5lHFWoXrc40OgiQ0HfBKVBPDNNX
 rHk=
X-SBRS: 2.7
X-MesageID: 16836228
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16836228"
Subject: Re: [PATCH 3/3] x86/pv: Don't use IST for NMI/#MC/#DB in !CONFIG_PV
 builds
To: Jan Beulich <jbeulich@suse.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-4-andrew.cooper3@citrix.com>
 <08a798db-3126-7ccd-17f3-476607cc9e45@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <76fa899a-2b35-8ea9-159e-c9e3dcf88f53@citrix.com>
Date: Thu, 23 Apr 2020 19:49:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <08a798db-3126-7ccd-17f3-476607cc9e45@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/04/2020 08:48, Jan Beulich wrote:
> On 20.04.2020 16:59, Andrew Cooper wrote:
>> --- a/xen/include/asm-x86/processor.h
>> +++ b/xen/include/asm-x86/processor.h
>> @@ -441,12 +441,18 @@ struct tss_page {
>>  };
>>  DECLARE_PER_CPU(struct tss_page, tss_page);
>>  
>> +/*
>> + * Interrupt Stack Tables.  Used to force a stack switch on a CPL0=>0
>> + * interrupt/exception.  #DF uses IST all the time to detect stack overflows
>> + * cleanly.  NMI/#MC/#DB only need IST to cover the SYSCALL gap, and therefore
>> + * only necessary with PV guests.
>> + */
> Is it really only the SYSCALL gap that we mean to cover? In particular
> for #MC I'd suspect it is a good idea to switch stacks as well, to get
> onto a distinct memory page in case the #MC was stack related.

If #MC occurs on your stack, you have already lost.  The chances of only
taking a single #MC are tiny because the next-line prefetcher will be
doing its job (or it hits when the lines (plural) leave L3, which will
be in guest context at some point in the future.)

The very best you can hope for is to cleanly print something and crash -
even if you manage to run the handler, you've got no idea if the
interrupted context had a spinlock held, and Xen has no support for
changing to a different pcpu stack.

> With NMI it might as well be better to switch;

Why?  There is no benefit (with no SYSCALL in the picture), and a
downside which causes state loss.

>  I agree we don't need any
> switching for #DB.
>
> I also think that the comment at the top of current.h would want
> updating with these adjustments (which I notice lacks the #DB part
> anyway).

Oops - I totally forgot that for the XSA-260 fix.

~Andrew


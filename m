Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38061CDE98
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 17:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYA8Q-00063g-6P; Mon, 11 May 2020 15:14:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYA8P-00063b-0J
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:14:25 +0000
X-Inumbo-ID: 1526cc6a-939a-11ea-a220-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1526cc6a-939a-11ea-a220-12813bfff9fa;
 Mon, 11 May 2020 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589210058;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cBoJjXNcGsJM3sNnjSrX0FAbDNhV28QazThYh4TVWgc=;
 b=cvDNODAKfycTvyOYEbcsK9gyLBpMC51UQvoE40NHsUNj+tW6pwIXgUCW
 aEFaAc5iuPcD9IHL30PyCo3MV5wpAZlgDbMMzC4P8fQph8TfHon2QRef9
 9xy6P1FqeGToYBmTT8Bgucz8ER1Y9k5YEvSECRVqs0/V2C9dAJdUdz4k5 U=;
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
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: QlRPeFKfIjG2IYWfHN+UABObrvWpsVU5fsIZ54bWHxMRrHToobl1kpaKvzvsLSHIPeLjIpGTyr
 KlEvbqdFAdJQcyOjEJSyZvdDW8vnFsfcwSx22/4Td5Yvp43k/ZoBFAn/7spNzj/cjNBlgd9X3/
 K1XGDX936/fNeiaZonwTpBBsLnG+5gNZq+gYBgynmQ2acdmHggaYVLHjAZrwAKX/FzZN46Muqk
 JbhAwm5GhUSOhcTUCKOzLHGBsI8InCmOUbJQUWrugUIp6rOmPUvaU79jld049+J6WoBMqFa0hR
 LwI=
X-SBRS: 2.7
X-MesageID: 17917240
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17917240"
Subject: Re: [PATCH 03/16] x86/traps: Factor out exception_fixup() and make
 printing consistent
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-4-andrew.cooper3@citrix.com>
 <f7cb696a-5c2c-4aa6-d379-ed77772b7c35@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a397dd69-2384-a4af-d127-9189a730a554@citrix.com>
Date: Mon, 11 May 2020 16:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f7cb696a-5c2c-4aa6-d379-ed77772b7c35@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/05/2020 14:20, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -774,10 +774,27 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>>            trapnr, vec_name(trapnr), regs->error_code);
>>  }
>>  
>> +static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>> +{
>> +    unsigned long fixup = search_exception_table(regs);
>> +
>> +    if ( unlikely(fixup == 0) )
>> +        return false;
>> +
>> +    /* Can currently be triggered by guests.  Make sure we ratelimit. */
>> +    if ( IS_ENABLED(CONFIG_DEBUG) && print )
> I didn't think we consider dprintk()-s a possible security issue.
> Why would we consider so a printk() hidden behind
> IS_ENABLED(CONFIG_DEBUG)? IOW I think one of XENLOG_GUEST and
> IS_ENABLED(CONFIG_DEBUG) wants dropping.

Who said anything about a security issue?

I'm deliberately not using dprintk() for the reasons explained in the
commit message, so IS_ENABLED(CONFIG_DEBUG) is to cover that.

XENLOG_GUEST is because everything (other than the boot path) hitting
this caused directly by a guest action, and needs rate-limiting.  This
was not consistent before.

>
>> @@ -1466,12 +1468,11 @@ void do_page_fault(struct cpu_user_regs *regs)
>>          if ( pf_type != real_fault )
>>              return;
>>  
>> -        if ( likely((fixup = search_exception_table(regs)) != 0) )
>> +        if ( likely(exception_fixup(regs, false)) )
>>          {
>>              perfc_incr(copy_user_faults);
>>              if ( unlikely(regs->error_code & PFEC_reserved_bit) )
>>                  reserved_bit_page_fault(addr, regs);
>> -            regs->rip = fixup;
> I'm afraid this modification can't validly be pulled ahead -
> show_execution_state(), as called from reserved_bit_page_fault(),
> wants to / should print the original RIP, not the fixed up one.

This path is bogus to begin with.  Any RSVD pagefault (other than the
Shadow MMIO fastpath, handled earlier) is a bug in Xen and should be
fatal rather than just a warning on extable-tagged instructions.

Amongst other things, it would consistent an L1TF-vulnerable gadget. 
The MMIO fastpath is only safe-ish because it also inverts the upper
address bits.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910526D6B5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 10:34:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIpMf-0005V5-Pl; Thu, 17 Sep 2020 08:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7l8=C2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIpMd-0005V0-Tp
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 08:33:59 +0000
X-Inumbo-ID: ebc14c5f-0c85-414b-82ae-5e8659a03a2b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebc14c5f-0c85-414b-82ae-5e8659a03a2b;
 Thu, 17 Sep 2020 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600331637;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YKuElzbnOyoAsz6TqklmRVrr6EVAqGK8dEZgpJDrqVk=;
 b=gQpF5inND8O3T+YfZTFlBYKs0ffvAT+8B9wuc7TlRhXgU93yB4q368oG
 VCUMHcqno/MHN68SuQMRb+5XH6Eag4xsCWaN9yFntxvGI80GZhFH8Ndb9
 0cHrjJ+hYvHlsUPnUCZtaKQQU3ih7APunZZMmO3V8k/qGrts6iH4qkEiH g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: L4OmU285etm4im+ZsinrGkb7LJXc9tA0xeg0osJKXynL6gCsQAlkCKbEoWubgAF+ugZ0uxi72p
 9t3jMaGfF2UgPzXRz7vL6pyIxRkz1lM24etVfzEO6AZUeEzjCi4HksO5Pu7wiaJG5shrP6lrLM
 xUJXXpfNNXlGV7obYXGEt/AnGypeuBzQshAs3Kr8CJkv9/JicXLkB/YR5pAe4SZ/y2dcMOybOb
 TCobSVJ5fSS8fO+sY3xEtynd8MSBeg0Q2eeGD28K9nvIE67nwlWk68d0A5CGoLQjVSLlWr6f3e
 1qU=
X-SBRS: 2.7
X-MesageID: 27199910
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,436,1592884800"; d="scan'208";a="27199910"
Date: Thu, 17 Sep 2020 10:33:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/svm: ignore accesses to EX_CFG
Message-ID: <20200917083345.GA19254@Air-de-Roger>
References: <20200916105426.6663-1-roger.pau@citrix.com>
 <0a55eeb7-a5bf-8c9c-80e3-d697d029e7ce@suse.com>
 <20200916130439.GV753@Air-de-Roger>
 <33778785-830b-af08-ec64-4a08db92e693@suse.com>
 <20200916135343.GW753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200916135343.GW753@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Wed, Sep 16, 2020 at 03:53:43PM +0200, Roger Pau Monné wrote:
> On Wed, Sep 16, 2020 at 03:28:28PM +0200, Jan Beulich wrote:
> > On 16.09.2020 15:04, Roger Pau Monné wrote:
> > > On Wed, Sep 16, 2020 at 02:55:52PM +0200, Jan Beulich wrote:
> > >> On 16.09.2020 12:54, Roger Pau Monne wrote:
> > >>> Windows 10 will try to unconditionally read EX_CFG on AMD hadrware,
> > >>> and injecting a #GP fault will result in a panic:
> > >>>
> > >>> svm.c:1964:d5v0 RDMSR 0xc001102c unimplemented
> > >>> d5v0 VIRIDIAN CRASH: 7e ffffffffc0000096 fffff8054cbe5ffe fffffa0837a066e8 fffffa0837a05f30
> > >>>
> > >>> Return 0 when trying to read the MSR and drop writes.
> > >>
> > >> So I've gone through a bunch of BKDGs and PPRs, without finding
> > >> this MSR mentioned in any of them. Could you point out on which
> > >> model(s) it actually exists? You must have found it somewhere,
> > >> or else you wouldn't know a name for it...
> > > 
> > > Yes, sorry it took me a while to find it also, and I should have added
> > > a reference here. It's in "BIOS and Kernel Developer’s Guide (BKDG)
> > > for AMD Family 15h Models 00h-0Fh Processors", albeit Windows will try
> > > to access it on Family 17h also.
> > 
> > Ah, and it's exclusively this one as it seems. The models 1xh one
> > again doesn't have it.
> > 
> > >>> @@ -2108,6 +2109,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
> > >>>      case MSR_K8_TOP_MEM2:
> > >>>      case MSR_K8_SYSCFG:
> > >>>      case MSR_K8_VM_CR:
> > >>> +    case MSR_AMD64_EX_CFG:
> > >>>          /* ignore write. handle all bits as read-only. */
> > >>>          break;
> > >>
> > >> Is this necessary, rather than having writes fault?
> > > 
> > > Hm, I'm not sure about that. This is the same that KVM did to handle
> > > the MSR, see Linux commit 0e1b869fff60c81b510c2d00602d778f8f59dd9a.
> > 
> > Looking at the sole bit that's defined there, I agree the main reason
> > for Win10 to read it would look to be to potentially also write it if
> > it finds certain bits unset. If so, perhaps we want to consider to
> > report a value with this/these bit(s) set?
> 
> So the manual only reports the meaning of bit 54, yet my EPYC system
> reports 0x0168000000000000.
> 
> > > I can try to return #GP for writes, but I don't see much issue in just
> > > ignoring writes.
> > 
> > The reason for me asking is that I'd prefer if we didn't grow an
> > endless list of exceptions for no reason. In fact I wonder whether
> > some MSRs that we currently ignore writes for couldn't be dropped.
> 
> Let me see if I can make Windows happy by returning either bit 54 as 0
> or 1, but given the value on bare metal I'm worried that Windows has
> more insight on this value than just bit 54.

So I've tried reporting bit 54 set on rdmsr, and #GP on writes, and
Windows 10 will try to write to the MSR to set additional bits:

(XEN) svm.c:2155:d1v0 WRMSR 0xc001102c val 0x0048000000000000 unimplemented

So without knowing why Windows is trying to set some hidden bits there
I think the best option ATM is to return 0 from reads and ignore
writes (like the current patch).

Trying to report a value that would make Windows happy seems fragile,
as information about the meaning of bits on the MSR isn't public, so
it's likely to get out of sync.

Thanks, Roger.


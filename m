Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D265192676
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 12:01:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3kn-00063k-KT; Wed, 25 Mar 2020 10:59:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ak69=5K=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jH3km-00063f-IO
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:59:20 +0000
X-Inumbo-ID: ad3cedb4-6e87-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad3cedb4-6e87-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 10:59:19 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id de14so1782031edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=bU2Ct0niDTHtWdJ+4wnqlO1P+0vpmPlXj50bcwjZAj4=;
 b=K1WglUZ6muJ0ce0OXre9FDyLD8kWZ4Hf3NzzfnFTXToIziiDdGEqCdjEHRyUj4Ucyt
 D8MPHNXt1SnWGrHNacjhmTUgJwCkcg1Ig1XuRzwHKxDegBuOaA9l4FmVsuDFAmFxm1Yj
 G7vUlSgviyPiy5RfDzk+fiVxY4iMLWUvuzMDCw3Zc2GxR4POG7uYkdIB1UEHq7fYwakf
 ZVJ1mqyVYswSY/mc1ts1lhLWSye/HHKTPO4hJKP1ImvgrGINDaiKkWntmgBWtG/tlCck
 E8l3btdPZo51yAykoOpfb2YzCyO9HbzXQ2BFbx5046IFJDIoqA7SMVybpQH4uam50xnH
 1oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=bU2Ct0niDTHtWdJ+4wnqlO1P+0vpmPlXj50bcwjZAj4=;
 b=pdTZGiKItfniYCRqFKTeiuVl9YeTIpXXHfNvBSub7wozG/PW7bxyYCWxK5SacJvllW
 XC29SiubyLblMEVzTY/Ofx26LneaUMwW/9WVJpEh7wcEnVRKVfkTpq+/HlHMY2fHebhL
 Yutat9QxqsZfQZnLEXZ0LxnmuiVUJp+kqLcFG7PkXXUJmpF6jJVYQWDKqSy1ZID96bHF
 tQ++tIe+DieeRbcXFhR7yHXKKCOD2i4bwAI6sQaoxM+MPA3AgBDMoJOYPO+AgkRDHefb
 KuYxhMv4Lnmco3hlARgai6WzCtjapET9e+TKon6zLDMSc/kp9uSOs+ystmihgUt6mK+k
 cSwg==
X-Gm-Message-State: ANhLgQ3OUtwXuEzNXSoEUcX9neX0M9kS8km+kIkUDJ7d/gMUqZTa9mGS
 /UF9uNTSpww/kOQJ9wVf6l4=
X-Google-Smtp-Source: ADFU+vtdG4h35swg1P8NMBxoaC/qVF4/iwPcJKcRl+q02MRN6bota6tcZoKE2b+YYdo5U1PaO3RaXQ==
X-Received: by 2002:a05:6402:519:: with SMTP id
 m25mr2155889edv.302.1585133959081; 
 Wed, 25 Mar 2020 03:59:19 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.188])
 by smtp.gmail.com with ESMTPSA id b15sm1537944edn.69.2020.03.25.03.59.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 03:59:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <fba4f9c6-5bbd-21d9-3912-328c6c6cc389@suse.com>
In-Reply-To: <fba4f9c6-5bbd-21d9-3912-328c6c6cc389@suse.com>
Date: Wed, 25 Mar 2020 10:59:17 -0000
Message-ID: <00c101d60294$6e688fd0$4b39af70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJMIcItOEpMp4KkwcF5X4XGaZOQiwJ4Jx8+p1kjv/A=
Subject: Re: [Xen-devel] [PATCH v5 00/10] x86emul: further work
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 24 March 2020 12:43
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant <paul@xen.org>; Wei Liu <wl@xen.org>;
> Roger Pau Monne <roger.pau@citrix.com>
> Subject: Re: [PATCH v5 00/10] x86emul: further work
> 
> Paul,On 24.03.2020 13:26, Jan Beulich wrote:
> > Some of the later patches are still at least partly RFC, for
> > varying reasons (see there). I'd appreciate though if at least
> > some of the earlier ones could go in rather sooner than later.
> >
> > Patch 1 functionally (for the test harness) depends on
> > "libx86/CPUID: fix (not just) leaf 7 processing", while at
> > least patch 2 contextually depends on "x86emul: disable
> > FPU/MMX/SIMD insn emulation when !HVM".
> >
> >  1: x86emul: support AVX512_BF16 insns
> 
> I should note that I also have a VP2INTERSECT patch ready, but the
> just released SDE segfaults when trying to test it. I'll be holding
> this back for some more time, I guess.
> 
> >  2: x86emul: support MOVDIRI insn
> >  3: x86: determine HAVE_AS_* just once
> >  4: x86: move back clang no integrated assembler tests
> >  5: x86emul: support MOVDIR64B insn
> >  6: x86emul: support ENQCMD insn
> >  7: x86/HVM: scale MPERF values reported to guests (on AMD)
> >  8: x86emul: support RDPRU
> >  9: x86/HVM: don't needlessly intercept APERF/MPERF/TSC MSR reads
> > 10: x86emul: support MCOMMIT
> 
> Paul, I should also note that I mistakenly Cc-ed your old Citrix
> address. I'd like to avoid re-posting the series - do you perhaps
> nevertheless get the xen-devel copies?
> 

Yeah I have them. My filters just moved them into my general 'xen' mailbox but I got them.

  Paul

> Jan



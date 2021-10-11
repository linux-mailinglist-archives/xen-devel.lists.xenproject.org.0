Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A1428F69
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206037.361497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvo7-0004aC-R9; Mon, 11 Oct 2021 13:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206037.361497; Mon, 11 Oct 2021 13:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvo7-0004Xs-MY; Mon, 11 Oct 2021 13:57:35 +0000
Received: by outflank-mailman (input) for mailman id 206037;
 Mon, 11 Oct 2021 13:57:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZvo5-0004Xg-P7
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:57:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dfaa331-2a9b-11ec-80dd-12813bfff9fa;
 Mon, 11 Oct 2021 13:57:32 +0000 (UTC)
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
X-Inumbo-ID: 2dfaa331-2a9b-11ec-80dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633960652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m4JmGSHnjUE9wVUM9KfqBA9lRy8EvSMhBMK2Cn3fR7c=;
  b=ISLnSEu4ID+x8u/wx//LYymEzAP00+9l8gzZoslQQQTB69Uz7REkMM2P
   ezD4aPXUPJdzvSmSZtCVrpv0zsDm4JEKlApZ7b69b85sRU3FSns0q9fxU
   lG8TVDchGMTMVjGF7lgBjsFxGqqY234mTlYR2ttr8hszWSRsbFNYla1ld
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0FYsQRq4mrxEbaELJzw6eZQpr0MaYYITmMWY+gI02W7NXPBjtjKSBrdGj2gtuaGifN4xIrM5z3
 wv38rOBZDWupKmZpdYjctW0mLDdVkco67sd10DW9xW9/0fI0/Zg0ad/eRVeqichFgmxKg9VViS
 0GKnUs/2qcXVpGgPwBumDr2Y5tQ+EqEpFtwskQ2/7A4DKkfZt+pTmMcbtdrXdQ+aYkntyAt6MY
 f343qnCHqxX+2EuZCQtEnLrObslKz/VKfs6gXYFqwmIh3e320PxhwhsE2TuTi68sBIqxhk1tL7
 s/VHyPKshq7OI1N0t3snWudr
X-SBRS: 5.1
X-MesageID: 54880359
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:c2u4+axxT5gTBboNeIN6t+efwCrEfRIJ4+MujC+fZmUNrF6WrkUDn
 2scXWnXMqmPZ2Onfoh+bYiwpkpXvJDUyd4ySAc+qyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/0o+
 ethnpiTcERzYbPRgsgzXlpFLj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25weTa6FO
 ptxhTxHXhXMXzNsKnktJo8e2931hH78LjFlkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKobFaax9/pjqFeS2mAeBhAQWVah5/K+jyaWR9taI
 lc85ikqoK495UGvCNL6WnWQomOAvxMac8pdFas98g7l4q7J4A+CFC4ERyFbedgls+cyRDo3x
 hmImc/kAXpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LEbG3ps34Hynqx
 DKHpzR4gK8c5eYT3ri/1UDKhXSrvJehZgwo4EPRV2Gs7AJ8baakYZCl7R7Q6vMoBI2eSF+Gv
 nQNhcmFxO8LBJCJ0ieKRY0lHruk+vKEOz30mkN0Et8q8DHF032uY4FWpi1/LUFBM8AYdDuva
 0jW0StY4J5IIHKrd+l5eYu3AMUx5bfsHpLuUfW8RuRJZp99ZQqW5hZEbESb333uuEU0mKR5M
 pCeGe60FXcAAq1jxTCrb+0czbMmyC04yW7JA5v8ynyP272Ubm+YUrcBPV6HaMg26aqFpEPe9
 NM3H8iNzQ9WXKvhYy3U2YkJJFsOID4wApWeliBMXrfdeEw8QjhnUqKPh+N6E2B4o0hLvsqRz
 0+RcUt78Rml2mPaMymkZzN+Vay6CP6TskkHFSArOF+p3V0qboCu8LoTevMLQFU3yABw5aUrF
 6ddKq1sFtwKE26do21MMvERuaQ7LEzz7T9iKRZJd9TWk3RIfAfO5sP/NjXm8C0DH0JbXuNv/
 uX+iGs3rXcFLjmO7fo6itrznztdXlBHwYqeunckxPEJJS0AF6AwekTMYgcfeZ1kFPk67mLyO
 /yqKRkZv/LRhIQ+7cPEg6uJx6/wTbAlThsCQDCCsejtXcU/woZF6dQaOApvVWqMPF4YBY34P
 bkFpx0CGKxvcKl2X3pUTO8wkPNWCyrHrL5G1AV0dEgnnHzwYo6M1kKuhJEV3oUUn+cxkVLvB
 iqnp4kLUZ3UaZiNOANAe2IYghGriKh8ds/6tq9ufi0XJUZfodK6bKmlF0DU0nICd+EpbNpNL
 CVIkJd+1jFTQyECar6u5h24PUzXRpDZe6l45JwcHqHxjQ8nlgNLbZDGU3ek65CTcdRcdEItJ
 2bM1qbFgr1dwGvEcmYySieRjbYM28xWtUAY1kIGKnSIhsHB2q090ipO/GllVQ9S1BhGjb5+Y
 zA5K01vKKyS1D50n8wfDXu0EgRMCUTBqEz8wlcEjkPDSEysWjCfJWExI7/VrksY73hdbn5Q+
 7TBkDTpVjPjfcfQ2CouWBE696y/HIIprgCbwZKpBcWIGZU+cAHJuK72aDpasQbjDOMwmFbD+
 btg8tFvZPCpLiUXuaA6VdWXjOxCVBCeKWVeavh956dVT3rEcTS/1DXSeUC8fsRBe67D/UOiU
 pE8I8tOU1K11TqUryBdDqkJeucmkPks7dsEW7XqOW9Z7OfP8ms36MrdpnrkmWsmY9RyisJse
 IreegWLHnGUmXYJyXTGq9NJOzbgbNQJDOEmMDtZLAnd+0o/jdxR
IronPort-HdrOrdr: A9a23:DzMfjKhlNt9cuhrq/fhnisfsXnBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54880359"
Date: Mon, 11 Oct 2021 14:57:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Lukasz Hawrylko
	<lukasz.hawrylko@linux.intel.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 14/51] xen: move include/asm-* to
 arch/*/include/asm
Message-ID: <YWRCumOjPlYD1sE6@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-15-anthony.perard@citrix.com>
 <320e5dde-2017-2420-8323-cbe4c2f0914f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <320e5dde-2017-2420-8323-cbe4c2f0914f@suse.com>

On Thu, Oct 07, 2021 at 04:17:28PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > --- a/tools/include/Makefile
> > +++ b/tools/include/Makefile
> > @@ -30,7 +30,7 @@ xen-dir:
> >  	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
> >  	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/
> >  ifeq ($(CONFIG_X86),y)
> > -	ln -s $(XEN_ROOT)/xen/include/asm-x86 xen/asm
> > +	ln -s $(XEN_ROOT)/xen/arch/x86/include/asm xen/asm
> 
> I think this would now better be
> 
> 	ln -s $(XEN_ROOT)/xen/arch/x86/include/asm xen/
> 
> matching what is visible in context.

I'll change it.

> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -12,3 +12,4 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
> >  
> >  CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> >  CFLAGS += -I$(BASEDIR)/include
> > +CFLAGS += -I$(BASEDIR)/arch/$(TARGET_ARCH)/include
> 
> I find it odd that this needed repeating in every arch.mk. Can't
> this be done once for all arches?

I actually do that much later in the series with patch "build: Add
headers path to CFLAGS once for all archs".

> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -241,7 +241,7 @@ PAGE_LIST_HEAD(page_broken_list);
> >  
> >  /*
> >   * first_valid_mfn is exported because it is use in ARM specific NUMA
> > - * helpers. See comment in asm-arm/numa.h.
> > + * helpers. See comment in asm/numa.h.
> >   */
> >  mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
> 
> I'm afraid that in this case it is relevant that it's Arm's header,
> like ...

Will fix.

Thanks,

-- 
Anthony PERARD


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904F1AACEF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 18:07:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOkYT-0003bx-IY; Wed, 15 Apr 2020 16:06:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NCA0=57=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jOkYS-0003bs-7Z
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 16:06:24 +0000
X-Inumbo-ID: 0b70c143-7f33-11ea-8a8b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b70c143-7f33-11ea-8a8b-12813bfff9fa;
 Wed, 15 Apr 2020 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586966782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3RF1qwsYl1fvOhYvwlgKda5DNYFTm0l7l3nQGW+RA+k=;
 b=XLEO7fY53gjxJoQoiQDSbRUEBGpItNk9J0HgdMlWqVr+OycUHtSr0jh3
 zqMoLaKiIC0Ta98tYq7cVwS3a+Fb/Qv95dAnfegW2s1aushypNhAH99qI
 Loitja7lYXQuj5houpxWXHitx5lAp8tFjxFpCs3CtP93CrJ6fdeflpK14 U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ml+gMtIUlb+7yti7C2VsiGKIzJH8RWmiDnVgfMdffdHsT61j7dQRo6TmDPLMrf4iaqEFaHjNHh
 +zWgIsbZWk+2dsK62bv6zVCD93IgT52RfH/ssNtWjqkU8EACJW/lnqXIliU9zcqwWOI86FuM6z
 lxEqvd4mOGmwpX3D8ksvP5AmU3+gb7v67GdoZaPraTax94zh3NMtgHKtUce8FLwQBkzaPxPuZf
 vvPNJZSFH00iYK+FJCs7BB9ZbQHpuExhyV4G22EgZQxaQAl+pHGete9zIvhPDn/4U8r3rIyvHH
 zUs=
X-SBRS: 2.7
X-MesageID: 15966399
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="15966399"
Date: Wed, 15 Apr 2020 17:06:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 10/18] xen/build: use if_changed on built_in.o
Message-ID: <20200415160615.GD4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-11-anthony.perard@citrix.com>
 <072ffe9d-88c0-144f-a9ab-c83869ad34e2@suse.com>
 <71ee52de-af4a-2b1b-4080-d42af6ac6399@citrix.com>
 <03b74c20-54bb-06dd-8020-16da4b3bf521@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <03b74c20-54bb-06dd-8020-16da4b3bf521@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 03:35:17PM +0200, Jan Beulich wrote:
> On 08.04.2020 15:13, Andrew Cooper wrote:
> > On 08/04/2020 13:40, Jan Beulich wrote:
> >> On 31.03.2020 12:30, Anthony PERARD wrote:
> >>> --- a/xen/Rules.mk
> >>> +++ b/xen/Rules.mk
> >>> @@ -130,15 +130,24 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
> >>>  c_flags += $(CFLAGS-y)
> >>>  a_flags += $(CFLAGS-y) $(AFLAGS-y)
> >>>  
> >>> -built_in.o: $(obj-y) $(extra-y)
> >>> -ifeq ($(obj-y),)
> >>> -	$(CC) $(c_flags) -c -x c /dev/null -o $@
> >>> -else
> >>> +quiet_cmd_ld_builtin = LD      $@
> >>>  ifeq ($(CONFIG_LTO),y)
> >>> -	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
> >>> +cmd_ld_builtin = \
> >>> +    $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
> >>>  else
> >>> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
> >>> +cmd_ld_builtin = \
> >>> +    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
> >>>  endif
> >> How about going yet one step further and doing away with the
> >> ifeq here altogether:
> >>
> >> cmd_ld_builtin-y = \
> >>     $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
> >> cmd_ld_builtin-$(CONFIG_LTO) = \
> >>     $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
> > 
> > Please don't.
> > 
> > Logic like this is substantially harder to follow than a plain if/else
> > construct, and clarity is of far higher importance than optimising the
> > line count in the build system.
> 
> I could maybe see the argument if the two definitions were far apart.
> This suggestion isn't about line count at all, but about clarity. In
> particular because of the need to use ifeq(,) rather than simple "if"
> constructs, I view this list model as the better alternative in all
> cases where it can be made use of.

We could use "ifdef CONFIG_LTO" to avoid ifeq ;-). But I think you
disliked that because CONFIG_LTO could be present in the environment
with a value different than "y" and mess up the build system, just to
annoy us.

> > This trick only works for trivial cases, and interferes with diff's when
> > the logic inevitably becomes less trivial.
> 
> It may, but whether it actually will can't be known until such time
> as it would get touched. The suggested model may very well also be
> suitable then.
> 
> Anyway, Anthony, I'm not going to insist. This is just another aspect
> where we would better generally settle on the preferred style to use.

I think if/else is better for alternatives. And we can keep "var-y" for
lists with optional items.

Thanks,

-- 
Anthony PERARD


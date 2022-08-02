Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75263587D38
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379328.612696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIs4S-0004tY-TL; Tue, 02 Aug 2022 13:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379328.612696; Tue, 02 Aug 2022 13:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIs4S-0004rL-PR; Tue, 02 Aug 2022 13:36:28 +0000
Received: by outflank-mailman (input) for mailman id 379328;
 Tue, 02 Aug 2022 13:36:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPpP=YG=citrix.com=prvs=206784369=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oIs4R-0004av-Lv
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:36:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a553bdf-1268-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 15:36:26 +0200 (CEST)
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
X-Inumbo-ID: 1a553bdf-1268-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659447386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PpfpV5nkngWKXwIzMuzDvmEu5G/siM6B6JBZhHRYfO8=;
  b=bpVq/R1Hh0n9OIfLEweslxGyCD513brfGP1BME7+hAWU8VpCGBnT0BTL
   5RD1G6vtw287sytT+UDTwNhSaB3zyLLgRmHnL/64meJeYY5a8eKbrf9rS
   LpGIYKMmlu3vqCr7IBowzRnbFAMrYs33rkwi0veLMeMxVYkCfBk8RoR+J
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 77611014
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/690IKBKkP6TjhVW/3Tjw5YqxClBgxIJ4kV8jS/XYbTApDki1jYOm
 2IeCj3XOKneYDH9c9pzPI22px9S7JfTxt9qQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEs/jb83uDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW2PT5KhxKmMXBJA32e9xA0UNx
 foSERlYO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDeNlVUpieSF3Nz9R/O7YZlOxBajm
 3/s5E7cHRYaKNvAxm/Qmp6rrrCWxn6qMG4IL5Wo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhakw/UeoVd77dxa4oXeevVgTQdddFeA85EeK0KWS/gXxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmKWqbi+C0JW1lC6dGiETL0tBVSkOdCJQtrEPv7oPYgLzosdLSfDo34GtRGitm
 VhmvwBl2exN0JdjO7GTuAme3mny/sWhohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAYlRujBCw6tamG0vLKWN8BJGvTE0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusICZyT7NfYsMtPoYyjP8UQHPY28Ps04k/IUOsQhHON51HsGibGsM5DFzxF3zPBX1
 WazesewF3cKYZlaIfvfb7l17ILHMQhnlT6JFM+kkEj5uVdcDVbMIYo43JK1RrhRxMu5TM/9r
 76z6+PiJ81jbdDD
IronPort-HdrOrdr: A9a23:0QCekqFtv0fLIyJ3pLqFaZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJhSo6H4BEDgewKryXcR2+Us1NiZLWvbUQeTQ72KqLGSpAEIeBeOv9K1t5
 0QFpSWYeeYZWSSz/yKhDVQeOxA/DDzytHKuQ6o9RdQpG9RBZ1I3kNcMEK2A0d2TA5JCd4SD5
 yH/PdKoDKmZDA+ctm7LmNtZZmJm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYZ93
 TfmQCR3NTojxj78G6Q64bg1eUYpDLT8KoMOCVKsLlVFtzYsHflWG2mYczDgNl6mpDt1L9gqq
 i1n/5pBbUJ15qWRBD8nfKl4Xib7B8+r3Lj01WciXvmrdeRfkNFN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3am8a/hGrDvGnZMZq59gs1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgZ/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9MIOM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaCKDgDKFC6a
 gpfGkoyVLaIXiedPFm9Kc7jSzwfA==
X-IronPort-AV: E=Sophos;i="5.93,211,1654574400"; 
   d="scan'208";a="77611014"
Date: Tue, 2 Aug 2022 14:36:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ijackson@chiark.greenend.org.uk>
CC: <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 1/2] TestSupport: Add support for installing from
 backport repo
Message-ID: <YukoTdtWbExEVCH7@perard.uk.xensource.com>
References: <20220802102602.131992-1-anthony.perard@citrix.com>
 <20220802102602.131992-2-anthony.perard@citrix.com>
 <25321.6183.866850.867719@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <25321.6183.866850.867719@chiark.greenend.org.uk>

On Tue, Aug 02, 2022 at 01:27:19PM +0100, Ian Jackson wrote:
> Anthony PERARD writes ("[OSSTEST PATCH 1/2] TestSupport: Add support for installing from backport repo"):
> > We are going to need to install package from the debian backport
> > repository in order to do a build.
> 
> LGTM.  I was kind of surprised we didn't have this already, but now I
> come to think of it, I think that was only for kernels ?  (I haven't
> UTSL to check.)

Yes, there's preseed_backports_packages() to install from backports repo
at host/guest installation. But nothing once the OS is already
installed. I thought it would not be a good idea to install meson on
every host.

> > +sub target_install_packages_backport ($@) {
> > +    my ($ho, @packages) = @_;
> > +    my $had_backport_repo = 0;
> > +    target_editfile_root($ho, '/etc/apt/sources.list', sub {
> > +        my $suite = $ho->{Suite};
> > +        my $bp_url = Osstest::Debian::debian_mirror_url($ho);
> > +        while (<::EI>) {
> > +            if (m/^# $suite backports/) {
> > +                $had_backport_repo = 1;
> > +            }
> > +            print ::EO;
> > +        }
> > +        print ::EO <<EOF unless $had_backport_repo;
> > +
> > +# $suite backports
> > +deb $bp_url $suite-backports main
> > +EOF
> > +        });
> 
> Nit: this last line looks misindented to me.

Would be nice to fix on commit, I guess.

> Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

Thanks,

-- 
Anthony PERARD


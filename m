Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C6F587C71
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 14:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379285.612608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIr00-0002Uf-3P; Tue, 02 Aug 2022 12:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379285.612608; Tue, 02 Aug 2022 12:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIr00-0002S2-0b; Tue, 02 Aug 2022 12:27:48 +0000
Received: by outflank-mailman (input) for mailman id 379285;
 Tue, 02 Aug 2022 12:27:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1IV=YG=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1oIqzz-0002Rw-0f
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 12:27:47 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8269d1a5-125e-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 14:27:44 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1oIqzv-0007fT-5d; Tue, 02 Aug 2022 13:27:43 +0100
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
X-Inumbo-ID: 8269d1a5-125e-11ed-924f-1f966e50362f
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25321.6183.866850.867719@chiark.greenend.org.uk>
Date: Tue, 2 Aug 2022 13:27:19 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 1/2] TestSupport: Add support for installing from backport repo
In-Reply-To: <20220802102602.131992-2-anthony.perard@citrix.com>
References: <20220802102602.131992-1-anthony.perard@citrix.com>
	<20220802102602.131992-2-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)

Anthony PERARD writes ("[OSSTEST PATCH 1/2] TestSupport: Add support for installing from backport repo"):
> We are going to need to install package from the debian backport
> repository in order to do a build.

LGTM.  I was kind of surprised we didn't have this already, but now I
come to think of it, I think that was only for kernels ?  (I haven't
UTSL to check.)

> +sub target_install_packages_backport ($@) {
> +    my ($ho, @packages) = @_;
> +    my $had_backport_repo = 0;
> +    target_editfile_root($ho, '/etc/apt/sources.list', sub {
> +        my $suite = $ho->{Suite};
> +        my $bp_url = Osstest::Debian::debian_mirror_url($ho);
> +        while (<::EI>) {
> +            if (m/^# $suite backports/) {
> +                $had_backport_repo = 1;
> +            }
> +            print ::EO;
> +        }
> +        print ::EO <<EOF unless $had_backport_repo;
> +
> +# $suite backports
> +deb $bp_url $suite-backports main
> +EOF
> +        });

Nit: this last line looks misindented to me.

Regardless,

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

Thanks,
Ian.

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.


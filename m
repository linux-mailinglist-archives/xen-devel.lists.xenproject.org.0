Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F193149F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 14:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758861.1168380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTL6S-0002f4-22; Mon, 15 Jul 2024 12:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758861.1168380; Mon, 15 Jul 2024 12:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTL6R-0002cc-V9; Mon, 15 Jul 2024 12:46:51 +0000
Received: by outflank-mailman (input) for mailman id 758861;
 Mon, 15 Jul 2024 12:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a8up=OP=bounce.vates.tech=bounce-md_30504962.66951a35.v1-fb0d2780b86d4446a86bb08eb1688d8d@srs-se1.protection.inumbo.net>)
 id 1sTL6Q-0002cU-UN
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 12:46:51 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b6fdd80-42a8-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 14:46:46 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WN25K21NhzB5p7Pm
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 12:46:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fb0d2780b86d4446a86bb08eb1688d8d; Mon, 15 Jul 2024 12:46:45 +0000
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
X-Inumbo-ID: 4b6fdd80-42a8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721047605; x=1721308105;
	bh=DAfSImey2SXiDQCWU6+f8AcPbBTf/5flAgZO8ME7Pn4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dUU9q6K6CAaoNMII1X7I/aiTsF8eRIqww5MQH6fkeM6u5tgUOPIPxbxXmgLetKxk7
	 o4pWqK1BvhL+rA4HW9P513j8FqfyrMTD2VVrh6PUAybx4/pVMGixhO23JGGq42Mlti
	 PDdxM5YlmHXKNSwr7fRdMp+ty1nSGhg8/6xXJZ7b6T/Z9TJhSfUjeiyVLeJx2UUMyq
	 iq3MV0qdwMTZS11o4YBZsHC8eJ/Y14myjWm3EHB//CoDwYVAKlXZCF6ICqSdbDP44Q
	 neLsDZgro/jpJhHCvP3zMUhpDNo+SRbrq/Ai2Tomk52P8dDA/ZFcOzxO/2O1kGDVtm
	 y9ygqZZdqz5/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721047605; x=1721308105; i=anthony.perard@vates.tech;
	bh=DAfSImey2SXiDQCWU6+f8AcPbBTf/5flAgZO8ME7Pn4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HlvtVWgXC/JXrqzw8SOs4f3n+L/6blZu+l8ux4mSR7R65yHFCjRPH0zhalHSL6WdI
	 PCr5CiyjjsOtk97Ie8iadwM9p4xqkLgp84cZepIxXYaEHOIadkdtvcUtTojwxylL8F
	 4LH46j3KPPE66hYT5LLTkrdDw5KKAn/eioZWKuzp0FAbJwO8ZhWvUrezIIf394pNlr
	 L+l7XAzbPDaAShcRwfNSzjAT6E0qEt2aGh0yPc/+kWf2MMo1KGyLPpzV6aW3qiX1Xv
	 3ghhjb2OoaugaBl1QTnPEejPR9NYlmHSKJnslCKNywVdSi537hdTrJuvyPLInaq7e3
	 Tc2gzvEc8nxuw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2020/12]=20CI:=20Swap=20from=20perl=20to=20perl-base=20in=20build=20containers?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721047603753
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZpUaMwZoKnrh61P0@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240713180952.3363596-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240713180952.3363596-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fb0d2780b86d4446a86bb08eb1688d8d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240715:md
Date: Mon, 15 Jul 2024 12:46:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sat, Jul 13, 2024 at 07:09:52PM +0100, Andrew Cooper wrote:
> We only need a basic perl environment, not the things that a primarily-perl
> project would want.
> 
> Discovered during the Fedora refresh where the difference is ~40M, but it's
> more modest for OpenSUSE and Ubuntu.

"perl-base" on Ubuntu is quite different from "perl-base" on OpenSUSE
Leap. I haven't check Tumbleweed but is probably the same as Leap.
So, I think these would deserve to be in separated patches.

On Ubuntu, installing "perl" or "perl-base" or none of them makes no
difference. We install "build-essentials" which pulls "dpkg-dev" which
pulls "perl", so we don't test properly if "perl-base" is enough or if
we need more.

I tried to find out which Perl module we would need, and I've got this
list:

- get_maintainer
    Getopt::Long;
- add_maintainer
    Getopt::Long;
    File::Basename;
    List::MoreUtils;
    IO::Handle;
- stubdom/vtpmmgr:
    Digest::SHA qw(sha1);
    Math::BigInt only => 'GMP';
- kconfig
    Getopt::Long;
- ocaml/lib/xc/abi-check
    Data::Dumper;
- docs/gen-html-index
    Getopt::Long;
    IO::File;
    File::Basename;
- docs/xen-headers
    Getopt::Long;
    File::Find;
    IO::File;
(there's also tools/examples/xeninfo.pl, I dont't if that can still work
or if we need to purge it)

Then I've got whatever module is in "perl-base" pkg.

For Leap's perl-base:
    getopt:long
    file:basename
    io:handle
    io:file
    file:find
    data:dumper
    digest:sha
So, add_maintainer.pl and the script in stubdom/vtpmmgr won't work. So
that's probably fine for Leap.

For Ubuntu 22.04 (not check others, but likely about the same)
there's more packages:
    perl-base
        getopt::long
        file:basename
        io:handle
        io:file
    perl-modules-5.34
        file:find
        math:bigint
    libperl5.34
        data:dumper
        digest:sha
    liblist-moreutils-perl
        list:MoreUtils
    librpc-xml-perl
        rpc:xml
("perl" pkg pulls "perl-modules-5.34" and "libperl5.34")

So with just "perl-base", the ocaml's abi-check wouldn't work, as well
as the docs's script (probably ok for "docs" if we don't use containers
to build them). Also add_maintainer and stubdom/vtpmmgr like for Leap.


So I would suggest to not touch the Ubuntu containers, make the change
to the OpenSUSE one and maybe add the limitation to the commit message.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


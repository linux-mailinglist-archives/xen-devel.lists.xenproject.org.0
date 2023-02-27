Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142FB6A4457
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502616.774495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeSu-0007gV-8g; Mon, 27 Feb 2023 14:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502616.774495; Mon, 27 Feb 2023 14:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeSu-0007dp-5K; Mon, 27 Feb 2023 14:26:56 +0000
Received: by outflank-mailman (input) for mailman id 502616;
 Mon, 27 Feb 2023 14:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nANs=6X=citrix.com=prvs=415eedfc5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pWeSs-0007dj-EI
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:26:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5e345e5-b6aa-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 15:26:51 +0100 (CET)
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
X-Inumbo-ID: c5e345e5-b6aa-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677508011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Nqe5M8Fw7D9UvEhjRjGprOZkTn/f+LyKBIvp7RmZr7M=;
  b=Tr9j+g4eTf99G8jjcq4ks0AMEcoKNiNxbEkxe0BY4r5c6FRhI07cmHan
   rYjIWf7wyvTN/hD+l3g9XyI9J3pYOcgwTbCxlrjpaimu5ENO2VK7NpeJm
   Wzl3LooDlFSkq7/IjQm/EQ1zllilpz9PEUnjurmHiEAxHv0NMGoRE9rN1
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97515573
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:H1aTdKN5TnOshtvvrR0Dl8FynXyQoLVcMsEvi/4bfWQNrUpwhWRTz
 TAaXT/Qb/rfNzf1fN0gb9zi8kNU68OHytMyTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tC5ANmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sRPXVkNp
 PUmEQEEXCuYhN/r7OugdvY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3VGJwIwxnDz
 o7A10T3Hy4Ta9bH8ieY9yO227LttjvVALtHQdVU8dY12QbOlwT/EiY+UFKhpPCjh02WWtRBK
 lcV8C4jsagz8kOwStD3GRa/pRasshMZWvJRFfM78wCHzqfI4wefCXMARzQHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS0OQBYB4tLjiJoulR+JRdFmeIa3k9n0FDfY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN8QdRdIOjIYuy5jDz7vFGNo+VCEaAu
 HssnNKX5+QDS5qKkUSlSf0ABriz696ZMTfXhhhkGJxJyti20yf9J8YKumg4fRo3dJ9eIlcFf
 XM/pytz3MNrfyqjU5ZGarCKEMcXkIS5Duj6A6W8gsV1XrB9cwqO/SdLbEGW3nzwnEVErZzTK
 at3Yu73Uy9EVP0PIC6eAr5EjOR1nnxWKXb7H8iT8vix7VaJiJd5o58hOUDGUO025bjsTO79o
 4cGbJviJ/myvYTDjsjrHWw7dw9iwZsTX8qeRylrmgmrc2Jb9JkJUaO5/F/YU9UNc15pvunJ5
 GqhfURT1UDyg3bKQS3TNC88NOixAcgv/CxlVcDJAbpP8yJ+CbtDEY9FL8dnFVXZ3LALIQFIo
 wktJJzbX6UnpsXv8DUBd5jtxLGOhzzy7T9iyxGNOWBlF7Y5HlyhxzMRVle3nMX4Jnbt5JRWT
 nzJ/l+zfKfvsCw+VZ+LOK/ylg7g1ZXf8corN3b1zhBoUB2E2OBXx+bZ15fb/+lkxc3/+wan
IronPort-HdrOrdr: A9a23:J9zEy620cTGKcgMaWLP0oQqjBVJyeYIsimQD101hICG9Lfbzqy
 n+pp8mPEHP4Ar5AEtQ/+xpOMG7IU80hqQFmLX5XI3SKzUO3VHEEGgM1/qH/9SNIUPDH41mpN
 FdmspFebrN5DFB5KqU3ODSKadC/DDzytHMuQ6o9QYOcegFUcBdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz7+HjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T+M1TiyWsnVM73a4m1OcJ+eEzS/Bkv/JlZwkExDzYKriJEIfyxAzd6Nvfk2rC1u
 O86ivIdv4DkU/5byW7pwDg1BLn1ytr43j+yUWAiX+musDhQikmYvAx976xXyGpm3bIhusMo5
 5jziacrd5aHBnAlCPy65zBUAxrjFO9pT4nnfQIh3JSXIMCYPsJxLZviH99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlONQ1QEuMaSzz9K9UoJuncw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosMYad0FI46MLqK46z2MGzx2U6pUCva/fs8Sg/wQrbMkckI2N0=
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="97515573"
Date: Mon, 27 Feb 2023 14:26:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>,
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v5 1/5] Use HTTPS for all xenbits.xen.org Git repos
Message-ID: <Y/y9l+U7b5y6wWjB@perard>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <9cb98cb9aaca22bbc88de9fd8cbd7f9463b4d425.1677356813.git.demi@invisiblethingslab.com>
 <Y/qM+MOsWVp/6Yev@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/qM+MOsWVp/6Yev@mail-itl>

On Sat, Feb 25, 2023 at 11:34:32PM +0100, Marek Marczykowski-Górecki wrote:
> On Sat, Feb 25, 2023 at 03:37:11PM -0500, Demi Marie Obenour wrote:
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> > 
> > This patch enforces the use of secure transports for all xenbits.xen.org
> > Git repositories.  It was generated with the following shell script:
> > 
> >     git ls-files -z |
> >     xargs -0 -- sed -Ei -- 's@(git://xenbits\.xen\.org|http://xenbits\.xen\.org/git-http)/@https://xenbits.xen.org/git-http/@g'
> > 
> > All altered links have been tested and are known to work.
> > 
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> 
> It seems expired Lets Encrypt root issue applies to few other containers
> too:

Yes, I haven't finished rebuilding all containers needed to be rebuilt.
I've mostly took care of fixing dockerfiles for those needed to change.

Cheers,

> - archlinux:current: https://gitlab.com/xen-project/patchew/xen/-/jobs/3834739751
> - debian:stretch-i386: https://gitlab.com/xen-project/patchew/xen/-/jobs/3834739762
> - debian:unstable-i386: https://gitlab.com/xen-project/patchew/xen/-/jobs/3834739771



-- 
Anthony PERARD


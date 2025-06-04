Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C0CACE5B2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 22:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005921.1385243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMuYe-0002IX-PA; Wed, 04 Jun 2025 20:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005921.1385243; Wed, 04 Jun 2025 20:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMuYe-0002Gn-MF; Wed, 04 Jun 2025 20:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1005921;
 Wed, 04 Jun 2025 20:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Klp=YT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMuYe-0002Gg-3A
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 20:17:56 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdc4ca27-4180-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 22:17:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 485EAA50754;
 Wed,  4 Jun 2025 20:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B3FC4CEE4;
 Wed,  4 Jun 2025 20:17:49 +0000 (UTC)
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
X-Inumbo-ID: fdc4ca27-4180-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749068270;
	bh=fi3QD+f9jeY7VeRt7KTdukORp7vu2ILca9M6e90IBbI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TfozS2gOGTXafifdhwUw/RZEpp9IwgBn5AqjECPscNI59xZTZTF4tH/XL/FfRfl+G
	 wumyhEA6l/WJc7FBlLQOR/HZGsfGJBnKnvjQA/pT0RUkgWmZ3ZScsQElvwBrgrBltu
	 mwqvbJPvy9L1q7r5DdSKvy59N05IfRtypuePcYz0Mlb595pLFX4qEIjDTkBBUZUQmT
	 BL3QLIzdlPYcjxy+5VCkOZxV5w+iR8jGwmOS7cuhxJvLVRARsvRPEwFCNIntDk52c+
	 H9TWicNwuquGMP9UbBZSgVsWYy71lVHH/3krKaCHt6eBHHKTlpFcdDV0fSvRLFlvdw
	 VyCiuaKLgpP7g==
Date: Wed, 4 Jun 2025 13:17:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 9/9] CI: Add timing to junit
In-Reply-To: <aEAu753_eexjZn08@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2506041315030.2495561@ubuntu-linux-20-04-desktop>
References: <20250603124222.52057-1-anthony@xenproject.org> <20250603124222.52057-10-anthony@xenproject.org> <alpine.DEB.2.22.394.2506031130060.1147082@ubuntu-linux-20-04-desktop> <aEAIXmOlht3b9TkK@l14> <384fd17a-9236-4727-b564-543edff65e9e@citrix.com>
 <aEAu753_eexjZn08@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1641201751-1749068271=:2495561"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1641201751-1749068271=:2495561
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 4 Jun 2025, Marek Marczykowski-Górecki wrote:
> On Wed, Jun 04, 2025 at 11:57:11AM +0100, Andrew Cooper wrote:
> > On 04/06/2025 9:48 am, Anthony PERARD wrote:
> > > On Tue, Jun 03, 2025 at 11:35:22AM -0700, Stefano Stabellini wrote:
> > >> On Tue, 3 Jun 2025, Anthony PERARD wrote:
> > >>> From: Anthony PERARD <anthony.perard@vates.tech>
> > >>>
> > >>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> > >>> ---
> > >>>  automation/scripts/run-tools-tests | 5 ++++-
> > >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> > >>> index 852c1cfbcf..e38cc4068c 100755
> > >>> --- a/automation/scripts/run-tools-tests
> > >>> +++ b/automation/scripts/run-tools-tests
> > >>> @@ -18,9 +18,12 @@ for f in "$1"/*; do
> > >>>          continue
> > >>>      fi
> > >>>      echo "Running $f"
> > >>> -    printf '  <testcase name="%s">\n' "$f" >> "$xml_out"
> > >>> +    time_start=$EPOCHREALTIME
> > >>>      "$f" 2>&1 | tee /tmp/out
> > >>>      ret=${PIPESTATUS[0]}
> > >>> +    time_end=$EPOCHREALTIME
> > >>> +    time_test="$(bc <<<"$time_end - $time_start")"
> > >> As it looks like no other scripts need bc at the moment but we already
> > >> rely on awk (automation/scripts/xilinx-smoke-dom0less-arm64.sh) I'd
> > >> prefer this version:
> > >>
> > >> time_test="$(awk "BEGIN {print $time_end - $time_start}")"
> > > You mean I have to choose between busybox and busybox?
> > >
> > > $ ls -l $(which bc awk)
> > > lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/awk -> /bin/busybox
> > > lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/bc -> /bin/busybox
> > >
> > > :-)
> > >
> > > I guess it doesn't really matter.
> > >
> > > One difference though:
> > > $ awk "BEGIN {print $time_end - $time_start}"
> > > 3.28798
> > > $ bc <<<"$time_end - $time_start"
> > > 3.287982
> > >
> > > awk is less precise, but I guess that doesn't matter as well, gitlab UI
> > > isn't going to show the extra digits.
> > >
> > > So I guess I can change to use `awk` instead, just in case for some
> > > reason `bc` isn't present, since `awk` seems mandatory for many of our
> > > scripts.
> > >
> > > Thanks,
> > 
> > bc is a normal posix utility just like awk is, so there's no change in
> > dependencies caused by this.
> 
> Linux requires bc for building, and I _very_ often find systems where it
> isn't installed by default (by awk is)...
> Anyway, that's probably irrelevant in the CI container that has busybox
> for both.

Yes, I see the same. Honestly, I wouldn't mind having a dependecy on bc,
it is common enough and available enough, it is just that we are not
doing a great job at tracking this type of dependencies in test scripts,
so I just thought the less we have the better and in this case there is
an easy solution. Anyway, this is not the hill I am hill I am going to
die on.
--8323329-1641201751-1749068271=:2495561--


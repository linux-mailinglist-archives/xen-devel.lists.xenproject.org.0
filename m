Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F19AC5E18
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998844.1379544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4T4-0002tF-6I; Wed, 28 May 2025 00:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998844.1379544; Wed, 28 May 2025 00:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4T4-0002rO-3d; Wed, 28 May 2025 00:16:26 +0000
Received: by outflank-mailman (input) for mailman id 998844;
 Wed, 28 May 2025 00:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uK4T2-0002rI-Iq
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:16:24 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae57606-3b58-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 02:16:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 750A844175;
 Wed, 28 May 2025 00:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0F3C4CEE9;
 Wed, 28 May 2025 00:16:18 +0000 (UTC)
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
X-Inumbo-ID: fae57606-3b58-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748391379;
	bh=WzhABPYJaAG4UTp5WISdWDZZsIZA/fOnZhZA+NM+Bfk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J8ZIy36QR+cDxL7+XaZtlxjvUsNuNQq3cdEqfSCeC+atd2nKaslrjM3t3572nAkKT
	 xhHPsPiVdV7pFaHcWW6eMpK9DjBJyhUTXLpWhSYbrafyURFpHI+9WLsIAwlfnI8+7K
	 8jjcNbQRKlNXRgME/8QvL+2HYeC++765/Ck2tHKnCZ0mmp1j+TSTC6q9GAEtt/pesD
	 bW2DUBBBV4DpoMsseQ98/4G+oXe5kALlIP6ssvc1yHnHKJ3CX7UT9G6D4IZYCo+P2/
	 vpZQRREbsACGazkQOorRiRfbfqWx1+w/4JmzT1+97jNlItDHuGh3CpI7yX0Pj9VOPt
	 gdqctBBgM2ayA==
Date: Tue, 27 May 2025 17:16:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony@xenproject.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] CI: Drop custom handling of tools/tests
In-Reply-To: <23aeac17-6fd0-4515-8c84-1a867c57a68d@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505271715450.135336@ubuntu-linux-20-04-desktop>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com> <20250520205239.203253-4-andrew.cooper3@citrix.com> <1e690ecb-5060-4dfe-a515-acbbf214bc99@citrix.com> <aDSjaewFMxUj6Tel@l14> <23aeac17-6fd0-4515-8c84-1a867c57a68d@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1555113110-1748391379=:135336"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1555113110-1748391379=:135336
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 26 May 2025, Andrew Cooper wrote:
> On 26/05/2025 6:22 pm, Anthony PERARD wrote:
> > On Mon, May 26, 2025 at 05:45:29PM +0100, Andrew Cooper wrote:
> >> On 20/05/2025 9:52 pm, Andrew Cooper wrote:
> >>> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> >>> index 770e97c3e943..8d7aa8fa5140 100755
> >>> --- a/automation/scripts/run-tools-tests
> >>> +++ b/automation/scripts/run-tools-tests
> >>> @@ -12,30 +12,25 @@ printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
> >>>  printf '<testsuites name="tools.tests">\n' >> "$xml_out"
> >>>  printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
> >>>  failed=
> >>> -for dir in "$1"/*; do
> >>> -    [ -d "$dir" ] || continue
> >>> -    echo "Running test in $dir"
> >>> -    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
> >>> -    ret=
> >>> -    for f in "$dir"/*; do
> >>> -        [ -f "$f" ] || continue
> >>> -        [ -x "$f" ] || continue
> >>> -        "$f" 2>&1 | tee /tmp/out
> >>> -        ret=$?
> >>> -        if [ "$ret" -ne 0 ]; then
> >>> -            echo "FAILED: $ret"
> >>> -            failed+=" $dir"
> >>> -            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
> >>> -            # TODO: could use xml escaping... but current tests seems to
> >>> -            # produce sane output
> >>> -            cat /tmp/out >> "$xml_out"
> >>> -            printf '   </failure>\n' >> "$xml_out"
> >>> -        else
> >>> -            echo "PASSED"
> >>> -        fi
> >>> -    done
> >>> -    if [ -z "$ret" ]; then
> >>> -        printf '   <skipped type="skipped" message="no executable test found in %s"/>\n' "$dir" >> "$xml_out"
> >>> +for f in "$1"/*; do
> >>> +    if [ -x "$f" ]; then
> >>> +        echo "SKIP: $f not executable"
> >>> +        continue
> >> This should be ! -x
> >>
> >> I had that hunk in the wrong patch when posting this series.
> > With that fixed:
> > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Thanks.
> 
> >
> > But I think there's an issue with the script...
> >
> >>> +    "$f" 2>&1 | tee /tmp/out
> >>> +    ret=$?
> >>> +    if [ "$ret" -ne 0 ]; then
> > Is this checking the correct exit value? It seems that without `set -o
> > pipefail`, we only have the exit value of `tee` which should never fail.
> > But I think we should grab the value of ${PIPESTATUS[0]} to actually
> > read the exit value of $f.
> 
> Hmm yes, I think this needs adjusting.
> 
> It turns out there are multiple problems with junit, including the fact
> that putting failures in here doesn't cause the outer job to fail. 
> 
> The internet suggest having a 'script: grep "<failure" junit.xml' step
> to work around this.
> 
> I think that wants to be a separate series.  The question is whether to
> do this series first or second.  I expect I'm going to need to backport
> all of this work to eventually get XTF back onto the older trees.
 
I'll leave the choice to you
--8323329-1555113110-1748391379=:135336--


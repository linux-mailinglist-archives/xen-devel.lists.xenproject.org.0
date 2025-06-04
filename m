Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C324EACDA39
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 10:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005272.1384754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjnX-0005mq-IA; Wed, 04 Jun 2025 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005272.1384754; Wed, 04 Jun 2025 08:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjnX-0005lP-Eu; Wed, 04 Jun 2025 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1005272;
 Wed, 04 Jun 2025 08:48:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMjnV-0005lJ-Ix
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 08:48:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMjnV-001pP7-0P;
 Wed, 04 Jun 2025 08:48:33 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMjnV-00G5Ij-0v;
 Wed, 04 Jun 2025 08:48:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=FJf7+sWC+t6EWeV6vCfTbl0TfGzNfB1Wkn38FwFxXcQ=; b=yoOeojKb55O1bqC21myeD5ieFt
	NwwsayHMaCpv/zCv0yX7KO0gFvE1HMrEMrEkOqHVtv+zAMVKe5jht921ZreT93g5/cWMv8MHcUJfs
	egbiKqdhgsdmoy5PNvKKJu4r/c4XefZ/RshRZUKvwCacZed8hbVoWSxKqAyQopQoM8Lk=;
Date: Wed, 4 Jun 2025 10:48:30 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 9/9] CI: Add timing to junit
Message-ID: <aEAIXmOlht3b9TkK@l14>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-10-anthony@xenproject.org>
 <alpine.DEB.2.22.394.2506031130060.1147082@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2506031130060.1147082@ubuntu-linux-20-04-desktop>

On Tue, Jun 03, 2025 at 11:35:22AM -0700, Stefano Stabellini wrote:
> On Tue, 3 Jun 2025, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> > ---
> >  automation/scripts/run-tools-tests | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> > index 852c1cfbcf..e38cc4068c 100755
> > --- a/automation/scripts/run-tools-tests
> > +++ b/automation/scripts/run-tools-tests
> > @@ -18,9 +18,12 @@ for f in "$1"/*; do
> >          continue
> >      fi
> >      echo "Running $f"
> > -    printf '  <testcase name="%s">\n' "$f" >> "$xml_out"
> > +    time_start=$EPOCHREALTIME
> >      "$f" 2>&1 | tee /tmp/out
> >      ret=${PIPESTATUS[0]}
> > +    time_end=$EPOCHREALTIME
> > +    time_test="$(bc <<<"$time_end - $time_start")"
> 
> As it looks like no other scripts need bc at the moment but we already
> rely on awk (automation/scripts/xilinx-smoke-dom0less-arm64.sh) I'd
> prefer this version:
> 
> time_test="$(awk "BEGIN {print $time_end - $time_start}")"

You mean I have to choose between busybox and busybox?

$ ls -l $(which bc awk)
lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/awk -> /bin/busybox
lrwxrwxrwx    1 root     root            12 Feb 13 23:19 /usr/bin/bc -> /bin/busybox

:-)

I guess it doesn't really matter.

One difference though:
$ awk "BEGIN {print $time_end - $time_start}"
3.28798
$ bc <<<"$time_end - $time_start"
3.287982

awk is less precise, but I guess that doesn't matter as well, gitlab UI
isn't going to show the extra digits.

So I guess I can change to use `awk` instead, just in case for some
reason `bc` isn't present, since `awk` seems mandatory for many of our
scripts.

Thanks,

-- 
Anthony PERARD


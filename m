Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62517AC4370
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 19:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997650.1378469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJbXJ-00035C-83; Mon, 26 May 2025 17:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997650.1378469; Mon, 26 May 2025 17:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJbXJ-000333-4Y; Mon, 26 May 2025 17:22:53 +0000
Received: by outflank-mailman (input) for mailman id 997650;
 Mon, 26 May 2025 17:22:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJbXH-00032x-PG
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 17:22:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJbXH-003SI8-18;
 Mon, 26 May 2025 17:22:51 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJbXH-00FpCS-1P;
 Mon, 26 May 2025 17:22:51 +0000
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
	bh=gkSN7NhEVv4Jf4w5l8i4Gd9TSE2wB9xRZRWHG6SDaaM=; b=0I865X994fZjsYaPjYZ9WbXnhZ
	Dx/wDv4FgGrr0e3mppZ1xjYPk3meftKdXNzWIR0QI+CFlgucwXMfx7oOSEj6aux4V4lzQ5p5H+BE1
	QKQgaP52U3AJazejxDF14/grac3Pd2W1yzNLh2wyoluHyUpu5qn6HdSv91BtU30cxZY4=;
Date: Mon, 26 May 2025 19:22:49 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] CI: Drop custom handling of tools/tests
Message-ID: <aDSjaewFMxUj6Tel@l14>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
 <20250520205239.203253-4-andrew.cooper3@citrix.com>
 <1e690ecb-5060-4dfe-a515-acbbf214bc99@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e690ecb-5060-4dfe-a515-acbbf214bc99@citrix.com>

On Mon, May 26, 2025 at 05:45:29PM +0100, Andrew Cooper wrote:
> On 20/05/2025 9:52 pm, Andrew Cooper wrote:
> > diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> > index 770e97c3e943..8d7aa8fa5140 100755
> > --- a/automation/scripts/run-tools-tests
> > +++ b/automation/scripts/run-tools-tests
> > @@ -12,30 +12,25 @@ printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
> >  printf '<testsuites name="tools.tests">\n' >> "$xml_out"
> >  printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
> >  failed=
> > -for dir in "$1"/*; do
> > -    [ -d "$dir" ] || continue
> > -    echo "Running test in $dir"
> > -    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
> > -    ret=
> > -    for f in "$dir"/*; do
> > -        [ -f "$f" ] || continue
> > -        [ -x "$f" ] || continue
> > -        "$f" 2>&1 | tee /tmp/out
> > -        ret=$?
> > -        if [ "$ret" -ne 0 ]; then
> > -            echo "FAILED: $ret"
> > -            failed+=" $dir"
> > -            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
> > -            # TODO: could use xml escaping... but current tests seems to
> > -            # produce sane output
> > -            cat /tmp/out >> "$xml_out"
> > -            printf '   </failure>\n' >> "$xml_out"
> > -        else
> > -            echo "PASSED"
> > -        fi
> > -    done
> > -    if [ -z "$ret" ]; then
> > -        printf '   <skipped type="skipped" message="no executable test found in %s"/>\n' "$dir" >> "$xml_out"
> > +for f in "$1"/*; do
> > +    if [ -x "$f" ]; then
> > +        echo "SKIP: $f not executable"
> > +        continue
> 
> This should be ! -x
> 
> I had that hunk in the wrong patch when posting this series.

With that fixed:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

But I think there's an issue with the script...

> > +    "$f" 2>&1 | tee /tmp/out
> > +    ret=$?
> > +    if [ "$ret" -ne 0 ]; then

Is this checking the correct exit value? It seems that without `set -o
pipefail`, we only have the exit value of `tee` which should never fail.
But I think we should grab the value of ${PIPESTATUS[0]} to actually
read the exit value of $f.

Thanks,

-- 
Anthony PERARD


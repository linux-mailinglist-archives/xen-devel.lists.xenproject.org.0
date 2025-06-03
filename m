Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35537ACCAD6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 17:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004642.1384361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMU2K-0003a1-QK; Tue, 03 Jun 2025 15:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004642.1384361; Tue, 03 Jun 2025 15:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMU2K-0003Xc-NP; Tue, 03 Jun 2025 15:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1004642;
 Tue, 03 Jun 2025 15:58:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMU2J-0003XG-DK
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 15:58:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMU2I-000GMx-2D;
 Tue, 03 Jun 2025 15:58:46 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMU2I-006BcW-2J;
 Tue, 03 Jun 2025 15:58:46 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=WgWMHehosbmoZ5s9vhs7cuJMPBtHntjnuJFYBdCbYLU=; b=qTBwXa7aRB5QN44d3OTwvxfYMr
	gz0HUcD1wMoV6IYLijnDi1g7MjoTnrMJtGr8bBGfg/LLUDqPYSfdMIBVnJddHMNd71DXV0KLpVvqH
	ISnhwV/A3oWxO3e4C0kBY49wmpWF4BXDDbVasas81obfxStia0kvA8mgWh+IhRzkScFU=;
Date: Tue, 3 Jun 2025 17:58:44 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests
 failure
Message-ID: <aD8btMPtrwT2d7sS@l14>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-6-anthony@xenproject.org>
 <ba57188a-77b9-4386-bd5a-073903062864@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba57188a-77b9-4386-bd5a-073903062864@citrix.com>

On Tue, Jun 03, 2025 at 02:41:50PM +0100, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> >  if [ -n "$retrieve_xml" ]; then
> >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > +    # Findout if one of the test failed
> > +    if ! grep -q '</testsuites>' tests-junit.xml; then
> > +        echo "ERROR: tests-junit.xml is incomplete or missing."
> > +        TEST_RESULT=1
> > +    elif grep -q '</failure>' tests-junit.xml; then
> > +        TEST_RESULT=1
> > +    fi
> >  fi
> >  
> >  exit "$TEST_RESULT"
> 
> A couple of things.
> 
> From my experimentation with junit,
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report?job_name=kbl-xtf-x86-64-gcc-debug
> we can also use </error> for classification.  I'm also very disappointed
> in Gitlab classifying <warning> as success.

According to the documentation [1] which point to this junit xml format [2]
the only elements (and path) are:
    testsuites.testsuite.testcase.failure
"error" or "warning" don't exist.
There's the attributes `type` in <failure> but this isn't explained how
it's used.

But I guess if we follow the link in [2], go through web.archive.org, we
can find [3] which has "skipped", "error", "failure", but still no
"warning".


[1] https://docs.gitlab.com/ci/testing/unit_test_reports/#unit-test-reporting-workflow
[2] https://www.ibm.com/docs/en/developer-for-zos/16.0?topic=formats-junit-xml-format
[3] https://github.com/windyroad/JUnit-Schema/blob/master/JUnit.xsd


> Not for this patch, but for XTF I need to be able to express "tolerable
> failure".  (All branches of Xen will run the same tests, and we don't
> have OSSTest to deem "fail never passed" as non-blocking.)

According to [1], there's a notion of "Existing failures", but that
might show up only on merge request.

> Even if the job passes overall, I want tolerable failures to show up in
> the UI, so I have to use <failure> in junit.xml.  But that means needing
> to be more selective, and I don't have a good idea of how to do this. 
> (I have one terrible idea, which is </failure type=tolerable"> which
> will escape that grep, but it feels like (ab)buse of XML.)

At the moment, `run-tools-tests` write '<failure type="failure"' on
failure, so we could grep on that instead event if it is sligtly more
fragile. I've choosen to grep on '</failure>' at first because that's
much less likely to be written differently, while the attributes in the
tag could be written in a different order.

Then, we can always use `sed` and extract the "type" to check it:
sed -n 's/.*<failure \(\|.* \)type="\([^"]\+\)" .*/\2/p' tests-junit.xml | while read type; do
  case $type in
    failure) echo fail;;
    tolerable) echo ok;;
    *) echo error unknwon type $type;;
  esac
done
But that maybe going a bit too far :-)

Cheers,

-- 
Anthony PERARD


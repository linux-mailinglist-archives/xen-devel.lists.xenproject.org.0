Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B8B2499D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079844.1440534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAkT-0003OC-1Q; Wed, 13 Aug 2025 12:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079844.1440534; Wed, 13 Aug 2025 12:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAkS-0003Ml-U4; Wed, 13 Aug 2025 12:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1079844;
 Wed, 13 Aug 2025 12:38:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1umAkR-0003Mf-Lf
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:38:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umAkR-003MQu-04;
 Wed, 13 Aug 2025 12:38:31 +0000
Received: from [2a01:cb15:80df:da00:7360:a082:15b4:b94d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1umAkQ-002Q8f-2s;
 Wed, 13 Aug 2025 12:38:31 +0000
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
	bh=7yLt10OAgku71FV+8rl0wrlO69/0oWB/qZHmundCnFo=; b=5ysNb0qB/5Kes+w18Q8O2aa340
	xvJkgDLnfpy1VjMGjUXYIViq1hFdVosWGZ3bD+1xN93Dt+GNmgdSRtMCVdGaeyqIyRoEh1sQasEQg
	Iiasuob2wkAcDWmEFuppdmXEQxj1tDr0VacNIbxThuXOxx+nb4Zhwo1qM7fgx9QZV2SQ=;
Date: Wed, 13 Aug 2025 14:38:29 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 1/3] CI: Rework run-tools-test exit path
Message-ID: <aJyHRQJTcmIlUVWD@l14>
References: <20250730152602.45436-1-anthony@xenproject.org>
 <20250730152602.45436-2-anthony@xenproject.org>
 <aJd1yaBFSjTx_wsl@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJd1yaBFSjTx_wsl@mail-itl>

On Sat, Aug 09, 2025 at 06:22:33PM +0200, Marek Marczykowski-Górecki wrote:
> On Wed, Jul 30, 2025 at 05:26:00PM +0200, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> > 
> > The main script expect to find the string "$passed" or it just timeout
> > and doesn't try to download the junit file in this case. So we ignore
> > the return value of run-tools-test to always print "$passed" and
> > instead look for failure in the generated junit file. If the junit
> > report is incomplete, this will also result in a failure of the job.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> > ---
> > 
> > Notes:
> >     Changes in v2:
> >     - This squash both patch "CI: Ignore run-tools-test return value" and
> >       "CI: Have the gitlab job fail on tools/tests failure"
> >     - grep for '<failure type="failure"' instead of '</failure>'
> > 
> >  automation/scripts/qubes-x86-64.sh | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> > index 2750d24eba..21dcd9b063 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -135,10 +135,11 @@ done
> >      ### tests: tools-tests-pv, tools-tests-pvh
> >      "tools-tests-pv"|"tools-tests-pvh")
> >          retrieve_xml=1
> > -        passed="test passed"
> > +        passed="run-tools-test over"
> >          domU_check=""
> >          dom0_check="
> > -/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml && echo \"${passed}\"
> > +/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml ||:
> > +echo \"${passed}\"
> >  nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
> >  "
> >          if [ "${test_variant}" = "tools-tests-pvh" ]; then
> > @@ -297,6 +298,14 @@ TEST_RESULT=$?
> >  
> >  if [ -n "$retrieve_xml" ]; then
> >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > +    # Findout if one of the test failed
> > +    if ! grep -q '</testsuites>' tests-junit.xml; then
> > +        echo "ERROR: tests-junit.xml is incomplete or missing."
> > +        TEST_RESULT=1
> > +    # Only match "type=failure" to allow to "tolerable" for example.
> > +    elif grep -q '<failure type="failure"' tests-junit.xml; then
> 
> Maybe drop -q here, or add some message? Otherwise it's not obvious why it failed. See for example:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10968674458
> 
> Yes, you can click "Test summary" link, but it isn't obvious by looking
> at the final part of the log. Alternatively, this can be combined with
> my "CI: list failed tests at the end of tools job" patch (already
> reviewed by Andrew), but I had an impression this series is supposed to
> be included instead of that one.

Dropping "-q" sounds good here, it mean in your pipeline example we
would have the following in the logs:
   <failure type="failure" message="binary /usr/lib/xen/tests/test_vpci exited with code 134">
Which should be could enough for now.

Thanks,

-- 
Anthony PERARD


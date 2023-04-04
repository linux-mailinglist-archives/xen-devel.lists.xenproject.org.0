Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD76D63E3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517883.803833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjh4C-0007bk-MP; Tue, 04 Apr 2023 13:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517883.803833; Tue, 04 Apr 2023 13:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjh4C-0007Z3-JQ; Tue, 04 Apr 2023 13:51:20 +0000
Received: by outflank-mailman (input) for mailman id 517883;
 Tue, 04 Apr 2023 13:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7Av=73=citrix.com=prvs=45137d3e2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pjh4B-0007Yx-0X
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:51:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3bf9ca4-d2ef-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:51:16 +0200 (CEST)
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
X-Inumbo-ID: c3bf9ca4-d2ef-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680616276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x0PaaBcjCtio6kfl56+tYMtF5+jnjOaDFGTwPHgx+5s=;
  b=Nt1t4USWaFa/DfpUMnaGqWyZ6raGi82wb+reqZ3jUZ6Ogzr7Udt42iCi
   huTWCtS7w7uR1U3NS6rGn4FiQvDD78RDvFvYFO0+laqtdea8sRCp2KVkl
   ws9E+kgJUTOrlz/Z9Hu8zQHz8gwOFUubIKTGKb09fljTJKWFo4R5X+F8X
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103067229
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:qK19D6O0RDxVFobvrR2ql8FynXyQoLVcMsEvi/4bfWQNrUp2hDAAn
 zdKW2mHafaIZmT9L91ybd/g8kkC75TRn4diTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uB3OWtk0
 uITFCoydFPapubnnKu2bOY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSHp0LwRzC9
 woq+UzBGBcTMcKt5AOf61CFnu71rCLKdoA7QejQGvlC3wTImz175ActfVe2pPiRi0igWsleI
 UgZ5iovq6cp8EWhCNL6WnWQqWaJpBcGV/JMEucx70eGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tphTPdtxJN7C+ssfKA3Kp4
 jTb8DEzobpG2KbnyJ6HEUD7byOE/8aZFlBtul6GAgpJ/SsiOtf7OtXABUzzqK8Zcd3HFgTpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKRBaJxslcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIoWP8QvJVXcpn8+DaJ144wKuBF0+ZzTx
 L/BKZr8ZZrkIf8PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYejiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacifCRiXsqv85MKHgNBSyI/cFwc5zbq6etJU+RYc259zI8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:eC6zkakKtpA/BAnV6I88gvOIJKDpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103067229"
Date: Tue, 4 Apr 2023 14:51:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: Re: [xen-unstable-smoke test] 179929: regressions - trouble:
 blocked/fail/pass/starved
Message-ID: <20d41dd0-19d1-47fb-92ab-4de458ddd56f@perard>
References: <osstest-179929-mainreport@xen.org>
 <fbe7ded7-47f6-caec-dabb-6978d9e2a192@citrix.com>
 <17e95e93-a3a9-962c-1563-f9fc526320df@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <17e95e93-a3a9-962c-1563-f9fc526320df@citrix.com>

On Fri, Mar 24, 2023 at 08:37:06PM +0000, Andrew Cooper wrote:
> On 24/03/2023 8:28 pm, Andrew Cooper wrote:
> > On 24/03/2023 6:58 pm, osstest service owner wrote:
> >> flight 179929 xen-unstable-smoke real [real]
> >> http://logs.test-lab.xenproject.org/osstest/logs/179929/
> >>
> >> Regressions :-(
> >>
> >> Tests which did not succeed and are blocking,
> >> including tests which could not be run:
> >>  build-amd64                   6 xen-build                fail REGR. vs. 179926
> >
> > Bah.
> >
> > make[6]: Entering directory '/home/osstest/build.179929.build-amd64/xen/tools/firmware/etherboot'
> > set -e; if ! /usr/bin/wget -c -O _ipxe.tar.gz https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz; then \
> > 	git clone file:////osstest/IPXE-GIT-FORBIDDEN ipxe.git; \
> > 	(cd ipxe.git && git archive --format=tar --prefix=ipxe/ \
> > 	3c040ad387099483102708bb1839110bc788cefb | gzip -n >../_ipxe.tar.gz); \
> > 	rm -rf ipxe.git; \
> > fi
> > --2023-03-24 17:06:51--  https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz
> > Resolving cache (cache)... 172.16.148.6
> > Connecting to cache (cache)|172.16.148.6|:3128... connected.
> > ERROR: The certificate of 'xenbits.xen.org' is not trusted.
> > ERROR: The certificate of 'xenbits.xen.org' has expired.
> > Cloning into 'ipxe.git'...
> > fatal: '//osstest/IPXE-GIT-FORBIDDEN' does not appear to be a git repository
> > fatal: Could not read from remote repository.
> >
> > That's OSSTest choking, apparently with the same LE root cert problem?
> 
> Given that there's plenty of content wanting testing right now, and no
> chance of this being looked at until next week, I've reverted e1d750844
> (which was just a single hunk anyway) in the hopes that we can still get
> a useful weekend of testing

The certificate of the HTTPS proxy has been renewed, and osstest has
been updated to use the new certificates. So that commit should work.
In other word, osstest is ready for a revert of b5cc3c25a242 ("Revert
"build: Change remaining xenbits.xen.org link to HTTPS"")

Cheers,

-- 
Anthony PERARD


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3941D5B9CCD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407431.649956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYphQ-0000lx-5b; Thu, 15 Sep 2022 14:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407431.649956; Thu, 15 Sep 2022 14:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYphQ-0000k2-2m; Thu, 15 Sep 2022 14:18:40 +0000
Received: by outflank-mailman (input) for mailman id 407431;
 Thu, 15 Sep 2022 14:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOd1=ZS=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oYphP-0000jw-18
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:18:39 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47cdbc97-3501-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 16:18:36 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 20C585C00B0;
 Thu, 15 Sep 2022 10:18:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 15 Sep 2022 10:18:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 10:18:32 -0400 (EDT)
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
X-Inumbo-ID: 47cdbc97-3501-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663251513; x=1663337913; bh=uc+XqR1G3a
	dX/UrFkfpba42CUdgp2P3R7dUvUugk9ks=; b=WR8LTooNu/Y5Rsp8H6T2wm3hTE
	wv62Gtcbuwyeg6Gw0b3V/dFBV+GeW3yDJGtnH3s6pD6vTgZ61rKCCSjYVJ8NbsSc
	YWQpK6HroauI+tV8lOTsSIs+wTuDpc7PUvU5mK+QMBmRPdpS3eejDPqWeQvNXsJR
	cDDPEIL6F/LLWlplE1IPGUKkZid9gmPSCahsbKxzJZQISY6/D3jsTFCxBKqth+l8
	91JDSoJ/uiqfZfoPjHtpB9HYUF9sfL+wHlLc29TC5s3KguebulzAoUeWZD6XabC/
	VUArKbQLmw6GNwmsFMXGoVYUM118IthRivGGcF01+e6WjChZfsfsiBLToNuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663251513; x=
	1663337913; bh=uc+XqR1G3adX/UrFkfpba42CUdgp2P3R7dUvUugk9ks=; b=r
	ulSo8nOOwbQ1MoJayIE1NQfamD9wZBC+Hcr1Mgfvn0FFU0dL0oZvCbx7e4MJY5Bj
	kI8EBrTgdwmzuVm2NvyfGuk5JnH5e8/RSnAPulb5nsrdTzcQJ93uZ6/mDFty9JnY
	IdA/9/1R3njJWz04aznAhndwvz0H69p6OXIam2uDUBFM45Knfb/x7omuBYXKlWXN
	UiD+sB4WC+59CG0Bfdv3MHtiUvPqYTZnTfjGsfETlQiJbH+LRRJjWrQNBjRgN4zE
	Ivu7X8+yoD/B48cuVHudW6SikOxztecStVIGh7lPUsi1Gw/EyQ9RMAoFh0Vy063n
	s3T1BzdcmhQ8UWReI3zhw==
X-ME-Sender: <xms:ODQjY89d4zIzc1P7P9T8KSUqt7684q0ZEQEKzbWESxpoJcqMl0OF6g>
    <xme:ODQjY0sH4TX3sUD7CsmQHWHIRNN3G1OARB5IGanFFtUfTwX1V3vtWHaZkfcRydwcV
    2ms8Ba2Oov621Y>
X-ME-Received: <xmr:ODQjYyDV4dcuqJ9fXuN_JqIDXBaFrNj2Arl3k1QB_GH3zm-6dacQCE1vNLbT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtgfgjgesthekredttddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteehueelveejteefuefhgffhudfg
    hfejgedtgedthfeuteegteetleevveethefhnecuffhomhgrihhnpehinhhtvghlrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
    mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ODQjY8fqBU8j17PBJlg45slXau7IGLzAv6gJPY_RKjdDEOOITq7N6A>
    <xmx:ODQjYxOFKzTSXta-Nf0DohZpPK4bwGEYvOtJd84b6JGAAJoeZmt06Q>
    <xmx:ODQjY2lXgfjqs9TTIGXz_f-R1vtzOPca1G1BgMN2P_0pvjGrHnyhiA>
    <xmx:OTQjY0pLlzt3ygeI4wINKHB5uHP7KpoQv67rchOZHvJBClyuyoRyYQ>
Feedback-ID: iac594737:Fastmail
Date: Thu, 15 Sep 2022 10:18:30 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Message-ID: <YyM0NmTCWiNIuvS4@itl-email>
References: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
 <YyMLg7KbeOT1MMpH@itl-email>
 <006c5779-2ee5-0e37-1b00-c6c58ef57c71@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; x-action=pgp-signed
Content-Transfer-Encoding: 8bit
In-Reply-To: <006c5779-2ee5-0e37-1b00-c6c58ef57c71@xen.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Thu, Sep 15, 2022 at 01:56:06PM +0100, Julien Grall wrote:
> Hi Demi,
> 
> On 15/09/2022 12:24, Demi Marie Obenour wrote:
> > On Thu, Sep 15, 2022 at 12:04:55PM +0200, Jan Beulich wrote:
> > > [1] specifies a long list of instructions which are intended to exhibit
> > > timing behavior independent of the data they operate on. On certain
> > > hardware this independence is optional, controlled by a bit in a new
> > > MSR. Provide a command line option to control the mode Xen and its
> > > guests are to operate in, with a build time control over the default.
> > > Longer term we may want to allow guests to control this.
> > 
> > > Since Arm64 supposedly also has such a control, put command line option
> > > and Kconfig control in common files.
> > 
> > > [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
> > 
> > > Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Thanks for the patch, Jan!
> > 
> > > This may be viewed as a new feature, and hence be too late for 4.17. It
> > > may, however, also be viewed as security relevant, which is why I'd like
> > > to propose to at least consider it.
> > 
> > I consider it security relevant indeed, which is why I was so insistent
> > on it.  Whether it is worth a full XSA is up to the Xen Security Team.
> > If it could be backported to stable releases, that would be great.
> > 
> > Marek, Simon, would you consider backporting this to R4.1?
> > 
> > > Slightly RFC, in particular for whether the Kconfig option should
> > > default to Y or N.
> > 
> > I think it should default to Y as long as guests do not have the ability
> > to control this.
> 
> This raises two questions:
>  1) What is the performance impact to turn this on by default? I am looking
> for actual numbers.

I do not have access to such hardware and so cannot provide such
numbers.  I was hoping that someone else would be able to do the needed
benchmarking.

>  2) What happen on HW that doesn't support DIT? Are we going to mark them as
> unsupported?

The relevant text in Intel’s documentation is:

> For Intel® Core™ family processors based on microarchitectures before
> Ice Lake and Intel Atom® family processors based on microarchitectures
> before Gracemont that do not enumerate IA32_UARCH_MISC_CTL, developers
> may assume that the instructions listed here operate as if DOITM is
> enabled.
> 
> Intel Core family processors based on Ice Lake and later, such as
> Tiger Lake, Lakefield, and Rocket Lake will enumerate DOITM. Intel
> Atom processors based on Gracemont and later will also enumerate
> DOITM. Refer to the Enumeration and Architectural MSRs section for
> more information.

In other words, no action is needed (or possible) on CPUs that do not
enumerate DOITM.  CPUs that do enumerate DOITM require it to be
explicitly enabled by for cryptographic code to be secure.  This was a
poor design decision on Intel’s part, which might be why it appears that
Linux will treat DOITM as a CPU bug.

> >  Otherwise any cryptographic code in the guests thinks
> > it is constant time when it may not be.
> 
> Why would a guest think that? Are we telling the guest DIT is supported but
> doesn't honour it?

Xen is telling guests that DOITM is not required for constant-time
operation of cryptographic code, even though the hardware actually
requires it.  Furthermore, Xen does not allow guests to set DOITM.

> If yes, then I would argue that we should clear that bit. Otherwise...

Xen actually needs to *set* that bit, not clear it.

> >  Once guests have the ability to
> > control this I would be open to reconsidering this.
> 
> ... this will introduce a problem once we expose it to the guest because we
> cannot change the global default as some user my start to rely on it on the
> default.

I would be fine with requiring the toolstack to opt-out from the safe
default.
- -- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMjNDYACgkQsoi1X/+c
IsEi+RAAskGqEC1ParSsfyWS7fw9mhKzH+pS+IsKE5tjCu1l6Ctub17qqysC3Oej
yzqMPuK+YwwEW5X3SNlnd6Qs5C/2XIdkr8cwB8PitjMabS1dvJu01qIRbIyMDM2i
ii9qtuTLCDUAz5rrLW+qr0TE9vBcfteOKzkcWkmQQpWjermZHy+lHooXNmwjS9oc
J+nGbUWhNy1uNvFA+sUjEcEucAlSyM7UWkL/c9FzfWV2UwPWppdGpyz7jrRdZT+H
brb3FwRd1hoS4t94Xv9ynzZ9K7KeEZ5pF8rKOoKh0cfZ9Ydcuh0wr9dtD6aWTS3r
I2rNQig6AqurCF6AVUIlwf6TYcI71BRNDB3SQNAh7h5yxjy1S0srE0RLIZXFiboz
0RAyq76NFWS9qN2BG11PvfaG665EL14+7I+xaJxeSwPOZlUmbhTznYN7thFlx5MC
AxSwthokvIThiy1tpu3XdiU1zFWb5Spd4vwkSv/bo2fCPySECJ59tGsDtNvreJbf
z7A1CB968bTdPJAsYgY2OkkO+zFm3vR+fmrSia5b5cHoY80Mb0FmxKrPKxcOsyHJ
PJGoWMDxRxi0RTYi5nrI3qGWJSl9GpryQPX5jaB01mLcXHo/mmQB1PiFda+PioPa
T/bwpiYCc06EyeuJBMfu0Gv9NYnAuDC7qBtJfjKzm+OofrfWzQI=
=mpE9
-----END PGP SIGNATURE-----


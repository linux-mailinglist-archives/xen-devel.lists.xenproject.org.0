Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF44370971A
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 14:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537039.835766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzyvT-0004WD-A3; Fri, 19 May 2023 12:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537039.835766; Fri, 19 May 2023 12:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzyvT-0004Tv-7O; Fri, 19 May 2023 12:09:39 +0000
Received: by outflank-mailman (input) for mailman id 537039;
 Fri, 19 May 2023 12:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sKmR=BI=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1pzyvR-0004Tp-QG
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 12:09:38 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 046b5f1b-f63e-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 14:09:34 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id AC3AD5C0208;
 Fri, 19 May 2023 08:09:33 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 19 May 2023 08:09:33 -0400
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 147E1B6008D; Fri, 19 May 2023 08:09:31 -0400 (EDT)
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
X-Inumbo-ID: 046b5f1b-f63e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684498173; x=1684584573; bh=Mx
	aybIo+rxpirmU88Zvah8XfxfWvwDtpl+cNoSkys6I=; b=Q0MlMmxTzyw4pVVcJT
	vRqaslXkNToR2VaA4IHp2uzwMBULCK8c/Sxfynl9jnpFU5Oeb/24g73/8G2VcEMe
	GHJz37cuzeUD0J8zSy96C0q06yH5b0NYLYhaWn1Gw0LDYgl3zuB8ruBcheCitHnb
	oEz9J2qJ4iS/mhfdVw1BhrWZyZbuaN92Wd4Ns1DOvhwXE0dZEf387chWc1qNPvA7
	H6LeV3AEaLZ3wIAIievFk9VXl4/o5oNpipBDcCmKN05sLL2BwTEPCmjK2IV/OmoV
	ehq/Hcy4ULr/4ilyo7AGGTveSq5qN9w/6o90ZYcpQhCvG1Fc5t2twZRNORTKjrk+
	i6Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684498173; x=1684584573; bh=MxaybIo+rxpir
	mU88Zvah8XfxfWvwDtpl+cNoSkys6I=; b=rt1BNYexiUNroHAALgEkYqfePno/6
	XwxxgFiiA/Wbfk6hTu/XlsXLpj2AHFEuRDmj8gEVhc6SQdZ+PpfN5LOu72VUeQ9+
	y6HkzIq9c2aK8wyOuJTxVTj9nErufpZ5PcVxle9HXA9TfrFSnW+uaPpPlyO2Ceid
	Nq2uMrvdwvogH385uqOMUcv+nw9gADpplGLQQvcHLwSkeghzTZwikd2RghzmIra5
	kT91kkOSEcJ3Cm2ptafQldBC85kh7Ch2Nsk9MatlA38qTzcYrL6g4GF9GsbeeEAL
	pjztTxP5cRHtNfbhFK7i7HyixdZzM2u3vpo0Ij/FyoEjhsgGDuAN+0LPw==
X-ME-Sender: <xms:_GZnZJnWZB2IyypOr_yRnE0D3CvKXbEq05w1xtt0PEPHojUtrJ9MMQ>
    <xme:_GZnZE3xvucdo-tfM8QW2EAJZB2cLg5FK-b55YHFAak6yQxPgdokQkFRcuORdo1-b
    j0iVbQuppIa6aIaKBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeihedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:_GZnZPpDdGmXZCCb7m59J49-q5TnDSqQBwV6B31eJLU3NxqW9Mifmg>
    <xmx:_GZnZJn57hY2WDzP4ha-F1l54B-WWf1X7xyQqCE9g3bQ7QrrPpXeig>
    <xmx:_GZnZH2AT3tC_hFcIMFDqo84dtlpJ0mh489IMmq_BtxdyO71BrapSA>
    <xmx:_WZnZLLmQYCUSB-Wfx2NvnHGRoXma16YUbBHKSLs0RdQMpJEHg4p2w>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <9aaed1c3-9a7d-4348-b15f-2bb9be654bef@app.fastmail.com>
In-Reply-To: <a78d9dcd-0bc1-7e98-a8f1-e5d6cd0c09a3@intel.com>
References: <20230516193549.544673-1-arnd@kernel.org>
 <a78d9dcd-0bc1-7e98-a8f1-e5d6cd0c09a3@intel.com>
Date: Fri, 19 May 2023 14:09:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dave Hansen" <dave.hansen@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 x86@kernel.org
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Juergen Gross" <jgross@suse.com>,
 "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 "Alexey Makhalov" <amakhalov@vmware.com>,
 "VMware PV-Drivers Reviewers" <pv-drivers@vmware.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Darren Hart" <dvhart@infradead.org>,
 "Andy Shevchenko" <andy@infradead.org>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-pm@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 00/20] x86: address -Wmissing-prototype warnings
Content-Type: text/plain

On Thu, May 18, 2023, at 23:56, Dave Hansen wrote:
> On 5/16/23 12:35, Arnd Bergmann wrote:
>> 
>> All of the warnings have to be addressed in some form before the warning
>> can be enabled by default.
>
> I picked up the ones that were blatantly obvious, but left out 03, 04,
> 10, 12 and 19 for the moment.

Ok, thanks!

I've already sent a fixed version of patch 10, let me know if you
need anything else for the other ones.

> BTW, I think the i386 allyesconfig is getting pretty lightly tested
> these days.  I think you and I hit the same mlx4 __bad_copy_from()
> compile issue.

I did all my testing on randconfig builds, so I probably caught a lot
of the more obscure corner cases, but it doesn't always hit everything
that is in allyesconfig/allmodconfig.

       Arnd


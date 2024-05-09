Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1D8C0C53
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 10:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719117.1121706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4yui-0000h4-B8; Thu, 09 May 2024 08:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719117.1121706; Thu, 09 May 2024 08:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4yui-0000f7-7F; Thu, 09 May 2024 08:14:04 +0000
Received: by outflank-mailman (input) for mailman id 719117;
 Thu, 09 May 2024 08:14:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Rdn=MM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4yug-0000f1-Mu
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 08:14:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 172fc42b-0ddc-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 10:14:00 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34e7a35d5d4so429858f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 01:14:00 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc8esm1019480f8f.15.2024.05.09.01.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 01:13:59 -0700 (PDT)
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
X-Inumbo-ID: 172fc42b-0ddc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715242440; x=1715847240; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r4QhY4syQdA3dcGAQvCztiEB0K7cQzMPfGby1P/xNkU=;
        b=OsaDBFqvccmBQm0BGon2p7BbgRFDW2f4qtVr6znVNa7mHOu8csSdurqYlFughayFFb
         17IRc2tljSw05rNAvHaKHQEqQgqEv4EGKeUhnlj7PDB0vXpCkbvsOGTumR1XcfyNCrO1
         7nWgIckY84DwXL1A8gQSokhnyN2JvTa5hznEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715242440; x=1715847240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4QhY4syQdA3dcGAQvCztiEB0K7cQzMPfGby1P/xNkU=;
        b=SYjv+suXEnnqc/iQPDLY+8kve7fmqgFpcbqPVd3dN1Cz5E5EwSkI1Ct3kIRj3/WG+w
         3At72FmwRedv8NSGUSFgSTMFxiiqtc7jTrwhthTenAKrU6ZFWiOhohz4/WqIiJd8qNh5
         9xlVPz3zhxOrY7q86YkctV/wFcmj3B9FYueLmxD2Zv9agXURzooNHD4L5eMr1AZ4QSTO
         9FUVUTTHgCxkvioC0Wg1NY6xo2eZ3oVhEFDfnPhJRvFp1Urbfj9G32AYk7zQjRwyH2J4
         IW8vMGyxpcHwfCojuZ7cTwZPc0cYGXJTFogUXhQn7MKuvhbJVDjce2UQD/56+vDf/aaC
         NZ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpl1QKjCWcn35QX9g5EbyWSLpIQYG2TcNPhq7vgJH4GyuIcUp5EZV9Osqfd4ZpwZf5b7a5iN95JJ7fpHxtMtRFzM6tz5Z4IuqpcsHRba4=
X-Gm-Message-State: AOJu0YzUDzDFGz/N/Y6hwMLwvWlX/HGh8TaROF+XIeIb6/13dYmv/Ck9
	raGO3XDwERWFz+O8zdtouZr7uS8Rav+Spvks4paJZxQi0D6LvmIsZYGlhYmTh4o=
X-Google-Smtp-Source: AGHT+IH9NgWVp/YFWIQh9Wm7+y8a6hgfrygCsKrSZzRjOAsN9z809Lccl5RlrdnEQEVGoBLj1TMT1w==
X-Received: by 2002:a05:6000:1741:b0:34a:3f3d:bb22 with SMTP id ffacd0b85a97d-34fca2439dcmr3363188f8f.26.1715242439940;
        Thu, 09 May 2024 01:13:59 -0700 (PDT)
Date: Thu, 9 May 2024 10:13:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Message-ID: <ZjyFxrvHJ04ZlBGg@macbook>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
 <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
 <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org>

On Wed, May 08, 2024 at 11:11:04PM +0100, Julien Grall wrote:
> Hi,
> 
> CC-ing Roger as he is working on adding support for the foreign mapping on
> x86. Although, I am not expecting any implication as only 4KB mapping should
> be supported.

I don't think we have plans on x86 to support foreign mappings with
order != 0 ATM.

We would need a new interface to allow creating such mappings, and
it's also not clear to me how the domain that creates such mappings
can identify super-pages on the remote domain.  IOW: the mapping
domain could request a super-page in the foreign domain gfn space,
but that could end up being a range of lower order mappings.

Also the interactions with the remote domain would need to be audited,
as the remote domain shattering the superpage would need to be
replicated in the mapping side in order to account for the changes.

> On 08/05/2024 22:05, Julien Grall wrote:
> > On 07/05/2024 14:30, Luca Fancellu wrote:
> > > > On 7 May 2024, at 14:20, Julien Grall <julien@xen.org> wrote:
> > > > 
> > > > Hi Luca,
> > > > 
> > > > On 23/04/2024 09:25, Luca Fancellu wrote:
> > > > > From: Penny Zheng <Penny.Zheng@arm.com>
> > > > > But today, p2m_put_l3_page could not handle superpages.
> > > > 
> > > > This was done on purpose. Xen is not preemptible and therefore
> > > > we need to be cautious how much work is done within the p2m
> > > > code.
> > > > 
> > > > With the below proposal, for 1GB mapping, we may end up to call
> > > > put_page() up to 512 * 512 = 262144 times. put_page() can free
> > > > memory. This could be a very long operation.
> > > > 
> > > > Have you benchmark how long it would take?
> > > 
> > > I did not, since its purpose was unclear to me and was not commented
> > > in the last serie from Penny.
> > 
> > Honestly, I can't remember why it wasn't commented.
> 
> I skimmed through the code to check what we currently do for preemption.
> 
> {decrease, increase}_reservation() will allow to handle max_order() mapping
> at the time. On a default configuration, the max would be 4MB.
> 
> relinquish_p2m_mapping() is preempting every 512 iterations. One iteration
> is either a 4KB/2MB/1GB mapping.
> 
> relinquish_memory() is checking for preemption after every page.
> 
> So I think, it would be ok to allow 2MB mapping for static shared memory but
> not 1GB. relinquish_p2m_mapping() would also needs to be updated to take
> into account the larger foreign mapping.

FWIW, relinquish_p2m_mapping() likely does more than what's strictly
needed, as you could just remove foreign mappings while leaving other
entries as-is?  The drain of the p2m pool and release of domain pages
should take care of dropping references to the RAM domain memory?

> I would consider to check for preemption if 't' is p2m_map_foreign and the
> order is above 9 (i.e. 2MB).

How can those mappings be removed?  Is it possible for the guest to
modify such foreign super-pages?  Not sure all paths will be easy to
audit for preemption if it's more than relinquish_p2m_mapping() that
you need to adjust.

Regards, Roger.


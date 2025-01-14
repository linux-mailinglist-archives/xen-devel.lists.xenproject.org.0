Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57AA10657
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 13:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871308.1282333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfnu-0007Kn-NL; Tue, 14 Jan 2025 12:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871308.1282333; Tue, 14 Jan 2025 12:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfnu-0007ID-KH; Tue, 14 Jan 2025 12:13:54 +0000
Received: by outflank-mailman (input) for mailman id 871308;
 Tue, 14 Jan 2025 12:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXfnt-0007I7-MX
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 12:13:53 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04adf0e4-d271-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 13:13:52 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d9f06f8cf2so2470100a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 04:13:52 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e1fesm627620366b.2.2025.01.14.04.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 04:13:51 -0800 (PST)
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
X-Inumbo-ID: 04adf0e4-d271-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736856832; x=1737461632; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UVAvvLm1iFc6Iabd5RJ2uYFUbgoKPkWiZ/vM5RQWmc0=;
        b=hCK9kSTqAiHibZ328w4Ks2C/gOypv5noTh/8DwogRxjChUqgCfapa3az2d/JF6Bxay
         fp2ZpyWuKWESf4075aA4WK7PCnYOtXCxV299cr9pCz7pxupmRW+lC70d9nTfuEhFzaSd
         7NlynGtSYqVAzZuUWxlqh55GJFp9rlhfcEYbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736856832; x=1737461632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVAvvLm1iFc6Iabd5RJ2uYFUbgoKPkWiZ/vM5RQWmc0=;
        b=e8KJ7pJsjMuhwb3h7QACKgPTKWeAx8h8w8vB6NFYbiPlCjRnkkgd/qQyYdSNzjxymv
         Kh4m+cbTaT6tOsOdmjHaqSe/YKBB5/acI7nk3dzj9e7gk8WYLgJ3eNF9RSZrw8zEISsF
         RxycwMpHsXozFLjPZk2SOZgrj1OFDmAhNcb4Y2eAUssHWaz4bViLfO/zjSDxUp45dsb+
         rjo5fOCimXmR039y0Za3Zr1NgukeSc5rb1iquluCklCFG7fF/5xwS5k/Tnlp9RzR0/tH
         RNsb88XqQOYpPIXnzCN7IxkEjETByqPMqwfhFvgWg9DynV4n45vBSQon2Br0rWadygO9
         ML3w==
X-Forwarded-Encrypted: i=1; AJvYcCUMPenzSQtU0fzmIIzBT1LObqnCqOTqDoUaMa26CQ5PRS7HAzKCAyFTglzncrpoTGZxX0JolKMHhLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyxbfrtAyIOENEWWcs5sQgQcCS9WqdPvm/ULrIBBnKX/fIrTkb
	KaKRgmKKRfMrxE6L3dx2PNpO6SaEijpOsuD3y+oTmSArrgAutdFzFp/VihhOMfk=
X-Gm-Gg: ASbGncvFid3WTig2rt3mQ6n50T5t+P74NCMA1z9t9iP3Hh9KJPm2PkOPNIezCXNg1uh
	3hdZ3t3Cu19aE5sC+4Q8uMremiZ7T6X9ndJQlybwek+FSHuOyBvpFqHubiABw/wpx79xtQMZ5v6
	1A+HZhWnXuza9VX6HJkYWZiT4aQbrXvVKhmK0VeEo5AtSMholXdCCbh7+2EOSFElNMCkAVnW/eP
	auUxN5IXZAn7rOIuMdhsoOq0B5jqveE2WbKCxDndFDb2pFHHo3mHQ0dmfKz5Q==
X-Google-Smtp-Source: AGHT+IE2RvQNuCq+nFgomferJhDxYHyouh4NfOPv3utVN7kuHiPpwL+KM8t6fS5Xoe/oRM4YsL65kw==
X-Received: by 2002:a17:907:9406:b0:aab:73c5:838 with SMTP id a640c23a62f3a-ab2ab710907mr1943819366b.29.1736856831821;
        Tue, 14 Jan 2025 04:13:51 -0800 (PST)
Date: Tue, 14 Jan 2025 13:13:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <Z4ZU_uvCe5lu0aMv@macbook.local>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <Z4U6WxtmaqGkqOqe@mail-itl>
 <Z4VS88REbzn5uasy@macbook.local>
 <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>
 <Z4ZKINmJXw5T2dsM@macbook.local>
 <78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com>
 <9288f0de-945f-4056-9934-16b2b1704fb1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9288f0de-945f-4056-9934-16b2b1704fb1@gmail.com>

On Tue, Jan 14, 2025 at 12:44:39PM +0100, Oleksii Kurochko wrote:
> 
> On 1/14/25 12:40 PM, Oleksii Kurochko wrote:
> > 
> > 
> > On 1/14/25 12:27 PM, Roger Pau Monné wrote:
> > > On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
> > > > On 1/13/25 6:52 PM, Roger Pau Monné wrote:
> > > > > On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
> > > > > > > Allow setting the used wallclock from the command line.  When the option is set
> > > > > > > to a value different than `auto` the probing is bypassed and the selected
> > > > > > > implementation is used (as long as it's available).
> > > > > > > 
> > > > > > > The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
> > > > > > > supported built-in) or from UEFI firmware respectively.
> > > > > > > 
> > > > > > > Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> > > > > > Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
> > > > > Thanks for the review.
> > > > > 
> > > > > Oleksii, can I get your opinion as Release Manager about whether this
> > > > > (and the following patch) would be suitable for committing to staging
> > > > > given the current release state?
> > > > > 
> > > > > It's a workaround for broken EFI implementations that many downstreams
> > > > > carry on their patch queue.
> > > > Based on your commit message, I understand this as addressing a bug ( but not very critical
> > > > as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
> > > > reviewed and tested, we should consider including it in the current release.
> > > IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
> > > the same behavior as proposed here.
> > > 
> > > > IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
> > > > It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
> > > > value over time. After that, we could consider making "auto" the default.
> > > > That said, I am not particularly strict about following this approach.
> > > We cannot really set efi as the default, as it would break when
> > > booting on legacy BIOS systems.
> > > 
> > > We could take only patch 1 and leave patch 2 after Xen 4.20 has
> > > branched, but at that point I would see little benefit in having just
> > > patch 1.
> > I don't see a lot of benefit of comitting only the one patch either.
> > 
> > 
> > > I don't have a strong opinion, but downstreams have been complaining
> > > about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
> > > good to not ship yet another release with such allegedly broken
> > > behavior.
> > Agree with that. As  I mentioned above I consider it as a bug and based on
> > that several mentioned above downstreams have the similar patch I could consider
> > that as tested approach so ..
> > > Let me know what you think, as I would need a formal Release-Ack if
> > > this is to be committed.
> > ... R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>.
> 
> Sorry for the noise.
> 
> I missed to add that it would also be nice to mention IMO ( that now we have wallclock parameter )
> in CHANGELOG so downstreams will receive "notification" that Xen provides a workaround for the mentioned
> issue in the patch series.

Indeed.  Would you be OK with adding the following chunk to patch 2?

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8507e6556a56..1de1d1eca17f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    leaving this to the guest kernel to do in guest context.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
+   - Prefer CMOS over EFI_GET_TIME as time source.
    - Switched the xAPIC flat driver to use physical destination mode for external
      interrupts instead of logical destination mode.
 
@@ -24,6 +25,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support for LLC (Last Level Cache) coloring.
  - On x86:
    - xl suspend/resume subcommands.
+   - `wallclock` command line option to select time source.
 
 ### Removed
  - On x86:


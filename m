Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D86234E7CB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 14:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103504.197443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRDlr-0002xP-T4; Tue, 30 Mar 2021 12:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103504.197443; Tue, 30 Mar 2021 12:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRDlr-0002x4-PV; Tue, 30 Mar 2021 12:46:59 +0000
Received: by outflank-mailman (input) for mailman id 103504;
 Tue, 30 Mar 2021 12:46:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jb9t=I4=redhat.com=sgarzare@srs-us1.protection.inumbo.net>)
 id 1lRDlp-0002wz-FT
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 12:46:57 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c2a63d30-10c8-456b-84e7-87a5861093eb;
 Tue, 30 Mar 2021 12:46:54 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-RS2dCQRoNFK1nBPBv0HgtA-1; Tue, 30 Mar 2021 08:46:51 -0400
Received: by mail-wr1-f70.google.com with SMTP id 75so10284660wrl.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Mar 2021 05:46:51 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id h14sm42512910wrq.45.2021.03.30.05.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 05:46:49 -0700 (PDT)
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
X-Inumbo-ID: c2a63d30-10c8-456b-84e7-87a5861093eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617108414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9w+72Aj7tixZ62yUVO/4XVYc4FIACD1jnUr/XYw2nFs=;
	b=ahWnKn4PaStZMg+UIYpQYLRTQqYt0jEG1QcyouoLp66BddT5h0qW9OHQfbdMmf6+URP59U
	TosgGLTOdCVPT6gsOH+YmImk1w/tWZvF/JVlV0ZtyBJMfmzlBn3BVQgtjUC3ZVibuiEsei
	SfrPzb3dR7MsyFsxdfTUJzFiq2zfB+Y=
X-MC-Unique: RS2dCQRoNFK1nBPBv0HgtA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9w+72Aj7tixZ62yUVO/4XVYc4FIACD1jnUr/XYw2nFs=;
        b=g7kxmoPTZDcYBbGse4FWAX0nR799OkX9UQGlzeaL5b8IwRCrmTauWwrCLoqVVGfyAJ
         Re5CV7xJvB1BTwKEhQPRquWu4nD4+NXM4BjcTN0wesC3tk5+LduOQkta/iEmvNc9dnOB
         aHzlTAW1SlQRKWfgPflUyJpSnyZ7G+pzW4X7s4WzopsVbdzrDlayU0zOpSYTaA0gbYAZ
         03NNMpnv9MfTh1CMGHUw2/8s7O7SyvCfPR4UptkUA+ysvxjUkxSCiPegtMqQSTzwthS3
         1NtrLzh34eT0crQcMtAAzveUuBF0Qr/8/PSimoY4JIxrODhxWmCJu2uxE2s+9gfqZK2G
         JMaQ==
X-Gm-Message-State: AOAM530CfT/pALlgo4RrfkTmbjfANYVj8bsHQNiJMEKsQ+W0OmPK9jCk
	VTjPKmz/lME4yFrH8/6/8g9FhbOTgx43xthBRPqGIMRPm49s5ZJeyTzmQTVaZKjJqFAu/QFx8Do
	MEe//wzSGCG7VGVcIJukzaKliUOg=
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr4030589wmf.47.1617108409891;
        Tue, 30 Mar 2021 05:46:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwoSfXbZE9GRn6JXQxrGnbEqKBbh3vEcivUtlrm5T41kSRh1O0Ms6q4FbVIBxfw7LXgE1xGw==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr4030564wmf.47.1617108409656;
        Tue, 30 Mar 2021 05:46:49 -0700 (PDT)
Date: Tue, 30 Mar 2021 14:46:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: John Simpson <ttr9droid@gmail.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	"gcc-help@gcc.gnu.org" <gcc-help@gcc.gnu.org>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: An error due to installation that require binutils package
Message-ID: <20210330124646.jl4re5srmbzhkipm@steredhat>
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
 <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi John,

On Mon, Mar 29, 2021 at 09:46:49PM +0300, John Simpson wrote:
>Hello,
>
>Kindly ask you to have a look at this bug.
>Thank you for your replies.

It's already fixed in QEMU upstream and the fix will be released with 
the 6.0 version next month (the rc0 is already available):
https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f51884e0a26e53

I guess xen-4.14.1 is using an older version, so if you want you can 
backport that patch in your version, the change should be simple.

Thanks,
Stefano

>
>On Mon, Mar 29, 2021 at 7:07 PM George Dunlap <George.Dunlap@citrix.com>
>wrote:
>
>> John,
>>
>> Thanks for your report.  Can you post your bug report
>> xen-devel@lists.xenproject.org ?
>>
>> The bug is in the compilation of QEMU, which is an external project; so
>> it’s possible that we’ll end up having to raise this with that community as
>> well.
>>
>> Thanks,
>>  -George Dunlap
>>
>> > On Mar 28, 2021, at 2:26 PM, John Simpson <ttr9droid@gmail.com> wrote:
>> >
>> > Hello,
>> >
>> > Just forwarding this message to you. Can you give some thoughs about
>> this? Thanks a lot.
>> >
>> >
>> > ---------- Forwarded message ---------
>> > From: Alan Modra <amodra@gmail.com>
>> > Date: Sun, Mar 28, 2021 at 2:21 PM
>> > Subject: Re: An error due to installation that require binutils package.
>> > To: John Simpson <ttr9droid@gmail.com>
>> > Cc: <binutils@sourceware.org>
>> >
>> >
>> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils
>> wrote:
>> > >   BUILD   pc-bios/optionrom/kvmvapic.img
>> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> >
>> > -no-pie is a gcc option.  Neither -no-pie nor --no-pie is a valid ld
>> > option.  The fault lies with whatever passed -no-pie to ld.
>> >
>> > --
>> > Alan Modra
>> > Australia Development Lab, IBM
>> >
>> >
>> >
>> > ---------- Forwarded message ---------
>> > From: Andreas Schwab <schwab@linux-m68k.org>
>> > Date: Sun, Mar 28, 2021 at 2:17 PM
>> > Subject: Re: An error due to installation that require binutils 
>> > package.
>> > To: John Simpson via Binutils <binutils@sourceware.org>
>> > Cc: John Simpson <ttr9droid@gmail.com>
>> >
>> >
>> > Please report that to the xen project.  ld -no-pie doesn't have a useful
>> > meaning.  It used to mean the same as ld -n -o-pie, which sets "-pie" as
>> > the output file name.
>> >
>> > Andreas.
>> >
>> > --
>> > Andreas Schwab, schwab@linux-m68k.org
>> > GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
>> > "And now for something completely different."
>> >
>> >
>> >
>> > ---------- Forwarded message ---------
>> > From: John Simpson <ttr9droid@gmail.com>
>> > Date: Sun, Mar 28, 2021 at 12:55 PM
>> > Subject: An error due to installation that require binutils package.
>> > To: <binutils@sourceware.org>
>> >
>> >
>> > Hello,
>> >
>> > Recently I got a following error due to installation xen on
>> 5.11.6-1-MANJARO kernel:
>> >
>> >   GEN     target/riscv/trace.c
>> >   GEN     target/s390x/trace.c
>> >   GEN     target/sparc/trace.c
>> >   GEN     util/trace.c
>> >   GEN     config-all-devices.mak
>> > make[1]: Entering directory
>> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
>> > make[1]: Nothing to be done for 'all'.
>> > make[1]: Leaving directory
>> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
>> >   BUILD   pc-bios/optionrom/multiboot.img
>> >   BUILD   pc-bios/optionrom/linuxboot.img
>> >   BUILD   pc-bios/optionrom/linuxboot_dma.img
>> >   BUILD   pc-bios/optionrom/kvmvapic.img
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: multiboot.img] Error 1
>> > make[1]: *** Waiting for unfinished jobs....
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1
>> >   BUILD   pc-bios/optionrom/pvh.img
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: linuxboot.img] Error 1
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:53: kvmvapic.img] Error 1
>> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
>> > make[1]: *** [Makefile:50: pvh.img] Error 1
>> > make: *** [Makefile:581: pc-bios/optionrom/all] Error 2
>> > make: Leaving directory
>> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen-build'
>> > make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2
>> > make[3]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
>> > make[2]: ***
>> [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.mk:235:
>> subdirs-install] Error 2
>> > make[2]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
>> > make[1]: *** [Makefile:72: install] Error 2
>> > make[1]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
>> > make: *** [Makefile:134: install-tools] Error 2
>> > ==> ERROR: A failure occurred in build().
>> >     Aborting...
>> >
>> > Currently I have fresh binutils 2.36.1-2 and it seems to me that the
>> issue is related to this part of code:
>> >
>> > https://github.com/bminor/binutils-gdb/blob/master/ld/lexsup.c#L451
>> >
>> > It seems to me that this could impact far more users than just me.
>> >
>>
>>



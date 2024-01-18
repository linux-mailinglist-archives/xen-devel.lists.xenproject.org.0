Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D80831954
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 13:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668747.1041146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQRi6-0005GO-Io; Thu, 18 Jan 2024 12:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668747.1041146; Thu, 18 Jan 2024 12:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQRi6-0005DD-Fp; Thu, 18 Jan 2024 12:41:30 +0000
Received: by outflank-mailman (input) for mailman id 668747;
 Thu, 18 Jan 2024 12:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSQR=I4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQRi5-0005D7-Ly
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 12:41:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5780322-b5fe-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 13:41:27 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e958cd226so2641075e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 04:41:27 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c501200b0040e77ce8768sm13785273wmr.16.2024.01.18.04.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 04:41:26 -0800 (PST)
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
X-Inumbo-ID: e5780322-b5fe-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705581687; x=1706186487; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NyKHm4vEseI6bXE39i2WxjW1JGBWAtM9iUpd8Fe1nu4=;
        b=q1M5+0u1XDI7GMqm6SXpJg7ZLMSR7c6klpASS7R7G9xHZGfug1gCjHgANBbXCl9JIJ
         Ri8s88/oFW+nGIHlBEmYXRvAvkO6W6kfPnQiVTdaNGYEP5ZU3cGOXShgj53tOgsAkb0x
         /8ngMVGoTRqYNJgA1byq1GwFD/rWCup/li+9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705581687; x=1706186487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyKHm4vEseI6bXE39i2WxjW1JGBWAtM9iUpd8Fe1nu4=;
        b=aUxSEpV5wo/B+wOT+XTcPAs4FIC33yE5SQ4JE5HXaH9mMHllVeX/2UBzsQDeRNA3VS
         lKeNB7HUqKf5I5moKbLjUxSVm3OU4ek29DhhO0hsCQk1vY7juXfUl1cT7c2T6TDQu0PM
         Vd9mTz7xxVTUewEtHXjepctssDeoKWxN6CH546Z3jcs9UjckTg5xZXAgAY2z2xPXUDzy
         oObYeknkSRm6F0eEMqOsJymg/W74uNf1vPTILM6f+x7BGMQ9ZesUKPRJNw6+a2za6zeA
         do0mzlc8EVe1F70ghgOnh4UJ4oZLF7YbA5Gq9KIC/5hpjOMk8u30u9hfZsjuqjnd35J0
         RB7Q==
X-Gm-Message-State: AOJu0Yw3Wi/K5SP5FsYHVfDOYvRfn4AYNV+K+Tu7nHAFy6FEpjlEqAR2
	agRp2Su192KXiKWIDYGbBc/atrBWC/nG8lpgSUIbSSfkc9QsyvREcsc1QT2zyeM=
X-Google-Smtp-Source: AGHT+IEjrh3srcXY/MuTik7prrgf7Fjpi/UGfUlatgBw4/imkMl5uXjqpWLCMyklnbT+QPlgELktRQ==
X-Received: by 2002:a05:600c:6b13:b0:40e:5313:e822 with SMTP id jn19-20020a05600c6b1300b0040e5313e822mr472684wmb.174.1705581686726;
        Thu, 18 Jan 2024 04:41:26 -0800 (PST)
Date: Thu, 18 Jan 2024 13:41:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>, Huang Rui <ray.huang@amd.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>
Subject: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
Message-ID: <ZakcdfS3UwEb0oh2@macbook>
References: <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook>
 <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZajzcpArQYQhdj3T@macbook>

On Thu, Jan 18, 2024 at 10:46:26AM +0100, Roger Pau Monné wrote:
> On Thu, Jan 18, 2024 at 03:34:13AM -0500, Patrick Plenefisch wrote:
> > On Thu, Jan 18, 2024 at 3:27 AM Roger Pau Monné <roger.pau@citrix.com>
> > wrote:
> > 
> > > On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> > > > On Wed, Jan 17, 2024 at 3:46 AM Jan Beulich <jbeulich@suse.com> wrote:
> > > >
> > > > > On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > > > > > On Tue, Jan 16, 2024 at 4:33 AM Jan Beulich <jbeulich@suse.com>
> > > wrote:
> > > > > >
> > > > > >> On 16.01.2024 01:22, Patrick Plenefisch wrote:
> > > > For the two logs that actually boooted (linuxoffset), I truncated them
> > > > during pcie initialization, but they did go all the way to give me a
> > > login
> > > > screen
> > >
> > > I'm not seeing any Linux output on the provided logs, they just seem
> > > to contain Xen output ...
> > >
> > > > >
> > > > > > As someone who hasn't built a kernel in over a decade, should I
> > > figure
> > > > > out
> > > > > > how to do a kernel build with CONFIG_PHYSICAL_START=0x2000000 and
> > > report
> > > > > > back?
> > > > >
> > > > > That was largely a suggestion to perhaps allow you to gain some
> > > > > workable setup. It would be of interest to us largely for completeness.
> > > > >
> > > >
> > > > Typo aside, setting the boot to 2MiB works! It works better for PV, while
> > > > PVH has some graphics card issues, namely that I have to interact over
> > > > serial and dmesg has some concerning radeon errors
> > >
> > > ... and so the radeon error mentioned here seem to be missing.  IIRC
> > > for radeon cards to work on PVH dom0 you will need an hypervisor with
> > > the following commit:
> > >
> > >
> > > https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=f69c5991595c92756860d038346569464c1b9ea1
> > >
> > > (included in 4.18)
> > >
> > 
> > hmm.. that would mean I was running with them as I used 4.18 for that run
> > 
> > 
> > >
> > > There where also some changes not long ago in order to propagate the
> > > video console information from Xen into dom0, those are also included
> > > in 4.18, but I don't recall in which Linux version they landed.
> > >
> > > Anyway, would be good if you can provide the full Xen + Linux logs
> > > when the radeon issue happens.
> > >
> > 
> > Luckily linux logs are mercifully short. Append this to
> > xen-4.18p_grub_linuxoffset_pvh.log:
> > 
> > [    0.778770] i2c_designware AMDI0010:00: Unknown Synopsys component type:
> > 0xffffffff
> > [    0.914664] amd_gpio AMDI0030:00: error -EINVAL: IRQ index 0 not found
> > [    0.930112] xen_mcelog: Failed to get CPU numbers
> > [    8.324907] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)
> > [    8.338604] sp5100-tco sp5100-tco: Watchdog hardware is disabled
> > [    8.909366] [drm:radeon_get_bios [radeon]] *ERROR* ACPI VFCT table
> > present but broken (too short #2)
> 
> Hm, interesting.  I will have to add more debug in order to check
> what's going on here, seems like the table is corrupted somehow.

From that environment (PVH dom0) can you see if you can dump the
contents of the VFCT table?  I don't have a system with that table, so
not sure if this will work (because iasl is unlikely to know how to
decode it):

# acpidump -n VFCT -o table.dump
# acpixtract -a table.dump
# iasl -d vfct.dat
# cat vfct.dsl

Would be good if you can compare the output from what you get on a PV
dom0 or when running native Linux.

I'm also adding some AMD folks, as IIRC they did some fixes to Linux
in order to get some AMD graphics cards running on a PVH dom0, maybe
they can provide some additional input.

Thanks, Roger.


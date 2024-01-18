Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF1831623
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 10:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668675.1041053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOym-00066B-AU; Thu, 18 Jan 2024 09:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668675.1041053; Thu, 18 Jan 2024 09:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOym-00064b-79; Thu, 18 Jan 2024 09:46:32 +0000
Received: by outflank-mailman (input) for mailman id 668675;
 Thu, 18 Jan 2024 09:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSQR=I4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQOyk-00064K-MJ
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 09:46:30 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73733ba8-b5e6-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 10:46:28 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e884de7b9so22034965e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 01:46:28 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c314500b0040d7c3d5454sm29140637wmo.3.2024.01.18.01.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 01:46:27 -0800 (PST)
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
X-Inumbo-ID: 73733ba8-b5e6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705571187; x=1706175987; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puXrBilTDxI72zyZpuBuK2Rq18fv0jBsHWewbnPjzm8=;
        b=UmJiiyMygesK0GqUUxexDD+r+czkU162Z2L4DawmAzQFkepQb244qnikRmD3K4tiks
         5vdYhP4ernmMnbVkS36FwESZdsx5v4twm2tzJVWZeSwt1LXuIQdRX2+eZHqePvAQINb9
         F6iu/5j/uTL5oMCMNwKJzOxavAwaaWlk0yaAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705571187; x=1706175987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puXrBilTDxI72zyZpuBuK2Rq18fv0jBsHWewbnPjzm8=;
        b=f3qd7TdkIeCD04MFhT5HCClIhpPRgc2ql/0TVkutUFhTqEtJ/TsfTzoon818XJVcQi
         SHFOg4NLplPXnpGl1vn23Cli0/WhfKeXT2LDfRG9Qmk2F3Q7fpBKBNfQRClFNeaZ7mkJ
         AGc4qjPz/QUpJxiaIGohmet52If1u+DQvpbDI1MX3CPpv0UjEWNLtZrzya3tknsMOoFd
         b0K1tafmxkfqkfh/a2Rcsvu1g4sGABwCLO5nG3DuOk/BHJiAkMrxNJv4oMNMz20ycsco
         QDve9o0L0ewcXXuIJSQjwCstgr5Rt0qt/BYGvzQgd5RIv6xflZCc+mPjLmm4vDSDu8hF
         YKDg==
X-Gm-Message-State: AOJu0Yw7nDEZtb5iqfJoZqpFFsEp01uwlGZ0ODjr9Kz2l+AyfbroF7sO
	fCVfzf42G6ueqLMG/YpE984l4ZorT69N04ilTFFueZm8ohU/8UFErmaba9jo8Ng=
X-Google-Smtp-Source: AGHT+IFB4LFK+fiGnFD6ThrA28W0ppTfvyF32ebfjTtE5jptnHJ2JDQX9ydtKBuItXC65BHdGsFLKw==
X-Received: by 2002:a05:600c:18a3:b0:40e:671e:5406 with SMTP id x35-20020a05600c18a300b0040e671e5406mr359355wmp.80.1705571187460;
        Thu, 18 Jan 2024 01:46:27 -0800 (PST)
Date: Thu, 18 Jan 2024 10:46:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZajzcpArQYQhdj3T@macbook>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook>
 <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>

On Thu, Jan 18, 2024 at 03:34:13AM -0500, Patrick Plenefisch wrote:
> On Thu, Jan 18, 2024 at 3:27 AM Roger Pau Monné <roger.pau@citrix.com>
> wrote:
> 
> > On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> > > On Wed, Jan 17, 2024 at 3:46 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >
> > > > On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > > > > On Tue, Jan 16, 2024 at 4:33 AM Jan Beulich <jbeulich@suse.com>
> > wrote:
> > > > >
> > > > >> On 16.01.2024 01:22, Patrick Plenefisch wrote:
> > > For the two logs that actually boooted (linuxoffset), I truncated them
> > > during pcie initialization, but they did go all the way to give me a
> > login
> > > screen
> >
> > I'm not seeing any Linux output on the provided logs, they just seem
> > to contain Xen output ...
> >
> > > >
> > > > > As someone who hasn't built a kernel in over a decade, should I
> > figure
> > > > out
> > > > > how to do a kernel build with CONFIG_PHYSICAL_START=0x2000000 and
> > report
> > > > > back?
> > > >
> > > > That was largely a suggestion to perhaps allow you to gain some
> > > > workable setup. It would be of interest to us largely for completeness.
> > > >
> > >
> > > Typo aside, setting the boot to 2MiB works! It works better for PV, while
> > > PVH has some graphics card issues, namely that I have to interact over
> > > serial and dmesg has some concerning radeon errors
> >
> > ... and so the radeon error mentioned here seem to be missing.  IIRC
> > for radeon cards to work on PVH dom0 you will need an hypervisor with
> > the following commit:
> >
> >
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=f69c5991595c92756860d038346569464c1b9ea1
> >
> > (included in 4.18)
> >
> 
> hmm.. that would mean I was running with them as I used 4.18 for that run
> 
> 
> >
> > There where also some changes not long ago in order to propagate the
> > video console information from Xen into dom0, those are also included
> > in 4.18, but I don't recall in which Linux version they landed.
> >
> > Anyway, would be good if you can provide the full Xen + Linux logs
> > when the radeon issue happens.
> >
> 
> Luckily linux logs are mercifully short. Append this to
> xen-4.18p_grub_linuxoffset_pvh.log:
> 
> [    0.778770] i2c_designware AMDI0010:00: Unknown Synopsys component type:
> 0xffffffff
> [    0.914664] amd_gpio AMDI0030:00: error -EINVAL: IRQ index 0 not found
> [    0.930112] xen_mcelog: Failed to get CPU numbers
> [    8.324907] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)
> [    8.338604] sp5100-tco sp5100-tco: Watchdog hardware is disabled
> [    8.909366] [drm:radeon_get_bios [radeon]] *ERROR* ACPI VFCT table
> present but broken (too short #2)

Hm, interesting.  I will have to add more debug in order to check
what's going on here, seems like the table is corrupted somehow.

Would you be able to build a new version of Xen if I provide you with
an extra debug patch?

Thanks, Roger.


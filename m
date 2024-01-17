Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E389983017A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 09:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668279.1040336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1ZU-000637-8K; Wed, 17 Jan 2024 08:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668279.1040336; Wed, 17 Jan 2024 08:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1ZU-00060S-57; Wed, 17 Jan 2024 08:46:52 +0000
Received: by outflank-mailman (input) for mailman id 668279;
 Wed, 17 Jan 2024 08:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKNn=I3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQ1ZT-0005dn-DC
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 08:46:51 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4cce620-b514-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 09:46:50 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e88012233so6832655e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 00:46:50 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 s15-20020a5d510f000000b00336aa190139sm1131065wrt.5.2024.01.17.00.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 00:46:50 -0800 (PST)
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
X-Inumbo-ID: f4cce620-b514-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705481210; x=1706086010; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4795QVuBXQRA8W3EjLVdmXbAH84YHjJbA2oiYBRns/A=;
        b=VEwtrsZ/7MSubG2jU7hCXUYmIyzGEGb88Jd4CJMrXDLiNWRsDagYzDcEC5v3N64xu5
         6nGL+jHL+ml2jB5JlmzyanSIsWes0xoa/YtbrfVE+OTsbp+759UspcgQ2aqGq7BG4yH3
         jDPTHfPM/uFeF0arSZoWLy3bNrd0sJTGnMwrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481210; x=1706086010;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4795QVuBXQRA8W3EjLVdmXbAH84YHjJbA2oiYBRns/A=;
        b=klROV2PcbLtg1+/HdvvhEqtzpLjXPCo1S692ovvjcrQGCYGvSwlAJ+viE/wQTCb2Bk
         fIeR+GsOsSk8vlgNrUCPoRlDqPiaCsRa5tRL4qqbkv/jGvhXfzNHxAi2r4AYQ3gTXBrt
         7Wc7BvjIRxyqhL0fAxfW5hERkyXpvL3SVACaX7oPFMc7YipA/CjoKIyjc2P91tTR5Qt4
         6KI9/hMQYWnveW7WlG+Z1JgR18lB60fYd1/Jmg5rr4DceRKZ6//GfSZwCy+d0hXIxxF+
         76wzrUtR5Oxc7gEykMQjqjCyHEXomnO0Rc13h8BsBipIKsbmbbf+Us1Nya5if68NmPvl
         yP+A==
X-Gm-Message-State: AOJu0YxEl22qYaLTWlqFEoPogBSSe0hQNkQgmPTB3+1P2pxwMknlyrai
	t+5WTSVWC/heqyjPS9bmf/sr1zvnmsI2mA==
X-Google-Smtp-Source: AGHT+IEh9r4Wd1c+hdgjwLI7PgkPlu9EFWlQ5+kn/NWp5p9WCsUr4xghWVLNBM8N+BM+oG+dmQvTLg==
X-Received: by 2002:a05:600c:2482:b0:40e:4800:a0ee with SMTP id 2-20020a05600c248200b0040e4800a0eemr4513835wms.171.1705481210202;
        Wed, 17 Jan 2024 00:46:50 -0800 (PST)
Date: Wed, 17 Jan 2024 09:46:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZaeT-ZqDYiE_BiWE@macbook>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>

On Wed, Jan 17, 2024 at 01:12:30AM -0500, Patrick Plenefisch wrote:
> On Tue, Jan 16, 2024 at 4:33 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
> > On 16.01.2024 01:22, Patrick Plenefisch wrote:
> > It remains to be seen in how far it is reasonably possible to work
> > around this in the kernel. While (sadly) still unsupported, in the
> > meantime you may want to consider running Dom0 in PVH mode.
> >
> 
> I tried this by adding dom0=pvh, and instead got this boot error:
> 
> (XEN) xenoprof: Initialization failed. AMD processor family 25 is not
> supported
> (XEN) NX (Execute Disable) protection active
> (XEN) Dom0 has maximum 1400 PIRQs
> (XEN) *** Building a PVH Dom0 ***
> (XEN) Failed to load kernel: -1
> (XEN) Xen dom0 kernel broken ELF: <NULL>
> (XEN) Failed to load Dom0 kernel
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not construct domain 0
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...

PVH dom0 also re-uses the host memory map in order to build the dom0
memory map, and will fail to load the kernel if the ELF program
headers physical addresses are not between RAM regions (or destination
guest physical addresses where hvm_copy_to_guest_phys() returns
failure).

Roger.


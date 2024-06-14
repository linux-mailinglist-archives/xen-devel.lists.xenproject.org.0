Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353E908691
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 10:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740507.1147587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI2TH-0003Xo-KE; Fri, 14 Jun 2024 08:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740507.1147587; Fri, 14 Jun 2024 08:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI2TH-0003Uj-HN; Fri, 14 Jun 2024 08:39:43 +0000
Received: by outflank-mailman (input) for mailman id 740507;
 Fri, 14 Jun 2024 08:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HBj=NQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sI2TF-0003Ub-O7
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 08:39:41 +0000
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a39c8bbe-2a29-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 10:39:40 +0200 (CEST)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-dff0067a263so2206383276.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 01:39:40 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4421772802fsm6066561cf.58.2024.06.14.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 01:39:38 -0700 (PDT)
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
X-Inumbo-ID: a39c8bbe-2a29-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718354379; x=1718959179; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NQ7OxOE1EqJKw5zZWwVwDHuYw5v/P5AaYrgZ+3BOWtM=;
        b=M2tYbDdbKosB+vBJ+/UtWfS/saOyrMAhxSlORubCdUB6OUbkkPTK0FVxeFnWo5CYtL
         xVwjsRIgD+zFnwRpbJIE4anWniGZBGW0vn48WZXSEY9wAktwS5m2shr3keGsnatjNhPJ
         AwFNDKCaZYjJYZvtqna7sluqIPqaQ49fZSpUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718354379; x=1718959179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ7OxOE1EqJKw5zZWwVwDHuYw5v/P5AaYrgZ+3BOWtM=;
        b=YIO70HGblV7zlt3ibtpbpnQKVu31kv6qJUeWhA5DQMYPA2sBuJrlxaU/xpslLBM1Me
         e7m2KC6GNFxnVr+q3pefUZbESwk11YJ5FRoz0LNR7lU4ADOvqK9Kcra1DOK5O7Ee0LbT
         ShjjgkJwx8B1D1hUJX4Nz7y8+n2O1QzIf9Z4A33SuZ+x7t1+G7SOtqfzgjTYrD52IcDa
         23JT5l/yS1hIvapaF/mq/IGhxjNYkzbP8TM+rcmScugs0Oy2Of2Wrv/atoLaXfU10Wbx
         DEa8V7jO8hc2uRMreMATemjZpFI5wQjC/X2YZMzmsSkLRXswIi/5Fob9nn5A4k1nJpPm
         S7QA==
X-Forwarded-Encrypted: i=1; AJvYcCUiawQLm0TOzauU1jzEnuzfclOKnCU//aGpTJoXCvJZHw9RpWlkLc90bgQvEC75MtOtAxCu00rXuNx0a8YlxlW+3eFJxrZy0DRoelb5wTk=
X-Gm-Message-State: AOJu0YwxZyhfD56EBjUEkb/y69RkWSouDZW3bm/YtkJchZA8NwuKfPrc
	OgrtSZ0SvpR9Mg1eDQZfalUWruhvtVFW6xaoGtTr81NVKbkr/CN49VCfyurYEdw=
X-Google-Smtp-Source: AGHT+IGYZSXa2eoTU8nbEHbr3mMWfDGCB51t3w6GRjs+cjvjV/owODB2XQoaPMaqy1Z9kb2+M42LsQ==
X-Received: by 2002:a25:ad48:0:b0:dfb:6d6:a542 with SMTP id 3f1490d57ef6-dff153a66d9mr1913013276.28.1718354379271;
        Fri, 14 Jun 2024 01:39:39 -0700 (PDT)
Date: Fri, 14 Jun 2024 10:39:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZmwByZnn5vKcVLKI@macbook>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>

On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
> On 14.06.2024 09:21, Roger Pau Monné wrote:
> > On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> >> On 13.06.2024 20:43, Demi Marie Obenour wrote:
> >>> GPU acceleration requires that pageable host memory be able to be mapped
> >>> into a guest.
> >>
> >> I'm sure it was explained in the session, which sadly I couldn't attend.
> >> I've been asking Ray and Xenia the same before, but I'm afraid it still
> >> hasn't become clear to me why this is a _requirement_. After all that's
> >> against what we're doing elsewhere (i.e. so far it has always been
> >> guest memory that's mapped in the host). I can appreciate that it might
> >> be more difficult to implement, but avoiding to violate this fundamental
> >> (kind of) rule might be worth the price (and would avoid other
> >> complexities, of which there may be lurking more than what you enumerate
> >> below).
> > 
> > My limited understanding (please someone correct me if wrong) is that
> > the GPU buffer (or context I think it's also called?) is always
> > allocated from dom0 (the owner of the GPU).  The underling memory
> > addresses of such buffer needs to be mapped into the guest.  The
> > buffer backing memory might be GPU MMIO from the device BAR(s) or
> > system RAM, and such buffer can be paged by the dom0 kernel at any
> > time (iow: changing the backing memory from MMIO to RAM or vice
> > versa).  Also, the buffer must be contiguous in physical address
> > space.
> 
> This last one in particular would of course be a severe restriction.
> Yet: There's an IOMMU involved, isn't there?

Yup, IIRC that's why Ray said it was much more easier for them to
support VirtIO GPUs from a PVH dom0 rather than classic PV one.

It might be easier to implement from a classic PV dom0 if there's
pv-iommu support, so that dom0 can create it's own contiguous memory
buffers from the device PoV.

> > I'm not sure it's possible to ensure that when using system RAM such
> > memory comes from the guest rather than the host, as it would likely
> > require some very intrusive hooks into the kernel logic, and
> > negotiation with the guest to allocate the requested amount of
> > memory and hand it over to dom0.  If the maximum size of the buffer is
> > known in advance maybe dom0 can negotiate with the guest to allocate
> > such a region and grant it access to dom0 at driver attachment time.
> 
> Besides the thought of transiently converting RAM to kind-of-MMIO, this

As a note here, changing the type to MMIO would likely involve
modifying the EPT/NPT tables to propagate the new type.  On a PVH dom0
this would likely involve shattering superpages in order to set the
correct memory types.

Depending on how often and how random those system RAM changes are
necessary this could also create contention on the p2m lock.

> makes me think of another possible option: Could Dom0 transfer ownership
> of the RAM that wants mapping in the guest (remotely resembling
> grant-transfer)? Would require the guest to have ballooned down enough
> first, of course. (In both cases it would certainly need working out how
> the conversion / transfer back could be made work safely and reasonably
> cleanly.)

Maybe.  The fact the guest needs to balloon down that amount of memory
seems weird to me, as from the guest PoV that mapped memory is
MMIO-like and not system RAM.

Thanks, Roger.


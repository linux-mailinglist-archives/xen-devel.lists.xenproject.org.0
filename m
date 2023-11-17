Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A77EF3CF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 14:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635210.991072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zAL-0007nW-RC; Fri, 17 Nov 2023 13:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635210.991072; Fri, 17 Nov 2023 13:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zAL-0007lG-Na; Fri, 17 Nov 2023 13:45:49 +0000
Received: by outflank-mailman (input) for mailman id 635210;
 Fri, 17 Nov 2023 13:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3zAK-0007kx-V0
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 13:45:48 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cf0bbfc-854f-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 14:45:47 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so28024461fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 05:45:47 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c230100b003fefb94ccc9sm2745099wmo.11.2023.11.17.05.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 05:45:47 -0800 (PST)
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
X-Inumbo-ID: 9cf0bbfc-854f-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700228747; x=1700833547; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11lHjhU2yS7SGzfPlRg1SD6c7cf79KO/+ePZ+ZqkQb0=;
        b=kigSjnCKN9seMl/aNa+4xhMmrAKZeqj3q1qE0o0JBmoFdCAYQWiFnxrdUVtYBIOPvq
         Tzfe/DoKyCO9KeUpd1A7iWaIXthvh8RLPUS9rTlYENoJbWjEZOKbZAhUBjho7PU/kJOj
         CgWpJET8H2Jc0fvdtHGC8Fkmo8Vsu8aUYGnnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700228747; x=1700833547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11lHjhU2yS7SGzfPlRg1SD6c7cf79KO/+ePZ+ZqkQb0=;
        b=v98TmTS735Xw78BbhmvqIZbaXdtvuNaFc9y0Ow4oWFXVx7ARDOa74t0SPOybLv7L4B
         LKu81Gqt9a0S+trVAyOhAi39NP5VHQeu/eLMfJ7lgIflFfYrTpD3GR/goUI/4xsbK5cO
         vksOIWNgKRuVAwHyAHh/HBg/67sEz48rNDdgAKbjNPR4jqU60TsPeg/yGBWc4EFoQEof
         kAUY2tqRfcRsvIjfNHCJ0B1sdOY7nRovtDWtvvYI1zB98xiFBgAJoJLlyFkrCF/+oRpG
         2laZE6zi96IFOvBWRXbi0Aro848xpUkvurIwNKopUps5DVXsJY58dlJWlHz2+l18ON8+
         LeFg==
X-Gm-Message-State: AOJu0Yx9n/+x6QYNow6osUUC03UxN2u7/pvtP434iJXcAbPBv0ZgnEJZ
	YOHQqobve4aIJ92udpDru/+t/g==
X-Google-Smtp-Source: AGHT+IEFHUagh3nsSAcRi6mC5tv91wTCG1fDY005PtdCDOPHMKCzwcg1mfe5f5eegfYxXnUpCYGmjA==
X-Received: by 2002:a2e:804c:0:b0:2c5:4956:5112 with SMTP id p12-20020a2e804c000000b002c549565112mr8662049ljg.35.1700228747294;
        Fri, 17 Nov 2023 05:45:47 -0800 (PST)
Date: Fri, 17 Nov 2023 14:45:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZVduiT9YJE92zBai@macbook.local>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdfRQpGFSU1OIkh@macbook.local>
 <a81699f2-f273-41f1-b0ad-4fc203b16420@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a81699f2-f273-41f1-b0ad-4fc203b16420@suse.com>

On Fri, Nov 17, 2023 at 02:23:42PM +0100, Jan Beulich wrote:
> On 17.11.2023 13:40, Roger Pau Monné wrote:
> > On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -29,6 +29,9 @@ struct vpci_register {
> >>      unsigned int offset;
> >>      void *private;
> >>      struct list_head node;
> >> +    uint32_t rsvdz_mask;
> >> +    uint32_t ro_mask;
> >> +    uint32_t rw1c_mask;
> > 
> > I understand that we need the rw1c_mask in order to properly merge
> > values when doing partial writes, but the other fields I'm not sure we
> > do need them.  RO bits don't care about what's written to them, and
> > RsvdZ are always read as 0 and written as 0, so the mask shouldn't
> > affect the merging.
> 
> What some version of the spec says is r/o or reserved may be different
> in another. Also iirc devices may (wrongly?) implement r/o bits as r/w.
> When presenting a virtual view of devices to guests, in this regard I
> think we want (or even need) to enforce our view of the world.

That needs to be part of the commit message then.

Ideally we would also want to do a swept of all registers we currently
implement, in order to check for ro or rsvdz bits and properly enforce
them.

Thanks, Roger.


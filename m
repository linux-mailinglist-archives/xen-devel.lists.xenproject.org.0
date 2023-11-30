Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E17FEB6F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644477.1005537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8d1w-0005aU-EY; Thu, 30 Nov 2023 09:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644477.1005537; Thu, 30 Nov 2023 09:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8d1w-0005Xw-BX; Thu, 30 Nov 2023 09:08:20 +0000
Received: by outflank-mailman (input) for mailman id 644477;
 Thu, 30 Nov 2023 09:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8d1u-0005Xq-U8
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:08:18 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 002bc930-8f60-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 10:08:18 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3331974c2d2so498187f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 01:08:18 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j6-20020a5d5646000000b0033307ffb193sm947271wrw.29.2023.11.30.01.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 01:08:17 -0800 (PST)
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
X-Inumbo-ID: 002bc930-8f60-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701335297; x=1701940097; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQVYFO3iAhFtMeRDs7Btqdr1I4QtYjMCi6XpgS6ayag=;
        b=SK8d4vYLIVl4Igmc/GYOSl4cecGwzlWjWdpw1K6J6tpF3axmKwVI+rTRaM/OdKUgXy
         2fEH2/BRyboS7M1lP2H0QYD6A8CtFzAikUZ0Fc/Wrl+uTuO+FzvTwKrApc/o8HvewfHu
         utHYdhqtc1vmscWj8AjC/m44nvx9+8wCrhZ74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701335297; x=1701940097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQVYFO3iAhFtMeRDs7Btqdr1I4QtYjMCi6XpgS6ayag=;
        b=MdLHen7G7ySwFh2FLiIZxbQvEC3M5K2vc2JrLrK4eNXGc+j76TBETm5ixRnl0oKMwj
         s4y+clZkoon/0JJHskywFNX27kfmESRjjNIQ3omxQO5B4RMrJpWmtG9n6+v36/neU8RP
         1pVfmZpZyZxBN0r9uPWRP0DmQs5y3P0MwT4u7J320EQzcTAcou5OnIov9YXPNJ0RU3IT
         9x9x0et74HxL3/ThMKqDHh+Jo+LxTJzOrUl+nu2ANtvvnLyTpuCYCQuCsUhRm6uk9j+F
         Z1FqBbK6KnSpc9OZegUyfolF3WUid4a/o/VAngq5s3DDL9gO4naA9xcIgT6OwVzoQGfU
         HPeA==
X-Gm-Message-State: AOJu0YysbzldVJam6dehxJ9dR/zBICYAq3qCZmy5/4X4Rabz24ZUATiT
	IWiVmmEwAVF8yD+CC9b8tJFTpg==
X-Google-Smtp-Source: AGHT+IHp4HeWEJt33HuXnZiN9FVpKn81AsgXQcJNUZ82V3yx/7aw0rz6aR/eK73K+/XtZtx1e3+APg==
X-Received: by 2002:a05:6000:a82:b0:332:e7c4:fe47 with SMTP id dh2-20020a0560000a8200b00332e7c4fe47mr16411795wrb.67.1701335297303;
        Thu, 30 Nov 2023 01:08:17 -0800 (PST)
Date: Thu, 30 Nov 2023 10:08:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 1/2] xen/vpci: header: status register handler
Message-ID: <ZWhRAMoH-1MOSFz0@macbook>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
 <20231128194427.2513249-2-stewart.hildebrand@amd.com>
 <ZWcaiqrg9ZMn6JFC@macbook>
 <d493f9e3-ab17-4662-9e7c-d313f4ede033@amd.com>
 <9cd622b2-f283-476a-916a-1eb5a1171754@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cd622b2-f283-476a-916a-1eb5a1171754@suse.com>

On Thu, Nov 30, 2023 at 09:40:14AM +0100, Jan Beulich wrote:
> On 29.11.2023 16:18, Stewart Hildebrand wrote:
> > On 11/29/23 06:03, Roger Pau Monné wrote:
> >> On Tue, Nov 28, 2023 at 02:44:24PM -0500, Stewart Hildebrand wrote:
> >>> @@ -407,26 +445,26 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>>  
> >>>  /*
> >>>   * Perform a maybe partial write to a register.
> >>> - *
> >>> - * Note that this will only work for simple registers, if Xen needs to
> >>> - * trap accesses to rw1c registers (like the status PCI header register)
> >>> - * the logic in vpci_write will have to be expanded in order to correctly
> >>> - * deal with them.
> >>>   */
> >>>  static void vpci_write_helper(const struct pci_dev *pdev,
> >>>                                const struct vpci_register *r, unsigned int size,
> >>>                                unsigned int offset, uint32_t data)
> >>>  {
> >>> +    uint32_t val = 0;
> >>
> >> Nit: might be clearer to name this 'current': it's easy to get
> >> confused whether val or data holds the user-provided input.
> > 
> > The name 'current' shadows an existing global variable/macro. How about current_val?
> 
> Or curval? Or just cur (to not collide with our common use of curr)?

Any would be fine, curval or cur_val are short and clear IMO.  Sorry
for having suggested a wrong name in my previous reply.

Thanks, Roger.


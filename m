Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AB284C70C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 10:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677301.1053823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXe1B-00043L-Io; Wed, 07 Feb 2024 09:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677301.1053823; Wed, 07 Feb 2024 09:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXe1B-000407-Fd; Wed, 07 Feb 2024 09:14:57 +0000
Received: by outflank-mailman (input) for mailman id 677301;
 Wed, 07 Feb 2024 09:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXe1A-000401-0r
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 09:14:56 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b0c483d-c599-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 10:14:54 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-560a9738081so406375a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 01:14:54 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ev9-20020a056402540900b0055c9280dc51sm451910edb.14.2024.02.07.01.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:14:53 -0800 (PST)
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
X-Inumbo-ID: 5b0c483d-c599-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707297294; x=1707902094; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xy7k443k0GctZ/WaQZNw858yCaCIbup+H2QveNxhzYc=;
        b=BXEMDrqhs8XDSkTZAU+P+D0WQYTp3cIjVUDU/djaU7o9OrgKIAKwNuTxiv8y1m96g5
         +nnHkHeKZ9DeRKeodz8ElZojhEgRBVzKJ8XIkbygnzx9DQUNpHZaWCHDzHockO6DvUPT
         oJ+lWnpCJHZMwlIiHIL+cE2UShG17j9eg+P2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707297294; x=1707902094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xy7k443k0GctZ/WaQZNw858yCaCIbup+H2QveNxhzYc=;
        b=u41gPxZeNFBCPwPCx+7L3VOa9dKCryGYQ4NjmUjE2tU4BCO4YpWRzf7/PLOoM/EC5C
         xqzfP7MTdrtcvhTKqHvmqK/tvQzYBIeupTpcSr4dERuKzx9XCMu7wyD+asKM6p+9F3Yz
         jD1IkP82dVj7OSx+LhmQDmMzWwjX+kZNr0TB9S/FB3k0CzpkSl8xHBFbpPz+TDND7RQd
         UdZW60BwzQCdl+yyebVaUUMV5Lk0hcjrF3E0isAnf+YYh1W0Hov4CxFCOJ6gk7VpLFKT
         49P64beI4L4gseP4C3oYl4rzUVnKmBsRvQ82aoDp8blb4O9a3LWX9+s5Rml5o9r1YfJ/
         xe5w==
X-Gm-Message-State: AOJu0YzZ7/8yn6xD96quGfPb2j18fuGgfoTSzh5hOU9LE26G1Mh9khU4
	t/myjbaMlMXLksimiwehxghRsZm8KivBG20Q8fVxbqfRmfX6q9yT/kcY4un5hrS9Y3UGOgPtgxu
	0
X-Google-Smtp-Source: AGHT+IH5CGQ5Do/RJiwekak5uzTI7sIocFtSiqYi4S/IwY4JiDMNDCeyksa3USmNUaiD59mja4/k0Q==
X-Received: by 2002:aa7:d693:0:b0:560:654c:157a with SMTP id d19-20020aa7d693000000b00560654c157amr3294423edr.30.1707297293961;
        Wed, 07 Feb 2024 01:14:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSO2Kh3wydBNEqH5rgVzdGAg6rGkvjTNHpXwhSr3aLYfUI4TxIsXE2a1AhBQew09FzKc8RkCml5s8Sn+xTYIbRoJs0goiBDd4fPgy5Qn4=
Date: Wed, 7 Feb 2024 10:14:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] iommu/x86: make unity range checking more strict
Message-ID: <ZcNKDKD4G7fpIX80@macbook>
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-5-roger.pau@citrix.com>
 <5db22ee1-40b3-4df8-88b8-446a2e224d22@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5db22ee1-40b3-4df8-88b8-446a2e224d22@suse.com>

On Tue, Feb 06, 2024 at 12:49:08PM +0100, Jan Beulich wrote:
> On 01.02.2024 18:01, Roger Pau Monne wrote:
> > Currently when a unity range overlaps with memory being used as RAM by the
> > hypervisor the result would be that the IOMMU gets disabled.  However that's
> > not enough, as even with the IOMMU disabled the device will still access the
> > affected RAM areas.
> 
> Hmm, no, I think this is going too far. Not the least because it is
> s/will/may/. But also because if we really wanted such behavior, we
> ought to also parse the respective ACPI tables when the "iommu=off".

I guessed so, hence why it's the last patch in the series.  TBH I
think it's very unlikely that such system exist.

> > Note that IVMD or RMRR ranges being placed over RAM is a firmware bug.
> 
> As written this is wrong: They're typically in RAM, just that the E820
> type for that range should not be RAM_TYPE_CONVENTIONAL.

Hm, yes, ÇI should have written 'over a RAM range in the memory map'
or similar.

> > Doing so also allows to simplify the code and use a switch over the reported
> > memory type(s).
> 
> I'm afraid this isn't right either: page_get_ram_type() can set
> multiple bits in its output.

It can indeed.  But if the only bit set is RAM_TYPE_CONVENTIONAL then
the page will be handled as RAM, and that's where Xen would be in
trouble if a device is also using such page as a unity map.

If the page however is RAM_TYPE_CONVENTIONAL | RAM_TYPE_RESERVED then
the RESERVED type will take over the whole page, and it's no longer an
issue to have a unity range covering it.

Thanks, Roger.


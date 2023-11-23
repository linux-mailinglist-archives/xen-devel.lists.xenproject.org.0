Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F07F59CF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639407.996744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64nL-0007Ev-RC; Thu, 23 Nov 2023 08:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639407.996744; Thu, 23 Nov 2023 08:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64nL-0007DG-Oa; Thu, 23 Nov 2023 08:10:43 +0000
Received: by outflank-mailman (input) for mailman id 639407;
 Thu, 23 Nov 2023 08:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r64nK-0007D8-Gh
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:10:42 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5ade8d9-89d7-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 09:10:32 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-409299277bbso3685165e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 00:10:32 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 a10-20020a056000050a00b0032ddf2804ccsm887539wrf.83.2023.11.23.00.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 00:10:31 -0800 (PST)
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
X-Inumbo-ID: c5ade8d9-89d7-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700727032; x=1701331832; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKmwbA6+M4RcmFFTP/sku16AaY+V057EzNOgN2RXvrM=;
        b=kuVcpkVu0prQihuk6jXaLDLwfH3LG5/SJY1p41t5dytXb3m2Jii/LE0NW75b6e6wUa
         6B8cTHJAmeWfYURUsEVh3cUeN0HSyeSa3llsNXottOTVxFDgcLR7qfoToaK5xYU/yjMc
         virjNBJukk6IXrq0Np98/SvC1mkMiYc4yP3rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700727032; x=1701331832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKmwbA6+M4RcmFFTP/sku16AaY+V057EzNOgN2RXvrM=;
        b=tvwx98HiwMNwvNbqqa0hOgXKmvnaDhyAXKMVVzzY5qGrx0SM3Ms2e0ZyB8PpC/t1Ct
         Hu46EPMgQk5jyRFoxFMuPbLBkJ/U0wNT1qZH4EQNj0KSqTaFKFYBY28naQNACKFHLZSS
         65VEDdAQE5NxHX5kXzSl9Icae5kfOEtr0LEhT59rTvMM2KVAdfvyHWjN3DqsspMPkdzR
         Aq3u6+t5yhf/VSbXh4QdzkSaeRFV8xG0dGHXP6XoY1C71MN0YIUkR7WBL+GmAs4BiqeU
         4zNOBgDS3lbBVGXv8nTJK25ods9cfesaCR91mOkJ4Tej8O+eqdp/v47c/vUnTzPJNFy2
         F8fQ==
X-Gm-Message-State: AOJu0YwTdBxMK3D//jcUWqdQ33Aj5o1Y4M7sra3E40qOSyXJROJrDGjg
	DrRTStN34lB6lNMaSSQVLuAqJA==
X-Google-Smtp-Source: AGHT+IF78/OewSG68sPgcP6GJQFHovzaBrmdOgvQBEIqoedX/hPXaZvvdN/TIXWg8MFOBuC9Y9KhAg==
X-Received: by 2002:a05:600c:1c9d:b0:405:4776:735a with SMTP id k29-20020a05600c1c9d00b004054776735amr3655975wms.2.1700727031893;
        Thu, 23 Nov 2023 00:10:31 -0800 (PST)
Date: Thu, 23 Nov 2023 09:10:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] livepatch: do not use .livepatch.funcs section to store
 internal state
Message-ID: <ZV8I9qSxeQ8zi9ZU@macbook>
References: <20231116115841.71847-1-roger.pau@citrix.com>
 <d6634601-5006-475c-b386-97a1e53c5279@suse.com>
 <ZVYfHQD1AEmNVY3h@macbook.local>
 <CAG7k0Eo=p6sn0-p=JWGDTuN9u8B2=d9K13qpWUoAqJfX0uhcLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0Eo=p6sn0-p=JWGDTuN9u8B2=d9K13qpWUoAqJfX0uhcLA@mail.gmail.com>

On Wed, Nov 22, 2023 at 04:31:07PM +0000, Ross Lagerwall wrote:
> On Thu, Nov 16, 2023 at 1:54 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Nov 16, 2023 at 01:39:27PM +0100, Jan Beulich wrote:
> > > On 16.11.2023 12:58, Roger Pau Monne wrote:
> > > > --- a/xen/include/public/sysctl.h
> > > > +++ b/xen/include/public/sysctl.h
> > > > @@ -991,10 +991,7 @@ struct livepatch_func {
> > > >      uint32_t new_size;
> > > >      uint32_t old_size;
> > > >      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
> > > > -    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
> > > > -    uint8_t applied;
> > > > -    uint8_t patch_offset;
> > > > -    uint8_t _pad[6];
> > > > +    uint8_t _pad[39];
> > >
> > > Should this be LIVEPATCH_OPAQUE_SIZE+8 and ...
> >
> > Hm, I'm not sure that's any clearer.  In fact I think
> > LIVEPATCH_OPAQUE_SIZE shouldn't have leaked into sysctl.h in the first
> > place.
> >
> > If we later want to add more fields and bump the version, isn't it
> > easier to have the padding size clearly specified as a number?
> 
> I prefer using the number as it makes it clear that this padding is not
> (anymore) related to the size of the instruction buffer in livepatch_fstate.
> 
> Do you think it would be better to call livepatch_fstate.opaque
> something like livepatch_fstate.insn_buffer instead (and rename

That would be fine.

> the constant accordingly) since it is internal to Xen and is not
> hiding something from tools building live patches?

The constant would be needed anyway due to the usage in the livepatch
tests, see the layout of livepatch_expectation_t which is public and
part of livepatch_func.

I don't mind changing fstate->opaque to insn_buffer, but I would avoid
touching anything in livepatch_expectation_t as part of this patch.

Thanks, Roger.


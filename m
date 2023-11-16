Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F187E7EE348
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 15:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634369.989765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3dfh-0007o4-Oa; Thu, 16 Nov 2023 14:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634369.989765; Thu, 16 Nov 2023 14:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3dfh-0007lN-M3; Thu, 16 Nov 2023 14:48:45 +0000
Received: by outflank-mailman (input) for mailman id 634369;
 Thu, 16 Nov 2023 14:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3dfg-0007lD-K0
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 14:48:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d17169d-848f-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 15:48:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso6698835e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 06:48:43 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm3936189wmf.45.2023.11.16.06.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 06:48:42 -0800 (PST)
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
X-Inumbo-ID: 3d17169d-848f-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700146123; x=1700750923; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S5uy/plvclR8VEj16tPSjDIsG2AepZj04SrdNCOZWM0=;
        b=vk5HW+cPGmTmMwc0JZASJZkDiFhW4Oh0YSOwHYOQpDO4QBGRV1Ho7TIgL3bW1oa202
         qk/52k7Rt3SbITEjzp/9I+HMOwW2B/J6K5J0LRIZarGkX707gIoH0izCA46HPB3u+k1v
         poasnCaA2IPFwiA8k3dIShvVljt/ixo/tK4oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146123; x=1700750923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5uy/plvclR8VEj16tPSjDIsG2AepZj04SrdNCOZWM0=;
        b=blDsD43Q8Eqgqt+Xsupdv2OAJ3SqRaN3h9OFMm5I1Cc9w+z4BbWlqY94zRUEuQr82R
         pxfGrpIyyLmvzB1rzixaswIJKL/W5mO00b1VB1ETrzRKPXRTfoWOqQt8xGDCjslpuYaT
         KjzB6iy2lcVE7Wp7/2SdRsmDp0glf4MZJbC/8ienxM0DlszZiL0rcw9UO/Ebl2SOSAjI
         mrsr05mjlSvYNkcnNNvToW7T40kygWJTZjYU5DxaVjEPBDZgFp5E4LqAzSkEAXj9MzHI
         5L4NsCS/6qkZYMqxHPmzCaP2AEQaVzWlITg/kQrC/W6a3Xkg1yA67Zq/ezIrbS73Tp4S
         U7wg==
X-Gm-Message-State: AOJu0YzmkX28gK3EZuF44gExsOJpkypc9rZYgoX+izwBpBpLFb8TsKzz
	YHDQ4/lrdTLh0z0TQPKr69YlDQ==
X-Google-Smtp-Source: AGHT+IHewOS0L7uoZJSjiZ/VAQETgVYz5o060dLqxncOEpucU4+GBtGv0hi2Z+w+l6yG74P8XpjPXw==
X-Received: by 2002:a05:600c:1d93:b0:406:3977:eccd with SMTP id p19-20020a05600c1d9300b004063977eccdmr12470231wms.33.1700146123114;
        Thu, 16 Nov 2023 06:48:43 -0800 (PST)
Date: Thu, 16 Nov 2023 15:48:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
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
Message-ID: <ZVYryZ0HrKNKVtKb@macbook.local>
References: <20231116115841.71847-1-roger.pau@citrix.com>
 <d6634601-5006-475c-b386-97a1e53c5279@suse.com>
 <ZVYfHQD1AEmNVY3h@macbook.local>
 <54cbcb8b-c895-47fe-ba66-5fb06505e00a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54cbcb8b-c895-47fe-ba66-5fb06505e00a@suse.com>

On Thu, Nov 16, 2023 at 03:05:20PM +0100, Jan Beulich wrote:
> On 16.11.2023 14:54, Roger Pau Monné wrote:
> > On Thu, Nov 16, 2023 at 01:39:27PM +0100, Jan Beulich wrote:
> >> On 16.11.2023 12:58, Roger Pau Monne wrote:
> >>> --- a/xen/include/public/sysctl.h
> >>> +++ b/xen/include/public/sysctl.h
> >>> @@ -991,10 +991,7 @@ struct livepatch_func {
> >>>      uint32_t new_size;
> >>>      uint32_t old_size;
> >>>      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
> >>> -    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
> >>> -    uint8_t applied;
> >>> -    uint8_t patch_offset;
> >>> -    uint8_t _pad[6];
> >>> +    uint8_t _pad[39];
> >>
> >> Should this be LIVEPATCH_OPAQUE_SIZE+8 and ...
> > 
> > Hm, I'm not sure that's any clearer.  In fact I think
> > LIVEPATCH_OPAQUE_SIZE shouldn't have leaked into sysctl.h in the first
> > place.
> > 
> > If we later want to add more fields and bump the version, isn't it
> > easier to have the padding size clearly specified as a number?
> 
> If new fields (beyond the present padding size) would need adding,
> that would constitute an incompatible change anyway.

Not if we bump the version field I think?

As the version is a strict match, bumping the version allows for a
completely new layout to be implemented past the 'version' field.

> Until then imo
> it would be clearer to keep the reference to the original constant.
> But thinking about it again, the difference is perhaps indeed only
> marginal. Anyway, I'll leave this to the livepatch maintainers.
> 
> One further related remark though: Now that you pointed me at the
> other use of the constant in the public header, don't you want to
> update the comment there, for it to not become stale (in referring
> to struct livepatch_func)?

Hm, yes, indeed.  I will wait for further comments before sending just
that comment fix.  I would add:

uint8_t data[LIVEPATCH_OPAQUE_SIZE]; /* Max number of bytes to be patched */

Thanks, Roger.


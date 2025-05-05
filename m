Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC056AA9593
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 16:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976149.1363373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBwgX-0002UU-Ra; Mon, 05 May 2025 14:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976149.1363373; Mon, 05 May 2025 14:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBwgX-0002Rw-On; Mon, 05 May 2025 14:20:45 +0000
Received: by outflank-mailman (input) for mailman id 976149;
 Mon, 05 May 2025 14:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E8Me=XV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uBwgW-0002Rp-Fy
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 14:20:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 203b4fa6-29bc-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 16:20:42 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso713001666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 07:20:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad18950964asm503786966b.141.2025.05.05.07.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 07:20:41 -0700 (PDT)
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
X-Inumbo-ID: 203b4fa6-29bc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746454841; x=1747059641; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zm8qqxJidIZwUnpMvKpQaP58jct5MPcPPi8zdUSg0es=;
        b=Xbqpv9MWvpEPAucdURm6F2fK5rirI9H7pl0pPrbMy7kpPWR5KwttAH/+OA5xNRx6r+
         95c40v/znUnh+LvMqP2u4uwX1p5zDeFNUqnhcdXL3zFe8xxbn84PdgwX5l2OYAEdmUZp
         Bgi4m9DzTAVOG07cxVcA9LMMI6yMpTN1ZBb2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454841; x=1747059641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm8qqxJidIZwUnpMvKpQaP58jct5MPcPPi8zdUSg0es=;
        b=k5MacOsShZjpHaJzQ5xMshxOQl2oENYGT4SaRanrRIB/vxcLHWuUc59DlRMSlZvfcg
         br0LW4e6DjUoNNIFmW2ngXXJTtKafNsC1Cq8sPd6TCzsk4YzGcERNBsWXawDLlDEhhyt
         CFjUosyfBD059yHVN/G7llQ4wuVt8Z8ZVCR/5Hlq5wAeOZyLB9T+0Vc7zf26P9hkM66x
         lXDsrs3GG5nuclinDe3y7DAxc4/NAn8QeUQyKrUW9DQEuomY4JNUqCFQ4fc2vN5U5anK
         iaOIn2aNJzCmcOe2si9l/wiBN37BruO+Tk6DWYNMsd+GMgfQU+PNeg1h/ibKskB9E674
         HmDg==
X-Forwarded-Encrypted: i=1; AJvYcCWZHUDOFCLdZZkCUEwLd8CbfObzLhy1Pk/HCiPfbiiisL9xvRSlS9Fc9Qfe41e3ZK5GK7qXzqsx1M4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXOjFv2X55CUAf/L5K3xrWmXFEf2ylIUoMIieUNdRq4zF9GgNr
	q2MsgPpk7Bv8kMcx2de1Ng8Yl5FC2WL22eS89xjTGiDKUNDc29XyES3XqzISqDlVt01St7Zqflc
	c
X-Gm-Gg: ASbGncvi/WilhcGjtxqAiYiEdZYbRLfzjxq6IJOJHUyaqerYS3aPg6FDS/PZup4RawO
	ZgdYVV1NCw+dCt+T6FMl8/TM/85ZKAw9B4DFsQ3lFZhVJ1mSJI5fDzYJzbchleA0Bw6jVDqv82M
	0l3DciMVZ/Eh/k0JgGizPpzvLvqE51lYHmz1h98s1SUkt11D9mRw89suWdc8C3c72/ykf20RBb1
	nDoQhfGYUiHntKT1GzbxWgpApMxgC0Pdsr97RMAjXaE24r4SHZepNTVYEhjc5Ep3sUtKcyaUF2y
	8Gj8QKNEah4ohibrfCBlINGI9rTB8c9cIRxV/RuGuBQnXA==
X-Google-Smtp-Source: AGHT+IGKpv6NtcWRfb9+WLroopHpq71353XI9aofjNIk/4qffqQN+DPb/AvtYcd8QpPLgUaTqatH+Q==
X-Received: by 2002:a17:907:720b:b0:ace:3a24:97d with SMTP id a640c23a62f3a-ad1a48be280mr726975366b.4.1746454841476;
        Mon, 05 May 2025 07:20:41 -0700 (PDT)
Date: Mon, 5 May 2025 16:20:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Mapping memory into a domain
Message-ID: <aBjJOFnO-Er7jLvA@macbook.lan>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <fec23d81-8e31-4a95-9ec1-14148ac2098f@citrix.com>
 <be15867a-f612-4a55-9324-099cae3a1e24@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be15867a-f612-4a55-9324-099cae3a1e24@gmail.com>

On Sun, May 04, 2025 at 07:24:46PM -0400, Demi Marie Obenour wrote:
> On 5/4/25 6:56 PM, Andrew Cooper wrote:
> > On 04/05/2025 11:51 pm, Demi Marie Obenour wrote:
> >> What are the appropriate Xen internal functions for:
> >>
> >> 1. Turning a PFN into an MFN?
> >> 2. Mapping an MFN into a guest?
> >> 3. Unmapping that MFN from a guest?
> >>
> >> The first patch I am going to send with this information is a documentation
> >> patch so that others do not need to figure this out for themselves.
> >> I remember being unsure even after looking through the source code, which
> >> is why I am asking here.
> > 
> > See the top of xen/include/xen/mm.h which has an overview of
> > terminology, including an explanation of why Xen doesn't know what the
> > guest thinks of as PFN.
> I read that and am still confused.  Are you specifically referring to PV
> guests?  For PVH and HVM guests, Xen needs to know what the guest’s PFNs
> are so that it can correctly set up its own page tables.

The term PFN on PVH and HVM is confusing, and IMO it shouldn't be used
in that context.  PFNs should only be used in PV domains context.

I'm afraid I cannot understand the question in your last sentence.
What's "its own page tables"?  Are you referring to the domain second
stage translation page-tables, iow: the p2m?  Or is it something
else?

Regards, Roger.


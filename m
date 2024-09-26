Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C711E986EEB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 10:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805049.1216064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stjz9-0001OD-7D; Thu, 26 Sep 2024 08:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805049.1216064; Thu, 26 Sep 2024 08:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stjz9-0001MP-4H; Thu, 26 Sep 2024 08:36:27 +0000
Received: by outflank-mailman (input) for mailman id 805049;
 Thu, 26 Sep 2024 08:36:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stjz7-0001Lz-Ee
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 08:36:25 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a514ce9-7be2-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 10:36:24 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so83732466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 01:36:24 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930c8a7fsm319639666b.130.2024.09.26.01.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:36:23 -0700 (PDT)
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
X-Inumbo-ID: 6a514ce9-7be2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727339784; x=1727944584; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=59JNJrPbD1MLgx8zwgwe0IpxVZVi2E8qdsoA/+PZwNM=;
        b=iYkMunx2qO7st2CxDSaPuKIOenL2KrOocKRicjiBp6BqkxtQMhCTUQohvTt/5Y18Pe
         LHPXjfwMxoIg+Q/gx40AC9WG2fXSGTm80cplKzMRE6m6UWdiXXrUk5YsGcWvhnNfo++j
         zod7E8AYOtmmflZIfV99hb1km9DFECJkGJM3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727339784; x=1727944584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59JNJrPbD1MLgx8zwgwe0IpxVZVi2E8qdsoA/+PZwNM=;
        b=SuFgzbYASQxMWEoOjVeE8dp5uADP/6x5zyYrzvpZ7hXZMD/4g+WhDWmK7v08JBkA3b
         pV+oz2gHVmsyghkYSrFcpioLsPE+ytY7d1C15wneKPnYAcT/Pa6B5HtwVJJZjKSAtWfv
         ppWpPUGLjmLN+xGeY12DPDU9ec3ErAj6qoPZX+ohId3DiyaN+dSodeqj0N39w6Q10ehW
         +1h7/cRK1jgG9cH8BCtG43Vpw6TsSUULE/IMayuPRvTiHHXFh9/sw6CJTVa2k4ItJENX
         NvdArIjVZrCW3B8uyeD3xLylEhGbErKEYdfYwJ55OD5SS77gRLDpuPZlkOronogCcgqY
         Z9Rw==
X-Gm-Message-State: AOJu0YyP0VC8EamZ8T6o/LcLtLplKC25asSYXq6qqfNlc8ulmNrBoIeG
	2FM8t0YKquG1xYWrEPlzCAkeqZ+cS27fx3joyzkZ2pUgHqvWej/yk5gcEfWl9DP5UgvLLHbCGse
	V
X-Google-Smtp-Source: AGHT+IFJ6mez6PSsOEEL5FpQIHTxI+3SWAccYUliDhDaipFomtZyzpQBf/cgzGie7qzNYOxYCYxhXw==
X-Received: by 2002:a17:907:31c5:b0:a8d:4d76:a75e with SMTP id a640c23a62f3a-a93a03c5540mr483773766b.30.1727339784207;
        Thu, 26 Sep 2024 01:36:24 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:36:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 2/6] xen/livepatch: zero pointer to temporary load
 buffer
Message-ID: <ZvUdBzMr9iqy8Fct@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-3-roger.pau@citrix.com>
 <c357ec68-bfd2-427e-8f33-5826a2252b0e@citrix.com>
 <ZvPfVokJHOpzEZXc@macbook.local>
 <14e0bb5d-7f68-418e-8313-48593ceea7d5@citrix.com>
 <ZvUZu8wDk9aBiscx@macbook.local>
 <7ce3e68e-8e55-4cb1-8568-b1ce3b207866@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ce3e68e-8e55-4cb1-8568-b1ce3b207866@citrix.com>

On Thu, Sep 26, 2024 at 09:24:56AM +0100, Andrew Cooper wrote:
> On 26/09/2024 9:22 am, Roger Pau Monné wrote:
> > On Wed, Sep 25, 2024 at 07:28:42PM +0100, Andrew Cooper wrote:
> >> On 25/09/2024 11:00 am, Roger Pau Monné wrote:
> >>> On Wed, Sep 25, 2024 at 10:33:39AM +0100, Andrew Cooper wrote:
> >>>> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> >>>>> The livepatch_elf_sec data field points to the temporary load buffer, it's the
> >>>>> load_addr field that points to the stable loaded section data.  Zero the data
> >>>>> field once load_addr is set, as it would otherwise become a dangling pointer
> >>>>> once the load buffer is freed.
> >>>>>
> >>>>> No functional change intended.
> >>>>>
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>> ---
> >>>>> Changes since v1:
> >>>>>  - New in this version.
> >>>>> ---
> >>>>>  xen/common/livepatch.c | 3 +++
> >>>>>  1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> >>>>> index df41dcce970a..87b3db03e26d 100644
> >>>>> --- a/xen/common/livepatch.c
> >>>>> +++ b/xen/common/livepatch.c
> >>>>> @@ -383,6 +383,9 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
> >>>>>              }
> >>>>>              else
> >>>>>                  memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
> >>>>> +
> >>>>> +            /* Avoid leaking pointers to temporary load buffers. */
> >>>>> +            elf->sec[i].data = NULL;
> >>>>>          }
> >>>>>      }
> >>>>>  
> >>>> Where is the data allocated and freed?
> >>>>
> >>>> I don't see it being freed in this loop, so how is freed subsequently?
> >>> It's allocated and freed by livepatch_upload(), it's the raw_data
> >>> buffer that's allocated in the context of that function.
> >> Well, this is a mess isn't it.
> >>
> >> Ok, so livepatch_upload() makes a temporary buffer to copy everything into.
> >>
> >> In elf_resolve_sections(), we set up sec[i].data pointing into this
> >> temporary buffer.
> >>
> >> And here, we copy the data from the temporary buffer, into the final
> >> destination in the Xen .text/data/rodata region.
> >>
> >> So yes, this does end up being a dangling pointer, and clobbering it is
> >> good.
> >>
> >>
> >> But, seeing the `n = sec->load_addr ?: sec->data` in patch 4, wouldn't
> >> it be better to drop this second pointer and just have move_payload()
> >> update it here?
> >>
> >> I can't see anything good which can come from having two addresses, nor
> >> a reason why we'd need both.
> >>
> >> Then again, if this is too hard to arrange, it probably can be left as
> >> an exercise to a future developer.
> > So this is how it ends up looking,  there's a bit of churn due to
> > having to drop const on some function parameters.
> 
> Looks fine to me.
> 
> I'd be tempted to name the final field 'addr' because for most of its
> life it is the load address.

I've changed to `addr`.  I however feel it's kind of redundant to name
a pointer field `addr`, as by the type itself (being a pointer) it's
clear it's an address.

> For the comment on the field, I'd say "this is first a temporary buffer,
> then later the load address".

Adjusted.

Thanks, Roger.


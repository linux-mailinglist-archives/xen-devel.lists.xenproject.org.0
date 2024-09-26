Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61359986D39
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 09:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804984.1215979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiaD-0001Xw-Bm; Thu, 26 Sep 2024 07:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804984.1215979; Thu, 26 Sep 2024 07:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiaD-0001VR-9B; Thu, 26 Sep 2024 07:06:37 +0000
Received: by outflank-mailman (input) for mailman id 804984;
 Thu, 26 Sep 2024 07:06:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stiaB-0001RN-0e
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 07:06:35 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc127257-7bd5-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 09:06:32 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f75f116d11so7303081fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 00:06:32 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969ffcd5sm38029805e9.26.2024.09.26.00.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:06:31 -0700 (PDT)
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
X-Inumbo-ID: dc127257-7bd5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727334392; x=1727939192; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YazmPVjAkLd8Isi92Oi3Z9Zmn0RlXAohxugcqEv0v18=;
        b=H8L8odaUfIhWUkHWV7U2vIHUS2oFlhEFQ1DoyT7Txj3Oae5dyJlyamkczXZaXDBLFw
         cWOosQI1zbI8S8U9mcyjhfyzNCwAD/gjQYWupROt0RigIl2IG0HSnpE0ObuRjL3ycogh
         JoC6/Fk9T/95DXTCL1PC/zYQqYKhLEj9+DLL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727334392; x=1727939192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YazmPVjAkLd8Isi92Oi3Z9Zmn0RlXAohxugcqEv0v18=;
        b=oU7aVnuvxVSbHm1sdBxBtLsK6lEtc19MoF3fHiKR4Ab9oMxDkFoNKaM7BKJpxut0ZL
         +A1PQapExwmhou3AFs3yg6yuru/cH+5a62bBAxSIwV7RXa+2p9FOKYWL7u0Kga+4xy/Y
         6krGsd4h/CWuGCL3SilbIBTFNwUi0aA/K491Ai0Zj8642KqBg+EAV0w4hTJmtZAHWKHO
         GwUXvFr2eq9o3hOCYUmkh3nUab3yYdqi+aKlcW4NsnEESDZMEAraReFzoLa7CxLQlLg2
         HeTPjTJxjOxbu/ZypWY6Lkxsq1hiBRvd8YfcfzuvtJtk3RCaQg+Lyz/0baZBkhUvx9jz
         rCGw==
X-Gm-Message-State: AOJu0YzHihnl69iOkajSrjxgk5sxsbTjxnVwMowysoM2+f7lUrv0xXbU
	l1/Sxhwk/SWDfqmwf5TElegcYP0PytZ4PKCS0GmhVEeG1CluYWqwcY2hPOQIMt7VEkR5Z/T0tmq
	V
X-Google-Smtp-Source: AGHT+IH/kekYZ8zKIvvcYilJ9UVsJNyNqxb09TXXgeWGIWtr/vlwJRWUOgQGeoYD23e63vJQQfHing==
X-Received: by 2002:a2e:bea9:0:b0:2ec:568e:336e with SMTP id 38308e7fff4ca-2f915fc3497mr37120131fa.1.1727334391604;
        Thu, 26 Sep 2024 00:06:31 -0700 (PDT)
Date: Thu, 26 Sep 2024 09:06:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 2/6] xen/livepatch: zero pointer to temporary load
 buffer
Message-ID: <ZvUH9huo8agJOD1D@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-3-roger.pau@citrix.com>
 <c357ec68-bfd2-427e-8f33-5826a2252b0e@citrix.com>
 <ZvPfVokJHOpzEZXc@macbook.local>
 <14e0bb5d-7f68-418e-8313-48593ceea7d5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14e0bb5d-7f68-418e-8313-48593ceea7d5@citrix.com>

On Wed, Sep 25, 2024 at 07:28:42PM +0100, Andrew Cooper wrote:
> On 25/09/2024 11:00 am, Roger Pau Monné wrote:
> > On Wed, Sep 25, 2024 at 10:33:39AM +0100, Andrew Cooper wrote:
> >> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> >>> The livepatch_elf_sec data field points to the temporary load buffer, it's the
> >>> load_addr field that points to the stable loaded section data.  Zero the data
> >>> field once load_addr is set, as it would otherwise become a dangling pointer
> >>> once the load buffer is freed.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Changes since v1:
> >>>  - New in this version.
> >>> ---
> >>>  xen/common/livepatch.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> >>> index df41dcce970a..87b3db03e26d 100644
> >>> --- a/xen/common/livepatch.c
> >>> +++ b/xen/common/livepatch.c
> >>> @@ -383,6 +383,9 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
> >>>              }
> >>>              else
> >>>                  memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
> >>> +
> >>> +            /* Avoid leaking pointers to temporary load buffers. */
> >>> +            elf->sec[i].data = NULL;
> >>>          }
> >>>      }
> >>>  
> >> Where is the data allocated and freed?
> >>
> >> I don't see it being freed in this loop, so how is freed subsequently?
> > It's allocated and freed by livepatch_upload(), it's the raw_data
> > buffer that's allocated in the context of that function.
> 
> Well, this is a mess isn't it.
> 
> Ok, so livepatch_upload() makes a temporary buffer to copy everything into.
> 
> In elf_resolve_sections(), we set up sec[i].data pointing into this
> temporary buffer.
> 
> And here, we copy the data from the temporary buffer, into the final
> destination in the Xen .text/data/rodata region.
> 
> So yes, this does end up being a dangling pointer, and clobbering it is
> good.
> 
> 
> But, seeing the `n = sec->load_addr ?: sec->data` in patch 4, wouldn't
> it be better to drop this second pointer and just have move_payload()
> update it here?

I didn't specially like the usage of either load_addr or data in patch
4.

I see, so move_payload() would replace ->data with the relocated
pointer.  One slightly nice thing about the current arrangement is
that data is const, with that change it should become non-const, as we
do modify the contents of load_addr in some case (like sorting the
exception table).  I don't think the constness of data was that
useful, as it's just the temporary buffer.

> I can't see anything good which can come from having two addresses, nor
> a reason why we'd need both.
> 
> Then again, if this is too hard to arrange, it probably can be left as
> an exercise to a future developer.

I can see if it's mostly a trivial change.

Thanks, Roger.


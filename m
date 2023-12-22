Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2FA81CA7E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 14:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659341.1028892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfFp-0006WF-V8; Fri, 22 Dec 2023 13:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659341.1028892; Fri, 22 Dec 2023 13:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfFp-0006UD-Sc; Fri, 22 Dec 2023 13:07:53 +0000
Received: by outflank-mailman (input) for mailman id 659341;
 Fri, 22 Dec 2023 13:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGfFo-0006U7-8N
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 13:07:52 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c9798aa-a0cb-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 14:07:51 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ccad57dadbso4753851fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 05:07:51 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a19740d000000b0050e55c0f5f0sm536181lfe.48.2023.12.22.05.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 05:07:50 -0800 (PST)
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
X-Inumbo-ID: 1c9798aa-a0cb-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703250471; x=1703855271; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+FEsUrgrsNnK98XB/nV/MmzFA9KjrXeRW4OTAQqLKyc=;
        b=jpspqBcalBrb0VJ7xFjoBW/luGaWdlCw/m3lw0kax4svjJnzmX1Z8bsM7hiPtUl9SG
         +ImaP9+MkLrEn4LaiUdJmCs367yFJdnEsR7GVidnJ9UF4xcJfOHArt/TtRWHv58l/KPw
         S6mTYMFK5Rcdi38Tl2dgstiFVlSc37w7TiU+RgaeGol8ZR0ETIEGrFezE1kcf83KGd/J
         ZBTpHC5VQ6CPatbHvfTA+Wq1Ol0hLuPwshcmMT3y2S7f5VGA++hDtHqpScWu/LG2+4RU
         dGAsSWq2G+wCm9Zkok+C/DyBNdOHsAq7lLFp4ZNz2x2ExXWHTPlpNaa7tRzso570SWc4
         j1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703250471; x=1703855271;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FEsUrgrsNnK98XB/nV/MmzFA9KjrXeRW4OTAQqLKyc=;
        b=wrQBlI/RprZavj90jQS+3B3q7Dra0grz/ZOgiwDBwA1tyayrNEGCY5HLb58dHIEnto
         lASV/vzjCX9nLKUhFHlKzIqLCrK32DRyn6bmyJYc70Lu6GCFvPNFWAXQEOCCQrIT869Z
         4Gc1A4iriBG37qLZIywLzkfTyHiTdg3pLsLZkhPOajiE8ZiHaTAs44DRfgqdg3OrEElv
         80lpzRkdLuMLbBaTYNZdssK4jj4JpitzVjUCEZ+1jBN319g+lp4Gql78YxxL8VVej6xa
         Gv2fsc7kaF3SMp6l85AXXBCwrMiNiATopGuy0Feva7MqkDJ75BjfBPRx8sxYQ+TjcGQ/
         NSgg==
X-Gm-Message-State: AOJu0YxfYb8D/cI0bKmWOk03BLrvNEox28S9XlPbdQlRjh5P2Hq4FmaL
	d1rOteL7cTBy9bJLPC0A2wc=
X-Google-Smtp-Source: AGHT+IEgLwIrnr4hfqMeV1A4S8Z//SgWB3q4lbHZvd1Wc7brghZSXlZS0dm25Fvp8EvskUX2GgONXw==
X-Received: by 2002:a05:6512:36ce:b0:50e:6984:6237 with SMTP id e14-20020a05651236ce00b0050e69846237mr498369lfs.26.1703250470664;
        Fri, 22 Dec 2023 05:07:50 -0800 (PST)
Message-ID: <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
Subject: Re: [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 22 Dec 2023 15:07:49 +0200
In-Reply-To: <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
	 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
	 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2023-12-22 at 09:22 +0100, Jan Beulich wrote:
> On 21.12.2023 20:09, Julien Grall wrote:
> > On 20/12/2023 14:08, Oleksii Kurochko wrote:
> > > <asm/numa.h> is common through some archs so it is moved
> > > to asm-generic.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> >=20
> > I think this patch will need to be rebased on top of the lastest
> > staging=20
> > as this should clash with 51ffb3311895.
>=20
> No, and I'd like to withdraw my ack here. In this case a stub header
> isn't
> the right choice imo - the !NUMA case should be handled in common
> code. I
> would have submitted the patch I have, if only the first_valid_mfn
> patch
> hadn't been committed already (which I now need to re-base over).
I haven't seen your patch yet (waiting for it), but I assume that
<asm/numa.h> will still be necessary and remain the same across Arm,
PPC, and RISC-V.

What am I missing?

~ Oleksii


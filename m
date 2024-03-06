Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997A874278
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 23:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689541.1074634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhzSt-0000Md-Br; Wed, 06 Mar 2024 22:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689541.1074634; Wed, 06 Mar 2024 22:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhzSt-0000L6-99; Wed, 06 Mar 2024 22:10:19 +0000
Received: by outflank-mailman (input) for mailman id 689541;
 Wed, 06 Mar 2024 22:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rsyy=KM=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1rhzSr-0000Kz-GQ
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 22:10:17 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50134a3b-dc06-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 23:10:16 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso1730291fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 14:10:16 -0800 (PST)
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
X-Inumbo-ID: 50134a3b-dc06-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709763016; x=1710367816; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NWQLEqonMDh6NG/69B8NbTTnAVl5rzcZuafQfgUDI4=;
        b=nn1JMGGqXl13Le2m3ztpJTtP9NVtFFKHN3q6W+eJzLg9UYoaLEY3eHYrdPHcDxfmVR
         gt5bOvvR06NWkAUQ+7yfPjEtmdHArk5Vde5NR6C64nGZ3fMzW/Srry+yjN6ILg3/p054
         z4bOWkPk5jazb6u1JA/6tIWu07HEZHzpNg0kHoisCLKqwPzgijx4QTdppltAFA4KCI7L
         P99xGi+bsp9EtotYjo6fuczfsINIsvUJOZH44IqhSde36YPy4MFLtGDA+W5N4V7N6U83
         QeyMjGX5oSUYEYmGgPqzXTBeMvlolq/Dag/YycD4s7xmX5pQUMkja7tuKgUfnns66PX2
         UOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709763016; x=1710367816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NWQLEqonMDh6NG/69B8NbTTnAVl5rzcZuafQfgUDI4=;
        b=MFoC2FBhHvA9RLLgXJemtL8a/X4YOcc2jUIzaeaNv6aWQILZGxDl6tMJi2VT0L1/zw
         otwe6boSjetnH7kBXshN0EyF9lNrhUxYqhyzBiRV+x/c9Uy0y7/HCavAy3mbQx7PL3ZJ
         hFu6jqyBlk4dTTvaC48T/HPMpqF1R0uMxsWIGwcaQ1laBjffblgRU+K1TuaeTgxcBWyQ
         bHdfqCmvH/HjFCyjiUMex0HWVUir3gkXO0vmi/Xd4yZ6q7tcyuIaZ/MMUVSMoVjWRKjx
         +dIt/kKTe8cziSAeC6G2scvtK4EAHP8KUSJZsYeVWs9H0u56+ClTFWMqYvq10jObwKo9
         mLJg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Ij+Bb0TVQ96a/FUP+U/HtE6gNsRv0Bhvtp1L0Btnf/E5VFl4bsvfmm+A91gcxD9TzjYTSYXUq6UBd/zDNZCGpoWfj/D3GEDmnTU+AJE=
X-Gm-Message-State: AOJu0YxL4UYXo1HDAq/Hh8hO4pn/edNTiEPEtxWx/e5oJuUqIPasx6p6
	9Wg7dr2SRbhIp43tjHW4mquYATWpe0eKknJQqau3FNYrWuyB+s1uOSCDkrOQFCQSPJPjzR38vwD
	eZViLYI7wDuS9sRSWaBE7FAxonJs=
X-Google-Smtp-Source: AGHT+IHPYB76mbDiS/XUTfkWHqwmL3kNzF5N+JY1DdNyjqhyY9qaowtzw4PJGridxk6QtBmqFNmFr9mJ/1Htw/GughA=
X-Received: by 2002:a05:651c:220c:b0:2d2:d9b2:b2fc with SMTP id
 y12-20020a05651c220c00b002d2d9b2b2fcmr208065ljq.11.1709763015872; Wed, 06 Mar
 2024 14:10:15 -0800 (PST)
MIME-Version: 1.0
References: <79ed633d-b0bd-4a7d-a0c6-37a034e1ee96@suse.com>
 <0374516c-b5fa-4880-a07a-0b788f491e9a@xen.org> <271ae402-7400-4dc5-9222-88523b9a2922@suse.com>
In-Reply-To: <271ae402-7400-4dc5-9222-88523b9a2922@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 6 Mar 2024 14:10:03 -0800
Message-ID: <CACMJ4GayS03SFV_3fOvcQ0DjPdYCSbAbgMo59ECet075xr_u-w@mail.gmail.com>
Subject: Re: Ping: [PATCH v2] Argo: don't obtain excess page references
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 6:52=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 18.02.2024 19:01, Julien Grall wrote:
> > On 14/02/2024 10:12, Jan Beulich wrote:
> >> find_ring_mfn() already holds a page reference when trying to obtain a
> >> writable type reference. We shouldn't make assumptions on the general
> >> reference count limit being effectively "infinity". Obtain merely a ty=
pe
> >> ref, re-using the general ref by only dropping the previously acquired
> >> one in the case of an error.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
>
> I'll give it till the end of the week for an ack to arrive (or a substant=
ial
> objection), and commit some time next week in the absence of any response=
.

I haven't gotten to this as quickly as I'd hoped for, sorry, but I've
given reference to this thread to some of the downstream argo users /
developers to see if there can be attention available and I'll be
attending the Community Call.

Christopher

>
> Jan
>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D89225AA4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRfB-00029r-9w; Mon, 20 Jul 2020 09:00:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezcM=A7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxRf9-00029l-7t
 for xen-devel@lists.xen.org; Mon, 20 Jul 2020 09:00:43 +0000
X-Inumbo-ID: 7d008372-ca67-11ea-847e-bc764e2007e4
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d008372-ca67-11ea-847e-bc764e2007e4;
 Mon, 20 Jul 2020 09:00:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id br7so17236837ejb.5
 for <xen-devel@lists.xen.org>; Mon, 20 Jul 2020 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=hbOqN9Eu9KHRkwvTw7eiGMP6+MkBBOekO76C1WlkNjs=;
 b=X11Y3aq7H7u954nX2xKi81ziIpcT8yrbyM7ttyu+gXlFvRd4etDcEqMO7eLYhsPxLX
 ZF4ZgCNdeua7Tgr6Pu1tPF8vn00gZvTz9rJRqifo/ah7fD6W8S7A6a1vOfgbnTy8K43X
 xWQNkoZxASc5QabNtAPV1qk2qyhMSjuQJlhTwWm8oc9J5E4Ab19P8nTJBWRcJiocx4o7
 advOFkApsDvQJEtZlL7sb9PdWy8iuF3TFzB+X6qL0HVprdgGvqevmLjRXKOWnhX/IOvz
 gB4bl4lXp7C+xI0lp94eClgruW5KV1iZn7BGRQuZyOhM8OPYAHNqcYRAk31SCrOUabcy
 Vf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=hbOqN9Eu9KHRkwvTw7eiGMP6+MkBBOekO76C1WlkNjs=;
 b=Dt6jRM1xehaQDAvtabvsXteFE+OcDT626PfQDiNRN5vfZxPXL36PidobALLUe/h/Q5
 6YX97w3KZt2ubTDElFqwn0ydd7jN0G0ljv/ribAh345InH3pxGvOPgw8bz881HiDX+zx
 sEsgm9kVldtzUP+UYAVQBEAxh1BiEFIpGkIbZ561obiCFO4sFjUTf88FVIjigJMiERFY
 CXEFxEZknIj42teEJE7fEK2jVPJwXgyEbgxRf8Fkekfvo9E6wJVIYRDsioUjvmit7Q1M
 HzwVEEaGiIKNJq0a5NAd4nUJit3cZgoi8PQhx609R2IpkD4pZxiZKUHO3KzIzAeMiMpR
 MCow==
X-Gm-Message-State: AOAM531yLoHshHfvyJhsLqB8RusWqtDpeBvUfcKK2MzosZy4sEEdxhjo
 2jpYIVl6RLQzxIVD+ffaH0s=
X-Google-Smtp-Source: ABdhPJz6estHlZJ//fvF/dNmWSvvGwzecLIizhvwYek7CsHCq+opErEAEddkETaBkxEJEpsp2LFI1g==
X-Received: by 2002:a17:906:191a:: with SMTP id
 a26mr20579085eje.315.1595235641169; 
 Mon, 20 Jul 2020 02:00:41 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id m6sm14097990ejq.85.2020.07.20.02.00.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 02:00:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Christian Lindig'" <christian.lindig@citrix.com>,
 "'Elliott Mitchell'" <ehem+xen@m5p.com>, <xen-devel@lists.xen.org>
References: <20200718033242.GB88869@mattapan.m5p.com>
 <1595234320493.39632@citrix.com>
In-Reply-To: <1595234320493.39632@citrix.com>
Subject: RE: [PATCH 2/2] tools/ocaml: Default to useful build output
Date: Mon, 20 Jul 2020 10:00:38 +0100
Message-ID: <000d01d65e74$3deda4d0$b9c8ee70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKVcH3Jn67g37z/wcsWrRp91TLbtgHVzaUjp4NWtpA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Edwin Torok' <edvin.torok@citrix.com>, wl@xen.org, dave@recoil.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Christian Lindig
> Sent: 20 July 2020 09:39
> To: Elliott Mitchell <ehem+xen@m5p.com>; xen-devel@lists.xen.org
> Cc: Ian Jackson <Ian.Jackson@citrix.com>; Edwin Torok <edvin.torok@citrix.com>; wl@xen.org;
> dave@recoil.org
> Subject: Re: [PATCH 2/2] tools/ocaml: Default to useful build output
> 
> 
> 
> > Time for a bit of controversy.
> 
> OCaml outside Xen has moved to a different model of building based on dune which is fast, declarative
> and reliable. The OCaml xenstore is stagnating because nobody with OCaml experience wants to touch it
> anymore.

It is still the default. Would you suggest that we change this and make C xenstored the default for 4.15, deprecating oxenstored
with a view to subsequently purging it from the tree in the 4.16 dev cycle?

  Paul

> It would be beneficial for the health of the OCaml xenstore to split it out such that it
> could be worked on independently. You might argue that Make is still appropriate for building OCaml
> projects but the OCaml community has moved through several build systems, starting from Make, and
> learned the hard way that this is not an easy problem. After years of more-or-less successful build
> system the consensus is that dune is right one and it has resulted in combination with the Opam
> package manager the ecosystem to flourish. Alternatively, it would be possible to move OCaml xenstore
> to dune within the Xen tree but it would create a dependency on it.
> 
> -- C




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CB09627D7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 14:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784792.1194181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIA3-0007Qo-IR; Wed, 28 Aug 2024 12:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784792.1194181; Wed, 28 Aug 2024 12:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIA3-0007Nv-FJ; Wed, 28 Aug 2024 12:52:31 +0000
Received: by outflank-mailman (input) for mailman id 784792;
 Wed, 28 Aug 2024 12:52:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BXJm=P3=gmail.com=aha310510@srs-se1.protection.inumbo.net>)
 id 1sjIA2-0007Nn-7F
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 12:52:30 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 603c38f3-653c-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 14:52:26 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-201e64607a5so47884815ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 05:52:26 -0700 (PDT)
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
X-Inumbo-ID: 603c38f3-653c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724849545; x=1725454345; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g2hMAGnvoRO6n2Q7lnRfLg+Icwjjl00HQPQLTynWNlU=;
        b=ROyUwlVsLjyo/ixqu6Cym15+R8QDrZL8tS+8Gc3LdVdHMJNVNofiXbQfbpd+l1w4bo
         yy4LKNLsseIiLpjENQkErCqqveN+TyGfnUI1P0a7PjMAuQhj2hikXvDEkUv/kCTsp7rB
         WZo+6EPzbRVjG/etF0t/R4/JK3MFdx/vj7XRrFnF+UEklO08RXmRQY1jDFNuUD4JmmjU
         gdp3tlf1drml3QNt7LSEwmDeR7rXVyh9QNlfnUY+Nm4TCYbMz4beN8bbzPc1QxSaxrPS
         A9uNec3R9C4yPCQOAW2xuP5ezThvgJQX9aX80KI31Gan3gujWhrtDGqIf1oPp3gjH9Tc
         K7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849545; x=1725454345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2hMAGnvoRO6n2Q7lnRfLg+Icwjjl00HQPQLTynWNlU=;
        b=duWoBO8e22EojgFkdHG6QwifWibq51vNzSIu0QUQzg7Qj856AQ+O1k7Pds4Asj3d2a
         GojkSknA3BU6BBXYQbx5A+qCW4Jb+0q5kSMf0EIyV86+TcHodnDHEb0Co23fkqT+Yzs0
         EkpsESFClWGVxrMXrGGXUTbeAWJ6/4BR0Vmj00oN4Da3m9V8WhxJv0yjPEacQ9aACBtW
         zWL+WsSC8Z1N9uIdEND0CfpP8wFc0JwCNfbNjZ1evofZJ91YEejYfzhJbc6A6obtdB1O
         LCcd4s7Uy1NsMqVDNJYvUOwgPnBkNjngW1GakcpDdyjV1SylRDdIOsZzvr1NGl+TRWXv
         nVCA==
X-Forwarded-Encrypted: i=1; AJvYcCUqE+l9QMt+QSuyRrS6CcuHq7/GDeZiT3OGzGQs+YhUSR9Sqy1iiOXyy/iKcwE/JN0haJ8BpC6EmwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcgjI7DbsjzVO9fv85blH3nVZ6uJKALA4wlQP/XanMS3lwOIvc
	C8Okp/rGqwBwG8TLHvqezUmSER4tOTlURnJsjvHrIGEsCpkXrNB2GL5HvCYQW3/jmDwMKs+dzxm
	o7zwxjemqSlN7LnYaURI9+4jn7gc=
X-Google-Smtp-Source: AGHT+IGK2UffMTh2JEs6OvO7g3s2HyjTdn804wzwOm6obRBkMq9RSUKF79nQzyur3eL7iSr3cVLPMRQrpw3b+WCyRiI=
X-Received: by 2002:a17:90b:1116:b0:2d4:6ef:cb0c with SMTP id
 98e67ed59e1d1-2d646d6fb51mr15192481a91.43.1724849545019; Wed, 28 Aug 2024
 05:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240822181109.2577354-1-aha310510@gmail.com> <fd2a06d5-370f-4e07-af84-cab089b82a4b@redhat.com>
In-Reply-To: <fd2a06d5-370f-4e07-af84-cab089b82a4b@redhat.com>
From: Jeongjun Park <aha310510@gmail.com>
Date: Wed, 28 Aug 2024 21:52:12 +0900
Message-ID: <CAO9qdTGHJw-SUFH9D16N5wSn4KmaMUcX+GVFuEFu+jqMb3HU1g@mail.gmail.com>
Subject: Re: [PATCH net] net/xen-netback: prevent UAF in xenvif_flush_hash()
To: Paolo Abeni <pabeni@redhat.com>
Cc: wei.liu@kernel.org, paul@xen.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, madhuparnabhowmik04@gmail.com, 
	xen-devel@lists.xenproject.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2024 13:19:59 +0200 Paolo Abeni wrote:
> On 8/22/24 20:11, Jeongjun Park wrote:
> > During the list_for_each_entry_rcu iteration call of xenvif_flush_hash,
> > kfree_rcu does not exist inside the rcu read critical section, so if
>
> The above wording is confusing, do you mean "kfree_rcu does not exit
> from "...?
>
> > kfree_rcu is called when the rcu grace period ends during the iteration,
> > UAF occurs when accessing head->next after the entry becomes free.
>
> The loop runs with irq disabled, the RCU critical section extends over
> it, uninterrupted.

Basically, list_for_each_entry_rcu is specified to be used under the protection
of rcu_read_lock(), but this is not the case with xenvif_new_hash(). If it is
used without the protection of rcu_read_lock(), kfree is called immediately
after the grace period ends after the call to kfree_rcu() inside
list_for_each_entry_rcu, so the entry is released, and a UAF occurs when
fetching with ->next thereafter.

Regards,
Jeongjun Park


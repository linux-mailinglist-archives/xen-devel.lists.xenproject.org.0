Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C2C7D2ED5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621170.967351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurZQ-0004JH-O9; Mon, 23 Oct 2023 09:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621170.967351; Mon, 23 Oct 2023 09:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurZQ-0004HB-Ju; Mon, 23 Oct 2023 09:50:00 +0000
Received: by outflank-mailman (input) for mailman id 621170;
 Mon, 23 Oct 2023 09:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qurZO-0004H5-Mf
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:49:58 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 869aa774-7189-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:49:57 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c16757987fso44728831fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:49:57 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a2ea488000000b002c27cd20711sm1532745lji.3.2023.10.23.02.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:49:56 -0700 (PDT)
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
X-Inumbo-ID: 869aa774-7189-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698054597; x=1698659397; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZUec5HQQ2PSukLyXg/hoAoXU+/9nN+IY2Wex/kqK/S8=;
        b=PEoYkluLHjSe6KgCh+5tPuatump5suqwhjPHZ8U2HRxosX5N6RWT+dLUde5XiQCFkq
         9a1fBu4o2Rri86wktRjLZITeyw45QvJAzd7uUU58IK0WTbdiuxkcEQfZ1gvE/cSLKrlZ
         9cB/7ZBdRNdOkIaR+nTMGBZZ3FEY32Y3C+wmCAVVxbEQTz3hCSa72P/wJ/+Djmy/CIMh
         rn65eQ/I902wzONPkTP4aE3gY8Q3lWWAGiaSOP7YwSS7Ix2deDOn/S85ERpcxgecKTBJ
         61SEGESU5DdwM9lEYHImqnxwEpW73hsq5RWtZpbCkq4C81M6FjoNKMUBlMuJiakLH7Qo
         D0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054597; x=1698659397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUec5HQQ2PSukLyXg/hoAoXU+/9nN+IY2Wex/kqK/S8=;
        b=asDBntkT67NwVQ/j96Ek2RrvzwUUaLWegRwiAqtjCtTKaWqRwRmkXG5NswlvRFnIkf
         5aHZGb/34SZYMCWFYBFfPxsrCVOLn7Xnozi0NqlVbzyOzg5JpLOUKbsrVG2Z7qPQHg+h
         ZsOrUgJYjuZWx1Co287hF4AJJUbCR90xINp7QHak1l5Et9MGFKaGf6j77qwY//JkYMD+
         FFHXni9Qzt9PCPhKelx27WhY1Bbl85uBDPBhw8wqoQbPbl1buR0zGQbDRmSRaNuJ3pm7
         sSF3V01LVPNfNw+NJM0AZmZ2KEC9WCeYpaFWoN7kYcd/ZA6fzzXVdDMu9JQQodJ9EZxB
         gupA==
X-Gm-Message-State: AOJu0YxDR+ZrpbP5OpWIcB3xB5lQ4CD0AmeD9OMDJowN40AAaeycbwSU
	x1tRnPhn2s32BZ3SiCRTU7g=
X-Google-Smtp-Source: AGHT+IGfrBIxdBtldO0DBN8K4McjKWv91BJBT05/D5AskVb7Pt0FbfJTpZ0z0aVQmjmMaykcNwTnsQ==
X-Received: by 2002:a2e:90d0:0:b0:2c5:ee7:b322 with SMTP id o16-20020a2e90d0000000b002c50ee7b322mr6207788ljg.18.1698054597113;
        Mon, 23 Oct 2023 02:49:57 -0700 (PDT)
Message-ID: <3889dd0e2b3bae28d6b74ab72038ad29ac97cab9.camel@gmail.com>
Subject: Re: [PATCH v1 03/29] xen/asm-generic: introduce stub header
 cpufeature.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 12:49:55 +0300
In-Reply-To: <dbc0e6fb-3f25-b4cb-83a2-d7c5f1a9e0a3@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <c89b1a60ee40576a2841c222a2cefc5ae2a301d3.1694702259.git.oleksii.kurochko@gmail.com>
	 <dbc0e6fb-3f25-b4cb-83a2-d7c5f1a9e0a3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:11 +0200, Jan Beulich wrote:
> I'm not convinced an arch can get away without such a header.
> Certainly
> RISC-V and PPC can't, with all their ISA extensions that already
> exist
> (part of which will want making use of, others may simply want
> exposing
> to guests).
Yes, it looks like you are right. I forgot about a considerable amount
of ISA.

By this patch series, I tried to move headers to asm-generic to build
minimal Xen without introducing the stub cpu_nr_siblings(unsigned int
cpu) for each new arch. But taking into account that likely this header
will be re-introduced for an arch, there is probably no sense to have
it in asm-generic.

~ Oleksii


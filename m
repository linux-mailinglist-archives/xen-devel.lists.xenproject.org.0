Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8F717B07
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 11:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541673.844636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Hhw-0001zR-8L; Wed, 31 May 2023 09:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541673.844636; Wed, 31 May 2023 09:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Hhw-0001wS-4s; Wed, 31 May 2023 09:01:28 +0000
Received: by outflank-mailman (input) for mailman id 541673;
 Wed, 31 May 2023 09:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOFA=BU=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q4Hhu-0001wM-Dp
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 09:01:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b78d825c-ff91-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 11:01:23 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so4048457f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 02:01:24 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 20-20020a05600c22d400b003f180d5b145sm19957669wmg.40.2023.05.31.02.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 02:01:23 -0700 (PDT)
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
X-Inumbo-ID: b78d825c-ff91-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685523683; x=1688115683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQXWIfDuVmsIWvJfCCkpoHNdEpUjjhn2AgEZ3ftf/xQ=;
        b=Fl8AxKrsYXzncYC4ObhJR0K2XfnieKzs46piHcvq5aXtYii3Gf7zvI92S2dkVVnuMD
         hkbCq+UpE/75w+VYzUn5Es/LVpjbYqoArbGZqmMhzI9ivwhOGKiOD2h0kUD8JQPnqxyv
         M/BfFnL4zCpI5JXntkq7dD/Vi/FvCoxcbqh4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523683; x=1688115683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQXWIfDuVmsIWvJfCCkpoHNdEpUjjhn2AgEZ3ftf/xQ=;
        b=eLIVHHC8VpU1Eha7/nBn/0Hh8BocUe0i7OftTbxCMt5truimYR9pLHjM61evx3DXy2
         n/0XZt7N8lwCbu0zJyN0WbKSHIPYRRjzBI9bnMY6ZC+9Q8k2gzcx5DgPRxV8yA+bJkwd
         uxP5UHdndoTq7QQQ0yWLCpibwFhebJccYQqJZCxO6MaZo7aAMUvgbrRYlLTMjanaPNX3
         /N22mBjzKGZ1pyd+p6rqjAl2r8EgGe8V27k2uYTNhg8GDeo0fnY4IOQ10C0eoK+kylRw
         J3kFnIhwL5I20ErW1m6wzzpaNo+HCSMw3NM9Komy4SzhDgKRrGDKhYHFk36Fab7SLO8a
         p36Q==
X-Gm-Message-State: AC+VfDwFXzcOteqfAIviQeIpvT8WbIA7lb8TqZW4he0qjqQeNiADacjA
	5Y9k69fF8k5lgSHfvOST4uqp/A==
X-Google-Smtp-Source: ACHHUZ4eujNhAr1KbosS0Y71g2yECH5jD8CRv4UNl7qvMDEtgA1r6DkaMn/uODmiUKmlUfBufsGX2g==
X-Received: by 2002:a05:600c:20c:b0:3f4:253b:92b3 with SMTP id 12-20020a05600c020c00b003f4253b92b3mr3695636wmi.18.1685523683707;
        Wed, 31 May 2023 02:01:23 -0700 (PDT)
Message-ID: <64770ce3.050a0220.fb998.7ff6@mx.google.com>
X-Google-Original-Message-ID: <ZHcM4WIfJ8+Tu1PB@EMEAENGAAD19049.>
Date: Wed, 31 May 2023 10:01:21 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] x86: Expose Automatic IBRS to guests
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
 <20230530135854.1517-3-alejandro.vallejo@cloud.com>
 <2e1bea58-9f6f-08c0-ce00-148f79ba12ff@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e1bea58-9f6f-08c0-ce00-148f79ba12ff@citrix.com>

On Tue, May 30, 2023 at 06:31:03PM +0100, Andrew Cooper wrote:
> I've committed this, but made two tweaks to the commit message.  First,
> "x86/hvm" in the subject because it's important context at a glance.
Sure, that makes sense.

> Second, I've adjusted the bit about PV guests.  The reason why we can't
> expose it yet is because Xen doesn't currently context switch EFER
> between PV guests.
> 
> ~Andrew
We could of course context switch EFER sensibly, but what would that mean
for Automatic IBRS? It can't be trivially used for domain-to-domain
isolation because every domain is in a co-equal protection level. Is there
a non-obvious edge that exposing some interface to it gives for PV? The
only useful case I can think of is PVH, and that seems to be subsumed by
HVM.

Alejandro


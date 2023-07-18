Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8616757DBA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565264.883278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkrW-0001kd-PL; Tue, 18 Jul 2023 13:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565264.883278; Tue, 18 Jul 2023 13:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkrW-0001iH-M4; Tue, 18 Jul 2023 13:35:34 +0000
Received: by outflank-mailman (input) for mailman id 565264;
 Tue, 18 Jul 2023 13:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rqcw=DE=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLkrU-0001eu-NT
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:35:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5caca91-256f-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:35:29 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-991da766865so793795266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 06:35:29 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l13-20020a17090615cd00b00993150e5325sm1049075ejd.60.2023.07.18.06.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 06:35:28 -0700 (PDT)
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
X-Inumbo-ID: f5caca91-256f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689687328; x=1692279328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3Ks21vQ0QD/Q6GX+JHf+tnkI0+MFuZemE5sq0qUotE=;
        b=QoJMATz6yBWruVqSnEibnzWLbzuy9f6Eo+8TZ4YhLuL0uW+eS0hX3cILlFbAOvNg61
         RPP3WbDZanDzZFYz4BRH638z3dIpA/gYjCtWa3dWhpThsAVfQzhgvJzQgzfsnkfm8tep
         +th8DK/QxXs/FhNYcH3ALLVhWtbyyia1Tf+zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689687328; x=1692279328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3Ks21vQ0QD/Q6GX+JHf+tnkI0+MFuZemE5sq0qUotE=;
        b=cpvzEpq83yu/k0BOIeI40Zxc+B3LZKc1EyDc/RYNP49a+UwqBjV4/TN8WHn6oTLWPN
         0zMK+RBOgmDYwjmbtxW7Kj5DLHCVwX0WHWysRhZnf18wufpQXKK7Tl3/+JKm50LSPzNX
         1Iee+6QOXJN/9T4fxwbDnUEPxeRiCdNRZ4QcsCOYIczVwZNSVArh9gCgTkfdnq/oE231
         sRuprSN7G7lYyPZGJ5q4iYmg8ORvfIwC/jTZTwxYJ4lutsG52NKIvy09eRFT0bsMoVp1
         DqJNXgg7aJu3dA/hcgntAyMGrxXKJnuy0WT23GavaPCMxHny7NrrrQewKsoZtEDkch0F
         eMYA==
X-Gm-Message-State: ABy/qLaqrT7tyL0NJFy6dqj9bQ3jqxDS5fiqfAhBq9q+3wWhoadJsx0m
	RDFvCa3iT+/bnETtwloVbu8dLQ==
X-Google-Smtp-Source: APBJJlGkQAOi7jQ9dASPE0Zg0p0zt8gdNe5MrfCRrN7sbvv8Qfrd7bgP+LsAWmCH/5CwbN+Ubokc+Q==
X-Received: by 2002:a17:907:d0d:b0:988:9b29:5653 with SMTP id gn13-20020a1709070d0d00b009889b295653mr13116302ejc.77.1689687328677;
        Tue, 18 Jul 2023 06:35:28 -0700 (PDT)
Message-ID: <64b69520.170a0220.8de7a.4a1b@mx.google.com>
X-Google-Original-Message-ID: <ZLaVH2yvmivX8cQg@EMEAENGAAD19049.>
Date: Tue, 18 Jul 2023 14:35:27 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/8] build: Remove CONFIG_HAS_PDX
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-5-alejandro.vallejo@cloud.com>
 <7e5bd2a4-d810-cc48-cf43-3ad64e501d55@suse.com>
 <c06920d5-763e-a141-cd68-dedcecd33da8@citrix.com>
 <d9cd0bfa-52f9-94a3-0226-aa85d49a58a5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9cd0bfa-52f9-94a3-0226-aa85d49a58a5@suse.com>

On Tue, Jul 18, 2023 at 11:38:14AM +0200, Jan Beulich wrote:
> On 18.07.2023 11:35, Andrew Cooper wrote:
> > On 18/07/2023 10:19 am, Jan Beulich wrote:
> >> On 17.07.2023 18:03, Alejandro Vallejo wrote:
> >>> It's set everywhere and can't be turned off because it's presence is
> >>> assumed in several parts of the codebase. This is an initial patch towards
> >>> adding a more fine-grained CONFIG_HAS_PDX_COMPRESSION that can actually be
> >>> disabled on systems that don't typically benefit from it.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >> On its own I don't think this is okay, as it's unclear whether it would
> >> affect RISC-V or PPC in a negative way.
> > 
> > Neither could compile without layering violations of PDX logic in common
> > code, and neither have got that far yet.
> > 
> > Now is an excellent time to be doing this, because it removes work for
> > RISC-V/PPC...
> > 
> >>  If at all, it should only go in
> >> together with the later re-introduction of a CONFIG_*.
I could merge this patch with patch 8. I do feel they tackle different
matters, but when HAS_PDX goes away doesn't matter.

> >> Still I question
> >> whether that new CONFIG_HAS_PDX_COMPRESSION (which imo ought to be
> >> CONFIG_PDX_COMPRESSION)
Sure, I'll change that in v2.

> >> then wouldn't better depend on the arch-selected
> >> HAS_PDX, such that it wouldn't wrongly be offered to choose a value when
> >> compression isn't supported in the first place.
There are several concepts to consider:

  * Frame numbers (mfn)
  * Frame table indices (pdx)
  * Mapping between the 2 (pdx_to_pfn/pfn_to_pdx)

  (I purposefully ignore the directmap. There's a similar argument for it)

An arch opting out of pdx and an arch opting out of pdx compression are in
the exact same situation, except the later has the ability to easily toggle
it back on. Using pdx (_not_ compression) as a first-class type has several
advantages.

  1. It allows common code to deal with pdx too. There are some conversions
     to/from pdx that have to do with arch-specific code calling common
     code or vice-versa. This is particularly bad in the presence of
     compression This is particularly bad in the presence of compression
     because it implies fairly frequent reads of global state.
  2. It allows a port to get pdx-compression for free if it opts into it;
     and more importantly, the ability to toggle it.
  3. Simplifies the compression removal logic. Otherwise #ifdefs need to be
     sprinkled around any architecture that may want to toggle it and
     that's several orders of magnitude more difficult to read.

TL;DR: There is not a benefit in a new port purposefuilly avoiding PDX.
It's just a name for a particular index. It's _compression_ that makes it
have a whacky relationship with mfns and might want toggling.

Incidentally, note that common/numa.c does use PDX.

> > 
> > ... although I do agree that the resulting option shouldn't be user
> > selectable.  It's a property of the architecture, not something a user
> > should be worrying about.
> 
> I disagree. Exotic x86 hardware may or may not want supporting, which
> can only be determined by the build meister, as long as this is indeed
> meant to become a build-time decision (rather than a runtime one; see
> my response to the cover letter of this series).
> 
> Jan
I won't get into x86, because I have never seen such exotic hardware, but
ARM definitely has a lot more heterogeneous system designs where it might
be needed on a system-by-system basis.

Alejandro


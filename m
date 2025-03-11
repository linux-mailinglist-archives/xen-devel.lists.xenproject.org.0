Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3EA5CDFC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 19:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908853.1315901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4Rp-00037S-0q; Tue, 11 Mar 2025 18:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908853.1315901; Tue, 11 Mar 2025 18:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4Ro-00034s-Ta; Tue, 11 Mar 2025 18:35:24 +0000
Received: by outflank-mailman (input) for mailman id 908853;
 Tue, 11 Mar 2025 18:35:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QaIb=V6=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1ts4Rm-00034m-Pi
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 18:35:22 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917d611a-fea7-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 19:35:12 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so4631632a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 11:35:12 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c745d5cfsm8619384a12.19.2025.03.11.11.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 11:35:11 -0700 (PDT)
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
X-Inumbo-ID: 917d611a-fea7-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741718112; x=1742322912; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htF2N9p/aAIVZMCKfEGHMLMJDu/Sei2gfh7cJJB7TyQ=;
        b=GzeejAFca/Ir9xstoP84IBFmpRScfx1dAMi2mHBxcF6YycH2PAqzsgPpaZpWny+9HQ
         O4JzDkc4g9QM/LqJaREH9GsTqD1OwZLRzm85PJLbvI60N6ztkD5mA/Hh0VytDrbfQzzw
         znCUClFRzqSq6cVMrVvR8jqaj/qVfowqoIg8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741718112; x=1742322912;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=htF2N9p/aAIVZMCKfEGHMLMJDu/Sei2gfh7cJJB7TyQ=;
        b=VsmfNSEk2Zb6sMtt2gnZpanNP3McJjASGjd48gn/K2hwIX8G/lrzwdrqvK4bwTzP2n
         DvQ/LZLlb10VKcdXptltI7dJ/tVGrMMrUXgakRHBLHX7QzMAnu1nef+7V7pmRViaUAwl
         KS+16kWTihwsMHjMiU/kzwblTeo4Ot8xnkXE83aX+DqL/bYuQIooIn6AHhHycZsJmKjM
         hLkvqnjjBpUlaPhp1BpOzLW2Pw/LLJODkFolQgRE1LO01onwAuj0uYzX9N8biQNF4CMj
         3TrR1p4pXeGSrCT+P2U803OsW67tKXWOpWQGwklhL9F2gI6dSQVPSLcK9Kz3UtCmTSKv
         UZrg==
X-Gm-Message-State: AOJu0YxfNCSUbrT6H46pjasZfsBawo3mhKORV2LonRpM3w9PJNrARIFR
	ha8Z68vijeRxLfEE+dQSI5zY24fyo6ElQPIzfJwV1rvU9R/8VxYmrghUFpCfE28=
X-Gm-Gg: ASbGncst0+3qPllLYcFbcg/PNgl2rX2IKd0jccEkjM9buqR4iJ8rD+AwFFcp9D5i4Vt
	EVoicFUVD4+U2ln2MjW2Gp/ePEutNX2++9bHSXON6GA/BesoMTTMSxLs9msyIt0apIs+i+i6gLs
	0HhpwywxSjfO3w46NNuC2IcNi4TDNHIiY62joJxny/mjwMivLujE29M/RW9l6WPDkyEJ212scLl
	RMHqPz6lvEaViHZPENWQwAasY9+tl6/YE1iYjxPdX6tTe60c0xC2CuYOlySw953KBB2DJli1BZC
	mHGdxYcK5SDq2BTIiiexboyprpLAbvkanhFy2IHh8rgY0DXv22E=
X-Google-Smtp-Source: AGHT+IGcHf61jKUTnaAIgdaEUfpQt8Di28ya7aIPnzou0v1dGsyW9MuvkZaBuSazAT0WgvIjGDNzwg==
X-Received: by 2002:a05:6402:270f:b0:5de:dfde:c8b1 with SMTP id 4fb4d7f45d1cf-5e5e229de50mr43768067a12.4.1741718111956;
        Tue, 11 Mar 2025 11:35:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 18:35:09 +0000
Message-Id: <D8DNJHDNZNRD.1XOJK139C5PEI@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
 <Z9AwsrDBELe2UREz@macbook.local> <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>
 <Z9BZ-V8fWHOAwMJ7@macbook.local>
 <de418de2-b059-4f1e-92b0-42a236208b14@suse.com>
In-Reply-To: <de418de2-b059-4f1e-92b0-42a236208b14@suse.com>

On Tue Mar 11, 2025 at 3:45 PM GMT, Jan Beulich wrote:
> On 11.03.2025 16:42, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Mar 11, 2025 at 02:53:04PM +0000, Alejandro Vallejo wrote:
> >> On Tue Mar 11, 2025 at 12:46 PM GMT, Roger Pau Monn=C3=A9 wrote:
> >>> On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
> >>>> The logic has too many levels of indirection and it's very hard to
> >>>> understand it its current form. Split it between the corner case whe=
re
> >>>> the adjustment is bigger than the current claim and the rest to avoi=
d 5
> >>>> auxiliary variables.
> >>>>
> >>>> Add a functional change to prevent negative adjustments from
> >>>> re-increasing the claim. This has the nice side effect of avoiding
> >>>> taking the heap lock here on every free.
> >>>>
> >>>> While at it, fix incorrect field name in nearby comment.
> >>>>
> >>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>>
> >>> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>
> >> Thanks.
> >>
> >>> I think it would be nice to also ensure that once the domain is
> >>> finished building (maybe when it's unpaused for the first
> >>> time?) d->outstanding_pages is set to 0.  IMO the claim system was
> >>> designed to avoid races during domain building, and shouldn't be used
> >>> once the domain is already running.
> >>>
> >>> Thanks, Roger.
> >>
> >> As a matter of implementation that's already the case by toolstack bei=
ng "nice"
> >> and unconditionally clearing claims after populating the physmap.
> >=20
> > I see.  Another option would be to refuse the unpause a domain if it
> > still has pending claims.  However I don't know how that will work out
> > with all possible toolstacks.
> >=20
> >> However, I agree the hypervisor should do it on its own. I didn't find=
 a
> >> suitable place for it.=20
> >=20
> > You could do it in arch_domain_creation_finished().
>
> Except that better wouldn't be arch-specific.
>
> Jan

Why would it have to be arch-specific though? As far as the hypervisor is
concerned, it doesn't seem to be.

Cheers,
Alejandro


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF90487CD1D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 13:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693839.1082453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl6VD-0007By-5Q; Fri, 15 Mar 2024 12:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693839.1082453; Fri, 15 Mar 2024 12:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl6VD-00079i-2t; Fri, 15 Mar 2024 12:17:35 +0000
Received: by outflank-mailman (input) for mailman id 693839;
 Fri, 15 Mar 2024 12:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A35=KV=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rl6VA-00079b-Rx
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 12:17:32 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff1402ff-e2c5-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 13:17:31 +0100 (CET)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-221830f6643so1118153fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 05:17:31 -0700 (PDT)
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
X-Inumbo-ID: ff1402ff-e2c5-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710505050; x=1711109850; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6gPQ4WDYUxprQhEdyUeUfF/08t4lHxJxIj5U8So4xs=;
        b=hrCMNhkOoJfeaZbmTXuiStpFGPo8BnlmLTjq6foc9RMZSgXm5+z9CoyhDW3LHK75zf
         gFyQRxMmlLSwkc9yygIPAQ/ocF8ycUo2tgVYKhsZ5tGA0IV7UY6RrA5lgKp3hlA9jGb9
         jNkmknPPNd8yUnGTCF21t1GJZ8+rH44p8NXlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710505050; x=1711109850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6gPQ4WDYUxprQhEdyUeUfF/08t4lHxJxIj5U8So4xs=;
        b=CUKtKZ28IGmSLSWA/Z00kNb2DYjbAzdtGMIe+9VF0uOK4TiIqcmNiLEbY8WsLLr0T6
         r1WICG5irQDR2O9LlaXTwXRef77dJvhavcTP1hZSDIuscejrIel7WJ3SKLRmCO4EyjBi
         zhRn1VkOWPMZIqztA3jfNjclXalYinufyROz+FdALQfgAfKiB0MdZWIg63x0vQu0fe22
         N+P8x3zf2PKPjQ2ERlVo1WDHmJevwXixJvC1TQG27AuxTCv392gVPXK5XHr2+1dxRIFc
         DVbgoRe2oh8ccln1NVQ40oNDMaM5O5edwCZ34VqgRYUtH7Pd+qAsj8olg2WZCbZ1Dwu+
         J0mw==
X-Forwarded-Encrypted: i=1; AJvYcCVSkEpo1IZNu27tijOYDB2BN5LKTqmBNHgVMdLDVPXwvagPIaLvMsKIZPSM/BxJkcC/DwkxW6ry+GxP633HPnTaKnp2QeBBgjltZSwaqoA=
X-Gm-Message-State: AOJu0Yytfj8EvWQPucgZXnBLe0udog67b9Ct910Sv9MY7XCpcc/GPhbb
	baRWtXdScP8yfrzUdzbfeZ30xBxLtx8y1ug84TVmFuNAVYbl3B2iP3ylciVqeQbDmPLx6So+tdN
	I/D+aUZ8EyKNvTSsvZOkiJY80M2RRAkZOsMgABQ==
X-Google-Smtp-Source: AGHT+IG5GSULDr5g0JuUkibPJm8GUihvcxvoHSQflK1udT/a6PfpKRJDEU2GJMPn3UG2C9udzPNdGf6WefRb0A0q0TU=
X-Received: by 2002:a05:6870:5b81:b0:221:cb1b:c57d with SMTP id
 em1-20020a0568705b8100b00221cb1bc57dmr5209269oab.7.1710505050569; Fri, 15 Mar
 2024 05:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com> <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org> <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com> <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com>
In-Reply-To: <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 15 Mar 2024 12:17:19 +0000
Message-ID: <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, federico.serafini@bugseng.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org, 
	michal.orzel@amd.com, julien@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 11:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
> > It sounds like Andy and Stefano feel like this is a situation where "a
> > fixed width quantity is meant"; absent any further guidance from the
> > CODING_STYLE about when fixed widths should or should not be used, I
> > don't think this change would be a violation of CODING_STYLE.
>
> As with any not sufficiently clear statement, that's certainly true here,
> too. Yet if we try to give as wide meaning as possible to "a fixed width
> quantity is meant", there's basically no restriction on use of fixed widt=
h
> types because everyone can just say "but I mean a fixed width quantity
> here". I think the earlier sentence needs taking with higher priority,
> i.e. if a basic type does for the purpose, that's what should be used. Th=
e
> 2nd sentence then only tries to further clarify what the 1st means.

Come, now.  There are lots of situations where we just need some sort
of number, and there's no real need to worry about the exact size.
There are other situations, where we mean "whatever covers the whole
address space" or the like, where it makes sense to have something
like "unsigned long", which changes size, but in predictable and
useful ways.  There are other situations, like when talking over an
API to code which may be compiled by a different compiler, or may be
running in a different processor mode, where we want to be more
specific, and set an exact number of bits.

Should we use uint32_t for random loop variables?  Pretty clearly
"No".  Should we use uint32_t for the C entry of a hypercall, even
though the assembly code allegedly makes that unnecessary?  At least
two core maintainers think "maybe just to be safe".  That's hardly a
slippery slope of "anyone can say anything".

Other than "it's in CODING_STYLE", and "it's not really necessary
because it's ensured in the assembly code", you haven't advanced a
single reason why "uint32_t" is problematic.

 -George


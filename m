Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F209EA5DB4B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 12:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910245.1316984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsK8O-0007cf-33; Wed, 12 Mar 2025 11:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910245.1316984; Wed, 12 Mar 2025 11:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsK8N-0007aA-VQ; Wed, 12 Mar 2025 11:20:23 +0000
Received: by outflank-mailman (input) for mailman id 910245;
 Wed, 12 Mar 2025 11:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQxO=V7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tsK8N-0007a4-6O
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 11:20:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7ad4966-ff33-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 12:20:14 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso4795195e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 04:20:13 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a72eeecsm18248375e9.3.2025.03.12.04.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 04:20:12 -0700 (PDT)
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
X-Inumbo-ID: f7ad4966-ff33-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741778413; x=1742383213; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD0yBL3az1iQZ5vJbP/2HpY7+HuvtcqpDPZCfuEH298=;
        b=NiXB+av89mMvnn0Yck7Bp44LNbuakMKam5uOc1QrzsaG4QG85g2WLbvpuH0Umuh8He
         pJWmNU64w4d77l/JFm8IMBXmHENnyNksrwY/+ZFpiOTi7BsLzMJXvj43Bi/OATet8Bsr
         Ov71Uu//JeQ+LEEuc9YuuwMzmFARDpyR1y0b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778413; x=1742383213;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jD0yBL3az1iQZ5vJbP/2HpY7+HuvtcqpDPZCfuEH298=;
        b=HiKb3bG2vhtz/KtD5XWTYTpSMWP0Oo8LKTqHz0GuGkiewRxMFIisBPSF+jYtrA/WZO
         Cj2Ne7I3245QxzuTlCi+CGQPnL2ltCvvx1rFOoYGGxOTDDkHaLIJuVpFuAxRIlnTJNjO
         OQbkieP2UdT5wiOfLeNRghBp68iELPN26m/zDhEUggwQVEIxCMfpeATPDk7uQ5t7oJGx
         84PHOc+8/jOyYQ1xOT7X6kv6pj6VzbnmPEJ2JgPt0JB3W0OuAvW253YX/IYH1CccCtoz
         Y0P+K0Yc1H1AiCgBC0vm5oKXiEwdiEp74jrHvG9fSV/lc1ym6hvw4yAEQFH1LbgTkRIY
         yzxA==
X-Gm-Message-State: AOJu0Yz8W33kUITWsC5gZhHHmaGNShonK711FvardCEPphaM4P8y22MK
	6ge4PN3FcavdBn2B5S3D7FbKYgXTeuW/0mMBmm4yREw13mzRURyFcCMVNO+mibM=
X-Gm-Gg: ASbGnctJ+sn+vDtrtA2gcPx9GzAFOS6yCRBBiYAjgtl1gsLDwcgpmiCxuQDXJVv1+f4
	5wWRRDFUm/l2raLiumpoowb74KOxywnBiQSpTUKrOzjNhYgqoh2GTxNg0LLNWGNs/PGc1JWm0Ui
	tYndHZ53dmIHdYYUpdEKwZbTUEShfpZbita2M5zGJqZU8C/ES1GSqkJqt0V2sbOHjHMl0hltPvk
	8BeRs7a5RSGWMIC1x73z/Tz0PQyrJJZEyduWfWuaW18TSSjOItkv4gexskfzFisK6vU2pflZg0N
	xp8hhPf6kEKTqoR7x1gvX/boNlGfD2vCvbgPLiTs/+mMAjbI0G4=
X-Google-Smtp-Source: AGHT+IH7/8ah6Zc2fJ9TdOMtGMN3FZITW0UaMKFft/1i0s38c/h4TCgplUsgEZzSQZoEXrtk2lOVyw==
X-Received: by 2002:a05:600c:4708:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43d01d322f1mr69980305e9.10.1741778413102;
        Wed, 12 Mar 2025 04:20:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Mar 2025 11:20:10 +0000
Message-Id: <D8E8WZJYP3AH.2TPAHWGFJ68TV@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
 <Z9AwsrDBELe2UREz@macbook.local> <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>
 <Z9BZ-V8fWHOAwMJ7@macbook.local>
 <de418de2-b059-4f1e-92b0-42a236208b14@suse.com>
 <D8DNJHDNZNRD.1XOJK139C5PEI@cloud.com>
 <52918859-3922-4b2d-b432-162a9de2b554@suse.com>
In-Reply-To: <52918859-3922-4b2d-b432-162a9de2b554@suse.com>

On Wed Mar 12, 2025 at 8:21 AM GMT, Jan Beulich wrote:
> On 11.03.2025 19:35, Alejandro Vallejo wrote:
> > On Tue Mar 11, 2025 at 3:45 PM GMT, Jan Beulich wrote:
> >> On 11.03.2025 16:42, Roger Pau Monn=C3=A9 wrote:
> >>> On Tue, Mar 11, 2025 at 02:53:04PM +0000, Alejandro Vallejo wrote:
> >>>> On Tue Mar 11, 2025 at 12:46 PM GMT, Roger Pau Monn=C3=A9 wrote:
> >>>>> On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
> >>>>>> The logic has too many levels of indirection and it's very hard to
> >>>>>> understand it its current form. Split it between the corner case w=
here
> >>>>>> the adjustment is bigger than the current claim and the rest to av=
oid 5
> >>>>>> auxiliary variables.
> >>>>>>
> >>>>>> Add a functional change to prevent negative adjustments from
> >>>>>> re-increasing the claim. This has the nice side effect of avoiding
> >>>>>> taking the heap lock here on every free.
> >>>>>>
> >>>>>> While at it, fix incorrect field name in nearby comment.
> >>>>>>
> >>>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>>>>
> >>>>> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>>>
> >>>> Thanks.
> >>>>
> >>>>> I think it would be nice to also ensure that once the domain is
> >>>>> finished building (maybe when it's unpaused for the first
> >>>>> time?) d->outstanding_pages is set to 0.  IMO the claim system was
> >>>>> designed to avoid races during domain building, and shouldn't be us=
ed
> >>>>> once the domain is already running.
> >>>>>
> >>>>> Thanks, Roger.
> >>>>
> >>>> As a matter of implementation that's already the case by toolstack b=
eing "nice"
> >>>> and unconditionally clearing claims after populating the physmap.
> >>>
> >>> I see.  Another option would be to refuse the unpause a domain if it
> >>> still has pending claims.  However I don't know how that will work ou=
t
> >>> with all possible toolstacks.
> >>>
> >>>> However, I agree the hypervisor should do it on its own. I didn't fi=
nd a
> >>>> suitable place for it.=20
> >>>
> >>> You could do it in arch_domain_creation_finished().
> >>
> >> Except that better wouldn't be arch-specific.
> >=20
> > Why would it have to be arch-specific though? As far as the hypervisor =
is
> > concerned, it doesn't seem to be.
>
> Together with Roger's earlier clarification on his original remark, I fea=
r
> I don't understand the question: I asked that it not be arch-specific. An=
d
> Roger clarified that he also didn't mean it to be.
>
> Jan

Bah, I misread you (and my IMAP server annoyingly decided enough was enough=
 and
declared Roger's answer was one too many and deferred sending it until much
later).

Too much going on, too little attention. Apologies for the noise.

I'll send a patch at some point with that adjustment.

Cheers,
Alejandro


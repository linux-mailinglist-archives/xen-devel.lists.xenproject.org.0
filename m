Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF276A0556B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 09:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866966.1278357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRU5-0000nS-2H; Wed, 08 Jan 2025 08:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866966.1278357; Wed, 08 Jan 2025 08:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRU4-0000kj-VE; Wed, 08 Jan 2025 08:32:12 +0000
Received: by outflank-mailman (input) for mailman id 866966;
 Wed, 08 Jan 2025 08:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVRU2-0000kd-UZ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 08:32:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bd4336e-cd9b-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 09:32:07 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so1934774366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 00:32:07 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe3c25sm2517249966b.100.2025.01.08.00.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:32:06 -0800 (PST)
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
X-Inumbo-ID: 0bd4336e-cd9b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736325127; x=1736929927; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGsdMyLoUw0ReiCx98Gtl/c+81+r+coYxBC5qalBR/w=;
        b=wWQZYkBisJZQrTWvNVLoJ6GAkwjDcEf0McqptTM/zolB18oUVPjHWqJ5sWOg+TCKII
         Cth2PhCCbd/iUG31YToR8fzx/YbKsuJtFyoeAaEh9E45k6mh09c16uShCorZqY0a/A1M
         YqI9m5Z/CzpPzRIKCUdQCbvBxz85sa9LA+jUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325127; x=1736929927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGsdMyLoUw0ReiCx98Gtl/c+81+r+coYxBC5qalBR/w=;
        b=kFM54+sgokRqSXweJ0o8/JgS5If1cEPp3a2+waEVeXNqpt2Rro8f2GR0EU1mkIoned
         2OED6SdL3/W26xQGDXywt5e9dAfLrtvXYHe8eMEqXjyOEAreBiAo6RBZu8leXiKp2szg
         7o3y1EiC3rBv4cUVkVAFFVvXegnq8/LnJ+A/vhPXw97lKvuCQ4xWTH72aRafOFjvRAZK
         8P34ExqZyf0QvUzhGvFqEH3DowR3oxR6+Q+j4bklPVP9kfjP4QrILZRhkwfd0JNndQCd
         YmqHJdDSW7TGnal3BIwQCUzQJlgCrg7qYWvQvKrLpDS6y9TZMcz08+kUV9PqFjELf/Ye
         wsew==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZPwM6bR0mXXmywsNZVy/DJqGiaCVr4Zy5W+YZrTJxmrM4AnHNjIHFKDyWqodN/5CWx7saskXqiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu1EuN0IZDn7pwlZF2XC5dt0iunJRh9Kux0j4q539mqhm/c7sx
	2xPof7blMAMyktPxkRAqjgMNEq+fx4AAHMaI5JlBGqXMSkKVlYTBa7XsHsKmEk45lttT60qdjF0
	h
X-Gm-Gg: ASbGncu3zgfFtCThiQ+pN+AfcxQaaxNb9pzWky3M0Vq+4c2DUfr3AWdfdN/vfYIrDm4
	xZpBn1LOEwD+I9nl1vnntbVNNlGlfbz9/zV9795pC38JvWF8oIhSMts9lxgvtCCPM3fOOcCeNWH
	iCi9zvyws5Sx2K2TXp8wJixNnjb2D6iWNmHlUgqCu0tmkJ0Xk6s49doYPJ4ITJIzxKQRte5eo+I
	T765SaYPohdCZ66j9JS1BGn4tBw1523ZAo4iD3ICXmBe9lOPwA1Asmp4oR9BAIXIkk=
X-Google-Smtp-Source: AGHT+IGi3myyzeYnlIp6Nw2lTn7guBRhfdzHCVygF+pzhvTYYpCuXzrt+1cb7uPrtVXNpsZpVQdmMg==
X-Received: by 2002:a17:907:2d8f:b0:aaf:8f8e:6bf4 with SMTP id a640c23a62f3a-ab2ab740899mr107934466b.26.1736325126827;
        Wed, 08 Jan 2025 00:32:06 -0800 (PST)
Date: Wed, 8 Jan 2025 09:32:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.20] public/version: soften wording for deprecated
 sub-ops
Message-ID: <Z344BcLEsojN3j2F@macbook.local>
References: <bf8cc342-52aa-44ee-8bce-ce2be6406904@suse.com>
 <0c8a13d0-04d7-4ed6-a8d8-a4423867fa3f@citrix.com>
 <8ca8ac20-a19f-49ef-9631-08cdcef854d2@suse.com>
 <alpine.DEB.2.22.394.2501061229300.133435@ubuntu-linux-20-04-desktop>
 <9f1d070b-c135-454d-8022-12104e048458@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f1d070b-c135-454d-8022-12104e048458@suse.com>

On Tue, Jan 07, 2025 at 09:32:05AM +0100, Jan Beulich wrote:
> On 06.01.2025 23:01, Stefano Stabellini wrote:
> > On Mon, 6 Jan 2025, Jan Beulich wrote:
> >> On 06.01.2025 12:08, Andrew Cooper wrote:
> >>> On 06/01/2025 11:04 am, Jan Beulich wrote:
> >>>> These interfaces were - afaict - originally introduced this way on the
> >>>> firm assumption that the used array sizes would be good virtually
> >>>> forever.  While this assumption turned out to not be true for at least
> >>>> some of them, this still doesn't really render them "broken": They still
> >>>> fit their original purpose, and they are still usable for a fair subset
> >>>> of environments.  Re-word the comments accordingly.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> No.
> >>>
> >>> The community voted and rejected this opinion.
> >>
> >> That's not my recollection of what was voted on, and with the vote results
> >> not being available referring to them is unhelpful anyway.
> >>
> >> My (admittedly vague) recollection is that it was decided to leave enough
> >> room for wording choice by submitters. That would cover your original
> >> patch, and it would equally cover mine.
> > 
> > The community-wide survey indicated that it is acceptable to use the
> > term "broken" in our documentation [1]. While the survey was not tied to
> > a specific instance, it was undoubtedly influenced by the ongoing
> > discussion at the time.
> 
> IOW this re-confirms (to me at least) that the vote in itself was ambiguous.
> I have no issue at all with the use of the word "broken" in documentation or
> code comments, provided this accurately describes the situation. Which it
> doesn't here.

I agree with you, I don't think banning the word "broken" from
documentation or code comments is helpful or desirable.

I think the survey wasn't helpful: if we wanted to solve the issue
around the usage of "broken" in that specific patch series, we have
mechanisms to do so: calling a explicit committers vote on the
specific issue.

A generic survey about whether using "broken" is acceptable or not
doesn't solve the specific issue of whether using "broken" in that
context was accurate or not.

> > If the purpose of this patch is to replace the term "broken", as it
> > would seem from the commit message, I would recommend dropping the patch
> > and leaving the wording as it is, given that the community has expressed
> > approval of its use. Let us respect that decision.
> > 
> > However, if the goal is to improve clarity by specifying "due to its
> > size limitations" and noting that the truncation occurs "silently", then
> > I believe the patch could be reviewed with that objective in mind.
> > 
> > In other words, we should not replace "broken" simply for the sake of
> > doing so. That discussion has already been settled. When reviewing this
> > patch, our focus should be on its other merits, if any.
> > 
> > Based on the above, I would not take the patch in its current form. But
> > if Jan is up for rewording the commit message, and focusing purely on
> > the clarity of the in-code comments maybe a future version could be
> > acceptable.
> 
> Assuming the above doesn't change your view, and assuming no-one else is
> going to express views in favor of the wording change, I'll consider the
> patch rejected. And I'll be once again left with the impression that
> things are treated neither equally nor objectively in situations like this
> one: To get one's perspective through unaltered one only needs to resist
> hard enough to any attempt to find a middle ground. That's not a good
> environment to work in, and not something I'd call a "community".

I don't mind that much whether "broken" or "deprecated" is used, IMO I
find it a matter of taste in this case, and I would leave that to the
author of the patch.

I can however understand your frustration with the original survey and
how the results seem to extend past what the questions asked for.  As
said above, our community has meanings to resolve disputes around
this kind of issues in the governance documents, however a public
anonymous survey is not one of them AFAIK.

Regards, Roger.


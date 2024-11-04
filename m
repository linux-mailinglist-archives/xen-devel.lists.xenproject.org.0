Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60709BB3C4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 12:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829958.1244892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7vX9-00015P-Ac; Mon, 04 Nov 2024 11:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829958.1244892; Mon, 04 Nov 2024 11:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7vX9-000135-6m; Mon, 04 Nov 2024 11:46:11 +0000
Received: by outflank-mailman (input) for mailman id 829958;
 Mon, 04 Nov 2024 11:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OLBd=R7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t7vX7-00012z-Rq
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 11:46:09 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b72941-9aa2-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 12:45:17 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2e2cc47f1d7so2839383a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 03:45:17 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e93dac015bsm7239415a91.26.2024.11.04.03.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 03:45:15 -0800 (PST)
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
X-Inumbo-ID: 42b72941-9aa2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoxMDM0IiwiaGVsbyI6Im1haWwtcGoxLXgxMDM0Lmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjQyYjcyOTQxLTlhYTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzIwNzE3LjkxMDEwOSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730720716; x=1731325516; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SP+Hu4vGRsVX5JNNcHZ7OvN4YMAtu2dWg8yX1cPTfc=;
        b=OL+Y1ogJrfKUcVj3n1Kx8q3iW2Yt/qnkC+lGak3zDxdGW2mqBJQWl3z0xsA+vzXEXA
         IMEcvrzsOnUbNT7WcEn3c0Tuj87clVae7YoEJ6JzYBQS7QXtn1U+a0a79QuUSBZiXjUE
         BFQQ6z8fcJraxW7Wr/xIgeGm+ea8TLr3OE6Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730720716; x=1731325516;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0SP+Hu4vGRsVX5JNNcHZ7OvN4YMAtu2dWg8yX1cPTfc=;
        b=v4+2wa9J8iBhr7n2SyIBqnaDB4EY/ZWvK0FNpAdXiqCeOqcQmuXftZazsRgZdF2P8k
         PwrvAM7h42p4XXrDdJy7+9f/8qd8HZk5a8bx+WoAC+fJRWTYK0YQDkvyfUu50cLnmj/Q
         sMWPqJilwzIVR763N9qqL8Nl3MOabDSK/VJSt8qSIHwhezZ1xdAagfAoG/AGseYambP/
         L0C8+K1WeZi2yGw9Ry/6YlRHwDcNMmnLquw5B2kBbQIkXnHGF+tTdcLSm0OVgKjv8Ys4
         TcsYoBPr6lM9OBzYCA1QOx9B6DuqtztBaC/ByfIw3P3S4pSgNcbUXnCvBkHKgkg7LB+T
         dwDA==
X-Forwarded-Encrypted: i=1; AJvYcCWFyqcopPv+KsA8oiZGdS37WoDs17nOxNukHGJ+LTpQsm5Ca09nclxSDFipqhaekDXq24653QXToD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFQXVRNWS7/5xmeTQtnyUxAl8fSQZTV9SBT01fKuaOin/+L4sR
	QsdRL4L16gUnphQnNDOViikykhGuqknuttc6FMyjTXrJ3TsmCmNTx/lrq/hyDtU=
X-Google-Smtp-Source: AGHT+IHKUN+jmnm1XVq2cKXSAnAqQ6FgtYwLtY932dxsqWlDCGj8JsPFvo77TrO7A2FBAfMfvd0tKQ==
X-Received: by 2002:a17:90b:1dc5:b0:2e2:7f8f:3ad5 with SMTP id 98e67ed59e1d1-2e94bcb6642mr19278316a91.2.1730720715930;
        Mon, 04 Nov 2024 03:45:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 11:45:05 +0000
Message-Id: <D5DDABNKHN42.1HD2T6NV99J51@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Stewart Hildebrand"
 <stewart.hildebrand@amd.com>, "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>
In-Reply-To: <a40185b1-7c1b-4a57-91fb-e439a4c896f0@apertussolutions.com>

On Sat Nov 2, 2024 at 3:18 PM GMT, Daniel P. Smith wrote:
> On 11/1/24 16:16, Stewart Hildebrand wrote:
> > +Daniel (XSM mention)
> >=20
> > On 10/28/24 13:02, Jan Beulich wrote:
> >> On 18.10.2024 22:39, Stewart Hildebrand wrote:
> >>> Add links between a VF's struct pci_dev and its associated PF struct
> >>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to av=
oid
> >>> dropping and re-acquiring the pcidevs_lock().
> >>>
> >>> During PF removal, unlink VF from PF and mark the VF broken. As befor=
e,
> >>> VFs may exist without a corresponding PF, although now only with
> >>> pdev->broken =3D true.
> >>>
> >>> The hardware domain is expected to remove the associated VFs before
> >>> removing the PF. Print a warning in case a PF is removed with associa=
ted
> >>> VFs still present.
> >>>
> >>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>> ---
> >>> Candidate for backport to 4.19 (the next patch depends on this one)
> >>>
> >>> v5->v6:
> >>> * move printk() before ASSERT_UNREACHABLE()
> >>> * warn about PF removal with VFs still present
> >>
> >> Hmm, maybe I didn't make this clear enough when commenting on v5: I wa=
sn't
> >> just after an adjustment to the commit message. I'm instead actively
> >> concerned of the resulting behavior. Question is whether we can reason=
ably
> >> do something about that.
> >>
> >> Jan
> >=20
> > Right. My suggestion then is to go back to roughly how it was done in
> > v4 [0]:
> >=20
> > * Remove the VFs right away during PF removal, so that we don't end up
> > with stale VFs. Regarding XSM, assume that a domain with permission to
> > remove the PF is also allowed to remove the VFs. We should probably als=
o
> > return an error from pci_remove_device in the case of removing the PF
> > with VFs still present (and still perform the removals despite returnin=
g
> > an error). Subsequent attempts by a domain to remove the VFs would
> > return an error (as they have already been removed), but that's expecte=
d
> > since we've taken a stance that PF-then-VF removal order is invalid
> > anyway.
>
> I am not confident this is a safe assumption. It will likely be safe for=
=20
> probably 99% of the implementations. Apologies for not following=20
> closely, and correct me if I am wrong here, but from a resource=20
> perspective each VF can appear to the system as its own unique BDF and=20
> so I am fairly certain it would be possible to uniquely label each VF.=20
> For instance in the SVP architecture, the VF may be labeled to restrict=
=20
> control to a hardware domain within a Guest Virtual Platform while the=20
> PF may be restricted to the Supervisor Virtual Platform. In this=20
> scenario, the Guest would be torn down before the Supervisor so the VF=20
> should get released before the PF. But it's all theoretical, so I have=20
> no real implementation to point at that this could be checked/confirmed.
>
> I am only raising this for awareness and not as an objection. If people=
=20
> want to punt that theoretical use case down the road until someone=20
> actually attempts it, I would not be opposed.

Wouldn't it stand to reason then to act conditionally on the authority of t=
he
caller?

i.e: If the caller has the (XSM-checked) authority to remove _BOTH_ PF and
VFs, remove all. If it doesn't have authority to remove the VFs then early =
exit
with an error, leaving the PF behind as well.

That would do the clean thing in the common case and be consistent with the
security policy even with a conflicting policy. The semantics are somewhat =
more
complex, but trying to remove a PF before removing the VFs is silly and the
only sensible thing (imo) is to help out during cleanup _or_ be strict abou=
t
checking.

>
> v/r,
> dps

Cheers,
Alejandro


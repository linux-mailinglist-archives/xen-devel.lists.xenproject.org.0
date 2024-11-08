Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54899C1D35
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 13:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832539.1247825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OKC-0002JU-Ul; Fri, 08 Nov 2024 12:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832539.1247825; Fri, 08 Nov 2024 12:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OKC-0002Gu-SD; Fri, 08 Nov 2024 12:42:52 +0000
Received: by outflank-mailman (input) for mailman id 832539;
 Fri, 08 Nov 2024 12:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PTb2=SD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t9OKB-0002Go-IS
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 12:42:51 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f56635a2-9dce-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 13:42:48 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-431481433bdso18090305e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 04:42:48 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c26e3sm65019875e9.33.2024.11.08.04.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 04:42:46 -0800 (PST)
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
X-Inumbo-ID: f56635a2-9dce-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY1NjYzNWEyLTlkY2UtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDY5NzY4LjE2MTMyMiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731069767; x=1731674567; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyLyijz4kvYk0zATBMHnZC6WMbqcgsBZuOOHu53zOvk=;
        b=TinyPIxic53y8XQ0fiPSyb2/hZFQRAn7/KlfifH2BqfJBiaNntLg9redSnq6lgdRMe
         bwgTD6mVW5vhQab3xxcepH2dOvWHPFBEi6Pjd29VpVdi9CEa6WmIHu238AYMrSJLk+Ul
         z/vUA4PzlUt+XMU8S00XY2yxxUux3i6GOvFxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069767; x=1731674567;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyLyijz4kvYk0zATBMHnZC6WMbqcgsBZuOOHu53zOvk=;
        b=YPR5M98RBa1QFpzyA7seaFE/Q9TT+2XQ53mh444SD7AArpEmAgEsdE/CEYb/cys6UY
         H0JC8yGoCCoBZAzUfhYm1RBYhWjUMPCLNNZ/tR+HjXdwynNzvkq+tLh7kh3whBEbgahk
         eS50jSteJM0B4T9hgB5DJRzAuq0gINE/6r97vLNNaAtZezFttvkhpTQT+LXimvoVgKC0
         hAUrjys0cCyz+2hPWe5ECgp1jKkGAvTFMnyHar2Snt+TfHgarXhGl00CT6w2IlJXcZdA
         FMoHcokSEcz92WaGHPL1+otdwC458KY95jlRZR1nK9HITOHGsFrlDM6abSAPnoDKU2v+
         gqOw==
X-Forwarded-Encrypted: i=1; AJvYcCWiyk19Gfb5suqm6BCYKpnPEYst9VFi21SQ7FSG5kmQqioKh5A/nrMhdXZOKKOYEn9CsCPWvxCgSdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnFAKKkViw/rjKxI1K/lW/WzbdZBH46SoIyvu2S9vVhRb0DyuN
	TUlaN9coljufIF55IY7aeyNDH46U0weQmqN6KREKHJu6e9+0ERZ3rN5HLBOnQ1g=
X-Google-Smtp-Source: AGHT+IGcOk5f8yWifxTY5xI3/fw/33DMfxWGlVxGcSw+9sljxcL/wIw61crxr+rICZ757NtlLiKwTg==
X-Received: by 2002:a05:600c:5494:b0:42f:8515:e490 with SMTP id 5b1f17b1804b1-432b74fd8e5mr19860665e9.5.1731069767356;
        Fri, 08 Nov 2024 04:42:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Nov 2024 12:42:45 +0000
Message-Id: <D5GT0NR29WEF.216KE5GCTH1TL@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Stewart Hildebrand"
 <stewart.hildebrand@amd.com>
X-Mailer: aerc 0.18.2
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
In-Reply-To: <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>

On Mon Nov 4, 2024 at 7:44 AM GMT, Jan Beulich wrote:
> On 01.11.2024 21:16, Stewart Hildebrand wrote:
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
> Imo going back is not an option.
>
> > While the above is what I prefer, I just want to mention other options =
I
> > considered for the scenario of PF removal with VFs still present:
> >=20
> > * Increase the "scariness" of the warning message added in v6.
> >=20
> > * Return an error from pci_remove_device (while still removing only the
> > PF). We would be left with stale VFs in Xen. At least this would
> > concretely inform dom0 that Xen takes issue with the PF-then-VF removal
> > order. Subsequent attempts by a domain to remove VFs, however
> > (un)likely, would succeed.
>
> Returning an error in such a case is a possibility, but comes with the
> risk of confusion. Seeing such an error, a caller may itself assume the
> device still is there, and retry its (with or without having removed the
> VFs) removal at a later point.
>
> > * Return an error from pci_remove_device and keep the PF and VFs. This
> > is IMO the worst option because then we would have a stale PF in
> > addition to stale VFs.
>
> Yet this would at least be self-consistent, unlike the variant above. No
> matter what, any failure to remove VFs and/or PFs correctly will need to
> result in there being no attempt to physically remove the device.
>
> You didn't enumerate an option lightly mentioned before, perhaps because
> of its anticipated intrusiveness: Re-associate stale VFs with their PF,
> once the PF is re-reported. Problem of course is that, aiui, the VFs
> could in principle re-appear at a different BDF (albeit we have other
> issues with potential bus-renumbering done by Dom0), and their count
> could also change.

Are you enumerating it for completeness or suggesting it should be done?

Maybe I'm missing something here (and please, do tell me what if so), but w=
hy
would this option be desirable at all? What would benefit from such semanti=
cs
(as opposed to any of the others)? It would break the lifetime dependency
between PF and VFs, and that doesn't strike me as a feature. It also turns
kernel bugs into a fine implementations by making promises about how state =
is
persisted, but the consequences of that appear to be too far reaching to kn=
ow
for sure it's 100% ok.

From afar, it sounds like trying to turn a bug into a feature. And that can=
not
always be done sanely. But again, maybe I might very well be missing
something...

>
> Jan
>
> > [0] https://lore.kernel.org/xen-devel/20240827035929.118003-1-stewart.h=
ildebrand@amd.com/T/#t

Cheers,
Alejandro


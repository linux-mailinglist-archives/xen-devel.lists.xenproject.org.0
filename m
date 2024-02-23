Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16299860E77
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684720.1064775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdS7V-0000wB-K4; Fri, 23 Feb 2024 09:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684720.1064775; Fri, 23 Feb 2024 09:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdS7V-0000ti-GU; Fri, 23 Feb 2024 09:45:29 +0000
Received: by outflank-mailman (input) for mailman id 684720;
 Fri, 23 Feb 2024 09:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8H=KA=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rdS7T-0000tc-U5
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:45:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45de15ad-d230-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 10:45:26 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41295fd7847so1288635e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 01:45:26 -0800 (PST)
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
X-Inumbo-ID: 45de15ad-d230-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708681526; x=1709286326; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOX50ZzAMGvnHyaJn2dczFDwxeACzI/aEsvZXuqY8/I=;
        b=Ro8W+HunoMHBlcJoo+c3eRC0yK3iubCGUMCzl3UYbe8TUqQx75hnc7Tg3hdkV4D9Az
         mOo609Q93Tmcm9sFol+MKUJkXNNFSNbuD3v23XrJ5uSVOQ2WqOHWXZ0KkvSPCQlBUCQt
         TLDgVuwYIHDwvhOGVOh/TE/gElHeEUbssALfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708681526; x=1709286326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOX50ZzAMGvnHyaJn2dczFDwxeACzI/aEsvZXuqY8/I=;
        b=P2P4tJrCJh8s3KxDnoWypmRUWrIh+LgVh+jtl4QKx19AiqCYG5AydsrX1b1FyCaTYU
         Ef/3TI147NMETWtiiG+NivLRSe1g5OyK0ipgdPUlXANAuNPYRILXbRQrEPmryFKJ8Fh/
         hyKCfXSPKUM6FHjR3QOjq8eu8B5pSB94f0UupCQ4cVe20MXIzn4BB/JhcvLsM7EYnoCr
         y5lBG6faTa4QptzFcfqK+RdaFwu36DBRdvlXu8C+l87GJadi6oiMGDYVDe9dHLpE8K1y
         vWd/BrCLRvkJiMC+NPPaMpIfhPQNocyHOh2v547zg36+itCFQnJPIL9DMXom7G3rdf7i
         AlCA==
X-Gm-Message-State: AOJu0Yw6uQTrMMjU3cZqXHLINHZMh6wPqMbM2PCZU8PJbx65CTdP2JFa
	/U5k0j9wktynqIb/P4SErWL/SOORAkEpSleskw3aPPqWm2KIPyL1xgtx+mpiOq3oAVt2/7tFlSn
	XdzKxcA9/5pCsLQsZtfHj240MEznFp3tZocat
X-Google-Smtp-Source: AGHT+IFT0ErA0nfP2BE1trHVau5z8enNuPNiK+5R85eWp2AG2dwv6ShEQQV/rFtcTGH53RGHuIC9lkfzqGuTSXDhs/4=
X-Received: by 2002:a05:600c:3acd:b0:411:e7d5:cc5 with SMTP id
 d13-20020a05600c3acd00b00411e7d50cc5mr836680wms.4.1708681526400; Fri, 23 Feb
 2024 01:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20231130142944.46322-1-roger.pau@citrix.com> <20231130142944.46322-2-roger.pau@citrix.com>
In-Reply-To: <20231130142944.46322-2-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Fri, 23 Feb 2024 09:45:15 +0000
Message-ID: <CAG7k0Eq+G7w8M2JFTnikv10SNocfCBGwvbEwz-pbR9v99uStGg@mail.gmail.com>
Subject: Re: [PATCH 1/5] xen/livepatch: register livepatch regions when loaded
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 2:30=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Currently livepatch regions are registered as virtual regions only after =
the
> livepatch has been applied.
>
> This can lead to issues when using the pre-apply or post-revert hooks, as=
 at
> the point the livepatch is not in the virtual regions list.  If a livepat=
ch
> pre-apply hook contains a WARN() it would trigger an hypervisor crash, as=
 the
> code to handle the bug frame won't be able to find the instruction pointe=
r that
> triggered the #UD in any of the registered virtual regions, and hence cra=
sh.
>
> Fix this by adding the livepatch payloads as virtual regions as soon as l=
oaded,
> and only remove them once the payload is unloaded.  This requires some ch=
anges
> to the virtual regions code, as the removal of the virtual regions is no =
longer
> done in stop machine context, and hence an RCU barrier is added in order =
to
> make sure there are no users of the virtual region after it's been remove=
d from
> the list.
>
> Fixes: 8313c864fa95 ('livepatch: Implement pre-|post- apply|revert hooks'=
)
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/common/livepatch.c      |  5 +++--
>  xen/common/virtual_region.c | 40 +++++++++++--------------------------
>  2 files changed, 15 insertions(+), 30 deletions(-)
>
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 1209fea2566c..3199432f11f5 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -942,6 +942,8 @@ static int prepare_payload(struct payload *payload,
>          }
>      }
>
> +    register_virtual_region(region);
> +
>      return 0;
>  }
>

The region is registered in prepare_payload() but if e.g. the build id
check in load_payload_data() fails, it won't unregister the region
since the failure path calls free_payload_data(), not free_payload().
Perhaps the call to register_virtual_region() could be done as the last
thing in load_payload_data()?

Ross


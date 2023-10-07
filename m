Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD067BC887
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 17:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613942.954800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qp8ug-0005Tr-2Q; Sat, 07 Oct 2023 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613942.954800; Sat, 07 Oct 2023 15:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qp8uf-0005SB-Vd; Sat, 07 Oct 2023 15:08:17 +0000
Received: by outflank-mailman (input) for mailman id 613942;
 Sat, 07 Oct 2023 15:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TImy=FV=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qp8ue-0005S5-B7
 for xen-devel@lists.xenproject.org; Sat, 07 Oct 2023 15:08:16 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 564256d0-6523-11ee-98d3-6d05b1d4d9a1;
 Sat, 07 Oct 2023 17:08:14 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53627feca49so5214863a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 07 Oct 2023 08:08:14 -0700 (PDT)
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
X-Inumbo-ID: 564256d0-6523-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696691293; x=1697296093; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBE8Q9h8e8kvIlo6bMpJIW9LEvVr/atUEFEuV64FS+c=;
        b=cP1kZB1rgXpfS4kA8sYAng5aQd1fM/igJwttp2dyJnXx70zX2ax3KVXg9YKIkB7Ypw
         fcxzAGVcU8wzHGAkgW5v7Og4Q8bwlaZD8s3uLLDtINGjd/7Xd8jrWGaXK4CBROQVKWsW
         xQ0SrSxRmZkl2uV6GBwoXZVaoVZmldFx1C+WBTzl+efRAlm5yp/imhmZmRl9vnTLMqXw
         /E34A4WV0x4FLomyvjCVnAi7hAFz0oIz4Tt0lanFurg5JYA3uedgs/cX3zT0N+9bCrLC
         tHPVVUVmYPpM69/El0Qh9TeIoyP8rFRV7wJ9oIe38B7ezEy/UkUz/m9+T1Z3f6Kf7rK/
         LT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696691293; x=1697296093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBE8Q9h8e8kvIlo6bMpJIW9LEvVr/atUEFEuV64FS+c=;
        b=gRBYwSAV/iIFDbybWommEEepDqTrlglCit1RbMkFVZDRdv7zxZHlI7LMSVfITgbT+4
         5tT3TWbPBdgR22sLOELwNlPpREPWnHb5nmEqIrFqJZ5LJMCVD4AYpDsLOrOr8bfahIiK
         53uNzut2FnTqo4e199mqJzZhlLGZTxB3nYaICU8fS2hWgArvVO0u56EEmGn/CbYyThiD
         R1mVqSgJuFgTiyg+3+jpx/E1WKzBVs3t1Js2XD84NnlV6o+u/naKYKxGCXbsfyCJG4qb
         eVFG+tzyP3W6RQZJEXBwQCmgazmT9fO0KT3UK4RC8mFhRVIsVuj1jzjr+oN7UzplZoi4
         +GPg==
X-Gm-Message-State: AOJu0YwQgdZj83n0UmxNfSFfOzp7xmltDXTrF1YQj9fbjsl0vUwYA4r+
	Oqfy5/vN3j41IijL5sgtUOpum6wlo+CxcsHl3H8=
X-Google-Smtp-Source: AGHT+IEo0XYBtGtFUl06LMFfBApocIRihu4UFYOwsRTa6ZSqXDNQndad8B9PTdHcPvwdI+nuO7k/cjWL7Ts6j7NQ9HU=
X-Received: by 2002:aa7:d945:0:b0:523:2e30:aaee with SMTP id
 l5-20020aa7d945000000b005232e30aaeemr9524027eds.32.1696691293437; Sat, 07 Oct
 2023 08:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231006185402.1098400-1-andrew.cooper3@citrix.com> <20231006185402.1098400-3-andrew.cooper3@citrix.com>
In-Reply-To: <20231006185402.1098400-3-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 7 Oct 2023 11:08:01 -0400
Message-ID: <CAKf6xptUPaqMvNM0qGyDO=VjMyNtDM74xksA6kuMDzL-bzBwGg@mail.gmail.com>
Subject: Re: [PATCH for-4.18 v2 2/2] x86: Clarify that only 5 hypercall
 parameters are supported
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
	Henry Wang <Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 6, 2023 at 4:29=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> From: Michal Orzel <michal.orzel@amd.com>
>
> The x86 hypercall ABI really used to have 6-argument hypercalls.  V4V, th=
e
> downstream predecessor to Argo did take 6th args.
>
> However, the 6th arg being %ebp in the 32bit ABI makes it unusable in
> practice, because that's the frame pointer in builds with frame pointers
> enabled.  Therefore Argo was altered to being a 5-arg hypercall when it w=
as
> upstreamed.
>
> c/s 2f531c122e95 ("x86: limit number of hypercall parameters to 5") remov=
ed
> the ability for hypercalls to take 6 arguments.
>
> Update the documentation to match reality.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Henry Wang <Henry.Wang@arm.com>
>
> v2:
>  * Extend with the historical context of how 6-arg hypercalls have come a=
nd gone.
> ---
>  docs/guest-guide/x86/hypercall-abi.rst   | 15 +++++++++++----
>  xen/include/public/arch-x86/xen-x86_32.h |  2 +-
>  xen/include/public/arch-x86/xen-x86_64.h |  2 +-
>  3 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x8=
6/hypercall-abi.rst
> index 42a820386b68..c7a11a76712f 100644
> --- a/docs/guest-guide/x86/hypercall-abi.rst
> +++ b/docs/guest-guide/x86/hypercall-abi.rst

> @@ -119,6 +119,13 @@ means.
>  .. [#kern] For HVM guests, ``HVMOP_guest_request_vm_event`` may be confi=
gured
>     to be usable from userspace, but this behaviour is not default.
>
> +.. [#params] Xen's ABI used to declare support for 6 hypercall arguments=
,
> +   using ``r9`` and ``ebp``.  However, such an ABI clobbers the frame po=
inter
> +   in the 32bit code and does interact nicely with guest-side debugging.=
  The

I think you want s/does/does not/.

With that,

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

> +   predecessor to ``HYPERCALL_argo_op`` was a 6-argument hypercall, but =
the

Also, I think it would be worth just naming v4v with "...predecessor
to ``HYPERCALL_argo_op``, v4v, was...", so a future reader doesn't
have to investigate to find out what the predecessor was.

Regards,
Jason

> +   ABI was intentionally altered when Argo was upstreamed (Xen 4.13) to =
be the
> +   5-argument hypercall it now is.
> +
>  .. [#mode] While it is possible to use compatibility mode segments in a =
64bit
>     kernel, hypercalls issues from such a mode will be interpreted with t=
he
>     32bit ABI.  Such a setup is not expected in production scenarios.


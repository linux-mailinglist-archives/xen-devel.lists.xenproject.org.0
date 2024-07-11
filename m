Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A848F92F09E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 23:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757698.1166810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0xj-0003Ci-3J; Thu, 11 Jul 2024 21:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757698.1166810; Thu, 11 Jul 2024 21:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0xj-0003B9-0T; Thu, 11 Jul 2024 21:04:23 +0000
Received: by outflank-mailman (input) for mailman id 757698;
 Thu, 11 Jul 2024 21:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sS0xh-0003B3-R4
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 21:04:21 +0000
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23a83ad8-3fc9-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 23:04:19 +0200 (CEST)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-25e00f348e6so658858fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 14:04:20 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f1901205dsm329695485a.41.2024.07.11.14.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 14:04:17 -0700 (PDT)
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
X-Inumbo-ID: 23a83ad8-3fc9-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720731858; x=1721336658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gU0df6mNrHCUJWxGX0EhXUOYxbhby0bahL/FbBxTbSA=;
        b=GoZOt2kjioAFk09cNcsjij8bCEAxnYkfUKsEjtckzKdcoaUjDqkc7pcr8TjVMA1P0+
         8/5LmZ7mkSZREAU+BWw40PbvAjmKeTvJiH7TyH2lSGLLJ0dTr4gsXAdLQXmKA3Pck0bV
         aZRR5xr9TIukbUx/e3fntuh4/vkOYxf581DEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720731858; x=1721336658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gU0df6mNrHCUJWxGX0EhXUOYxbhby0bahL/FbBxTbSA=;
        b=Mnly4mqFqGvDpJbpd5kO6IHbj7VFKHdCl8SxO9aHmAPt8JjUrJKJoeAADIkSkaSKvZ
         iqgEXXvfbm9GXt/maeXFx37u9mEG2S73m30dlUCuBpMAlrniIpwdn3GM2SmS+PJMmJ5H
         cW4E7qkHAehKfcPhlhjgJfqF7Ez5vW5827FukZJXAocOHLAtObI7rBamkyqCBSo5NWUA
         B+3aXlsR7drjquCNO8XORHRKY77mxDgvmmxN8E6+BjQiIl1zmVD8TCDJAbm1wc2z3Irj
         pecH59EtOwZG/Ll/2pA2unL3ww3NbMsuFWJC9hP57c8YfKlky7H9nx+tJ3j+0N76ZsV0
         9xPA==
X-Gm-Message-State: AOJu0Yxgxh4ZwueQaC6Ry4RYDHFyaMqFHS1IRo2wgomHzbtpbesK28jm
	cBIHWqeuAGHWDyewMJq5MF9KRYKWCoabCRkdP4S3M0dveCIdlL8B3+xZbJb6SinvfaFYxdw1Qkg
	8
X-Google-Smtp-Source: AGHT+IEedB8VeDBhnpfun127Dw26EZWUtXhu1zJmQbaoe2V/Z1pfW5muPAMIMzWNWtHwwX1Mns6xCg==
X-Received: by 2002:a05:6870:288e:b0:25e:1e11:aa4b with SMTP id 586e51a60fabf-25eaec16b2dmr8856007fac.46.1720731858279;
        Thu, 11 Jul 2024 14:04:18 -0700 (PDT)
Message-ID: <f94c6793-a3d8-4430-abc6-d75cfe07058d@citrix.com>
Date: Thu, 11 Jul 2024 22:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/12] CI: Refresh OpenSUSE Tumbleweed container
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Olaf Hering <olaf@aepfle.de>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240711202337.3128473-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240711202337.3128473-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 9:23 pm, Andrew Cooper wrote:
> Existing as suse:opensuse-tumbleweed is a historical quirk, and adjusted for
> consistency with all the other containers.
>
> Make it non-root, use heredocs for legibility, and use the zypper long names
> for the benefit of those wondering what was being referenced or duplicated.
>
> Trim the dependencies substantially.  Testing docs isn't very interesting and
> saves a lot of space (pandoc pulls in all of Haskel).  Other savings come from
> removing a huge pile of optional QEMU dependencies (QEMU just needs to build
> the Xen parts to be useful here, not have a full GUI environment).
>
> Finally, there where some packages such as bc, libssh2-devel, libtasn1-devel
> and nasm that I'm not aware of any reason to have had, even historically.
>
> This shaves 1G off the size of the container:
>
>   registry.gitlab.com/xen-project/xen/opensuse  tumbleweed-x86_64      1.39GB
>   registry.gitlab.com/xen-project/xen/suse      opensuse-tumbleweed    2.35GB
>
> Furthermore, identify which components of the build use which dependencies,
> which will help managing them in the future.
>
> Thanks to Olaf Hering for dependency fixes that have been subsumed into this
> total overhaul.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Olaf Hering <olaf@aepfle.de>
>
> This includes both of Olaf's recent changes, python3-packaging (now required
> for a rebuilt container), and findutils (not required yet; still gets pulled
> in transitively), but added for good measure.
>
> In terms of package delta, newly included are:
>
>   findutils            # As suggested
>   ocaml-findlib        # Replaces ocaml-findlib-devel
>   perl                 # Transitive previously
>   python3              # Transitive previously
>   python3-packaging    # As suggested
>
> while removed are:
>
>   bc                   # ?
>   cmake                # vtpm stubdom, optional
>   discount             # docs
>   ghostscript          # docs
>   glibc-devel          # Not really optional, given a toolchain
>   hostname             # Optional, not interesting
>   libaio-devel         # Xen < 4.13, perhaps Qemu still but optional
>   libext2fs-devel      # Libfsimage, off by default, optional
>   libgnutls-devel      # Qemu ?
>   libjpeg62-devel      # Qemu ?
>   libnl3-devel         # Libxl COLO(?), option
>   libnuma-devel        # ?
>   libpng16-devel       # Qemu ?
>   libssh2-devel        # ?
>   libtasn1-devel       # ?
>   nasm                 # ?
>   ocaml-findlib-devel  # Swapped for non-devel
>   ocaml-ocamlbuild     # ?
>   ocaml-ocamldoc       # ?
>   pandoc               # docs
>   'pkgconfig(libpci)'  # Qemu
>   'pkgconfig(sdl)'     # Qemu
>   'pkgconfig(sdl2)'    # Qemu
>   systemd-devel        # Xen < 4.19, optional
>   transfig             # docs
>   valgrind-devel       # really only for developers
>   which                # Xen < 4.17
>
> I've tested this on staging-4.17 and staging, both of which build fine.
> staging-4.16 does not, because of SeaBIOS which we've decided not to fix,
> hence it's safe to drop `which`.

For good measure, runs with this container:

  4.17: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7322567620
  4.19: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7322493465

and the expected failure:

  4.16: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7322499885

~Andrew


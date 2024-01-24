Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47EC83A6B0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 11:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670878.1043959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaPh-0000nr-Ed; Wed, 24 Jan 2024 10:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670878.1043959; Wed, 24 Jan 2024 10:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaPh-0000lx-Bk; Wed, 24 Jan 2024 10:23:21 +0000
Received: by outflank-mailman (input) for mailman id 670878;
 Wed, 24 Jan 2024 10:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3b7Y=JC=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rSaPf-0000lp-Ig
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 10:23:19 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 979a3c2d-baa2-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 11:23:18 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cf2a381b86so2801231fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 02:23:18 -0800 (PST)
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
X-Inumbo-ID: 979a3c2d-baa2-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706091798; x=1706696598; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/R2PbYdjMJQy9yYJWmrpzNFr0xsjltHxJHwJoARcmo=;
        b=GkWE8GQ+FxNvAHaqZvsuh+E/cWwZTOoIC2KrWMO78fjlpKZaF7gv2pIZagsqLVr5RB
         IwBAkp0CtkXPI9YV9n7zHS2DvOI+dpQgohgfF+GnDd5GeLhh1rK0IrzpDygwbRDp+QSM
         njxuEw4HdH2FeVP4XaQYZSuxDb1udv3LhNBlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091798; x=1706696598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/R2PbYdjMJQy9yYJWmrpzNFr0xsjltHxJHwJoARcmo=;
        b=czXzT255xUn5XXNfYMq4qiIiuhe1rdTBRcUwR8hu0ecY6scelUG1NM1qRzSRWkEz7O
         qqMek3DR0sMqtDS4kEd+MyRayItSprhQbMaV6AIghW5mSP6JbIdWfhkHcYjROktG5ad+
         nx6G1fMgVagMWVK/piuunJMs2XXFpgSzRWklgpOJoQYTNkj3bdH3z4+uHNOgJKuCbZzr
         /hGn8ESMlYilLnPftUacUwy0ea/3dxHKStvbTrP01ebnSpn4nBRGf/6VnVVuw1NYtlxD
         etcCJgitugPqsjx766wgi+6X1pjDG6EtVwF4r5COLk0fTWU+QdlVzPuFsZ4DaM9NL/Mk
         l3gA==
X-Gm-Message-State: AOJu0YwZKdKOYaZ4aK7Uc2VRisCFagWEUQDEstFa0abnsM9216HS1mpz
	rS+HNDrf+qeglzXP+LF8evjduoxIvu9EH/YJp9byvxnTov0TeaEH5kpQEgjUVSGc6sU4zeP9ktm
	zmzZq0mGRppsj744qfkJZMQNsRZjKVof0Glg8ew==
X-Google-Smtp-Source: AGHT+IEXgvPp0kb4+oJYDfSMtGl+Y5OXT30CLfTVOxX6dPf0xK8C+xV3gR+6CwQbikNrk3ArDCrJlCyuKar8AW6YCkA=
X-Received: by 2002:a05:651c:2d9:b0:2cf:81d:3abf with SMTP id
 f25-20020a05651c02d900b002cf081d3abfmr589072ljo.50.1706091798208; Wed, 24 Jan
 2024 02:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20240124083742.24324-1-roger.pau@citrix.com>
In-Reply-To: <20240124083742.24324-1-roger.pau@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 24 Jan 2024 10:23:07 +0000
Message-ID: <CA+zSX=b=nU0TtY_ejC7fyBMVz99zcqPZxDyZ9=Pw23xwMR8sXg@mail.gmail.com>
Subject: Re: [PATCH] x86/p2m-pt: fix off by one in entry check assert
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 8:45=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> The MMIO RO rangeset overlap check is bogus: the rangeset is inclusive so=
 the
> passed end mfn should be the last mfn to be mapped (not last + 1).
>
> Fixes: 6fa1755644d0 ('amd/npt/shadow: replace assert that prevents creati=
ng 2M/1G MMIO entries')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>


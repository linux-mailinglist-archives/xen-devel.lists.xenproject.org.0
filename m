Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3F90C4B3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742772.1149630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTrs-0003Ei-Ay; Tue, 18 Jun 2024 08:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742772.1149630; Tue, 18 Jun 2024 08:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTrs-0003CO-7l; Tue, 18 Jun 2024 08:07:04 +0000
Received: by outflank-mailman (input) for mailman id 742772;
 Tue, 18 Jun 2024 08:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyK7=NU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sJTrr-0003CI-7V
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:07:03 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be6c9d74-2d49-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 10:07:02 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52c84a21c62so5735482e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:07:02 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2872427sm1455326e87.166.2024.06.18.01.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:07:01 -0700 (PDT)
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
X-Inumbo-ID: be6c9d74-2d49-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718698022; x=1719302822; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oOp5IY/ju+wrRhPM+rZbHzXF+t0glHzY2TCapP0EYd0=;
        b=NMVjI3htE6xakQ8N4PiOLC0ZVo9qOqe68aHPihL+ytr+aSVlHupY6nj2nTdUEvHre+
         Z/9VUyrElOCmH6O3LdCOSWDcwF9tkzlw+jN9N75Y4xPtnKh5nMbosnSGvRC7dgNGDlCx
         NLGDcepwIjZUb4A0WJaeZ5Aes8/fPQL57KJTJHPJQWRQiPorOpk4DCBfcG6eqLTO1/wo
         TdSzIdD3lxzucrEX7bxW4RhziDrNrn6QtAeRWPnfpr/0RnVKfrgdpVcm541LOU2T0Xto
         v0N+qzvuR9SmZwt1cd8UVKGKqWX645hoh/+7LGQ5XrXs4FDP23yhwQvrgH7bCBXPJLdo
         BSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718698022; x=1719302822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOp5IY/ju+wrRhPM+rZbHzXF+t0glHzY2TCapP0EYd0=;
        b=fGgjXvXLHyPuMkN8Pq7AuEUcGTxASbuoVQ/e+JnkSILUHV3VmGJXPNSctb6EannQ/j
         DwmNh+yw2tF22Pdp3geaULUhkgFnE9us+9rXQWEh/BmVSc4QTUabxKQiBft1Q7y9+Kxc
         TYxiN/ilTqbT5VlYDhYFaQuE1TxgyPUEuJZAT4VcVOTGbb6pitJsAa2+q7HKCh8j4I3N
         guF9DrdG8mdocseaGoy12nRZwSOU8iS7ZVwRK37DwxlhPOsQFtOFzyTnsAPgxPNl5joH
         q4HY7jqEC6zrRoA0zUGb+k5qk/DPnTBrnDSzyQCVOV/yu6K4RH7KSM8/bVUKhlDTXX0+
         IM/w==
X-Forwarded-Encrypted: i=1; AJvYcCWp45drqBhHFuYRXfnTkD1PrLAE5cj5MRnsu3Y67qT1tHsMVMjWch2E5X9hZtxlgP+3jaXXnKvuFo0j24wl36Nb0W0ZAOXa//64a+wY9HI=
X-Gm-Message-State: AOJu0Yx14c7EhD/R1ODQfl7jECO47dpjAc6oO8YEEdIwOMexyk21awUZ
	8EVcoWfiuZ6ft6HJYc7ndadkxdkSQw3JWYgyEKF2Ebq/rDT18S/u
X-Google-Smtp-Source: AGHT+IH/TP0USun3+K1F68eFUQQzP0Z90ED5Ie2Ct3NEpL6pLlhspG8/ky7hgw78zYqAw4DTGYF0iA==
X-Received: by 2002:a05:6512:2348:b0:52b:bf9c:7e28 with SMTP id 2adb3069b0e04-52ca6e56012mr10412188e87.14.1718698021480;
        Tue, 18 Jun 2024 01:07:01 -0700 (PDT)
Message-ID: <69eb7670c15d31cad3d9cac919a69a5e85f04ce0.camel@gmail.com>
Subject: Re: [PATCH] xen/ubsan: Fix UB in type_descriptor declaration
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
Date: Tue, 18 Jun 2024 10:07:00 +0200
In-Reply-To: <20240617175521.1766698-1-andrew.cooper3@citrix.com>
References: <20240617175521.1766698-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-06-17 at 18:55 +0100, Andrew Cooper wrote:
> struct type_descriptor is arranged with a NUL terminated string
Should it be NULL instead of NUL?

> following the
> kind/info fields.
>=20
> The only reason this doesn't trip UBSAN detection itself (on more
> modern
> compilers at least) is because struct type_descriptor is only
> referenced in
> suppressed regions.
>=20
> Switch the declaration to be a real flexible member.=C2=A0 No functional
> change.
>=20
> Fixes: 00fcf4dd8eb4 ("xen/ubsan: Import ubsan implementation from
> Linux 4.13")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> For 4.19, and for backport to all reasonable versions.=C2=A0 This bug
> deserves some
> kind of irony award.
> ---
> =C2=A0xen/common/ubsan/ubsan.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/ubsan/ubsan.h b/xen/common/ubsan/ubsan.h
> index a3159040fefb..3db42e75b138 100644
> --- a/xen/common/ubsan/ubsan.h
> +++ b/xen/common/ubsan/ubsan.h
> @@ -10,7 +10,7 @@ enum {
> =C2=A0struct type_descriptor {
> =C2=A0	u16 type_kind;
> =C2=A0	u16 type_info;
> -	char type_name[1];
> +	char type_name[];
> =C2=A0};
> =C2=A0
> =C2=A0struct source_location {
>=20
> base-commit: 8b4243a9b560c89bb259db5a27832c253d4bebc7



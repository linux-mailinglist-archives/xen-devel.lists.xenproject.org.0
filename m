Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED9E6C1D2E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 18:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512024.791592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIwr-0007XG-Dk; Mon, 20 Mar 2023 17:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512024.791592; Mon, 20 Mar 2023 17:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIwr-0007Uf-AR; Mon, 20 Mar 2023 17:05:29 +0000
Received: by outflank-mailman (input) for mailman id 512024;
 Mon, 20 Mar 2023 17:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkzI=7M=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1peIwp-0007UX-L7
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 17:05:27 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6869fdf8-c741-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 18:05:25 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id ek18so49515167edb.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 10:05:25 -0700 (PDT)
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
X-Inumbo-ID: 6869fdf8-c741-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679331925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1RlGWtFAWXAkW6KnPCPP7mmudBI6zSj2ZOHsatP0z8=;
        b=BT5l/2kD8nPb6T2bXDqn+MTrYRkHb1A3ivn7H3rmmTMa81OLt8JyP3KHdrr4QP0Jvx
         BZV+Mgk3DAXzBfaOcmJRsMtzNBMmXME1ZCrZ9aqvgGzMbFeD3nqWOo6hEZJmQUY1dq8Y
         22eG20cPLShTJFMYkEGGiZLIHlI6gu4imG0bC3X4n6/kdiGIJztCplTUVsXoRFKEXPir
         SPpXHgaVXH1lXW9pAOrlyZ+SaeRhIC7YH++uiYc3potPLbgxLnk8CYo31iICjK4b3oSG
         FMRKm4LbcU0P2PK+4ukIqCDZm8pEJjJka1KsW3N4rSg86We+uxIC4nHKSluqVjX1YcID
         nUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679331925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1RlGWtFAWXAkW6KnPCPP7mmudBI6zSj2ZOHsatP0z8=;
        b=lgW2yDwpFkH8eZ08+i63jLGJd4Td/U3Z4AfMqx0fIpzUgLf5Rimejkb5kO5cX4lz5h
         BRLRh9qDUdtytI6ajP3J438fkSsKcf4KYKzoCw0lA8Mm3SAhSPMkbvUsoqC4EhSVIkeK
         U8mA5H/r4YwZSey+24e2EmAtAz4Eq6+UmhHh+FxdI3RYiKQmQR8uWZtXPGp5l5Zkqb5y
         QxAsWIB2Orsmj9N7t7I9PORUch5pwBGkiUJqkidvPWy4izY5tjOCkSwygSwxQ0Iy53a6
         WXpgsB4cc2RLTut0jw4so3t+6SAL6e4z7o/9rlO0U2Dv1fDAJXQezp5VRZV44i0tVIiU
         dE2w==
X-Gm-Message-State: AO0yUKUGIYZCNXUI+OMHzZFIpGyGV1aUpmu9D1BMf4tAxTy6sgTcSuIK
	1+x3KOevfoRgeUP185hWjhOXC7JWI9Innj4cOI0=
X-Google-Smtp-Source: AK7set84f6EtMlpoLBbvzGlls+jGWah5pOyTn54gXmZkhegUw191EFYoaFGZ0uk9mVGpWymPFJRnapggYD3z2q9zvxY=
X-Received: by 2002:a50:9fad:0:b0:4ad:7439:cec7 with SMTP id
 c42-20020a509fad000000b004ad7439cec7mr121561edf.7.1679331925296; Mon, 20 Mar
 2023 10:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230317111546.18061-1-jgross@suse.com> <20230317111546.18061-2-jgross@suse.com>
In-Reply-To: <20230317111546.18061-2-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Mar 2023 13:05:13 -0400
Message-ID: <CAKf6xpsV1Xq0PiK_iqBDV0fpvkA0K6E-cbFXvhS3grjiuAkMGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools/xl: allow split_string_into_pair() to trim values
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 7:16=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Most use cases of split_string_into_pair() are requiring the returned
> strings to be white space trimmed.
>
> In order to avoid the same code pattern multiple times, add a predicate
> parameter to split_string_into_pair() which can be specified to call
> trim() with that predicate for the string pair returned. Specifying
> NULL for the predicate will avoid the call of trim().
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E13859B86
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 06:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682670.1061761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbvsP-0007ew-E7; Mon, 19 Feb 2024 05:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682670.1061761; Mon, 19 Feb 2024 05:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbvsP-0007c6-BN; Mon, 19 Feb 2024 05:07:37 +0000
Received: by outflank-mailman (input) for mailman id 682670;
 Mon, 19 Feb 2024 05:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfqo=J4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rbvsO-0007bx-LZ
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 05:07:36 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c913ff20-cee4-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 06:07:31 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d22fa5c822so14889271fa.2
 for <xen-devel@lists.xenproject.org>; Sun, 18 Feb 2024 21:07:31 -0800 (PST)
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
X-Inumbo-ID: c913ff20-cee4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708319251; x=1708924051; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0sVHfEE5Vx1DRn/FiL+e0VQQd5HXq7/o3UibCZsaxg=;
        b=L1/DHDHCZdq0YXy1WwCe/3o92xBX9+/u2Y+9LtoIiK69+JOTJuv8c4SB6W52XFN09a
         uOHZ4lUC4egF2t0RZStUCUlvv8FjqJ38CffOo/2j4yiZ7nKhYBCAy4KXzD39WaKB5CkP
         I6WCX1Fs71T3kst3LLZU2uaZXp4uP+4alpaCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708319251; x=1708924051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0sVHfEE5Vx1DRn/FiL+e0VQQd5HXq7/o3UibCZsaxg=;
        b=n5jRgiMLAoqOvCQKhNoV6nwxA+3CPDZrAHmKlgddhmk9zv7SV7nZMyyJeeCeD9D5SP
         j0r5wka6jtyEp2vhVyibbkfTp7l8CRWJAgMUzSn5vbt2ChimODco5iMHf6Rpl1v5L4Ky
         0wAT30DvqviX+NRty288+20p9zeCNMS2pQXUNl+dPnw+86k0tAD9DZMO1zsgb9XaPR7O
         aay0Wl5JD8RH9xKsuHCWPHOQ1HER5F6o9iOrcIuUjDOlmMejm6/KSLDGre3xZGkonmbi
         0U/x+QulvlvHbif4ERW4LNLaK+1xnmR3xuqrKAy12r0Yr8sisfaUyNwC0vurlhcHfmCZ
         VBLw==
X-Gm-Message-State: AOJu0Yyaib/O+hf0M8pfeonY+OrfV+lMZw9RYRdcUY+K71vYPcATWVS1
	4KSObssn1HlKqX5aAsEHys/ugtmzsaaOABR18xqkLijl1zuPd7mo8zQxIOnQ8vQc4g5g0Dejr9t
	5bgTA9DKUuMXeqBwAAKfJYZ2gPLxz6c+JIuecag==
X-Google-Smtp-Source: AGHT+IHlH13+kJvSsOetVen/CjY86nBXV4/cJdqxKMy9qYqB0ZAKy9j6FpxUGEMBfHiAjTSG6KBrVyuX9jyF0VUQ43I=
X-Received: by 2002:a2e:9012:0:b0:2d2:3c1a:a41b with SMTP id
 h18-20020a2e9012000000b002d23c1aa41bmr938865ljg.21.1708319251240; Sun, 18 Feb
 2024 21:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20240214103741.16189-1-roger.pau@citrix.com> <20240214103741.16189-6-roger.pau@citrix.com>
In-Reply-To: <20240214103741.16189-6-roger.pau@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 19 Feb 2024 13:07:20 +0800
Message-ID: <CA+zSX=ZZBFnsnc+wtrcB3vC3dMHQS=ZG8zjUdiPeCdFZJ12E4w@mail.gmail.com>
Subject: Re: [PATCH 5/5] mm: add the __must_check attribute to {gfn,mfn}_add()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 7:42=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> It's not obvious from the function itself whether the incremented value w=
ill be
> stored in the parameter, or returned to the caller.  That has leads to bu=
gs in
> the past as callers assume the incremented value is stored in the paramet=
er.
>
> Add the __must_check attribute to the function to easily spot callers tha=
t
> don't consume the returned value, which signals an error in the caller lo=
gic.
>
> No functional change intended.

Just thinking out loud here... I wonder if "mfn_plus()" would be less
likely to be misunderstood.  Catching this during compile is def
better than catching it w/ Coverity or Eclair, but even better to help
people not make the mistake in the first place.

 -George


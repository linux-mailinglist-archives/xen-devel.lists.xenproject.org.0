Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71997562C3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564501.881960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNNY-00073p-KY; Mon, 17 Jul 2023 12:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564501.881960; Mon, 17 Jul 2023 12:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNNY-00070f-HW; Mon, 17 Jul 2023 12:31:04 +0000
Received: by outflank-mailman (input) for mailman id 564501;
 Mon, 17 Jul 2023 12:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNI8=DD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qLNNX-00070Z-Hr
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:31:03 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab87ca8-249d-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 14:31:02 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51e5da802afso6372510a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 05:31:02 -0700 (PDT)
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
X-Inumbo-ID: cab87ca8-249d-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689597062; x=1692189062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qR1QziKbFpEjM+LGQZgiDvw+B/UR2SRtOhz1++3Ej6w=;
        b=fzkKF8TWGTmxtEjEiy5DrtKHON5Lcz2ZwHOJK2rahBTIDCE+jm8iZ//xFNKolAa01Z
         yxkJLUpwXQEC+smz8sHruWUczhUGM89MC/K5HaTogE9LoUTZuL+QNMFHqlGLtfyNLG7v
         22qsTe6vL7VjCdU/+s+R3gGCO+nZD6t8dZkKh2xWLaTOL/aMm3SrYlshWLp0y+aUlXMd
         h8nmVp3GmNMUcNJZf5TF63i/jwzsUQ3fnZIiinqU1/iuSXq/0tAE7IfPtTZYtZbtZ7mY
         in7wsqPE1/Qg1iwVyXmR1MnKUIfQlW5jSg/rigIUXRBo9MxPEBSLLOKCH3I4mNRYD9kh
         62Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689597062; x=1692189062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qR1QziKbFpEjM+LGQZgiDvw+B/UR2SRtOhz1++3Ej6w=;
        b=CcefBDWPI7ZEannsOdvPbcbua0JYMwRzkdGb7lY1xz3jfCi+m+rtm800/ZBJCrxU6A
         jDDCtjSTZE50gyOdeBRspeSxMVXZ+W6WrjANaBJkf/AEC5l/lCZFP+NsNzhsM88p5jXh
         /ALqKkv7t34wRxJHcdV3MVZpMc3Yw8jEO0zYK5EIv3FB03xzxPpyTWuP+U4fT5jjo3eV
         sOlkpz7dWuwu47cDVp4XwWSyZSl8nCrsv20aOoaCa9scevV0Tu8dJITJNOFH5IqZuUAt
         YAIFqGz6ZslGZzIB6AMftKaeyp0TsqNairh59dvxVb/QnBWLRQaHuT9WcOXxIr9Z8oPp
         NSFA==
X-Gm-Message-State: ABy/qLbFOYuYGUwEgVJo6dMZb8VbQRGEWzGu/EP782Maef3ZOg3JlHBU
	5wSDj3WFSbdvVqKPXLicFmLDBH28AIpBVjNGG0Q=
X-Google-Smtp-Source: APBJJlEYKk1kRRIw21N0g98D8UDcIeb42QmbZjlZEdIyhh71z8HOttLhmJwix2yBf1zRsFnvzvVoBPR+/bEovTKalCI=
X-Received: by 2002:a50:ed8e:0:b0:51d:d280:6c51 with SMTP id
 h14-20020a50ed8e000000b0051dd2806c51mr12440673edr.1.1689597061973; Mon, 17
 Jul 2023 05:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com> <3e1cea22-dde5-c723-5ebb-78a54b128b56@suse.com>
In-Reply-To: <3e1cea22-dde5-c723-5ebb-78a54b128b56@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 17 Jul 2023 08:30:50 -0400
Message-ID: <CAKf6xpsuQV_FEhH-Ni5S4LL=Zg1QE8zCSWGOR6iV_tmYhVq6Ng@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86: use POPCNT for hweight<N>() when available
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 8:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> This is faster than using the software implementation, and the insn is
> available on all half-way recent hardware. Use the respective compiler
> builtins when available.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


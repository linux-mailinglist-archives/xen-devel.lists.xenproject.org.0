Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8118814FC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696015.1086512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyGV-0002rL-9m; Wed, 20 Mar 2024 15:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696015.1086512; Wed, 20 Mar 2024 15:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyGV-0002or-70; Wed, 20 Mar 2024 15:54:07 +0000
Received: by outflank-mailman (input) for mailman id 696015;
 Wed, 20 Mar 2024 15:54:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmyGU-0002oj-9Q
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:54:06 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13ca720a-e6d2-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:54:05 +0100 (CET)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2226572ccf8so24984fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:54:05 -0700 (PDT)
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
X-Inumbo-ID: 13ca720a-e6d2-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710950044; x=1711554844; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TOHykfAL/kCC4j6Vw3RqkGAKOe4wbMBdK3lIMcedhk=;
        b=cR5TSg2BhUIefxSCoDHJJfDtLFdN9MaJR4kdALTyvWI3Dw+DUIU8IZYFDEWORp3Qc0
         rmg2wcbZTr/8S6FZojSwyXSdz+FenY9o4TJ4okoHigFjkB70+PGgJid0Dkc/Yus5ccJC
         Vgqbkl6QKyj39LBKa5KHdvlIz93uL3F4oTfDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950044; x=1711554844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TOHykfAL/kCC4j6Vw3RqkGAKOe4wbMBdK3lIMcedhk=;
        b=ENyFQAVsQvysbxPoMIR3s7fj6C6EhuWQ0gEuNOpCMtOSfgGzPpMPI6FhET3BiuVACg
         /s9VX7m5irE8Eu5FvTvntWxbixvMUvXwsBWeXLcmi/xKuto5AoxBpdfwySvldqnLKyb/
         2theaWHVjPWtIsp6GfiSNCzf0KCyRKXDSnTX6NNA4VQcOY7r45dJFUbCVOsIj1mpzEJg
         B93ZzylFzMv/Z1EMaGdEvVq9FAH1td48bPqp5FNGsv9iUKLWSxdDl4dZI+lYLzoe0h9+
         1NxLAYof4mwTIjCab2+ttZ9oHhLJkqZHHNX4Ge+HOhnZ1ANsR7daW/5iE5Flb+AzcnZr
         4nYw==
X-Gm-Message-State: AOJu0Yw3SRGvYw1SOR+DuH7Ptc/eBmMNXyzb03QD2Fqx5PjZiVqsMM3D
	6ZYXjlzZ/3KKU+Xf5JpjfrxhIq+43+Zb37KWq2e5jmIdGMZY29UZYO6x2Pd00+0zK9Sp8f+Ia9o
	S0lcx6g+f/K1j/BZeD8mlv2LfFXuMrpzuRN68XQ==
X-Google-Smtp-Source: AGHT+IH0rISwZnZCZYe3jx2QhDSWzlax3ZWiXd4wDHoevctWA4aa4rgpNhfz/BGZleLvBihStS32mzOFTtcsR/YdrEQ=
X-Received: by 2002:a05:6871:33a8:b0:222:1353:ad0f with SMTP id
 ng40-20020a05687133a800b002221353ad0fmr22360821oac.24.1710950043940; Wed, 20
 Mar 2024 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com> <20240318163552.3808695-7-andrew.cooper3@citrix.com>
In-Reply-To: <20240318163552.3808695-7-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 15:53:52 +0000
Message-ID: <CA+zSX=a_fwkOpMA2UmZkYAG8wwJL8+uabxF5FZFXC5uKn3fs9A@mail.gmail.com>
Subject: Re: [PATCH 6/7] xen/trace: Update final {__,}trace_var() users to the
 new API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> This logically drops the cycles parameter, as it's now encoded directly i=
n the
> event code.

So to make Jan's comment more specific, what about something like this:

This primarily consists of converting the cycles parameter into the
appropriate function: 0 -> trace(), 1 -> trace_time().

> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>


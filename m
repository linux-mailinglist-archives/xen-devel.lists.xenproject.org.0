Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D410B9876F6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 17:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805670.1216828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqn5-0001RW-RS; Thu, 26 Sep 2024 15:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805670.1216828; Thu, 26 Sep 2024 15:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqn5-0001Oc-Nz; Thu, 26 Sep 2024 15:52:27 +0000
Received: by outflank-mailman (input) for mailman id 805670;
 Thu, 26 Sep 2024 15:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=roLj=QY=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1stqn4-0001OW-4E
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 15:52:26 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52928dc8-7c1f-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 17:52:25 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2e075ceebdaso869438a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 08:52:25 -0700 (PDT)
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
X-Inumbo-ID: 52928dc8-7c1f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727365943; x=1727970743; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPnhosLSOiWYkxjONlv7kIFz0MvJ+6+Pm8ohvqXvTlM=;
        b=W2j799FO1uqCCx1Vf+suZB6W5X/g2RPFjghbOm+APtO49DTIISY2IIjjr4a8Nqe92H
         7cqs/EdAVF1t2ypUgqhrUvJWeaL7pJ1w2VoXd26FYHGJUpVr7ke4xrmi1tUMUGGNTkuI
         WtuByA/Gl1UbEMJJ4uSiHsVCqUwQ9HoCXq7GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365943; x=1727970743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPnhosLSOiWYkxjONlv7kIFz0MvJ+6+Pm8ohvqXvTlM=;
        b=iEqxMtT3Uma9jA78n+K/uiCVURWBPzbQMpCWEIz3FE+bv3KmQzif4M2qbnwSHEvOiU
         yRgMFl2ZlXnkJxTctOJbIiHCL7fo6WkSGBT5doeSWA4hf1a74m7LUpR9TbpU6lzMTBt/
         RlNMead2qGvlSMg3s8JsjQVlxYJDOUnLC2DnNkm9eiOjHQFx4D/85hnkGjSJ7eHh9GAn
         mP9Ri1AIH/oJVLkhKUQVGWp7ixGiDBai9sP9O8zM4Av3aI3Eq2/ZUMPM9Bfv/rraZOEl
         CcXFJwMkwrdR7JWZ0dOsfRE5r1jNxAbUv48dNAM7cCgmHt3FYKTqk3wQQI4qF++wcGUg
         tsZg==
X-Gm-Message-State: AOJu0YwwFZsxPGdkE9zML7aRnrQjwHG4qgFwdikkKjvddE8aGYmbeBxL
	xvfN4aJwJO2Y9GmoM0j0lLNFWihnFVdpl8VYcWkI+ZpTZplYxLHPNUYwpQKRfkqtE2ei+fBmoq0
	xh09WTQMbSJF1vxLBjoNWyKlstiM8mPYQzjIn
X-Google-Smtp-Source: AGHT+IFoX8epXlP0L88cXgOrvbD54iZwC/5YezCjUQ1mOj3Wo0oGTHm3qILbRELpG6UnJCR2ojWJw8oQVS4bgI+I8QA=
X-Received: by 2002:a17:90a:488d:b0:2dd:5e86:8c2f with SMTP id
 98e67ed59e1d1-2e0b8c4bf81mr166404a91.21.1727365943489; Thu, 26 Sep 2024
 08:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240926101431.97444-1-roger.pau@citrix.com> <20240926101431.97444-3-roger.pau@citrix.com>
In-Reply-To: <20240926101431.97444-3-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 26 Sep 2024 16:52:12 +0100
Message-ID: <CAG7k0Eq8t4Kh-SKzhcOUcSDCBBbEMQnLnrj3OgQS5v0mCc=hRw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] xen/livepatch: simplify and unify logic in prepare_payload()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 11:21=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> The following sections: .note.gnu.build-id, .livepatch.xen_depends and
> .livepatch.depends are mandatory and ensured to be present by
> check_special_sections() before prepare_payload() is called.
>
> Simplify the logic in prepare_payload() by introducing a generic function=
 to
> parse the sections that contain a buildid.  Note the function assumes the
> buildid related section to always be present.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>


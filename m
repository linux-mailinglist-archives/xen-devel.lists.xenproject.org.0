Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B67B9692
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 23:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612763.952836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo9YI-0003t8-7a; Wed, 04 Oct 2023 21:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612763.952836; Wed, 04 Oct 2023 21:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo9YI-0003qP-4C; Wed, 04 Oct 2023 21:37:06 +0000
Received: by outflank-mailman (input) for mailman id 612763;
 Wed, 04 Oct 2023 21:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8gg=FS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qo9YH-0003pS-9p
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 21:37:05 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26ff72d8-62fe-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 23:37:03 +0200 (CEST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172]) by mx.zohomail.com
 with SMTPS id 1696455417336731.1484474410069;
 Wed, 4 Oct 2023 14:36:57 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-d89491dab33so381720276.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Oct 2023 14:36:57 -0700 (PDT)
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
X-Inumbo-ID: 26ff72d8-62fe-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1696455419; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aTetDs+1qcMNUksMCFO0rkk6ob3ac1k+EydauUDXAbeO5zEPEXQ6/kbFYAizWjD89wgOb03zj/4O/NmQL+uEZy0fg/1EmdWh4KgmQNAomWqN5uNzXWE2iAlxxcjo1Raai4Vhb+eROpxpH1nlAtf7GF3oJraNRcrOpPdWZgYcJIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696455419; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NlBMhfH5dOHpz+PXev7wAwSA56dLJy6EolPtUl7sUdQ=; 
	b=jSi7NrF+vKtj1CmJsc+P/ewS8UYqFjz49GLkN5+q9uyCoVX0IgNTYpy7nIDfyqiLt+VWu4o+VvP74Uzik5U76Xa7u25ZH6IpDkVfhIg2D7QALrIp0fRZpATX29jXsC1Oo80xYrMvRgDa23Wrq8FJDDb02Okie2QyKRtzlqapp/o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696455419;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NlBMhfH5dOHpz+PXev7wAwSA56dLJy6EolPtUl7sUdQ=;
	b=L7zmztWHYRg4Tby6EPYnd+6evPljlfenTe3B3IWa7MnvYrnbBLOdGk9w58UTdjNo
	BKAcIQLTuP/I2YLWZ0Ep4nquCFdfRJ83HHeAxLHMVdInj2fFmKvl334dzR4CnEFvQbR
	3541En7x6fFpJ6eGnCgwEjYGUgdb1pJAZpKZuNS4=
X-Gm-Message-State: AOJu0YyNP4GB2GjOxjl4iWjvTIh4tzP08CJgyGbmDUUTOSZFo9y6Qjfv
	l0wNd1Xf1SnJn1Oyd7McCbRz0seBtgI/2RcfyvE=
X-Google-Smtp-Source: AGHT+IEe3sliHsQMA+Uo4i0vFO+npM4TrzBWSFJYeTr6NOrkj0Ikv+C0wMfZa/dm4/g0wxHG3D4xWX/sy7RxC6HnCNI=
X-Received: by 2002:a25:d28e:0:b0:d81:a119:a106 with SMTP id
 j136-20020a25d28e000000b00d81a119a106mr3527788ybg.19.1696455416458; Wed, 04
 Oct 2023 14:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <081ae245-9d47-4cab-ad64-54b33566429c@xen.org> <20231004135331.83736-1-roger.pau@citrix.com>
In-Reply-To: <20231004135331.83736-1-roger.pau@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 4 Oct 2023 17:36:20 -0400
X-Gmail-Original-Message-ID: <CABfawhk-aSqBs3xZ83GPKJQVZTORt4MkUzH63teRp_oJKOXKtA@mail.gmail.com>
Message-ID: <CABfawhk-aSqBs3xZ83GPKJQVZTORt4MkUzH63teRp_oJKOXKtA@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] x86/mem-sharing: copy GADDR based shared guest areas
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 4, 2023 at 9:54=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.co=
m> wrote:
>
> From: Jan Beulich <jbeulich@suse.com>
>
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, add the necessary fork handling (with the
> backing function yet to be filled in).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>


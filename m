Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FC7F7347
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640604.999036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Ut4-0001VH-Ac; Fri, 24 Nov 2023 12:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640604.999036; Fri, 24 Nov 2023 12:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Ut4-0001TD-70; Fri, 24 Nov 2023 12:02:22 +0000
Received: by outflank-mailman (input) for mailman id 640604;
 Fri, 24 Nov 2023 12:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duVF=HF=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1r6Ut2-0001Si-SP
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:02:20 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f1d9b9-8ac1-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 13:02:18 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50aab20e828so2581865e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 04:02:18 -0800 (PST)
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
X-Inumbo-ID: 50f1d9b9-8ac1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700827338; x=1701432138; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiDE6YKAzG0FShYENyJb4Ji6iptRTibxCqZzk+O923g=;
        b=Ey6uY/E0j8cPCEQk/0AwgzIyHDFxGoOVUz9sSP+s/xlD6mnz2EN6e1oezu2QFAgpz6
         gEZ3TbjoBw+3lp+6AbCJS2q0gYrmoG059d5Igy2j0HnAWE59o7ZnOrJkslS8kqWqfOyz
         nSM5Qadj9S4imO2xdj/CkuI2t2LQOex3A+pl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700827338; x=1701432138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiDE6YKAzG0FShYENyJb4Ji6iptRTibxCqZzk+O923g=;
        b=VmAjBC9NIrbU95WqbXx1LGhqs4LDrOL1KC8/D0MFstZyvxXUjeXghxk0pA3xTfEIBE
         kbNpxeyPbbs/m3CRTq9Vznn/ut/qcSArBnNcx5vsmQfvhDcmHpX+u4yiYmH6cmdb7fFT
         p/eviRxJjD2wD8IaFK8og5fCCBHk1X4BpYvd6jxH6DOoCIOJzeiSKZFr+/cdqEhoqIo3
         Sh67gTtBMe5/RLmr0IHTnvXUf1uMTeZ9aPrIt5QBVtX0Vg86urH2xWOnWW9JgGi88arN
         /h7Qvu4EJQyAibPkB2c9XTNNavZDSO4hSgBctXhy7e6Y+VvyuDTnUjzw05MJ6m4SARKc
         W2rA==
X-Gm-Message-State: AOJu0YxfLXX02Q4KIMAxOwVMvAiAydeUmlFwTZsQi7dmSorzsSWNWlOM
	xPhBUtvxJovd9IJ9EGlqHd2fxdNZbAZ2nXaPMCSAXQ3eCoQbRQLXgg==
X-Google-Smtp-Source: AGHT+IH50fnnKT4kaSIWJoyQbstwUx6/rWAEE2wdHZu0XnknhsP/0yBEwHZhM0oaxDu078VtVgqDgHqh5EtrjdTv5xg=
X-Received: by 2002:a05:6512:3453:b0:507:9d71:2a77 with SMTP id
 j19-20020a056512345300b005079d712a77mr1347962lfr.17.1700827337415; Fri, 24
 Nov 2023 04:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20231123160535.18658-1-roger.pau@citrix.com> <20231123160535.18658-3-roger.pau@citrix.com>
In-Reply-To: <20231123160535.18658-3-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Fri, 24 Nov 2023 12:02:06 +0000
Message-ID: <CAG7k0Eo1pXqio-Vjuq0UA=q_tEi3Kr3aLkUYZyy9urWttF+jLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] livepatch-build-tools: do not use readlink -m option
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 4:08=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Busybox readlink implementation only supports the -f option to follow sym=
links,
> so adjust the logic in order to keep the same behaviour without using the=
 -m
> option.
>
> Singed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks


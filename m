Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD2319144
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 18:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84049.157529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFxY-0007Od-Qs; Thu, 11 Feb 2021 17:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84049.157529; Thu, 11 Feb 2021 17:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAFxY-0007OE-Nk; Thu, 11 Feb 2021 17:40:56 +0000
Received: by outflank-mailman (input) for mailman id 84049;
 Thu, 11 Feb 2021 17:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f8zj=HN=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1lAFxX-0007O9-Ao
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 17:40:55 +0000
Received: from mail-pj1-x1033.google.com (unknown [2607:f8b0:4864:20::1033])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 773c9eaa-1cd1-446c-8257-e2ef31715d58;
 Thu, 11 Feb 2021 17:40:54 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id q72so3803345pjq.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 09:40:54 -0800 (PST)
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
X-Inumbo-ID: 773c9eaa-1cd1-446c-8257-e2ef31715d58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QziDmZr8TTpasbvFZVUT/329P3XT1UCmwBzrVbDzVt8=;
        b=CZZ0dXb/akrEVv2gQQECboWALMHG7RAyWsSQM3mxEpIvbiek4NeIVFxUsJbwfNUS1F
         5l2Hwc3f005aESd3X699lGHhAOb7vfkMWnvZw0TzSLlkXPN/mwcP06Ate3WnBqutLlGw
         1vn4omxqbInwoBzJgbYQLZzODZnev3BBGI9as4f0skV7jhURhiiS4e+3Hb90+uogCy9J
         aDQ71xGirH1r0z2TRzWtPDbX7Me+ZLFWNdBoDZpNfRsHhZI1CEw5JOewM68MuwzUM1X8
         zfhcbbe2jGOmNIGQnCbus3G1gzKLviS5KedNNawoXnCKJUGm0kMO1ZiwAC91PUKILivP
         sGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QziDmZr8TTpasbvFZVUT/329P3XT1UCmwBzrVbDzVt8=;
        b=T+vz03TIbxV47RL0QsUKRjcLYubSQru4N0wsTTd/ncVlCCp//94LW4LScH2qo1hA6o
         uUXDSaXxZzsy5NsUS6IRKzm8EGDq3eX195BBb7allMjfr0KCztUCd+V/9jST8TliAd1A
         yFonxCAfCr8g5oolWBKcYEc+jTHUWhn6bauB1mDI/Eac0/UMBqg+5ofIO6taVe3V7j+W
         gZgJaOr+m1hucXT0h5KPunmhi6MN2T56AHbStxpQnCA0cFP2EKObAozBlaL7yhSHjAm5
         sId1wdIumBZxDUJWa7JHzjlPprp9wBAvOwm/mCLPi/0J3ARaxABwo4bGN+tUiqXnV4aD
         szcQ==
X-Gm-Message-State: AOAM5322CoyGKAMWdWi59hQKQaDfG5cTQ8Aw6ohR7x87ICcf1M0H5Njc
	PB8GwD2bYD5XIRrugqCwwyA/qZ6cyutlM7Nno1M64A==
X-Google-Smtp-Source: ABdhPJwnwxrzPvItcE7Xa8pNbvWQIHYnBMQTywNiPe0cxc7ZYs5qbKGkU8WIgEdLbvZvJ4SMYkxbpVcNIY7Jt3hhMWg=
X-Received: by 2002:a17:902:e989:b029:e2:8c9d:78ba with SMTP id
 f9-20020a170902e989b02900e28c9d78bamr8505067plb.81.1613065253570; Thu, 11 Feb
 2021 09:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20210211171945.18313-1-alex.bennee@linaro.org> <20210211171945.18313-2-alex.bennee@linaro.org>
In-Reply-To: <20210211171945.18313-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 17:40:42 +0000
Message-ID: <CAFEAcA82Fv34Ri=s97rx8hUPrqMeL4xOS325DbY1fhoWmiE+9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/board: promote fdt from ARM VirtMachineState to MachineState
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, julien@xen.org, 
	Stefano Stabellini <stefano.stabellini@linaro.org>, stefano.stabellini@xilinx.com, 
	Andre Przywara <andre.przywara@arm.com>, stratos-dev@op-lists.linaro.org, 
	"open list:X86" <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Feb 2021 at 17:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The use of FDT's is quite common across our various platforms. To
> allow the generic loader to tweak it we need to make it available in
> the generic state. This creates the field and migrates the initial
> user to use the generic field. Other boards will be updated in later
> patches.

This commit message says this is being done for the generic loader,
but I deduce from the rest of the series that you aren't using
the generic loader (cf discussion on a previous version of the series)...

thanks
-- PMM


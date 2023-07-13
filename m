Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AF752404
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563175.880245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwVW-0002DN-3j; Thu, 13 Jul 2023 13:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563175.880245; Thu, 13 Jul 2023 13:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwVW-0002Av-0Z; Thu, 13 Jul 2023 13:37:22 +0000
Received: by outflank-mailman (input) for mailman id 563175;
 Thu, 13 Jul 2023 13:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=In0U=C7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qJwVV-0002Ap-8L
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:37:21 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4acbb449-2182-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 15:36:38 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so1275705e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 06:36:38 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h12-20020ac2596c000000b004fbb011c9c7sm1120050lfp.162.2023.07.13.06.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 06:36:37 -0700 (PDT)
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
X-Inumbo-ID: 4acbb449-2182-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689255397; x=1691847397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BfgR5y98oK5asaUp7M81t2LiGzYaD1t1AQDY9HxBF+c=;
        b=Uc9HzGhYhdqlp4cNpJ3orGC/y0OxBiUhPNraCOJEPDnNaFQxnUl61gAk8xYShTd3vH
         a1TGI2isz+hSfYzTPlAxPd+u7wt8taONjxSun+LB+lB/H1X4cLUx641Dqwp+0TC83SN8
         WIdYtz9mgXaaQGii86NI9LK+TD4D6fUrzTGPP9Gs7psbtqycWSjhme1P5nUiGyMoRtXS
         k+kVdXRHeeoFb1jT5y8O3gWGJiJRa4akR4FrMgQz8R6B9CowGsIYJZEqsQD5fgwQzCuK
         vksBK8ix5iHI9tR6hgOHxJl85tto8OhFZsPgtaDZyznzohkdIxyPsvYwMEackfarXrdh
         zoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689255397; x=1691847397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BfgR5y98oK5asaUp7M81t2LiGzYaD1t1AQDY9HxBF+c=;
        b=jUCcs5tDUqiRR+W+1yZVcxAce7y9JHFSL8acel+2VydxW6Xjn9Tb4CBdexwjjlp06G
         P4PtRB76+DvxMX7Nl19z0uUOreGHvhMD4tFBgtDXsZnnvEYENckvwMjiu8UPEo2VdBAl
         tglRt5OL3SLKPT/dpJY4Gbf9O932NEQZEKjOG+cez8IgA6t6g86LL41LCZ9oPzrMjCUD
         tuWtTJEnRycOmosWuRawU3Db648r7G2zkllre9mLtkOb+C6PXoLmF2PhFbVyQ+CMy1M2
         /skNVCTKpxHI1J/ufYHhnvLok0NMasTAPOZN0eAoD+dSZ9TbEIfvgEQz0OcnMB/uE5ZQ
         o1oA==
X-Gm-Message-State: ABy/qLbMkrVKT/dCHUuh9QEp36Ve7rLkbCZCaM0apNQDFN40JRNyVMZj
	lDRn2keJuHZY2ZySj/X0vw4=
X-Google-Smtp-Source: APBJJlE5lyVy67bvtFDpMQYnzhDZ0Gx7jOb3PMQ4x/5IumypXSCQOrgNKXcoGGZHRj0j3Xg2h7b6dA==
X-Received: by 2002:ac2:55ac:0:b0:4f8:6d99:f4f3 with SMTP id y12-20020ac255ac000000b004f86d99f4f3mr1423225lfg.52.1689255397319;
        Thu, 13 Jul 2023 06:36:37 -0700 (PDT)
Message-ID: <83f67337cb69fb8cf2aa5d56b8a711384cdaa5f0.camel@gmail.com>
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, Julien Grall
 <julien@xen.org>
Date: Thu, 13 Jul 2023 16:36:35 +0300
In-Reply-To: <3e4c673d-1b8b-15ab-629f-27a9f687b37a@suse.com>
References: 
	<cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
	 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
	 <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
	 <3e4c673d-1b8b-15ab-629f-27a9f687b37a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-13 at 15:27 +0200, Jan Beulich wrote:
> I don't understand. My earlier comment was affecting all checks of
> uart->irq alike, as I'm unconvinced IRQ0 may not possibly be usable
> on some architecture / platform. IOW I don't see why the check in
> ns16550_init_postirq() would allow us any leeway.
It looks like I misunderstood you.

Do you mean that on some architecture IRQ0 may be used for ns16550?

If yes, the code inside ns16550_init_postirq() will ignore that fact
and use polling mode.

~ Oleksii





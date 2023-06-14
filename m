Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A772FE54
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 14:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548731.856835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9PTX-0003Hb-E3; Wed, 14 Jun 2023 12:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548731.856835; Wed, 14 Jun 2023 12:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9PTX-0003EI-Ap; Wed, 14 Jun 2023 12:19:47 +0000
Received: by outflank-mailman (input) for mailman id 548731;
 Wed, 14 Jun 2023 12:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRK2=CC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q9PTV-0003EC-Kr
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 12:19:45 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd9982d2-0aad-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 14:19:42 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b34ac4b6e8so6080971fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 05:19:42 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e240f000000b002b1a872c826sm2300003ljk.61.2023.06.14.05.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 05:19:40 -0700 (PDT)
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
X-Inumbo-ID: bd9982d2-0aad-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686745182; x=1689337182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JBk7QGPl/k3z6xWNLAjbrNSZYMJ3wpeG6M6K17GGWhQ=;
        b=V8oBM79jiCNl9y8vK+zsQ1B0aZdFgiWiWXduV86wYWuNgJasulJUQ+IImeQthKUQMr
         Qhs9qNmd+P9hGVqiCXOzFrB0ILYpW8qreYXn+hhlNF3sj21Viepgxw7ySs5R54THGmBS
         aAu8ZeG7FiDUVolrhMgGE0sfM7akUKzngEvG7U/VkSSP9OmDa4/WmgtB01YJgcbiQ1Cl
         EsHXfZJHN5pG7F/BRpwy54EE2gvEdfOQqitbwFveDul5+Y8ubLzd6p/FlTZh/xHMxWjM
         IVJUrT5zG6XbZQaF61osnhsmWxWOCi+NmuFHtKRg73IrgAj+ZovConmAu80FCE3fkLIY
         zFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686745182; x=1689337182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBk7QGPl/k3z6xWNLAjbrNSZYMJ3wpeG6M6K17GGWhQ=;
        b=IX2TuHVx4sCD9wwch9seABdRBb5SODsVlCgjl0+6ZBp9B30jdTgjYElaYYMk3Hp/6Z
         ykMqEyKaFaoYKsE8MeFT2rxQLOfez/lDbGbMDfHB0H9ZFtkXanWRrtjhfKr/OvN3Wf5J
         iB7JmvwK9qXIctTmCyDKoAD+lvLIHP8NTxOVn0zFSPcHmRA2frKugp4paiY5GHvhW7m5
         w0ythc7DaEwt2m8/sr33Xd5m+nzEGCTcKcAhEyMoCCYcTFuIFakE6zgaXfNDqIPpT5K1
         SvHdjECscOuT8QF54eVxKhonNHWKQ3Hv+YBEK622soTXtpytw+7G0oNa7rIM07dFtd8g
         bKVw==
X-Gm-Message-State: AC+VfDycQus9Pw6BaVDpWDfSvVP/rcLTGfwC4Nv5aoQ0KPjQI1iZn0hQ
	0Vx1lvXBSJRwnKLQiY0rP5g=
X-Google-Smtp-Source: ACHHUZ7KIM6IPBOrkXoXTUM/sa5j4rTNSIvuJ78ygkqwyXvhdJUmmMTVTeXpn1XcwXKZWWVhYBWiJQ==
X-Received: by 2002:a2e:850d:0:b0:2b1:c0f8:9b95 with SMTP id j13-20020a2e850d000000b002b1c0f89b95mr6717422lji.19.1686745181295;
        Wed, 14 Jun 2023 05:19:41 -0700 (PDT)
Message-ID: <f2e81cee460b419146d53a5e7ba0b507a8b0e724.camel@gmail.com>
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce reset_stack() function
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 14 Jun 2023 15:19:40 +0300
In-Reply-To: <92fab0b8-647a-b9c1-d15b-1217a4420715@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
	 <92fab0b8-647a-b9c1-d15b-1217a4420715@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-06-12 at 09:12 +0200, Jan Beulich wrote:
> On 06.06.2023 21:55, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> This wants addressing the "Why?" aspect in the description. Is the
> present
> code wrong in some perhaps subtle way? Are you meaning to re-use the
> code?
> If so, in which way (which is relevant to determine whether the new
> function may actually continue to live in .text.header)?
>=20
As I mentioned in previous e-mail there is no such requirement for
reset_stack() function to live in .text.header.

I think such requirement exists only for _start() function as we would
like to see it at the start of image as a bootloader jumps to it and it
is expected to be the first instructions.

Even though I don't see any issue for reset_stack() to live in
.text.header section, should it be moved to .text section? If yes, I
would appreciate hearing why it would be better.

~ Oleksii


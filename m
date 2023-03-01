Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064B6A6ADE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 11:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503969.776411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJms-0007Jk-Eu; Wed, 01 Mar 2023 10:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503969.776411; Wed, 01 Mar 2023 10:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJms-0007H7-CA; Wed, 01 Mar 2023 10:34:18 +0000
Received: by outflank-mailman (input) for mailman id 503969;
 Wed, 01 Mar 2023 10:34:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXJmr-0007H1-Do
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 10:34:17 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e0736e9-b81c-11ed-96a1-2f268f93b82a;
 Wed, 01 Mar 2023 11:34:16 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id s20so16945467lfb.11
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 02:34:16 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 x14-20020ac25dce000000b004dc4d26c30dsm1683597lfq.63.2023.03.01.02.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:34:15 -0800 (PST)
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
X-Inumbo-ID: 9e0736e9-b81c-11ed-96a1-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677666856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rJu5h7gXzKUOA2wb7hCKEgPPYNJMyD/SnIMQz9rOipQ=;
        b=CnK5CnJz8WJCCXljWbPRjLYXhIYclgP7GFf+Z7EJ2BpGSyhsw1qVTZ/LufDm2DHYQZ
         REZBhPc6qnJkk5eYB+lMHzVGhR/elFafODBb/mhZ9AFiHWvHiFQpEynzhuEMF1IaT4rQ
         +jMBJMaJxKhXZ4vGhwhapVTAR0xaFNrWaTl5irHfaBJvLt6GuGplly/s6REoNtvkxPYc
         5OWQf78sl+arveWK3P1eO3QwqpAoa7QP9r+MW215dAV8sMXFq+F1j7qPChDZ0lDDwR5P
         cksbOAR6cVnc8LmvujRNweMVt+Tp9qllUJhK403pTHae9GPo6xOpaKo0P1IbH8BfwZuE
         JsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677666856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJu5h7gXzKUOA2wb7hCKEgPPYNJMyD/SnIMQz9rOipQ=;
        b=JaqV9jNsszdIyxdV4c8Y/s9/CGT3f8OVEhT5eLbCahLafEMe6IpFQf0iwJD9qXqYma
         w9rluZxtMNccAtwzW47DgmM14w2qlsMEBNPjLtkFJhm73BHL3qDl+qifPzwcLx69b4SU
         vCF+rcwqUHkYgdhpo39RujJkramdXlISZIYU1fiSyu3AVRn4Y7u9uiYPYRVXiy9kP6oj
         061t6aXYCqeogYcHbpe6DB3p5XhlxoLXZKvP1IbUcELAIxVJrh4Jo3+9h5KRtdLRYa8u
         27hbdb133eLelpeiae1zwkU3kLaIjbOo6eVIf7YWbB3QoIwvgdVD/NMj3aMXU0ONnBYc
         cqvw==
X-Gm-Message-State: AO0yUKVkGyfaXEM1NhrKSqNhmNRzIGaQRPCogsQ1AVkawNnSipW7octH
	eKvUGms6fA3B9hJywapLhZE=
X-Google-Smtp-Source: AK7set9rwOuKArSUOymgy9FYesVMhyvc0SJY0ttbTJ1Uf5d53Dj9tpHlffRbxC9HkO2+pWqQLi0Vyw==
X-Received: by 2002:a05:6512:3404:b0:4dd:9931:c4f6 with SMTP id i4-20020a056512340400b004dd9931c4f6mr2020066lfr.16.1677666855745;
        Wed, 01 Mar 2023 02:34:15 -0800 (PST)
Message-ID: <b72d513448710072fe84b7f742f4d867bfc4da05.camel@gmail.com>
Subject: Re: [PATCH v4 2/5] xen/riscv: introduce trap_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 01 Mar 2023 12:34:14 +0200
In-Reply-To: <dcfa24d7-20c9-b460-32d7-7567b17c0b32@suse.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
	 <b1b2252d3105eeaf0cee10ae2be253c8526d0e5c.1677237653.git.oleksii.kurochko@gmail.com>
	 <dcfa24d7-20c9-b460-32d7-7567b17c0b32@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 13:50 +0100, Jan Beulich wrote:
> On 24.02.2023 12:35, Oleksii Kurochko wrote:
> > @@ -11,6 +13,8 @@ void __init noreturn start_xen(void)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 early_printk("Hello from C env\n");
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 trap_init();
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("wfi");
>=20
> Along the lines of what Andrew has said there - it's hard to see
> how this can come (both code flow and patch ordering wise) ahead
> of clearing .bss.
So should I add the patch with initializatin of bss as a part of this
patch series?

~ Oleksii



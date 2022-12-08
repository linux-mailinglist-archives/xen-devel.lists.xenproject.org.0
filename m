Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9156471CD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 15:30:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457206.715084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HuH-0005He-J0; Thu, 08 Dec 2022 14:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457206.715084; Thu, 08 Dec 2022 14:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HuH-0005Ey-Fh; Thu, 08 Dec 2022 14:29:49 +0000
Received: by outflank-mailman (input) for mailman id 457206;
 Thu, 08 Dec 2022 14:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAIj=4G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p3HuF-0005Eo-Fa
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 14:29:47 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3a9cf57-7704-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 15:29:46 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id s5so2012017edc.12
 for <xen-devel@lists.xenproject.org>; Thu, 08 Dec 2022 06:29:46 -0800 (PST)
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
X-Inumbo-ID: c3a9cf57-7704-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l0qPeIJOIhjyznECtS8fut53UHjwwwvuJgNhcuFSxik=;
        b=F4im1xeuNsIHAoynnPnzNqgADfYLPxg7tRqVhDLeAVqg8lRvz4LWnUODB15CjtXFQ/
         6X3GMxuB5KlR+9x7stEW5jVrOydmBXaLukY8REPLyLC4t3XBjkgIeFnmII+15hPVMgaz
         2ITnNdt4hKiXbHlgEBmPhaH0SoWkqxVuU8wag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0qPeIJOIhjyznECtS8fut53UHjwwwvuJgNhcuFSxik=;
        b=oTiG7rU2ZLItt3+r6gY7MLD5/jMC3+STSwyVytwH9CZ0wRs1qMTV7HFdk6VehRGZrg
         ROxfCGEDfFbbKeL4B5+jb0PbzjYLAIp4wMxJz+8EzQYtbJiWllh2HuiZwxez5ilGf8N3
         /anJYAfvplQ7rjY77isbAAb6HcIJBFWyv2BjVr+BhuYQaVbw1bW0BdsFFrR7k9GQPoOP
         s3BeLHMPXmK3MPtezWgsPy8dw7dnEXb8RM6CoZ8VCHhBm78m6ZAMFbUoNCdMaMTf7W/H
         8OhP7JX1LIdQtwRMH5TyZC1t8mVJMJGzDe8leN0ecYHhfsKi/Vd09YOhZRYalhYxCVMV
         wmHA==
X-Gm-Message-State: ANoB5pnUbVVvfL7SVMBu5f4sT0vD3k/gRKWhvSA5HLFHFHeTXzmbe2/G
	0Im4UUtelADTsf5Vt7hWtPifW3TXEb9/H7C4IL1LnihZGJ2cNAZo
X-Google-Smtp-Source: AA0mqf40fJB1MHrF64hiQVc6Y8BkQI2b0sc/5v5PSZL8QNXySxooB6l5bmWw/LlA2vVllVMaC+sg5oiMii8e6cYE7MI=
X-Received: by 2002:aa7:cb96:0:b0:461:bacd:c85d with SMTP id
 r22-20020aa7cb96000000b00461bacdc85dmr40701439edt.278.1670509785826; Thu, 08
 Dec 2022 06:29:45 -0800 (PST)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 8 Dec 2022 14:29:35 +0000
Message-ID: <CA+zSX=Z16e5GufsNscxTEQ0rzrKLUkjqT+0+gegB-4STDWjFKA@mail.gmail.com>
Subject: Feedback on Xen Summit 2023 options
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000060fe1105ef51de82"

--00000000000060fe1105ef51de82
Content-Type: text/plain; charset="UTF-8"

Hey all,

Here's a quick poll to get feedback on our current choices for Xen Summit
2023, some of which have non-standard parameters.

https://cryptpad.fr/form/#/2/form/view/rNLNfq9nWLHN0v7nN3xYygDtk5iMvCkUCQFiM7iEhLA/

The poll will stay open until the next community call, but obviously the
earlier you can respond the better.

Thanks,
 -George Dunlap

--00000000000060fe1105ef51de82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey all,<div><br></div><div>Here&#39;s a quick poll to get=
 feedback on our current choices for Xen Summit 2023, some of which have no=
n-standard parameters.=C2=A0=C2=A0</div><div><br></div><div><div><a href=3D=
"https://cryptpad.fr/form/#/2/form/view/rNLNfq9nWLHN0v7nN3xYygDtk5iMvCkUCQF=
iM7iEhLA/">https://cryptpad.fr/form/#/2/form/view/rNLNfq9nWLHN0v7nN3xYygDtk=
5iMvCkUCQFiM7iEhLA/</a><br></div></div><div><br></div><div><div>The poll wi=
ll stay open until the next community call, but obviously the earlier you c=
an respond the better.</div><div><div><br></div></div></div><div>Thanks,</d=
iv><div>=C2=A0-George Dunlap</div></div>

--00000000000060fe1105ef51de82--


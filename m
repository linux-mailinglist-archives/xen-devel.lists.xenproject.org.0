Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A760690906
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 13:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492436.761965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ6Bn-000835-BY; Thu, 09 Feb 2023 12:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492436.761965; Thu, 09 Feb 2023 12:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ6Bn-00080A-85; Thu, 09 Feb 2023 12:38:11 +0000
Received: by outflank-mailman (input) for mailman id 492436;
 Thu, 09 Feb 2023 12:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2pk=6F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pQ6Bm-000804-6Q
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 12:38:10 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b2cb662-a876-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 13:38:08 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id r2so1611470wrv.7
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 04:38:08 -0800 (PST)
Received: from [192.168.8.199] (46.204.104.21.nat.umts.dynamic.t-mobile.pl.
 [46.204.104.21]) by smtp.gmail.com with ESMTPSA id
 a6-20020a056000100600b0029a06f11022sm1137073wrx.112.2023.02.09.04.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 04:38:07 -0800 (PST)
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
X-Inumbo-ID: 9b2cb662-a876-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DsTtFzjI9O3ilClM1Q3fiW7nVydjW3fsa9s7dJGWl4A=;
        b=iE04V8b1KruKZTeBZMwpQxHxUGt6vFPwbWnQnoP7jFuZbqyy1sTGVzzBlcckvYW4bi
         dkwbEm3REJfw2qmbPzvqcupB2gfpbqY6WV11l3w4R5MOkRXaldcMQmw6JfSFNFrwsh8s
         1MzU6JM7HOpDuM+O0BAUyyXMX4fBlIbnyUvAkMVqq/1SQE5XN/s8gf0fsWZq3ONKWIk0
         5sazI3jnGcdCIJSaEzqMYZO4QNm7hgiAUAb+57J2Q3vdUsavS51RtQlDrRN20vCvJryk
         lZppayaovkdSlLbjFr8OseOS3/ti/T7Hp8ajNenAuFQ8CrbYNtLb/ClqfJ/GvmFULAZJ
         QxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsTtFzjI9O3ilClM1Q3fiW7nVydjW3fsa9s7dJGWl4A=;
        b=2M2cbJyUsDTckcU1BL5pRQb2Nr52k3HT6EFH3ucEEh9ya6uhdkCK+mMbWrlXsQAX4S
         M6Zxr/dMpghA681jqOG8CFHZN1chXrYaGnjwIxhJfxHczJgizQAJ8mmbA0UnOBIzMry9
         zFJwze/rxUjl6/0qocvYTXtTAf7pa/69eVDaBZ9Lo8ALlquruS4rERutbf5BYnbuQB3F
         /hEPhlVr4q4Pp22w8ys50ZK0Um0dPZAxTeduqNxX6pLVchMUfwC0BCjiT5Rz2iZjifI7
         gnEtHioQC5b8uzCZ4uSYOFZkOFQ/kZyYTJDtSw/ckwErQ4C8KFmWUiDDU5Chwi+p4yz2
         aWSA==
X-Gm-Message-State: AO0yUKUIPxoursz3Q6n15duUzGky8F+4a02wOjwqqVBSmV0C7xgDhnI3
	1gj4JIoJEqFKB3pt5SL09amp7shIqFY=
X-Google-Smtp-Source: AK7set/kLF3W042jaX6KoxsZS4+SrboDpFr5dCQJpVETYatE4LtOnx+DyGO3nmKOlzD5kJjls2s7Yg==
X-Received: by 2002:adf:dc51:0:b0:2c3:db5b:7278 with SMTP id m17-20020adfdc51000000b002c3db5b7278mr9964339wrj.60.1675946287662;
        Thu, 09 Feb 2023 04:38:07 -0800 (PST)
Message-ID: <c78c64448ea606ecb32bfc4e2cca5eac745d182f.camel@gmail.com>
Subject: Re: [PATCH v3 00/14] RISCV basic exception handling implementation
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Doug
 Goldstein <cardoe@cardoe.com>
Date: Thu, 09 Feb 2023 14:38:05 +0200
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi all,

I don't know why but 1 patch was commited as a separate patch:
  [PATCH v3 07/14] xen/riscv: introduce exception context
https://lore.kernel.org/xen-devel/5aa05592497ba9c4d207185d81981442d43ba676.=
1675780434.git.oleksii.kurochko@gmail.com/

~ Oleksii


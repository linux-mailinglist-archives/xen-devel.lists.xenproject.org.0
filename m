Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728EC803E71
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 20:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647292.1010282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEi7-0003VG-5w; Mon, 04 Dec 2023 19:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647292.1010282; Mon, 04 Dec 2023 19:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEi7-0003TQ-2W; Mon, 04 Dec 2023 19:34:31 +0000
Received: by outflank-mailman (input) for mailman id 647292;
 Mon, 04 Dec 2023 19:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwcF=HP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rAEi5-0003TI-Lf
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 19:34:29 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 234b46b2-92dc-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 20:34:27 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so66094011fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 11:34:27 -0800 (PST)
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
X-Inumbo-ID: 234b46b2-92dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701718467; x=1702323267; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xZM9UmmAJGFfqGGzxljCGuIRbzVQdM1Xn9ODlR1S3fc=;
        b=S14Uq0fxKgmiReEsHy2rAjUn7XYt0qd5COQnGK2lTsQTDvT5voxHPWOeD20IuYYCcP
         yZnmcu1mWdSbRO8zgwA/uBGPBvHeGumYagBQl2+yc06BGvPW5Hbir+KN3Uj5sao6LOjB
         DrB3AGSr9as1j8tqVVzix0o+B6HixYEXeX3vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701718467; x=1702323267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZM9UmmAJGFfqGGzxljCGuIRbzVQdM1Xn9ODlR1S3fc=;
        b=tJ23JB/zQtibBj0lB6XkLjkkYhdkIzsRh07yIU9BJN+x5PwpMPD+4wkgRJVyafkA7n
         7aa147l3XIUv9Q0cW43m3qDCwg2ypGZ+Q4Xte6V74L5ucH5kXJQhnkgh4kMcRQcwc/7b
         GXvz4JnwSElAsxRHm2NoYV9/oJ0to3IR5j9JmUNLBgPD83ocWnxHC3Pbh6qqdLtiXrK/
         MsYH8DExByxmQVLtJjvnD5e6OQBv7vlN6y/UqDrS/6P0Lq0ZoeG1dqbAYqWSWmGsmHRa
         iB23vnms99nQ5/JbMFfPDHfyO7NKQBoe6F6jFvifc1dJyyIilAYA/YVDg63S/NNBBZ9D
         NYIQ==
X-Gm-Message-State: AOJu0Yykv5u3zb8Xshv+K4ARZ15dCyZzNsL49msK12BHsZCFXQurCL+B
	UEKA/CXgX6cqcZADGnoAcWX7ceYrKkCBDdbC7NKKS5bTk/RSNj8zNeE=
X-Google-Smtp-Source: AGHT+IENvvRz1KlJKyMoZArBIPMs8ouYCHzU3VFcJcQ5spqqnWCTqLnuWWrJCFqj++4D6qu6TbYED+zdYW3cREMlDwo=
X-Received: by 2002:a05:651c:157:b0:2ca:290:a103 with SMTP id
 c23-20020a05651c015700b002ca0290a103mr1012276ljd.43.1701718467336; Mon, 04
 Dec 2023 11:34:27 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=bpVoB7vB0_FgxadybyjTP-SL7a4uFZRwRXtA-CPqZ16A@mail.gmail.com>
 <8fc5333a-1529-42d2-a90f-dbaff9e2f23f@suse.com>
In-Reply-To: <8fc5333a-1529-42d2-a90f-dbaff9e2f23f@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Dec 2023 19:34:16 +0000
Message-ID: <CA+zSX=apegoMtYCxmT+KWH4ZCvw950oDZdfUW=z7xNF_Rk7_vQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] Call for agenda items for 7 DECEMBER Community Call @
 1600 UTC
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

> > Note the following administrative conventions for the call:
> > * Unless, agreed in the previous meeting otherwise, the call is on the
> > 1st Thursday of each month at 1600 British Time (either GMT or BST)
>
> IOW in the subject it's 1600 UTC and YYY == Dec 7?

Oops -- yes, 7 December, 1600UTC!

 -George


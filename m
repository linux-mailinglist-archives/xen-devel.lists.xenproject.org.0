Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771191D985
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 09:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751302.1159208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBu5-0007BB-O1; Mon, 01 Jul 2024 07:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751302.1159208; Mon, 01 Jul 2024 07:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBu5-00079E-LZ; Mon, 01 Jul 2024 07:56:49 +0000
Received: by outflank-mailman (input) for mailman id 751302;
 Mon, 01 Jul 2024 07:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTSe=OB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOBu4-00078i-6U
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 07:56:48 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77738d88-377f-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 09:56:47 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso3096836a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 00:56:47 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c835b9sm4089111a12.3.2024.07.01.00.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 00:56:45 -0700 (PDT)
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
X-Inumbo-ID: 77738d88-377f-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719820606; x=1720425406; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yZLVEs+H0pV0pxmzMOuQZdCFz7cdk84JgxRFnD5XsLg=;
        b=A0Xw1bnsss8KEyeOc6buyOuXwOqFj0mfflbY5LFbJk3nEKzixktWbzdd8iZ0fhCn2v
         4nDDgSQdhVZVWoW4J8Q5vwLuyArqSsUBRGqaSYtC1cXBr80VMChdcxScpy8BVbMCk3mt
         wmoJlR8ZfTBG4HoxFjF9eXZ8Nts1ipdBL4uDI02VLCfEFt366+s9CQlZ/M6zkBdk4SwP
         uWEa85Hb1bWw1qr8FmW6QVVunPHDCSBzlxQgyZe4fOWQibiNlKIsJgb/2fkBU2CB4TV/
         IIS3JgH9DnTilrZn5V6SkvgoSrMh4SxMwo3llUr7iqoHT4flu4lbzRqT0Cdc24S8BZeI
         cjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719820606; x=1720425406;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZLVEs+H0pV0pxmzMOuQZdCFz7cdk84JgxRFnD5XsLg=;
        b=aWpACQe5HJ1mqHV4HSVnrS/U4zIYe41OTe83Mk8C/K8hnC+x/w7Z3shYObJSG4H0KK
         EGqLN0lI9TcaTga9v/1d2Nd3a9ztTNUrTZsp0njEUILP1rqBc6EpmzXNVMBp/LeoJYus
         xI2friw7/uZl29G9b/n4IGp0rytg7Cinb/HlXh1fayCaCpfLixWcXCkAEUA9GhLCWgPK
         dJX6kuNIQ7LTY6yAFwvG+MJ6zKiMIQ1GscfpZNvXfA4VcSNAFq9kv9uVqkASA4B1rg7B
         oOgdAI+7wbjBSk6oHS9LXJhnOSoYDdljcAT3f+pkXrN317/n+A6q/qeseWLSokqwR93o
         rSMA==
X-Gm-Message-State: AOJu0YwhE+Y+TIHITa0VYHiBMbgcsSr+SqoPsu6DY5LRlbWjiK2/zEuG
	jlf0y0Oi5Z2p+gzPRPDZqHG9MZbEY+mMQxLdzmuJ93hJsYailx/IscfNfSIt
X-Google-Smtp-Source: AGHT+IHRzD+Aux7yKogE8cjMvfYT2DahtZD2c6vki+f4NFPsqugBhNWj717SPt0wq+8HWxjDZ9OyOA==
X-Received: by 2002:a05:6402:190e:b0:57c:71a4:3142 with SMTP id 4fb4d7f45d1cf-5879efce812mr3731679a12.11.1719820606247;
        Mon, 01 Jul 2024 00:56:46 -0700 (PDT)
Message-ID: <ebe33baa922f6a3fbcb675e9819716e5c85b2daf.camel@gmail.com>
Subject: Hard code freeze date for Xen 4.19 is 01.07.2024
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Mon, 01 Jul 2024 09:56:45 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

Hi all,

I would like to remind you that the code freeze date for Xen 4.19 is
today ( 01.07.2024 ).

Have a nice week!

Best regards,
 Oleksii


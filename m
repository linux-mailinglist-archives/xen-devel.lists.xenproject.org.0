Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C1900289
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 13:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736499.1142591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFY2H-0002i8-Uq; Fri, 07 Jun 2024 11:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736499.1142591; Fri, 07 Jun 2024 11:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFY2H-0002fA-Ri; Fri, 07 Jun 2024 11:45:33 +0000
Received: by outflank-mailman (input) for mailman id 736499;
 Fri, 07 Jun 2024 11:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g52z=NJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sFY2G-0002f4-Tv
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 11:45:32 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71c0aab2-24c3-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 13:45:32 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a68c2915d99so230975266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 04:45:31 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c8072ac67sm234593666b.209.2024.06.07.04.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 04:45:30 -0700 (PDT)
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
X-Inumbo-ID: 71c0aab2-24c3-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717760731; x=1718365531; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L2QMWXb+K0jMpYEYjzTtIRH3nM9D+A3J4L3icldjYIA=;
        b=M01Udk16Mqc1R71mLQbAfKMfpsdyvJUZrOdmYKSGQRYPldW5Hm8y3jIDXiFqHAdxIK
         HBF10aacmEjU0ZMVFEDQxwvM1yQSDKEHebpanNoM62L0f3rkSomu+C5ANmyq12oFjiDl
         qdB3eWDo+yILL1aRrYiNj06DNgqF9/oSmbLEtzSMkxqMo9unUPfUCC6hpwWgw8tExWME
         Y9xx7VaINe4txFwajU2ssaTp+H9AJarGakSEwdoXy2bBmTythFczBvnKlY8LnQpymzrO
         mUOVNJnJiNI6KIjtipbGCP+mus9+xUS6j3/Ol+cfFiH4WO8ZVoeLgCJhVNyBanUThI9e
         bptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717760731; x=1718365531;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2QMWXb+K0jMpYEYjzTtIRH3nM9D+A3J4L3icldjYIA=;
        b=le7xue5CVD6wv3GqZbCEXh5W2PmThhU+ik11s7xqyWTKN33EBdOm5TOKoZHY8e2Q/h
         VNvjL9Er079/2rvU4ziDJdmDL4bYhbITQ/xdqO/2vGzjL5K1ddumQurTUm41/Tf38mIb
         wJasQmsvS/IF4Q2vRe3ySeiQrLwQv5mBc4uUQbx2R7f9l77lcz+wMjfiMxpQp1bI2+13
         Gg5fhrrFhlxavxTjge/7C7JUqrTXR8y2xRHbI9X8z6+dT+w2dSr3+ERX7iqV0mOkmHtv
         0CgCDV3om/EOzTPxH2BPW5z8p56kDUg5f76U/OLE9vLPV2rhL85PMQFXw/5QDs/iX201
         5BXw==
X-Gm-Message-State: AOJu0Yw/Il7CpEHnxQQidgGsYwytJfsvzfz1E4fTEsktxFvyKTPhqPTh
	TYfsDC5pbwOLQmBxzLHE1HD3shDMCZpPGWKwj2FupFfqs8LbK/vuj3FbVg==
X-Google-Smtp-Source: AGHT+IFUHcy28JQ2gC5K+m+0Vhhu8lBiYREoIM4MLQ4xnIs2WUtLV04QowUYNtDpq0Pdov7p+/pYQg==
X-Received: by 2002:a17:906:278d:b0:a63:4e95:5639 with SMTP id a640c23a62f3a-a6cdb2f93bemr141921766b.47.1717760731029;
        Fri, 07 Jun 2024 04:45:31 -0700 (PDT)
Message-ID: <09ce709d1a3bc918d91942310ef6958f93138cf3.camel@gmail.com>
Subject: Re: [for-4.19] x86 emulator session outcome
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Fri, 07 Jun 2024 13:45:30 +0200
In-Reply-To: <bd6bd37c-3fb5-4353-a760-5c4465bf7582@suse.com>
References: <bd6bd37c-3fb5-4353-a760-5c4465bf7582@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-06-06 at 18:00 +0200, Jan Beulich wrote:
> Oleksii,
>=20
> a decision of the session just finished was to deprecate support
> for XeonPhi in 4.19, with the firm plan to remove support in 4.20.
> This will want putting in the release notes.

Thanks for notifing me.

~ Oleksii


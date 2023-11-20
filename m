Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38217F1544
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636754.992488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54ul-0006nU-2j; Mon, 20 Nov 2023 14:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636754.992488; Mon, 20 Nov 2023 14:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54uk-0006kx-VV; Mon, 20 Nov 2023 14:06:14 +0000
Received: by outflank-mailman (input) for mailman id 636754;
 Mon, 20 Nov 2023 14:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hay4=HB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r54uj-0006kq-84
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:06:13 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f53c6f26-87ad-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:06:11 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50a6ff9881fso6407655e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 06:06:10 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 fc11-20020a056512138b00b00503258fa962sm1177157lfb.199.2023.11.20.06.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 06:06:09 -0800 (PST)
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
X-Inumbo-ID: f53c6f26-87ad-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700489170; x=1701093970; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s6ku04AVgWw+VDiskuv9LroSS7thY3NklnbnE1JKyaM=;
        b=jw4nh6OMhn64RD3/XiRX/RZUNZV3etoiQsEaVsAq8Xmd7yRlFU9sQWdJlrt0RWN+Xx
         IcF36/IkyV0eobln4K9UwEK3YFe1TN/GKsu5P71s/v0cpEI1++QRHYAGT912hTSlPlYD
         5Ja11Gpxat8vt0BLdozxgldU+7LpY3oktl8sCgva24XLa6A2bvITILPKV5mPmp1ZoS+M
         HGIcNUKysYGwjeIcS2hzXVElcLF6kF3k6uDWnkaHmJ4ypJ5nYiZR/AxzVKg9o/UREM7u
         SHRSQqnoQbVxcmfLdeWdwvqJgDPQftVl9xylqgG5CW46WH4nRRlepo4ZXHqdlIXnHGRJ
         jqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700489170; x=1701093970;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6ku04AVgWw+VDiskuv9LroSS7thY3NklnbnE1JKyaM=;
        b=TJ1rcipOv5RudWd6t4FxjQwrFQCHOgeKvKje83AtGym4bud7n1uQGwwH0PUSVKFGH7
         5j/djObLeXNEJD7GLWE5cnM9iLm1K/VZsNFrBJi+9uhIrWIOWSYn+Ja/6aMNWFQSLfDd
         aXhWREKKvVnX0nPm8w2YwpI/7ZqToKf56LxyrDSF2nUJLejvUmOEQVaj1Jr8OHcwgPh7
         5E/7vK9rPQUhZ1vrEhnj77bAEtPc4yD1dlZQL0uo8ZS8XNhoJGeiE0n+BWngioQnSs7X
         nLQT8rFJ1q23xLZLTtNhHi+E74Q6SceJ1tgAwIbQL1bk5eDfbs5ZceFoBOrdLdqoqol+
         1Z1g==
X-Gm-Message-State: AOJu0YzgZPlE6Tui7PIXWSzLqCWHo46vIkitSrE3sQOPeNEAdMEQ6Ue4
	mp/AL/AwFfHccvE6BqVPuHFeSJLLFX8=
X-Google-Smtp-Source: AGHT+IEGeR7Vks+686HyihvFmkdaQTXq8riGDliHXUCGlG/Nxm0kkCXlURjwh0GfXFAtPBeYy32Umg==
X-Received: by 2002:ac2:563b:0:b0:4ff:7004:545e with SMTP id b27-20020ac2563b000000b004ff7004545emr5171809lff.4.1700489169303;
        Mon, 20 Nov 2023 06:06:09 -0800 (PST)
Message-ID: <0cb1254f433536a9995c278c919372e226059934.camel@gmail.com>
Subject: Interest in Release Manager Role
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, kelly.choi@cloud.com, marc.ungeschikts@vates.tech, 
	olivier.lambert@vates.fr, marc.ungeschikts@vates.fr
Date: Mon, 20 Nov 2023 16:06:08 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Dear Xen Community,

I am keen on stepping into the role of a Release Manager for our next
release. Despite not having direct experience yet, I am eager to learn,
adapt, and grow into this role with your guidance and support.

Have a nice week.

Best regards,
 Oleksii


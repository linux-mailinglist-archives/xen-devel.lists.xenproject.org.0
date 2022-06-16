Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B8754DD3F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 10:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350446.576803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1l8V-0007eY-7b; Thu, 16 Jun 2022 08:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350446.576803; Thu, 16 Jun 2022 08:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1l8V-0007ck-4H; Thu, 16 Jun 2022 08:45:55 +0000
Received: by outflank-mailman (input) for mailman id 350446;
 Thu, 16 Jun 2022 07:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxcQ=WX=gmail.com=mykyta.poturai@srs-se1.protection.inumbo.net>)
 id 1o1kEa-0000b1-VX
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 07:48:09 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a957e71b-ed48-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 09:48:07 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id n10so1203034ejk.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jun 2022 00:48:07 -0700 (PDT)
Received: from localhost.localdomain (93.75.52.3.lut.volia.net. [93.75.52.3])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a1709064a5700b006feaa22e367sm421410ejv.165.2022.06.16.00.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 00:48:06 -0700 (PDT)
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
X-Inumbo-ID: a957e71b-ed48-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nkGlUKJelnsdtw45YiFZDAO0r8YIoDyxfOZDpul7M7g=;
        b=e1ZZnaggq41XeIwEOxoDbdPQgKwFGnhlu2DK+waNLEhc7yM5Zsw9cinvw9aCG/20V1
         0QAivyp2cX3th9lv1hS8dpGGKyfNszo4Y2FlBRJ+rjp4A7IqhwyaSKsA9NXPqOldEa8F
         jsqGmUYAuv1TMENFn3ebIqTIEA7VwzladXDno0wguFBHWF1IOnSt43DdLAERBa3lShkM
         FuscgLaIGFVXqWi3SSxMVbqp16fYVnHHCRKVV04YFV4t3YQ8++MujpIu4R6TN8XkKPhm
         P24OlzacCKvNK7lPWyqBXPTE4v4L0nfxS6iRL+mSsMjgNlwLG1Af371K+HQb5EaqxHNg
         YXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkGlUKJelnsdtw45YiFZDAO0r8YIoDyxfOZDpul7M7g=;
        b=QJc8FyPEFn03jBT7ofD4TKic8lSioF7dOUVgUsgafInngQzV1ys3fnkvrYR9yrgSxp
         SwMMa/oLeM4+Diqiw7wXxEm0zouCrkZMAGUqwUndgwYeiWlB296nRR5HcQp096iLOAlz
         sT3SljrggIRbfeXrw/P7fqsXSS3ZzEE0MkcYDlJAKDKEYg1VcaaymmYbX6K3aryqoXWg
         b0sNunNKe147btBZP59yLLLEBisKesxTg8Qkn9M46iXs3AWP2vvz4jVSQGRTGYlgEegY
         MQt9bNXF0f8THdJOdr5PxI2wUNafFUp8x9YD5eFSzYipVp5bHC6Uc56ruRtsZhVSB2yy
         BQWQ==
X-Gm-Message-State: AJIora+7M3Zh0g4uRY2GUTw6lc4IwaMnGqbZnNjbRUfg2NgEfkm9dzBN
	UZkodd+ck6puKDNsHajX4GAX5GTqF1j7ldI2Gos=
X-Google-Smtp-Source: AGRyM1sWyhqu7m+IdJRRM8dGkJ0UFNYcz1fz8fJy4ufFqCIAaVUMG3dqz0y1Ci3SiDIVoHFzrVv2ag==
X-Received: by 2002:a17:907:6d8a:b0:711:cb5e:650e with SMTP id sb10-20020a1709076d8a00b00711cb5e650emr3329015ejc.280.1655365687276;
        Thu, 16 Jun 2022 00:48:07 -0700 (PDT)
From: Mykyta Poturai <mykyta.poturai@gmail.com>
X-Google-Original-From: Mykyta Poturai <mykyta_poturai@epam.com>
To: julien@xen.org
Cc: Bertrand.Marquis@arm.com,
	Rahul.Singh@arm.com,
	Volodymyr_Babchuk@epam.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a device
Date: Thu, 16 Jun 2022 10:48:05 +0300
Message-Id: <20220616074805.538720-1-mykyta_poturai@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b6af8c10-9331-eec8-9a77-cd192829a6f2@xen.org>
References: <b6af8c10-9331-eec8-9a77-cd192829a6f2@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Julien, Rahul
I've encountered a similar problem with IMX8 GPU recently. It wasn't probing
properly after the domain reboot.  After some digging, I came to the same
solution as Rahul and found this thread. I also encountered the occasional
"Unexpected global fault, this could be serious" error message when destroying
a domain with an actively-working GPU.

>Hmmmm.... Looking at the code, arm_smmu_alloc_smes() doesn't seem to use
>the domain information. So why would it need to be done every time it is assigned?
Indeed after removing the arm_smmu_master_free_smes() call, both reboot and global
fault issues are gone. If I understand correctly, device removing is not yet
supported, so I can't find a proper place for the arm_smmu_master_free_smes() call.
Should we remove the function completely or just left it commented for later or
something else?

Rahul, are you still working on this or could I send my patch?

Regards,
Mykyta


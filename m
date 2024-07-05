Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204C92889A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 14:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754261.1162619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPhtA-0005cN-NV; Fri, 05 Jul 2024 12:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754261.1162619; Fri, 05 Jul 2024 12:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPhtA-0005aa-KX; Fri, 05 Jul 2024 12:18:08 +0000
Received: by outflank-mailman (input) for mailman id 754261;
 Fri, 05 Jul 2024 12:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6Fx=OF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sPht9-0005aU-B3
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 12:18:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c13b80-3ac8-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 14:18:05 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77cc44f8aaso35560566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 05:18:05 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-590377a7e8bsm281882a12.14.2024.07.05.05.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 05:18:04 -0700 (PDT)
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
X-Inumbo-ID: a1c13b80-3ac8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720181885; x=1720786685; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P4IDzQAbvj9N+eKCXWfZT6OdcE5NhRGUpcGrlOOsteY=;
        b=mRFGJ4yVBr8VxS+lbtfS150VvgWGVcHIT5CzTmcVpIXTAY0fs33wQJZJR/mo7DrMXq
         7I1sbHjzX3SCXnGkV7wJ7ri7pHaV4/zESzvAx2ZVaJ4TKRJmFJ50dmzN6Xdu9v1Cd+2n
         sHUSlhWgqKiG6GgX4gGjh7vhnG9grGwae0IuTRsXrU0Y2/8/7S4iHJSrxgYtwdRfBvcL
         Hvl9iNHwP89OJxxtTCCAM/aI0TPInVubfyZvQ9l8NUfJEu801zX3+OGsie66J9JbI5pf
         5E3A9wfu5nJ94+xB4OdzmM5AX5boa6/vA2dDGmM5VuDJzaGuNTkfvUlojHTbbG6Uh5Cx
         YayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720181885; x=1720786685;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4IDzQAbvj9N+eKCXWfZT6OdcE5NhRGUpcGrlOOsteY=;
        b=t56oGNqPp7Hro/cjimOY2SPHkRBVeY/2FeMKw17Ddx/ZBmiynauxfmEgm6vP9DpVtx
         DwuK/1gf97ieV4D39w8kAe1sz2kOvKH7oQqfU0q7LUOCyX6frAhYCwILc3hzjugN6Fi6
         CAew9LGdLcfxtkRhsbWoTCNm9oNuv6huSFFaD1LJ4zZpUBp3kQfvtM66ULAf8zlwQ2HC
         I/Ber23BM7h/hFuTF3drsVQfYYihcp0OeWo9Kp9L6TD4fyUVqLUHV0VFYGFKu0zAIBLM
         ljUYMms/KZxW8oM/WsRZGAXly3d0fU9XAK4g6m3jfb8QAjQ6Nf0Yfn2XtfbDqVBZKS06
         YH4g==
X-Gm-Message-State: AOJu0YxvWJ1N1rSuFCqaO0/E7cAtRfNogul0fd5iBKlbU2+heoKQ9haw
	lRZfHxdPU43j3TcKVYzRlH0OjPibmQa0cJmUPfH+A9aJ7CaZlO0YGwGOOkdI
X-Google-Smtp-Source: AGHT+IE6ODq7DO0pbVu5cY5aAAD4T933UCuvj8oqrCmXyC3PqIMuRDHA6NLDT9KWCicd2mLUbRGKDw==
X-Received: by 2002:a05:6402:4408:b0:57c:671d:8455 with SMTP id 4fb4d7f45d1cf-58e59f27147mr4096976a12.14.1720181884528;
        Fri, 05 Jul 2024 05:18:04 -0700 (PDT)
Message-ID: <ddbfbfab93520830d9fddda01c9aaaf9b6c9c4ac.camel@gmail.com>
Subject: Xen 4.19 release date shifted to July 29th
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Fri, 05 Jul 2024 14:18:03 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

Hello everyone,

I would like to announce that the release date has been shifted to July
29th to allow more time for RCs testing and to accommodate XSA-458
(https://xenbits.xen.org/xsa/), which is embargoed until July 16th.

Have a good weekend.

Best regards,
Oleksii


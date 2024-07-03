Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D78925857
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 12:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752882.1161115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOx70-0000iY-26; Wed, 03 Jul 2024 10:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752882.1161115; Wed, 03 Jul 2024 10:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOx6z-0000fj-Uk; Wed, 03 Jul 2024 10:21:17 +0000
Received: by outflank-mailman (input) for mailman id 752882;
 Wed, 03 Jul 2024 10:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOx6z-0000fd-3l
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 10:21:17 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9cfde13-3925-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 12:21:14 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7245453319so79095266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 03:21:14 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab090575sm491872666b.184.2024.07.03.03.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:21:12 -0700 (PDT)
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
X-Inumbo-ID: f9cfde13-3925-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720002073; x=1720606873; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y2Pyq5c3UEJKSaNSA8/1Hzf8ynek822m9GVz1fTyUXE=;
        b=dEUiERvAQGqa4aXCQ3ZamN9r9ikRGV2ZMPLIC97n3osKPKmJmBtqI/lOOS7vUlsub7
         GofA8OCwx5Q2qke9n/QB0T79C8EcVN/t5PqYPaToh764e4tBPR7+XfntUI5KB/+YJqN3
         xMrYTv4xEiR6n71N3NNi54aeW6k8GFKTGiF3fVo0ELyzoDtNkX5939ZeKmPqRz/hgHYC
         HcbysoiV/DLX2AacvCaV1e5VkAmIpIxINBCjV+NiMyHRvMnysmLxaXuVxiX53aiyHwnX
         xV1RhpriL1whe1+bbadKkq0UuAMK35Q867UJbJq+AMiAftcNAKL93dBsGxbavXrbpgAL
         EbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720002073; x=1720606873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2Pyq5c3UEJKSaNSA8/1Hzf8ynek822m9GVz1fTyUXE=;
        b=oJTLvYvFccjB+3EDZVDTe//nVWiFviet34l5RqEHPJdnc/GhHeR2HPPXTrWA7Ahjdi
         qvusPNIiq1tbbhQXjs2XpfFxv6kyx4Eg1nW5RVelHZr00IyB3AJAnPbLcOyn2ldMPpNM
         iT5XOKR0Npfl5FAtvSlDjs5i2w3AKEX7/zOO7iSvJyOAR35/E7r8wnYioMnZ2INb/XAu
         vv4YO7pFnk4RAwEWPctSjRMSef5untxdQ/zTA69b/Tg5O64KmTqfI7K2RjcwyglK7zrD
         vs7UxVUnglW6GKP2VXtG1Hx28Z2yMwHDH6SIFvJa3+bRXoLHib1JJsqn54c2jdClXiXr
         B7ng==
X-Forwarded-Encrypted: i=1; AJvYcCXJE0hftJWIJOMlcVrlfQ++XOTJC+yMcxXZgers3beR9JuBzBl4mOGIHLAyMiePwPM9wjN5t4fMLhY6DW4fKKRrhMS7aHi/MpBKBOttss8=
X-Gm-Message-State: AOJu0YwJ5GCsxMtRqyZPbirScZSsKl17cyBJh4aeEMWkO+4y521HO/A+
	biKjQIqbfeJEnABEZ0ATPlbZXUK7YrPoC0+GOl2j7vTFFvXxJRkL
X-Google-Smtp-Source: AGHT+IELXcHGRs3hMtJ43riKDrPmc8o+HSnQ+VJgbhAVx4j0pXvn+Xl/+emiPYFGO6F4fyKzMEr+3w==
X-Received: by 2002:a17:907:97c9:b0:a72:64f0:552e with SMTP id a640c23a62f3a-a77a2441edbmr108986866b.19.1720002073123;
        Wed, 03 Jul 2024 03:21:13 -0700 (PDT)
Message-ID: <a6cdd3605a42be3eaeae1af743e3e3d2670af237.camel@gmail.com>
Subject: Re: [PATCH v5 for-4.19? 0/2] new extra_guest_irqs adjustment
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Wed, 03 Jul 2024 12:21:12 +0200
In-Reply-To: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
References: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-03 at 10:43 +0200, Jan Beulich wrote:
> New patch 1 addresses late review comments raised by Roger for a
> change
> that was already committed.
>=20
> 1: amend 'cmdline: document and enforce "extra_guest_irqs" upper
> bounds'
> 2: cmdline: "extra_guest_irqs" is inapplicable to PVH
>=20
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



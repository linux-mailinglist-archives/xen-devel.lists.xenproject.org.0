Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8C7FAA7E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 20:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642436.1001866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hRu-0001AV-Pw; Mon, 27 Nov 2023 19:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642436.1001866; Mon, 27 Nov 2023 19:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hRu-00017x-Mw; Mon, 27 Nov 2023 19:39:18 +0000
Received: by outflank-mailman (input) for mailman id 642436;
 Mon, 27 Nov 2023 19:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7hRt-0000xu-Fp
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 19:39:17 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a627ba99-8d5c-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 20:39:16 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50aab3bf71fso6332964e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 11:39:16 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f27-20020ac2533b000000b0050b6662220csm1581533lfh.96.2023.11.27.11.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:39:15 -0800 (PST)
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
X-Inumbo-ID: a627ba99-8d5c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701113955; x=1701718755; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PHM+G1lwPknfo1C3GINi4VSZV2dlYS1InrAKROhEkR8=;
        b=WQsRidls+Mq4sWERzXVyyheDC2RVw+ZYGEtVCm+gI/PBwcovAiOTe6P7QIBnZb9iDW
         P2/bV9/H/xOxv+CCLJgbjTfcd6iJfGuiG6VnR0hrxSrYBkSqkDS2V4C9wWl2f3sJC1il
         1GbQcAm6Rwp4537E7ypdt0UcMoHmvvKMlg7K2lwDWHqIBw8Kt42F/NdTegAac+LrsygH
         nU+AzIPbKwHCQKaQwiq+6G1RDmpf3pzS5P/ocmiIpvivoQ4Vv2MocQ3ABqEIbViBLrvz
         TRoDFdoEo57pTpBTJRyQDCe+vekAOrmxOqvwOEPXYlX2YtgBhDJtBYOhgIXwM5SoRQPy
         n6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701113955; x=1701718755;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHM+G1lwPknfo1C3GINi4VSZV2dlYS1InrAKROhEkR8=;
        b=tHf7yRV07hZLHkk4fqFCqGQe4IofhhV5Tu8nYUZAMbYhFzHFmuOZPyyv4BfnzLgF9y
         v6bxZIxRxAdSFIPWsKpX2bOi5sOAXdeWH07rV6I4b/E9P4S+TvcMBUPazZpNMJW148m2
         GVTJm3Vy03ckUC4zUsF6O9NYM6RCbwh6XNa8s8Xi0RKqqgYeSWlD7J9vdiNZ3wtpR0Sw
         4/J0fyl0Uze21Nl/IC4cmKGJSuUrTN0O+/JwOPa2IuF+/nrERZKAAjYtfXu+mYBeOnv6
         DP26FcPxb4dSq7ZtMyrdzy5UE9O/ZMrn9Yy9NhmvlltKJ2NzyH0TgpiPxAHJFDwozLoC
         6uxQ==
X-Gm-Message-State: AOJu0YyMOhUDc6Z5C86pA1NitUR7qrB/5X4TW/5D0qGVZMZazQ2znoB7
	gP+SH1u+jpVIwXE/CfE7jKE=
X-Google-Smtp-Source: AGHT+IGo+KaM6TrWKahR1U5gXW1+a1ILa6w6bPkfM2ogQYBoH8wUPvSd73KaLUe1V2abg9jfTg4Paw==
X-Received: by 2002:a05:6512:3c87:b0:50b:a64d:acf with SMTP id h7-20020a0565123c8700b0050ba64d0acfmr9731529lfv.59.1701113955321;
        Mon, 27 Nov 2023 11:39:15 -0800 (PST)
Message-ID: <ead8e884eec7f0779c29c5d3d020f0283093fbee.camel@gmail.com>
Subject: Re: [PATCH v4 12/14] xen/asm-generic: introduce stub header
 softirq.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 27 Nov 2023 21:39:14 +0200
In-Reply-To: <36211cd7-6b62-40ec-ba1e-110df2653c5d@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <090991be61252cabefc06da19597e3a86a4cd1da.1701093907.git.oleksii.kurochko@gmail.com>
	 <36211cd7-6b62-40ec-ba1e-110df2653c5d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-11-27 at 15:36 +0100, Jan Beulich wrote:
> On 27.11.2023 15:13, Oleksii Kurochko wrote:
> > <asm/softirq.h> is common between Arm, PPC and RISC-V so it is
> > moved to asm-generic.
> >=20
> > Drop Arm and PPC's softirq.h and use asm-generic version instead.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > Added Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> In case a v5 is needed, please drop the stray "Added".
Thanks.

I'll do in case a v5 is needed.

~ Oleksii


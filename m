Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F92D8B982D
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715731.1117581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TAE-0005Ob-Vc; Thu, 02 May 2024 09:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715731.1117581; Thu, 02 May 2024 09:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TAE-0005MT-Sw; Thu, 02 May 2024 09:55:42 +0000
Received: by outflank-mailman (input) for mailman id 715731;
 Thu, 02 May 2024 09:55:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ua+q=MF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s2TAD-0005LA-Ac
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:55:41 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2222659d-086a-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 11:55:40 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2dd19c29c41so95843431fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 02:55:40 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a2e81c7000000b002e1bc0bcfc0sm126302ljg.52.2024.05.02.02.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 02:55:39 -0700 (PDT)
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
X-Inumbo-ID: 2222659d-086a-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714643740; x=1715248540; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZikOErl9JAy5Pr+z4FV6j6OlYGYJ5+bO1a3fDp9xqIQ=;
        b=YAMmDuevWlKvRjf5wKLvqIej83ULusH5XcYzt6IWrMqAS5O3Pd6HiGlZd2ohEdx2+u
         LQUlm5kEbaS0Cq2Jgls/+VOdU15K8fpOHPNGhMhgVDSk2WP0Yb0mbzC7oV9A9gLdMKIr
         qHbMPmCsFV0k+jW/kLnX7Ns5LlU5rslvK0DhCcZTHN6mFYpH5vgQRagPbFq/LPUzz6K9
         zoI/Rqoo42xZsQRTbc8ffjMBkLiBLWCeEQrYOSLdqiIptKZEaz6hE1569QqBgbvb7h4B
         e3X0nVFbNvWNeXd+UuK5IY011OR6N3+xE3GXUVLUkR5YXd3rLOH3wt9aZ2TE/d5C2BKd
         jzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714643740; x=1715248540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZikOErl9JAy5Pr+z4FV6j6OlYGYJ5+bO1a3fDp9xqIQ=;
        b=kY2c5CMLJJw/o5m2xnoz2xOF5eCx1Lo138BrOBKFqHxQlEjClzNoUIJLUs278Z83iP
         PEMOnsUInMhfBaPrvumi021NVjGeRdBN64F9oq/BLN7O7otBuTJldStDvgVSgNqzPAFW
         LvCSfM9Flh6tuu6KNtKZCRQmbX1dwKA0NfEVYAKT7m3+F87OzCMS/Op1F06/uG1Z1h7k
         8NCQXOTrlJlH44Ua8npwQAH8xUaot1xEfdWWBQgmryhdXgTG+eZNdb45XBfBNtoGunJs
         L3sVl6gRHflP1ll332FIwD+vqZiBBL07lJDnjWyIjxfkJzyGdXfCygJ7VJ2+m77oK0Sn
         6bpw==
X-Forwarded-Encrypted: i=1; AJvYcCVNEWBgGAnwfadS1QjXvIW8OSmkvflJzeCLGOnZykq9iDRxVK33SWG73JkXEme+G+j5FGZRWBCyfrGf7a9vAAF0Ga/GGuVFFOtu9JYd5lw=
X-Gm-Message-State: AOJu0YwruYBSxLePHZ966Cweo+/AbGHGX5fTPYBjXftVFaFJfeXyVO3+
	JjUbe262eKNC0hK1+p5YNXDMdFqLH/+MHqXXVn1TEw4Im5V2LMzd
X-Google-Smtp-Source: AGHT+IHqfBrVOAoNPaumpqHvBhV8j90VOt9yI888dE1C0di5BzXiCx2ZbZooisWola07kVCY7Vnk1A==
X-Received: by 2002:a2e:3313:0:b0:2e0:774b:706c with SMTP id d19-20020a2e3313000000b002e0774b706cmr3036308ljc.3.1714643739666;
        Thu, 02 May 2024 02:55:39 -0700 (PDT)
Message-ID: <f2e86e372487bc784be4771369fb71401a4b187f.camel@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: improve check-extension() macro
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 02 May 2024 11:55:38 +0200
In-Reply-To: <7ffd4293-e0fb-4ba1-b538-7ad44a2897ce@suse.com>
References: 
	<6f37ce6b115b682118a8332b2a81b49358c88587.1714144943.git.oleksii.kurochko@gmail.com>
	 <7ffd4293-e0fb-4ba1-b538-7ad44a2897ce@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-04-29 at 15:30 +0200, Jan Beulich wrote:
> On 26.04.2024 17:23, Oleksii Kurochko wrote:
> > Now, the check-extension() macro has 1 argument instead of 2.
> > This change helps to reduce redundancy around usage of extensions
> > name (in the case of the zbb extension, the name was used 3 times).
> >=20
> > To implement this, a new variable was introduced:
> > =C2=A0 <extension name>-insn
> > which represents the instruction support that is being checked.
> >=20
> > Additionally, zbb-insn is updated to use $(comma) instead of ",".
>=20
> Which is merely just-in-case, I suppose, but not strictly necessary
> anymore?
Sorry for late reply, you are right, this is not strictly necessary
anymore.

~ Oleksii

>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Just as a remark: Tags want to be put in chronological order.
>=20
> Jan



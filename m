Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FE805F75
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 21:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648273.1012492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAc4i-0000pg-KW; Tue, 05 Dec 2023 20:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648273.1012492; Tue, 05 Dec 2023 20:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAc4i-0000nP-Hm; Tue, 05 Dec 2023 20:31:24 +0000
Received: by outflank-mailman (input) for mailman id 648273;
 Tue, 05 Dec 2023 20:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WXV=HQ=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rAc4h-0000nJ-8z
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 20:31:23 +0000
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f910f44-93ad-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 21:31:21 +0100 (CET)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5c230c79c0bso2696662a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 12:31:20 -0800 (PST)
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
X-Inumbo-ID: 3f910f44-93ad-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701808279; x=1702413079; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GG6A0ybaQjlEUeE8ZmkduRm/mR67du5f25WPw8uKIxE=;
        b=S0TjEqx3D46R+ryYQkDGTxRXc6TZ8IBW3xgGtHIrrDIMM2OOcA03ugYg8EJysQs4GQ
         uNNN8kkHrO3vAEuFM7SPFczaNq7ZZxAIyicF2UkxgIhvXqdfqIwU5rd3DyxWlnmb//Ih
         qrFhfhl8xvpN4deG54alqgD7ebGlgYHL1JISP0zs7pToabCK0lekbbQ3lxrIuYhujoSF
         Im7ZkCYtnISc6/KA+CQa3hkf/kFKCHj4UPwRiYTtc5O48mO1J/nE9RSZwpkkV3IoA6O2
         kOSZc+f4EO47BDlc3QyT2X7ZfQd75CPcoMCs9t6vJbPpznEBVB6GfS9i9Gd47+L019oq
         rrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701808279; x=1702413079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG6A0ybaQjlEUeE8ZmkduRm/mR67du5f25WPw8uKIxE=;
        b=me/2ktA9ml55KC+CdhR38I+BWdz74UNJ8xhh7cX9jivdARubrtFiQIPOfSUb6F+zYz
         13E92iQihwuR3kkwQ0azOtrFMbG1WB2L10I5P4RLq+AWdE2AXwxYG1GB6S05eyIMSNVr
         oG4kTla+ccbjucf5e8ceOPAhgTfc+89tgl7GiC8CauKh5kZblnaUbHAGGg7WksIBXmSl
         7tYobWiYYARlPOB4AbSwIvJBb1hlwom1gu2dLMB+NKyi5jz9ufzyCJH3JTKo11BzNiWN
         g3Y41X+/Z2jd8/+fT26or08kv+Y1JC0gIjbIG+b/3AeOSzW4lrYY6UzqKpRpsns8PFNC
         F8fw==
X-Gm-Message-State: AOJu0Yx+netQJkbPLdzhfr8Mtj9AqT7bCbGsD+6jY5bQQ1ufKwk1BoxE
	nwZSVdXGWkr7PD3AZ/hH7vOj+VOzYe2q3sbIgovFFvZ2BHA=
X-Google-Smtp-Source: AGHT+IGxH159qtMcFxnxKcwe2y3bRMFWnA6drR0Yv93+4yjlt1Xc/02uf0Qel5xjywIJdIo9AGlngCzbk/C4Eddgtlc=
X-Received: by 2002:a05:6a21:360c:b0:18f:97c:ba1c with SMTP id
 yg12-20020a056a21360c00b0018f097cba1cmr3407193pzb.118.1701808279246; Tue, 05
 Dec 2023 12:31:19 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com> <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
In-Reply-To: <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 5 Dec 2023 21:31:08 +0100
Message-ID: <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt

Is it expected that IRQ7 goes from fasteoi (kernel 6.6.4 ) to
ioapic-edge and IRQ9 to ioapic-level ?

IR-IO-APIC    7-fasteoi   pinctrl_amd
IR-IO-APIC    9-fasteoi   acpi

to (xen 4.18.0)

xen-pirq     -ioapic-edge  pinctrl_amd
xen-pirq     -ioapic-level  acpi

?

THX


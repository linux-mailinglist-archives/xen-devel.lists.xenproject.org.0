Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10C916246
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 11:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747503.1154930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2PP-0006Q7-0X; Tue, 25 Jun 2024 09:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747503.1154930; Tue, 25 Jun 2024 09:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2PO-0006Nq-SE; Tue, 25 Jun 2024 09:24:14 +0000
Received: by outflank-mailman (input) for mailman id 747503;
 Tue, 25 Jun 2024 09:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2LY6=N3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sM2PO-0006Nk-7s
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 09:24:14 +0000
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [2607:f8b0:4864:20::e30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae8b1c2f-32d4-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 11:24:12 +0200 (CEST)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-48f760f89c3so27785137.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 02:24:12 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444e0d07b28sm24550601cf.36.2024.06.25.02.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 02:24:10 -0700 (PDT)
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
X-Inumbo-ID: ae8b1c2f-32d4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719307451; x=1719912251; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q85NcxmGLofdjMmXg1XH3x3ndabt6PeX4B7ikowQStk=;
        b=ciRlMO9sSVHClSRWd2Scw/mjDP6yq2aJ4ilBcLxvvItzWtucZvNfP3A/bnkcTVwxmb
         GpwHhfeGdc8Sz2wPJSIybnxvtqrSfnStCawlWHEexsep0/NiuIHkRjouuPMQ35kErgKZ
         R2EF0qvEh/AI7B6Um5WYYXRgMU7czmTnXnJms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307451; x=1719912251;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q85NcxmGLofdjMmXg1XH3x3ndabt6PeX4B7ikowQStk=;
        b=czaID0xWZIc35ERe3DNF6gBw5fEf+V113ruvL7Z6N4x2KNtXsrRqwftJjg7IblPyAg
         2qxX/42oMEbG1gjzWnZh54iwrQJAQT+JkcWL6ssqiMCNF1yQzpsJSNabJ3/bi3jh/zAJ
         rcUgtdW9dscrWU02evl+EEzCYkiG10kTKyJ2sJt+4XfEZjo/t6RSIu9pR62pcHTghb/t
         ay3cPuoVrN6Eu9XM5L+HqvxY/AQgYuNFrqO7qKj+oeu1mqP9TWsZEsHotaHcQcOMH4HO
         Vkfue9r0Xb1YoCOaxLEyY43jB0PI/iz0g5CyO9PAQHoJKKM+tndcTV/v8Rs2BtrpLaDR
         62Yw==
X-Gm-Message-State: AOJu0YyUWawcrwvIfa6xvBYy+ELEC771hEthuJlqQwWY+QmCacsy4BSM
	DYe7pFrEmcYlu0H/4KmMx1bjHQDlMnjlhkjBx/3KQwIjyqL+fgq9vifaUxSKdcU=
X-Google-Smtp-Source: AGHT+IHtlF0E97JVVSKVN1XDXhSFgPWfvYjROflI0lZlsExELeN4PNhaa8/ebx1kCviwurI9Ab3uig==
X-Received: by 2002:a05:6102:2276:b0:48f:392a:f891 with SMTP id ada2fe7eead31-48f4c0dcd51mr6665001137.21.1719307450852;
        Tue, 25 Jun 2024 02:24:10 -0700 (PDT)
Date: Tue, 25 Jun 2024 11:24:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] gnttab: fix compat query-size handling
Message-ID: <ZnqMuFBb0J9UF2XE@macbook>
References: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>

On Tue, Jun 25, 2024 at 09:30:07AM +0200, Jan Beulich wrote:
> The odd DEFINE_XEN_GUEST_HANDLE(), inconsistent with all other similar
> constructs, should have caught my attention. Turns out it was needed for
> the build to succeed merely because the corresponding #ifndef had a
> typo. That typo in turn broke compat mode guests, by having query-size
> requests of theirs wire into the domain_crash() at the bottom of the
> switch().
> 
> Fixes: 8c3bb4d8ce3f ("xen/gnttab: Perform compat/native gnttab_query_size check")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Looks like set-version is similarly missing in the set of structures
> checked, but I'm pretty sure that we will now want to defer taking care
> of that until after 4.20 was branched.

If we have to backport the fix anyway, we might as well consider
taking it now.

Thanks, Roger.


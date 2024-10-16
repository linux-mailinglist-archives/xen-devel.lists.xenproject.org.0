Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BA9A068D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819895.1233358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10vi-0000RF-Oz; Wed, 16 Oct 2024 10:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819895.1233358; Wed, 16 Oct 2024 10:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10vi-0000PV-MC; Wed, 16 Oct 2024 10:06:58 +0000
Received: by outflank-mailman (input) for mailman id 819895;
 Wed, 16 Oct 2024 10:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaV7=RM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t10vh-0000Ca-Ee
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 10:06:57 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6024226f-8ba6-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 12:06:56 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a99543ab209so976946166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 03:06:56 -0700 (PDT)
Received: from localhost ([5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29816c45sm163512666b.118.2024.10.16.03.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 03:06:55 -0700 (PDT)
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
X-Inumbo-ID: 6024226f-8ba6-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729073216; x=1729678016; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAbe4hvUkRwgjEi8iTKE7EM7ZGW5pSMTbgL8OA+0G6g=;
        b=SwF/tHvYaf4Rh+a3i0PIaGOyWsncdDCO9/G8SHWtkG3S3VE48j/QH4YFdfRz7dqWEW
         PqOCAui16aSdCPZjAdAAyjwIuIhQlfPvY+CQ7Ps7dJCIEIW0ntPQqNH8LFFOnSsngekf
         I4KjFVZokF4EDxO/IeHn6i4jqqPXceaPqfyWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073216; x=1729678016;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAbe4hvUkRwgjEi8iTKE7EM7ZGW5pSMTbgL8OA+0G6g=;
        b=JRubnsdybVbFQSgHbPIqfrlpu4WCXFremUhowAh11TfuQNNAFnGNoYj+E5O47GduQa
         yIHEQzcCq1JMzp1VVwzh7OuLP1RIQYOlx5EBCFlgcxzhBRcM/imrspJO8bcI7/4ygD9k
         Ux3BDrTQRpnO+3GUuSxsqs5OPJcnohcS0etyvpO0rH+nRlCH4klTwaX721AMSc563jWF
         Zx54V+AEzx94YmO9py0CiuXZAo50L3qsqXbvHxa2FmfTA9pKskBQ3k4DOU1dDbNovsMr
         MhnngFxfVWrHmE7MCkNvZUCYTZl3wpmmskH68Wzd9+fc0JwOcujY1YHgwkNkg0K7aJW8
         hTPg==
X-Forwarded-Encrypted: i=1; AJvYcCVuO/NxTPx6QsjZuPyflarXCI0OcqVnrxM13ao/kRIcC8jqkYIiZg1pc8SRube/AF0+K+igjValY20=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywl83MZVFAvnFByVYjMt6wbUq9H/CvGbGtobmPleNJsaav2r6Kr
	tPAFDiN6yDkayCNVwlMbPuF+3uCQOSTpq90YIVJrcljuoV8qo2RaPzveJGignyI=
X-Google-Smtp-Source: AGHT+IHCon9fRFDrHerggsiPyx4AtDw4TVZbH4Nljh4SYZtoZBIaZ3QImbtxwLENLrPIklzxFCHjvg==
X-Received: by 2002:a17:907:e696:b0:a99:61f7:8413 with SMTP id a640c23a62f3a-a9a34cb8a71mr258745466b.23.1729073216076;
        Wed, 16 Oct 2024 03:06:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 11:06:47 +0100
Message-Id: <D4X5APOZBQ8R.3IKLCYY15066F@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul/test: correct loop body indentation in
 evex-disp8.c:test_one()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <ded15010-299a-4273-9414-106579677a5f@suse.com>
In-Reply-To: <ded15010-299a-4273-9414-106579677a5f@suse.com>

On Wed Oct 16, 2024 at 8:45 AM BST, Jan Beulich wrote:
> For some reason I entirely consistently screwed these up.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

We should really give another push to the clang-format effort. This whole c=
lass
of mistakes would be a thing of the past.

Cheers,
Alejandro


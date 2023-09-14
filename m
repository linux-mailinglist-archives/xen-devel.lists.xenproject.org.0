Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC527A0485
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 14:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602253.938704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglrA-00008y-8l; Thu, 14 Sep 2023 12:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602253.938704; Thu, 14 Sep 2023 12:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qglrA-000076-6D; Thu, 14 Sep 2023 12:54:04 +0000
Received: by outflank-mailman (input) for mailman id 602253;
 Thu, 14 Sep 2023 12:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qglr8-00006z-7g
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 12:54:02 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6a3cac9-52fd-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 14:54:00 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31dca134c83so851519f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 05:54:01 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l12-20020a5d674c000000b0030ae53550f5sm1696614wrw.51.2023.09.14.05.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 05:54:00 -0700 (PDT)
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
X-Inumbo-ID: c6a3cac9-52fd-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694696040; x=1695300840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fIdEKLlpStFbhdTngXUP8mtVIOLstyQhn1zuKcQbO0Y=;
        b=XAAkPGy61K+D8OjFyuZGfEHe2I2n+iyS3EZkdfYkIHjvMStTLseoFMSRKwmzKDPMpB
         6ww1AayuQiVQvO2pa/eWIoCdcHxK4qXC3OPiY6Iz5Qp26Vyk35d1SVq+wEXbZNpk2W79
         Lb4yhPuChvCLb9F7ivR4qCCQ0CccHq4Bp8y24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694696040; x=1695300840;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIdEKLlpStFbhdTngXUP8mtVIOLstyQhn1zuKcQbO0Y=;
        b=LGyHIw3FbvuFZj81eoDokRbwXhc4uT38UvcFO0CdHbxmRvpeBslPf4CljibQ43Gaca
         DvIY3JnpRkE77Nchsit3qKJAnUbz+sf/8/D3KzWQglzX6la4DXO+/Ku7UeK6X0ZUGXW4
         HCJ9xrHJPTy1hgDsnh0TIlXghfM6nf3z1368p/MVcouosi1Ojo/lE9FGs2pSQIJKEgua
         4BcOsPvPAdKb66cgxzUwMKo3EkoHmi1I91rCHG6mdoWZrAzF8mZhvYNVKjvRL5I1VFeq
         EbaIGE46Cn21N0PF/+Y/Li/hBnMVQaUpHRYLvVvnoSRc/ihi6pBgdU/JRlIyGAaRp1dJ
         94XQ==
X-Gm-Message-State: AOJu0Yx+S8mO6xs8H7A2zLfCdQUKO5V2soSjXqYmxDyDUbPXPhIn3s9b
	TD2HwEM18ySfM3jfCsk2al7HDTg/8Suc3uk4Yds=
X-Google-Smtp-Source: AGHT+IFpFTRDLOwmTxdMfhx2s2UyVVD54VOeYh908L/vX4+On1UNa1sOvDf0TYycK7FtB2QxglzawQ==
X-Received: by 2002:adf:f60d:0:b0:319:6896:6e8e with SMTP id t13-20020adff60d000000b0031968966e8emr4355974wrp.62.1694696040645;
        Thu, 14 Sep 2023 05:54:00 -0700 (PDT)
Message-ID: <924654cf-f269-2a5d-696b-0e2d9bcc7d40@citrix.com>
Date: Thu, 14 Sep 2023 13:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Sol=c3=a8ne_Rapenne?= <solene@openbsd.org>
References: <20230913145220.11334-1-roger.pau@citrix.com>
In-Reply-To: <20230913145220.11334-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2023 3:52 pm, Roger Pau Monne wrote:
> OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
> Invariant, and it will then attempt to also unconditionally access PSTATE0 if
> HWCR.TscFreqSel is set (currently the case on Xen).
>
> The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
> the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
> TSC increments at the P0 frequency.

"TSC is stated to increment at ..."  would be slightly clearer IMO.

>
> Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
> because the PstateEn bit is read-write, and OSes could legitimately attempt to
> set PstateEn=1 which Xen couldn't handle.
>
> In order to fix expose an empty HWCR, which is an architectural MSR and so must
> be accessible.
>
> Note it was not safe to expose the TscFreqSel bit because it is not
> architectural, and could change meaning between models.

I'd suggest rearranging and adjusting these two paragraphs.

---
Furthermore, the TscFreqSel bit is model specific and was never safe to
expose like this in the first place.  At a minimum it should have had a
toolstack adjustment to know not to migrate such a VM.

Therefore, simply remove the bit.  Note the MSR_HWCR itself is an
architectural register, and does need to be accessible by the guest.
---

>
> Reported-by: Solène Rapenne <solene@openbsd.org>
> Link: https://github.com/QubesOS/qubes-issues/issues/8502
> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

For the change itself, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>


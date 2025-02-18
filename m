Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B3A3A01F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891721.1300774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOkT-0001S4-9J; Tue, 18 Feb 2025 14:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891721.1300774; Tue, 18 Feb 2025 14:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOkT-0001QM-6i; Tue, 18 Feb 2025 14:38:57 +0000
Received: by outflank-mailman (input) for mailman id 891721;
 Tue, 18 Feb 2025 14:38:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6eQ=VJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkOkR-0001QG-R1
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:38:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 138d266b-ee06-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:38:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso33646675e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:38:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a0558e2sm183826145e9.11.2025.02.18.06.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 06:38:52 -0800 (PST)
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
X-Inumbo-ID: 138d266b-ee06-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739889533; x=1740494333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6dZgVe8Q3pUjMU+Nfk+MsaSEUwQM2cCyHwNGXoPYzpA=;
        b=BjhoEEaDlZMfqJsekKw6eak2pTs5bmwKE3pftFn4V82NIjyftJXtOXH6PmJlZ5Xx5w
         S+htjQefb9i/UbO3enVyPuzAkNpbfsfJBNpmSwW5w+FvtXlz+b47DGLnNYrosPWYWECZ
         K5is79MKBSD/+I5vMwT01d6Bgf0H6ILnL6kCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889533; x=1740494333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dZgVe8Q3pUjMU+Nfk+MsaSEUwQM2cCyHwNGXoPYzpA=;
        b=Z1Tg02s01buJeHFJaFo26Ke3QYGGb9ynPGfIu2ccd5apG7mTe/v/BEi8HnNR0DLDkS
         ILjn5avi+WM8gds/Ffyd/D6eJKhcnZiNU9cvfbamuio8ZKwRzTODFSx+KqJPjDLkqZOf
         L6lLc9eKnVEFvig8VLwdSwaEq/MZNU+7znxjX7lYj4LXqZypoI+2veJyePToHuGwccB4
         cr1DELqYod4f+QxUk7Jz/SIdAbD8Y84O8SxMDr9W42XZBPCsAPB/ePC3SXQrls6dg/9C
         ZgsAcG+AQZqe0SvgvhPkui4WMbaWzgJ4V7p10v2hysF22sbge6jFdG/dk5uoQTekP65X
         G5vg==
X-Gm-Message-State: AOJu0YyDbrs1jrXgzD/y9cBa8p7PEpcspeh+SigDjY9lEqCr7n4cNM2B
	qntN+BabOlZ4ZjgtQSK9aMkA30k1VuPSnWPCvoWFHpsggU7pk9Rmmj6pCm35Wkw=
X-Gm-Gg: ASbGncu7ayAMUEkB8eDokYF8HDGF6mSD4qh+ulzpxVR/O6yb9B7NiDgUu5uPPFqRFG0
	1nHZIWfCdtytCFRSUpvjglzdRbNVDQhJh0v+cUTyH56nv9FlunjEBKb6Bunl0skqIqZE/DzkHgk
	8bCoUeAU0isLEMR4GPjbukMMEidK8Jtp8D4Iv/QsPBMGBRdkcnh4lrmkDApXrcEvVaAD094q4Ed
	Bxs1hewrkmO4FOWgfdjL8H2tNbqCmP6Ht7bwu+aElvElkS5WFNBy9uWYYC5PctQ8rBhJIcU7kRS
	GGvg/OYshRx+aHybs98o6WvrMayvuhoH3IxST8nZZLZ3PPJclV+fPKc=
X-Google-Smtp-Source: AGHT+IHwtoDoUxgncHmK57cdoMTTnP6z/kwbdnzkBSO+H9c/bmqs3v8DR4uSyudwhD+9MFZGCwI58Q==
X-Received: by 2002:a05:600c:46ce:b0:439:5fbd:19d2 with SMTP id 5b1f17b1804b1-4396ec7c92amr121807475e9.10.1739889533249;
        Tue, 18 Feb 2025 06:38:53 -0800 (PST)
Message-ID: <5d518271-17d3-474e-b27e-d553f5004d84@citrix.com>
Date: Tue, 18 Feb 2025 14:38:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools/ocaml: Fix oxenstored build warning
To: Andrii Sultanov <andrii.sultanov@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Christian Lindig <christian.lindig@cloud.com>
References: <cover.1739546412.git.andrii.sultanov@cloud.com>
 <0545259ba8f7c54b6fd6c82b185bdee475694747.1739546412.git.andrii.sultanov@cloud.com>
 <850c2854-17ee-42d7-856a-44604f755941@citrix.com>
 <CAAa3AOOYpak4987-7H71CpaBcHyHOOYUL0w6rqVDM17yTvTYJg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAAa3AOOYpak4987-7H71CpaBcHyHOOYUL0w6rqVDM17yTvTYJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2025 3:47 pm, Andrii Sultanov wrote:
> > What's this hunk for?  There's a change in poll.ml <http://poll.ml>,
> but I don't see why
> > it would need to change this list.
>
> Otherwise Poll doesn't pick up Utils as its dependency - I guess
> before it was always independent and didn't need anything like that

Ok.  R-by and queued for 4.21.

~Andrew


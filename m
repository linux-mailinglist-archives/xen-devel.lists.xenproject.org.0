Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2245A7372E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:44:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929816.1332573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqLC-0005z3-Cj; Thu, 27 Mar 2025 16:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929816.1332573; Thu, 27 Mar 2025 16:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqLC-0005wT-8d; Thu, 27 Mar 2025 16:44:26 +0000
Received: by outflank-mailman (input) for mailman id 929816;
 Thu, 27 Mar 2025 16:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txqLB-0005ca-BC
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:44:25 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd1342bd-0b2a-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:44:23 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so1021159f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:44:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efdff2sm43301515e9.17.2025.03.27.09.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:44:22 -0700 (PDT)
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
X-Inumbo-ID: bd1342bd-0b2a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743093863; x=1743698663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QIjQjFZyHuRT6DMwVLx62NFKgmb+SgUuqvtV7bn506g=;
        b=Cz2TTdTVABqLfdjGrCz7gGrVK1t2d0H4RNY/roXmcZBLaDxa0SPTC5+Lt6HsdjXZET
         45mG4TmgNza6d0I2hJQQ7Soune7ml4Ozmh4mjYQ2GJZyPYxQirDGj81Zqwo8Tztlne7T
         2sml2xPk7j/UR2S4ji2xnNXm9VwjSapR5S0IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093863; x=1743698663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIjQjFZyHuRT6DMwVLx62NFKgmb+SgUuqvtV7bn506g=;
        b=dbKjrHs8ta0dm0LqY8oMCcUopZXBV+9Zn5YjMLXdnLdUdOVh7CGhGDIm3aV//SQwrw
         eMp8FqJA6zpDf6hoML/yodsoJ/9BV4hJLofq5aQPO1YEMjPTa3oBZUUjwLKh1Rx47/5T
         LVNY+2fZzlYuQ0aUQe7MPPzC3GcO5p+KtUXMu4Qy3lDzP1kMYXuyQ0yss0cqfKH7sdka
         OrwCQoMrrhYSfoyjyLIFcU+NhspSg7/YSqjpN4qdwE3t/HeGtDvwCKQMjeK1Vb+KJUwA
         mg3ohXHOtTJE2S88duqLxCebno+CekricPCM+v2FBHoO2JYZxTi/TzZaJSMliWeLAxmU
         NEqA==
X-Forwarded-Encrypted: i=1; AJvYcCUqlJOEzck6fAvppr90gSWy3i6zCFUJkoHXWwtZEnA7aNmUyKjKZpxYV4dGezdvwuPOZnuQ+QMQHdg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXJhWFIyKx8LkIPRwyEhayZNNTspzPKfmEhX0n29knBmxGGlB6
	22GqGSMaUKrBSFauy552Q45eMHFBbdu601nF3S01hpOd24gTpyyREODao1Cihck=
X-Gm-Gg: ASbGnctBhUQhP7ekM38w8oV6j4iydyQqbTWl0jNblm2bgtpa+NAgTMHWGoAXkwUPBmo
	mOG9aXlLjR5Mjj8+ZksEgLcVlW9Y4OxqFid2MYGeGNtgTlnAABOA/+oMqYGiUhZ1ffY+D9a1+U6
	G4LBSy57HDlCDnDPRmjlVaFV+ihGY/tuSg3jk7GnbP8tJ4xwUXa2AK4xSdq3mrrMvhvTioMMGnG
	Mj4LYzgxv+ow2BDmTmtDvhEf4vfPDttE4msZsdTwkoySNd3km7W5EsD5OmkQJ83H0a33h3kn8MX
	opb7atKyqEcT8E7nRIooroDzZrSVqppN6XcqX857KH/TNID0I2JM1enBn+F1KNnx6KxUJ8pyxY0
	sLzNXB7WI0MpW0XyzVl0K
X-Google-Smtp-Source: AGHT+IHPiOce3TD7UnuZvoDUtYFJvEdDWlMnXmTywPdBOG3GiQdJGUpGiL0PT9XzoTAI3mwVl+1/Kg==
X-Received: by 2002:a05:6000:184c:b0:399:728f:4673 with SMTP id ffacd0b85a97d-39ad174c7d9mr4140455f8f.33.1743093863240;
        Thu, 27 Mar 2025 09:44:23 -0700 (PDT)
Message-ID: <f79117a2-1763-4458-862f-a5219b09989a@citrix.com>
Date: Thu, 27 Mar 2025 16:44:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Xen: Update compiler checks
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250327163114.405824-1-andrew.cooper3@citrix.com>
 <d56b2e8f-58ca-4a7d-a8c2-59de9d1c9102@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d56b2e8f-58ca-4a7d-a8c2-59de9d1c9102@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 4:39 pm, Jan Beulich wrote:
> On 27.03.2025 17:31, Andrew Cooper wrote:
>> We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.
>> Remove the one from compiler.h, as it's pointless to perform in addition to
>> the xen.git-wide one as well.
> Isn't this premature? The Config.mk one doesn't terminate the build, according
> to what there is in the post-commit-message area?

It's also broken for cross-compiles, in a way that I don't have time to
fix now.

I'm going to leave this as a 5.1 baseline across the board, and
reintroduce the xen/compile.h one with the per-arch nuances.

~Andrew


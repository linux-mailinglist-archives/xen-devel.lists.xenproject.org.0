Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A1A9BBBF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 02:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967056.1357031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u86p1-0007ln-8r; Fri, 25 Apr 2025 00:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967056.1357031; Fri, 25 Apr 2025 00:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u86p1-0007kJ-6E; Fri, 25 Apr 2025 00:21:39 +0000
Received: by outflank-mailman (input) for mailman id 967056;
 Fri, 25 Apr 2025 00:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u86oz-0007kD-Oo
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 00:21:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d3c860b-216b-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 02:21:32 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so1999287f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 17:21:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5d264sm699788f8f.95.2025.04.24.17.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 17:21:23 -0700 (PDT)
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
X-Inumbo-ID: 3d3c860b-216b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745540491; x=1746145291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk6H0e+9GJica8QkgR4gZVIscIty2mo0HB15NcL001U=;
        b=WUnd20kZYwVkajo0P5xbmMs2GkddLmHkyQkn1+CiGMvbZMeJwy0i96XfG1pmz1x2YX
         nSuJB8YzScCcooK0otd7p7HSf0O9vyB+7qTtFaLtpOVJJjZEJKx9gw2sjZjVXHO/6ZDj
         tVxT+wSjk/NpveKJfzpipZFY6DoYxHyIcuMVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745540491; x=1746145291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk6H0e+9GJica8QkgR4gZVIscIty2mo0HB15NcL001U=;
        b=TiMzc/tZ4B6Mn88r4VQv+xKwbxSOAskdPcaH37JDMtjSyBIMruwd+XuH/QmjYxCRm9
         5/ikaOav2Ahefgb1SQNrpoG/lPzhI5F5wlUobGuHXjBQpQkrXXKaToS9E+ik9pOVtF1s
         k4UG8eeBDIOK7hGq121TZjF+pRDlBD8Q2T6VKaY/0ncmG8y8VsSThQeJaigIlhIRAE50
         8uvs2HHqE0NJ1vgIqDa+u4M+lvIY+zhj1On8rSE2ikyCLTX9hXbPWFtiuK1XENLwTOgJ
         ukQY2/8Q3wcIr33EMi7rrq0SGGRTfv+gKWKxILAcqcT8PPsU9l2KDJe3esNX11Sr8XkA
         u0SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAJUycmpaD11TuYbeu+jDxYQ0iRfLBA52759hoUCetnycmI1ng7in5gobp5iA5hL66zzvmmMZ72IU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxha3r9SPNFnmgiYG9SCHKKD/dwEMyJoHuobRMrPfiKaL/y5elq
	9qHx1lnaOYS047xuHhTXURDj0hgxG45R3+jOr+FJ2XvLpzs9tU7Lfgegp2cXwDo=
X-Gm-Gg: ASbGncv1ZgbHbgISkuvgOC1TUvBk30VX9AWwkEDE2vEKy39zvPSt6EBGopSC8Le2fWF
	l8NajAwKFFx+SsXwRVljb2VHz7A9CQdbtnZjlnQrWZWsRLXudMHHs73eUEGz0Gk0D6P6y3H2r9y
	pr4/1pEteDnEsBujIsqKDEZqDqH0IF5rVPKfWd4OHZ5J/RR3xz5GZsNVpm719dnuqBmmAVZ5HOj
	ES89t7WTMcuMVFwfLKTWNUKHS3rcMJhTLtaSy3dNMWukI6OZ0ajjx3GdfGMvk/Koa1aXYOMG/dA
	j0bilSHtY5oYVruulq9c8HhAgqoCew8z09pJZc2fWqjc8K62qNALjMteXsE0EBztkjBp8Ucxe1p
	o4UrFNQ==
X-Google-Smtp-Source: AGHT+IHqFOSCfu/XNN9VUutcNZgua+Tp1fWjvB5fXbS5niXgPEwOiZEU/+DAVTXmQ6ole2CleGo8Ww==
X-Received: by 2002:a05:6000:40c7:b0:39f:d13:32a with SMTP id ffacd0b85a97d-3a074d4f2c9mr98182f8f.29.1745540484401;
        Thu, 24 Apr 2025 17:21:24 -0700 (PDT)
Message-ID: <bc0fb7ca-92f5-4625-9c73-a6d743f4a306@citrix.com>
Date: Fri, 25 Apr 2025 01:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: update list of GCC extensions used by Xen
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <da508095ef2ac0024dfe9f51d9da976da0eaead7.1745441038.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2504231354540.785180@ubuntu-linux-20-04-desktop>
 <76b7438b-9459-4f41-ab18-b777f7b3fcff@citrix.com>
 <1d362e4df1e0b483c31fdab4384f57f0@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1d362e4df1e0b483c31fdab4384f57f0@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 8:27 am, Nicola Vetrini wrote:
> On 2025-04-24 00:46, Andrew Cooper wrote:
>> On 23/04/2025 9:55 pm, Stefano Stabellini wrote:
>>> On Wed, 23 Apr 2025, Nicola Vetrini wrote:
>>>> __inline was not mentioned in C-language-toolchain.rst, while
>>>> __inline__ is not used in code under xen/. __inline is kept because it
>>>> may be used in Xen. The ECLAIR configuration is now consistent with
>>>> the
>>>> documented extensions in the rst file.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Hmm.  f96e2f64576cd
>>
>> I take it that patch shouldn't have gone in then?
>>
>> Regardless, now that we're putting it back in, we should put in both
>> __inline and __inline__, so as not to need to come back and repeat this
>> patch again.
>>
>> ~Andrew
>
> Did I miss the addition of __inline__ here?
> https://lore.kernel.org/xen-devel/20250422113957.1289290-1-andrew.cooper3@citrix.com/
>
>
> No issue with adjusting it as you wrote, but my understanding was that
> only __inline will reenter the codebase.
>

Sods law says that if we introduce __inline now, we might have
__inline__ get back in too.

For the other keywords, we cover all spellings, so we ought to be
consistent here too.

~Andrew


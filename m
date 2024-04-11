Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6538A13EF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703873.1099787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rut9G-0000ND-1O; Thu, 11 Apr 2024 12:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703873.1099787; Thu, 11 Apr 2024 12:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rut9F-0000LU-Uq; Thu, 11 Apr 2024 12:03:21 +0000
Received: by outflank-mailman (input) for mailman id 703873;
 Thu, 11 Apr 2024 12:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rut9E-0000LO-Jm
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:03:20 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba47031-f7fb-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 14:03:18 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-69625f89aa2so58752526d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:03:18 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v7-20020a0ccd87000000b00699413a7386sm840800qvm.114.2024.04.11.05.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 05:03:16 -0700 (PDT)
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
X-Inumbo-ID: 7ba47031-f7fb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712836997; x=1713441797; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LxturFcWGF36/BJIIfle5Nqa6xO8AQ0l0Wiw5My3GGA=;
        b=Ri8uACP1DHuyXY0IZJg2M8BUoDabRgi4LBsAqnoQykxEjp59Wv2laJJwlUGW46KYc7
         PeCBGBGPeOn16qmz9cyThj3HEN/lsVj+lHX274Zd1obEmaKMKiPfwFBmI5G2ZR+6tP2y
         d/aVgs/YbRAyv2/A47HGJp2KsS/HxMg2+iGVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712836997; x=1713441797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxturFcWGF36/BJIIfle5Nqa6xO8AQ0l0Wiw5My3GGA=;
        b=lROsV8WRExFwGVDueXy/ZJINJZXIX87gBiuH4Tz1jRq0+PcWoPIPnK6Pv1KpyzhPaO
         7QIfs9Ok6hqKxyW87WGOo6hXgLDpe3N+E2+gQhg5ROABaQsDpnSmIH8TtJnE5Ui8kBGS
         3m9iEPB4FBH/iQv1P5sP+eF2pl8y1mYJF7es1zwP6zxdf+rwUMm3sGQTUlhxhWDguvNi
         VqlYZ9bp8yHyGOjWvF0c21RyXgowtk+ulT4KcBoXgUw+zU0NXf2uD6eqHvTyOPZW7xi1
         dEkzYeCwaxv/TwPidQAxg4NkWxE1n26Ga/NGn3JD6rA+4Iy3mT7rDSMxxotrSzbbO0Rx
         Y4bg==
X-Forwarded-Encrypted: i=1; AJvYcCXSH6Kv7OWaUsI2WQH24UA8+YDq6YjDCBqfamyzk9dGsIINinYev5CZuHYYDZdLXrbuGu4UAzhGX5Dt2+mz9CEihLFbIARWZi/eU/367qU=
X-Gm-Message-State: AOJu0YyPYgELW1/4/q1wtBXfRlS8YZrHGv5B3hpQam1bo9a/WV76nmup
	zXgnyAGN2rOyO+8L2qKTnX3l/UHFXqjjwji1HS2S+UTxttC7bmVDMbRY3h16/b8=
X-Google-Smtp-Source: AGHT+IFuJRWSDmUu6YZs5RpKYwGWM8dxWQvRVzmmaaLOY9emfmFZ0nds4mDd2XZ+eh21M36d8nnhzg==
X-Received: by 2002:a05:6214:1c05:b0:69b:1fa6:e88e with SMTP id u5-20020a0562141c0500b0069b1fa6e88emr6503761qvc.30.1712836997349;
        Thu, 11 Apr 2024 05:03:17 -0700 (PDT)
Message-ID: <dd6ad7c5-bf99-42d4-9082-9ff87185705c@citrix.com>
Date: Thu, 11 Apr 2024 13:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/9] x86/vlapic: tidy switch statement and address
 MISRA violation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com>
 <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
 <e847ee06b76b816a62a555dfa6d52a4a@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e847ee06b76b816a62a555dfa6d52a4a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2024 8:45 pm, Nicola Vetrini wrote:
> On 2024-04-08 09:32, Jan Beulich wrote:
>> On 05.04.2024 11:14, Nicola Vetrini wrote:
>>> Remove unneded blank lines between switch clauses.
>>
>> "Unneeded" based on what? We're carefully trying to improve
>> readability of
>> large switch() statements by adding such blank lines (at least)
>> between non-
>> fall-through case blocks, and you go and remove them?
>>
>> Jan
>
> I wrote that based on this earlier suggestion [1]. If I misunderstood
> the suggestion, then I apologize and feel free to strip them if you want.
>
> [1]
> https://lore.kernel.org/xen-devel/e40579ba-acae-4c11-bea1-a5b83208db10@suse.com/

I'm afraid I also can't figure out what that suggestion was supposed to
be, but we definitely do want to keep blank lines.  They're specifically
for improved legibility.

But fighting over spacing like this is a waste of everyone's time.  I've
taken patches 1 thru 7, accounting for the suggestions made so far, and
adjusted to retain the blank lines.

Please double check carefully.

Patch 8 didn't apply because SAF-4-safe has been used for something else
now.  You'll need to rebase and resubmit patches 8 and 9.

~Andrew


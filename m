Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED3688EB61
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 17:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698653.1090623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWDh-0003kt-Mk; Wed, 27 Mar 2024 16:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698653.1090623; Wed, 27 Mar 2024 16:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWDh-0003ic-K5; Wed, 27 Mar 2024 16:33:45 +0000
Received: by outflank-mailman (input) for mailman id 698653;
 Wed, 27 Mar 2024 16:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df3K=LB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rpWDf-0003iG-P3
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 16:33:43 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c55a8530-ec57-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 17:33:41 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-789db18e169so519148985a.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 09:33:41 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i9-20020ae9ee09000000b0078835bfddb8sm3987044qkg.84.2024.03.27.09.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 09:33:40 -0700 (PDT)
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
X-Inumbo-ID: c55a8530-ec57-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711557221; x=1712162021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JekyNzqDCw2jVjiiUkO/8dWtZVufWRLeqxN4jv/YZPk=;
        b=L0oKNkdzVxf38eME3HDgdVpMXGIkgMSPJTciwfS6l3Nix00Jo3ids7X9rUdOS6nVTJ
         Pl43H//KF1wiDv86BKTpCxY4T+fIMFUSRgiDI9+d5NiP/C0dnI9vWHUCgkHIcde8ZBtG
         IcvqEyXu3OJd2yXfZHbXhyud4QgIAZxCIqHsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711557221; x=1712162021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JekyNzqDCw2jVjiiUkO/8dWtZVufWRLeqxN4jv/YZPk=;
        b=L5EgJn1YtHytc7aHGSrtdvqJK2l8GOI+xTsQ9/xulxxD0rHR5XOss9/6vdJ/md78Rl
         7PdRlT68nHXnBZgkBsBIU1B4opjA410R/1boulf2GifzXmaRMSh5le2SanpV+3bxuVsf
         d9FmJysWD984pcBItm8S+E0IYmVsY5PT5cjuqmMCWU1+Rz+pbD7jwlJMD5nMiVDIAzST
         gBl2cWv2LI864cswnIsnd9NnfO08ok1T8gBW56xXqECyz6lTXgNE2Suq9JWbGnX2O71k
         QdyeB1KHN6cpDUnS9EE6pA6SVAytoqcoUiOqBeWX33o2eS889HFoEsnZAwKSbjewgtVf
         aJXw==
X-Forwarded-Encrypted: i=1; AJvYcCUOXIjhfUv4qDyJ+K8IT3bAkazB5bjO4kG+Yk30ntAiImB6CI0NZy8R08LQcUtzDzeezpWy/UWbVnADxB4bzK34vZSw1roPI4RTtwlcsPY=
X-Gm-Message-State: AOJu0YyF8wNOIx4Sda8uqAH71jTIgXeBJ417IPW2Ce5ZdAycqArAgq2l
	DMI5Lp2/JuOPbfIIWr7MaI379CeAKQ8kOiKpQLTuUH2OEImkM9LmTqeI6Synea4=
X-Google-Smtp-Source: AGHT+IF4NFIzpxNduGrvaGluWbCWqtnP/3Q/4w0Z1YqhpET/5IhJwAEAPqFUjXa5UHVo5pJhNkTuVw==
X-Received: by 2002:a05:620a:1d81:b0:788:56c0:6006 with SMTP id pj1-20020a05620a1d8100b0078856c06006mr86058qkn.4.1711557220804;
        Wed, 27 Mar 2024 09:33:40 -0700 (PDT)
Message-ID: <53de7e8e-141a-464b-bc4e-89928cee9c75@citrix.com>
Date: Wed, 27 Mar 2024 16:33:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tools/ocaml: fix warnings
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <bc752eab0aafd7981634e4f5be7a53f49e1f3cef.1711556875.git.edwin.torok@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bc752eab0aafd7981634e4f5be7a53f49e1f3cef.1711556875.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2024 4:30 pm, Edwin Török wrote:
> Do not rely on the string values of the `Failure` exception,
>  but use the `_opt` functions instead.
>
> Signed-off-by: Edwin Török <edwin.torok@cloud.com>

FWIW, Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

But I think the subject wants to say "in config.ml" and the commit
message gain something like:

Fixes warnings such as:

  File "config.ml", line 102, characters 12-27:
  102 |         | Failure "int_of_string"   -> append (k, "expect int arg")
                    ^^^^^^^^^^^^^^^
  Warning 52: Code should not depend on the actual values of
  this constructor's arguments. They are only for information
  and may change in future versions. (See manual section 9.5)

I can adjust all on commit.

~Andrew


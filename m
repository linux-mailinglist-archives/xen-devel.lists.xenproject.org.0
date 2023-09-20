Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCB7A8D04
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 21:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605955.943606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj33i-0007IH-9m; Wed, 20 Sep 2023 19:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605955.943606; Wed, 20 Sep 2023 19:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj33i-0007G0-6v; Wed, 20 Sep 2023 19:40:26 +0000
Received: by outflank-mailman (input) for mailman id 605955;
 Wed, 20 Sep 2023 19:40:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cdA=FE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qj33g-0007Fs-Sp
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 19:40:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89d09194-57ed-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 21:40:22 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso745785e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 12:40:22 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b004052093a8f6sm2877228wms.25.2023.09.20.12.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 12:40:21 -0700 (PDT)
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
X-Inumbo-ID: 89d09194-57ed-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695238822; x=1695843622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V6erepfC0BGUXfMlGteVyy1mUrgncnvunw9VqXOpwzg=;
        b=SGz6eNoK2fdMoZ3Rs5+FhYDZNxuCx/9Y/MOkpVDOCFe7iH9ncQrjELaTvGeyXPh4ov
         57pz8M38skNjxRlv1fzMFH0tDJYHv9il1e0oeWyLJee7BniiAlrRGEFHNQL9Nnj2lPmr
         czbce5b+AHMTk9m9JcE+TNTMoWKrPBHqSPmAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695238822; x=1695843622;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6erepfC0BGUXfMlGteVyy1mUrgncnvunw9VqXOpwzg=;
        b=QgfYi6F2pthYJcE81eQTQ9tvt5xfe/NZ0UmXE+7WUn8ooF4krjDC1bppxL0KqZ98jb
         OyCqqQ7xNeDEH3ZYParUzH2TwFc5NaqxK4jJWN7kX7/Nch/wlkut4WkLsHYjl/FpzeDW
         pT8gG4IbfTMOwibjzB9rXU67LAhyem4bNC5kqklb3asnBOJOk/i8hJ6n66tElA9TLM9H
         alOmDSOI/uEa10AdtltT590+yzjpt/BlE7kbZFB13mCO5eYmkvkRtk6pLpXumCnxs2SJ
         JSxWEpe8AS3PtJ/S47NLKdDnsPPUjevTpEOutvDYp69GGSXuSTmfDAT1exTjlgGoJTmq
         sfVw==
X-Gm-Message-State: AOJu0Yzv5J+mT+2TXtr6WeZgU4iaaeMiNIKSe7fH/kLMM9lww6GY/aKn
	zst2SE8HG/ntKropg1PJWPrfhg==
X-Google-Smtp-Source: AGHT+IEPm4hfp5bUd0onFREco4y6pzuu6/zP/ve650/Uejvso0KdOeJrvg7o1dZ/m/wjFSPoMbYQgQ==
X-Received: by 2002:a05:600c:2ed2:b0:405:2d29:1648 with SMTP id q18-20020a05600c2ed200b004052d291648mr138018wmn.19.1695238822198;
        Wed, 20 Sep 2023 12:40:22 -0700 (PDT)
Message-ID: <e878bca9-74cc-d16a-134e-e4728ad0212d@citrix.com>
Date: Wed, 20 Sep 2023 20:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3 4/4] README: remove old note about the build
 system's python expectation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Javi Merino <javi.merino@cloud.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1695104399.git.javi.merino@cloud.com>
 <83e6857f16eb000f8368fcd9995e0411f0177c2e.1695104399.git.javi.merino@cloud.com>
 <dff889ef-ec24-2cac-5565-18376f5e331b@suse.com>
In-Reply-To: <dff889ef-ec24-2cac-5565-18376f5e331b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2023 7:50 am, Jan Beulich wrote:
> On 19.09.2023 08:30, Javi Merino wrote:
>> 5852ca485263 (build: fix tools/configure in case only python3 exists,
>> 2019-12-11) changed the configure script to test for the availability
>> of python3, python and python2 in that order.  It sets PYTHON to the
>> first one found in path.  You don't need to have a symlink to python.
>>
>> Remove the outdated note from the README.
> But that note also covers the hypervisor build, which isn't affected by
> ./configure, and even less so by tools/configure.

The hypervisor build equally doesn't python= specifying.

~Andrew


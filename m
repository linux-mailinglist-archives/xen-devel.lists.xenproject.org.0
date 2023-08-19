Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0B2781A46
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 17:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587064.918409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXNRC-00076r-E0; Sat, 19 Aug 2023 15:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587064.918409; Sat, 19 Aug 2023 15:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXNRC-00074D-Ar; Sat, 19 Aug 2023 15:00:26 +0000
Received: by outflank-mailman (input) for mailman id 587064;
 Sat, 19 Aug 2023 15:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drps=EE=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qXNRA-000746-De
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 15:00:24 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eec4d2d-3ea1-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 17:00:23 +0200 (CEST)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a76cbd4bbfso1324543b6e.3
 for <xen-devel@lists.xenproject.org>; Sat, 19 Aug 2023 08:00:23 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 ff17-20020a056a002f5100b0068713008f98sm3286260pfb.129.2023.08.19.08.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Aug 2023 08:00:21 -0700 (PDT)
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
X-Inumbo-ID: 1eec4d2d-3ea1-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692457222; x=1693062022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ovKoIVT6BwtqLiCJEBaRoz3aMugrFyQ7y69ihWvWmQQ=;
        b=TOgyAOQai5VElim3UpX4kzHAVHkuwgRj3qT2RdJ9DspEohZDqhwRoBQvHUirBZoKoO
         0QkdbNzdFkDca7LweZI4cbEdF+AacOwcNmbHtYjsQosen/81c3tV+EAhyuZeAHT1vGt8
         kcQOyMKye+U5B2095yzgi2dUfDTCpnP9Kl75iJ/J/x38Xalrg5d7puDCBoO0VJ6BGHsb
         ttOYaCvaIfG5RvXc1mk2ys7sb9HlrdBsvZyS1Qy0kw6Nlbaex0ZHvjr4v5gGvDpfFofX
         h3nxn56Sf2QvdbTWB0jAA9MUXQL18shLPo/stvw5gLJSe7c4y4Vl79oHdOroIj2wWsiF
         yZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692457222; x=1693062022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovKoIVT6BwtqLiCJEBaRoz3aMugrFyQ7y69ihWvWmQQ=;
        b=JJ9YNql6C9UbSXUvu4sWVtMIz+UtfrxNGnH16Q9MJmbfZk6UQJdbaEG+PezLXsjZpl
         kPNTCVQpDYQpCfcDxbMv/734qtdCwydAmDMhfDkDDEfPUf/2M/juWKgsnkHSi7Zsryq0
         7X3JKkNEjNKh9AvBLiRfzmMHM5YQ7u69QGqa14T/ixuRp/N4rmh5HNSyvA8RQn2Sopmt
         yCgtr7mCIX4cKhcI84pjD5ez9MPyPFOcV0JEt42ghVJpi4Fy5sF4EOI8sNq9jBnT2bhl
         nqy3BFdBZ6CSFu8rHWs2jReyQ2Mg5H5l5fo+xfDwmvyxJ7ax/WssOUU6kqxVfqGswQ+M
         XVQw==
X-Gm-Message-State: AOJu0YwvHTHdWHNvcs5eeT8nRe5t7kA4fepu+BJUAlEFJFYYPKI3BE5Y
	W4xfEhN89EbZU/bAS5dSGzQ=
X-Google-Smtp-Source: AGHT+IGsNplZnTxR7oOLWyMdO7mUlpH2uS/X3z12NlMhZiQIB1kfEcmxgxZnshkgXI4vvtdOghOqpg==
X-Received: by 2002:a54:4515:0:b0:3a7:b011:8960 with SMTP id l21-20020a544515000000b003a7b0118960mr2756132oil.40.1692457221943;
        Sat, 19 Aug 2023 08:00:21 -0700 (PDT)
Message-ID: <3e7b0517-2c05-99ba-e13f-5d14f512fa9f@gmail.com>
Date: Sun, 20 Aug 2023 00:00:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/6] x86/debug: fix guest dr6 value for single stepping
 and HW breakpoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
References: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
 <70c18a3b-452d-9d5a-1781-95a742db496a@citrix.com>
Content-Language: en-US
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
In-Reply-To: <70c18a3b-452d-9d5a-1781-95a742db496a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/19/23 05:22, Andrew Cooper wrote:
> I suspect what we'll need to do is combine parts of your series and
> parts of mine.  I never got around to fixing the introspection bugs in
> mine (that's a far larger task to do nicely), and yours is more targetted.

Unless I've done something wrong, your debug-fixes-v1 when rebased to master
seems to fix my problem, so I guess your patchset is the superset.

-- 
Sincerely,
Jinoh Kang



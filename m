Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A35867A9A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 16:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685620.1066616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1red9N-0004aL-I7; Mon, 26 Feb 2024 15:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685620.1066616; Mon, 26 Feb 2024 15:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1red9N-0004YI-E7; Mon, 26 Feb 2024 15:44:17 +0000
Received: by outflank-mailman (input) for mailman id 685620;
 Mon, 26 Feb 2024 15:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1red9M-0004YC-3W
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 15:44:16 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e41ad3c8-d4bd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 16:44:13 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso2214126f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 07:44:13 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05620a0f8c00b00787c1102df8sm2564765qkn.127.2024.02.26.07.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 07:44:12 -0800 (PST)
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
X-Inumbo-ID: e41ad3c8-d4bd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708962253; x=1709567053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbeISk6CLsumn+4LZjMFLRI8cm8qCnRIEsEzsFsiCgE=;
        b=QIJpKoSaund8E/11tsNdY3tI41fd+nv8ylpuJ2ogJPUTebtOCmHKvA/obIIgP3Thsz
         pIPw/N1TF4XQYTVp5s7z5K/Ny28hs22xULVpFqiiKpxBPSPlb5m1T/or08dJCc61XAIW
         /UikGA+PwyB73tkCOzbtNITAHGhtzPfjbmMTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708962253; x=1709567053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbeISk6CLsumn+4LZjMFLRI8cm8qCnRIEsEzsFsiCgE=;
        b=EiRmsX9tb+U4Vc3d2M0QrGFpWJrBOR/tiKi2vkYLweDAWTfBqaGQ87foKwTdGOLPxg
         IJ2toNP1fbSYHjzBcoES4pHifdkG6Kuyw2a4ZVzMhJ+IQZdK1PmgM7BPqEO0Y5A2dY9q
         sRvM2SjxD7plNFU+lO0Uhow3tPpxE6dzcpA0rRqn6k4oS/NMM8MykK5v5cJuzkKB3Dcu
         LUg4VkoDQX3Ay4GUa6dLE9/fqDkcRwY0xjWaQhR0AvBIyGTz2Uoe1N7e7copACe/Oqyj
         yEVYge40GEeFGm6U3Q1hvwEtESOsstEyQChYVhTUc7dyj9yteF3XtVIyZfUMU5AblbF6
         uAhw==
X-Forwarded-Encrypted: i=1; AJvYcCWjThjH+YtqkOhjtcDxKtND2Tn9DW6ZghxDpzwv/Ghnt7GTJJpCk37gXfJmOHo6sjJ0RPEZ4IKzFU1n1iybSWqArEKY2RY6Bz9KIS64abo=
X-Gm-Message-State: AOJu0YyBQRFkV2OXJS+Qt2Q+FRWwR36kVQyshbVTT2N4JgMq1p+nHfLb
	rUOOPX8QHywoW3MITrCUGOEIyE/T/PY6ynGEog7syAe4Oss2w4PPGZbofGl0698=
X-Google-Smtp-Source: AGHT+IG3ZgjP3oZEayxVy0ehnFNfIOUuZH9SltyvnNEikbNzr6Rx+ioIyftMziF1va9DEMToaZlgsQ==
X-Received: by 2002:a5d:58e5:0:b0:33d:9d76:2f82 with SMTP id f5-20020a5d58e5000000b0033d9d762f82mr6753723wrd.26.1708962253179;
        Mon, 26 Feb 2024 07:44:13 -0800 (PST)
Message-ID: <b549f8f3-b21d-4ca5-9ef8-e1c39856d691@citrix.com>
Date: Mon, 26 Feb 2024 15:44:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [REGRESSION] Re: [XEN PATCH v4 4/4] eclair: move function and macro
 properties outside ECLAIR
Content-Language: en-GB
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <387b160ae93c221c4bc2426605b96b432b26224e.1706886631.git.simone.ballarin@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <387b160ae93c221c4bc2426605b96b432b26224e.1706886631.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/02/2024 3:16 pm, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>
> Function and macro properties contained in ECLAIR/call_properties.ecl are of
> general interest: this patch moves these annotations in a generaric JSON file
> in docs. In this way, they can be exploited for other purposes (i.e. documentation,
> other tools).
>
> Add rst file containing explanation on how to update function_macro_properties.json.
> Add script to convert the JSON file in ECL configurations.
> Remove ECLAIR/call_properties.ecl: the file is now automatically generated from
> the JSON file.
>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
>
> ---
> Changes in v4:
> - add missing script for converting the JSON file in ECL configurations;
> - improve commit message;
> - remove call_properties.ecs.
> ---
>  .../eclair_analysis/ECLAIR/analysis.ecl       |   1 +
>  .../ECLAIR/call_properties.ecl                | 128 ---
>  automation/eclair_analysis/prepare.sh         |   2 +
>  automation/eclair_analysis/propertyparser.py  |  37 +
>  docs/function_macro_properties.json           | 841 ++++++++++++++++++
>  docs/function_macro_properties.rst            |  58 ++
>  6 files changed, 939 insertions(+), 128 deletions(-)
>  delete mode 100644 automation/eclair_analysis/ECLAIR/call_properties.ecl
>  create mode 100644 automation/eclair_analysis/propertyparser.py
>  create mode 100644 docs/function_macro_properties.json
>  create mode 100644 docs/function_macro_properties.rst

This breaks the Sphinx build.

checking consistency...
/local/xen.git/docs/function_macro_properties.rst: WARNING: document
isn't included in any toctree

Also, the top level of docs really isn't an appropriate place to put
it.  Everything else is in docs/misra/.

When you've moved the files, you'll need to edit docs/misra/index.rst to
fix the build.

~Andrew


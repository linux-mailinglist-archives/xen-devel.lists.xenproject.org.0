Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376EA0B5EA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 12:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870555.1281730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXIqX-00042l-Jg; Mon, 13 Jan 2025 11:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870555.1281730; Mon, 13 Jan 2025 11:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXIqX-00040K-H4; Mon, 13 Jan 2025 11:43:05 +0000
Received: by outflank-mailman (input) for mailman id 870555;
 Mon, 13 Jan 2025 11:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+JSt=UF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXIqV-00040E-JP
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 11:43:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b6cf6df-d1a3-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 12:43:02 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso733103466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 03:43:02 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c3206sm5002490a12.46.2025.01.13.03.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 03:43:01 -0800 (PST)
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
X-Inumbo-ID: 8b6cf6df-d1a3-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736768582; x=1737373382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2t/ADShDozWFcdoWpKy1RENT8VgLl7MfOxeVbSDz4uE=;
        b=FAkgC9MMBNAxuw2n6muw7fvghIARwjMZ/RoRuOH/GX/rWpeNURluiaLXWg4Q7FamsB
         g5ph0jLfAUKzO//2Xf/z3c1/MIv9qtpBTHK+7AA+oHrLyndB8OQKXRZMjFjL6G/k+uhj
         cH5zxIsdZ3ZmWjUCZOft0tZq7cLP5KCZidIAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736768582; x=1737373382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t/ADShDozWFcdoWpKy1RENT8VgLl7MfOxeVbSDz4uE=;
        b=b5PGiK+LQDv8yNHyG3YvMN0L5hkc15I73DTqbVWhIfcyyJQR4EbTggGocOfMwdZbU2
         XCP62UetbG92yoHUzzKDL3h/03uxvZlOScgW1q6RsuzkG0M6HId8efJ/GE4peHk+FKsi
         row8eWR/N/JlS7pqZIWI+MHwXotHjS6ih+5QgqEXFm8lrJ4Sykxj0oqFX/t8gAVvWOB1
         UPXa2xfJzEQco4EFe5aqpNQLTNvSU2tiJ5Xp6qNq0pQgbbqfIWnzyU+d88RJ+GvQksZn
         ICD5K4bEtjGKVG8WiyZcxFu5wKv74hoxhNwnumcoI43TJ/TwLjammBkFbwxdz6IH7MiP
         QPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDMQhEQy2mwUCN2c+/nkyKydfEBoz8eHM/izf9Szgs+itS/0cBi3/MNIiIoNNlqv9odxDnT6coSDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGOLVfzWbDZm9b9jESgViiicBoxljsdppYk6Uk53ZLnntHBq4+
	5hszmnaX6hYO8rz6T40nPlsf9N0/VgbJWsdV8XdTiEtIEP7krxkTs59mYcT1usY=
X-Gm-Gg: ASbGnctPHE0DNFlfAfc+TaF6YjVnbcBZNm5YDeEj+wkPvCvbtetNAJyeFT6V6e7Wu7q
	CHe0675LAm82o9qcwLJ2zmoXax+veF85pzePL2KmMXcVrc7u4a5oVsnTFBDnguSUXj30/WXAFlk
	8NFAvZ/dagZ224FnBQbp3PNJzlPWFCA6YI9Uw7pnOvxGiC9wD0buM/aZFyOfTiCuGoCB1fQVh91
	THw1tfeYykm5pLc2l9BKtWKXM3/FZm8to4lnJKMyjYeAglfEt9/DtbQCmrxp8Exvdk=
X-Google-Smtp-Source: AGHT+IHTVieikwTqebzCBg4D7H7lOOad+0gFsSfTbe4g2KwvvsOyD/fKYatIv4XlOxZMDuucORGwpw==
X-Received: by 2002:a17:907:1b1c:b0:aab:d8de:217e with SMTP id a640c23a62f3a-ab2ab5f95d0mr1899711066b.26.1736768581629;
        Mon, 13 Jan 2025 03:43:01 -0800 (PST)
Message-ID: <9787ca01-eaf9-4538-9b5a-5d4d1d58f4fc@citrix.com>
Date: Mon, 13 Jan 2025 11:43:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/1] docs/Makefile: Add ppc and riscv to DOC_ARCHES
To: Maximilian Engelhardt <maxi@daemonizer.de>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1736542505.git.maxi@daemonizer.de>
 <b1d5c6fca18b93e402d229d22763621719964ea7.1736542505.git.maxi@daemonizer.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b1d5c6fca18b93e402d229d22763621719964ea7.1736542505.git.maxi@daemonizer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2025 9:19 pm, Maximilian Engelhardt wrote:
> Not having ppc and riscv included in DOC_ARCHES causes "multiple
> definitions of ..." message on documentation build, similar to the
> example shown below:
>
> include/public/arch-ppc.h:91: multiple definitions of Typedef
> vcpu_guest_core_regs_t: include/public/arch-arm.h:300
> include/public/arch-ppc.h:91: multiple definitions of Typedef
> vcpu_guest_core_regs_t: include/public/arch-ppc.h:85
>
> It can also make the generated html documentation link to the header
> files of another architecture. This is additionally a problem as it can
> randomly make the documentation build non-reproducible.
>
> Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


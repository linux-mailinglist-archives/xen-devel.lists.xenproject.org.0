Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B83A260A1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880930.1291030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezjY-0002bv-J7; Mon, 03 Feb 2025 16:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880930.1291030; Mon, 03 Feb 2025 16:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezjY-0002aR-Fa; Mon, 03 Feb 2025 16:55:40 +0000
Received: by outflank-mailman (input) for mailman id 880930;
 Mon, 03 Feb 2025 16:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tezjW-00027y-8j
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:55:38 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09df054-e24f-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 17:55:36 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so2431691f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:55:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b61f1sm13527504f8f.68.2025.02.03.08.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:55:35 -0800 (PST)
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
X-Inumbo-ID: b09df054-e24f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738601736; x=1739206536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+O2Z28GZ2gsuA+Mi329KCVj5lltn793uXpCx9+ZRb+0=;
        b=Rm0yzgbZdZY3y2hPOImvfP/NgOm6xNm3n3O3/lLU7/hLMKKKky+nN030WhjGoVeCLX
         rMrxQd86YxHRcy/c2BAlL4HLDmq9NTQHv7B17UXKVxCArTktRh7M1Fbap/gBEmccNJPy
         AUXDlAhoDPb2MOKKTzTxW2rWTgiFsaM9HT70I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601736; x=1739206536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O2Z28GZ2gsuA+Mi329KCVj5lltn793uXpCx9+ZRb+0=;
        b=J631asq3PFyrqldFoLHRGe8QyTPn6atKlTgYuuvKlwE8D8yieYIwsvPNypMnXsrTQo
         RrSUAiQp8lar/iKEM2Fgz1+Ax7z3hQqYSBuFBzjzp0BEGNzscz3uJGI7vB7H3eMTaJd3
         1yFY6bin0HrQk6tCqbdw+HOjnlrIZwbgJuC0J1XJaeP7GP6ELX/Wo/qJYAL4tTVDNAuF
         CYopngGGrTpV5B4K/Qr2X3e2rzeNEjvXlcS0rb1Pav38XfL6bLk/lZkXNwrUOIaLrcR0
         9437NHOvIs4v5UGXq+xDKM5++mf4hkGE6PSutN9jJGv/r1cycnPVKZXO4Z4SYRmdZ9El
         OfRg==
X-Forwarded-Encrypted: i=1; AJvYcCU4FPBsM+0CiKShBSIx05G802va+A5wQAbBIIfbL1PG9gLVcUUcdvxLXSOpl3XXk5EcNKmw7D1PfDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8TcNS8GRYkm2k3EcE6uY5SFJMv77adS7eqfR0uHGsAew/QPWl
	59BFblNhOyqCSjqRrWRwIYo082ew1sIkUtmKqbKDagQHLNMJiEaeh/U/g/ayjAc=
X-Gm-Gg: ASbGnctVOkAy9s2KHN+Olpj9yErZ+mdlZx8KUp9mqIxe+V7Yp9pIm7+71+/w4+3ojCx
	ICcHStXBD7rtL0VXbKa3Z26j+PymR3fdSBdaNkXrtDf8InVdTGNhybuijTeO/KKtpRBNKnw8Kg+
	D5SizBZKUm7aqE4OSnM5aLE3eKFX5oWCp/EjfGMC/+87tIWJ22jgNIMLOTTTsihx3kBOiRdU9hf
	twjcnoi2jIoTjmpht7putS4S2+fANdbmOq4hutoU/iEY4CEY0nYunDcg1F7Sao9y6xdwFVu7ScP
	7SRmNFfi3EFsFmBXjhFFJnObkUJHDBFOmIf/pBG2xmm4B2+ucWoz4cc=
X-Google-Smtp-Source: AGHT+IG3fm8+yIwbJ5EtyObkpwHARu2+43i1wU1THKmOrZmkgPvFDCIoIcbvZ9u2/rMqVpMIjH5Dqg==
X-Received: by 2002:a05:6000:2a9:b0:385:fbb7:672d with SMTP id ffacd0b85a97d-38c5209753cmr17915142f8f.52.1738601736118;
        Mon, 03 Feb 2025 08:55:36 -0800 (PST)
Message-ID: <8e9aadd9-8a16-4738-8ce0-058cf7664841@citrix.com>
Date: Mon, 3 Feb 2025 16:55:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 0/6] AMD/IOMMU: assorted corrections
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3a049628-8693-4fe5-81a1-1961b1402e50@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3a049628-8693-4fe5-81a1-1961b1402e50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 4:38 pm, Oleksii Kurochko wrote:
> On 2/3/25 5:22 PM, Jan Beulich wrote:
>> The first two patches are functionally independent, and they're presented
>> here merely in the order I came to notice the respective issues. At least
>> patch 2 wants seriously considering for 4.20.
>>
>> While alternatives were considered for patch 2, it's left as it was in v1
>> for now. The disposition there depends on (a) the four new patches, in
>> particular what the last patch does and (b) backporting considerations
>> (we probably don't want to backport any of the radix tree tidying).
>>
>> 1: AMD/IOMMU: drop stray MSI enabling
>> 2: x86/PCI: init segments earlier
> R-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> for first two patches.
> For others it seems like nothing serious will happen if to merge them after 4.20.

The reason I asked for them is because I think they're a far more robust
fix than just patch 2 in isolation.  That goes for older versions of Xen
too.

~Andrew


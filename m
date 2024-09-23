Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3F97EA6E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801922.1212000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgrr-0006Kj-AQ; Mon, 23 Sep 2024 11:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801922.1212000; Mon, 23 Sep 2024 11:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgrr-0006IN-5R; Mon, 23 Sep 2024 11:04:35 +0000
Received: by outflank-mailman (input) for mailman id 801922;
 Mon, 23 Sep 2024 11:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ssgrp-0006He-I6
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:04:33 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c58cfb2-799b-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 13:04:32 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so677515766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:04:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061116d67sm1209399066b.94.2024.09.23.04.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:04:31 -0700 (PDT)
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
X-Inumbo-ID: 9c58cfb2-799b-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727089472; x=1727694272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E+L41n2jhzAT3ydGhksCRgvfmETGkna3nPe9sAeJGMs=;
        b=UCMxQtrJWLg6GiPNg/j3ekB9oTEN3qJXT0ea7i1dZsok+z574LWMSU7DIdhGy7KDfF
         weMHKkKtWXqlAGBYVRWzoxbYM9k9HqDaCSWISnlJwI6iI+f/1zitZTh+4JteTHrQczOZ
         tPVwY+VRZ0eY3qphUmH0ValNwojWGbLGzYng8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727089472; x=1727694272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+L41n2jhzAT3ydGhksCRgvfmETGkna3nPe9sAeJGMs=;
        b=CDsGr28uxYiyGtxdXL4Hz4G0YVZTJRqg9gx7+ecaghPiEDcRjCSxGkiL/gdhY31udj
         tpCt9KaPgZF+gg0EXFmIk1C3mvyyt2KdlbZNC/ub1p28gosYGcq7exU77BnN2AdZVS0/
         lt2KyT/wke0nmeetgqTuKzKydEB0v2dwJyW6Io8GJTSqrYP2YRW/rQK29+6jSgwsKMgO
         AAjjWemP5VNzjiwDMnS+XwRP78VlYTOPX4GLyhiCgm3ZnG2jmZiMLZO1Y7thwLfX7zXz
         NxAsO8kQjuLzxQkmWiU/3brzSbbrRUz8pEmqwXD+YUD6kAkS3gP7E9vcbtppmpwaqvXG
         fCNg==
X-Forwarded-Encrypted: i=1; AJvYcCUmtxiP4rkZFMHnMFwcGle0iiGYRqqkHaABnSVNUg3keNIuLIs3+S5mTGJa0jCQrrWAD8xMZHoJQtU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzo8nNxXStySSf7ItfB+kpIOo3zFqUQJ4uPsK3eBLn/LDssuRcr
	r/X/nB1IzquiBfof4vCmSmZxfBHw4gGL5OkBNN8ui4XrbktNvDNWiB0T44NIuUyUJYFIaMH1OuO
	Hn4iEpQ==
X-Google-Smtp-Source: AGHT+IEw3TvF1PbbZ6DefgVCsD798c/yTbn963wBbTWh+q/if89pUdc9WM1sdEtZzAsPMHj6xtuVjQ==
X-Received: by 2002:a17:907:d3ce:b0:a8d:60e2:3972 with SMTP id a640c23a62f3a-a90d4ffdd3bmr1038926866b.23.1727089471922;
        Mon, 23 Sep 2024 04:04:31 -0700 (PDT)
Message-ID: <9ca4d235-5e6a-4ee0-9cc4-721b761572d3@citrix.com>
Date: Mon, 23 Sep 2024 12:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/livepatch: do Xen build-id check earlier
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240920093656.48879-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/09/2024 10:36 am, Roger Pau Monne wrote:
> The check against the expected Xen build ID should be done ahead of attempting
> to apply the alternatives contained in the livepatch.
>
> If the CPUID in the alternatives patching data is out of the scope of the
> running Xen featureset the BUG() in _apply_alternatives() will trigger thus
> bringing the system down.  Note the layout of struct alt_instr could also
> change between versions.  It's also possible for struct exception_table_entry
> to have changed format, hence possibly leading to other errors.
>
> Move the Xen build ID check to be done ahead of any processing of the livepatch
> payload sections.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/common/livepatch.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index cea47ffe4c84..3e4fce036a1c 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -767,6 +767,11 @@ static int prepare_payload(struct payload *payload,
>      if ( rc )
>          return rc;
>  
> +    /* Perform the Xen build-id check ahead of doing any more processing. */
> +    rc = xen_build_id_dep(payload);
> +    if ( rc )
> +        return rc;
> +

While a step in the right direction, I think this needs to be moved far
earlier.  Even here, it's behind the processing of the livepatch func
state, which is something that can also change like alt_instr.

The buildid checks need to be as early as possible.  Looking through the
logic (which doesn't have great names/splits), I'd say the buildid
checks want to be between livepatch_elf_load() (which parses the
structure of the ELF), and move_payload() (which starts copying it into
place).

That would involve moving check_special_sections() too, but I think it's
the right thing to do.

Absolutely nothing good can come from continuing to process/setup a
livepatch identified as "not for this hypervisor".

~Andrew


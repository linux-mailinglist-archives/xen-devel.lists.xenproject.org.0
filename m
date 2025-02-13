Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3832EA34072
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887595.1297057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZMW-0004IV-6T; Thu, 13 Feb 2025 13:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887595.1297057; Thu, 13 Feb 2025 13:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZMW-0004G0-3P; Thu, 13 Feb 2025 13:34:40 +0000
Received: by outflank-mailman (input) for mailman id 887595;
 Thu, 13 Feb 2025 13:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiZMV-0004Fu-8Y
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:34:39 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4487191a-ea0f-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 14:34:37 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-43963935585so5510515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 05:34:37 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4396181026fsm17909995e9.18.2025.02.13.05.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 05:34:35 -0800 (PST)
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
X-Inumbo-ID: 4487191a-ea0f-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739453676; x=1740058476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kFSHz93oiYkosiNCWHw+RavA2s8HeAaT07S48phbH5I=;
        b=jvM2Z1F+PHsBoh+Uorm+WRc+oJi/uPSg6j13wqH9wTDggF/JX2gL3XfVjXhbBzPuM4
         tZQyKKlfNnLsG2OdtAvMM4EZPeiVbjZnBS+OeFewqHu1//T6NFlxcLybzqOmhB6ePeJ2
         JdJRT0VxCX3fHqslIIaSx0AF70J9sHZpFJndo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453676; x=1740058476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFSHz93oiYkosiNCWHw+RavA2s8HeAaT07S48phbH5I=;
        b=M4XmbJeidaygj1ZLn6TxhJxcI/hwjzedo1Y0qG4oxralZ6j+qAEWBU5/qaKFM6O22D
         yB71GIlqJgOmXsccTR/ErT1W+7ecz3kBq5oMs57XGbY8nVxLaRGP3oz8aVPrS2fKtS2O
         09MF7oABSCj2tUVm1HEV5Jvz+mJhLn6bMX63Mx1aUTrYSDgYyX68XXzqMBjpuIXZa8U6
         XemLpX0bxbpmwIoJaPpWxJFj6hCHHoindZeoJpN1hbYJLRDWR2u/eDmmWfrNvqlQZoB9
         QPrOlk5QnmAaAWlh4EPeomnKP14BJ6JFADmhA6Jy3jHdXyV/utPAdJsitiD7JljWucU/
         emvg==
X-Forwarded-Encrypted: i=1; AJvYcCUvsj+O1zua3JXafWHNq587FVc3+kqY0gnydD5quXrXDJkYEa4fkONOu33gpYLEZB/kfh7k+5JaQ4M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTZQ2dJQaSjjVTCA+AIvXdaD9blN8a4UU0dg/tchz6V6sC/KrA
	A76kBUDD7AKRPJuZ2q6pTTpKie2I5zLhSjzR13yactYEc+SkwxGrP8wOn6BTPws=
X-Gm-Gg: ASbGnctnuGApxOrZqdw7rTCfIi1I1urLbFluO61R6W0oIJjA1/Qt5TEDwWAAvo4RlbQ
	gTptjCOkQCS3QSW7pHjiFMeJ98HLr1LDDnYff6ApsGKbVG9t0f1Dn7Mre2EjssluELjNsmXRMI6
	ISWueua8LqAOQF8faSg76vFoSXYN5hgJhwLniVVWxaUPD9m9sLJHzpCLUdBAYDU4xe+qnYwr/Tf
	vo4652oB7QK4tOH4iX1I9Am8WmxjHQH+K5EX3eijp9ayK2nwHPve6DYoSK8Osf6MzeWEXtym6Av
	8CO7X4ireKa6VUsQyAn/pCQ1uQ==
X-Google-Smtp-Source: AGHT+IGZXy6+T9Pk2jYVs0j1mzJ84gMvUxRkoCWtQBgJb1Zs7xu04XJI4DboGmAi7Kmr/qxMPac95w==
X-Received: by 2002:a05:600c:c06:b0:439:6101:5440 with SMTP id 5b1f17b1804b1-43961015529mr33435405e9.8.1739453676128;
        Thu, 13 Feb 2025 05:34:36 -0800 (PST)
Message-ID: <ef666424-3643-4938-a3da-90ef3f6c405e@citrix.com>
Date: Thu, 13 Feb 2025 13:34:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] tools/ocaml: Fix oxenstored build warning
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1739451311.git.andrii.sultanov@cloud.com>
 <58a75da8a5e593c67817632622221af2984efc6d.1739451311.git.andrii.sultanov@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <58a75da8a5e593c67817632622221af2984efc6d.1739451311.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/02/2025 1:03 pm, Andrii Sultanov wrote:
> diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
> index 432d66321c..cb4efc0fb5 100644
> --- a/tools/ocaml/xenstored/process.ml
> +++ b/tools/ocaml/xenstored/process.ml
> @@ -437,7 +437,7 @@ let input_handle_error ~cons ~doms ~fct ~con ~t ~req =
>    | Quota.Limit_reached          -> reply_error "EQUOTA"
>    | Quota.Data_too_big           -> reply_error "E2BIG"
>    | Quota.Transaction_opened     -> reply_error "EQUOTA"
> -  | (Failure "int_of_string")    -> reply_error "EINVAL"
> +  | Utils.ConversionFailed s     -> reply_error (Printf.sprintf "EINVAL: Could not convert '%s' to int" s)
>    | Define.Unknown_operation     -> reply_error "ENOSYS"

Thanks for working on fixing the warning, but this needs to stay
reply_error "EINVAL".

This is the stringly-typed errno given back to the client, not an
arbitrary message to be rendered into the log.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E82843ED7
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673969.1048590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV992-0000jv-Ge; Wed, 31 Jan 2024 11:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673969.1048590; Wed, 31 Jan 2024 11:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV992-0000ht-Cr; Wed, 31 Jan 2024 11:52:44 +0000
Received: by outflank-mailman (input) for mailman id 673969;
 Wed, 31 Jan 2024 11:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GWq=JJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rV991-0000hl-BQ
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:52:43 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cc19edb-c02f-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 12:52:41 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so4084787f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 03:52:41 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ci10-20020a5d5d8a000000b00339281d98c9sm13454583wrb.72.2024.01.31.03.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 03:52:40 -0800 (PST)
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
X-Inumbo-ID: 3cc19edb-c02f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706701960; x=1707306760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYPho3cpWD/mpEnmeET3iJxZtHGXuxTitF/5XOuaRmc=;
        b=KExcmcfoBLnZMcw0iQwicMpZ0CUzyhDxavCBPNMi9qqHZa8DjVM9NFz8K+0OKjtVjg
         WgG8ojkZTcY2x+CVEW58HMYFmf2rA8yWX6XQ8iIW5QcnKEDePB3lUNsAVLF3zaSpT3UX
         BSZE8RnYxAVBNbZmRIQBtq/BB9BFsUbWTyvAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706701960; x=1707306760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYPho3cpWD/mpEnmeET3iJxZtHGXuxTitF/5XOuaRmc=;
        b=oMB/hzpfoVpQ7cg/2tUcnl9VrDlB2VPt9ZpibSlOQCf05vVb82Mvutege2DfgzivJr
         8JgO7dMlghlhWCcOy31GTmFo/AeIpe2mkQmZDnxjrPLLMu6g2o+kfVrU4LzfViAyg+j/
         Ao9GesbcLt3vZ2LQ3Dwoe+lcMNZSyQMm+6xBWXo3L16FDJw9dCMU6TnZHAlWpsulNzwO
         jacyOOmmZnDmOezSLoO4EPOe4sZOZlcKWEwNrYuLf4lhcjM+h+UfYWQ2033tnVwDlvQd
         CLfHZqMwuNY9Ucv8/Y/3bqLaXii4gLEU+oH+XlzR9AjpyiiSxj/2gGxKKOprIrll0VFq
         KqRQ==
X-Gm-Message-State: AOJu0YzGMt/wzsT0P8+pIMPNsp4iRoG26HoVyP0WXwVALJpVbRAh79+J
	JxeKa507KxkrAQvncOcxwNWGj422J+9O3NHxSR2u6PDm0aZjyU7TgIBR6/dT6B8=
X-Google-Smtp-Source: AGHT+IHkZrjTGOds60ksWs54WvoK7SMm9W2eMTkQNswHuA8dkxB4mn0x3WKKVq2J5AaTcZ3SdqDt8w==
X-Received: by 2002:a5d:47a2:0:b0:33a:febd:f1bb with SMTP id 2-20020a5d47a2000000b0033afebdf1bbmr1121160wrb.33.1706701960654;
        Wed, 31 Jan 2024 03:52:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVtzf8329BdRyDhXMk+n1JxYG/mrn5mPBam/TMhMaYWV/DA80m3pGGuZf9WVxtw3y/0qiRcqkrg69pbfGx4wP+mihTQP33qfvgJu+bDOXtHuJGXJAVdhST5SAp0nMFm/JLn7Olaa1v6i1+WXRfQRAo3A63dpsq6tEdtBA==
Message-ID: <415e33c5-a9ef-43bd-87a2-1da3f3577a4b@citrix.com>
Date: Wed, 31 Jan 2024 11:52:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] IOMMU: iommu_use_hap_pt() implies CONFIG_HVM
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <61084180-d44a-4664-be13-462706587668@suse.com>
 <c9f2d1ae-6793-4c0c-a1b9-ea12a4b63132@citrix.com>
 <e8859e7a-d6f6-4146-95d0-fc7a70919ff0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e8859e7a-d6f6-4146-95d0-fc7a70919ff0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 11:09 am, Jan Beulich wrote:
> On 31.01.2024 11:40, Andrew Cooper wrote:
>> On 31/01/2024 9:20 am, Jan Beulich wrote:
>>> Allow the compiler a little more room on DCE by moving the compile-time-
>>> constant condition into the predicate (from the one place where it was
>>> added in an open-coded fashion for XSA-450).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks, but ...
>
>> I'm surprised that's happy compiling if it's actually doing anything at
>> all, given that it's an unguarded variable reference.
> ... I'm afraid I don't understand: What "unguarded variable reference"
> are you seeing me add? Even if you were talking about the hap_pt_share
> struct field (which was accessed before as well) - that's part of
> struct domain_iommu no matter what .config has.

Ah.  That will be why it compiles.

Fine.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE818B223B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 15:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712055.1112429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzyqD-0006aC-0u; Thu, 25 Apr 2024 13:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712055.1112429; Thu, 25 Apr 2024 13:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzyqC-0006YZ-TN; Thu, 25 Apr 2024 13:08:44 +0000
Received: by outflank-mailman (input) for mailman id 712055;
 Thu, 25 Apr 2024 13:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIz1=L6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rzyqC-0006YP-1p
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 13:08:44 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0a289a0-0304-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 15:08:43 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-43a4ad6c6cfso3574931cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 06:08:43 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ju5-20020a05622aa04500b00434946547d3sm6970726qtb.53.2024.04.25.06.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 06:08:41 -0700 (PDT)
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
X-Inumbo-ID: f0a289a0-0304-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714050522; x=1714655322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GMTrvyx7C+vq6KXMc22SzJCppn/qxql02pUl2TEYk8c=;
        b=eiOnYEH9LS8wkJ6J2LEPSdNvLa11BcfrQvMx+kaW+w85eT7/G0weTPoX1f5kNQPqZu
         DnWRWpiZT25YMxZ88MYHuNdIgLmFtw2v5D03FU4nTd6I2iSSYS/jWOqUE5jQ7FXaeTfe
         SrWmJGHnUlJLBCE85IZLIUQrRX0KzykqEwVds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714050522; x=1714655322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMTrvyx7C+vq6KXMc22SzJCppn/qxql02pUl2TEYk8c=;
        b=e4pyQxXaE/qNeF4lZ0vNlyrokoJ2Pnk3bp5l63fJbm5DEm3mwe/05Y7Mjy38wzPzZU
         1cOv2GKmIcUKYtgOW2kYFwyNJfHpzZDL2FVEHGD8i9NGjSyclcgdfBX+fZffcjuflLfI
         PKu92ig98BAwatO7q+JDnCHVEiMRe+BD++revDTGLqG8M4ctnR5FyquLmP2TdTdTSYZn
         iLKoqja8WtKr0iSJLaQodvxocLZ2BYHKrgoH/lmS78Nr5XCIvver7qO0KhZMvUxpXPL9
         7mgfDEQ0AcaHS7j259sX0MPGsZTp4VUZ35jcSApMSkYY3QJWYvqsyJz2u40qb0BBG+vo
         50gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuW7JZmIc65tC4UGnCtFLTTj2oSb9jDYU2+s2gXFBrrTTbuAoaTkwtOLwzM4ovH3EJJoWPMj708DEEHrDOkdKj2m+9ve4dW3lgHR68niY=
X-Gm-Message-State: AOJu0YzdBpj1rRJeN/V7dfzkMq3YRrADYmCDpJoRIHEhO7qWg/B3tZu0
	CGJmVkkAALHZiu1O+VDxvZJc4t32OYwmJawrXgxFxJ28Wppe8fcgQ9T7YKMCpK4=
X-Google-Smtp-Source: AGHT+IGSZHACY8wAR+oQ4+uVsPyBaRPkGvGqade9pR/BwAT4bUAYMNGu/tmcj7G0V+ecunECetYy3A==
X-Received: by 2002:ac8:5f10:0:b0:436:f4a5:d612 with SMTP id x16-20020ac85f10000000b00436f4a5d612mr5533693qta.54.1714050521763;
        Thu, 25 Apr 2024 06:08:41 -0700 (PDT)
Message-ID: <00b7014c-8f61-481d-a08e-57829e34a8b2@citrix.com>
Date: Thu, 25 Apr 2024 14:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/spec: fix reporting of BHB clearing usage from
 guest entry points
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240418155208.7771-1-roger.pau@citrix.com>
 <20240418155208.7771-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240418155208.7771-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/04/2024 4:52 pm, Roger Pau Monne wrote:
> Reporting whether the BHB clearing on entry is done for the different domains
> types based on cpu_has_bhb_seq is incorrect, as that variable signals whether

I'd prefer s/incorrect/unhelpful/ here.

As pointed out, it's currently like IBPB-entry in this regard,
identifying whether the block is in place; not whether it's used by the
condition.

> there's a BHB clearing sequence selected, but that alone doesn't imply that
> such sequence is used from the PV and/or HVM entry points.
>
> Instead use opt_bhb_entry_{pv,hvm} which do signal whether BHB clearing is
> performed on entry from PV/HVM.

I was going to ask for a note about dom0, but instead I need to make a
correction to the cmdline docs.  I'll do that in a separate patch.


> Fixes: 689ad48ce9cf ('x86/spec-ctrl: Wire up the Native-BHI software sequences')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Can make the one tweak on commit.


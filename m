Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F364A8B97AA
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715717.1117561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Si4-0006jb-EL; Thu, 02 May 2024 09:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715717.1117561; Thu, 02 May 2024 09:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Si4-0006hc-Bd; Thu, 02 May 2024 09:26:36 +0000
Received: by outflank-mailman (input) for mailman id 715717;
 Thu, 02 May 2024 09:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/qc=MF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2Si2-0006fv-Ku
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:26:34 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10689965-0866-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 11:26:33 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3c74a75d9adso5045051b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 02:26:33 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l13-20020ad4408d000000b006a0ee5b6ee6sm213811qvp.123.2024.05.02.02.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 02:26:31 -0700 (PDT)
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
X-Inumbo-ID: 10689965-0866-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714641992; x=1715246792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RmWMTJt8l3CMWxELPSlrqRMoXkOQLmVL9dGzeB82P5E=;
        b=Gb6pJG/zK4+rrH+G76xgo7vigwfOlYr2HdIlzJSMhLrbWTRfFDP0M0WzninreVjD3q
         mCQqS2G7TC8xH7rZiVpFdcoCySnHx+vpAYFHSneLDIGkeiQSgBiAMrNbKWb+M9oJZyz3
         kPG91A1cfLmu/iSE4pxfgWkVeUosrwxGj2uas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714641992; x=1715246792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmWMTJt8l3CMWxELPSlrqRMoXkOQLmVL9dGzeB82P5E=;
        b=HeJLxqdEhgQ3b7fpE1vM2VGi7lKDeKY842ftdKaMltdRSS6w5XaMofTI05sw3Qegiu
         +AiHXM4uUMtXg9bS1yhCmFaLvGS4H/oKXVPuj2CcA6+hWULUnO7XS7o+8ER4NQXJN6gr
         2UiptOvgY4/nQ3l/c2u2gstoAui5ftnsurgKZXFRGiJIJXRdXm2zuAPFy+1WzhgMOR5U
         mKbwsKh3UbWUHG5BwAGNWAE09R7Zkp042kkwpJiunK9/VigIR7X6FQFCn7MUYZC9FJto
         J5JB4TxUbWZ97HASvRtfFnsMj6qVHl4UePixV5+EFZrxkp7rZ0WfszQDtcOKT/1Mff+U
         fk/w==
X-Forwarded-Encrypted: i=1; AJvYcCURxf/XiIZxQqvz/Z4EfqDWhPOjzo1COSzwmFrMW3tCW3myEq+rriH4xnErmVn5TdHFyPoUWlWnCgBJBsowfuV1gQ1H09UjSEQ4zD8Y2UM=
X-Gm-Message-State: AOJu0Yx29w/arO7BJaAnWqnX3yLu5SIV3TsgGVf+Ix79Z75kDH1vO64x
	ay1MZaf/xK/k2ipYhmhZ/tFRjpshlHwFU1rBBU6AW6jxNFnbJFkXfMQ13jgpQXPBIZPehcoJPTZ
	e
X-Google-Smtp-Source: AGHT+IGkYUVa3G+uYdAoqKz4MbBQNCM5Q8I+J+rPNmAHOU0cVKrVWvRSW7jaAXRJfzV2zGXfHTNa4w==
X-Received: by 2002:a05:6808:4405:b0:3c7:4f55:e731 with SMTP id eo5-20020a056808440500b003c74f55e731mr5269705oib.40.1714641992188;
        Thu, 02 May 2024 02:26:32 -0700 (PDT)
Message-ID: <29784550-166d-43dc-a56e-b88afdad7d90@citrix.com>
Date: Thu, 2 May 2024 10:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/tests: let test-xenstore exit with non-0 status in
 case of error
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>
References: <20240502092213.15163-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240502092213.15163-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2024 10:22 am, Juergen Gross wrote:
> In case a test is failing in test-xenstore, let the tool exit with an
> exit status other than 0.
>
> Fix a typo in an error message.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 3afc5e4a5b75 ("tools/tests: add xenstore testing framework")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Thanks.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> although
this could do with waiting until after we've fixed whatever else is
causing it to fail.

I'll try to find someone to work on that bug too.

~Andrew


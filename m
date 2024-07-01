Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B298591DAA9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751394.1159349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCpb-00009S-Cq; Mon, 01 Jul 2024 08:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751394.1159349; Mon, 01 Jul 2024 08:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCpb-00007E-9d; Mon, 01 Jul 2024 08:56:15 +0000
Received: by outflank-mailman (input) for mailman id 751394;
 Mon, 01 Jul 2024 08:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VC/5=OB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sOCpa-0008NN-3y
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:56:14 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47f119a-3787-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 10:56:12 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50cso26713381fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:56:12 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44651419af9sm29473511cf.33.2024.07.01.01.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:56:12 -0700 (PDT)
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
X-Inumbo-ID: c47f119a-3787-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719824172; x=1720428972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ma+zp6lbzPmS/ImoX77dWIaIKr3G+nN2+myF1peEfd8=;
        b=UME4CKObGMi6PqVJXzikOcqetBT46okyjzTTSFa0YJvZdbx2+07NABPQXgnALOhh6M
         gcXtwzr1/MmG3WTCzceEHgvWhUfAQ08+tNVog5rD55cw/GHSEoBQSlOBI33hxCZ6/n24
         PxXzvP5U8HJc44RQNi7GGqAQ7QxrIEzu8Bj7G/pDpD9dOF0kSFVRUNshZeM8xOQO10Tr
         MVHj5xPhw3Zw7GS5iSkUMOjphN40gZs+py1VN5Qv5wwWKTyEvga358MkLWns5PuiT6WG
         0c8Re1lR9AtFCgfirlK0jQbEiEWVqxzYaO0mX3/5lZQW/BECezj1QWrlm9PPvTSrADRH
         sN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824172; x=1720428972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ma+zp6lbzPmS/ImoX77dWIaIKr3G+nN2+myF1peEfd8=;
        b=DtYPNqCWDFRd8DmszEV86QqBkWCRm5sDowg1Vslr7XBSGzOmW9mlrIFY//pn0ewO0l
         GAzdFMB17G9Z6DuluFJZULZIrZ0J44c5AHi/fp6tPOg3MBtzLHPl1owbunvHlog9AnDz
         n4AlfMgTe0BvJcHE6HOXJOfx3fooXFR3qe0WvBFtPs0KIfcTJ3vwDisH9XLzLBSYsOcv
         DR+tQpMMVfQYOUVU6qpgxYnvRT5XS5Qf48t/3BqBVh1M7bkXsZfdUcNr2U4slUb5y1KY
         WH1d1bwFeVlLLo1Ockk93nmgtl+05oW3PjuQdiI3U5btUpR/sTiQArU26tVVmS0bI0db
         e51A==
X-Forwarded-Encrypted: i=1; AJvYcCX+a9L1MlR2J0EOlDZe6JzMl3OjyScjiQ6Bo2EfY0+xkwFSstEHb49RyXgZN6JjQtwGBERhQoS+UvqeWX2Xmca+Lm49Tc3QqWgFrVUyTRU=
X-Gm-Message-State: AOJu0YwUkFD34lFAmmQncsC78kDnmGN2ahR30bDYidiG3CXx6paLa/kb
	Btivxw38ngvhYdqxFWokenW8C2dj0nYwu4eU7tw1QDpHe5fzSpQw/A+j2IBuD4Y=
X-Google-Smtp-Source: AGHT+IFAzjFAXnXzD+3+EdzsgdvUq9SvQZVSibwERysULtYVLA4tq/Em+6EBqMpRnKokLL1YMUQe7g==
X-Received: by 2002:a2e:b8c3:0:b0:2ec:54f3:7b65 with SMTP id 38308e7fff4ca-2ee5e6e02f1mr43141821fa.36.1719824172411;
        Mon, 01 Jul 2024 01:56:12 -0700 (PDT)
Message-ID: <aee9533e-0138-4e9e-8de8-4d998883cc48@suse.com>
Date: Mon, 1 Jul 2024 10:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] tools/libxs: Drop XSTEST
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>
References: <20240628150853.1048006-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240628150853.1048006-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.06.24 17:08, Andrew Cooper wrote:
> Appears to been missed from the previous attempt in 2007.
> 
> Fixes: fed194611785 ("xenstore: Remove broken and unmaintained test code")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen



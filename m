Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12977B00C8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608790.947509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlR4N-0004cP-TC; Wed, 27 Sep 2023 09:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608790.947509; Wed, 27 Sep 2023 09:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlR4N-0004Zv-Pi; Wed, 27 Sep 2023 09:42:59 +0000
Received: by outflank-mailman (input) for mailman id 608790;
 Wed, 27 Sep 2023 09:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0y+=FL=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qlR4N-0004Zb-2O
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:42:59 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3de4ce60-5d1a-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 11:42:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40537481094so107921655e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Sep 2023 02:42:58 -0700 (PDT)
Received: from [192.168.5.75] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c230e00b00402f7b50517sm17441790wmo.40.2023.09.27.02.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 02:42:57 -0700 (PDT)
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
X-Inumbo-ID: 3de4ce60-5d1a-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695807778; x=1696412578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTz0G114erb+zgxWJJJu8ke7KB3cZFh8aNZRWXOoo4Y=;
        b=fMbTIUTVmXkSO2U9KGLNlgYdbAEHJpqbtRvNamAmciQnq4DwZe3MwG91DQEqpA62jv
         xPMY0WxIiH5Z41JFPpIxhZ/Qr62OWzpL8+cZfD3tmIJm6zYgZmNgj58kNTTcMjtp3CXz
         0SysG0sjlgC/kgEywLgCISckEPJ5+CtyBF/uz06Aht7il+GBcwki6FcEN+9pMqiSeuOg
         6F2IpgtJfhlgp5+MosbTLJGITRccgD0OMpof2F+i9g0wAHBCd4M35FKvb7pwaMdaur3L
         Hip9O8en2el8R/MglXbUmHW4TW+1zz4M4VKA2bN99mR6S+Wc8vZJLH0HlTBa/wquKFvd
         PD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695807778; x=1696412578;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTz0G114erb+zgxWJJJu8ke7KB3cZFh8aNZRWXOoo4Y=;
        b=L75Dkuri/gZurfIdKhegqJKeLWJobI7Np5GeCDYSuA43Kq9kN0XHj+7jFcRGTQUya4
         dHvn9VBcWP6Yf/a/UhizFvjh16Ms3mHneQkqxjDo0N5It0cMw53ouPmEcwfcmr4KA6H1
         e3Di3+Bg0ySNoTxIEEsQpTBAJWN6dax+4C6WUwPSpoba4khzGV1ZjYbWrE6P5elhogMZ
         4V+0g8iE6+yk45iNoxjOg4jnhW3HEnUhpzr1/tXnXOgzh6NKLpHZPB8/6WyT1VA7vIL6
         742hlbJm7tQ3yJdojHZtv+ia/BAm1/Nurihqidt6uhEJCsJGhGNR1+qDb+pNc+JNzMrT
         9GkA==
X-Gm-Message-State: AOJu0YwU3h93y5dQJbo9GcGsBTRCBISldysNp7vkl8obea6yDsfIweXX
	JIlDjn2VJOj/MVOWpCaDCyQ=
X-Google-Smtp-Source: AGHT+IFn4ZBOp4RKT74Hg5qxa49Z0bguSdo8cmPa57d4aAjLkBpVSLnukdbSIBeJOh/yMuIR5EBzXw==
X-Received: by 2002:a05:600c:1e14:b0:406:44e6:15f0 with SMTP id ay20-20020a05600c1e1400b0040644e615f0mr1044093wmb.5.1695807777823;
        Wed, 27 Sep 2023 02:42:57 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <646b31b4-2fd6-4bff-ae6b-1b35626533c0@xen.org>
Date: Wed, 27 Sep 2023 10:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] net/xen-netback: Break build if netback slots > max_skbs
 + 1
Content-Language: en-US
To: David Kahurani <k.kahurani@gmail.com>, xen-devel@lists.xenproject.org
Cc: netdev@vger.kernel.org, wei.liu@kernel.org
References: <20230927082918.197030-1-k.kahurani@gmail.com>
Organization: Xen Project
In-Reply-To: <20230927082918.197030-1-k.kahurani@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2023 09:29, David Kahurani wrote:
> If XEN_NETBK_LEGACY_SLOTS_MAX and MAX_SKB_FRAGS have a difference of
> more than 1, with MAX_SKB_FRAGS being the lesser value, it opens up a
> path for null-dereference. It was also noted that some distributions
> were modifying upstream behaviour in that direction which necessitates
> this patch.
> 
> Signed-off-by: David Kahurani <k.kahurani@gmail.com>

Acked-by: Paul Durrant <paul@xen.org>



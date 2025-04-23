Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1721BA99B9E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 00:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965666.1356155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7irt-0008CS-Kr; Wed, 23 Apr 2025 22:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965666.1356155; Wed, 23 Apr 2025 22:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7irt-0008AZ-I2; Wed, 23 Apr 2025 22:47:01 +0000
Received: by outflank-mailman (input) for mailman id 965666;
 Wed, 23 Apr 2025 22:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7irr-00089t-Fw
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 22:46:59 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dca1b720-2094-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 00:46:57 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso2346925e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 15:46:57 -0700 (PDT)
Received: from [192.168.1.23] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092db2beesm41459955e9.30.2025.04.23.15.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 15:46:57 -0700 (PDT)
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
X-Inumbo-ID: dca1b720-2094-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745448417; x=1746053217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EIq8UHNpdSL2SOOvD4HsUnuCafprfKERIGeRYPUfbT8=;
        b=nu+B6gkgmeD1NAmuBIUY5uskI1vhBYUqdYauwf9q4IyjsPfXgaWtyWiD34YlEGZjWl
         mY/YTtQXdX1DxS9p4gCEdCVT5x/ntNcLXCIYosYHHmEqy3nh3GDE2aiDG4Ue+UEzutWm
         ltSLHvHAJ0YmXMa1wSgB2K/866TWCZqAWArV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745448417; x=1746053217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIq8UHNpdSL2SOOvD4HsUnuCafprfKERIGeRYPUfbT8=;
        b=P/58HrZ/l4AIsTaz9LTQBHrfzc4kK0ohVgmhigY+BFJfAUAgDu+kRT4+BlwE1VXDjk
         yi11bhpzyl9duY4SIdV9W7q9AwBOWa5YgaSTgkn5MnUS1mGuj3QeJFjc4LTedrP9NB0J
         2ftQaP8oI0ivjRFDfNA2z/jdNifIS/74oIWW+7XkgfzcHxcA5y+VsaQ1sN3KDacr1UZt
         C/x9frRnLNmuW+nms2bZokFhiPqem7txQC3MQOc7986LJVpzGcaIrqLS1T/PpF8RH0nC
         wxYqWKUseIPldqyee+JIA7XUc2LNRvvN/S1fEeg1DGED6vt7T9gZCoR+hUWriXYLig5L
         xJ9w==
X-Gm-Message-State: AOJu0YysqYyYf+/fXSEOcX8nc2hAURpO3GXAnM8hvoyX9qFMu5iIXC7N
	rVnft3Uhmv6Yj2xrU7hZZPxPP1rk+Od9XqOVKp0Sy8jK7Wl/SlOfg37oBLx0W09G7OFe1ToQLXu
	6YW4=
X-Gm-Gg: ASbGncsrmndK8rbCACWmpKyxJ5De1Eqj5htGj12mq1As9fPYM7ohPRUoYvtt91OybF1
	JKHWlE0qIyiSKfUi2cSVatls71ZEKHxmUJmHvbK2cxA/NcQ5RZRTF6e5fiMTqDPiVgyw60Kwb+d
	ZvUFjuGgnam28cf9AeuOw2UG2C77J3u/DFeQfKYws45TBPiaxN3/GRdzZoSDixZ+NfK/b4k5L7v
	u7TxvTICjOecqNZVyo0wkE9KfHwY4IaD8g6dsv+hfJPzRT3JPoSYn0O+n14E8Jvf711FFR5xiEK
	pjbW1i7zsg050SeHhLSxHK7HFxpdXe+PQwIWMGBnncsfLZQan9cCdY1O+QdhDf1dD2KES/MU1fO
	pKRqn
X-Google-Smtp-Source: AGHT+IFoYul5HVM4K1pPhGop64CxTcJb9DkZgLGNsjmrNnjwb8G1/VhhsXQ0xX/BY4Wvb3e647HH0w==
X-Received: by 2002:a05:600c:3d89:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-4409bd8e01cmr3536095e9.30.1745448417384;
        Wed, 23 Apr 2025 15:46:57 -0700 (PDT)
Message-ID: <76b7438b-9459-4f41-ab18-b777f7b3fcff@citrix.com>
Date: Wed, 23 Apr 2025 23:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: update list of GCC extensions used by Xen
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <da508095ef2ac0024dfe9f51d9da976da0eaead7.1745441038.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2504231354540.785180@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2504231354540.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2025 9:55 pm, Stefano Stabellini wrote:
> On Wed, 23 Apr 2025, Nicola Vetrini wrote:
>> __inline was not mentioned in C-language-toolchain.rst, while
>> __inline__ is not used in code under xen/. __inline is kept because it
>> may be used in Xen. The ECLAIR configuration is now consistent with the
>> documented extensions in the rst file.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Hmm.  f96e2f64576cd

I take it that patch shouldn't have gone in then?

Regardless, now that we're putting it back in, we should put in both
__inline and __inline__, so as not to need to come back and repeat this
patch again.

~Andrew


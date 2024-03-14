Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962A87BB0F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 11:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693106.1080855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rki6G-0002Qg-DC; Thu, 14 Mar 2024 10:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693106.1080855; Thu, 14 Mar 2024 10:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rki6G-0002NL-9q; Thu, 14 Mar 2024 10:14:12 +0000
Received: by outflank-mailman (input) for mailman id 693106;
 Thu, 14 Mar 2024 10:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rki6F-0002M1-36
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 10:14:11 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99303747-e1eb-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 11:14:10 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33e5978fc1bso327046f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 03:14:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 az9-20020adfe189000000b0033e43756d11sm418115wrb.85.2024.03.14.03.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 03:14:09 -0700 (PDT)
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
X-Inumbo-ID: 99303747-e1eb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710411249; x=1711016049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9OTZRhCxnsKwTrd1IiO9b2Chf8sfIkoNDtX6afa3FAs=;
        b=DmPqU2P10mj1vTqSghF1Izkk75RiZq5AxE+v6kHjWiFGac5mj/CyYMTUy9aSjfiU6D
         j92Ev3aLeZo+15AxmtXQZkuc9mCCCqrAuWBndDMZ0WhnJqSAFHfbegd7/dKkGXh+GKqf
         FsA8kqy8QjVLr/E3fkLVomGa3z7VUysNXcsySxjdp6Zfh1EWUE5JSCAYMr6hcDrSR+8T
         9UxDpMd/E3b/wu1yY0hJNar+/SvHQCrzUiTE6bH6QqNSSkZCMm+Z508BJciN+z7isj7h
         hvQJQo+rmXYR/e/F5c8WzbOd44q4G7qQZ3h0E8N055A0oj0QZ9nxk+K0rTZ1aRqFSnUs
         52Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710411249; x=1711016049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OTZRhCxnsKwTrd1IiO9b2Chf8sfIkoNDtX6afa3FAs=;
        b=JhrqoI6ieAC+6Bdu60jtFHDlEhE0OQ/4LL14OTi98AHQnRo1vtDlr0rDvTiZSQGfAD
         FcWZ5NP7NqWkdIaBypGDWwUXceY055Q89fH2pda/4uWMVezIVgfrunIuh3JKFCwe9beR
         h96ebEi2pIbtWmXr6CXQAiYSVhLgctUedjfdqBSGadhtzCglsOe2os0o9CiEXaroi3GV
         loeIm5qCBOSlbDYgQpK8VP6rVFqHmc90EoxpKBjUtWmShr1VC14xdcY6zjYyJxWdHzu0
         eI2r8gcNl4ugyJWwntBI7cj3OHxf/zX6+kJPFosfnKBDvSXWNnBiJJbD3Hr/KRtbb0MO
         pw6A==
X-Forwarded-Encrypted: i=1; AJvYcCVgn7rPpq3hEmemYrta/jJXtgT6hwBZOZcAJymIVm0oAfwudfin12UVXqs/5OCOXBtiN2RXkXlFG4Poe8FGPbVT9TVOuiXbM6ZUlPDirgU=
X-Gm-Message-State: AOJu0YzdlbbGRsA4vZAYPnhRtffKBzORFQpVmPhiqZq66KvHKMmR04cc
	K5vBPpH30AE8PRat/hnNai9vo/oeGWEfaddtCpkxZVBhqitRDOEF+ow1yDjkA9w=
X-Google-Smtp-Source: AGHT+IFu/AVBYTuAq8LLN5a+S1+H1PHD2TShUnuPnahACBVXzOcEYtUTxYro4L+/ETCvHR9MkznmAQ==
X-Received: by 2002:adf:b307:0:b0:33d:ac70:2e09 with SMTP id j7-20020adfb307000000b0033dac702e09mr712985wrd.59.1710411249567;
        Thu, 14 Mar 2024 03:14:09 -0700 (PDT)
Message-ID: <219994d0-7dd8-4862-aa95-d97e0832baac@suse.com>
Date: Thu, 14 Mar 2024 11:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] xen: allow up to 16383 cpus
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-14-jgross@suse.com>
 <cf161b43-0011-4faa-8d96-f99384448544@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <cf161b43-0011-4faa-8d96-f99384448544@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.03.24 08:26, Jan Beulich wrote:
> On 14.03.2024 08:20, Juergen Gross wrote:
>> With lock handling now allowing up to 16384 cpus (spinlocks can handle
>> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
>> the number of cpus to be configured to 16383.
>>
>> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
>> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
> 
> That's quite sad - I was really hoping we'd finally end up with a
> power-of-2 upper bound.

Yes, me too.


Juergen


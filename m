Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03D191955
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 19:42:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGoT1-0005zu-Jy; Tue, 24 Mar 2020 18:39:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2LnZ=5J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGoSz-0005zp-QN
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 18:39:57 +0000
X-Inumbo-ID: dbf4b03a-6dfe-11ea-92cf-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbf4b03a-6dfe-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 18:39:57 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b18so21970378edu.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 11:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9gHNtont17j3LM8qcOSXxPQPhDEII0lSFQG030PRrFc=;
 b=Z6q7liynohoz8paLMjsgRTkbMXIjaJnwbnexnNYkN31fAN7P5A9ALCBDBk9cIVOHf0
 ZZDLBDZ7MKj0U6pmIizv00AG/Iemm02F4z4suXknK2Y3oqkujjje+Nuww12lHirTONDP
 bSXZ+sD9WBCRVIoOCqu1jCyw+3PwpN8EbJUNuFKN9TIyurT4fOqnKzfkYvz/Lei6SiUs
 xaa9yc/tLAZL4gEY6B1Evh4eoAir0Yii8Gu0k3u9KV2eu8y535ESZeBMxU/iexInTKrt
 r0MEBeEPQmv0GuaHnpDvS/I5wsJpsSWsLD/9FsGofN8wQn6H8QEV7sV0FodXfllF78hK
 Nh6w==
X-Gm-Message-State: ANhLgQ2kKatwaCSGTPkf1c9KpDBUEmCI7hpHm+TU1odACg25zSzz4dND
 UkUfP+jIKvrJoIruf4JynmU=
X-Google-Smtp-Source: ADFU+vvzTuFr+WLmWvXOGCxmA1kAiIOdmxsEoBinkZB0ir4HAZrg1p5zBWo11qB0OluXpCRrfhQ6YQ==
X-Received: by 2002:a50:cd5a:: with SMTP id d26mr28929506edj.65.1585075196306; 
 Tue, 24 Mar 2020 11:39:56 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id k9sm1399113edl.35.2020.03.24.11.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 11:39:55 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Hongyan Xia <hx242@xen.org>
References: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
 <37dcd2d8-8ffe-a58e-4c7a-6dafc935b1c1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <94abc4e0-b11e-df0f-3e3c-c3a61d87c63a@xen.org>
Date: Tue, 24 Mar 2020 18:39:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <37dcd2d8-8ffe-a58e-4c7a-6dafc935b1c1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] Revert "domctl: improve locking during
 domain destruction"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/03/2020 16:13, Jan Beulich wrote:
> On 24.03.2020 16:21, Hongyan Xia wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>> In contrast,
>> after dropping that commit, parallel domain destructions will just fail
>> to take the domctl lock, creating a hypercall continuation and backing
>> off immediately, allowing the thread that holds the lock to destroy a
>> domain much more quickly and allowing backed-off threads to process
>> events and irqs.
>>
>> On a 144-core server with 4TiB of memory, destroying 32 guests (each
>> with 4 vcpus and 122GiB memory) simultaneously takes:
>>
>> before the revert: 29 minutes
>> after the revert: 6 minutes
> 
> This wants comparing against numbers demonstrating the bad effects of
> the global domctl lock. Iirc they were quite a bit higher than 6 min,
> perhaps depending on guest properties.

Your original commit message doesn't contain any clue in which cases the 
domctl lock was an issue. So please provide information on the setups 
you think it will make it worse.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38DF1CAE09
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 15:09:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2kO-0005Jo-1I; Fri, 08 May 2020 13:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HLRL=6W=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jX2kM-0005Jj-NB
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 13:08:58 +0000
X-Inumbo-ID: 137ac9a8-912d-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 137ac9a8-912d-11ea-b07b-bc764e2007e4;
 Fri, 08 May 2020 13:08:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s8so1770083wrt.9
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SfoftjUdJMP/vemqd09MfiuAR5q0nKJtH0beyh9JsQg=;
 b=buOYjOXc2/tIRGGk9mjFWqjrviH/6shur17U6RKWI2VfnGj0jhu/j1HwE055G95CxE
 RT2I+OVK3GxUqG4LwYG7coF2qnGOdV8GiaQqJkVhH0R4vx8q8MrNCC4aF/Axd01eqJ0a
 hvnWfuoZUPxaxHjak7DxgRmHuOxReHOkUaO6yJsDTeTTTUoLEr5AW/tfQqJVBC60cX3e
 A1x+fyJINBTWYPbcniWG+sU7UIefEakcisBAjkBt5tLrZn0J8Pr6Pu11r9pRiRfMDNYE
 ZBcx0gCAdPOHOQw9hrhP3bWhJkECk7KmGOZKGAS1kgQBSq6r3eBaxmZ9w4GzmgZtWi5Y
 OT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SfoftjUdJMP/vemqd09MfiuAR5q0nKJtH0beyh9JsQg=;
 b=T91kyJA7TKWQz4kd183Fw87MJyKScnFMUzSf7hL9q/LlrME6d29CNlpS0nAINUB/r+
 Amq5XvV4FrqvIo1MakxfRLhzq84eZ8bEFGg3hdS7mCPSGQ+BLyznCiZQJQofzi1zN8Fv
 thJ452Wljkh/rXqBKMJfhZkTue6OHj4OPwTjDWQFbOQliACyFqmSVlZ8ObvaBPvXb+XM
 /SZfVCZmpj8tsigy/Ke3v4b2a3pwgW7ZvG8OlhGz0nZqQHxU7g8xU8c1FXfqtL6meuHS
 E3uAV70NYkZ06MLXRP5+qmKSgoBz864z01eQfqIJAUMdzRN6bbsLCFDTmmJbQ7N5RFSb
 WLdA==
X-Gm-Message-State: AGi0PuZMRJGyGebZRAE4xOfrGuxQFdgeMfonOm0iDe355EKjeXMTh/OH
 5mecK8e9O33LDilxa4sRPv8=
X-Google-Smtp-Source: APiQypKW2ZHWmhB+ydNX9xkm44FQ6geGPfM0Pb3LxCGEVG3UmAv4x62XFMba1P1sJsmshnoslGVWWg==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr2782543wrn.69.1588943337081; 
 Fri, 08 May 2020 06:08:57 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id s14sm12369462wmh.18.2020.05.08.06.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 06:08:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] various: Remove unnecessary OBJECT() cast
To: Markus Armbruster <armbru@redhat.com>
References: <20200504100735.10269-1-f4bug@amsat.org>
 <20200504100735.10269-3-f4bug@amsat.org> <87mu6iy4k3.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b23abb5d-7222-c6ad-7314-a4138cb5d062@amsat.org>
Date: Fri, 8 May 2020 15:08:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87mu6iy4k3.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Corey Minyard <cminyard@mvista.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/8/20 2:49 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> The OBJECT() macro is defined as:
>>
>>    #define OBJECT(obj) ((Object *)(obj))
>>
>> which expands to:
>>
>>    ((Object *)object_dynamic_cast_assert((Object *)(obj), (name),
>>                                          __FILE__, __LINE__, __func__))
> 
> Nope :)
> 
>> This assertion can only fail when @obj points to something other
>> than its stated type, i.e. when we're in undefined behavior country.
> 
> There is no assertion.
> 
>> Remove the unnecessary OBJECT() casts when we already know the
>> pointer is of Object type.
>>
>> Patch created mechanically using spatch with this script:
>>
>>    @@
>>    typedef Object;
>>    Object *o;
>>    @@
>>    -   OBJECT(o)
>>    +   o
>>
>> Acked-by: Cornelia Huck <cohuck@redhat.com>
>> Acked-by: Corey Minyard <cminyard@mvista.com>
>> Acked-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v2: Reword (Markus)
> 
> My rewording suggestion applied to PATCH 3, not to this one.

OK.

> 
> With v2's commit message;
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Are you willing to take these patches? In that case, are you OK to take 
1 & 3 and I resend 2?

Thanks,

Phil.


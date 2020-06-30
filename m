Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7D20EF03
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 09:10:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqAOw-0004Jq-6B; Tue, 30 Jun 2020 07:09:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SK8L=AL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jqAOu-0004Jl-V7
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 07:09:53 +0000
X-Inumbo-ID: b0ebf292-baa0-11ea-8496-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ebf292-baa0-11ea-8496-bc764e2007e4;
 Tue, 30 Jun 2020 07:09:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c11so10712716lfh.8
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 00:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=o1LXN36/WVqpU6kcPnZDclIZrD+xs4anX1eIXGT39b4=;
 b=IFGOYbb9INSLIDilYbpOVrfA7hz2JAY9xBmYGaDpaLwpMCQQNrDCbkp31eo50vSW05
 4bAPRnVADQuTsJsJPNkoA+C0k0vtdiFPT0YUdI0C7ZpgVxOaAo0bFPRtj91Mlr3Higan
 CKefCbITS80OGPLa2rAT6zWgV47nVMKkDRORvSfidI845KGga9GC1p4KieKA+qQ2oT0Y
 cOEmX1v/qGz4O9IdU/GF+wwCjsE38BsroEyN9FAmn1EXKZlzMnkWtDz9RIBEyTiHSsm5
 zNk8y/M5WvQ1687Zo1BIzoUWL8E1vwG745Y3wpNAgSkLceF/+RD5p5qgYu+RNS8jtJUx
 mTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=o1LXN36/WVqpU6kcPnZDclIZrD+xs4anX1eIXGT39b4=;
 b=XN5LDhFMnT38jJBqRxKFMub+FbKprmYvkZ+FPL0unqxwYKFYCUU3pJX3duj+DFz9Ci
 rODkY4ShhTJd1L1QWHAlflLgLv9CSqiNpUzgG9mzXMeD1GFIYzB0hjVekLmMuIryfQFL
 bg0eJhETJaOLqx9aJhuFe7gLAl23yb/WSFV3VqjeeaXwhpk2cgxBHxP8rGOqCBKyolJz
 RM/itEvG7v0+YJU4eHyMk+rKPC1lW4B640U/DKL3pjp+GYq8ner6vBbzu1jVOjsovG2x
 SsMO1DNJzDES1x+BPQ4tuzEnD0K8RRCC+imnYd3W6NlZ/yjtnzbde+C3Hkx3qzCkoe05
 anBQ==
X-Gm-Message-State: AOAM531Z8zRg995GKNiYFi4wRppIUEQz1ZLQckJJebkv//kn9En9+iSk
 8Z39izSx370S2G7TK5LcIz4=
X-Google-Smtp-Source: ABdhPJxXZljZRO71aVvKrJMyXwabP2OvOIZJQBfRej1E4gjDp7JPnQhn9EnjTscTFjmhEUgBSxjeOA==
X-Received: by 2002:a19:a417:: with SMTP id q23mr10854424lfc.181.1593500990783; 
 Tue, 30 Jun 2020 00:09:50 -0700 (PDT)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id 132sm488735lfl.37.2020.06.30.00.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 00:09:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] xen/displif: Protocol version 2
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, wl@xen.org,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
 <20200520090425.28558-2-andr2000@gmail.com>
 <84d975e3-0cea-becb-f505-856368a63fb7@suse.com>
 <e6266bcc-fe03-f1cd-2a0f-40f128813b78@epam.com>
 <bbee8578-ee3c-f249-8c80-c2e47fc72ce0@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <80bfd713-9556-42d7-6bf7-dee85fdf8c10@gmail.com>
Date: Tue, 30 Jun 2020 10:09:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bbee8578-ee3c-f249-8c80-c2e47fc72ce0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/30/20 10:03 AM, Jürgen Groß wrote:
> On 30.06.20 08:13, Oleksandr Andrushchenko wrote:
>> On 6/29/20 10:02 AM, Jürgen Groß wrote:
>>> On 20.05.20 11:04, Oleksandr Andrushchenko wrote:
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>
>>>> 1. Change protocol version from string to integer
>>>>
>>>> Version string, which is in fact an integer, is hard to handle in the
>>>> code that supports different protocol versions. To simplify that
>>>> make the version an integer.
>>>>
>>>> 2. Pass buffer offset with XENDISPL_OP_DBUF_CREATE
>>>>
>>>> There are cases when display data buffer is created with non-zero
>>>> offset to the data start. Handle such cases and provide that offset
>>>> while creating a display buffer.
>>>>
>>>> 3. Add XENDISPL_OP_GET_EDID command
>>>>
>>>> Add an optional request for reading Extended Display Identification
>>>> Data (EDID) structure which allows better configuration of the
>>>> display connectors over the configuration set in XenStore.
>>>> With this change connectors may have multiple resolutions defined
>>>> with respect to detailed timing definitions and additional properties
>>>> normally provided by displays.
>>>>
>>>> If this request is not supported by the backend then visible area
>>>> is defined by the relevant XenStore's "resolution" property.
>>>>
>>>> If backend provides extended display identification data (EDID) with
>>>> XENDISPL_OP_GET_EDID request then EDID values must take precedence
>>>> over the resolutions defined in XenStore.
>>>>
>>>> 4. Bump protocol version to 2.
>>>>
>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>> ---
>>>>    xen/include/public/io/displif.h | 83 +++++++++++++++++++++++++++++++--
>>>>    1 file changed, 80 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
>>>> index cc5de9cb1f35..4d43ba5078c8 100644
>>>> --- a/xen/include/public/io/displif.h
>>>> +++ b/xen/include/public/io/displif.h
>>>> @@ -38,7 +38,7 @@
>>>>     *                           Protocol version
>>>> ******************************************************************************
>>>>     */
>>>> -#define XENDISPL_PROTOCOL_VERSION     "1"
>>>> +#define XENDISPL_PROTOCOL_VERSION     2
>>>
>>> This is not very nice regarding compatibility.
>>>
>>> Can't you add a new macro for the integer value?
>>
>> We can leave it as is, e.g. define XENDISPL_PROTOCOL_VERSION as "2",
>>
>> so we do not break the existing users. Then if every user of the header has
>>
>> its local copy (this is what we now use in the display backend), then that
>> local copy can be changed in a way suitable for the concrete user, e.g. "2"
>>
>> redefined to 2. This cannot be done (?) for the Linux Kernel though.
>>
>> Or we can have
>>
>> #define XENDISPL_PROTOCOL_VERSION     "2"
>>
>> #define XENDISPL_PROTOCOL_VERSION_INT  2
>>
>> Jurgen, what's your preference here?
>
> I would prefer the latter, as it avoids the need to modify the header
> when copying it to a local project.
>
Ok, I'll have 2 definitions then

Anything else (beside the comments on new functionality) I can add/change

before sending v2 of the patch?

>
> Juergen


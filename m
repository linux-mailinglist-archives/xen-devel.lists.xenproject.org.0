Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3598401C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802419.1212644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0hq-0004Ep-K7; Tue, 24 Sep 2024 08:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802419.1212644; Tue, 24 Sep 2024 08:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0hq-0004Be-HE; Tue, 24 Sep 2024 08:15:34 +0000
Received: by outflank-mailman (input) for mailman id 802419;
 Tue, 24 Sep 2024 08:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st0ho-00049v-VM
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:15:33 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a3bc3c3-7a4d-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:15:31 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so709522766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 01:15:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f7933sm53712066b.150.2024.09.24.01.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 01:15:30 -0700 (PDT)
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
X-Inumbo-ID: 2a3bc3c3-7a4d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727165731; x=1727770531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SqBXs5VZ0fOBQubmuMS9qUq5Tirz9u9vvvHGDLfXvRw=;
        b=wI3vNNWoDASmBCQetIw8VvmxOXnFBqaEYQ9uoAQxDjih4svajs7yC6gtpR6m7kYbzN
         yFOn699IZeaRWU6y3dprkmF/WYJo/gN4jYugBxxLEgz5tpXoYy3qzxaq/1MT9CZdFMx8
         aETctS3AGy3Q1UjaIUg7bBZBppmcjySYUrPeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727165731; x=1727770531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqBXs5VZ0fOBQubmuMS9qUq5Tirz9u9vvvHGDLfXvRw=;
        b=w0HbKXHeGgyvraDaTOcM/TSI704TK3rXLG79HHOInuKcC7PsGqonhEPzwZDEz4Tjg7
         7cyyWxTgxDeev7VSC2mAkTRH0ceYvSWdapZDlLDMZ5JOY4/eJPlSedUvscyAWr4BAjBx
         KjeT1H2N1wcxufmlFTVdMk4FmbOtBYYJHwkUmEEx8pp04MNj2O3hOqj14EUgWTXduyO0
         MNRoFAEPN0YJBGqAcSUTJfiz9VcDVt8wxeSj53B8b2Vh+2UUiuZ3BWVrv+D9BRERPEuN
         yo4xU/b/0IB8OfJFREy3Okc4ejEtDtFr+effoRhNZj8tciOQp6lZgaK9SS/DNrD7JjNv
         wr3A==
X-Forwarded-Encrypted: i=1; AJvYcCWwQJ/7fJDWfD2Qp9NgnAZ2wNCoDBrTiosAocqgMpshnKCP2g9npXzXzYBqrkKVzlpe2CgF4P9RHyI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywtq24fVE0A9Kxf1/fLn5IGaJJLhY3sNsvJGrim0RzvDZnPDO7s
	ma/J9okuSlvjkRhlcveb5U3LJzI+H6IOhmnPgemYe1NUDMIyKq4d3SIfg4DrnZVTYy/BsufVuhL
	1xfc=
X-Google-Smtp-Source: AGHT+IGHXEWMzZmftO4jiyQ+BbsQb3VoinwZq8hJTgI1JRKoO+0cXqELt+CH0D7mEda6RFo+ugUa/w==
X-Received: by 2002:a17:907:9443:b0:a8a:7062:23ef with SMTP id a640c23a62f3a-a90d561ffd8mr1416449366b.32.1727165730604;
        Tue, 24 Sep 2024 01:15:30 -0700 (PDT)
Message-ID: <51b52075-cc06-45b4-8d85-d6cb903fcda1@citrix.com>
Date: Tue, 24 Sep 2024 09:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayankuma@amd.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>, Julien Grall
 <julien@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
 <C3DB9D13-B9E6-4F8D-9678-59555E36AD68@arm.com>
 <87472b10-8e36-462f-a4fb-973684bceaa1@amd.com>
 <F7E20E7F-FEB1-4A70-8D76-75B5A827048E@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <F7E20E7F-FEB1-4A70-8D76-75B5A827048E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2024 8:14 am, Bertrand Marquis wrote:
>>>> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
>>>> index 245a219ff2..aa85ff821c 100644
>>>> --- a/docs/fusa/reqs/intro.rst
>>>> +++ b/docs/fusa/reqs/intro.rst
>>>> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>>>> OpenFastTrace parses through the requirements and generates a traceability
>>>> report.
>>>>
>>>> +Assumption of Use
>>>> +=================
>>>> +
>>>> +To fulfill one or more design requirements, there may be underlying assumptions
>>>> +on one or more components that Xen interacts with directly or indirectly. For
>>>> +eg, there may be assumptions on the underlying platform (hardware + firmware +
>>>> +bootloader) to set certain registers, etc. The important thing here is that
>>>> +anyone who validates these requirements, need to consider the assumption on the
>>>> +other components.
>> I think there is a typo.
>>> I would simplify a bit:
>>> Xen is making several assumptions on the status of the platform or on some
>>> functions being present and functional.
>> s/functional/functionality.
> no that sounds weird, functional is right in the sentence i think.

"functional" is correct grammar here.  "functionality" would not be.

However, "functions being present and functional" less than ideal.  I'd
suggest "present and working", "present and operational" instead, or to
rework the first "functions" into something else.

~Andrew


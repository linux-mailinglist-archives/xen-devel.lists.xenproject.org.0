Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9493A502
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 19:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763451.1173722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJPY-0000Vw-Dz; Tue, 23 Jul 2024 17:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763451.1173722; Tue, 23 Jul 2024 17:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJPY-0000TA-BI; Tue, 23 Jul 2024 17:34:52 +0000
Received: by outflank-mailman (input) for mailman id 763451;
 Tue, 23 Jul 2024 17:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=402b=OX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWJPW-0000T4-4C
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 17:34:50 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbcb0d14-4919-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 19:34:48 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-367963ea053so4152178f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 10:34:48 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa3b0b0a7sm54075666b.152.2024.07.23.10.34.46
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 10:34:46 -0700 (PDT)
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
X-Inumbo-ID: dbcb0d14-4919-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721756087; x=1722360887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shoQyxVDWCROua/C2bUBUZelX412t0m3+6UnTR430uM=;
        b=iIx9c+YaQelbS4I/Z+DNZdTYH+ogNT4yrGw7Wm7PGQkqw6PfVAdQnwK5lVPf3P7oQP
         QOEE7ZIm2CzxUVecegs3YD6VPDvASVkUYlYIPv1NW9y7ZxJ+kx03FifhK9N1vET8p0UK
         PAQhmsipZYeV3RnGBP1ndxZnoniB7CV0rAbhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721756087; x=1722360887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shoQyxVDWCROua/C2bUBUZelX412t0m3+6UnTR430uM=;
        b=XXsVsymvg36K8a6AvarymRhhScr3XFSbjkzhpgRPZw+jrWx9vXUZ26Az15fa2vU0Ka
         N82EPVP+RuFD+d5jibrCYISrNFJhlyc2cjBmCJqooPlwzX1xnXw+J9ZY8evRIJm7b6sm
         5LZmnym+h6TLy1zJ9CJTkCgWDKbs2tkSwt0BsMyB4wiwuTmU20BASvc6dE6oVMh/JbQz
         G5hffAJo3JqrFNIq33DsFlM5iiNmDQzB1m9bUlWRn6FgeRRSwBqBoWQs5gQ73n+dnTp4
         P2SsU8IhlMKr+Dw5qwt7jRgbd2fbgNiAnxGnECoV2LRK3b6oNwjJl7y/Y01EOUoTjvhA
         TQxA==
X-Gm-Message-State: AOJu0YwFqXf7HN8Veik1YpN/ECcuhw614lTP5kry5KQ498XjWtsfcwz4
	dNjeNxS48f91gHvhm+XjI97LANmZU4Ha9ArZ+CMtocpsD17uN1BJQ6IWBsydrWV0oyIlrBLUqEy
	G
X-Google-Smtp-Source: AGHT+IGoPk83TV84DhxpTWKg8SAkIgfsQ7LcaX9fMj2b7Y1QXXXa/+tonVIovUul/mrysPJjKXOEhQ==
X-Received: by 2002:a5d:6210:0:b0:360:75b1:77fb with SMTP id ffacd0b85a97d-369f09ab765mr431615f8f.8.1721756086644;
        Tue, 23 Jul 2024 10:34:46 -0700 (PDT)
Message-ID: <eb096455-cc60-4c34-b7e4-fb0345086934@citrix.com>
Date: Tue, 23 Jul 2024 18:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
To: xen-devel@lists.xenproject.org
References: <20240715234631.4468-1-jandryuk@gmail.com> <Zp/GcCUVPX/d/7qx@l14>
 <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com>
 <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2024 6:31 pm, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-23 at 11:04 -0400, Jason Andryuk wrote:
>> On 2024-07-23 11:04, Anthony PERARD wrote:
>>> On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk wrote:
>>>> "$dev" needs to be set correctly for backendtype=phy as well as
>>>> backendtype=tap.  Move the setting into the conditional, so it
>>>> can be
>>>> handled properly for each.
>>>>
>>>> (dev could be captured during tap-ctl allocate for blktap module,
>>>> but it
>>>> would not be set properly for the find_device case.  The
>>>> backendtype=tap
>>>> case would need to be handled regardless.)
>>>>
>>>> Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy
>>>> compatibility")
>>> Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy
>>> compatibility") ?
>> Yes!  Thanks for checking that - I must have grabbed the hash from a 
>> local branch.
>>
>>>> Fixes: 76a484193d ("hotplug: Update block-tap")
>>>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> With the fixes tag fix:
>>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>> Thanks again.
>>
>> Oleksii, this is a fix (for an incomplete fix) for 4.19.  76a484193d 
>> broke compatibility for block-tap with the blktap2 kernel model (when
>> adding support for tapback).  This finishes restoring blktap2
>> support.
>>
>> I realize it's late in the release if you don't want to take it.
> It's pretty late but I just wanted to clarify:
> 1. Is so critical that we should have this in 4.19?
> 2. If we won't take it now, then will it be backported anyway?

2) Yes it will get backported.  In fact I'm about to commit it to staging.

1) It's a bug in a new feature for 4.19, so if we don't take this bugfix
then we'll have to strip it from the release notes.

~Andrew


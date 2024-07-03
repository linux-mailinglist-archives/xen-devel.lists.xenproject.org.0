Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E79926471
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 17:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753191.1161487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1cL-0002Ai-3I; Wed, 03 Jul 2024 15:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753191.1161487; Wed, 03 Jul 2024 15:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1cK-000294-Vx; Wed, 03 Jul 2024 15:09:56 +0000
Received: by outflank-mailman (input) for mailman id 753191;
 Wed, 03 Jul 2024 15:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP1cJ-00028y-AO
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 15:09:55 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9db59d-394e-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 17:09:53 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6b4fced5999so25169626d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 08:09:53 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b5dd211482sm11258236d6.103.2024.07.03.08.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 08:09:51 -0700 (PDT)
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
X-Inumbo-ID: 4c9db59d-394e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720019392; x=1720624192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yK65ezmHxIY1GHr6MrXhbA9wVpwufgowh9NaOjJJJbI=;
        b=t3pvnJFbCPGlyIvLgFrguJx/D/8S5YGyw+nVqFP2vf8gaWr+PtgPUxQIycZg6yEOzC
         UU7G+Afruj3QNkdHS1ZZq1qg7SiKz92G6Fx0nhw8tV2GMqYBSzl5IpWiieGpdSbkbbLu
         X/AAImhsOYMd+M0UXfssxlpdjMuxTW1mthCHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720019392; x=1720624192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yK65ezmHxIY1GHr6MrXhbA9wVpwufgowh9NaOjJJJbI=;
        b=qCBrNPB7PH8xDnV2/vMQHjZzv912CARSZga9ggbJ8HMGP4UGLEYpuUrHV2OENBozyh
         TP7tgkSHxUJsSSylJ5DmCAoplujNJnANQTMX/ntq285nxbDlx9/exI3iK4Q8PoyAsFAE
         dsU1+TNvQYhWd4yCBhY5iSpqFBFGQjTKYOMwQt4Yca6mcGsp6TKxQCw+yRTJWaK+lTm4
         DzXu2WnNrs2HK47Xw70DwGOUqdhj5+8qk+P9YSk1HnI3H1xZ1IuVeC/g7JbB/CLszRSZ
         XYcq5e5oWXy4gF6AYNBZPaARMYK2KMpha7X8LO5sW5XDA3VxKllAF/w5GXdRa1t9MeKY
         NYrg==
X-Gm-Message-State: AOJu0YzhZfQZKBIA2R+oXxFx6aB7Ei0YahxGsb6ltbfXgYDlGplo4/wR
	0+pc42sDe3WVd/0gvQhR9UKWjhW9m7RLax2u77CGnoS9E4PK7xQRLjB3uIT+hxk=
X-Google-Smtp-Source: AGHT+IFz2tdlqXADkfHdv1B1Bxgvb3kLvCXt7eGqWh4SU+5YVMNtRflkzKIl5qXBGEBF/yGcOREt2g==
X-Received: by 2002:a05:6214:518c:b0:6b0:6d7c:da02 with SMTP id 6a1803df08f44-6b5b707fff9mr143945796d6.11.1720019391983;
        Wed, 03 Jul 2024 08:09:51 -0700 (PDT)
Message-ID: <b10061e7-1bf7-4bac-83d9-fe621cbad65a@citrix.com>
Date: Wed, 3 Jul 2024 16:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 4/4] CI: Rework the CentOS7 container
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-5-andrew.cooper3@citrix.com>
 <ZoVmSWt9bwxDNMuF@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZoVmSWt9bwxDNMuF@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2024 3:55 pm, Roger Pau Monné wrote:
> On Wed, Jul 03, 2024 at 03:20:02PM +0100, Andrew Cooper wrote:
>> CentOS 7 is fully End-of-life as of 2024-06-30, and the Yum repo configuration
>> points at URLs which have become non-existent.
>>
>> First, start by using a heredoc RUN for legibility.  It's important to use
>> `set -e` to offset the fact that we're no longer chaining every command
>> together with an &&.
>>
>> Also, because we're using a single RUN command to perform all RPM operations,
>> we no longer need to work around the OverlayFS bug.
>>
>> Adjust the CentOS-*.repo files to point at vault.centos.org.
>>
>> Take the opportunity to split the Xen deps from Tools deps, and to adjust the
>> other packages we use:
>>
>>  * We need bzip2-devel for the dombuilder, not just bzip2.
>>  * zstd-devel is another optional dependency since the last time this package
>>    list was refreshed.
>>  * openssl-devel hasn't been a dependency since Xen 4.6.
>>  * We long ago ceased being able to build Qemu and SeaBIOS in this container,
>>    so drop their dependencies too.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roiger.pau@citrix.com>

Thanks.

>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  automation/build/centos/7.dockerfile | 70 +++++++++++++++-------------
>>  1 file changed, 37 insertions(+), 33 deletions(-)
>>
>> diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
>> index 657550f308bb..9e66d72a5bd5 100644
>> --- a/automation/build/centos/7.dockerfile
>> +++ b/automation/build/centos/7.dockerfile
>> @@ -6,44 +6,48 @@ LABEL maintainer.name="The Xen Project" \
>>  RUN mkdir /build
>>  WORKDIR /build
>>  
>> -# work around https://github.com/moby/moby/issues/10180
>> -# and add EPEL for dev86
>> -RUN rpm --rebuilddb && \
>> -    yum -y install \
>> -        yum-plugin-ovl \
>> -        epel-release \
>> -    && yum clean all && \
>> -    rm -rf /var/cache/yum
>> +RUN <<EOF
>> +    set -e
>> +
>> +    # Fix up Yum config now that mirror.centos.org doesn't exist
>> +    sed -e 's/mirror.centos.org/vault.centos.org/g' \
>> +        -e 's/^#.*baseurl=https\?/baseurl=https/g' \
>> +        -e 's/^mirrorlist=https\?/#mirrorlist=https/g' \
> Why do you also need to uncomment baseurl and comment mirrorlist?
> Isn't baseurl already enabled, and having extra mirrorlist won't harm
> as it's just extra location to search for packages? (IOW: even if they
> don't exist it shouldn't be an issue).

It appears that having an uncontactable mirror list, as opposed to no
mirror list, is fatal.

I didn't end up with this because I like the look of the sed expression.

~Andrew


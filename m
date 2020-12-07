Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394872D10CB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 13:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46465.82462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFuF-0000Fi-Dn; Mon, 07 Dec 2020 12:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46465.82462; Mon, 07 Dec 2020 12:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmFuF-0000F8-9u; Mon, 07 Dec 2020 12:46:19 +0000
Received: by outflank-mailman (input) for mailman id 46465;
 Mon, 07 Dec 2020 12:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmFuD-0000Ex-Dx
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:46:17 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9e22e6fb-e732-431f-908c-bb4142b3648a;
 Mon, 07 Dec 2020 12:46:15 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-piQwEYgEMQy9frD-eLZ2gA-1; Mon, 07 Dec 2020 07:46:12 -0500
Received: by mail-wm1-f69.google.com with SMTP id y187so5283898wmy.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 04:46:11 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h20sm13745748wmb.29.2020.12.07.04.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 04:46:10 -0800 (PST)
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
X-Inumbo-ID: 9e22e6fb-e732-431f-908c-bb4142b3648a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607345175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyOz5Tc9PqhiNlZWIQPWc0O+She1E1/qQZR6bIJl32A=;
	b=Ui8BMwfzJ3RyW2pEfnxZIMBbuLB7BBDx9oySOKcgaK8/2GpT2S5qraUDQRYH4sJK15dYMj
	xAV6t5rl71fjUOf4D+5OE0AjiZy6SWzmXI0HeBBAPpKWyGk+7nqo53m5elp2Vw7+AcPRMG
	8vowCyEHcq5xgF46fB2hElcnth0I7Es=
X-MC-Unique: piQwEYgEMQy9frD-eLZ2gA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tyOz5Tc9PqhiNlZWIQPWc0O+She1E1/qQZR6bIJl32A=;
        b=Sb0RdwAuww2IoC9hb0Vdqt53zPn44X6z0Q7FSwAYwvgq/WUs9p4gkiyHp/88v5N4sk
         RVKs0OvH05IdXllCL95Ex12BAqhD05Fk/Ya5b0ngOXx72FyYhReDj5wUI4jv2FTAC9RW
         o3uBXZz1PLTEvrRgVPQW3Z+wkvTc9SWNGD2B2NKbaDtMXUh6KfN4fJea8dNUghkW4Cql
         6Roh2ZHRMFwxitLXLcOfYloT8dVZt8QZE8A38+VNAebjFde9oY0HtXoKO8O5D+kjt8VU
         w1xAUEyu3FU1HfDZJ/ZzRlRZAIUGHvpqAgNTZ5X9vmsNSmgw4ojKMGALsFnxtzK1GSVm
         IYcA==
X-Gm-Message-State: AOAM533EGZzjruNlvtg63ePU3OCAvTVnFX61wYbaVNPxkfP+vMSo22j2
	I5HGTEql42RBjKr6kj2KOaRen5qpHzIJ61PSK3qUSnxprJZdj04sONcA7W2sE81j6GmGHJZg1i/
	O411S+ShRanRk3L47RUo9S/FSZfs=
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr18420826wme.189.1607345170874;
        Mon, 07 Dec 2020 04:46:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp1cQ0YqyVCzSrPnn6i9/5M4B45ElmdNAkkARQoGv3NPSs4feaDlLXpquqrHa2sqmKk3jUew==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr18420802wme.189.1607345170698;
        Mon, 07 Dec 2020 04:46:10 -0800 (PST)
Subject: Re: [PATCH v2 5/5] gitlab-ci: Add Xen cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-s390x@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20201207112353.3814480-1-philmd@redhat.com>
 <20201207112353.3814480-6-philmd@redhat.com>
 <9bfd1ed4-baa2-ece8-5b96-ec8fc7a8c547@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c335d1f5-e8cb-a9c2-9718-822dc0248fda@redhat.com>
Date: Mon, 7 Dec 2020 13:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9bfd1ed4-baa2-ece8-5b96-ec8fc7a8c547@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/7/20 12:51 PM, Thomas Huth wrote:
> On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
>> Cross-build ARM and X86 targets with only Xen accelerator enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 7a94a66b4b3..31f10f1e145 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -135,3 +135,18 @@ cross-win64-system:
>>    extends: .cross_system_build_job
>>    variables:
>>      IMAGE: fedora-win64-cross
>> +
>> +cross-amd64-xen:
>> +  extends: .cross_accel_build_job
>> +  variables:
>> +    IMAGE: debian-amd64-cross
>> +    ACCEL: xen
>> +    TARGETS: i386-softmmu,x86_64-softmmu
>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +
>> +cross-arm64-xen:
>> +  extends: .cross_accel_build_job
>> +  variables:
>> +    IMAGE: debian-arm64-cross
>> +    ACCEL: xen
>> +    TARGETS: aarch64-softmmu
> Could you please simply replace aarch64-softmmu by arm-softmmu in the
> target-list-exclude statement in this file instead of adding a new job for
> arm64? That should have the same results and will spare us one job...

Ah, I now see my mistake, this is not the job I wanted to add,
I probably messed during rebase. I'll respin with the proper
xen-only config.

> 
>  Thanks,
>   Thomas
> 



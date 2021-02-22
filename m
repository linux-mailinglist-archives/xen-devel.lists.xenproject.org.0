Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7373321E51
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88305.165945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFCw-0007JK-Cn; Mon, 22 Feb 2021 17:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88305.165945; Mon, 22 Feb 2021 17:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFCw-0007Iv-98; Mon, 22 Feb 2021 17:41:18 +0000
Received: by outflank-mailman (input) for mailman id 88305;
 Mon, 22 Feb 2021 17:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V+0I=HY=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lEFCv-0007Iq-0w
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:41:17 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 945e0222-ce00-4f3c-a36d-0c98ecd82a24;
 Mon, 22 Feb 2021 17:41:16 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-CxJApGiAP1Or60oY4lYrXg-1; Mon, 22 Feb 2021 12:41:12 -0500
Received: by mail-ed1-f71.google.com with SMTP id l23so7454930edt.23
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 09:41:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 35sm12703670edp.85.2021.02.22.09.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:41:10 -0800 (PST)
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
X-Inumbo-ID: 945e0222-ce00-4f3c-a36d-0c98ecd82a24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614015676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77VYX8qyvFFdVxjrkL962xLS4W9z5d8KO6lHL7cyqdE=;
	b=XqYfmYj8tLkJMIg5nvMVX8eRh3zUdX9mr+ycheUob06W01kE5psM5baLZ9qNWB9tQO/ctb
	lqA3STj+TP37KAiL51w1PbNAa7mWjdOhIP2QL+ez4ccLhNe31bdqWVpx9dJmM+flr3lorO
	7Jp+Uoy+jlj/do5GCiWUj6NMabnyVYA=
X-MC-Unique: CxJApGiAP1Or60oY4lYrXg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=77VYX8qyvFFdVxjrkL962xLS4W9z5d8KO6lHL7cyqdE=;
        b=KBHrCPtjnzktsSxjqmSiKBKgs5Xn6ElYRBoXVo3/uUF28ax6V96vp5OU8S9Zq77CQz
         07jqYp1Fir05Q5UmEYI486aFa088K8GfW4g38UGwmfCcEt++cRuqP+WqUZ2JRE4a6jky
         53qZIN8uDXdycMggZy5kbDhs7NxvdNiH1ZpyxVLBxBNd39eKUMedgsBHkYXCea2IOMTO
         lMWnnBXXGxgUz/yt7pGMyDRPyWt78FRIrsUalakBOh3TtLvBrBapETA+XuLWcGPQOx0s
         JtEuLJ29EzLb7v5wOI9GZJlTikv7JF6F1w+BRVZpapFkyJW4GuJizxTMqBwudcPo3rmY
         FDdw==
X-Gm-Message-State: AOAM5314pRvgQLNfKViMb/92ui9yrEVNe3tK719NN3t5CKXjCGzMAflm
	I9AyNrUJy675ZC8oLxWfj6BRK2l/xqtZBfj6GBdPvoPVoNQX7hjiieh8IaEQDfxRya4qXQlpH0o
	t+wuIpRuoHDNQqIHK59gIMRwOAro=
X-Received: by 2002:a17:906:3916:: with SMTP id f22mr21981079eje.328.1614015671135;
        Mon, 22 Feb 2021 09:41:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHW8/h+A0Q0TqQKsXXcDdlUdoA+aX8vZ+NMqUGfMGQKgJyne7vdUySnR2jDa7GViPMBbw/Eg==
X-Received: by 2002:a17:906:3916:: with SMTP id f22mr21981048eje.328.1614015670962;
        Mon, 22 Feb 2021 09:41:10 -0800 (PST)
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
Date: Mon, 22 Feb 2021 18:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222182405.3e6e9a6f.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/22/21 6:24 PM, Cornelia Huck wrote:
> On Fri, 19 Feb 2021 18:38:37 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> MachineClass::kvm_type() can return -1 on failure.
>> Document it, and add a check in kvm_init().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/boards.h | 3 ++-
>>  accel/kvm/kvm-all.c | 6 ++++++
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index a46dfe5d1a6..68d3d10f6b0 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -127,7 +127,8 @@ typedef struct {
>>   *    implement and a stub device is required.
>>   * @kvm_type:
>>   *    Return the type of KVM corresponding to the kvm-type string option or
>> - *    computed based on other criteria such as the host kernel capabilities.
>> + *    computed based on other criteria such as the host kernel capabilities
>> + *    (which can't be negative), or -1 on error.
>>   * @numa_mem_supported:
>>   *    true if '--numa node.mem' option is supported and false otherwise
>>   * @smp_parse:
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 84c943fcdb2..b069938d881 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
>>                                                              "kvm-type",
>>                                                              &error_abort);
>>          type = mc->kvm_type(ms, kvm_type);
>> +        if (type < 0) {
>> +            ret = -EINVAL;
>> +            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
>> +                    mc->name);
>> +            goto err;
>> +        }
>>      }
>>  
>>      do {
> 
> No objection to this patch; but I'm wondering why some non-pseries
> machines implement the kvm_type callback, when I see the kvm-type
> property only for pseries? Am I holding my git grep wrong?

Can it be what David commented here?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html



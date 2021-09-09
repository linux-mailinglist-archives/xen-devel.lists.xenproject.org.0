Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785A40482D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182921.330789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGsG-0001KN-G6; Thu, 09 Sep 2021 10:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182921.330789; Thu, 09 Sep 2021 10:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGsG-0001HU-D0; Thu, 09 Sep 2021 10:01:40 +0000
Received: by outflank-mailman (input) for mailman id 182921;
 Thu, 09 Sep 2021 10:01:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qxuu=N7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mOGsE-0001Gi-Un
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:01:38 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ec5a16fe-1154-11ec-b1ab-12813bfff9fa;
 Thu, 09 Sep 2021 10:01:38 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89--HBP5DumN-qv7_B9fryJzA-1; Thu, 09 Sep 2021 06:01:36 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 z17-20020a05640240d100b003cac681f4f4so691544edb.21
 for <xen-devel@lists.xenproject.org>; Thu, 09 Sep 2021 03:01:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id l9sm808653edt.55.2021.09.09.03.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 03:01:34 -0700 (PDT)
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
X-Inumbo-ID: ec5a16fe-1154-11ec-b1ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631181698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeGWlrf5vev+gEOfCXbrlvWAI/u03MMiPQrjaUt1lXM=;
	b=b8z0Q5hPdxq4Dc/NS+9ZjK6JHkTOh6QOFqeBApJOS4I/3KXyyVXP9p9eJY8JJEx+LeoSdq
	H8A+q2crvkinRqzqk6B3Xdz6zq8LdUQHvSg1V75q88wvenQn3NLmQvIhZYnYD/tSwY+HOX
	+KQsKAXKIvspfKo1h/WcoKfWl63O3JU=
X-MC-Unique: -HBP5DumN-qv7_B9fryJzA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NeGWlrf5vev+gEOfCXbrlvWAI/u03MMiPQrjaUt1lXM=;
        b=5Ey6+gwA0zUMhjY/YVJhPIO3a6zylN6zI8Ig4VADV6z+LNYfCpZ6aU0wZ6TcSVc0cB
         NZYdWD9rc0CpO5YMgGm6d4Kne6Wiokd4pqIffcAUpOddBv7za5X1HrlHVQcYNtpZ9vTb
         b44EOxKs2SVxdOf6aoktaRtv0yrknwxf4CTuFuZFPtw/pP7nH5rzpG8yxNa63T5lpiri
         O2YOUQA1sMPkJD3x9ZQP9ZVi3V1xRgpb9Z3YhkNU2CIXRIKm3F7BItOtxDPRMde4s92Y
         1bL1nvxRI3kfMx0IO5e5ohJLMmorD8YmK4xlhj/wV8zd2Rt4DOnnVnJ5CCGKsRkghg2x
         dHow==
X-Gm-Message-State: AOAM532jwetbmqGWCeQbfNd4vdmsaLQKomUCyACuQOGsTJ5ktnHqRZ9B
	zAEtIICg85PC4ITu5v1BB3Pc8wY9l+DiwvJH/L29ceHbXSW++VmSMdRFFHohT7jp7m1PkURD04X
	rJT1IgNlZioKlOlTHkpfON4D/ikI=
X-Received: by 2002:a17:906:b782:: with SMTP id dt2mr2490180ejb.310.1631181695717;
        Thu, 09 Sep 2021 03:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaaVojQ78dzvuwBQG6dnOgiYYtED8hU6C1zxFqk1STHW4PQ44zaKff1f8hXuv91Gn62rzOaw==
X-Received: by 2002:a17:906:b782:: with SMTP id dt2mr2490145ejb.310.1631181695393;
        Thu, 09 Sep 2021 03:01:35 -0700 (PDT)
Subject: Re: [RFC PATCH 01/10] sysemu: Introduce qemu_security_policy_taint()
 API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b56b5716-a461-0dbe-f706-524c42589e33@redhat.com>
Date: Thu, 9 Sep 2021 12:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/09/21 01:20, Philippe Mathieu-Daudé wrote:
> +static QemuOptsList qemu_security_policy_opts = {
> +    .name = "security-policy",
> +    .implied_opt_name = "policy",
> +    .merge_lists = true,
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_security_policy_opts.head),
> +    .desc = {
> +        {
> +            .name = "policy",
> +            .type = QEMU_OPT_STRING,
> +        },
> +        { /* end of list */ }
> +    },
> +};

No new command line options please.  You could rename -compat-policy to 
just -policy, and make this a "security" suboption.

Paolo



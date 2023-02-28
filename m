Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D306A578D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 12:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503252.775481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxuQ-0005zW-Us; Tue, 28 Feb 2023 11:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503252.775481; Tue, 28 Feb 2023 11:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxuQ-0005x0-Ru; Tue, 28 Feb 2023 11:12:38 +0000
Received: by outflank-mailman (input) for mailman id 503252;
 Tue, 28 Feb 2023 11:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcKI=6Y=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWxuO-0005wl-Pn
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 11:12:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe3f3f3-b758-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 12:12:34 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-kK4wtX-AOEiLkAIiud-KSQ-1; Tue, 28 Feb 2023 06:12:30 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so6752173wma.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 03:12:30 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm16604362wmq.47.2023.02.28.03.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 03:12:29 -0800 (PST)
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
X-Inumbo-ID: cbe3f3f3-b758-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677582752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wpQuPL8c90Bf1pFHe7Ri8yXfJ5L7MD+vOWGStm2xqk0=;
	b=F6t7KpQnECisySRDgBCX/Z1BCyqu3ed6TZAJapLDgZiRYRj8SGK6auTes4H/xusNaZG1lN
	9/d37ZLQWOrNWvXfHJ/G5JBGQnNuZm7YLuRZKbqpug/+p1nujw+N+ENU7fCE6UkQUtF5FF
	gS7ABRpeOHW65VfWO7JBsamjgm+3hy4=
X-MC-Unique: kK4wtX-AOEiLkAIiud-KSQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpQuPL8c90Bf1pFHe7Ri8yXfJ5L7MD+vOWGStm2xqk0=;
        b=ywDKBzGZVk+rVMFnUeduqxOZhOpC/2nLYQmfsE55NOJFqxjY3CLHPL8tJCf5KnBnYD
         YKhW8hERr8CxMXFTvfFAa3PuwogEZVh5zXwN1R0+qFnO7J5qavwTTAn2i9koD3+tL9XI
         uObYPHaRFKg5rR5ghJNOelXWlLNXaEgsbBR4zo65sQHFlpRiCHWVCkMSOl0KR2SlpN26
         O4V/X0Q/ot/lRiYxCKle+l9VjO0UQyYRSCkezn85R1V4XJkhav7AFBhrcxU4S8S+rHlH
         D0m0lF60pO3Ln/uOVOx7y1Sg3RoSGNjGUuBxB+Acrc3xDYQd8UG/wdYb0rZUsnrm92xl
         Y+Tg==
X-Gm-Message-State: AO0yUKXcrMarVtBzR0sV0uPNoq4dCpiY+sv8fYzvUv8rbDRcD6XumnRE
	OXqasC7426Utwp/Z1ma4sdeSm8+gHbRpabu5nbw/66mr3p/BYBVE/LVfxoXCiz00Ki1wf6XiSpE
	za8PN1prq6DVREZ5Gw3Uqqdujt7I=
X-Received: by 2002:a5d:6b0e:0:b0:2c7:a39:6e30 with SMTP id v14-20020a5d6b0e000000b002c70a396e30mr2049939wrw.38.1677582749883;
        Tue, 28 Feb 2023 03:12:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9oI/QD/RgvVvZBifmeDs/yaRHSeI1eCXGJYICkxBr0U4eDOUrIAvE9ljzr41EoyMJbhF+aig==
X-Received: by 2002:a5d:6b0e:0:b0:2c7:a39:6e30 with SMTP id v14-20020a5d6b0e000000b002c70a396e30mr2049919wrw.38.1677582749642;
        Tue, 28 Feb 2023 03:12:29 -0800 (PST)
Message-ID: <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
Date: Tue, 28 Feb 2023 12:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org> <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com> <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org> <20230228055016-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
In-Reply-To: <20230228055016-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
>> The question to answer: Is 32 bit x86 worth its upkeep?  Two
>> sub-questions: 1. Is it worth the human attention?  2. Is it worth
>> (scarce!) CI minutes?
> 
> 3. Is it worth arguing about?

You are aware of the problems we're currently struggeling with, aren't you? 
Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out 
of CI minutes for the second time this year, and you ask whether it's worth 
arguing about??? You're not serious with this question, are you?

  Thomas



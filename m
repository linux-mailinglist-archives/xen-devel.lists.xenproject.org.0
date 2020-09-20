Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FCA271883
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 00:57:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kK8Ff-0002C7-Ne; Sun, 20 Sep 2020 22:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHan=C5=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1kK8Fe-0002C2-S7
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2020 22:56:10 +0000
X-Inumbo-ID: 604145aa-f1e5-4ad8-a165-ee3afc7a5dcc
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 604145aa-f1e5-4ad8-a165-ee3afc7a5dcc;
 Sun, 20 Sep 2020 22:56:08 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z19so7517488pfn.8
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2020 15:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0cXQG9o2GcHMOn8RkT2ARkw1I1bF8kleiMVr4nRZYMs=;
 b=EDnRqAgZzWWNmzBAIIecWpSYw8k3qxOC8/eEQGLKn7HQGeTRrapiny/wIlxvNrvP4L
 8unQXlvd8JanwaMx8/n3RgIkd8RiDZr1FZ3ChAAEm4uRGYDHI0SFscHju0g7WRvS8p5H
 HI4XGgi1FAaIaFsu8Q99I9sm+zJG6SOahph5zeJIAPcTyEnWYvVhDaPsv6uY6MrZ900+
 xnestqg69/Eww7sEoX5sw7AGPwy4c3Pm0G3ZhdvKs4fEf70tyYMbLy6KM9Pgp0k+WAvq
 7NB5lqMjDfzSwOeOZb63BhWD+4q+KmMkjyjM4AmEZitugPm+DzpFrvz3oUTSRUS9VN+R
 aa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0cXQG9o2GcHMOn8RkT2ARkw1I1bF8kleiMVr4nRZYMs=;
 b=Qiqgh6LHm5ZFSZwWNmvBkGO9UEOIrfLgwkdQ9y4bGHQt83M5mZu9brbuX4+HfJQuw/
 0l7XONovXUajIvHGEO6XmPNDV8iSkUl0euPPDSNUgwbOsTFrHLPz76KKC4WBvwYEcioS
 rqKuNI29pOBX+EEhKNW0lsHsW/pv6U7cHY3n0vcnm2OvdzEgLw6nZBbk7kedVbCmHxdx
 Wvz61CMxkv1aqUNjqgv8yFG2zYKpRUOycHUlnAqougkzNR3wj3yL1zgYBt6/01DsS8ZC
 RWZc2PaEVzcTrnDw3mp2P6TRY5S7eN48i8kvGzBnLnuTTrbkVEtrKyKHDvFuGr7Oz9cc
 bS8g==
X-Gm-Message-State: AOAM530DDpSWqnIhDZswNrNkkOQ/qCqy2UL1jzhTrv1545HQCFChpSfm
 ThY/THg15wE+GrZGfHo2lla+dg==
X-Google-Smtp-Source: ABdhPJzb8+gUfaJ64aI2itWPiPG1IOEJQwu5SoQqOg0zpebFfehKDLi3OsgWIBkIkGxxp2VJtuFr0g==
X-Received: by 2002:a05:6a00:1b:b029:13e:d13d:a101 with SMTP id
 h27-20020a056a00001bb029013ed13da101mr40056631pfk.29.1600642567552; 
 Sun, 20 Sep 2020 15:56:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 64sm9937860pgi.90.2020.09.20.15.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 15:56:06 -0700 (PDT)
Subject: Re: [PATCH 0/2] qdev: Let BusRealize() return a boolean value to
 indicate error
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200920114416.353277-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8ae3d44-24c3-4e89-3181-27eb759e3e78@linaro.org>
Date: Sun, 20 Sep 2020 15:56:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200920114416.353277-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/20/20 4:44 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (2):
>   qdev: Document qbus_realize() and qbus_unrealize()
>   qdev: Let BusRealize() return a boolean value to indicate error

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


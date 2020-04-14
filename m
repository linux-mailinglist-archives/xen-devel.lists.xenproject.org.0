Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595281A8DD7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 23:41:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOTI0-0005Vg-TK; Tue, 14 Apr 2020 21:40:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ja/k=56=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jOTHz-0005Vb-4A
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 21:40:15 +0000
X-Inumbo-ID: 86112d38-7e98-11ea-b4f4-bc764e2007e4
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86112d38-7e98-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 21:40:14 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id ng8so5882685pjb.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2020 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+YdJ1eItjRB7ItTRPS1yzNOPMwATBGKtFqeGB8AgldY=;
 b=h+Eo7SnvIra0gg12SjTsJNQK7hUY+z1MG5p0nKh/xlrWsdcbkSQRExUNzO/QuF5LBq
 nK+gerPPGcDw1dky7bWHAqeQp8QM3oxsP2k5TFzYVWzZkjJvZT9B0G623T5XtGX6sISR
 AsOK2k9fq0tA6tc8Xrq91NmtabQMcdJr3WLFXjdE/qGCKZCOnri3+Ys0GnKZt3ZYg1g5
 KvE9GdB3QSSzSziY7/SdTZZfBh1MYelqsMXUNXL7f1BUMIfWIGiSP46OQMHEcZENFaZt
 OK716l6AJ5iNivPu5/aXilPD2ztEdkBYE4E+00VClFsmzjbpDFgWdZnftHI0I4QwhcQt
 l1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+YdJ1eItjRB7ItTRPS1yzNOPMwATBGKtFqeGB8AgldY=;
 b=oN8lxHwZw+9FKuWeAFmIP2/LH+8522z9WUJzpAABjaoUpilIBLRTVW1xUO1dgedku2
 vLD9GM9MFuI+8PaLnZiP3IUE3qDA/g12RgMugU4hAhxgTyX0N7IeIn++4ByL7+t7ETdx
 /4XLzUsKT0X8/pQh0Lv6u0vdJDdRDdTfSaLvmcZCYB5mKfnmiuWhSk7uQkuugpaZN3/A
 1RVK9qTQ/2AQqvmJqVcKdrF8B0kXWh1kg8Mpa6Svke23gkjkWIU7g8nvXNHPQE0UJruq
 rcRYoj2wzsfrFGb+pZHpDP7RwonsxA338x2cC1jcXUaCuWp0s+KnbSNKSfqvHpecrJl4
 nuSw==
X-Gm-Message-State: AGi0PuZ0p7K5/HnlSt9b5LuIZo2mqsQC6CWx6aBTcS0ZNR1k0aYEGR53
 Rke0fDJyAVyIzT1gFqdKnTf13A==
X-Google-Smtp-Source: APiQypJH6XQewev6YQtlp+dBP1DIMMkffzfDkFrLt+FaPiM0Gp4zPaFkO3wCEw34bPMGeI/wlc0ovQ==
X-Received: by 2002:a17:902:8d8d:: with SMTP id
 v13mr1951273plo.260.1586900413217; 
 Tue, 14 Apr 2020 14:40:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a136sm9012385pfa.99.2020.04.14.14.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 14:40:12 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 0/3] various: Remove unnecessary casts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200412210954.32313-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1478503-cab3-df6a-1aae-50b262e9121e@linaro.org>
Date: Tue, 14 Apr 2020 14:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200412210954.32313-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 4/12/20 2:09 PM, Philippe Mathieu-Daudé wrote:
> Remove unnecessary casts using coccinelle scripts.
> 
> The CPU()/OBJECT() patches don't introduce logical change,
> The DEVICE() one removes various OBJECT_CHECK() calls.
> 
> Philippe Mathieu-Daudé (3):
>   target: Remove unnecessary CPU() cast
>   various: Remove unnecessary OBJECT() cast
>   hw: Remove unnecessary DEVICE() cast

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



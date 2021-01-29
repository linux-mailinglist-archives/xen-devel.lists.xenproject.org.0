Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DF308DF0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 21:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78474.142765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zwb-0008BT-AB; Fri, 29 Jan 2021 20:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78474.142765; Fri, 29 Jan 2021 20:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zwb-0008B6-6p; Fri, 29 Jan 2021 20:00:37 +0000
Received: by outflank-mailman (input) for mailman id 78474;
 Fri, 29 Jan 2021 20:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfjn=HA=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1l5ZwZ-0008Av-Ft
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 20:00:35 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e1277e84-a8bf-4f0b-940f-793119ab12fa;
 Fri, 29 Jan 2021 20:00:34 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-HDn0UoUJNoKb_Hd-EKz71A-1; Fri, 29 Jan 2021 15:00:31 -0500
Received: by mail-ed1-f71.google.com with SMTP id a24so5441155eda.14
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 12:00:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id pj11sm4191062ejb.58.2021.01.29.12.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 12:00:29 -0800 (PST)
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
X-Inumbo-ID: e1277e84-a8bf-4f0b-940f-793119ab12fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611950434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVEYpakw4HHdDoqcExVcZsz86uTSmkCvfjjA6rSOslg=;
	b=SwJ4Zwldaq7KDTqAVBtSmKHv/hRVWrPTJiEqdnCCCI0RIpxX7PwHWlMsYLuCLtoBbZiQSO
	4y70CXfxxj6KBTs23yM1uIzkjXNN1ctRqADN40v79Uz138QpLh9+HoO1uRa+x5ptIgfYM1
	LxWaxzEt05/vMhCSt6sRow4KT4DDbG4=
X-MC-Unique: HDn0UoUJNoKb_Hd-EKz71A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mVEYpakw4HHdDoqcExVcZsz86uTSmkCvfjjA6rSOslg=;
        b=B0U+sSShgWxBDibAlsiqa2Tx6T92O48Mxu+MhQG4l/esB+nLddGEK+0EjQ9eTi3bwa
         QNrJq90TkXrFrQNyAYNqwMgt3BEZhCWJNJyXsE8Jkw/bviV2SHSs4TDfyQZ01dg5iTPk
         ettN1GiV2DMyki7YmVE4jyvwyzGJYdnnxS81a1N57ICjZis0viP18LBzm/I0rJHo2WP4
         xyyZ85jpne8ULZefz2ToF+mEBBGVzfHvcTsRn2jONmYC08vcpa23l3vnUbmg4vtc05je
         ejXj0xCIQHDfvT36lcorKPw+dX8e+FIoCV6MicceGuFLf1Uv5Au1eSy2B/ND31IuRa7H
         Tr3Q==
X-Gm-Message-State: AOAM531358gzd7552+ve1gmbwTqbrpDeowyYzZoBWk8n5uYivntOvzKa
	YLtPJqvF8b3AdrOnZ2tbpr1VJE1Q+0/RFVGMMV7KmH03uQw3BGHWP4ltw2JHVkWveAU08Q/da23
	xh/HKUKnIllxJZGEkc8jSJ9Jcrs5NOyDsEDVZyF0CVSmO5YnhSA0hHVEcqy35r/pk6jLwIZaBbk
	TAddk=
X-Received: by 2002:a17:906:4bc1:: with SMTP id x1mr6312736ejv.509.1611950430378;
        Fri, 29 Jan 2021 12:00:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/38ux/JEv1LTOPMmgAikXz5wTlQUmfOHkmwIKEZv/MSW6nj4msZSVvIv3ybx1JEYLjGZ03w==
X-Received: by 2002:a17:906:4bc1:: with SMTP id x1mr6312695ejv.509.1611950430180;
        Fri, 29 Jan 2021 12:00:30 -0800 (PST)
Subject: Re: [RFC PATCH 2/4] hw/ide/Kconfig: IDE_PIIX requires IDE_ISA
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, xen-devel@lists.xenproject.org
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-3-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <353b0024-605e-d764-e1ab-7e50caa88e6a@redhat.com>
Date: Fri, 29 Jan 2021 21:00:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129194415.3925153-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29/01/21 20:44, Philippe Mathieu-Daudé wrote:
> hw/ide/piix.c has a strong dependency on hw/isa/isa-bus.c:
> 
>    /usr/bin/ld: libcommon.fa.p/hw_ide_piix.c.o: in function `pci_piix_init_ports':
>    /usr/bin/ld: hw/ide/piix.c:141: undefined reference to `isa_get_irq'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ide/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 41cdd9cbe03..0f5d316558b 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -17,6 +17,7 @@ config IDE_ISA
>   
>   config IDE_PIIX
>       bool
> +    select IDE_ISA
>       select IDE_PCI
>       select IDE_QDEV
>   
> 

This is also incorrect, it should be "depends on ISA_BUS".

Paolo



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29451F8D85
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 08:11:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkiKH-000886-6s; Mon, 15 Jun 2020 06:10:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGgL=74=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jkiKG-000881-4z
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 06:10:32 +0000
X-Inumbo-ID: eab6973a-aece-11ea-8496-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id eab6973a-aece-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 06:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592201431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v0ZBhyHuoiYyIG2YYqP1P0uyVeNRSfn/RhvYQHNps+U=;
 b=HR6d5Y+q1w//srC9pRimcOPORa7wRTn9MnMviPyx2d4YBD22o7CCLNQlu7jMxOxS+IWnqU
 yqPT7HrZroXfV2oMLsMWFtgBQTWMj+CNQo1y7tbW9M/1pevlbzdqr/soEDOKCshWaJNcHR
 ApXNYgrG50azP9BI+N2x3n1tYw/Vuwg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-qMlZqkgFPYemA-KQkjQUVg-1; Mon, 15 Jun 2020 02:10:27 -0400
X-MC-Unique: qMlZqkgFPYemA-KQkjQUVg-1
Received: by mail-wm1-f70.google.com with SMTP id t145so6246973wmt.2
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 23:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=v0ZBhyHuoiYyIG2YYqP1P0uyVeNRSfn/RhvYQHNps+U=;
 b=aA0tL2yhPgxT3ac23ZtUUaVPsuU5Sg7d2zMgPBEvQYJaghSpimlvAFME76ABqJaodz
 P7w1wrXmm6DXcDXip4TfsEd/E10K6hOZExvxvw3WbD0CHJJBGgIrcxVVPwDMvuuBilq/
 v8FXCfIsr36fxM8pMZ41Z05NutKAtXziiD47IvdmCyIsp54ktxBFaTsQfKqw9S6ATmfV
 cgP+euFL2UvZWINvsOMS7f2nzJ3EZJIy1ZxDuUB5Jd4U+nUaQdO7eYXath7pEUFXsAi2
 lDuE02RiNpo7kmSlsOHnsCzlrY3LG1BetRU+aw6uB6OQOCN8d3LvYiOgxpLb0w9BWgZE
 w2nQ==
X-Gm-Message-State: AOAM5309nQLHKTJ6giGYJbNYY64Dz199Sln4fzoHKELkshsSYPXnGzfC
 liJ95zZWZmNrjrLZ2BWwLjQUus91Rr2yTSvvZrS2ntpMMDZmKusC6YeEC6uFjWv4BxROBGpKT2/
 KxOAgPUarrSof+O55wIeF3AuMgV8=
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr25875575wrx.141.1592201426757; 
 Sun, 14 Jun 2020 23:10:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ2Uwva95g66+gjqRckuSUADgj2I6e2bVoFdTcJbxlN75hZn1xWlAEG9LV2gFxHDZZU3txZw==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr25875553wrx.141.1592201426585; 
 Sun, 14 Jun 2020 23:10:26 -0700 (PDT)
Received: from [192.168.1.40] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id 88sm24672875wre.45.2020.06.14.23.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2020 23:10:26 -0700 (PDT)
Subject: Re: [PATCH] hw/xen_pt: Don't grant opregion permissions
To: Grzegorz Uriasz <gorbak25@gmail.com>, qemu-devel@nongnu.org
References: <2157e10d63619d43151fe8b8ca913b44c54aba6e.1592176600.git.gorbak25@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <acbe023e-def7-18b5-dc67-604221e4e1df@redhat.com>
Date: Mon, 15 Jun 2020 08:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2157e10d63619d43151fe8b8ca913b44c54aba6e.1592176600.git.gorbak25@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, Anthony Perard <anthony.perard@citrix.com>,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org,
 contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Grzegorz,

On 6/15/20 1:21 AM, Grzegorz Uriasz wrote:
> With the upstreaming of linux based stubdomains to xen, qemu can't
> assume it runs inside dom0 - permission assignment must be moved to
> libxl running in dom0. This xen patch:
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00973.html
> implements granting the required permissions to the stubdomain running
> qemu. This patch removes granting opregion permissions in qemu - this
> should be fine as when qemu is running inside dom0 the memory mapping will
> be successfully created without first explicitly granting the permission.
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> ---
>  hw/xen/xen_pt_graphics.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
> index 7d46e9c209..303674365b 100644
> --- a/hw/xen/xen_pt_graphics.c
> +++ b/hw/xen/xen_pt_graphics.c
> @@ -283,19 +283,6 @@ void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val)
>      igd_guest_opregion = (unsigned long)(val & ~XEN_PCI_INTEL_OPREGION_MASK)
>                              | (igd_host_opregion & XEN_PCI_INTEL_OPREGION_MASK);
>  
> -    ret = xc_domain_iomem_permission(xen_xc, xen_domid,
> -            (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
> -            XEN_PCI_INTEL_OPREGION_PAGES,
> -            XEN_PCI_INTEL_OPREGION_ENABLE_ACCESSED);
> -
> -    if (ret) {
> -        XEN_PT_ERR(&s->dev, "[%d]:Can't enable to access IGD host opregion:"
> -                    " 0x%lx.\n", ret,
> -                    (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT)),
> -        igd_guest_opregion = 0;
> -        return;
> -    }

Shouldn't this be somehow versioned? I.e. if the libxl does not have
the change then keep the current code?

> -
>      ret = xc_domain_memory_mapping(xen_xc, xen_domid,
>              (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT),
>              (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
> 



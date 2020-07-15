Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD7220CF1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:31:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgZ9-0004kw-T5; Wed, 15 Jul 2020 12:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlgd=A2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jvgZ8-0004kq-Fo
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:31:14 +0000
X-Inumbo-ID: 12129312-c697-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12129312-c697-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 12:31:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f7so2516890wrw.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=QHdNXpa9mboIfnxcYiH8e2qwHoHgSHKSNZWbmNm5qN0=;
 b=ipC4LPP4kT51AjTBIodCMRGeY3wTja0cjvXAsJ3HgQ82OFikIQQ7esuamuqQkrkiT4
 6S9dvbTnMZhwmI+m0mqIK9cYh+LlOOIYb5rMpZ4ioWzL5vncr9s8YLVp0WLcyyQv9sWl
 PYphrIrrgCPfcHBaKyeeHBzGAFzcoz4tb+djXVu3QzHXsY+g0Yr3U2g/rP8pnxPTsBgk
 FjCyzgHsly5QwCWX2N14iYXaHA/ugseFdSIIcfya6RH7Bkw291LRe4K3NQH8IkEbICHt
 P/h/x/OTDnsAwBbhoBKvvO2XCpjqxF19NuJaNqAHp2mlwl4MPCZ+yvecv11L4p4msq3P
 0U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=QHdNXpa9mboIfnxcYiH8e2qwHoHgSHKSNZWbmNm5qN0=;
 b=elHhLhbq4hPOpzaJ3Dr1FjKMnEv4fVSnR6Ltaq/3j4SZJr5zTf7uJVDFVh/EdFtPH+
 iKXC0qJaDVfHa+00ZDNPqWmebSZ61ZFySozTuLoStwGk9A9DIi+8ecjNp6Kj4/PbxDi3
 o0qB+Brdf9jDnViSSgn0ZKAsZHWldH6t2Ub7z8VkHm0ZIVTSbmb5c7SEFKAxWAvPI6pq
 tJCIB+G3xgyDHTdNup9V5pqbuKEhcSKKhsUUe64/vASg6r+gMBbnVh1zij36ANyc+IQj
 uwnsnSApWXI4x066uB7KCBfz0xqsCaFfjiSbZzb3BYSc23ogAuKBMnCjFgeXCGCUPB6x
 3inw==
X-Gm-Message-State: AOAM532JOg5x1BloHPccDnbUjGOKroR5RnG4xC4qSKC0i98iMLBQjPmo
 4T/snA56qxPMNwp7H/+h9SY=
X-Google-Smtp-Source: ABdhPJw8zYWZhX7NAipuS5bEckvfBxCavsC8toIZHKTV9Q40oKjTlUkMUEUo7ORbqhNghQTX5czLdg==
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr11202870wrr.202.1594816272940; 
 Wed, 15 Jul 2020 05:31:12 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id j145sm3424894wmj.7.2020.07.15.05.31.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jul 2020 05:31:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
In-Reply-To: <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
Subject: RE: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
Date: Wed, 15 Jul 2020 13:31:11 +0100
Message-ID: <001801d65aa3$d33bd090$79b371b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJIM2WedjUkwpXeO7NSr7H9rPuYmAKgm2H4qA/b1LA=
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 15 July 2020 12:57
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant =
<paul@xen.org>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
>=20
> This was lost when making the logic accessible to PVH Dom0.
>=20
> While doing so make the access to the global function pointer safe
> against races (as noticed by Roger): The only current user wants to be
> invoked just once (but can tolerate to be invoked multiple times),
> zapping the pointer at that point.
>=20
> Fixes: 835d8d69d96a ("x86/rtc: provide mediated access to RTC for PVH =
dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Latch pointer under lock.
> v2: New.
>=20
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1148,6 +1148,8 @@ void rtc_guest_write(unsigned int port,
>=20
>      switch ( port )
>      {
> +        typeof(pv_rtc_handler) hook;
> +
>      case RTC_PORT(0):
>          /*
>           * All PV domains (and PVH dom0) are allowed to write to the =
latched
> @@ -1160,6 +1162,14 @@ void rtc_guest_write(unsigned int port,
>      case RTC_PORT(1):
>          if ( !ioports_access_permitted(currd, RTC_PORT(0), =
RTC_PORT(1)) )
>              break;
> +
> +        spin_lock_irqsave(&rtc_lock, flags);
> +        hook =3D pv_rtc_handler;
> +        spin_unlock_irqrestore(&rtc_lock, flags);
> +
> +        if ( hook )
> +            hook(currd->arch.cmos_idx & 0x7f, data);
> +
>          spin_lock_irqsave(&rtc_lock, flags);
>          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
>          outb(data, RTC_PORT(1));

LGTM..

Release-acked-by: Paul Durrant <paul@xen.org>




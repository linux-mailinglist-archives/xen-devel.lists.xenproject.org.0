Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C422095C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveE4-0005hD-0C; Wed, 15 Jul 2020 10:01:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlgd=A2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jveE2-0005gz-0v
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:01:18 +0000
X-Inumbo-ID: 1fd2f6f0-c682-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fd2f6f0-c682-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 10:01:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s10so1769753wrw.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=OwSFL/9dqqsJtoE5Gx51FwuHDO2G9G77qcT4DW0dgpg=;
 b=MLKen9Dac7+Ln1LjTnQMH+tPeLZHYjNknvrLP8DBOlG59lwI+iKSaOEeHzStjH6uIr
 9htLYOvlZNg8GY57/rod4ipcBLlIgLd4MZXyAIeq9unrX38LSA6bziN/tD8yrLM/HL0x
 x+QIHJXR/vqiKrBSW0yN+oiipieYW1Yc6+PZafe7RJU9fjHwt1jCMlAwunnqklehosE9
 XNgFpWtz/cSIAvBWJXJ4q0g/Mp9kPLknPFcdYVJVNMPjZa5CQoK8r3IoXDPaeZRHOe56
 A9ZUElZfHo8LRXpq/jtvxexEPtNhIYWrWUPV2MhY26+eW0KwyXsBbaqlDWs5yXeNl3R5
 CEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=OwSFL/9dqqsJtoE5Gx51FwuHDO2G9G77qcT4DW0dgpg=;
 b=NHHBDd4+NNiLW2l05tteuugXoQpeykMklbzSt98oUY3OMSAxZPcW56CkMFZKR0Hi1v
 cgkHkt+qmtVwGkc/UWbB8939nD+yR9BS/q1UTGC44pd2WqkoU/6ZnV/cpOldNDiFKCbS
 4Xz+1BrGfkBTO6EaLzugb+KVYtsO/rDRbKJu5oN9eeToxDlDt4s0cSg7hiLiV8LH04NI
 yB0/jraYJ5jcx/CtDQe5UpbCaOJ7zAf+GZwLJvmqIb9YY5zM5+fdOZdpcO3wcgLala3L
 c5l5Gyw06+oT/UfcXPc83/vx9otowRmHzkL1yF0uHkKZBvnPBqkATG418er0nwjm6ROB
 ocqQ==
X-Gm-Message-State: AOAM5332hZCaq6M0BgOXmLJV4D7TLT6xTcCl70Z6ZK5nB2kD1+cfBQSN
 Ffqa6m1UuwvuvGj6ke7H1/U=
X-Google-Smtp-Source: ABdhPJxNtGMHGj2Xx7RiUug5Xg5H3HALDE+w+pKGBXCw7MOOs9FxtMgWMtesm52FzQLuJim0UVnyWg==
X-Received: by 2002:adf:eec2:: with SMTP id a2mr10369846wrp.127.1594807276683; 
 Wed, 15 Jul 2020 03:01:16 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id u2sm2468011wml.16.2020.07.15.03.01.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jul 2020 03:01:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <416ac9b1-93d1-81a2-be19-d58d509fdfec@suse.com>
 <59f26856-d23d-bb69-0403-39e77acbf85c@suse.com>
In-Reply-To: <59f26856-d23d-bb69-0403-39e77acbf85c@suse.com>
Subject: RE: [PATCH v2 1/2] x86: restore pv_rtc_handler() invocation
Date: Wed, 15 Jul 2020 11:01:15 +0100
Message-ID: <001301d65a8e$e10e1260$a32a3720$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH810IKdkrzCSlAezDylIfWz5DUNADle+uqqLRCwlA=
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
> Sent: 15 July 2020 10:47
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant =
<paul@xen.org>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: [PATCH v2 1/2] x86: restore pv_rtc_handler() invocation
>=20
> This was lost when making the logic accessible to PVH Dom0.
>=20
> Fixes: 835d8d69d96a ("x86/rtc: provide mediated access to RTC for PVH =
dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1160,6 +1160,10 @@ void rtc_guest_write(unsigned int port,
>      case RTC_PORT(1):
>          if ( !ioports_access_permitted(currd, RTC_PORT(0), =
RTC_PORT(1)) )
>              break;
> +
> +        if ( pv_rtc_handler )
> +            pv_rtc_handler(currd->arch.cmos_idx & 0x7f, data);
> +

This appears to be semantically slightly different to the old code in =
that it is only done for a write to RC_PORT(1), whereas it would have =
been done on a write to either RTC_POR(0) or RTC_PORT(1) before. Is that =
of any concern?

  Paul

>          spin_lock_irqsave(&rtc_lock, flags);
>          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
>          outb(data, RTC_PORT(1));




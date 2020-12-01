Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF12CA384
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 14:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42018.75566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5VA-0003dj-F7; Tue, 01 Dec 2020 13:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42018.75566; Tue, 01 Dec 2020 13:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5VA-0003dI-Bl; Tue, 01 Dec 2020 13:15:28 +0000
Received: by outflank-mailman (input) for mailman id 42018;
 Tue, 01 Dec 2020 13:15:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EuF=FF=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kk5V8-0003d9-IZ
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 13:15:26 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f7492e2-814e-4c98-acf4-a4b3dd7f5980;
 Tue, 01 Dec 2020 13:15:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so4041561lfc.4
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 05:15:25 -0800 (PST)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id d20sm198780lfe.174.2020.12.01.05.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:15:23 -0800 (PST)
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
X-Inumbo-ID: 5f7492e2-814e-4c98-acf4-a4b3dd7f5980
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xpUvP3GsuZ5Zr8GiUBIEZ3Q5BpQaKqmylsT1wwgYw8s=;
        b=ODQLz2yczPSppQnvYLKeg1TWErMot8t/pR0qN81cqdpACQ6yPuAD6PqFFCZXuwDEJS
         bp3UpnTpw7jLOvdlFllO8n2fQa8s+LIAWCTBiOhWSsYHvJkPfg00KIYahV1INIFIx3Wh
         reyDCHN40XQt3Dco3Xrx0ViU9jFTnRU5IIwfJi4e6KFN6WQCs6d0nw7ubq5DphZaHdn3
         dyY3Z9xd+JFevwhC23rK07/bn2e7+wIBfWu4Y6/VH/5OPbYjaclyrLOSPPbZDOKIAhFX
         bPqgjg+dxIWEa37JBCmApo21sH8dTAfwlGEyHVNljjozdjnF0q9Dqus/jet0kAZgcmWV
         uzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xpUvP3GsuZ5Zr8GiUBIEZ3Q5BpQaKqmylsT1wwgYw8s=;
        b=rYI9TB/r8eafxOMOhK6Z1zT46knHU3TMNbZb4SMHq4Xcpgj88VnE46DDqtmhJG6Mwr
         ALhLIjwR99O3o6857UPxdyt7xMBTRpnv45ryKl4Z6VKuffO9b1s5XWjdk5QaEnS3ToFW
         JYvoLIEevX1GpLy1a8PbcSDAerZ7B/f04NmrTeliRwmvBf9yvEgBPgXCMuvQgfwURkHy
         +bWXW/zxKmXpKaBLcurw7xW+jZdDMCUuJmqblYkxhpkhDz5ynVPIftHC4GahyEVc7yEl
         nUiI5QNIic6EISmI2HYKlQno2wwxhYL+0zeVGSroWz/7L/sBn5SsSog5wpl1DbN9Tlda
         zPcA==
X-Gm-Message-State: AOAM531S3dZjOp+9/GiheHlAGoEkYi5UakpyIRnASriWC/9JhqOL/kru
	FRUrzEtOgIlU+AFz6p/E46g=
X-Google-Smtp-Source: ABdhPJwtlIwXmM2btWSCgdX9bRh5+0p0ovuSx9BJQdDYJwwRYpejw5hqNjg0ac2/1Xz90PUHhQ88Mw==
X-Received: by 2002:a19:5015:: with SMTP id e21mr1088305lfb.566.1606828524468;
        Tue, 01 Dec 2020 05:15:24 -0800 (PST)
Subject: Re: [PATCH v4 05/23] libxl: s/detatched/detached in libxl_pci.c
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-6-paul@xen.org>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <f9f05409-a0aa-abfc-ef98-c1012d242b2a@gmail.com>
Date: Tue, 1 Dec 2020 15:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124080159.11912-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi, Paul!

On 11/24/20 10:01 AM, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> Simply spelling correction. Purely cosmetic fix.
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Thank you,

Oleksandr

> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Wei Liu <wl@xen.org>
> ---
>   tools/libs/light/libxl_pci.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 50c96cbfa6..de617e95eb 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1864,7 +1864,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
>       libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
>   static void pci_remove_timeout(libxl__egc *egc,
>       libxl__ev_time *ev, const struct timeval *requested_abs, int rc);
> -static void pci_remove_detatched(libxl__egc *egc,
> +static void pci_remove_detached(libxl__egc *egc,
>       pci_remove_state *prs, int rc);
>   static void pci_remove_stubdom_done(libxl__egc *egc,
>       libxl__ao_device *aodev);
> @@ -1978,7 +1978,7 @@ skip1:
>   skip_irq:
>       rc = 0;
>   out_fail:
> -    pci_remove_detatched(egc, prs, rc); /* must be last */
> +    pci_remove_detached(egc, prs, rc); /* must be last */
>   }
>   
>   static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
> @@ -2002,7 +2002,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
>       rc = qemu_pci_remove_xenstore(gc, domid, pci, prs->force);
>   
>   out:
> -    pci_remove_detatched(egc, prs, rc);
> +    pci_remove_detached(egc, prs, rc);
>   }
>   
>   static void pci_remove_qmp_device_del(libxl__egc *egc,
> @@ -2028,7 +2028,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
>       return;
>   
>   out:
> -    pci_remove_detatched(egc, prs, rc);
> +    pci_remove_detached(egc, prs, rc);
>   }
>   
>   static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
> @@ -2051,7 +2051,7 @@ static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
>       return;
>   
>   out:
> -    pci_remove_detatched(egc, prs, rc);
> +    pci_remove_detached(egc, prs, rc);
>   }
>   
>   static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
> @@ -2067,7 +2067,7 @@ static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
>       return;
>   
>   out:
> -    pci_remove_detatched(egc, prs, rc);
> +    pci_remove_detached(egc, prs, rc);
>   }
>   
>   static void pci_remove_qmp_query_cb(libxl__egc *egc,
> @@ -2127,7 +2127,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
>       }
>   
>   out:
> -    pci_remove_detatched(egc, prs, rc); /* must be last */
> +    pci_remove_detached(egc, prs, rc); /* must be last */
>   }
>   
>   static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
> @@ -2146,12 +2146,12 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
>       /* If we timed out, we might still want to keep destroying the device
>        * (when force==true), so let the next function decide what to do on
>        * error */
> -    pci_remove_detatched(egc, prs, rc);
> +    pci_remove_detached(egc, prs, rc);
>   }
>   
> -static void pci_remove_detatched(libxl__egc *egc,
> -                                 pci_remove_state *prs,
> -                                 int rc)
> +static void pci_remove_detached(libxl__egc *egc,
> +                                pci_remove_state *prs,
> +                                int rc)
>   {
>       STATE_AO_GC(prs->aodev->ao);
>       int stubdomid = 0;


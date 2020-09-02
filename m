Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953925A75A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 10:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDNoD-0007T4-2N; Wed, 02 Sep 2020 08:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J21w=CL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kDNoC-0007Sw-G7
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 08:07:56 +0000
X-Inumbo-ID: 16b0d57b-b10a-4e18-be39-71c6a7700648
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16b0d57b-b10a-4e18-be39-71c6a7700648;
 Wed, 02 Sep 2020 08:07:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w5so4194759wrp.8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2020 01:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Jxvb502HLex2RsdiRrkbs9UECi8ykWjkIIXRFjsuSgA=;
 b=otAnpZP5Wf08oig91T/n9ehrdQNow/rBGkgmO76mLoSM5/5WTGl3pBHek6YVkJbJoC
 clVK/jI2vUQKpHvE4Z8sV0bqIkzql9ra5rwhw9Rsnhz/Hy5hOh1LbnwbQCauc0Gd7LXl
 v+Rx+/BsdijRfwEoLTKn0d5oljfNa8s+eeGpWiOZGj1MPXfm6eTLgzK2TCquCcE8E7zP
 x8uxKbPjw0thMe1+0yl+OoEmqPRWTMljWuqniaZi/qDXK0Mu2U6iDQLIMvgorRNfM5fA
 FcGYwsL7mvpNQKehCqzYFIBjjaXB9BOfWp1o3vyghFvFrL8QxIJF5ILfRuzJXj3zinMx
 GFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=Jxvb502HLex2RsdiRrkbs9UECi8ykWjkIIXRFjsuSgA=;
 b=ZIhw4O7Y/3VhEM2JhRD5krpm7R1BCV5EfxuHm0bsvYRpmm6lhxJ7e7JSbqEOdXV1J9
 GtCLJWnobiZpJ6lazy74TKnrLxalgp78N/iRnWJnZmHf1LngRqNCgMNJgzYolH6deQ8P
 YYawDlBIaTbCNX5tHy6tz1/sOAJ/PdNX/A+7WXbIqBgw++xddgjcioqTT9axHCwYHelH
 x3IBCqyVynoJlrbJg2inqRPgQI/c6d062dMftnssKjmTcUDKIbQBRA713UrXZAAaO5G6
 kC80a+02EUZmrOeHBf78R7zH5c0X8Ds44AOth6aBrSsHu4B19XBCX4YTilgs5iYfRP2I
 JMSQ==
X-Gm-Message-State: AOAM530cSga0zzmGcWwgPH0VYbKWZtnOCKkR/rsux68iBUh5UBHrKPU8
 LCp+tbhfsX+X6xWuZDQr8vI=
X-Google-Smtp-Source: ABdhPJwYDvVCn8lsIydPKw0wwjsELO9zmnn8AnmMaqGTQkFWbtZUlt45bB6vWf/WrUisKaiEJfLwrw==
X-Received: by 2002:adf:f245:: with SMTP id b5mr6219187wrp.288.1599034074335; 
 Wed, 02 Sep 2020 01:07:54 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:9909:6cdb:6a13:f0ef])
 by smtp.gmail.com with ESMTPSA id a11sm6404791wrq.0.2020.09.02.01.07.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 01:07:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>
References: <a417690e-539c-b1b0-a372-3aea54d5dabd@suse.com>
In-Reply-To: <a417690e-539c-b1b0-a372-3aea54d5dabd@suse.com>
Subject: RE: [PATCH v2] tools/hotplug/Linux: don't needlessly use non-standard
 features in vif-{bridge, route}
Date: Wed, 2 Sep 2020 09:07:52 +0100
Message-ID: <000701d68100$28ae4120$7a0ac360$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH9XoJWrAGbDANALd1IIDxbwsNDyKkHQymw
Content-Language: en-gb
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 02 September 2020 07:09
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH v2] tools/hotplug/Linux: don't needlessly use non-standard features in vif-
> {bridge,route}
> 
> We're not after any "fall-through" behavior here. Replace the constructs
> with ones understood by all conforming shells, including older bash
> (problem observed with 3.1.51(1)).
> 
> Fixes: b51715f02bf9 ("tools/hotplug/Linux: remove code duplication in vif-bridge")
> Fixes: 3683290fc0b0 ("tools/hotplug: only attempt to call 'ip route' if there is valid command")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> v2: Also adjust vif-route.
> 
> --- a/tools/hotplug/Linux/vif-bridge
> +++ b/tools/hotplug/Linux/vif-bridge
> @@ -77,16 +77,12 @@ then
>  fi
> 
>  case "$command" in
> -    add)
> -        ;&
> -    online)
> +    add|online)
>          setup_virtual_bridge_port "$dev"
>          set_mtu "$bridge" "$dev" "$type_if"
>          add_to_bridge "$bridge" "$dev"
>          ;;
> -    remove)
> -        ;&
> -    offline)
> +    remove|offline)
>          remove_from_bridge "$bridge" "$dev"
>          ;;
>  esac
> --- a/tools/hotplug/Linux/vif-route
> +++ b/tools/hotplug/Linux/vif-route
> @@ -22,17 +22,13 @@ dir=$(dirname "$0")
>  main_ip=$(dom0_ip)
> 
>  case "${command}" in
> -    add)
> -        ;&
> -    online)
> +    add|online)
>          ifconfig ${dev} ${main_ip} netmask 255.255.255.255 up
>          echo 1 >/proc/sys/net/ipv4/conf/${dev}/proxy_arp
>          ipcmd='add'
>          cmdprefix=''
>          ;;
> -    remove)
> -        ;&
> -    offline)
> +    remove|offline)
>          do_without_error ifdown ${dev}
>          ipcmd='del'
>          cmdprefix='do_without_error'



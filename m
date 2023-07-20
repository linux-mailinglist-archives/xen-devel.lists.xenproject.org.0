Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8875B9D4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 23:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566745.885989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbXk-0003Tc-VM; Thu, 20 Jul 2023 21:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566745.885989; Thu, 20 Jul 2023 21:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbXk-0003RI-SE; Thu, 20 Jul 2023 21:50:40 +0000
Received: by outflank-mailman (input) for mailman id 566745;
 Thu, 20 Jul 2023 21:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMbXk-0003RC-1s
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 21:50:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7645687b-2747-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 23:50:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0902F61C22;
 Thu, 20 Jul 2023 21:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A6FC433C9;
 Thu, 20 Jul 2023 21:50:35 +0000 (UTC)
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
X-Inumbo-ID: 7645687b-2747-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689889836;
	bh=spXXZGCJnxSNAofX2lqOO60SPjTHVzIo6S1jEOPrj5Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z9SItGVtKHvEMgwX4x/iJK+8ThaW/y2ZGtWq0E9S4xDROURdvfmDPRUlfoMywEoVc
	 Fhg0GOnCUSvaBhBn6XAprGtQAHiJeWZfQSLSgcT+ka3f0QSX1cvCrjjhgHtTUR/78X
	 JswXH9CWQmxBFJz83vw17R6XQbXpXtTbBrJ9lfnoSIozaCEgQj38mz4/DKAx5dTe6+
	 UQW535QEampMRAZFvbG6UqCIHrq7jaV0UABjI5KFEHNP5ErNFDt9hock5578+UaNus
	 UiSJrBeAfkA9w5ihZ3jXXM1b+mL4nVv5x2a/jNpnukSZh71AIRwYUSr/4zq+zwEjdJ
	 sYpttYcAlohQg==
Date: Thu, 20 Jul 2023 14:50:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [PATCH] x86/vRTC: move and tidy convert_hour() and
 {to,from}_bcd()
In-Reply-To: <e983103a-be32-7a77-4d7e-6d5559443f56@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307201450280.3118466@ubuntu-linux-20-04-desktop>
References: <e983103a-be32-7a77-4d7e-6d5559443f56@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jul 2023, Jan Beulich wrote:
> This is to avoid the need for forward declarations, which in turn
> addresses a violation of MISRA C:2012 Rule 8.3 ("All declarations of an
> object or function shall use the same names and type qualifiers").
> 
> While doing so,
> - drop inline (leaving the decision to the compiler),
> - add const,
> - add unsigned,
> - correct style.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -58,8 +58,6 @@ enum rtc_mode {
>  
>  static void rtc_copy_date(RTCState *s);
>  static void rtc_set_time(RTCState *s);
> -static inline int from_bcd(RTCState *s, int a);
> -static inline int convert_hour(RTCState *s, int hour);
>  
>  static void rtc_update_irq(RTCState *s)
>  {
> @@ -246,6 +244,40 @@ static void cf_check rtc_update_timer2(v
>      spin_unlock(&s->lock);
>  }
>  
> +static unsigned int to_bcd(const RTCState *s, unsigned int a)
> +{
> +    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
> +        return a;
> +
> +    return ((a / 10) << 4) | (a % 10);
> +}
> +
> +static unsigned int from_bcd(const RTCState *s, unsigned int a)
> +{
> +    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
> +        return a;
> +
> +    return ((a >> 4) * 10) + (a & 0x0f);
> +}
> +
> +/*
> + * Hours in 12 hour mode are in 1-12 range, not 0-11. So we need convert it
> + * before use.
> + */
> +static unsigned int convert_hour(const RTCState *s, unsigned int raw)
> +{
> +    unsigned int hour = from_bcd(s, raw & 0x7f);
> +
> +    if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_24H) )
> +    {
> +        hour %= 12;
> +        if ( raw & 0x80 )
> +            hour += 12;
> +    }
> +
> +    return hour;
> +}
> +
>  /* handle alarm timer */
>  static void alarm_timer_update(RTCState *s)
>  {
> @@ -541,37 +573,6 @@ static int rtc_ioport_write(void *opaque
>      return 1;
>  }
>  
> -static inline int to_bcd(RTCState *s, int a)
> -{
> -    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
> -        return a;
> -    else
> -        return ((a / 10) << 4) | (a % 10);
> -}
> -
> -static inline int from_bcd(RTCState *s, int a)
> -{
> -    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
> -        return a;
> -    else
> -        return ((a >> 4) * 10) + (a & 0x0f);
> -}
> -
> -/* Hours in 12 hour mode are in 1-12 range, not 0-11.
> - * So we need convert it before using it*/
> -static inline int convert_hour(RTCState *s, int raw)
> -{
> -    int hour = from_bcd(s, raw & 0x7f);
> -
> -    if (!(s->hw.cmos_data[RTC_REG_B] & RTC_24H))
> -    {
> -        hour %= 12;
> -        if (raw & 0x80)
> -            hour += 12;
> -    }
> -    return hour;
> -}
> -
>  static void rtc_set_time(RTCState *s)
>  {
>      struct tm *tm = &s->current_tm;
> 


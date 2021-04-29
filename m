Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7636EB3F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120020.226936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6cW-0002g2-FA; Thu, 29 Apr 2021 13:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120020.226936; Thu, 29 Apr 2021 13:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6cW-0002fd-Bf; Thu, 29 Apr 2021 13:22:20 +0000
Received: by outflank-mailman (input) for mailman id 120020;
 Thu, 29 Apr 2021 13:22:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+wV=J2=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lc6cU-0002fG-Ix
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:22:18 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d729eda-62e3-4bad-af83-eb9795582a1d;
 Thu, 29 Apr 2021 13:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 0D8F5B56005D;
 Thu, 29 Apr 2021 16:22:16 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mxzMJmped_IR; Thu, 29 Apr 2021 16:22:14 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 2E353B56010D;
 Thu, 29 Apr 2021 16:22:14 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5jb0hJhPIRwG; Thu, 29 Apr 2021 16:22:14 +0300 (EEST)
Received: from [192.168.1.35] (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 5CC83B56005D;
 Thu, 29 Apr 2021 16:22:13 +0300 (EEST)
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
X-Inumbo-ID: 4d729eda-62e3-4bad-af83-eb9795582a1d
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH] x86/ACPI: Fix build error when tboot is disabled
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <79df12ade0840338590f440cd064052a961fe23b.1619698239.git.costin.lupu@cs.pub.ro>
 <ce98780e-5a32-9faf-832e-04eae6cdfbcb@suse.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <32cb6cda-5522-02fc-f800-9e4c279e45f6@cs.pub.ro>
Date: Thu, 29 Apr 2021 16:22:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ce98780e-5a32-9faf-832e-04eae6cdfbcb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/29/21 3:40 PM, Jan Beulich wrote:
> On 29.04.2021 14:11, Costin Lupu wrote:
>> When tboot is disabled via menuconfig we get undefined reference error for
>> g_tboot_shared. This patch fixes that by disabling the causing source code
>> when tboot is disabled.
> 
> There must be more to this: Our shim config also builds with tboot
> disabled, without running into any build issue. Furthermore ...
> 
>> --- a/xen/arch/x86/acpi/power.c
>> +++ b/xen/arch/x86/acpi/power.c
>> @@ -407,6 +407,7 @@ static int acpi_get_wake_status(void)
>>      return val;
>>  }
>>  
>> +#ifdef CONFIG_TBOOT
>>  static void tboot_sleep(u8 sleep_state)
>>  {
>>      uint32_t shutdown_type;
>> @@ -451,18 +452,21 @@ static void tboot_sleep(u8 sleep_state)
>>  
>>      tboot_shutdown(shutdown_type);
>>  }
>> +#endif
>>  
>>  /* System is really put into sleep state by this stub */
>>  acpi_status acpi_enter_sleep_state(u8 sleep_state)
>>  {
>>      acpi_status status;
>>  
>> +#ifdef CONFIG_TBOOT
>>      if ( tboot_in_measured_env() )
>>      {
>>          tboot_sleep(sleep_state);
>>          printk(XENLOG_ERR "TBOOT failed entering s3 state\n");
>>          return_ACPI_STATUS(AE_ERROR);
>>      }
>> +#endif
> 
> ... tboot_in_measured_env() already has a stub returning 0 when
> !TBOOT (which is what I would have recommended instead of the
> #ifdef-ary).
> 
> If there is a specific case where the compiler fails to DCE the
> offending code, then you need to describe this in sufficient
> detail.

Yes, indeed. My bad, it is for a debug build with -O0, so without DCE.

Cheers,
Costin


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA031DCB17
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 12:32:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbiUk-00023n-Eh; Thu, 21 May 2020 10:32:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WPz=7D=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbiUi-00023i-Gs
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 10:32:08 +0000
X-Inumbo-ID: 51f14678-9b4e-11ea-aaee-12813bfff9fa
Received: from ppsw-40.csi.cam.ac.uk (unknown [131.111.8.140])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51f14678-9b4e-11ea-aaee-12813bfff9fa;
 Thu, 21 May 2020 10:32:07 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:40788
 helo=[192.168.1.219])
 by ppsw-40.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.158]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbiUf-000yE5-jc (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 21 May 2020 11:32:05 +0100
Subject: Re: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200521090428.11425-1-andrew.cooper3@citrix.com>
 <20200521102636.GR54375@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <91c7f537-1d0e-4a9d-16a8-c02fa30d2d80@citrix.com>
Date: Thu, 21 May 2020 11:32:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521102636.GR54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/05/2020 11:26, Roger Pau Monné wrote:
> On Thu, May 21, 2020 at 10:04:28AM +0100, Andrew Cooper wrote:
>> When compiling with SHOPT_OUT_OF_SYNC disabled, the build fails with:
>>
>>   common.c:41:12: error: ‘sh_remove_write_access_from_sl1p’ declared ‘static’ but never defined [-Werror=unused-function]
>>    static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
>>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> due to an unguarded forward declaration.
>>
>> It turns out there is no need to forward declare
>> sh_remove_write_access_from_sl1p() to begin with, so move it to just ahead of
>> its first users, which is within a larger #ifdef'd SHOPT_OUT_OF_SYNC block.
>>
>> Fix up for style while moving it.  No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Tim Deegan <tim@xen.org>
>> ---
>>  xen/arch/x86/mm/shadow/common.c | 56 ++++++++++++++++++-----------------------
>>  1 file changed, 25 insertions(+), 31 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
>> index 0ac3f880e1..6dff240e97 100644
>> --- a/xen/arch/x86/mm/shadow/common.c
>> +++ b/xen/arch/x86/mm/shadow/common.c
>> @@ -38,9 +38,6 @@
>>  #include <xen/numa.h>
>>  #include "private.h"
>>  
>> -static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
>> -                                            mfn_t smfn, unsigned long offset);
>> -
>>  DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
>>  
>>  static int sh_enable_log_dirty(struct domain *, bool log_global);
>> @@ -252,6 +249,31 @@ static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
>>          SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
>>  }
>>  
>> +static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
>> +                                            mfn_t smfn, unsigned long off)
>> +{
>> +    struct page_info *sp = mfn_to_page(smfn);
>> +
>> +    ASSERT(mfn_valid(smfn));
>> +    ASSERT(mfn_valid(gmfn));
>> +
>> +    if ( sp->u.sh.type == SH_type_l1_32_shadow ||
>> +         sp->u.sh.type == SH_type_fl1_32_shadow )
> Using a switch would also be nice IMO and would avoid some of the code
> churn.

Good point.  Happy to do that if Tim agrees (but I won't bother sending
a v2 just now).

~Andrew


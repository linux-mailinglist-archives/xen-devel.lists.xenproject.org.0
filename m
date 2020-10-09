Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6F7288CEF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 17:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4814.12651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQuSx-00086Y-66; Fri, 09 Oct 2020 15:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4814.12651; Fri, 09 Oct 2020 15:37:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQuSx-000869-2y; Fri, 09 Oct 2020 15:37:55 +0000
Received: by outflank-mailman (input) for mailman id 4814;
 Fri, 09 Oct 2020 15:37:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQuSv-000864-V1
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 15:37:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcbe69b2-efd8-44e8-bc4a-716041cc72e8;
 Fri, 09 Oct 2020 15:37:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQuSv-000864-V1
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 15:37:53 +0000
X-Inumbo-ID: dcbe69b2-efd8-44e8-bc4a-716041cc72e8
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dcbe69b2-efd8-44e8-bc4a-716041cc72e8;
	Fri, 09 Oct 2020 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602257872;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=MqELPW85u3V6N1YuIxAnqJS9yS1izLKsf8w1e9+5eaY=;
  b=Ewx12Vps+QKuET4TIL7gm974URhEsjUIiKhbyd7djwjKlc61oRuxu93d
   LYw6+Qs/VOCBWk3vxJqhdI7wcCLjCR21r5UAzWBe8aV8NHcon8ZwagSWo
   DfNUenVS5WkPvuZ3rSjLakTykhYiL2RZppR5VfCgrAwJZu0Zb/qXw5GE/
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hls6j+yGQbNmoNMn3vxSr1eOhlrXR539K1m/G0oGpENTckNXZc1c/6UtUR2YI0P+VzsMaiePjs
 CBdUUqsgOFAteygzV9Khr7vLaXYnzFjXppas0r59BNHfW8CiE/h6qBDCQXUA94kZlnCPrTjGlj
 abIxhOxtZ8rbmRqy5ne3wWgCPKLg6HZ1ZUXhXkHDkkxhdDyWiLBahJ3thjjzlMECIIBNg17sXi
 VAlmq++vM3AbHPiJYJDfFIqV/By1eiGzBdSR+YHg9/HJX5XbzBsBHTfT4sA0xIEP3NwBw8hD+1
 D+k=
X-SBRS: 2.5
X-MesageID: 28938944
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,355,1596513600"; 
   d="scan'208";a="28938944"
Subject: Re: [PATCH] x86/ucode: Trivial further cleanup
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20201007180120.27203-1-andrew.cooper3@citrix.com>
 <20201008074920.GI19254@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <42681884-d622-5eca-6384-c4e91bcb3444@citrix.com>
Date: Fri, 9 Oct 2020 16:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008074920.GI19254@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 08/10/2020 08:49, Roger Pau Monné wrote:
> On Wed, Oct 07, 2020 at 07:01:20PM +0100, Andrew Cooper wrote:
>>  * Drop unused include in private.h.
>>  * Used explicit width integers for Intel header fields.
>>  * Adjust comment to better describe the extended header.
>>  * Drop unnecessary __packed attribute for AMD header.
>>  * Switch mc_patch_data_id to being uint16_t, which is how it is more commonly
>>    referred to.
>>  * Fix types and style.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks,

>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/cpu/microcode/amd.c     | 10 +++++-----
>>  xen/arch/x86/cpu/microcode/intel.c   | 34 +++++++++++++++++-----------------
>>  xen/arch/x86/cpu/microcode/private.h |  2 --
>>  3 files changed, 22 insertions(+), 24 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
>> index cd532321e8..e913232067 100644
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -24,7 +24,7 @@
>>  
>>  #define pr_debug(x...) ((void)0)
>>  
>> -struct __packed equiv_cpu_entry {
>> +struct equiv_cpu_entry {
>>      uint32_t installed_cpu;
>>      uint32_t fixed_errata_mask;
>>      uint32_t fixed_errata_compare;
>> @@ -35,7 +35,7 @@ struct __packed equiv_cpu_entry {
>>  struct microcode_patch {
>>      uint32_t data_code;
>>      uint32_t patch_id;
>> -    uint8_t  mc_patch_data_id[2];
>> +    uint16_t mc_patch_data_id;
>>      uint8_t  mc_patch_data_len;
> I think you could also drop the mc_patch_ prefixes from a couple of
> fields in this structure, since they serve no purpose AFAICT.

Actually, I'll drop this change and leave the field names alone. 
Stripping that prefix will make the field names logically wrong (e.g.
data_len isn't the length of the header, or of the entire patch), and
I've got other work planned to clean this area up.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05D0ADE4CC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018935.1395819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRnWC-0007xp-4N; Wed, 18 Jun 2025 07:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018935.1395819; Wed, 18 Jun 2025 07:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRnWC-0007vs-1b; Wed, 18 Jun 2025 07:47:36 +0000
Received: by outflank-mailman (input) for mailman id 1018935;
 Wed, 18 Jun 2025 07:47:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uRnWA-0007vk-Fh
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:47:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRnWA-007naI-0B;
 Wed, 18 Jun 2025 07:47:34 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRnW9-009OPT-2i;
 Wed, 18 Jun 2025 07:47:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=VQ1ipKEYHpcMR4+lWNrV1w8Do8BanX2kgmPmoEm/3cc=; b=u+Sl56rqiPF1EstNQFHMOD7Cr0
	Ask6DRXjuV7kd52ebv9QVSNtDDpUBko+eV5t+TKcMPddWQ7uJkCCpt1ZY7jM97v7zRSBfz6LVCV/H
	CfYu+HqIWcOYhPFXWRxjNFT2I9kjhqRn2SrKfjPVA06CRPYa/pksJQC4xNsP5+P3fKJA=;
Message-ID: <7d47a2bc-3313-4d42-8b47-bfc2de1356ff@xen.org>
Date: Wed, 18 Jun 2025 08:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dt: Remove loop in dt_read_number()
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250617171358.670642-1-agarciav@amd.com>
 <a1b59e2d-0b18-406f-86e9-1b2a737a58e9@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a1b59e2d-0b18-406f-86e9-1b2a737a58e9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 18/06/2025 08:06, Orzel, Michal wrote:
> 
> 
> On 17/06/2025 19:13, Alejandro Vallejo wrote:
>> The DT spec declares only two number types for a property: u32 and u64,
>> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
>> with a switch statement. Default to a size of 1 cell in the nonsensical
>> size case, with a warning printed on the Xen console.
>>
>> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v2:
>>    * Added missing `break` on the `case 2:` branch and added ASSERT_UNREACHABLE() to the deafult path
>> ---
>>   xen/include/xen/device_tree.h | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index 75017e4266..2ec668b94a 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -261,10 +261,21 @@ void intc_dt_preinit(void);
>>   /* Helper to read a big number; size is in cells (not bytes) */
>>   static inline u64 dt_read_number(const __be32 *cell, int size)
>>   {
>> -    u64 r = 0;
>> +    u64 r = be32_to_cpu(*cell);
>> +
>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        break;
>> +    case 2:
>> +        r = (r << 32) | be32_to_cpu(cell[1]);
>> +        break;
>> +    default:
>> +        // Nonsensical size. default to 1.
> I wonder why there are so many examples of device trees in Linux with
> #address-cells = <3>? Also, libfdt defines FDT_MAX_NCELLS as 4 with comment:
> "maximum value for #address-cells and #size-cells" but I guess it follows the
> IEE1275 standard and DT spec "is loosely related" to it.

A lot of the use seems to be related to PCI. Below an example from [1]:

     pcie {
         #address-cells = <3>;
         #size-cells = <2>;

         pcie@0 {
             device_type = "pci";
             reg = <0x0 0x0 0x0 0x0 0x0>;
             #address-cells = <3>;
             #size-cells = <2>;
             ranges;

             wifi@0 {
                 compatible = "pci17cb,1109";
                 reg = <0x0 0x0 0x0 0x0 0x0>;

                 qcom,calibration-variant = "RDP433_1";

                 ports {
                     #address-cells = <1>;
                     #size-cells = <0>;

                     port@0 {
                         reg = <0>;

                         wifi1_wsi_tx: endpoint {
                             remote-endpoint = <&wifi2_wsi_rx>;
                         };
                     };

                     port@1 {
                         reg = <1>;

                         wifi1_wsi_rx: endpoint {
                             remote-endpoint = <&wifi3_wsi_tx>;
                         };
                     };
                 };
             };
         };

"reg" has effectively 5 cells (3 for address and 2 for size).

 From a very brief look, I couldn't find how this is interpreted. But I 
don't see how dt_read_number() can be used in this case. So I think it 
makes sense to restrict. The question though is whether it is a good 
idea to cap the value and behave differently from Linux.

Speaking of which there are another fun different behavior between Linux 
and Xen in DT. The default size of the root #address is 2 in Xen (see 
DT_ROOT_NODE_ADDR_CELLS_DEFAULT) which is spec compliant. But Linux will 
use 1 (see OF_ROOT_NODE_ADDR_CELLS_DEFAULT). I haven't seen any issue so 
far, but only notice recently when working on a separate project 
recently. I am still undecided for this one whether Xen should change 
because technically a Device-Tree should nowadays always provide 
#address-cells and #size-cells.

Cheers,

[1] devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml

-- 
Julien Grall



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A4A9F346
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 16:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970758.1359357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9PHd-0003IP-LQ; Mon, 28 Apr 2025 14:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970758.1359357; Mon, 28 Apr 2025 14:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9PHd-0003Fh-I0; Mon, 28 Apr 2025 14:16:33 +0000
Received: by outflank-mailman (input) for mailman id 970758;
 Mon, 28 Apr 2025 14:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEkc=XO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u9PHc-0003Fa-NT
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 14:16:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6093e9c5-243b-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 16:16:30 +0200 (CEST)
Received: from CH0PR13CA0011.namprd13.prod.outlook.com (2603:10b6:610:b1::16)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 14:16:22 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::18) by CH0PR13CA0011.outlook.office365.com
 (2603:10b6:610:b1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Mon,
 28 Apr 2025 14:16:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 14:16:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 09:16:21 -0500
Received: from [172.25.248.240] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Apr 2025 09:16:19 -0500
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
X-Inumbo-ID: 6093e9c5-243b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ic5yw7cPMEeMqAB2p7Nq07EoA7kqDVoC6EhUS8tcWifQnYB0528vDM/PuQcxq5Xq5958gAO5GQkEleGBX158g1lZLIlS0n//6RPdq+hdUjLNPRcjdvPwFOt67mWY+dfCzlA2rv8vAhLSgRjd1XMzaI00K63LjLXhOMwhXs0hzJpNx8LGPUJBzRwdYJKmAXDWNdYzz3tx+GqgYlhiRLPImCPNNdbI3yui0cSTDNYgbpwD/WF3EQVMasmVPke0iIBnwqENBrjad50YB8ui8QQ8oYI8qnGrIYbcszNPA5TOWwN96wCT7PgYwBRj4Xs5fjjfKyy0hu1l7F0nTDlOoqWoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D0fFafS/kw76rFV9iiHuOE1eGpvm0wG2hji52nqB1g=;
 b=A3t6aY2zMlYSHssHkbngFiciQkYlgOYmEJFgqYfBfaXlcdpUNc5y7t3k8TTAFkovspYuABK4CjUooK3qRTjxMYLv092MuCQmCkdIAq0EAIiBFyrohIa0lrGnhmWV32k3J7rOfjAsuUGwn6zctqGEocI+ZCzKlS8KKzzQO3FLCDkBQ/7zvlv8GdETvrUYob016q72CVRdAdClsQWSTMZu9qTKbEnYeY3YLwiYhju5wzKJKlk8L3fqUUctVLvgYyd2ZYRUOs9dHVrUug0Jz9t0DwM7HDJdsatpxwFXSHph5XBTP5rQbn0yLdE8zFRO1AQ9gZpLdApZx4GXw9x2gI4SIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D0fFafS/kw76rFV9iiHuOE1eGpvm0wG2hji52nqB1g=;
 b=bbYy2GHE9unRrGF9obO2o/mZYA7s4O0PRTJxBwn9isHUR1GUIpP3xX5DAaQP06XthfzsPWYw25IyNSZe7kOctO9axcp7IsgNNslw3qbkcZu0qi5yiXEn+2d7lKuQFOnfYAuBZFICF0l7Zp7nZeeHf0C81U4t0PI4yv3QGYB9VBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <780b34b6-c23f-4e43-a3c6-6630b397e664@amd.com>
Date: Mon, 28 Apr 2025 10:16:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 33/38] x86/boot: refactor bzimage parser to be re-enterant
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: <stefano.stabellini@amd.com>, <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-34-dpsmith@apertussolutions.com>
 <bba25fca-171a-47dd-881b-4746d76bd16a@amd.com>
 <e7894126-d639-4a9c-b600-2287efe6666d@apertussolutions.com>
 <f179661d-5487-421d-b033-41d5d51591c1@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <f179661d-5487-421d-b033-41d5d51591c1@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c736f63-0919-48f7-d96b-08dd865f40d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDQ0elMzN091eFJFblN3YnU4U0xxaS9GM3doNkt6TUVDVzV0OXFHaEdHeWtn?=
 =?utf-8?B?bzNuUXhXcHRnVENGaDhENGRNdU1uL2dPbTJJTk56b2ZFOENsbCtzZDhSZk1u?=
 =?utf-8?B?bVd4UlZkbGhkNEtDNlNRUDBqdm0veDJVQnR5SGZ4M3ZlcmREMVVnd2czMUpj?=
 =?utf-8?B?MlY0TkJZd1NhT3lJMDVTRzBYbG5QQllOZzcrTGNyMnplZWN4cGZaemVPUGs0?=
 =?utf-8?B?U2kxZEpSa2ppY1ovLys1dVhYeFlkNU1KQ1lYcFNOeE9Hekx0Q3VKa3RHcHJM?=
 =?utf-8?B?NHMvM2hvdWcvRUR3amxkOFlySHVxWXA2NGFPSGRHNWtNdmNPVVdIZHlSODcr?=
 =?utf-8?B?dlpPa3dWUjN1dktMQXpGbk9Ic3VZYjU2RlpDZkp2dkVialVBbDZkeHRscDVt?=
 =?utf-8?B?QURpaGtvQ1Z3MXZMVHJ5amdwSzVGM2lTNXpMR1VwWktCR2pDbnh1YVFWQzJ0?=
 =?utf-8?B?enZLNVFWMlZjWlpGOEJTL1U5TGJCMlBkWFJZQmx3d1JRZXY3ZmloS3MyQWo2?=
 =?utf-8?B?amRkVmNualVOSXV1OHBiVmdQNWJBZHg5d0JvL25Ld0JzNmxiRE5LT0xDdHNF?=
 =?utf-8?B?b2U5M3ZUNVhUWWNGZ2JqNk1TcUZLaUJQZkk0MzE4RVZXcThvYUZPOEdVaXVQ?=
 =?utf-8?B?M3BKbjlrdTJhRVJUcE5rNjMxTnQrZG1FdkZwbitTTGtVUXJxK0cwSWdNNDJK?=
 =?utf-8?B?dkRERFo3OWtQM2JQMXlITEhYcmlSZkFvb2VKZkhpNkZrZGczUWNLRVNXa0w5?=
 =?utf-8?B?TTQzRnBsbWNXK2o4WmJvSi9GdW9oQUhxQTFYemI2amZwNzhvUFhSRElwS08v?=
 =?utf-8?B?RHRISUtiNk9QR2piM1k1U09GblRrd1p0bFl5RTE5T3FwNTJIK3d0c01tZ3U3?=
 =?utf-8?B?cVFDdVhBUW9lS1JnNkRGV1ZNeHJhQTlpbkZyZncrMFN0MzljVlArNHBVU2dH?=
 =?utf-8?B?REZ3TlQvYmpjR1Iwb0ViSERuUzQ1Ty85RnBuZGJMVjhBeXRvM1g1eW9DTWo2?=
 =?utf-8?B?MnBML2JkM2pzMk1zcTFhK1Yxbi8xNyt3NTdIWm5TZE1DNHA0OThzcXorSkNW?=
 =?utf-8?B?NW1DcmYwZU13S2JUbW9pbURpeGZlUkRHMFkyQ1FKN0VIbzE4QmdKOXRGcUlh?=
 =?utf-8?B?WVBlMXowNUorakdOVlRxUjlmZU5QOXlzZmpIMUdIdHFHMmJjeW9UK3QwQ01M?=
 =?utf-8?B?M3BLZU1SaE1PR2VDUG5COXFndnFaRmdwa0gxWXJzb0l6cjk4MnZLSGtsVm5k?=
 =?utf-8?B?Q2dJeWVmZjhlQmNZODZEMzBmN1JXL2RWZklHVjJKajRYWUk4TUdwcmJXUHY1?=
 =?utf-8?B?RG9SNm4zdEVid05uS0FLMmNzVmYyaUNkTGVNRVl5TU0xRVA1NG05YTkwdG16?=
 =?utf-8?B?SXE4MGVjWktNQVBjS0lUeXlHM3cveXVoaDdRbjFYNGlaUFFHNzhwbTFvSXVm?=
 =?utf-8?B?WC9mWWkxNjNNS0UvODNWbllna3lJUTRxd014YjQ4TGJrdGNXdDlxY2VZWEl4?=
 =?utf-8?B?MUdNOEhSbzczT1FJQ096WkJWaWtqbkZPcFB0MjNJbVZvcHR3b2VtNmxHZGxF?=
 =?utf-8?B?Z3NMMFdNZnk4NDcrTFB1dExLSDE0QnExWkRhN3ZhUzJGUlF5WlR1Vis3c2RT?=
 =?utf-8?B?VHRDbitiNUcvN1dhOHNLZjltd1dEclNYWXNFNUlnK1hBZDhWdnNXMDhLbVZL?=
 =?utf-8?B?Ly93cDl2VjFSU2dQc0FnYTByeXBxV09FOEp0WkY4WW5QbmFib3NlakkzTHRO?=
 =?utf-8?B?Z2lpZ1lLSlUvYVVaZzhyZjdQOVppQ3ZnSTUrNVQwSFRpMmN6YVZwME8vZW1y?=
 =?utf-8?B?dnk2Zm8zZDBFQ3FUQkUvL0YvZG9KNk9nWjZZVXhtNGlJQzliMm91dVQvOXdh?=
 =?utf-8?B?Sjdkam53RHFMdHczeExWUjhyaW05MUxBV0xBV3JjRlpFZDlNVlN0ekQ1M2I5?=
 =?utf-8?B?K1J3VEUrM2N4a3ZURWFmaDYxUTlmQVh6Z0V0RFFtaXQyZFIxT2h4WE1lL1pi?=
 =?utf-8?B?MEVWdndFVHgwRVg5Tk92Q1VvY0t2djZSbG9hUFQ3cm42VWlwVDI5ZzNPcmNn?=
 =?utf-8?Q?huH/oi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:16:22.3226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c736f63-0919-48f7-d96b-08dd865f40d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269



On 2025-04-28 02:41, Jan Beulich wrote:
> On 26.04.2025 03:53, Daniel P. Smith wrote:
>> On 4/23/25 15:27, Jason Andryuk wrote:
>>> On 2025-04-19 18:08, Daniel P. Smith wrote:
>>>> The bzimage logic uses the unit global orig_image_len to hold the
>>>> original
>>>> module length for the kernel when the headroom is calculated. It then
>>>> uses
>>>> orig_image_len to locate the start of the bzimage when the expansion
>>>> is done.
>>>> This is an issue when more than one bzimage is processed by the headroom
>>>> calculation logic, as it will leave orig_image_len set to the length
>>>> of the
>>>> last bzimage it processed.
>>>>
>>>> The boot module work introduced storing the headroom size on a per module
>>>> basis. By passing in the headroom from the boot module, orig_image_len
>>>> is no
>>>> longer needed to locate the beginning of the bzimage after the allocated
>>>> headroom. The bzimage functions are reworked as such, allowing the
>>>> removal of
>>>> orig_image_len and enabling them to be reused by multiple kernel boot
>>>> modules.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>    xen/arch/x86/bzimage.c             | 38 ++++++++++++++++++------------
>>>>    xen/arch/x86/hvm/dom_build.c       |  3 ++-
>>>>    xen/arch/x86/include/asm/bzimage.h |  5 ++--
>>>>    xen/arch/x86/pv/dom0_build.c       |  3 ++-
>>>>    4 files changed, 30 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
>>>> index 66f648f311e4..32f0360d25b4 100644
>>>
>>>> @@ -103,13 +100,20 @@ unsigned long __init bzimage_headroom(void
>>>> *image_start,
>>>>        return headroom;
>>>>    }
>>>> -int __init bzimage_parse(void *image_base, void **image_start,
>>>> -                         unsigned long *image_len)
>>>> +int __init bzimage_parse(
>>>> +    void *image_base, void **image_start, unsigned long headroom,
>>>> +    unsigned long *image_len)
>>>>    {
>>>>        struct setup_header *hdr = (struct setup_header *)(*image_start);
>>>>        int err = bzimage_check(hdr, *image_len);
>>>> -    unsigned long output_len;
>>>> -
>>>> +    unsigned long module_len = *image_len;
>>>> +
>>>> +    /*
>>>> +     * Variable err will have one of three values:
>>>> +     *   -  < 0: a error occurred trying to inspect the contents
>>>> +     *   -  > 0: the image is a bzImage
>>>> +     *   - == 0: not a bzImage, could be raw elf or elf.gz (vmlinuz.gz)
>>>> +     */
>>>
>>> This comment seems a little independent of this change, so maybe it
>>> should be submitted separately.  Also, I think a better placement would
>>> be next to bzimage_check().
>>>
>>>>        if ( err < 0 )
>>>>            return err;
>>>> @@ -118,21 +122,25 @@ int __init bzimage_parse(void *image_base, void
>>>> **image_start,
>>>>            *image_start += (hdr->setup_sects + 1) * 512 + hdr-
>>>>> payload_offset;
>>>>            *image_len = hdr->payload_length;
>>>
>>> @here
>>>
>>>>        }
>>>> -
>>>> -    if ( elf_is_elfbinary(*image_start, *image_len) )
>>>> -        return 0;
>>>> +    else
>>>> +    {
>>>> +        if ( elf_is_elfbinary(*image_start, *image_len) )
>>>> +            return 0;
>>>> +        else
>>>> +            *image_len = *image_len - headroom;
>>>> +    }
>>>
>>> I don't like this extra indention which includes the return.  If you
>>> retain orig_image_len as a local variable, and set it above at "@here",
>>> you can have a smaller diff and leave cleaner logic.
>>
>> Right, but I find it sillier to be checking every kernel for elf when we
>> know it's a bzImage. While the elf check is fairly simplistic, it is
>> still multiple value checks.

bzimage_parse() needs to handle:
ELF
compressed ELF
bzImage

bzimage_check just returns
+     * Variable err will have one of three values:
+     *   -  < 0: a error occurred trying to inspect the contents
+     *   -  > 0: the image is a bzImage
+     *   - == 0: not a bzImage, could be raw elf or elf.gz (vmlinuz.gz)

The elf_is_elfbinary() check is needed to detect plain ELF files and 
skip decompression.

> Even without any extra local vars the above can be
> 
>      else if ( elf_is_elfbinary(*image_start, *image_len) )
>          return 0;
>      else
>          *image_len = *image_len - headroom;
> 
> which would already address the "extra indentation" aspect.

Yes.  Thanks, but this actually helps illustrate how Dan's change is 
incorrect.  Well, Dan's elimination of orig_image_len makes *image_len 
correct later, but I think there are further issues.

     if ( err > 0 ) <--- bzImage case
     {
         *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
         *image_len = hdr->payload_length;
     }
     else if ( elf_is_elfbinary(*image_start, *image_len) ) <--- ELF
         return 0;
     else <--- compressed ELF
         *image_len = *image_len - headroom;

My addition is to the bzImage case, since that is what I saw breaking 
and fixed.  Setting orig_image_len in the else of the bzImage case would 
not fix it.

Later changes:

 > -    output_len = output_length(*image_start, orig_image_len);

You drop output_len...

 > -
 > -    if ( (err = perform_gunzip(image_base, *image_start, 
orig_image_len)) > 0 )
 > -        err = decompress(*image_start, orig_image_len, image_base);
 > +    if ( (err = perform_gunzip(image_base, *image_start, 
*image_len)) > 0 )
 > +        err = decompress(*image_start, *image_len, image_base);
 >
 >       if ( !err )
 >       {
 > +        printk(XENLOG_ERR "%s(%d): decompression failed, reseting 
image start and len\n",
 > +               __func__, err);

... but this is actually the success case...

 >           *image_start = image_base;
 > -        *image_len = output_len;
 > +        *image_len = module_len;

... it should be writing output_len.

 >       }

Again, please just use the minimal change from the other email.  It is 
what I've been using, so tested and working.  That is your original 
conversion with the one line fixup and much easier to review.

Regards,
Jason


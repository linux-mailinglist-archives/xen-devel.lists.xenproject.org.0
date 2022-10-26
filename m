Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63460E66D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 19:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430719.682705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onkAx-0002M3-4A; Wed, 26 Oct 2022 17:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430719.682705; Wed, 26 Oct 2022 17:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onkAx-0002Ja-1J; Wed, 26 Oct 2022 17:26:47 +0000
Received: by outflank-mailman (input) for mailman id 430719;
 Wed, 26 Oct 2022 17:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANQJ=23=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onkAv-0002JT-74
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 17:26:45 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5be497af-5553-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 19:26:44 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 17:26:40 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 17:26:40 +0000
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
X-Inumbo-ID: 5be497af-5553-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN/EZLmmdZ/Vy56e2qXhg+D38yoYGHh1EbdsyucIiTAlQpz2ail7uZi3s6G26IDXWiDDKkFadLC32jra9yhTLBKdpMGInnd1mugCrTlldygLlMXxmVf0r1RDleloYq6kfX6KCeVrGbLakgQcqNVMn86jJG2AnwNEIaeh1vvRGCzYOv+TKGqwm30S4Ym6hba0fjrFh1ukN91Nnd4yeNrBmkGAqsOsP8GLuwjifF7uCeVFVk7UEDe3mGqbXOe7LAq9Ini9iyx/5BftlIalSnXD7+UCNVLjwd9QRWnXzl3J9ctJijg9hBN1fBi/LzbHlljz1nQxrKTcSlBZOdYt+gJN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/c89O2RN4c7grri9y0r8ZWkE5NdGSrl5/WAIN50Q3w=;
 b=BpZyPwFKqNYwdsNe06rbXelu8eMiFWyp6CyKDmR9lqcvZ8jmiKTt1DkCZKpN2In9XDX+mb5VUmQp7PMIV+daJNOVYMXJ6/QoMgXLT7sn3n9g1LOrkjhXUras0x8pLX/9f39jDrwX3Kmi9c8sXNTCzNypNk9zP0pZ59fxIHLOLinGBC+ZNzZ6/m0GEl4/iK+PJFw6q8i0NoTZZdAiVV8snO0TCljIXUQUgrGKClEf75HuWCFW95VNo5BTPAnvLrak2ZFL9QXEn/8i3S0yaUBgIWrSQD0EbaBvvmRi4QdSVJwZ+xy51mGHNQGRIyz915op/9yZJ2AzoHhmUW7UhjKQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/c89O2RN4c7grri9y0r8ZWkE5NdGSrl5/WAIN50Q3w=;
 b=WJSbhftyuDoo4hM0r+te6QJlQFuvCnA4xd33TAYOi47yrigBFpGk7TlW+CKNurN62F8adYKe4XWMaXuAP/5hOE6LZzV7Wgm/T1ND7EUAezA9mrzRv2KoxDe2XW+GVpm/esdNVHg3ZVKl5EiY0POpDSA1FmznGC7gUVfbpuxrxMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c8505d52-5bf5-e233-dcac-090a546d86b1@amd.com>
Date: Wed, 26 Oct 2022 18:26:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v3] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, Henry.Wang@arm.com
References: <20221026133540.52191-1-ayankuma@amd.com>
 <95d0a8ca-9ff0-162a-02ae-8cbdc30af8b9@xen.org>
 <2accac91-d822-c493-4045-8657aed26fb1@amd.com>
 <bb8709ff-9b1a-91f4-3a73-c5f216b6b44e@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <bb8709ff-9b1a-91f4-3a73-c5f216b6b44e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0355.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::31) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 368ac13e-f11d-4d3a-092d-08dab7773e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aB0ldJ5l/QaXMGALISiA5CpAd89Blap5VCA53rpfDJAbtziSdgy7KAoy2crEDKLumawUooobDtE95kBEgS+7zOFp3wa9NVHZtJLarFu4tLNcsQdp9bwPdktEO45XIwj7x66Lopf7mmeV5Qso5IhSTPp3QgdgYeGODDUsz+hKR7pDgKJoQWWZkFaY3Bava5kL3W++CVxvXAQWyexp7rOW7WPO7P3wrq5TKpdJyGwmcJ3woUfIiHT6c7nqUkv0z/uzq1UbwjDvSRgzSCT0bJJztZtwJ0LORRSzP1zWN2HvvhFTJlbnGcMecgQW5vjzpRMbVMBvG8X2uPu0A/AL1ghDIt0sFIiiOPuairJOZyB3MGvxf5+YfeVztLDMXqXjFCtihNAdjr1Sz8d/WpnRlYChEfO0Rlm2403kGq/pB6qvwoNyqc8aK0ngL7RuwIGzDCFLnp3lc990B+oRxAEYp4FVtSC3ek6/6Mh3A4ztq2rKdRSfLyfnE7dJpXK2m7oIqx/d2bP/inFx/xOBi8wZ4qug2wHJLZpEKGZWKlGnPS0KN3yjngV+unQ1vgtI26ZWwdv98Ij1FNclM8XN9EyrBZ3GvS0oBlIeUuF6xCh2asOwt747++TN8qwjdT8/nifaiSgVxhZvub/BAw6eNvDUUdxywTmv5vSOPXWPbCXgDnTU7puLEBASWSG/oVupf2blMnjSmsJ5o9nYQqqVoq6XVHFj7DyxhWMtT46zOCw4m4CcrJVa3rGKllxhFs39RfMy2F6prP+E/7svqz+v52CcCGuEY8gcX0e8ZtBo5MzbQEI0prU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(8936002)(41300700001)(26005)(6512007)(5660300002)(66556008)(53546011)(4326008)(36756003)(66946007)(6666004)(8676002)(66476007)(2616005)(316002)(38100700002)(6506007)(186003)(2906002)(83380400001)(31696002)(31686004)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3AxUHIrbWxwbVExSytRSC93bmwvK0w1UStlZUc5cnJRb3NqOG5mc2RoQm1W?=
 =?utf-8?B?WVIzQ0Q2NlFPZHh0Zk11dXlGdGdTY2RhaDZPdERFSnAwbGloYitpdjIycVRh?=
 =?utf-8?B?SDMwRzNON1oxdlltUmt3NFkyMWJ0TlIyMk91dmFRQnFkbFR0bEpVeHpudVRB?=
 =?utf-8?B?N0htT1ZXM0tYVmZ3S3VhU2JUakR5QmRiWWo0cVpRNjhlNzh1S3l6dlFZMEF3?=
 =?utf-8?B?N2NYYVk2YnEzTlBBcHZXUXhjWHFNRmV3RHhxSHdFM09RUzZQVFhCUjQ2QzJw?=
 =?utf-8?B?eHRvdlQ0NmtGQ0RMRXdpbjRUeW5Rc2MwYVJxTDFiNUw3bjZxd3lEZVMxOFBO?=
 =?utf-8?B?ZVBaOTQ5R2FIZ05jeFZuUHdHdVZZSXMxY0ZoZ2JPUHVxcmpBTG9ZQ1JGdzJq?=
 =?utf-8?B?anRvYStYMkFaNUpvS3MvdzhMc3Nsa2tVRVZIQVdFMUcyQmZQZy9OOEUrSXBL?=
 =?utf-8?B?Z2RERllCVTNjb0cxUXJOQ1ppeHFZZXNPRE9YbzNGNnovekQxME1aaHJvK3Nl?=
 =?utf-8?B?WGlpaldJRUlqNGFPcHNXWmhaZ2c5SzZOSHdDaE9wR2ZZRHp3SGdqVkhIdExJ?=
 =?utf-8?B?SU53RncyTVhzaHhzQWZ2em5xMC9IU2VTOGNXeHlJWmJFN3NTMlV1YWhLY2o0?=
 =?utf-8?B?TzhMTnYvaXI3cmttR3lOQmZQMzRXSi9yWmh6Y0F6QmNyODBCUHg1OHowQ1ho?=
 =?utf-8?B?WlM2dEcxaFMyTGo5eVY3TVhlczJxaWNsdktNQWh3VTRLeWZoVitJQ3k1cENF?=
 =?utf-8?B?VTFIWWhlNlZaRXV5MGRDSFR2VmphSWM5LytWUnFwKzVqQmxVdUJKL0lHU2hz?=
 =?utf-8?B?TkoweHZ5Y3RPNTZMTnhCY1paSitHVSsxeU1ENVZmMzN4NG9VcEd3alhzOVFW?=
 =?utf-8?B?Mjh5aHFXdlJ6dWdhUUJ6V2doc3pnWiswWGtqTmgzUnhXeGMzZmxrN2NGTmlD?=
 =?utf-8?B?ZWNoUnhRY0xsM2NLV1pIVXRoRFJBYlpIM3g2MjRPb1NnVk1naTBSM1ZKWEFU?=
 =?utf-8?B?K3FVQWdoeVZjdzR3SlNyeXRCOG5iM1FyQW9Jb0NDTU0vM2tVTFRVSThGUHY3?=
 =?utf-8?B?WExZVnZxSmJKajkrNjVlMFlRZmFCdk50TDBOY3BBOE1JTjlSeSs0c0Z1YjJ0?=
 =?utf-8?B?cXYwaWd2T2V6MTFMdVFnYkNua3czZEVneG4xdnByWDBPUUlScElveVhTZUV6?=
 =?utf-8?B?U1prU0VLTVBQOXAzeTdPYjR3c25KT2JrdCt6cUpxMmo1V1FVMGpzTlNQSURK?=
 =?utf-8?B?L3BKQXY2djdjYm1iMmlrRWFIUHpJbGVRWEZhdm5meXM3N0RvVEtLVXQ4Ky81?=
 =?utf-8?B?Zm1kdzYxVmVSUHJVcW1RQW5xZERTOGl1alVBMlgxOGNGSVBnb1k3SlVoQkhJ?=
 =?utf-8?B?M0RCaEwzV2FzNDEvRkFkK1ZZVk5EeEwySy9oWmJtTWpQR0xJQ2F3SGNKOEpt?=
 =?utf-8?B?aWVIT2RPMU9xSTN0bmJkWWJNNzlPYzVGSUNxbHdBRVA2K3FoZ2xmSjZmWTZl?=
 =?utf-8?B?enI3MC9NdzVzMlNHWldjWG5BOW92enhXSXZBT3FuOVFiM1hRb3A0dk9XZDFV?=
 =?utf-8?B?aUlpVlBGNVpxWWZ4UURNc3NIK1dmVkRSKzAzemJYQ2JPdTIzaEJ2SXIzUTBV?=
 =?utf-8?B?NzIwaVJrWDQyZ0QyOW9BbXQ3dUlhajA1ZEJwelEzbTluU25yUXJkaXFHVUU3?=
 =?utf-8?B?c1c2c3ZKY3V2ZDAvbXJObCsvN0lEYURFZUlvZ0lLY3VnWmN4UWRDT01SWXVq?=
 =?utf-8?B?RkpLb3hKbTJhRGZ5K0ErK3g1WXdCbWg5dmtTbjJXc1lTR0IvdDliTjNDOWZl?=
 =?utf-8?B?c2JLVE13NTZxNEpBbFpMN2JTMDVrdUlGcVVIdVVydm1jN2l0MTJsZDJjeDd2?=
 =?utf-8?B?RWRmNllsTVhxR1dPZVlOTkFsUU56ZHpiMVVoQS9SSEtOaTQ3NjZoaTcvVHd2?=
 =?utf-8?B?cmc5WmRmMUp3aHZrUEcwZDVQcDNaRTZqTmQ0RnN5VU5pd2JLemgvYThQTmpp?=
 =?utf-8?B?cE01eWJ4UTlXeXlScHM3Y0l4K3R1ZzgxTTU2UWs3YWxSL1FsUTlnYVIrNTFH?=
 =?utf-8?B?eVZhN0VHOUZLWDJJUDhFRFgzaWFEeEIycHduSXlZMDlZN21Ndzc3Y0pBcHBO?=
 =?utf-8?Q?XtGf2S99pwtlIuYtZHvqFkCSh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368ac13e-f11d-4d3a-092d-08dab7773e5e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 17:26:40.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTVFrVAeaR6CnWVEwMK2Cw5d6RIugtQ/2YIojJvKtfdTKcrhFzlR3dwMFn6B1OGULrm7DCshadwY3J4VDXfZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584

Hi Julien,

On 26/10/2022 17:45, Julien Grall wrote:
>
>
> On 26/10/2022 16:06, Ayan Kumar Halder wrote:
>>>
>>> ... you also need to ensure that the writers are atomically setting 
>>> rdist_pendbase. Please correct if I am wrong, but the callers are 
>>> not using write_atomic(). So how does that work?
>>
>> I think read_atomic()/write_atomic() may not be the correct approach 
>> for the following reasons :-
>>
>> 1. __vgic_v3_rdistr_rd_mmio_read is a static function. So 'val' has a 
>> global lifetime. Thus, all the following three lines need to be 
>> protected from concurrent access.
>
> I don't understand this argument. 'static' means the function is not 
> exported. The local variables will still reside on the stack.
>
> So why does the use of 'val' needs to be protected with the lock?

Yes, you are correct. I was misunderstanding this as a static variable.

Also, I understood from Stefano that pre-emption does not occur in Xen. 
So there will be no context switch.

So, the only race is between __vgic_v3_rdistr_rd_mmio_read() and 
__vgic_v3_rdistr_rd_mmio_write() for reading/writing rdist_pendbase.

- Ayan

>
>>
>>          val = read_atomic(&v->arch.vgic.rdist_pendbase);
>>          val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
>>
>>          /* If a context switch happens here, then the 'val' below 
>> may potentially be incorrect. */
>>
>>          *r = vreg_reg64_extract(val, info);
>>
>> 2. The same holds true for 'reg' as well in 
>> __vgic_v3_rdistr_rd_mmio_write()
>>
>>              reg = v->arch.vgic.rdist_pendbase;
>>              blah, blah
>>              v->arch.vgic.rdist_pendbase = reg;
>
> Same here.
>
> Cheers,
>


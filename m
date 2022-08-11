Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810258FD49
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 15:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384595.620000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM883-0005uD-MJ; Thu, 11 Aug 2022 13:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384595.620000; Thu, 11 Aug 2022 13:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM883-0005rs-J2; Thu, 11 Aug 2022 13:21:39 +0000
Received: by outflank-mailman (input) for mailman id 384595;
 Thu, 11 Aug 2022 13:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM881-0005rd-Iq
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 13:21:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85def86b-1978-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 15:21:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4825.eurprd04.prod.outlook.com (2603:10a6:10:1b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Thu, 11 Aug
 2022 13:21:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 13:21:33 +0000
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
X-Inumbo-ID: 85def86b-1978-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nztw/jhRc4Yxl0QjqfY19ywJBfSAwBuQFsB1C4KAlXwDJ2Lf18DzJsePQhYjWOwUxlnlYpmBqTQTlpbdKr1CZHthLHZUiP3D6rlB9f5uJi0fdSwcZwdN0RtTRXv9CfH8CmbARVOxe0sRm+MkQpcaCKPbBCv1cp3U9fudWLeIZ0RbrvT+OyPfLC/OYonMRwNuJTLusItvnvoKRibfdxsrhLwRi30FZjcsIpNNTWxzI7LpS5xhBtsOQbZo06x+5R28PKLiDnod9EEmwHt7diV4qjj5WZbrDGQPWHW5mAPzSkXnEDkUfMNnCPqeFne0tMt3twHm349hquCxk5ypO1sVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2977ye/d6M8LEtJlSGpyx62Eq26xhcvUCxRD6aJums=;
 b=FYSzQFrWUVzRpzRKAuxtPUOXbMxCnDp2GHU6PcAJrGjYFQoVgN0XKT1r0rrTcZSfHEJi/PJud6WImqcrnvU1inVIuv1rI8bt71xJDiu3yxmWaWimB82wk0u9Wh+zJzBx5dsQ5aUwKUmgLndKV/L9D1SbB1ZozcmloKucwWP8W10n4SFtS6vFdGWHc+kAOsvRIGV3LUgvvwsoXY+coGQCH/Jh+dwudo6istyxYmoTie+PC5IcYf2kHsq22OSrRbDa4l9fP2avH0QABV3Q5MPQcVLbXoQX91pjxxW9CW+3BdMxQFtWfeSvjpU7ekS77Bi8DcSlMWNTcgidPEcXDR9g/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2977ye/d6M8LEtJlSGpyx62Eq26xhcvUCxRD6aJums=;
 b=YnIel7buicutcN7l9xaNRATmI0BQhj6dGuHbFxn9Fu+tkiR3zu5ISp7w78nlRTivKE4SToo7Xd7dJajmlzGtb3JpQefa1Zs25TKxVuvc26ExjbHmIQmIzpU+ZHRaDM1Pzf5Nb6uINrLCSv/Lw//qJuTOSQRDnF8FjSyb3t+VxzsEg5q5MQhyVdB9HQbSsSVSdqh92TAeLur59HbRvsYvJLXdB2mXFHMeU7ei876xuHj6VhKG73ppbjAuUrsHpUbGUPn9huI2qtlBstEMDfvy+ILHAZzTAAN4YxEUb8XUY+DBiwfgLajKigJcMbx/SFzTaSIZd9okFZrneONFArS3iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4f39c5f-d197-67c5-8781-e22ad0c0d827@suse.com>
Date: Thu, 11 Aug 2022 15:21:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] PCI: simplify (and thus correct)
 pci_get_pdev{,_by_domain}()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <ad2d9405-9712-79bd-16d7-666ce79bcb3c@suse.com>
 <45cf7907-3ff3-49bd-e700-4333c0e45177@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <45cf7907-3ff3-49bd-e700-4333c0e45177@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 055b6a0a-03b2-4069-8c55-08da7b9c68fd
X-MS-TrafficTypeDiagnostic: DB7PR04MB4825:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aA0B8leyZCukAEwvJWzUsOg+J9xJx5j6X47jtksNW58nrfkYLn8oMLgC8Ey7AotRsVytd2qXbDcBxk08PznGOdeID+CqvMViyTwv9+KsCdelnyVfOZwjeaVw6hlJl05RlOUElpA8KiQvdiQc1X2M8qCIA2GrzGDnz+JZv9kZmSvH1HmfsYArOJYtwgrbVSYWDX+2i7nI5UVV5AUWXOvTi063/LkBf/VGwcfiB9Ubr4ZKJURwdQh2Gohv7XWdMKr6SmyRBZ6x2owSygT86Xqv/nODBsWVzFF/FibYlthm/VDWWQ2DPSqInK5lqkcfLpN4rJsG2iv9p1Gf97NimUyOPbWyKzJpuDJrqSBxU+R+tispTLYCCOO1fHDiDXMQxGKNA3S95lgMAlNXMzty06BzGYT52SLGOJTSg1iHNNjiqDnHBYWF3CSaBCCVLSmwWq2duOtfPS5ZOMNYGHxHt04n8lp0L91G9KiMAxk7lid1hQjyHQyzE+z3/2ItlurtWbgZDLjOSpQDgqOay3nwBoo+Vz0+qylJLmHwLapR6HyYnFYIB/HR2JjCL9ARjpFW+DdwBVyt/T0grnU/ecTw+au9trSuXpfh29eTxukZnNajfiXp0a5mdfU/px0DrDll2Gqsg41lNgbms7Or6P+KcIkIKmyl7+RwgwmwuV2zeT8rwnuh/vz3r4OaarvLAkSpTX84n64yRYMjMcTlV2LzPXVzUOqrj79+i80pnYWXpOqt2DVIiQyRYvqLrcsskvwMdlqOAhO5S7w/he+DQujs/bPy9iA/NeAY6zcYYL59l6ojqWfZxrASZZRKy427YH8IQKpR6X1NocPTT585Tohcj8sbxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(39860400002)(366004)(346002)(136003)(2616005)(478600001)(41300700001)(26005)(6512007)(6506007)(53546011)(86362001)(36756003)(31696002)(6486002)(31686004)(6916009)(186003)(83380400001)(54906003)(8676002)(4326008)(66946007)(316002)(66476007)(66556008)(8936002)(2906002)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJiaC9wY0JPME03bUhaTU5SYm5PeXViY0VoRkVvQlVhQTgwS3RscEQ2Vm1D?=
 =?utf-8?B?c0VTRVNHOTNRdkxTcVZ1UGxNT29hOTFsbGxDSkt2aWVkRVM2UUtRdE9VVVk0?=
 =?utf-8?B?RzVnblNaL096NVVXcFlKdzUzU0NKd2QwRkxKalVkTTIzZVh2L1JhWHh6VEJP?=
 =?utf-8?B?SnkyKzhldVl4S3o0VnhGcXRoOUpxSXppaStwVzhORjE1blJUMXkzanFaNzNV?=
 =?utf-8?B?OHAvUXBrcERkVmR6SmhEWFl1S1pEeFp2azNXVENvUGNQbkMxZDQ5Zjc1czVF?=
 =?utf-8?B?UlRTU2p6b3J1QndON2FaQWM0cnZQWFRlcWN1czNEN1dpTzIvbDFqRVVmclBw?=
 =?utf-8?B?RVJqalNpM3JNQkY0UWVJd3VDWjF4UlRwZjUyQXY0S0s4U1VYK2JLSzNadVFy?=
 =?utf-8?B?VmFDUSt4b2dnZ2lvZ1FsS2lwNkIzd2RTZG9Ic29zb251dWFYRTJETyt2VitX?=
 =?utf-8?B?VEJ1bit1cTB3bFN6ZGdvY1Jzc0RkdWFXM0phTGwxcnEvSVg3ZDlCbTQwTVpr?=
 =?utf-8?B?Sm9ReFJmcGZlSytqS252azdCSkRKajBkWnpBYWhyeC9CQ0daR3F3SmVXbzIy?=
 =?utf-8?B?Mk0rcGRFOHZRODZOMW5PclFkdkJMR3RHS2VoM3FCUU02VzJFdmxlbDZFOTFH?=
 =?utf-8?B?Zm8ySVZKZVoveENaSzZTZENkNFlvdFA0aUFMYmswemk4ZVBsaSswZUtzcjkr?=
 =?utf-8?B?V0Y4NWhvYm9ZcnQ1c3pDS3F4WGtsOE54V3VLTUwzU1NLcVYvMHMrSjF5Qnlk?=
 =?utf-8?B?SmxGUE04ZnhkdHVhT3MxRVp4eWlkangwZWRhYkt2b2RxMWRjSjBMU1l6V2NS?=
 =?utf-8?B?Nlg4KzhFWjE4R1hIc1NEY2hkUnZPMFNSanhncEhsRTdiazlDL1F0dmkzQUZB?=
 =?utf-8?B?cjBYNUszcHkyWmQwd2oyTjJaN3c4bVpRc0JaQ1JXbDNyT21TTTFqSE84d1dk?=
 =?utf-8?B?TVhYQWY3bmdaQ1QxZ00vVURlTzBGMWN5THBMWTBXOHRCc0hmYjFHMllJbU5V?=
 =?utf-8?B?OXh2THVaVXBhTXg5UHlJR0huRVVGeHZmdldnWTJwK3lETjFpNWJHN2lxbEQ5?=
 =?utf-8?B?TXpoOUdqdWJyb3NmSTJYL1V5WDY1d0V2dWFxSlJwZG9YY2I2Y3NlUGVUUExS?=
 =?utf-8?B?RmdRc3phSmhNWEFUdFFta0IwOFZtL0NMdjc4dkk5eENoVjdRSjdXcy9UL3Na?=
 =?utf-8?B?NFRELzdjUERicnpHMWlxbGdhcldlTUttN2EwYmlzU05sQUgvRnF4Z3huN0pQ?=
 =?utf-8?B?Z2pCaXR1TE1YSXNRMkdZS21WSW9iNGVjTU5KM0F2RHVON09pOEdpMXhLb3Er?=
 =?utf-8?B?c0EvbTAzNWZPVjBHU2syYkxzWEtwRW5PTGYrOUdnVGtOTU5udUcvMzZNUllV?=
 =?utf-8?B?WHZuTkJpQVlKRGtTMnZDeFVJWkhsQ0RrY1MxUWxPWE0waEdYNjRyNG1uN3hG?=
 =?utf-8?B?LzBkTUtnMmNYcG1RUkxxbHdDMURiUHRFWEJOT0lTSmZPRW5kM0dWcE1NQjla?=
 =?utf-8?B?Y3l1R2RqdGZLWjBjK3VHN3J5ZHVDNVUxS0owei93OUh6L1hDVFNWV20rd1M5?=
 =?utf-8?B?SXU2bnF2K0wvWUNwNVNxK1lDNFlvZHpMZ0ZuTWt5cVg5bXJFN2hSRS80VzZt?=
 =?utf-8?B?NjJ6Q0tVcXJhMU0vUGdqS0daWHBRcVFMd05KbER2SW5ibk4xdUZ3b1QrUUxJ?=
 =?utf-8?B?WExoMU1hUUVWbEd5cXJ4a2lDdSsxWklubmNCOUhzQkxoaXc5VllhZUxNTTFT?=
 =?utf-8?B?OEc4a2p2TXc4T2VZRGZKNXVpcm5XVFJnR3pZQUlxYlhlY1UyT2djazVKaDF5?=
 =?utf-8?B?WHFGSTFFaFkrM2RCYWVCVWUyR2FYRmNrZGVkMUVxRUNUQjVTWjJWa1dXY3lW?=
 =?utf-8?B?SFRvRERibkRRamRRenpKWDEyZTQ0c0o5U1MvVVQ4bERjK2lyOWJCbWkxaEts?=
 =?utf-8?B?SEg3SFRHalVKcWlLd095QUN6ZmhVVEdWMmxOWWdOTWpZYUY1YnYzNkZkT0tQ?=
 =?utf-8?B?NGlsNVE4WXAyV1hQdnJTZ2tUMUtjTVJkTXdmNUVGdTM3dS90akNBZ2d2dGwr?=
 =?utf-8?B?VTRGcVRvbWVtb0xnT0J0cjc4b3RoTkFYdHBSSm8wdU5VRjZCWWVXWXBBL2ov?=
 =?utf-8?Q?IYhy5vQWbIaWj19kdS/YVf2i5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055b6a0a-03b2-4069-8c55-08da7b9c68fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 13:21:33.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FR4tn60qPcmdjeJX/O/nM2YWc52tlbMpWjuXxNa3QnelTDCBZJC6GzGW1GW+GrC7AJy48HJVEX7pWc0N3m1LpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4825

On 11.08.2022 15:11, Andrew Cooper wrote:
> On 11/08/2022 11:51, Jan Beulich wrote:
>> The last "wildcard" use of either function went away with f591755823a7
>> ("IOMMU/PCI: don't let domain cleanup continue when device de-assignment
>> failed"). Don't allow them to be called this way anymore. Besides
>> simplifying the code this also fixes two bugs:
>>
>> 1) When seg != -1, the outer loops should have been terminated after the
>>    first iteration, or else a device with the same BDF but on another
>>    segment could be found / returned.
>>
>> Reported-by: Rahul Singh <rahul.singh@arm.com>
>>
>> 2) When seg == -1 calling get_pseg() is bogus. The function (taking a
>>    u16) would look for segment 0xffff, which might exist. If it exists,
>>    we might then find / return a wrong device.
>>
>> In pci_get_pdev_by_domain() also switch from using the per-segment list
>> to using the per-domain one, with the exception of the hardware domain
>> (see the code comment there).
>>
>> While there also constify "pseg" and drop "pdev"'s already previously
>> unnecessary initializer.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> I'm not totally convinced that special casing hwdom is right, because
> quarantine devices are domio not hwdom.  But I also can't identify a
> case where it's definitely wrong either.
> 
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -177,10 +177,10 @@ int pci_add_device(u16 seg, u8 bus, u8 d
>>  int pci_remove_device(u16 seg, u8 bus, u8 devfn);
>>  int pci_ro_device(int seg, int bus, int devfn);
>>  int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
>> -struct pci_dev *pci_get_pdev(int seg, int bus, int devfn);
>> +struct pci_dev *pci_get_pdev(uint16_t seg, uint8_t bus, uint8_t devfn);
> 
> I was going to make a request, but I can't quite get it to compile...
> 
> Passing sbdf as 3 parameters is a waste, and it would be great if we
> could take this opportunity to improve.
> 
> Sadly,
> 
> -struct pci_dev *pci_get_pdev(uint16_t seg, uint8_t bus, uint8_t devfn);
> +struct pci_dev *pci_get_pdev(pci_sbdf_t sbdf);
> +
> +#define pci_get_pdev(...)                               \
> +    ({                                                  \
> +        count_args(__VA_ARGS__) == 1                    \
> +            ? pci_get_pdev(__VA_ARGS__)                 \
> +            : pci_get_pdev(PCI_SBDF(__VA_ARGS__));      \
> +    })
> 
> this doesn't quite compile as a transition plan, and I'm stuck for
> further ideas.

Just look at patch 2.

Jan


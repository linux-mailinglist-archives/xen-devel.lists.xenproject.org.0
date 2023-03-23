Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A036C65EF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:58:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513770.795274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIeR-0003EG-F8; Thu, 23 Mar 2023 10:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513770.795274; Thu, 23 Mar 2023 10:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIeR-0003BY-Bp; Thu, 23 Mar 2023 10:58:35 +0000
Received: by outflank-mailman (input) for mailman id 513770;
 Thu, 23 Mar 2023 10:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfIeP-0002ks-Ne
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:58:34 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe12::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a62b58d3-c969-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 11:58:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9468.eurprd04.prod.outlook.com (2603:10a6:10:35c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 10:58:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 10:58:28 +0000
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
X-Inumbo-ID: a62b58d3-c969-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms6+e0MpbToAS0qSVxfu0FMlVYUlSySCm3ZMWx4c1DtOvXTi700pAG+IcN1rdx5eBUdFG3dRDwmu4KwqGtowCgaoXQtVnMFJkDn9zGMn4b6TP/wD5nEqmFUEiDwJKxHRpA7mAkDObdv05JBbOwnGbm/A9PM4mPYkgv9MtqFriEURo1BzC868QCZ7fy8DNrEF1O0+zISHJWC91o3PZuh3YOo0Mm3+6QgJhdFBox0yRiNIeq8lCuAQRrUeKjceOKAD9CK22eLbPY7zXFiJ1hoQka3nsPZz+4JHlopSAdC8K7V/Dd4Ub+U8ciFWgAOmwOuMA7FYASRT6HocWT4HZ1MM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKE1EvudVfirDBO6xWdOtPzzq7iJxnFxu+e0rK1aHt4=;
 b=AxWCYWzzdZakPOJw2u4T+giIUzvO1OpKKETJVY2ChIG1KPZJoZByxag+VBh4O21142RzhVygX93x0qsKY5HkUNtti/1vOHzyCwas+t1VkH8G8+F1/pz1c11AYAWThV/CX+5F4F7i71Scczjj7MmOisUKP6NMjoe7gzgPB5wRxZVzn6uSbPbBjpodhUQwz+DEqZhEQvxuAFqyPDjC9yyBObaiv4Fo7n1lAZjqf8X/HkBOcKtcb4AjfC0M947DrZaZNabtL44wv/PDVCMzJtVG2i1zoWXB+Z0VRSeF/Bms/ERnL3d4wqlGEXtDxH87wFtSBgv9N21wQDfM6Th+E92Vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKE1EvudVfirDBO6xWdOtPzzq7iJxnFxu+e0rK1aHt4=;
 b=jY+Uxzk8gV+t6YwrNdVbkBHU2n34Yw71wxZzItc48JLP1eLBbvkY0ULYTvrBA+geBksp4Hw3MVp1VkX6qS8U6rUlEgU+WOylInTDMQmh/3C/Bp8N+QmGrr3Sc1WU5Uhbl1x4S/hezX0wnNW/ASl3l7eXoQ+f6FOMw7MXNSz3oeIZ7RSLJIUjX7brFPOPFIHZ8lLKqta9y6N3AQnx5GPIMfqKGAHfX1E85IOj5qaVQwK9fVh7+uN4QOMUSv/WC15V8s5aIr1xQtzOpeIIp14mOLT+iCunP92QShVFxRSq8H9l7170qSJC3uf3hCmFFHtjvMsxUPZWmotBlVx0yJmcwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9fd699f-9965-bbb1-bdd1-890350cc9238@suse.com>
Date: Thu, 23 Mar 2023 11:58:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230322143001.66335-1-roger.pau@citrix.com>
 <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
 <ZBs1c7ILtkRQOzki@Air-de-Roger> <ZBs2BKAfoRap1CjC@Air-de-Roger>
 <d526b87a-374a-8d78-f66f-cf71537790af@suse.com>
 <ZBwku+X6dgqFqdeJ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBwku+X6dgqFqdeJ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: aace6d79-bd14-4a46-bed3-08db2b8d8860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jU6wKZhHsYNhsNkUmj3OqlZ3xL2nEMwjBqRGnEKECJrlKiegYSwCpfZJ7inIiiObqKTLkpttHd9eXFFV8Ud+fyXZaSB66bZ/S9VAY/r/C45SqExDm0w6tykFDsAFVbg1796Ghm445ckY8OU/boVZ8z1uwFApvheDX2qyPR++AZcUSBBZGHUFND+zAYkKMUx5sqBW7J5eS6ppV6jIwtJSL2injkKiMnlTyqgGelnC6qMVXXjNtTdNdvfuya/WRrUuNylumvoK2hcX38Ua9Yvj4sQHI79epZR/eUcAVVuzlaJVcI5HPRNybtazDfuI+uWwXyZTIx7No7YdGgYpfGXtKzBD85oUvYgk/361i0espZd/0sYQaaaubl5s72vQHsJyb/2YMLX/tXRmUtCm1/+O96qmsNsrA8mcVgCq8ZLNMu5icLWsarDCHaB6pbIYYWiXhu7ZkjHx2Ih2ejTHmN41IxWhrWuOSspjR+OqprHyI/qr9ddnSWA4ll8SyPd4Ytjqd+hUWiHntLIFLxUq7vr4BgJxsx/Z6OJS9IXurgXpLLB3ZbTmNZJi+rr3nKo0S/LeqhCDa+sSoizbuk2JygsW2nnY0H4CCf2HCgA8RTu5Y3cjBM2h3cGM5VFISSYOrXjsIGc/eDYS1ChqdhU1UC4vfurlOpDyFpqIofgTmNpdxPkx0HqzbPEMVm/e2Rzd62cVk8wwBk9+Hc9DSGVkJNUVZOObFc3VIA+oYDSMJ5ZXANk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199018)(31686004)(38100700002)(2906002)(478600001)(83380400001)(6486002)(2616005)(186003)(31696002)(86362001)(36756003)(316002)(66946007)(8676002)(66556008)(6916009)(66476007)(4326008)(8936002)(26005)(53546011)(6512007)(6506007)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU9RMVQ0NmVBUlVHai9haDJFUTJIR1JCeEUzVmZQWnZNOHJXeFc1YUtwTzVX?=
 =?utf-8?B?YWdEZ1k2aVE4eGhyRHNoZ3o2OHdsZTN2VWZGMmVONEtrTDRpWEJ4L0pQcVMw?=
 =?utf-8?B?dTgxbXJyREdFTU95RFdhOVVCWkoreUVBVHkrU29QRW9YOWl5SEFlaWdOcUk1?=
 =?utf-8?B?L0M1TW4rZ1pLL09vZzZFbkJzNXBYYnBCWWt6YlUwWkVKWjdGVmJCMjBqTUcw?=
 =?utf-8?B?MUF5Y3lhMWlUUzM5L0RDQ0RoM1lzeDdrYXdYYVVaL3NpckUybXQ2RGpqejZR?=
 =?utf-8?B?QjJwYTZORWM0UlpJdkF0NVJvTDV5OTZONGk3aHpHUWJEZ0ovQWJrUDZCLzFP?=
 =?utf-8?B?RXJWK2JXZ1A4WVh1dFBlSjVLdjR5N01DbStuREdwS0dkVWVURWJoazVqT0d5?=
 =?utf-8?B?Q0c1M1RnZnhydEx6NXF5VzQ2Q09JMDVyZnpHa0JzSTcvTzIxR3BCR0ZkSFRx?=
 =?utf-8?B?YWlDUlY2Njd0WWNHQVhnM1FnQ2lHN2R1TUQzeDB2UmFuc24weTF6N2Q1VGk1?=
 =?utf-8?B?ZkVFL2l3YmNnTW1aOXdRZGpPblhwOHl0MkZMSDFKRUkvcjRGMmpWT2xXOFNV?=
 =?utf-8?B?SlA1N0ZPY1owdC9qVi96MGh2NEZmNzNOT3YvYUl0U0gxVlQ0aFZBeWE4b0xK?=
 =?utf-8?B?a3ZrdXdVZnd5cFUzQnFGQ29BbHRLeDQ0SlhOUW1uSlU5bTZYS0pmc1NIQnJ2?=
 =?utf-8?B?dVVOZ3FlVGZFSUtvZFNlWGxTY3RpdUgrckkvaTJMTmxWbzlGZGhaYUdtR0RX?=
 =?utf-8?B?THpFM0dKOHcyeXhnQ2w0Q0JMdFNhL3NzU29taDNtcWJackRuWWJUc3pEVlVT?=
 =?utf-8?B?aVAxVis5bXRvZ1N4OWRXRWZ2WVo3eTNYN2Fxd2ZsWUUrRHQ0Zkp5OTBnUlQy?=
 =?utf-8?B?VVdsTjdTcHZzZThmdkNONnZ4Y1diMDRzQ2kzc05xTDJCdmtDYkdSUTVaL0tW?=
 =?utf-8?B?RFJFNVA0OTdFcldsUWZlcXpPK0swRkU1ekFtZWpCd2tmSXZuNzg4Ly9vYjlR?=
 =?utf-8?B?Y2VQYnhqM3N4R2tHZzlVODNzWXJZYlpuQyt6ZFpCVXNFazdsbG1uUmNtc3Zn?=
 =?utf-8?B?SGFUeUZBS3NCeTIrd2t1Um9EQ0N3MnUyeHVIa0NPY3ZLY0N3VGVhckZZNlNI?=
 =?utf-8?B?aklaejRVOUZJZVNGcnZ4bjNTelVpb0MwSnFYbTNOVXp3cFR2bHdHVHpBNnov?=
 =?utf-8?B?ZHRWUnZLS0dpaFZaek16VWtlajJ5Q09vOWJKZkdieDd1S2tGUGVDVFN2S0xN?=
 =?utf-8?B?TjI4RUtWUXN1bC9kNXBNNFZDdXZuWWNCdStvbEp0bnhOOXMyZ3NNNGVRNitw?=
 =?utf-8?B?ekJGL0xLd0xoOTlkOVRpU2lFd3AwOEtzRlVCOGdXTkVZcnZ3blA3d0JkN0pW?=
 =?utf-8?B?Q2swMDlwU0dRelM1VHZmb2t5U05ETzBHMlJSVFpBd1pJcmdrWEhCYkdvSVpN?=
 =?utf-8?B?K1k2T1FFNE5ERmw3cDNLTHljMW54bUUrcmJHN2U5bTBPL3FVOFJVc1BIUDZV?=
 =?utf-8?B?UXNGR2xUVmRYekhFVGxyaDYzV3FFOEJVVmYvNUlXN0lqYTJVWDVaWE1lZlJs?=
 =?utf-8?B?MjdCRmZMZCtoOHloVml0ZHNDRy9ScElxSFB3ckgrVkY0TDQrdlVGWlZNWUFi?=
 =?utf-8?B?SlU5RnBkNGF4RWo5b2JYKzdxUFZkT21lelk3NlJpL040TU1ORW5YK0ExTTB1?=
 =?utf-8?B?emxRa3QrSHNkcE1Lcmkxb0EwMG1yemY3bUpaVVU2eHpEUXRSZGk5T09pd0hJ?=
 =?utf-8?B?NTdJRXdlejlRdUVITlJIdzhtT2Rkd2lpejNERXI2UEdEeGdQWHhjSkwveDl1?=
 =?utf-8?B?Ry9yOFFib2VDUXZVY2IxQjlTTEZwTDYwaEhiNVpaKytCNHBMcDd0UW9SUmpz?=
 =?utf-8?B?MUU5VFVEM1FVcFVRVWhtWW10Mlp5OEJxNjZZd3RJZ3o0WXFQZUFmZk1VSCsw?=
 =?utf-8?B?MnJKSkhvcEFZTUlKU3dmTVc5aE9STWcyaWlpby9PcVRpbG1QOWd1eE0rWDRH?=
 =?utf-8?B?cXNnNTU3M29RdTlxT2tWandpc1Y3ZVVmR2NmNlBIYkdKS21hcVF5cll0L05W?=
 =?utf-8?B?eUp1ZEF3TFYvTUhvQy9qMkRpZzFVVncxblhqenNkaE1HQ2hEYnZUTU5ETTBZ?=
 =?utf-8?Q?rofWG8gEG1GR8n29H58vy6OVq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aace6d79-bd14-4a46-bed3-08db2b8d8860
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 10:58:28.3044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znq6qmUe529i267ycmwrme72c7POUsHnAlwtmkx3NBPGhfTIIUFOamprsyOW6HI3MA5Fn3iegIxqyI7pZ+nEyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9468

On 23.03.2023 11:06, Roger Pau Monné wrote:
> On Thu, Mar 23, 2023 at 09:02:31AM +0100, Jan Beulich wrote:
>> On 22.03.2023 18:08, Roger Pau Monné wrote:
>>> On Wed, Mar 22, 2023 at 06:05:55PM +0100, Roger Pau Monné wrote:
>>>> Not sure whether we should consider an access from when the BAR was
>>>> actually enabled by a different thread could still continue while on
>>>> another thread the BAR has been disabled and enabled again (and thus
>>>> the mapping removed).  It's a theoretical race, so I guess I will look
>>>> into making sure we cannot hit it.
>>>
>>> Hm, maybe it doesn't matter much because such kind of trace could only
>>> be triggered by the hardware domain anyway, and it has plenty of other
>>> ways to mess with Xen.
>>
>> Preferably we should get things to use proper locking. If that turns out
>> too hard, properly justified such an exception for Dom0 might be
>> acceptable.
> 
> Right, one idea I have would be to use map_pages_to_xen() in
> vpci_make_msix_hole() to remap any existing virtual addresses to point
> to the new physical addresses, so that there's no unmap.  I think this
> would be fine because map_pages_to_xen() does an atomic write of the
> PTE, but not sure if it's abusing the interface.  Such remap would
> avoid taking the vpci lock for the whole duration of the access.

Hmm, no, I'm afraid that won't suffice for another reason: I think these
mappings need properly removing, and already at the time when memory
decoding is turned off (hence a potential new address isn't known yet).
Otherwise we leave too much of a risk that these mappings may actually
be used when the address range has already been re-purposed (even if I
think with how the code is written right now there wouldn't be any use
in reality, but relying on that going forward seems overly fragile to
me).

I can be convinced otherwise, so let me also consider that case: One
prereq would imo be that bar->enabled be cleared before memory decoding
is turned off and set only after it was turned back on. (Unless again
we want to be forgiving with Dom0.) (Looking at modify_decoding() I
also wonder why we invoke pci_check_bar() even when we're about to clear
{,rom_}enabled.)

As to (ab)using map_pages_to_xen() - I wouldn't be very happy about
playing with ioremap()-ed regions behind vmap.c's back, but I agree it
looks like technically it would work. In case of future issues we could
introduce something like vremap() to fiddle with an already mapped
region (and then perhaps also only changing addresses, but not
attributes).

Another option to avoid holding the lock across the entire access might
be for get_table() to actually acquire a ref on the mapping, with new
mappings starting out with a single ref, for vpci_make_msix_hole() to
drop (in place of explicitly unmapping). But that would require further
precautions to prevent stale mappings to have new refs obtained on
them, so might easily be getting too complicated for the purpose. As
would (likely) any other attempt at serializing this properly without
holding the lock. Which gets to ask: Would it really that bad to hold
the lock across the entire access? Or could we introduce a 2nd (per-
device) lock just for this purpose, which might then be an r/w one?

Jan


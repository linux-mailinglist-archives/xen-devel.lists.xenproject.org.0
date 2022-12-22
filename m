Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98C653DC2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468360.727443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IEQ-0003EL-QU; Thu, 22 Dec 2022 09:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468360.727443; Thu, 22 Dec 2022 09:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IEQ-0003Bl-Mw; Thu, 22 Dec 2022 09:51:18 +0000
Received: by outflank-mailman (input) for mailman id 468360;
 Thu, 22 Dec 2022 09:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8IEO-0002i2-RL
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:51:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c257829-81de-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 10:51:14 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7528.eurprd04.prod.outlook.com (2603:10a6:20b:297::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 09:51:10 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 09:51:10 +0000
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
X-Inumbo-ID: 2c257829-81de-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzf7AkF0JzIO/GDqsdPSv97N6sB8DKJObjOpDtNcq+SUv6mt4kHRzqB5IHGDfBHRgoVzulRIcwuuqcyklPrxgtklPRpKtPJQKiGbyPnv/u5/ouKJ3rmWVCjqtGLki3MVyMv4o0FW+A4iFxgXYYQbGYrmn+rjP0300waaLc7cpT26kG95a4fp0VKrho9CUYgEG0cPQwSc4FbkL7owPJcl3VJ7h9YgG+ufRa7b9k8pC8b+eJ3ck9XPnT0jaa6oW+WefwAzJZOKIXrRvQw49k0o7hyjqzhTp/KXQ1Imz/exci7ZRUz5q90WTLidSW4VjlSLQ5eRE15/ZIis988G89+Ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAyTzXQqFMNMZCdfoumhwOeRrE0P3+BapCgzp3OSt6U=;
 b=hx/xCqvtBV8LkmM/cOhsV7zI7Q8sjiZ3Myv6+yOhhABMAjvTxI3LFSlvF2usVi0oTEuM3NVpfbe9GM3GpItXaLrFp97V1CoKX53KIW6pZwuNYTPcvV+bKZ+Y+5Wuw1XndFTrWdPwKPBid8hsVgZongzEG2zCOUNacgUM1mKDKXWBEEw/ktFvpccnBiFhh0B4cWjX7/Fi8V0XOkjXN0Hvug+euKBMAtTFHvGnkOKeyhM3Dkk66rL6Fm2bbUsY1k+L2LLi5/DpZXiyCqM54i+M69C0ZLYndvRFVZWDRntfjnCCEvYQFuDiccqevu8TRvCZNQnR/sLxudJKjss1XlYeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAyTzXQqFMNMZCdfoumhwOeRrE0P3+BapCgzp3OSt6U=;
 b=gP3ehFQjOWpvOLmPyIziAgLOi5Ts890YxWUQJzU1ERN7R01eduM3j4SSB9hmGNCiQun6FttM/FZzmZ4gkxmUnoz+HowvG3tDy8MGvPpi3wwCVllVRI5DsYukI6DUlD8lqFnG2ck1u1KhFWB2XkTHcazZqbaGtHmH7aD1jUe8uT63cvp7abX/7mtmPxWBQ8RZ7wc13egKkmuBKusFwaVdEfhS6OKBZA4iEKnsK9ZUTiW2+kAcFcufAkHQAwiYLF8GJIysCOxPIInVHZvK7yE+A/UZXI8QybTA2EHx0omHVXQJUS//Kg34r55lONog00Ui/b4uM/0za7bAk0pNFAQKMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b033f8bd-3f5d-b4a7-5197-8d098546b25b@suse.com>
Date: Thu, 22 Dec 2022 10:51:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <0026e56a0c91cb0dde9fe19200f473d720a9a950.1671497984.git.demi@invisiblethingslab.com>
 <98839620-d058-5088-da3d-4d200d70b003@suse.com>
In-Reply-To: <98839620-d058-5088-da3d-4d200d70b003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c5b83d-9609-4fbc-911f-08dae4020e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sb4r5mrlT7WNsD7ZCEJzB+UxwPXkHuk85OlXl4UxUvouSwsWNUb0CkUq6ZV5cdf+aZENA+ebBBdW2nv90gRplcbrNEwyzvkDEmY7wqctFqp3OfL7/drqG6NRElIwu4sxmERctkMB7vctn2PSk5mk+5TpXJwZ4BNCTYxjijh4v028XBQsm5vdhjlVYDtxFJ2XKcT6Vg0KyN4ndp5vVl9QMThtbJ2ZHJZo7EOJ7IAQ3SSMCfqo/QgbBTrlp+m+oFZvVD6sdU/LubDS7igDtqBUZUHt4DGV0WCL1W9pngU1D7Cr8fhSHZNWzb2esG4FWzVt/3rt0qOHCfIEZbIBTevFUUrYBbu2isgM4Zg5RpkoiKOsm5IeR3NrB6+uP+qV75UhtKPBZbEfnKlweOZhWECiqIF14tWfciXiogI4xCqrg+SFR54FRKIzb4FSZEdqM4XehllAjGDTh++HQ/EiUmn8TF7ExMGj3Axejc1aYhKruW/RAKnupkmQnP/vwKpGaWCxnvIj3cHDRJpIGr43GFEIPT4R41MvQQ0BS16ovCLllo7gKbyXmE3cAwjgsaUqFJnO4Spht+sPlUkyg7NFxfC02A2da//S/pmcIJ8QKwCoxpM4JNbvvL7XycKJkYiiapPpfwYQ8nmKYeBui/6aMka8iuVi4hfTdE4c6jN1eqJMu6s3J2hJ30sApRWbK2tabEYc11X0ZvB+L5rhZhR1CUmmYa8luVq2OrIWH2nwzKbxtGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(38100700002)(41300700001)(8936002)(31686004)(7416002)(66946007)(66476007)(4326008)(5660300002)(8676002)(66556008)(53546011)(478600001)(6486002)(83380400001)(54906003)(6916009)(36756003)(2906002)(316002)(6512007)(186003)(6506007)(86362001)(26005)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmdxaW9wWS9TRzBPQWdZQXpkU0hPeVFPUGN0bkdReDE1SXExRjJJTkhhY3ho?=
 =?utf-8?B?d0lJUEhKMXQ3eC9YZ0tleE1RUHpXTkVnNTJZOUczN2tMTnk0ME9lRGl1MFBV?=
 =?utf-8?B?eG40SUdGMXBMUkliTVE5bWg2ZGtQWnp0SlhrcVcxQ2w3R2c0OGQvbDBGcXQr?=
 =?utf-8?B?TEZYZ3RoZ3YybWxTSE5JUUx3b2lveWZ5WkNreDg2cmczMHA4cWRvMW9GclhU?=
 =?utf-8?B?WWpuaHNDaDFjeDViZWJnRzF2bENQUHpPeFhnV08wS1hWMmFML241NXhsRVl4?=
 =?utf-8?B?anVLVEM3NWExNzZTNEFxQ2Q1NURxK0dYNkRlQVNlQWlMRVduTS9YRFNtQ21V?=
 =?utf-8?B?QlJOZkRaVngrcDhoVWdONTQwRmxWY3ZxejY0dWF3MzFkekpWTEJTZlExeVVw?=
 =?utf-8?B?UE1VejB1RWM0Y1JxdHdJWlBMeHdVNmQwSVdnY1BNc2I1VWs4SjZWYlJYTjNq?=
 =?utf-8?B?bzhNK0UrL0pQR0tueDRhWWhRYmJ5cFpIUWZvU2kzRU5zZVNmcmVVbXprQldB?=
 =?utf-8?B?VkZndHdOc0V2SDR6OWxNU2pzZHpTRXNxWnE0Um91SkNNUlg0eFMxZXlTbm1z?=
 =?utf-8?B?cFFBOCt2aU8rejBwckd4VElZK0FXZGVoTHBvRlVleFplWXpJQUV3Rzhjdm83?=
 =?utf-8?B?TzhEV2pzNUFraXV3Z0w2SS9PTGwxTXRZWlVBK1JWZGRIbk9mVmdWVlorUFZ0?=
 =?utf-8?B?ejR6emJwbjZlTUZQSGR0RENvSHlhbmNaQjh0ZkxGc01USkVZdU9SOVd5NVVS?=
 =?utf-8?B?REQvTU00UG52QzgxeVg5c3VOUk82Ri8xaUVRTTNSY284bGlxZkxueWQ5czFL?=
 =?utf-8?B?MUZjZ2F5MHlXZlpOVHBPbjcwcHB3OTdJT3RTT0N3a1llYlFPRjg3ekQvMmMw?=
 =?utf-8?B?bll2a2x5OExJNTlDN2FPNlBGTnMwcVlxUVJMc205U2lNM1haLzQxR1ZSSnFB?=
 =?utf-8?B?RHFRV2t3MTYvMkhCVDZCc0dlRnM0UG1Sb3A4bzF0Zzhwd2xjTC94bHprdzBi?=
 =?utf-8?B?TlV5N0NCS3pwbzJ2NnBvMGFPNlIvSERYL1QzK0I4dVU5ZDRhemYySXQ3MGdB?=
 =?utf-8?B?TUJNa2x2dmFFc0ppRVB0WjBLTlM0TVJrZXZvTjhlNm0rNDZpclhHOHFpdXVQ?=
 =?utf-8?B?TzJDaXc0cnViaWN4RzVMd0xhOUFjc0tFdTM0aHNQRHdxdzVwUkEwRFhDSzRI?=
 =?utf-8?B?eVV3bjlEVnhwNS9KOHhEMjZWQXN1WnZzSGpYNWpQTkdGRndYV3JLUlRzN2Nj?=
 =?utf-8?B?d0NsSVozcElENXBUMXdWK1BLSVh3UzZmc0Q4RkZZUEFaYVcrYnFuTG4xd09l?=
 =?utf-8?B?SXV6bFRvWWlya1dRZ09kbzl5ZWdyQWE2bE1oNWozODgzOHUzMkFGV1VMbU9w?=
 =?utf-8?B?amJVVFYyOWtnbDhQVXhCc0tRMGRyTmhLSHJhRUJHQ3hjdEE1QlRaaUpkZGxj?=
 =?utf-8?B?YVlRdW9xU2w2RndEaTRncEtLYWNGTm1YOXlCN1NYeGtpL1U1dytBWFIxYzhX?=
 =?utf-8?B?eEFKcHpQYWxIMS96TEtMQ3piMnczdlB1SGFScFk2NDM3djlHRUJVV2ZNc0Rw?=
 =?utf-8?B?L2kwejA2V1NWSU9HT0dBQlU3UnVUTmMwTEtwaUJBRTY2N3pNYnVwNlRFMHEy?=
 =?utf-8?B?Sy82NXZwaGdTbFhsZHA1UTlJOCtSNithWjZyblpndVBXbjJiWVpJbEloMnY2?=
 =?utf-8?B?WFJVM2FsSE5JRitmdTJZOGtDUlcvTmNpMlpsOGxHL0k0bTFyc2FGRXo5YUQ0?=
 =?utf-8?B?R28wWEFiT0RYN0FRd1ZRSXFVWUd6Z21WeHhTYXAwNmVqV3RBRDg1QzBvUXBV?=
 =?utf-8?B?dVFQWG8yL1RVQTNnRXU4cWc0a2JxNjVzUzVqVUpFKzlSTVU1T2sxckwyVHF1?=
 =?utf-8?B?Mmo5ckF1WDJqZWtZWDZIc2haektZVGttZ2d4Z2c4eXV4UFl1Y2NJMEhVMDdl?=
 =?utf-8?B?N0dPQXVUbmpLWTlGWVNGWEt3QlVaeG13TGd0bGRWek53N053TytyNTNaVS9k?=
 =?utf-8?B?MGg2SGR0UXRVZENmQ0o0ckFJeGNPTlNTQXU3VXJZQmJlVWt4VkNqQnI1QVVD?=
 =?utf-8?B?N2FyNjB2Tk5QakFpdlNqY283OWtyMFdpNnF6U3pXRVJPWGhuQTA2WU5mRW5t?=
 =?utf-8?Q?J5ZCfyabG2t0dzfmIum0Zgc59?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c5b83d-9609-4fbc-911f-08dae4020e30
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 09:51:10.6415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r196gnzgsXxzqzBjhAogwFOZZDkfmLluf7yEYAvx8e3VU0NeQFc5+wlNmSANFgm37HnYRIcBtO4QANmlcmY0Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7528

On 20.12.2022 09:19, Jan Beulich wrote:
> On 20.12.2022 02:07, Demi Marie Obenour wrote:
>> get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
>> the face of future PAT changes.  Instead, compute the actual cacheability
>> used by the CPU and switch on that, as this will work no matter what PAT
>> Xen uses.
>>
>> No functional change intended.  This code is itself questionable and may
>> be removed in the future, but removing it would be an observable
>> behavior change and so is out of scope for this patch series.
>>
>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> ---
>> Changes since v4:
>> - Do not add new pte_flags_to_cacheability() helper, as this code may be
>>   removed in the near future and so adding a new helper for it is a bad
>>   idea.
>> - Do not BUG() in the event of an unexpected cacheability.  This cannot
>>   happen, but it is simpler to force such types to UC than to prove that
>>   the BUG() is not reachable.
>>
>> Changes since v3:
>> - Compute and use the actual cacheability as seen by the processor.
>>
>> Changes since v2:
>> - Improve commit message.
>> ---
>>  xen/arch/x86/mm.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..dba6c77ef2f7ed7fcb7f7e526583ccadd35e62cc 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -959,14 +959,16 @@ get_page_from_l1e(
>>              flip = _PAGE_RW;
>>          }
>>  
>> -        switch ( l1f & PAGE_CACHE_ATTRS )
>> +        switch ( 0xFF & (XEN_MSR_PAT >> (8 * pte_flags_to_cacheattr(l1f))) )
>>          {
>> -        case 0: /* WB */
>> -            flip |= _PAGE_PWT | _PAGE_PCD;
>> +        case X86_MT_UC:
>> +        case X86_MT_UCM:
>> +        case X86_MT_WC:
>> +            /* not cacheable */
>>              break;
>> -        case _PAGE_PWT: /* WT */
>> -        case _PAGE_PWT | _PAGE_PAT: /* WP */
>> -            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
>> +        default:
>> +            /* cacheable */
>> +            flip |= ((l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC);
>>              break;
> 
> In v4 the comment here was "cacheable, force to UC". The latter aspect is
> quite relevant (and iirc also what Andrew had asked for to have as a
> comment). But with this now being the default case, the comment (in either
> this or the earlier form) would become stale. A forward compatible way of
> wording this would e.g. be "force any other type to UC". With an adjustment
> along these lines (which I think could be done while committing)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

If you had replied signaling your consent (and perhaps the preferred by you
wording), I would have committed this. Now it's going to be v6 afaic ...

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DEE71848F
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 16:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541846.845030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Mcr-0002YG-7f; Wed, 31 May 2023 14:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541846.845030; Wed, 31 May 2023 14:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Mcr-0002WD-4k; Wed, 31 May 2023 14:16:33 +0000
Received: by outflank-mailman (input) for mailman id 541846;
 Wed, 31 May 2023 14:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4Mcp-0002W5-HC
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 14:16:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bccec82e-ffbd-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 16:16:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7901.eurprd04.prod.outlook.com (2603:10a6:102:ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 14:16:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 14:16:28 +0000
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
X-Inumbo-ID: bccec82e-ffbd-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVe7x3jlu8HB++0iPIOPxJY9Y5JHGH5zRSjFqp5+Um2GLFuDAbzL56hAwDGku1URowQkX9+TJExmtl1IyibqAmZ0EL6Qx/mG6J18fpnZnPfiQyfcL3mWZp76Dv8JFOesqs8vN1ARkPay/IdDAOb3OPrDGkh9IuPisRJgSV8OpcFeX1e+BwSBogwU76XDwk1aE5fCwDiMt1H7SCiV9J6w3tI/KxzXBaZvXhUvXc9FHLIh8uDE9c6r+tqTlPqMf7RiQcuMx07XW8vU6kIGZ6Xm75GW/uGtOsDFOKePGgdrzY+46KNaYS+1f5TNFK/9WPX1FdMbcuxn9ImjuHWqf5QdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CJmBLPeRlDKIRxTBOqjIyefB49v71BzfBsGzuhbnV8=;
 b=oaXkIKok5ogkKbNMjnsYgd/A28MjHTWk5YWfOINmBVCNpU/Tu7eZ/1vwBOBiln9wIuyGEPXzeAGFRBsl2P3pII297mBjzAyVu6cPA36fFhSeI8xnG1hF2X5q/POrVZ6lwriXTtcLdtApc7arYJz9UifkA2KeaPe0pHWnLBlHfzXZQ/EvXb+5etqnr8Sq3Oi4S4UosF/Wa2A2SlTDjYEx6NC0WkXczpupW31fh/0KjVqPMe7cSmQ6iqNz7RCUftFJAkPSMFoxcw+1TbBQSLhj3qirW4eV0WZLyfx79ScrwU9WbeGVCKHDlwvOJF7IkyMH3afkwkYjB4wYFEsw+5fMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CJmBLPeRlDKIRxTBOqjIyefB49v71BzfBsGzuhbnV8=;
 b=fAZziWtJv7J1W07WzvJC2NSP++ht4KYUUKjFggjtA3UuifCfyVSfQ2Sfi8RXWCm9vY4YNDPh1sFbEdyannoH/EUvqX1JGrHh5EhBaVR5eIFIo97qygdGsPneNUrRwC0ZgVvDKET7ebFqgpq6icx4oECmMGOP6zaTurV5MUc7EofI5Ir9RIGWTqNESXFC/DolKtwTatuy0KXEDmYUwy2HeQEnwJ1cJaBZwWHehkkWD2uIOFtjoMYO01/1rqaajxdfKAhqfAO9BytEAStnm3w7yseA3gDnf1HRgN/Bqq3yGxgKcxxnHbYKUOcSsejhFj9Be8+Vw79+LJl/nQbcx6ZGzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <699303a3-34a2-8a65-a33e-fa9c09a385d8@suse.com>
Date: Wed, 31 May 2023 16:16:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] multiboot2: do not set StdOut mode unconditionally
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-4-roger.pau@citrix.com>
 <b9bd819d-93ad-d511-4602-8e3f4f515546@suse.com>
 <ZHcoCcd5nugmWURI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHcoCcd5nugmWURI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: af398142-78e1-4f42-2010-08db61e19ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aSi32qqck7ALLybDH+YtMGhNQxAtS9TTTOPzduJIjBktcUGu9LN9cF9EnOGdTKayBaxP96yNF5qVsDXTDj0dr4VFLXrz6CPE59Z5nUQsWcbbQe0G2CChHZW7Z16kCHyHUPh3MdBJ8gVD8WgH4LZdP7oXCb174sk8sEmPz/GMnvOGxKiYNT5Yr/WK2A4omIPevScODMYBo1x+zzXPVd/pT2l/WKdcFhq8pcdk4or/yHxPO4VkFPWf8Nbg2VCh2A2JxVc+GlR257Lj5tmBAkovx4HbavID65i0FJOz4MMd6c8Q1rsTqyJQnfMGm0qXtXwYX+KtF5MOdLYPmLSI3Sp2v21iTmbDF6gSLy1wcmmh4PudBk7ootLWkESwlmb3UIXMhWA5QLo8ne0IBpO+5Dp8UlZ20tSX6VxZdlxvpyeadokZ2GwqEmD+W2RNx73GzTL2Hf9fXLWfXhR/kcwVE0FmsnsnR56f/QspJie0+1CitnUyXODN4CK13EzBJmp8cdE7SbTKuwdF4gvLncaw+Iuy1Hbl9HYZ5dveoO91yerikapHLFyD5TjNdm++QlOXGDffxdmjC8ZcT5ijMGuTDqhnkhOsqrc8MR7bO1XNNaCbsAUYtUD7ijB4KWo46tkg/WJpE3IhyCQR8OOwAqoOnYMrHzyRG8n8jJjaO4UhBC4+159v4VCOxfAKpcBoIiVBuDVTtzhJsOGKZ6NcTnd3sRnScw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(2616005)(83380400001)(186003)(2906002)(6916009)(4326008)(66556008)(66476007)(66946007)(6486002)(316002)(54906003)(478600001)(5660300002)(26005)(6506007)(6512007)(53546011)(41300700001)(8936002)(8676002)(38100700002)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WExCbSszV1RpeDNoRzJvS3RKQjgxZVZUZjNxM1VZK2tudW5EMUdodXZ6ZFBs?=
 =?utf-8?B?Q1dkb1ovMG5MZXVNd3VoVWlUMFFGSVk0UGU3UGVVQVBSc2o2aWJnVkkrNzU3?=
 =?utf-8?B?THVyS21xS3lkOHZtMmMzNHhKRitzbGphMER4OU9vQzRodVIxZU1TTFpJQmxq?=
 =?utf-8?B?MnQzVXJYUTlLcGFlMlpHZlI5aVVSaXZYS0M4MUdPbzRUeWJka0EzQmFVZDZQ?=
 =?utf-8?B?TGxpNmYzSkNCZnVuS3NQNi8wczJnL0twUGM1MTFhUXB3bWNLT0t2Q2NCM1g1?=
 =?utf-8?B?bjJnOWNLdDNjQ3Byc2J4cEQzVytWSGE3WTdpWlVLNFRrOVY0ZFViWC9ZcjFD?=
 =?utf-8?B?cU90eFRvY3RDVzhiaForTzZVdW1JOUxMTlhvNzlncnV3QUhUdWpzY2liVVgy?=
 =?utf-8?B?VjBQZUhYWmdwMnpOUW8wQkhTaGdRUnc5cVlaMmVXR0s0N1ZmS3NKMTc2SXd6?=
 =?utf-8?B?eUdIaDFXdytxb3lpbGNES1BHNHYrL0F2N1FjYXJRb1ZEb2krRW4yS0lCMld0?=
 =?utf-8?B?QTA2TlNMTitUN0FZNTl2eldBTzVOUlVudDg0bzl6NlpVazVhN2JQZ05nU0Yy?=
 =?utf-8?B?d082WmZQUkVVTitvSDlLYkpvWkdrOThRdmFRRFVwNjRPVGVZMytKVitLTE8v?=
 =?utf-8?B?VmNqZ0g4a2VkUlA2cFY5N3V6aW93KzNub3Fyd0g4cGZBRmdkQkEwT0NuOVhF?=
 =?utf-8?B?UW03bVk2WFVaWEIzQW1ycHB1eHZUUG1XYi92Snl4Z09QM09aL2lQRHpkTWc0?=
 =?utf-8?B?cE5KZ3FpMjJrR0hidEl4bHh3VGFjYWJDQlg3b0lVK3VJUkdaOFo0M2VWNkRE?=
 =?utf-8?B?cC9VcE5DcTZjU2o2NWllWk1ZZzFnK1VtL0tPckluM3hCZ0F5cUk5RWtXZWNO?=
 =?utf-8?B?MUpCaDJIVkxIOVJPVVVDSnZrMDc3bWY0WlJ2OXFPM1JlSHJYbmllYm1QTWNL?=
 =?utf-8?B?TDBRYjRLcjNIejJTUWxaaHFFSVVtdGkrUzVsdHZQclhtSVozTUZxUHRHSkY0?=
 =?utf-8?B?NkErbk9KRVFRbmRSMEpORGUrMmFpaXNrQnpXUXhmVGZFVWR6aFkxRzRYMEpV?=
 =?utf-8?B?QnVJTGdLN3YxV21Ec05mdEdEYmF3c0JNaWV5N3ErelZ5MnZRL0lST2RxUkI0?=
 =?utf-8?B?ekczVE4yOWNuNENSYnVGRGJJYWk3bEtJcnVkQnFKbit1QTR3cHAwcWFwc0tV?=
 =?utf-8?B?SmNtb1A3ZU9ZdEZIdXViUlhTRHZJUzZoRDZJVFE1UVROS0pOdGxDdEdUOE1v?=
 =?utf-8?B?OExPY2pDb2lCVFplYmh1Y0xVYnJDWlgwZWs5aWh1VGttNHVlTHJqTVN0VXRZ?=
 =?utf-8?B?SDI0cmRSSXpWUmF4bkkxb0dmUGMzRVVjcllZOG8wdmRlZVlWbGk5Y1ljaWla?=
 =?utf-8?B?VEJjK2dIQjB2dlZudVRtT3dHVjhPVDlaU3VvN1Z2QWxZdHg1RUtKZ01EcWpp?=
 =?utf-8?B?QmJXa0FmT1JkSmkxUmgrSGpHczd5Wkh5R3hWT2hyZXFRR0hYcW43MUwvUEph?=
 =?utf-8?B?RWNJa1ZsLzU3aTdwcG1NZlJyRzVBbzl2WWMzK3BXemhYL0diVlJieUlOU2Jw?=
 =?utf-8?B?VnJGUGlOMU5wY015eVpnYjVBVVM2N0xaVTYyZnlNWENKVm5VUFEwM2wzYTg5?=
 =?utf-8?B?dUVEWXg1eVFQWCtZMm9Gb1pzMWF3THZyb24xUUQ3M2ZuL212TUFPYlNlWWpY?=
 =?utf-8?B?cEtYT3pLWVlSMEhOVnozZSs2bmRrczJvZVZydXhMekhSVGUwTUxldGxqVVJP?=
 =?utf-8?B?UVZXUHJPSWxLT3lLVFVqRmp1d01WZk1yMDJONEFsZ0hUUVBZckI0VEVJSG0r?=
 =?utf-8?B?cjJYdXhhNXhWU25hRlowYk9Ganl1aVMxaU5kd0tST2llRUdFZnNLSEJNZTJq?=
 =?utf-8?B?dlNmMUhSSDdEOTlYeG12QW84WjJMN3NVOGZLU2dIdnFYMEF0R1RjdjhFMk83?=
 =?utf-8?B?QmdPYlRQQWNOa3ByYkdiQ2VMSytXN2xlU3AzcEkzNXdOUHNvSFJmclhTWDM2?=
 =?utf-8?B?ZUZjay9yVHdMWktMYUlwOXJBbVZiSU5BOWJoYmhNczlzMlZnV3Z3YXhjODYy?=
 =?utf-8?B?VEE5NzJleGY0QS9NTXdWSXJ6Y1hCclU4Y1NEa2hkQXN6ZlRsNkZLL1lUL1ow?=
 =?utf-8?Q?7k+6lKmvWiZ+oWrbyn6Xsc0KA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af398142-78e1-4f42-2010-08db61e19ffb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 14:16:28.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bo//3VPqGTd0pSrptWsw9QZNEs2SYEf4XNyNA3IEC+rMsZ1uivD7vYGP5wti2taHvfQn9tV2/UGyzEaEBSSMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7901

On 31.05.2023 12:57, Roger Pau Monné wrote:
> On Wed, Apr 05, 2023 at 12:36:55PM +0200, Jan Beulich wrote:
>> On 31.03.2023 11:59, Roger Pau Monne wrote:
>>> @@ -887,6 +881,15 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>>>  
>>>          efi_arch_edid(gop_handle);
>>>      }
>>> +    else
>>> +    {
>>> +        /* If no GOP, init ConOut (StdOut) to the max supported size. */
>>> +        efi_console_set_mode();
>>> +
>>> +        if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
>>> +                               &cols, &rows) == EFI_SUCCESS )
>>> +            efi_arch_console_init(cols, rows);
>>> +    }
>>
>> Instead of making this an "else", wouldn't you better check that a
>> valid gop_mode was found? efi_find_gop_mode() can return ~0 after all.
> 
> When using vga=current gop_mode would also be ~0, in order for
> efi_set_gop_mode() to not change the current mode,

And then we'd skip efi_console_set_mode() here as well, which I think
is what we want with "vga=current"?

> I was trying to
> avoid exposing keep_current or similar extra variable to signal this.
> 
>> Furthermore, what if the active mode doesn't support text output? (I
>> consider the spec unclear in regard to whether this is possible, but
>> maybe I simply didn't find the right place stating it.)
>>
>> Finally I think efi_arch_console_init() wants calling nevertheless.
>>
>> So altogether maybe
>>
>>     if ( gop_mode == ~0 ||
>>          StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
>>                            &cols, &rows) != EFI_SUCCESS )
> 
> I think it would make more sense to call efi_console_set_mode() only
> if the current StdOut mode is not valid, as anything different from
> vga=current will already force a GOP mode change.

Hmm, this may also make sense. I guess I'd like to see the combined
result to be better able to judge.

Jan


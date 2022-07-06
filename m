Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CFC568309
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362028.591877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o913z-0007go-IX; Wed, 06 Jul 2022 09:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362028.591877; Wed, 06 Jul 2022 09:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o913z-0007e4-EF; Wed, 06 Jul 2022 09:11:15 +0000
Received: by outflank-mailman (input) for mailman id 362028;
 Wed, 06 Jul 2022 09:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o913x-0007dl-DZ
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:11:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30077.outbound.protection.outlook.com [40.107.3.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94b5bb17-fd0b-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 11:11:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7377.eurprd04.prod.outlook.com (2603:10a6:20b:1de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 09:11:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 09:11:09 +0000
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
X-Inumbo-ID: 94b5bb17-fd0b-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK/pIxZj3a8Q8oCReky6g278JlnfhAuk2twxzOZXq3u3GLe/np34Gp/CquZmQQnAbBfaeQ6Dh7EoV43W2QDEx2rfQxiHA5uT3rc0wtQpJLtHibY40A3asUxRNcEIYT2D9AZJjA1/OUT8uOeI3yVvzo2iAmFHNnJcVpCNx8C7HBL784Pew4OJebg5Xn6CDgJFrooQBJZJ1chVAxfzRkE+tFiGkrm3QbE8ZETZRtrJGk1zSGii+oe8pSgxh/DNwOaYu230VKU7ivBRVoxp9ZxQsYOaJn8jNl4ymvYTHdv/hZj/hf7ToeIXR8t/ttnubG1ei3baraCYhDawrzLHOI98Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE6Grxf+1a7v6F27dwuW/AekNTIBe60veUrGoloN0qA=;
 b=a3wTgL34k0TfgFzpCcFF7U8ZwoxM6AkaQxplm3A3G39tU0r2wgLg3evngd/MU3J23V8TYQgV0jorqdsvFFTcccCaTKBQtLcGASQbHxGQcbHT2MaNBkEGIfaebpdpvmFxWV+4XoyvYQrzrgO00l/gA4q3DaswRle7EhNfVwrKMfqNIXJyGhrguj9tz4C6zaocRVaQ0hyWguf43Q+kJOE1Q0DZSwiMAZ4VTAkKXXN6uodQRVFKZYcbUTKLR/JqbRTtKvA7/VHDW4Jtd1H5yhPv7kSaPXUqAygFawTquoKoVGohkqOpqC24e0Jane8SovLWdxewIS4AsNX87V7HqDVdOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE6Grxf+1a7v6F27dwuW/AekNTIBe60veUrGoloN0qA=;
 b=X/B+vLhTUlB4K81rKKSD03+RcdB9vpM01gp4p4nJfoLoABmuj4Nv5hwG7/peRoi23t9O1DUFiMv5tIDAsbqmzbwP2+ZTE57PNWlB2cXG8WVSU2ssk61q9jS95EiyC6qTwSKF4IZlcIP2hEcYMgPynpPwkLdwb4jeBIkfVewIGrq5ceVsaHH4UEQdV+ChXbkMZOV8eHJ15H2Hmht59RZYNN1a82UBfChpxR6Oovp4lBClbORCtY7PYqvs8jNtmPxCammRcj6hWl2aHA4qZJ1pwx1SPbgdRBerKnR60V8geZQtzMRwTvMwwTt+2KudDw/rJdDZT2kvuIQazxya1XThmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26138bc9-ca9e-9dda-0002-2ff90cd8a42a@suse.com>
Date: Wed, 6 Jul 2022 11:11:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Fix compilation error with gcc13
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Charles Arnold <carnold@suse.com>
References: <46d17735-e96f-2eee-5d24-fc3d15526c6e@suse.com>
 <ca75ce19-7fea-68c2-f046-0bc2abb3d5d2@suse.com>
In-Reply-To: <ca75ce19-7fea-68c2-f046-0bc2abb3d5d2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de138004-02fa-4ab9-17ea-08da5f2f7718
X-MS-TrafficTypeDiagnostic: AM8PR04MB7377:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MC+xpoc0m+WjeeiR8HgMmqkGfGyaluCmBCyVNqzuM29qfMwEiK2UutcKroakS7rGEn3wsGoOF/7X/1p/LplHjXxdOQQ2QrYYvDzxa1iJJ1CzCo1YPDSO12xBvcH2bLdDFLJAEf8Fk6OnZZDbHRnweBhzhf4ZHmBs5WwYtIhHq/hZUa4V837Oe4dwczApMjrdG2+Gf9S4mKTgD9HAsux4f4zOsLVpO9PS4bJSEAKIdp7r5Hx6UlFD/3TamHi/7CsISA9Mv5MfmyqaJYaqQa9u/uemjHp3sJBgAymq6DXLa1+YWNAG29zg9PhfXOedK556FNku7S5o4+KjZh/Cxc40bC9RncDoqt/aBMSIXthLEozHRQCoHotorg3NjfOxK7SsFCRTXSGf99Upad3IPuOxWLFYSQB7nG15IDrD4GkWYWwWpK44gCymAf2n/Bjcb+Vis23lPWHn/UKoX8JcoLfBkFZfw99o6Cp39LD239Beo1jcQd+7dMMf0NhE1fVmC7SMJ4KXtT2SHh5UJUYUbzRXJP2+fTGym4QKsAvy0TXggekqxLcsLl3as9Knb4dVqbrfLWV/KrtJ1pBAyPhDAr2Dx6RVMpWIEEpeH7F2FHBfSo3aJ93SiKnf+CPcrVahAZebT0P0+/X1IZlzk/GRWluKQxNKKrbkgJzyAb6qFT9QR+F8cplOQhU5qKVKkVlk+rzHziT+B1xY42tJFemNamzuDYLy6ed4VVssvWq9Z6R3L0I8qU5X0ZMwtA+PzB0awcQgDG7WceqbcsAqsaN86lxt6GqUAya3pEwLfNWGhmC2kVqDEAsdP3B/0E0wOw2Oh0ITYfomoamYP8zi8MEs0vwGWiq8tqIxd7u1PHl8q99z8kM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(346002)(39860400002)(376002)(31696002)(86362001)(38100700002)(2616005)(186003)(8936002)(5660300002)(107886003)(31686004)(36756003)(6506007)(6486002)(478600001)(6512007)(6916009)(54906003)(41300700001)(53546011)(316002)(26005)(66946007)(2906002)(66476007)(66556008)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVgwbmxRTC93NkhKMllQZDVVN0x3TGxtSVdaeG0wT290dDdGMFJBQ0lqNEdn?=
 =?utf-8?B?SCtpVkU4TmJIVFkydzFTditkNzZSTERreXR5V2x3MXdUTFlzVzJtUEEyU2xy?=
 =?utf-8?B?dUhKdFpTZllLZjkzNy9HRCtEM3R4ODlqYko1eEY0bTBQalp2a0QxV0dBbHRt?=
 =?utf-8?B?WUpxQTMrMDk0R3BmWmFEMzA3SkZadkpOU2U2ZnRrWWxrYWZ3aUN3R0dTRFF1?=
 =?utf-8?B?WGlUazdJN1hjRnB4R0VrY1MwQjVyeG5VV2hKQis5d0NoYUUxdjgyQzFVZEE4?=
 =?utf-8?B?amhsUTFiNUJaRzg1Qk9ac2U0UFphU1dVb1hXL3dnYk1haFIrSUlyWU9qSVEz?=
 =?utf-8?B?QnhzZHFBTzZqWXlFWDBFY0FHak84U0FTSDZlUnFkTUw2YmdYekNsVlNTV0ly?=
 =?utf-8?B?YTFNampTb2FxRE05TnBEblJyZHNZTzZkUU1MaE4wNmxEQS96WGsxd1ZkQ2Mw?=
 =?utf-8?B?bi8zOEVGLzlZSXZydlJhaEhWbS9pUm5mdnBLVm9BZGJTSUVRT3BiVERVYldS?=
 =?utf-8?B?SlpNT0k0MWs3aUxSQzVIWDlxUXcrNk84RTNMRGZIRHJLNFhzeWEzVFlPVUxt?=
 =?utf-8?B?Wi9aNENkTlFYbVZQZ0JOcUhMdTh0UVRRMjQrelcwMlc0cEtKYzBwbUpOcklh?=
 =?utf-8?B?YW1MK0daQzkwbnFXcVF0MWdzTXdCT3o0NkF0UXZ1VkM4cENVeDc5NlV3NUJO?=
 =?utf-8?B?U3pGN2d0NmZnaGRyUEE0M1ZVcE4vV2huU3pDbDB4K3BkaGtYaS9PdlBubSsv?=
 =?utf-8?B?VGFQNXE1Smpja29ucHRWVmdTbk5sSTFrbi9JSFZ3ZGFaT0pkWDBNd2hVY0Vx?=
 =?utf-8?B?aENValBZbVZGTHBGa21uRGdaTnJEM21uajFsZER4UE9RdzVZSDUwc2UxMU5z?=
 =?utf-8?B?SllueWRBTDJyV25UeXU4YUd0OFhzOVdEb08ySUZVKzFiNkhXYzlJRitJRkRL?=
 =?utf-8?B?Ui9YSDJuOGJhU2t4U2FYNktiaHV3YnpRSk9WZFdUVks1REZjZytxNi9tUUVM?=
 =?utf-8?B?eDgxK1JXaUpGNy8zQkFLZzZ4L1pnWUZmZERBZTR2SFZ5M3M1MCtZVVJzeHRW?=
 =?utf-8?B?cmd2MUZhS0xKZzhwTjRxRzUvam1hem9XYTR2OW9DVHRyVnkxQ3p3cWxBQk5V?=
 =?utf-8?B?N1RseERreXc0aFZJTDlyZHl1eHlpMWYwNDVGYS9yaWZhb0hjYlRIR3ljOHoz?=
 =?utf-8?B?Z3VxWFdHMlBxMjhvR2N4aU0rNGg5VWVkVG5oK1c1N1BjY3YreHVtYnVBeHVZ?=
 =?utf-8?B?bndienU2eXVTZGhFVnptZkE2UUtyMGN2emZpQWd2RnMzN3dES1MveVdYTWFJ?=
 =?utf-8?B?UnhPTzQ0NHZSS1FlclhrMW4rMFlodmhJL1JLU3cvcEFRZ3NIdDdOUHBFdWRm?=
 =?utf-8?B?ejZ0RG5DcDMzVnA4TThVMUdackVVUVJESFY0T3JFSi83cHhrRW1pOXMyOXNV?=
 =?utf-8?B?UzVjdGREN0ZTSzNmOVRKODVRRHFWZUtYaHpUTUplRlg2c1AzeHc5d25QeTU1?=
 =?utf-8?B?VWFESUZkT3hTRUhHYlhobnR4MnptUWRvNWNjNHBJMHJwb01JRms4V1RLMXpE?=
 =?utf-8?B?VXNPY0lOR2p1cEY5aXRuZEhsbzlkODRPT2tNVXIzTldKQlVIRVltanlFM1ZK?=
 =?utf-8?B?ZmY4R3ZodlJnSVBFQWF6eTRDajBId0J3WE1vQWd6QzRHdkYyRWZhYm8vZ2Zo?=
 =?utf-8?B?YmIzd000WWpsOTltSGEyMllHV3FEaDZjVWhaV05UZVVxTWVoREpUdk5wNGMv?=
 =?utf-8?B?cEJabWlJOGEwVGNFUVA2dW9mUE5WaW40bk93Njh4OEUwWjBkSTl2RXY5Mng3?=
 =?utf-8?B?VUVoVUJNckMraWRwOUFuUzlVMXVwVUp5Y1dGTmw3T0d3NmhCUDMxYm9HS01E?=
 =?utf-8?B?L2RTKzdETU4renl4VE81cFU1dW1RS3ZrR2dxVWRLNEVpMUZRYXFhOG1PR1RM?=
 =?utf-8?B?R0JSOVdIR1NVYmoyaDFOSlpaOW9wbEZLOVRuNDRaMVhVd0xhbUZyUGNWRngz?=
 =?utf-8?B?L1RjWFZMcmRVc0ppakNZWkdNQTNsbG10cTIxU2lDdVZLakZyalQ2V1dZMzhv?=
 =?utf-8?B?alZiOUUxZmJ5ak1GNnZ4WGpRUkdlOC9SZGJDampLdFlGZ2VGbldIejhIK3VW?=
 =?utf-8?Q?HtK4HhWdTLHMEGvHZF7JYV5DZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de138004-02fa-4ab9-17ea-08da5f2f7718
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:11:09.4078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJwny1hGf6IgD6VZVVGFud3wXmQu0XfviSoWGnIc6ep+1yfmeHyXsrww6admFtvjqpbSxw/36Nqqw3NdOEKRhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7377

On 29.06.2022 08:29, Jan Beulich wrote:
> (Cc-ing maintainers / reviewers)
> 
> On 28.06.2022 18:09, Charles Arnold wrote:
>>  From 359f490021e69220313ca8bd2981bad4fcfea0db Mon Sep 17 00:00:00 2001
>> From: Charles Arnold <carnold@suse.com>
>> Date: Tue, 28 Jun 2022 09:55:28 -0600
>> Subject: Fix compilation error with gcc13.
>>
>> xc_psr.c:161:5: error: conflicting types for 'xc_psr_cmt_get_data'
>> due to enum/integer mismatch;
>>
>> Signed-off-by: Charles Arnold <carnold@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> The subject would benefit from having a "libxc: " prefix, to know at
> the first glance which component is being touched.
> 
>> --- a/tools/include/xenctrl.h
>> +++ b/tools/include/xenctrl.h
>> @@ -2520,7 +2520,7 @@ int xc_psr_cmt_get_l3_event_mask(xc_interface 
>> *xch, uint32_t *event_mask);
>>   int xc_psr_cmt_get_l3_cache_size(xc_interface *xch, uint32_t cpu,
>>                                    uint32_t *l3_cache_size);
>>   int xc_psr_cmt_get_data(xc_interface *xch, uint32_t rmid, uint32_t cpu,
>> -                        uint32_t psr_cmt_type, uint64_t *monitor_data,
>> +                        xc_psr_cmt_type type, uint64_t *monitor_data,
>>                           uint64_t *tsc);
>>   int xc_psr_cmt_enabled(xc_interface *xch);
>>
> 
> The patch looks slightly garbled, reminding me of how things looked
> for me before I adjusted TB configuration accordingly. I'd be fine
> hand-editing the patch while committing, if no other need arises for
> a v2 (and of course once a maintainer ack has been provided).

Anthony - any chance of getting an ack on this pretty straightforward
change (which I also consider a backporting candidate)?

Thanks, Jan


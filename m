Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652796CD2E1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 09:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516082.799631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQ9g-0004dD-Co; Wed, 29 Mar 2023 07:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516082.799631; Wed, 29 Mar 2023 07:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQ9g-0004a7-8X; Wed, 29 Mar 2023 07:23:36 +0000
Received: by outflank-mailman (input) for mailman id 516082;
 Wed, 29 Mar 2023 07:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phQ9e-0004a1-RP
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 07:23:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c61d71e-ce02-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 09:23:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7891.eurprd04.prod.outlook.com (2603:10a6:20b:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Wed, 29 Mar
 2023 07:23:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 07:23:31 +0000
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
X-Inumbo-ID: 9c61d71e-ce02-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS64oCry4UoASiBkhefVfFGQnu2iRyt1SAoCuWbeqW7SIbEpeXw/9i/ouuVKl2fXpbtHv66udMG45zX08fVScdnHi31dcOcFmeaWr9QzjvKskVNewqej87t2Fp0vnWRbQnEdbok+knRzpBEY6HIgDLmBRS6xjhK/HjFVLk6gEId1OrWtc5265cVipAWSlDkK3MsrDVr8L57OQEvDMWMXyAyDA9BC4X9l9zSJvo14L8fAvKeUjb4/6u6raHKQhRmKoDqQAtnD6fL2CmBvgc8F2EqpkSblB+B1yGcU0HqR2HLrK37zVoqxhe5dyhNhAZg1/XDwC/sjWnZ6hW1Jch9U9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewJymG1DliaWayF/c0Nkp1LCtoLM0Tx0g2yOr//9m3I=;
 b=OOFPdHU86GYpcyswPwA2FAJFLuqR2k//FavWi30HJHo+ma+fsx8I7WUp4/jzHLl4PFUD/I+1z5cxql7iL0Q+a6/JLfqA36GsBq7mi4bAPnDYRQ/vXekDkcQiWMKB+gweJ3GDN0uOgo4WjbWcFmdhUB+5iKA0fCMCHC8tG817atm51AjQS34CTkCFn4p70Tv44LiROMVheNLTegNJaD7gvjHUtYLfYQ3ZO2DdZRGcNsw9REgFx2kxXymW2l2AGP7cwAgfxzFfAHcMcLbeOApiGy8/Rr+h8wZE3f9zhWD6nl3RKZz3pAqn4e4OEDxo3/EQMxLrIGZfbxmStH9GILbXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewJymG1DliaWayF/c0Nkp1LCtoLM0Tx0g2yOr//9m3I=;
 b=F+6zgEAk7miMC1dfVEVrX21C4vWY/vzEkOfpzpFWOUUJCvXHT8vioeQ+09cVIzpPmM3mrAb6ekmgCDiLOOqrrUhLw2PXa1JRhKB3vQ0H8r8YB/nxPga4uZ8EDKjpKaI1JG+JtvReU3Fs8M8D2u2kaBUdPeXOGdDcREy+0iPp26JbWJeOqfAIWpxlQ/UL2CKm35VlEkVCtdgj/9OJV+WxYgFr+5n7VJKUCsi9ZxySD9hDNi5oBwqjkPPEoptxsvNQoeABK+LbDO4FSrrQ01sCzwwKbwDyMrr4tvwvk4zY4oJ8J1vhasdVwvJNXYHv9La4Wpa13/T407hOs9VwkltwbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2dd4962-4010-dfec-dd7b-1ba77d78a347@suse.com>
Date: Wed, 29 Mar 2023 09:23:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] x86/ucode: Cache results in microcode_scan_module()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-5-andrew.cooper3@citrix.com>
 <8e86b93e-06c4-5998-5ec1-5543d357f960@suse.com>
 <61f32d99-67b7-d7f9-db93-12105266a03f@citrix.com>
 <cf6a0e24-ef24-57bc-b53d-919cf494ee63@suse.com>
 <de8a81df-7b20-5b68-37a5-5359d9504026@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de8a81df-7b20-5b68-37a5-5359d9504026@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb9c1f0-4065-4164-1f02-08db30267fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T6zWLVJ4p+bFRxuo3ouVvnPh7nyY/huZN0oZR6IL4mFUOgxQ8Qn/feVWF0ybZou3PboN54ztvqTqNJKQTklHBMGshtS+jzkscyCzV/7HDTEGhNS/Lm8AfjSVGkFIbpgrVB65LJK+mIv8L/6cOo6WbnS9Nt1OGz+34phuHtbKCNHC2Bii7FDZw3UV4Im4YzVEbthIn851Jft8SJ+37RTOXoQIJLnRFqhaBfFW7+IcqspyLYfqZq5Urk4q5PMABwz9GWamOkFO5QvjBNMnwy1lyY301X92c/z2RwBpO0aIjXaSt/4+/0f7rl4GamToDBXuQf3UsBAJUnUH8KTIEQx3nB5EZXnwrMMfRvo+ORU96eEhKS7/PzX8FcVU7MgUmkNAVBdi8xe1ploTuAjRKPJCaIgai7+gnegI22GNXKrvPbwiLn/WZ2riBQlxIU9AZKvE/JpTrC72ssa2IsyPXx/i/M6+zR26PkvSLXvO3kQsl2dzE1GLyz56NYzmTQxRmpdITuUc7OlqF10odTnA0c1hZUZm0h1YEyesUbdXf+QzGI029RORzEb91Lv8gDUqs/d+CaGavMOAXavdfGwgP7xvaMiZXlLo46imFr0fUvXNB/r/ojNxzjrjQ+WFhzn9PFVu1kTcJKOs4GXYBPCIuTshlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(6512007)(66899021)(5660300002)(66476007)(6506007)(38100700002)(54906003)(316002)(26005)(186003)(8936002)(36756003)(2616005)(41300700001)(6916009)(86362001)(4326008)(31686004)(6486002)(53546011)(66946007)(2906002)(31696002)(66556008)(83380400001)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzI3Z21LV1hva1NTbDhxbFI3aU1TS2dHQWdHeXNLOEVEK3hYV052RklZWGY4?=
 =?utf-8?B?TEI0Mnphb2FpVDh6MEEyM0l6SEVET0hacUh5ci9EOHhxb3FPenR2eEVtU3I3?=
 =?utf-8?B?TWpmSm04Y0F1TDJYN1A2UDVhL2pXcUo1Q1F1MkxnMmM1bVhOR0grK1hxc3da?=
 =?utf-8?B?ZlQzWkEzOVZ1Y2NDRDdzMnNXTTVMNTZiS0xOcmMwWkNnT0tRVDhuYzZTNlla?=
 =?utf-8?B?dk40N01KSm5qcnBmaG9KT1Y4Y2ZBZHJzUENKelpKZUZyUjZDd0RXaHYycmtD?=
 =?utf-8?B?dytlN20xTFpnd3JPN1cwNU4wTm11T0FONkErMHc0UXFvbVlQQUVDVnBzTWd2?=
 =?utf-8?B?YVdTblR5cXFYZVNZMDJST2lyR2R4dkpVVTNGWTh5Y0NOdE9laUdCNDYwT0JQ?=
 =?utf-8?B?RFg2Ny94MHRaODJ1K0JtMGFBL1FKdkt0ei9jZFBUN3VhQVlSOUxabVRHTnJn?=
 =?utf-8?B?Nitad1NOaGZRSW1PZnpYVi9BMFNpajNPRUhlQmd1RTNUMkRvb0JrQUk2a0h3?=
 =?utf-8?B?UnRCOHpxWkRub0Q0TUZCSFFKdlFoaldKMnZiWTYrV2hkT01wNU0zQjZLZVdI?=
 =?utf-8?B?SUFyNkg3dE9OeUtjRmcyemhhbTRocVZGbE1Nc2lxSjJrcU83YmlCK0tZOTB3?=
 =?utf-8?B?ZTNQN1Nma0lSbGc1T3Y0VkF5MG9wSjAySnh3N2o3WjdXcmxuUlFwUkdrMEQ1?=
 =?utf-8?B?YVlRQ0NHSE1NSDRYOEJUNjZMdDZVaTZGVEhFSStCWHQ4WTBlVEt4RVVabWlT?=
 =?utf-8?B?NU85Z3NGU3BndmhRQlBaRnpFMUJnY3k5YzMvMFRKV052YjdiS2FzZGFQUXpD?=
 =?utf-8?B?dmtWK1Q5MmRjRjRVSnBBQ0ZsQXZwOUJXVFFpMHpEQUlTc2JCUGFaNkxDYW96?=
 =?utf-8?B?VUVTcHZ6MjlqUS82dlZ0b0Y0d09IUEpDeFB6S3JuNWxvVDh1ZXpIeUxzYXov?=
 =?utf-8?B?cDNDcHFsSmV1alJYSEMwQnpWcVZyMjRXZHpxTldjLzVpUVMxVHpDdCs2ZCtt?=
 =?utf-8?B?OHlhWHJ0V3dzV1pqSmFreHM0QXAveFFoTnY1UzBaTFFocm41NVNKV25ETVdJ?=
 =?utf-8?B?dkN2Y3NreVhsaXhubmd5R3ZKQU92bVd2U2lIMzBqbktWanM2ME5LbGRsN3d4?=
 =?utf-8?B?bGVlU0Fmc3FORXpzWjdUeDU0c2wxa1pJOE5jZHM5ME1lSzJvQjRjMW9xNGZs?=
 =?utf-8?B?T1R0ejIvcU9ETDBjVlFhNWUyalAyWko2Sm9QWHdBU0pmS29yeWRROHQvSk4r?=
 =?utf-8?B?M0hOYytzVFJzcFFtQk4xRHhpb2xMUEJMVEZZSEZRSHB6UkQyZ2JtbTU2aXpq?=
 =?utf-8?B?VDAvdjJuTHNsdytrZzdZUVBmaWVLQjBXM0NBMSswNDFsTzRnT0hqQUFBczlN?=
 =?utf-8?B?dFJiWGpseEJKeFBwU0RtN0o4TFp5RUxvS1ZuZ2J3SWFSRVhuMzhQK0NWTWl3?=
 =?utf-8?B?dWI4MlYvZzJ5NG5MRHZjUk5jbGVCWitJaDNQd01SUXJ5QTJnYWhURTVybTZT?=
 =?utf-8?B?UUhFY2RxaUhPd3B4UXY1UDVLbUk3bFBRdG8zV1pBU282NEF5RUNhUDFSSG5t?=
 =?utf-8?B?ZUcyTlJPQUU0WkFHb1MxUkEvU1d1YWYzdWFCazBxZlNYeGsyWHJ0NTZ1VHc3?=
 =?utf-8?B?ZW9qbWRhU2pEckFMaGpqMWV1UWRodEtHbVJqSWp5QlYzR3c1UHJka2ZpSm5E?=
 =?utf-8?B?RjU4Z1VhYmRwOXl4T1cydTlqSGRCOXRZYlZHUUlQYmQxM2tEQWhERG95M0cz?=
 =?utf-8?B?cUVsamJsMFVaQTNJdHVtVm03NHk2QlQ5TnBnT3V6SEpLWlRIZk1oMnJ1T0Nt?=
 =?utf-8?B?dWxBbXVYMzJTdlcxWXc3dnRGRXJ6S3JXOEJrK1pTc3JZRkdjTENzUURBb0tq?=
 =?utf-8?B?SU8zOGJ6Qkt1cUxGUmdEUW40S1E2cGxTTHJ3bmVIZHNvTWh2L1BEcVc1dlNj?=
 =?utf-8?B?d1FTODNGcVptMkFYOU1MaSsyVFMvZmpGRFJ1WTArR1NISVAxQldCT1IxZFdZ?=
 =?utf-8?B?ZVlNdzhkOHhSaUFzeUFVd25mdm1TTkRMWDJndUtRSmhNMGhHbTFWSjZBRmEx?=
 =?utf-8?B?TFFySnZab0twei9lWTd0YWVlblJnL1F1TXNxcU9SdDVzRVpUbVJaNE9LZkJE?=
 =?utf-8?Q?sjoznIAEJ5yvf7KGiNKXXckQZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb9c1f0-4065-4164-1f02-08db30267fc9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 07:23:31.6408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+IBt4zpaV1nOneKQrOUaf8RhDWN25oqkxOF6TRTGccxFemmjc2Zsl8kBsy5ehjlm5bU1MmOj15VQ9fUScJaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7891

On 28.03.2023 18:07, Andrew Cooper wrote:
> On 28/03/2023 5:01 pm, Jan Beulich wrote:
>> On 28.03.2023 17:12, Andrew Cooper wrote:
>>> On 28/03/2023 3:19 pm, Jan Beulich wrote:
>>>> On 27.03.2023 21:41, Andrew Cooper wrote:
>>>>> Right now, the boot flow depends on the second pass over
>>>>> bootstrap_map()/find_cpio_data() altering ucode_blob.data to use the directmap
>>>>> alias of the CPIO module, where previously it caches the early boostrap
>>>>> mapping.
>>>>>
>>>>> If the scan is successful, it will be successful the second time too, but
>>>>> there's no point repeating the work.  Cache the module index, offset and size
>>>>> to short circuit things the second time around.
>>>> If the scan failed, it will fail the 2nd time too. Maybe deal with
>>>> this case as well, e.g. by clearing ucode_scan at the end of
>>>> microcode_scan_module() when nothing was found?
>>> See patch 5.  It can only become true then because of how the callers
>>> are arranged.
>> Right, I've meanwhile seen you do it there. That's fine. Yet I think it
>> could also be done earlier (and if I'm not mistaken also ahead of all
>> of the rearrangements you do).
> 
> Prior to patch 5, calls into scan are guarded with "if ( ucode_scan )"
> as well as there being an "if ( !ucode_scan )" check.
> 
> Clobbering ucode_scan prior to patch 5 breaks the second pass to cache
> the ucode we loaded on the BSP.

How that? We didn't load anything if scan failed on the first pass, and
clearing ucode_scan if the first pass failed would merely suppress a
fruitless second pass. Of course we cannot clear ucode_scan in the case
that the first pass succeeded, but my earlier suggestion was limited to
the failure case.

The "!ucode_scan" check also is dead code, btw (and hence doesn't matter
here), since neither caller would invoke the function in that case in
the first place.

Jan


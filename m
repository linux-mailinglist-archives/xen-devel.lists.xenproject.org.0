Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC371F769
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542845.847255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4t6k-000458-Qm; Fri, 02 Jun 2023 00:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542845.847255; Fri, 02 Jun 2023 00:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4t6k-00042B-NX; Fri, 02 Jun 2023 00:57:34 +0000
Received: by outflank-mailman (input) for mailman id 542845;
 Fri, 02 Jun 2023 00:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syd-0000if-Si
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48dc99f3-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:49:10 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 00:49:07 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277%5]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 00:49:07 +0000
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
X-Inumbo-ID: 48dc99f3-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hngBPtQmeJ0z29HFPi2HgDcbIcPHw7wV+9aUZs1spDlIjTf6QsUIUUQ/8PKji0LjludRMnEXg4Uuh/kKVo6tgpayTW7gX81NtGMy8uUxHZAUIiKBlUyC+Hn3Jz1VxNohSvFZ80/K3IPYhIOBPSRbuXkn0PggWRk0ah9ZwSiVgovfArDBj0SdoUl5WLvg3h9ymAn+mzB8l7t6xDuX09vbchoZqYxYFe7duYI2gjZ+UH7YOHGJlIb4SikqxU67tQRQXHHr7zT5DSZj0OQfbS3jqCKuKtD+0LkDNaxQAMIPo/+h7UYumcVg7B+77eMR5SnadfxIQ8pzm6EChZdXfthdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpXz5tHOpU7JIAJC98vhbLHugQakyZ74eqD1hZu2XEo=;
 b=Pz1wI9RCA6kjjlmhBqXLUNMmf/y5/9P5atPOFVX4tGSQznz4ggimDdv0p2OCRBGCAMA5StIEiXa4rZ9y0761sAporDEHQspFCshgVccIoOxyi0A5VrPvF9rG5e6/NCol1IH4NiJJS4GWJzaNSM3IW2eav5cogjPpo9tsisA43uX/rDk5daRa2/yYWv5nnm14WyCssWVUQvxpUEjHKD5bVHyZVQ3ytrPdRaXdMZAH1nft/dpUiFfHynBsKxfiAvdsk/nr2C03lgeEfDkBnBcyhHrqTI5miRJkhlLF3owXw6BpNO4RBRY2LqQy28O3bREMEeckPd4NJxnjJCJ9e+1i7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpXz5tHOpU7JIAJC98vhbLHugQakyZ74eqD1hZu2XEo=;
 b=SxJL4rUoR3G4V/1JjzaA3iJPYFQTXFoow/mz9msH7oIL/FpWvbPKFiKKlXcodi0VAXoa+RhVpm+6QiPqmQ4KUzzx8pSACCTRQcUeVge5Ab9BlNDe1BxM+T4gT2fFgP/rj2vGMQvCNU/J4PnhodhRXXy2PIr7sEwAEfo+t5BepzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <06a4e9fb-ceb1-f9a8-482a-df99a74b6aca@amd.com>
Date: Thu, 1 Jun 2023 17:49:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v6 17/19] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-18-vikram.garhwal@amd.com>
 <8a78ce55-a677-4006-b04b-8fc600b3f75e@perard>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <8a78ce55-a677-4006-b04b-8fc600b3f75e@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0067.namprd07.prod.outlook.com
 (2603:10b6:a03:60::44) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: efc51270-3aee-4310-5409-08db63032bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c2e3XtJ04CkcL+3w49GzNFBIc/QlM8MUHWpHTSCWIwAd08BpBAOffphBFTi9HQ1NKnCz+D18M3l6yeEzx39CIo08PUUTjIEpjYxhCUS0EiJHj6m+gC0f/D6nPCNbMrtMXpF4k0neIWxuLW1l0uwGoS1pRcOkF3eJs25aCPxl0srvnzptkn4Nl2oA/4P5g9aYsysarmNZ3myrmU5skayR6Pe11If6gopVXiYSN51NF1mzOEg3zgoBZ5/ZDH3bTdchf1+csMF2zsZvKqC3nfRJZ2Ezce71BP7vl1fIoWitNzK8qS46I7P13ZhlxWslNg/7y7vqOlcA2CK9VJk0n7mGb37k7QuCGM5KiKLVHyZVyWxong/toVmnfgncZZthSRH2w7kSSsF5jLH9EASkR6i7g9suLqgTw0Wk1xz5QVj2KFaS2zH82As7/Eqp+I704avJQF+Hiwxx36DYV3HJdEu88id+nIctGN4poi/2wydggc4QlL7kIRlE58qvFwBKpZFboccQD7I0ZLOKgGmClYsDSdiuNAnHT/fyeq0RiKbT0KAMWccE1BTfQZ4ay1yDls+XOsi6jTECO4L+aCNy1ExJoSBCmIyE0tx8mh4mUXiNWAgXd0Uhlzp3XAZWGlLOjgtqCoOWCgfhkAiuSBuSG4JwFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199021)(36756003)(38100700002)(86362001)(31696002)(31686004)(41300700001)(8676002)(8936002)(2906002)(53546011)(6506007)(6512007)(44832011)(5660300002)(26005)(4744005)(186003)(2616005)(66476007)(66556008)(6486002)(478600001)(66946007)(54906003)(316002)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXdOS0hsQkVaS2dTQVZyUXM1SDI3Sjg2aW53Umh3SnVvM2RQYmFhTVhuVTZo?=
 =?utf-8?B?d1MvVUcwaUp3VUttbUhyaHFKUEErc1NLQW5uZUs1OFRxRnBDblBhaTBFdUhN?=
 =?utf-8?B?UDloT3drZnVtZ0RPbXhMOS83ankyU2R0bVJnTDAzZFZyU2xYNFFRRXZJVnVk?=
 =?utf-8?B?S0RPZEpwQi9aNXBYNzhYZlJKajBRNm8yN2NLVmZHRUhqNnYvQ3plMURFMFRE?=
 =?utf-8?B?L0hMSEVOTEt6Zndzd2hqM0k0blppT1VobEV1VEVRekdmZmpKSmZWbzMxWmNY?=
 =?utf-8?B?Zkh0TjgxS2NZeldpdDVyQUg4V1ZqZ2tHNzZyTHpRcENOUGhiK2xWejBKWW1l?=
 =?utf-8?B?ZWJHb0lnQURjRjF2ZC9heWtHenZQOXRuK3pKNFhOM3VBZjFkbU0xT1A3ZDJH?=
 =?utf-8?B?ay9vdEZTbHd0aXU5UkdpcUtSMGJKaFpyeXdiMlpmQkQrcnJwUVJBSytrUmZU?=
 =?utf-8?B?TDZDTUk2ellid2RNT1k3aWdJcTVvbVduako0VWw4VjByRXlvUEY3bVZWa2Qv?=
 =?utf-8?B?cGRONGplNEcwSG5uL3pTSEI0UTUrNENQRkllV3pqamVVbC9uQjA3SGgwZWNl?=
 =?utf-8?B?N2hwYUIrenhBN2FYZ2tqTmRlZktic25kWk9EMnlwdEJjV2p0OHJKQlVaWTBW?=
 =?utf-8?B?UFhOZmtXQ2xnOFJzSG5LaWRFck5nbDh1RVhIRTdvcmJFandIVnVNTGNKK2t0?=
 =?utf-8?B?VmpHUVhPNFd6TUV3YXJzT3BocEV1clFiTzhuV3RaVTVyOGlFeCt4T2RKVG5p?=
 =?utf-8?B?Uk5wMnlNTzloVmhXd0JZUzJVTUNZTEgyL2RZYWhzRHh6ZzRlZjRQbVNIZk1y?=
 =?utf-8?B?TmZHTHRjRVE4Y3d3U0NCbXlvWWpta25BdWFya3dqaUVpYVhRMTRhbEV5dEU1?=
 =?utf-8?B?R2NJQU5KY2diRExMaUoyZlNZbU1hRU1HQXNVZ09ZOHBRVDZvaHBjSExWM2ZP?=
 =?utf-8?B?ZjlmVGZEd1lMM3czU3oraVZha0pGR0FNLzFWcHBydmFMTW9hVVB6UytXaldK?=
 =?utf-8?B?aTVMVXRENVFVQS8vdjF5Tnh1TnBCMXVaYjZmdzl0Wng4YWZqdlE2cFJsTzk5?=
 =?utf-8?B?RUI5L3krRjFycnlIbVM4T2prT1VDUG81b0NiZWc1VjBOVDlJOXB2ZVZNWHFw?=
 =?utf-8?B?NjJKYStoeC9pTXBNMkhRSHNiQjVlUEloS2luRUNGWXZNa28rV2xyYkZ3VVBT?=
 =?utf-8?B?bUtVKzhxRVgzMHdvdzI0WGE5OTRabklVUnQ3M0dzdjhSbDdyNHJZWHJQY1Jp?=
 =?utf-8?B?Mit6eVBNN3VkRytIa1c2OFJVYkdOZjlqZE5BMHNQajhKdERJbCtGMEJneDJN?=
 =?utf-8?B?S2puRW5SUHVsdzVCMWxUSzV2UU5iYnNMNjgvTytKd2NkWGJYZzU5NDI4ZmZ1?=
 =?utf-8?B?dDZXejhuNEEwcUtIUEVjcXcrSUxFdDNtdUx0VlFETFZUaGJ5U0dCV3VxOGd4?=
 =?utf-8?B?NjZmb29YY1BERFVUZmJYeE5ZSlBWemMyWDg2bjhQNTFuL1E3aytLRnAzUXFS?=
 =?utf-8?B?cWduZmdIWGFNbnFtS3AzanQ0QVBjK3k1UVRPQ1c1cmNLMitwd042a3JVT245?=
 =?utf-8?B?ejVDcERxWHlPcWVzRFI4NjBjRVByWkpmZjNLUUZuRi9rSGpMM1IyVjgvNFpH?=
 =?utf-8?B?TjM3VkdOWStwSDAyQUh6RlpkYzJrTXF3ZU44dzh2ZHlpSzhUUS82UkZBakN1?=
 =?utf-8?B?SnY2aXNycmo3WmUvcjBWY2VwdnZqRS85dWRhNllSb0xGd2J4RmJYQmhmSDR3?=
 =?utf-8?B?cG0wQWZBbHFYdFZWcDU4aXFOTWVYUjREUGVFdlBORzVPbkZwdktTaWtkUXdW?=
 =?utf-8?B?Z3NUUGYwN3VJd3hHdHdzRS9MYm1pTnZaOVdZRkNaT0l1T0EwaThwdDNrcytM?=
 =?utf-8?B?MDVOMytJM09hdXhnMUlEaTFoTVExSXZQSVU3bkNTWjNSbjljQW16NDN0T2l6?=
 =?utf-8?B?NFBJV1N1bFFLVjNYbVZnRVdtaTlPeGdueGdJbTVVWXpnM2Z5Nm9JL2F5Y3hY?=
 =?utf-8?B?T0tlWGlIMzBNcFh5NGY0MHY1SWkrclVCMkxnZEVubk0xdFNNZGllMGVnZzk4?=
 =?utf-8?B?ekp1MHNzMTZpZ3plRERLUDZxQkZwVXBRY2ZWNDZQczg4bGNSLy9oV3V1bFhV?=
 =?utf-8?Q?Fl1Wm1fd1EAvB9XSef6B61Y1N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc51270-3aee-4310-5409-08db63032bbf
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:49:07.4559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OqR//h/Tb7/nG9rkYoJQhxQH4gqwntGo1P+G7TD8Gr+TH+I5hPo0/DZMYjln6on4RgIqU6XjyPuR7crzwzKsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853

Hi Anthony,

On 5/18/23 9:01 AM, Anthony PERARD wrote:
> On Tue, May 02, 2023 at 04:36:48PM -0700, Vikram Garhwal wrote:
>> xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
>> operation type i.e. add or remove to xen.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Thanks for reviewing this one. Can you please re-review this patch for 
v7 version? I added small padding change as per Jan'
s comment on 15/19 patch and that changed this patch too.
>
> Thanks,
>



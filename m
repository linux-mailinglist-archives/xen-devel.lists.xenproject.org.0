Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D538669F8D9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 17:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499703.770975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrnr-0003b5-Ti; Wed, 22 Feb 2023 16:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499703.770975; Wed, 22 Feb 2023 16:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrnr-0003Xh-QH; Wed, 22 Feb 2023 16:17:11 +0000
Received: by outflank-mailman (input) for mailman id 499703;
 Wed, 22 Feb 2023 16:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUrnp-0003QQ-SR
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 16:17:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b139eed-b2cc-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 17:17:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8614.eurprd04.prod.outlook.com (2603:10a6:10:2d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 16:17:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 16:17:06 +0000
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
X-Inumbo-ID: 5b139eed-b2cc-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7VZHdKUQH5bdDV5oifPuzsOIz+nLyBu26gS9ZypsK19GWXA3spwZJvjYt2i2wSxxzWMq2ianKogtos9cFm5axbU40irR/lvXae0+Sms5U71EUFhDiUw8KZmJdPDLTAbkOXAzTeGQerAT3VNGmPyoF6/j0GlCs7x4pmKI53fVMGuDIilvrbHR+x+5m57TrVpGlUHy3+Rnt6C76+d25XCu40+BZD3xg1hmp9aGAc3fScsI2fk5NnoYzybrwk65EchOOmHfD7c5EWJcAcrnw5J1u99j+ITZrCJkNraJscF2qwxc2+yErkqLSbVOP08LDzajpNUlorGrSiC7aPH73N8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZedYKDsnFMcEA9XU9STZjvC78cDO0bEbNWZr8fKPBsE=;
 b=S+6xdy9fEW6BW6tt6DoHvly05hLxzk0LDMUzl7iJ2EryQ2+YE0kewbh/eWJoBbdOwC26xhNe9zS4HafGmfC4kTLppo2kDAmxXxPAdVxgfCuAknKYjKfnYys7NWv36dmlCkpd2DoJKVsqF9+yS+1Kk70L5u/KreDR8M7tUn3wRPAsQ9hOCoe8QGj5dGWsOvR5zMYc2/2qs2ukPxWOhg/zuNcZLm+tH2XgL08nhgfNeF+bz17Q99n7/fDHeAKozzWPXq8HiC783mBmJAy1+FlXqJJ8vmke1ButEqHq5uZbEjb6tRMQYDeEDpHIOvGTd2RRJ1eXhBr1k9wbwszvpssBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZedYKDsnFMcEA9XU9STZjvC78cDO0bEbNWZr8fKPBsE=;
 b=3neqTbqohUm4LQJv1jAub0H3TctfRvIdETwN6Qm5GWUFBiUWZXBeYXFJNFZz7QvN1gX1MwyZwH2jSXGHE1dCZZkvivwdEDkNeHvs8ZD+Y9AJyPw6OOGB2WXZ4xcSvSEMTiPkwVSbSNTTbZaczUzR4GtGtVNFvEThkC6Wn0rCl2dvptBRbee0Vpjr2r9qVq5xYssNoVU6SjgZJvg4X1oaepPhJTRJW/RrQHFgVJbIMvpwDCgPSxxoyAs6JGHh3jN/FAmiPGAZRk4CL22LLTa3MHGudnicORAwvtcmoAH5V6g79IS99miII6ZaE+5RaTdtnVHNJEd1oRF8uINz79zcYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ab8641a-684a-3a13-50c2-d9912286f313@suse.com>
Date: Wed, 22 Feb 2023 17:17:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Core parking broken with NR_CPUS=1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <75b06911-9ff0-e75f-b611-810277524171@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <75b06911-9ff0-e75f-b611-810277524171@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b6d4d67-2d3c-4082-ffb9-08db14f03dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qoesRn3QvRgmTf7nHBzlDDV2dHdFEwnpPGqxgo+38V7OI36Fr3kchRDJZQI6wpLt0Cd1qn5iM9UDifZYsoUG2ZQCUZjKjLc9jKAnyqsv8AJk+ISTtIQRSHllU6q6h6RtJtaH71VOed/gA8T00V7YlFoQbC31VwqZRZesr2T+p9WTU8be0QwHFw3m5mffp1bXeuUBmUe3XBBi7OlGQ/Ip1m1A4F9Qem7QrhTJ86noBDXbV8S5bJkezT3WyQEZ24Lbn2z5LV1KazzZYIv5C/AlDNKceKZxuK8DG2cO9FhYiztkWMXPGQ9KSE4puaCyqVFUQT9nA863nImlRQx7DO437RXsTZSTQhAsWXbn+97SICGK9xXBMEz/OB/BUI1iVrT1FrGs3tKIuMnbsCQibq9xuoUHEsh1klXbHp9g4eiHJ9Wiu+rgKxAEyoP2QQUPkf0bar8qdHxS+H7qYeNYno6qLUosX/jYc43XgxngoJjvvqBLhEtIokngKRGzYelrcYdxBLEBPIfCPLuQizDRmtJcvAWi0qZKKxk2cynejSkxckR17AFIDg50t71PC/mHon2eW+mtxTxpr7DkN5mjMbd5V7hh52kCqT6wGfPqOHamjmgouguc0GwVv5YbboPFf3VxrEw23E5lfkzvX1+XNxwT/eRX5Xnrio4Z3HFIJy/Hx5mqGFkoUeJRBerx2ThIlJJSs852ChcF0kp1+O+c4gNPTIL+cjXgCDtTdJJfDccfZZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199018)(86362001)(5660300002)(2906002)(31696002)(31686004)(38100700002)(41300700001)(66946007)(6916009)(66476007)(66556008)(8676002)(4326008)(316002)(6486002)(36756003)(54906003)(26005)(8936002)(6506007)(6512007)(53546011)(186003)(2616005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzdNdzkvZ2RsVjJVNVk4dldWdUVWL3BWUklWRWRpYWpEZkNURXFvZ21hMTFH?=
 =?utf-8?B?YnBHNXVwQTVvTHBEN3BpSm1IMXVoVnozeHdGODE1NVhTemhBMXJqZ3BIV3pm?=
 =?utf-8?B?Nk9PcmNTSUNqOHhiZlRTV1FLWlJmNlhtT1c1UFl5M1h4a1VWcThWb3dxeS8z?=
 =?utf-8?B?V01manlwRVNwNzczWFBwaStSV3IwTmJ3VVpUTkZFL1JEZDVZOEQzUUhNMUtJ?=
 =?utf-8?B?NXNsbEtaRDJ3c0tnSm1scTZvdHlBR1pGS0Q4cVVxeW8vNTUyNERBSWljUGh1?=
 =?utf-8?B?WnFsY2NzSHZKbVB2Y29lUlhudmZReG5TWUx6bFBNaVpTWVdaNFJ2SHlPVGts?=
 =?utf-8?B?SVgxbmRXd0V4Tm0vVlhlTUZoSmI1NkJNakFFZWhRdEdmWkxaaHlKcjdCMWdm?=
 =?utf-8?B?bFJDeTRGL3FQbHVsM2VKRWx0dEY5alFaVm5OSGZRWUhnYW12Nnl0aksxUUJE?=
 =?utf-8?B?WTVwNFlGZWJmN2FGMzB5bWNMbHI3NXlRaElaakVWTzhTN3BnWHgydjVKSFNT?=
 =?utf-8?B?c2k0dHhFZUd1R1ZLazJVSjBETjN5TWh0RHZYQzVIWFVFQjFPZ0ZYTTNPZUQ2?=
 =?utf-8?B?L2dhYUliTjlzUmtxc1p5VzZ1b1l1K1BkRTA4VEtLeE1yMVZmM1NMaVlWMW8v?=
 =?utf-8?B?YTJKOTY3M1c5dE9yVmt6WDJUUkN5T0ZwK3o0N09RWCtJV0hEcUF6TmJnYlZO?=
 =?utf-8?B?ak9jRFZHM2xoS0Q1REVKQUVZRWNkN29YOVNmUXlmUUlqMHVZL093YUtFY2Ja?=
 =?utf-8?B?UnhweVJiT3c3MjJVZ3VOLzVheVlPWVBBUnpJczFVUUNEU0h3TEdjMTg5ODN3?=
 =?utf-8?B?VW1nOTlxMDhFbi9qVXh3OW1PRGRnZ1VZZW12VjdlZTNFbE42NTRaS0FpWWgy?=
 =?utf-8?B?dGxQNGtiK2hRT2NLOVF1Q2lPVEw4ZVNvdjBrbTJEMFVVMzVmMVR6NDdVcENw?=
 =?utf-8?B?aTJKd2tteExqTjZJcGx0SjdyUHNVV2lQWCsvek00cktzM0N4cWxaeVpEdFpI?=
 =?utf-8?B?dmJGUmtGeDRFaWk5U3cwZFFHSGxqaHhCVzZLdVYwb1oyd0tKRU05ZDc1WDJw?=
 =?utf-8?B?T2pVZGtaam9QeFZJRTJxdU15MWlJQnc1ZkxGUlg1VVJzWlNRbEt6TzVkd3pr?=
 =?utf-8?B?bzJKRys1cVVZY0JjeENnUTVFdXl6eVM1eGdvd0pKTElUWTlTYTkvUFBkczZZ?=
 =?utf-8?B?dEdBWG1WUTY4L3BHQ1lrais4SXZkYjJhcUNGMExiTlFVNlZ2dVlodkQ3TC95?=
 =?utf-8?B?WUlBSzhYTG5CVVk2M2NzS1VjaE1qMEZDMjV1T3oyRU0xTzlFQjRvQ3lyS1Vq?=
 =?utf-8?B?QjNta0hONnJ0ajZmY1hnRE5PWUpsR0syQVRhUVQ0WkZ4Ui8rZHZsTFUzSElS?=
 =?utf-8?B?cThEYVZxYjlOdXV0bm9lbDlOR2RVOStKYktISVYvaGZrcVdXZzFoWnpvK2V1?=
 =?utf-8?B?QzMxbGtYRWxYcFU4WThjMWxvbm5UY3hYaHdPaXV5OU8zdW4zR0VaQnVISXcw?=
 =?utf-8?B?WjZVWWpvVlhoNytpUkJXbmhZdDFsYWVHU3JLaTVlZVZQMmZYRnhXWEZGZ20v?=
 =?utf-8?B?V0xLM3dlTlV3WXJGdlQ0bmVjRUFtN1RLNlAvWkFpZmRWOVUrUy9uVXJQbzhK?=
 =?utf-8?B?cUwzT2l4dlJackx6ZEllM3VvTlhpTUc4eXlXTXY5OW16L0NsK2FLcVpWRnpw?=
 =?utf-8?B?UTkzSHdYdHRXSURKYkVqcE1ib1FsVzE4UkFqRC9yR2pmNUFxMHkwTXNtRkd4?=
 =?utf-8?B?V1hZWFhPOU15WkFlZks5M1VXdWdVOWtzYjZRUFYrWndMM2xaNDVXRmJDbVB4?=
 =?utf-8?B?Skw1cWI4WENhNlVZcjREcDVFYThLTWU2T28rWWM2MGl1NVZUV0pNMVc3THNM?=
 =?utf-8?B?VkhrSlV1M1dkdkNOQ3hPeDc3REFWZkZIQTlpT041eC9uOXF2anlNdlpDT2Vj?=
 =?utf-8?B?cFlqVldhdnprVk0zbHlieHZhQWxiMTdHVHpmMThTQjFzZEFSNXNrWmhUWGt2?=
 =?utf-8?B?ZUZtZ1hwM2FWeHltTm4wL1pkTzA4UzBlNFh1TjVjUTN2c0NHTjZGQUVjejlx?=
 =?utf-8?B?U2hSQjVobGlXcU9iaHZ3RDJoQTVtZExUcW1TQjJOU3ZxTS81a0JyL2JOM2sv?=
 =?utf-8?Q?0K7DY0qKawfkFl/zRxpOhLi2I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6d4d67-2d3c-4082-ffb9-08db14f03dc9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 16:17:06.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NfXETv+R2CpjBbCUNWKDyp0TwsN+NPgtB3uanVeLLPmkB6L+kwHDYSV1ej0a+pq7javmxtIc5qxuWZBDZVllA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8614

On 22.02.2023 17:04, Andrew Cooper wrote:
> While testing the rebuilt debian unstable container, I found:
> 
> common/core_parking.c: In function 'core_parking_remove':
> common/core_parking.c:230:53: error: array subscript 1 is above array
> bounds of 'unsigned int[1]' [-Werror=array-bounds]
>   230 |         core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>       |                                  ~~~~~~~~~~~~~~~~~~~^~~~~~~
> common/core_parking.c:31:21: note: while referencing 'core_parking_cpunum'
>    31 | static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ...
> NR_CPUS-1] = -1};
>       |                     ^~~~~~~~~~~~~~~~~~~
> 
> 
> which is an legitimate complaint - this logic is simply broken with
> NR_CPUS=1.
> 
> In principle, I think the best fix is probably to have CORE_PARKING
> depend on NR_CPUS > 1, except none of the interacting x86 code has been
> written in a way that would be compatible.
> 
> But it also occurs to me that this is the kind of thing an embedded x86
> usecase would want to compile.  Frankly, its niche even on regular x86
> use-cases.
> 
> Except having looked at the code, it's a different to the other thing we
> call core parking which is the smt=0 logic to keep the stacks valid for
> cores/threads we don't want to use, because of #MC broadcast problems -
> and this logic does need to stay.
> 
> Thoughts?

See "core-parking: fix build with gcc12 and NR_CPUS=1" sent back in September
last year.

Jan


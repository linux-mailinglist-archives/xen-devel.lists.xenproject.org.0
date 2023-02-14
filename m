Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598E5696972
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495321.765672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRy8n-0008Uz-F6; Tue, 14 Feb 2023 16:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495321.765672; Tue, 14 Feb 2023 16:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRy8n-0008SM-CI; Tue, 14 Feb 2023 16:26:49 +0000
Received: by outflank-mailman (input) for mailman id 495321;
 Tue, 14 Feb 2023 16:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRy8m-0008SG-89
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:26:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f8886f8-ac84-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:26:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:26:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:26:44 +0000
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
X-Inumbo-ID: 5f8886f8-ac84-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9ZNoU8YtLP9jBz+eWYhZB7pPDPFrt29GHr5qahvAYsBx6AxI8pGDynJHwXY2fqEJiSEYxRD4Y0DfBfVjQoQQggJOJY+gifFkGHsWHHrwSGgE9pU7DOC3NHIHIzaixO4+O1hGnXdl5GH4w2FLzWXrqyAw9Q3u6358xKs1L0Ik2lJC4qfb8zPu+argI81AhKowbU8Q+q/G+j5shR3kzINmf2saBwvMeekNhDfHk7W7uiYuis9WM9nPYNnIqE8CT1m0creWUJz2Ftz1g+LoC7rU0y7+ox90P3IG7tNCSrPLKE3NI4U5aHUHN7hM5plTcMLFszVDz7F8HUB7bWqK3Ldww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b66aqTjqh/1PpbplIZQRel44ESUn/N1mzY16kSlNPSE=;
 b=fotsj4c8rk/UVIzB8jKpnDt+zOC9KeUo/KOU1FUzepYLsoCAWl2V2VExdFeDvgyTwljsUhxti3+7fvQNgnd5q+vlU5KvZkI2AsvJR8EZiG40c4hKu5tIzpAzOzLbgQtugWnwvQb+5D2A4FuUrvrMkBCcAEBfDXqDmk61aCSZciEeW+23ZICbjGnmWvY1AWcTHSB6+O1DFWDXgvcWntjvMXAT2BndbAnspWBX6sQwewLnsskL+WO80lC4Hqfv7e7rVY4a39yOcz+4SV/lDSV0UIw1IqNRDJiXu8jaJzcwH1cclDfDthLHda1Tduc882oUPJHZigOxposoJOf6Q6vH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b66aqTjqh/1PpbplIZQRel44ESUn/N1mzY16kSlNPSE=;
 b=2bkxKrcQa63ksd6gYg8Z7g8YqIGQAzSKH6GyuMU3p6AtXew190Z2nIiW3iTrBCorTc2d2kG+LqCfbxwbfO9LlF/NfOldi+Z5+tbizpWdTD7zzAeupdNktXhoQ/v5K/9WpmB6xd3SVp7zXpA3/Sbfs0j7HjI+2E1D2KPMDBGadCyX4ZLGSg/CjqwNevhICv/abjk6E6hSINaZ3SsMPg0fH1BPM6jzq6jwnuOGtY8LsDwLfPtEkAy8nZhUikm7JxiV5NyGDvEveCmgl2A+9JQZDXUFvuHc5KPIIqs9MgJYR+gRQpoWVoplwbXaIhHKivycPhKkJBRVmeBaUcKRa7CsEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe1adfb9-20aa-78c5-61ac-bb99c0d60b9c@suse.com>
Date: Tue, 14 Feb 2023 17:26:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 07/10] x86/oprofile: guard svm specific symbols with AMD_SVM
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-8-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-8-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: b40b4a4d-beb6-4df1-08b4-08db0ea842a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gx+wcbZq2Dcuw+4ioKJQpzE+hfZOs6Pe0yQIcxI4rVoqUYhcyNphcD7qgh2DUmVO8r8rr59ICDiyc7JfhmItiCn3OFT9tXqkISo+k+sBwr9pGwuAwKWNHlOXTPXZde2ZBOWROmuT55mefHHbCawJ1OH08PV1GbZoaEXueeXZHI/NsDq1W8tSCOGXFvGLF8k0y8HJBzXUGmwFyAHBbVUlwVuDhEmwQMrfG+8Imi3oxZPC2XfGwBlnZ19deoE8UsiAxt8VxFIEpzY8E1WKl+LafhOTdLqkjpwc3dOvdNY7ICkc+UKUJQlGbWjgmlLJM//JpF/6BkWm4BA6rJ7AXcuYdW2xnxT+0mdi2kSFplH5hFW+3ekRd/Wxz9I/FLRRWPaaN2S+v5SI6evsX9nS7Xu5bWjEzmw44lvqJzCGC4fu1CXhujiVAKhqxAfOTxVNn+x8b/7epErc3/7uRi5o0fev3Tm4D53XK//2aLq1UpNcnfuN71853C2R493xuM+ZtflcxT2U7fLqn5XmSPiTowNG87QV719JfjESg4XLRnbE+nSKvCbGvD1bIBtCJKXnmD9YIGbVR1cDscB2X/hHEJ95uPWHM2FGt5VGS5plU42xtKUSJhqEklatlCC7JEm+UVk7o/4lMJgFGFYEdlThuJTJe7Xmo5+P3mqGKZYwVnWCJdduxUjbM38iVQidzZ1+XIvmyMQ4P8tMngynUpOBIXsEbQuu/r7jYx43Cqk3CUzQcCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199018)(86362001)(31696002)(36756003)(8676002)(54906003)(316002)(66946007)(4326008)(2906002)(6486002)(478600001)(2616005)(66556008)(83380400001)(41300700001)(6916009)(4744005)(8936002)(5660300002)(66476007)(38100700002)(6506007)(26005)(53546011)(6512007)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzMybXFlWDJZcUl1RTFrUXM3cVJEUVBWL2xsWFRhYll0dkd0QXlvVHV3NTRk?=
 =?utf-8?B?U054Q0QyblZ6R3NmcUUwZ1FlSTBQQ0kvTzhHUUFXRGxTcE93L2hNSnJJaE85?=
 =?utf-8?B?NWF4M21ZejlJaFRZSkROejcrWmFhSytvUVBsQ09PWjBQT2xMQUdjelNjVzAv?=
 =?utf-8?B?YjJXazdhOGY5b2V2ZlowR0Nyc2c4M290c3dKZGZzUWRZRGoyVUx0WVA3VE1B?=
 =?utf-8?B?TU5zdGJZeDRERWtxaFZLZXlPY2pLNmtwbEs5VkpSd1pKc0hEOVowUDZhTTUy?=
 =?utf-8?B?NU5id3R2aXhWVUdlVzNGQ1Y3Z1pYNU5oSndDd292VjZpd2F0ZFFKbnhuZTNv?=
 =?utf-8?B?cERGejh2VW9wL2prd3pJanh0YVZ3OHB3Q2xJZEJzMzl2Y2F6NlYxQUdya0JX?=
 =?utf-8?B?SEFid25ralA0UnVkU3lWcXJrTHZlOThLTlZISkdxYzFKem9NcVNWSmJ6UENv?=
 =?utf-8?B?YlArTXdOSExWeU9GR0hid0hZRCtCdmI4eXZZTHQ5V1diUEViUUkwMHRPT2Vn?=
 =?utf-8?B?YkZadlJ1VFEyZGJybktEZzFndi96MHBNQlFHanZpNGphUHZSaC81azdqdEpw?=
 =?utf-8?B?NmpKWXl4cUJvL1JqNUV5dTl4MkN2OWZZK2QxSGRzMTdVbDIzL0ZPa01XZWk0?=
 =?utf-8?B?b2hiSC8weEh4WjdpYTY0QUhkeFQxWjkyTU5wYmZiWDhBNFdYS05lQzc1T2NQ?=
 =?utf-8?B?eVJZSUl1SmRkOVdGbnhlK0ZaYlNqU3NMUDNZbVRNU3lNcVk4a3hWN0FqdmRC?=
 =?utf-8?B?dC9wRDM4alFiRlAxVU5VeHV3WFFWSEkyUzM0c0RFdUFSSWdOZEdpeGFhaGJV?=
 =?utf-8?B?RWVJc3FzNE1EdWlmNjZJdEwySjB0Rk9VYjVSa25WeUcxaS9uMmRDNXU2UmhX?=
 =?utf-8?B?elJTc1JlZXhVbXA1c1lDSjN4QkJtRlhpRm9WNU5XOExGZlNra0k1UmVpTG9G?=
 =?utf-8?B?RFNGRURLZTU1ZEs0VXUxL1B2aXZFQng3TktBR1BjOXV5VjduMHVOWXk2cWRx?=
 =?utf-8?B?Sm9JMjR2VTVPMXkvYnNoUnJrOGtlNnp3Z25TOVVpOUhQQ0w4WHRsK1ROKzhZ?=
 =?utf-8?B?THRVQ2ZRVC91UURPWDU1NnRmYlVkSWpQRjZVaWpHN0ppc2lDYk95Zlk0NDIv?=
 =?utf-8?B?clNxS3Nrcy9pbTU4cUlXK2lCS01kTHBNcVhCdkVWN3VwQitUZEZITDBYQzNy?=
 =?utf-8?B?aWI1NUJYTnQ4eEpDV1Y0dDVHYVVzUTJSRkNuQUsvNDM3TEZ5NFcyTmJFa2RX?=
 =?utf-8?B?TFJ4VkdwMmdTcDIvSjVCZVF6N3BWZERRNmo4RDV5TmdxNk5LcVFMRngxbWV6?=
 =?utf-8?B?bHdGZjNNTzFXdlFGS3l3aVUwZGFOTDVGU2RHb3k2a0toWmprOW9yZUNPMWd5?=
 =?utf-8?B?VUdoeElKVGF1YzAreGoya0l2SWFmRWNIaVFENEg3WFFibU5GeDlaMVdzR2Za?=
 =?utf-8?B?cDF5S1dRZm1jYUVxdExydzdmbGdDWlRVNUsxQ25xNmFLcXZqcEU2bXdCRjNo?=
 =?utf-8?B?T09ZME9ES0k3K1FJUXZhTnp4RmhIcFc3S0NYQ3J4ZXl2OUFUNGxtZlU3bi9C?=
 =?utf-8?B?L3htMDY4U093OEZIU0VpVjlUMnlXcisyc01zYTgxcmQraENYMXFnRkJaNmRz?=
 =?utf-8?B?MFdwcFlYUEpFU1VpZm0xQjJrQWdnMzNTaktKWlByQzUrRDdUY1JjOGpVTTVX?=
 =?utf-8?B?cUdaTlRjSXBJbmQ0VmZHSU1mMU5kWmR3TXZGWEVzZVhWdy9CQXBYMzZ2Tkto?=
 =?utf-8?B?cGNmNGpXTEJSeDVIbCtGL1dxdnhXTlBVaTBVbm9jRXl3MHVrNktZdWJwR2sv?=
 =?utf-8?B?Um5TUWlHYkhWZSs1V1VWVlg3cFFwWXl6THZpaXdzYzBJengvYmN2T3VXV00y?=
 =?utf-8?B?MXpqYUNtWHduR0hrbitsQUxxakM2Y3VWbDNMdlZMUUN4UjFZbHR5NEoxNFFV?=
 =?utf-8?B?VlZDVzZ1Z1N6NTJYMlZGQzRwaTBaUUw5UGpZaXBaYU5YVUdxa0ZUbHlFN3Qy?=
 =?utf-8?B?OUtyenhpRVE0azg1UWw1ZHNPM29IME93R2gzVVVoWEdEdW84aGdieE5BRVhR?=
 =?utf-8?B?OVBDMWhjaUMzVCsveDJqMWRjYlhjZmZEamQyQUdid2VIdFo1cVE0OE0vUm5j?=
 =?utf-8?Q?50LfRlo/Pscn17dv41LAkb+9Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40b4a4d-beb6-4df1-08b4-08db0ea842a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:26:44.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4HGruQfZuI81kZMg4oWZKcmcEWL+5NnyUMKmPlurYM2s5YzFYZn6vlFZjzq+Nb8jOKLyBBVcth+KOv//GFUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8863

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> The symbol svm_stgi_label is AMD-V specific so guard its usage in common code
> with AMD_SVM.
> 
> Since AMD_SVM depends on HVM, it can be used alone.
> Also, use #ifdef instead of #if.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

With whatever the final name of the Kconfig control is going to be
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan



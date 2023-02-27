Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6BF6A45D0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502705.774614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfGL-0004A3-AX; Mon, 27 Feb 2023 15:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502705.774614; Mon, 27 Feb 2023 15:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfGL-00047C-7g; Mon, 27 Feb 2023 15:18:01 +0000
Received: by outflank-mailman (input) for mailman id 502705;
 Mon, 27 Feb 2023 15:18:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfGK-000476-8l
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:18:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea76a294-b6b1-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:17:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 15:17:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:17:55 +0000
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
X-Inumbo-ID: ea76a294-b6b1-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmK5I2NYSBs8OrQU33MZT0AArXPRagj2VmdMsMEVgL5r42UeFYAStIJ3UOU22/YOi2AIr8Q6D/z1NGQ/naSfT3BMwGkdtMA93p9l+JnS98bNiAOG8dVReAW3j2IHKZQlUH3t43ZATCB1fPNIv7PyUKWzCdCfmMQVBxCCAnYpVMFQtkHXpXt5yhdiz6tHk3NW+GcpzFUJ3dom/0IMfX6ZFrtiFbneBJiw1ntQY6ZrMEl/O9+3C6yl9d/58JGWuVMpCzUXEMSl7JoOvkryeYxCUaEX7NorLcdWNhaHS3RIKE+O38ELVFu4vIp0wv/khLRlX7ztMcuXFQdCLTKmmKJCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59Fgne/iInyIhaI5N3irYGC1XaNEqmK7l8NM5DvEm3E=;
 b=VTNEvFI7YJCWKTHJn7uZ1VgGsTUEDUrPYMZXw50KZPRAQiiZvYMrJx1UMcCySVGYBmWbiACRT1RYA6FdukZoV7vBWsPgkRThTREbez1L37QEpeNdbxJIA+hBlRxid7FsEp6aIZCFg2eqvRruPMgHvseSmKcadhiWd1vGhKzc3Be1ZP2FnVESAN5AsOgmjWHTr44onbUp2ZL/xThIdKFcwHZCs1Hjcs4ih67t5X7mF+a/QszK5axeTM0TfIiUEm/iHOxeW8r7kNGjKvvAWoZ7jZKCtnJ8zEPvs2VtJAlyZHMCJe0u7iMR90iA8dAbeQznu0ER9YwRGPbWZMN3vJBe0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59Fgne/iInyIhaI5N3irYGC1XaNEqmK7l8NM5DvEm3E=;
 b=KH56M5TI5Yj7jfRQ+k35YmPcTp9sd/blRyQ+l6QuxGSb3SwjwQ1QXvBb1WdPapih41+NavaHUadtbDoKPmWTUII1qYT2qxqmgP1ghC5Mf9MYQwYTR1UaUJQh5QN2G1M2RwJkxMX6KsFhm1UTOmSrP9Kc4POpDHRiHhtIpRpnfVHAqro5xYWxRG+Nzk1vju4BTyi8OdI0+6hB6rIqxmVgMCrZMjbtu+85d7HqkDJ9xSsP5hmPiv8ZGDP1jdiOhRvGWWe1hsBQBuwgbepL09yfKiIvwuhA7HJBV71+ZJiOWP+RbVcj48/MCJf9EOCNishsuXDPijyy9DsRYDhtHpnazQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d86507fb-f1b1-3d91-e1af-967e6b40d514@suse.com>
Date: Mon, 27 Feb 2023 16:17:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a8cd3a-f27b-41dd-af7b-08db18d5ccf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VzZ1z6MdrOZ6WAKh4oePjDb28YQkz63xLMibaiG8DumvU28f/dlpGCpCjBYK7GYZ+6Le8JP7JxHBMlHGspGjOBUrtjDNjh8bmHC6RrErHyaayGASxSmy58XhUYHtPVHrCBm1G2bCnlcCVLpss0YLLETk18nJTrnln/pDztd1/KdW/w2kEXG8le1M7a53Yr6c1CwZT906betIqNJZiu9xBs9wHEnGWOxATMqLRWjmKgA/KfcK1P+tfuhwvjlVnVq9sOEjioMIQu4h9TwvpRA4O10UvT0UKTV/oFklP5zxUwgtwrO2ORunHCod5lNPzaerZIKrJTMzOw7HS13cR1rGp5Yz2TYTl3MvUJmhRyNmbeg2mkohQr0REx47wlGifvVRh3BmJuAQqH748cWbIYqrZIc+sxpjLJh3Rz2kpbwiTkxODf7z5l7R5f9i4Q+BUXqf1MgB/uIIop4EDyQ/fIHXMZFKHLZsO0XVArDWMziD/sLFGGpi8r8ifra9I4sLuN0WVQFFkdVX82aGiIvILhEAKzS8HXbvpjpyrFJRESrjFPS/zJX9KuOv5eeKKrVTfU62gzha8XzwLQJC3GyiHEiivfTROKNKQGSji9XL37a24AU1eylqpGjjm7xAJQ8/MX05Dro0Z2S2jFv59cxL27lpX+byMIBvy5BNrZl/TpYHAAZqwVgzRmdUMqqLxQ8q7z2BHoumFyABR+rPb7SDy5GLJUWN93qf1PESfSMwjhfJTgw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(39850400004)(346002)(366004)(451199018)(8936002)(54906003)(6512007)(36756003)(8676002)(316002)(4744005)(53546011)(186003)(26005)(478600001)(31696002)(86362001)(6486002)(6506007)(2616005)(38100700002)(5660300002)(2906002)(4326008)(66556008)(66946007)(66476007)(6916009)(31686004)(83380400001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0FlbEliaFowSkw5em80SVF5V2Z0cmRSL3kxaUNVcUFLaVY2YmhkZVNrRits?=
 =?utf-8?B?UDRLNkkrYUFMU29FbWpvM2trRXBUaGd5MnMvWWdlZzNXZWJFWmVnODhiYTNP?=
 =?utf-8?B?OEpUY2gwbWlqVlgzcFZTNDhYQXVDaTVGVjJsa0U4UDdibzZUS0RnZ1M4WXUr?=
 =?utf-8?B?Q1hnMzQxVndsRWdZMGlZTURRaHlEWFlQNWtXTStiMCtZZjBJNkJlZmhSSXFz?=
 =?utf-8?B?a2RHZ0RlYnl4c3JuMUhObS9ORDBtQ216b2ZFMllVYm5jSStlS09hTDBGNUJq?=
 =?utf-8?B?bXNjTDZad096TnpHQzk2OHdEZ1psL1FhNVc0Q05aMzY3NndPajE2SkR5dk1M?=
 =?utf-8?B?N0pNaUdSWnU3YVgycVlucHhLaXFaR1Qzc0JEaCtUSzBlbnFxVGZDYUU2K3pP?=
 =?utf-8?B?K0dtU0txU0U2ZUpZSUNMMlBPQjN1L1JzNi9zRHRMbnk2QjV0Q2czV0tQN1Uz?=
 =?utf-8?B?eHdrSWFZSHNsTVVmWm1IanY0MUljQkl5czFYZUphZG40L29jYnlSdWZjakRX?=
 =?utf-8?B?d2xueXZ0UENldGVMZndZdVI5VWZOc1dTa3JoT2hobTlmV0F4ZUt5RldSUlc5?=
 =?utf-8?B?elFiUUtRNnhTUmZxNTUxaWtqU0xQUUp4cmV4Z3dZLzFsVG9KNjJyM2grVzkw?=
 =?utf-8?B?T0V3bW9JdFVWRXlFVE9XWkU0dEFNbzRaUDhVREVObjh3bVFQeUErOE0rc0V5?=
 =?utf-8?B?cmE4dExHc3g5ek5pRU1uTEpYQ2xZOER5dEtxLzFhdWVJVkgyVmtFQnJjTVhq?=
 =?utf-8?B?UFNkcXBUc2E1M3BiamZ6c3pGdFdqUGxWWDdIbWZ2dGpVSS9udkw5UllqNmc2?=
 =?utf-8?B?dHhPYklGeG9OZjFzcWkxWHdmc2ZsTjRVTEpET1BwVkEwN0djRVpHNS85eEI1?=
 =?utf-8?B?UDhsdnhEQW5pZzV4TzZaRGdFaDZYOTV3MnVTenJGb0dnbDFoRHFCNmFaYUJF?=
 =?utf-8?B?cmNlRE9DR0NQeDl0Rk1DamNvSHRJY2o2aXhZWFhCeTJWRHFMak8va0laNmhY?=
 =?utf-8?B?M2IzUUk2czlmWEpvUGJuWkFtWllJMk5aM1lzemxrVUNzZUVFWiswN3lGOGFN?=
 =?utf-8?B?WWZKTGZSbmdtanNuOGxURVFhYjM4aWdPTVRvczBhUC9EZXQ0Y1BDekFhWVZz?=
 =?utf-8?B?UFhjMmJoNzA1TFF4dUFCSzZjOXhIQ3RnRGtDYXhETFVUR1Q0ZFYya25odlo0?=
 =?utf-8?B?cFY3Z3RQUFF6R1JOQTRsYnAvUDRBTWZRYVkxbUFaOEV6Zytpdjg4TWdZVTNT?=
 =?utf-8?B?ZHVtc3JLZXdPY05WQUw3TDlaSWUyQ1dvT095T1I1cGFSQVpMOUJPVjlMTU5N?=
 =?utf-8?B?ME5qUUNMbXB4WDVNR3ZJcXdIanYzMUdsNmNZT0lpK3A1SmJWc2JENUt4bDVj?=
 =?utf-8?B?QlF3ZmRtRHNXVDNaNCtGRDFlMGxTUTJrZkZsNTRJL3JKTHQrTkludFgxaytD?=
 =?utf-8?B?RHhCeWxJZFpuYnIvcG9YVkRYNWZiZHgvdFlBWndCeXNsMTYvdUtMdExTb3BO?=
 =?utf-8?B?a2MxWC9XRGNSck1LSHlXTmNIWXZkMWtSRy9iTEFCQksweFM3dGE1cW4xRGRy?=
 =?utf-8?B?YnpYTVlodlErQ1dpUVY5YW01eTc0Rld4cmtHUGRmdmxIQ0lyT2QrYkNVb2Ew?=
 =?utf-8?B?N0VzcWFhaWJPZW9KR0VXS3lkUVUwVTE2MXZDS2pwSzAya2g0L1RnS1RsWmhn?=
 =?utf-8?B?ZXZFaDF6WUdBa0p4cTVzbjJVVVBkREZ0Y1lBMkIrYVJKYUZoOU9UQUFwcWE3?=
 =?utf-8?B?RFcvRCtHdDljWHhhU1ArN2VYakFzMDZDbHNMZUs3QnA1OGdaVEFZa3pDcnNk?=
 =?utf-8?B?aGxjNEl0N3dENVk0T3NWbGxZb2RkMkRQZkJOdUhZUGxnaE5kTEhhYXV4STY5?=
 =?utf-8?B?RVRKajFmeDlRRW1GdUcrSUFxVnFET1JIZ0kyZnl1dWZESUZPbDNOeFE2MkRv?=
 =?utf-8?B?dWpYZ3NlVEc2NTE3d3RUK3g0YVVXaDdMd2Y2SzBxL0g2MkhRc0s4Z0dKeXEr?=
 =?utf-8?B?cXRReGJEaDAzRUlNS2NJOGNYckVDZDk5UkZXWGdScFMyTVhvQkxPMXVVMkkw?=
 =?utf-8?B?MDhRdEpIb1NDNHVaWGZ0a0pYQWdXQmgyZU04Y3RDRElJM3JSV1p0b2RPZXov?=
 =?utf-8?Q?YBN1AjrFtHWkxgTqwZ/YnxvrS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a8cd3a-f27b-41dd-af7b-08db18d5ccf7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:17:55.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4ON1Ai6hpeNe3OSY8yZQrVSOeRJXIuObjGPkw0JImNUt+IMXzPaMqnGc4EJQfc8hLs+Z5IFGnFAYaH1vksE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366

On 25.02.2023 19:05, Julien Grall wrote:
> On 24/02/2023 15:06, Oleksii Kurochko wrote:
>> @@ -43,6 +45,11 @@ static void __init disable_fpu(void)
>>   
>>   void __init noreturn start_xen(void)
>>   {
>> +    unsigned long load_start    = (unsigned long)start;
>> +    unsigned long load_end      = load_start + (unsigned long)(_end - _start);
> 
> I am a bit puzzled, on top of load_addr() and linker_addr(), you wrote 
> it can't use global variable/function. But here... you are using them. 
> So how is this different?

I guess "use" means "access" (i.e. call a function or read/write a
variable). I suppose it does not mean "take the address of".

Jan


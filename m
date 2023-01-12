Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F20667880
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 16:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476265.738347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFz8L-0001bf-Oe; Thu, 12 Jan 2023 15:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476265.738347; Thu, 12 Jan 2023 15:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFz8L-0001ZX-LV; Thu, 12 Jan 2023 15:04:49 +0000
Received: by outflank-mailman (input) for mailman id 476265;
 Thu, 12 Jan 2023 15:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFz8J-0001ZR-Mc
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 15:04:47 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2089.outbound.protection.outlook.com [40.107.249.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 735551ab-928a-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 16:04:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7175.eurprd04.prod.outlook.com (2603:10a6:20b:111::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 15:04:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 15:04:44 +0000
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
X-Inumbo-ID: 735551ab-928a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuldrY+qPLuZXonB87KKYRWXovbNal9Dwf3+kMZUVlxsHTiaV+wdkVsuzQCrof+NmNl/r/ECYLumwc14S8EkIIfcnF7vbib5Q+1aeFqje/WyE09e06t9vr+4GEy6lXhR/reDKHJYr35ti2dYRytaWWuQ7Fp6YqUHivNb5odtzBaWx7w6vGfCdfwLNHtgY/P+OT3qDrWO5alBtliYu+Oo7bEk8o3ah9adfPgThdj9N0QKBHmHrbUR+QA6EGn/Ab/udsMWC8txPBTC2GhiaFKXY339iwdmU0ui6UxkL2VX1YfSpAA8LlXVX0zLyT/BWH5+jkzXKjpIbGlgGa3jgNjmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cON83jzL3+W5FDpvJD3UKo0qwkEWtPsnqG2BWdw41YE=;
 b=YumPUN26mEpJgNJYNPP2X12mQlJtgLIMU1hGWiUCw4Rgs9j1Qpuph4/eqG3a51wDelBt/2NFxjaROqDoFQY5loTtcYfmYUZFN0FREr+gq1pWkgnx5oeT5EPyYpUKrw6m3fR2da0hgD2F0S/OEAzZpqBMRDWWR59g//FcNnI1O3hRoIZAXZpBDYnjz1JoA9LGKdP3FnrA5IW+PIRqn0MwhBLtMzYyWwO690OUIofam5xj9KZt7t7SZRxU638eYcg+7hMN2kn39UtoiEOgO37EbJI79WLwfGPJzUi2Jzzk4KKByjofmRfwGz2bxwqvSk1cdSg6+qdXxNg6fxyH81Dz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cON83jzL3+W5FDpvJD3UKo0qwkEWtPsnqG2BWdw41YE=;
 b=tF+sRzYy9XvM1IiHHIfDIqjUzXZvwZOZxvNEl7UkerhmLbXCBtnkjL7osJIe54uZl5Jtbyg5FNUlche9Y9lkXLMxnT2Le3udcmSHlcUMyA2OnadB1NonBVeZvvV6AABePg11ImuAqLKWQxFx8UVN5qIUvxbK+0+QAuaHOXWc3/dVwXN7CzHCVsw8jeZysv87GqZLOEOcQc4ERTJsg+Sy32H4oxRDzMX8+8epqKCBc6WqXfIk8GQg0GqCpFUuo/wyEDl0LwEyYBaCGhPCZc7uWsirLASXIbEBa9t9L5lOybN6e7HzvUj7m5aaDvQ1z/lTIK2j1F1+VthiMgvMKllhKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c757207-1f67-5cef-d314-e6959d5782da@suse.com>
Date: Thu, 12 Jan 2023 16:04:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] include/types: move stdlib.h-kind types to common header
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com>
 <b0119998-b196-8319-fee8-de3231b14d8e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b0119998-b196-8319-fee8-de3231b14d8e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e53b17-06c3-42b2-7e6b-08daf4ae5685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XfUdTJyd1hwgFuo4WJHqDv1E8EGzsX52d5Q/AzHqIdUuYgyUVPKZlDa5I9XFV6YZEc36a/QBg7yniJuObbDvVMCTFoITVDxDB2dqn2dnfDeXKItfG6hOfXcGYe3wkn42YVyjkIQqq+DBjwyOhVfg+2YmXo1C2cYDtYKyAUWBRJ3yvQ7ve0AP/eEpJo+hM3xmFwdOEtNVDTvqtEHOh37W1ld+2Q9PEbRmkHnw70FgCOKbWk96KWmcGRA8H6geG1O3KGzBj5nlSim0/q43rIRgLYkRTTXMuYRFX9pCJk8KbPd1PbcQeTSE8UB4Lm4vjqqT0lXA9Wy6ZgzOP1ExlY0jQ+GDvFSgS1muGQm8eXxXV8e3p4axCLQNr4K2m2WoBSGubQ+5wdSPGWMWzPXg2yWf16jioFEvab9+7L3unFFQjpFr6vW93YcNiD3rsVxBrBY1DEbjFM/V2fTCkhiDZLCj0jJm8I5NDJwm9nCN8PvCTVuRI/KqzpcGCSWCpBUM7XIUfKk0vxCsi2tN9t8nINchjq6tksAy6EVCkqq7OVwUEhxAGKvocTMcwRxYe2ovLORhrQZVfA5yY0BmyE80HiTuDK8RrK788K1coStg8WaQX+LIDzzvMudf8uL8ObiT0TZzcSaNP21/4LfppLymOFqcGaTJLZaQpr3zv5gS84TszAufVSD4s056IGVA7/bqp5yxyYP7vTIXXyt+2RDMtXdtCNcc51UutU4DkKgOOHnJd0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199015)(6512007)(478600001)(186003)(6486002)(31686004)(26005)(66556008)(66476007)(66946007)(316002)(53546011)(54906003)(2616005)(6506007)(8676002)(6916009)(4326008)(38100700002)(8936002)(5660300002)(41300700001)(86362001)(31696002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW1TMjZZMFFLbzFvOTJESDZzSGdmYUtweTB6Vjc3b0loN0wzOCtIQ0lkN1FX?=
 =?utf-8?B?c1lTbmVMQTJtTTMyQk9aTlRmd1RxbUZmazlMRmZQdURyR2R1MWdlV1FLeVh1?=
 =?utf-8?B?bytiMHRHeTRhdmRIdmhBamxTWm54T3lMd2Z6TEZkdWxqbWNkZ3FWTUJUSnU1?=
 =?utf-8?B?VGZUTG1ndDNDV1FpTWowVkI4NFpUS216UnV3a1lZblNhdDdIWVhtZzFBR2tL?=
 =?utf-8?B?dGkrZXI0UStwZXd4bXI5N1JPZ1lscU1NQXNDcXczeUFCRWdlM3IyeTNJT3Zx?=
 =?utf-8?B?UWNTU1hCb3g2dm45eEFHRTNMY1B4THlCZFhOMFljb0Rkckc2a1hkSk5BZ1Zr?=
 =?utf-8?B?Q2s5ZnJZZkFwZmg1c1czanJ0ajg1UGlVYXdMeTBqT1FlTE41dEZzMDFSMUc1?=
 =?utf-8?B?M1M0QlFBYm9HV3g0R1BpRkJMNXB2d1Y2NEJGaFdlM2ZPcTVuMnY0dmROOWxw?=
 =?utf-8?B?cTRGWU9xdjhRWmE4ekhOazRrcmszNTFEVVNaRFh6bTFuU0NZOXptQmgydWd6?=
 =?utf-8?B?OUJUUTFHY3lhWEhYWVpobG55cDg3SURaR0doU3ByMnliT0tuNllHTXpndTFE?=
 =?utf-8?B?aVBiNEtlME1DQ09zZ3JzR2UxaGZZdERzWnIzKzAyZTU5c0NJYlA0NDNJMDFw?=
 =?utf-8?B?ZWlNUnpWUW5TUnlyR2llUWNxR255OVpqSkZycytEY3BJUG9PMEM4UjErOFVh?=
 =?utf-8?B?UWlzb1NjRkhKb3FtVDdLY1I4dlVUWUg3YTBrVzZiME16cGxDQVdUcysvZzJm?=
 =?utf-8?B?a3dKU2h4dnIwOTF6cTBlbTJWeVNaVEVaQUcrVG5XS1piNHlEUTB5dVVaQkJI?=
 =?utf-8?B?YzhhYVhSN0lkY3RGcWRHWW9nVGhLY1BEdEp0c0c1ZVl1YjE1bW5LbVpVQ2lI?=
 =?utf-8?B?UzZsa1JxeEQ0Y0hianZzQ3NEcDJJUjhEQVphMW5UQWhQTWcza0xPM0RHOGFs?=
 =?utf-8?B?WEVoQXhMeEc4cHU2NCtzR0ZXZkQrUjlQclFUNG9MVkhHWEVucG4ySkgvK1hv?=
 =?utf-8?B?WW0wTHBndWVhaWdBbXVrU2FOdFJFRFpaUjd4MnZKMWdtb0R4VnIwejl6OE1N?=
 =?utf-8?B?TTAzcVZ5d2NIUTZwcE8xUWY3OTlHbnMvdXJ3ZlNDY0JGUzBpT3YzSXlGTTF6?=
 =?utf-8?B?bmJIQUt6VnlQcHkxU0NDYWo4a093Nmx5RE1zVlR3OXBFeEhlNnk5NnZLRGlh?=
 =?utf-8?B?MGtyaGtyWlB2UnFoZC9OamRJbGxKV1hoS1pxeEZzdmZhVmlsalphY2t3SmI4?=
 =?utf-8?B?NDhZQnhLR1IyNkU5NkJvbE1Fa1ZQeG1uNXJCcElqTUFoaWdhWm5RaXd3SlN6?=
 =?utf-8?B?RXpCU1UzQWliTGZxbDJPMFZVME9HK1V0RlJRRExuRnRjODUvNVlSa3h0azF6?=
 =?utf-8?B?SjFkZUt5d2dnSHdVY2F2T0RoVVZNYkZENGErcUw4aHFUSVMxN29MNUhVbk9S?=
 =?utf-8?B?NndIUGJYVTFPaUhHU1Z2aTcveGl6MFljN3RCcElLOUJYTGZjbWFacE4ybGgw?=
 =?utf-8?B?b2J6Z3NBU3J2dnhLcVdEVldHOU5XdWQ4Rkx1RGZ0WmdhVy9KVGh4c2xZdit3?=
 =?utf-8?B?Q2JsRUxDVTZoTHZkcnAyMnlkQitsNnllUUoxdCtsMnBUazBkTGZnUHgyQVdD?=
 =?utf-8?B?UXhMaXNvb3pDcUtHWXJOSUM0ZVBhZHVwdWlsUmh2VWk1ZklzZWh2SlZ3a1Ji?=
 =?utf-8?B?TWNMMDVmVzFRWk1iYzRUZGltdEFlV0txN09MUW9DazE1UW5nTThQbHhLN3B6?=
 =?utf-8?B?L3ljTExPbVF3U2tQdVZ2NHVwZHgzTDVCQ2tCaWxLWkZQRW8xYzRHMGhKQUsv?=
 =?utf-8?B?TUE0MTNVTWVjRVFZN1ZzWDNKcnFQNitXQ3QyODZPQU1wd2F0eFdjZ2tuV3Zl?=
 =?utf-8?B?QmdKckZ2ZlN3cEpSVmhPQXBsMVFoTUVmS0RxMEpxcTRYN2VyNCtBR05sQWpp?=
 =?utf-8?B?TDZGc0FTTXZNOU5FdzE3ZmczZ0lIdTFhOElPOUY5c05NOHhBYmpsTXpQcHR4?=
 =?utf-8?B?bEJGNGJGc0ljL2VkWHhWcDIvL3c1ZGRzblE5SWdIc3RjK1QzS1E3ZGZ5UDlU?=
 =?utf-8?B?SFZkczF6ZC84eVI2cjhyMENQU09tbEY5dWdsWStpRDI0WUd2SGV4TERJRXk0?=
 =?utf-8?Q?Mo9l8Y9iAXN2hbpljWmplcV0G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e53b17-06c3-42b2-7e6b-08daf4ae5685
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:04:44.3797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rat0xXX4wRDi3xtNtzCX4jO2rncDCwiffOZFJybCeGV8WgxD5ZeWAWFKAaUqm1x+ksAf4vi4WLORT/b3unQ3MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7175

On 12.01.2023 15:22, Andrew Cooper wrote:
> On 12/01/2023 2:01 pm, Jan Beulich wrote:
>> size_t, ssize_t, and ptrdiff_t are all expected to be uniformly defined
>> on any ports Xen might gain. In particular I hope new ports can rely on
>> __SIZE_TYPE__ and __PTRDIFF_TYPE__ being made available by the compiler.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> This is just to start with some hopefully uncontroversial low hanging fruit.
> 
> However, I'd advocate going one step further and making real a
> xen/stddef.h header to match our existing stdboot and stdarg, now that
> we have fully divorced ourselves from the compiler-provided freestanding
> headers.

Hmm, to be honest I'm not convinced. It'll be interesting to see what
other maintainers think about such further moving away from Linux'es
basic model.

> This way, the type are declared in the usual place in a C environment.
> 
> I was then also going to use this approach to start breaking up
> xen/lib.h which is a dumping ground of far too much stuff.  In
> particular, when we have a stddef.h, I think it is entirely reasonable
> to move things like ARRAY_SIZE/count_args()/etc into it, because they
> are entirely standard in the Xen codebase.

Yet these aren't what people would expect to live there. If we
introduce further std*.h, then I think these would better strictly
conform to what the C standard expects to be put there.

Jan


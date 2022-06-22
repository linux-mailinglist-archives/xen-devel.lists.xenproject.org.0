Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B1755451C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353701.580667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xIq-0004ks-Bf; Wed, 22 Jun 2022 10:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353701.580667; Wed, 22 Jun 2022 10:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xIq-0004j4-8P; Wed, 22 Jun 2022 10:09:40 +0000
Received: by outflank-mailman (input) for mailman id 353701;
 Wed, 22 Jun 2022 10:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3xIo-0004iw-0p
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:09:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bcd8536-f213-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 12:09:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 10:09:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 10:09:33 +0000
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
X-Inumbo-ID: 6bcd8536-f213-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgQfUuQNbh1CL1tZp3T09EuchIOYxDmsYw5c8nobc9NeHhiPg7RcrqSPEU/flhW8GPqng/ift5v+3fuI63NWh6zQ1uqqPgl97Qp93SpDGJY+NCRUoVpiq1P2b/hFX05ztYBssUx22z0ur0+VgwhTCnbvxBteO11lnCzoItdsyZXxw63DUdL78HR4lsueqOt10xVvoYh/B/DcviaMgxjSkZp2An04f+J8zNmK5WHUZBQR10/Jz2B/zWkbJ7zrRvyIOvfppYcUecjVf3RKrBOSODpNBW3e5A3DQ7eoDdU3lwmIXpu/eFDcW0c7tgVdEYHSvtHKnZ+Tb/Y1tXayQ8fyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7RrT7m0OtSEOmtV2jiIOQrTurbm5yswm9owuVzDt9w=;
 b=MPtdaFBVfRXyaslfuOSHXARNajMo0+yDK6DMiGnKfPVuYJIoLk78nUc7d3/LJfYbV27JYQUsfxR35YVxIFZ158Qh1wTpsFoLfMO7jj/52YwBYP49EZrNWYsdc4HKvN1kkUNzaW4divqp0aFe8JpEv0eWkT6GD0hZgTOAmW0c3BzuhSXYBfjeCd/nc/y1R4fjo/Xy9kXA/7xbwjNEf5KhUJmcmFp/L9t09xJjuE4NbKiVZ1gGzkQeYaFWeB59jUpFxpFfANYf5zHMyPQmuxJLlauFU/dOiKytmdoN4qYYjmDuLQJqdauccWlyJRPDLTrQ0cvQKwY4ZMc8zc361XBZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7RrT7m0OtSEOmtV2jiIOQrTurbm5yswm9owuVzDt9w=;
 b=CvWW3j+UDLlUsqyzhdP0DorJwBsCXTBXi8ojx08tXnIRUziPNH4T0aMq2Hz8hseCTwvzyjU4j15NWz7W0aUCk1W3+IeH5WHDSBug8kGOEgi+ijpgAdgaAhBKx4sRn4tyEUx/LY6FubHocVP8oVQHCZvskhe0zX9DBQyHgKuktUIn71G04wPhEdwBa0Ralo9cM37DtpmbFmbSpPSNSiaG7D3N2reTi12SiTloPf/vueCO7+HMS6lGbGxFVBD4oWTrfSnajplFxKTKj/hA6veW40OOf2zZRJibDgD7T3Xg0fxufkRnr+NBrbJ1u1V2c2G1VkzkQbWOWmDtHZFodYkrkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18494326-7cb2-3fe4-e5e9-98e2b6260abc@suse.com>
Date: Wed, 22 Jun 2022 12:09:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>,
 Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
 <5b788e1a-d872-e318-1be5-8640fe887b9d@suse.com>
 <63208954-3C7A-4C91-97C3-8D6EA21F29C8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63208954-3C7A-4C91-97C3-8D6EA21F29C8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0415.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f28d18f1-b2e1-4e3b-91d0-08da54374dd1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630498FFC695F7B998D36BEAB3B29@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RSsC0TIfZ1CyKzRYxVDApaNHgYrm53M3tLq+jcQ1OkTmEh5DBZMNrHINIjG8cU4MaTaXoMYLkNIILHp3BLa9frG5A/1OSFws0NkKB4EavrfB4He4qp/d3WbYMN/Efi8yZn49UAbNLrlCLjhift7FpBrHZbPVTuEXGx3sE+sZ9ecd4O2j4JL3W40Px0qQjwSkCrys5EXaJkamtGN4WP9hk+tUGnIcDdWqCy3LDoOJuJ010fxjXQkzAbHzRU4ISSYs+KJj4j/43ln7Akvzf/9v02xMN2DiuFP6uRVYaRw7eYp6iD8Sd82FfWyNEqM1ocK2UYwHg60gGybCiPTct2Dhk7eqVx+0FAWNA7ff9mTtEV9tzLqMXLF0Zx+w8jheNJSSza0shUm3fTn8TWq9ZZidk4TfTKkKxoMW6ChNks2hvzSyevQzkxoyVswLc9VkwFSE1lehgFyPXgx+1GvQkZEbQLZEGGOrm3CIjgl3SguWq2nnz8Eq1qKK3nGN/Vk2plskZlulM+jYFaIF3uUW2FzBLK6WLOYI2Rn+XxCPuGg09+lHk9hekw9pdD0k8D0x7oBk+b3+xfGM7ehHBiy/SJvc8kpB5gF/ZXWYq25EOwf7A4CbwjQxsuJ/P4OVyvwtryOg/2LM/QfAQ/Wr8K4jpWDwKTBhIUTjhW19r+u/VIysdSKAPD3398//8SWos/wNzybOMRGPoTt11qZjD7IbLg2774YsH8QXnAM0JeK7LJTY8aaP2JfsEfqTAdxrzMy9V7/tzyl1lUSmexwd9vvezuhdAlXdSR4oPqIHv3LdGkCXjD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(396003)(366004)(346002)(8676002)(186003)(38100700002)(4744005)(36756003)(8936002)(4326008)(31686004)(5660300002)(2906002)(6506007)(2616005)(6486002)(31696002)(66476007)(26005)(53546011)(41300700001)(66556008)(6916009)(54906003)(316002)(66946007)(86362001)(478600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGxyekVGM3p5SHFiTHFOV1A5MmZEZ3JiOFA2QU85SnFkc3V0UVltODhBWWpN?=
 =?utf-8?B?ZlZPcHdYUnFyMHpaeGxHQzNyNFptaU1pSzVvM3JmSUdtK21DQmFtbDJtblIv?=
 =?utf-8?B?cTI0TGlNcGtzbnpGWi9ubXE3elc1eWdNMHlSQ3FTWWxiTHQ1cjVudE0vczJ0?=
 =?utf-8?B?M2tlVm9DcENUcGhCVGgxR1hFWDVlMzkrS1ozV1kzNlp0OVM3OFIyaFRrSDNI?=
 =?utf-8?B?b2VXT0VRcXMwbVZ1UDI3emN3Q3BTeUZUdEVscVFOenpNSHFMdXA3bTJubW5n?=
 =?utf-8?B?RU8zb3JITzdLcGFmdjFtODk4b2ZWWmxqZllBN2t5Tld4N1g1WTJGc3JaenRm?=
 =?utf-8?B?VGN6ZStYd1J3elhtRVdoWUsyYS9Pem42TVVGOVBLWUphQmxlNjZqenBJMi90?=
 =?utf-8?B?QjNnVXdVVUorZU9KaWRDSVZYZUtlamlaTk00UHVpNDBReloxMExBUWdIRmM2?=
 =?utf-8?B?eWhuaXdiSStyN1pqaG1UYVg1U295QWFsb2pXdXZZKzQ0QkNjVUcvUFc0ZzI5?=
 =?utf-8?B?bzVJSFpaeGZzRFVlV1JkWE9hamRhVkRLcWZBSUVQaDQ1SHNyNW9FSlZDL3RD?=
 =?utf-8?B?RXZtZVBqOUdhUjNTSXJHZWFPZXN3R2V0aXdDQmZLcGNkbDNySHBPbURqaGhH?=
 =?utf-8?B?dU1PMkR5OFVEYUZBeWNGUkZtQnl0RUdsN3o3TXg0eVJhbWVFK1laUW5jaWJn?=
 =?utf-8?B?NjlhYzN1bEVtTk1penJXN2YxcmkrM1Zsa0psL3ZlR2RVZzZPOVhZMFdIRkcr?=
 =?utf-8?B?VW5QRElacDkyUGpYU2NWVHpzeTAvS2tUc2pwWE05b0tLRkhEME02SjNFc0Ru?=
 =?utf-8?B?OFFwaVBZc1NFT2YvZ20vV1J6cHA4cndNajIrMjhiVHhUcGZpR0VKdnFZVS9y?=
 =?utf-8?B?d1c0bkpHbWF2Y3dFcjI5ZTI2Skc5MmExZ0ZKdlRCQnEyT29ER25ZdDhqbUdS?=
 =?utf-8?B?Rytwb0FFSUFIOHh0amhFUTM2OXBWOGdwOURDcWtIM0tnbitBOE9CYW4vU1lC?=
 =?utf-8?B?SmgxODJpWUtxWTQ3YUtMdkNVWWRidjB0ZFcvWU12NTRicEI1bWRWWTF5b3Vo?=
 =?utf-8?B?RTJEVS85ZzZMZzBveEFZT1JsM2dNQzdEZkF0WXpDcUVLRmFuYWhreVlIb2Jj?=
 =?utf-8?B?bkk1dlhTcFo2OFdoU0xsaVkvaU5XcXdubFlIWXA0aytWK1pYSUxuaXA5S0xp?=
 =?utf-8?B?emFZY3Nva2dxWHo1L2Q4K0I4Y2MvekhwZ2hRNjFtazA5bm9sanpuK0VsVjdn?=
 =?utf-8?B?bWRkRHJxWE0yd0RhcTkvYW5wNSthNSs5UnQ2Ukk2SXA3aVZpdUNvTXM0OTFr?=
 =?utf-8?B?dGpzbnh5cHNLVTJHUHc1V2NPUWdZSk9KOUNvRitYeDRPNjFpZGNmdFpGQzlI?=
 =?utf-8?B?c1ByY3plTDdNYUo0OHRiYTBObmk1SmI4WWZTZ2RwZEt3VnFPRnc4a1pmS2Vm?=
 =?utf-8?B?TWhtR1J3UTJSQnpidUx3YlR5TkRoc3U4YVArYmJQVkdQdm5LZGh1NnB2a3k1?=
 =?utf-8?B?ajJ2a2VyOENUVjN3NCtSMHlIS3RVL0pxSkl2WERmVGxNTTNWSGh1SHVuci84?=
 =?utf-8?B?Y1EwYXNmTDMxVTR0aFJ4eUIvdnVYUzFmMk9NOFFRYUNGcW9ab3cxS1M2ai9n?=
 =?utf-8?B?U2hWbUIzYVlOc0NjMWZwMjM4bU82cUlQMEk5TDZ0L1pzeVRzWFVBZTA0cE1U?=
 =?utf-8?B?RUtmZGJBMFd1NDJ0aDl2d29jNVkvRWYxZjV4YmZnTDN1TW9tSjQrU2ltb0JV?=
 =?utf-8?B?SXBTdlh2V2JGS2lwNzM3WDlKem42VkptbWpsRVRuVU8renNFV214cTBCRHll?=
 =?utf-8?B?UVRqYUNLWlhVR2Vjd0dRS3l5TFVIZ0ZLMng2cXlhRkhFRHJWcXhyWDlmK00z?=
 =?utf-8?B?QkNlVC96S3BPUG1ILy9tS0RtM043Ujk1NzAzcWd6VVJLbHJpZ0phOXFtRXpp?=
 =?utf-8?B?YWlvT3M2anM0MEZ3Qkh1ZEpWcFg4blVFcEZha1ViQk1OZHVPbTRvM09GYXA2?=
 =?utf-8?B?L0hlOWZ5YlMzclVnbE4wbFFuTnFZaE9NcjRGZjduQ1FnS0dydHNnY2pNc0hD?=
 =?utf-8?B?My9TRXEwd0NtWW9CaEc5cThXV3Y3RERtTEwybS9FK1luVmRDL0Y5OGhPQVZq?=
 =?utf-8?B?YUVMU3NtcFc3dUh5clVNU2dPQlJkb2ZHUnVSZWRmNDU2QXdnUHJVSkF2dnVI?=
 =?utf-8?B?WW5LZ3ZsVDU5MnR1dlVlTzJLZVpnZXBNSHEyUGJQSlFkTTVkVFF1ZEROT0px?=
 =?utf-8?B?dUlmMm4xeHYrYWNIbWZBZk1YSFI3dHlQMEM1dzZuU1dLUWMvVHNDSkFnUFdL?=
 =?utf-8?B?SHpPN2hqUWsxWFlVQjdhZU01WUpicjNrMlo1UnRHaS9qS0dsbXlndz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28d18f1-b2e1-4e3b-91d0-08da54374dd1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 10:09:33.3267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ur+kWV1fLnTv8kxE040bnEUnOnBtrg80EnKldPAaOLtTI2rOKWZK11YVgU/4j+RvLHFPX6DwKmKC67aYlaUrxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 22.06.2022 12:05, George Dunlap wrote:
>> On 22 Jun 2022, at 09:59, Jan Beulich <jbeulich@suse.com> wrote:
>>
> [snip]
>> In general I also have to admit that I'm not sure the exposed data really
>> qualifies as a "resource", and hence I'm not really convinced of your use
>> of the resource mapping interface as a vehicle.
> 
> I’m not sure if I’d call any of the things currently mappable via that interface (ioreq pages, vmcall buffers, etc) “resources”.  I’m not sure why the name was chosen, except perhaps that it was meant to be a more generalized form of “page” or “pages".
> 
> The alternate is to try to plumb through a new ad-hoc hypercall.  Andy suggested Matias use this interface specifically to avoid having to do that; and it sounds like he believes the interface was designed specifically for this kind of thing.

Okay. I guess I wasn't aware of that suggestion.

Jan


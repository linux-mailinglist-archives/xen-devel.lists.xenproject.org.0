Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC36768F51
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 10:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572808.896850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNp5-00061n-JE; Mon, 31 Jul 2023 08:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572808.896850; Mon, 31 Jul 2023 08:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNp5-0005zY-Ga; Mon, 31 Jul 2023 08:00:11 +0000
Received: by outflank-mailman (input) for mailman id 572808;
 Mon, 31 Jul 2023 08:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQNp4-0005zS-1f
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 08:00:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43b07385-2f78-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 10:00:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 08:00:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 08:00:04 +0000
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
X-Inumbo-ID: 43b07385-2f78-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OM/mdpD/o91ilQ9EkZnHfiUVyY4R67hMIeJVjRxxYdcAPHEbsj6MkgglmEbbeA+5lW05SrQfrsLIziJtsMo1JCKDFKlfld+t+XQZRmga2qqNxYqngLjrvnFQaV2g6CirfX/g+kt1DtFxqoOAgxgqg/YePQi/iI7VmmsZUpIBnvWgRV1f4tF1TPhYDs6mXpBsNPyLydCZhGJFl3+2tlcM1qH7T3fpyqTPIT8QsL4YA6QaQGjRN8Bpf2bfHwDr10MLZu3AKs3Mjzp6dzQwPF+n8EC6oJcf5Z3mgdz9UW5QEwuxiGx3Woe8uR4IzyM7RpBoyK1nzT/cUge2XTBNyAf0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTt3AA/EIOl1aXs66bZ5rhIuWTyLgTYN36E8OiDGz54=;
 b=iAJzW/6Yr6W75n2IcB14FtUMXl0WxZInbVjwCREoBBNMy7tPamdDDeCRDLEtKxpdKNTQ6sGPzpwlNguVzLMTlykKE0ZaNXJdEsae36ZaHUYK38p2Tj05qQCzFYzXBhnRXce5B3PuyjT8Knk4TBxY7QlRjRwQvQY0OdQDf+HNkhlRq/L7G64B2Hm5Xot4VFBG25Esbpp5q5jk11EwLDiCQ0hzcGeN874wSHPDx+bQFNdtEpdaSEvMKFztsOe0xwI5F03viRJMwg387LgQNhWBNi41IbfTTo8WwKffc0cvMiJBFjnyWtIImyL4SCvz0itv+mVNzexfeRUbktp2nsn/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTt3AA/EIOl1aXs66bZ5rhIuWTyLgTYN36E8OiDGz54=;
 b=rBj9tt5zwapaJzqrXftEGe/ZetvwPJgTr/Xei7cU0zv0tEbHpQUR2tPFDLKYOJMdFucsNnOFyYjmL3QoNp4yUpxmo7ihjkenvBgVTLKWlPqjXARBfRcyK+Z4Ht5NJSHuugYR/xGemMZo4zxP+Ra8W8YYN7HDp3L6EwYKY3szsTu0SSB4aHNuNOQ6UX+MM1ote8AZhEL0birhsWPdHW/y3rGSLXGcN1itNBh5qmjJmQrmBvexiT3ZULioHS95BpVef1O5Y79Okg2mtnUde3Xi+RwwlHnKkO7a95tiUI9pUgK6A+CvWhoAs4CggPV7v9Nl9XKGO/bxcgC4uEv6W25wyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06a3f79e-4345-7a4b-be57-728a8b01befd@suse.com>
Date: Mon, 31 Jul 2023 10:00:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
 <3470bc26-3cbc-e0de-53ae-203449493b51@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3470bc26-3cbc-e0de-53ae-203449493b51@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: ca773c2d-fdbc-4842-06a8-08db919c2630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M70XhP0DkatWteUQkyGHhefttzoZ534bRZCyyf2X43MNPSIYM/fnPV+tJbSAqUOCfBFBjZxiSLXSAXvXKEROW9FGXcF9xkDDW2guBKJ+tddoEPcuuVRMQmUrJysUU05TNwpcBkC5SxZMycJYtn87ptwjqkvcfjWMgQfx3yh0T1VTsNwMne87e76q+6KFsDDlkrj4xzjq5niswEFnYPJggiB4u57/X7fCVvS/zIqsp8/JFCvAn5s+qBCkj4qNuoom2jz7XZH1D952kIscVGv2oAntDSuIoEI3wJ/wWcm9g2iQpa3uUy562O5YpvCgx8Lf6/8OsKaJAf94ZX3ZIfvv4cAF9VuP+UbWGRWEktrwFCtKxI7D7TiimBxcWbJjqB0/iwdLWY6AAoka1LDnv+jqx/ArTIwIgJazpeGCvoEtLfOe2yC5MAQb2Ff7jgqpjxV0aryXgTgE/LYyrfokh5pKpccGmKbxFl/aTeH9PFGVgBWYa9BzKqslMTUfDJmO5WfpktLV7irCDxq/Q8DzMnRG5XlTNqQVJz9BwBF8UYPjdST8CwxpQ15Frop5R6f3pdSg1/DJXqV+bikCNy/YmnJAiPTR+mp8fQgbfyMTpCAthmW+iuxoN+h+pzr4Se/lm56HATpmPxCfqcU370Eaxoxdhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(31696002)(36756003)(86362001)(31686004)(2906002)(54906003)(478600001)(38100700002)(26005)(2616005)(53546011)(186003)(6916009)(6506007)(8936002)(7416002)(66556008)(5660300002)(6512007)(6486002)(8676002)(41300700001)(316002)(66946007)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QytLbEdQVWUvU3poM3pOUzVzL2dxZnRxRHduOUh0RCtMS0owRUFXL283QnAv?=
 =?utf-8?B?bFU1dmhhRy9Qajl1K2FCVmNRY0UxcFFIbklIWkxtNFIxamU1OEZCTFJqVlRC?=
 =?utf-8?B?c3VWZVEraDFsUWYvamFJaVFnQUNua1hUZWRGVUhuUDh5b3lDSVhwMFV3MVg1?=
 =?utf-8?B?U2ZuZ1ZzZHZMM0hqR0lrSnlmVm5DZ3c4OHl1T1lsSkg5dEZHRXFFdkgyTCtF?=
 =?utf-8?B?UjRFc3hrQlA5Z3FmNnp0TEMwYkg4VmFTYjFDVXhLdEVJZjFENWFzeDlNNGlh?=
 =?utf-8?B?THF2VWp5REQrUEczbVdDZkZ5MHgwazd3THNieUtwN21hRGR3YkVJWGZsMElj?=
 =?utf-8?B?YVdUY1hPclNEM1ZGM2lBQ00vQlh3SHdUbk5jSEV0ZjJlV3MzTFRqaW1OdE5S?=
 =?utf-8?B?MkpIcjZpUnVPdVhsWDQ2MURLclRoOHU3ZFgvR25oZ0d3YmpGRUV0LzVQaElT?=
 =?utf-8?B?aktHZUFoQ0Q4NHUyM0RXK3J5TzZxQXhUa1ZjM2wzWEkwd3hKR1ZOU3o2SHNE?=
 =?utf-8?B?ODVhUVhzeFI5b2RQS2RuUG1PU1EvZDJQSnZYcmRDWXd1Q0VuQURJR1I4MTQ2?=
 =?utf-8?B?ZlduVGFBWTFsUyt6V0ZGTUg0aWhHcExvY2J3MGU3QjFyby9qVDMyS2IrYzhB?=
 =?utf-8?B?RmhwUi9FeG9yWFdPSjlIelByWno0eDZhb2hsQnNqWWY5dmh6OTQ3VlFYcWVD?=
 =?utf-8?B?NTFHb3FBY0srOVhpYjZVOHljU2w4alM0eG5YQTRLTDNYdEVEUDB0OC9HUDBO?=
 =?utf-8?B?VWJ4eDl2c0xHazFmdExIMm9Zc1FFdGU5eCtOaHU0aGhJQmo1Um9ZQWRtU2JB?=
 =?utf-8?B?UEpWMVBKVVBiWEZKTVNPZWQzd2I1Z1V1ejZkWDRORkZKamd4TDRWNS82VVZZ?=
 =?utf-8?B?MVprY2hnMXQyY1dFQUlXWmZMeks4TjFEZWFWaVBGN2tXRzU5QWlZSDVjSG15?=
 =?utf-8?B?TStmaW1BaFVVTitRK21FSzgwTmtzYzNDa2h2UjNWWGxRQjZndjAxNDVmUlIv?=
 =?utf-8?B?V1pFQmVNOXJ1NmdZNGVQYU9XRHhITlNXWDJNQWNnK3Y1bmVUYUJFbzVxaWVa?=
 =?utf-8?B?WHZFWmtqVmVvaVlXcm5wOERrZ0RjV0xzcG1NaWpQaE5BamV5blFlcTAvemE2?=
 =?utf-8?B?MVB4cXpmUDhXcmh0NFJCTzlqdnhkN1B2OEJFWTJaYkFjZmpjdmQ1dUg1Rmlk?=
 =?utf-8?B?Ung5NVJKMllFTzk5VGowRHlmTWZPUVRJTDFjMWJJZWtWMXpmUVNwYTh5V2JG?=
 =?utf-8?B?d2hZbzBORDZWLzhxb0Q2ZDJXNFdRRm0wcFo0UndiOGQ1WGlUZXhWclJGbU96?=
 =?utf-8?B?QjJBNDRsME1kTExLWnFZVGZqOS85MWZPOUNPK3dLVVFkdDB2dTAyTmFXSjF4?=
 =?utf-8?B?QWdVNmVYZWtaVFdUbE1ialZobERtaGVOcTlOQk9rZVdSTjB1SmFTK3F5VFFI?=
 =?utf-8?B?VmswNHo4UlZ6ZVZ2Tmgvd0NvbjQrZzdyS3JqYlQ3RVdaYVZHYTVadWg4ZWEz?=
 =?utf-8?B?QlZEeGFaOVc5ajVuWTJLQmw4a1NBeWp5blptV0xsM0tSdkhJNWRPSmw4STl5?=
 =?utf-8?B?MFpRYWwveXRjenZrSmMrNVFWTjE0OTFVV25nc3lCYjNoREdJcE9CN0JGSkFo?=
 =?utf-8?B?cjBPc3hMQlJwS21wRC9wZW1KVXhPSDh0QVQ1ZnVTUU5oRGlzTElVckNzWkR6?=
 =?utf-8?B?dDVQRk1INHBsZGZsL1F2QWZoMmRTL2VjczZscEtISmpHSVFpSFBBYTZibnFE?=
 =?utf-8?B?MWVRbDJvdWsxTUU2ZFlJYnhzKzdubHU4N2VmRFBQSk8rMTh5ckNrWWJlT0Vs?=
 =?utf-8?B?Z1ZNY29XakxGTHhpNXVCRFZmR0pTOEVwUG1nZDlpQXdBaXJab210RlRuU3BZ?=
 =?utf-8?B?T21yUndKWHA4OW1mdlpHMjlLSlFHL0NyUk1GM3J5REE5RlRvNDVlVUlVUU0z?=
 =?utf-8?B?eWNSeVVkbTN4emxuWmJRSkhBbHVYODJVNU1Hb2NseXV5aW90YkZHV1dIdnI3?=
 =?utf-8?B?ck9zSmtLRFFMQ0I4K1poQ3BNL01oVlBWRVJMeTNRa3NOL1ZTQ2lXYUJ5aXVx?=
 =?utf-8?B?WGNuUWFJdzZ6TjU1RGMxVk11UG5YR1BId0Mwc25INmZPajhXcDRkNjlhZEhI?=
 =?utf-8?Q?D2/Wd+72J7YF5aDlCi0xSEMVF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca773c2d-fdbc-4842-06a8-08db919c2630
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 08:00:04.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: an/1GhBSMSHXTGTh/ATQ/R2UyqnKKsXiXRNUvkne+mD+ddE/89ULjlKbSpgptoUvotnmsD+mvtvTbUaj4HwzvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123

On 28.07.2023 18:58, Andrew Cooper wrote:
> On 28/07/2023 5:36 pm, Andrew Cooper wrote:
>> On 28/07/2023 8:59 am, Alejandro Vallejo wrote:
>>> Adds a new compile-time flag to allow disabling pdx compression and
>>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>>> conversion macros and creates stubs for masking fucntions.
>>>
>>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
>>> not removable in practice.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>> v2:
>>>   * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)
>> This series is now looking fine, except for the Kconfig aspect.
>>
>> This is not something any user or developer should ever be queried
>> about.  The feedback on the documentation patches alone show that it's
>> not understood well by the maintainers, even if the principle is accepted.
>>
>> There is never any reason to have this active on x86.

We can of course continue to disagree here. At least with EXPERT=y
selecting this option ought to remain possible for x86. Whether or
not the original systems this scheme was developed for ever went
public, such systems did (do) exist, and hence running Xen sensibly
on them (without losing all memory except that on node 0) ought to
be possible.

>  Indeed, Julien's
>> quick metric shows how much performance we waste by having it enabled.
> 
> Further to this, bloat-o-meter says net -30k of code and there are
> plenty of fastpaths getting a several cacheline reduction from this.

A similar reduction was achieved by the BMI2-alt-patching series I
had put together, yet you weren't willing to come to consensus on
it.

Jan


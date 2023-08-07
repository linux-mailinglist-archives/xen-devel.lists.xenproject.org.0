Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01F771B6C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 09:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577783.904804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSudi-00071a-UX; Mon, 07 Aug 2023 07:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577783.904804; Mon, 07 Aug 2023 07:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSudi-0006zX-Rc; Mon, 07 Aug 2023 07:26:54 +0000
Received: by outflank-mailman (input) for mailman id 577783;
 Mon, 07 Aug 2023 07:26:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSudh-0006zR-Mv
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 07:26:53 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe16::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c76ee96c-34f3-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 09:26:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 07:26:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 07:26:50 +0000
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
X-Inumbo-ID: c76ee96c-34f3-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCG3DgBb66QOLEioPB41q4iDcn2BD077fliNyj2Idh7FQaKONL+8R+KbWUj1ISVbf0YeG+B1HgZoOY0tugRBOGdojzKMcfesOq0LjdK5WhTucO9lPjigxTrzti5TWYO3RpDIKjdxiBhkDnrJOa56xijlAATRLxaYw7CFfdy1NEVqkhV24M6Ui/Mke16wCUbaX1eb9VgHC6oR+Wo4k36UAdSFvhlXyPEQSirEuWElMRMSWqZZMOzJPavJQR5ox19NJoiH6+mqmZWPPVzF+0LQC0aDJR1ETHKb1c8sseokZO+aQSq2rsH+l/Lz9KLEBut+xts4tn3na9NJUFuigWwITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJu3C6ooQ2gGorMkv0ItusmU0mDmCTJKQYDF5xjDWOQ=;
 b=AMUreFfjVA17v7YqrAZemDnNIE8FkJl7nWSMXObAYaKSA7Aqx3ZUCwTQq1gxtXt/Oo+AvfxVZN6Lukh4KorceEmNAK8zo9ZlbTk+15a0WJc9gdfliHQzYAtlU4A9thGsGy07v1zwzUOGu6oROz3l92bCKyQ+zZ+RwSBHCVmf0muA3x2q27CVFmeO/5dxZSa3Q1iDH9MgIIbZ9hSWwSEROrCw59Xg8i4Z6fPvBbeIOS5elGeb/KDMtl1JKVc+8VFPgd7RTBnTjB3U9y/EwyC2NcbheyMoOoCUQKJUwvgSL5BxIC4KvzLb1QWoMlJ/nH9BSvNju5xljrOWlyLCQYjFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJu3C6ooQ2gGorMkv0ItusmU0mDmCTJKQYDF5xjDWOQ=;
 b=SRHBAYsu3JeOPYWstDlydJKMQ/HMtA/0r/rfH2nES+xBpx8hRo8/HvgWnR0+IpASeBySl0ZkazR+eDnN8cQ1FAVsh5s/YkXs8ta2BpAhGi0r4b9PUfwv9XlhiY6uqec4x5rIyCUDTlLN4m70xMr8SiRxPeuxwS4n2qjWUV4+M2VuWeMZhXtIymxQs8u1d7m7vDpXpVYbRwIMbuZR0NUZ8JVmX7v/CCsALUQG1iFXAoKod3AKZWgO5nWrtCLHaS/n7zdavF0QH4HrcORkRAZgHKIyeEGIKgXu9WU/4/SRezWiIgJdAJLpf1Gb3wnGfBsj0t+CnPl+YCHYEi1Pt+wkvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57c5737f-a963-8cfc-5ec0-6b68bf9a5579@suse.com>
Date: Mon, 7 Aug 2023 09:26:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Michal Orzel <michal.orzel@amd.com>, xenia.ragiadakou@amd.com,
 Ayan Kumar Halder <ayankuma@amd.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
 <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop>
 <00fb1a58849ec08534465df2f8ca2284@bugseng.com>
 <95a6d085-cbb9-ecb6-134d-6e4d994bfd35@suse.com>
 <f5443fc1f3e56c79e3149fac42e060ef@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5443fc1f3e56c79e3149fac42e060ef@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cf8c56-4db5-48fe-ac57-08db9717aa2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5/pv2y+lS2s0IHA6Kfmkd8DDZ1nYVYbf/Ls1T1nIzPjaeFl0GPs03h2NXZUlTo1F8EyZEuTmqQr/SM96zLnzwltjtmOrK6UVn4qblrdB6P0yMJAJhG8oYX+tOHvECaHIdIJVRsHeSTIwvicOhdquKktTALtdutqRsdW/8YU+GakX5K+S6kjSzg49l0R5KympxARwqfTWUMzLovduDMRjQ/ATcvp96VvuWFFK8f4eiiDYCysgC6gmJyr6wKSAZWlSIHOnkj8gMJsJ7+ZZXWAfVArOA+9s1BF0riRG3jxhsblvPOjP5oR+WaPjnUt1sqHfXiN3Z4pCosFKbcHfs/gRsxbG4t3teCTeLGfcqV9k4R0Tw4Q2kIcHdFGAD0OP5aYsAu+5Aoq7EzMcfCWH3xKGzNqnzJnRJbTSc7sbMovqeA3I53Bh9QQC8HATInyIk7hHpJlxEK+xGtakjjj0mamJAiVTCv+7VBHYKmHfePwcTT4JeHiSVd3zHtmgHXfDMS/M9jUF6c7BpdDAWw45lUJS1I6+I9av6fM3becTz2RBCiM5F+dtwR75Kcwp+XmtUQv4yxvmr1NlOr+sqF9D4+iHLetCbWgtNRxtZ3GaqtPNniaWAzYmkJY/+AFmviL63OXP0myzaJ6HwSp1sT6FttNUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(1800799003)(186006)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(83380400001)(7416002)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(31696002)(6506007)(53546011)(54906003)(38100700002)(6486002)(66556008)(66476007)(66946007)(6666004)(478600001)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkMybGRxSHA5UmhodGFSWk9Tc1Zrb0VsdjdtTFdZTG4zeVIvY0tYN205eFE2?=
 =?utf-8?B?enNmcmVkZFB3ZWVmS04ycjczMTgrbWNxa0M2Q0xDMmJMQ29xQjRpL2tmSWs3?=
 =?utf-8?B?Z0VkOE9EL21laUg3SUxkVEdiN2Vad0hkSTdQTVBBMDRLZzU1cjI0cWhrdUgy?=
 =?utf-8?B?WVhGeURVSlF3eklYREM3UzdzeDlpQXg2RmhINnlpSjhtSUUrc1dmNzQzdjNm?=
 =?utf-8?B?anZRcWZEdHFDMllqdEd5cHpWdVpmZlErakUvTUFZaGxqMTJBdEs0dHl0R1gz?=
 =?utf-8?B?cGZCNEFpL1l5U2NLMi81VHozTWF4UWZvYUFaYkcyc2tvMjF0L3R2Y2NiMlox?=
 =?utf-8?B?NUFFUGowMTVqcnNpQ0JjOC95RU11RTRUeDVoaEx1RlR2MitNVktnWUV1YUFp?=
 =?utf-8?B?ajRuNm1NUFNIUTNTN0ZHMTNBQTU5L1lqeHFZNW12SUlMaU1aekdTTmJGYlUv?=
 =?utf-8?B?dHJpSkU5YmZVbEIvMDBtWkNGOFBqUVBod1d3RTlTSWIrWXRQUzgrNmFEZEpH?=
 =?utf-8?B?QzlGLzRiK3Z2MGNuUVdINmVCUmhmdHZ6M24yczlvRDFSMGhPUHVRckZxbzJL?=
 =?utf-8?B?SXQ2WUM1Ry83c3ZLMmhuY0hSUUphUFJGY0o2bnZuL1FkNVE3YWZQamNTamda?=
 =?utf-8?B?YXlWUmYyMXBHRndEM0cvT2FMSjRsYmR1UkE1MWZDUlVYM3RhdUY3Q0ZCOEhW?=
 =?utf-8?B?YnJ4a21pQVZPUnN3d2ZnNG1QOUsyU1BQRFp3a2VVZ1lHZGY0eWEweVJDdHZl?=
 =?utf-8?B?MEJLMVVsbGppTHNUelBlZVdDYVEwN0ZMV2txN2J5aDZGczJlY0U1TGRQblY4?=
 =?utf-8?B?NE9UTXRPbmwrdk4xbXZBNG9HblJOQnQxeWZIS09Sb2xrRHMxTGlUWGNoZmd1?=
 =?utf-8?B?RFFiUE5jaVU5ODBwb3NodjlveUZ1cUZMWmZsQzQrcWRhR01OTU50OC80SHVp?=
 =?utf-8?B?ZmlUSm1zOXBYYUE0Um4yYm5zZmhDcC9xeHA2ZHdXWFl4N1lMMm9uM1Mrd0JM?=
 =?utf-8?B?U09kaWR3UURldmdrUDV4R1N5bncycjFET3JnY1B1dURlTmlLelA4Y240MmlY?=
 =?utf-8?B?OHJLbnduNVMzNGlmUmU3TzB5TlVZclhWMUtiaW1zRU54T1ZWZjVWc3R4SFMr?=
 =?utf-8?B?cndTV3lzTG5OSW9VWUc5d1MyVThyakxXVjk1S2hxWEhuRDltcytrbm1sb2lD?=
 =?utf-8?B?SFNjY3R0RmNFSXl6ZHJzYSswYVB0Z1ExZEpvZGdhRTY2Z2JVbkxMM2E3SlZi?=
 =?utf-8?B?SmM2ZHNDdGloZ08rWmptZVhIWGpZODNSa3I1dHJVWkhvKzhncTdWR0hEVUVY?=
 =?utf-8?B?TDJHRmpUQURORHdyajU1b2F2S3R2bkVvUDVvU3ZPeE8zNU9ydjNpNnh3d0Vu?=
 =?utf-8?B?THdZMDliWno0bktSazVZQjVIdENONjJ2TkZ2RkdzUnNJUVovczlQMVllNjgy?=
 =?utf-8?B?bXkzNCtVQjNLUmgzaTRCU1Z2SWVVeFEzanN0QmlnNmw2Tko1dmF2a010ZUVw?=
 =?utf-8?B?c0pWTjRkWWdBVVhJWkxvZHVxamlFYzhESjRBNGNIU2ZLWEZ1bHp2bEZ1ZGtN?=
 =?utf-8?B?d3lKbGY2MDJ4aHJBZnBDd1ZYVmR1VDJrSmhsRlV3aDFJQk1WMTZhWUhBeWZs?=
 =?utf-8?B?R241WDVHcXIxNmhnQmM0TUJwNFNCSTBqNlI0ajVpTGE1aW9kYmpQbXkyMUxx?=
 =?utf-8?B?RzZIV3ZrNmZLbVVSellMQi9jL3hqaGdSQ0FtTlZpakFKUFNUcVhZZzViWDQy?=
 =?utf-8?B?ck1VSHVuVzdOdFFlVlY4MGpGbkVDbG4rMnNxcjR3VmhabjJDRHN1WWkxYzc1?=
 =?utf-8?B?RnFoUmVrME0vWHVLNkxja1RmUURwY1IyUlNUSExKeW8rcGZ3QjZKY2JoYXJs?=
 =?utf-8?B?ZzRnaXFtWHFOdDFMbUcvK0dXc1J5MytibFNCTVBYVG5XNzJoOTdaWjE4UnBy?=
 =?utf-8?B?UVRYZW9hbjU1WnBORGlhRDNWR1JjVFN0ejVwUDVSNEtrZ29WVklJaTAxY0FW?=
 =?utf-8?B?SzFWWEU2SktoekZ6aVhydm4xZDBOV3JrYjdJYjlLbDZRRjJ5R1M2cWhLcU5t?=
 =?utf-8?B?eGVwSU44Q0xxc1ZKZTB3N3lZTTljWEFmSGs3UzBBU0h6S2JlakdLaFVvRHFn?=
 =?utf-8?Q?8CxGS1t/qgogzqIyjyLhrSHub?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cf8c56-4db5-48fe-ac57-08db9717aa2f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 07:26:49.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBIRWmvjIfHHzOrRT6+vVaZCH35TeM7rmS/9YRXHaMlta//sFkbUKcNUwXS29eeL+2eZb57++O3FlHo3MYW5IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

On 04.08.2023 16:09, Nicola Vetrini wrote:
>>> 3. One possible resolution pattern is including 'acglobal.h' twice
>>> (either directly or indirectly trough acpi.h, if
>>>     the latter does not cause other issues) like so:
>>>
>>>     (assuming DEFINE_ACPI_GLOBALS is undefined here)
>>>     #include "acglobal.h"
>>>     #define DEFINE_ACPI_GLOBALS
>>>     #include  "acglobal.h"
>>>
>>>    this way, the rule is followed properly, though it's not the 
>>> prettiest
>>> pattern and also clashes with the objectives
>>>    of D4.10 ("Precautions shall be taken in order to prevent the 
>>> contents
>>> of a header file being included
>>>    more than once"), but then a motivated exception is allowed there.
>>
>> Not really sure about this one.
> 
> If you can tell me more about why that header is defined the way it is 
> (i.e. why it's used twice with
> DEFINE_ACPI_GLOBALS #defined and the other times without), maybe we can 
> come up
> with better alternatives.

The "Why?" question can only be answered by the ACPICA folks who originally
made it like this. Linux inherited the file from there, and we inherited it
from Linux. See also Stefano's reply on the matter. My guess is that the
goal was to have just a single place that needs changing (besides consumer
sites, where changes may or may not be necessary) if the type of a variable
needs to be adjusted.

Jan


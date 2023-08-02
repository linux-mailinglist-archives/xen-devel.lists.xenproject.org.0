Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED9B76C621
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574725.900265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR60i-0002CG-3E; Wed, 02 Aug 2023 07:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574725.900265; Wed, 02 Aug 2023 07:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR60h-000299-Vs; Wed, 02 Aug 2023 07:11:07 +0000
Received: by outflank-mailman (input) for mailman id 574725;
 Wed, 02 Aug 2023 07:11:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR60g-000293-UU
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:11:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc4bb421-3103-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 09:11:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9930.eurprd04.prod.outlook.com (2603:10a6:800:1e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:10:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:10:57 +0000
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
X-Inumbo-ID: bc4bb421-3103-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVGlsekUpoVvHp2TRgbmwvf4pU+oAHHhAygHQCUzLUuqbpcvk4RO1cLsJ/2be7T6enreJCKVYV4bSb7cz1/yixkAre69u3B7D9JEvEW7fG6w4GlCGZUImD7wxlVFdy1w9wOqT8sN18yEbASFpoZNS69gSJw1zp/rgFHz15Axu4UP7QhE/0bcPfWs/HaRl2c0rerE0ueAR+3GwyWlC01sg5/JjeXxJE/dfFUkgXRswD52RznLIIZK3k1EmOYFefjRWmXcer4EAin4oD7PEZoooA20EW7uERBNZ3i4J6SSw9qqwC/44mxEHItTGTPSMJmv9kwo6dDUg43nJhsJNpGOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2gsbWAK1hWxBxzH9Ld1Tp9I8VrXn5DEEemrE12FGPw=;
 b=lfn/6jgUsv4u1FDAR2dpx4fG9oJ/eRbfS7GYaSxj/2roalM/vToND40NvTssX+4LcXTqsdocUk0bXNUpwdml/YZdkvN50p/TApI9uslN77T8wDbwnYDTNUSgZsxwscEiUppJxPapCJE4jbzH7lFAYjUmXsh1v3gzuEE7E5Pp1gYV1st7lEjqKt489sZj0jDHneWquJWHlK+szqKj/VJFsmuE6VCpElVr7h36Z3N+Oxo3iKrT2Rz1bn/u+0V4ge06EpXt//i7ba2uAo9y6kgHU86BEEv8ljVeioPItReEUNhykH8qx11uae0VRy6JY8AK5jVOTIqCOYYjzIQjpfVNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2gsbWAK1hWxBxzH9Ld1Tp9I8VrXn5DEEemrE12FGPw=;
 b=f1BWOJKBsTmQpX9MRGU3r7lVqBNOmuE8HhywE8i4ug39VwxjymYH48d9lfkPFiRamJPHVuzc/Kgvr+VkBVL/8nY0NJzGekJzQUgkDSi11Z6P354xbk6Sf5qQtx1/na0vrT89SB5CEuv5r93XtbFq2KgNSPCAkchSdoqxmjqLnzELSBUulP55pSp2Fdu651OVEIneN4OZIEhVFV5BUeC5cBf4EEojbP3NdA/r4CYnwqoQxi2K1ql4DnluVKazkavmtUKie6lEy2cq2Uw+My1ebEHPtMgzo1Li1QiYWitz9EYevwnuGjmoQOL+BNriZ4wQe9Ks33Ep4Xo4uzW9XMkOIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7cff2f6-3f22-aba1-5e7f-f9845a363e3b@suse.com>
Date: Wed, 2 Aug 2023 09:10:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 5/5] xen/ppc: Implement early serial console on PowerNV
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <3023ad320b42fa3787bb71a9cf83b34965668fe9.1690579561.git.sanastasio@raptorengineering.com>
 <41b33115-274c-7172-f100-85d6a4f1d538@suse.com>
 <f83af545-eb06-5f19-cb89-fc24ef6d9a2f@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f83af545-eb06-5f19-cb89-fc24ef6d9a2f@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c66a140-2288-43bb-668e-08db93279e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4bJg326GxCCyO8v9ySgBBDUR014keTm/XRKNN0DPs41o2kWXSKzKirmOEwbFcmWit9vq679IJpt8NCGtBXCpu0qQT3ywDFTBmGD65R/5+D6jxR869MO5KDtrzeRgPrOqvRCyU98KT4bnXwsfqcgghlJ5AD6eBHcFz9sPP0nc3eXmR65uGO3E7F4gfD0qgL+qBQufbCMegTDw/ghWhSN0JL9Hxe98pLERW4ZIfJ8E3k8DkMcXHWwG9iUfsAoS2MQ1WAo9t7wLMrn593LXLkTHeeGrWn8UOyw7jizdqRF/5K2iqu4YobTHIbVOSOKqRyjvujYPJkmM5PpG1uW9eol3ST2Rf93whDo2jGF4mmppyX6P+Uldc54IcR4ii0cJBhAARxKvQmlA4XHfLPf7u88Odewvsvq9ebPQg98un7dPSB2m/uCPJsblLVr9avl6abue33jyrAF9Vm5XnWPQ3v8UedVsITO4Fg+fyoJxlDe4E1lEVa54AU9W9r7Bx0zxbzbnFHMHmE21MB8nsuQvL5ZcFVzNa8MMWkHsZordAc9WYiVzXSf9rGkIwzkMcVpThoLb2w2BEQ3BgyF4uqBc3IaV5Mq2Z25F2xqAM271SXazDyKpoYveG9G5O6zr4gBZQjFntFiumPDQJKuwtDEWC4U9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39850400004)(136003)(396003)(346002)(451199021)(2616005)(36756003)(6512007)(316002)(86362001)(478600001)(54906003)(38100700002)(66946007)(66476007)(66556008)(6486002)(4326008)(6916009)(31696002)(53546011)(6506007)(41300700001)(26005)(186003)(8676002)(8936002)(5660300002)(4744005)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjdXS0xkWFR3V2RLak9USVB5c1VkaTk5c3p3QmEydjBqQnkxZVRvMmFOdlJ3?=
 =?utf-8?B?Vzlma2plTWFidUhPU1NFY3ZyKzV6a2lkNDBaUC9tOEg1UWlEM0U0cHBwbytC?=
 =?utf-8?B?TEY4MEpGNUZINmtFNWY2emFPbjNLMkZSSE1vSDhmYzJkU1J4UWo0U1ZaRkNX?=
 =?utf-8?B?Y1p1azkrNTRmQU1Ma3F0TWdodXRLckhaNEFVd2NPcmdBMTVnbGtYRDFzenA5?=
 =?utf-8?B?Tk5LemlYMXRDeStCRDdLSmZBek9wUHJFNENBemtLdUlMdmdqUkZWWnQybnBl?=
 =?utf-8?B?NFhBbkZkTVNXNWdIZ0J4aDRwVWhDSFcvRWhDM3VFUjllSldPdkFEUGEwc1Vl?=
 =?utf-8?B?TUhnaHBLNlVycDRiVTJxc1hGSWVyNG1HcXZVbnJDck5vR2JUc3RwWEExRGNn?=
 =?utf-8?B?azlDSEdoRG5Sc1FPbEYwRlJ1c0hYQ1hlU1JYREtmVmZ4RVVXdXpOM2wvdnF6?=
 =?utf-8?B?QlA2UWpkZVJMZlZUdjVWS2h4Nk0yeDZkdDBxeWRSSnQzWDI3eVhOaWtGMitl?=
 =?utf-8?B?Q3M1bXl1WGZ5UktjSGVCUjNjTnBSQmxkVmdXampTRExuYWhxSXlYS3hhMW82?=
 =?utf-8?B?bVRLMVlDQjhmQlp2Uk9PVThrWnNrTVR3b1dvQTByN2JtUlZ6RVRVWnN0ak5W?=
 =?utf-8?B?d2tUTG1xWWRLeFg1b29hbjVnbDc2QUU1ZkFQUkdjMzNzOGtQVk1CNGxjc2Va?=
 =?utf-8?B?dEQ4L0tPWFdDSmFoSHpKNTA3UVVaRTBXWGgxOUdSQ3ZlSVgwaGtHVGRWYU42?=
 =?utf-8?B?bFV4OFZvZkh0bU5sbVhackFXa1dLUDdERXc4OXk1YWZDcUI4OXpBYTZsckMr?=
 =?utf-8?B?ZWZjblJrREpLYjlrbGp6T1ZkMC9OZytSUXlJeUJ1RUtFU3loYnJnbFRPUUNw?=
 =?utf-8?B?aUo5QWxXY1NnM29qY0lpZnhOZEpvZHd3TU42Q1JPcEpMUTB3TityUTAxS3g3?=
 =?utf-8?B?WERQRjhJM3VWQzBML0RXUkg3QTRqOHo5azJwV1g2bGdDcGE3TEx0TmlkeHNZ?=
 =?utf-8?B?Q0M4NHpuWUtrb3hyVkl5TFFGaTFiV1hvWmVFUlJNVXpDc1k0WVlhMUtTWnB6?=
 =?utf-8?B?dHlWYUtFV1haT093ckFjOTREV2tXV0NjN1VKb2IxT2VuTXl6cWxOTkVLT3JE?=
 =?utf-8?B?d3NVUEVNWUdOcENPbXVSU09jUDBlR0dUZERsWFNXUUJ2cDFLTkxablVFRmZ5?=
 =?utf-8?B?ZlFnZ3RNUWRkTXJSWWw4Wm9NUHZDVU4vNThsM240SHo4NWIwa2ppTUpyQTkx?=
 =?utf-8?B?NUkwMDB4RnpIUUhYcjNkaFQ1b3BLZGZXK20xQnpYb2cvbURXOTYrc05JWDRR?=
 =?utf-8?B?amtBcmRkd2g5M3hKbUkvbDZYS1g5dE0xZ3Y1Y2xYVTEzc2Zwd1UyYjYyaTlr?=
 =?utf-8?B?bzVKaGpVa2gwU2preTI2Q01CdCt2M241TFdNMUF6RmFkY0V6RUtUTUdsdkRY?=
 =?utf-8?B?QlNCQ2RKUWNYQ3NqK2tOK2N1YXMyUGZhRUlGVkdYQWxKdkprdlN4OHpWVElR?=
 =?utf-8?B?L3BaaTJDRzlUSXNINW4xV3ZWZkNHaWJIbHZtNzNuemhuUFhFTUlPcTFMSWps?=
 =?utf-8?B?bjE2eUh5VEdTVHlWRXZXaVMzWHQxR0ZuTk8xM21xTDNKTEFsd0NVVkxWZTVW?=
 =?utf-8?B?dEZoZFJWckV1K3BmU3ZXVng2YXFUc1Y5Y08zZ3B6OEdFN3FCVXRVcURFc1FQ?=
 =?utf-8?B?aDQ2YU83ZnFtU04xTS9uSHozRVozOWNiUWl4WWF4NWVCMUhQMWxZUVU4aGpj?=
 =?utf-8?B?VGFJYk9sbVB1MnFIVWszWERpd2xrNEkwRkpHNzFnRTh3ckwwVlFLYitkSENH?=
 =?utf-8?B?eFdjeXc1dFcwMDExbnNnbDhSbGpHUUdPVTFDMVBLS3RLQWxJZlZVYThsbmZU?=
 =?utf-8?B?aDFtZVFDOVRvOXRxaW9ldC9TNC9xMlVpU0o4MTZ3RXJhWWxiRk5jRXVuSnN2?=
 =?utf-8?B?WERvNXFFRUR3MkQ2bGtOR2tCYWFnWHJzSmVuNFNxY3lWRVV2Q1JhdW12clBk?=
 =?utf-8?B?SmJFaGFLdVMwNmNPNXJRWWUvVjhLbFpGN3gxZHhoNk1YSWY5bUFhY28yU1Np?=
 =?utf-8?B?ekZNdEVLUncwL052cnpzSjhtdHovNk5XeUxZQXpUNjRydGMyODVEVzlIOWMr?=
 =?utf-8?Q?g2e/Yk2Ojt49ebKJBi0rFpk+7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c66a140-2288-43bb-668e-08db93279e84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:10:57.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhGKOX3mAt6ho5oJEITXtKnITQfGt1+k3BvBXjlqBwAfTDFcd0JOMEcbQgnXX67e8ziwFMmrKNL6DDes4zYZFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9930

On 02.08.2023 00:54, Shawn Anastasio wrote:
> On 8/1/23 6:19 AM, Jan Beulich wrote:
>> On 28.07.2023 23:35, Shawn Anastasio wrote:
>>> +static void opal_putchar(char c)
>>
>> Can't this be __init?
> 
> Unlike OpenFirmware, OPAL calls are expected to be used by the OS during
> its entire lifecycle, not just during early boot, so the full
> (non-early) serial console driver would likely want to use these
> functions as well.

Well, in the present usage it's unneeded post-init afaict. Hence if you
don't want to add __init until another use appears, please add a
respective remark in the description.

Jan


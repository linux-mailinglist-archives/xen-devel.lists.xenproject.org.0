Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7D717B31
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 11:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541676.844646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4HmJ-0002b2-P7; Wed, 31 May 2023 09:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541676.844646; Wed, 31 May 2023 09:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4HmJ-0002Ys-MF; Wed, 31 May 2023 09:05:59 +0000
Received: by outflank-mailman (input) for mailman id 541676;
 Wed, 31 May 2023 09:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4HmJ-0002Ym-31
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 09:05:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5adeae30-ff92-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 11:05:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7487.eurprd04.prod.outlook.com (2603:10a6:800:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 09:05:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 09:05:54 +0000
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
X-Inumbo-ID: 5adeae30-ff92-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj01/iCT5uuD/U57r0OY+natuJiAofVCf3MKx9xUTA5saa1xbgxvASfzLAWqVSjUQT8632/NV0rKmnaJ/7Dl9oxNC6ygv94xqoEa9tm8I2RZyqruusB87JWuZj3tLKUxngEsQaq7+ZK78ThJXZY0CHj7Q8+HOipUbXOZh5WmLLhTjkfezb+VQVAeQZkhe5ahdd2JIGiZj4kKvfpfgURgm5w6lEgg0zI470GhB24be3lvEIbdipjEJ8gic7RjckJi5EX96ot+NTYu61nkecB4XOsnc5N7HRBNUltCvN2xaMh1x/bReLSSnq58lCnJUyA4n1SQiLrk8zEqZm3zKXWjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEoluasBZv6hl4jzKFrVbuO0CfRLMLayK1d2uZWJ680=;
 b=BAPFNYnh1/5dLLtVpTkHqpwYCfkW3RCnqwJyvCudZBEuL4bEHRd6q23oj6AFUbeY6cAXtuxkIUuRtZUgMzdEjNgc6BjhDr2wQuUHJSl4d5R9XHBuLoWB6hm+blI/6Dr+7WiYC36UsMMfZYdo8AMxCbpGlbu8jwiWVTzEaQWSPZgog52PQnr1VZpTAiXA9nn1KpdtAgQYFyxfx4LsQQ5H4NGdAtXe+FyPN1VSJCZdXJnMFGhrGWbCLumfym57pWGXKqgxS0UqiN2cMf7h8Dm8iUUCq7doEwFa6FkJ/04sxHrAJw5ZnmvUCpzI/vtgoOIsL4NyWHXjmTgvzqFFQWe2dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEoluasBZv6hl4jzKFrVbuO0CfRLMLayK1d2uZWJ680=;
 b=eqzHJUPK1xZz2FnwQb22Oxz1NOS4pDvmi9Tui60IiJHlMk96sH+6u+JweGDOMsfajIGob5xT877tRPdEtSSR6wSyjOb2C2V/POTioLcWKFprnfQeIBaUWggKrHvv2hHj1Dk0vRV29AV8JyeKmj9zmtHsSI13Yg8PGOAwxexLssSareMPwgWYy7N87z6DwxTtTl1S4SmcN9XnjWqeBdWA0YigY58s6FvO/AxvR9pRFPAFWeB5M4xmEjNe6Py/E+9Y21vvnjf1tbsvV/IbKVj02RUdNRLzIx0zdQG8wHxunWDDaahZ96GIz27fzqxrAtb35kazVQPgdKHWEOiCnf0aig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
Date: Wed, 31 May 2023 11:05:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: xentrace buffer size, maxcpus and online cpus
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
 <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
 <20230530220613.4c4da5cc.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230530220613.4c4da5cc.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 690e67b9-d755-4aee-4395-08db61b63d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P4XmZziatOWOqnMdGJoy+D2JCP/L//gfoYv1UXBiaPy41nHFbZTSQA3UrXNbPIZ2K2SCd86rwFZ4NfzHPIVRjRvp6C6SwuIv5BqLW0SCo4fosGpJ2kWtUX+sKhI4RK2xnANAEMOIFLByWvhy/DF3ySo3dWNMzJl5ErYvSbRwZoV5bIVHltCMAaVuRB1i8aEUmHlraSMcT8mcj4qNf0tP44b7Ypcj/V83s34+x3JKAEkl6CcvNz4vY2+bDG/I5h/giMXtsbpvWJ4ZAFjeGuBo77kvCEL5nTwF8pnplTvgIAwECIkDrNDlMEKEl0M6OEuTzq39Kx7PqXafMdeZ+ZJ1CEMPv+Ft97niGrrMwmNUqKvYiDT2uW2QbVGqGP7xbyzgRPiE9nPliYvUGVOtS7M5tr0KE8k9WnanHZzmyPJAnBlZJxzMuhBl25u7sX6lvm74jXHNLRD45U4i9+ohcnOdREVPsNdNIzmcwrewtp0hp/8P8QKOGGxWqh2sY1ybI2ZMO44T8a6mnwtXuVYocMFsSjyFrg007vEoNAqzF9iFS2eeFNZH+7Wubz4o2oAP7+8jwJPPBMCF6XijMejOLidKrKNWsNeBAkXzBzfY1MIAFjev1DRrFtQkNYxPUyfKjSMK4qsaZror72tnJHYDpoxGsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(66556008)(66476007)(5660300002)(66946007)(316002)(6916009)(4326008)(31686004)(8676002)(8936002)(53546011)(478600001)(41300700001)(6486002)(6512007)(186003)(6506007)(26005)(2616005)(2906002)(83380400001)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHFZS2RiTkM0enFaTUZoeW92Z0krZGVJK05BNTJ0cENveE9BOUZ4UFpxc0pX?=
 =?utf-8?B?VTh4emZBTzFGUklnSDlrQkRBY25iS2FTL2pEdHAwVUNZdXBTUFZmSjF6UllG?=
 =?utf-8?B?VWxwVG5id0dqVDFmN0xZSVB2Z0VwajVRWGxtcllXZ1l4N2VpaVJERGlROWtq?=
 =?utf-8?B?dUxibDFGSTNvREdSQ3BJTi94TzJkbVZ2SXFCc1ZxdHpiY1VLcFpJcXorSmdT?=
 =?utf-8?B?Tk1NbkdVYi8yZ3QwNHZMNWJaWm9OckhIejNPRW03aDlQL1dNTHdwK04wZHhm?=
 =?utf-8?B?YzBmcDJnd3cvSFBja1EwOHZQeXdOVE5FTXZvR1NBUC9tdGZjWjlRV1IwQnZs?=
 =?utf-8?B?QUxhVzNWOEFWT3lVTE1acit3SXJDWWNKSTdEQWFRbC9oNWJ5YWRjRmdpckRH?=
 =?utf-8?B?a1ZKNzhHU05KNTBQU3JrVWMxQUszc0pndkhvcWdDWEdPamxQZkI1STZlcUZ1?=
 =?utf-8?B?NTdBQnBVVUQzL0hybjMxTEYrSWQzSm0rUVRYM2FIRSsyWlBKSVNPNzRnSzRI?=
 =?utf-8?B?YUhreEVvQnVZQUs0cUZCRkphM0dzMS9id0JYK1dLQVZOV2IxNWI2M3BvUmho?=
 =?utf-8?B?dVZpcURSbHNpZG00ZVhEamQvcEFVcWlFckV4OFdmdnE0T1k2UkFmTUxldHJ4?=
 =?utf-8?B?ZjJ3WkpWS2d1cUJLTmY1UFQrWHRaeFdzMlVrNE1tS1l6aEU5b3dwcTRRUkxI?=
 =?utf-8?B?MnFRemVYeHBsdUhqTkdMT3AyTlFzelpXVHo1OTM5MHZJMndRUndtaCt4NGd6?=
 =?utf-8?B?SS9FTWxMS2VsNVluLzBpU2g0eXd1b1lVRklJcERkQk9GTCtCUTNKZFBWdEZr?=
 =?utf-8?B?bU9BWE5pdllDd0VKcnVhSThWWnJpTEFCN3MvQmRLTDMzakdqN2hRbEk2ck1x?=
 =?utf-8?B?UWhMbHRvWjlEcy9KUWhHQ3VpVGhCOVQxcWZRWm9HQno0OVh2WkhyRlphSnNG?=
 =?utf-8?B?M3lKYUdHZFZrdGlPZTN6YzdGdVU5QlNhL0EzSksySXpUUWJHSWo4a25HRmFN?=
 =?utf-8?B?KzhML3M4Mk14N002NHBSbE9yNjl3cTVaaWFKTjR3ZnY2VzZFWjhpNnh6RFdl?=
 =?utf-8?B?Q3NYc05EeFkzSjZwekdFVFBncHRBQlFnc0hONENoUkltV2l3RmhrV3FOWFlC?=
 =?utf-8?B?R1Ntb1VtdjdJWFYvZmR2bXdNVnZTb3kzTWJoN05PVk4yb0JiTkR5UjdrcFFj?=
 =?utf-8?B?VHhkVHdGR094NzdLVXJ2TFU0SWVOSi90OVNMWUNQREp0WmlrSDZKNmIvRndR?=
 =?utf-8?B?Z25aUnkzT0JOY2FIOFI4cVpoM3ZkbnYycGsvN3M2aTdjckM2YllBMUszcFE4?=
 =?utf-8?B?ZjM3Ri91VmRVaTkvczdTbHhkWWpLK2pwa0dNMHVyTTB3eDJhWG8rK0dQODF6?=
 =?utf-8?B?S3FTdCtaMWlyWFRwNkU2SlhwZzd0Y2NhRTMxaUVtWTJVaFFxUmtDRmtIQWxr?=
 =?utf-8?B?RlZJdzhkMGtjUEdhWEhVS2ZNTEF4by96WWU5aGNCdklzZzRjd2FOOFUzbndq?=
 =?utf-8?B?QVdlSWpiazZkbDZKaFozU1d4L0c1U0k0VGNYdHoxcyt0MGd0M1ZjNmlDWnZQ?=
 =?utf-8?B?L00rZThTTnFyN3RrQ3Q1cE5uL1A5RU9LS2RJTG8rT2NEclVIYnRlcThib0ox?=
 =?utf-8?B?TUJUZVNKYnU2N2VUaUcxOU0rSVV2ZXRQRTkrcGxQN3lZOWhmTmMvUnFPTktn?=
 =?utf-8?B?dXprWk9KQ01kSCtFLzUzWnd1b05YZUdMbW9IQUJCUFNqbGFnTFo0bU0vbXMy?=
 =?utf-8?B?cEo0a25SVW9vRnRvbHN2eEczcEdHUS93REcwYjRaZzN6VUV4SDBiaFdPZmEr?=
 =?utf-8?B?R0EybWQ0ZXEwenBiZTBXQlc0ZS9rT053VFhwSFJVMkJSUEEyNzVPUDVDcFh4?=
 =?utf-8?B?TXRubTVMczhsUmZWWXEzSTVNd3Yra2sxTVJpOE9vWGk0OFc2K1llUEZaZzA2?=
 =?utf-8?B?YzhlRExRcXdSMElrMXpWK0J1TkN0VUhFcXAwWXpwT0tJc3NSdkNqUXJ5RUhx?=
 =?utf-8?B?bmlCQ1VoZFR6ZnpWSDNYUG12TE0ycHlHSUpaY1NvdU5hMGJnRzlPVkUwNlZk?=
 =?utf-8?B?UmFlN3k1aVZBb3NYdDRtNDFjQjFIODlRR09aOW9vZkR4SllsUlQrdE9LdHpy?=
 =?utf-8?Q?ZtjycmeBr58LEUpjO5GpnWED0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690e67b9-d755-4aee-4395-08db61b63d2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:05:54.2800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikz8UIUMqZZteWQYa1zGBdiz6RmqqmLWZyvzx1l7SoXEqxdZs97JgC7ch3XZdT1vySkXNPU2ZnSS2CJxPEjqlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7487

On 30.05.2023 22:06, Olaf Hering wrote:
> Tue, 30 May 2023 10:41:07 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> Using this N would be correct afaict, but that N isn't num_online_cpus().
>> CPUs may have been offlined by the time trace buffers are initialized, so
>> without looking too closely I think it would be num_present_cpus() that
>> you're after.
> 
> In my testing num_online_cpus returns N, while num_present_cpus returns
> all available pcpus. There is also num_possible_cpus, but this appears to
> be an ARM thing.
> 
> If Xen is booted with maxcpus=, is there a way to use the remaining cpus?

In general no, because then nr_cpu_ids will be too constrained. But
note that CPU parking also comes into play here, leading to nr_cpu_ids
being set to all possible (present + hotplug) CPUs. Iirc parked CPUs
can be brought online even beyond what "maxcpus=" says (albeit I think
that's more a side effect of the parking implementation than an
intended goal).

> In case this is possible, the code needs adjustment to reinitialize the
> trace buffers. This is not an easy change. But if the remaining cpus
> will remain offline, then something like this may work:
> 
> +++ b/xen/common/trace.c
> @@ -110,7 +110,8 @@ static int calculate_tbuf_size(unsigned int pages, uint16_t t_info_first_offset)
>      struct t_info dummy_pages;
>      typeof(dummy_pages.tbuf_size) max_pages;
>      typeof(dummy_pages.mfn_offset[0]) max_mfn_offset;
> -    unsigned int max_cpus = nr_cpu_ids;
> +    unsigned int nr_cpus = num_online_cpus();
> +    unsigned int max_cpus = nr_cpus;

As said before, num_online_cpus() will under-report for the purpose
here, as CPUs may have been brought offline, and may be brought online
again later (independent of the use of "maxcpus=").

Re-initializing trace buffers when more CPUs come online might of
course be an option, but it would need doing in a race free manner.

Jan


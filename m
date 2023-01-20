Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B06756F0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481822.746972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsGE-0008K3-7C; Fri, 20 Jan 2023 14:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481822.746972; Fri, 20 Jan 2023 14:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsGE-0008I5-42; Fri, 20 Jan 2023 14:20:54 +0000
Received: by outflank-mailman (input) for mailman id 481822;
 Fri, 20 Jan 2023 14:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1qDs=5R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIsGC-0008Hw-Ae
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:20:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a44c30a7-98cd-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 15:20:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7003.eurprd04.prod.outlook.com (2603:10a6:10:11d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 14:20:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 14:20:48 +0000
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
X-Inumbo-ID: a44c30a7-98cd-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEjlaD4uF90DKPJ1ARfbHMImcls3xImKYH+WwaGkTUntk5nOwUHJIW81MgUcSdOejycmIDUqGaOPG595/aJ73jJQFWI0rFucXraAYZJ6ad4nKqu4+cTub1BG5idfAI8XHpLiSScOBYtcXWvQEwWPZ9Nz8KsxFcQh08vwXP8e2lsyYmTkI97HIK07wC7U6wZsmkrpN1Y1tAn5dade9Riyc4ptJej7MuvziwOcChWeBanH82VVeopynZeJPLB1bnZIvOGdQ7ivZDSBz02fDpMsCC+TGRSGb3OA3Ui48MMe04aM7ScbVZs8HT0HA01X3oAQ/GyiyQusqmTxbPI4Q4bxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwi/j5S99Iw4xD1l+OYmtBJ8QuievgUbd5Ro7RNbQt4=;
 b=czpTwzOeGrBHNSK4RyEGtGNckugBA+nY9gbZz+E+8OoemdG1OJmff99D/M3vTOcf7PE5ITdfKnUKEpOAklqRerwZ2YESMDdpvCdC1ijzXntyEijuTrnUArekQA2gzk5I/wkbG9NrAXce9gPXoT0ZdlnXmiIGzA6X8KGtiYn9i8leg46UrStLbFHTyI+46JRCe0M/rROoLxEUJSfqHszc9SbIEtn3J0tot9nms0qHut+sUPqbgokwszmeY0zlCHJVUGk0/nPp2ZuHBBKFCYLTLfkBBGnm55HZdadZIUxz7t2ctOeGsbdsZi2SZ77Yl5YO4U6+OXZu1lBUsgkOLbvwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwi/j5S99Iw4xD1l+OYmtBJ8QuievgUbd5Ro7RNbQt4=;
 b=ym3MoAQE8kjf2KRsNZfnCbGXjnGCfM2oRA+1pzw1SvUMZ3uoZC4hPqdCoNBzuTLwgn5Rde1fCwpv9KoeLyG3ItzGCkLnGxIdX8dqhvw81v/roMAbBNYl0DYnkpYxdYhw+AlaKugOWKRU4GLIi6kVkRs58PW70XzoX/PT8zmPgEHGy7pQgdXwUxo5d0zhhJLAVwUsRAKKuADAlZuIEVZqhpg3EtE44lxv+WfZKFKIT7I65ENPQTxHdE5gaSIww36Iv40iJi37x55+Gef8Ku3FYZk3zRCAPm3PKAaenHVmMOqPU5DsYTYCbZpkb4RvA5cImo3i7m45uhO/ZkFE8TCbEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1740f228-8821-97e1-6524-6a2ccff6d3cd@suse.com>
Date: Fri, 20 Jan 2023 15:20:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230120114556.14003-1-andrew.cooper3@citrix.com>
 <f530ddfc-8f97-b913-e838-58cc352f6372@suse.com>
 <139c1d03-2cd8-a7c3-4f79-fbdd5e85c712@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <139c1d03-2cd8-a7c3-4f79-fbdd5e85c712@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a946a0-defd-4fc3-78cd-08dafaf186a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AWWLkfmZ2rGYFduk5paMyy1IaLzZBtRtGA0RnmQtLeQZWJeP8xV0zn//BCwm68PzQsqgsh4C2uk9aOStl3VmMzdK60opdyvWGsxyjCUmyfWog9OEypE4BCMuDUlxytZjy9ClvVl2NJYcpdR05qCPsuanDhnacZPJYa4PTSaz3KRu8XJbkfrOwhboMJt7+fCm3fnLIl/0cMWTM8bkCZlv1k3a8AKpxsM5G7IKGjJ4Eat+UgamfY5v6gQ193/ieiD/28wm+KjqWJKl8d0o924r1pY9jSIjJ2PDmk9JTERK3NTqr0g94GF/4ZU8zJamcVuFl1a0NuPKkn9KKqa8TpGtGauuBftuY6gOXujAgyC113j17oQ+qqU/tP5fuVeylraWX84XLLPfM/WA/3HCGkV6UfpCjhWB4ueCurNfR04KFahUx1SPtGXknpI6VRkIi2n1v0hvq/cwei+9NJMYAsxYZwVuPA9p0fZBZBB6nBT2u1/TNrM//2e+Lrxi1Isv1oRlWd89kVMNF6nS0UoxMqeTkw5LV7jzNaudtpGshIdCWffuNcazMqzppVF6XeXeKAtY0TQsPC7Wv1sgiorrwgj6KOPjRSUSJW7p0ZRwNeKh4P/ViCO1XxnSSnbjzHTWCsKT/RFTCLK2xH2Nahej4TEs+v+WExst9lQpIBQKlYjBFTYlTAMOeVuV4D6o8zwJ1OJNaMqImmg5PcnJX28QZ0FqNXw1cVbFjNgU04XfZmI5vOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199015)(31686004)(478600001)(38100700002)(41300700001)(36756003)(6486002)(31696002)(26005)(2906002)(54906003)(316002)(186003)(4326008)(66556008)(53546011)(6506007)(2616005)(8936002)(6916009)(86362001)(8676002)(5660300002)(6512007)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmNyNGY4WTBkT3VhWHMyVW1teW5rV2swTWpBckJ1ZkJuVUgzd1F6RmlDQmdu?=
 =?utf-8?B?aENlVFM5Q1NvUFd5cU1aWE16UUh3N2NPWFNOQUp6U2RLYzU4LzVNN3ZVeHI2?=
 =?utf-8?B?d1A3b0c2VVg4c05VVWJGdEtpQVhNbllQUHpQUnlxdVg3NjI5N1ZlQUZPeVZ3?=
 =?utf-8?B?ZDRxTGUybStmSDJCcGIzTTNsSTA4dDc3TTRSelpGUTQxZ1k2YS85YjFUK2ts?=
 =?utf-8?B?M2F4cWpmeVJGcU80Q2hUTHJWWk9CcG5kUkIxc1oxL0hjUWI3RjZtTE92L3Fs?=
 =?utf-8?B?aW8zY3ZHWkRjNDR0SXUvNjV5QkxMRUpjWEdXQXU0aWp2NzdiQmtVYXh6R0dz?=
 =?utf-8?B?aW9FQU9IaWFpMHdNT2dubGo3dkhvanp6L294aHVSNG1UTFFOQmZDS2xza05q?=
 =?utf-8?B?amQ5cWlqcFlweEJHMERvSnFXNzF0VTF6Z2JHQjRZOVZXdFR4a0hlQ1doQzl4?=
 =?utf-8?B?UThwUE8rYlJVSjBLYkVCc3h2VzNTY2haMk42RUZub2ZSWXAyYlFjN1BGbDFa?=
 =?utf-8?B?bFk1K0RseTVLcnl0RmtMZXZnM3VsOGY4UElIcG9xcm9pRTU2RUdPb3F0Tmp1?=
 =?utf-8?B?VHY3SjUvSGtVbkVkd0JVN20zMjlibFVJdVRrTm5wTHArU1h1RFoyMEhvYndx?=
 =?utf-8?B?bWdlYkFMVW1IMkg0S2VpcjlZQ0k5VmFKNUV6ZVNkZVZnMW50VUw1L0xLcEQz?=
 =?utf-8?B?WmNTVkVtODVaVDBFOG12TUFsanI5UGVzTG9TRTJHWGE1RCtpYnR3QVBOditq?=
 =?utf-8?B?bXBRUmowQ1hmT1FtYTVWdnVIMXJmVDFlbXlmYlFvVmJ0ZDNVZWZjWTdldmZD?=
 =?utf-8?B?WmZxcWhhM2FzRG1lNlpvekFlWGY2V0RDV244Zml4WW9qUlkzYndQcUZHMHor?=
 =?utf-8?B?NXU2c2lkZVFlTFZ3VXI0alF1ZEMwSlFSRHZ5cWZ4K0hUYWIrYmZkdENEam1V?=
 =?utf-8?B?b2cwZGxIbDZiZTRlUWhZU3Faa1BXaHI1S1QwdDJ3RC93T2cyVUdheVhUN0ZU?=
 =?utf-8?B?OXdyZkxuZVZvc0s4dFF2enNKN0RVcUhHa1k0N2dZMmZsRmlsWDg1Tlk1SUNX?=
 =?utf-8?B?cjhockpvdEp4NmFrTDBDNTJaNDBQRnQzK1IvcDlnaENqWWpqa3kxY2tyWWVl?=
 =?utf-8?B?K1M1bUlNaG5QUXQvMVI4RitvSUxaeFU4SExKZmJ6K0VEMHYzRlptMlp2bUda?=
 =?utf-8?B?THZMNnRLSXV1K2lNRjVoeUdpbTRFYklmc0RWalZrSk1JeElvRVVDbWJ5RnVS?=
 =?utf-8?B?ZmREUUFpWVFNcTQ3U2lXTFM5dDhuV0x5ZE1OZnMxb1J2bUxnS05aV3dvQWln?=
 =?utf-8?B?bTVIaVZ2MVJYRjAwTG5USHNFRXcxWUhMdEtrL3ZNczBhQXBLL3UyWjVZOUJt?=
 =?utf-8?B?WHpFWkFwVjNmVkJZWG9aR3N0cUwwQjdTS3hObENVUUVya2xLRnRkWkNIejdV?=
 =?utf-8?B?MGlERVJPdWw0czFtd0NEME1UZWhjajIyS2drZk1maUJDZFh0VnRwNFI1T1pa?=
 =?utf-8?B?OVBsVkRsV0QvcUpFcGxia0dLaHpYZ1p3b2M5SHhMSktFUnRWazhLalJxR1ZO?=
 =?utf-8?B?V09EdlkrV3ZFSHFvNEswRTZJRHR1b044SUFaTGpISTc1bUlBSEtXU2RaeE5o?=
 =?utf-8?B?ZHpBalo2MG9xUUo4RGhBa1d3d21nY3VNbUZjOGY3UjFKcXQ1cERhQWxHOVlW?=
 =?utf-8?B?RGtVL2xrVjdPL3lUWHZ5R1UyOG1jUmpuK0hoU09ZdzdFdEEzUUs3bmxGZ2ps?=
 =?utf-8?B?ZHpyYkxoVmovRk9VRk54NUFqYUZBb29SNGxBV004UTZFUGZMV1pCZlpCZkpF?=
 =?utf-8?B?MHBsaFJONkY2Zld6TlpDcVdZY282TnpiMzZmM2xsaTR4UFNvWldxc1hMMUtv?=
 =?utf-8?B?emdCQTJtb3dDSFpHZjVVYm9hRUUzSWlXQkJYNjFrRnZvdTJHSDBqL2xTbTdn?=
 =?utf-8?B?WmFJclRqTzBEckxPc0E4WElYdEZCS2lad2tKOU0zWC93KzhUT21kcmNST01v?=
 =?utf-8?B?YW04RFhub2lvM2U4T3AzdTRtYmJnKyt4TGRYOGVkQjhyWFF6OElYcmNyRmQx?=
 =?utf-8?B?Y2V6MnRQdExkckpXcXdGUVlkRGduRjAzekFiK3p3d3pSdVV2U0JjbG5ya2tL?=
 =?utf-8?Q?gHyoPc4FlEbawD7A8g/i0IUm4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a946a0-defd-4fc3-78cd-08dafaf186a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 14:20:48.1678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6gijH6ATfPwhv2bvysYEuOpwyPxO++fmfICopFcK9PD47CLFJrkJDC3BZaNIqGxKqOubQhbjoBY8N15oKfpMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7003

On 20.01.2023 15:10, Andrew Cooper wrote:
> On 20/01/2023 1:10 pm, Jan Beulich wrote:
>> On 20.01.2023 12:45, Andrew Cooper wrote:
>>> This is a global variable (actually 3, one per GUEST_PAGING_LEVEL), operated
>>> on using atomics only (with no regard to what else shares the same cacheline),
>>> which emits a diagnostic (in debug builds only) without changing any program
>>> behaviour.
>>>
>>> Based on read-only p2m types including logdirty, this diagnostic can be
>>> tripped by entirely legitimate guest behaviour.
>> Can it? At the very least shadow doesn't use p2m_ram_logdirty, but "cooks"
>> log-dirty handling its own way.
>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>> with the last sentence above corrected (if need be: removed).
> 
> I can remove it, but I feel as if there ought to be something there.
> 
> The other RO types are ram_ro, grant_map_ro and ram_shared.  shared has
> hopefully been unshared before getting to this point, while the other
> two have unclear semantics (as neither exist in real systems).

I'd be okay as long as the "including logdirty" part isn't there. If
we're unsure, perhaps then also instead of "can" either "might" or
"can possibly"?

Jan


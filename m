Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2551694D15
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 17:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494751.764898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRbtx-00065P-Rb; Mon, 13 Feb 2023 16:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494751.764898; Mon, 13 Feb 2023 16:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRbtx-00062r-NM; Mon, 13 Feb 2023 16:42:01 +0000
Received: by outflank-mailman (input) for mailman id 494751;
 Mon, 13 Feb 2023 16:42:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRbtw-00062l-2S
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 16:42:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5493bb23-abbd-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 17:41:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7877.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 16:41:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 16:41:55 +0000
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
X-Inumbo-ID: 5493bb23-abbd-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1dJHAOzdDSdDwBlltThB2B3CuQgeFhnyhSo/gIEplAbagl+7daGO2Joel0oLbyE+yBA/Wz4XqayPoSM0BYBqNPsjBL4OZwmpUbYix51xQ/ZbcGHb1Oqo1711GjT23nMgNt9BP+crH9HvQmTBAfsoVdyfKiNeh6BPjLV9Zw5s+/7I2MF8uLZUMNJbQ1ZDEQ2oAatCnAth8gVlQvXEMobQRkdTFI3FU67wUj7OEaLvZ0c0lazbvU+7OzJj7x5ioztiH7/1WmY1XifuMX/gtTSBzsmbwKdXXZhWAtSwez5X8nO8SFi/l0iFNaVQHk62NzmQlGeDjXVK9lCZM1X4PQeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBWyEHL40bzC/0RUqJYebF16HgtCTqfgQ9Apk+RopvM=;
 b=MFUN1yM7sQH6GdaYkiHErYZ7PiOBu3uwLTYrY5aQR7N62vF5HYENy+KOXL5JguzT19+JJL43dsHIfq+c8V7gIQxQAvSoOOuZdxB7A5lIP13zstJFrAbyqBYKBqM5XWMaPbIsZzDcbaaFumsSbJg3Jyu5jI620TB/2TmbEs1cJg9cYhhpneQAcZ+9xej6qV5zktwB9nLDQiSVTPzFal0C8B3b8y9xbIrhATFi80aSHMTE53aFUoAfovm0THavFsMwAtwV51yIdDvUzY1LMT6w4Ug/bVpS90YW2K9XbNR7y+9ZYF6SAkvoRLpzHNA2GtYci2SYL6lG9Zd67pDwzI2xaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBWyEHL40bzC/0RUqJYebF16HgtCTqfgQ9Apk+RopvM=;
 b=YarVqM1yqlDvJBib0mM03+vFkZTnmtRy9VTpLx79Vc9UZaCpNfHemead4L49Q82LRUOg/SPw8HcZ5GxJ4FmN/tfPezkrqcBd5WHbgx6oVEQ3dEp+oIyo1/zAqbQQnnK7JE15gYda6VGHurqVAceiVJIECwzG544K/ejEI11U/vZrWDZUMViocCI5+8ixONMQI+NtfRSRqsbhfcy+M3afn11kDGI/g+MY6NpPGGEqr3GmHwu4HIgG8//kWeQdqrERFhpS585jr0dHPU/oYxjd/YU+rhtlFMI/cso/Tuxxpmq0NPt5IJhTRelajB4BLwrAPl/wCHp4P5G66gjlNDKspw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cdfde6f-5af6-4044-f786-259c70e0ba69@suse.com>
Date: Mon, 13 Feb 2023 17:41:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 01/10] x86: introduce AMD-V and Intel VT-x Kconfig options
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-2-burzalodowa@gmail.com>
 <e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com>
 <5c3eb593-b63f-303f-dcd8-f5c319152635@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5c3eb593-b63f-303f-dcd8-f5c319152635@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: d030e537-9b2b-4570-cf63-08db0de13723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WOwj+MCoBgpLs4irR6pStE+L6CGKZTHqeiZgZhdhWRq0vn5iOw6QLGEVaaj87XpxuNnxUk5OltPxiPlfvRUD2a5O1qEVHCjxJcNNro9PGLW7unVkN0F/SCHYWJC6247Pv97QviS/5F/DVCCG+ksXT2C8K8E6+8d4qD4uJhF8DRIrst+t+lgIIfSCrQvtbL6vS9soYneLxfMUiiv/rNwtYt0Vl0mjDThqLJaV0vyGJ3lWSzw1rXy8tW3kPt+PLLCgIV9RMdpdMNj7KhRAkHwdPcntnTKxPdLvP/JF7k82HjISol1FaBJV5TOiUuUV3C4yZEgsi5mgKTi4nVnLI8t8aRfHVwZecUOqwWCWbApQrYU7WW7cXP4qOmLh5c1xGZtpUCS0M1/q9k5qeo6vQeox77CisV7aKlCt/w72QAfKi/1KV+LH6eE2EGzEUYqEvGLorHRh3IKkwKbfaDSGRcYRys93aVuy+lw5f4gegCvO3gSXPFTLyMVpBxLFx42qXbyDoWhnxliYMuw7VaK7N25EFpG528VQ9eyb/tgQmFwy6ujoUkqLIlkgeYl/m0JjusOyCth3cT2v/x+DErhaP0Q+T9ER1mi5C9NrGT9Zf+EZXuSyLmYFVuN5B2Ysx4eYawl7o5PNpplCxhYNYWKVjgokq+iDiFv6LboIkRf7nWrTbJRJ36iIA7t0zl9rKawCeF2PF5ySast1kCpB3wJL4yfNrVRMiIrjlcQIEZiBFNlO3f0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199018)(31686004)(2906002)(5660300002)(8936002)(4744005)(41300700001)(6916009)(4326008)(6486002)(36756003)(6666004)(186003)(66946007)(6512007)(53546011)(2616005)(6506007)(26005)(86362001)(31696002)(66556008)(478600001)(66476007)(8676002)(54906003)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXZOT2J3ME5GZGhSVlhOTG84L0FQZXpQMjlSdkVVYVI1d1MzTERleWhvT2p6?=
 =?utf-8?B?R28vS0w2QkowbS8zb2Q2bWtBWkRqdlNqdmt4NFRYMlI0SDlXRCtKK1FtcUtv?=
 =?utf-8?B?TS9JZVE4UU8raVlwVnBJdkVXcG5jU1lsMjhjc3BqODUrMmR2QTE0OHljUGpZ?=
 =?utf-8?B?THc4dmFWZ1NTNmx6TXhFQzYxRFdKZ2Q3QkpYR1lvNVUvYTQwUXlVRDZMZ3Zs?=
 =?utf-8?B?cU1oWnkrZ1ZkUll4RWlOc3FrSzhUNzJWUFh5dFJFd001Uk9NQnNQQzI0UWVF?=
 =?utf-8?B?elBwblFXaDd2cm9URDYvTXNlRDdEWU1LVVRKRUFzeWdaWjRNQThNMHg2Mk90?=
 =?utf-8?B?dDBQaWg3ejBOc0o1cktjT05xdjRkeENxMjhSV1RhR1VYWDdVQUNvYlI4MGV0?=
 =?utf-8?B?eW5xNk1uL3p0YWNJdVdpZSswR3JpRmZpQ0hreXQ5dncvU2RmVm1Ld1kzaG40?=
 =?utf-8?B?N2x0bDUwVlBwMnJKUXozVmx2OXFILzVLZU1ZOW9ic1ExUWUyZmUyMGU5WEFr?=
 =?utf-8?B?SmxOK0JGMXdXS05UNEZxbHkyZTk0QUFlcFo0VSt1RUd5eWZjdlJEVndoUjln?=
 =?utf-8?B?bzR6NDhlMWxxa3lEdTcrSlRnZXNhcUc1aWllMEd6dTZXVG9VQnN2ckFuZnFl?=
 =?utf-8?B?SGIreXVkWFpUVzZhOVJBakR5VmJjNWp0cXoyNHRhRGhLWS90Z3NzU2h5QVIw?=
 =?utf-8?B?dmp2Nk0vOUwwR25DVlZZNkFMdUlLVWpHK1hlaW0rZWdWQTNocGZOZFBOczhG?=
 =?utf-8?B?QnpGUy91cWk4TnBMTmVOQ1NLTFVaMGN3ZDZ6Y0l5YnRBbkNhK2VJZFdxQXhL?=
 =?utf-8?B?anhkejdXT0lYRjdQdlRGSDhkMnUzVXhqc0VoTDg3UlZLVG5INUdUZmpkeEhh?=
 =?utf-8?B?NmVnamlGQkpLQWk4TUFpTVBCbmFHbndBV3VLMkhHdkJ0UzJwN0FmbEJ3dHY4?=
 =?utf-8?B?RzlhTFRhYUpkc1Z4MXdqNUtiMmg3aVpzemx1QjNKeUc4ZkxVc2svalVkMUs2?=
 =?utf-8?B?bnlGTlVMQm5SamkxRUx0SG1xcWtXQmRrZnoyT01rUDVuck9GS2pLSXh3RDA5?=
 =?utf-8?B?eSs5MG41RUlscWI4YlZYQ0NDSXRtU0NzVzZtYVYraTJPY2JsQm96VjVJV1Nl?=
 =?utf-8?B?YW5uUGJTbGo5QnIrejlGUzRHMW5ubE1FcEN1bkxSQnFkaE9TU2JUUnBZZ0ZE?=
 =?utf-8?B?YWhwV0lNY1Rqa2Y2SVpEVkc2YmpKQXMvY08rRjIrMFVuZWRCMUJmdzYvT2tj?=
 =?utf-8?B?amZJbjNQbnFpRmp5cGFuR0ZheDc0S3psRUVoVW1ySy9tQmc2ck4xcCtQOFVF?=
 =?utf-8?B?WTVsS0FNdGNMZWkwMUhOa0hrQlVDNEl0MDkyWEs0VEZLaFlJMnhpTGZ2a3R4?=
 =?utf-8?B?K0NvNFFnK3dHYUVLM204bXJ6Y2NnUnJUaktTb20rbGlDeUx6bGc1cG9xckFr?=
 =?utf-8?B?Vm15WDRlbjVkWFFNU3QwZjQ3ckFQNld1U1N6WDBhd1NYY2UzK1dxMXhOa2dO?=
 =?utf-8?B?VE5uZ05sWTUvbkRLRXNQZTQ0N3NqekxnZ0UwUXBia3lwNWJEaHBJem00WWxO?=
 =?utf-8?B?ZHVWamhGaHhaTVFqNUE4eXBDUFp2MitaL3FqRFdLQ1VsZU1RcHBRM1g0S0xS?=
 =?utf-8?B?Zm9PbUU1UlpoNExWY0FOa2hsZkg3eDh6amd0OFVqdi94MWNsZHZrWk1DdVY4?=
 =?utf-8?B?MkRmWjNnZ0hSRjFkcXdpc3NvZUFIZEpTZkR2MjdoOVZtUUNWZy94aFVzYU83?=
 =?utf-8?B?bjBtOUdaL0VFVkgxcVZmRSt6V3FRSUFlRmkxRnlOOTg3TnYzdCtjb0o5Nzlw?=
 =?utf-8?B?dG5CS1BQa3J5TzhUWk5nVXR3MjFjYWo4VzNTbTlTQ0d1K1pHNkU2TWJhYTlD?=
 =?utf-8?B?NFN0QVJ1MmNRWkwva3Z0YnNOZFFUY0FUNU91eURieVpVMVdTTHp6eTh5N0pm?=
 =?utf-8?B?YTJmMmVSMmtGdWdCUElIUmdsYkdsOEVpd2pGWERBTVJiMnQwM3JORVpmME04?=
 =?utf-8?B?a3lHYlVDem5uN1NaOVlENGtKbG0xQjk0WXA1QXA3OGxaNzF1enozRllQaFpD?=
 =?utf-8?B?cUdXaGE1a1o3MHdjNkduYUZKczJyYzE1QXlHTjRmZThKNUd2a1ZNcmcrWnVw?=
 =?utf-8?Q?YbYpzlK4vVdFCRsWmi5sUx419?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d030e537-9b2b-4570-cf63-08db0de13723
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 16:41:55.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXwxT1k4uS/v5sNycgnCDn8pZoz/QzqLneWnq7xccKiBiukX6ehlEoKOQVkza0fJhAvr0L321wIYZEOm1shhQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7877

On 13.02.2023 17:30, Xenia Ragiadakou wrote:
> On 2/13/23 17:11, Jan Beulich wrote:
>> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/x86/cpu/Makefile
>>> +++ b/xen/arch/x86/cpu/Makefile
>>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>>   obj-y += intel_cacheinfo.o
>>>   obj-y += mwait-idle.o
>>>   obj-y += shanghai.o
>>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>>> +obj-y += vpmu.o
>>> +obj-$(CONFIG_AMD_SVM) += vpmu_amd.o
>>> +obj-$(CONFIG_INTEL_VMX) += vpmu_intel.o
>>
>> This code was moved from hvm/ to cpu/ for the specific reason of also
>> being used by PV guests. (Sadly the comments at the top weren't
>> corrected at that time.)
> 
> Hmm, the init functions are prefixed with svm/vmx.
> Does vpmu depend on svm/vmx support?

There are interactions, but I don't think there's a dependency. You
may want to ask Boris (whom I have now added to Cc).

Jan


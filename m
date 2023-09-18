Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2777A46EE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 12:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603888.941011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBVS-0002Xm-1b; Mon, 18 Sep 2023 10:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603888.941011; Mon, 18 Sep 2023 10:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBVR-0002Vd-VC; Mon, 18 Sep 2023 10:29:29 +0000
Received: by outflank-mailman (input) for mailman id 603888;
 Mon, 18 Sep 2023 10:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiBVP-0002VV-VK
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 10:29:27 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d70b6aa-560e-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 12:29:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 10:29:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 10:29:24 +0000
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
X-Inumbo-ID: 3d70b6aa-560e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AD2CKRgP6sfvUBxkQmJ7bB+ABpH4hJrLfi7b/Ln3S0HUEgIfXxQChDdtX9wgarul6jz92aVefyVKu4ur+XcBQLN4DAVLpAWQASTiGh0OQmgfv80yc5vGz9UR6rLfoiPtEJdcCkduQte5mNzahUYXUak7wKoK2LV2X76bzS0mCBG4uXowKK4VYOM3tcYREzJoutWEJu/RRXRPctReon5GEbHOKf14XZGYcTt3xgM9LQoV8SyTpxURMXayh0a8ZDSlbnlOFBx7NkGNgASpMqPDn2aFFq1zNZgIpNP0UyR5dTX2H/dSN9DR9Bj11t79Fe3I+Bm7LVcUgctcUVf9K4sn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJpM2wcyZFCkye6di8twy9KWEZsd85thUaHZaVge6mw=;
 b=nvjNyVYJhIhgRLFcfJQrD/1f1vQ7f+LBjvamAO8X03JOac3a5mIpyNaWeFm+JVW/U+0ksGPbrugvx2uki2PY4sa2WhmCvTtYVuBs8qteHVInlMyA5vzvmJVJOCHXJdYToXOjLMyHuM+PTZMfCd/CdUwKGcR5ZWm4qyLz5Lj8GskX/SsyQ9uulPO6YP2eyecfzWczAr2w7q5jkYNRkYLemuiW7J/fqsnKX6VBfeN8+vb9L7hUGWf/aQPCWEGtzbBA8JMlLXXeKjSc06A+PpwR6Fq6MObAeS0M6aacmokgFo0PukxXLLUFdJTWlFIEnZPba7FwFhkhfEHUUGOJIKYFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJpM2wcyZFCkye6di8twy9KWEZsd85thUaHZaVge6mw=;
 b=jpHZTc2o9xx1pi5KvqrZRYwHIwR2pqg8FKZJg93ZOxaco5lPrtt9MFdnJPGj5W1gYrbWolVky/Qt0rMpT9XorCYy7Fn0C9aBDYWHTg6KWqR8ylFyO0TG2GZctzMXceL7XdBY3nXxfSn+oM6sZo7mgxL6flrBFT7Zw+go8qh4o7Klrkgo036QTyqELcqrr69jS3a5fYx4tcJe7Nie3ipdecxfN50S7rHFPs6SNsT7EdfIqhd+gQaylOKVrNtse1xJ15WH8vtMrW3+9tTw26L+LTf6XMbFjSLCWHL8knFYmiygRyXMObl6rKzsqKKEnfFW8WSREmosp9JtshA9axo4nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e89b493a-4ec1-3703-f7d7-08b7a14a89b8@suse.com>
Date: Mon, 18 Sep 2023 12:29:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to
 skip timer check
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-2-julien@xen.org>
 <bb92bc36-db32-322b-569c-a176f08a95a0@suse.com>
 <7f896d46-e25a-40f0-bb74-9a471207aa94@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f896d46-e25a-40f0-bb74-9a471207aa94@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0f5b7e-76f1-4021-a7cd-08dbb83220b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NiQD2sbzG0XqBOCxpfPJQORjizjOubH+fkS+jLKz1cFjCUnjGWZFNySoOOkavWnpJn6kvRYPlzUzC+dZ7Ep5oT531K6xBcTEi/N36Md//6s9zsZSzD3Qo65RwzfpiBdEelb83e6B3ElmjaNP6xGPZe/dd7A3MZ0Ttv7YNIIb2cXTNVYeZ9hNJumQw2ZczujVDqH3fQ9u/lxzCSHI8gHySuC3NDrJjG1mbsiPxcPGquUCgW8jHbLGh9HD6PZN2miOwPlPIwKnTkj0JDW3qyakcqvmvcLOQVWM3mQThFqzZH5dfB4vATnwkUFN6NPtgXi7unMy58hPwMNpc8QpwB7U5eNr1Mj5x20wO5TJthAIF4kZROTt9QOmdOGka/zFyLIFiQCRuIUkQZcrS+DDIn8WvPrE+7mQ1eiRz3PVWkjGoZUz+mZtzqC5PUAOkUfi7kJ6EMrBBd1KGr6ec4CGxT/9Q6WeX6nlMVcDuCu9iaKaARxxkHLDJrWGIQdcMYlJ3fsZJU6srH2JjXhligigurWvGUA+Q/fpyKpE4DfYa0IBI/shAMbZmnW8SfYzbomYp0uKGoquyQHRRdnv+qKwrZv9JfIOphOU71nL6eRtztllC3aAG5zP8VV/a1dmESM01dTMKsIDRim4IuYCadtuAXcL/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(376002)(396003)(346002)(1800799009)(186009)(451199024)(31686004)(36756003)(38100700002)(31696002)(86362001)(6486002)(6506007)(53546011)(478600001)(54906003)(5660300002)(66556008)(66476007)(6666004)(2906002)(4326008)(8936002)(66946007)(8676002)(6512007)(41300700001)(6916009)(316002)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk5nbXFCTWdMeWh4Rnk5M1pvbFhSV2dqRlhDd2o4YTZyMU94cTNoMFM5WFM0?=
 =?utf-8?B?ZWhXOUsvQ0lrZjVqSmh3VllTWk5KSGJ0ZmFWRXhmWXNjWHFhSE1qWitoZlZR?=
 =?utf-8?B?ZnpERERST2t0OTZwQml4RktoRG9INUtvdnlhdlppVnhtZkRESnUzS0o1M2F4?=
 =?utf-8?B?RVB2S1JNaEwvNFF4bjhpcHdKLzhRNEUybWVxbUo4c1VGd2lud3YzZ0lKM05L?=
 =?utf-8?B?NmQwT0JYVSttMnhVaWh6S3pacmRhTWhXSEsvcUtRNkRhTUs2dnZ1QWdvVUtw?=
 =?utf-8?B?TmUvb0xKRGpxc3NkbmZDSW10UU1rdGtnL3ZRMDV6WDhZOStRSjBlN2R1L2E4?=
 =?utf-8?B?dk1xZkdaOVhZcTJucDVxWVNmWGlCOEtKdDcrcVNUdStjUlErNDZoS3FSemZZ?=
 =?utf-8?B?UHI2b1B0V2JWMXVIZFhndXo2djMzYW12UjlzcDhqNU56RmJuczh4SnNpcEZp?=
 =?utf-8?B?alRMa2hOMjJlbGRHTGJHNmZzK25ScndvUkcvMWgyNmtQK1pCTysvVzNwRnNm?=
 =?utf-8?B?MEFBMkVEZ2RReXR5ZTQrcVVXdmFqZW1XY0xqbE54d2dwc3BUTWF3cFFEckZt?=
 =?utf-8?B?bUY2c214MmdTUG9oU0YvcU5tUU1VQzJtamJSNk5QOXh0eXhsN1hlbEVjVXdu?=
 =?utf-8?B?OWREdXB2amh5TXI4SlFQbEx1QWNXZ2NnWE5IYjlDR2lseVVpKzRmSUVlOXk5?=
 =?utf-8?B?UWkwcVlSQ0UybTFGQ1VaUkMralVoZ3haU0NuZUVBUHpsNHdUVzgxeEN1cy9U?=
 =?utf-8?B?YmxtUlRjOFJPSUF2Q2VYMEFFSHBnZFVCZ2s3aTUwM2dwQm01dVRiUkdjWm9U?=
 =?utf-8?B?KzB3ZUdXSVllUTRZeDlqWStEVllHbjg2VzBZbXZQdTBjc2s5L1BqZDk3V0sy?=
 =?utf-8?B?dVFrSmYvZkpUY2FRY29ORW45V2xmTXJnS3Fhd0pSb3EyNFlMTFBWR1MvZ2lm?=
 =?utf-8?B?ZUZ3N09LQWNpeW1vTGt5SWRmVkxPVHV4NkpOZGdxczZiWnZJYWRxUzl5SW5r?=
 =?utf-8?B?dnFNVXpLVDdpZ2QrL09nUFM1WmxuOHc1UWtoanlnd1hFWDNpZVBPLytuVGJy?=
 =?utf-8?B?ZHRpeC9XamFibEY0c01WYitJVmc2YUtGaG9OL1JVRmVINC9xdEQ5ZWNzaTNn?=
 =?utf-8?B?TDlQQThsY2NWTkxWVDdORU9DWXkybEt5a2dQTTFnbXJDWlpUV0xOUERPUGVU?=
 =?utf-8?B?VnNoMFh3NEtQOGUySE1ORjRaRm9ZM2s2VFh3WDYyWE9lUEhSRmxPOVh3TjhX?=
 =?utf-8?B?eExEOEFJZk40UGRET2liNzR4cmJSWnFIQWZBUnZTb0FLNHkvV1RLbElmUFNh?=
 =?utf-8?B?TGg4eTNXOHVJa1JFN1Y3MmVUTEpGQlA4UFBHa2FVSStRZU1kWTcxdmdyVGlh?=
 =?utf-8?B?d1U2QWZXNThGN3dpM3Y1MUFHcVRaMzZsWXYxS01MSkZNVHRqYUlJbHlBKzM5?=
 =?utf-8?B?VUw2UG5Gc3NCZzlqNmJ2eUliTDJoZXo2OGdOUlU3eERVTlJubjJVOUtRcmta?=
 =?utf-8?B?Sm9aSWViKzVYNXVVZWhPWTlTYnl5d0ZJQURPUEVFNmdYT0RpVWpRbGxHUHdH?=
 =?utf-8?B?ZHRMZVpncHZBMGNwN01hQUxaQVZTQ2JCT3RnYmhyTzRFb1NxR0pGWjB2UUxC?=
 =?utf-8?B?QTR3MzE0TklXM3NtK2locU11ZEVwYlYwanFGdkxCT2pxR01qZ05sRFBMckJv?=
 =?utf-8?B?UlRETC9iWjV0S0Rrbm40aDBrV2NOTlY2dnIvd24xeEcvcERpUXZCeCtDc0pZ?=
 =?utf-8?B?MmRqa0hPYUR5ZUpFNGJqUFg0S0ZwSmFFVEMzWlV5M3NVMlRxSXBkclZEazBo?=
 =?utf-8?B?T3JXWXh1VjlJTW44d2NHSFBKTXg2VzFtRUNHeFBNdzE1S1NhL1QzUktsUFJy?=
 =?utf-8?B?VFlaeDkzeEU3U2FxUk0zbjMyOUNzRjk1SUNNSEJyZEJ4akNRL1R3QTZKcTBZ?=
 =?utf-8?B?bWg4N0w1MFFKNDlqQm13K05zMW82UDJFd1NhL2daWlVVVm1LR3ZZeGkyaS85?=
 =?utf-8?B?S2xrRXV4dEFwNjRhcjBaNUJUWm5WUGs0SHNrSWR4ODU2U08rYlNCSUhMV2JU?=
 =?utf-8?B?VFpnVDdBa3B6Y1FWYTludXJITXpkbW1DMlFZYVRZa2FWWlVBSExIU1QxaHBh?=
 =?utf-8?Q?HigBXUf3KFc0WnJKtRD58G1v5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0f5b7e-76f1-4021-a7cd-08dbb83220b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 10:29:24.1411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BaUkIK+TV56w/rHLMh/UO8p9fKfeOhSfxvv9UYLYSYSx0iWCyGDP0pqEH3nptTToeknWBzYQI8XiII4Y4ZBxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212

On 15.09.2023 15:18, Julien Grall wrote:
> On 07/09/2023 15:09, Jan Beulich wrote:
>> On 18.08.2023 15:44, Julien Grall wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1896,6 +1896,13 @@ This option is ignored in **pv-shim** mode.
>>>   ### nr_irqs (x86)
>>>   > `= <integer>`
>>>   
>>> +### no_timer_works (x86)
>>> +> `=<boolean>`
>>> +
>>> +> Default: `true`
>>> +
>>> +Disables the code which tests for broken timer IRQ sources.
>>
>> In description and code it's "check", but here it's "works". Likely
>> just a typo. But I'd prefer if we didn't introduce any new "no*"
>> options which then can be negated to "no-no*". Make it "timer-check"
>> (also avoiding the underscore, no matter that Linux uses it), or
>> alternatively make it a truly positive option, e.g. "timer-irq-works".
> 
> I don't mind too much about using - over _ but it is never clear why you 
> strongly push for it (and whether the others agrees).

Informal feedback suggested that various people agree and no-one strongly
disagrees to the argument of underscore really only being an auxiliary
separator character, when no better one can be used, and it also being
two keypresses to type on most keyboards, when dash is just one.

> Is this documented 
> somewhere? If not, can you do it so everyone can apply it consistently? 
> (At least I would not remember to ask for it because I am happy with the _).

As to documenting - it's not clear to me where such documentation ought
to go. In a way this is coding style, so it could be ./CODING_STYLE, but
then my experience with proposing changes there has been at best mixed.

Jan


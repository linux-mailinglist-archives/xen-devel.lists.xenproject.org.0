Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4437DF1B8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 12:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626871.977538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyWG3-0006pG-9M; Thu, 02 Nov 2023 11:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626871.977538; Thu, 02 Nov 2023 11:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyWG3-0006mg-6b; Thu, 02 Nov 2023 11:53:07 +0000
Received: by outflank-mailman (input) for mailman id 626871;
 Thu, 02 Nov 2023 11:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyWG2-0006ma-96
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 11:53:06 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe13::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 615fa0bf-7976-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 12:53:04 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8201.eurprd04.prod.outlook.com (2603:10a6:10:25e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Thu, 2 Nov
 2023 11:53:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 11:53:02 +0000
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
X-Inumbo-ID: 615fa0bf-7976-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP/188sceik53rsaWALkZY2Do82oI8pLkgB8LtE9OmcPlOwPf29cthBaP6/r2W85oY8Jm6IQUHNs/XKXLAuvJeFn4Diz57W/DbOm9o19wEhtNjxqio0pWZpXTKTyrFy20WLoCVJTNvTsHP5oeJ/Wccv/7YSRDAGvI6E6+pcAM+6LZ1E4FdXwHZ9uHs7uauKxg616TNoAfxVhnXgVWCJIbIwxFoAWDtCCxP1iNQuBEmnXJ5eLyT80JlHC18OaagSfIizzJRRlyr5sFNWcZZn2v6VWJczUlVhsEmSSu/0c2dewO+V6qomOGgb/LdR4YL3zS9Dy6ls8lMQm5Q5NR83Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1KA8qJIqLWTqZ00YDqq6kXEDEkylLPDVPyw/Qtdjws=;
 b=cETl6tWlXo9Kab9eWzw3JpZYqIclkTrmO6HTtBMU5/paXqlcHx6kWW0EgTYdvM1sMoHx4ZMflpnyr6RSbchKZBR1dAYfoY0SdFDmPi8kIgs4yfbopVFdAH4IC4PEb4517zTkExevva3pUp80Eb2VfQBPUXP47dny37hISTVXCMkge7maMGbq68D0DeE5EeYLGjIMwRcIw4yEDdJb/aohe1iT597UcjgjO2bmqBRysYNzzcy/hcM956kNh9z03lIgNAphDCxqyPFBwHzLIasFCvrho4fnnK97h/RuRvE62QRSyJXhy+rJxlbVpfegZXP+xoglqPLUpgkGEF2XCtDN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1KA8qJIqLWTqZ00YDqq6kXEDEkylLPDVPyw/Qtdjws=;
 b=hH1JC+9s4r/q1LE3Amw/XK8BqaRgzFDs89GUMO+Vb8wQM95OlaJ0kI7KFkiZkKqs0Gxphn4A27kzhVjtFNgZ89VgH43HibNGaE67Z5+6VIdsppS3zTxQHhZHywGviNBggI5Jz42v97z0d5KINwyEJtznLXmGWtpNf6v8BQ/HdjwvMqK94aVvb0IDMVZAWEi5U6hYes6ysirUnZhPe7B+PqTfZqSAFg0VUHS+DXQSpJkVndweaf5J42kTDsDWbUGFOftHzSxRezm9QrKbMG7meoCrQmso4f4VItOthy2cQ/f3rRIookxRH/t8E2qhXhBIo2lSOQ+kHohszYwJUanbzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <504743a2-ae84-5ebc-a753-bdd15c3a7b43@suse.com>
Date: Thu, 2 Nov 2023 12:53:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v2 7/8] xen: Add clang-format configuration
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
 <20231031132304.2573924-8-luca.fancellu@arm.com>
 <b0c05564-eadb-5135-b465-e15dec71aa22@suse.com>
 <1B8E95BC-1633-4452-BFC3-D7F5C417E7C0@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1B8E95BC-1633-4452-BFC3-D7F5C417E7C0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf98e2b-fd1e-4e1e-b180-08dbdb9a446f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+KJlEarvYOj+0Xo4USWG4j/jbgFV4atlUg7KF5wP8gZcN4ke5uhhmBgVzrO6uNOGAKElpmhb8nUgLH6JZ/+zLaCJzKd3vLuH/tafOPHpUQnWH906H2WjY/MN1+7Tlk7WGcpHNvMirRtNFxIcew8L0LR5w/PZlW43CkcS/WYbfA1neKCRDRCMDH7dld695bup2hV5IFLZ79/ZIuXnbRnjnDyOmUIEP6Ic/fgtXDbDqJ6rOVgh4mpL6T5agaOcvSPMtV045zdIv+JUPFTk8GutcgF9NDbapuUxz7T88vRDQdFqZTpWWTU7de1Zt1OTi/wiOUFMy8zxut5+6/qtEKGfyCIXK77sWmeI/o29vxiVKxZNpn5pTfijnyfaYG2wh0UcSE21Bs/DdkZqP9xiN78brLZTlOMpqjZBqR1pbWdOSikajcgHFezuA1dWXtsF7DJFMSFIM73/CXQpYKH3nnGZHz1HQpQVQERpo47cwAKiZZ8FpdgsmMOzchPkar7pxGbDJJPCgjyamq9tI6p1/JC+aoEbdpfQEuR8Uqs2w6QPpHpcfeoeJKWrgFfhPWl8DTts2zjWf8sX3jfhddmsqXlpM54fdlPVW7ItpmvjKkzJ47T7fG7iXOYgWROGgkH5KhvOupuY5TDJRubQMEnppBn1hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31686004)(2616005)(6512007)(26005)(38100700002)(31696002)(36756003)(86362001)(2906002)(83380400001)(478600001)(53546011)(6506007)(4326008)(66476007)(66556008)(8936002)(6486002)(316002)(6916009)(8676002)(54906003)(66946007)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZktDZ2hnVm1RaG5ZSUJOOWs4R21LOU1qYksyVWNwZTl3N3RkaVhJWU80S1M2?=
 =?utf-8?B?aUZrRXdqdWNacUM5N3J3TTN2VXFWTGR6UFdDMFd1eEFYSy81V0taSlp3UU8w?=
 =?utf-8?B?eG80a2RRSnpxRU1MN1prM2hUZ1M5b2cxUEQ2VU5RUUpHZjYxcEV4azNKRXpI?=
 =?utf-8?B?NGJYWGQ5dS9sbUhoUzJ2eGFXTUJrWGNJSVpmRjVsWGhoenFtNjVIUzcxOWU4?=
 =?utf-8?B?SlZvOUFsaEJGOTRQK2RORHRZN1Vmbkp6bnk1QmxPNlJKNmphQzdmSURCaEx5?=
 =?utf-8?B?amZFK05pOVRqQS95SGNMNXB5UlNnRVRGNHNDbkhGa2s1MmRVaDJkOERtVE9o?=
 =?utf-8?B?QXlIVVd5UlZncVdPUlR4V2dTZzdFRkJCU2M1c3UrSVE2eHZCWFVvOUdpNGZM?=
 =?utf-8?B?a0hvQis4UHlvWVBlUjFraXpYVk1YMHAwS3E2cHo5cTBIdk9RYXFHcTRqWENO?=
 =?utf-8?B?WXpkV01uL2U0cGVPZTNTUkY2Sk50UzVXV25tQjdXNXF2SXVpaTlpRXM3WitL?=
 =?utf-8?B?aEJnN1N2UEpPUjFGRnR3UElsVHMrYlpscFdlWDYrZGkxdEFJUmhqTjZFbGNM?=
 =?utf-8?B?UlJLemdCVURUd0prcXVDVGI0anRMRzJxYy9LcGlmUU55c3Z6VGNQc2h0bE5h?=
 =?utf-8?B?NU1JejZBOEE3VDNhTjR3NCtGK1VyNHB2VWF4TjYwVDFCRVhQSjI1SmZzSUR0?=
 =?utf-8?B?QXJINWtwOWtVVnl5VkZYV3U0cWtpd3d1SDVsbDlvRTl6dGpIajkyYXNhSDdN?=
 =?utf-8?B?U3FKSHB2YXNXWkQ2VThOUUg5SEFYZUJmR05yMlJlWTA3cUdqVjZlYW8zcGVV?=
 =?utf-8?B?YVF2ZTBVUFA0VVNHZmZWd1JSM1BiMlcvUi8xNENuSGVTVnFzTFEzMUFvQkVZ?=
 =?utf-8?B?bEFhN2hoaWcxUTFFZ2dSQkVGd24yYU9tdGFLLzhHUW8rQVJiNlNuVFFIbGtZ?=
 =?utf-8?B?VFVCSE5palFackhYYjlNQzBoSEJJdFNmYmhaK25SZkNFenduRWxuSmpIWS9E?=
 =?utf-8?B?UzdHQXpBTjJMV05UbTAxNVo4MG0rK0VleWJrdHJiTWJJajNmTFFTMkhIVmZT?=
 =?utf-8?B?R3R4eEUzM3lLVHF1VGhXbzFhdGFQWUNZbUNwS1ZkY2RyMHp1S3U5aFlHb0E1?=
 =?utf-8?B?eU1sdWwvWHZLazk1dHduL2tqSy91S1hpbXJEVGRvdlZFWVNXZFE1cDl4V3lR?=
 =?utf-8?B?TStkbDJRcCtnTlRYV2FUV0Q1TC9OK0dnVnNseTRxbWtpTDZnZU1VKzRTeVh3?=
 =?utf-8?B?KzBMbW9MMlY4YjMyMTdUUG5uWWRJdVBTTUhjYmZtN3FucmU2aUxDcnl4bzh6?=
 =?utf-8?B?Um1OVGVrWm1wbmdRejVYaCtjcmlzYkhDd294d3QyaTZwS0hodkp2elZJNmk2?=
 =?utf-8?B?THBEaHJrb1dHTmtWUGV4b2xHUGN1U0llNWZEbGc0c0dNenRrWjZGbk81WUY1?=
 =?utf-8?B?UEsvRTByZlZ1aTJJUkN4YkZWU21SV0FWWnA0VjE5OEFGSVg3RGs1M3IvVlFz?=
 =?utf-8?B?cWpGK2l2Z1AxZTVQblRvbUFiOWR0WjBSZHkyd01IUXNNS0FjMzhsTU1uN3N5?=
 =?utf-8?B?YXZxOTg2MHEvakNFTzdlc0xRVVByb3ExcTRTRjRrZk04MjNnUkEvOTFXY3I5?=
 =?utf-8?B?MUJZWnNtcmZ0RU15cjl5OUN0N2JBbDhrWkx6dCtYU0hjMHZYZFIwelQ5TWFE?=
 =?utf-8?B?S1FHUXlnVlBUU3UzWHVtOEgxNDlNcyttM0tWbFZNYnNhMG1jSkxYWXRVeFBo?=
 =?utf-8?B?MjBoMGE3ZVVyM3ZsdkFtUTZ4dEVHbkRsMHcrZjhyS1BITXhSaURtaTlwUUFy?=
 =?utf-8?B?RkYrZERaUm1Qb0ZONWtCTzZQZ0xxTGxTQVNyT0RjeWR3enNMcHN5ZVFSZXRD?=
 =?utf-8?B?SURheTVCVDhYVGJIaUxFUGF2ZXpaSnJlTzlic05aVGI0bk5hMjRZOXkrSjI0?=
 =?utf-8?B?L25LNU93TzZIcVN1eDFTVitwTXh1dUtpcVpldTV2ZGVMWnNCZEh0QjM2MFhu?=
 =?utf-8?B?b2lleUlvc0h0eTRUVFNLampMVi9ORU5BakxFdFBwczJLVWNtaWlLMmlXdit6?=
 =?utf-8?B?c3RHYzVOOE4weW5pQnplZmpSSS9mT2lMUzdOUTd0RWxCc3lRYXBQSGlQTFBH?=
 =?utf-8?Q?3wCkOPAt8wQNj8ba83bauna/t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf98e2b-fd1e-4e1e-b180-08dbdb9a446f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 11:53:02.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0l+cgSH7j9mtYMSxySKI4I1dF+WpodmOMhZvCdXOzfS1OULHdN6vxeEJFx4Dpt+wjiWM8kjk9a8RyU07jTZ+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8201

On 02.11.2023 12:41, Luca Fancellu wrote:
>> On 2 Nov 2023, at 09:10, Jan Beulich <jbeulich@suse.com> wrote:
>> On 31.10.2023 14:23, Luca Fancellu wrote:
>>> Add a clang format configuration for the Xen Hypervisor.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/.clang-format | 693 ++++++++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 693 insertions(+)
>>> create mode 100644 xen/.clang-format
>>
>> I think this needs splitting and every setting then individually correlating
>> with what we have in ./CODING_STYLE. That would entail extending ./CODING_STYLE
>> by anything not presently written down, but intended to be checked for.
> 
> Do you mean introducing one parameter for each patch with the corresponding entry in
> CODING_STYLE?
> 
> It would make sense, however there are 116 parameters, from those I think at least 56 needs
> to have a corresponding entry in CODING_STYLE (maybe in the end they will be less, but I don’t expect
> them to be less than 40), so given the amount of patches, I’m afraid to flood the mailing list.

Some grouping may certainly make sense, for related settings. What I'm
completely lost with the present submission is which of the settings
merely enforce existing content of ./CODING_STYLE, and which ones
(silently) impose new rules which everyone may agree with, but also may
not.

> I was thinking we could discuss them in chunks and update the serie during time, we could put in this
> patch also the update to the CODING_STYLE file. Something like the MISRA rule acceptance, what
> do you think? Shall we do the discussion by ML or by meetings? Every time I could bring up a number
> of parameters and update the serie when the discussion on them is finished.

Afaic - email if at all possible. The more that, considering past
attempts to extend ./CODING_STYLE, for some items it may be close to
impossible to reach agreement.

> This is my breakdown:
> 
> 116 total configurables
> 
> ================================================================================
> 13 straightforward

What exactly do you qualify as such?

> AttributeMacros:
>   -[...]
> 
> ColumnLimit: 80
> 
> IndentWidth: 4
> 
> Language: Cpp
> 
> MacroBlockBegin: '^PLATFORM_START|^DT_DEVICE_START|^ACPI_DEVICE_START'
> 
> MacroBlockEnd: '^PLATFORM_END|^DT_DEVICE_END|^ACPI_DEVICE_END'

Without explanation it is, for example, not clear to me what these two
settings are about. Which includes me not understanding why these
identifiers are (apparently) special in some specific way.

> Standard: C++03

I don't consider this "straightforward" at all. Only C99 could be deemed
straightforward here, imo.

> ================================================================================
> 10 don't really need a discussion
> 
> PenaltyBreakAssignment: 30
> 
> PenaltyBreakBeforeFirstCallParameter: 30
> 
> PenaltyBreakComment: 10
> 
> PenaltyBreakFirstLessLess: 0
> 
> PenaltyBreakOpenParenthesis: 100
> 
> PenaltyBreakString: 10
> 
> PenaltyExcessCharacter: 100
> 
> PenaltyIndentedWhitespace: 0
> 
> PenaltyReturnTypeOnItsOwnLine: 60
> 
> CommentPragmas: '^ IWYU pragma:'

Like with the "straightforward" ones above, without knowing what these
affect (or whether some simply don't affect us at all, and hence could
be set to any value) I can't follow the "don't really need a discussion"
qualification.

Jan


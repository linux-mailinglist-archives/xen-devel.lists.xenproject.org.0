Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFC5FD5BE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 09:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421717.667297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oisz8-0007Z0-6x; Thu, 13 Oct 2022 07:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421717.667297; Thu, 13 Oct 2022 07:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oisz8-0007W1-3P; Thu, 13 Oct 2022 07:50:30 +0000
Received: by outflank-mailman (input) for mailman id 421717;
 Thu, 13 Oct 2022 07:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oisz6-0007Vv-BA
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 07:50:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ee0c49-4acb-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 09:50:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9652.eurprd04.prod.outlook.com (2603:10a6:20b:4cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 07:50:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:50:19 +0000
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
X-Inumbo-ID: b2ee0c49-4acb-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWGbKS6FTBqsdMQntUDdzWCgCYsfurK8YQ7iYhHQTOdL3Pr/UCqO1s3dInYuQwrNsVVoXZO4jrxpzMw2hVhZgGugfYU7egSQiCaq+NPxptwRbTyaf4PJg5Z3cBQbo2APnM70k3apyxILQJ/dz6MEXnmw2PB1N/7ntOB0gy2nM6Ol/FOGCmfV2WryvIJyn/P8AOfmWDAKIRmAefSJLDK5EusG91MiIh13de3N4lVUnat8TKXR3FnvXYGkecHyRlgBByNrYDbGVcpJ4DaB2MQDTIb2+s78zdCfwJrKgj1ShYwGbWK4UxZ66z/kfibgj7dzzWQdQ0QzmS3Khf/+wH42/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCdhuOo8PfwjO9SwCbYCLwTfZq8gL2IBG0UP5nKIdTo=;
 b=jSsNjFd3+Zn/EbeTWB18odtwvtc6U/9FNwJW7q50EWYz9jSj8EfZs8bs9BpyNKx0AMyETjtZ5oSg5Lz/cIUDiOZsH+rSNQtHF3CfQ0Jmrayqx/IQGiE2m6tKisc1g+nRBfQVwzftUq/59SuWcMwjHkV0X2P0LY0Xog7IRHGnC6ecgFboJ5jrjKxiNkuIfJN9f9L+quTVe8aSRwR30PKfWav+adYY6aoCG/OFdsVgbhQFdPvEDDiEqphZp1vHulaYndCLcDrIvvdf2LPnC9HNxt1crUljjq8WG58WU9GRkx+QXvtxMKNZYUAakiVSmbaTQ1SEOGEAa2yuEu4D2Ta2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCdhuOo8PfwjO9SwCbYCLwTfZq8gL2IBG0UP5nKIdTo=;
 b=fOPhpl4axbzRv9GMzBLMeZQrc7WLDvUNI/SqkJ64bD8QStaL3gf0+tY5uOBwN0a3tos8FukSuee97Ie8HdmzZKY34Yi1x+pRRopfO/8ezCIifm/OcAu3781zQF4qxqGXvXYeH0u5U1gMFX4ObxLY7+n9TlINoB6U4Z1v8frRiLzU3lh4berhYawLQleE2CMiSO5DrYLCY/itmyRoeB/bv2HMEvnK2CVLZhDAo0ArSgKCo1a3jZpHdPniKbWBi0GtJowyartz+3y7htHf4zEuSLhN5FbP+/DVDbnHEu8UVyV1IQsywiXOMaEXEbqPRNaaIdFnU8lKRR2XoqDxxIIsYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
Date: Thu, 13 Oct 2022 09:50:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Proposal for deviations in static analyser findings
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc9dc43-4583-4e02-dc91-08daacef92e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kjkicChwoPgZC7Nffl3hUz+sVohzKmnAoNuklGiNBpM9h2F3BbwLmhrHL3h5dt4ZmG16Qz4AgBIj9E7FOil/3MJ1IedassYwbhzug6rleh0WDBSHX6tpjoFMEBqpO2Ak70fUkzDfjO/kRv/K1AXnsVtX1rtLjlJzvS6//jhq59UBf/sHGvW8gnRxC5krnH+Ne39/g2jjgS1iaBMTXd6vMlC/dENO/gMBK3fZCizfLDvlwXHYBwQ9r/bQTwdFoaGHbXlNJhMstlg9DGSluI7ibQqfXAb/8kd4TQqgwS9ehQ913iA0Zfv2naac//RRSm3sOYOSOPfPBh8MWJkCo4jzwCQKxxQkWhGF6OX4iWWr47Y15yj/0Nfu8jDsUlsOEiRv88gSQctEDxG8+XcFT1eYD28JpXiFQaV3HXFQgFIudgWyJHh6f5Z5OOAMsIFtx75IiPG5H6tXrSv00Xr9g5g7e2erRGoWQ7bJT4JExEu5eOmoaJq47AYOxhuf0es67kXuPs7rQn7N2O1SV50xL4M/LaP3Nn3SPzDkcgF4nZ/3bzRsmn4f+vPxc8IkhWobslaaJUMCPSgFD0/3lpHdRGprKm2EeYSaTVwlQ/OXLO4fttbu4H4s3F3ZjfqmNpfndJ8yT5NcvWwylRY9hPz3VgSGGd7OhNJ2MTGXTKClR7RRceChJE+XitIza5FnsrkhlcVaXQBPrngNuK72oOweH1g7Z6sA3h5vP27OAElU+9fb8h1wl2/tElTd4LPEgWOn+nEpeAjHt1SR4SeAwjT1dgSd2HlAZBeSCKKcuHCe8cWGeLk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199015)(31686004)(6506007)(36756003)(83380400001)(38100700002)(53546011)(6486002)(186003)(31696002)(478600001)(86362001)(6916009)(6512007)(54906003)(316002)(2906002)(5660300002)(2616005)(41300700001)(8936002)(8676002)(4326008)(26005)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnJTdTBYYjhJZ2JQUmNNQ1R3MkFTYkpmZVo4a0pWU2ljVnpkTG5xRjlFWTRF?=
 =?utf-8?B?QXJab1ViL0JwY3FzUXdwMy9SR0tmREtUU1o3a21PSi9wQzRLMHk4OUpBYVRR?=
 =?utf-8?B?RDIyRExyRmFadDJYYUV0L1lsWVdiQkhpS09HbFJabVRRVmx0TzlOck9wMkR5?=
 =?utf-8?B?aVA5MnFSRzdidWliTnJ2TXBrd1E5MXQ4bzdaaWFoYis5ckZvM1p5eC8xS1RL?=
 =?utf-8?B?elFoNmNGY1NueTBRZU1rbTFsbUxYQnd2Qi9wNDMyR0JibnFvQm8zMjAzM2F5?=
 =?utf-8?B?Tm5DV3NUVk9YeVc5dGRHaHljT2xVTzdEZEFGOEhGY1VJQkxQamJ6b1V4SGNh?=
 =?utf-8?B?azJrbVZNV3dqZXYySlhUT0R1amdtNVJ6NENGN0JpTUVndVM4UFpEdUxsTU9Q?=
 =?utf-8?B?UHV0N29yQnEwL0EweFhMVEJnRElMeDlOdGIrZjF5UHNBNGpSNEFDL1daTE1m?=
 =?utf-8?B?QlZlS004Uk5uRXZ5M3hxaEdNYmR6T2xCU29ZU2JBSGI0anFKWWF6YVlrWVFq?=
 =?utf-8?B?b1FLbE9RMWhyOTVEaXQ2SjBFUnlGcGFDVGRIUkc0Y1ZocmJralh5UmRjSWJp?=
 =?utf-8?B?Nm9LU3ZTRk9RWkd0VEV6ZU5pa0dzbWNGUlByMmloZTBFd2VGRGliM1lZckxS?=
 =?utf-8?B?QWlBMUhpWnNJRE9YQmpKSTZRTm5lK1d6QzJTcWFTMmFVNzNiTU9tWW5HVWZw?=
 =?utf-8?B?Si85bFd0MVlvWWdFTG5Nb0RRUVRxUllIdDlxWTR3WXZSS3Z3SE9wOFFVN3M1?=
 =?utf-8?B?OXdyQllZWFRlbkNBTTZkUzZVU05SR1Vma2MvcFVPL3VkdklKdkx3d056d2Vr?=
 =?utf-8?B?WVI4YWQyR1FvQlgzemJWRHZOVUJQUDE4N0VGQzhRbWRmajBabElKQVU4em92?=
 =?utf-8?B?WFNNSjVPQVkrZ0E5dTk2a0NXKy81a3hpTFppM0hZcFJHcFRnMFMwN0d4ckx5?=
 =?utf-8?B?d2xwTXZhcXVZWHhvT01KVzRJVWtuV2o0eW9sNDlyVWRNUHlQVFhqQmtWb2hZ?=
 =?utf-8?B?UjFSNmRtTFk3RXlyZVdXL2diWTBJQStmMmROaGVPL0FDNExKejJ0MGl2ZlBG?=
 =?utf-8?B?QzJqd1VESGdQVStJcnNMTUp5MXpPdE44cnRIWmdiWFVqY3duZVVGb0hQTGJ5?=
 =?utf-8?B?T3F1b2tjWm1IL2Q3WE1jdHBsOXYwWWNZaEplM2cxR09FQjBBaE1nbUVNM3kr?=
 =?utf-8?B?bFB3UG12RmtFaWk2RjRPdUtZRGlxeDhBT0duTU13eWM0L2hCcDAvTEYrdnJo?=
 =?utf-8?B?NE8xQXVZR2o4WEFTOVpoclVXaEpUS2J0ODFuZDVHTG9ZTlZGc1pFVzE2ekxQ?=
 =?utf-8?B?QkxwVGJuNVp3djNISUtNNDA5U0ZnY1VGc1VFU1hkL2kybytHTXFNOFE1U2x1?=
 =?utf-8?B?aHZtUEc4UFM3SGpVSjZ0bm5Cc1BZcERWSGsvZ1dQQ3lEeE00TDd0U1I2Vlc3?=
 =?utf-8?B?WHI2N1RDVkFTMEIwajdoTDVqcjBCSjdSS3htRzVEV0p4SFYvU0xhQnpjK21T?=
 =?utf-8?B?aXE4Y3QvUTZIUFBIeGVXMW9lemNETzZtRzVHVzFVdndwVVVEdW5qMzA1ZTAv?=
 =?utf-8?B?STRFK3lwQVlxS0ZoUE5DejVEdzVWdlVjenJSbDRKRG5lVzBJQ1dBWXZGK3NU?=
 =?utf-8?B?dlVaZHB1bXlzazB1ZkZGZURqMG44R043cy9Nd2c0bG5GQzZVT0tVeHlBZHFu?=
 =?utf-8?B?cFZwNGIvSFc2RDNJR0xNZ1ZyZVN3cExES29pQWVNWktXVE1UaHpjQzc1TWY5?=
 =?utf-8?B?VTNxRnFnbnlTR3pZaTBYU2tVUWxjRnRocjR6TTVUQlFGQVU5TVVyc3hoK3hZ?=
 =?utf-8?B?eDd1MVB0ZFg0aDAvVUlSUTYyK0M2V2tKTGtsM2FsQ2FMeG9RY01FN1luN0FB?=
 =?utf-8?B?STZxN2s5TnNYQnBGdjh3Q0h4S2VnUHpiZlRxNDNVVkwvWmtUS3F1ZEtsSEVr?=
 =?utf-8?B?R1NBV0hiOU5lTXlUMUM1eHRRL01WN1UxWkp1UFB6N1VnQ2tsOHlkUnhqc01B?=
 =?utf-8?B?cDFDYjJwTnMzMlBiRnhCTk1yRC9ZeHc0OWgrY0YrUllVTlpiM3VBN3VNNUJl?=
 =?utf-8?B?Smx0UWRva0dMTkV3UWlreWZjTk1NL3JnQ0Zub1ZscWFyZzVpZ1U5aEwvZGha?=
 =?utf-8?Q?COhibA/EYadgy+GX9tc3Plxki?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc9dc43-4583-4e02-dc91-08daacef92e5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:50:18.9607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwI4DPAak7dyDc+7pZy4HCSmUOb4wFp0QCEobHh7UjKGG19bCBXFN72pAPxk+2pwFZfYJXILDl4TNT74zob2AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9652

On 12.10.2022 18:00, Luca Fancellu wrote:
> Documenting violations
> ======================

I expect this is mean to become an in-tree document at some point?

> Static analysers are used on the Xen codebase for both static analysis and MISRA
> compliance.
> There might be the need to suppress some findings instead of fixing them and
> many tools permit the usage of in-code comments that suppress findings so that
> they are not shown in the final report.
> 
> Xen includes a tool capable of translating a specific comment used in its
> codebase to the right proprietary in-code comment understandable by the selected
> analyser that suppress its finding.

Is that tool in the tree already?

> In the Xen codebase, these tags will be used to document and suppress findings:
> 
> - SAF-X-safe: This tag means that the next line of code contains a finding, but
>   the non compliance to the checker is analysed and demonstrated to be safe.
> - SAF-X-false-positive: This tag means that the next line of code contains a
>   finding, but the finding is a bug of the tool.

We did discuss this: False positives are often specific to just one of the
tools used. I think this wants mentioning here, including the implications
(iirc the plan was to keep the tag generic but make the table entry express
which tool it is that is affected).

> SAF stands for Static Analyser Finding, the X is a placeholder for a positive
> number that starts from zero, the number after SAF- shall be incremental and
> unique.

Nit: "positive number" and "starts from zero" don't really fit together.
I guess you also want to spell out the radix to be used as well as whether
leading zeros are expected (and if so, to pad to how many digits total).

> Entries in the database should never be removed, even if they are not used
> anymore in the code (if a patch is removing or modifying the faulty line).
> This is to make sure that numbers are not reused which could lead to conflicts
> with old branches or misleading justifications.

Can we add provisions for shrinking such entries to e.g. just their "id"
line? Or is the intention to be able to re-use such an entry if a matching
instance appears again later?

> The files where to store all the justifications are in xen/docs/misra/ and are
> named as safe.json and false-positive.json, they have JSON format.

And both use independent ID numbering?

> Here is an example to add a new justification::
> 
> |{
> |    "version": "1.0",
> |    "content": [
> |        {
> |            "id":"SAF-0-safe",

Is the SAF- prefix really needed here? And with "safe" and "false positive"
being in separate files, is the respective suffix here needed either? I
think the file should be as clutter free as possible, considering that it'll
grow to quite significant size from all I can tell right now.

> |            "analyser": {
> |                "cppcheck": "misra-c2012-20.7",
> |                "coverity": "misra_c_2012_rule_20_7_violation",
> |                "eclair": "MC3R1.R20.7"
> |            },
> |            "name": “R20.7 C macro parameters not used as expression",

What is the second string here supposed to express? The explanation below
doesn't really clarify that, and the example here doesn't seem to fit the
R20.7 subject. Maybe it would have helped if ...

> |            "text": "The macro parameters used in this […]"

... you hadn't left this abridged.

Furthermore both this and ...

> |        },
> |        {
> |            "id":”SAF-1-safe",
> |            "analyser": {
> |                "cppcheck": "unreadVariable",
> |                "coverity": "UNUSED_VALUE"
> |            },
> |            "name": “Variable set but not used",
> |            "text": “It is safe because […]"

... this reminds me that there might be multiple items on the related
subsequent source line, only one of which is actually affected. In the
SAF-0-safe case for example only some of the "_var" uses inside the macro
are not (directly) expressions, whereas "_name" is unaffected.

Taking this example I also dare to ask: Shouldn't tools be aware that
token concatenation necessarily means no use of parentheses? See also
below.

Also two formatting remarks: In the example above you intermix ", ”, and “.
Are these fine to use at will? And can we aim at being consistent with the
use of padding blanks (you have them after some : but not after others)?

> |        },
> |        {
> |            "id":”SAF-2-safe",
> |            "analyser": {},
> |            "name": "Sentinel",
> |            "text": ""
> |        }
> |    ]
> |}
> 
> To document a finding, just add another block {[...]} before the sentinel block,
> using the id contained in the sentinel block and increment by one the number
> contained in the id of the sentinel block.
> 
> Here a brief explanation of the field inside an object of the "content" array:
> - id: it is a unique string that is used to refer to the finding, many finding
>   can be tagged with the same id, if the justification holds for any applied
>   case.
>   It tells the tool to substitute a Xen in-code comment having this structure:
>   /* SAF-0-safe [...] \*/
> - analyser: it is an object containing pair of key-value strings, the key is
>   the analyser, so it can be cppcheck, coverity or eclair. The value is the
>   proprietary id corresponding on the finding, for example when coverity is
>   used as analyser, the tool will translate the Xen in-code coment in this way:
>   /* SAF-0-safe [...] \*/ -> /* coverity[coverity-id] \*/

In here, where would coverity-id come from? And how does the transformation
here match up with the value of the "coverity": field in the table?

>   if the object doesn't have a key-value, then the corresponding in-code
>   comment won't be translated.

Iirc at least Coverity ignores certain instances of what it might consider
violations (fall-through in switch() statements in particular) in case
_any_ comment is present. Therefore may I suggest that such comments be
deleted (really: replaced by a blank line, to maintain correct line
numbering) if there's no matching key-value pair?

> - name: a simple name for the finding
> - text: a proper justification to turn off the finding.

The distinction between the last two doesn't really become clear. Taking
your “Variable set but not used" example above: Such a "name" will fit
many cases, yet the justification for each might be different. Hence
the question is how unique "name" should be and - if it doesn't need to
be unique - what information it is intended to convey.

> Here an example of the usage of the in-code comment tags:
> 
> /* SAF-0-safe [eventual developer message that shall not exceeds line char max count, don’t break the line!] */
> #define string_param(_name, _var) \
>     __setup_str __setup_str_##_var[] = _name; \
>     __kparam __setup_##_var = \
>         { .name = __setup_str_##_var, \
>           .type = OPT_STR, \
>           .len = sizeof(_var), \
>           .par.var = &_var }
> 
> In the example above, the tool finding for this macro is suppressed. When there are multiple findings for
> the same line, multiple in-code comments needs to be inserted, every one on a different line.

Since this is about parenthesization, would

#define string_param(_name, _var) \
    __setup_str (__setup_str_##_var)[] = _name; \
    __kparam (__setup_##_var) = \
        { .name = (__setup_str_##_var), \
          .type = OPT_STR, \
          .len = sizeof(_var), \
          .par.var = &(_var) }

satisfy the tools? And wouldn't we better not mask detection on this
construct anyway, since the last of the uses of "_var" indeed does
violate the rule (without parentheses added)?

As to the placement of the label: It was repeatedly said that analysis
occurs on pre-processed sources. Is placing a label ahead of a macro
definition therefore going to have any effect at all? Wouldn't the thing
rather need to look like this (assuming a pre-processing mode is used
which retains comments and respects line splits despite the use of line
continuations in the macro definition):

#define string_param(_name, _var) \
    /* SAF-0-safe ... */ \
    __setup_str __setup_str_##_var[] = _name; \
    /* SAF-0-safe ... */ \
    __kparam __setup_##_var = \
        /* SAF-0-safe ... */ \
        { .name = __setup_str_##_var, \
          .type = OPT_STR, \
          .len = sizeof(_var), \
          .par.var = &(_var) }

Finally: Except for its mere mentioning, I didn't spot any word towards
multiple uses (in the sources) of a single label. To avoid long
discussions about whether a new tag is needed vs an existing one to be
re-used, the rules for this need to be as clear and obvious as possible.

Jan


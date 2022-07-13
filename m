Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D99F573389
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 11:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366413.597176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZ48-0007eg-O5; Wed, 13 Jul 2022 09:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366413.597176; Wed, 13 Jul 2022 09:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZ48-0007c7-LE; Wed, 13 Jul 2022 09:53:56 +0000
Received: by outflank-mailman (input) for mailman id 366413;
 Wed, 13 Jul 2022 09:53:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBZ47-0007c1-4W
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 09:53:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b460ae5f-0291-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 11:53:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7460.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.27; Wed, 13 Jul
 2022 09:53:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 09:53:52 +0000
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
X-Inumbo-ID: b460ae5f-0291-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJII0yv0sDetlxthXsLaci3Fj9gmJTgPQnF5eeCF3nSLx+4Q6OfBljsoX5bmjLgt5iwMlsEnByZGv05adxezEa2GqiXbvA7rJE2jvFsxS7jgafhAKD6zvfyPbvI6zfc8JUq9ZQ3Ml7lJZ2NOWB+vbfhaM5Js8Wpd4AtQUGzX0JuQSTSYNUcgK86w7J91UjP4QrTfK02ukjYcifz/fEeyYGSadN9NOp740pxKlpsjgn/JWy/4GWi9JsxMW/Gp/9q7M/VQKhco7bpz8i5zEQeCXHe80rUNbzXcLTnEs2NICLBGyX9oWIwwwfGX9mEXbKWYrEGYF3T7wdxvMLwe15+fuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN0c0/+RBtS0QLG2v7icUhMBY9CevbS6Srs0SCzJnbY=;
 b=FOcwiHvvTMznyCD+ahM6OpvQNPkZtMYd4socpVrGH8QefdtgF5ikcRsxKed1n09VK7xecNcUJW8CmHeY3XwXtBY3KkFb44Ywc8eaMTtqgjVb1cB6TzjGje9y9IBP5PCU93NuShIFUsDjD3XiXdW7DYJXn8MMN/HPHy7/w5tPHPJiFbBc8vLTE6naP/vieO+sgkJI8JBPIpznmfdc9xwI8x8/AmAimTDejizKD9wXEtB4fW/4tVHbBEobA5TC/sFumqOd8M8oXhU3qkjtTiyRYyoritXwjpT7otLKfCvcK63kW1MtyQT7LrjRoI6QLefX6jV78Txcpmtou2sggt159w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN0c0/+RBtS0QLG2v7icUhMBY9CevbS6Srs0SCzJnbY=;
 b=RJryA0TkGckqb5TpNgcJoRRGsMxinevPvTY1OaKilaepA4GI5s9HpAh5CYYcZsQZgzI/dN06HAP2/HcMMWQPJcf/PCffUNV+mlfiMQvAanKxMwNvPEWl5NGDkFPOyPOf6IUT9bU7Wyyzb53OnL66eSa4FPA64kSIazrto96uE78i10Ljd60kxRxnhEzejQNrR3qCTReHoyNVd48nXekqruy6td7vH9VNmcg+XQSubnJ/EgJHqL8wP/Az91fMDMzL77tiYZDj0ThhxvIy/MHTLI30lD59c7B95VBzxmLckhjkSYx3cpsQcpXqP74ZckEo8s1+HINcKqgy6gp9Kx02Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
Date: Wed, 13 Jul 2022 11:53:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea2047b-7556-4e89-2ff0-08da64b5977d
X-MS-TrafficTypeDiagnostic: AM8PR04MB7460:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	POmlmVhD3YjB3pAEmjoysbuu/MEHEd+7hdQQObMiBYnyL5MrEkXZQzAocw2hKCdoFki3GxDGlmJhf99rnd7GdFjZrCcLdelz/4KkiMgtNoeKfO7p8PISOL/QfeVEEuB6XJbw+aCxf605LKxdDcuroIIg+M2vk0tk4dDqnkkTRIqcwNsIdADvTC/PoDt4en4rZmxHpX2WYp6zqI6CMFqV0WXZkruMEDEYPMtaDqlu4t3k3lmVENvuMGQnvnrlWEOpNUr2yDV8tI/NERbsbELF1cqnNmvbQRoRTORNAlC9urc1v8wMdjhIJ1ocDsvrhfvd7xjIXSKFu7o04fh+9OUGTIEd8cVhhZU9tZJHN/yDQe4FA7BBhFyhv3PkVG7jXnm0C+VaO4Pats2dQ3Dm68Ezdm4+S9wuVRV9IcUfF1eOYo0fTK6zmlW+tHM5lrfGrsPP14NgtpQihS7bAUHopDdisEqRUkpQZSjQogn3gLMy4oJnEaPl1peWGZkXLAKLqcOyFHlKx/DkvHwGI73B0uCwJ+w0ul7bLUZF42SCtJ4oYAc27LeyjYR/pfnzJvsp/WvPdKbGC2h6r9IaaTdQbdwLbPSPFkTwXLACTJkXxkjxTJQiTiUBDkmarB21WyhlG0Qw9Drh+lyHbNlMtE7Lk4Xfzc1PHjxHWIdpdd/mUY4eEZg9lKiF+CRep6owdheyxN6W3kkF7p3MkBv78BMBEnrTgLiCbVjhc5u9cJ3g3z73QMWamy2it+533BRuqOs4gLZ2wSdPAeV8gMGxwQmjyFerqsdTybBhY3mbPjFx2pAb8HdhzJjXWIZNI/yolvje61mgJbX3zV9CE11lXinHMMpMP9obp7rmBEl3i0PlzaCSRHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(376002)(136003)(6486002)(2616005)(186003)(31686004)(53546011)(41300700001)(26005)(6506007)(4326008)(478600001)(6512007)(66946007)(66476007)(8676002)(66556008)(83380400001)(6916009)(38100700002)(54906003)(316002)(31696002)(86362001)(2906002)(36756003)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWV1TFh1YWl5VXMrNDkvSXVGclE0Nit1K0J3WWx3aEU3bHdIbmtQait2a1VT?=
 =?utf-8?B?a1FLS3k4ZERlNTJBd1VuU0FEb25ERGJZTUltaXR1bzFZRGJubHBsOUVoSDBw?=
 =?utf-8?B?SmUzNU5abHVQZjRxRnBodUFhYmdQbWFtWUZuK1JsYnJuUUp1QVB3RjB0MzFD?=
 =?utf-8?B?aElFUk5CZ1hYd3pLQVFFcGhsN0IrNDl6T2lXM2VPVjJyMWo1YmpCQXJ1cDFO?=
 =?utf-8?B?N0RMRCthcGQ2dHBzN2NtRDhNTkVyN1I2UWRJejRFNmIrRWd2Uk1qTzQ5eU0w?=
 =?utf-8?B?UHJOWnJCS3VUeTFsNXhSNGVRQ0xIdTBha2NYYWsreFFRWitmcGZUcGZqNCtV?=
 =?utf-8?B?cldhNzQ4QVNNUlhEdTdBQ2xpMktGOE91cVZMZmhudDB0dTNQY285UHgwSnpG?=
 =?utf-8?B?bVBaeTFwV2QzV2d6RkVmbDRMWlFHcTBTMHFaZzAzbG9oK2dsWUVocUJkUXhZ?=
 =?utf-8?B?a1lNcGFHa2R3YTkwRU9vMVVXUEV0aFg5azRiRlNobFUvL2FOellKNkthOXht?=
 =?utf-8?B?WTV6cnZCSjBYTFpOUHBGT2p2eTVvZHY3VTAwd1lVd3ZlejE0S0U2aWRnUk9h?=
 =?utf-8?B?NitTQTNlWDNSSnpPTEZCaHppRW9abkpJQkVBblNEbkRFL0ZLRlRxZFRCMitv?=
 =?utf-8?B?eW5Td0poZzNOeXVvdlFGWFd0UVJFYVZzVmZaenlZTVNLQm8xa3NibjkzNVYr?=
 =?utf-8?B?c3lTR21WS044aDE3d1orbTVsZEtrQk5NWVFvVHVmTHNRSkp3ZWdVZzZZbUdQ?=
 =?utf-8?B?QmpreXBxU0F3L2Vwb0NZZlRTMWtKY2pmbTYvOHRnRktFck43OVpEbXM5dHFV?=
 =?utf-8?B?RnlnYjlTU3BsWXg5V09MYStDdmRGUEVhZDArSlpPMHROMHFwZEhhNmgxQVVt?=
 =?utf-8?B?YzExS2REd1B0OXVUZ2JRK0ZpTzJHdmsycWhIbFZFVkl2dWE0WlM2R2N3elVx?=
 =?utf-8?B?M3E4cllBOFNaeDJOVzErTTIwb2toVDZraThVZTJwNmpaQzhJc2ZDcVZ4TTM1?=
 =?utf-8?B?dk9UTStlVUhJU0FIVEVRM1llVjE0ZEpzODlRN0lDcExoL21DUjNLcS9kVjV1?=
 =?utf-8?B?THVEcDBkS0xjdmhxcjdLK1JkN1Ewa29LNG1oc1h6WWNmaUVJYWJZdnFmeGNL?=
 =?utf-8?B?amFvNnUyZ0VJOTd6Y1VkbTR6Zmg0YXBvc1duSDV4Z2ZLaDNHaU5FUVBDS3RG?=
 =?utf-8?B?RTQvMUp6Y3REMzJYWEExMThzMW1ydmRYU2lLYkFOL2h0S3E5Wkh4VERQak5J?=
 =?utf-8?B?WDdUVGNTMU5KcWNmMExCY2FxenN1bHFnQW1jRk9IZlU4RDVldU1jVjZ5TG0r?=
 =?utf-8?B?cUluL2dCaS9XY2VHaENhRWlDakpkazlWVzZFay9VZUJpKytQMTFHazhNQ2V5?=
 =?utf-8?B?cjBQM2RnTURidC9LSzBBaEd6QXBja05zMHp2NnBtYWlUcTJWYi9jdXdyTjZn?=
 =?utf-8?B?amRwVVh3amNTQTFjZ2R1bUZMbmJUbFo4cDR2SU5SazN3RUJJeUZuQkczUk55?=
 =?utf-8?B?OHZXM3lKRkduMWNLLy8wNUYzOW90bksrWW51cDlRS05ZL2gxWkVkVlpMR0gv?=
 =?utf-8?B?Y3IrTTkrR1NScDVEdWVNclRsNDgvUlpnbGoyYU1rNVplMDdSc2tHUzNUSkNp?=
 =?utf-8?B?V2dNQmJEYXh3dzJYTUFjaHhSNW9ucjIzZlVLNHhsbWcva0dYSnlWczFuTmMx?=
 =?utf-8?B?eUFwd05ZNGhaMlJWNVd0S3hldm5KQ2pVRTRGRzUzaGZ2MWxTTEtXVDZGVzJ5?=
 =?utf-8?B?Z2xmWlB6M1kzQk1MNm0weTh6akpScnAzRUE2TlZCY24xZEcrVTN0bjlGd2hF?=
 =?utf-8?B?NllOanhEaCtybENETzdibTg5TTZXTnp4ak1hRk5rQlJDVHdsem5ybzIyc0c5?=
 =?utf-8?B?MzRWWWxJNGlZSGJyNGlmeS85K3Zpd2lsNXJ6Zm5TN0N2RVNxT1lDSThQbnZ5?=
 =?utf-8?B?dHJSU25oZlFnWEdtUmlEWjNZUm85UVJJNlJsUGZZa3NxLzk5UmpLQWxSVmk5?=
 =?utf-8?B?OXJWYzRxWnJDcFFaRStJSVdFZlhEYkc5UGRWZzlVV2V1dWFCZG8yU21Ca2p3?=
 =?utf-8?B?RHAyUzExMDJtc3BjSENodzRCQk5MWVhGazhodFR6YnFuYUY1TW1ZYVc0Z2xr?=
 =?utf-8?Q?XZxaD5mmBIFnYPMOdpA/SzWPa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea2047b-7556-4e89-2ff0-08da64b5977d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:53:52.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLkN8+l3npsD778n3XQCyBhPbvhSMw8+3+tQG5pQiy0iFhK00g/4uSUraf8KXo3lfmLF7kxuzw7zRKs0VTyf3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7460

On 13.07.2022 11:35, Julien Grall wrote:
> Hi,
> 
> On 13/07/2022 07:21, Jan Beulich wrote:
>>>> For the FIFO issue, we can introduce the new config option to restrict the maximum number of static
>>>> port supported in Xen. We can check the user-defined static port when we parse the device tree and if
>>>> a user-defined static port is greater than the maximum allowed static port will return an error to the user.
>>>> In this way, we can avoid allocating a lot of memory to fill the hole.
>>>>
>>>> Let me know your view on this.
>>>>
>>>> config MAX_STATIC_PORT
>>>>       int "Maximum number of static ports”
>>>>       range 1 4095
>>>>       help
>>>>          Controls the build-time maximum number of static port supported
>>>
>>> The problem is not exclusive to the static event channel. So I don't
>>> think this is right to introduce MAX_STATIC_PORT to mitigate the issue
>>> (even though this is the only user today).
>>>
>>> A few of alternative solutions:
>>>     1) Handle preemption in alloc_evtchn_bucket()
>>>     2) Allocate all the buckets when the domain is created (the max
>>> numbers event channel is known). We may need to think about preemption
>>>     3) Tweak is_port_valid() to check if the bucket is valid. This would
>>> introduce a couple of extra memory access (might be OK as the bucket
>>> would be accessed afterwards) and we would need to update some users.
>>>
>>> At the moment, 3) is appealing me the most. I would be interested to
>>> have an opionions from the other maintainers.
>>
>> Fwiw of the named alternatives I would also prefer 3. Whether things
>> really need generalizing at this point I'm not sure, though.
> I am worry that we may end up to forget that we had non-generaic way 
> (e.g. MAX_STATIC_PORT) to prevent trigger the issue. So we could end up 
> to mistakenly introduce a security issue.
> 
> However, my point was less about generalization but more about 
> introducing CONFIG_MAX_STATIC_PORT.
> 
> It seems strange to let the admin to decide the maximum number of static 
> port supported.

Why (assuming s/admin/build admin/)? I view both a build time upper bound
as well as (alternatively) a command line driven upper bound as reasonable
(in the latter case there of course still would want/need to be an upper
bound on what is legitimate to specify from the command line). Using
static ports after all means there's a static largest port number.
Determined across all intended uses of a build such an upper bound can be
a feasible mechanism.

Jan


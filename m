Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C65FEDBB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 14:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422845.669155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJMu-0001LQ-4g; Fri, 14 Oct 2022 12:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422845.669155; Fri, 14 Oct 2022 12:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJMu-0001Ia-1e; Fri, 14 Oct 2022 12:00:48 +0000
Received: by outflank-mailman (input) for mailman id 422845;
 Fri, 14 Oct 2022 12:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojJMs-0001IU-8w
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 12:00:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60059.outbound.protection.outlook.com [40.107.6.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d552ea0c-4bb7-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 14:00:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 12:00:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 12:00:42 +0000
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
X-Inumbo-ID: d552ea0c-4bb7-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFXccE0uBKmhsjoa7gGON9nN7t8wT8tjyMPgTf7hI4+lwBOkFpJ6oeqXzXSAsR4dn56U/Z3x5CyrwjbCp+7xzOYQK/0+IEdh9Z68+KAkS6nSB3iilRU2xNHVAfC2RnGoeo5Bm3Hx3yN6rXwsMsziKFm/W6PpXRRSuGJk2xGCC5WL4ouBIFAKYPE843Y7GkHQAn3lSmJwIuZvjQSedPVk2aBuN4axGU+Diw3CK8XhM25njXZ7e5Clh3L3Ucg318bApX2gXnks26jlL134sqsbrMDw2lEJGlLzMOuOh4hwkvbA8IQfwiwCk0eXBbXR16J7RP4/mbQxu3RqNMxuWE7OCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBiTkr1oxxv/4yoo989+RzrA1PdxQINdACqpm1fb1kA=;
 b=gJZ5mhQZhGqpx3BLYYxy7e6KnRT89acTvSl1VbYHlP4hjs/he/0ezbDk6C4Exq3gbkG8wungToxJ0S/o8v2f5LfknDNcujc6OaxJEKHtD+7ipx/tHuIoA1e01HyL977KaeAKQYssQZwR1cLMQcyuLTjydKTnGXEsWrjjhoJnpAtFVwWL/hh9CnPCYem+kIN7c6Gf7Qpmd1JQER3fsZ2ljGaL0FAWfNgksY62119BQN183kRisyAKm4x8wHFtD492f+YsofUWY0RRpAHRr0TlkU0GLkhvuPp5zwn99hsVDuXEwlMu3ISPpi0EIKYGqeZqYtlQW15s6/r/nexBtW9myg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBiTkr1oxxv/4yoo989+RzrA1PdxQINdACqpm1fb1kA=;
 b=Jofm+8tct/6hlILHUUrgQrnWHBzrn6bOByAgvW8Gx4b4RJrxIk4vyUJZusiJjYYGbKCjiZGkGhP3zVgSRnSsJ3VQiVtAIRZozYM4d7YAtQTH85WGdFGZGTVzP+leHrAGM+nVq0BBAa4Vvl67ihgZ1Vq9Uzp679lnCrFjQG1BxV0Dz9xXa5LcSjfXgv80jvoP17nZuG6+nUFr4vtRIZNaqgcd0Cz5/w7mgPtIRfoSDnpeU4aJUAUSHDZKs+fDp/uPwWEfRAgSKrCCchPVvu5i3cciB9bNQV1Bb1AC1PAGaJvFXU1GP62Qdm5TpJIKVjfE12bpQ5vS7N06Ar24Tk6RMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9adb1562-236e-2856-5977-0c563b0af024@suse.com>
Date: Fri, 14 Oct 2022 14:00:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
 <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <db3e4568-edf4-c5c6-4f99-3444a38cc40a@suse.com>
 <AS8PR08MB79919FFC44E975825EE9CB3392249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e60803a6-44c5-9d22-88b5-c924ee854fca@suse.com>
 <AS8PR08MB7991A81D931E20A000FEFE0092249@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991A81D931E20A000FEFE0092249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0014.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb1c089-dc79-46db-a043-08daaddbb836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EKmeY/Rl+xrPR05MhpRz89ddbsyuT7OoWrMpAsyKsJWBOhrZJb8cr0nvNUfetkYS9g2/k+64VyUhKnceo9ftvQvt4GSJ/jrMJxPTsETI0gS3naW02m4T12vF6o+OOfOl32bUmZMF2asO8AbUdUZE8+qxZwyGlih587+OCESWtXJisteXzKR/uKkDIMPxy6bj13yApIx6t32583e4352qJoZ5tZkBT57wES5PYbAA+avn6iOWo2xM4SesSBuEZcx7ucwmqoVWtnJv8JGjnU8/1kdEyPpmQWhNtOqPMNx1iGwFQsSjZuvhoTTJdAHI53kw7JgiVf5YggJkW9JtCinItTTKq+RD8s2CTFhHb5fMU9mgsUTHfvygIBs8YfHCAn0+Bb3WKlolG0DV8e1HH/RkMelCpIzofbBEfjFtJGXz3whcxbs5x2QVztYzAJhpRr5vAMg6o/1TdRDWGep3w5b/2e6k76oyNAZtusYAhI+ahKTp7RpMpavsQJZjIsEhok38CqDjep/zhFKus2yBr2OP2nlW2k86BSUMY6Twpxd4DJ0muCUiq9O5/uJAEE/VKEqPpYNlwcwGng8O8CKMStR9x8wWTDMQGvgNr/fpgHDid4bzEBHARajBpoa0VbD+QgOQLO6MpZVdnTMIo4hmHQ7tt4qiSgzYcxJ8Ghbd/Gq5Xmzo08d/0d0HGEic7cThJqe44J/vP1sm56VtWFM7pHiTJdBbAN9ZVadHj21b4uHJ6wNsRrDkcSsrfGeI9uUgrIkMONdibLaoaBbSnJSFe0Ihm0/mlMKS9OCSLktP+WfQhRE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(2906002)(5660300002)(186003)(6506007)(6512007)(2616005)(8936002)(26005)(41300700001)(53546011)(38100700002)(86362001)(31696002)(83380400001)(36756003)(316002)(8676002)(478600001)(6916009)(54906003)(31686004)(6486002)(66476007)(66556008)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0YvVVdLQnVPc3BweE9zVThtSWVJbk9hVjA3aDArbmt1clk5MUF6d1NnNzZN?=
 =?utf-8?B?cnYrNUVpS3ZFV2JQbXNFenFNRVRrQ3J6dHRKSlYrcUdrOEhydGpWbWpjRTZ5?=
 =?utf-8?B?SmxuV0ZkMmZic2tkS0tTRzVjQmlUdGFiM2FEWTdUdlZXNDlBY29nOVdYbXJr?=
 =?utf-8?B?UTZhNEF2QTZLcTBFWE9CallZNGFIcEljeVRNZTJUM0prOTNOQnJ6SzFPTXVo?=
 =?utf-8?B?d2tDWmlLeHh1djZlUnRybVNEYWQzSm4yT0JkeExkOUZUOVoyNmRKNWRld0h1?=
 =?utf-8?B?aVVDZGk4RndRTGJzR1pNN1g4cEF3RmI4anhxQlJmS3R5ZE9jWUdEbWp5V1BN?=
 =?utf-8?B?VWR5WDBlNCswWmFiZXVRQWJiWlZRU3BBRzM2TDA0aGJRUm4wVUhJZUcwVEw5?=
 =?utf-8?B?eldsUHNpNWdJeDRybWIzSWRnZjVLVjRlWWxsNHVheng4MWlqSVFEUnYyWmVm?=
 =?utf-8?B?c3N6Y3dWZ2h6bWp4SWI4eWZ4WFRYaWRibHVZamJrYkdvNHE0VXBSUzhvSXJo?=
 =?utf-8?B?MldFRUVmcDA3emZPOTRKL1ZZNFFDM3BBZnltbnB2TXZSMWhOOGZSWFpnR0tL?=
 =?utf-8?B?TGlWaVc1RWhEaGhIbUhXczVGYVAzK05oSFRyUFBpTWx1SlFGbDFRUHU1SXli?=
 =?utf-8?B?SVR5bWwyTG1HS3BadTl3RjZ0ei9sdUNXMGMrWFlmS0ptQVlwbllZWnFZTysr?=
 =?utf-8?B?ZTZRWi9kNVhDMDZXcXAxRUFGV01EcitHK3UyZzN5d2xZNzBOZW5pb0dRUVJE?=
 =?utf-8?B?TmdFYy9RSHJlR1BQNEJ2OS96OGN4RTlaeVN0bWMwdFRMZEhyczNGUXBVVlhn?=
 =?utf-8?B?UkpkdndmdFN5M0pLU3ZWdmIwL3ErMm9BK1ZSR25UL0FlVzJJN2hRczMyZDBj?=
 =?utf-8?B?UHVZOEJwR0dXRGFXbko4NUVUd1IyMHVFV0h4NVU4V1BCWk1vSDNiaC9wYVBC?=
 =?utf-8?B?Mzlhelp3aXVVRWViY3h4U1hjZmpablF0UHdXYnZtdS80cldwdExiYW5BZjJO?=
 =?utf-8?B?cTlqSkhlVGRDNWNXK1A0MVN5YzBROFhPaU5JTlpCTzF2ZHhibS9RU3BxS3RL?=
 =?utf-8?B?ZE4ycGNWWGZVUnJKMGdlZmVpOXVWNU9XQTJvdlUwMzNLUHY1V0JhTzkrSkZi?=
 =?utf-8?B?c05NTkJoZ1dqUE9iRTJaWGpjODVtVTNxU3E2NExOZzNXVDcya1hwVjRzcGJ1?=
 =?utf-8?B?WitkVzliMXpKL2lQVldMWHZTT1hYMyt4d1pjS2R4Nk9RMkFlZU5jSFdJUDZ5?=
 =?utf-8?B?L2Jta1RPUEo5M09VQXNTQ3NmTzllMDlZeVcyYnBVdzVhcFVtdFpnUGVLNk52?=
 =?utf-8?B?dHU5TUNKNmRjTkU4SG9rQlVzNjVzYTVBa2QxUjIvTlVyT3QwdVduUmZ2Vm00?=
 =?utf-8?B?OXV4cHZYQzVxRnptTVFuN3lETUwwMEthUTZzK1dIb1NCNENMZERjTG1leDR6?=
 =?utf-8?B?TGV2MGNYMFQ3MklXSmtJTDErdjZ2K0Z2VVEzM3dNaC9uZFZCZkIwSE9OczQ5?=
 =?utf-8?B?MkRQczVTSnJORXlRRlQvaFJvMUs5TEZQYzRxemp5Q0k3QUNzbG8ybmRiWG5t?=
 =?utf-8?B?M3RoUjNqUXh0TDkxWjNUeHZnKzdOSFhQZWdTQTM5bXYwRGs3cjBxTnpua1NU?=
 =?utf-8?B?c0V1QUxLd2F2U2JNTkpWOUVnbGk0RWgzRG1DVFNRMDg4dkdBREF1WDYvVEU0?=
 =?utf-8?B?bEQ1V2VtMjNGMGpZUVI3akNlYXR0ZDFWQ0hEQlBpUG50ZllERUxBbmJmSHFV?=
 =?utf-8?B?aUk4TjZPM01YaWlBNHlJK1d6Sk1XT2RSbHNCd1VyWC9RSXR2Q05FVmpOanYw?=
 =?utf-8?B?aVhQTThNK0JhZXZxL2NHZWhzWk9qZzhaOE94UVRoOGZsN3FxWUxHYy9TeDNW?=
 =?utf-8?B?ckxNaGdOSWhBTUIzeU9vcFlCWEQycEE4WENLYzBUVHZOKzVZNzkxQWhYY3dI?=
 =?utf-8?B?QmNEUklLNDdTS0lvTWpKTjBlQ2VKcHJjamJFS2M5L3I1MDRyVW5GbUNCV2hU?=
 =?utf-8?B?aGVtdGlxd0VGU21XNEhsbFhkaElZTnlnMzQvOW1VU1hEWGpIRHk5bWN6WFR5?=
 =?utf-8?B?bU9ETHZseDJrMGFyb3ppbEw0YmIwbzdyT2FDaFpxeld0UFRMNmV4b0J0cTFo?=
 =?utf-8?Q?vAH5RseRuHwu+gcAMS+28XmFV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb1c089-dc79-46db-a043-08daaddbb836
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 12:00:42.8095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCKCAwhBeFclciHHjX4Rr96OvzmX/fjiaw5c+U7IhYm9U5TpP9jjh5AbRzs41XI384wwkCv5Bnj/fqbQ55jZBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

On 14.10.2022 13:04, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>>> My initial thought is the "else if" part in p2m_set_allocation. It might be
>>> wrong. Would the code below seems ok to you?
>>>
>>> int err;
>>>
>>> do {
>>>     err = p2m_teardown_allocation(d)
>>> } while ( err == -ERESTART )
>>
>> Sure, one of several ways of doing it.
> 
> Thanks for your confirmation. Just to play safe if you have more simple
> Solutions please do raise it. It is a good opportunity for me to learn and
> personally I am not a big fan of either do-while or the introduced "err"
> which is used only by p2m_teardown_allocation(d), considering the
> p2m_final_teardown(d) has a void return type...

Personally I would probably have written

    while ( p2m_teardown_allocation(d) == -ERESTART )
        /* Nothing - no preemption support here. */;

or

    while ( p2m_teardown_allocation(d) == -ERESTART )
        continue; /* No preemption support here. */

. Otoh with the "err" variable you could ASSERT(!err) after the loop.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC9646B00
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:50:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456910.714768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CbQ-00074O-3N; Thu, 08 Dec 2022 08:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456910.714768; Thu, 08 Dec 2022 08:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CbQ-00072S-0c; Thu, 08 Dec 2022 08:50:00 +0000
Received: by outflank-mailman (input) for mailman id 456910;
 Thu, 08 Dec 2022 08:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3CbO-00072M-Ng
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:49:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ad85a40-76d5-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 09:49:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 08:49:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:49:55 +0000
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
X-Inumbo-ID: 4ad85a40-76d5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz9TDjgVrpnLrZfC6agRAhpEck3Iygglg1VVJGwx//Va75qSTVaN6TCumiIE383UgiNr+ZoRGoD8S3yeIfIwBvTFKGyw2X5qToo4zFAwxvfDRdfAgU60S+y4z4eCw4Oc2KNS+a+8SDdr3kW2QVQLiUkEKsha0E38xeLuTFBwOrafCBkXFOQ6T1QX31GOvlZ6e/TGqo4BQdrt5LgOFLZ7zSy4gBxhtRhpkP02E0BlWT9CYLjjiEXlKXQ7ajb7q/O/6LSJYzCx8Bvnk5U24ATW8BVB6zWAiC6zvDQdCwbomtZ7kW4lFeEu3WPp54YDXSXppgAPuPLW9eLemAuACknRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2n3h9tZ7Dhg0TCjUZX6jaa2QJipmfkwJLbqALQ2Gw4=;
 b=UvdA/SRMevqdNzBWsZ2EjPFk0OVNbPw2zOmSZOe3aaHb/C3qufBoYzO5mx8o6NohAip37Ah5szd8rfTc5A1V/72RbHDleIk0W6F7ISaK+yn4YQTtEkBZiZHk12rXFf4HpQbCwto7xASI2UHNiYGgHCj1nobC8FLMU0jut0CFB/Z+2al73gXHg8xE9MxvuoEJi0QBbb1XKTxnewMOnNIi8ZyXzVQR6ISljQ3/2M2GC4hibLZOTkNSJEc0zaKFjrfWf1Op/NqILVyXhei+1s0/IisogVbuWdbx01QAsoLHFE+RBIaPtmC5tvlqEYW6CEp9tF3QPnLL6QFH7A1HluNiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2n3h9tZ7Dhg0TCjUZX6jaa2QJipmfkwJLbqALQ2Gw4=;
 b=K069oGnldzlfTsNJ4/HHhs5Hq1bOguCRoAMa/zeTbcEY/6cTE1ErRVReYNzbZq69lCn5puTTP3bTMMG4oSD4hwEdK/RBCeWEMqB5DyQp8qxiFLI8I0h3ytFXaGcFBDuoCsCyj3aunp5a5tPj87U4ZsmP3fETTmgR8dAtn/NxQ9sa1Dub4bC+faQFyq8/axRTuKzN0nhOGspsD3Lol+4Bh+vF/qHxUaEY26Y1XcIacXB4FjJSA9tiArI/aOUhVcP2BjUMd9l+lL9OzF65k+vX0nytcRP7A/UQf2HrLtw0Ju4ylml9JpyjmiyTfykbq1WMjp9kbag6x3eJjBczK7eQpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
Date: Thu, 8 Dec 2022 09:49:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>
Cc: Ard Biesheuval <ardb@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db06e5b-ec3f-4fc5-20e1-08dad8f92d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a1MT1zAHITlbOb1BeKrscxgUz02sWJbMhJLyknIoDUTm72kjCYeeoQl/5n9aqkojaZRwGDSSzttaK54kBJgo4u233NNBDemxQifqonEZ6PjOmX1LqqTMRXNZITaoXbhzVP4nhXK7lIPNvifu0kcVEYSGezIEYzCpoxiildfwkqeRjBFoIWLed9+RsuOhXJgggTUNWkPSVLLsi4g7o6FWXFJwvwBI6hjiLyYZs8esvr4oOX8WMjU7zgOLyh2TmY7e6SOYwlqN84b79DNc3GoNPnon+JkMOJ/UjXlAP4akw9Gz3KvMDp16E72B2tO9hWYMRIZJKFoHA4+k/Xrqu2Qor9kgLnkDs8UVskkwEb8Qw+yWcHJFiE18tTqVXwZYqJq9a1PCDfiiJZGz2aAQIt3R6H2ng8kxYD9oO8H3YHvfZ0nYZQNjdVIzftziLqUOJ2xLElsH9XU8978E9CB9OcbCa1SsZ2PdzcGFhku+wwiyJkbvjrRwPZxiEYkUJrc/XyqbaAjv6aVvtVZsdVBn2H7g0Ie3gHzmyS36VSqgtoz6U/9ztLuiS3C+5mKLWR9TYV4EfYZM5j+CVPnttffIGZsq7qO6GBYeIA+TJw+/Y5i1JipXM+X9CPy8U9U4Op2ILodQHIN81IdgD5TYEWrXK7PUz+yIC59WnygZQQYXmZjWwLAWynXHcxo4YmBNCLu9sfLh6G/M17pax2+QeLPQrPwUZDq9MDDxa9koKuYIq+o8uOWMOQGzvSLWF8AYk2VPTyF/aRw1aSE3aV6JdiUhyMAD2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199015)(31686004)(966005)(6506007)(86362001)(8936002)(26005)(53546011)(38100700002)(6486002)(6512007)(5660300002)(110136005)(54906003)(31696002)(478600001)(4744005)(66946007)(36756003)(2906002)(4326008)(83380400001)(41300700001)(186003)(316002)(8676002)(66476007)(2616005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFFjNUR3T1FxVW05R2k3b0wydC9OL0l0YzkzSkF1T2pvaEpVVU9OT2Z3Z1pQ?=
 =?utf-8?B?S0VVaU5EaW93Y0hLbDhiUUNoQU1PNGUzQUJoVVg4VkdnUXFOVnd1V3RXUWFX?=
 =?utf-8?B?dGNwaG82T3JvTkM2K052QlVGb1BUSlYvMEhxNkE0dVYrdWZFQVNRYm1lM0w4?=
 =?utf-8?B?ZXVHbndHbzJwb1pKWFI1K2FQU0JKQkxjQUwzdmMvS1ZxZ3BkaGREZE1rd0NR?=
 =?utf-8?B?UCt1QVMyWmFyMGprZmUwakZUQjdKQ1NlbEdTU2RZWENGSS9jblMvYmphSlMr?=
 =?utf-8?B?L1dkMTc1ZXU0UzlDZ2U5c1lVQy8rdWQ4ajlaazhnUlEzMWlpRlN5cTlYeDhy?=
 =?utf-8?B?OGVYR3FZVHJoUGk1cE1hWkhBN05hSkRaWnQwQkZkanNnc0s2dE5TRzBEbDA1?=
 =?utf-8?B?OVRXWEI1MnNZZXkrK2FTM3YzVTB0T0c2TEZwSEQ5UncwR0VzbGM1Yjl4SmJk?=
 =?utf-8?B?ekJjWWt2YnE5Z1RhVm93a1RPZURWZXM2c05xbzJHTmw0QUFYdGRqRG9OWmow?=
 =?utf-8?B?dmxyZzA2VklJcUszdFFDa3pTaE5jamRyc2NzSjVmajhFTTRMWmFvZXV6UmtI?=
 =?utf-8?B?NVE1VzB6aDVLVEhBQXVXaEV3K1BGdkdpN09HcGJIbGRGYlhSWFF0RnJSTVFU?=
 =?utf-8?B?cGE0czI4ZXB1Zzc1bU9SRjNaajhXNjRScU5hSzdYRTkyUkpMZDR6QUMwcnlo?=
 =?utf-8?B?cWcrWU1laFBxVVR4WG1mdks3UXR1bGxmVmZIMitTazNTajRtVUY0cTc3dExp?=
 =?utf-8?B?cEJ2bDBOaGtCa2xYb1VTYXpnL1NLRnpqanRWSTVpVjN3MDlUVGRTOUhsZTY0?=
 =?utf-8?B?REx0OUYrMFVTRU84d2FxVVhmMkw0aWJnc1FxcTNldk5jTHBTYXlVTUExYkVT?=
 =?utf-8?B?Tmd1OC8ySkxJRlk1WmdMcDl4Q0xDV0RSRDg4elFXRnlYQzRFa1dGc0VGN3g3?=
 =?utf-8?B?bmduR25UYjVWSlRNdVZoM3lNZEk0OWlTMHh0b3BLbENPSmprQVJKTDJTOVlT?=
 =?utf-8?B?aHJpUlhuVTdNTmVhOHduMDFqSlJrOTFDakNFMkRvZFF2TnR5ZWpJTWd5RVdM?=
 =?utf-8?B?ZU9INUdxNCtqT2hiUlViUWliVzZ3RXFReEM3TVpobmVtdE9Cd2dmcXg2dDli?=
 =?utf-8?B?UVNNbUFCKzhEWjZ1bzhoZkZuMytuNmpMdzhleHc1R25NSGh4OFN6SC9UMUc3?=
 =?utf-8?B?UlphM0xxTzR6d2kwMlZIKzNUR3VtVFFhTXN2elhjc3h2UXB1MnZ4RmE1dFNr?=
 =?utf-8?B?TVU4Mk51R3piaVRTbFpBWG02TkJ6ZTloWVZuODdQMmVsWitHc0dCdkxFS1F4?=
 =?utf-8?B?UjUxUW5ManZucDEvSDUza3JtWXlLdG9MdGZUcmpGMzdMT21jV1RSMldpamNp?=
 =?utf-8?B?WStwcG9QSTVERjZOeHhxSldsNVpVWVhZaEFudjJRRHY1T21seUFmMVlFQ0FT?=
 =?utf-8?B?RVN3Smp0NVJJdFZIb3hJcWEwNjJsZ1llT3VaRGVSTU5tNStjemltVjlPbEd6?=
 =?utf-8?B?L1FmdmlqL1B3M2dIZzZaanBpcmtBRWdDTDNwUzVDb3pqS3Q3N2hWZzFPS0Zq?=
 =?utf-8?B?dk9hWnJtRFRwSHF6RU5Pd0pqOTlwc1pMcnRXcnlzZUgwV3N5ckpzOEg5OUtI?=
 =?utf-8?B?dXZxNEJhR25sTEpMbXVUZFZ5OVVDb0UrZk9PcUhSVTBkTUF2WXlSTCs4amFZ?=
 =?utf-8?B?RUtvbHo2ZGRLL2tRZ01UZGtscU1qM2NWOEw3ZmRkQ3R4L3RMWDY1ZEFSRnoy?=
 =?utf-8?B?NW93czRIbHdBeXBqNHFIYlZBdW1HMVhYRFZUamhNZUgvQ3ZONTRzeTFLaHhB?=
 =?utf-8?B?cEsrY0prYWU0dllaYXB6WkVIdWJvUHVLcElvR1FnNHdGbFRpd2dpV2xIN2d6?=
 =?utf-8?B?L0VmZTh4R0lodFFyWlpZUkJOSU5YaE44R1JEQW16NlhWQ1F5K1dLaU1jSTE2?=
 =?utf-8?B?THBUb3NrYlVHZEd6blBCOWtpbjBYZ0JEa3RIbmozQlY5U1k0YzRHQk5zNU1F?=
 =?utf-8?B?bEJQV1QvOUNCRzgrNE5ZZER6cEovYko4OHZINVdLdy9vKzhXaUtWa1pBZjFx?=
 =?utf-8?B?aXFFdS81K09zRU0vc0Z0S2Y0dlhXVGVzSlo5cWNQV2g1SkVva3RJR1F0OEtq?=
 =?utf-8?Q?SABL2sdlhy9u/y5nP7QMy5rBi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db06e5b-ec3f-4fc5-20e1-08dad8f92d83
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:49:55.0089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThGO3GhMQIg2o4TmXwbMwH3kCzYEcLbzAzJpIWvJnBgaD6g1J0F8C4Sl3pNzN+8EQvrjHhb+s0f/qMGqkxWPBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185

On 07.12.2022 23:42, Demi Marie Obenour wrote:
> A previous patch tried to get Linux to use the ESRT under Xen if it is
> in memory of type EfiRuntimeServicesData.  However, EfiRuntimeServices*
> memory needs to be included in the EFI page tables, so it is best to
> minimize the amount of memory of this type.  Since EFI runtime services
> do not need access to the ESRT, EfiACPIReclaimMemory is a better choice.
> 
> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01365.html
> Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> Should this be included in 4.17?  It is a bug fix for a feature new to
> 4.17, so I suspect yes, but it is ultimately up to Henry Wang.  The code
> is identical to v2, but I have improved the commit message.

It may be too late now, looking at the state of the tree. Henry, Julien?

Jan


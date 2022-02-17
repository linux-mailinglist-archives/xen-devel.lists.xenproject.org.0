Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7FE4B9BA8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 10:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274527.470029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcht-0002vl-Nn; Thu, 17 Feb 2022 09:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274527.470029; Thu, 17 Feb 2022 09:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcht-0002sg-KS; Thu, 17 Feb 2022 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 274527;
 Thu, 17 Feb 2022 09:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKchs-0002sY-9X
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 09:04:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e79133f-8fd0-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 10:04:05 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-UpD1vrqUP72qn4x2KIL0nw-1; Thu, 17 Feb 2022 10:04:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7192.eurprd04.prod.outlook.com (2603:10a6:20b:11e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 09:04:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 09:04:04 +0000
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
X-Inumbo-ID: 8e79133f-8fd0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645088646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SOUwmz1sKb7ItPssG1li6njxqm6lI8NiffXi7IzS2A=;
	b=ArOpiii6U4N0o+7N5n2e05+aCd8wikZF/rNWHN72L235mqXN72+PElN83LuGdxnQQSSL2k
	0puAdnueVgNBN0JvIS11vb6pHF2j6sJf8WN37ysBiYM+COb3RoA9b/a8iQ6bm7FDsd4vqa
	TtKP1uAFkZxl76X3FYMtD1Z4kaaRpSs=
X-MC-Unique: UpD1vrqUP72qn4x2KIL0nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGgaN/AtwtSJTI9afis4B0q3Y/2NGCUxWiv+TyvxqGfAFyzw8exZccDrRd7ZVdktUMqDemr/iw46QqIjfrbTYinK9GR+Vf6ECt06kM90UsHlGu9hHwI52IlBjXmxmsUWOl2gK1RmkNCJrfplQ0Drv/tU6DaL3OLTEySpzRLvJhcQMC3ElZSnrXXWxQHIynI8fheZ236ZbfvEQsGYK3y7nrU/RvVOjqE5fSu1WgrS7yoS6NsTGXJGrbCw/RBkom/+1+JsamzuV/QSyCqIBTpkDsFvCadyufO7GlbXaYNmviCvStFv1hhE5iMKHuFc4O6ni/xb/n7c8CriStvuJoTUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEjLKlgDrHQLTdfmcBcuuF+HC2FjTqBwkMW2qXBOUnA=;
 b=GYub6zLE8RLgr8GiJ1gGuTCRzDIWS1PDcLCXbosaP06ueewaMv/ESgVTwD6iVWxTkwZPJfs4wLbFAqzIoLqmVcSGU5GalDjK2U+gTTQh2eOZo8uA7qPkdv+o9ThU9Vo5Qmv6jUjG5XhkO3ZV5FG8KKuOVteVKZutijiRZTGcgPaSpyxvusoTftav2RAKcC1J2mnmCUDwfaaBDBnE2pvJ4N6yUWBYCchdOEan8MDv03EcgXy3EUdL6C340ZltGEpxtrwAf0AD0PChltaWu+HL1OcGQ/r9MUYipSS7i+zTHvq4Do7d6GwV/qwhMaDWoc4CTDNzQp1VXEe/0ABaCwwysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <536a357b-b895-7fe6-f99d-e83f5ac44745@suse.com>
Date: Thu, 17 Feb 2022 10:04:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/3] x86/retpoline: rename retpoline Kconfig check to
 include GCC prefix
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <20220216162142.15384-2-roger.pau@citrix.com>
 <7e5f721c-9771-bf35-8b94-f7fec7cd6eeb@suse.com>
In-Reply-To: <7e5f721c-9771-bf35-8b94-f7fec7cd6eeb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e0e5ccf-e795-4ef1-8555-08d9f1f47227
X-MS-TrafficTypeDiagnostic: AM7PR04MB7192:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7192812996AAA3D92D1517DFB3369@AM7PR04MB7192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2tfujPm3buYpDAZuGP72QmKmTzCU658qt5Q4mtkB4n9ybY1facUdVFW/tmmK1urTkuGC6zQLhoiaOH94stX0l+6yWtN5uijgW6TwmD1k0+FqWePPXl5NSg06z6TtWj2QwRVvzUu+kvxk5n0TdnOUqf2I9ypzrXmrjGxj6oWn5Lr4KXmav9DzF3wq0c7LNWqclpPKqw0ngJ0EdciplVfLeKW152QMof0t3wkmG03ATbe0TR1JDKSi9cqC30KNT2DT0z2r3+rhbXNjKKe6WgsS4UsR+IGU2LAcQ2FgBaEIMnqnL4fMcp7tF7RjBya5HLXDIYzdsJm3wQ3sNQWJ/i6bnNo0HJCA7NzdXHDvFIgIn+YbPq3LA7LuIJtErCJOGBxFzh49EWazgY+Vo5d6fwFKrNcilpFwKPL+Sx4Vf/235CkcDs9NbEjYQtvRBfJaJ0R3FVUKI9WMAMiG5dOQ9iemF3wBe1+UZJ8IZeeJS2MOg61L4bhH/Z4oJHi0LLjK0ovHYo/Kjs3+kdRVfPpKccLldTRTx9+KDhjiSdKjxha9+DN5VbbRYQqMq89t+EAgYgbbtg6BoD1ncY1Pulmx6U+z1UYxHbMYDT0tBBbUKcuWx+DWoHl8q0YYxs1/WaCfng7xfgYTwJG/0+mgKnzCkm0LJH8LALMNiQDs16gkBjq5HRzjqkVLMfRaZB+EOkktCj3DYcAAcBKo3XwqGLaOtwln/rxJBQYoDkte3XuJV4VW/XMKsOmQVmevfdVZoAIE/5uu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(36756003)(2906002)(6486002)(6666004)(31686004)(508600001)(8936002)(66556008)(66476007)(5660300002)(38100700002)(8676002)(4326008)(66946007)(86362001)(31696002)(53546011)(26005)(6512007)(6506007)(6916009)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K018fq9kuJrBc7PqPt+q8/QAZHBxVD+uaNq1ZQ6V+X2Ys7zi5uVJ/LJ11LUx?=
 =?us-ascii?Q?J18byCnrH1IegXZIYQ3yqZCr6iLMo3BiYpkTKM+H4VREYuI7nPc8V/8I8l5T?=
 =?us-ascii?Q?p+XWFqB5Ms+VgW32noYhCEKAXr977Co0SA4HMoFrpUBFUaCmiyatGuGq66Mb?=
 =?us-ascii?Q?AoSjP0+axjriN6Fg1UX8WRG7DuUfHNj/95IOc6nuUJ2v+Kfl0ybSiyy16kvl?=
 =?us-ascii?Q?8YhkAq+IxDl4TFEysbZEyFuWfLJtDVpId4EKZxwyAV99WypY9xj7wNfjCpti?=
 =?us-ascii?Q?JcMcjdq5tZNlQkMCNQJRT3WY7HsWeB2lUlhsDctIJ0z8SCUaGsUkrvlfIQfW?=
 =?us-ascii?Q?Tvvkdb2e7hVF2sqY7BBw5AbEZ8jhzYOM6XXqOZBHE7lBofNpgxrVEYnwWUF8?=
 =?us-ascii?Q?jI/tKmXQuOBy2kekl0aMDxAJ11FEjLBDRlnxB7+u0s2BgoEnseRRZKFJk9zH?=
 =?us-ascii?Q?bfjmXI1pVZ6Jc1rq5UYbRdgrPsIyRNOIccZgqI8AZXI+UcQFOMsTAOlc7tzQ?=
 =?us-ascii?Q?6brGrFx0ST/CwiyZIezkUhvbm4XWcCBJIqEhhNt5F96STG5fNsE6sJl6AmnE?=
 =?us-ascii?Q?o8zRwDqaLoELUBt29y9rDm51j3RAXqUUaqNfUY8zxW5CY5Li34j0gDbsoDWr?=
 =?us-ascii?Q?N8FW6kdN05x6BTKzESrCU2uzuQoERtNV2yZPvI9/ecgfY1jWAazFCBhQw0lt?=
 =?us-ascii?Q?idCBEFuAcWd2bWtzKPAKtZ4nQzXHUJ4yT95KbATK3WT0ulsb3krnZepUTVv0?=
 =?us-ascii?Q?W1al7D7gXCnGpkEfhxwKAhbKwJcDzwhPhO3a4zlAi+/YjHMbVnLdeZOMZ5Pn?=
 =?us-ascii?Q?v003llHLMrUU50DTJBPjn/FJHGmY03+x58pVZwiKh9Tr3NYo0ls9IAbjoUEb?=
 =?us-ascii?Q?LHZSTTPPNJBzrP4zDE+IoY2/vS/W5Xq9Z9tLHQMGJOsUNkERDbyWu66Bk03Z?=
 =?us-ascii?Q?jcUB7gbHR5qzx7rhkWKPrz4fIGTTEXjhziovGN/80BdzOy1ZgHVIl8gNy99U?=
 =?us-ascii?Q?E21LGqu1GXpdGON6jtB7xw1iFUZMso1gzv5Gy6SyU7nAuGo64FJ2xwMkCdfz?=
 =?us-ascii?Q?R7KPbcfr2PHB4zaYGyJT/sNCQXcylLSUfgc062kh2mUCqo9xWjr1oEosfOrn?=
 =?us-ascii?Q?Bt/V04BpZDEM2UhT/lheeWz8bXbEndczcvbrYIGDqmcYQnCux/MvR/DseGGB?=
 =?us-ascii?Q?yTdQTl2UyVtCMCieItDJb+3TSqj7ZwssM05B9GqZYu+dsuuevRHKGJsrRzFB?=
 =?us-ascii?Q?vWd1XxGxguvH5HR0JK9H8dBmC8T+AhtEC35Gqj9OQUZyIjR2EdCpyyBAkdh9?=
 =?us-ascii?Q?KI0gFGIJlUFdvOYXsvV6Md9EEDNf48Lpo/6SLFax12qf4MZL7WSfcGcIN+0p?=
 =?us-ascii?Q?LbnK3Z9HpHhRGmhocRt7fo2aqs+4p49GgS4Pidv/xcGTN5qpuQzOJZSH1fWL?=
 =?us-ascii?Q?9y3XX+Of0muXXL/whPD2X7O23n5fOV0NDz/LXetOtNxeFgsi8Tn9Jt5yy5bY?=
 =?us-ascii?Q?rYFzjGtx9e9O26lPsR1UOsaUptA4qg+Dpxfyj2mfB4YG8FngdAt3Rzacuz33?=
 =?us-ascii?Q?LAJ0xjfoHUgqUI9w9vaceVyPErwfRSOHCw5dl3HLHV2YniuNmh4Rpw+PEYEC?=
 =?us-ascii?Q?7ZdilgkQDw8o9FXU+pgG7MA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0e5ccf-e795-4ef1-8555-08d9f1f47227
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:04:04.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV+K1dO13FJMGe5ZfeD9l/URDClFgY/lVwE/LEWZD1dJFjmMAibIwCkD5DQ1A+Dw3SonmKBNfcfcFyjT5RVmSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7192

On 17.02.2022 09:59, Jan Beulich wrote:
> On 16.02.2022 17:21, Roger Pau Monne wrote:
>> Current retpoline checks apply to GCC only, so make it obvious by
>> prefixing the Kconfig option with GCC. Keep the previous option as a
>> way to signal generic retpoline support regardless of the underlying
>> compiler.
>>
>> No functional change intended.
>>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes since v1:
>>  - Put def_bool before depend on.
>=20
> Just for the record: A slightly shorter alternative would have been ...
>=20
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -32,9 +32,13 @@ config ARCH_DEFCONFIG
>>  	string
>>  	default "arch/x86/configs/x86_64_defconfig"
>> =20
>> -config INDIRECT_THUNK
>> +config GCC_INDIRECT_THUNK
>>  	def_bool $(cc-option,-mindirect-branch-register)
>> =20
>> +config INDIRECT_THUNK
>> +	def_bool y
>> +	depends on GCC_INDIRECT_THUNK
>=20
> config INDIRECT_THUNK
> 	bool
>=20
> config GCC_INDIRECT_THUNK
> 	def_bool $(cc-option,-mindirect-branch-register)
> 	select INDIRECT_THUNK

Oh, looking at patch 3 again (which I should have still had in mind)
this would of course not help. Yet ..

> A more appropriate thing to use for "depends on" might have been
> CC_IS_GCC. With the next patch in mind this would then avoid
> potential confusion if e.g. Clang folks decided to (also) support
> the gcc style command line options.

... adding this dependency (and a respective one in patch 2) might
still be a good thing.

Jan



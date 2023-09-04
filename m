Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6D791A5D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 17:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595299.928820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBGW-0003QR-Dt; Mon, 04 Sep 2023 15:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595299.928820; Mon, 04 Sep 2023 15:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBGW-0003Np-B9; Mon, 04 Sep 2023 15:13:24 +0000
Received: by outflank-mailman (input) for mailman id 595299;
 Mon, 04 Sep 2023 15:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdBGV-0003Nj-3h
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 15:13:23 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe16::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 953a6f52-4b35-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 17:13:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 15:13:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 15:13:18 +0000
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
X-Inumbo-ID: 953a6f52-4b35-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgmePPzp4fVu3nhPfbKiawtIaTLPz3ufvjyjnU/UY1x6871mNIY3umaw1dI0sk2fg4Ot2s6xpZBSfGMTTFEfcwrZLLA25L/f5fv/EAncQGB6cjL4x/pAbhRB42O6KjobqvSJsCnXJEGLmF6QT7MvmWYB01el1SKEaMJMqK9XNygKrvDMU1TE3spE/f+hkysJhimqeqUp1LWOu+LvKG0t9UoOaw9zbMuP2IgFKOQ8BAKfSg2vDoW28hLy340YkCWYeB3RvrrQBqbuV2kpbpDXwJQ8UFvLu2IidyHNP05cZ9pFNoXO1WbErh2xfzdSLWMnFYEHfju519nGI+zJQqdI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8JIv6W7EpN3kT49oRVmaUamLPtPsejDWu/lj6gh2BA=;
 b=CgF7tMy1J9FMGtWNN4WsIbgWyikmX2l6TAghIuN2gR+usMj+DvEam4MBAN22wiqmMtJ+j8goyGzzLeY4Gh/7DRL8TUnrKrEO7XqD40MX5quD6Okkf6+sAh9wIKuIpd+y2cP4wiMq2FbP02+I5M13ph1bt1FL+OHPPfNGiyYDLPQUkfSzR5144JRVBko5lFhr1vjoKD+8V56R+YPcVd3PxFHRlIU+G2nhwfZWPomRgQ1s41SjT6KprT0w1KJ+rHOv05H6EWAj0F8/SOeGshA4xn2EhhgNItbvEE9AFVvACWoxSr42IcJNZzxXcI3cJ6OTkDWvRJQ358qZfTcCJqeJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8JIv6W7EpN3kT49oRVmaUamLPtPsejDWu/lj6gh2BA=;
 b=pys24PGKfy/bw2VCR9rToEmqgsTx5oOW9Y78YN5YWUWzAcYEzYFr+gOMhdlOiMgA5XY8UTJtszAvfuzzQgBtu9tChIxmNmBKxCwcbVcJ01VBgeh1x2oBp5ufn7eRIVK7PN9QeqHJRpXoMWZL9uhH4CoX/QaMLSAPL/LhCrVMghQCDUXVHuhs4D2Dle9CEB/h2jh2kLhHs8w9SaSFaj0ZK/DYgFr1z52qR0Odva5oGSpoXDsbWLWOb91MFZHF+j9R2AoqSfrVjUFoso1oITCOjGLfqrXnIt17S9yQ6WR9dHJFkUOI/kSr9u24z+Gxm7YXpOd8x7xmZw/SFbLG5v7iPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4c3f708-b3f0-3028-ca3a-6661d0f78d56@suse.com>
Date: Mon, 4 Sep 2023 17:13:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] xen: Change parameter of generic_fls() to unsigned
 int
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230904091406.942-1-michal.orzel@amd.com>
 <20230904091406.942-3-michal.orzel@amd.com>
 <ec00892f-d9e8-1095-fb27-c344caa6aa28@suse.com>
 <3538634f-61df-efc1-e45c-ba4c01b5014b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3538634f-61df-efc1-e45c-ba4c01b5014b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac5e986-65f0-466d-0a41-08dbad597834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwnorqj3uKhJioDhlhCnqZWWrAg4QRKUj87ApUkldmFjhdAKOQzjNSW1ym5gahUtkmzGjYqhhzR3vZdyKtU85kQhv1GK5PPRRd6GRo0g4B+82GoV4UkKRDPnXem9h76zAqrQ7ELJNGhu7VWcNihBqhqjD2uqk8U+ewaxqXpdNgnUiwJZDV4iYpOZe1A5ow6sAxKnkP3kaetxo7lBpvA1zKFpSpvfLvCWZezoUqkvxYaP07jEKA/SfdASK3aUhoY82ifZSHON8ktPhKNwix2/Ks4FApRmd2V/JA4KJ7SrqFfWyQ5xUfGija9usHmFqYpg3XH4pHZ04H5VYNdwB59KWxYFF0eL6bwvWbjIG5p88hra5bUUTGw+sRGDzItFNCPwjxvmPSnZUERY/vamFQtosclawf5VRwiybhKTmlerowS0kgXLamxPB+0o1oSy+wjCNwa/k/LN/qf8roAeG6Elrb/39ca82Fli0dMqvonfsnN8sXMO+XvnLYd3AnnA94pHxQbzV7sa9Nb5iEEoosxD6LfeOHq5TjMVUqoSIUKzDg12Lx6HUVVnJiIj5COvPIpaUJDBfcHxvBmQzaqoXhgwAv78xLebLx+mxqUcO3v6p2ej3VQ8RkXFc4FfCmdfVMHgaNW2LTS00ShzwOqIaRCNg9ri9Ad7HuagmrXEwzaiKG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(396003)(366004)(136003)(346002)(186009)(1800799009)(451199024)(41300700001)(53546011)(6486002)(6506007)(478600001)(83380400001)(2616005)(26005)(6512007)(38100700002)(66946007)(6916009)(2906002)(36756003)(66476007)(316002)(86362001)(31696002)(54906003)(66556008)(31686004)(5660300002)(8936002)(4326008)(8676002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0pKa2VDOGZ1MDNxNzhTZVRTT0x0ajNPM0xoZS83Nm5OWTJhV090aWlPQ3Fr?=
 =?utf-8?B?U0d3eGRTK1BiSUxUYkZQemxlT2pQWW01aklDWTJBTWdCaFVxRjhndzJSdm43?=
 =?utf-8?B?QTdrWVQ4cmZVUVhCcm85eDdsaEpvM2lPcWZ6cGhCOTBJcVk5dllMZTRFODJ2?=
 =?utf-8?B?Y2RnYWVFTjViWlF5c05pd1crYWxWZ1l2SDlaKzdmdXhSVVUwdU9ReW1ldWFa?=
 =?utf-8?B?ZnJvRTkvWlhwdWhXOGlOYVdsdWhnMzVHNVRIdE5jNU44d0lBOTJlTFd0cnNk?=
 =?utf-8?B?Rk5hMnBVL3RVZ0tQRWZJNlA0Y2dwd2RVYmpxV1h2c0dCYk41czVKQW96ajFr?=
 =?utf-8?B?alhNcWZZVFN6N3FIeXNOWlpXVmFmcFZXY3FORVZIa0luU2VGTHVoeExSMDBY?=
 =?utf-8?B?dkZKZm1Gd1ZwNmZUbnNrTUNGZHp3aWZ0bStwSmVwMnRsblZIRWdDb0JlVGRi?=
 =?utf-8?B?V0JucEdxc0R0ZU5jNTBublZ3T3V6MWs2YXJyZHpyVkR3T2kvKzBsNGF0TFYy?=
 =?utf-8?B?VEdJbURFTzR6VW5YaXpYc3JqcmJOWGl0UGh5VytFK0VmZkFDeGw0S2ZrS3V6?=
 =?utf-8?B?WWFyYXAva25sOTZnODdPck1aU3RuNE9DeGg4bm1CSEtUWTI0M2t6K0xCZDRV?=
 =?utf-8?B?S1g1QUxkRFNjNjdpT3ptOS9qVG9BVXNXaFkvK0RrZTVwYmh4UC9CT2dPUFFo?=
 =?utf-8?B?bFNXVmhCZG1DZXZJU2FXQmRBZ0ltZDR6SlAvREMyR3lGbUYrVzNyM1Y2M0JC?=
 =?utf-8?B?ZjJaVFpwUFhla2NNeXRGakphWi9ROWVnZDRJWkRGL2JMUjBCMmYwdFljeWdC?=
 =?utf-8?B?aW1oTjBLR0tVb0NFbTIyOTBSYlJqMlQyK2dUVHhGVkFjVzBKN1QyKzNWKzFn?=
 =?utf-8?B?VGp5RVZaaVgyTHFscHJUSGtQelhFZURPcXljeFl2U2pGRmNrQ3ZDZWlQa0I4?=
 =?utf-8?B?TEFDVTh2TFJlRE5hOHF4ZTRYdTZnLzVzTGdHdTFQTG1EUHVuT0xBT3pUaEdy?=
 =?utf-8?B?SWNqbmN5WHlUeTlIOFRaZnMwMytuSE81cnNiMEJZTnpQTE9IbHUwYVpQQXB0?=
 =?utf-8?B?aVpTMkRua0FDSDlPeWdhRkVpY1NEN2R6RVQvZmtZTHV1Q29EVHEreEhVazNB?=
 =?utf-8?B?UzU2Mmg3V0FycGNYbC9QTCtFRnhwUUQyUmlmTXBXSFhwa0xYUTgwSmdLQ0dq?=
 =?utf-8?B?ZWoyeUlSK3I5Q2VCaFhkOVA4b2RhaXpqbjBRV0V5ZzZma0h3aG9UY2RHWkkz?=
 =?utf-8?B?NjF6WG16OGpxYWJhYWFaZXFjbnRhM2IzemtLai9kOWlGaWtMTFZSZUFzdVZr?=
 =?utf-8?B?akttOC9ra2w0Z3lkOVY2L01xcHpDUEJoMFhXNUtQWkJ6U0lTVGJoamM4Nlpi?=
 =?utf-8?B?a0NpR0NSK2tLb2Zwc0ZOYUFzM01xSTVSa3orYWNPN213MnFhZWFtcnN3R0th?=
 =?utf-8?B?V0QveWwxekw1RUs5VVY2RWw5U2piSFpkdHM2ZDN6REFyTzVuOUZVSHNCdU0z?=
 =?utf-8?B?djRlZW5LNzJDNWhYRGNycWJRYnNTZ2lkUmJjZUlBYS9zbDlLa0lESTFRdFd0?=
 =?utf-8?B?Rmx3Y05ZWmYxQkpkbkhFNlJ3YUdSb3k0NVV1UEx5YTczcUlNeStkaFdFTzAz?=
 =?utf-8?B?TkRUdUFjTzBQVmpIbEMzTzh6Yk8zQStQVDhjV2V2cHIrY0w3Y1k1eWlNN2xi?=
 =?utf-8?B?Rzh1SkRIaWtXRWFCbTRPakRVb2pOSHZzQ3RGa2puV3RpZWdpelUvdjdmL2V6?=
 =?utf-8?B?dnhyRjI4OWJmSGRYSFRacVpQNVdPZFErQTV0SFZtUHUySEpnOTBZMUhETVhY?=
 =?utf-8?B?ekloaGorSVhNVUt2OW9OVFBJN0NJeElPZG5WZTJ6MGJubDVhV1pwYzJGNE1S?=
 =?utf-8?B?WllZTlo0TkJZZXdBZ1pvd3l0eHBhaTRtVkZXNkNpUHBRZzVZaTIwTk1idERL?=
 =?utf-8?B?YURBRG1pQTF2c2JrK2V5U3AzMUQwUldabFRNNHBTR3liSlBoOTU4VC82bHpp?=
 =?utf-8?B?RjBENXJobUVyNERYZ1BpcW1Cd29ScFNNQ2dLRUd2aVRUSkVaT2QyT3ZtV01K?=
 =?utf-8?B?clJVL3dnK3V6MXd1Q2hyYTFUZHlqU2JxQ29DaGE0OHdKa0hNZFNqTEVIU1Nz?=
 =?utf-8?Q?76/zo8eVomNM2CQxK7Y8RJSa/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac5e986-65f0-466d-0a41-08dbad597834
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 15:13:18.5191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMngNEeWUaDTeHIBRE8Odg7bBkl5kJiNlBYS5aKHpHobHxSUo6Sh5crul6093I/2ZAN62obSE5q00Bjl5FN7sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713

On 04.09.2023 16:03, Michal Orzel wrote:
> On 04/09/2023 15:28, Jan Beulich wrote:
>> On 04.09.2023 11:14, Michal Orzel wrote:
>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -51,7 +51,7 @@ static inline int generic_ffs(int x)
>>>   * fls: find last bit set.
>>>   */
>>>
>>> -static __inline__ int generic_fls(int x)
>>> +static __inline__ int generic_fls(unsigned int x)
>>>  {
>>>      int r = 32;
>>>
>>
>> Even if perhaps not affected by UBSAN, generic_ffs() then wants taking care
>> of as well, imo. If additionally you switch __inline__ to inline, things
>> will become nicely symmetric with generic_f{f,l}sl().
> If others agree, I can switch generic_ffs() to take unsigned as well (together with s/__inline__/inline/).
> However, such change would no longer fall in fixes category (i.e. nothing wrong with ffs() taking int):
> - is it ok at this stage of release? (not sure but no problem for me to do this)

I'd say yes, but the release manager would have the ultimate say.

> - is it ok to mix a fix with non-fix change? (I always prefer fixes to be done as standalone changes)

Imo it is, to avoid introducing an inconsistency. While such may
not themselves be bugs, they increase the risk of introducing some.

Jan


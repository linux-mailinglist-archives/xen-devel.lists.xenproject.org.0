Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD065577DD9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369385.600773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMPn-0007mL-6B; Mon, 18 Jul 2022 08:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369385.600773; Mon, 18 Jul 2022 08:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMPn-0007jg-3L; Mon, 18 Jul 2022 08:47:43 +0000
Received: by outflank-mailman (input) for mailman id 369385;
 Mon, 18 Jul 2022 08:47:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDMPl-0007ja-IS
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:47:41 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20088.outbound.protection.outlook.com [40.107.2.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47f8c078-0676-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 10:47:40 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by HE1PR0401MB2476.eurprd04.prod.outlook.com (2603:10a6:3:83::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 08:47:37 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:47:37 +0000
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
X-Inumbo-ID: 47f8c078-0676-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWiqeX7Hb3ZWJkPs+chvXDZjCUgh5mxomnmtdbzc8Vh54ZgU8pkMV0VRO5ME6turwmDVoKwSTemICYDfIzNelly64uRIoe8NcUTeag/W0OdKkDE6l+SAj0yUIaLtzOnIHjjBEM4LRPYpN3hAn4litsyUXFOaMUWjYKJKeuKdjBnCaj9OKCTFb36NRqpjuK1JUjml8By1uJnIBrS2RBurtD6iO1V3bbuc6odUqgtbS3gELF1PnFHZVQvoDajSpYWn/sFnvQVYV6RqoAIZbQ84nTl5jMgbTrL5yp7xBRIYeeUdrgLXsyyTJEaPBdVsOYvm+dbuCwuTEyx50jFoKJ2W6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvsjDqGL2BujawmzknEtMFgCpnNttGWLdgUDtHSTwH4=;
 b=RT3LQwoGME3AgwiLjm6p4A17fqYTIpC+IdCxBL3ZwCIpzbB5BKhUq5+ZpjcAjV0ls/xqb4wRxDjyAdU089tjJW+GAzCTZW4MMxDtknv+8LA8CCjjl8JksdCXP6GRZ/mB8x0/92IZFgl67FJ65DVsT2DfQ5k+JF9DRzXfONVe18kCp/HEaAu9QoPs3VDEZ2pqJcCHAKN/U4kl06XoLYuswJS5WpfE/4PUuLEcvukFdaAtDhzmhcyfbLLl13uUqr4TMPOQtCc744Ld0+yJTTmiOrObSVoCAqlQoITekuWNlVWP1bW89CH/iPh3X0X3maTTdc+84WY6kC8muJyQIWlBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvsjDqGL2BujawmzknEtMFgCpnNttGWLdgUDtHSTwH4=;
 b=MyVaek/O+8lNfo6KyQd7xj7JTWzgSPnI5vhoZ0p3G0Ajeyway1tJ2GDtYbS84OgEVl59v2lQ9xDtdDRD6KMDKnWwJVHS7H8fBptEVsqzWb8USoXC0tTXMdfIN9eKoBVlvlDN9kqPUdxPY34yFeYR55kTp6160jT9bnmGcFC+9TtwE59c09Iok5n1kJdMQCVlBkeKnSP34ENuT1vmfigfkL1KXFsF21HUL112dIQ+fnoUNFL2g8nfuYA91qCb8X191xn6UAG3tvnhMsiumqYDUSMK6/DGgBKjfbWsglfu4/ohdIv7yJQerxGb0JQwrTtn0bqcTcBNn2rFyZXCfaA0zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48d5cdc0-3937-a5f5-5c0e-a0eee90342f3@suse.com>
Date: Mon, 18 Jul 2022 10:47:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/7] xen/arm: mm: Add more ASSERT() in {destroy,
 modify}_xen_mappings()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-5-julien@xen.org>
 <5CD19BFD-62C6-4409-A5A9-675D8F5FF795@arm.com>
 <8c6a788c-ccb9-fc5c-fdf6-870540eed722@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c6a788c-ccb9-fc5c-fdf6-870540eed722@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcfad578-af38-40e3-81f1-08da689a2aa3
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2476:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AQrrAYBSQQWWgIpsrNWe6DL/VtXzL69W2y9kZdNL9UZ3nt7bFn9aIhFpVEAwxLHDR03aHBj/wv8eRZiuG+eCa0vOxUxrpn/SZ9IPVCegSlBGXwkMSplJl3W1pvuGCUqrD5qFk6tROhmVbCk7nUOiyo+mNdmhRmaHVmQIy5MpEx48CAJbgO+oDY0Ro4nbZjSZd2EWSYEcnv4N7ct/aiXZ4VO00l+4mGjIm4zQlaCD7ZbyHRvgb8kJVRHcLpDzqPu4RkFU6hXie9dp5gCayCQU6WYu7vTWm8fQWIW2ufIerVy6+RPYOJmENzyoKVglYRe3qyVOKW1Zz795mNbcFB8AlUfFitIxqBWQBcdWdl4cUmSPsJJUVtQbZ/K2Y5dMBnXpNi9KW1NB0j5COOQ3YOMMLQFOKnpZIo5kVhYikp6V1f4xMX7durRwXeonusLfggsaLw6ZV+ea0oXly9vu8RJoO7vvK9W4BLWzXAfZ7LGiiW9dXD75mszPRhIeYbBfKcikFymMEaQZvYTLb6CljSi1Pex8IHb9IoT6KpJjhOpooGqGKqJll0dZFZs0/qysUmaSNc9G859EoNrWL6IY3idG5qboG4c7xtX9tJ6OeZA0JTOaB19oJkGElAYQeCQiWCx4/8ZpENQQCfHjAGV3NSYcPHJN7D8XXcOr6rLl8PMNdcnvtf6H13uPnT5k7ERHuWXj2gXKm0XgJ0hWf3oprFqj5ibokn9g06v3eIHEZmZGDeJjP4UMPSAO+2hMOCmix8B79Ggstey1lMrR/dtuctsOPdINNfFWDmN+PRD/wpmW3UvNxTc6hypyqTTy+3mrSzMQNbtYpgKxY3uxsmLCndiqmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(39860400002)(376002)(83380400001)(4744005)(186003)(6512007)(2906002)(26005)(41300700001)(86362001)(53546011)(6506007)(478600001)(6486002)(2616005)(8936002)(5660300002)(31696002)(38100700002)(6916009)(54906003)(316002)(31686004)(36756003)(66476007)(66946007)(66556008)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGx0TXdNSW5DNG96STJGL1dIQXVrVGM4Mld0K1cxSGJtUmhadUZ1elhDMmZv?=
 =?utf-8?B?YXA3aGpkWnZTZDMzdHRPUUlmZG1Ya1dFSUUyRUh4Qi9ubENEai9Id2RaaUFZ?=
 =?utf-8?B?a3VuNTJEZEVTZlljOWg0dmZiZEhXYTEwbXZSd0tNVDVFTktnUjdnNkxWQ245?=
 =?utf-8?B?N3ZNdm1EcjlPcEFuYitIcUw0Rk9Mc01qa016eFZZbDFSTWpaTTFvdVgrWU9P?=
 =?utf-8?B?RjVqV2FWc2I4aDJGNUZvWnhjMTZBRHZ6MDFwcG54WERVczFDMjFvdFY5U0Vv?=
 =?utf-8?B?U1ZnbW1FckpGRitXZndVRnBUdm4yQzk0L25ZcS9iMjBvSFovREk0YVpNWHpa?=
 =?utf-8?B?OUltTFl5Z00vdXFQSk1yTnBnV25FU0VxazdyOVo3VDFnSlV0Q3p4Tm9TaUp5?=
 =?utf-8?B?Z0g1KzRLdkNIZEJ5bllTTE40Z29zT1VUeHlScWF0anIzcVlKUWdaSmh3eDBS?=
 =?utf-8?B?dkpZak1KcG0zNjVRRGh0Yis4ekNtNW9GN0RzbnRUZS9zcXVHcFpTRE9zQWNW?=
 =?utf-8?B?eXJoR1BSVjc3M0lmcC9rK0xxQjlmMGNlMW8ySWthcEdiWFRFQ2s5SWRFUDVM?=
 =?utf-8?B?eUhNVEFkVFBKQTBaamtuV0swQlpaV011WHRWYStqeUlieXQxb0hVQ1dwMlUw?=
 =?utf-8?B?SjI0bU5KRm5UZk5IR3NBZ0xPeXVDOFh6RmRDU3ZvV0hkUENxemVSS1lQQjh2?=
 =?utf-8?B?RDFNTzh5Y3BFSkxtRzY4SkJUWnNSbTdYRDIvWVgzeDVYOTNQWmZtWUpRV0ZY?=
 =?utf-8?B?WW1EWW1Nc3ZOelZPakNGTGxQWkpXRUd6K0ZEL1UxZXREOXBBK1ZCTThGaFRX?=
 =?utf-8?B?akFJRkZzSGIyMndpbDdwSHQ2UlZ2T2FKSDBLeUx0akhMTG51cyswUzBaMHp2?=
 =?utf-8?B?ckN6NEZ4ZklrQnZXRlFlb1Z3RVhsMUp2TTgzei9hOS9aSzZPSlVYcGxaZm0v?=
 =?utf-8?B?MUZPTW1kMFoxSjMyd25pUEExVll6M1JYdnRPQUtpdnZrTDZ0MEZZQWhZelp6?=
 =?utf-8?B?YjVidkFTMVNML2dQckswU2V6VEg1UXA1a3dzK003UTlCRFNWMFpreTFJN1JQ?=
 =?utf-8?B?S3MvSS9tS1NSZUhrd2FMMVl4ZnRKazRIOWxhTDU2TmZXT0dLTitkVnhlVnk0?=
 =?utf-8?B?N3FNaXpYREVHclBtL3RYTzQvRWtCdUkxeEEzNEJPbW04T3M1eWdNRERQUGpj?=
 =?utf-8?B?Y2tiMWVnQUNrMThIdUlyRkVXL1JKT1hQcjFQV1ErL2NZWmQ4ZDJrbFRxZENW?=
 =?utf-8?B?VXFxTzhhQzlkbHhlWXFETmxpMGZ1TWdMbldSQmErbS9YQUx6Q1YvUFk4TnF5?=
 =?utf-8?B?T2FNTFJQN0pzTjViY0wxVmtwQU1BcnpyUXpyVEFBaUhCa2RsWGoyaThLOEVs?=
 =?utf-8?B?dTdHdzR4VnpDWU1paUxnbkc1aXRWbGU0UGM0MGlBdWc4dk56SzRORWp5SWZp?=
 =?utf-8?B?cjQ1ZW9xQ1NaNHU1cVJGTVl4dExNbEhzSklTV3ptUzVPREpHRVNiVzZPM2c3?=
 =?utf-8?B?aWdaQ25RbkJzanNrMDl0LzVOYVdoQ2hMMStKVFgxNldFbWs0Rjc4cWRqWHpC?=
 =?utf-8?B?VHVaR2J5d09xKzhXcGcrTnJLdDEwNjBzOUpDbFBQaloxWUM3TDIzUElwMDVN?=
 =?utf-8?B?UExva1ZCWTdpVklVMXk4b1UyQ3Njd09WeEdXMHJzdm9QRWRHS3l1M3pueEYx?=
 =?utf-8?B?WFdnUXZwQXhob0VMV1JrT3dQTGNiTmxYQXg1Sm1qRGVRcFBjTVVHNVZQTnpt?=
 =?utf-8?B?aGxXd2l3N3NicThEMlQ1VDhUN3Jwa05leGROV1VNeW5oclFUbCtXc2tXQldX?=
 =?utf-8?B?dWErK05pMVdzbCs4QlI3eStuUFVXRTl5NENHTlVTSmxWWlBseUhJaS9ieTBQ?=
 =?utf-8?B?cWtoWGZiaVZGLzBoV0lLcGF5UFBwa2pyVzBMektRS0g0c0dhSU5KNjZFME16?=
 =?utf-8?B?OWV0OXVMRGdBdGdId0NjdXZDZVYwcDJTZmI2VllDR0F4ZHNSUjY4M29BNnBz?=
 =?utf-8?B?Q0wzU085eklRc1M3KzV0bExPUklqQ2p6TjB2Ti9nYUlPL0x5WE1OeHh2U2JY?=
 =?utf-8?B?QkwxcTlIMWVxcGJueWZlcTVUU29sSjNwaUhrYTRXWDArOHBqWmlxSTAvdVVk?=
 =?utf-8?Q?x6ZRNH9NTVxjf8mfG9VCemvrk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfad578-af38-40e3-81f1-08da689a2aa3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:47:37.7363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rw4kKoj6v2H9GlGgEEJsft7vy2/K2CVgoELvmW6nFNG1nR7iPUnN4O8mefv/7FirJK3fOYrkfWdk5yqaXOeFhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2476

On 16.07.2022 16:38, Julien Grall wrote:
> On 04/07/2022 13:35, Bertrand Marquis wrote:
>>> On 24 Jun 2022, at 10:11, Julien Grall <julien@xen.org> wrote:
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Both destroy_xen_mappings() and modify_xen_mappings() will take in
>>> parameter a range [start, end[. Both end should be page aligned.
>>>
>>> Add extra ASSERT() to ensure start and end are page aligned. Take the
>>> opportunity to rename 'v' to 's' to be consistent with the other helper.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> With the prototype updated in mm.h as suggested by Michal:
> 
> Done. I will send a new version shortly.

I notice you had applied and then reverted this, with the revert saying
an x86 ack was missing. I don't see any need for an x86 ack here though,
so I'm puzzled ...

Jan


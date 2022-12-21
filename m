Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09F652F3F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 11:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467741.726783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wCM-0003IO-Bf; Wed, 21 Dec 2022 10:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467741.726783; Wed, 21 Dec 2022 10:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wCM-0003FJ-8d; Wed, 21 Dec 2022 10:19:42 +0000
Received: by outflank-mailman (input) for mailman id 467741;
 Wed, 21 Dec 2022 10:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7wCK-0003FB-Sh
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 10:19:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa3795e1-8118-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 11:19:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9214.eurprd04.prod.outlook.com (2603:10a6:150:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 10:19:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 10:19:36 +0000
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
X-Inumbo-ID: fa3795e1-8118-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maBKna3Yn4HRurJWm2pCsZWEQ86E1nZB/W3O45aqUTLSaqINKypxP8G2Zp76wf4vr6PkgTEBrSSUsOTMLVP+kIVKSgmsLfmhAvScyPqbyRQ9YvdSdCVT1yP7QglubUwGfFQx9cnbruElSHuz7KlHOgOrKorSe9s8symsDZ9gCzxF8TrB+lsD3M4xOlu1gqNimcqVWTyf1ddhrP4MmM4jt13aUj/uEkcAwOnamQFMDKa+/mrDNtHa0TE9oIr/kbz/YxhG0Isv5sLYBp0f0HpgY+d2oKaVxHsUcMci/085pu7ZzHDhlFzYMQtikT5jeR515doSpKwYQvWWucUD0oYQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em46XygaXAchgvGdscyI0MbzCrUgcFcQO4uP0WJYLBM=;
 b=RHrwTzLNpijufwicvL84Z/LsUOoPL1R7nXAB6ifUIGkE8cvjRY1Raus9Z63tednpJrCHc0ZkUhsXm8Tud6ptl2kQW0n4J3e2S/egSsXR9WBwqtMwPG22n/1TE0MfFwgEjVPfLnNTn77GwfoJ2RKxGA96iX7PS6KhHOSqvoLYTa+z1xEmz0/fVIOKhWXHFX3yUiAgkatmhb7zV2DHoR0cncaM6kWYrieUaA0v5R3sJg+Q9Yjt9DzKHQzwH3hbO6jCvYwVyUYvhg11H6iHFveUvXitFMXOzy/1AJkHvKmhqyHIvB1gtvYd/uT80+E62tygdW9aVdh230U+ksHXGICqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em46XygaXAchgvGdscyI0MbzCrUgcFcQO4uP0WJYLBM=;
 b=BugArEtgqyKCz06vg26H2DuZOemL8ojhsSR2s3n+t0ceToE+FVJS0FXl4INoHMz0Yuzqr5SqINyniGSVkz6ye3/ZL9EzRetsI+kZvax6c5kn/5QU97BUq5E+Z8w518Tr0DzdmNVo64yfBI+Z9sN8yXShqFY8VmR/YOT2FB8tOCDSxPd+PjhBR6+4b+R+Xt1JIp4EiDpdz2enr4hsZTAf5WhLQ+FhqAk15TJdOjWQ6KKwRsMU8NidNddaPFddn92ux5aaFvXW/rLY+zQlgMGdy1BQIfhAw3zeKD0YveC9399XkDE+D7S9hLqOYJqYEL7Y+21aRuhO80Iqzr3EfDje8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9d36ae1-2363-1276-2747-737823d2f51b@suse.com>
Date: Wed, 21 Dec 2022 11:19:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 7/7] x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM
 code
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-8-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219063456.2017996-8-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 1337ea6d-6fad-40fb-1a60-08dae33cdc82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f/awCtmT/UmHbRysP9fmCsLvDYaB2s5NxfGwLEblqI40L3Vh/xHU7n/WJGmp6QWC0EwjMhbpSjFRhbZFs8UpGF6D8IFCcSGENexVakY0kTTE7pE2srIzqdRfgIGe5aRse78+lfVNbrABNdliJQvF5oehW08ytWPz1wzHzKaxrGAbnTgX1GhdbDFvI3VsijdZOwTuD85LhAwtz3VR9CtsGIJRcR7iJXLU6XcHPGDzjKRGLYjZ9TMzbnUPpQgdy3j0pSkNl2SKD8U6hRGYMptDoWOeN5TjfNF4ohdTrkrQUM1vWQeBO1Talqy4dJXwwnbQc9tl3qZ7FsSwKzv5uT/l3vBOt/Q+DzhtWRPOYk9K8W0Iit8mr5VcqWg+9bXwljd0vZ6h6cwO2ZiILKuROXQv+Q3kGtjuFbEeK7UpEjXLO64vGT2cwX+nesFn44MvmLuusXhLj9gg64ueqpyAPSm9dZ8wIZLKRkeg2QFQenQ3LnUrsYbUfj0s9RG80xTFgDxQcmSvolroc7kHTU9paQoGHlBB2SjyD7NH2EV7o5xSIUfsyxmvPW1PmYES7vea1R6jYAKaQ27seENKM5IcMh77/0M1bRL0r1TyM+frOaGPeh1rZXuK2Gwk4g9lgiu8n+0cxkthJpyZF5kHRx7nG3uTBRHZbdBD/jhSm658z2/BTISeW1ZZqqpKo7o4nLydFBeHiXpFfPJeRKyImpC9+4VGkkulzTIc4jxJujKKX2qldz4tgtGWjpHnrD40Rb4SCTrs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(6486002)(53546011)(6506007)(478600001)(186003)(26005)(31686004)(31696002)(86362001)(6512007)(2616005)(83380400001)(316002)(66946007)(6916009)(66556008)(54906003)(4326008)(8676002)(8936002)(66476007)(36756003)(38100700002)(41300700001)(2906002)(5660300002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHRVQjBPTHlMWEF3NC9nZENjbFNqUkdIZVJHa1gzdE0yLzJqYXd0T05hd3Ri?=
 =?utf-8?B?b3JvZmRMVFdxSWd5d2xyNWNESTk0Ynk4aW5sa2VaZGlQVWc0MGF0Qzl0WUo5?=
 =?utf-8?B?L3p5eFU4djZrcTdEeGN6TkpjMVZBUnQ3Z2FxbXM3WGV2MjhFbzhuenVwS2Nt?=
 =?utf-8?B?UUM0WWoyTlpUdHppcU1aUGtXckRGUzNINVBDYXUzQzlqaHBlQ2tyZG8vRHk3?=
 =?utf-8?B?dmtPdGpFQ09JcE1vNTdrcUZrcnRXbFY0eEJRUlczMEZwazl3eFhUb0pKVzFG?=
 =?utf-8?B?NHZPalhNK1U4ZkFsNThPQVJMVkdXbW5EVGFHRkNkTGdsRklqM0paL1JlNUN5?=
 =?utf-8?B?ZGtLRWZRK0o2SEpQbm9VK3hjblpPbFAzUWVRblN6OXA0V2F6ci9taFJXWXpX?=
 =?utf-8?B?VlBVdzJoY1NsSDBSYVdxSHVoQkhVOXB2U3VJVGs3bWIyK1M1U0RDMDJGUzVN?=
 =?utf-8?B?dllDUG1NOGU5ZzZmYm12Q1JsQnU0VnMrK0hrbUIwSkYzQVRjQjNiR2hoSnFI?=
 =?utf-8?B?aHMzcFJFTXlxOXFsZGdueFdkUDhUYkpwcUlrUmN2NXZhTVVDR0lrczI5MTA4?=
 =?utf-8?B?NDRuVWFweG1pMlorcW4vbzRUWkx2UUFNNVRFdVJhN0FydkdzaUZzVWJ2bGRs?=
 =?utf-8?B?NGlNbjh6VExNak5iVWVPS2JUYVRMdS9qcmkvVkxwdnI3cXlDb3h2T2xFMHp0?=
 =?utf-8?B?RXdtdk1laXNISmQrTDZsdC9PK3pPK3ozUXNpSktXUXlBeGxQNGQvaWVidlhq?=
 =?utf-8?B?ZFhza2Z4TTFhT0Q3MXdHVGJTSklJVmgydWVIVkRwbDFzSTM0T0JDSVI3b2VQ?=
 =?utf-8?B?Wkt5VG1YUWswK0Fhekx2azdYWlllVTJpOXJwY0FxMmFBTFh0U0lsMU9JdllP?=
 =?utf-8?B?b1V6SHpGMlpJVHRDSG9HR2k5a2JrbWQ1V0IyL3VmdjJiTDZObjdqYUFHZ0FM?=
 =?utf-8?B?bkpSOEtDdFFPQlRZeGN0SWcwOUF6RHR2eSswZ0crc2VOby9QY2ZYYnpJYlo0?=
 =?utf-8?B?UzZKQjZlRU5uQnNKY09BUFhNZGxsb1JWdDFxRUxmNitQWXRUODRCOEtzcXZX?=
 =?utf-8?B?ZWFmZmZzNWIwS3c4MkRyTTdSNWVmdnp5V2ZGbXRCQW1oSU1aWkd5NmZaVjQ4?=
 =?utf-8?B?VGhQOHZqeWowTlVmSXJ6YlI1Sjh0V2VSV1V0YWFFbmVuNkJISXJ1U0k3VS9l?=
 =?utf-8?B?T2hUeXJmRkd1MDZHQzEzQ0tOdXJtR3IveHVzRkpJZGlVKzhFdGx1bitHTjBQ?=
 =?utf-8?B?eXk0M3c5VWl2R0xlOU9OV3Qxdlh3NFFINTNTcFlCdGdXMmsvRHJTWEhMRHk5?=
 =?utf-8?B?b1JCUm1FTHo4MkduVDRuMjhZb1BxL3NiR0JwYU1HYmFKWVVFejNXL2IyUkZa?=
 =?utf-8?B?M1piOHhtM3QvWW1MTTFQZEUwNHZrNlFtRlJyRWQ1TW12SXFPZ0V6eGVCOWNP?=
 =?utf-8?B?RHZpZ1ZEZVAzbDkwMy9vWlBPRzlIUDBXSFNpQWRmZ1R3WUlBdDlMUGFKNVph?=
 =?utf-8?B?RWQ2VlB0RlJuMG5sQmZjeW9jbmZVZEpBTVdmRTBsN2hrczJrTEFKSjk5NnZi?=
 =?utf-8?B?Rno0VEVvK0ZycDVwejdUUHhVWmRuRXlWWk5WZWwxZXUzWWdzaHBITkhpdXZB?=
 =?utf-8?B?TFNDNDdUYjI5K2t1QVluTXZNTmpScXVIeW1KVnRGTXd0RkN3YUlTRnZEY2Qw?=
 =?utf-8?B?RHdETk5iNmlhdHkzc1lZaWN2Rzg0dHhOVDNOVnRJZUljVHFUWTBiNy9USVdP?=
 =?utf-8?B?WHBaNmk4SVNxVXhrOWF5a2g0SlRnZ0lhWUx5SG1EUkV1dHRRZG1IU3Fvd3o1?=
 =?utf-8?B?ajh5SU1GL3ZOdXYrYjUwRWlhYzdUa0pjL1haM3ArajlrZElaL1R1dTJLSjYr?=
 =?utf-8?B?a0tVVEJpdDFxcEl0MUEvWVBGRWVpVGlkL09rRFltUjZDbEUxS1IyL3owRXdX?=
 =?utf-8?B?bzkxQ1ptMFJ6clRmRmV4aVJnYlZWMXpqcFhiaHpTUDdyNnRmZFFoNkllenU5?=
 =?utf-8?B?UnZHeThwc01YR09ud1RkUXB4OE1tTzRjSCtVNS8xVitYWFR5eVk4SUhaVUlN?=
 =?utf-8?B?WUlBcFhDRGhYeDFBMStwOHcxYzBlL2lHUGs0aEVSNDREOGlCVkFQQ3UwYjZE?=
 =?utf-8?Q?8Nb79AKZRPNkwOozp9mZyWgrO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1337ea6d-6fad-40fb-1a60-08dae33cdc82
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 10:19:36.4653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HeJGDwIzppcKoylXObznqj0tX9+G2E9/gOAjfP2eZDSMVlPUpXQ2HBuJEMhOqEV94AQtslIuqAn8AfLL8K5Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9214

On 19.12.2022 07:34, Xenia Ragiadakou wrote:
> The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver code
> and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
> xen/drivers/passthrough/x86/hvm.c.
> 
> Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.
> 
> Since the funcion is hvm specific, move its declaration from xen/iommu.h
> to asm/hvm/io.h.

While everything else looks good here, I question this part: The function
is both HVM- and IOMMU-specific. However, by moving the definition ...

> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> 
> I was not sure how to handle the copyright. I assume that I have to
> retain the copyright of Weidong Han <weidong.han@intel.com>, right?
> 
>  xen/arch/x86/include/asm/hvm/io.h        |  1 +
>  xen/drivers/passthrough/vtd/x86/Makefile |  1 -
>  xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
>  xen/drivers/passthrough/x86/hvm.c        | 42 ++++++++++++++++

... here, you don't need a declaration anymore anyway - the function can
simply become static then, as its only caller lives in this very file.

Jan


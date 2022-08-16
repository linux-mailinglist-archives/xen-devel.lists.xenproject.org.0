Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109159526E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 08:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387952.624440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNptp-0002TA-AG; Tue, 16 Aug 2022 06:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387952.624440; Tue, 16 Aug 2022 06:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNptp-0002Q7-7J; Tue, 16 Aug 2022 06:18:01 +0000
Received: by outflank-mailman (input) for mailman id 387952;
 Tue, 16 Aug 2022 06:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNptn-0002Q1-EF
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 06:17:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb240f7-1d2b-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 08:17:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9348.eurprd04.prod.outlook.com (2603:10a6:10:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 06:17:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 06:17:55 +0000
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
X-Inumbo-ID: 2bb240f7-1d2b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9+vKFhjMfvZaRxm63F7NdabuUVesMDRYjCmwwk4yIOV4PYnT8VrOGyN8tgxNV78clhu4g8iLzsMPetJpsQIdbBQcS7Zh6BUSoEGRDRXfhK858btlfI6RVktRifZgDNBM9amxjThvJ6VfslCuGJDZJCb6/wYo32wnAWXt7ASWNTcyqcnCNPiisk9GpqChu0EQx3M4zd+bxV+z239jpDmlXl/szLhXqrSQZKCFHWXT49HpLAyl8NLfWqfheNNBJEBh4fdDaqHwk1IgGb27qwNOVoHdBPX29YaNw62HLI/FGqZhyPrYZLWu4Arahup5Ono36Wnh2TtJLTsr2kcGOo0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg1nc8Vxhrav+E32B41nXHMmgHFlzcbFB8HRSv+ChRI=;
 b=UJte+aICcjBEsartQVXbnfnE1HKWyXM6wdQ5S2OL1y3fl3A3IxNJnvB27iPPrsP5Xkys5/smlMjCJOp5fH3YhfnF2IYkWLEkMFuOzKquTFQFFb7P293j9H5aVxOhPp+evrzb6xqOFFYGT9E/ZEIrR11IEiNjPKVxkMQi00i9CSTVxbmmaLY+mX+0p4vilxMDu3eOhH0TIjXEBRI5XRywZPXxUT3/K6EBI6N6Rrat7Vz5VopPEWmSHceICrHrIyUSTzqoKWyNsXyHJimjD4brXT8CK3iE2xqLE77XwkpBc88qTKHdlOysufDOGdiPUjHapX9EwSSuOSm//FCWNLA+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg1nc8Vxhrav+E32B41nXHMmgHFlzcbFB8HRSv+ChRI=;
 b=Ic7/taIdJsZNmM3f36l3ZtA3/gleDYtcKlzu2QFXBh61tMJ4kXvEL7ZBGxGr6TzfsFEUB5QInEWmX0614lWlnbl5DAhDdak4C17KyGzfAtW7nhSaTcBt7Rt9NRtPjPtNjXsSYonfftOpfQd9Avw5EOlRn74ltkeUs/IegnHl/x6y79mcaanHBPljxFdGY0qYID9D+sJhqfN2WuwOYW1CZZfo3wg4671u8f3CFyFfrIK4Nig15WQZz/dUqKQ/NIV+hq/fTxbqvr3klxI2Uj2Qh6K0MrVsn8ffDu2tWpV5Q1QAzQ9iAk3CSFG5wi1+pzaE1zsOIKRt4n6VSDSDDM/chA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d844e18-c1f0-ddf3-6e6c-28b3ba09b427@suse.com>
Date: Tue, 16 Aug 2022 08:17:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
 <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
 <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
 <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78744f28-63dd-4550-0810-08da7f4f0eb4
X-MS-TrafficTypeDiagnostic: DU0PR04MB9348:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GdADdsdJ5giWaOUbaFT3b7pOwpHKrDFEDy/R1iDWJiQC1h8JzoOq0fUbkg/FZ9gm0XGDXPhapKMv7LO9zkpGjdSYGfwxx+xiKHeNC6bYJkoLSw+GGjNYhkbUbcuvl7poKk21im0E8AdOfPxVRI/hMClCq+VNN+EPNZOKdLym0ojwwwaDFy9Yp2KpOUem3vvzdDmfWy8RxZV5pg6ya9qXkO9oMjo9L60x+faXdRpYjEvWF2UEIrf0TjOwQ02bQ2Xq05Jf14WuecqqPQjGu/HKLkFFT0Q26LOIv43GcY/Wh8njo6OxeAiJ4K/+4Es5u7QAVbQ9WBq1wCJedPVniVoISFm9UIahRWlHlOZyeipKAG4Powc1BKw3LO4emgNeHhOKn6Qa6qlrY3QZgs9Qso/Bg8PRkoIyYV6mzw5xsAyD3pLg0zRBdK93uNXZy3SmoSESqnbzBOJeBjVCR9nBZXbqb5zXSDnzdp7by3TgEat2xBvKhvDCXu5CsDiVGRfLtVVgdERied3bp9w0rlXzR4nXjOnsF8L8l/AmIDOU7eUrpk9kC5ui1BHF7optCw+sDOSmnDIqvdKAW/pq0egfW4fj6spaJw4hAnz8HexOLvyaNmExGiCkdINmo9O/SFg+0GU/oOUuydqz6cdmSXMzA7ITWvPqaxYh1DRnSl38+LNH9LvHO+/Yz8o358bwCX9OJCojauz4pQ4k1uWb+GFJfm5AWd8ug6T6cIaErPd2+pDN4u141M698mmoRruZTmDdHbOhPJUDBbsyDjM2D4mrWdwQd6TOmBqFG9aJvFXEpLWCT3IgsHswMQalCWDwT/rcvSggbjoNuSpVZEOiuLFqzWycKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(346002)(39860400002)(376002)(6916009)(54906003)(8936002)(66946007)(316002)(478600001)(6486002)(66556008)(86362001)(66476007)(31696002)(8676002)(4326008)(26005)(6512007)(186003)(2616005)(53546011)(41300700001)(5660300002)(6506007)(4744005)(38100700002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGpUb0JhTVAxWFNSU2xkN2VEa0VkSENYMUZ6MVVlZURpNG16T0JGMzJZczk2?=
 =?utf-8?B?VUNVbjJIcnhaUG8wMUxHMDM5bzRzQktYYWlUcW4wemZZNlpMSjl2Ui9qTzNN?=
 =?utf-8?B?OE1pcGNYdjJReDdyZTZyNUx0SDd6ek1rb1A0R3JWZEtueFU1YVEwdjhtZjZV?=
 =?utf-8?B?aHFXdHJoa2NWQmU2bHlwZHIrdlQ2YXMwYXVsQm1odml1Q0NnejVEVktJVWhN?=
 =?utf-8?B?emJ2Nlh2OUdPemo3WVluQ21XWWU4eFc2UHdwYU5Jc2lYdFFSUTRwNmFuSHZW?=
 =?utf-8?B?YVRaYmxtZXhhanBRRllDYlZ0Mm1Lb0tKaVRXMkNrMHYycmZ5YlB1bnMwRzhU?=
 =?utf-8?B?YmVxMjFCcFd5ZDN1UGhuSE0zekZZS0NITldvN05jSTNQamVXcTZTRE9Xb1Ay?=
 =?utf-8?B?V0JIdzRkWG42Tm9MUXdGTWR3NE83VlVMR3Q2SmMzdlZ4RFJhVk9IR2lZOGJk?=
 =?utf-8?B?Nk8xYWttV1RmL3JuekhvM2U3T0ZpdFl6eWRSQ1lNdlJzem1CQXZyZUw3cDRK?=
 =?utf-8?B?eTdhNHFjY243MUxhZ05mZDBrMCtsL0VWV1VXWDBkcUZNbWJ2L3BjcW04bStt?=
 =?utf-8?B?VHZsRnBETkM1Zktua0hkbHdnRHo4S0tkMzNFZmx6ZFF3ZHgxNmNxSWpleTVy?=
 =?utf-8?B?bml1V0ZtSXUvbEhWU0pEdWlGU3N4NXl2WTZDQngwZ3pTU0VmNFN3ZkJoSFB3?=
 =?utf-8?B?OERQS0NEbERydTN6V2RiY3A0bzVZSWhZak9ZY1VNZWI1UW9TTEU5M2IrNGR1?=
 =?utf-8?B?MG1CNlRkOUF4SDFRMytJTE11TWNJbzRpTzk0YU1JUFlpOFNpdlljWjNYdUJP?=
 =?utf-8?B?enNLTVQ4YzAzZ3pmWFhoQWFCNVpEUnVSdFc4TVJLZEdENWxRQ2VQL1VaYlVp?=
 =?utf-8?B?MXkxa0tRem85QzRoa0pTT3VaS1BxOVZXV3VCUGtJMTNIWjdkOGRkRVRmVTZO?=
 =?utf-8?B?MzZJSTNsQlQxTjIrYWpXcHlyaWpqYzF6RURXd0cwMHFlTGkrWXRlUVZZTlZz?=
 =?utf-8?B?QTgvalgwUjl3OThxQ1pjMkg4TmJCbUlQUGxJUTJ2Qy9TL04rRzlkU0FGelVH?=
 =?utf-8?B?bk9meGFJM1ZYeS9yMkVGSVpINTdLSFpIazQ4UjM0eHFPNnVDTSsrR3FKSFVy?=
 =?utf-8?B?Z0hHalpJL0NOcWxZRG1SWFQzcVVtM1c2UkFLeTRDOXlDU3E0cCt0Wko4NDJH?=
 =?utf-8?B?ZDc3dFdEZGdFY2xhWUFheHpNQk1XYmI4S0lBMlpXUXVZemNaVG9Rb1c1aU1y?=
 =?utf-8?B?dVRBdTlzL3VRZG1abmxRSkpXakpJTU9EMENSQzhaZmpCckh4L0pXdW5EWGRU?=
 =?utf-8?B?dTZlbkNkMFpTZTFqVEh1aVQ4UjJCZmg1K3pkaFhwYTBtK3dvaTFiSU5taXh0?=
 =?utf-8?B?UU1Ka081bEN2ODJUZThtVWdmZ1RIL1lHdVFZUHNmS01CWXUyLzBWK0NZL3Ft?=
 =?utf-8?B?TU1Xd1FFblphMUwwUWxubm9VNnlLRnhvTFE5Q1dnTlBsaCtieFhkN2JVQUlG?=
 =?utf-8?B?S1RBR25YYkZxL0tIMjJYM01vSy93SkwrYjRlcE5Vem9zTXpvUXdiSGNubGtn?=
 =?utf-8?B?WkI1ODQwdlkzcmhiY0ZYNktTN3ZrLzdvK01LS2VjbjFoOTdxN2NseVQzQnV3?=
 =?utf-8?B?RU5MZ0xmYjZkd0p2cVhRY083UGc4c2YrNEtKRlBrVlhpa29Bd3FQYitqVzZT?=
 =?utf-8?B?bC9uamUyTzlpZWV3UUI3UzVWRC9XaFNPWGNuUC9RNkdjNENqYmhKdUFIajlp?=
 =?utf-8?B?TE1KbGtObGZHb09wN3hYcnh0TXd2d2g4cjlCMndTd1Y1NHU1Q210Qm5MU244?=
 =?utf-8?B?S2xtaVBXTTh3SkkrRW9SZHFWc2h2OGE2bE5TRmVGbUVLdjBHeFZ4dUpZQWdS?=
 =?utf-8?B?R005T2FUUm8yQVdOeDQzQ3lBdkNHdUNOU3pWV00zamwzWXVqZDdxOVZ5R05m?=
 =?utf-8?B?bU5qN3I4eUgwQ2VDMmc1dXN6cytyZ2xnekhDZDBOV2dsRWRIRkhQcWc1WnNC?=
 =?utf-8?B?UGk4aWZQRittaTNCekhQN0xvaW9nazd2WGpac3VrSVdEL3Fvc3RoMkVjWExr?=
 =?utf-8?B?STRYMHpKM3VueXQwalNSeGRvQ05yQmZPL3dUNDcyeXBHazYyaGVrZkdkVmFQ?=
 =?utf-8?Q?Fi7akqeFJY+1kwlp+RoG9d/zS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78744f28-63dd-4550-0810-08da7f4f0eb4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 06:17:55.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/HNlRCPv7y3YZANvZe5SRBYTW+j0McDI56ipKhA7t8kSoJ1ONauMQno8mIXom1KwwL+m+QMtduQ9QfIl/AAnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9348

On 15.08.2022 18:54, Dylanger Daly wrote:
> Please see the attached dom0 dmesg log, verbose lspci output and a tar of all SSDT and DSDT decompiled ACPI tables.
> 
> Please let let me know if I can send anything else

The lspci output reminds me of having forgotten to ask which device it
is that the domain about to be created is being handed. (I can't help
the impression that the issue isn't with the creation of _any_ DomU,
but only with such where some specific device is passed to it.)

Jan


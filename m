Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D608674A221
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 18:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559945.875407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRkn-0003Tc-SW; Thu, 06 Jul 2023 16:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559945.875407; Thu, 06 Jul 2023 16:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRkn-0003Rd-Ph; Thu, 06 Jul 2023 16:22:49 +0000
Received: by outflank-mailman (input) for mailman id 559945;
 Thu, 06 Jul 2023 16:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHRkl-0003RS-FB
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 16:22:47 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a33654-1c19-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 18:22:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 16:22:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 16:22:43 +0000
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
X-Inumbo-ID: 56a33654-1c19-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRwIwElOGE3UXmFigUas2qYOjerWOW3zfaf9WJiRUQLkRf7v++WN4w4l+N30dAMZHZXU57wx2YryND8o5zTQLxEFgtx9LPBLozKej8xWgRfJyLdY2acnkfVTVxMmxJXR12vu1Qj5cGTBa/I5NQYshRV7OqDIdCgV3e41POygSXJJLaAiPljtIG2CI+CmFjrgcItHJRcsiLY62JxAmMIXsMPJdI81tMrAjVblmH+7PS16ePIkcX/HVqMQlmig70omKEDUMoi1rNULW3b+8Sxy1tN6FIDzHHYf8AmzP3CzW4aaz6IvSF7/Ijp757FdtObdh8YkbnHgFFn+YLbGiHNoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VUaRakA8WXAnt74HRa63Lz7G4ULWu80U3CpXtW1wTI=;
 b=nMMKheQggf4TYJkXoiPdxyGYaKXIcxldWORAv9Uv08T3UjmdNVnWdzMXKKyPs0jfZyBw3PmxT1PkfP4Wt6wm1GQ2td46Ex+bXLBKcgcwEv9mZ8se8DwOzqM+LgYEC43TQhgH2Hg0jbHod0bIfpR4S4WMvaS5aePBn6TJjb50YA8fNmTFbtMteXqBxKeLiUIrkL0GivjLyQbDdH0w1onqZwO6oUpvF14JZkxGj8+F0pJ39/VPZ9AkFUyLVfYxAUtwzz40dP0BFcx6nPgE9yiPif9KLj5zv5AmBoUEyz1EF9UmqhgUpKqrg9XJ4x/siuJfnBW2BI4Y/RaGFVrZqDBwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VUaRakA8WXAnt74HRa63Lz7G4ULWu80U3CpXtW1wTI=;
 b=4vJ2q+dq8NPeRgDwUwyW3gCofjinsShGRyYz4EgT528+gYo9gQjJfbS+hQ9UG/ufVRAp0vu6wiDVxX+7eRLx/r0MUfM7IWoircJI7G4ciILiTkaJKgdvcLSZPOEHwT+fQdB/YLMcEcejue3Ri4yEqzNSKYmyS12Of8pjt1yM1dO4B1lL6tWZD9DktGpQWSfJhaiOErPxKoSLpr5deWccRgDS3m2X4hD/FrCLg6jXLZiMD1Pxo+YmhrPdZJJBTrACfpn7xVynq8xqQHk9eJ3s4RvrVeaWl6zNdlLdlnicnT9RVsO/ixOGqW+Q8/qSz1WjKJqoON0PGCZ3nDbC/SZRHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f93f0561-abea-bdae-223e-d69932e435c4@suse.com>
Date: Thu, 6 Jul 2023 18:22:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com>
 <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bddc42-e571-479d-91aa-08db7e3d39b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IQUpe4uvHXZH98kt/BV33jOn2sXk0u2LMa2EBabzTzQhB4YpMhYp3vACW797lFdV+hNI9z5Vpm+EC8voNj+RnJm3vNM8TQy1yQSO7Ex45BKjtFe8B6IGnFTjdgc7yX9W19nhc3fa0W+AsPz37ATyKoDp3Ci8358eK1XEPi34LqJ5J2hK7OHLyX8S9Ow3Fy2g84e0NhytGnxVz+bansJGIrzYZvveQSVEuOGaZQ2EPptlYb7TglBJ1b2iWnCmwgojNKOliyWD0UNa+H902LiPutmsVdYTqHB6dazjWGw4QBBy3Orm83GB4o2Eydy3JmcbkF1nGwB8jCh9zsduYiJWBfGJsZyYjq51Zd+uSNtap/hpNwKmZ3pDD5jM5gOe7fYpd86TXlQlbw1ZcVcXuogRbwmYCznlFH5qvTZNI5q2kLPWaNKOVhcEgn+BxdttdVi4Lcrolg1+kyKJftknQcXx0+OfY4dxtyeq3RPoG9jtCbL7OaAOTapEkuOp5riUVHLgBE7Iuhh/qUJdgE3m6bZgedSzfr6sQZ3Mg9RWdHkTnuTk7a7j47IjTD4KDxdYwzUd4LJULqKOZs4+tA4ElAxkVKlRJmkC9iTr7unLCzr8V4mq8gBZmgLIC07/O9Id7cbAESOY2ubFaVHgfByRmCuR2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(31686004)(7416002)(8936002)(8676002)(5660300002)(4744005)(41300700001)(83380400001)(316002)(2906002)(2616005)(66946007)(38100700002)(6916009)(4326008)(66556008)(66476007)(86362001)(186003)(53546011)(26005)(478600001)(6506007)(6486002)(54906003)(31696002)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzR6OGZodXZ0c1BNYWduSTQvTkhITkZTQm9GMjBJQ3dpWk50Yy9rY20yQXBo?=
 =?utf-8?B?ZHFKU2k4QnBBVnZEMlJsMmVHVWpZSFNLTXhyUGJKanZxaUlJOUc5UHpQTHI0?=
 =?utf-8?B?c29zRVBibmFFZGdZMXJiL3JyRmVDVk9ibi9lTkVNQ0gwSjJpbGNxWm9MSVFD?=
 =?utf-8?B?NHNFL0hYTVo5WklBSkdhY1pBLzU3aGVyV041eGZ6K3RLc3ZMT0xvTWZlbWlv?=
 =?utf-8?B?WlljdmxieVpmc0gvaUJxTmJCdXQrbVZJbnIxQTR4b2JXaCs4T2p3WXZpUE40?=
 =?utf-8?B?LzVkamsweFYvUTFwblFMMHlCUDVoaU1wS1JRdHQ5clBoWGFKS2ZqMko0L3pM?=
 =?utf-8?B?aWVrRDJsanNhbXM1TVg1QXhMSVNjby9TUnl2QVpPaGZzYVVaNHc3aDlsVUsz?=
 =?utf-8?B?bmJrSkF0ZG8zQ3BxRGJaUTBVM0x2bndxSTU0QVg3ZGxOakZOeGZnTkFBK3lM?=
 =?utf-8?B?UVJ5N1hhVTdwNTJmVmZmc3FZLzZGenFycGJnNm5GSEgzdmdqWDFQajNMdFh1?=
 =?utf-8?B?Wk9lR3Z0UG9mNXRNamo2UFEwNUs0NldUNllSZWw1TlVRRndlYjlVNmRRaXFY?=
 =?utf-8?B?RU9mb09NVWFaYjduU1lBTWZzdFpwMXExSlZuYUlHNlR2MjFXS3RSRjk1TVgr?=
 =?utf-8?B?dWRzcjl4cW04YlU4ZTlKbXY1UHdDN0wvZUppZmU1NGVYbkdhSS9NYUVlYXgv?=
 =?utf-8?B?N1pVSEFmVXNwN1E4YS80VlRxRlVZVWZCTC9odDVmZUFQQnVyQWdhblJJUWlS?=
 =?utf-8?B?b1BLS3Mxb24ySlFHa2w4Q01abTd6RThOTk5aQU56R2dXeU9FOW0wSC9sWVU0?=
 =?utf-8?B?dlVrZDlLVVNkbHdFOHYrSTI2c2NIVjVjdzlLRWVtZ1JObGM3b051aEs2Z1FX?=
 =?utf-8?B?NHFCV3Q2WEx2Sk14WUJWSlViSTF6eGZjdjlOWXNQdXB2R3hiUGZ3UWJvS3Ni?=
 =?utf-8?B?RG1XQjZLZnpSNVZ3TzZyNjI5Z2JuRFIyV3RTaFVleTk1YzhmSnFaOFF1Q0hE?=
 =?utf-8?B?aUNtTGFNc1p6TVpOWG5wYjhVMWFmUUZBMmEvUzZJYWZTUmpJL3FUczl1NGhK?=
 =?utf-8?B?TnVZZVNIZlpqS2FiaFpFR2ZhdkYreFp6L2w0dDEvZkVDamxzRnJ6WEM4Vk5O?=
 =?utf-8?B?S1FXNGt5QXl1c1Fhdjc1RFBhdDVPWFBFd0I3RVRRU3R0MXZHczl3TitPUDZH?=
 =?utf-8?B?RTNuVTJXRWdPTUgvTENwRTFhb1I2aUdvZTRTQk1JOUhRaXkrSFNZMzlDSjFo?=
 =?utf-8?B?TUNCc1UxRERvR1NqUmJLNUc1UGVCR0dLUkJTNTR6WW05WFlDK0xHbndDWlNW?=
 =?utf-8?B?eStqaTRTTWVXQk53VHF0UGlWZGRMQjQyK2pkR2JGbjZ4OFA2eUt4Y2ZZcC9q?=
 =?utf-8?B?dW5ISExjQjZYOGJBUkk5WjVTdEUzbFlwb21kZ2dESzVEVjdDbzNtYktRWU9M?=
 =?utf-8?B?YzFodnhaR3JuQ3RuZjZiZUtQYjFUQnltS09zYjBlMWE3OVR4YjRRMEVZVUYy?=
 =?utf-8?B?UXVvZ0xwbG9lY1l4ODA3MUs2TVRzRUx3ajNUQUF5REN5NGtOVG1SREpLZ3Vz?=
 =?utf-8?B?S1hoUmZiTlIyQjlIMkxTaHBZQ01LbmxCS0thWUpLL1BrQ29zTW5XdE9GaDdQ?=
 =?utf-8?B?YmlqVXY2NjI1ZjFlZ2U4SXJXMEcrcWFUYitNYm9GUTNWcUZ5M1VPeHhOaXNV?=
 =?utf-8?B?WVRiTE8yUkpxR1BjMWQ4eThhbkxyY3JvVnRzUUJFMVA0SW01VTlBcXlzazYy?=
 =?utf-8?B?M2tGbTI2ZnJTclhKNWc4NTdkRFpWN0k4SEN6Zm1UNkhNdFpNSWJtTVNhZmlW?=
 =?utf-8?B?Mi8wQm1BYWVFRkozdERmMXRkYlM0M0o0RW5iNVQ1enhoYVByQllCS3J0UTBO?=
 =?utf-8?B?VzlKaisyQWdET2ZBSUl1VDErMUpyVWJWaFpqOHcxYW5OcDFreC8xS2VXYnRj?=
 =?utf-8?B?bzdJZnVvcm1EMHlkRjRBYVBhSS9vMFVKRUpVWUN5ODRGTU1zaUl1TkdBQTRS?=
 =?utf-8?B?QWh5bEUvbUNyRDJJdHd1MjJPVzVXbGdzemFGM0twa09FVDRJcUlrQml5Z3BZ?=
 =?utf-8?B?V1JDWmJTdUowL1J5NUMxVEMrYUE4NEhJbWo4Z3RrbmFmcTR1RU5WeS9SdnBB?=
 =?utf-8?Q?vMvuuHjHJRNbVwctlGQhiDapT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bddc42-e571-479d-91aa-08db7e3d39b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 16:22:43.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: US64W9akg0GzjWgQj4FDuyfA/eQZ36UWoJAe6THCX0ArQPuARO0wTHXxxOdOKmnTkHNZuqFqduRb6SAusc9zMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852

On 06.07.2023 18:08, Simone Ballarin wrote:
> Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com> ha
> scritto:
> 
>> On 05.07.2023 17:26, Simone Ballarin wrote:
>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
>>>       * Setup the APIC counter to maximum. There is no way the lapic
>>>       * can underflow in the 100ms detection time frame.
>>>       */
>>> -    __setup_APIC_LVTT(0xffffffff);
>>> +    __setup_APIC_LVTT(0xffffffffU);
>>
>> While making the change less mechanical, we want to consider to switch
>> to ~0 in this and similar cases.
>>
> 
> Changing ~0U is more than not mechanical: it is possibly dangerous.
> The resulting value could be different depending on the architecture,
> I prefer to not make such kind of changes in a MISRA-related patch.

What do you mean by "depending on the architecture", when this is
x86-only code _and_ you can check what type parameter the called
function has?

Jan


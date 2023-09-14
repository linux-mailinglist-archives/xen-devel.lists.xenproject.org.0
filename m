Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82927A0550
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 15:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602282.938754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmDB-0008Px-2z; Thu, 14 Sep 2023 13:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602282.938754; Thu, 14 Sep 2023 13:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmDA-0008NT-VO; Thu, 14 Sep 2023 13:16:48 +0000
Received: by outflank-mailman (input) for mailman id 602282;
 Thu, 14 Sep 2023 13:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgmDA-00083p-5z
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 13:16:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f513fdf0-5300-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 15:16:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 13:16:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 13:16:45 +0000
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
X-Inumbo-ID: f513fdf0-5300-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6KayIP37OtNpUOq6NVdew0silm5dPN0mpOsEbLw/iFt0ygXv6xzm8DPnOABIPgg47vgu4eB4VQA/MjiiyZ0JLSwy/inE0GYBV1eUuhCWeFegWLmZs+ElcrOi86qSHah713jWDzAVzXgMfHMIhZrfNHVv9y9huJ3RUuzg0hZEqw84Otpa/WjtfeP0Y962aGf24/4hoZ/lqmE+Cbc9Td7TTkH3aOHpgbAtKGw4aO9z6C4o32R4xtLzVJZp5V+azQbyNAsaHSdu+P5xrAQYGDVzSqhn3zp/Nj1R5oU03t7I3/mUmqcAQo0N3FWKyamAxiRoMXvzqN6S/lF/L/ZuieJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0p/Dk2DcL9FWyyySG3xslDv5FAY0u93sukfF6dDUBY=;
 b=Iu/D+mNQ+eG8jtRniAbPKsyb+zPkYs6jqfuKAUHFKn7t2h1MA84G9w3l77LvBz1LTqulva6UX4SMXyF2y/3jrfJUNf5zjq3eZLXkQngueAhcJkpgx2a1caYDljqiRE83y0ki3WVfQpXeHfv2mQPn7kWj56ZO2Iqv9Ay9dgJRZZmRjkCjN/bpJNmwH03mY4VT7YLvLHuJvBzbF0sRc5iYHSxTsOoFEWvD6IyddB56ZfwvbgTHvvYtmOW7oBqGBn+VOqiATxy/Seua3ed60NhPKbNvFItuO1j4KiruGnTcIqGuDevipJvRfZrbdLzZt6agCkWtJrWTK+mx2xuaUqssEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0p/Dk2DcL9FWyyySG3xslDv5FAY0u93sukfF6dDUBY=;
 b=YMrv3yj49GC/1t5ahM9scHWzLNEjRxbOQd25K/LMj6sMRL8kzV2/ba7u1yTN0bGMx7AsOD/KJcqCVW/5qnYbmC9776JxGNyj5alQ4HpoqKSR6Wvj8lxpdV/73rqXQ8BrlB6SOg9MNP2k8uGGbWBnUcLyWMwC8VnNg8kb1IiJ5PwXApTxt8NduQLWQ7kVK9lZOz0yAJgyope0kmnN1J4RNAWMagsbX8D90LGbywop3Y98Hn/uxPfL79JIaSkYYTKVVX4OF8PrSWJcZkf5M8gGvOOx0ES0ZF22WbgCdBzwCZ3VznZQPLYzSXgHj2CAaQSguUkTdQ2tkWsMh3z84Lk3fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b791d74-636e-6f79-2918-4bceda1905e0@suse.com>
Date: Thu, 14 Sep 2023 15:16:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Sol=c3=a8ne_Rapenne?= <solene@openbsd.org>,
 xen-devel@lists.xenproject.org
References: <20230913145220.11334-1-roger.pau@citrix.com>
 <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
 <ZQL-p3LJX7WfwCtC@MacBook-MacBook-Pro-de-Roger.local>
 <e8859459-53dd-aa02-b776-ba4052c7ffff@suse.com>
 <ZQMDOwGGNJVnjFEm@MacBook-MacBook-Pro-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQMDOwGGNJVnjFEm@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c15b67d-9301-40d5-98f0-08dbb524d7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VHpUMqjcZKw121u74ZBX1ZAgUd9S9ZohiwzmX8/nveoYxBVojLLSdeHQ5Q59ygBuDGYtM2pQfUq8GtFjmxdsLHEgeWOcPrrESgPEESTG+gPbNm+W1Sg9xKROXkIhG/vANvQHCe+qZ2Nx8nPuvYhQXPRFoQV9MG6u8+9jPyCb1WH1Ysqx58ojpK+n7rVBrrJmwE26oHwGDMvKsH5H28MQitsWMvmy7s3hwfSIwxaG9M7jd2rvqJYfIZokXN7FEOh0RzHtKM6eDoMU8yGCg8azNzMROd00BnqrDtGxwUy8HzAmWdByP3vfmFoS5LdTB6/t23DFMDQXNJrvPMJqlt/k9mr4ktR2GrLxgHyGUl/O42wnFK3SpcacMlggDFrNJnm1w/UsZcngQnuW7KhWOges+zsujH21s47FKqGctMldcikOPwSOqOKsR+Q7Oale9De/sbvd9TKVt5LbPaNCLYq+rNyHkjdYTr1QLiYwZCNICi2orKnXXv1b931sMC3GHi1IvszQrxOnVc2yWe1TJ22B8ymM6Fqc6BlbZiBjiV/qmVisUTK1RV1WT/8gX1G+G0hjP0ptQuX3cx2/lcU2VAEpVvrs4p7CaUUReV8RfPJIDyQRccg7skD9v2vEhzRogQcRVbNpql2HKfIhmtL9nqnlJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199024)(1800799009)(186009)(2906002)(31696002)(38100700002)(36756003)(86362001)(4326008)(41300700001)(316002)(6512007)(8676002)(8936002)(6486002)(6666004)(66946007)(66476007)(54906003)(6506007)(53546011)(2616005)(6916009)(66556008)(31686004)(478600001)(83380400001)(5660300002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWozc1NIbnJOWGNvM2xReHpLTFRLLzhMSUdITzFyaDVSWkx1YWJ0b0FaVDlF?=
 =?utf-8?B?dWlQZzdWazdDWjZ0TUlUZTJzUmFxTDBTcU9FeTV2QTlLK0Jhd3VIMVlvR2tK?=
 =?utf-8?B?NWhySHM4YVlpek5KU0dqUWNFLzdjeU5zQ3pDNUl1ZDg4T3FCVE5RaEdqOWMx?=
 =?utf-8?B?dWQ0RmdYRFZVRHlDVEJXYmtWNDUxUkorRkhBdzNhTWNNTFdZcUV6NDNDWnBq?=
 =?utf-8?B?bXJtTzZTd3Nwek55ZEtpaDRrR0hFMU13emtPb1lwcTI4NUV2clJ6RVE5WjBj?=
 =?utf-8?B?U09COWhTYjdVZUNub0dWWW1UenVCd2FrQ1RHbEp6VitINHAvSEF6d01JZzdN?=
 =?utf-8?B?SVpkVzQ3MXRNRE5WaWhkOEdpcGFXZkR4bjAwS1BoS0ZIZ1FCdlA2Slhad3VG?=
 =?utf-8?B?U1N3eTRtN1FXWEhkYXpTRzhST0svWFlGc0NyNjBNcklxY00zemhtdkk3TWM0?=
 =?utf-8?B?aFhKOHFNMFVRL0JRYk9GY3ZnUmhPLzczR3JmczFBWVBBUUttZytkRDE5QStz?=
 =?utf-8?B?aWlKdEZyc29MKzZKKzQzZHRUaWxDZS80b1piTzYrOE1PQVNJRjNzL2hMSEQy?=
 =?utf-8?B?YXV3UFVPOWRsanVMc1lHZnArb3UrSElOdERVMkJkUmo0V0MvZjVLOW9GM3NC?=
 =?utf-8?B?bzB3ZG04TEtEaEE1Y2FwdS9GODViWWx4M0NIb1pqV2U3SUJLQlMwQXdYVTU5?=
 =?utf-8?B?anl6bFQra25ncUkrL0NEMHF2cDFjMFpYVGR1Y0xpbitxeHJyNDZjazNMSEo1?=
 =?utf-8?B?YlgxTERiNDB1SzQ2VXpaY3Q5Y0t0TE9VZGtjdWEyZFh3SEtSMmtwYTZ5alV3?=
 =?utf-8?B?cUhVK2lHZlhDWEw3UFB4eGJQNlpnZVlzdkJPR203SmhOT2tKeGVUSzlBaHhD?=
 =?utf-8?B?QTRPTnNRVjdKYkptdk84ME9Cc2NIRndKNFRBNDhWdGtwMkg3RmtMbis5ckYy?=
 =?utf-8?B?TUlNcVFjRkhuT0NvVUZ6RFBRWlhpZjJFcHRCWHJRYk1HaVNValM0MmkwMCsr?=
 =?utf-8?B?ZER0czlONHRQTmdXUGUwR1lzVVBGVDF6bU1rQU1vc2FlUkxONGNMRmtXUDBS?=
 =?utf-8?B?NDg1QTJWbUJTaWlEbVExQm5IdG55MjlsOWpMZ0E1WmpONXpWV3NsV1BvdnZm?=
 =?utf-8?B?VmlWTG1xeVBZTEpsbnR2Sjlna1B0QS90b1FuU2N6OHVLSmpWT1AwbnVDcFFV?=
 =?utf-8?B?WWVWZXBOdmZaTm0veVliejFENHFGOWRTUk1KMUNZMlEydkpCdU5JNUlNMSs4?=
 =?utf-8?B?N1ZMREpHKzZmTzNYOUhGYnNQUzNLSjc5blFGZ0JWc0F2RFB4WSs2NmMyU3Rv?=
 =?utf-8?B?eCtIY0dHdHBxVVBpZzdJbWxTLzNYaE0zMmR0RXowS0VqOEk0UDdjY0FQK29o?=
 =?utf-8?B?YjlzNENpM3FBQnpGSjRlN1VhcEQ5RzZDWlJGWkpIUjQ3ek1BSVZkb2dNblFr?=
 =?utf-8?B?c2lWeHVvMG5vM3AwR1BvQkxhR3pmbkhtVXZPelhOU2RFcWxXY2VIMG1nV1d0?=
 =?utf-8?B?ejk1emYxTlB2dHhoSEFSaHA5RG1Id1lDT0QybWZvdm54U2lzSmV1S21XLzdj?=
 =?utf-8?B?U1BpTnhYNnl4L2w3YllDWTR6NGlTY29vOUZNcWM4Sm1tQ1BKYmNyYmZSYzU4?=
 =?utf-8?B?NHVHZmtyZmtRbGlhQy9KWTJkOHgrUGN2NEg5eHFZZ2d6UmlacWtxVEJGM0Fn?=
 =?utf-8?B?WGpLU2gyK3oxZGdnUnh1S29YdUs1eVFTTkJsN1lkYW5WeVlPcE5tT01XY0tR?=
 =?utf-8?B?cyt6cVI4VHhYYWhqRnJqUWtxZlJXQkVzQTE0a2V5OVd2QXp6YVl2WnBNcjI0?=
 =?utf-8?B?a3gvOWt4N1lqcUozczJuQXJ1K3hmNmxmSkQ2bG9rWUQveU9KODl6eFRpUmF2?=
 =?utf-8?B?RFY3Vlp0TW1kdHJ3bUpIanVyVnVBQzRYR3dkeFoxUFVIcDF5d2NlR1VZOWxR?=
 =?utf-8?B?UHFKVzJSb2lqLytOb3hWSVJDL0xUYVFieEZGQjcveUgwdnNRVzNORGxtZXBO?=
 =?utf-8?B?ejBSR3JXazZYekloeXppU2NwUENNZ2h3dWZ4c2x2MFIvTjNCS1didWZFUGov?=
 =?utf-8?B?MWNISHVIRk9xK3pTYS9laUwvRXBFL1dPOGkxK0tNU2o0TFUyZ3FLZUx2clJY?=
 =?utf-8?Q?HJe2NqaQagO/ieBVzYJihw6VO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c15b67d-9301-40d5-98f0-08dbb524d7fe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 13:16:45.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDA4HZSXLKh6Kq4OqMxtZR410hj8/mUqa3SU+SeVUDXiAKxsoHoguREdwEKlqSRSSXAACZP8MCh95b623FwwLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9738

On 14.09.2023 14:57, Roger Pau Monné wrote:
> On Thu, Sep 14, 2023 at 02:49:45PM +0200, Jan Beulich wrote:
>> On 14.09.2023 14:37, Roger Pau Monné wrote:
>>> On Thu, Sep 14, 2023 at 07:52:33AM +0200, Jan Beulich wrote:
>>>> On 13.09.2023 16:52, Roger Pau Monne wrote:
>>>>> OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
>>>>> Invariant, and it will then attempt to also unconditionally access PSTATE0 if
>>>>> HWCR.TscFreqSel is set (currently the case on Xen).
>>>>>
>>>>> The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
>>>>> the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
>>>>> TSC increments at the P0 frequency.
>>>>>
>>>>> Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
>>>>> because the PstateEn bit is read-write, and OSes could legitimately attempt to
>>>>> set PstateEn=1 which Xen couldn't handle.
>>>>>
>>>>> In order to fix expose an empty HWCR, which is an architectural MSR and so must
>>>>> be accessible.
>>>>>
>>>>> Note it was not safe to expose the TscFreqSel bit because it is not
>>>>> architectural, and could change meaning between models.
>>>>
>>>> This imo wants (or even needs) extending to address the aspect of then
>>>> exposing, on newer families, a r/o bit with the wrong value.
>>>
>>> We could always be exposing bits with the wrong values on newer
>>> (unreleased?) families, I'm not sure why it needs explicit mentioning
>>> here.
>>
>> Hmm, yes, that's one way to look at things. Yet exposing plain zero is
>> pretty clearly not within spec here,
> 
> As I understand it, the fact that HWCR.TscFreqSel is read-only doesn't
> exclude the possibility of it changing using other means (iow: we
> should consider that a write to a different register could have the
> side effect of toggling the bit).
> 
> The PPR I'm reading doesn't mention that the bit must be 1, just that
> it's 1 on reset and read-only.

Sure; the PPR being incomplete doesn't help here. My interpretation, based
on the bit having been r/w in earlier families, is that AMD wanted to retain
its meaning without allowing it to be configurable anymore. Possibly a sign
of it remaining so going forward.

Jan


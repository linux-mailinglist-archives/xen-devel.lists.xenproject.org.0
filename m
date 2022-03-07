Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05A4CFD29
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285864.485133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBi9-0001Qg-G2; Mon, 07 Mar 2022 11:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285864.485133; Mon, 07 Mar 2022 11:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBi9-0001Nx-Cy; Mon, 07 Mar 2022 11:39:33 +0000
Received: by outflank-mailman (input) for mailman id 285864;
 Mon, 07 Mar 2022 11:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/EJ7=TS=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nRBi7-0001Nr-Lk
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:39:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f339476-9e0b-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 12:39:28 +0100 (CET)
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com (2603:10a6:20b:88::11)
 by DB7PR03MB4507.eurprd03.prod.outlook.com (2603:10a6:10:13::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 11:39:24 +0000
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d]) by AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 11:39:24 +0000
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
X-Inumbo-ID: 3f339476-9e0b-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGpdivGnmw0q5IKQgqRhXpgag81F8OXYxLfbSTaLjlTm3gBGyXRi7ScR20gaWci1CGykCqZh3hZCOSbr3DRHeEvTLi6EaXyBVNnmrx0FFiOcw+bfw4XdlJJNiJpFZojRNrmpnlHoFJ+l5r1GD2ANiF0lCj/LAhZSTHhmio7Xug1gOSdtFzZsIExlsuTWpUA1hBqqCxdL0dWSnITDaj/A+UaFCVwi0OdqQ/us4hZ7PGBfbp45NXUHr699wSysXkPxRI87U2lUt8F4xEdJtrYgeFNtwnvpFHfJjvVuP6/3mbZ+2OLLi5uV1Rdml2ntQqCprlRM/9WuWyTXkbVpAS21cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9vq27DMxWML12du5uN59XinDWxYicu43CCMny+ntBU=;
 b=eGbSBehb1/4cD3uyTpPUiMZb28WpwDNTCszehW3zOvs3xSG3bDmBu7k3i2JlcDbWeJLbZ2zTRTMWsQVfLird3hozOpdouzG0O06S2YdZLqLF+GjdzLgw6zkOgsMvB7GREsE0v47Zs+fcJWKoeXAQkmNgqVTwkrRvXYohvKlDFxGAftE0moF3QALOSoGriwd0Gn7k7LMHvYL6+56WitEpKMWiZBkCL2pjO8FJfflAFVpJpGaJJF49k/8SvcFDD0r1Ko0HlKk5StJ36CNlcZjimWes+D9eRCpOfRNGcOpQ1eOEdYfBg4AkU8FcoKyX8bT+kejQpiWi3oagMID9Zi48Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9vq27DMxWML12du5uN59XinDWxYicu43CCMny+ntBU=;
 b=Ud/mZ3584L4YE4/rmD3+A44w5wAZn1rcvFckLMzjzox/Oa8wbrL0lZQP8wXeTYVqrKdjNBEp+mOHL4w3b0PZrrFtliiJXuebFMnchuii+NMNX2r+sBcOmS1RTBLUl59JzpTg6hjki2FX/XfQrY0vmNvocpaKIFYgJvDjKWRIzjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
Date: Mon, 7 Mar 2022 12:39:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Network driver domain broken
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <YiXq5HIrvZsy7QKU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::23) To AM6PR03MB5000.eurprd03.prod.outlook.com
 (2603:10a6:20b:88::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 907feb88-745f-4790-111a-08da002f20a9
X-MS-TrafficTypeDiagnostic: DB7PR03MB4507:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR03MB45077A78C4B97C9EFBDEC1B298089@DB7PR03MB4507.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tMAUTMABxThOztaX8TZI5c5Yf4xLYQU8zSz35bZUkq5GikRGmDx5uhvVYfSy+WzpmHr8Pk9UWU/o1sOvEhz7PVCNX1zVF3oetf8SNwEcZwK6qO26WfjadYsg6PB+zDULyNa44OutcW1nhQgbXI8RZkUtvh8u4je7WvUjMM8VUUAS2tz0+WZMzMJNAoImDEsu9dDKv4QutcF0m1tljJGooW6y81MuSSd3XdlN+lkEadVVNbBHJ9p3j5wCScrBwemELl9qneaGaApA5Fc4B+94F+ylmmsf88C0pgG2nbmy+r0hUthC1bInkDCSEO0XTdDPL3BkfrRnIdaQNRy4fWnLUXfF9xnlX+vrq97u0iwm4NOsDxd4yKoWdL8tVbH1vV14XJudtfumbEsg48QGgpd2NyFpSfP1KoY/tbNSCdUkfjm0PB6BezdZv8ejEGS8NxcyTKJzqQbXvWfDLkcIO4FZRKe5QtFO4f1QT8Vlwqv4pmhtLEOEf5IBXoZTVXZaYJg7CJUiH8y+9TzFRtc0T25ZnYQtvGz1mDJrDAcBBgEex1+jG/unvvfuyw6PX4eb5BS4upKF4bxl/xSVKuYpiez6Tc6yMPTi1KOeLXyjTXzJHkXBH/TSljintDEdgmDQ3jEmpKSpKu0msYSAnnarCgPXSkLUEox2djlXo/Wfp18mLN5VspiwN4wzz5ixldDgC8+yg1eG//2R0vLhHId9RqKdqP8YceRAyE5EKi19/hU8V9m8mRTgmNn5ZX5JWpDN8yTTVFff6j3ZSzinXsGW0YcmsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5000.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(31696002)(786003)(86362001)(6486002)(4326008)(36756003)(83380400001)(52116002)(53546011)(54906003)(186003)(26005)(3480700007)(6916009)(31686004)(6506007)(30864003)(38100700002)(38350700002)(66476007)(8936002)(316002)(66946007)(66556008)(5660300002)(8676002)(6512007)(2906002)(2616005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzJZK1V3RVV2dldldUZyTFJNTlRpYUMxZ0RJb211cFlRRUFEbXpKdndaWUFi?=
 =?utf-8?B?MllBZ05Jd3VGWUJqZ3BacXJ1d1o1dmVMRzJTRnY1WjNZSDhXbDlsWXdvbjl3?=
 =?utf-8?B?T1FROTFJYUZxbU90U1dacEo2dmQ2SHE2WVVOOWFoeFJPdHpzeU8yWXkxNHdL?=
 =?utf-8?B?TDlJUFRFenora3ZOSGlhUXlwNkY3LzFMM2NKTU1rQWV3RTdnSVBzMytmRVcy?=
 =?utf-8?B?anRXdm4yWUxJdUN1UTMvTGNEZWlpWjd1aHNVSEhCd2RFY3lpTmdJYnZ0bkNT?=
 =?utf-8?B?b0V4aGdaem0rbm9sdHA5S2t2ME50Vkh3aW1NeWovbHNIbnBBeVViR1FabFY1?=
 =?utf-8?B?akZmZ256a1VHUUNubW5RTHRFaE1HY2FBYmRMdUdoOXpZcGtLeU5OMjBoc1hP?=
 =?utf-8?B?d3pkKzFGVEpQNFFCRXlzaklmVHg3OXp6dW1xbU9aenlDaVhOWEF6cXBEbWQ0?=
 =?utf-8?B?NS9uVGdFdEN6Y2YvV2dmdzJkeU5uYUlXUHY1SExQWGpnb3h6RkZtWlArR1lJ?=
 =?utf-8?B?N2tjTGlhQ3VTZGo5bGpvRkx5by9sVVBlQlRLdDBVd2FTLzllbndleDZWbU9S?=
 =?utf-8?B?QXRkRXhkQVRGU2wzcVdXRllZSTZWMy9GMXA1c0x4aFh4d3ovRjAxd20zakFZ?=
 =?utf-8?B?YVRKZ3J2ckVEVU84RzkyWXV0dmc0K1R3VEUwWEJ4Z0owQXlsUmxpTWxITXJE?=
 =?utf-8?B?ZFpNVXdqWEVNa1ZaQTdsSVBMMzdJRURwQWo4SENCSDBMNHQzTkhuVlFzSlRw?=
 =?utf-8?B?SDRhQWlsT2dVTW9iOEwxdWlibWxyM0E5TUZ0MkJnNUM1ekVoYVJxYzFYcnM5?=
 =?utf-8?B?REJpWFRXQlg0RkRNTjc5U05wbC9RL3V1ajNFRlRWeitXT2lUUUdhV3E1bDBE?=
 =?utf-8?B?Q3lETHlGSzVzZlEwVURuZ0Y0K1NlR3VDQXFmenBTWUh5UzJ2a01WNlhGbExZ?=
 =?utf-8?B?TlJZZVFNWUJFMHYxZTlKUkY5L0FObzc3a2toN285U2FpSlN4UU50bSt5akhs?=
 =?utf-8?B?U1RYbXVibVVjSm1MMW14TkVBa1c2clFQZzIreWZKd2ZRNlozY0t4ZW9UKzQ4?=
 =?utf-8?B?b0NoQXFtMEdRdlo4QUN5ZlhoSlAveXRMT3dSY05rN1B2RkhEcURHUUR0ZXhY?=
 =?utf-8?B?cm9ZdDRuUEc0VVJmVWF2S0NJQUlmQ05LdkxhUkUwZHh5M2d3bit6VU40T0xH?=
 =?utf-8?B?US9SSTNIaGJrZ2V3dnRxY21xaVMvWFppOXFJa0RsOFZsNHAwdDJYWWJXSXh4?=
 =?utf-8?B?QWR6YWVqc2p0VXlhTGxtZHg2ZzlVU05FMXdoclRXQmVKWUNCbHFNY0VoTlY3?=
 =?utf-8?B?TTRwcTRoT3VwV0RBcnR6eUJvOG1tQmZxbmJtWjFCdHIyWWhnWGRRRG51YTY2?=
 =?utf-8?B?bnF0RGpDWWJCc2hmdmp1S0ZtVjMxL3VjbXk4ZU1qQ3VRNGNaWUtXa1J1Z21Z?=
 =?utf-8?B?RU4yVU00WHJ5QmwyRDJqb1YyTFVCZkxOb2VvbENsVWxhWmZEYnAwaDhIT0hS?=
 =?utf-8?B?dWZacHJNbUh6R05MSnNuVFR4L1BkclZ3SFFMYk1sMC94QVpLZVlMWmE0cnlJ?=
 =?utf-8?B?aGNRcVk3a3VvMkl1U2tKUDRJdXpUT3loK3o2NFZKTDlMWlo2V1Q5Rmg1NC9T?=
 =?utf-8?B?ZHAvc2FqRlZIdjBjWHo2aHkrNVo3aUYvdnBxMGRtSkJaaFo4dzdGRVRKWnRs?=
 =?utf-8?B?aTkvcnBGckJueWQ1dzZXVGhJMjFGaVRsRGgxWkk4bVRqRXVlbE1rTmlMNy8y?=
 =?utf-8?B?QUxUSnQ4QU04Z3dtSjhFOVl3TTJJRXhRTVhSOXp2Z241UkV1SDFTK2ZDR00z?=
 =?utf-8?B?WFRGVEZVWXEwVUNjcWdjakZmY0hvV080ZklhdUZtaUFiMXJ1YTI0VzZ1SWZM?=
 =?utf-8?B?RUVoaWcwaXc4elBxQ0tBb0wxN2NCRzJJa3ppcHB0NGI1eXYxbWdYWmlhSlZU?=
 =?utf-8?B?N0c0VHNIOEpnNHQ2bDlGWVB0ckR4MTdFcURqRVFNVUF1RmFIcVlnSVYrOVQz?=
 =?utf-8?B?eUlRdWdMUnRndmpTcHRhalpuR08yK2dxeG9zY01zY0xSaUU5VmlDOUxsQk5X?=
 =?utf-8?B?aUNJaG8rOFdIY0tmTGZwdlpweEs2ZTA2OWkzTFpYMmFhRm5iMXhQYW9mSk1o?=
 =?utf-8?B?ak16U0tCTi9CcEtXYnc1NTlRam1uK1gvTCtJUTgxU0NTcEo1UFR4eGxZVGk5?=
 =?utf-8?B?MSsyY2EzM2lPRE1ML3FiV3g3Z0ZzaEM4d251eUtWRU5HOE5EWE44T3EyYnE0?=
 =?utf-8?B?K3RBQU1CNmdxQ2hMdS9wWThvMlFDOEFFajc4a3pJNFBpN3BIVkxrZmlkRk0r?=
 =?utf-8?B?dkt3R2YxY1BURlFpZUFLTi9lbEtNdFNydEF4VHQrYi9FSDM3cnlQdz09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 907feb88-745f-4790-111a-08da002f20a9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5000.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 11:39:24.0103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMQwbSF5xDDfWbyXRP6ueY1bWz+c9BaWytfAxPlctneHFX73l82CqphRS1SCuO/Kd7sZwVpBx5Z+UTWjpjkvtxTgNQKIqDvIXv9xfi//6GNKY8BbSs00I6/zzNMvD4SS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4507

On 3/7/22 12:22, Roger Pau Monné wrote:
> On Fri, Mar 04, 2022 at 02:46:37PM +0100, Andrea Stevanato wrote:
>> On 3/4/2022 1:27 PM, Roger Pau Monné wrote:
>>> On Fri, Mar 04, 2022 at 01:05:55PM +0100, Andrea Stevanato wrote:
>>>> On 3/4/2022 12:52 PM, Roger Pau Monné wrote:
>>>>> On Thu, Mar 03, 2022 at 01:08:31PM -0500, Jason Andryuk wrote:
>>>>>> On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>>>
>>>>>>> On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
>>>>>>>> On 03/03/2022 15:54, Andrea Stevanato wrote:
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
>>>>>>>>>
>>>>>>>>> What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
>>>>>>>>>
>>>>>>>>> name    = "guest0"
>>>>>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>>>>>> memory  = 1024 vcpus   = 2
>>>>>>>>> driver_domain = 1
>>>>>>>>>
>>>>>>>>> On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
>>>>>>>>> While the second guest has been started with the following cfg:
>>>>>>>>>
>>>>>>>>> name    = "guest1"
>>>>>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>>>>>> memory  = 1024 vcpus   = 2
>>>>>>>>> vcpus   = 2
>>>>>>>>> vif = [ 'bridge=xenbr0, backend=guest0' ]
>>>>>>>>>
>>>>>>>>> Follows the result of strace xl devd:
>>>>>>>>>
>>>>>>>>> # strace xl devd
>>>>>>>>> execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
>>>>>>
>>>>>>>>> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
>>>>>>>>> write(2, "libxl: ", 7libxl: )                  = 7
>>>>>>>>> write(2, "error: ", 7error: )                  = 7
>>>>>>>>> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
>>>>>>>>> write(2, "\n", 1
>>>>>>>>> )                       = 1
>>>>>>>>> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
>>>>>>>>> wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
>>>>>>>>> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
>>>>>>
>>>>>> xl devd is daemonizing, but strace is only following the first
>>>>>> process.  Use `strace xl devd -F` to prevent the daemonizing (or
>>>>>> `strace -f xl devd` to follow children).
>>>>>
>>>>> Or as a first step try to see what kind of messages you get from `xl
>>>>> devd -F` when trying to attach a device using the driver domain.
>>>>
>>>> Nothing has changed. On guest0 (the driver domain):
>>>>
>>>> # xl devd -F
>>>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>>>> the maximum number of cpus
>>>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>>>> the maximum number of cpus
>>>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>>>> the maximum number of cpus
>>>> [  696.805619] xenbr0: port 1(vif2.0) entered blocking state
>>>> [  696.810334] xenbr0: port 1(vif2.0) entered disabled state
>>>> [  696.824518] device vif2.0 entered promiscuous mode
>>>
>>> Can you use `xl -vvv devd -F` here?
>>
>> # xl -vvv devd -F
>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>> the maximum number of cpus
>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>> the maximum number of cpus
>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>> the maximum number of cpus
>> libxl: debug: libxl_device.c:1749:libxl_device_events_handler: ao
>> 0xaaaaece52130: create: how=(nil) callback=(nil) poller=0xaaaaece52430
>> libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
>> w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: register slotnum=3
>> libxl: debug: libxl_device.c:1806:libxl_device_events_handler: ao
>> 0xaaaaece52130: inprogress: poller=0xaaaaece52430, flags=i
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece51b90:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece51b90:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4e7b0:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e7b0:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4e990:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e990:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/frontend
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4eaa0:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4eaa0:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/frontend-id
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4ebb0:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4ebb0:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/online
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52830:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_device.c:1714:backend_watch_callback: Domain 2:Added
>> domain to the list of active guests
>> libxl: debug: libxl_device.c:1569:add_device: Domain 2:Added device
>> /local/domain/1/backend/vif/2/0 to the list of active devices
>> libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
>> w=0xaaaaece52a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1:
>> register slotnum=2
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/state
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52d50:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/script
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52f30:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece52f30:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/mac
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/bridge
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/handle
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/type
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-sg
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-sg
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110:
>> destroy
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8
>> wpath=/local/domain/1/backend token=3/0: event
>> epath=/local/domain/1/backend/vif/2/0/state
>> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110:
>> nested ao, parent 0xaaaaece52130
>> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10
>> wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event
>> epath=/local/domain/1/backend/vif/2/0/state
>> libxl: debug: libxl_event.c:1055:devstate_callback: backend
>> /local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 5
> 
> There's something wrong with the negotiation between the frontend and
> the backend AFAICT. The backed switches to state 5 and 6 (Closed) so
> the connection cannot be established.
> 
> Can you paste the output of `xenstore-ls -fp` from dom0 after `xl
> devd` reports the timeout?

# xenstore-ls -fp
/tool = ""   (n0)
/tool/xenstored = ""   (n0)
/local = ""   (n0)
/local/domain = ""   (n0)
/local/domain/0 = ""   (n0)
/local/domain/0/control = ""   (n0)
/local/domain/0/control/feature-poweroff = "1"   (n0)
/local/domain/0/control/feature-reboot = "1"   (n0)
/local/domain/0/domid = "0"   (n0)
/local/domain/0/name = "Domain-0"   (n0)
/local/domain/0/device-model = ""   (n0)
/local/domain/0/device-model/0 = ""   (n0)
/local/domain/0/device-model/0/backends = ""   (n0)
/local/domain/0/device-model/0/backends/console = ""   (n0,n0)
/local/domain/0/device-model/0/backends/vkbd = ""   (n0,n0)
/local/domain/0/device-model/0/backends/9pfs = ""   (n0,n0)
/local/domain/0/device-model/0/backends/vfb = ""   (n0,n0)
/local/domain/0/device-model/0/backends/qnic = ""   (n0,n0)
/local/domain/0/device-model/0/state = "running"   (n0)
/local/domain/0/backend = ""   (n0)
/local/domain/0/backend/console = ""   (n0)
/local/domain/0/backend/console/1 = ""   (n0)
/local/domain/0/backend/console/1/0 = ""   (n0,r1)
/local/domain/0/backend/console/1/0/frontend = "/local/domain/1/console" 
   (n0,r1)
/local/domain/0/backend/console/1/0/frontend-id = "1"   (n0,r1)
/local/domain/0/backend/console/1/0/online = "1"   (n0,r1)
/local/domain/0/backend/console/1/0/state = "1"   (n0,r1)
/local/domain/0/backend/console/1/0/protocol = "vt100"   (n0,r1)
/local/domain/0/backend/console/2 = ""   (n0)
/local/domain/0/backend/console/2/0 = ""   (n0,r2)
/local/domain/0/backend/console/2/0/frontend = "/local/domain/2/console" 
   (n0,r2)
/local/domain/0/backend/console/2/0/frontend-id = "2"   (n0,r2)
/local/domain/0/backend/console/2/0/online = "1"   (n0,r2)
/local/domain/0/backend/console/2/0/state = "1"   (n0,r2)
/local/domain/0/backend/console/2/0/protocol = "vt100"   (n0,r2)
/local/domain/1 = ""   (n0,r1)
/local/domain/1/vm = "/vm/cd36b881-cd46-4de7-a59b-7d173198862e"   (n0,r1)
/local/domain/1/name = "guest0"   (n0,r1)
/local/domain/1/cpu = ""   (n0,r1)
/local/domain/1/cpu/0 = ""   (n0,r1)
/local/domain/1/cpu/0/availability = "online"   (n0,r1)
/local/domain/1/cpu/1 = ""   (n0,r1)
/local/domain/1/cpu/1/availability = "online"   (n0,r1)
/local/domain/1/memory = ""   (n0,r1)
/local/domain/1/memory/static-max = "1048576"   (n0,r1)
/local/domain/1/memory/target = "1048577"   (n0,r1)
/local/domain/1/memory/videoram = "-1"   (n0,r1)
/local/domain/1/device = ""   (n0,r1)
/local/domain/1/device/suspend = ""   (n0,r1)
/local/domain/1/device/suspend/event-channel = ""   (n1)
/local/domain/1/control = ""   (n0,r1)
/local/domain/1/control/shutdown = ""   (n1)
/local/domain/1/control/feature-poweroff = "1"   (n1)
/local/domain/1/control/feature-reboot = "1"   (n1)
/local/domain/1/control/feature-suspend = ""   (n1)
/local/domain/1/control/sysrq = ""   (n1)
/local/domain/1/control/platform-feature-multiprocessor-suspend = "1" 
(n0,r1)
/local/domain/1/control/platform-feature-xs_reset_watches = "1"   (n0,r1)
/local/domain/1/data = ""   (n1)
/local/domain/1/drivers = ""   (n1)
/local/domain/1/feature = ""   (n1)
/local/domain/1/attr = ""   (n1)
/local/domain/1/error = ""   (n1)
/local/domain/1/libxl = ""   (n1)
/local/domain/1/device-model = ""   (n1)
/local/domain/1/domid = "1"   (n0,r1)
/local/domain/1/store = ""   (n0,r1)
/local/domain/1/store/port = "1"   (n0,r1)
/local/domain/1/store/ring-ref = "233473"   (n0,r1)
/local/domain/1/console = ""   (n0,r1)
/local/domain/1/console/backend = "/local/domain/0/backend/console/1/0" 
   (n0,r1)
/local/domain/1/console/backend-id = "0"   (n1,r0)
/local/domain/1/console/limit = "1048576"   (n0,r1)
/local/domain/1/console/type = "xenconsoled"   (n0,r1)
/local/domain/1/console/output = "pty"   (n0,r1)
/local/domain/1/console/tty = "/dev/pts/0"   (n0,r1)
/local/domain/1/console/port = "2"   (n0,r1)
/local/domain/1/console/ring-ref = "233472"   (n0,r1)
/local/domain/1/backend = ""   (n0,r1)
/local/domain/1/backend/vif = ""   (n0,r1)
/local/domain/1/backend/vif/2 = ""   (n0,r1)
/local/domain/1/backend/vif/2/0 = ""   (n1,r2)
/local/domain/1/backend/vif/2/0/frontend = 
"/local/domain/2/device/vif/0"   (n1,r2)
/local/domain/1/backend/vif/2/0/frontend-id = "2"   (n1,r2)
/local/domain/1/backend/vif/2/0/online = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/state = "6"   (n1,r2)
/local/domain/1/backend/vif/2/0/script = "/etc/xen/scripts/vif-bridge" 
  (n1,r2)
/local/domain/1/backend/vif/2/0/mac = "00:16:3e:07:df:91"   (n1,r2)
/local/domain/1/backend/vif/2/0/bridge = "xenbr1"   (n1,r2)
/local/domain/1/backend/vif/2/0/handle = "0"   (n1,r2)
/local/domain/1/backend/vif/2/0/type = "vif"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-sg = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-gso-tcpv4 = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-gso-tcpv6 = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-rx-copy = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-xdp-headroom = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-rx-flip = "0"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-multicast-control = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control = "1" 
   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-split-event-channels = "1"   (n1,r2)
/local/domain/1/backend/vif/2/0/multi-queue-max-queues = "2"   (n1,r2)
/local/domain/1/backend/vif/2/0/feature-ctrl-ring = "1"   (n1,r2)
/local/domain/2 = ""   (n0,r2)
/local/domain/2/vm = "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
/local/domain/2/name = "guest1"   (n0,r2)
/local/domain/2/cpu = ""   (n0,r2)
/local/domain/2/cpu/0 = ""   (n0,r2)
/local/domain/2/cpu/0/availability = "online"   (n0,r2)
/local/domain/2/cpu/1 = ""   (n0,r2)
/local/domain/2/cpu/1/availability = "online"   (n0,r2)
/local/domain/2/memory = ""   (n0,r2)
/local/domain/2/memory/static-max = "1048576"   (n0,r2)
/local/domain/2/memory/target = "1048577"   (n0,r2)
/local/domain/2/memory/videoram = "-1"   (n0,r2)
/local/domain/2/device = ""   (n0,r2)
/local/domain/2/device/suspend = ""   (n0,r2)
/local/domain/2/device/suspend/event-channel = ""   (n2)
/local/domain/2/device/vif = ""   (n0,r2)
/local/domain/2/device/vif/0 = ""   (n2,r1)
/local/domain/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0" 
   (n2,r1)
/local/domain/2/device/vif/0/backend-id = "1"   (n2,r1)
/local/domain/2/device/vif/0/state = "6"   (n2,r1)
/local/domain/2/device/vif/0/handle = "0"   (n2,r1)
/local/domain/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n2,r1)
/local/domain/2/device/vif/0/xdp-headroom = "0"   (n2,r1)
/local/domain/2/control = ""   (n0,r2)
/local/domain/2/control/shutdown = ""   (n2)
/local/domain/2/control/feature-poweroff = "1"   (n2)
/local/domain/2/control/feature-reboot = "1"   (n2)
/local/domain/2/control/feature-suspend = ""   (n2)
/local/domain/2/control/sysrq = ""   (n2)
/local/domain/2/control/platform-feature-multiprocessor-suspend = "1" 
(n0,r2)
/local/domain/2/control/platform-feature-xs_reset_watches = "1"   (n0,r2)
/local/domain/2/data = ""   (n2)
/local/domain/2/drivers = ""   (n2)
/local/domain/2/feature = ""   (n2)
/local/domain/2/attr = ""   (n2)
/local/domain/2/error = ""   (n2)
/local/domain/2/error/device = ""   (n2)
/local/domain/2/error/device/vif = ""   (n2)
/local/domain/2/error/device/vif/0 = ""   (n2)
/local/domain/2/error/device/vif/0/error = "1 allocating event channel" 
   (n2)
/local/domain/2/domid = "2"   (n0,r2)
/local/domain/2/store = ""   (n0,r2)
/local/domain/2/store/port = "1"   (n0,r2)
/local/domain/2/store/ring-ref = "233473"   (n0,r2)
/local/domain/2/console = ""   (n0,r2)
/local/domain/2/console/backend = "/local/domain/0/backend/console/2/0" 
   (n0,r2)
/local/domain/2/console/backend-id = "0"   (n2,r0)
/local/domain/2/console/limit = "1048576"   (n0,r2)
/local/domain/2/console/type = "xenconsoled"   (n0,r2)
/local/domain/2/console/output = "pty"   (n0,r2)
/local/domain/2/console/tty = "/dev/pts/3"   (n0,r2)
/local/domain/2/console/port = "2"   (n0,r2)
/local/domain/2/console/ring-ref = "233472"   (n0,r2)
/vm = ""   (n0)
/vm/cd36b881-cd46-4de7-a59b-7d173198862e = ""   (n0,r1)
/vm/cd36b881-cd46-4de7-a59b-7d173198862e/name = "guest0"   (n0,r1)
/vm/cd36b881-cd46-4de7-a59b-7d173198862e/uuid = 
"cd36b881-cd46-4de7-a59b-7d173198862e"   (n0,r1)
/vm/cd36b881-cd46-4de7-a59b-7d173198862e/start_time = "1646643480.69" 
(n0,r1)
/vm/f6dca20a-54bb-43af-9a62-67c55cb75708 = ""   (n0,r2)
/vm/f6dca20a-54bb-43af-9a62-67c55cb75708/name = "guest1"   (n0,r2)
/vm/f6dca20a-54bb-43af-9a62-67c55cb75708/uuid = 
"f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
/vm/f6dca20a-54bb-43af-9a62-67c55cb75708/start_time = "1646644038.80" 
(n0,r2)
/libxl = ""   (n0)
/libxl/1 = ""   (n0)
/libxl/1/device = ""   (n0)
/libxl/1/device/console = ""   (n0)
/libxl/1/device/console/0 = ""   (n0)
/libxl/1/device/console/0/frontend = "/local/domain/1/console"   (n0)
/libxl/1/device/console/0/backend = 
"/local/domain/0/backend/console/1/0"   (n0)
/libxl/1/device/console/0/frontend-id = "1"   (n0)
/libxl/1/device/console/0/online = "1"   (n0)
/libxl/1/device/console/0/state = "1"   (n0)
/libxl/1/device/console/0/protocol = "vt100"   (n0)
/libxl/1/type = "pvh"   (n0)
/libxl/1/dm-version = "qemu_xen"   (n0)
/libxl/2 = ""   (n0)
/libxl/2/device = ""   (n0)
/libxl/2/device/console = ""   (n0)
/libxl/2/device/console/0 = ""   (n0)
/libxl/2/device/console/0/frontend = "/local/domain/2/console"   (n0)
/libxl/2/device/console/0/backend = 
"/local/domain/0/backend/console/2/0"   (n0)
/libxl/2/device/console/0/frontend-id = "2"   (n0)
/libxl/2/device/console/0/online = "1"   (n0)
/libxl/2/device/console/0/state = "1"   (n0)
/libxl/2/device/console/0/protocol = "vt100"   (n0)
/libxl/2/device/vif = ""   (n0)
/libxl/2/device/vif/0 = ""   (n0)
/libxl/2/device/vif/0/frontend = "/local/domain/2/device/vif/0"   (n0)
/libxl/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0"   (n0)
/libxl/2/device/vif/0/frontend-id = "2"   (n0)
/libxl/2/device/vif/0/online = "1"   (n0)
/libxl/2/device/vif/0/state = "1"   (n0)
/libxl/2/device/vif/0/script = "/etc/xen/scripts/vif-bridge"   (n0)
/libxl/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n0)
/libxl/2/device/vif/0/bridge = "xenbr1"   (n0)
/libxl/2/device/vif/0/handle = "0"   (n0)
/libxl/2/device/vif/0/type = "vif"   (n0)
/libxl/2/type = "pvh"   (n0)
/libxl/2/dm-version = "qemu_xen"   (n0)

> What OS/versions are you using for the guest and the driver domain, do
> you have any local modifications?

I'm using the same OS for everything: dom0 and guestX. It is petalinux 
2021.2.

> Regards, Roger.

Cheers,
Andrea


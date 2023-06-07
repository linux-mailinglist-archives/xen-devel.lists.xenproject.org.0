Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4121725705
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544452.850240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oFr-0005El-Sl; Wed, 07 Jun 2023 08:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544452.850240; Wed, 07 Jun 2023 08:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oFr-0005CM-Pn; Wed, 07 Jun 2023 08:10:55 +0000
Received: by outflank-mailman (input) for mailman id 544452;
 Wed, 07 Jun 2023 08:10:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6oFq-0005CG-95
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:10:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d22bf7d1-050a-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 10:10:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7981.eurprd04.prod.outlook.com (2603:10a6:102:c0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 08:10:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:10:49 +0000
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
X-Inumbo-ID: d22bf7d1-050a-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ5XbWa3mqX3u/aflwr0x6Ri3xwhHf46qelthap06K8hTcao9Cehq+og/6AeHhedbov+85c6hwGxXBw5MOCzcBOawWdMmkpDIluYSttXwovLMUNtue2pkX3X0/qPzNl02dYPoTn1mKgihRumSIY6yVI4yqcySp+FpmNMBSwpS9J3461IC8W0yEa48o2yTtVyblVLt+ULiD8G0PWNIAv/+msYA9pa9+xBBnrsXH+G/TeUaY2QiD7pesNC7FLBG7znjS4Mn4ZXKLxTi9KxkoyVK8YpKjwCIU4lOM4xWJ9mE3KFm7dLWIoNPaB7fgSc0/g7hHEYiCQqFaXRvDXSoTQJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rts7tco3YKsPHk9pqM0ENIs+7VFWwdimW9K3bGzOssc=;
 b=JwYxY9PCzjoK/hCKi3U4BB9I+WsU26c5k93pOak2HIJPBOcGpmRJLOp0EnqH1/+eiByVlO/xU9NtjGWjVC1l3CKzTcrnegsPbldDEJeMfggn1j2OvhGV7OS0jhdLrQy8GtLacog70ja/Dl+piz8BiCXXH2WMC+KlhS/+bjHuCAbERbrwC4DexD86wuFMoow1VA+V9F56YNKof3z8uWf6KwvTox7NeoxaO5kbHwxhAajgGAGwnvVYsf2myhM26AMtT2okNHi1fIuwXhQ6xVbCgHCVL2CqB5KoEac2Xxw3uHeX6x5faHhdz6tUZsADArsyiXkeRUuD/KT+w3oz1xXuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rts7tco3YKsPHk9pqM0ENIs+7VFWwdimW9K3bGzOssc=;
 b=DWIUSCRCDOB2jD8KpNREn55lr7KKBsqtq+ztWQ2erQogG3+z34KSqayIVqEjwLKyTKlbZ2K32bBxHyr284k4veD5XNU2nOC9LcMuL3JfcwOi9rY4vowfFvXaL62flX8pAcc+yKgh8/kgRBWKZdyv8nNUQnjkbg51QtQ1Gqwrp87qM+tWxlDJf9BeXZkmyYyhpCv0i5fKjnmGpgnPWqpPlqT7LFoJhtmKCmosyN5UTW4ztbz+tR9PIYZgKEB/uuYhmnbpeR8ykl2keeN1NcE7/o1DABkwtFCLFG6VbcZEwu1DvNZj3wADnoh6OyhjUDlyjLTCky1DomZmYYvydkcaaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f356d3b-7068-088a-a59b-eadbfb3f59cd@suse.com>
Date: Wed, 7 Jun 2023 10:10:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] xen: Fix incorrect taint constant
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4121312e-8175-4a74-e318-08db672eb465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3bv+S4Futx41DPpTDdd9gtDoyweTtE/cmOdArV901DrM6s+ze3wF09fQMvwVAcrjI0anBjJg2n14rD/vsHfGf3UaMbKzjD1H5xBLbccBx/Y0nBKzKg+OgzNHrEWfYvVtjDQgrZgQTR/WDN4tc5LDhZ5ZE5CP22m2/DFcvFcRCUzWZ3vvgzSUyxbAY8ndc6ieHbYNitIVi9OXGnu7SIguLMZXocFu1K6XK+DZV5JRGFD1tMZEkaMp529amU+YFkuYJn05VYdpE/EairTuvoNRx/QorKtszIEpA7ewGDQJtZFjsmB8P7jm4UqO+DKrH8AesOrdfM7NK5AqzjcVgL/JbOA4dOr5uHqEdZF+z+cpPmvoi72r9aksaU0v3X8nmNd3Ldmkg737Lrm0yU8hMi8MIhagkeLQihvrfo14OcUYNeakPLv4Ff+OtNSdTiJF/Ob/EDr+2pSYs1Mty3N6yQhiXgLqFHSrozUILpnMDr/UNEYsZQNrpRXE3AbTxq8jTWmRFLperw2c6KU0yzHzhdzUKRHhHc4DbcjsMGmIC9ZVhco/8ba68Cz6/Hr6CG7AX50zHpJHoMtTpg0VHLKNR5payZAFqXt2T7Sm9Ni+0zLT85ywy4QcX8dOF5NtcjEWAZeVO5u55fXfdATMRVF6Nu8fNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(83380400001)(110136005)(478600001)(54906003)(6486002)(8676002)(8936002)(4326008)(66476007)(316002)(66946007)(66556008)(31696002)(38100700002)(5660300002)(41300700001)(86362001)(6666004)(36756003)(4744005)(2906002)(6512007)(26005)(186003)(6506007)(31686004)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXRUaC9iTzlydENTdS9xeDBTZUplWHlIMGRhSzBSKzZ3a21mUjVPbXd4Rno4?=
 =?utf-8?B?Z0hIZ0k5WHFLdHhLZmtXTTlUUGtCYS83V2l6QTVoSjg5VjBrelhZdW1BZXNX?=
 =?utf-8?B?RDZPNmx2TXhkaEo5TFhJQTFFZ09uYkhUWjJTcVFrenJCcDY0SDJMb09EYmdL?=
 =?utf-8?B?MVZyK1ZUOVlZdlhyV1RtQlNHMmpQMDhnRTdqUkJROE5ET1dsb2RVcDFVejVs?=
 =?utf-8?B?Smwrb0lMZml0a1pjUytwRm44TnlYRGdTUStpc2RnaTNxZ3U4S2RTdytrODg2?=
 =?utf-8?B?WXZSV1YrK1d4R0E5MGFWWnp6Z2NhVGxIQ1pWN010c2w5VEhiOWh6WG92NVZj?=
 =?utf-8?B?T0I4eTJibStiNUJjNUQvTk1BajN0ZERDcFh5RDl4QmNoVjZzeDJ0NS9LeDBa?=
 =?utf-8?B?S1ByRG5SQTdrZUtneDREVkhVU3B3SjhrOVE0dWhnRDJnVWNHSVFqd2VWOWFM?=
 =?utf-8?B?K1J5K2VJcThOS3RKUkhHV2JRUjBTWFNLSEEzcTMydmw1b2JCQ2RiSU9YY2xO?=
 =?utf-8?B?QkcrQzVhS1Ayb3dQN2JDZEhRNzJvWDhsYU9ITVE2YktaZ2gyM3JXNEVGYTZl?=
 =?utf-8?B?UzM4bEt0ZitMRWFMT3FEbU44QUl3dW50RkdRaTNhczlVOFhDS253RlMxd3Rj?=
 =?utf-8?B?QVlyUmNBZXFldDVYY2NPMGxJeXRkTGoxMTNyS0dJNk55ckR1Y2lTL1lSZElp?=
 =?utf-8?B?VHk0Zk5XbjM5bnJwSGo1dHE0ZUlEaVpzL2M3anNQWHQrVVZHUEhkT0V4cmNX?=
 =?utf-8?B?Ty9jajhkVDBOby9wbkZubGl1TEtPb3A0Sy8zM1E3OHdCSGllM0ZwdW5IVjVV?=
 =?utf-8?B?V0QvdGZQVnFrQS9Kcm8wNk5YckZYSVNsSjd6N3FjbjhhRkp4ekJ5Wm5vR1h2?=
 =?utf-8?B?dFVCWXEwenJ3S1JCbnltR0J0VzY5UzU4WWEvcjk1Q1Z0ZEdMbVI5TUJDdzlE?=
 =?utf-8?B?WE5hNExycUhVZ3ZwVVdrRWI1M0VaZHdEZXNSYzVwTDJrUFFXNEdEMjQ4THds?=
 =?utf-8?B?ZUo0aTltUFpPWEhQZEJ1bjdXU2hsTy94TWlINGpHSHhhZkRIYXVpRHFHcDhp?=
 =?utf-8?B?QnArNVkxRzJzZm9SazZ0NEhHKytCNGkrdVc1V0hRQmwvWFlCdjJFMGtNSGx3?=
 =?utf-8?B?RFA3NnhaZUlmSWMvdjJLR1JzNnVma0NBTnRCWjZEY2NRVnkva0hYM0cwWnFl?=
 =?utf-8?B?NDViU0tjM043SVpEcGxRa0tOamd6ZFp4Tm1IQWgrZDlCemtDRGs3STZQcUpB?=
 =?utf-8?B?ajVrRndDdklZSmFaZW9uVS8wMytSemNxTVRBVjRWZzE5WDFyT01QTURMUnVy?=
 =?utf-8?B?QU5zQkt3Qk01RDkxcFRVOW01UzFPNjJwejN2M2N6RDI3T3ZwVTF3NE9IS3Fi?=
 =?utf-8?B?QmVrT052cGs1cE96dkkrcTdRUmRzMVNoNHZ1MUJ2cTdJYWtKMGJ0SGxld2tT?=
 =?utf-8?B?cWtMSkVYRFhYR0h4S2Q1L0FlTUxCNkpaWmJxS3dlbWZHZUd5N3E3RGpyd1U1?=
 =?utf-8?B?V1FjaGwwcEhuU2NBbzdrUDcvSGxjcVI0Z2REbDd3aTRYNWkzYTVVVGR6ckZn?=
 =?utf-8?B?YjZOc2RPQmh0ME1tVEo5ZTY4eEF4Vk5UL0JNTmYrSkEyNW9yUkE3WWNENWI3?=
 =?utf-8?B?ZTB5VzMrMEtWSUQ4MVFjOGc0YldwSkV2eW1kVEZiQ1pvY1ZhY3RxY2ptdWlm?=
 =?utf-8?B?Yzk4WDQrTmZpVFZTSEgrSjVyZm9LOVNQemRlNlQxdURIaEVWcHpzK3BWRXg5?=
 =?utf-8?B?NmpUUjBhbjJNeE1hU2dYLzlHMDRrQ05ENkpLRGRwbEJJRFlIZE02V3RNWXVZ?=
 =?utf-8?B?S0lqTE5UeTUvWGRPcmxhdWM5NzBBcUtJMTRZMnBwV3daTjhQWk5lSDdRUThH?=
 =?utf-8?B?YnhTRWpzQTBFTi8wdzBpU25lMjhXOUo4VmQ5TWUwejFjUFlTWTgxWm8zZUR3?=
 =?utf-8?B?RmkxK0FGTjkvdlkva0lOZmtyelRkSGNzM0RaZm5EYkZTZENXbk1Rb3FtSUJF?=
 =?utf-8?B?YWp4TURmWERQKzFpdStQUUEwTXE0RGhDZWNxNDd6V3hZMjFIL0ZzZEZ6a1lq?=
 =?utf-8?B?Y0VpZHdZaWlUSXhNVzRtb0RpRlFQb3oyb1VEaTUyNWUwT0piQTY2aHhidko3?=
 =?utf-8?Q?Txf+vTrzHUzdxL8njV9ibgFbp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4121312e-8175-4a74-e318-08db672eb465
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:10:49.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdTXQxeY0iR+Y/9wZr/3kR6eOXTUTXDAMLm413TXZxubBUyJY+i19lPSq86uOda4h+rh7lDvpOLjOlGYm/6Myw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7981

On 05.06.2023 13:23, Andrew Cooper wrote:
> v2:
>  * Fix commmit message
>  * Update comment ahead of print_tainted()
>  * Change the emitted char from 'U' to 'I'

Just to mention it: With this additional change I'm no longer
considering this applicable to stable trees. I realize that one could
argue that by taking it we could accelerate learning that we broke
someone (if anyone), but I'm not inclined to follow this line of
thinking. If Arm maintainers (seeing that only Arm uses this right
now) think they want the change nevertheless, I'd include it,
though.

Jan


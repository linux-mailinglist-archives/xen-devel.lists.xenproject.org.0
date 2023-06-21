Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC217737D25
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552523.862650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsx3-0006YF-Rs; Wed, 21 Jun 2023 08:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552523.862650; Wed, 21 Jun 2023 08:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBsx3-0006Vi-Oy; Wed, 21 Jun 2023 08:12:29 +0000
Received: by outflank-mailman (input) for mailman id 552523;
 Wed, 21 Jun 2023 08:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBsx2-0006Va-8C
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 08:12:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b1a3b85-100b-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 10:12:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 08:12:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 08:12:23 +0000
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
X-Inumbo-ID: 5b1a3b85-100b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auZxOgiMUjnIjQgzusKTPK5RTZdYJD4iEYIiL3jRX/cZw2Fvy/4Jmn30zgoec5paPddUseuBycbZEGb/r71n8appKLjjoXSxu5SIgPXvuZJLTCfyn04XTCvEYI075dolfdPI+a9vdrr4E9aC+893girDjzCFNAwvM6mBW37vDxpP1hfP3PTlcKw4XdOn6FuNktz3ncMXClH1YUHxywGSwkhuNQIkDYbm5a2cCru3ih/AFk9etkzdnxQPFJz/zRarcHmeoEitf6B+5sn1gx9+Rtdt3lbg0p3W/LOCaE2k5i95awC3qjHCLI/Xb1/nTqWgR2fMIq0DZsZl/umghKpveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TSEB+/Pdv0sTyLyox8UPTqTzTJf4VZ/f6ToSxlPBXU=;
 b=Z73xezowDKQjgDJoYWiiJ/NG4/mZVa4avZkQbKRFU+gjZNIk2aZnBmTYoW+NWve6DqhTadMmrGL74Ge6z9pIiJyYaKd8C0zM1lfU8Dy1hMIXsTRqUynOF6uEvbOJzdjQdG8ZDJkPt9VZ/xL7JtxsENmPdwy+pxKOYjnSHoTonBBh7yEWu5NC+9oCpJw2WzbF3sOcpY/DsMfw69zaBQMUwibaHVLFBVA4QFmqxkyO+pU+uCdvQvb+cuAiuU0fy58MllLheaYgTS14QIzX+BJ0fGYXuMo1Vln0JxWbX8LM/Jb2llQyb57E+sYegPATzyWw4wAkfOxOHVmlh4DO6EYN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TSEB+/Pdv0sTyLyox8UPTqTzTJf4VZ/f6ToSxlPBXU=;
 b=Isa1gbrPwZJW+WDxhC7oWaBw6YN0H04yOzyt/U9Cq+KNYTsaD+lv91idczyq0T4PJf+DPe3D8RL82W+rxM4SVB4Fva+8N3oQJZ0mc5XMuDkBfEKeXLC6yqEVdWvr2Kkwq0Fc1gNSZvORLRsbeuM9g80hANQjsU1Wdka9m9ScGJNzavpR6F4zPIW1gUNlaME10G/aTB9NgkEJAX44/xHjaPaGo5Udpx4swL+W8X70ZQlUKRGb4sEvpK/9r+xQmChE1e1ZJ5CScQsprVVVfEM8m+DQTEEBSThKyn1R+l6ki3kC+Ly0wlJRP3ixIH258F1bYvGlDOXPU/MM6pTRuMAesg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb76aac5-2246-e425-2e37-adbbdc15c8fe@suse.com>
Date: Wed, 21 Jun 2023 10:12:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 09/15] cpufreq: Export HWP parameters to userspace as
 CPPC
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-10-jandryuk@gmail.com>
 <791bf505-7335-d16d-617d-ec19dc637ea6@suse.com>
 <CAKf6xpvQD+6D76kfFvACkZ7H7=NbY-khxJeTEAGU3dDPwoji-Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvQD+6D76kfFvACkZ7H7=NbY-khxJeTEAGU3dDPwoji-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: d035409f-d06e-44ee-b1c0-08db722f3e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6pyM2Mn8O/R8RaWs6vM5Gk92w/HoQnDZf4fuOK7tISdeR/tGT+6fvHXRKkNmQBKHpbS1Q4k3MKT0NibU2C3LXrdDHq9RFsMXPbWPtmbaQtUPlJ/EaI5GOnndklsJmYYdgd/MdqFAd5r9QrZhxsDDgm2S+2vSp4V1W1/8ZwyoKh4L4Uf9vUasJvRkRCo1ktWPH46EHDIgr3MkskPlUq5edht2/NApMsVRYAvc9KezhiPsWH0c9o0CQaORmC8qwHyzFjuVyFP5OdvbRG2yajdP1tjIGKMNWjZOS+fEjV5399TyZRiHhzooICaKtYVMxii062G+le5FDqXh4rTBd9YXLbKxzco2jqCHV1KBtzzWk1EPSDDahGT5VoPDMhvdbV3XU4jgqswg96/YiMHYtO6qZ50jMBLrwJo3argI2lP3etNVe9tEhWzkwD7pOXdLS8GUydvY3lUsVotTcks4+eWi9KL8N5myx67omA7rJdtya2JdCDOAcB+cHQiHKYU9+kHBqdwx7o3d1P0sC/qDW+KAuxfAF/KGI4GjhiJ3sT+redN5m0twa1STXS5JRnLfClwdGAZynWdic1fsnHnmtVrprvDdgZn2yl07mzWIwmHOnneS6TamBojnq8XjmpbcSUhXj74grADgSJ4T5Hz6qyBiUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199021)(31686004)(2906002)(41300700001)(8936002)(8676002)(5660300002)(316002)(66476007)(66556008)(66946007)(478600001)(54906003)(36756003)(6486002)(86362001)(31696002)(38100700002)(53546011)(6916009)(2616005)(186003)(6512007)(83380400001)(4326008)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1kZk1ZdjRmSHBZb2cyTWtSTVBGbVJvU05IdjI3ZHNCSSs1NytQRmFqbmtJ?=
 =?utf-8?B?K2ZkUzN5QkRKSGJWQjlLbytNajYwcHZ3THNKWTNnOTd3a09SWTdsdmEyZlM2?=
 =?utf-8?B?NlZqSnBidmRvTG4rRmpKTFNFR3htcWR6U250L3NOTlp0bFhyUnlIbEh1N2pG?=
 =?utf-8?B?cEVvYXZsSmJBcEU3RmVxQ3Iyc29ZMGtTZDVqYkF5bFhTRUlLVUdjZVpxUjBy?=
 =?utf-8?B?TEh5MjNOWXhPYVV6dW5aRHhZZW5vb2ZlKzQrWUsvZkhjUENmZy9NdjVPbUJJ?=
 =?utf-8?B?aEFaTlQ2Wjk4cktsQ1JXWDRXKzFub3NEOWU5WGkvSDNWdDhzeHl4aTRpNE1V?=
 =?utf-8?B?OTZ1WnJ5bHd1YkxDczdEamE2eE5QWXZnYXErbGg5Nk9tY3A0N3l4VDlNeFlD?=
 =?utf-8?B?U1lFWUQ2T3h6RUFPTzJ1Wkx5ZTAxQU5lZG81SnZGekQ1VjFUNXovRENUODN5?=
 =?utf-8?B?dktTMkJYWFZVUml6cElMRlJDdXk3bGVJLy8ybThlWjRJczhWUDNTQkVob0hl?=
 =?utf-8?B?UVlIeWVycmdBdWo1dE1DSEtIdHBNdzlPK2ZSZ0NyVnk4UUhvWU1qTFpWaHJZ?=
 =?utf-8?B?VzJjeVdJL3NzbEJjVTZLcWJWMXlwRXpEZHY3VWJVN2pQWTdLeGhxZ3Qzamkx?=
 =?utf-8?B?WW5oalFNNEpwZFI1ZU85MGFYTmhQTm52Rk5DdWQ2TEF2OUhuMGNtajRreUVU?=
 =?utf-8?B?T0ZTcWFucGhUd1luY2dPeXFMQ2VYZXdBS09tTC9SNUNzaVRidzYzclVZbmkr?=
 =?utf-8?B?K0lDS1VkYjhHYnplSzRFcjB3Tm5BRGhLTWRDbXZOcjlUc1M1VWRkdFNrM2VD?=
 =?utf-8?B?S1lWSjBmb3BqeFhxWGNpRVNZRTRXYSt1cklQTUJJSnMyd0ZsbUZRRFY4bVFy?=
 =?utf-8?B?MHIwdFZ4bU03U1huY2crb2RhNk1DaGxUMmRkVGZjOEI5OUVoak1KN2dkczZZ?=
 =?utf-8?B?b3lUMkRSTTdYZ2M4cDhSTlBXZ1oybCt4UHR6QjYxVUowTXFJV2tRNUoraTYx?=
 =?utf-8?B?YU02WENycVlXb3I5anY2Um9aVkoyNnhzNC9hTWNVWlA4WXg1aXJPNEZXU0Rz?=
 =?utf-8?B?ZUp1K3BvdFYzb0hkQ2hDNlNQajMvTjc2cmJ6c2QySC9uZ1FZUWE5TkNrK094?=
 =?utf-8?B?a1VqUENtR21ZNWJOSzlOem9qQ2VBbW5XNWYrcXlybVVuQi9DWjFkelc5RDlk?=
 =?utf-8?B?c3VVS3ZhbHI1T1AxeFZtTjlzejVDQXoya3Y0TWY4bFFTelBBRS9MT0p2dmc4?=
 =?utf-8?B?eEViZXdmT1RJQTlxclNadVJTanBJQ3RsWndVd0xaTzJpaGVMY2RoTGRiYmsz?=
 =?utf-8?B?ZWtaRkRrVUZoc09wS0Fhd3lyY085MXVSeXdtZ3JjMVRReEdQcnRjNUlBSVBv?=
 =?utf-8?B?d1VrSFA0ekF3US9yUDR3T3VmcUoraDJjRXVzQlNBTDBOUGl0bEJBWEVsT0Rx?=
 =?utf-8?B?empmaG9oNG5sWG5sM29FRzB3NUw1T09SaUxvTUI4MGlSdTlDajRRRVNGcnNw?=
 =?utf-8?B?NkRHUnpZc2o0NCtUNExGN3VqMjVMcDFLb1k5OWVXK29TL29wajN6bUlWeVdK?=
 =?utf-8?B?MDc4b0t0T1BYRCtBWC96TEkxS2tJZ1U4NzBjcStyaGJyWnVsSGViN0JBM29K?=
 =?utf-8?B?aWhLNTJncThNaUczU255Y2gzV2pUWGZKMHQwZ2wySEd4VFk4UkllVjVCLzdy?=
 =?utf-8?B?Z05HbHhnaWJ4eGpnZk5tNGpJNVpIdmtmSVRWbkxwZXpRb1krWkZ5YmxncWc1?=
 =?utf-8?B?K05GR0xSS29OenBocW1GR3dScmFWWU4yWnptMmdnbjJYTTgrU1lFTXhEaFZO?=
 =?utf-8?B?NHIvc05BZmc4aHRJdjRlNGU2UHZtTjdJSVVsWWN6ZVFZTjJtYmxscFVmR0c4?=
 =?utf-8?B?RTJkc3p3YXNmQmhDcWlqMXdSa3Y2VkVxdlA4amkySVhTSXhFSjhTNENmWStl?=
 =?utf-8?B?dUdIdk5tQmQ1eEQ2aUJEY3FBVEtpN24zWkxCMWxEYm9ibnBnWjUxK2g2NEpV?=
 =?utf-8?B?TTJ5Zmt4TEZRWlhHZ29rWVRYazB2REY5ckZ2Zi9GQktvUVBRQ2ZmQ3ZLOVRB?=
 =?utf-8?B?Sk1IdUpvTmJFWEs0MlJMeFRURmVCYnBxVUc5OHhQUG9Vbk91eDVEOTJXMmxt?=
 =?utf-8?Q?ImGS4xIta3ftblvzRJBjuBlyl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d035409f-d06e-44ee-b1c0-08db722f3e2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 08:12:23.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wq9URjQgNDTCt6TiFTcVgzjgk3f6Q64lXDcAkHiUVxUNCKcNjIAuuOV1U6482Vp4bNNlLGd1Ewzn/U1z2QySgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

On 20.06.2023 20:41, Jason Andryuk wrote:
> On Mon, Jun 19, 2023 at 10:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.06.2023 20:02, Jason Andryuk wrote:
>>> +    else
>>>      {
>>> +        if ( !(scaling_available_governors =
>>> +               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
>>> +            return -ENOMEM;
>>> +        if ( (ret = read_scaling_available_governors(
>>> +                        scaling_available_governors,
>>> +                        gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
>>
>> I realize you only re-indent this, but since you need to touch it anyway,
>> may I suggest to also switch to siezof(*scaling_available_governors)?
> 
> How about dropping sizeof(*scaling_available_governors)?  This length ...
> 
>>> +        {
>>> +            xfree(scaling_available_governors);
>>> +            return ret;
>>> +        }
>>> +        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
>>> +                    scaling_available_governors, gov_num * CPUFREQ_NAME_LEN);
>>
>> Similarly here: Please adjust indentation while you touch this code.
> 
> ... should match here, but this second one lacks the "* sizeof($foo)".

Indeed it does, because that multiplication happens inside copy_to_guest()
(really copy_to_guest_offset()).

> They are strings, so multiplying by sizeof() is unusual.

Kind of, but in code which may want switching to Unicode (and not just
UTF-8,but e.g. UCS2 or UCS4) at some point it's a good idea to have such
right away. We don't mean to do any such switch, but I think it's good
practice to not assume that strings / string literals only ever consist
of plain char elements.

> FTAOD, you want the indenting as:
>         ret = copy_to_guest(op->u.get_para.scaling_available_governors,
>                             scaling_available_governors,
>                             gov_num * CPUFREQ_NAME_LEN);
> ?

That's one conforming way, yes. Another would be

        ret = copy_to_guest(
                  op->u.get_para.scaling_available_governors,
                  scaling_available_governors,
                  gov_num * CPUFREQ_NAME_LEN);

>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -296,6 +296,61 @@ struct xen_ondemand {
>>>      uint32_t up_threshold;
>>>  };
>>>
>>> +struct xen_cppc_para {
>>> +    /* OUT */
>>> +    /* activity_window supported if 1 */
>>> +#define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
>>
>> I think 1 isn't very helpful, looking forward. Perhaps better "set" or
>> "flag set"?
> 
> "set" works for me.
> 
>>> +    uint32_t features; /* bit flags for features */
>>> +    /*
>>> +     * See Intel SDM: HWP Performance Range and Dynamic Capabilities
>>> +     *
>>> +     * These four are 0-255 hardware-provided values.  They "continuous,
>>> +     * abstract unit-less, performance" values.  smaller numbers are slower
>>> +     * and larger ones are faster.
>>> +     */
>>> +    uint32_t lowest;
>>> +    uint32_t lowest_nonlinear; /* most_efficient */
>>
>> Why non_linear in the external interface when internally you use
>> most_efficient (merely put in the comment here)?
>>
>>> +    uint32_t nominal; /* guaranteed */
>>
>> Similar question for the name choice here.
> 
> There is a naming mismatch between the HWP fields and the CPPC fields.
> The commit message includes:
> The HWP most_efficient is mapped to CPPC lowest_nonlinear, and guaranteed is
> mapped to nominal.  CPPC has a guaranteed that is optional while nominal
> is required.  ACPI spec says "If this register is not implemented, OSPM
> assumes guaranteed performance is always equal to nominal performance."
> 
> So the comments were to help with the mapping.  Should I prefix the
> comments like "HWP: most_efficient"?

Yes please. (I was going to suggest exactly that when I hadn't read this
question, yet.)

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F13793721
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596340.930201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdns9-00085u-OF; Wed, 06 Sep 2023 08:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596340.930201; Wed, 06 Sep 2023 08:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdns9-00084E-Kz; Wed, 06 Sep 2023 08:26:49 +0000
Received: by outflank-mailman (input) for mailman id 596340;
 Wed, 06 Sep 2023 08:26:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdns7-000845-Jz
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:26:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e0616f3-4c8f-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:26:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 08:26:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 08:26:43 +0000
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
X-Inumbo-ID: 1e0616f3-4c8f-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr2WVE1U1Vktbe4nNcimcHksc58GyP9ZHz1rNHcHLiJkdSD8oy/qYfsTS8blUlGtMloWbIq3AiSFbWyGgUQhuiVYXOwZN/zHObHeVl9Fnf8Q5iS7t33qna5nofsIhLwG6xwHXA/4NKlzhb3MaTghOWz9VM5wD5eEzU6VVeeIlsN2S0s6ZJ0aQflhdtCuyUp0ZlMWZV85xqQU24MB9kCE1teeenXZ+zXwAdRLSEKvj3mbvAnRwvygRt77ZXiofPtsAU7xD7Yj/I6+irzfgs5Q2lrYSVO7CZGqUFDedQnIhmx8ebsyqAvAJPDkpl9211poRJCqnKQ48QFNHUBVaRmXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9M4gm6WkdVeiHtQFvdsgD3j/V3QgLej0YlSXnMOTKw=;
 b=Q/JROAbdBMxBEbV8wtMJCN1iq34K1x6490IolyL2Z8t10i6gzvLLlLYCuwxWS2rFldasOnV1JWbAxfu87xLL791/daMOTocuV9u6dGhv7x3hwuxaLbNuEnwGszvZ1OC91BNyljweXSeZVHb2Gah62gVET6heW5Q/Ecy05JEpS1KgWrpqBxtEtNOJhHN7tLL69/CuW9/V4hicaBWRnTAOOc9y6TVkJB7F2VI/djLHB+aGlzBMehYk6s3mhSTWPVaovkvTmz6j3X1Yt6F6gPmWmLpupJ0PxxBkhtfQ6YbWGvrZkvS142tiJwjlS8sBlQ+N6i3nr3+G1TZCUPszd85jig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9M4gm6WkdVeiHtQFvdsgD3j/V3QgLej0YlSXnMOTKw=;
 b=V4E0/r6rF//QDipq13KsvyBDDP/EtYP9f485oVKWDMmq2juTrfgfWb0xbe6KiPwUwKcO/lbR6Q8Cz3gk6ZPc72Xoo9OvJ/eekhcoA9NwzQWhEnfa8vX+iuJaqXp2jS99wxgzdpY+RRAU00Nj6fj66Tn5VqhtTAD63AI6h0Xat2WFjlYNWdDQrXaPG4+EATYDSocajjO266PcuV7HnUEaHxwoMZNrXVyHfTUJYv6rLZrvqc1ysmeej2MtTk4Jo/zMthv0HD4y71hS2UIiV6aX+qO00AlFr25HUGAn56Kb6wgsLxJZE71oqiFqtXYW8D8vf24TE7rSf1LoYoZavxToAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55ee17e5-0e90-4cc5-6168-4230e9e7e6b9@suse.com>
Date: Wed, 6 Sep 2023 10:26:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v12 20/20] tools/xl: Add new xl command overlay for
 device tree overlay support
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: julien@xen.org, sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Vikram Garhwal <vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
 <20230906011631.30310-21-vikram.garhwal@amd.com>
 <3ee81557-50d2-1ae0-e700-9f20672ef15e@suse.com>
 <6a3bcb64-2416-225e-8a5e-5ea7823d3c29@amd.com>
 <dd1026ce-8c2b-2198-fc7f-91f7e671e62f@suse.com>
 <4ce7bcfe-0c32-70f0-7501-451a67ccd26b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ce7bcfe-0c32-70f0-7501-451a67ccd26b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d06bbf3-beae-45d1-ada0-08dbaeb3006e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lDM2TKMQzT+ZQGBWU/aUv6uYZWgbNHpxkcIF94RHbP4k9VLvdU1awfVxJUL8H46su7J/wyKc5BaI7IEKM9S5LlkenBeSNDPiNUaqoID8mXlQTo2sjRxSYIVlugH8bz3WsC9ck0w/CqqW8UOhv1F03UPFEuNfJC/wZxT773UDe4smPQ2dq3i4euI6SwpdQh0pOoHjseTt+pw9G9PvXRGJ7db5WmDgxFfAViu2KQJzmpj8tZHtQpK0FSIhyB4FvJE5wl5I5ZcJVQ7BPsF57BJkC6uLsIChudZMGOkW8cRQficS8p3OV7NYQfMIKdbPi8v0wzYyv2DI+URixKr0GdoUN20v9TuECwwL/QoJWhr2X9Cs2MU7JEtKxQPV8vm95t5M1zToLVYIyJ+V0yJC/TzVoRtouM/5hFADapODK92cXI0QKVgzxkq4jhFBuV+2hoKyByy7VlBlNRVNnJiyOozd3pJiDkqAqbXqW9UORc/LOMIK27nCetxMnwyAPcUj5801gyE/1cCuVcn0YrF3oVDuQG9yg9d2oxtVA52CZyS8FKmGFGXNha8uUOFQU24FeGcaVUez9YPubzfIX3Xbvgkn56zHDmeEMVwx6w6MwJipZTHM9LlP32OY92gHk54U6UjfO+YAbDOgW0akyTIGZ9arOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(396003)(366004)(376002)(1800799009)(186009)(451199024)(66899024)(2906002)(38100700002)(36756003)(31696002)(86362001)(8936002)(4326008)(8676002)(53546011)(26005)(5660300002)(2616005)(66476007)(41300700001)(66556008)(54906003)(66946007)(6916009)(6506007)(6512007)(316002)(6486002)(83380400001)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTM4ZVJDbjE4S3lsUkd3OGg5MmYwY3R2YTB3a0tlekNTVlRlSWdBbVBOTVZ6?=
 =?utf-8?B?Kytxc1RuWExRUnExOXZqY0JHY2VOcSt0NnFyZkgzZDRNaTFQMnlGQkc5ZXE0?=
 =?utf-8?B?RFBxZVVoYitmdUhzSTBUVFBpYWw0TDVtakZVK00waXVPSHg2ejhObmgxMk1C?=
 =?utf-8?B?ang2a1o4d0RuUS9HZ3lrRUJLU2tNMmR6ay9EWHZidHJwYzBaakYvdG9BWDBw?=
 =?utf-8?B?aXdodWRXS0F3N3BoVWtPN3hyMU8ydTNWM3lmdDhiZUhySStnZHBTYlQzZ0JN?=
 =?utf-8?B?UzYyMU00ZXl4T0VvRm16K2hTMjVlVW1XYSt0bkVNQnZDNHo4eTJ3c1ZLYnhX?=
 =?utf-8?B?eEdTMUNzWFlpcTR3QXYxbCtlSEVuYklubE1tUjFURlZ1UzR4djNScnJWdkFx?=
 =?utf-8?B?S3NmTTc5Yy8vL1dOTWgzeUpidmtDTm55MUlaSklPcVVieHR2QzBmUXQ1UFFw?=
 =?utf-8?B?SnFsczRKekRZRkdwM0pRb21VVWY0Z2V6QmxoZDBSRHVSNFNQcFpzMFA3T0dw?=
 =?utf-8?B?OU5UcU5kRmQrQWZMWEcram0yOXpsSTNPZG0vd05SdUl6Y3l5bjZ6ZGhyZS9m?=
 =?utf-8?B?K0dsSnJQY21vc0FFdVBlUUxvS3kreUgzMnlGV25ZUjl6OUlCR2g2SUdXcGE5?=
 =?utf-8?B?MU1IeXBpSnljNkFucVV5ZURmMGpKSkk3TUw4aVUwZGhpUU9EazFCV3M0bDh0?=
 =?utf-8?B?TWlOeUN5ZDJqdXA5MzgwV0VwbWMyNWFQdktYSk9YcGIvVDUzZUovcHpCZzI5?=
 =?utf-8?B?TE44VnpudlZ2Z1dUTzFhT1B0a2lIb0RyUEhXT2lBZURLdDhjZmhMVDh3bnVz?=
 =?utf-8?B?Z0lxOStJZU9NUGhueEpySHpUb1p3Tk5CYk9RbzZZZ1B6TW41U3lzd2hiT3dS?=
 =?utf-8?B?ZHZKOVF4WTIvNHIrVEZTT00vOVRyNGNJUk1LN2tKaHgwVUErVXcvT2ZxVzRl?=
 =?utf-8?B?bmVjbzF3NXBWZlF0ZlJXMDdFZ0ttNzJkRjVOQnYrZDFpdXU1YTFZRFIzaGJr?=
 =?utf-8?B?WWRRK2J0b1ZWVVJNSFp4amd4N3JUMWs5MjRZTGZoMDhMbktvanVoTVRQVU1h?=
 =?utf-8?B?NjlJRzhtZUZoQTRicWdDc3ZZZFRxZXZzWTJTR3VqSDdtemdMN0ZmNFVURTZ2?=
 =?utf-8?B?YWgrdGx0MmJJNUhGd2U0d2g2bzEra2ZJOUNSM0pWUXZxRVBRazMzeWwvdC9t?=
 =?utf-8?B?eCs4TDVwVmlmUHNraEVCQVV1WjdnaG9hUERJa2IyQnUvVUZ5U2twSXZXZXph?=
 =?utf-8?B?V2Q4eGdnNWdadG9uSHBFenBFY0pzYzV3VGJ0NTF5L0dNNWk2N1Zwc3FkYXBz?=
 =?utf-8?B?ck9vMDNyaTNuUytiYk4wbjVXT0hIdzlyQzI4ckpmMUlYYUp1SnNMSjhFTjdp?=
 =?utf-8?B?d0FjSjlVZTlZcDhnbXdDWmRiVEtPVUJjMUMvNFQxWldvNGt2cmRIeWFJSWlG?=
 =?utf-8?B?ZU9XYVZ1UE9YMHh0SnhjLzZxMENuTmE3b01XbU1BYlJUZlpFSFh5MFZXYVJp?=
 =?utf-8?B?cFI2b3JwLy9aYldLQi9Xem5VaXRqdmM0VmNJZmtGUDBEMnkrSzh4cG5hOThj?=
 =?utf-8?B?RUdGdUxuay9qUUZheDhTTi9Eem1YZVpTcldQVmM0c3dWakhjaS9BUHpObjdm?=
 =?utf-8?B?OVZwVGpEZkNUbmZDQTRyMDNRZ0VmbldlTm9ycGxwb0ZPWlc1ck0wN0d0enl0?=
 =?utf-8?B?NEJkOHJSa0NNdmdRYm5xcDlsWDJaY0NGYzAzaEQ0VFAra2Z5NnJvclZkVUdH?=
 =?utf-8?B?SFdybVNZdEFtdXFyR2toRU9odFJmVnlSbE5LR0NFOGIwOGZURStGWEprZ25M?=
 =?utf-8?B?eTI5b091OGo2cldZZVo2c1dYVHRpaWV2S2JNOENIZnI4NDc1WE9LU0FKQ1R3?=
 =?utf-8?B?OFdMb3JRa29BYTJ0THBOTkdMWXFkVjJ4UjVSQUlPS01iQTNLbllORDlLcmFW?=
 =?utf-8?B?SjRlT3A4NXRwdTVtWVZMSnVIN1FLWTZpT1M1eERsQjB2MityZk5WMW9xRG43?=
 =?utf-8?B?c1VKaEZnbUt4c2YwV2hwenpiU0JOenJrWDRuM2ZHVncrd2ZXdHIxWUUycEpP?=
 =?utf-8?B?TGVKVzFoNSttYVd0clgzdTV3cUh0ZXptaHdBWnE4UnluY3pobFo2TlQrU29C?=
 =?utf-8?Q?UaPfNjKAaAk2N/tasUmg5AG98?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d06bbf3-beae-45d1-ada0-08dbaeb3006e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 08:26:43.3567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiUWZgkftFd5GOiykm/KsduIRXXq7st5VG0d/Mt+hrUPEUUbXNTnx+kD/dokXAKXENy5S7UKW937PFkrLbKPIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212

On 06.09.2023 10:06, Michal Orzel wrote:
> 
> 
> On 06/09/2023 09:57, Jan Beulich wrote:
>>
>>
>> On 06.09.2023 09:32, Michal Orzel wrote:
>>>
>>>
>>> On 06/09/2023 08:55, Jan Beulich wrote:
>>>>
>>>>
>>>> On 06.09.2023 03:16, Vikram Garhwal wrote:
>>>>> --- a/tools/xl/xl_vmcontrol.c
>>>>> +++ b/tools/xl/xl_vmcontrol.c
>>>>> @@ -1265,6 +1265,58 @@ int main_create(int argc, char **argv)
>>>>>      return 0;
>>>>>  }
>>>>>
>>>>> +int main_dt_overlay(int argc, char **argv)
>>>>> +{
>>>>> +    const char *overlay_ops = NULL;
>>>>> +    const char *overlay_config_file = NULL;
>>>>> +    void *overlay_dtb = NULL;
>>>>> +    int rc;
>>>>> +    uint8_t op;
>>>>> +    int overlay_dtb_size = 0;
>>>>> +    const int overlay_add_op = 1;
>>>>> +    const int overlay_remove_op = 2;
>>>>> +
>>>>> +    if (argc < 2) {
>>>>> +        help("dt_overlay");
>>>>> +        return EXIT_FAILURE;
>>>>> +    }
>>>>> +
>>>>> +    overlay_ops = argv[1];
>>>>> +    overlay_config_file = argv[2];
>>>>> +
>>>>> +    if (strcmp(overlay_ops, "add") == 0)
>>>>> +        op = overlay_add_op;
>>>>> +    else if (strcmp(overlay_ops, "remove") == 0)
>>>>> +        op = overlay_remove_op;
>>>>> +    else {
>>>>> +        fprintf(stderr, "Invalid dt overlay operation\n");
>>>>> +        return EXIT_FAILURE;
>>>>> +    }
>>>>> +
>>>>> +    if (overlay_config_file) {
>>>>> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
>>>>> +                                      &overlay_dtb, &overlay_dtb_size);
>>>>> +
>>>>> +        if (rc) {
>>>>> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
>>>>> +                    overlay_config_file);
>>>>> +            free(overlay_dtb);
>>>>> +            return ERROR_FAIL;
>>>>> +        }
>>>>> +    } else {
>>>>> +        fprintf(stderr, "overlay dtbo file not provided\n");
>>>>> +        return ERROR_FAIL;
>>>>> +    }
>>>>> +
>>>>> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
>>>>
>>>> Because of this being Arm-only (as validly pointed out by osstest), I expect
>>>> the entire function here as well as its entry in cmd_table[] want to be
>>>> Arm-specific, too? Of course it would be nice to not key this to __arm__ /
>>>> __aarch64__, but to something that would not need touching again if the
>>>> underlying infrastructure was made available to, say, RISC-V as well. But of
>>>> course - right now the goal needs to be to address the CI and osstest
>>>> breakage.
>>> I agree. I would suggest to guard it with LIBXL_HAVE_DT_OVERLAY which is for now
>>> only defined for arm32/arm64. This way the code will not need to be modified if other
>>> arch gain support for the feature.
>>
>> Ah yes, that ought to work. While there perhaps also replace the conditional
>> around the declaration of the function in libxl.h. (But of course Anthony
>> may tell me/us that this isn't the way to go.)
> Hmm, if we change guards for libxl_dt_overlay(), what about xc_dt_overlay()
> for which we cannot use LIBXL guard?

I'd key that to some suitable sysctl definition from the public header. If
need be, the sub-op #define itself could be made conditional and then be
used for that purpose.

> Is it ok in that case or better just focus > on the fix.

Personally I'd consider dealing with just the breakage sufficient for the
moment. The libxc part then of course still wants dealing with later on,
preferably in time for 4.18.

Jan


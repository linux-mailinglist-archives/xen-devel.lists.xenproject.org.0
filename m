Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F266D66A7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517948.803982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiA9-00061x-P9; Tue, 04 Apr 2023 15:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517948.803982; Tue, 04 Apr 2023 15:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiA9-00060G-LG; Tue, 04 Apr 2023 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 517948;
 Tue, 04 Apr 2023 15:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjiA7-00060A-VA
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:01:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94eecb06-d2f9-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:01:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9982.eurprd04.prod.outlook.com (2603:10a6:10:4db::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 15:01:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:01:29 +0000
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
X-Inumbo-ID: 94eecb06-d2f9-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnu0U4TuQngHdyNyTYVEFbBFhsVXEe9GL/nuyWVZ7SVtt5JfGi3nT3iFPZA9AZTkPVWkb6YPXmwgP6IqB9UvyUdI6t9CDjVO/aNGylNc6P6ySy4UrYH4z6VUugAr4DvDeXH7d4wl6FUjT7lb14YVr98gXVKpm89qsgwZ7drAcUKucWkq0T6/ftdQ8NotCdMqV0YBbEBZnUJ9p2fLX3nmELWMU31kaudTT1PZxbbKQsx/XuPZy6ApAPzHHxms4Lx96e4mz634KTWbHHJSCLMSTQouRDK0cbyKbZ5Ck9YZIJF22oTZJlGbwLEZogvCWSOIlWBMdU/GgB7cNbpYaM/r4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaynlAKGKmHgycZ7qG6oJUclcTjJpuYDyEq4fa/d5Qw=;
 b=SnXL8GYPzKQZWYU1emHWNgm0NgZmj4qZXM9v7gSgS41IOcUQNKBx6BaDA+hrwSSdCN06hdC+ITKfQW/auuSXnm0VmZx2wjx9d/ZlN0yF6ZBXMdN/PzdW+YUdFLbIVozsRC9q0NkFwzP5b4oysrsCkFC+qTmIXxuB8sh2bNA93zGkot1BYly7alUGQt1bdnoxtJ8mQ6aXxSoUjHjI02X9gkUZMm3Gy14lzelZRoGCU/RBk9ottjHD9NXBe5P8fHd44HyGTp3YVTgRoTPPy9gQAsyoFMkGh6fYWbdZG/RfATTM4wCKsqEkZiN7mSJQsIheH0OgwwHKHc6+WYqQ5X9lBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaynlAKGKmHgycZ7qG6oJUclcTjJpuYDyEq4fa/d5Qw=;
 b=iF2E/VlPPMHb454CWi/ToaUff67RmZb/Ck0CyYuTX7f7yA6w/ioHTBdPIs1NmUhsklG5FyCuQiqpwxdCx5e+t2SMxDmg4lPHuf5uT7crO/WvT/gn5Bn1soapC7pyEcKG90F2vQ0lJc+/f/Dv/VEiCy0FtZT6yKxtH+NR8usl56MoQXMzbqYtze/p2MtCkF5fXVI9DtDH0RfVtWRNjYbcZJje8Wt8Thl4QB2IRbS4/SjK+x9EfLv3bAQD65j+uDy/OsHSm9rxXfXcrxB8Zin8aeCuyJoxnX8/Vuqka7PlYCOsSEeA+ZNJtbEYGUDOIG5qqLj7m2ozyWXLrRvIhcyJBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63395f4e-2272-5537-190e-27318d4057ea@suse.com>
Date: Tue, 4 Apr 2023 17:01:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 09/15] x86: Out-of-inline the policy<->featureset
 convertors
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404095222.1373721-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9982:EE_
X-MS-Office365-Filtering-Correlation-Id: 8351e5e8-42ff-46a2-e71e-08db351d783c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4DjTsWhZTzvrZz7tcTW9xefyFb7DMdjekkej6IrrrhsHj+uBFNgz6D2leFEH+XGRbwPFVfsCzeWvzZ2dVgv3RlVy9Drvlygbxs2ZNXq1J3kerGrCI3joplLvKbV+joxvXlfqOK0T1XNAKSrf4fnyy86lE8sZh+UoA2P6h3/7fT8s44cbKprTmg4o8VU4KvHK3LRZW/C/Cn0uc40lBI0JFAnIE0mSwgT4YmQFWpjG3NAvnbUkXlow5dew0g2NucxaHBC3yRrKVK/IZbomyU6ileJuMfPih2XP3PYiLXPOrs5u2YvT7scYxrznHpFGKu4poRU52lonA0vKaEkVx6bt+TkrBSndzqLAjiz3EjmFNDK8lAVUrD5BAyyPW+lABEuU3Q5O0WHWqSCp+uCpf5ndAzsP3j38FVZuNUjCdKfK1TZIgPuGz5K2tJgHufJ3/gUNJLZDlaREUtrWz1MCPq/0JbySxNY8OPk4N2mkSJpcUuC870dV5/UycPZTrPVRFTF6X6yR0MdlfvpGDm3b1ten2Shev/4HGzs0IOGW8cm9sY+iuJ3gvy85lq9HYa1pgxPBcKIycfuJfIChnR++KLfJSzYDNtKs0zT6BuVUEl1utU/W6LttLKJkuxTw823j5VP6cTIsagmhvZ0iDV65wv5A1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(2616005)(86362001)(31696002)(36756003)(2906002)(31686004)(53546011)(6486002)(186003)(83380400001)(6512007)(6506007)(26005)(4326008)(478600001)(66556008)(66946007)(8676002)(6916009)(66476007)(54906003)(41300700001)(5660300002)(38100700002)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVpaR3NnS1gwbjdRcFZQeGUvSW9HdkVEVDh0UVZuYTBsV2YwYzgraUsrS3Nn?=
 =?utf-8?B?SnB5OHJmUjRqVVlGam9mdWlpTWFaSWlzSFlGNXY3SVgyamdQMTdIV2ZmV3JL?=
 =?utf-8?B?NGdxa2JnaFNRT1lQWDl3QThFTE5ZejBlaDl5L2IyMmcxUm1BTzNmSHg1dlZG?=
 =?utf-8?B?QUZCVmJIYVRRRHUwTHV0dVZkSnQ3cURqMVRCQkZVRWhMYmJGRFVCRFJva2NY?=
 =?utf-8?B?dUVMMlBLTUI3UldCS3ZEeUpqTmMxT3JXREtrMGdjazIyV3NNd1FBakE5TjZO?=
 =?utf-8?B?VnhHOWdTSzhSc3FYcmxnejF3RUdIb0Z0RkRPaE9OQVMxY0gwQ213VHV3bml5?=
 =?utf-8?B?OXV5c3RXNG5UUHkrNzR5d3AyVWFlVmI1N2JtSDE1bkRqeC9qcXNmUXduOFd6?=
 =?utf-8?B?bUxxdHIyTUhIdENPK2pmTHJaa3NkVFlLcTJGUGFjY3UvVUgzaHB2WHAyTVc5?=
 =?utf-8?B?ZGxkREpoZlEvUVc0VzV6SGJJY1NVWVBvaWFGcHRqRmVrdkJtOVVMZkxyK3BV?=
 =?utf-8?B?TmtNbVl5YkhETVIxTlNmaVJvaDBGV1g4dERjbXNpTnlDTDNwRDlwTzBMcGlC?=
 =?utf-8?B?a080a2RvR3ZtRytmcE5FVCtKalhRR1E1YTVKZ2h1NmFhYWxWd2hWNFAweUVv?=
 =?utf-8?B?SUtZV2U1MHJpL3h0MTlpMmIvQU5FZjloZzcwOWdESkU2Mi9FMnIwaDIwOENy?=
 =?utf-8?B?ZnN5MXFEcFV0TmtmdlZkdUpURUtBcEszMDh0V3lsTVpLa1ZCaDYybWRSRUZH?=
 =?utf-8?B?T1dQVE4xbThrWVlkNUo5TVIzRzFOSVJFTC9UbTREK1p3cW5zeldDQmNMdmhJ?=
 =?utf-8?B?MFRLaStYcUE1NVdGUGRSb3ZYaUd4TUtiek1uTFNGVTl0Y3EyRGhVY2R5ZkFT?=
 =?utf-8?B?aWFhV1dsbUEvdkdwTi9YQm5iVEVteXU0R05PRkVIeVdhUXp4SnNiY1ZzdUM0?=
 =?utf-8?B?cVFYa0tzVWgwWTZEdnoxQVRHK1FPaWRnRTdqcWpuMEdWM2R6QW8wQVQrckZn?=
 =?utf-8?B?WkFwbVJlLzB6WW1iSUhBRVFxKzhqdDlLcHZZUFFVZldCeGF1M3VUWjhUemhi?=
 =?utf-8?B?VjVPYlhWL1c4a1FYVHNMeVRiVnJPRTIvM1FuWk9OSXEwR0lmTzYrNXFVQ0dT?=
 =?utf-8?B?dlJHajJtbWhJcERyQXBIOTArdUwzSEpNYjhMYnQ2Z2NxZnp5UzNOcFVqd1pP?=
 =?utf-8?B?K0laMG5EaUl4MVUyWjR1eU9tdG1TOUR3SC9VeG4vbnZvUktNbnZpRGFRS0lQ?=
 =?utf-8?B?OEJvV1k3UEdLcU5sTHFKREpPR0dTRmNjUnRvcGx2cnJKKzlSUmdlTHdEYTVM?=
 =?utf-8?B?TU9aeHBGSlR4bVY0VHE5Z3VlRzBJMU9Fd3NXbXB1TUtSSG50Yk9oaUo2bkFy?=
 =?utf-8?B?SjlVZnlaOEYrWU8wTVlQUzJKcjZ0NmlIa29sb1N2WEU4VUp2K25KSWl4VCtx?=
 =?utf-8?B?a1hZREM0dHg3em5PbWF5QTc4c2tSMURuS1dCUHk5QXo2VmJpTjRtb1l5WE94?=
 =?utf-8?B?aldoa1k5SGd1SmlvdFNFcENnMUFUajVFYWw3c3Znd1ZoTmV6RnpJNG1tc0o5?=
 =?utf-8?B?RjYrUExVVG1JK2J6UzYydUZmeDBUbllxTW9YRFhSL1hZay9Nb3dISktJVFp1?=
 =?utf-8?B?MUZGVCtwdzVUK2g0TkVCakZtcHkvd0VvVWxVcEdiNXhCaEtpM2RrNExQdDB0?=
 =?utf-8?B?MUhRZU9wdUFUNUluNTdvUUVVZ2pWRnYzZmJUQ0wvTGRSanQ0WjlDOG92eTRm?=
 =?utf-8?B?dWdoUTdLVS9HaGRSbmlzUEJkeDE4Rm52QTZsOHhxYnpXdFB1TGRmU2xKQjR3?=
 =?utf-8?B?R21VNnFRbElMWlRIRkQ5RS9HYmUzRTVwU0dsWFAwOEswTGs2Z2tjellDbEc1?=
 =?utf-8?B?NnRKNDVzZUt5ZXRpeTRxVzVOMXNPaGsvT2tnL3VlTkRMMi9oWjNFUDJjTFhR?=
 =?utf-8?B?QUErdDYvd05vWWJaVlRlWG12TUdGK01ZUG4yK1ZlbStWdE9HZFpEMWplT3pl?=
 =?utf-8?B?REFsdjdKUE5kb2xIWHJENEJUZEtLVWRDdjJMT0hJNnlOQUl1M1lRY2RtWVVF?=
 =?utf-8?B?ZEVmc2hRdDdPQzZPK3lPQVZtNDBjZVlkaE5IQk9UcklRY3BZSktuTnhLdjdm?=
 =?utf-8?Q?W7o2cKO41XY25zBLFBGjqvJDO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8351e5e8-42ff-46a2-e71e-08db351d783c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:01:29.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/NU6duYQSxdd9syxVQdwJ1YPaYZrg7ALX7yQq0Bc/9MQok2smjrcEs4wBp/KG8KoK8ulfRsNEWtK5JPeuH1oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9982

On 04.04.2023 11:52, Andrew Cooper wrote:
> These are already getting over-large for being inline functions, and are only
> going to grow more over time.  Out of line them, yielding the following net
> delta from bloat-o-meter:
> 
>   add/remove: 2/0 grow/shrink: 0/4 up/down: 276/-1877 (-1601)
> 
> Switch to the newer cpu_policy terminology while doing so.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I take it you have a reason to ...

> --- a/xen/lib/x86/cpuid.c
> +++ b/xen/lib/x86/cpuid.c
> @@ -60,6 +60,48 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor)
>      }
>  }
>  
> +void x86_cpu_policy_to_featureset(
> +    const struct cpu_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
> +{
> +    fs[FEATURESET_1d]        = p->basic._1d;
> +    fs[FEATURESET_1c]        = p->basic._1c;
> +    fs[FEATURESET_e1d]       = p->extd.e1d;
> +    fs[FEATURESET_e1c]       = p->extd.e1c;
> +    fs[FEATURESET_Da1]       = p->xstate.Da1;
> +    fs[FEATURESET_7b0]       = p->feat._7b0;
> +    fs[FEATURESET_7c0]       = p->feat._7c0;
> +    fs[FEATURESET_e7d]       = p->extd.e7d;
> +    fs[FEATURESET_e8b]       = p->extd.e8b;
> +    fs[FEATURESET_7d0]       = p->feat._7d0;
> +    fs[FEATURESET_7a1]       = p->feat._7a1;
> +    fs[FEATURESET_e21a]      = p->extd.e21a;
> +    fs[FEATURESET_7b1]       = p->feat._7b1;
> +    fs[FEATURESET_7d2]       = p->feat._7d2;
> +    fs[FEATURESET_7c1]       = p->feat._7c1;
> +    fs[FEATURESET_7d1]       = p->feat._7d1;
> +}
> +
> +void x86_cpu_featureset_to_policy(
> +    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
> +{
> +    p->basic._1d             = fs[FEATURESET_1d];
> +    p->basic._1c             = fs[FEATURESET_1c];
> +    p->extd.e1d              = fs[FEATURESET_e1d];
> +    p->extd.e1c              = fs[FEATURESET_e1c];
> +    p->xstate.Da1            = fs[FEATURESET_Da1];
> +    p->feat._7b0             = fs[FEATURESET_7b0];
> +    p->feat._7c0             = fs[FEATURESET_7c0];
> +    p->extd.e7d              = fs[FEATURESET_e7d];
> +    p->extd.e8b              = fs[FEATURESET_e8b];
> +    p->feat._7d0             = fs[FEATURESET_7d0];
> +    p->feat._7a1             = fs[FEATURESET_7a1];
> +    p->extd.e21a             = fs[FEATURESET_e21a];
> +    p->feat._7b1             = fs[FEATURESET_7b1];
> +    p->feat._7d2             = fs[FEATURESET_7d2];
> +    p->feat._7c1             = fs[FEATURESET_7c1];
> +    p->feat._7d1             = fs[FEATURESET_7d1];
> +}

... add quite a few padding blanks in here, unlike in the originals?

Jan


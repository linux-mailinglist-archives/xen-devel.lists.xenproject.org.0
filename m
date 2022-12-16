Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87CA64EB2A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464543.722969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69RP-0005BA-Dg; Fri, 16 Dec 2022 12:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464543.722969; Fri, 16 Dec 2022 12:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69RP-00058B-9K; Fri, 16 Dec 2022 12:03:51 +0000
Received: by outflank-mailman (input) for mailman id 464543;
 Fri, 16 Dec 2022 12:03:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p69RN-000585-U1
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:03:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2041.outbound.protection.outlook.com [40.107.14.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d41aee-7d39-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 13:03:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 12:03:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 12:03:46 +0000
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
X-Inumbo-ID: b2d41aee-7d39-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR+OKNaVhjVlFAW4DQZbYUzLTUqSsnwXxcT9F5YqQ8w96J3LsjhasiCcnwinWn6sMeI+/k/TVxCXdcKAuT1am2BWy8u2m3xJH1+X1hSGANf5RCBX6QMMBpM73fYu/w5+tsJ3G906TPgXq5jHqiHGKy9VyZY3EnXhJUAXv/kBF+zaiQ8G8+VNQIe9Rgz9NzCOrhjeirfyx4p5UpcgJyAtEjry7CoFF1GCAPU1tz03TK8HGV6C7J0Jb7CG/ubOozQjesWVWK4ZXM1Q4RqBXoSC31jqHHogYNRA/iYhRTddPc0OGGQuVrK4nIdKt/py+foZsPbqn0RglxYXfiGpLgJSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jBQQfV3y3t9fT4po00CZXGlbfolHm9ylOQK4hGj1ik=;
 b=GqTIPm72i9YkwOkOPpd2i/TC5xinwnrUqqFK9Qvace7Q26DCEC2Uj0YhWGz/t1fEahg3Wrq7Bhw3xjJogh95JUAIJrYyFW/OzxNRSUMQhn/t6umJfEY4mSIuhAmGqJtq8oZy6K4ONe6jj5dOGUtlu+FwOBwFF1BW8hvT9a9FomC//9eGK/k5NVkag8zIsO6dZOxVnG+4i7f/1YlUhzJspLnO6mAVKP4htMwpgqB+urNqcie51kvDB6aeWoxSy4PyQ8L4amyt4yBBePQxTwfa7PsrIHeGspq+qgY5sF3/2YjoDPsbvC4ulROkfg48EaK+zDx6XuVmvkDJKTwPawG/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jBQQfV3y3t9fT4po00CZXGlbfolHm9ylOQK4hGj1ik=;
 b=sFlkVroQCfqypcPcRiqHVyEy7yAWlt2jADnOvYmyR4lJFFXoq+EhIC+ycAp3UnyPQs/pMjzOVXWAiKE0gzhLRpyg9EEvaB+pof9yp5psqnCfQu9bjRbLUbJyvWWE1xKB/ekgmE8g3CZMp0yv/8jMSSRicsIBMxuw4r6cyxS5nZptk1FcPa5/D1xTDBkiB11AFoIpNWoJOIyTMsjzWA083beB16U4eMgPb9gvBpGHow2Hh+HXiEH9vDr8+hcMGXAHOPwl+6PkJfT0vJnd8xtuh/vbMl/7UGL7fGOw4LXbdb6ObSXd6l9ateiSHjR5xsSmUbqlb+lVCtCTaSxvUPJn4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c59193e7-4fee-6435-4698-385363df1bab@suse.com>
Date: Fri, 16 Dec 2022 13:03:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 01/22] xen/common: page_alloc: Re-order includes
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: e2aed388-0e43-41d2-975e-08dadf5d957b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yjFX0nZa/Wg/L+OeOYu+nKloGvVpcP0Hi+ACMxl43zwpJkJP0IFeJx5CJYcXYUDrdADBmqUuA2G9WsmyFnGuLWSIQ2X9YQJ5XRT/nwa3gipHUOE1XPaJJ8NcBWDIV7UHJpGg2ZwBnkC50Kh7Z9w8jG/jDdu7ouxTnbWvZrmpPJzMfzO4hJy91gq6fVtUQrzCJ3gGX1BxbSnBbrQdq0u7WfjC2O7DWRO42CaSSAhPOd7C9+tTFHL1bkn8YVIOr0vbP8BnoSr38xWJFv3SBKnCvCkFtC4HDnYYxsWa97dR5XhrEsniW/4ROeL26A4ChsUwC0FvKc/wCY2AgLzI3uKl+JnAUocb5h1AUNpvUvGMaoXe9dSB0+wJYypbDZTHKFu+fQLcjteVYxKm4q7fa5L/CdiN6UWKcDQmBPZzPmRQztcrV+0+npPMTWZZkYrPj3gkYF28HH+/q4yxJzHeCKw1t0vgjPdU8sYhYPK6wziBj5T6WP6h5JgqKnE4vPHS8hGqnTyeYo51RK0mEZoRrxlrA9H00Asdi1UwpRDduJw6hetr8i1MpuFu7BXjmV59Wy74kQLtKI+CfUD1q8aR1qEWeknbdA74IG1UgwYYTSzSUV3ftmvzsUvh805cuj7P8AwtmP0y8zidadAKOIrVVDSu4k1/mqi+MEKxgKjptUs4WD9Ey+KjajRjX8LcDcIWWHeIKYXia5X5yIwab419TOcLWnPLPoh/rDLWUhiYxSF/ln5aVOSFo0iy7IQuxpSl49GvhoZM4vp27p496Myy3R3HGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199015)(4326008)(8936002)(5660300002)(8676002)(4744005)(66476007)(316002)(54906003)(83380400001)(6916009)(478600001)(86362001)(31696002)(41300700001)(2616005)(6486002)(2906002)(66946007)(36756003)(6506007)(6512007)(66556008)(31686004)(53546011)(186003)(26005)(38100700002)(169823001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akZyQUhrK0thb0FNNU5Lb3krZVVaTXNuUDA3cXVuMWtmdkxyMWUwTkpYZW1J?=
 =?utf-8?B?WUc2VVhxejF1cTl0Z0hkZFY0TzRYUW5qSTZNU3V0R0pjdVoxVktUZW1SQk9p?=
 =?utf-8?B?aTMrZUFRVGVpRUJ1ZWpHZXZlcVJFRnBFZVo1MmlrRU5zRi9IZGJsOWxqZFkw?=
 =?utf-8?B?a2YwRmtuUk53NVNMMjV2K2xzQVFtUVo5K0NIMmtjUjdPby9uNzUxd0UrNTdX?=
 =?utf-8?B?eUxoNUhrWVIzelY1eEZkY0lRUVRJOHcrcUxlelN1WGsyaXcwdUVISlJsVnht?=
 =?utf-8?B?cysrL1pPT0pCTWgvbmZ1aGQ3bUNaUERwSFN0SE1KMk9vb0RxVXB6anltVUd4?=
 =?utf-8?B?YzNOZmp3OHFnMGZ2SGxZTFZ4K3Q3TzhFUnFaZ01PNzBUTnFGd2FIcGZmMFFx?=
 =?utf-8?B?SUJsWm16NUVScE83UzhpT0hQUXljNnEvY2xTdmlBVnQ2cXl3V00yMWJFdENH?=
 =?utf-8?B?dmRtYXBjNGg4ZzVqQ2gzNDcvSFRPMFNzNVV4dnowMlJ6L1ZONGtYM1ptdlFC?=
 =?utf-8?B?THdtQzErUm01YmZpemU5M1NlY084SkoxcW5ET2ZVWDhSMTdGbmlJZ0ZGeUFw?=
 =?utf-8?B?OFBJMlJEQ0cvNnR3VHBqNFlOQlVDSU5yS3dwUDF4TEZDOWEvMlhCRVRIeklx?=
 =?utf-8?B?bzNVNGwrVzB2b1FXczZ4ek1XdFlqM00wbTZGaWh1bis0a29sRkJwalMrckJq?=
 =?utf-8?B?VWRwQzFLSENFWlZBN3EwVUt3c1ZBOHRBOVdqZXo3bmVVWEtXMENBY0ZGSTRr?=
 =?utf-8?B?SlBuRDg0TkxHZGtkMU9HVmk0dmt1N2ZFLys2UVJVcWxzbmVOczRDUTNXQ0RK?=
 =?utf-8?B?SEpWWlJ4aUcrRjhxS1g2VHZPcC9uWGliM0JES0hGWnBQSGQ4L1RnRUtJSTZY?=
 =?utf-8?B?WUFVaHZyeEV1Mll1N3JSSk1jTXBTeE1NWWRaYnpoempweHRMTEZ3MHZwTnJ4?=
 =?utf-8?B?RjRIUzBUUHFycjh1Z0lHV1hldnpjK2NqR3dhZFdKSmZ0aE0rWUpDVnRXYUcz?=
 =?utf-8?B?ZjhraHZtd3FxVGJKZDlMWGNMNnNZWW1MdmtQUWdjaFd4TkRtY1pWU1o4RWlM?=
 =?utf-8?B?WnVja25XbEhjWEVCWFdPTExvREpOUENhUXczR1JOVU5xNGhHYUhUNEhEM3J1?=
 =?utf-8?B?VUJ5cjFQWVc3cEExZTZDczdGU3RyMHZFclJVcm5teWp0WEU5ZTA4TFVFM0hJ?=
 =?utf-8?B?WkE2SlAxUkpMaHJMZGtqWitRb1JXeC84RUpuV0UzTjdNQzkxZTZpMVRrWlRl?=
 =?utf-8?B?bVBqcUdRM2ZENGxObHpFbnd3MFF4dTd0dVAwNTJIekdEd3VFQ09vUFJlbTB5?=
 =?utf-8?B?RTllcFRhSHdNbEloMDhhQ1hwVWh6RUpSNnZSTDhVcFhrRVc3MFpzaThpZGFR?=
 =?utf-8?B?RlMra0hFUWc2UTFhR09mUFFNM0dEc2tSaWxIQkdOVmJ1YzRVbkhVV2pzOXlW?=
 =?utf-8?B?dUtjR1pTdFNXclFJR1dhM1dsQ1E3RFB3TkUxNmpRbkp0ckZ6WjYzcUw5Zit4?=
 =?utf-8?B?YmZXSHNRYitDY2h3dnZUeTdmUFBhWUxhSHR5WjY0aGorZWptd1VKU3Rta3dR?=
 =?utf-8?B?K0JnYmI2SSs4U2dsNDI4T0plTTlIN0NxZ3VzbUorT2dIdDgxRDV3dmt1NVJ5?=
 =?utf-8?B?MnA2cU92eVdOdXFOK0QvL0lkU3VlUVE2ZjNoT0U3cTZiVXhrMC9RaXN2ZTVq?=
 =?utf-8?B?NzA3TWZsNnVHaGJ1ekZmQTFpLzQyUU1Ialp1WmZwTEJmU2ZpRHhXS2QwZkt4?=
 =?utf-8?B?U1YvOEIwZVdyeFV4SXdTZDJDeHJUR0U5WFhHemxQN21uOWFNaEFuSE94R0tp?=
 =?utf-8?B?RmY0Rllra3ppa1RSYTFjbmduUGtGcEtmL2RmMVI2QU9VUTBOOVlhaDRWem4y?=
 =?utf-8?B?ZDRXQmlVM2R6QTl4ZUlNYjJ2akFXVmhjNWxmT2hWek5MdTFHMUJETldsajg1?=
 =?utf-8?B?QjBOZFJCV1ZHeHBJMUZzK0hjUXZJRWx4V01xUW92WVRZaFJKRnQzK1BneE9Z?=
 =?utf-8?B?a25WVzBxdTBQV1U4Nk9hdkxQcmVHNWdHTUtZbnp1eFZTQ2hhcHgzdXBpYlZF?=
 =?utf-8?B?N3h2dS9BLzRTMDFza3NNTHo2VXk0UEZpNVM4bVR2NUZGMTdYRm10M3R1Y0Nr?=
 =?utf-8?Q?ouP/4C3m2AYWgMeCYxcpQ6kBI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2aed388-0e43-41d2-975e-08dadf5d957b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 12:03:45.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xA4aIGjbTxVBADSaQteQ6yr0tOAzIZRiGPhRHJGAr7QybN4p3dFIePzrb339PW61oabbZGDL8O0bK2uEyaZXcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9053

On 16.12.2022 12:48, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Order the includes with the xen headers first, then asm headers and
> last public headers. Within each category, they are sorted alphabetically.
> 
> Note that the includes in protected by CONFIG_X86 hasn't been sorted
> to avoid adding multiple #ifdef.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ----
> 
>     I am open to add sort the includes protected by CONFIG_X86
>     and add multiple #ifdef if this is preferred.

I, for one, prefer it the way you've done it.

Jan


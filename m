Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34228588E37
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 16:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379959.613889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJEzm-00009B-Or; Wed, 03 Aug 2022 14:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379959.613889; Wed, 03 Aug 2022 14:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJEzm-00006n-M2; Wed, 03 Aug 2022 14:05:10 +0000
Received: by outflank-mailman (input) for mailman id 379959;
 Wed, 03 Aug 2022 14:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJEzk-00006h-Fp
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 14:05:08 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30057.outbound.protection.outlook.com [40.107.3.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 467e2326-1335-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 16:05:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 14:05:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 14:05:03 +0000
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
X-Inumbo-ID: 467e2326-1335-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fACsgLmpMz5r74tfdz47MZ8nCfN9aNPyH0BqttxkosjSv/UDIjgDn5DxaUxl19RnrKm6NJGyBEz+5KemP0ytjstJbQA4bDA7G0ehjTjmdJDelKxa6LpFS7O/fnf9TmqHDrRiQGifvh0GRyR8zq5sqUR0tHxr3uR8s2j8qZPlWW304hrjDBckVa7S7txYopp0jWiuE73c5+hI/98sUb/a/HwaplwNuz6yIhjtbwPGU6Tldp2FFZA5EGNDhlQ1rGL3B+c6Yn0yU8Ar6Mi5L0HEY7NdKCGeoj7g5eEGYeeTgMKllsmreoCtl6bSH+LswdYpciMbLZnTn3nZ8lIcCdMm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aaAn/vaTifdPeQJAAC17OamT0yJzk+EsnTTvvyijwo=;
 b=g4dBvfv0OfaxiPYVe3yQUDcyBzVa609gyJvNRt0HNXGaEk7dhAHNi2kXdUhChyKq/I1U49EuWFofjyheOvFTXiVe+XBMwbfIxEVJCvUZe78pwKGbQ+GTuwPOCZOoDThXLm6DKzWZvh1+L2UDjxBAgtYYdiNvsvTcCasQ6jJEgd6V+rwT3y1EUOYzxqTGj6l+fR4BWV5bNarPzQTvIJ7auK6D/TZORMuykE+5/+UxV1GmCqG7UFBARIH8MDKMpoD5EsMrKgw3p+ffbvIUOyVQunBFv9yAnXesILSU2iXWTTjTTN0/HnOSyTSyND5eoC1BBfLrJj7ucXDj9A1jiGjiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aaAn/vaTifdPeQJAAC17OamT0yJzk+EsnTTvvyijwo=;
 b=b+a+AF7SEMdIUPpjNUdjLsBMl51sL1RSzmagmyE6FN5Vd7Q4nM43yjWXgRlwbX0FqyYi2KCpk83ErhbLRAB7wiOTnVdhE1W4GAtbPpBXXP4h+bU+QRPEgHa1HJSQKe7F9JI2YLo6miaNzqFqxzcBMjJC8k/r4q6d7YmKX2W2bAnnJb+uQ0YQ03jIDCFapezGlTyNb0r+jN3j9y6PadIDkNKetnarb+tNLFKcQyz8HQ/JAFoT43ii3B9xU/ccY+otmM9AkLNNyavViTr9RVU+/1YUPrnj/RT+6O3kT8WnLwsLJdlkq8dVJOCpMIkPcZbCexz7e4sUgpG92n56mSifsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8fa8b10-29ed-2964-f92d-c6368fb48a39@suse.com>
Date: Wed, 3 Aug 2022 16:05:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH v2 4/4] build: replace get-fields.sh by a perl script
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220614162248.40278-5-anthony.perard@citrix.com>
 <Yup3z/e4mMy3SqG2@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yup3z/e4mMy3SqG2@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20fa6eb0-bdca-4a87-524f-08da7559294e
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bCSelcUJRKu9Q+CWVN/mIBmhHTY/DAd8ZL/xW2XhGQFbWM8A4J8sTvA0ec9b36ln+1sI1APNSwKFsjVOOSDfxOtZp6ha04jNIJl1otgAXbG+FtkSLz1rgGUJKOJbMnMr4h61BorC5T6QNcEUq2ZBh+/RKr/VqhQTeN57bqK6LBx6UrVopVr7rVgdjRgbdMo6ynfgpFQdPcTKfNNoyWrjxg9yEK4l0Pr6j5YY9ft7rwzJZJy1K60N7CteMSya1Papsi6Gmi0L5pwEg0KRXuARNSNl934WvKn8BfgH9kfgvIo98rRdERF/Sg3HY1x9eUdwwC8WuVc27BXzckHTzouOzfORKWrVaJUhYtuiRK0dB5RSe69AVMyCch1zsX1sPjNAGMNkhDpG2beJ5SpTQGgj7NaZDe+eMIb1w+iTPhsFCI7TlG3oVw5c0MiN6aNw0/0u3SAikZ/M2Da8oLnGiYZeFKyssfQIoX9sHdwGXT0qU2OxfFas2xMmfPFpdPrVkhm71PKkm3w147kayWOgKBMf5dKOvtY8+VeeEJTDDhLk/eJib2P2xUmPsIZutlujj1Ln5RFPX/q3mnXzXZ98AVTGP5r0H1pnr5/jarG9OfhTHh/LjZrZOo6EYnYaMl3YCuMR9NE3yfULQt6B9XUrgjfEV0LYEcW0g1+1sfVl1WImp0JF5FPUbNT9sHq9+wC638q+ZJ/4kRyIERyOk1xfS8i36hQXq+I+y+JzwIGIERWzVsfrnnuSfX/vkXvk86dbPFKRDHNqo7Eccj1mjEsM1daUcyaGTOTkb8zL//6QEUPefEliK462JhtshDbpMQj0D2pkgtDpbHgGAPZeR4mYB+eF3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(83380400001)(2616005)(186003)(31686004)(2906002)(53546011)(6506007)(38100700002)(36756003)(5660300002)(26005)(6512007)(31696002)(8936002)(86362001)(41300700001)(66476007)(8676002)(66946007)(4326008)(6486002)(66556008)(478600001)(54906003)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z29uNHBTa1hIdVpEMjJwS3N5WllraWVhNktrZ0lyQ0ZWZ1UwejlSNm8yMndn?=
 =?utf-8?B?U0hPV0Fubm0wRlh1VjBXTHA5UEtIWVNaVm5SdGlSYWk1RzA1eWFnZFdjZXBy?=
 =?utf-8?B?c0VrbkpWRllLcmRMbWxRKzNCbmRtSWZkaDdPMTZ5bXd0Zy8xcnkraE1vVE91?=
 =?utf-8?B?MWdwc2E2Qk1GRkRtRmRPOHB3NmtTTFNvYUhJcjJCYXl5RkVGTmFMdDM4UkxO?=
 =?utf-8?B?Tkx5VDYzL1ZZck1XYTlyNHdtQjFMdVozWGJVZkQ4SzlnbmZ4M3lGTldoZjRY?=
 =?utf-8?B?ODF5VUdyUWk2aW5PU3VxY3k0NTZWU2xXOEZZS0V0UkxFVUY3SGsyL1NYcEVr?=
 =?utf-8?B?L05mZm5CVTRpcEJ6UUwveDhLaHN5OVpoSlpWNHA5VWNOeTFJZnRmRHVLNzV5?=
 =?utf-8?B?Y0xFYzlhZjQxN0h4Z0JPbkZYdm5ldTMySGJ2T3ZvQ2xBVU5uR0pnMTN0ajJx?=
 =?utf-8?B?QWlHNGlSbDE3NXlhekNIZ3FuWHZXRjB4TVR0cG5weEFCSDZNY2tUQXZRdFhY?=
 =?utf-8?B?VGNVK0lxTFhjVWU1Mkora2VEUEU3WElRTFVGZlVCNDBtR1UxMU9IN3lyWFlj?=
 =?utf-8?B?T3dVT2R3NStjSWZ2Z2hYQmswYmdGa3pVcS93V0xpZHQvSGlvZ2RUb1VuQWFB?=
 =?utf-8?B?VTlWekswYnE4NXpjWVZST0pkSXp4akwwUkFJNktzTWlKbnFCcTZSbmszN2Fl?=
 =?utf-8?B?NUpaWlFXdElxNkxOSlpXT0tUYmtZMmlTcEJpWVlJOG5pOHd0ZmtScnlzWStN?=
 =?utf-8?B?MlFER05WRWpObnM2aHN1dTZqYTNUVWxxYndsRTA4WXAxRUJDRXdFV2tHRk5j?=
 =?utf-8?B?OVlsSWMvWXdpcXN5cjZIQkFXS0N1NklrQnk3ZWp4aW5jNitGbTE2YURJM0Q1?=
 =?utf-8?B?MExOVDFwRmp6OUI2VnliTHdkRjZaS2VEV3FaZ1VreHFBQ3NqczNEdFBNaGMz?=
 =?utf-8?B?UEEzL3ZEcmVzMEkrMEQyYzdvenBXMHU5ZFdYNHFTSVJqSThkd3lFdWNlVzI0?=
 =?utf-8?B?M25TTno2MHcvMmJ3Q215clN4bW9YbWRzVnJETWw4YUJPd2FZRmh5WkdMZFN2?=
 =?utf-8?B?VDc1QUhlYTVJTGF2WTNiZGF2aTc3dHREM1JqNUV2R0VVTVoyTHVtSmN3RWkv?=
 =?utf-8?B?ejFWeWNpdytnWHJISCtGNExFQ0VYQ21ZSW56eHZqNEd2U3dTTlZ2dFdFc3FE?=
 =?utf-8?B?US9qeWpKWFJaWHZRcjhFMWkvRHdTVGpSUG5lVDVkeHZ1WWVpYmpvZmJLMkJY?=
 =?utf-8?B?UXlON25hbjRCbWZPUjdHVUFZZURXQ2FBOXhuTzBmWXdJYnZVSHhhMTViQTE0?=
 =?utf-8?B?eS91bm5MUnNsSFdwZ3JiUGxocDRab2dOK1MwOHcvSy95NEw3aEFUVU51OHFk?=
 =?utf-8?B?a2RQNS9rR2NnRk5mZmJoRmY5Q1V6bVdhUGxET09oUDlGdzhsbTc3M0dKSjZ1?=
 =?utf-8?B?UkpZeTQwclJ2RHBCNWxzY1l2eEYyY3F3MGFkT0UzRGFiUTZRMTh3WFlDZmx4?=
 =?utf-8?B?VUI5WWlCQjZXVVRkZHJxVG9uZmlXSXVuYlp5Y3J1T3Jta1J4MWNIclEyNEpU?=
 =?utf-8?B?blIyczhwZmFkb0g3S2FDdVhFMHJtUGNHZHhMSGZBMEJkS2hOZ2dkVW41a0hM?=
 =?utf-8?B?NkRkbSt5ZXhCNXlLVmUxSUlrMm1OL1UydU93UXV4eGRsbHZQTGY4QWpSc2tn?=
 =?utf-8?B?b1VGc3RKUUUxRlIzRmdES3QrRWRzUVhIRHgyVTB2SGxCQzlkcmMwY0NISXE3?=
 =?utf-8?B?dWM3WmV4MmprUFdnaGFxbE1TYW5CU0VPRXgrTmVnU1h5cW5hRTFBTmk4N1Zy?=
 =?utf-8?B?T1c5VFVpN3ZUVHBjZGluKzNVVk1jZnM3U0hIdTV0TXJqdVRtTDF1VU9yVFAy?=
 =?utf-8?B?d3VncnpYUEZ3cG5seDRQdmdPeWlkc0hCcTZjTEVLYkp5ckFtcUpCcFF3ZzBZ?=
 =?utf-8?B?NGFmdTFVS2tRYk5oMkZqN1ZyU3VaR3dqcFlZMXFpU3ZGS0RyQTJEcWhQOTYx?=
 =?utf-8?B?bmhsYmkyZ2tyNzByMjBQNlBLY0JsSGtJaXo0ditES2NpV0MvRHNGRU5lZXVB?=
 =?utf-8?B?ekpjM0NpWW9rVFlSTUJ2aEtURU5laHVldlYyeU9jUUpEcVRtU2hjdVBxSmkz?=
 =?utf-8?Q?JlvT/2Y0yZBNKv0Aq+w+2v4iN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fa6eb0-bdca-4a87-524f-08da7559294e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 14:05:03.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fAlkEybuFGjQmgH4fFpmq4GyFzMqOgkJuaTqZ+3jg4kBvxiaz2YRigYACD9FyD595XTAgeCF66qRUgwgEnRCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9244

On 03.08.2022 15:27, Anthony PERARD wrote:
> On Tue, Jun 14, 2022 at 05:22:48PM +0100, Anthony PERARD wrote:
>> The get-fields.sh which generate all the include/compat/.xlat/*.h
>> headers is quite slow. It takes for example nearly 3 seconds to
>> generate platform.h on a recent machine, or 2.3 seconds for memory.h.
>>
>> Since it's only text processing, rewriting the mix of shell/sed/python
>> into a single perl script make the generation of those file a lot
>> faster.
>>
>> I tried to keep a similar look for the code, to keep the code similar
>> between the shell and perl, and to ease review. So some code in perl
>> might look weird or could be written better.
>>
>> No functional change, the headers generated are identical.
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> This patch have been on the mailing list for a little while now, could
> it be acked then committed along with the previous one now?

Well, I would certainly be happy to ack it, but only on the basis of a
suitable R-b by somebody else. My Perl is close to non-existing, so I
can't sensibly review this myself.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2C880DCC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695797.1085891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrfv-0001kI-SA; Wed, 20 Mar 2024 08:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695797.1085891; Wed, 20 Mar 2024 08:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrfv-0001hr-P9; Wed, 20 Mar 2024 08:51:55 +0000
Received: by outflank-mailman (input) for mailman id 695797;
 Wed, 20 Mar 2024 08:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmrfu-0001fz-Ci
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:51:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04olkn2100.outbound.protection.outlook.com [40.92.73.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19316898-e697-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 09:51:53 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 DBAP192MB0939.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:1c0::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.31; Wed, 20 Mar 2024 08:51:24 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 08:51:24 +0000
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
X-Inumbo-ID: 19316898-e697-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nchAQ4LPyqsYzePNmXkui1B5ag/cH5ZcqQvqVQP9Dz4Xwm7TcuGTnuBfGS1nyaVCzdyr4YK31a7OkZTCYGHppguZEIqa5FlU/9tWKmF2CvLTCjq37WZg7q2vMtHr46heZXCWHniDOmm/HSPTKNuxiDBwCodxCsA4MV1MlYJZC67WHfilaATwUSH29K+5ZNOuhb+iHqVFgoI2rDoCW7CdeEV8fszDYXE7s2nGQZCaEA1RVURhubk8+7EvsS329wDEQiOwkdTTmmBSTi2JBM80QUTjd2ySYxymw20VvX7loRiuztrWsnNUVaM9DsaN4uNALMyflEzFQdTlUjRpPIJmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF3m8aujpqKhs07cWSaBf1soqIptLE7Zu7ECKba8K7A=;
 b=PiqO3CAXWI9Q2pYdoCdgrl30naQBpTPkPHZM9H3yPA1Gs3Chz4O+1yU6CRnbBOws/QgQZpbj80fzZ1LiR2iTHjQQ3QOLeMrTtyMPzQB99MiLkFZaDtI4xVN1xVBRUrz60g5dqErJydegqhEfZDhOASaUXwh08YjYUgD/4wqspHhceKMaufUjHGlk7MzK9v1lbBZHC6ENR/XImOSLnGkLcslmFj8ibnmpiJUCNc2W8nbizh5hXlW7u8V8O6h4r1lbLTD0PW06cxdZwXw6yYbNK5m9ugrNBxfSuXOGV5eNl89jtUZEyWmrK+yH4QXnFP7kIM+fDf7bu9+vk4uOPVS2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nF3m8aujpqKhs07cWSaBf1soqIptLE7Zu7ECKba8K7A=;
 b=ZxGSlssBSG64Xc/d/kqiKe7GNx8OsaWTFnVvLVfYNl9fv6S/JmKxBs9HHnHGrW22I6GZMy/JMUwtRWwmZqbNZFbygmmepXiDHpcQNZ9aE8LB9Eq7uZ7W8Pz0Il/3wMdOGbCZZioIyPYHV1Xq8mLZlMUMIeiWf9fVVf+YyKPcymRFC6cxLHjOvGI6vcrHi9iB6PTByoqXqZnaNneZyEdIpCZTfmnWwPWdRnFvaY7Lm03GX8yQaS3vZeSSsfdkFPKXQc2yB19RlO4l1Ls6pXHGquhbR0ye+Bje4KAWUMpV5N8NDnR4LIYr4IeBKW3jSg4pUZlJ7ll0t0QyFr6E57fABw==
Message-ID:
 <DU0P192MB17008C969237E268BEC3877DE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Date: Wed, 20 Mar 2024 09:51:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/1] tools: init scripts: Add missing
 XENCONSOLED_ARGS variable to xencommons
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <DU0P192MB1700AD4C3E33FF8F5D6E90F0E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <fafea1a7-c5f0-4e9f-bf49-3d0e6ad26ffc@suse.com>
 <DU0P192MB1700C9098AD44A62F123A5C5E3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
 <2107eac4-3d59-497a-a682-ae38933ac6ae@suse.com>
From: =?UTF-8?Q?Rafa=C3=ABl_Kooi?= <rafael_andreas@hotmail.com>
Autocrypt: addr=rafael_andreas@hotmail.com; keydata=
 xjMEZHDtHhYJKwYBBAHaRw8BAQdA4C7O72UZHQbhHNm1BUkAM/7+KQKN3tupyuGVGyj2dIHN
 KVJhZmHDq2wgS29vaSA8cmFmYWVsX2FuZHJlYXNAaG90bWFpbC5jb20+wo8EExYIADcWIQTv
 ioHnE84MxV6adj/iFi3SALEToAUCZHDtHgUJA8JnAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJ
 EOIWLdIAsROgP80BAKeJdh3YQ5l3gxGp8R9wIvN9Ac3vsMfy8I4kZ6TXksLKAP9vLRV4G3yw
 z7/seKhWc27Jjl4uI/+lIWhWaWrUYZmjAM44BGRw7R8SCisGAQQBl1UBBQEBB0DE61lbAezY
 NhOlHgxdZ9V4klIhSajeU50O8wHIPQnCLgMBCAfCfgQYFggAJhYhBO+KgecTzgzFXpp2P+IW
 LdIAsROgBQJkcO0fBQkDwmcAAhsMAAoJEOIWLdIAsROghHgBANU4dj+WnuSaWemAHVkjERJg
 m0FQpmZzNI8hdolS3gYdAP9zGK65ilpHMDj4pGvfALabruZA4NPJYxSqeamHvOuhBA==
In-Reply-To: <2107eac4-3d59-497a-a682-ae38933ac6ae@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [HSIVr6R8BWBwOteLx1p0nwYjJIkfyYSSzsvBE3iAbOk/bp08bQDUBnc7mKL2HUOD]
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <c46ac9cf-d501-494c-b6f8-9200bba871df@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|DBAP192MB0939:EE_
X-MS-Office365-Filtering-Correlation-Id: 685aa96f-1df3-4303-a225-08dc48baec0f
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TVoUMj8BWYCuE6LiLTPpwRJv8uizpVsrIErp2ChADy58jk4R3X8I8jeQtkd4iD0oADoSdB9pQuTyM6ahDf7L3OqHQ+qExLb0KE+XxStsrhJuYIwS10w9Mk8aForfmntADK3bUpxtONiXaTSKh1uSCMJmEJ/v20GuudM5C51yGK2TMcJVLvyHwyoW5opvJcSjtJrnxVf+ylmbMX8TklTsIjuP58DYxZMT2ABsFqR/HRsNBnd6phhAX+yftyHqVMDRZIdrtLLQWx8fGqnPN8e4Ez2Chn7oPs7KJQM4A1E1duQ1trjEba4R8yzv7WPChdrU5i3NARXCtcIm8DGqA6owIwo1RRj6P+EFd76yuiiNhnyL2aCv+AGUCQ4/kWSNlmYstvkuH57MC79tuQV2m9aqlsSQSG+SstJQdaV34g40zEC7bcrso8LdaDwgeyi+CxWJR6th88b2wAP7+Dpb5cMY79YcK2afCOIa6nyrv/e35Iww5xz5/1I4hSyIcI0W689pUiseGTyX9T1nkuIvhLsVRtngJ0Bb5f/4G3DmlyNmRYeE12b3SmpR4heUg/LQGH1GIC9+zlwaG2G3EYKSqZeIKiGZJPrWbN5ZXLqgVq4/s5RNG1TgHsV9+uPFlRxFtVW/xj/Qgh8IqCTW7xsU4DoD+/XfOaa5RX3SGYgGwQXBx4wLjSoJsc54nHhtYGq3uavHMYu0XsJIOdBLWPfxHnhzrOFj1/sd0uBM1BLO5BK/VvZZ77FN8JqjqDR2JRy4Y+GfzjtBIZkyI2daP08J+l/XsnQ1eUQB9/AjVU=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HKTy14pYVZefszgMmHEOe23lYbVwpBVg3FpzI47qZnJrX/YaE5SUktW3aSv8ISpzGY5+mceAxnZSbHNxjz842PiYaPrCJ+sKl0W9uQpm/w+sTINzkoDIQuS+OmszHob0bM4GNtTEOO+uT0RpaRFtvnEvGzlHJR3yJWFv1I4mUtkUPK8g8mcDJnCT3yUA5exJ+LvNWQy3LkzK7I2dsSRueO7GXS22HDXrEKAZ3ln2cbWHfEHkrLoPQO56Ffq2kow3PTIvQrZlggWUXke9oKf/3fV8edQQOtuW0DSoEu8dnQWYuxLJoOtsslsHGgkL8En4MM0lAQ3f3omFyi+zr40zphbaw0EIf1CFabrleYvOH6oyO/6h+VqrwqiwfvpKifjMw0eFMzr7ZFcczijm1iFcY2kEjq8pVYmA3BwdEWpDVhrGOIq0ONpaJkKp9Zag7UOF5GQsqp3Jqz+HfLovRi4DYZO8Fk9tbW+BScrEUwEb/TNLmPBl/OWng8nwXRDIpvg19acNx1nD//hVCwFj/YUUUwKnzW4qQWdBlUdsgw1nwICq0kpgptOOKDn+CYsoNe9f
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REFsaVp4aE92cm5KV2xmZnFoUzB2ZTlmd2tvZUIvVHpaTWhJeEFpQU55RjZw?=
 =?utf-8?B?WW5PcUtBTXFEZ1pPN0MwVDJiaTNsRTZOVU1TclREdHBaZDY0elRwbk9jeXpC?=
 =?utf-8?B?MjA1eWNUckZIZzhrdmxyYkNBRE5Kb2tQREhIVHFoT3FiVjBQV3gwNlhOWmVp?=
 =?utf-8?B?c3c4ZVhRRWhwaGU0bEdIZTJ1MkVTMVkySzlIcnNGUGdZZXlCSlVhTVdlVkxU?=
 =?utf-8?B?a2FlM1g1elpaN2RLdFp6cThJekpLUUV3emNGZkZ3ZlFMV1VVOTQzbjJadHd5?=
 =?utf-8?B?MnJWenhGV00zdVFRRE9lbkNlNWtqd25tc21mdTlKYXZsanBRWHpPNXp5bnJi?=
 =?utf-8?B?OWlKV1BLczhmYkNxQUNJd25RajVEYjRQQTZjT2RRRXUwNDNJU1VTTjdJZkla?=
 =?utf-8?B?WjNoSnNlYUo2Z2tFYUpIL1l3YTJORXhGbXFCdzFaUjlDY1NvaXhkVDV2R3A5?=
 =?utf-8?B?QXFOdWFQQjEzMHlzMCtOaXRpdDVJS1U2S2dtR2F0QjEwa0s0dCt2ODVPQlc0?=
 =?utf-8?B?Vy9WZUxKUVpTOTlrZ25KenREWC9PZTlzM3EveXp6Z1ZtQUN3a2dERm55cVJP?=
 =?utf-8?B?NnZOME44aGJNNE9vVTFUd21lbXBsWGpNSzF5VmF4LzVKRXFQc2JsdEhRbTlz?=
 =?utf-8?B?NHVUNHVodWg0ZzlMWUVwL2dFaGV1YUdVRGlrNVBwSWRpVDR5UFh4aFhSSGVH?=
 =?utf-8?B?R2llV3pPZDRBb1hpdHFjUms0N1prYXVZQUovOGdmdEZCOVBhNHZSZ2Z5YkVF?=
 =?utf-8?B?MUN6alhSLzBHWUROMkd4ZG9MR0Mwdll5WTJKM3FsdHRBMFdrWGV4RzRBbWlz?=
 =?utf-8?B?TmpHQ0FpcGdzTDdPS3lWM29wa05VQTlvYlpHWVBhZHZGSFNpbjc2VEhtZHM5?=
 =?utf-8?B?ZExxVE5Bd0ZyTmpBYXNqMEhCT0VoVXEvMGVUK0NtNHZHRnlXR0NDWGt2T3Qw?=
 =?utf-8?B?ODFMY2E4ZnlNUmlXWlErbDlNdk9hNFF4ZUJVT2x6eHpyei9qcU8zKzVTNkt2?=
 =?utf-8?B?NVZqNTAxTkpZaW43UGNDeUE0My9yVFFMaVVoYm0rbGdiRzNNK1lnWG15Z0VE?=
 =?utf-8?B?QTkra1dpN3Y3dktFRjJvWmM5VVhLMlJWVkk2UUs2S2FKbUd3TU12NFZsKzV0?=
 =?utf-8?B?djhyemlkVlBhUWgwcmI2NUlmM1EwTUpYUSsvb21IbjZid0IrcDIwVThZSEtQ?=
 =?utf-8?B?djZseExSN2VERE9FRUlBcElROGtIVnZ4d0wrWU9EYU1xOTlHL3NWWjkwYTA2?=
 =?utf-8?B?blhQTEk2bWd2bTVMTkJIZnlUZTJGdVBCZG1KTEl4MStvZzFBZkMyZVExblds?=
 =?utf-8?B?V243WlVtM25OY20wanlOaVM5ZXFCTTdYTnVLcXc1SDR3WFppbm9zajFpeVV1?=
 =?utf-8?B?cXNWMXJuUm1SY3p0Y2lrYVRvalVBZ0d6RzlZeGlPZ3ZQcmwzRE5uUmJQRVZW?=
 =?utf-8?B?aEJSWU5CNnU0aDZiWlFiUjlBWU0zNVptUm4rbkxOS0FmZEtNYnNjVnlNM3lz?=
 =?utf-8?B?TkNQRGpwVk41ZFVOcW5sT3ROcXF6Qy9LRDVrd2xpVUpLUlM3bFZyQUdpWHlv?=
 =?utf-8?B?ejJHdGd3WTZUdzIrUXZtMmpTSHhXcVRuTzNja0lrcWFSK05PdmZEbzNMQ05C?=
 =?utf-8?B?LzE5YmtZOG10Q254ei9PNFRxWE1uWk1UcGJKUkw1RTl5ZmsyZThpYWdjSU0w?=
 =?utf-8?B?djR5WnVBLys0RHhNbkZjMXp1K1Z3OG5SMHRSUVFqTjhqMmRDZzZYMy9xVDlF?=
 =?utf-8?Q?4imCWUe7/sYbmu8x2A5odFFwjIw6m25wNRGXzqL?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 685aa96f-1df3-4303-a225-08dc48baec0f
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 08:51:24.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP192MB0939

On 20/03/2024 09:35, Jan Beulich wrote:> If you send using Outlook, why don't you simply send the patch(es) as
> replies to the cover letter? That's what I'm doing using Thunderbird
> (i.e. like you I'm not using "git send-email").
> 
> Jan

I do use "git send-email" actually, I have it set up to use their SMTP
servers. I figured I would do as the Romans do, I assumed that
"git send-email" would be the path of least resistance.

I have figured out why the messages don't thread though. Outlook seems
to be rewriting the "Message-ID" header, but then fails to update the
"In-Reply-To" headers.

I'll make a gmail address for future patches, seeing Outlook is mailing
list unfriendly.

Rafaël


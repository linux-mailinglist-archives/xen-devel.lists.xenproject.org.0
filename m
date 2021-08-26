Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C73F8366
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172781.315290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJAB8-0001ma-BG; Thu, 26 Aug 2021 07:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172781.315290; Thu, 26 Aug 2021 07:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJAB8-0001kO-7V; Thu, 26 Aug 2021 07:52:02 +0000
Received: by outflank-mailman (input) for mailman id 172781;
 Thu, 26 Aug 2021 07:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJAB7-0001kI-KG
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:52:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a618f2cb-e895-4ae8-b5d1-4e49ed0d2286;
 Thu, 26 Aug 2021 07:52:00 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-6k_Lo9S6M_OXowxECzFj-g-1; Thu, 26 Aug 2021 09:51:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 07:51:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:51:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0129.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:51:56 +0000
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
X-Inumbo-ID: a618f2cb-e895-4ae8-b5d1-4e49ed0d2286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629964319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UTDG6zQf8AZNL55ZbKJHuiubc3K5jkc1MnK6DjT0Cw=;
	b=MoG6bveF6lmg4l/2Mq50OgGA/pcqRviyD3wrAiZgLSU69z5kcWZ6Rnj9gGOmBnvG2GA/uW
	zbTZjOwfMPkuHrAiYehi8T0/vfJcFgU9yqb+lUUYTraSQDHUkPy1xfu0U8PPi+W611HsGl
	R2RU38zj5RVFofmc3rG6hdHz2qxwbrc=
X-MC-Unique: 6k_Lo9S6M_OXowxECzFj-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5kzklARXksMe3mxqVBCVTwZ3Fh6nGSIussF+vXitrEjBMejNHbLVRXXD7grE+oCtxZqv+QpPRrdxq5VRjBy8vf5NwOMs4pPvHPqZ87bgnSy9zPxxp9dlNISwQ8RB4Vz1W2OSQkCkkKGPnHNqWrbrC/3TruBsdXiluJDlW9a9quRsk5FfRW6tgBbweUhDQ8n9+yUFnVfZKBJMbe0vWjgnRd6o225BpR3NFy4rEgx3ag1QpC8fHNUHvf3cSL1YEgMUGoDJBPXFaZ1yHshG/1lJ9ORQ1M+fg4Qj4h3iXLt1CGVP8SmnvIzy7SxzgqfOCfJnguICb5Y7xMvmekFqsArYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UTDG6zQf8AZNL55ZbKJHuiubc3K5jkc1MnK6DjT0Cw=;
 b=RHMIvsCsTvNVgfdOUiMNWnbizUPgLTMeAPgfWzr/S5Wq/O5hXGetN5VrGz3Kpf4EmqIsBmEgrThFrHtnxfvG7lKbGrUrceazImJGEOdXaTHLeZT0xxbJ0YSt5KWHGz+ZRJs1Lleyvz7SBAD5l4ihx0k9EO2jBgP9E5cyaz+xf0vpblL+85f/E27bt8+4eAeK37XBoUt6UAc6jpv+k+OC+UjiZzslZMVEaR8mduBGgXj1UMopEFvfvGjQ73V8FDB7/fEYzo/m2gS5jAb74PtfK2O0TPnInN8ktwsRjC/p1AJmbQpbghAvCIBs+IQHpVOZrhXB3a4NgKec9KPk0KSJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Xen C-state Issues
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YSEo9Box2AFnmdLZ@mattapan.m5p.com>
 <dea9cf97-9332-b1c9-2cff-d87564832529@suse.com>
 <YSSFffDK5/5MUAdj@mattapan.m5p.com>
 <09fc5490-5b14-474c-dbe0-864952f19a33@suse.com>
 <YSbryyxk5G7xqHlQ@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a648db8-bf89-a58b-ba4b-bb992d68e82e@suse.com>
Date: Thu, 26 Aug 2021 09:51:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YSbryyxk5G7xqHlQ@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 943ce5a5-7133-4141-568b-08d9686660ac
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715239B8446C7DA4EF95B316B3C79@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qwopIn4oB3ZqmcCWCZSiTIgSceAOckR10o3gIw/oqHd2iG7wqsKhNaIm2PWw+HKlhpyFFGkJPeiIXsg2ubBWio3KIwn1awMkC1Y4Qn93gekulsXQ3GTqasGEvBXLvL7Y9OiKQQz/Mi6iPd+gB6fG7e6mzgd1o5mv4NfW9LVJjJs+XCz+4HzhVgiakB21ME0tzoGC+IwF/5jdzcXIjmmXYSCfU6S1rVIis8aEk1naBE8P+j7dCndi+sox0fsEH2FrU8q+zil5QnG0N3/E6n6d1pNxl8+8989DCdZ9+CrJCCC2Y/gXMvy0fgV7DurCCb8Hg0tJMUqYPYFL0gAcpRBOX2MNmlsPp9yc3URBfBnC0kQTErdNdVPSjYzVFZ57+nolfqS0HpDLr7PvY8dj8vHESRv7z+Y6HnaC1TbLdLQXPStQgtiUyKpyE9ubDRiRVxuGaIAebKeh6nEdTEcJtBr6G4unagrcw8ibi3y2L2AcS+6IQ/8JvuMOjDTyl1P9rT2GZqR0U9RDk4OQZ9u7L4lsR/eZzuR1ic8+hrA35rnDYZhD80NKkN6ykfouV08Daz8p7uK9DeMwC6hojlCRH7JgYcXsGUocjhQ/capXjmOD/seyk3BeTRj2kD1FP+2PCbqENhJ+pbTGLRLKPRxIi4Q/EuqzEqvMLtpfod5Dr9oUwgKCkakE9KYsDMUSER9JWTXSVOkspT5+jcDISY+VmjhbdBTCCC+jdL5UlTsruBiX0FU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(136003)(39840400004)(376002)(186003)(53546011)(26005)(5660300002)(2906002)(4326008)(8936002)(6486002)(38100700002)(86362001)(66946007)(31686004)(66556008)(66476007)(956004)(478600001)(3480700007)(8676002)(36756003)(2616005)(316002)(31696002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cktWRUVKbW82YW4yM01oV1ZRMzI3RUcwSURyTE9kc21HSy84L2VGVWh1Ym1M?=
 =?utf-8?B?ZUFSQ05XSmxCeHV1dyt0bGhNbEtodmd1VlhaK1A5MHpjbmNNVlQ5dGdGYXFa?=
 =?utf-8?B?elk4Q2Y1ZEdiRkwvNnlNNDVLUFA1OGtwUHZ6RHloL0ZyRW1rREhRV1lNV3k0?=
 =?utf-8?B?SW96MlZjY2xoalFvRUNmS0lsWDd3dDRpMVRNQ0NXbHc0cE40a1hNSms5S3hx?=
 =?utf-8?B?azNpYWtmRDMrcHhQR0hNdmhBWnF1VXZ1SFZrRzk2N0xjMTJFVGUzZ2wwVHNH?=
 =?utf-8?B?U3dxS2s4Sjg3c2pSUGM5Ykh0Q2NLK2l2ZnJTSFB4Q20xa2k4RWFNNFh4Z2M4?=
 =?utf-8?B?ZVcrMjRJYlBoQlNJbHgySlU5amh5UzRDWHRIczhRZWdMTFJxWGhHQXF2a0xQ?=
 =?utf-8?B?RWpXN2tTUUVUbThlN0hBL3VxOW1MRkIxa3gzcDNSNENlcTlhS3JkTC8vVjNj?=
 =?utf-8?B?dWpYa3ZFTmRISmhKUjI4VlpMNytsVkN4NU5UWDdRR0pHMzRBQ3VGVW9BZzI3?=
 =?utf-8?B?WHFUVXFBZVdFSzduVE83Y3BESjU0TDlkckxab3JYeS9lcVZMQkhYWmpaK3U0?=
 =?utf-8?B?bkd6TzdzWDB4VG94L3RRODdDWkd0OHRMbzkrYThqdnRyalpxM2poQWNvUndU?=
 =?utf-8?B?UXVTeHFzNjNGWkNkcEkycnlPcjFEOGxvTktwc0pORzA3TmRFZXhvY1JwWDBx?=
 =?utf-8?B?VDVsNXRhMnFKT3dSUGpZcHFReHdZdmJnSkN5U1cyYVdaSGVzSXUwZHpwUE9t?=
 =?utf-8?B?VnZJZWloaGZGQWdCWmpyUG5nQ0xJVHd4Q3E4KzlPeittYWJJbGpOc29JSmNx?=
 =?utf-8?B?UE5RQnpIelQ0c3pWeCtjbUloUzkvVTdzQUZQSkhSY1RBTVNsK2lZU1lpLzJK?=
 =?utf-8?B?QXhlRmhnV1VMQ3RrK3N4ZWlsbDN0dzcxVnM4am9scWl3M2paR3RmWWZqd0g4?=
 =?utf-8?B?Y3RqbEpLZytLZlZjWHNSeUR2NlloZCt0NUNiVUJZejJON05pMUV1VVkycXYr?=
 =?utf-8?B?bkRSSkNwMkQ5S3UrQkc1R2pIL2FRbEdUd1JFalB0WEFZWDVUdmdqcXN6NG9K?=
 =?utf-8?B?VXp2aHA2cTNuOWcwbDNPazlPVFZMRDBvcWFPdU8rSGZjb1hJaWcyMjhSc2hh?=
 =?utf-8?B?WkV4dGFtUkhFcTcrZHM4U2xLNzhJaWtKYU9ScXhWTmFkRnZ0UUFwVzZrRjh0?=
 =?utf-8?B?cmNaYW9zdEhhcEtHZ0hsa0x5OVlFNEtGUk5hZ05FS1o3elNrSlFCSXd1em5k?=
 =?utf-8?B?Qm9sUzlpczJMWnh0Y2htTXZxT2VpNEFZM2p2WEhnR1BXQUJTUncyL0gvcExr?=
 =?utf-8?B?VTM0OG00QkZkcnE5NUI3UG84eUJObDVXdTJRY3BaOENyd3VmUjV5eWVtV0wr?=
 =?utf-8?B?ZXYxNXZrTzhLY2htaVJJOUp0VnJyL0RwMGR0YUxKRTVIeUZXdjVoZGJJcFNJ?=
 =?utf-8?B?NjBLd2JZZFJ5QjdLZ1VFL0N4ODN1Z2ZXeURHNTJ1bXRDazd0R2FtZ3ZvSzZU?=
 =?utf-8?B?UWo5QTdIZ2RyMkdadHp5Q0UvYitXNUx0WjNONllNWldlWXZJWHhLMkp4elRM?=
 =?utf-8?B?VWZIaG01MXA0UlAyYlo1c1FCY08wN2c2SUZnSjVrbGttZjZHend1dm1zbThR?=
 =?utf-8?B?YWFZcWxicnhBaGZvMHVXT3JDS1FpZHZ6RU85MHVnYWRCWEhSN25YWE5EK2lB?=
 =?utf-8?B?cTAreEtieDJseUhMc2V6eTFGaFo4VEw4RC9rVmIwYzZnTTFrUHBhamxCWEFv?=
 =?utf-8?Q?RtSmwjcu3mVeQcAeTh/9dagoJwk9Timpbelp14m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943ce5a5-7133-4141-568b-08d9686660ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:51:57.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxO8NJ7/qZd+kBAzEoHI5dJUXTkDwbnZAaWWirKYnEZbnCy2+UJCtTZbCAZ4fpYbD5ftsAxJFVDqCVp9Cmkv1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 26.08.2021 03:18, Elliott Mitchell wrote:
> On Tue, Aug 24, 2021 at 08:14:41AM +0200, Jan Beulich wrote:
>> On 24.08.2021 07:37, Elliott Mitchell wrote:
>>> On Mon, Aug 23, 2021 at 09:12:52AM +0200, Jan Beulich wrote:
>>>> On 21.08.2021 18:25, Elliott Mitchell wrote:
>>>>> ACPI C-state support might not see too much use, but it does see some.
>>>>>
>>>>> With Xen 4.11 and Linux kernel 4.19, I found higher C-states only got
>>>>> enabled for physical cores for which Domain 0 had a corresponding vCPU.
>>>>> On a machine where Domain 0 has 5 vCPUs, but 8 reported cores, the
>>>>> additional C-states would only be enabled on cores 0-4.
>>>>>
>>>>> This can be worked around by giving Domain 0 vCPUs equal to cores, but
>>>>> then offlining the extra vCPUs.  I'm guessing this is a bug with the
>>>>> Linux 4.19 xen_acpi_processor module.
>>>>>
>>>>>
>>>>>
>>>>> Appears Xen 4.14 doesn't work at all with Linux kernel 4.19's ACPI
>>>>> C-state support.  This combination is unable to enable higher C-states
>>>>> on any core.  Since Xen 4.14 and Linux 4.19 are *both* *presently*
>>>>> supported it seems patch(es) are needed somewhere for this combination.
>>>>
>>>> Hmm, having had observed the same quite some time ago, I thought I had
>>>> dealt with these problems. Albeit surely not in Xen 4.11 or Linux 4.19.
>>>> Any chance you could check up-to-date versions of both Xen and Linux
>>>> (together)?
>>>
>>> I can believe you got this fixed, but the Linux fixes never got
>>> backported.
>>>
>>> Of the two, higher C-states working with Linux 4.19 and Xen 4.11, but
>>> not Linux 4.19 and Xen 4.14 is more concerning to me.
>>
>> I'm afraid without you providing detail (full verbosity logs) and
>> ideally checking with 4.15 or yet better -unstable it's going to be
>> hard to judge whether that's a bug, and if so where it might sit.
> 
> That would be a very different sort of bug report if that was found to
> be an issue.  This report is likely a problem of fixes not being
> backported to stable branches.

As you say - likely. I'd like to be sure.

> What you're writing about would be looking for bugs in development
> branches.

Very much so, in case there are issues left, or ones have got
reintroduced. That's what the primary purpose of this list is.

If you were suspecting missing fixes in the kernel, I guess xen-devel
isn't the preferred channel anyway. Otoh the stable maintainers there
would likely want concrete commits pointed out ...

Jan



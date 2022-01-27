Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6849DBCD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261210.452018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzQq-0006ws-Dz; Thu, 27 Jan 2022 07:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261210.452018; Thu, 27 Jan 2022 07:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzQq-0006un-A9; Thu, 27 Jan 2022 07:43:00 +0000
Received: by outflank-mailman (input) for mailman id 261210;
 Thu, 27 Jan 2022 07:42:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCzQo-0006uh-CP
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:42:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be369156-7f44-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 08:42:57 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-mXNwnnThMJGTs0sAk0-khQ-1; Thu, 27 Jan 2022 08:42:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:42:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 07:42:53 +0000
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
X-Inumbo-ID: be369156-7f44-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643269376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RINe/sfjcwAJCP+inZj5eo+3eUA8LlCbhlqW44NXc80=;
	b=k3MVE6b3kyAF8FBshoMDGGeR6+O8SYCns82iP1D9sZNwvTZRtAEMwyHN5kZiPsc9ai+yZ7
	0CbeWhdJ6SFwANb8qqySK2+gsGmbc31APmNS5Xm1z4NwHD9EjmEPlvGU8zDCmyFFaswU2C
	R4mObe8lFkQ71wy5vB+XgSRdCq7KS7I=
X-MC-Unique: mXNwnnThMJGTs0sAk0-khQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y80pH9Jc0YgDC+Hfm8KVnJnz+8auzeLX3BRs/BFH8szWBLvX0n20DYZTjy3dQ2mkd9FjrclN8pmIJulhZ7uekHXwNuVi0JlScnIPpooqj54KMtZ/wU/ZKLRfxNACb2yO207KLw8L6dFZIN3VunPu62geYK/7OxiZFShv0u2UD/8QgOUicYGcBQ4cfwE5Ojoi2y27hSqHtU8XkMR6dI0HSPNL7aUBywqQRCgApGLXjdQQmUHqrpqatxgXO5hxffEjqFSuM+rPxfpJBbmKDP80alW2y4yGGY2ykO7PnuJ1phCCLXiriTIybjxL/cugXybQZP6ArPGLl93Ist+VneX6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9HqlyvP4SB57BoGyPsLxg01/ovhW/UsC/I5kH2W7mQ=;
 b=heZesLd9W56r4ueFOTbRL83vjc5NEdDvwXeD7aQqI2+B/P5pu7aL6IwfD75YueH/8s0tEibaqZ1G4geZy1umIL9mKSbehxZo7jKUUmQCM4TxqhFeGuSkWpIjo4H/CGGCT6y8Yzien/OJhsSt0jXV5harxCjz9KDUBpXVl0SVCPC9Tbj40lC8Q+qnlDMGEe8lTo8w8g4gJhq0ZVVDsLHGJQgh/1h1Fjs6Rq9c1fdNj1+Er3b/t5ogFX7axA597RKvbi6N/P5cG3pbhNfxepF1SB37gr6rV8P9CRn4q6/xJU1++Wf2dHls9vOs6V6cqSqybkdFBs0Xtx85TpJXKl8QjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62fbb4b6-7694-be4a-8a75-2380192f5533@suse.com>
Date: Thu, 27 Jan 2022 08:42:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] x86/Intel: Sapphire Rapids Xeons also support PPIN
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
 <0a8981c6-b3fe-c805-f45b-b6da5d0aa1af@suse.com>
 <e9aae44b-1fd1-2952-daa1-fa36e89eeef6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e9aae44b-1fd1-2952-daa1-fa36e89eeef6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22204258-a4a8-4974-0b92-08d9e168a04f
X-MS-TrafficTypeDiagnostic: DB7PR04MB5450:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5450F9223CFBE82B01EBF018B3219@DB7PR04MB5450.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KLp7XXbSuv3iQLfn/QUe8KbG0Y+9aeSI9gKBq7Bt7lS6jX+P30unQ6MqtalnPxHImoCNLguVmIbRiOIy5Cy1NIrMhhvfvdK6QNytEa2n5EB636D8lVHSKY0fFihaS9M2J4vj1bJt4ggJ9BnWpyYxowt19xGoEwptW5Hstu1okJT2riLXs3vurgZEMHhp39iPN+kgm6UGAqLaP69vdF1OBXBYdaPj1+xwqQCZzxszfFcpLQddv3taedPw1wISpSY00LzcjXeo7ciOJzxX4WBqcS7IRUcDejg0aHna+Hhtoy5Hz5RmIthpwlLcN8pBQxrJOR0pPX+I0yv7ImgbJFHNnhiNRv/2V4JUmEM9cyqLk59nW3BgGUKsg0f7c0bVHU3ugaKrT4iHE1RNrG7TfwyIzjS9witKQeA1Y0gDbshvu47fERraWN+WIHHfkJUaJ4isrkZEjRfA4C8MLrsG6cp9nCE9mUhAZUN40+wLxAph0AA2rzol1ZF079dfMmSC66396xon06ErukJq3Z9iZOTMX0m8FfYLHEvRyBBEZIAWx8CD5x3eDpjwDJH7IHc1sNTstT3fUvmpvvnNTcRJ20HIJbXOZ9s6KnhjDNOYR3uScxXgU5WzmKuZVkEbF5QtaJ0eNTGrIMMW8yGSlKA8CSHSHajwShergMxpuQBXv3dr5rxIaNQ4QVl7SJi3llnxeEjeM+mA0LSihTWCJzhkS9oI8NvE38blWpepiypwWEhRh+BCUNipFBPg1V3URWKdz2qYCYbLiH01jTEUqK8XnnvOY5TnxMs+Vvms+I1DUMgPL3GmdypUDwaxGSJ4q99knXit
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(186003)(26005)(316002)(6506007)(4326008)(8676002)(2906002)(8936002)(66476007)(66946007)(66556008)(2616005)(83380400001)(6666004)(38100700002)(6486002)(966005)(31686004)(5660300002)(6512007)(6916009)(54906003)(86362001)(508600001)(31696002)(36756003)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PqZR01jgVbefDd+EWGPJqHMNAR9ZDK5i+Pwekw0aVIWJ3iZ9CgIE1u/upYZZ?=
 =?us-ascii?Q?xkwZKIGQAmIhlskpWOqUW0AC2Pau4Hkr2Zu9khELjpPZcImKrNssAWwuc2T1?=
 =?us-ascii?Q?i8JQ5sOsJDh+9+ANkFDDcguzAgBSLQo9PbHwQxvfXWF9mXBMQlAHe4eJ0KHp?=
 =?us-ascii?Q?2SG7O7D8GNnLlFQTJ/5yb8tsfCw33XZkuQm2UAgBtIZbEwyx5qrpzeNy2UzR?=
 =?us-ascii?Q?t4WmN3S9Z2751ImEJyosDcEugxfxnL/euouFT1U/V26BmTHaogvvkAFbUJQU?=
 =?us-ascii?Q?zwalOnHOtzY10uQrCDpclOp7x94/KHVKsAnEG8w8vgtMGZJ6xPgqxUUfYcV2?=
 =?us-ascii?Q?lhf3H3/m6KLLOzzMhL2kJIzgRk/KF0L/M+EVPGlfRCaB1pZyf58Xt7/tFYe6?=
 =?us-ascii?Q?GZpagR7JsSfnG4Uq1VgwsXCEOeEoRdtVv1dicHUmL1oBUmxFDNSXUrzwM65s?=
 =?us-ascii?Q?NTX9ICoW3k+CV3XgZPjcIg1HOsH+1LnWSrSts8q3wPcRUM1Rzd8sZidTDd9B?=
 =?us-ascii?Q?cRM1qF5i0r8jluAFyHBKr/j2pJOf2ciFwkxTgo6V7jmhKPTEVX3DZYyFYVsL?=
 =?us-ascii?Q?OpqmzcjbMqZ6ejlf1Q2obKlwe5JmRhnTgT7H7j4Bh9S2ixseCkR6ByUYKTuA?=
 =?us-ascii?Q?PHvxcnaZVwyRVRclKCMl+5s5Ptf3iQ6du+Tlni8LvSe7ufmo5HRzRn3LNKzu?=
 =?us-ascii?Q?ZPhcYfSLoDNE3V4sZkBGIp+ed3bZNpgj4mjtlCmWd1mfBbnLoNWyWq5Lu9z8?=
 =?us-ascii?Q?59DSwOnH4d+S20cm5HPU8kJXsfRPVev95FUihp3knfZjvwCsQdKqDWH/J8xt?=
 =?us-ascii?Q?t2HH05Rww2DmbT+GGmNxquD+iiayuZMwCmM4gJRhEIuzRhS09T5EvJ8shujS?=
 =?us-ascii?Q?OsWyoagEJ2U5Bp6lEVsLBaQAnDhCuRPWo5c757yg1XWRuAZaqvcTOnP8taAU?=
 =?us-ascii?Q?zbSFXAE0nUxR4ia0JVoERoSpYoJ1fSS9iTKEn+wGc6WmkXExbNLZPkbKHedH?=
 =?us-ascii?Q?fb5nuMCh+0bfa93eL1dCiGuFctAh7jtg8/LBkyXrBYtfYoRdgO2MdSK2LuhG?=
 =?us-ascii?Q?vSX0HWV9du46+FsYS+5PYmGQj1jumPd+q8sQ2lfbs5Sh17nHMqRq0CEipnB0?=
 =?us-ascii?Q?wLuQTK7DzCX+w3cygFvqLtMuc4FJeoWCrayAD3WZJ+i39Iteyafb8UN+vVul?=
 =?us-ascii?Q?J31BSrJ6Z0W/FhLQ55xaemFOahOfdLxO09YpTt3lnvrAzczlt7HQ61vpCLZg?=
 =?us-ascii?Q?b2lfvggrFvJLO7lwyNEO3JDNHxQv1/WrSwKoGchWxxhmk3JxGOe4kZF/J/st?=
 =?us-ascii?Q?ufHm1mKiovTblCkUkuLECXE59aSz4J/ZWqJ2Qv2be1C4U4/ARgEJPCYCwuYj?=
 =?us-ascii?Q?ScvKvYdrnQOg1LnpZbkfmmrSoSE/4osyLxM4lIQAqj2gGVdWwFBwGjLnMONW?=
 =?us-ascii?Q?RbhNtYQhn+wZvmIBN2RQLPSiG4EFGovrGv/N92bXk0RTtd0NklHPjY7xKcNx?=
 =?us-ascii?Q?j7AJ/p81c8gBViRXCubkgkCwqhHVavaSDPaq8tAhbtK7YEFF41zTLH1uZvfr?=
 =?us-ascii?Q?B90/CUjXxVueV2/vGM4kht6ungvtfnceG5WaiRT1Kxav49HwYcHHwCWHc5iX?=
 =?us-ascii?Q?8Q5t1dDUsGL55wCReDoTwko=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22204258-a4a8-4974-0b92-08d9e168a04f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:42:53.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haMX9J7uYwhZ5VST0X4KjvHkHHC6z5WR+jRqSEOlw5GORLac2GWbFfhIUZEOiYyn59nJSJcaG4a8eMtX4lTkeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5450

On 27.01.2022 00:01, Andrew Cooper wrote:
> On 20/01/2022 14:16, Jan Beulich wrote:
>> This is as per Linux commit a331f5fdd36d ("x86/mce: Add Xeon Sapphire
>> Rapids to list of CPUs that support PPIN") just in case a subsequent
>> change making use of the respective new CPUID bit doesn't cover this
>> model.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Sadly,
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx=
86/urgent&id=3De464121f2d40eabc7d11823fb26db807ce945df4
>=20
>=20
> IceLake-D too.
>=20
> Preferably with this fixed, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com> (to save a trivial repost),

Sure, added. And thanks.

> but ...
>=20
>> ---
>> It is unclear to me whether this change is actually made obsolete by the
>> subsequent one adding support for the respective new CPUID bit.
>=20
> ... Sapphire Rapids doesn't enumerate PPIN.=C2=A0 Hopefully Granite Rapid=
s
> will, but everything SPR and older will have to rely on model checks only=
.

At least in theory I suppose they could address this by as simple as
a microcode update?

>> It also continues to be unclear for which CPU models, if any, the
>> PPIN_CAP bit in PLATFORM_INFO could be used in favor of a model check.
>=20
> Presumably none, because you need the same set of model checks to
> interpret the PPIN bit in PLATFORM_INFO.=C2=A0 It does beg the question w=
hat
> the point of the bit is...

Well, if the bit never had a different meaning, then a model check
wouldn't be necessary. Just like e.g. probe_cpuid_faulting() doesn't
have one.

Jan



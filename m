Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500414502D6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225766.389936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZc0-0004Or-5W; Mon, 15 Nov 2021 10:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225766.389936; Mon, 15 Nov 2021 10:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZc0-0004Ml-1f; Mon, 15 Nov 2021 10:53:20 +0000
Received: by outflank-mailman (input) for mailman id 225766;
 Mon, 15 Nov 2021 10:53:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmZby-0004Mf-DB
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:53:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d06ba39-4602-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 11:53:17 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-_9_A8vXJMqCmJK7Fo9hcyA-1; Mon, 15 Nov 2021 11:53:15 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4786.eurprd04.prod.outlook.com (2603:10a6:208:cf::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 10:53:14 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:53:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 10:53:13 +0000
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
X-Inumbo-ID: 3d06ba39-4602-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636973596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KN3ePiI6GeBSPSeb4ccUFJfuyCM39O48V6bX/yQW54=;
	b=U7VBkYcKUIocvTprLlBcbQLgSYiaLIeQuzCMqteZUEb5o/PWLm0Z3q20S3BClij8G72TV6
	5iUQvTGqlM7m9/K5o8Ytl5ZtHpJFgH0VCS4QcrgOLJ4z3e2vm4meUOXnnL2lbAlBQ1jldU
	kgglkBdZh6GGT8PK/fMeSmz60mhqJbg=
X-MC-Unique: _9_A8vXJMqCmJK7Fo9hcyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE3aiNOwTHUWzj0TuEK1f/Vnb0T0Yscf4qZJ6ddTMlxf9uOxmepUbwShTBKDDgtD3TW+bQrPKwVdBPdW0oBakzrkmMYV3B6dxW6+G2XIKt+4wI+ijfb11YS+f32DpiYw0z0+EETUJAUpe26VdzpB7ivplqHFxGvVoyVYY66MFfvAxHlaCNQZcc4SUc3C6WmyWiVsMa2jr1a0kLvZPfnqHaRb6bJObUc1un3J+PH3P17aT4wl0cMU9KpyIW/3Pi9RTtZstQateSwd8V9BZ/0lXtlYduFGzx5MamcEsaDFxjxKxUzdhh2mZJOVbMZOWY9xd3ZfP4UOgdQ2KklN06Q/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or9Kc/1vUCv4uv3k2mgwU5nIxwzq7s3zvgLXuADxHs4=;
 b=BZvosckEyZuibg+RLrtNInE2ca67zTmKtesNXuOYHSZuj/GliajT7BpeloIS9G7bRWy0w5sb6qhr27h+hv5EwMIotSdTtljJ9V/aMkZ3LQCf9B1BXoz/yI+QGbjopfHP4oo0KpNFQE5/VN/we0weC1iGj78i19BxmADwRXH6UBOl0TwX/ama/XdkYDDkpU84gqYOC1luxV1Jkg+yffUM6r+tmz8ephPO3F/Mu3S9/H+JRC2jaWXNbDzTw8BB0IbyT0x02h/WDZT9D22ddV2byegQuska0vRmtc3WmQDU7SsyAZDfaqnTUvwmcKO4htnO+yQw+cHT2ExBz0vebRxm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <008467ea-75af-acb5-62af-bd1db03ccc68@suse.com>
Date: Mon, 15 Nov 2021 11:53:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jane Malalane <jane.malalane@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
 <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d1978235-f025-19ac-707c-c2e411a5a005@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::33) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1dd4db4-6ee1-4130-0bc5-08d9a8261f54
X-MS-TrafficTypeDiagnostic: AM0PR04MB4786:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4786A964F8B2230F1FE2F0EFB3989@AM0PR04MB4786.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pV2sfXyWlHTmATCo1Ad/04KL/7i1vebvXOgxP356Rp0rp5flBkx75k2gHzU/rrNCaUulkO7BSUt3Xcvjv/MjvWJO7EdcxR+s3pt6zVyoTKMi6fuEEyRuQxVUk0mi8TCuRYQXFzrhT+LlLpMgDDLB9sMqsEWvaEld3iUsD8J1ibXiCZABnEXHLOT/GpRZ4M4L1KEgU5GaqCNnEQjIQynBRUxdzUvM7cVLxrlQ/cxojITjlC4eyX4h6qn4iUTH9BKdcVGdyF92JRwVZ5BM4D7YufYz8rW6vOOBieEUL9sR28xEL6OMusFiUXRZS9RP9dO1KwsdAwrh0lYgiEKzyzcaxCskbCbuC7kF4rCh5LIMRrjuVoKk10aLpjqmmbz4FHqmMBaArGgBToq84TfC0xIN/15qJG45F+Y4CtI7vBm/WHCMAQdCgsLE+/NArNUvLdoNrOarA2aKJ0bBZ1gCboVLJLTQxHIgKsK52gMGudiv9943wBm8wvhuEH2gd7I1k6Vr0YEDHfGOI2Xpn+uDSFFpBWV/eK5DDReVbNRNnBFOAJRfXJPy6J81Env+ZodTxoZB0qUb8qtsf8zs53+0PYA6+D/GHts3xraKQVSdk2jL+UtYXoqkavP6WGlsK1S23h5uJQoKmOfZnIxQnk15iNRpus2FeyOKnuEdYumxJa2Yt6D/y9aFL28wi5bgDbAJEFHZtTidRvjzYuh+z+lA4usWtoQEOWelm3fcTrM4W80mF30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(8936002)(6916009)(53546011)(6486002)(4326008)(38100700002)(16576012)(316002)(508600001)(66946007)(86362001)(66556008)(5660300002)(2906002)(66476007)(31686004)(31696002)(956004)(36756003)(2616005)(186003)(26005)(8676002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pm7nyeN9PCf1hfCLdC3bdf2YbppW8YEfp6yy0D2J89HYS+tVZIWpfQCtXHQ/?=
 =?us-ascii?Q?hAkvEZ6amgeoimomZIiBNgmUnDhI3cSHVsqGttVB7IP9rMMZVcMl1ZeGRQW7?=
 =?us-ascii?Q?c0wKtzqiMbtbIvZmLO9chvE+lYPhO5CZI47UmEOw9f6GJ4A3VBUBI1zS+Ngt?=
 =?us-ascii?Q?4V9FEZHUpfljj0k2cvtxW9oudulMy5yyDz1nK0A4pCHhmHBhRoZ+lQKma0I6?=
 =?us-ascii?Q?kUBcC4guGQMM1pQdO5+JUGcDgLFTqx8VnICpDKgVzXxzCSED1JMyaIpQoU6Q?=
 =?us-ascii?Q?q0wWBUbXqz59yBWBaggUTHwlm4IH+8gmKsszY2MbUgGr3GCxT7pCCP1JTuUG?=
 =?us-ascii?Q?IUqhz5wLJZUfWKDY3w1jg2YHv22YhNr28kM3kjIlcWgklEzm/Ze9Ik/plUMO?=
 =?us-ascii?Q?O7GAb6o+L/F+rHYkz0UHj44ieN9z4qDeyiKSnqz4gOFltkf8tCD5Jixgq46M?=
 =?us-ascii?Q?I+r8Vwl5JqZNQ205bYUKocRZKI3KzljFkcIX2A7GPmAVQEy5T06T7REdg1Tg?=
 =?us-ascii?Q?rCG6MWDmUg702Wmt70ZXYr6VaC+YAxGlnbf7lewHhLNU8uO91sBiIFa9U/XL?=
 =?us-ascii?Q?y0wbEHQ79+680Zqipd287FIM+pTxyQBVphsu05i6wc6lRd2BeQ+tmC1pzYXn?=
 =?us-ascii?Q?J5eo8aTzMfA5v596uPwC54uHQe9HYg5PqHXecpIKAc+zd+hB6oX18xODwMab?=
 =?us-ascii?Q?E97GcorLCziNp0cJskp05HYsVxlgtBjMSB6OwiHZkaPkhlq8wYOeDgWxiGJb?=
 =?us-ascii?Q?2oCLqlK55r61tyKAIVk4I6RBR2tWf5889HqKi2IlidAtgY3Sfi59/R0tNea5?=
 =?us-ascii?Q?d/9YgKZOF9CjS1+CiDaueoP0MtQUq372Pj3I6/CGx0laGY2Z+Pz3MLDsg1Vc?=
 =?us-ascii?Q?+gdrxX67a7PGzBSFW8Vcw9nYI3by1FnQ9BzVDfVieTfVbkTKWu4Ob3vlavN8?=
 =?us-ascii?Q?tMbH+I5whc+Y1lD3Zr49i0VDlKWx/SIBFJ/fT6qBSBdFSZpBmpgZVNhIxE5r?=
 =?us-ascii?Q?dgGiAHbznxaxSY2qakQH8G2Yi6L9zuBbC8Xzv0fyeEhJDHygup1oKH8ql1i1?=
 =?us-ascii?Q?eORRdwxU7+v/EdLkdHFc0kXMx5XLQpv2i8KeEOaN8RFPdWIHWG4fJ1wwidFo?=
 =?us-ascii?Q?mBka2AwdFVRArAa1PaYFvn+fkfeQDJ3tlXZYt5l6yAtddpM2UPHsH9C/T1CZ?=
 =?us-ascii?Q?gsUouShYWlYp9yCnVMXWOaNc32vb0uTTRjL2fsBWX6As8QaG2U3EnIpzLWte?=
 =?us-ascii?Q?R/0d9PfIyPFpcERO6WlQ+LIdTIaN7Ff2OTMgOmuiknLF8T+JDtIkyi+O+amU?=
 =?us-ascii?Q?2Y40tKgBH1cp86x642izsbg2jhZCHXdjxZW8h4dc7pxfQxuUTRT8vm1XNMU3?=
 =?us-ascii?Q?bn6nLLOOuwyqvDsKGtjw8YXNN3CvdJo2RTPKvGL6/X0Yb6nsQ0S90g/aMJjH?=
 =?us-ascii?Q?ADciMMVXcwb2i3qITVbplzqToQ1c/0NWizWt0MlLiWLgIJJ3cMOk9uY/Y+Xp?=
 =?us-ascii?Q?2mWj6TvtuvJJfI/2FzTEwE4RCS76+FXuSQ1XqiuNGlJdG/fvA//KdUQdbZf0?=
 =?us-ascii?Q?UsZUXqjSszPNB1eGTyB6m+MuFu6KXA4MZGExHkDtRw9ryBZUd3dEMJnYWygJ?=
 =?us-ascii?Q?himzlc3igNBBxQS88X9PbSU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dd4db4-6ee1-4130-0bc5-08d9a8261f54
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:53:13.8880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wH0n4eu7UZvkZ8Vrfuo2EFQ22pyzXOlxp3G5AvTdAIivXRq8dJMPSLl7JjmXPUyL1R3/RvJEZ7T2sXUhUSELdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4786

On 12.11.2021 19:51, Andrew Cooper wrote:
> On 10/11/2021 09:19, Jane Malalane wrote:
>> Before, user would change turbo status but this had no effect: boolean
>> was set but policy wasn't reevaluated.  Policy must be reevaluated so
>> that CPU frequency is chosen according to the turbo status and the
>> current governor.
>>
>> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
>>
>> Reported-by: <edvin.torok@citrix.com>
>> Signed-off-by: <jane.malalane@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Ian Jackson <iwj@xenproject.org>
>> ---
>>
>> Release rationale:
>> Not taking this patch means that turbo status is misleading.
>>
>> Taking this patch is low-risk as it only uses a function that already
>> exists and is already used for setting the chosen scaling governor.
>> Essentially, this change is equivalent to running 'xenpm
>> en/disable-turbo-mode' and, subsequently, running 'xenpm
>> set-scaling-governor <current governor>'.
>> ---
>>  xen/drivers/cpufreq/utility.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility=
.c
>> index b93895d4dd..5f200ff3ee 100644
>> --- a/xen/drivers/cpufreq/utility.c
>> +++ b/xen/drivers/cpufreq/utility.c
>> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_state)
>>      {
>>          ret =3D cpufreq_driver.update(cpuid, policy);
>>          if (ret)
>> +        {
>>              policy->turbo =3D curr_state;
>> +            return ret;
>> +        }
>>      }
>> =20
>> -    return ret;
>> +    /* Reevaluate current CPU policy. */
>> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
>>  }
>=20
> So, having looked through the manual, what the cpufreq_driver does for
> turbo on Intel is bogus according to the SDM.
>=20
> There is a non-architectrual dance with IA32_MISC_ENABLE bit 38 (per
> package) for firmware to configure turbo, but it manifests as another
> dynamic CPUID bit (which I think we handle correctly).=C2=A0 It has the s=
ame
> semantics as XD_DISABLE and CPUID_LIMIT so we might want to consider
> adding it to the set of bits we clear during boot.

This is quite confusing in the docs - at least one of the tables calls
the bit "IDA Disable", while other entries at least also refer to the
effect of disabling IDA. I'm afraid I have trouble connecting turbo
mode and IDA disabling, unless both are two different names of the
same thing. Maybe they really are, except that SDM vol 2 uses yet
another slightly different term for CPUID[6].EAX[1]: "Intel Turbo Boost
Technology".

> However, the correct way to turn off turbo is to set
> IA32_PERF_CTL.TURBO_DISENGAGE bit, which is per logical processor.=C2=A0 =
As
> such, it *should* behave far more like the AMD CPB path.

I'm afraid public documentation has no mention of a bit of this name.
Considering the above I wonder whether you mean "IDA engage" (bit 32),
albeit this doesn't seem very likely when you're taking about a
"disengage" bit. If it is, we'd still need to cope with it being
unavailable: While as per the doc it exists from Merom onwards, i.e.
just far enough back for all 64-bit capable processors to be covered,
at least there it is attributed "Mobile only".

Jan

> Therefore, I propose that the update hook gets renamed to update_turbo()
> to more clearly state it's purpose, and that we use the TURBO_DISENGAGE
> bit as documented.
>=20
> If we're going this route, I'd also like to make this hook consistent
> with others, where we IPI directly, rather than having an intermediate
> function pointer just to send an IPI.
>=20
> ~Andrew
>=20



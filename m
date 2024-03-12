Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B12D879D3B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 22:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692194.1079050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk9LH-0008EH-Hq; Tue, 12 Mar 2024 21:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692194.1079050; Tue, 12 Mar 2024 21:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk9LH-0008BQ-E9; Tue, 12 Mar 2024 21:07:23 +0000
Received: by outflank-mailman (input) for mailman id 692194;
 Tue, 12 Mar 2024 21:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eRt5=KS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rk9LF-0008BK-9x
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 21:07:21 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8229b3f0-e0b4-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 22:07:18 +0100 (CET)
Received: from BN9PR03CA0358.namprd03.prod.outlook.com (2603:10b6:408:f6::33)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Tue, 12 Mar
 2024 21:07:14 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::3) by BN9PR03CA0358.outlook.office365.com
 (2603:10b6:408:f6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34 via Frontend
 Transport; Tue, 12 Mar 2024 21:07:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Tue, 12 Mar 2024 21:07:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 16:07:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 16:07:13 -0500
Received: from [172.27.105.181] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 12 Mar 2024 16:07:12 -0500
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
X-Inumbo-ID: 8229b3f0-e0b4-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPb7m4Z9is1mUzTYYV78kYLQfOZfn9hkJMkUtd5vDDQcDFLm2pTSeGUCD3JJeEA0QAtaCGQ3Mod3xa5JZom6ytZNg7qbMzHOUKXGvCXG7S8+5GRAGNB5C0NtCCBitqWcavH6IzzhTgO8fFHsy2iQUMZzDFuflDWR8lm6UHmFv12SPYRKuqsKk7GrgnURp+8I92ITX5UhAW7j8tSAjmHHVVMvW2hzg+bAeh85eptSCrTvnSiLNbaHyLwAy8ifTKVgYJP9XEEC0PTaaM/U5tRL8/TEwVgujhIshCDfBy8TUECG9E9mJUC+iUGjB9+Y27J+3maiA8k79G5hoMZ354/lXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kmh5UqZ5R5kQnbVbB8JNHjk/o5Wo9fYO0iZUT8Ma4f8=;
 b=dQTyCN9/ivjyazlkCae6+agr/ru/aFI2gDGUMcmJijeqVuVzQvnpNjZ2QwFf8m5tJdQVAw1MI7hTsQdoZKdpcjFwX7MoipYxYccmrEBeGwVjnOH28HTyOm2Iy4teauxpF8Ha7aOCLK1OGQ6fDMY+XzbliKzib20sg8AoYhBfnxef7uY9DVTSMXPudgM12YA9At/jhnNtog0915NoSGyIc9JeMj4PUtxPqT6S+cw7fbgNNmuthINQwiimjebYtqWsZ12rkG3i+ff0ur0sYsVALCrLrdRLCY1IVrycM72CoyCX8GVu+FrjKn7AHvOAPYXV1fT7Vq9Zd5bPR09debUX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=invisiblethingslab.com
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kmh5UqZ5R5kQnbVbB8JNHjk/o5Wo9fYO0iZUT8Ma4f8=;
 b=lHqZrI++k/X/w/+7pLeuxz6wMk20odao4VsZN7u8waERONpsLz+R7tTF9EKoWmMLJ0UaI1CuQrpjwdbZewXa659XlZjgvXbewhoPkEARRuqHoJ0VIjI5+voVoMe35pKeWZSKG7LPAcReZf6PyCU/wMscSsRA5hwOghWQjFkGigI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9207a620-2998-49dc-992f-5d756d3f6524@amd.com>
Date: Tue, 12 Mar 2024 17:07:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, "Juergen
 Gross" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: Patrick Plenefisch <simonpatp@gmail.com>,
	<xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zap7uX3k0kfoMOoF@mail-itl> <Ze2-dkQkn41WJ60v@mail-itl>
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <Ze2-dkQkn41WJ60v@mail-itl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0946d5-9004-491f-353e-08dc42d8642e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KbDvYFQ3ovh1Zzt1ePn0mmmA1YmBuFuOycvd9wdFk0cF/bS52uyxfAdBT3CqfzYVV+1PCZXzp0O70+MLoAve7CK+VfdXg387dsTWCf+VOroJpYOFftbDNhMjtjDR+dyDezbEpVJrAHyDzguYRuCfd/mhoTxQA5xWwlrbOTmh6v+2aY+H79towgvto+lsxezqlXKkN84Potx0YvW3We4AZl53slBAeN7DdfEO0jxknSBara913LgDtHFPsHTPO131IPTEkA3VJ+pxv/oveSQAgR83gwHqsJvJHX9Dd36IMyXsGxQoOp4EDc5aw22LGZ1hDWyGkrL6zhmtustjK6wwaEXpDtWIWmVs5f6F9/pxZzN/VHc2bMJdgLe0X0aAigaYss5dKXOR3/+Fhwu9SwinffA8+I96/VdbNMxSbXk8VAFcDt46hzF5+UsVeYFu+NRZVkwVhdNZTsbgbk9RVV0ks6ghl9vJCCM20uI+9TXPVnjhk0RCUeFpAQEqRSWQ18BYR3EX/wRWJNDUcXOVHPWmXpsMVH8efzqQQMjla1Qp+FvJq7Xras0NkVwFWfNgAaUM3Sjof447eoL2IGnRsg/8e8Q8IlQ5IQdVQqjVqG6P+moRtNzVUmyqPyCMpaGLbWLhfyeYYvUXR2w4z4rQph0NKUTcQ3W704dba53Lf7EDfBrCiKiEKWVAP7xKAiOoeiml6O+D/E6HewTtUg80NWOSFuuiE9J+yDq+FWJmqLgU49fV/ZBGObRFxncDF0S2Vv3h
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 21:07:14.0574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0946d5-9004-491f-353e-08dc42d8642e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290

On 2024-03-10 10:06, Marek Marczykowski-Górecki wrote:
> On Fri, Jan 19, 2024 at 02:40:06PM +0100, Marek Marczykowski-Górecki wrote:
>> On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
>>> On Wed, Jan 17, 2024 at 3:46 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 17.01.2024 07:12, Patrick Plenefisch wrote:
>>>>> As someone who hasn't built a kernel in over a decade, should I figure
>>>> out
>>>>> how to do a kernel build with CONFIG_PHYSICAL_START=0x2000000 and report
>>>>> back?
>>>>
>>>> That was largely a suggestion to perhaps allow you to gain some
>>>> workable setup. It would be of interest to us largely for completeness.
>>>>
>>>
>>> Typo aside, setting the boot to 2MiB works! It works better for PV
>>
>> Are there any downsides of running kernel with
>> CONFIG_PHYSICAL_START=0x200000? I can confirm it fixes the issue on
>> another affected system, and if there aren't any practical downsides,
>> I'm tempted to change it the default kernel in Qubes OS.
> 
> I have the answer here: CONFIG_PHYSICAL_START=0x200000 breaks booting
> Xen in KVM with OVMF. There, the memory map has:
> (XEN)  0000000100000-00000007fffff type=7 attr=000000000000000f
> (XEN)  0000000800000-0000000807fff type=10 attr=000000000000000f
> (XEN)  0000000808000-000000080afff type=7 attr=000000000000000f
> (XEN)  000000080b000-000000080bfff type=10 attr=000000000000000f
> (XEN)  000000080c000-000000080ffff type=7 attr=000000000000000f
> (XEN)  0000000810000-00000008fffff type=10 attr=000000000000000f
> (XEN)  0000000900000-00000015fffff type=4 attr=000000000000000f
> 
> So, starting at 0x1000000 worked since type=4 (boot service data) is
> available at that time already, but with 0x200000 it conflicts with
> those AcpiNvs areas around 0x800000.
> 
> I'm cc-ing Jason since I see he claimed relevant gitlab issue. This
> conflict at least gives easy test environment with console logged to a
> file.

Thanks.  I actually hacked Xen to reserve memory ranges in the e820 to 
repro.

I claimed the *PVH* Dom0 gitlab issue.  PV is outside of my scope :(

Regards,
Jason


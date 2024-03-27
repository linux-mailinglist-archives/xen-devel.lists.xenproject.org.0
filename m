Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6158788E722
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 15:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698591.1090460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUaf-0007TA-Jh; Wed, 27 Mar 2024 14:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698591.1090460; Wed, 27 Mar 2024 14:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUaf-0007Qd-Gt; Wed, 27 Mar 2024 14:49:21 +0000
Received: by outflank-mailman (input) for mailman id 698591;
 Wed, 27 Mar 2024 14:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpUae-0007PI-1F
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 14:49:20 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eedd0d3-ec49-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 15:49:17 +0100 (CET)
Received: from SN4PR0501CA0117.namprd05.prod.outlook.com
 (2603:10b6:803:42::34) by SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 14:49:13 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:803:42:cafe::3b) by SN4PR0501CA0117.outlook.office365.com
 (2603:10b6:803:42::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Wed, 27 Mar 2024 14:49:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 14:49:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 09:49:13 -0500
Received: from [172.31.131.34] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 09:49:12 -0500
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
X-Inumbo-ID: 2eedd0d3-ec49-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cxcm2U7yMKvyD5NQ2xkcpDKE0Wi1mn/SgQ6z/+WVMUUURXM3lS5ehTnPldkf9gs8qNN/aChHZMm9YPnpBLbCccNYFKsb6YNF2fASyQmmNor2I8Wsvzc3/U5izeUXwfNj9lGBZhJjUxkUvIPW795c6fYhoZAmEpmhmk6f0EWvG1Fcn3RK+eJa+NUqMcht3601gsushdWWKd/NaQ6lGms2AFfctBp3l6i+7b/hOI+5WvBqu7/Kz2xOdO7OslGQoyhttQzlT0KTCnpkrA8pkCuGPDpUm+T+psedLJg1hlWxSMROwsf5ZWgYSNsyujTVhEgWEMDJH5lAJWCSIFsQt/2rGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/wHybwKnqkOrPy2lrQ1gouZB8NQXFES5OR2FLFWALw=;
 b=npXxmG1vGBOBFHBIQRcRWGcRiDE1Y8QI/y+3vPbu04luyc02gzoR0okekGi723mbThNyI+eFlYa//w4d3kAA5P4HTbmKLLHzSWSFJpoK32Fm+3Q9UsOg6Yih9MgqPyyqVQdZehJ3MEucHV/fN4IouenT9GpQ0WFpRDQPa+gfaYKTWxTESqjSl4dmfQfFW6ZnQbg6x+cwHHp0t8TeyRqGjfJDn6ZIGbp34douTCTJmOTFFqLVMd/gwwjrRMvhcoAYOsgstlZAGzfZs1SOUEnySU4MXj0DWlssjykCo4jqwatFO70IhUY/Hj8Zesji/Uq77ZNquWwjBatCwCGQ+y0eeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/wHybwKnqkOrPy2lrQ1gouZB8NQXFES5OR2FLFWALw=;
 b=FIsz+Q2r2hFWgepeWKXXgmX3ibpyMTY73Bbnhgqbg0rJ79niY8OP/7awrnWOD8kefPNmIrCJOGaPKF6jQWTnY6LXLT89K6NhhJFdR1B9GbYHnsSJrMaRsYh9kvOfEFgiXdEEJN4bT4+B3ZxAUNFvEVOnsrQ+1UrVxDxhwcHCmqQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4dda0bc1-2ae0-462e-a8c2-aff74b9bbbf2@amd.com>
Date: Wed, 27 Mar 2024 10:49:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] Revert "xen/x86: bzImage parse kernel_alignment"
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326213847.3944-2-jason.andryuk@amd.com>
 <f1940242-0259-4b4c-baff-2fa73435d1b9@suse.com> <ZgPf_I2CJ7358jbZ@macbook>
 <09c73d19-dda8-44a3-be4f-1644a2bd1a4c@amd.com>
 <92754a17-fe02-4050-9ca5-5a1ded3483dc@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <92754a17-fe02-4050-9ca5-5a1ded3483dc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b1323a-2575-447a-2830-08dc4e6d11c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XwhsIeEILVhpu5Z8gMjFV+1XNUWGeeMnxi+OeoqLEFElljv7SHqTEBNz3hd854ivJU55GODN7yu9Km9CJzY7bR7j371q0NS2Jtv16kPKskgGfc6FrfiBv0KUmQbbpJjpjOwZJ3zzf+j/APzdsCpSV+spZ+oRJGWrSdM7RfZ1L1ggKV61TJDw0C6HTn+CF65y/Phdlghp4aqc4OIpwf286VElErPy0qGMAJ7Rk/OZnPcJQecAgPUSYgDhL4NJnbz5Nm5nqhiF6hnqFbTeMdM0mi3fZgdY4UiHMesE2EPUub0yyBkT5bijddFvcltoST7kG6/atCgocrPJaeVW3K745ltksxlTzi+f0G5tyVj/8HKzZYFBA2CipIwc6pbzwt18BcM5VlpWUBCS51zs8lquLXWK5H0JCxZm6aiFAIQPbfIaF5WzjzAU1NOERq5c9HJYmTYvDnLF6pSxaQa4Zn86PXTxS2exyPuHjD2uQchEstsoJIjJUh+ND/LZoJjT0AqXuE4V8iQTlAvZM0MnyLpsvc6CPKuHYSxAk2Pa+/a7uAdJOSZBkGEdcLNSorLXjfem4RefAVYI+ogCMWbb59TaJwqQcU1sZ19TTkNrDLRh8K5ekltY3JSR4Hzy2JKILeEFFonAiJTfMq9Kl/tD2+YYqW+R4yP3Tn0nPqhH+RV6RPAOhShDF4imlm9+jo8EvRnWEe6UuPo20Y7Gyc9FH7fdR70D6ul9+nw2qRVNMvbTYSqe/m7NdkL1GSAg74+aj47A
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 14:49:13.5521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b1323a-2575-447a-2830-08dc4e6d11c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430

On 2024-03-27 10:19, Jan Beulich wrote:
> On 27.03.2024 15:08, Jason Andryuk wrote:
>> On 2024-03-27 04:59, Roger Pau Monné wrote:
>>> On Wed, Mar 27, 2024 at 08:22:41AM +0100, Jan Beulich wrote:
>>>> On 26.03.2024 22:38, Jason Andryuk wrote:
>>>>> A new ELF note will specify the alignment for a relocatable PVH kernel.
>>>>> ELF notes are suitable for vmlinux and other ELF files, so this
>>>>> Linux-specific bzImage parsing in unnecessary.
>>>>>
>>>>> This reverts commit c44cac229067faeec8f49247d1cf281723ac2d40.
>>>>>
>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>
>>>> Since you keep re-sending this: In private discussion Roger has indicated
>>>> that, like me, he too would prefer falling back to the ELF data, before
>>>> falling back to the arch default (Roger, please correct me if I got it
>>>> wrong). That would make it necessary that the change you're proposing to
>>>> revert here is actually kept.
>>>
>>> Sorry, was meaning to reply yesterday but Jason is very fast at
>>> sending new version so I'm always one version behind.
>>
>> :)
>>
>> I was hoping to finish this up and get it in...
>>
>>> IMO the order: ELF note, PHDR alignment, arch default should be the
>>> preferred one.
>>>
>>>> Or wait - what you're reverting is taking the alignment out of the
>>>> bzImage header. I don't expect the BSDs to use that protocol; aiui that's
>>>> entirely Linux-specific.
>>>
>>> Yeah, I don't have strong opinions in keeping this, we already do
>>> bzImage parsing, so we might as well attempt to fetch the alignment
>>> from there if correct:
>>>
>>> ELF note, bzImage kernel_alignment, ELF PHDR alignment, arch default
>>
>> I'm not sure how to handle ELF PHDR vs. arch default.  ELF PHDR will
>> always be set, AFAIU.  Should that always be respected, which means we
>> don't need an arch default?
> 
> A value of 0 (and 1) is specifically permitted, to indicate no alignment.
> We may take 0 to mean default, but what you suggest below is another
> plausible approach. Yet another might be to take anything below PAGE_SIZE
> as "use default".
> 
>> To include arch default, it would be something like this:
>>
>>       if ( parms->phys_align != UNSET_ADDR )
>>           align = parms->phys_align;
>>       else if ( bz_align )
>>           align = bz_align;
> 
> Why do you include bz again here? Didn't you previously indicate the
> header field can't be relied upon? Which is also why, finally, I committed
> this revert earlier today.

Roger wanted to consult the bz value?  He mentioned it above.  Locally, 
I haven't synced with staging yet, and I dropped the revert to start 
re-working this...

If present, the bzImage header field is valid.  But being 
bzImage-specific, it isn't useful for other ELF files.  Xen will only 
move a kernel with the PHSY32_RELOC Note, so it can just specify an 
alignment if it needs to.

Personally, I think using the Note's value or a default is fine.  It 
seems like the PHDR aligment will just be 0x200000 anyway (for x86-64 at 
lease), which matches the default.  Specifying the PHYS32_RELOC Note, 
but relying on a search for the alignment, seems slightly questionable 
to me.

Still, it seemed like the path of least resistance is to just implement 
the fallback search like Roger requested.  Dropping the bzImage, I guess 
I'd go with your PAGE_SIZE suggestions for:

     if ( parms->phys_align != UNSET_ADDR )
         align = parms->phys_align;
     else if ( elf->palign > PAGE_SIZE )
         align = elf->palign;
     else
         align = PHYS32_RELOC_ALIGN_DEFAULT;

Thanks for your reviews.

Regards,
Jason


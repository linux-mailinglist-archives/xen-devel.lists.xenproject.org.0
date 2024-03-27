Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6D88E4A3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 15:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698572.1090410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTwz-0004bd-M7; Wed, 27 Mar 2024 14:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698572.1090410; Wed, 27 Mar 2024 14:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTwz-0004Yq-JI; Wed, 27 Mar 2024 14:08:21 +0000
Received: by outflank-mailman (input) for mailman id 698572;
 Wed, 27 Mar 2024 14:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpTwx-0004Yj-Hx
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 14:08:19 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75068542-ec43-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 15:08:18 +0100 (CET)
Received: from BL6PEPF00013E02.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:18) by IA0PR12MB8304.namprd12.prod.outlook.com
 (2603:10b6:208:3dc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 14:08:12 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2a01:111:f403:f902::2) by BL6PEPF00013E02.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 14:08:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 14:08:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 09:08:11 -0500
Received: from [172.31.131.34] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 09:08:11 -0500
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
X-Inumbo-ID: 75068542-ec43-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWjSL4I0p2peiPXd3ZsMCu86SXaIGNYg2yDqgzCBClmyEH0Bn9ga+ABALtaRklnw1/yUqLrLohid9SSilfR0F2eiBKqPA7U1AcNgpFp3szLGFFE9tpQi8a+W2GNtD5ybbR6EirCJiUv7tThj3b6MmE4hNZiDDcgUMGbmxQLOXwKJzGAfk+1jk2Yc82jcoMMMn0Snl6Ij0ZfX7xC3VzValKILDCurBeuZZQOOSGMQhfqKas98/nQEYjCvRA4TPxiiCKtlo59hs/T9Ah6UNSoPilMptLY8dW/84WuF44Yhtbj9Fv9Kr0Xq4vTkeRyxw6ef/pPmhAnrUBuYFWr591pV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16qKNtbkc9g/1KJXvwrpzznQgGuIgTUzRb6eKhsvyCo=;
 b=Z7EqjUbinC05FOs/TF/UimUiu/Xd7IbqICwKkRIYsShTCf49a3LI3o5RpNByZXn6tHCRt8KuQHBgHUh/JfDlVuvp278+Qu2eh4HmGy8dthluaeBvdqVm3gNSrKi82aoxo6NDMSMk+HOggnDyNud4ucXPVMr3NoO+9ec5QwyS4dWHTdFwOZi8WwP33oH8n2HfBYGxtDIMi/hJd0lebMNADIZNLMOYXego33ObfiWeVPNW2J8hFnPSiD+mkXpHHlVNPx3tmcsqhEQ+4XZ8Ks4ENO3cUeASFieVnCMRsxroKztuMERs/vhEBi2seiDJU1Y+wrobvwwC9BR8fcvBpRVLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16qKNtbkc9g/1KJXvwrpzznQgGuIgTUzRb6eKhsvyCo=;
 b=rTMMyLkJtmjYVVTgoKaCZemxfwsWOqpzAZA6a9BuzD4CqnttW+GZNAE6tQhKkRdHmHRBYTX+MWMYABtQI78QU1St8ixSQllDpUlQsljA5M1Hh9YynqCP+CkfQI8tvXEtv3gxAh4B3AECleWNNnyrURR4TcyWOVFhROnd82qtYyU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <09c73d19-dda8-44a3-be4f-1644a2bd1a4c@amd.com>
Date: Wed, 27 Mar 2024 10:08:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] Revert "xen/x86: bzImage parse kernel_alignment"
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326213847.3944-2-jason.andryuk@amd.com>
 <f1940242-0259-4b4c-baff-2fa73435d1b9@suse.com> <ZgPf_I2CJ7358jbZ@macbook>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ZgPf_I2CJ7358jbZ@macbook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc2d716-3f1c-4232-e2f3-08dc4e6756d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nxAvRMgRl5xT2p0eDWQXAoMOoCa5yFjlMD7sIvK1B93jruEWFxfcdOMprLG24hWojcwfUXWsvOVOYDIi7MiMiTUXQmtVFwFA1OSBJCCyLx5H3Qn5IEApml00NBX51XjPfBZNbypI4KzZtB2+ON3uRgkSbxpRL2uvxeztXc5WD3dUwD+O27Rh4xm4LasG6dvomtv9R0xuZDaskxW/IDFWXwGSoB9H0ATevyS/Jk7EqsqOBl9Il3wv1vHo4oodbgt0w6DY/hVBwEVRtuJARL3h5hqUVpjbQC1ZuO3ssxH+hfcocG9EgTLr/P7nnfr7ngOH5NG3ezL5j3W2YotZV8EKB7FcRgZb9tLgdscNp9hQFCVU6KmVxji5UaGQoY7MYGoZDZDLNYvNycT9EQ08Ufeq7sbIoTPNNStz62HdHMs2ykE+P4a5s0YMgbWH6UJgCCpB3DNIl2p8+odGX259pxVGI3GCZJAmqf2jOJ7ti4eNRtyeJzEr6Ie+Gyk2y27uJWHa6TrKTY06D8qmT4AKTeN+w22RJkfIjiriPJwS/WxnjXPeg3BFSHTSatEFBaWnVOTJVhaaobbae2N0Hcx7ciRrzOMAsCXUA/YUaBPLRnhQR5gv7xYzQ98bPMrf7Fr5x1frpdCna/nw00mk9xArRncKjtsquddkhY5YICLnjdbLsrWN8Lx/rNRxzphRvtY2iRA7W5N66MbU1P+RxP+2SlRuoFzM45i343reB4lz9TkJ48wwElcmBaYjSXBfSU9wLhGe
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 14:08:12.4885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc2d716-3f1c-4232-e2f3-08dc4e6756d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304

On 2024-03-27 04:59, Roger Pau Monné wrote:
> On Wed, Mar 27, 2024 at 08:22:41AM +0100, Jan Beulich wrote:
>> On 26.03.2024 22:38, Jason Andryuk wrote:
>>> A new ELF note will specify the alignment for a relocatable PVH kernel.
>>> ELF notes are suitable for vmlinux and other ELF files, so this
>>> Linux-specific bzImage parsing in unnecessary.
>>>
>>> This reverts commit c44cac229067faeec8f49247d1cf281723ac2d40.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Since you keep re-sending this: In private discussion Roger has indicated
>> that, like me, he too would prefer falling back to the ELF data, before
>> falling back to the arch default (Roger, please correct me if I got it
>> wrong). That would make it necessary that the change you're proposing to
>> revert here is actually kept.
> 
> Sorry, was meaning to reply yesterday but Jason is very fast at
> sending new version so I'm always one version behind.

:)

I was hoping to finish this up and get it in...

> IMO the order: ELF note, PHDR alignment, arch default should be the
> preferred one.
> 
>> Or wait - what you're reverting is taking the alignment out of the
>> bzImage header. I don't expect the BSDs to use that protocol; aiui that's
>> entirely Linux-specific.
> 
> Yeah, I don't have strong opinions in keeping this, we already do
> bzImage parsing, so we might as well attempt to fetch the alignment
> from there if correct:
> 
> ELF note, bzImage kernel_alignment, ELF PHDR alignment, arch default

I'm not sure how to handle ELF PHDR vs. arch default.  ELF PHDR will 
always be set, AFAIU.  Should that always be respected, which means we 
don't need an arch default?

To include arch default, it would be something like this:

     if ( parms->phys_align != UNSET_ADDR )
         align = parms->phys_align;
     else if ( bz_align )
         align = bz_align;
     else if ( elf->palign > PHYS32_RELOC_ALIGN_DEFAULT )
         align = elf->palign;
     else
         align = PHYS32_RELOC_ALIGN_DEFAULT;


>> I further meanwhile realized that consulting the ELF phdrs may also be
>> ambiguous, as there may be more than one. I guess it would need to be the
>> maximum of all of them then.
> 
> My suggestion (not sure if I mentioned this before) was to use the
> alignment of the first LOAD PHDR, which is the one that defines the
> value of the dest_base field used as the image load start address.
> 
> Using the maximum of all load PHDRs might be safer.

I'll find the maximum.

Thanks,
Jason


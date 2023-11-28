Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63A27FBFE4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643332.1003409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81S5-0002g7-NP; Tue, 28 Nov 2023 17:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643332.1003409; Tue, 28 Nov 2023 17:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81S5-0002eT-Jw; Tue, 28 Nov 2023 17:00:49 +0000
Received: by outflank-mailman (input) for mailman id 643332;
 Tue, 28 Nov 2023 17:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DME+=HJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r81S4-0002eN-CN
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:00:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab44bc12-8e0f-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:00:45 +0100 (CET)
Received: from MW4PR03CA0288.namprd03.prod.outlook.com (2603:10b6:303:b5::23)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 17:00:40 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::16) by MW4PR03CA0288.outlook.office365.com
 (2603:10b6:303:b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Tue, 28 Nov 2023 17:00:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 17:00:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 11:00:35 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 11:00:29 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 11:00:28 -0600
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
X-Inumbo-ID: ab44bc12-8e0f-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBJcBNnrQItSRYhVBdWMrnx2XQm/zHnaV8GVaxL/qTucb/ayX6SUnjAjn0GWwSBiZ41FmLl5CPHFtXjAJE93Tqut0b4lBuZ1hAlUMWfBTF48zW+hXiqB2Ej+h/3gZ4SBAeVHKVmAV0eO6+5R7j8eRHO/I+rLSzFoM+0nx6Na8vobaNTDWd8vgIixFqrpipnKK5q2ZCAkUjspHELuojF/2nadzDN6kUBj/wuKu3BkBo+dZhL+a6FI0FYiHeHJ1h1rY9kwiKKKNrqczjgXAC2A01px2tchZj4XKJ9TfQ77CzcABO969/NbZIUtZiYhDmpr0111YySW3njWfw8LUsrbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWmT6zYp75+axsRYKQZyozfn8ezGii1nxBPxHLF2dIk=;
 b=Nxn/Auod4kZWabVrbmWiyE4j11B/j/jlWyJwbWu8xGJf5GI1e2E6swqdTHgjf1l5YADO4kQaLrh3jhe7GuRjNVZRECliJRf4S/M0JfGcNPtLde5MsTmbtTrR3GFL/+WOblaNnuoAcdHKy6pZe3fdgldb7jDVZhUvyMB5ppdyyBcfbsurVkMMCF+EgV4I//M/z7FD7I25zowpGFjViINA5E7n0gIBAoJkTHQgJXOWcRZ9V9CzrpGxoC7RGD2TLud1Y+lBMR4A+IToJUtSdW02nZS6g+8igN4hQuzbsS7sNXq1okLeUx74aM6AnKsuwMoIEsxOT4Tq6N1UMqYirIkzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWmT6zYp75+axsRYKQZyozfn8ezGii1nxBPxHLF2dIk=;
 b=f64Gg/+7RAuY1821xy887fhTroJ5Vo1inCFdNTQsc6Vn4/NUnmIygLbwiyUOQV0mgtTBDrvtdIOHjJQywwSVaS5C3ROCiXAfd/mIZNpDFeoHt3lzLHSGsE6HKYWts98zDpjFGNePAzEseNglZeZxvr9HsbHATDH0/Bk/Fb1UN74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
Date: Tue, 28 Nov 2023 18:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
 <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 7532d4f7-1636-4473-0411-08dbf0338cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/u8CrxPRqgD2IxvS+V2m8MaoAqTHkit7RvPCmV/H5A9yLbtni6zeMSRC3/+kWvUQF/y7Q2sPhv2nKYvxN7QKhV6rbgNtrKYEuXL9szq80DLTo2eP3qCWupGqFzrhTd7HUbioZt+IOoUEvZWcuy/luWwb3PsgJy/j4F83c34zVe4sujT8Uf5YVq3Dci558VTXJ0a0l5FgpS6sH5vqoRFWkYUE1CBm4gHrTJOXnZavpTAyDKEVVCrdCseAVC4WiQYVjwBgWQ770tQLlw2IhjM3DT50LBC3YijhvKkUv5EYB/XZW3D5Q+clw/HOy82olieP9MsBvAbCqZg7tlRSqvykWB7YpdaJ59pw+wGkky/xqI1ZGdHU/muzSxRqYYGwwIJ6KiJA3cJa62BiqrufYVw/XLEXuewpC3AnAZia7vLdDyv+T5ZRAdryWWQxNPIP/UQ7aM9hku7DW3prc2mflJRo33VMj1CgLsNMjS3t43rOSTnVyuoJhm9kXjuoxwYr6iP0RCp5SefncaONY/y2WJJe02uBdT6HPQ71VwRP9HJP+74m417fBhDApOMIf65Ihl+kf/gDiV3JcBo2lpLsxMzWxi0FMkxefkKIMmMdsyymJfJcqsMWoC5uIHoXlCviaM4oSWsxtDh6UzDeTMdc75E5CDoVaF4lqJUoH2qaSLuCpEQYdXgm8vrGQl6bBDRHcnxdpJMx7F6okTf5/PYotrOn0xsDkdb8cikSJ/HWCUCS9i/xqLhwl//Io0aHf5m7Thxq8rCzbNR+13xkuzJ3FDeNHxdmFPQaCJfmwjNmjowjeX4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(82310400011)(1800799012)(186009)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(41300700001)(36756003)(86362001)(31686004)(81166007)(356005)(47076005)(83380400001)(5660300002)(82740400003)(336012)(426003)(44832011)(36860700001)(26005)(2616005)(40480700001)(2906002)(31696002)(53546011)(8676002)(4326008)(8936002)(40460700003)(478600001)(966005)(54906003)(70206006)(70586007)(110136005)(316002)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:00:39.7083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7532d4f7-1636-4473-0411-08dbf0338cc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724

Hi Julien,

On 28/11/2023 17:14, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 27/11/2023 15:41, Michal Orzel wrote:
>> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
>> attention to undefined behavior issues, notably during CI test runs, is
>> essential. When enabled, this option causes Xen to panic upon detecting
>> UBSAN failure (as the last step in ubsan_epilogue()).
> 
> I have mixed opinions on this patch. This would be a good one if we had
> a Xen mostly free from UBSAN behavior. But this is not the case at least
> on arm32. So we would end up to stop at the first error. IOW, we would
> need to fix the first error before we can see the next one.
Well, this patch introduces a config option disabled by default.
If we end up enabling it for CI for reasons* stated by Andrew, then the natural way
of handling such issues is to do the investigation locally. Then, you are not forced
to select this option and you can see all the UBSAN issues if you want.

> 
> So I feel it would be best if the gitlab CI jobs actually check for
> USBAN in the logs and fail if there are any. With that, we can get the
> full list of UBSAN issues on each job.
Well, I prefer Andrew suggestion (both [1] and on IRC), hence this patch.

*my plan was to first fix the UBSAN issues and then enable this option for CI.

[1] https://lore.kernel.org/xen-devel/7421ddfd-8947-4fe1-93a6-dc25a4aa8bbc@citrix.com/T/#t

~Michal


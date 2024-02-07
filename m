Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725084C9FE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 12:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677474.1054059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgTw-0003qD-LL; Wed, 07 Feb 2024 11:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677474.1054059; Wed, 07 Feb 2024 11:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgTw-0003n9-IU; Wed, 07 Feb 2024 11:52:48 +0000
Received: by outflank-mailman (input) for mailman id 677474;
 Wed, 07 Feb 2024 11:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=beHI=JQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rXgTv-0003n3-3v
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 11:52:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67f59b53-c5af-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 12:52:45 +0100 (CET)
Received: from SA9PR13CA0173.namprd13.prod.outlook.com (2603:10b6:806:28::28)
 by BN9PR12MB5321.namprd12.prod.outlook.com (2603:10b6:408:102::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Wed, 7 Feb
 2024 11:52:42 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::f) by SA9PR13CA0173.outlook.office365.com
 (2603:10b6:806:28::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Wed, 7 Feb 2024 11:52:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 11:52:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 05:52:38 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 7 Feb 2024 05:52:37 -0600
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
X-Inumbo-ID: 67f59b53-c5af-11ee-8a49-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAZzAqUh+Tg76QtgGyCbHDGAO3okMNFfH7vaLPdUhYBba8rA2lQcZdpFzqMlHwoLjJwMddKuDV7Z1fnM1h0639Tf10TlZr/KXxqvkuPSJDq2XRW+YVXXNFth3vq755wuFs2rUSQ45w/DTQt0FcFqCcDYmjyfJ7HmfCd9QZ07DQjUAvwTZAduYzKJwZwBr7/LuXWn9FTzBNCiCMMS2QsKxNoNnAd6YusEVrh1nGl6lgqjKWaQjOvXeE14Gd5UvRZZo7oXq223hS5bxAab+x+1ElyAuZ5aTSb3pCjcaQOe9655FVVfJLWJ0Eg/IugmJQv/WqFoN7G/ic5nqOBX70kK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR5jjJqAJ2mvwGBUKuh+NtUs3U0/RVL3mMDNnR++9p8=;
 b=gSrp4j+uZQHUCKbCXpBGLjD7ed/OgM2fN0eeW3Omuhe3hs9x2xyGYkXMrW9NtDbl0YGUzMZVREdU6PzsLWZHFRKyOSK92trejwYNQdLbp6iaqgiJdhKnb5b3izUq3EDeMYu7t6m16lWItkEnutFzn7HZ8HmSftvZvLDzFREzgIXkAqT7BwHun5SaXteZu4eVmgcStCTkbQquWMqW03vzmKX8rxP3y20yHyO2/DLu1SGzTcUBI4wImeVPHCi0nSklyinQTOqJL8xWGbmKTkrhd2T8vMznwz9FGDKFqqhCAeJKsJ1iPg2IGDM9ZxMsDByoIk7Nryi5HhYfuW9zCKe2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR5jjJqAJ2mvwGBUKuh+NtUs3U0/RVL3mMDNnR++9p8=;
 b=KNGKhF50F2aH/rP6Pt3n40HhpwOPxLY7DVqjtx2cEfX9uUP4FFR8tEIXMkBGPAkxLYNg2hF0zML9tLqhBev7apzVJkmwHu9TzfZ9ohFMXDlACmsiZ5i5H1lB7ATJ0irdHwg1A1vL6kPGC70BB7wmZKCkmfuklFplVsnKtft21vU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <228a977a-c644-4ccb-b9aa-a25171d8605d@amd.com>
Date: Wed, 7 Feb 2024 12:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<luca.fancellu@arm.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-2-ayan.kumar.halder@amd.com>
 <c7841d11-d072-4787-9d76-ee94123605bb@xen.org>
 <8daa2461-092f-48ad-8556-3bba398ae544@amd.com>
 <e3a967fb-f9c5-495f-a30a-1826e3673c95@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e3a967fb-f9c5-495f-a30a-1826e3673c95@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|BN9PR12MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbc4e49-25f5-424a-a4c3-08dc27d349f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NP1UhHWz+jQlGfZr7pdT/8u9gkh31mDcQj+xP6Mqqg2kdlHCiP3VxP/lweQ9fx0e3ZniI6W+uu4TzdzNf5mtWF0aNBt1LScG0GT35UEVB5Sm3RvlBz+ulPCGg+WwCDjZVrTORlS3+V3/kWqg91FqpVD9ARHZWZQBUS/LTkkPrEcCbTxUiMtQYphuH0LDdrHM6qwmepnAT32B09wLYeVqCHXAmlC3pd6p/h0DlD/6nUiNMef8tJNnhKRrCJYBIpZWODcVMWsrkuJzrGBvZUrf4gM9188xrHd4UpLSqzUcPzQ3SZNW270hTHDunybZ7weP3p1jbcNFTgwOkSkrXrmM1fgvyrfr8YvtOFM66jTfphC59y1AwjQ/Ext3paaXES2j71yiZBvy0sUUmpTBUqbniq467g5XwWM0yOvpPXRd7LO3K4c9QCnsR4XR3qG28ZLVk6sHJW/mNfTgBAn62NBjY6n8YoOV2HBTzGVYCyUgrC5QpkJ8Lr1jk6V6xgNZOjlyckfUzYWNPZF0YmuimONgjGDIxOhT+UpOh7Spvl5YDshDIp9b3QWjzq+ZApmadLnUQS0l3U0PKJSGQLZyF9YJR5JdmYLQxFfFwvDcipUMAb7MI5GhgVuRYyOtctObiKEEHbrlWOXimjJ9S45Xu/ctH+CtAwM3wFR+PgR1mE7DLjv2YpCEajfsjoOgMOmB8/6bZnvoVKHHSJGfQ9OFIE5Z96P1tMKNF2OLnt3CLAEMaKoTjfJBw7M/fR4HV6MiY7EC62Lai/oON2tVMHYRbr5RkilZGpLW/S5ggQtopgQdpx8w92haYzXSK4Mt3GQZh1AInX1lYCXqYnjBkvcvI/hYHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(31686004)(40460700003)(41300700001)(478600001)(53546011)(86362001)(36756003)(966005)(31696002)(426003)(356005)(5660300002)(81166007)(336012)(2616005)(47076005)(82740400003)(83380400001)(316002)(26005)(8936002)(36860700001)(70206006)(70586007)(44832011)(110136005)(54906003)(2906002)(16576012)(8676002)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 11:52:40.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbc4e49-25f5-424a-a4c3-08dc27d349f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5321



On 07/02/2024 11:06, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 07/02/2024 07:45, Michal Orzel wrote:
>> On 06/02/2024 19:49, Julien Grall wrote:
>>> On 31/01/2024 12:10, Ayan Kumar Halder wrote:
>>>> There can be situations when the registers cannot be emulated to their full
>>>> functionality. This can be due to the complexity involved. In such cases, one
>>>> can emulate those registers as RAZ/WI for example. We call them as partial
>>>> emulation.
>>>>
>>>> Some registers are non-optional and as such there is nothing preventing an OS
>>>> from accessing them.
>>>> Instead of injecting undefined exception (thus crashing a guest), one may want
>>>> to prefer a partial emulation to let the guest running (in some cases accepting
>>>> the fact that it might result in unwanted behavior).
>>>>
>>>> A suitable example of this (as seen in subsequent patches) is emulation of
>>>> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
>>>> registers can be emulated as RAZ/WI and they can be enclosed within
>>>> CONFIG_PARTIAL_EMULATION.
>>>>
>>>> Further, "partial-emulation" command line option allows us to
>>>> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
>>>> enables support for partial emulation at compile time (i.e. adds code for
>>>> partial emulation), this option may be enabled or disabled by Yocto or other
>>>> build systems. However if the build system turns this option on, users
>>>> can use scripts like Imagebuilder to generate uboot-script which will append
>>>> "partial-emulation=false" to xen command line to turn off the partial
>>>> emulation. Thus, it helps to avoid rebuilding xen.
>>>>
>>>> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
>>>> This is done so that Xen supports partial emulation. However, customers are
>>>> fully aware when they enable partial emulation. It's important to note that
>>>> enabling such support might result in unwanted/non-spec compliant behavior.
>>>
>>> Can you remind me why this is built by default? In particular...
>> This is the result of RFC discussion we had, where both Bertrand and Stefano agreed on having
>> the Kconfig enabled by default to improve user experience:
>> Bertrand:
>> https://lore.kernel.org/xen-devel/C0ADC33B-1966-4D3E-B081-A3AA0C3AE76D@arm.com/
>> Stefano:
>> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2312081514450.1703076@ubuntu-linux-20-04-desktop/
> 
> Thanks for the pointer. I thought a bit more and per-se the default of
> the Kconfig doesn't really matter too much. So I am fine to keep it on
> by default.
> 
> That said, I think we need to detail the security support for the
> command line in SUPPORT.md. I think we want to consider to not security
> support any issue that would allow the userland to attack the guest OS
> due to a bug in the partial emulation.
> 
> I would be fine with security supporting any issue that would
> DoS/compromise Xen.
Sounds good to me. Something like:
### ARM/Partial emulation

Enable partial emulation of registers, otherwise considered unimplemented,
that would normally trigger a fault injection.

    Status: Supported, with caveats

Bugs allowing the userspace to attack the guest OS will not be considered
security vulnerabilities.

Bugs that could compromise Xen will be considered security vulnerabilities.

~Michal


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418045BA845
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 10:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407863.650510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ6m8-00058R-OQ; Fri, 16 Sep 2022 08:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407863.650510; Fri, 16 Sep 2022 08:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ6m8-00055t-Ke; Fri, 16 Sep 2022 08:32:40 +0000
Received: by outflank-mailman (input) for mailman id 407863;
 Fri, 16 Sep 2022 08:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnJL=ZT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oZ6m7-00055k-O6
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 08:32:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e46a30f-359a-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 10:32:37 +0200 (CEST)
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 16 Sep
 2022 08:32:34 +0000
Received: from BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::80) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18 via Frontend
 Transport; Fri, 16 Sep 2022 08:32:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT070.mail.protection.outlook.com (10.13.177.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 08:32:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 16 Sep
 2022 03:32:32 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 16 Sep 2022 03:32:31 -0500
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
X-Inumbo-ID: 1e46a30f-359a-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0BwXFBpOaGwzDPwRTlMFLaEbknjcKSlC9U1oSmJCW7jPdfdtx+vFkMC+VKTQot7AOT2QQHl7p5cEkDgsDM6x7tfCSQ50OMZaKSI1k0z/errChpbeoZW96vzZ9tEApUvzKa1ZTh+k6+ZyzqL/+AxI3RQc4qzI/ujRbc8xvPWBUo86gz9CRo7xPg4zHRMPJOMynDFQMfYFQUEyOV7MBla+e68jMY1WcOEmsqKJPMUIYYQsumvulFkU/yMNoEPqnpT54UPKfFfuefHrjW4Nf3s6bnXYO/ckCcZgw7W3tqtExSSdnorXHFPXyw8+T1Z3jMs8EskzoOreDdPWz5OReY/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u54E9dl5V4GQwLUHCI8FloeVzY+UsfS0AsZVT3a0tI=;
 b=X/LGk4nal/T46aKP2edBlpsG9qJEkgDk5NgomQzUU/Zs4Vmh+2Mli13hjKjj4B0bO4d5Yws3JNGGQixpr+Z1POl9jmIeNhuXJZVvlXQBZojm6z1bsa5sfbEs7FPq5uT8pudGCnqYq04bXaI53h1xKmWwmbUTiDjfm7eixr9Y5c6I2s3EwHmeDBlMPJcy77+lqLgSm+HHBOrbcxL+dZ81VwNSP/UlWjamAf8rY0h0W24EbssUm2zlFbUqhlYHg5eVJ/FXapQ9mLPPIH+hpM/7szYbxD1+pmx34KM3TyiaBOXG7xy8QYCXqXPJJnmurV3sHJZinY6+g3iRBhKmlrXQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u54E9dl5V4GQwLUHCI8FloeVzY+UsfS0AsZVT3a0tI=;
 b=3VCMKLSSP/skZzFeyJaKb9gAFwKWnT5zLo7scDKV68UtWkqL40CtXpbG8DYZ9vvzIOg5antYvZoe6w/5hRNwr0SkUuNX/O0XvOxDhTP4q9XBJTfByamQa5I7pwfpfgyV5mzz+BdtaALnU7PAHHSnmmvn9UHWGp+QInGKg6pfeaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f6588270-5cfa-7a46-f857-1fb78dfdffea@amd.com>
Date: Fri, 16 Sep 2022 10:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [for-4.17] xen/arm: domain_build: Do not use dprintk
 unconditionally
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220916071920.8287-1-michal.orzel@amd.com>
 <4f4e254a-6b54-cdf7-40bc-89c25172bebf@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4f4e254a-6b54-cdf7-40bc-89c25172bebf@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT070:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5f5432-e429-44de-fe97-08da97be0094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YB2cw7wSokML3qv4YiMkRihAg4fWSyq97IZ3FlW48IDBQuXB2I2J+xHdzpdSaUn3w90ywF3CW3Oq1QoIBcH7wCUGZXXfzvihoBsnxANIxtEGe/Dx2xT92sspXxO29GCHfnMX07yt4rl/nOFIcg6vJboKmbUwbTXqHbP5KxHsHV+QtEFydZ0WE28zxMrtEs3YvQ2BWwTqjE5B+9rleUZ8qH0q6zp56tdcnYTZ/JQw5hkRgfPNW5gWf87tMkjcfjdb0bXigwE8fjGH9URyyhQLr4YnBrfwfi+tVtT4wb2c1O5pA+kpdelFd3m3HB0erRHFYmindO0EaSqjnQ2cBljNS8fqIx3K+gZzG5f/7LaQT5rkmITnl4jOSt2eIRDWEcrpzUyUIhuk6zd7LFPAPkPsUSnnIozUl6U42VslihUew3gtJr8tXdBZaEk5P3c0fQzUB5OPpwxlxsCIzV1QjMdZcUWAK7aoEmRT0bpCvqS/WayMib4Msp5E5dyYf61I/ciJgpm9NE0fFQo4mRZ0p+Erl3yL3fvp2lvM/N28EeTpRAbaseHP9QONv/Ty2IMD/fNyrrzPZJxKDAFzZ2Jtnm63qqN2iNw86ykgG70VpdT2EdA0ubMqYR/v6k5H+KEryRtfEoIcyYf8xin8s2bY9xQccACUyXwQrhaZuY0c1mM38Y4UERDCJdUTTxgvYQNDxAOn3VMjK3dbCNgLlNSnV8p3ZDKF09xJqdHKq1pIQKpxDQMH+bX9581VNpWKk07SXQSRaRnHkPqhcUib71fvINQdpVXtaWjHkIq49UEaHkd6qbOg4cZcib18OpMokkWxT6/dqyZNElTxFs+7p15rdKizlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(426003)(47076005)(54906003)(2616005)(110136005)(186003)(26005)(82740400003)(16576012)(336012)(53546011)(316002)(44832011)(83380400001)(36860700001)(5660300002)(82310400005)(70206006)(8936002)(41300700001)(31696002)(8676002)(36756003)(4326008)(70586007)(2906002)(86362001)(356005)(81166007)(478600001)(40480700001)(40460700003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 08:32:33.5066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5f5432-e429-44de-fe97-08da97be0094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974

Hi Julien,

On 16/09/2022 10:08, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 16/09/2022 08:19, Michal Orzel wrote:
>> Using dprintk results in printing additionally file name and line
>> number. This is something we do not want when printing regular
>> information unconditionally as it looks like as if there was some issue.
> I am OK if you want to switch to a printk() but I disagree with this
> argument. dprintk() is not about error, it is about anything that
> doesn't matter in release build.

In the vast majority of cases, dprintk is used conditionally. That is why
in the debug build you cannot spot a single line of log starting with
a file name + line number. That is why I assume this behaviorto be abnormal
compared to all the other logs.

If someone adds a printk starting with e.g. "$$$" this is also not a bad
usage of printk but would result in an inconsistent behavior.

> 
> I don't think we should just switch to printk() because dprintk() add
> the line/file. There are message we don't necessarily want to have in
> release build. So dprintk(XENLOG_INFO, ...) would be right for them.

I think this is a matter of being consistent.
We do not have a helper to add printk only for a debug build but without adding
filename/line number. That is why almost all the dprintks are used conditionally.

> 
> Personally, I find them useful as there no grep required and/or
> confusion (but that's a matter of taste). If it were me, I would add the
> line/file everywhere. But I understand this takes space in the binary
> (hence why this is not present in release build).
> 
> A better argument to switch to printk() is this information is useful to
> the user even outside of the debug build.
> 
>>
>> Fix this by switching to printk because this information may also be
>> helpful on the release builds (it would still require setting loglvl to
>> "info" or lower level).
> 
> I think we should drop XENLOG_INFO to be consistent with the other
> printk() in domain_build.c (after all this is a domain information like
> the other) or use XENLOG_INFO everywhere.
> 
> My preference will be the former because otherwise most of the
> information will not printed in release build by default.
> 
>>
>> Fixes: 5597f32f409c ("xen/arm: assign static shared memory to the default owner dom_io")
> 
> Fixes should only be used for bugs. This is not one.
> 
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Rationale for taking this patch for 4.17:
>> Current code results in an abnormal behavior [1] and was introduced by
> 
> It is not abnormal (see above). This is an expected behavior when you
> use dprintk().

I did not mean abnormal behavior of dprintk but abnormal behavior of logging
even on debug builds. As I said before, I could not spot any message like this
booting Xen at all. This is why I took this as a reference for "normal" behavior.

> 
>> the 4.17 feature (static shared memory). Even though it can only be seen
>> on a debug build, it should be fixed now so that we have a consistent
>> behavior across all the logs.
> 
> As I wrote above, I agree this should be printed in release build. But I
> disagree with your arguments.
> 
> Cheers,
> 
> --
> Julien Grall

~Michal


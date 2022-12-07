Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA2645810
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456185.713926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rot-0001Wk-K8; Wed, 07 Dec 2022 10:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456185.713926; Wed, 07 Dec 2022 10:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rot-0001UB-H8; Wed, 07 Dec 2022 10:38:31 +0000
Received: by outflank-mailman (input) for mailman id 456185;
 Wed, 07 Dec 2022 10:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9USZ=4F=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2ros-0001Tz-1N
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:38:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48f07253-761b-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 11:38:28 +0100 (CET)
Received: from MW4PR03CA0129.namprd03.prod.outlook.com (2603:10b6:303:8c::14)
 by DM6PR12MB4974.namprd12.prod.outlook.com (2603:10b6:5:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 10:38:25 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::9b) by MW4PR03CA0129.outlook.office365.com
 (2603:10b6:303:8c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 10:38:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 10:38:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 04:38:24 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 02:38:24 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 04:38:23 -0600
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
X-Inumbo-ID: 48f07253-761b-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQbKYhTzB/05/ytD3XJ3mXqlHrezbqHnLGAIfa9M0Rw567cU+BPkafPUX6PHhTyrgj9bBQBiHziNsA62rUY+mGe7HlH87hGoNl4LnvBCZ4RPaGoNNgz2JCg+oy6wh9AjNVzbvsZYR/lwEw8N3TLa2JsUc454Bq5f8ZMoa4Ebjs2kkemY6Pg2FR1beD7+s5dqBI69uIBMhtt0Xjyll48mQ8x9uP5bNNpT3Mo8GRDtGnn4l3F3FSObzrKR7ET/MKUZe6mFFZakQBOMlQXQ56LcMlYRLCoeSNWFI9FGsb+8ntAmkmYzGmrcFB0NvVJ6ekd9i1SZsJhPAWrobh6zbKHIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Tjiam8AlnfbRzfX8LFol6aNNmjXt13tDY9B19T8WZ4=;
 b=h/X8JoxBe6bXwAtEXa9E1UA2NwzOFeOpTRPeyedeM+xTjro8bmB0TAvrZu75GDu/QCLVBragogWNtVu75DyWaza6wuYJfrB+qQ8jA/5kOmpzQYIhOYX1Bh7pATVyNrvors4FGtBuvJUXYdzSxEBg3hqpehlJWOo9QlmwZzrRD1mMCANQMemsGAJkEFC5lYbMtzcjnoc69V/mO3Y8kf1vYNFhsDHbGZ5Q9fr7bs3c9fhw47SYZ3oNOfpsip30vd5xAKkBnlMTOA1KxVZqqsJ61E4v1sHNeVGUhPsHjqbYxl2eAjiztQrWOR6hCeV4yYMyJOW8zpo/us3xfcdUnDtGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Tjiam8AlnfbRzfX8LFol6aNNmjXt13tDY9B19T8WZ4=;
 b=1DozcQ0TcEBCUgI25OtrFm+BLrN5rHzBokCFS4DpC8OLD0QSPZz5L48ImmsQA4CQKwUE+FOS3s5bWdREJwlYsEJB5eIFDn9pSgrAosmzcFVENPl1FiTu8x3dynJ282gkVjM5mTP94X0fFWT+zVYOhbaVY5gMWcoFfbF1pQ39ixY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <22afcad8-49c5-6e85-43db-f16bad001e37@amd.com>
Date: Wed, 7 Dec 2022 11:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] x86/platform: Protect XENPF_get_dom0_console if
 CONFIG_VIDEO not set
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20221207102909.17794-1-michal.orzel@amd.com>
 <9d85524d-5c97-e216-4d78-2e5ec02fe321@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9d85524d-5c97-e216-4d78-2e5ec02fe321@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|DM6PR12MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c70e5c-8cf8-4b75-b772-08dad83f2bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tKV+TJfjmHQ+U4/dBrLoRuTCHqWnK5CW0XljS9nH4YOfEUKo0U9mzIgCTqrYSze2YFK0/Qh8cUuoV8qpLhBuq/6LcATVQxBOdrf+bOKBLg9sDVgxi+Jp9+jJgpz15rm+nOZ+VIItLSLYiz9NP6y7uyQXiZ4IAtc7IIdvnRFt35mFZvMl0Ti4kI4vRUM5FQni/euYTulAMSwRIkZ5SUuPtWcDXI3W6usTEFXsxBIltmStxr1falBjMacWIDLinVHEaParU6wGNoqxV/IjOtrgk43R+L92i+8wTfF1Zhjrplul2kgzveZVT9cilI0JsobhQW8SgBed580UcFmejMFNjd3/pUV+4HdoKehAQsqSqcRTXQz0MVLqXcF6O/B6/S0z0g2HkWby/KdIF9N9E8NAbIawoRx4JAytGxX95S1M1Tn/8rA5tvPr8i4Gi5KGM4r0gIRbHuEy4YYxlLd5PQ9pTRVw/utsC3noQnftc7laLvUWOtgKvpbzzwS8ae7M4xb27Q2GvhJp3UPF3Ll2BPiT76zpumxfSmVarvVkRv/sxrUMuURWVal6KI9xhWDrBxVS/T3Bzs2At8CaeGcTe0d3JiIfwxCtGOClHxpCCCNro8zUTRXmIxIS3+T7q4dryBYidWwvmYxUXQT11JQ4KbQax+P3hSZS6CmqGDDdnQ5LFMqfvTNVM2NmAOWI22WzIVGmLj4TX3UZE0iBX8jqx/3QFyZZ3fXDc8klZlDPIt1IqIeMCgZeIhg8NnBcOi2/cyFfLA9S4xb0rV8WZuAy8pOAkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(478600001)(41300700001)(8676002)(70206006)(8936002)(4326008)(426003)(81166007)(82740400003)(5660300002)(83380400001)(47076005)(4744005)(6916009)(54906003)(86362001)(31696002)(316002)(16576012)(36756003)(44832011)(53546011)(82310400005)(40460700003)(31686004)(2616005)(70586007)(40480700001)(336012)(186003)(26005)(356005)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:38:25.2849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c70e5c-8cf8-4b75-b772-08dad83f2bb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4974

Hi Jan,

On 07/12/2022 11:34, Jan Beulich wrote:
> 
> 
> On 07.12.2022 11:29, Michal Orzel wrote:
>> A build failure [1] is observed if CONFIG_VGA (and thus CONFIG_VIDEO) is
>> not set. This is because XENPF_get_dom0_console cmd of platform hypercall
>> makes a call to fill_console_start_info, which is defined in video/vga.c
>> and built only if CONFIG_VGA is set.
> 
> Which means to use ...
> 
>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -839,6 +839,7 @@ ret_t do_platform_op(
>>      }
>>      break;
>>
>> +#ifdef CONFIG_VIDEO
> 
> ... CONFIG_VGA here, unless fill_console_start_info() was moved to a file
> that's built dependent upon CONFIG_VIDEO.
The one and only reason of using CONFIG_VIDEO and not CONFIG_VGA is that all the
calls in existing codebase to fill_console_start_info are protected by CONFIG_VIDEO
and not CONFIG_VGA. That is why I choose to stick to the current behavior.

> 
> Jan

~Michal


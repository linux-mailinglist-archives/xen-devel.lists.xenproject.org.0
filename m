Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194F0607C12
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 18:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427830.677269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olulY-0006me-Ee; Fri, 21 Oct 2022 16:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427830.677269; Fri, 21 Oct 2022 16:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olulY-0006jm-Br; Fri, 21 Oct 2022 16:21:00 +0000
Received: by outflank-mailman (input) for mailman id 427830;
 Fri, 21 Oct 2022 16:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNjg=2W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olulW-0006jg-1i
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 16:20:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 567451af-515c-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 18:20:56 +0200 (CEST)
Received: from BN9PR03CA0472.namprd03.prod.outlook.com (2603:10b6:408:139::27)
 by DM4PR12MB5988.namprd12.prod.outlook.com (2603:10b6:8:6b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 16:20:52 +0000
Received: from BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::c3) by BN9PR03CA0472.outlook.office365.com
 (2603:10b6:408:139::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 16:20:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT092.mail.protection.outlook.com (10.13.176.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 16:20:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 11:20:51 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Fri, 21 Oct 2022 11:20:50 -0500
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
X-Inumbo-ID: 567451af-515c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsE+dxReofOzdV6f/MZG5vWOBCavjGPBJNmPweJxGiefccyTmSWAjSHXhZ0sIwKSR+uYmduwwl5jtBS1jC3iKZuenwFhKHnZcz+eGRVQqyWrkwB0wX5sSQ/YnOv0ePuTw+kmP4txtdX6NlDREwexdQLJLlEvsL+UaZiZhGyKFzK+fdOplRvf9yhmJ99FydhX9IdpKMfAacJmUleuU/sdwWIcwu7qQSwbNKAlnLDY/1lbMPKV5ynGE0zwCRzz8l5edj3hgrfbLkZSrNsxa6jKKuEC7J3bSV2N49Qz7wbDDDRthorUmaskJregyoDo+Mgw0tcPMoLI70zmwGja1dr5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODAHQoqaVA/zNiZHnEHhtbbtF5AEf8NrJip2WZhnx+Y=;
 b=bsRP7uFc3Ds4dfcE441RBVLAEsxhIqGkk+IRAO58/pjmOpcIDyVUU5V8E/aPk8PVda6nwan98AFZw+KBdicwAESosgrjQXgGs2of8mbnJezXIYlnA+WB/movWsQbMjZmc9rXxzVBHWV7RoUEF02XZqraHE0VuVveiW3KSqrpS3ThI066HO47N9VA2QtX2v+TdxxzvdANB6IJRGP+BJrbA1Egfa63bdo2G3CFN5KpMnOL2RyNP6+8q4dJAL7LJou8fdlBrRG5C38q9tuwUfx0+OhItNRpxgARGk+NwNUcn2winakp4HVGIBZIub6XfNpy01SyLAzH6/9+r4otuIQFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODAHQoqaVA/zNiZHnEHhtbbtF5AEf8NrJip2WZhnx+Y=;
 b=2f1BuOYCFgblbYbTGeUCu0et2ZoZwLwJKxptFX//IbI8IS4xUs1vH8x0TWBjEerlcRfDXaOb4Qq7BxRqkXh0qK2+5cKORQAG1RzGAFFh/Qc621aI8PbLbHYF0itw/lTonvEGM1idDMJEanzaqYnrDu07winkzq+/8RLqYVtkVxo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b48e5c1e-190d-30eb-fdb8-cde5e4224658@amd.com>
Date: Fri, 21 Oct 2022 18:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [for-4.17] automation: Build Xen according to the type of the job
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
References: <20221021132238.16056-1-michal.orzel@amd.com>
 <9eb64ced-d04a-d406-e1da-86691ba79be6@citrix.com>
 <38c918ee-ee21-8887-f48f-f74e2e0a9862@amd.com>
In-Reply-To: <38c918ee-ee21-8887-f48f-f74e2e0a9862@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT092:EE_|DM4PR12MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 748cfdb1-db13-4ad0-b86f-08dab380393f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qwtY7/xyiNH6FGxxnis/G8USgk18tVtnnGsovbIXZqoI3zFhQUjLE2OAkbn13flt8/gsnVbFuiu4MG6OH4Nd59jTKQCGe10LrIVGPxwBH2JDOg1tn2v0CxHnOgouh0fvnHiejCffKiK4nMLzlkQz3FZJphIo/Hkx51Q0uzJoj/qmo9HbYfLJPGca1MpZ3xQuq+irBH36h5l+ikaDbdNYyTI5nnhUcDtNIyDj9Mm3/DmyD3BcWIp0IqSKlm4V40egsKRuY7q6G4smLFDbSoktwkcfmHtPBtsU/3A225894W+T8QkifQVORpLQvcEyO2UDXhC1e9UKzafZ0R9DFDGde+TVkNcUphtBwIY4ZllhqSAd4RbiD88gG3wzueSVWpOQsJwWRUfRG4O2EhUxW+hekMIyu9LSwByvvPXv4rIF2u5qiR54GbFK45naHx10lh+UNSKt0VXywUAFxxNWK8hJgafY4tM3pk+vJnIqfoH4thhGsMmC0bVUM8X/AGSByFesPAIhCwGy/wjK1nRXMMjupq5Vocp7K62mpxV7/oo64guiU+GdUAlA/OjMWRIqX61Ae/lwISdkb1QPkktg0Ww8FDnTUAQ5uX6/p85d4JAdw84eezCZgnkIgH7PpT15gqaS0ZXabbYSeMxDlAdQR1wwkUHA2X78H1INm8VcrMEPgsFULV0q9p0tTVt81MoXCsR60zmrF1vUoi2X4T74k1TNOSFjxMCFHSP94CKwe1FbFyTrhT6tu35eNEOxMp3ZY1uqW7AhoFTrXVun+/VeGzdsyT8J6qWVGHM+bwhTBFbQ5oNirrger8agGTpD7LndI2Gf4y2ZMdqy1RzyoKfKfO0KB0+bnP5gt8e+qbtrV1g0Y98=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(336012)(31696002)(186003)(40460700003)(86362001)(2616005)(83380400001)(82740400003)(81166007)(356005)(40480700001)(82310400005)(36860700001)(8936002)(54906003)(31686004)(110136005)(47076005)(16576012)(316002)(4326008)(70586007)(70206006)(426003)(8676002)(41300700001)(478600001)(53546011)(26005)(45080400002)(5660300002)(44832011)(966005)(2906002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:20:52.3540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 748cfdb1-db13-4ad0-b86f-08dab380393f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5988


On 21/10/2022 16:32, Michal Orzel wrote:
> 
> 
> Hi Andrew,
> 
> On 21/10/2022 15:31, Andrew Cooper wrote:
>>
>>
>> On 21/10/2022 14:22, Michal Orzel wrote:
>>> All the build jobs exist in two flavors: debug and non-debug, where the
>>> former sets 'debug' variable to 'y' and the latter to 'n'. This variable
>>> is only being recognized by the toolstack, because Xen requires
>>> enabling/disabling debug build via e.g. menuconfig/config file.
>>> As a corollary, we end up building/testing Xen with CONFIG_DEBUG always
>>> set to a default value ('y' for unstable and 'n' for stable branches),
>>> regardless of the type of the build job.
>>>
>>> Fix this behavior by setting CONFIG_DEBUG according to the 'debug' value.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Xen used debug variable to control the build type before switching to Kconfig.
>>> Support for GitLab CI was added later, which means that this issue was always
>>> present. This is a low risk for 4.17 with a benefit of being able to test Xen
>>> in both debug and non-debug versions.
>>
>> Both series were floating around for ages before being accepted.  It's
>> quite possible that one bitrotted around the other.
>>
>> This should be backported, and therefore should be considered for 4.17
>> at this point.
>>
>> Is there a Gitlab CI run which includes this patch?
> 
> I submitted the one here not long ago:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2F673396949&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cd091891dbc3a4144356d08dab37120ae%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019595719666762%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=r6qIERShnnovl57xvY%2Fo8eKozAy9NBlqyj0le56ZClY%3D&amp;reserved=0
> 
> and there is already one failure in Arm boot-cpupools test because the script sets null
> scheduler for the domain which is not present in non-debug build...

The CI finished running the pipeline and it looks like the null sched issue is the only one (at least this means that this patch is worth having).
I will push a fix for the boot-cpupools test (I will also mark it as for-4.17).

> 
>>
>> ~Andrew
> 
> ~Michal
> 

~Michal


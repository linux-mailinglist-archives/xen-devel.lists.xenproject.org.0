Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091BD6C662F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513782.795307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIpp-0007NY-5S; Thu, 23 Mar 2023 11:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513782.795307; Thu, 23 Mar 2023 11:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIpp-0007L9-2Z; Thu, 23 Mar 2023 11:10:21 +0000
Received: by outflank-mailman (input) for mailman id 513782;
 Thu, 23 Mar 2023 11:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZVY=7P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pfIpn-0007L2-EG
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:10:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 490caa09-c96b-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 12:10:15 +0100 (CET)
Received: from CY5PR13CA0054.namprd13.prod.outlook.com (2603:10b6:930:11::18)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 11:10:11 +0000
Received: from CY4PEPF0000C97F.namprd02.prod.outlook.com
 (2603:10b6:930:11:cafe::e3) by CY5PR13CA0054.outlook.office365.com
 (2603:10b6:930:11::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.6 via Frontend
 Transport; Thu, 23 Mar 2023 11:10:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C97F.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Thu, 23 Mar 2023 11:10:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 06:10:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 06:10:10 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 23 Mar 2023 06:10:09 -0500
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
X-Inumbo-ID: 490caa09-c96b-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bosZ9MIGJc6dRrBpWwUY/MLPH6OHjC4aVRhFfva2357lP2/Ww0UQnWPDQpXAQQ2oMxfaUgYwD+LlAX98K8DG+hNHoYPNI/+AaoPjG5eeSez0X4cMw11Rf9UxCQWEtWxcdJ8RXEpYYOllZAYCShRXKInxoGRuLsjOm8bQwHQG22Xz9MY9nVNRj+gm86DGewRy1WGqyIDWKuLgN21j9xbg+ToFT165yFHqhTF7OlrfnUxzAPedrqiMGzXTBcR7aBQ6nzoDTsVQTdb0FJG3gnYJNS8CAjzj53FDIkTehb8vHPd0blGgqTeKB1zO8/xBiHX/EZJD0YUTuACmwb+H01/4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4widxbphHpArrB0F3pOKk8DifoAe5kxLKXEB+osPoG4=;
 b=TFM1yT8WIfIgDuN4lQruspOxS9THZ/7l3LMmZiWunHpDvcv1CSOQJNocjLsD9jOrs8yPuW58YYgX41TuSELW/dgJcPQQ8fQCnCHrdXkVDoVt+v8pcU/xj1Uwm7K3O9vo6PMQzNn4+KijVCXRocpk77r2NQGlJzQJXP21ZNt+5mwmY4D/sznrhe0kbNamIdegfu0pC4pEECj0wy7VAg/sfA5aSoBsYk9Wj32+AutuqMW5W1BpEh3UqwCLNi3fpb1aKv1hirJNbSyahsn1NJsYOgOIA0Q7dkN6IE3vOoO1bWHKxHcuTBbcuBZFP2KUXqpG63vhLrcxyG7V1RUMIKHvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4widxbphHpArrB0F3pOKk8DifoAe5kxLKXEB+osPoG4=;
 b=d7eAde7MGPJ2MJNXGLG0DQfmtPXsyxxgZoVH0M+ra6YdKSMQ2/5rcQ/b92aL8XVLb0rqk2/bSSsLkZKa62XiLz1xLt7b88kv3nw5IoLNMN9KMTFbXN+OPDsq463f3VyXernSM3XgEY36LSVVqscIuKUppd9Q+3ZbX7wMDfeHB3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b0253701-3696-fd18-ba74-9fb7e6150a1f@amd.com>
Date: Thu, 23 Mar 2023 12:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
 <20230322102941.959-3-michal.orzel@amd.com>
 <130680d1-155e-e989-8ab9-2ef59ca59fd6@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <130680d1-155e-e989-8ab9-2ef59ca59fd6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97F:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba56348-cffa-4865-c219-08db2b8f2b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APK5dqzhhlp4ZIDI4eakJB0+oLiEwM58OvyntUTKQoU26Pki1I8AL+FxFwuBz6JIMEI6pPLAUuGXcoOjZi1+QGaRuJ2d3QbtXBtOuj7R9CbThN8XC09s+cACbWSDnZW3bOKq5wUiVDD6rzqxFNt57k7WkV5eFhFPTfCU9IlJr/14zDbVBPub+PldhkUCLtz3ko3zXkPDrOk9MwW5T1DCF2EipyQ1Fu3Ij+WSJIcVaXCHOKL4k0O3s2g/c2PgJZgBdp71/r9CxAy2AGb99kAUFWUHDtW9bt9i51y1lENPvorG4k3CSuk+Nvv4NUvpsxybfrzsaxwQia0QYZmOZLy+NrIEmM1ipTR2dKaj/SOWCqKmr97MmdrQJiSuhgs+Ex+DZdbf2wwXer69KUgs+dldBoHnkJBg192sgYm6pukCl12fJzYP5v0yMyAkyOHbeBvLcKL4xa4ODWL+H1n5uGuV7dUyba/esqjbpo3Ngqn5zaIqPzUSUU6Hy0nJ19kXTF58A8uTy6M5tDOB0qkGwWWTddUO6ngftpF1rvsdVMKbgd4l67tQsto2wyMUSe2r1GLMjp/JjRnvu5QDe8VfYikOUYXPq1yjgfz5rVaaDRjyLFLmqqFK/XIizDSDYD0crPC1JARSFehBTDkXZmFk63cR2WSMW54yNGlBKnXGu/cZ6feY4D192Ws2Y2wC4qLFkjwgD5EAU2PJbd+/Z56Vr6R3VKt3otYjaTxe3ePLrvGb9DD5wYDRQN1q1WLQmyLtGnkgfe0MqaOI8ymgw66cshksJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(86362001)(356005)(31686004)(2616005)(336012)(82740400003)(6666004)(26005)(186003)(53546011)(31696002)(426003)(47076005)(478600001)(2906002)(54906003)(4326008)(81166007)(40460700003)(82310400005)(44832011)(83380400001)(110136005)(16576012)(70206006)(40480700001)(316002)(5660300002)(8676002)(41300700001)(36860700001)(8936002)(36756003)(70586007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 11:10:10.7198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba56348-cffa-4865-c219-08db2b8f2b37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C97F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885

Hi Julien,

On 22/03/2023 17:19, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 22/03/2023 10:29, Michal Orzel wrote:
>> When vgic_reserve_virq() fails and backend is in domain, we should also
>> free the allocated event channel.
>>
>> When backend is in Xen and call to xzalloc() returns NULL, there is no
>> need to call xfree(). This should be done instead on an error path
>> from vgic_reserve_virq().
> 
> Most likely this was implemented this way to avoid a double "if (
> vpl011->backend_in_domain)". TBH, I am not very thrilled with this
> approach. Could we instead consider to use domain_pl011_deinit()? (A
> couple of tweak would be necessary to use it)
I think we could. More about it later.

> 
>> Also, take the opportunity to return -ENOMEM
>> instead of -EINVAL when memory allocation fails.
>>
>> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/vpl011.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>> index 541ec962f189..df29a65ad365 100644
>> --- a/xen/arch/arm/vpl011.c
>> +++ b/xen/arch/arm/vpl011.c
>> @@ -696,8 +696,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>           vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
>>           if ( vpl011->backend.xen == NULL )
>>           {
>> -            rc = -EINVAL;
>> -            goto out1;
>> +            rc = -ENOMEM;
>> +            goto out;
>>           }
>>       }
>>
>> @@ -720,12 +720,15 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>>   out2:
>>       vgic_free_virq(d, vpl011->virq);
>>
>> +    if ( vpl011->backend_in_domain )
>> +        free_xen_event_channel(d, vpl011->evtchn);
>> +    else
>> +        xfree(vpl011->backend.xen);
> 
> There is another bug here (unrelated to your change). You want to use
> XFREE() to avoid an extra free in domain_pl011_deinit(). Can you look at it?
Strictly speaking this is not a bug. Memory allocation can only happen if backend is in Xen.
This means, that if vpl011 init fails, we will call free only once (domain_vpl011_deinit
will not be called on this path i.e. we will invoke panic after construct_domU).
Of course, we could switch to XFREE just for sanity.

> 
>> +
>>   out1:
>>       if ( vpl011->backend_in_domain )
>>           destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
>>                                   vpl011->backend.dom.ring_page);
>> -    else
>> -        xfree(vpl011->backend.xen);
>>
>>   out:
>>       return rc;
> 
Solution to reuse domain_pl011_deinit would be as follows:

     vgic_free_virq(d, vpl011->virq);
 
 out1:
-    if ( vpl011->backend_in_domain )
-        destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
-                                vpl011->backend.dom.ring_page);
-    else
-        xfree(vpl011->backend.xen);
+    domain_vpl011_deinit(d);
 
 out:
     return rc;
@@ -737,12 +733,15 @@ void domain_vpl011_deinit(struct domain *d)
 
     if ( vpl011->backend_in_domain )
     {
-        if ( !vpl011->backend.dom.ring_buf )
-            return;
+        if ( vpl011->backend.dom.ring_buf )
+            destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
+                                    vpl011->backend.dom.ring_page);
 
-        free_xen_event_channel(d, vpl011->evtchn);
-        destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
-                                vpl011->backend.dom.ring_page);
+        if ( vpl011->evtchn )
+        {
+            free_xen_event_channel(d, vpl011->evtchn);
+            vpl011->evtchn = 0;
+        }
     }
     else
         xfree(vpl011->backend.xen);

However there is one problem with guarding free_xen_event_channel to be called only once.
Even without allocating event channel, vpl011->evtchn is 0 by default. So doing:
if ( is_port_valid(vpl011->evtchn) )
    free_xen_event_channel(d, vpl011->evtchn);
would not help us as evtchn 0 is always there. So in my proposal I'm assuming (I think correctly)
that vpl011->evtchn cannot be 0 after successful evtchn allocation because 0 is "reserved".
But I might be wrong in which case I'm clueless how to do the proper check.

~Michal


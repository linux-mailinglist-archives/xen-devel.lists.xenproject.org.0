Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AD5A9745
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 14:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396571.636753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjbr-00057W-KA; Thu, 01 Sep 2022 12:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396571.636753; Thu, 01 Sep 2022 12:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjbr-00054d-HE; Thu, 01 Sep 2022 12:47:51 +0000
Received: by outflank-mailman (input) for mailman id 396571;
 Thu, 01 Sep 2022 12:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sEHC=ZE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oTjbq-00054X-5Z
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 12:47:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47daf487-29f4-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 14:47:48 +0200 (CEST)
Received: from MW4PR04CA0346.namprd04.prod.outlook.com (2603:10b6:303:8a::21)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 12:47:44 +0000
Received: from CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::3e) by MW4PR04CA0346.outlook.office365.com
 (2603:10b6:303:8a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 12:47:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT098.mail.protection.outlook.com (10.13.174.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 12:47:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 07:47:42 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 1 Sep 2022 07:47:41 -0500
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
X-Inumbo-ID: 47daf487-29f4-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdOWKpooVjW4dtMwc/PJxJjyn86WijqVHYCDSK8YDCW06CLrUJIQKpB+Oppuf2G+S2gipVWdbwZRW3iKZE/wnhxkk6LPF+03j8KCa2ua58LtLsWCdOELmGYiphTzCzj2yo9Lcxz6FZsIZsdwEdL+iZGqJ7kyjDvJW6cJGDjpYMEeY63rthPO+w5hFw8rH9vzfPdGbA6QTIFEGtKGcJKFO2O/30FPS3+KRFCS3r5w3kcAnH2ImxONW7kGEywXQB4RVK9YPu6G3ZFuNrFylCYWVeVtc0VEOVC61LcbyQ+v1SW3LDy7srK4Hw7bC6Fz7GpxR1w7fhlHz2q2FMJDwjcMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCqMWkbONnNBW7xCZnzA02s5mxJuxs8qoF+Sr83l4IM=;
 b=c+J3mb5U/NRWUpVZe+26wbJ/Yg1jdoHmGgayZEzH/AugbqCIc3EEgY0TEcrES1mOMDT+CLw7aDpqgTO2l4a9csEsj9pdYQYelXX6GgQ+s23B51FmqSpgfhjqWnRxOUX6U8qcvtXLQiLPSR4UL30czWVMZRHMLgh3mmEzofGhhMRburCBz2QWPiymeawfmc0xkKMxPi/TuCKMWPDI5AxrB4y4dpRxtyz78loC38BK+of+HpzV9TYEJtEiJ1+JUG+dJQP0xIwoiRDdkdp1V+Cla5Y41iPMsTpJOshLkFDEZE/Vcjv99DA+sa1dGRbQRO+zofwEokNTycZwit/zrQesKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCqMWkbONnNBW7xCZnzA02s5mxJuxs8qoF+Sr83l4IM=;
 b=0d2FrOUsa91RpxtEvb0AqVRpnV077E0NWM13F4VFjweyfrc31Fu57Y7x8zJeYL6g/N5JqE/gYV7kvYqixW2CVymFIW2kHJht1IROX1S39Dd1eRo28SrKlZdcBUYNf0UTPsbWd45CVzY4QBwW3pW6LjNi+ES/Yo2z7hHTaJ2c7WQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <717a1674-9217-9162-1f84-838ea4c79840@amd.com>
Date: Thu, 1 Sep 2022 14:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, Julien Grall <jgrall@amazon.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <2b7be7ea9f2f06939ebc185490196f20614b6a3b.1662023183.git.rahul.singh@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2b7be7ea9f2f06939ebc185490196f20614b6a3b.1662023183.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d42719d-5d24-4ab9-4ffc-08da8c182a29
X-MS-TrafficTypeDiagnostic: IA1PR12MB6650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8NIRppsz4kADx8AXFivAMp3yhCEBdgFrftb3OGFCXkklDDK6Xk78X89EEwrb25lgb3SbcwoynfY7YHpYt2OzRF9UTwChQXp5YPWkDg8Ez5k1VwySvKoC6cDS00eQ52Zz3U1S10yylnbkfvhK9ZB5l9J8JqB4NhoXbBd3Vu87ire8u4luL6VrRV+yhkEEAEZmZkQRl/MKbac+wNB/8vOtuxrCilvish0bSwfLnZbJxl07g3Sdw7uqNvrNPSjec1nl9TwVPlpQjqYS6D2owp+JSeshLiNhbgNYJAn9pUxkWgFEhoqcbeyfTIIGWwYDFfaB8utJk77G351Sm0vTZfRRuFTWHBqXgdL2Jyp9SnSFwhE6Fylg4+vJAN5T6c7YjAPPlO+nONmpn0bib/atvlUCk9xOdmXOfZgJNGIFCMylHmc0IiA7KAziYQHhvOL/6KiJK0ZcqUPPaMkURDCGOnH/Xhd6xD1nnPgFejg+dRCrqsqLrwNMHqW8Mtmt70yBqheY4YviTtdrTQPb/cSZxu80RGPz6F6n2QNn8xqerOogH1MCO3f0wNP535dDt1O9Pf3rXlrF+B+lktgjJm9Oe9VTVr20qhKm2y9CZfK0mA0u4cz36vszleuK09q064yfQN8n4vdHLRgHCC+q/lENAjGgCHPJGcOgl2Y1nd1gj+qwZM/JZKgQS0ayW5CRh+S7mquYwU9CTwDcA2PdvmMt04OWuSKEmRJESOXEzS7NjPHPeAOl/aONL713ZnwNOry7Tg0Z4pR4m9G/2NCTp77bJJRWd+hoM9UAOaSH69h4RoYymX91zfaiL8/hzJjUbhHA+jx6IFXIZ9/6bECx1Nn1eNXQ+g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(36860700001)(82740400003)(40460700003)(81166007)(54906003)(31696002)(86362001)(316002)(8936002)(16576012)(7416002)(110136005)(2906002)(44832011)(356005)(8676002)(70586007)(426003)(83380400001)(186003)(70206006)(82310400005)(5660300002)(47076005)(2616005)(336012)(31686004)(4326008)(53546011)(40480700001)(26005)(41300700001)(36756003)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 12:47:43.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d42719d-5d24-4ab9-4ffc-08da8c182a29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

Hi Rahul,

On 01/09/2022 11:13, Rahul Singh wrote:
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 01280dc19cf3 "evtchn: simplify port_is_valid()", the event
> channels code assumes that all the buckets below d->valid_evtchns are
> always allocated.
> 
> This assumption hold in most of the situation because a guest is not
> allowed to chose the port. Instead, it will be the first free from port
> 0.
> 
> When static event channel support will be added for dom0less domains
> user can request to allocate the evtchn port numbers that are scattered
> in nature.
> 
> The existing implementation of evtchn_allocate_port() is not able to
> deal with such situation and will end up to override bucket or/and leave
> some bucket unallocated. The latter will result to a droplet crash if
> the event channel belongs to an unallocated bucket.
> 
> This can be solved by making sure that all the buckets below
> d->valid_evtchns are allocated. There should be no impact for most of
> the situation but LM/LU as only one bucket would be allocated. For
> LM/LU, we may end up to allocate multiple buckets if ports in use are
> sparse.
> 
> A potential alternative is to check that the bucket is valid in
> is_port_valid(). This should still possible to do it without taking
> per-domain lock but will result a couple more of memory access.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v3:
>  - fix comments in commit msg.
>  - modify code related to d->valid_evtchns and {read,write}_atomic()
> Changes in v2:
>  - new patch in this version to avoid the security issue
> ---
>  xen/common/event_channel.c | 55 ++++++++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index c2c6f8c151..80b06d9743 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -193,6 +193,15 @@ static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
>      return NULL;
>  }
> 
> +/*
> + * Allocate a given port and ensure all the buckets up to that ports
> + * have been allocated.
> + *
> + * The last part is important because the rest of the event channel code
> + * relies on all the buckets up to d->valid_evtchns to be valid. However,
> + * event channels may be sparsed when restoring a domain during Guest
> + * Transparent Migration and Live Update.
You got rid of mentioning these non-existing features from the commit msg,
but you still mention them here.

Apart from that, all the Jan comments were addressed, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


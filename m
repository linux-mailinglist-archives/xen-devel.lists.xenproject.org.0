Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909061EC6B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 08:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439089.693047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orwtv-0000sD-32; Mon, 07 Nov 2022 07:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439089.693047; Mon, 07 Nov 2022 07:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orwtv-0000p3-0A; Mon, 07 Nov 2022 07:50:35 +0000
Received: by outflank-mailman (input) for mailman id 439089;
 Mon, 07 Nov 2022 07:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dVpB=3H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1orwts-0000ox-M5
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 07:50:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d94610ef-5e70-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 08:50:30 +0100 (CET)
Received: from BN8PR15CA0046.namprd15.prod.outlook.com (2603:10b6:408:80::23)
 by SJ1PR12MB6244.namprd12.prod.outlook.com (2603:10b6:a03:455::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 07:50:26 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::82) by BN8PR15CA0046.outlook.office365.com
 (2603:10b6:408:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Mon, 7 Nov 2022 07:50:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 07:50:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 01:50:24 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sun, 6 Nov
 2022 23:50:11 -0800
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 7 Nov 2022 01:50:10 -0600
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
X-Inumbo-ID: d94610ef-5e70-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nj4SBLMZT/9+IBU8pVjTwmoFywdL60xtvfrcqJjh8KXpgsig+1ixSp9wXXWoOx4KZd0oiOi+Mc1OiNajiLsgmc+GS1oMPee5JTx5DVUyqgm+6uwgtH0UBz+pNLBXcyZ/C/ALGPjbWYGXlWFpYrpQOJmwauF2B08/U3Jc0pZ7WzU96ZRwCgb8VQfXMH1NwAaYdVEDThMH44bc6v/pQygUqdlwNCqUbXWvxOB+hm5YDe9GyLIn4DFiUtzbMrLJXoTYd7jP7V5/FzBMPrDRipc4kAVqSa8vJIE0vg4wUwO/SZo9Dhx9qMkShDUF3XFMB1GvT3uFBz2DKYxKZFq4AzoCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htr7QNeo46nvQrz2SPXrmdAFGDd+GXvnXvsr8xa1f1Q=;
 b=BzkKIXCYGg6S+CKnLNB+TsGFGnvW9XYSbBYOcxqz9wBaMdkEGkx/4Kgk3aqfYxN8k/C2Rv4fWsBFewnVph5wIviClh6REJvYOCDmEiXpZ7AZ5o84lwDhlJZkoBxLX3CPL9zZrowXfY1rerOo3Ffrb+61nnMJITV1Nwv3lXG9NBvnSzMYrfsXTvuPxKomM8CzL7uLSafNr2Z4xLdcUEF4dSlSRz7nujCm+urxywkGa0cqLQdM8WOPAmkc6xGd5DGqwolE+qPSBe+Gkoa+bG9pT4okHe23yS8u8L6xo+dXqEBRw+EhW+HTRVwKUnMPe2SsOO+nmlLdD8Bh+KNnV/Az2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htr7QNeo46nvQrz2SPXrmdAFGDd+GXvnXvsr8xa1f1Q=;
 b=Xypby1uEe9K38DrcukKuhTB7hQBw6T8R3FeWIj7P5y1Bb0F98jWKjTuokT7WfuUINJl/9K1iW3SU1KmZ5DQRFQJy/bsuq0QXOmuWtMWlfVEPKdYLu7bqm1ccuAp6lmTOYoTcmGC9Zfmi4rdIgHT+EA3c2dND1k6ksZWmhwJWI0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
Date: Mon, 7 Nov 2022 08:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Doug
 Goldstein" <cardoe@cardoe.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|SJ1PR12MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: db8a8327-8452-449f-dd74-08dac094bb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KtqK3DfO4ixp6XvkVNdBrHfs+zKIbKPfxwL7/6qEqSDsLGKGKYk+wD2tKtlALCqiv+Y/vwkuczsCyfzZLZY/FshnkzUBMkbpKrrZPhAq0+e7RpWMoKDb98JR9ViPBgwZZHghy+LbPBILsjAq/Kx8Ne95nRdyPzsY21t0NgkcnkmqEHy6bD/zhmseNgCaDhdbezLtX8fAN/Ljus10H03P32QjCH400mBqf2cSw2kWdOzroj6VokIHaR3ApQYjJvYNMquxiVg/f7bOEPJdRqYzl6U0XgvSprnhpzk3ioGXxo+L3YvHk+yem98wrG0ml+6IZ9VZMBM41pu+Qha9ym/YVYIqB/B7QEMkODCuR64r7w6boLa3z1SSgUP01mdP3ZBcMNB9sspL2tPIjGZGJ2rB4Q7TedDVHjahnb65nHc9uhBEJX6KZbl7U5IF1u0gipJMkrd+wQhI21cGFLYmuovGr6jcuqUB0mjlCGtrGTNNy1J6/GBCewIPHcwjQDcJpKNZgXdFYarDwwKJK+11wbjQVdBRswfwj01/PBJjgGmniVRb5RD8s8JVdUDK8fwIXZ/yNwLmUZoEJDte7P15RN+g+636/RTvTi0ajL7sXUZULh7mghOfynsWO7dcRxV/9VPeDuH9Jg4hYOlchxUobJb45Z/L4rwiHZ8pxiLmMaUAUxk4wktZcOll6eYdUDDv+iTKJnnlBPsc6iQ7VyX4N1ADPffrY/mnTDS3tcReIB8JSaoTaQZ9Ne4NxwOBIhtdSbbKzZBfq/sP+R0FGomZiFPWNM6qlkTr0FtHUBbn7mYGRhUSITr4g9ATfTIEQDgGpMJePmtM698b5ga2k/ntIj4N71eXujrcBriqIL9WMR4nq1KLWDpBDQ0m7upYCcShA0qq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(31686004)(31696002)(86362001)(356005)(81166007)(40480700001)(40460700003)(5660300002)(44832011)(2906002)(2616005)(426003)(336012)(82740400003)(47076005)(36860700001)(26005)(53546011)(186003)(70586007)(70206006)(16576012)(110136005)(316002)(966005)(54906003)(478600001)(82310400005)(8676002)(4326008)(8936002)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 07:50:25.5841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db8a8327-8452-449f-dd74-08dac094bb48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6244

Hi Bertrand and Stefano,

On 31/10/2022 16:00, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Bertrand,
>>
>> On 31/10/2022 15:00, Bertrand Marquis wrote:
>>>
>>>
>>> This patch series is a first attempt to check if we could use Yocto in
>>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>>
>>> The first patch is creating a container with all elements required to
>>> build Yocto, a checkout of the yocto layers required and an helper
>>> script to build and run xen on qemu with yocto.
>>>
>>> The second patch is creating containers with a first build of yocto done
>>> so that susbsequent build with those containers would only rebuild what
>>> was changed and take the rest from the cache.
>>>
>>> The third patch is adding a way to easily clean locally created
>>> containers.
>>>
>>> This is is mainly for discussion and sharing as there are still some
>>> issues/problem to solve:
>>> - building the qemu* containers can take several hours depending on the
>>>  network bandwith and computing power of the machine where those are
>>>  created
>> This is not really an issue as the build of the containers occurs on the local
>> machines before pushing them to registry. Also, building the containers
>> will only be required for new Yocto releases.
>>
>>> - produced containers containing the cache have a size between 8 and
>>>  12GB depending on the architecture. We might need to store the build
>>>  cache somewhere else to reduce the size. If we choose to have one
>>>  single image, the needed size is around 20GB and we need up to 40GB
>>>  during the build, which is why I splitted them.
>>> - during the build and run, we use a bit more then 20GB of disk which is
>>>  over the allowed size in gitlab
>> As we could see during v2 testing, we do not have any space restrictions
>> on the Xen GitLab and I think we already decided to have the Yocto
>> integrated into our CI.
> 
> Right, I should have modified this chapter to be coherent with your latest tests.
> Sorry for that.
> 
>>
>> I will do some testing and get back to you with results + review.
I did some testing and here are the results:

In the current form this series will fail when running CI because the Yocto containers
are based on "From ubuntu:22.04" (there is no platform prefix), which means that the containers
are built for the host architecture (in my case and in 99% of the cases of the local build it will
be x86). In Gitlab we have 2 runners (arm64 and x86_64). This means that all the test jobs would need
to specify x86_64 as a tag when keeping the current behavior.
After I built all the containers on my x86 machine, I pushed them to registry and the pipeline was successful:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/686853939

Here is the diff on patch no. 3 to make the series work (using x86 tag and small improvement to include needs: []):
```
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 5c620fefce59..52cccec6f904 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -65,6 +65,9 @@
     paths:
       - 'logs/*'
     when: always
+  needs: []
+  tags:
+    - x86_64
 
 # Test jobs
 build-each-commit-gcc:
@@ -206,19 +209,13 @@ yocto-qemuarm64:
   extends: .yocto-test
   variables:
     YOCTO_BOARD: qemuarm64
-  tags:
-    - arm64
 
 yocto-qemuarm:
   extends: .yocto-test
   variables:
     YOCTO_BOARD: qemuarm
-  tags:
-    - arm32
 
 yocto-qemux86-64:
   extends: .yocto-test
   variables:
     YOCTO_BOARD: qemux86-64
-  tags:
-    - x86_64
```

Now, the logical way would be to build x86 yocto container for x86, arm64 for arm64 and arm32 on arm64 or x86.
I tried building the container qemuarm64 specifying target arm64 on x86. After 15h, only 70% of the Yocto build
was completed and there was an error with glibc (the local build of the container for the host arch takes on my machine max 2h).
This enormous amount of time is due to the qemu docker emulation that happens behind the scenes (I checked on 2 different machines).

So we have 3 solutions:
1) Build and run these containers for/on x86_64:
 - local users can build the containers on local machines that are almost always x86 based, in short period of time,
 - "everyone" can build/push the containers once there is a new Yocto release
 - slightly slower CI build time
2) Build and run these containers for specific architectures:
 - almost no go for local users using x86 machine (unless using more than 16 threads (which I used) and willing to wait 2 days for the build)
 - faster CI build time (arm64 runner is faster than x86 one)
 - someone with arm64 based machine (not that common) would have to build and push the containers
3) Try to use CI to build and push the containers to registry
 - it could be possible but what about local users

Regardless of what we chose, we need to keep in mind that the biggest advantage to the Yocto build/run is that
it allows/should allow local users to perform basic testing for all the Xen supported architectures. This is because
everything happens in one place with one command.

~Michal


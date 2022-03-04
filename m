Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3981E4CD41A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 13:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284252.483453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6oQ-0007lC-Ma; Fri, 04 Mar 2022 12:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284252.483453; Fri, 04 Mar 2022 12:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6oQ-0007id-I9; Fri, 04 Mar 2022 12:13:34 +0000
Received: by outflank-mailman (input) for mailman id 284252;
 Fri, 04 Mar 2022 12:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zc/n=TP=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nQ6oP-0007iW-46
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 12:13:33 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 811d3015-9bb4-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 13:13:31 +0100 (CET)
Received: from DM6PR03CA0011.namprd03.prod.outlook.com (2603:10b6:5:40::24) by
 SN6PR02MB4989.namprd02.prod.outlook.com (2603:10b6:805:71::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Fri, 4 Mar 2022 12:13:27 +0000
Received: from DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::12) by DM6PR03CA0011.outlook.office365.com
 (2603:10b6:5:40::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Fri, 4 Mar 2022 12:13:27 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT036.mail.protection.outlook.com (10.13.5.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 12:13:26 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 4 Mar 2022 12:13:25 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 4 Mar 2022 12:13:25 +0000
Received: from [10.71.117.182] (port=58089)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nQ6oG-00036m-El; Fri, 04 Mar 2022 12:13:24 +0000
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
X-Inumbo-ID: 811d3015-9bb4-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AD2Y0OAJPUSYc/s+nmp0erQ5p4L3xjGiqByMQ7iqQPWvhXlv8hsVAdCoPrYnUpz4YTipVPiks95U7No7OlKsvX27iY/pRvuqYG+dybyThvTz3VbduNnvA4foADKlK0o2gHLMaBxZ/j8+umOTf9QM4kJb0OjnkNLuzv0eldD9xLoQs4hcUvbBoyADjTpMB9tLA6xQG3r4TASzYb/rShkNjMtCTEhQwTD+ARF4v0iYoJbETbqv8bzUrNmqhzbCMt4kijElB93IgOYk8AqpEbGBVaV4Rh51ceTKoDdYfP+bmFFMJRbjevEb/wuY1Vt7/qQ5of6h1dY+JGJB7YSu/erT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVHYqt6+KjCrCZlM/hq1qXnt9nEaEPbJGD011O0LeKM=;
 b=YjXvHXCpoOeAtKrdU0nwgk5jCRYUoEMiyy3JW0t78zU+qvxhpHcPMwPPLO87gUT5dgNRcSJE3T56UifEDbHeoPhANT5tFHUKi4xuenRXLOAi92Gf0GSauSgMx0LK9A3kzxerJ1j03Jn4Nc5uhvyjsD1V5Nn7HcQCxpHGwO9u9I8N6G+LDwl/o+U46Jt1p/SrnmNm6Qa88MP8AI3moyA+ndBbIHTrhAFi9K32flSLKXkH49ClUmdRKfB5Inwqy9CqVAh8TEi86jQ2ZDX0nYXm1O22ERMQb2JctiUBcWFRlh8/j4JiSTB4KebZksqEM2cS9XlvVk8EohsfRuB33Sjn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVHYqt6+KjCrCZlM/hq1qXnt9nEaEPbJGD011O0LeKM=;
 b=Vz7JAsZyR10S1fMittSWNuiR5Lt0Z2rUOgvGAMBZMWqflXvpdATtudchqy+FzciLvctyU6np4+hmUB6SET2cvyOsC1U8n9J2+E77sPklHU2wRc6XYrLOgCCYeFiu3WQVhtcP26LDwWduwuYuFj2Hyh77dPJ6IgGBrYtygfYiShs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <8f78044e-aca2-5919-1841-15989daeb986@xilinx.com>
Date: Fri, 4 Mar 2022 12:13:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-5-ayankuma@xilinx.com>
 <26ee167e-16ea-e358-f390-dc96961d3234@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <26ee167e-16ea-e358-f390-dc96961d3234@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 458743a7-9495-440c-a105-08d9fdd86335
X-MS-TrafficTypeDiagnostic: SN6PR02MB4989:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB4989994038A63462C955F71CB2059@SN6PR02MB4989.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZShCIXdDzYCs1u0kVqoGeqwdE/ZqI642+IrDP6K7mBA1Wxo97vluvSjiH6OhuOvqR8X8bZANB4NAOdJ/h9fTrM/QmdbJUkL/+MRCsnSdPNAdc+5KYnro3D8iXa//i+ka+uaJZ03AE0Gha+MStzQMr71KV0R10wd8ex30Fu8qwN+H5UfB1fPJneJVoX/nbqYiY3jnVq+rV6OiiCn6b8XJk3x8d3mcpXu2lzdVpOjEr6TiTn6uBQ6vPyq2zRhFue9Q0prtq0hH7qn74M4bxAl8Jb3SCzSGxhS3aNvfEIWIBETuAcV2ywm0jDn+IFcCATIhEn6/QAJQe5HT4OtA7tU7qWYEkkwqNcK67Tx5q/cLAq4QNs5pjJkZvc13rc33gQI5CvpaPzrhf4ONiRs0Oiwi+54RvXvvd3Vnq4z6kYX5hqfWT5eDosZGcKN5SXQegC7TFdPodVzlUoweJwnTb5fkJxchDgd1Gl5KDMKd+qeyZ+imR45V6hDV8MuwW8gQFmiefNaEzBNNpQtCShPhzwzZguPqh9DZAkaMyCMFKCEFAmCeF5jd/DTAaK3gxIN5yYEBvUlCqLKS/dmj4rCp5+EAzqFjYNvTIxHPJmpD0SmatfXJAhrsOAVm90NoL+IMmzEy+wLZnbqgODPug86NXMRriSZCWAs4nc22IRn4aStsYe8ci3pBAStwuehxxncAlxnQUGZfSffaG6TOiJrmV6zciHRq6ieww3W6dIMHhFm3ZU=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(54906003)(82310400004)(70586007)(2616005)(110136005)(316002)(5660300002)(31696002)(4326008)(8676002)(7416002)(8936002)(9786002)(36860700001)(36756003)(53546011)(7636003)(40460700003)(47076005)(508600001)(336012)(426003)(2906002)(186003)(26005)(356005)(31686004)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 12:13:26.6670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 458743a7-9495-440c-a105-08d9fdd86335
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4989

Hi Julien,

On 04/03/2022 10:46, Julien Grall wrote:
> Hi Ayan,
>
> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>> When the data abort is caused due to cache maintenance for an address,
>> there are two scenarios:-
>>
>> 1. Address belonging to a non emulated region - For this, Xen should
>> set the corresponding bit in the translation table entry to valid and
>> return to the guest to retry the instruction. This can happen sometimes
>> as Xen need to set the translation table entry to invalid. (for eg
>> 'Break-Before-Make' sequence).
>>
>> 2. Address belongs to an emulated region - Xen should ignore the
>> instruction (ie increment the PC) and return to the guest.
>
> I would be explicit and say something along the lines:
>
> "Xen doesn't cache data for emulated regions. So we can safely ignore 
> them".
>
> There is a third scenarios:
>
> The address belongs to neither an emulated region nor has a valid 
> mapping in the P2M.

To check this, we should test "try_handle_mmio() == IO_UNHANDLED". If so 
then send an abort to the guest.

Is this correct ?

- Ayan

>>
>> We try to deal with scenario#1, by invoking check_p2m(). If this is
>> unsuccessful, then we assume scenario#2.
>
> This means that you will ignore cache maintenance on invalid region. I 
> think we should send an abort to the guest rather than let them 
> believe it worked.
>
> Cheers,
>


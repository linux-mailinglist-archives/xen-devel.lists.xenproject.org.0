Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3460D5F9C3C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 11:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419188.663946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohpOm-0005CE-R0; Mon, 10 Oct 2022 09:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419188.663946; Mon, 10 Oct 2022 09:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohpOm-00059S-N2; Mon, 10 Oct 2022 09:48:36 +0000
Received: by outflank-mailman (input) for mailman id 419188;
 Mon, 10 Oct 2022 09:48:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpu8=2L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ohpOk-00059J-AE
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 09:48:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b26cfafd-4880-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 11:48:31 +0200 (CEST)
Received: from MW4PR03CA0198.namprd03.prod.outlook.com (2603:10b6:303:b8::23)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Mon, 10 Oct
 2022 09:48:29 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::b0) by MW4PR03CA0198.outlook.office365.com
 (2603:10b6:303:b8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19 via Frontend
 Transport; Mon, 10 Oct 2022 09:48:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 09:48:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 10 Oct
 2022 04:48:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 10 Oct
 2022 04:48:27 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 10 Oct 2022 04:48:27 -0500
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
X-Inumbo-ID: b26cfafd-4880-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfg85jAaP0MgBJVLevGudJg+rEOFHmNzfY1t0C6E1DLHskBPNYJPiGd3wel8JyfmOferTHVgre3tJo/7Jrrz8WILromnkJUSQoFvAuwtNTDIwYEnn1uRkEJSIkgrG/oW5yfMNz9V90HhAERo3X5WT0AmiScCpCdG8gwSsCIVE+cIBdwkR7ayf5yF4ymYwiT1A4W4NjJsB15zIWjyJG6KcqQHOmh+x4YvBWTxvEYuIXPPvR/LA2YXjyXdZgo3ZZCV9xvSo1GQon9O8p0EwsjWsOZhDuVb4YGTsdOBZT4bvXrKZDFJVQDUgp03SvR1gy6R0kTmUcO61xziJs/VCkb+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+oiqXiIEQsh91k5QdM3+lKlZyOl+iWPncFyfcj5C+Q=;
 b=K8Jc3/flkLvfrVxSyo3yzz+Kg9Z2iUuCtjL8cIzBEHsl28RKajxy2c+P5s6umKfQ2gn4p7EkBJG3Wkj1bVhjlxE7STtdrE2ZvYh3G8UvdfPkCVuc06fIEb6cN824Xl68aj+IRgwyjC+Jy/Q6Qt/yHL33uXrKTlchQddulZoQ34J+UOVWAX9LKIzD6WxB/GIFig+4XqGLjTCZmY3rBdZdXcJZF04UXj8T+42LTj9ltnU8lb+np9FmqfYrKviyp4wqZt5ZBzjtpfFTrbNUYveqxjW5eQmqivvYnnXGi+zVVVhTIrgvNaU6VHWkg9ViDEJIboLAnhFJM6a/y9/ScDiF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+oiqXiIEQsh91k5QdM3+lKlZyOl+iWPncFyfcj5C+Q=;
 b=S9EJuyPWuDpv4JAOqtNdqlgqEOtUb5G1SOKhKBYUuzfEPqBuuydsUUUHKXjPDjUNhM9KE1375yJ7BWGOJlY7n3Rc67NQIxw7GvdO7D4mj5Fv1CloVGbbafZpN8hGq2Qr4JJMRLUR6jw2FbyjTp4Kh9lKDepUoZbpGbqnKunhvUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f052cf3f-529c-2156-f058-2a320a4f1b02@amd.com>
Date: Mon, 10 Oct 2022 11:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [ImageBuilder v2] Add support for 64-bit addresses/sizes
To: Xenia Ragiadakou <burzalodowa@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
References: <20221010072947.8300-1-michal.orzel@amd.com>
 <4fc23936-4bfd-635c-b3a2-554e280ce884@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4fc23936-4bfd-635c-b3a2-554e280ce884@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4108bc3d-a6f7-49e5-7e2f-08daaaa495a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9oog1z1PCD03w+89bL2ao2EygLbtFZo2uzdCXdjHqXNiK/by29aBfiVMPMr5niKNXSrjZVFJI9ghz2OoDR/qV15snWkW8gPlp1fvIMCuTgD8WavQ3FCiRvUWB3Fv6rpnVn0x+RQlKRDGZ8SHjYIPi4cJjuA7+wVg0fRi/PoTiixsSMnkjB2coG6J+okY4qjod4NLjHaBiibNlMBW0LgAkw5bPuLk0u2MV+ED98I74yj6y4+jcCmYDnu95NFPpQoo3A04doawLPoKwolVvyXthEZYqSVUsThu0TW1ILloci3Ppn04BHq087qu8xyAMiBzkrTqXNq5raUuvZifUYVa1g7Loyitet77jnUfqOvpqoTXfW3IEx9hVYQarLOR0sUFe141KZlOaqoJI1JldHRa3syXQPme2aAe0HmoDp4ijnNtny4nvqmUBriCmyG9jhAmqtay8dFpdwM3RwKZamFd9gUfoqSjh746AT8aH8V5thIFbVP0Se04gV0AEg8WQ4h+IB0X6RzmjWEIvxMpxGI7q1ChDykzleSG8rLXGLKROCBjrOGPSD9lzFOKVKbXfzxswdB84C7V1aNMCCHMlW8LgGFSVZ5/pVgI5jDij+0c29q9y2QwVQew+B6EJOAaCJyCSNaVw39XK8pO8clQvnjebdxaMWFHEvK9WRNnSyBqOVkrbJ5VXeeH44mhaYIeWBKUZuWAPgnG591RVGi1ArH/K87COe++JTsfC6oNc2XBhWdKNH2l/kzZX0UFCUssbPe6NrihymSUNQkMNd1e6VBpTnu3egvakzaOuICDjTUkIGDRPx+I/TiUGoE0voibNsPlkkIoUBJoQmbhQktTmW0atA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(110136005)(36756003)(53546011)(44832011)(8936002)(82740400003)(83380400001)(186003)(2616005)(4326008)(40460700003)(81166007)(8676002)(478600001)(356005)(70586007)(6666004)(41300700001)(2906002)(36860700001)(70206006)(82310400005)(16576012)(40480700001)(86362001)(316002)(5660300002)(336012)(426003)(31696002)(26005)(31686004)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 09:48:28.6309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4108bc3d-a6f7-49e5-7e2f-08daaaa495a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130

Hi Xenia,

On 10/10/2022 10:52, Xenia Ragiadakou wrote:
> 
> 
> On 10/10/22 10:29, Michal Orzel wrote:
> 
> Hi Michal
> 
>> At the moment, ImageBuilder assumes that all addresses/sizes are
>> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
>> value for the first cell. Because of that, we cannot specify
>> MEMORY_START and MEMORY_END to be above 32-bits (e.g. to place the images
>> in the upper memory bank).
>>
>> Add support to properly handle 64-bit addresses/sizes:
>>   - add function split_into_halves to split the value passed as a first
>>     argument into upper and lower halves. These are then set as values for
>>     variables passed respetively as the second and third argument,
> 
> s/respetively/respectively/
Ok.

> 
>>   - add function split_addr_size to split address and size and form a
>>     string to be passed to dt_set as data argument for reg property.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v2:
>> - redesign a patch based on master-next instead of NXP dynamic assignment patch
>> ---
>>   scripts/uboot-script-gen | 33 ++++++++++++++++++++++++++++-----
>>   1 file changed, 28 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index b24dca2b7f7e..09d237d192c1 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -22,6 +22,29 @@ function dt_mknode()
>>       fi
>>   }
>>
>> +# Usage:
>> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
>> +function split_into_halves()
>> +{
>> +    local value=$1
>> +    local upper=$2
>> +    local lower=$3
>> +
>> +    eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
>> +    eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
>> +}
>> +
>> +function split_addr_size()
>> +{
>> +    local addr=$1
>> +    local size=$2
>> +
>> +    split_into_halves $addr addr_upper addr_lower
>> +    split_into_halves $size size_upper size_lower
>> +
> 
> Just a minor observation, the variables addr_upper, addr_lower,
> size_upper and size_lower can be declared local.
> 
This function is to be called to perform substitution and as such
is always executed within a subshell so no need for local.

~Michal


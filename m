Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EC5F9D6F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 13:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419223.664000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqmd-0000sS-Bz; Mon, 10 Oct 2022 11:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419223.664000; Mon, 10 Oct 2022 11:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohqmd-0000q1-99; Mon, 10 Oct 2022 11:17:19 +0000
Received: by outflank-mailman (input) for mailman id 419223;
 Mon, 10 Oct 2022 11:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpu8=2L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ohqmc-0000pv-EN
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 11:17:18 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 184fa91a-488d-11ed-964a-05401a9f4f97;
 Mon, 10 Oct 2022 13:17:16 +0200 (CEST)
Received: from BN9PR03CA0699.namprd03.prod.outlook.com (2603:10b6:408:ef::14)
 by CY8PR12MB7633.namprd12.prod.outlook.com (2603:10b6:930:9c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 11:17:12 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::b3) by BN9PR03CA0699.outlook.office365.com
 (2603:10b6:408:ef::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 11:17:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 11:17:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 10 Oct
 2022 06:17:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 10 Oct
 2022 06:17:10 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 10 Oct 2022 06:17:09 -0500
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
X-Inumbo-ID: 184fa91a-488d-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBY6RjRxWRivXIiK04D50FeHD4/ShUxrZm4oxgHkDP3yzvszwtVqUtY+bNuOnBLzSC31SL57o4K2TCQpe+lwxvmgdeMpyRiqQKTWTBH7SPNZgvZblht4eSn8wIGAE/maHViKsNB7YkPFiiyhGcbagud1a4uaDY7gJXDBTozL/w9xo8hrhNbjmh4EMoTHC23WbOxDulZnit0FzLEclYJI/wzM6oYRfIO9I9l1luvtEmw6x+tyuVWnvaH++5HEGa5rOvs6JvQZAEgRjXFwTj6uxk4T2km5RK/bXXpo2TpkUaFXI2z0KNN+AG5cGvBwhXtVQffiEQNv24tRhvoK34TWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6OCjTyvdzPX0EU3EY/BixjntWzEslkxV2JB4JQdw6o=;
 b=HhnNHfOuaCfvMtou4VrS8XOMNv2GWLjlwSJ/byr0L+Oejo7RzhyiRrd5oxM/YAr1aE2cfrecKEkgNXvmmBDyO7vH9zSFVaTS0Xo3N0zsh9+Zj7skxiY8Cvx+0Rk8uDF2BP0GH6v06AUrpvXiVPy3R7oQ/8byB+8uW+rJHPXq8EIuPwOW4ZLUHtinU+LZ2+UTUAenaLqy+lMGpxHXT51z2T6pbECeYcGm6RsU4wjFRcBcXKzT5i+2V2TE2AuqS9dZ7BCbHju9lxvI5f17Qp863wt5T2yOZQc2aUvts18C7P/3M+Wg4PZDyO2svoJJLhy3+WCvP2SS/xzdN952Kzsk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6OCjTyvdzPX0EU3EY/BixjntWzEslkxV2JB4JQdw6o=;
 b=RcNnJSt8D3XoB/MyiSNuc12HJMQv7Pa9bGn0xAgRv2xODvRu+FK0tOolQ7M85IkfBMl4i1srb7U814Lc+r5KdAt6KBAcIr5G+I88hm3VSktgts9BCPCKPsERJco7vYMJoZ1OBjinfpvG/Mc6OUKlFFvmCQi5mn1bYB+vfMmDy7M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <890ee988-34ff-38c4-3ffa-70abe00d3df8@amd.com>
Date: Mon, 10 Oct 2022 13:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [ImageBuilder v2] Add support for 64-bit addresses/sizes
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
References: <20221010072947.8300-1-michal.orzel@amd.com>
 <4fc23936-4bfd-635c-b3a2-554e280ce884@gmail.com>
 <f052cf3f-529c-2156-f058-2a320a4f1b02@amd.com>
 <81ac614e-ca88-5f14-bd76-eaa20c9270bc@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <81ac614e-ca88-5f14-bd76-eaa20c9270bc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|CY8PR12MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: ed26ab94-fb82-4f18-4db8-08daaab0fada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dBmMMhUhq6v3bZYyRj0Fl2NfXnUFUVuOzQ+bLGgcseGDA/6tbq8UFNj/SUTG39ihu5qPCgGQ/Qpown3Q8nxopZQhJ+lz3UURN+jAWlUNSj1k22aNhEW0OeQPG+wY2pMK9jYTUAVGHSrRT89QOyVCfvqHNYgUH1EDffjB2cBFvDol9UfN7K8mNXG1eNMfLP5nkkbIOd1Ic/FyDBd7Tg7KYea5g5ARnMJoLVfIDAj9oKLg0SB9we86plk0mYq2pojmRQRgV7F+rInWclkHyRa0YVgptPlLaHBce2PquaJaMUYOgU2LrMepennt7qLs+IangqUZgDaOsa6MLZcaJHRB87B97EiDWvvK6CVuvMkfNzchioykU/mLEfxF6yWKHH7tbr6ztPdSciZNYuOQwZ4Lk9IZAE5PjCVrEcYPT0xZ8pJv95H0tgb/ljBg6hvuj6bY5OVUX3TxAG26HQ/5GxpowA+jdAG1M5Okorp/OL1k04WFuKqvtovaO4iaYU2yuzxxMuIxSLBGOKk5chMdrSOQsJK+Lsf0YUshlIhy5myo/Fz9lGkKlQ36NLzDYI40A/MLNouAQDfzpW2y9PtY3v/vLLAjCk/BScNucuCqx0jE1sSh8v+ny9HoKz0+K9dRNbsenYDmO19Ph8C8TwEYMCrhiKWJ3epi2+6zy+hK3eKXrGDiZPs3nd2AllNWSwFqgJK8BJi0P3jEKdJrNQR2ClIIAG8qHAXlN6r6y1EmoKYErAg5is2d80KJ/gkwHlsJI1gr1UWQaPb8UerfEezt5SSNBuzNkkISH88iNdKWIS/pNvrR5m6besgNb/Bbu7Ql20Qtqpei55lYz2tJRmQ2oy37nA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(31686004)(110136005)(40480700001)(31696002)(82740400003)(86362001)(36756003)(81166007)(356005)(41300700001)(44832011)(70206006)(4326008)(2906002)(70586007)(8936002)(8676002)(40460700003)(186003)(83380400001)(47076005)(36860700001)(316002)(16576012)(2616005)(5660300002)(26005)(82310400005)(426003)(53546011)(336012)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 11:17:12.5454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed26ab94-fb82-4f18-4db8-08daaab0fada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7633



On 10/10/2022 12:48, Xenia Ragiadakou wrote:
> 
> 
> On 10/10/22 12:48, Michal Orzel wrote:
>> Hi Xenia,
>>
>> On 10/10/2022 10:52, Xenia Ragiadakou wrote:
>>>
>>>
>>> On 10/10/22 10:29, Michal Orzel wrote:
>>>
>>> Hi Michal
>>>
>>>> At the moment, ImageBuilder assumes that all addresses/sizes are
>>>> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
>>>> value for the first cell. Because of that, we cannot specify
>>>> MEMORY_START and MEMORY_END to be above 32-bits (e.g. to place the images
>>>> in the upper memory bank).
>>>>
>>>> Add support to properly handle 64-bit addresses/sizes:
>>>>    - add function split_into_halves to split the value passed as a first
>>>>      argument into upper and lower halves. These are then set as values for
>>>>      variables passed respetively as the second and third argument,
>>>
>>> s/respetively/respectively/
>> Ok.
>>
>>>
>>>>    - add function split_addr_size to split address and size and form a
>>>>      string to be passed to dt_set as data argument for reg property.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> Changes in v2:
>>>> - redesign a patch based on master-next instead of NXP dynamic assignment patch
>>>> ---
>>>>    scripts/uboot-script-gen | 33 ++++++++++++++++++++++++++++-----
>>>>    1 file changed, 28 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>>> index b24dca2b7f7e..09d237d192c1 100755
>>>> --- a/scripts/uboot-script-gen
>>>> +++ b/scripts/uboot-script-gen
>>>> @@ -22,6 +22,29 @@ function dt_mknode()
>>>>        fi
>>>>    }
>>>>
>>>> +# Usage:
>>>> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
>>>> +function split_into_halves()
>>>> +{
>>>> +    local value=$1
>>>> +    local upper=$2
>>>> +    local lower=$3
>>>> +
>>>> +    eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
>>>> +    eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
>>>> +}
>>>> +
>>>> +function split_addr_size()
>>>> +{
>>>> +    local addr=$1
>>>> +    local size=$2
>>>> +
>>>> +    split_into_halves $addr addr_upper addr_lower
>>>> +    split_into_halves $size size_upper size_lower
>>>> +
>>>
>>> Just a minor observation, the variables addr_upper, addr_lower,
>>> size_upper and size_lower can be declared local.
>>>
>> This function is to be called to perform substitution and as such
>> is always executed within a subshell so no need for local.
> 
> So split_addr_size() is supposed to be executed only in a subshell ...
> Ok I did not think of that. So neither addr or size need to be declared
> local.
Exactly, but in ImageBuilder we don't seem to use $1, $2, ... directly so
that is why I added local only for the arguments passed to this function.

> 
> --
> Xenia

~Michal


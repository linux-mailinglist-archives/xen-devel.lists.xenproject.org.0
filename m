Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AE675311
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 12:10:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481676.746739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpHK-0001dm-Ga; Fri, 20 Jan 2023 11:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481676.746739; Fri, 20 Jan 2023 11:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpHK-0001au-CX; Fri, 20 Jan 2023 11:09:50 +0000
Received: by outflank-mailman (input) for mailman id 481676;
 Fri, 20 Jan 2023 11:09:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FRq8=5R=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pIpHI-0001ao-9X
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 11:09:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ed1a88-98b2-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 12:09:46 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 11:09:42 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 11:09:42 +0000
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
X-Inumbo-ID: f1ed1a88-98b2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwuQrXNkmE4CJ2GAEsGioWle1pDtv6TrRXl72j6FeKn/yzCAn9tMdtdtFC09yh4y3gNg3ksW4M60UH8b8CL+Ss7JRBobsg9U4VIGvn9vRXZ0XBTQexDMzl3cqjcArz3HhffphkJSFxguiL9zTBj36zuzXbFlGDLGEwwW6BLuGrHfNt0gIF1purB0Qo+eJlmR+7yLQW7rdD6kUqWgsq4Vx+x/upXUrlJooedTBwq/AnhJCE8wTBQr3QO2dYluQo194Et/mo7Bm2NBgNrv805eHsNfNX0CYtlx80c3+miX8xy7fMCXmKeUhexmf89P3iPS74thV34kxbu1dTWb0NcqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+w0yBuaDtRV633ju1Z44HVaFVLVdguynPWv4SITV78=;
 b=Kvr68cdV8GhltZn1oGGMv/upccomkArBmejMhbI/thi3/4A3cBuSCLNlh2I4fQJkvX7rugZXeRzjO1Pfm/dAzgTSiah5D2KqHRMvbU2eKEHnfqvySAJ7VLZkxp9S7ByeZ/2sObZ4XXKqV4FiNODMUZtjqBR1cufrU4Xaav9VrdrziXEiGwfWEMHf/S7khvoyjnt3HmoX69KR9hKPFw+zCIUdMwMskI90A0h8G7nbQwDZOgEgC3n0Jd6I8QsQe6HLLG8s7B1mtuIBcVEBUK4zYChQ8PsTBH41HXLpNfbkahKNhVrb5EYwVRGPMKx7+2hfW9nXRj0yMUPJMY+XuEK2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+w0yBuaDtRV633ju1Z44HVaFVLVdguynPWv4SITV78=;
 b=APQ66dGMbhz2BCUfla4rtc/oK8DQ2nNTMmDL6WHXyR/TsglLrshCvjatOVCSC4ilHoU6ZEKAlYwLminl/EfhFbIiHe3nq5xx+BkZ4AjGALI4SSiMIvXYI4cJeykoA4FMNlGP38SzoDO8gY30JXVA1elaFo7pj+uV41hyR3aL+ZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e607a9da-0c2a-05c1-47a3-b4e4f11c874d@amd.com>
Date: Fri, 20 Jan 2023 11:09:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-3-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
 <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::23) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d52225-51f7-40e5-4a33-08dafad6d48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S1NNdMfDmzYrIdFYxKatoflkQbGKNFCRfaFuxDGOGpLA1GHCi7kcaIWZnJEOH0rdszt6bIcB4G5pyfgh9pvFNya5iB+DCxmgNXNxE2z3HEDGXq+lri8d74E6NOtG2BHGhovb3R/L8fL9XCXLUf9eh9N2vAVOrSHIHXLT/Mn4sXYow9eVvNWVieSfQTO8BMKsJPIhZfzlb9yDbI0qcnmGKnq1eSaW3iaLw7Ldp6TgmZ2aUYRcN40+L6aA7fzE7o54BsDjAaZW4vneVGzAsJ8e63NAHDwL9y4OSrXJjzUZPXq8aJ3XdzGWm0juwKo+DvQ3HuqbFdoay9B5USQulVkxO4QWaOrVeCJA82ECITe8U5j4iAknsvRsWbW+U/2rS2AFG9zN6JquO7Q3G1SQCATddE3qEptEnl6Nn64fM0hNoyY9rL8KkYsWzNqB4ainH5ZVgRerFoqmIc4wWGLye5dDvP527/USfS/GSr4EjZ5klaTAnE3vNsZW7Ygn4rlMbrGP74AQzcpidpmfXxMbWNO98CS8NGuBneWMypK4E1X3UCCAud0jCT2+po+wLKCwU/lqKV4UbqJDuPiSAOKzvaUSJPV5PqOQ3blOe7Ikg/O2CWZ7MFZYXYcoPQitgV1Yube4gnlYqmi8gb+XFMe7rc76J59hCNiayjiUh10q0MlTHGT1hw4AfToprBzQ7kwqviAmA+MyxD0nkoOuODf0dxHHlzMfbJJPKGO1A2AC4zj/LIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(53546011)(6636002)(6486002)(316002)(478600001)(41300700001)(31686004)(6512007)(38100700002)(31696002)(36756003)(4744005)(110136005)(8936002)(5660300002)(186003)(26005)(6666004)(2616005)(2906002)(6506007)(66476007)(66556008)(4326008)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckFCdm1qdTZVNG9WdUpzY2hLb0ZFaDJjUEhzSG1WSUk1MjQzT0F4R1Ywa0JW?=
 =?utf-8?B?NzdUc3ZNOEVyamd5MXptQVE2Y1hwVVdkcHBIb3FpN1FMckJuUC9wMkZ0U3VZ?=
 =?utf-8?B?VjVRY3hPOGFWaXF2ZE1TWEJRajg1bjBBd1ozQjIwVkFVclI1dHFpMHI2TDFT?=
 =?utf-8?B?YSsvbUhjdW1MdUFWM3dWdUt1T3hxd0dEUnRaU3oyWlVEajEyRXZSRkErMWNq?=
 =?utf-8?B?YXF5bU9MTEpMcEFWcGZMckd6NEZQNXMwd0FUNisxcjZEQ2xiYVhOVmN3cDhB?=
 =?utf-8?B?cm8zb2NYY3JWczNDMjlOTmd0b0FYenJJN09tcEF0RU13WlJjUUlFTStSZTJD?=
 =?utf-8?B?Y3piNUtPYytBWWd6NGpQNHRIeDNOU2czMURRT0ZobDRuZVU0MzlpNHZDVGc0?=
 =?utf-8?B?T1JoOFhhekVINEJDWms5aC80V3NBUTU2MjBaalc5eW1SeTdidGNZOHlmZExi?=
 =?utf-8?B?ay9hV3hSUXU0dlZSMVRlYnV5QlNqbWU4aE1OU0xRRTR6dUI4L2Y5NjkyR2Vy?=
 =?utf-8?B?RVE5Z3ZPMTdjVlpDSXhkMmZzM05jU1FEWTBpN1M2dUlLaWJsNXlhQ2krMnAx?=
 =?utf-8?B?K1JXQXYzZ2Nhb2VoUWJqV1Bma0V0ZU9xc1dPV01hQ0I3ekZhQThUWXMzSEVi?=
 =?utf-8?B?VTVSeFovYkhKTXNicHBYQUxGSERGMG8wRkFOTmZMazZqS0RFUFVkL1lkT3F5?=
 =?utf-8?B?TUl0ZG1yV3BwRXNLaFF1dk13bTBVR3R5S1ZvNHNhRHp5aU5hMGl5NjlyemhU?=
 =?utf-8?B?NjVDMTIzUjFMWDBJL0FoUjhnUmJiTVdWd0huUzhBYkx0aHhONXE2SUlkbThS?=
 =?utf-8?B?ekV6Z2NUS0I4R0g3NzRlVDdVRUg2cUo1OFhlZmFVcnRxOHVTbXcyek5ycW9q?=
 =?utf-8?B?Nk56VW9RSHlJR3VNb05kN1VpVnpuNVFKdnNyRWgzZXJWM09WRW9QK1VONktZ?=
 =?utf-8?B?dW5XNGJnMFAxcFJKWkhJbUphNDh2SUNZNkJkS3NDd2ZBY001K0R3QnY4S2RM?=
 =?utf-8?B?WklrRitzZGxWSk93Vk5OZ1JYT3ZDeXhTaFN4K3lxOVhwZnRZSk44QVQ4YTR4?=
 =?utf-8?B?ZFE1cjNmdklKaVhaM01CeEo0QlBUSms5ZjZzTy9uTWZabGtTZWt1OEh1b2xH?=
 =?utf-8?B?Ui9zL2YvTTdVTWpjaWlWYU1VdnYrZThzTWZEelNjbGVPRytrcWdJZ05WT04z?=
 =?utf-8?B?WlhmUFZhT3JkcFkvTExYc0Q1bERtTnV0Mk5tQVA3ajR6TGl3OXRKd1o1ZFV6?=
 =?utf-8?B?NERySjEzeEhiM21RVEtDeFgzMTJvcEpJSEh1eGFZZDlBRk1MZG52cFNMK3pU?=
 =?utf-8?B?VnRjQmUrOGwzZi9tKzA1NStDVG9UcnRhWmo3bnNhRmdFcVNhblhTWU45d1Vy?=
 =?utf-8?B?MGZ2SnNlZVA4VnJERm5QcEs1OXhCamo3TW01c2szbjIrRVUxbDFVWkdsUjIy?=
 =?utf-8?B?V0NnVjBXWG9RSWRQSDc0TVBhSU1EK3ExQ1BDQllDOFBmU3VUN2REdG52eXJM?=
 =?utf-8?B?cFI5NHg5eEtYSEh1ZGd0WWRZeUxXMkNoZWU0SkZzRUw4SGplUmtBKzNzV0kr?=
 =?utf-8?B?cXZyZXRXQlM5LzVqNTQrajVBRFZFcE01cWxWS3BkVXp5amY5N21zeTJmSkZE?=
 =?utf-8?B?NFVMVVJ2VGJrVzFwOU1pTEs2NHY5V0hwQ3JZbm52UDJON01NVDRlS2ZoRFBU?=
 =?utf-8?B?b1hFOHp1Qyt6dGdkUU9JS1YwN2h5YXZJS1RBWUdWZlVtY01UTk82U2VCVmdE?=
 =?utf-8?B?cnZvMGJYRnhjK08vejBBVGtQempJTW1QWC9ZS3lDdVJPVkFxMm1PN2ltT1Y5?=
 =?utf-8?B?bzVaQmU4dnZncUwzV1Nldm1ISnROKythRzFSb1hWZHE3cFNlRVVRU3hLd0pm?=
 =?utf-8?B?ZUFleTdJU3N5d3pZcWg5cmNZUlpJZGRtSUFXVUpGTEowaGZ2bFBndVNXaWty?=
 =?utf-8?B?bEo3WWI2MS9uNXJpaGdLeldaZDhmWjg3Vml0ZGFYL2JVNUZQUnBKbU11eG5S?=
 =?utf-8?B?NzRRaC9ESHBoRm0xMmt3cXVza2JmcHZSWm5wMWZ6c3ptc1NrSmU4WGZ4Q09i?=
 =?utf-8?B?S0hJaThzalBWU1F4ZS94MXpwYUliQ1JSeHRHbmlFaVBhMTR3TmNQMmdNWWs0?=
 =?utf-8?Q?rhJbBR0ZCckzDRBnxZZXfpqv1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d52225-51f7-40e5-4a33-08dafad6d48f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 11:09:42.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/kHO5Y5cClw9EtDd+Lj7RHAK4y8jTHkqcpvRSEUI+6qcWeq379tSODEOGWt9Znk3AIkAZpTMtrNiRn/urpHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274


On 20/01/2023 09:32, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 19/01/2023 22:54, Stefano Stabellini wrote:
>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
>>> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
>>> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
>>> address.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>
>
> I have committed the patch.

Thanks for the reviews and commit. :)

Did you miss "[XEN v2 01/11] xen/ns16550: Remove unneeded truncation 
check in the DT init code" ?

- Ayan

>
> Cheers,
>


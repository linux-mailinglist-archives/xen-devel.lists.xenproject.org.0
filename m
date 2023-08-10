Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B387778EE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 14:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582090.911666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU5FK-00011v-Ft; Thu, 10 Aug 2023 12:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582090.911666; Thu, 10 Aug 2023 12:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU5FK-0000zT-Cl; Thu, 10 Aug 2023 12:58:34 +0000
Received: by outflank-mailman (input) for mailman id 582090;
 Thu, 10 Aug 2023 12:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU5FI-0000zN-KD
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 12:58:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a0ba263-377d-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 14:58:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 12:58:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 12:58:27 +0000
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
X-Inumbo-ID: 9a0ba263-377d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+etWnIFRtdiz8/7iNY08G3owg7hIF9wtU/awVBz9veq0HlESYp4EfVxHqZm98f75F3QvacnNgIsu1v7lB3/Oz4x88tmjtJN3vfloxl5lVKa1zjggPHoqcaTpR3UUGHJX1xxhUysoPqKJDWOMb5W35DzEeSw5IES3Sa2ndLcwXj8849Cb6UlA0XXG2xu46140wZdkHYFn9G1vOB0/hNHVRF3hhNSdibBq5+qGAScxpaknmLRlqEdb/fJOBGQoqUelcltChhYge+8SCyjUb4xFi0Utxns3/jEA7Q0/UI17HdE8ppiT2yaSf0PbqUFjHSCHXtvsslMSo4m4IfmM0u7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/oikjZblIu2K5b55makPuKDvXK8KeamNCJisBLMO0A=;
 b=N6QNCHxQgnllVQWBAPK/gBG/KJpu7CLUT+1kVQXWEJRGmwR8x8N0o+ieGsnSiD4cdPi9LZ1droec4DYImXBmsR0g5Z1QLnNUiRCF8mYx7pjdu9gNYmidlSKAdUkpaMmrI0aJ8UsvrA5zBg8hVcJDG0K/RPgt4uOuwZyOOZkeg1zWI9UGOvEBgy08M0dCUWGDwVR10+DsxVxV6liN/md5hgOcsW2nHQwp2+4IMIc9J/uu/VSI3HqKSGeTFduiUmXO/E00kJuNMTmfRUCYhl4ahETNNadURsrSKNukzDNqGK7RXXa7fVdvpUgEZWw60bqsdkep+hczrpVUD+aIRb4RcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/oikjZblIu2K5b55makPuKDvXK8KeamNCJisBLMO0A=;
 b=FdYHOHf6bZfMU5lMxQpmc7PVR0YNH4Is//doum2fvUwluq2i1rrYkEZ0lunUHFkJI52krPBjQMQiIHTu+rIsYgkkI2L12i4hvMNVa8xNG4csW3HjtnyazQzDnc9Z92LCE55Az+/E2bSSk1GSbN3/xbn3HZKLh5LXXMoMskK9+oRjlBYyys6QhqitfN5g95ecChnSfiwk4q7D5BvSK9R5MDKsDRXfJgPsJgjVbDrxK8k58apO8aMcgiuW2kxcWZ3TPvCpPmdM6sDa1ArCTGff7aiAUhNzE/mxk2hqEOBDn2tkR16RiEuW1WKZvvNyhmE2wZJChPk5W/8zETn0lJxynw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf76f720-9273-617e-7187-0f1894120f04@suse.com>
Date: Thu, 10 Aug 2023 14:58:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Moving Dom0less to common, Was: [PATCH 0/5] Fine granular
 configuration
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2308091243280.2127516@ubuntu-linux-20-04-desktop>
 <d06d3304-1df0-e932-bc32-7a9939870487@suse.com>
 <18F9E2A1-1CBC-44D5-A321-D6DC72DD55F0@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18F9E2A1-1CBC-44D5-A321-D6DC72DD55F0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: e2718808-cad1-4de1-05a5-08db99a17d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iwWpPax6mInXGjmLXDrruDE8JQoy/3zJ5VOLZdUNvHqVcgpkBBXMZ9mRuL3Ok4aQ7wWnGDSwKRt2Z20qJkATd7gZe4vmDKnYPlonUJiaOn4fc3OsDX7/iOdoZ9AfYKGanRqC1NGqAYXjLxqztPrnpILjH9jhsof9ys4fJ67ItKID1OFYD6v0WIMaGLQDA3/vklv+nsiNwCnSpu+ljrkBQW+2jWmPMiOa0yFN21VW4U3Q8w+CvAj1TcBzj5LAV8KjuMm7aJLJRxn3rawjgX0jHPN1G8oDd4L5pIVwEeKm493D+G+J+k6RODC8Jd5PHaK6DtI/+BhfdJN5XN6pX2WPV4683dwPbJI5VZBio1PNxEIQ44b5zccLa1jm6tx98vHml9i1f1NkGHnD3ifDpvSr7nN9mbrdKMJHSJKBYp3AwsRkpVAWEHmflP2T2cnsp/QWjyTklcQJO3X7Xa8U58UVumjUbLaLuNXrrTTWglYuAPsq/GLF3JUCAEVreeZwOdPjg8QJ96rkmxGVhZ7vj30twwO1NXXlG8VXcTNlrxVMD1YJmcQpDDKHvjHsYg2Vo7m4lTms/MalEWcBv4IkYNRjVwkGbeByb9R8llaDTRaDfYV2XbbkWF0KCPsixlpR31qlHXpDSkw6b7cMTBraxljFh1rXsGQ0tYs2ktSxPYF5dlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(186006)(1800799006)(2906002)(38100700002)(54906003)(478600001)(86362001)(2616005)(31696002)(7416002)(5660300002)(6506007)(316002)(36756003)(6512007)(6486002)(8676002)(26005)(8936002)(41300700001)(31686004)(66476007)(66946007)(66556008)(4744005)(4326008)(6916009)(53546011)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmlkcUViQkthVE41c0MvN2V1YzhwZlh0SVZrUSs0R2h6M05FLzJqaFgyaHQ5?=
 =?utf-8?B?dlRXNk9VRDFYUVlYZm1rZ3VKb1JnSzNlQytxUnlEeFowaXJIMk1tc1YzTmVz?=
 =?utf-8?B?b1M1Y3drMXZWU2RPV2NuT2ZzeW5tY2FVMndZWE9oN2xuWFZDdzRFVFpTSzZo?=
 =?utf-8?B?cTcyYmg2SjBxWnhRczdXZTZPaGtVSkFSS0lFWVd3V0pvMUVIUE5iU1dkRk5m?=
 =?utf-8?B?TTFQM2lESzRUUDE1NW9Sc0JMa291bUNMb05rbGJmOHFydERSY3MrM1Z0b0lE?=
 =?utf-8?B?dEdhaU56eVVBRWxFZ2pUWjBKZnBwRmxMUk5YbVl6OXh1NSswbkh6L1RGY21x?=
 =?utf-8?B?WThSQjJYdW5abUZvV1h5a1h4eFpGZ0FQaGxtRXhydVFIVXo4WjdXamxMVktZ?=
 =?utf-8?B?bTQ3S09vUzhVNm92OE02OUtqKzNBVXF4Z0FyK2dHU2FYWWdPZnlLQW1FdENU?=
 =?utf-8?B?MmVmL0JhOC90YStlcWh0a1B1Q1A3UzgwUVdDVTVPV054K3FWQm9PS2tpYkx5?=
 =?utf-8?B?SGY3MXFweldLSDUreXkzR0lETWgydWRmblN3aWhaaDZIUWlXK0RMTEZkZlha?=
 =?utf-8?B?c2VUU0ptL1p2TWFMT1VxZU9reExMSExFOWJmZHZLdkV6VGdCOXg2bm5lNkVZ?=
 =?utf-8?B?SlpVUllrRXR1MlVLZjVNdlNXWGlzSUw0L0NGU2ljb2hlYVNwNDJqOHVmMU54?=
 =?utf-8?B?V0lNRVBQUDI1cmU5ajA2VVlaZUZmeGl6di9yVDlScFJMQXI0VVl2QTZwa0Vm?=
 =?utf-8?B?QzZGbjdMTmdRMS9jSDBrVmx3VXdNTmg1WlpEUTkzeEZQV0RRa2ZLSThMeFdU?=
 =?utf-8?B?eUtmcDBaUjJRUTNmelo4Sk9oMldYd0J1ckIzZCt5ejFuMnJqSjBWSk40UjNG?=
 =?utf-8?B?UmJtUWd0VzZudmY3STA0QjhGeGR4cFhibllYajV4bTFBZEJzQk9MbGpyMWEy?=
 =?utf-8?B?MWVuZlJURGhFY3NlSEZKTTNkZUd6cnVsUjBGbmZ2L0VET08wbWs1a3ZKNkhF?=
 =?utf-8?B?UmVMclRqWXZJZHEzTmZJd014TWRxUnloYndLdUhEWVUwdnB5OGl0b25Jc2RM?=
 =?utf-8?B?VjBuSFpZSHp1YUs4bmt6ekVGd1h6UjRjcUJHWVZscjBZNTZGT0pBY2dZN2lt?=
 =?utf-8?B?VTFRbkxncTlBNjcrZUZIRDh5bC83MlNFU3I5Z0E2TVBsTW9IdVZVNWxKWmxY?=
 =?utf-8?B?azNlLzNEMWE5WVR2T1FXM2N1K0JCTUs1S2RsVThvOEc3MFhoR0ZqNjZkM3c2?=
 =?utf-8?B?Zkc4bVJIWkwzTjB4UXBCTW54bGtacFpZL1JBbkMrK0dNeEtWa2dtS2tTbG4x?=
 =?utf-8?B?eFlnNFRIRmVsODZ6YjJMWlV6a3JiamxZR3FqYWR3MGtkOTZtZnNhZ0hxUkdh?=
 =?utf-8?B?Sy9XWnRBUFp0Z1pTZ2ZhZGZQeU54QlFlaFZjdzVHcjB6WGFCMkFvVDB4Wkxl?=
 =?utf-8?B?UWhxbk9vK0czL1hmWUtBakREUzI3OWVCYjBUYS9nMHN0RTN0Q3V1OHVVaVdV?=
 =?utf-8?B?Ym5ZMVEwYlNCSkpPNzJZNlYxQUNLc3VIKys2SHlPS0U3ano0OEZDWC9ORnFC?=
 =?utf-8?B?bU9zM0JlSlVFWVVxSUUzNXNPWlcyT1l0U2FUTXdMWUhJNzBENlRkUVYya1dP?=
 =?utf-8?B?OFQ2M3NIVUdqUzgrSzNBM2c0SjBYRGRwTkM3aVZLeVdPcGlvNDFtODdKRHVl?=
 =?utf-8?B?OXZ4aHJFY0JiVmFXWmdZNDZpZXBCdDNFcFdvWU4xVENSeWJEU3JMMGtSZ09W?=
 =?utf-8?B?Vm5scEx3MDU4NkdDeUVVRStTNVpRWHBHdG0zbjYzT1YzclNTeEJVQS9iZTB0?=
 =?utf-8?B?c0Q5Yys0MEpYcUIvcTNabDBPOGNDbnRXK2NRaEJHL3I1QU53ZEM4QnhDY1px?=
 =?utf-8?B?RG1XNGs1cE41M2dSNlZtbCtQb2FKcEdoOWI2aWU2M3hVYWptNzYxV2JnaXJN?=
 =?utf-8?B?ekx4NEpLdkhmeVZRcXF1NkxlZHczUUl4cTRxWmZxMzUwQVlLV1EybjlPN2hC?=
 =?utf-8?B?OGNMb01PcEJWSGppRmtwVXVjVys4NFlnNnNPZ3dBZ1IwbTB3d1kvN2djUkov?=
 =?utf-8?B?RGdyR1pLVEprdk1ic2xqNE5aVEZuVWpjMHZTcXNSSlhLaVZ5cDhtclJaVEJo?=
 =?utf-8?Q?KRfEbCOZpekjzeUUaFHpDoyW8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2718808-cad1-4de1-05a5-08db99a17d5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 12:58:27.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akiDAI69M9Oiu4md3BzChhPc5xA5hTxUqIlwWC1el63vu09YrLuL7YB0lMnhmwrHz9xPptx37ECrss6FeiyVwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6795

On 10.08.2023 12:43, Luca Fancellu wrote:
>> On 10 Aug 2023, at 10:07, Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.08.2023 21:51, Stefano Stabellini wrote:
>>> Would the x86 maintainers be OK with it too? Of course further changes
>>> will be needed to make it useable on x86, but looking at the series from
>>> Christopher, the two sets of internal interfaces (dom0less/ARM and
>>> hyperlaunch/x86) are very much aligned and similar already.
>>
>> Moving common code to common/ is surely okay with me. How much wants
>> moving is (apparently) a different question.
> 
> Would x86 maintainers (and who is taking care of common/) be ok for the dom0less
> code to be part of common/ but in this first stage be protected by a dependency on the
> Kconfig ARM?

It's actually more than just being okay with this: I wouldn't be okay with
there not being such a guard, as then x86 binaries would carry dead code.

Jan


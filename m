Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D8665E89
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475579.737312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcXA-00022k-KM; Wed, 11 Jan 2023 14:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475579.737312; Wed, 11 Jan 2023 14:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcXA-00020E-GZ; Wed, 11 Jan 2023 14:56:56 +0000
Received: by outflank-mailman (input) for mailman id 475579;
 Wed, 11 Jan 2023 14:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFcX8-000208-He
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:56:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e9f0f66-91c0-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 15:56:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7287.eurprd04.prod.outlook.com (2603:10a6:10:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 11 Jan
 2023 14:56:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 14:56:50 +0000
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
X-Inumbo-ID: 2e9f0f66-91c0-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwImrKxBV4L4GUQEHnRMZF9ZiCosZxqBh6Nna+h/Vk4Q3k4JkK1ZVx163IP3U8KyL8NW13+VrR0Ja5sWo5KMM6USFDTvMvY+tao2YHlf6cPUAt5v2u0GOKHjRt5kHnNLPCix7d6LICA2lRT2AI3QavD6e8/BgzZwD1fvQ5ZaYfJQ0YX1qAJejlzw+YR4fwucwjIRlJmUl21ksL8r8UFrO/GVp50mUOSJ/T3GfdG2NuMKYbvL1hl+VMiZ3Me0b8Xa6s3R6DS/xSoHphg8/GxwMNgnK0hQBGqiHvuGjT3xrrYX9lDjiHHi8YwXZ8kQuRd+XYQ11VCAL3c3nMGnP0bb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1Veq8igell7UWHBBB9V20mEnZ/tb+NsSpwXNKHkiXY=;
 b=k7yrtwndHUoR4FLy6bwnSuLtFH6SI/lY3xY+Xkym0+UZ6aZyazL00i57ESrU0QfoOJME9YvJqyqeoYU2Ax6+fwF5fnmxaej+Wb4ECHP0qhYpJP/LobHklwZR6eYd2htLUV1j9YYw40GIzxiGAUCu/3tjC0cclvMgnSdo6JKuLGzlzsneP851JulRRHAYQExA22EOQfK6BPE36wH7sWxO6MjkUvwQYqZBaB9rpolzyXAj70TtJIip84xpbMJiHT1sqD1T1y098HHxetZRT6peAyWMn5H2vY1xUEufOqtjuv56LjkVRvwd4EvKIWzPksX5VbJtOdDB+6GBX+R3/GTXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1Veq8igell7UWHBBB9V20mEnZ/tb+NsSpwXNKHkiXY=;
 b=g+z/g7T8aQV8Q8dXwlhOzeikYXtNAH0a7EgtcQ8vUNxkDTspmRaaszNw6Pc1RCQk7uiQxuYzsqiakEERKag5Pac6uImrUExBZq6rzp5ny1caN7YORCijw3sly5qnPwSPLdAdjIWDxiicTIiqqznCEs1CG9/6QB/WZld/7wD/t245KRHNZhPvPuNv0SgbL0wv0mxmUnJLFkKz6P1cNmSFBPmw2Bunf7HZM8MAygGIVyf0M3WCACyqJtziO2JMRoi4SiC9f9U9NhrcJWbIb/R6LT6e/R5Dtu78kE4TTzZk0iBfy/RxB5sLrlw9iOwk2MLEaA6q5n1A9v4+KhbMjyH+qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24b26a73-1e45-d556-c286-1e9d56bd4c29@suse.com>
Date: Wed, 11 Jan 2023 15:56:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/8] x86/iommu: introduce AMD-Vi and Intel VT-d Kconfig
 options
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: dc913a10-735f-404f-ff42-08daf3e41213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mWzt0hUqnnnG+vQi21fVAV8WOY1LJte2JounzOTuZTQR2CRoyYCWZM7pRgGAuepgzW6bm0JynyWp1N+U1A+vmuyr0tjTh7j0RIix+A6aL/cdWrosJB8Urqj4VfCM/5gvGdDf3ID7AqPvq0Fg1R7mbzh0NbL2uF7LmO7sERh6AMP6LWInEmLOIvQnqCGGF/zW8ljLejiPQFiOGZ1J5kguJYf6I6tjRezPM3sfNrMha9eEHagZ/yh6hzcewLL6SN6dR4voGxJUt+6rUBbyiXDhNEv1tXf4UQAIIZIcCIEX5WoE+lBoCMGCEFM67kfrRTXhrnVRKqMli4HU1BJ3FV9eXObdZyOXPeKJoDXQLp96A4qZU5lTh9cO9gZSFkZgb52N0thI7qBHB1YRrv6+4l3ZEfBy8GowRv+raOvXVAQ3iuBeFtA985D1SQwUXwABNANFlEifx2C8Hsu+MPhzlCVnUWnzO2cuoG+i53aRjANA/7dWTBHBhhw94h9kEpYdNeF2BKF2Pg941Dye7CrUz0y75IptnbHAxI223XOZfqQhJyiFwPgukOP4MUiurP9dmGceK1zwqPzlmKkM3HOIm/PhC6D4TCr2IOlLycBu3l57RK0g9py0H58JE7EbXZFeQiPwIq0ZPDJp11SArOLh9oCrXqXe0cvtHRdufolqNfEIsNenG5WlP2AknU0zRnT8qbbpN+Z1M47QyImAI/nQA6qTs4Bzh3raMo9UnluRCTcGFPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(66556008)(8676002)(66476007)(38100700002)(66946007)(6916009)(4326008)(86362001)(6512007)(31696002)(26005)(186003)(2616005)(316002)(478600001)(6486002)(54906003)(36756003)(31686004)(5660300002)(2906002)(41300700001)(8936002)(6506007)(4744005)(53546011)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCtyRWdPMXBxQTlUN0VzMUdaeVZ4SnpJRFpFYjNOdFBoeEZXTGNKQlk0WDMw?=
 =?utf-8?B?c1paUWE0TFNxM0lYTERYUm0vSW1tL25xRUpNUnIydU1qUzR0ZGtWaitKZmdB?=
 =?utf-8?B?VmllbkxpaXJrTHRDS2RBazFKUWtER2lJMU1KOTBUWDNkM01KcGZESmRKTWhR?=
 =?utf-8?B?TXFJcW56cTZmRkpJV3pETEtuZlFpRUg1d1FWNklYUGlHSTBqVGgyYVlYR2xS?=
 =?utf-8?B?dm1CVnloYk9BZStpWGx1K01yR3ZvRDBjWUFkNUxncC9jZ0F3djdOT0pYTHF4?=
 =?utf-8?B?SFhGZnFBNVM1c3k5L3R2czM2aktENk1FMU5hRUpvYmlNdDhaWHhyOC9ZOVBi?=
 =?utf-8?B?RWpCYTZBVE9tOFJqS0N5OFlOK3NhMHdvQzlRNFc0SWhYV0dpVUNUWm5DT3ZQ?=
 =?utf-8?B?akpJeUdSN2hPUysyVHpNNUF6bVFCVWtrSU5GL2tTZ2EyVXlwNTI4eGt6b2Rh?=
 =?utf-8?B?anMvVXI0ZWkxZ29taTJJK2g3dmZwNUthVVRlckZYU3JxK2I1akZVZExycW50?=
 =?utf-8?B?eWVCNUxzUm9XTlhnd1NhWmx3NXlDdktZR255dURJZGFBL3Z4RDh4SVRkN2Jv?=
 =?utf-8?B?SzVESGVJOTF1S1ZobzRacFh4NDkvSUNIN29VekNENk5xV0ovTURLRjQvckp4?=
 =?utf-8?B?eHkxNGNEbno5TTNGclhNRTdNc2pIcE9hcWVUUDYrSTZMMmw4akxodkxUY2hG?=
 =?utf-8?B?OW9Zc3Nna3VIR2o2Tkt3K0FLbnkwM1pjR1pNTlhNTDJuZ0NWWWNsMk40NjhO?=
 =?utf-8?B?NnVwWTY3UlAyNTl4eC96a0pxcmpELytWeXdUbHZwMkNUeFVIMHkybmdkem9K?=
 =?utf-8?B?WDlnU1VyNmZDQ2NkUzlqMGppcDJOOHZBMUtnN3dmSXBiZXJvMmlBMmN1VEZa?=
 =?utf-8?B?UmhmS2UrMGlDb1VBRlQ4RzNlbDJVbytEb0o4VWFaUHk1dTlVcGJOd214WUtL?=
 =?utf-8?B?cWIvSjg4NURGaGRadEZSd2dVNlBTYm41a1hQWmZrVTRkUGgxdkgzOExyMUNS?=
 =?utf-8?B?TWxOYlhoSmlaZFc0UVJySWVMMzlzbjVRZ285RElIbUVWdHVDR2tzaDZHSzBE?=
 =?utf-8?B?YXIybGlTUkRVSmZiNDhPOGRqWVZEZ25QVVFpbnlXTkJ3VVZPcVJxMjYvbFB6?=
 =?utf-8?B?MXJuSVMrdzVnUEdwOHBZQWdxTFF0YlBEVmQreVh1d3NRZVlUUm5tNTIzODFw?=
 =?utf-8?B?d1cyNFFvYWpURUl1Tkw5VUJWell1SUpGU2JXeDVHVldWRmdyZ2llbzg5eGwr?=
 =?utf-8?B?NDh0bUVoblZKNmNyWkdyQ011RXZNM2U3eHpBc2RRclJsZHB5alk5UVI1bUh0?=
 =?utf-8?B?V05YZnp2aE5qM0pjejlKVnhtU01tM1QvUUtkbkNZUER2MytrNWNWNWgxZlJE?=
 =?utf-8?B?L3pyMGIyeDBrOXR4U1k1OXlwcm4wWU5NSlNwTnRVQTNsRXh3Z1dKbVBjQWdI?=
 =?utf-8?B?VHVaZ09Ic2poMVJjYTd5dnozeGlSVTVZZkJzQSt5cUgyZUl3cWlMbWhXSHA4?=
 =?utf-8?B?VWlhOEpRM293bXo0OGIzR2tBZUlLcTRHRTlVWmVUanRGaERhVzFzclNOMTZk?=
 =?utf-8?B?N0VuU3hFV1BUR3BXY0FYaCtWaDdiTk03cXNPL0lYMnZhZjlNQzFoak1QTUQ2?=
 =?utf-8?B?VGEvK1hibUVmMkdTK2FFdEhIUUlWVlRTeHphcmg3Y3A3YTA2ZjFURjFzNzFR?=
 =?utf-8?B?aVJyaWxuaERhLzRycjlCL25wOGhEaytuQTNnaVhvL0FTWThVY1lTRms0c3hL?=
 =?utf-8?B?UXRUejFNcVFYTHBGemY1MTBRWUJieXFXTVBRWTRXRVBIb2MveVdUNkEydGk2?=
 =?utf-8?B?dUNLOVRSMUtsVGtiSTJIaHRsa2doRVRZODVZOHJ1a0VJbkRaTW9UZUNDdkNo?=
 =?utf-8?B?OE9paUZNc0xFQzd6MDBaR0d2L0pHZXlDMVZ3cm5mL2NmaHRkK3FFaEgwUjdW?=
 =?utf-8?B?YUlVb3A0OGR0QjFUaFcwYjRzV2FYNkFmSXNZSGpVYlhjT29UUnhRVkpzU3Bp?=
 =?utf-8?B?WnJpR3RhU09SaU1LUVlYZW1VTnV1N1dSTjZ2K1lPUlNmTVNlNFR1Z01iWEp4?=
 =?utf-8?B?QXZNUzVuTkZ5cXlXM2REcGhvRDJNNUxhMWZDRktWM1VpS1ZpaTdFVHZhU21j?=
 =?utf-8?Q?pKPzbrXHBQ0XefeA3gGItJQqK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc913a10-735f-404f-ff42-08daf3e41213
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:56:50.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4ay7bEiKAmBp4Wu0x0Z0G+swd4Rf4UU0DIiZrKV/YE4RjevnDkYCQSx9IZD5gn0517lTaTHEW94m9teK8CXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7287

On 04.01.2023 09:44, Xenia Ragiadakou wrote:
> Introduce two new Kconfig options, AMD_IOMMU and INTEL_IOMMU, to allow code
> specific to each IOMMU technology to be separated and, when not required,
> stripped. AMD_IOMMU will be used to enable IOMMU support for platforms that
> implement the AMD I/O Virtualization Technology. INTEL_IOMMU will be used to
> enable IOMMU support for platforms that implement the Intel Virtualization
> Technology for Directed I/O.
> 
> Since, at this point, disabling any of them would cause Xen to not compile,
> the options are not visible to the user and are enabled by default if X86.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




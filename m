Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14FB625B1E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 14:25:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442528.696763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otU1l-0005NX-Eq; Fri, 11 Nov 2022 13:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442528.696763; Fri, 11 Nov 2022 13:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otU1l-0005Kb-C1; Fri, 11 Nov 2022 13:25:01 +0000
Received: by outflank-mailman (input) for mailman id 442528;
 Fri, 11 Nov 2022 13:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q9GK=3L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1otU1k-0005KV-BQ
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 13:25:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d595eff-61c4-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 14:24:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8711.eurprd04.prod.outlook.com (2603:10a6:10:2de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 11 Nov
 2022 13:24:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 13:24:57 +0000
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
X-Inumbo-ID: 3d595eff-61c4-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3kk2oo+vNJsFt/veyYzS/3Zv1KavYTjHVBeM72eiG43mExVKuTBfxoQuoS4DDpu1IDlcjorSCL+G7/CXjt8jmIifc+6kezVe9+RvYkSoCyxe2FohoTN90G61iudQUg2YQRTeLFjyIwdiXE5WCckgLzg6O+ePTL/wkypPg0okSSPcQ5rnSwK3Oo+Ta0R1aYWizqnU07ejdgrzFWkVYkscpImcQhX+Qicj+EIgTpAgbiIhXu/RlkNz5jNsWSs81LbB4gvAAYEhWwAvCjrNkGNOVhLpLxcjLw+b8nVp0Z2snPzlAwPV6J8Ow/Y3z6eKQPkGhPZEglXybig2rOzEQpflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGKe9HZwjhkuwHoS3sQ1ZbGRV9Am9GDl/MNAwMSTwYU=;
 b=cfC/3BdDZJWS+0x2IgnEzoOMBDbrrjc+ghdl+IBIgJlt/fKP/YNu+C6Fwh2LTGpArslFObaJzoTe0EbThPKAAegeurSRwc1Nu+8CIdCE2iMOg4IdObxYtxOLPQdXdtic3TlbckYyx3jUEPPMZ3mOHcPBEefM1uldZDGr9eEMlYVR7dnmH69Bnq2PhvFrIYmiafxuu1+1z0Fb34BjxIxmTGSPxZ3+rzqXWfvSB3MksEymwC32mivqCWENM6UxK1N/Mqf5k5577yPt8a3OzcoSj+gFzgOPwhwaWrHFPitD47z1x9MQ3ORiRhfSvxn+T0TFndXm74hGg/NYBwSISpQGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGKe9HZwjhkuwHoS3sQ1ZbGRV9Am9GDl/MNAwMSTwYU=;
 b=rJZBLX161kPf9ZO0akaC3xyaOlgkIaT+/h7I8qW0x1PatkL2e5x2Q/3RDIHQmJbJdocb8SXj0+aThjG58DiMEXv1WfUjzsKrv0kk++5E1Jda24o7W/WTMGdU9DwfwRsxFdwu9ZJmOo6+WbchCc5tF18dHalK7phB8UIhW1K61eYBTarc1dT5unqYHQaA/cGM4j+O2zyS/hQvFGOLycWCyq4gKhX7ph8ov4VUXeqbsiQObrhpnNOF2l8E0lpjI8sTt3t5aOAi99m0KIFj9/BLsA7VOsNien/A3f0zFPF5vnZ5/qIBRSrZG1PuCkJ46njj3VKS+qeBoW/9x90SnhAKAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4482952f-86a9-d232-6cf5-afa6523012dc@suse.com>
Date: Fri, 11 Nov 2022 14:24:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-3-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221111112208.451449-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: eaec810d-797c-422c-683e-08dac3e820c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1S4xbyMVYf0C/HguHK93ryMMWbjI+yJvDCfhv/OOz9FbxoPI3V7t6RtShE2mPmuM3nYlDJV4wvfICHJOJaY9caouYqzAsmFwLB53iUsdZNbfTDGyONryf7U8o4hRK5VEcJnMVevhKvhlirzVPHF08Z9dezwPqX6DTQJmMNQ+JFrP2ZJ0UCd/FBbMuF43uT6n9Wy0hmHUI6GRHCVuBtQP7NJUJ+5ZhgpEJPPjEJHPms+ZQmxuPWDEEXu2efUlQBsODAajC9Nr50yna7cq4C30rKDekKFuobr3kW0Xb0wJfYJuNf5vGiMHYw4waMjzH+gHBrZ8h9hT6TkJzicvoXpvZW8drRZMV3PIevTadjgWpFESh1QtviqUyrzoFRwhA+9xfMIK5furyfGp0Hi+P3AdVMlP3T8RCYBQ7HKhs+egymkVT9Tqb5M9QyaNOzYgZB9pHKzQUCt+GRkbdRq8UozwRPw3CLCsXtod0kddx7sdQUT5aMMZtlRbk863fwu14WuioZQNqDUkDb7nNCG5gJiAwTE/PE7L3I1t26/AsegK9EXKcVtZoGv4uySuGXL/1SKvcNaPOhrLJTYT83MZ+PBSKF1DCT/uPE+Y4rNyKlrQ+E7LHAio6ja2tel87AK84sl4L26zIiRarFnXj3x/cNro1ixNwixP3f2DbVa/ov9ZZzQqrd1AtlPlejthE6altUTjuF+p5YjzbHsD/aCUqE9JM/UT2J7ekAHuF/vgaZH77SWWHPis0ea2Xu+b8UVkzTLQVt/poyD1jVj4Mw9dumKP17rcQPCLoSInV1HXKyu3x/6ahWe1/vjzJkYd9R6HjrZQmHI/JnN21n47nOGtQxqkb1gM5y/PvmKJKfbYCnANnpvhE0cR3I1F0QOIPLhTrQsK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(53546011)(6512007)(186003)(6506007)(6486002)(36756003)(31686004)(4744005)(2906002)(2616005)(478600001)(26005)(83380400001)(38100700002)(316002)(86362001)(5660300002)(4326008)(41300700001)(8936002)(31696002)(66556008)(6916009)(66946007)(66476007)(8676002)(59356011)(219803003)(207903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWlTLy9OekRacVNGME9SZ25rVTlSZW9EZWFMS2p0QnYvdTFvM2dKY0c5ekJO?=
 =?utf-8?B?WGgwb0xlaDV4UkZpYy9OMEsrZFNsY1N5OXRFTXJEYmgrb0NCdDFwZzR0ZUlY?=
 =?utf-8?B?Rk1mQTJqZXB0UEUvNmtKR0RsNzJHMSs0QzRHU0xnU1VpUWJxN0I3VW0zK215?=
 =?utf-8?B?Szh0UTRUTzdjOStsY1ducERDT1hmVmtlN0Z6U3c1aDAvRENLLzQvZ2NRbnIw?=
 =?utf-8?B?QjZhaVNNSFdiYkxoZ0kxejliYUIweXBGMkNkWCtzejBWVlZkd05jYzVmTExr?=
 =?utf-8?B?aCtZemxNVnRoTXpibUtGd2FtUGZqenh5TE01Rm1mbFBPOGxvb3NPbmwzZlVo?=
 =?utf-8?B?ZVpUaFFPSVpXNW9DR21kZHRYMWxHbjhyblVVanFpQ0RJdVFiNG9GNUlMaDlk?=
 =?utf-8?B?ZlNtNk9tUGs0RXZWS3dFMlpCWVNaSWhUeGNzZFl5WEY4TjdYZjNBMHV2QU9M?=
 =?utf-8?B?ck5UOHQ2WmtmM0lWcktzQzRYN2FwNFVtTXR3RjJHQ2FEcVUvNWUwcnM1SDZw?=
 =?utf-8?B?VHkrUzkxVTRDNVlndG1hRVpHbExwU3VHNGE3cXYzUU9pdDRlN0tYK2xoQk12?=
 =?utf-8?B?Q1JlUVpYN1RpS0hMWnRqSUhzNjcyTHYwS0NBaVdybjd6cklFUGhxTVdTNHN0?=
 =?utf-8?B?TlJSUnFrU0ZaUHJRd3FlVzg2Z2NNSXl5a2dMQTZJcWQzd3lHRWRrbkhoTGV6?=
 =?utf-8?B?VE5DbnRVM1lHdWdFSUVYWE1TcWtlenM1Y3lobU9SUG43N1NQVnFQREJtaWtz?=
 =?utf-8?B?aVlLeW51R0FKcGJZcE1YQWNsVHBERzZTdS95ODJiZ1d6RGJMYlZTVDdWOUdk?=
 =?utf-8?B?cFRLQWhaNjFnYnRVemtvOHBSNzhHWml5dnJzeENkRmVjNU0yTW5Ib1RUSjYz?=
 =?utf-8?B?Y3pGaDcwTkFYNTU1bGplODhwVm5EZjRPU0hZRWJRSVQ4alZCZUQwQVdxOUxv?=
 =?utf-8?B?QkhGaXM2UEJnWEUrUStSTDZBRjBtVTd3NWg4N0F0UHZNRS9GcGt6Y3Fob3dC?=
 =?utf-8?B?SFZqdkpRcTR2OTg4NHZJM2M0SEdNSHJxanR2WDBMZ2tYRTR4azR6RFB2bWpH?=
 =?utf-8?B?QTkveFRDRGtBalRmK0dWRnh6UVcwSXByZFIxbzFUZWtPOHk0LzJtV3lRSjVE?=
 =?utf-8?B?VC9XSjAxUW1lM3o5RjFIZXNRUVp6Z0RkZXU2cU9QN3hXZ05zUGFWcWYzM1di?=
 =?utf-8?B?Tm5SaTVXdjRjb2lkeEdWSWFUcXJGNStndDJvSWlLNWFZVkF2N0hURTZrR3do?=
 =?utf-8?B?VUttUW50ZHk1MnhkYjBFaW5NTG9XbEpBb2t2NVFFbGk4cGtuczVRUDJ1Yk1K?=
 =?utf-8?B?Nk4zUHpMOGY3bXRvOWJlNXl2R2EzU1RGTE9iYWh1eFVWTm5jQ3o2NDJOQWpL?=
 =?utf-8?B?SElzNFliZ3RmR3RzeEhSVEkyeFR3azFLR0hlNTdzNlhLVWV6R2VZcWo0Q1I4?=
 =?utf-8?B?ODBMMzVrTnc0RUQxdGgxNnZnRXVJRU1ONmdDdmxEK2lSOGJza0tXVisvTDZ5?=
 =?utf-8?B?bmQyaGl6ZElYOTZVNkdLbkZKTHcwbXQ3eDhsd2pMNGxja1BRZXIzU0F1L1Bp?=
 =?utf-8?B?c0plcU5hMTRWU1k0cDVWRGNUUmx6c1E2V20rVVE5bWpqRGVHM2dVSXZ6SDlt?=
 =?utf-8?B?NWR1NVVLZVVNOUpoSVRMZ1EwbzZYVyt5OVRibzU0K21kQjRIY1F5WHd6ZWlm?=
 =?utf-8?B?dEREMlNkZFJtY0ZvYzU4cmUyVlJXdHNQU2g3RjVoaStCdkwvQmtGTTBIQUlr?=
 =?utf-8?B?cHRzMGxsYXM0ZkRZdTlJWFFwUFdramNNYUh1dFVidXFSZFJXSDBpWFd6SFVj?=
 =?utf-8?B?dGJTQjlIQVNtNlJnSFMraGVFeUgzYWFyNVJpMjBIdzhvZkRSM2pkcmN4NE9T?=
 =?utf-8?B?ZE1zbUpvWm85eVk0ZExTWGhkb2VKUEVqdmRkZ0p0QTRyTzZyK1p5YTBvcHN1?=
 =?utf-8?B?K3BuODV0NkpvVWMwRTV6WmozZktvQll5ZkJzdTBMeGQzQnU0YzZvNnRadnEy?=
 =?utf-8?B?bnpYb043WWREZlZnRnZWODJuWUtnNkRobXhRUDdkTTVCTkRSTDQzc3Z1ZXp1?=
 =?utf-8?B?V055RkpJNmhub2lBa0JmT2tvdDcvcTRLWUMrNXdlamI5RGx5YUswbVFvR2th?=
 =?utf-8?Q?mkOv3tEdMBwW7DN1gWlWF/yE0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaec810d-797c-422c-683e-08dac3e820c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 13:24:57.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJAYPa+gvgM4d0pMBwLsgOgPLOqW87/qQhkotxvJ7Ade9iUxLEkXDemAWhLDvAU8s0sWKSCT2MluuiQHcEhBZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8711

(reducing the Cc list to just xen-devel@)

On 11.11.2022 12:22, Henry Wang wrote:
>  ### Added / support upgraded
> + - Out-of-tree builds for the hypervisor now supported.
> + - The project has officially adopted 4 directives and 24 rules of MISRA-C,
> +   added MISRA-C checker build integration, and defined how to document
> +   deviations.
>   - IOMMU superpage support on x86, affecting PV guests as well as HVM/PVH ones
>     when they don't share page tables with the CPU (HAP / EPT / NPT).
> - - Support VIRT_SSBD feature for HVM guests on AMD.
> + - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL feature for
> +   SVM guests.
> + - Improved TSC, CPU frequency calibration and APIC on x86.

Maybe better "Improved TSC, CPU, and APIC clock frequency calibration on x86"?

> + - Improved support for CET Indirect Branch Tracking on x86.
> + - Improved mwait-idle support for SPR and ADL on x86.

SPR and ADL support is new in the driver, not improved.

Jan


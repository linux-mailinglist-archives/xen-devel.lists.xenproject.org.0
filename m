Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72676F5264
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528990.822851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7LV-00055v-QY; Wed, 03 May 2023 07:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528990.822851; Wed, 03 May 2023 07:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7LV-00052m-NN; Wed, 03 May 2023 07:56:17 +0000
Received: by outflank-mailman (input) for mailman id 528990;
 Wed, 03 May 2023 07:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu7LU-00052f-8G
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:56:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa990d2f-e987-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 09:56:15 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8162.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 07:56:13 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:56:13 +0000
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
X-Inumbo-ID: fa990d2f-e987-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiJ0wOBbjB0Qz7Au7ACpQDJLnP+cjf2b8roK6Gs4RbM1l+/nWn5veVz1WK0g4Ie5ka5kfSr0MFyITsTNsdU2c5Ucv2Fi8EEslpVhOQ+F/GkkTM2lJDJoR0j09RWxleMT7VAg5xkeuiLAiHCbMPZf9XeYpnW9dkARqj1T4wffTXofcEulugILt/J5vf3OQQsjTyI/V7wzHcSLITM5ehsbLSGYVt8fzE21fIYWwLn9cZmlH1nZW5OfLBF85gL8LdLAGO4E4pHQB5nYt/8LcVE6QkHCJ0N2cJ96jp1/q/rqNGUSlM2sEGpaHzcTTND8cqWBWRqJZg9uBKJceLoxFxAZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1x8YyTWyQBNdIxAs9f3haq8niI/qNnULSndmW7mmjQ=;
 b=epASxsusJnEMjGQas782OyL9/0RPLQ9GlFWOlkPyLznnwq3laM+xeuyvGEK0PUrsjfev/Cl+/vGnFSgn4AZKC5ESKeUfcKFP82tvlMGP4EuF4Nb90Zij6Fug1kE0f/tdjwvAsbNoOLoIzfNsqSfOV5naGLUVHvHGDqETPHuZr6jgijxXuMu7zbZgz2LoNghIs9gHbeica6Ehrsd5D1he0JIger0b7NLI7DDkODWwVH++pY6iWdL7aMyA4UNarqOlqkchQy/ha0HBfQDd3Hn7q374Qzteh5Vb51JKQ1GN0N6NoDsKMcG/GbbKdfEBJZ73B5rNdSl0IR7oPhSGk29MNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1x8YyTWyQBNdIxAs9f3haq8niI/qNnULSndmW7mmjQ=;
 b=JN5Yd16lxdZbIH/2iqTkKEAY0tK7AaYH/1ehEtiPeeQqYs5B4p+kJxrM6SmGxjevCGSbdukN3vldd+voVlu6o3Z1z7SIOEy9zuI2pXTdokBkO5PNTaDW+mvOvKM5jjZ21NBM4k3yVQMLRIWu+VnoW+HChs0wz1s/aQb7FKbypE9ewL7s+h05ju0usYr9mNH2fPfZg15lPauXq63RE8CGQEVwUizHrKFs6/66ayEXMfGZkw+83UY8sm02PuWsffPMYVwkWNrUYVfFeD2rZNk+lLu3U6l8pxGwa/MdhFZYi3jJlAaoUpTJzwnvUxQ0MuyfBO00+dP9wX9TBg3kL13Iug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e4419e2-5715-85b7-0742-67d7cc35ba1c@suse.com>
Date: Wed, 3 May 2023 09:56:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 11/19] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com,
 Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-12-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230502233650.20121-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c5794f-7e73-4445-39ad-08db4babdd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ZA4Jf6cdbc8RCYktaV8qQBNMe3fhhwf4cXPspxPv6BL6SSZcUuotOCPm1qnE8vKopz5tp/4amuWkw6KTd1CFsFoT7O8g8i5Nxv4X7hP58b3zdWeMVUGbwlSXTbHk593Q7mRwTCBsiuTU4+cjcW7gtiDJfN7IU3o6kmyeEEUBRdZg6npP+EYPifT48/ckhWI8esvONOSLGh10U9/2IGrHqNUvNhDWOEsr2k4ctllIIy91ogUDePakWAFa2qJga/e4Ivtg3J15sep/UB3d2tJpQxMLQUXl2Ibbq5dZ1/+AzglcWTdJy82WjtVAOHawCE9JHMOUSWjEqAR0Z5/mbSTDUZrK5vD+MAqwUfn7oM+zhBNpyE4VJIFL/JBFLyxtcydVbfPQsEZxaHehWJv5Kxrgo4CPuwAwwTu5Y2HK1sG2WFxaViaRH2iWNnNvmqNw2xhJPgibvaVV7DmcU+cA1t2SSrcrC2c3OwtYmXdAJ7grKe171o51uRVlOD5X1tAjYwZ6RnCSpXkw3LckfXWXDaC+gVw+Y8nh+iXEK1j4/7Kc559BQwzBzG8NObmcwlzezA5TmViFIyunx+vLhUVRkCT9SDqFlVNz3OV14fUoMYYKzqvacknx/qwejvAOml/vSXC6alPw9JKI4vxQ5psc6niamzePx6rIjQsXaIBpymDibDAwwMBAipTlYP4BT34eYM1XGxQPPdPv1rIKWaztAr6hQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(31686004)(6916009)(4326008)(66556008)(66946007)(66476007)(478600001)(6486002)(316002)(54906003)(36756003)(86362001)(31696002)(53546011)(6506007)(26005)(6512007)(41300700001)(5660300002)(8936002)(8676002)(2906002)(4744005)(38100700002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVFtcy9tQzhDYW54UkNaUU81QVNZMmRYNVUyekJFTTRZSVpyTGN0SHhlaVVK?=
 =?utf-8?B?UzFremRtMkg1WGYrRWFDbmVGWFVJUVlDY0s2RExPK3ZaOTIwVjM5dkJOeWZm?=
 =?utf-8?B?UXRIZ1RncDVxVFFRUU52dkxKWk9VMzQ0VzM4MUcxd3ltNHVRcTJOdWpqOUtD?=
 =?utf-8?B?QWYvRHNzK1hMTTdMMFdnaUFWMmRvaHlZNGIxQVJiMVdhbkRocjd2bmNXN0hW?=
 =?utf-8?B?bE0yQkw4UWFFdUJ6d3M0cnFVcTRxSTFCdlFhREF0NjJLakhVeFozSkRqT3I1?=
 =?utf-8?B?c3dsbGMvQmhHRm44REFTVFQyeElwQ1RRcnhrekJLb21uZmxNc0FWdk1ueUF2?=
 =?utf-8?B?bk5Bb2R6cEN3VTlnNG5XQ3NnVm5mVGNCZHBPcWlvMWNOSWsrZ0hhb2duN1Fk?=
 =?utf-8?B?bkk2cys3anZxMm0rdHRVWjlJMW1reUdJaWRiWVk3WWJoUGNMNzExL2ZJekxV?=
 =?utf-8?B?VTNjd29xZDRVTk1kWU5RbEl1YnhMZ0pjU1lueUFBaFdDcDFZRExBcFM3Vmwx?=
 =?utf-8?B?WkwrNmY4RVQ3NzA2NCtYTTVuckJ2a040bVBLQjVWRERVSUZFVWRkZXVVMkhN?=
 =?utf-8?B?dCtYQWRXVitmUVlna0xXZWlVaFVCeTVzMXNCNFpUT2hOeHJ3bjNaNmlKNFpu?=
 =?utf-8?B?bUVtUC9oMlZTekFidVpocE1KQTlQeHVwbzFtZDY1ZkdxOGU2cnNZd0xDQ2tt?=
 =?utf-8?B?TFhJRFNEZUswWXdUVmVrWUxLME5UVkNIT2t4ZEhsVjNCYUcrcVJLT2U4MGd4?=
 =?utf-8?B?amRnNzlNdDRaaS85UThKdk44ZkExSjBvOVN2M1duNXBoaUY2SDNGd2RzTVR3?=
 =?utf-8?B?M3BwdnNLejNoa21NNnVLWVFoeWVJYjd1VXVEa1lKZ0JOYVhsYUs1dmI0aXZu?=
 =?utf-8?B?V294SjJsb3l3NEp2MGhmK1kwaVk1YSs1VjZCSTNwWkV0aDRTYng3cnVNY2Mw?=
 =?utf-8?B?bFFKWDg1bjFBRUlwTFNmT25DQUVCK2lVaE95eDU0TktuclA2UnNNZDczU3M0?=
 =?utf-8?B?di9kVkhQL2I0ZVFOSzhkdDRQNnRGVW5Bc3lFdGV3ZERCNHdsZlRQRThRSDYr?=
 =?utf-8?B?c0ZGQitxZGNYbG5PdndjYUpoVjA2Z0toSkdNb2NSU0NtbzF0L1NGYWZZOFMr?=
 =?utf-8?B?WWgzaVdIWFBHcW9kVWMzQjh5bWFCSThmOUI1WGV3djdTdFhYMU5hVGE0V1Yz?=
 =?utf-8?B?bkFocFBWOWVLUis4U3dTcXBCMnlINDNVdHoyTDcyY1JqUEk4SFNDcmNWZDhq?=
 =?utf-8?B?K1JJQ0FEQmhrZDFNTkJaVm5TcWYzNlAzQ25mcnZUNm9iaG9vTUhhNDZ1RVNo?=
 =?utf-8?B?WW51cm95T1o2ek5jVzRvMjRDVEV0ZWZmNmhnMldmZXJjSnUxMXozNG1pL0g3?=
 =?utf-8?B?UjJkczIrZlVuc0VsbkxyYUNvMTdkWkFBNHVIRzRTVmJxQlVqOHQ2Zzk0dHpZ?=
 =?utf-8?B?L3UxZzl2NTNzWWNCMjRxeC9oSUdSWHhud0lzUnBVdnQzbzNwbjdES2xiUmRi?=
 =?utf-8?B?WkYrZkdPeEt3bFA2cnl2anlBcWxGZVgxNlpLT3MzZnJUclprT2VkckFNeUdP?=
 =?utf-8?B?TWlRWTVQUURoYk1mbHpzcE1XT3p0RUdITElQM3VwOUtKSHBlVEptcHY0QW05?=
 =?utf-8?B?WUNnMEtkVTEyS2tpUVlobjJxSmNSNjlvZXpVUm9QamE1SWp5Zm9zQzh0UG9H?=
 =?utf-8?B?SDdJeUVDTzBTenJYWlVjbWwzTkt1MTBnNjM1Z2FqRGdtbUZybW11b1ZoYzNy?=
 =?utf-8?B?VmZVVERPWDExeFFZOGFWU0Q3MzNrb2ZkYzFsdEJuWWQ2RFNpSFJtcy95MFRC?=
 =?utf-8?B?L01vYmg1cXVKMW55S2hRK282bEsva3ZXZmtRWXFFeVk3QUN2Mm5JVjVXUDJD?=
 =?utf-8?B?MFRpK0ZTcGZkb3pHYThwekdhZ1F4K2I4bmdmVFpxYzVzTlM3VGYySU8wTVB4?=
 =?utf-8?B?eEd1NXFxWkRCMC92NzJWT0dMSFRlOUxiR0lMTFcrTHllUjdLOU5ISkN0ejUz?=
 =?utf-8?B?aGF1TU1BYlVjcjZpaUZSRDNTY1VYOW5UbmN6RmR2THM0MlVCMVVFb2dNallZ?=
 =?utf-8?B?SW1xSXNBZW5INWw4eTY0QkVoRUh5dkczdnlEcFMrSTZFRmpIbE42bE1WQnRm?=
 =?utf-8?Q?KoIBQXNXUHOhteZcwROphLTMo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c5794f-7e73-4445-39ad-08db4babdd5f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:56:12.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHHNVjqa6RQoHeLw3eNJnmmuFtz7yGDOIEq0NQ4rYfA+BX1qdcB6qAnUQJgfwF0+REvwT9JiOB/JsfA/vS+Rmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8162

On 03.05.2023 01:36, Vikram Garhwal wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -219,6 +219,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
>  int iommu_dt_domain_init(struct domain *d);
>  int iommu_release_dt_devices(struct domain *d);
>  
> +int iommu_remove_dt_device(struct dt_device_node *np);
> +
>  /*
>   * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
>   *

Nit: I'd consider it more logical if this declaration came after
iommu_add_dt_device()'s. With that adjustment:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


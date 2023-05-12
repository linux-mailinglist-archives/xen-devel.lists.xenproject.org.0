Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7494700101
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 09:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533709.830581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMqa-0004re-Cr; Fri, 12 May 2023 07:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533709.830581; Fri, 12 May 2023 07:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMqa-0004p0-9G; Fri, 12 May 2023 07:05:48 +0000
Received: by outflank-mailman (input) for mailman id 533709;
 Fri, 12 May 2023 07:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pxMqY-0004ou-UX
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 07:05:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a5c01f0-f093-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 09:05:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8846.eurprd04.prod.outlook.com (2603:10a6:102:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Fri, 12 May
 2023 07:05:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 07:05:43 +0000
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
X-Inumbo-ID: 6a5c01f0-f093-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsD5oKNuysPpbjPclJF19xphOgD9CYvnN6DlEGU1GPyudSZyCxOAu0x10b37w72Fb7M5veiQQgaaZQlaW44gAglr8n17yEqSu9wokO6fGJByrYpkJXRD9glZfHxe+3cdx8iLKYZV1pj35122H/YVVHNPpzVtDRiExFW1aO+96wK3ckTWSX/C3W0AieJh/3UR3C1gxEs1bbexAzBMfscb6WuItsO3maJ6jwZy7IIeQcsBRr21hkk/pRqwk6q97rczvqp4w9mk0NU7VrVfLfyDGAC4tpuYSrMUuDzVgJD0hLHaQyqOm4QHMw2VVpHn3gWoYyMygNXl20izgYY+pH7lGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVXLIIKlLw+i1COasw9Ms6RK159MBpPYk5xRi9BswR0=;
 b=fORDHyXtE4WeANmfcB5Z7+UUNsS4qa18bhjvtLB92VPZYoY6UUcZtSohnjIQKMjpVzW7dlXIOTA3+N+dJQMODz1t31hBlUjZf9g3heOX3ciDo5M7+j21WAn9C0e/tdNT2uq3GNyfSsq1PeAWIRd+n/7lg7bK7HlS4weytshcdLHVk8bwSE9MmQmrJfZc1F+7mAw80g1i5KwWJruxBwbTZ4bKwv32SN2xmVvXcm5nblXmMorLvrMlRavEjYsjLtKd9vvT+fv4fqpOYTfmsqwsL/PWKfH3FB1OijIoSia95XhUrIc3PQxksyQhNconYeteyB4ELOsk4aN9hIuP/uuuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVXLIIKlLw+i1COasw9Ms6RK159MBpPYk5xRi9BswR0=;
 b=sLKFl8vEkgJy75nF0rCUzt6L19cOVNKYClCX/xbvKf2WfUpdcI3teLN5XCGAj7kLLRJCYWIRUXMUpdhquY9rrjL/ZzDH3LdEbuLbHpQ/hSb8u8Zhm49gvqD3Swqh+4nPgA0/3cHgCIIOMjc71zfyGdG0FUZvWJkmoRHJ9eNRVvW2rZRBL6P4Da+h6DpvFI38OA7ELsZQ5y86FCRWu/XYYZj5iZEo+IKGwSJmr9G15wKrGv61ZYy/RT8LNztiwU2LweAxJZlZ+mvZS5tiOe4pyncmUp2tgUXFvWoTYFhjCnKr1uBf4AKcT8i9lbZbkQmH2KnoK/DnPpbeOwTiKVo1HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71df3cfb-602d-e543-33bb-02e708e85f5e@suse.com>
Date: Fri, 12 May 2023 09:05:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/8] iommu/arm: Introduce iommu_add_dt_pci_device API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230511191654.400720-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 5853ef20-4cd3-4992-0933-08db52b74d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QQlxYhJEx8Kyknx4k7dWZZnHhvS0M/KCDIvEYByUqa52iifz3T7aANVlKBFVfMmU2VynKeAC4aBWt5TxhAPrXwTdfQuZrZJMhC0BJTdv6tPBr+tbOj4trOpBUr1H5yf+A3GHURRHUFCcq02uv/eJNrK75phYsjIJbjo46Q03RSO07JRbeU12fqVYFmXyw+eFsu9W7T3VxPdVSReaoYkozoGGVPCJse1tngEQb3VbkNEspW+QY9liDJ3ynsF7XYUtiQiaGhj5gulZdPPj8yYRcjcoZZFjjV3fCGXs0TXSIiRox5gPJcHTbXA9dbI+4esADGZ6DP8kKcWrrOdMLRrKs15jAXdVfbjKKq97JyqBDwx3pqhFO1ZiTHmoJVVHBYM0/3PDcRsRj6XjRTymGUXPaWvwulbFB9MuOr31NrjjwfFNgKEquKc99ZrUeUHarDJhYt5r4WCLsbhoEmYDSC8ka9of3fDo+Bc9906OKNAv3/+5iMKcCHAygYDH+6bXvC6YfUXIeizDO4JgTxc56qqd+zj83dUi6zTD3W6QOlogmANl5xUx6PCZcxZKESS4IrD2JvSn0E96Vrq9EsYrejGgFNcGSs8wfeoGgsJGreGDrjir6d+IrqJ9CIh3OvmSahdFwuSxj2HmuFDjIAZyCEruyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(8676002)(36756003)(5660300002)(2616005)(86362001)(8936002)(6486002)(66946007)(54906003)(478600001)(6916009)(53546011)(316002)(4326008)(66556008)(66476007)(186003)(26005)(4744005)(2906002)(6506007)(6512007)(31696002)(41300700001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUNHVUpvV0pzS2xwT3lVVEhmOTgvRlRqalhZU1BTMTVUSENHVENlU0l3QUdq?=
 =?utf-8?B?cFVTWEpFWjJ5dTdZYWlnOFJqbER5SUlhdExRQlIrQmZTNzVSY0VabDZ4S0hn?=
 =?utf-8?B?WCtDM2dwYjJ5U3EvRDdzR1R3MmlMUndaa1A2OGZXb0FNQ2FWWm1LSEU3Ulo0?=
 =?utf-8?B?cXk3QzVDZ3hkMTE0VlBUNDFnWGJ6bnpHejJIMWZ4NzZpU1J3YnMzd3VPNVdk?=
 =?utf-8?B?d3lxY0k4UWZnazZGY0IrbFNtRUxjNFhXOHl3czl0cm9LUUp3Zkw4aXVkK0Zr?=
 =?utf-8?B?cHVnVzlCWXJSdXVvc1FhT0lJU1NOTVhTb1dYYlVDR0tNQWpFcTRneHpJM2I4?=
 =?utf-8?B?b3V6WERzQk81N0toOTNPVUdxRG9VeWpDOUFBR2xjVjYyZEhlYklONTNjbmZs?=
 =?utf-8?B?cnRKcTN1U1NjMGE2bk5MemdJdDNrZlk4d2xiN3hkaEtsTldoZzErL0dVQWpV?=
 =?utf-8?B?Z3o1SWN4MWlLYkdHTG8ybU5sQTl0OTlKcXZZcnZ3SjE2VHQrSUxDZWc4UDYx?=
 =?utf-8?B?Q2YwVm1Sb05PbG1zalZ5MGZqaWNLRnJPOWw4ajV5V2ZselZ5VEhIOGd4MXVH?=
 =?utf-8?B?eXhvVmtSK25HZktUbGpWWmFnN3k3WnN5ZkQvb2dRQjE5dnd0bDV3VWpSbVdB?=
 =?utf-8?B?M2lXSHV2SE84ZnNjR2dyL0dISXlmeE9MYUs2LzVHdWwvNnRpNDRoWUF5TkVG?=
 =?utf-8?B?VTh4bEJKQXM0MUt4aGgrVjVFMno4VC9PR05raUxxOCtJQjVQTkk2aFZLaTF1?=
 =?utf-8?B?ODZSMEU4eUJmTDVoSXI5cmpLUUVXME5JeXFCSVdkeG9xMlRlMTdUNUVuaW42?=
 =?utf-8?B?ano4aUt0Y3BGNDEyc0VHV2hRK3NEelMwVHo4NXBiWkpIeSt6cXlDaE1vN1pr?=
 =?utf-8?B?bUFtTFBBWnNlNTNaOTByakd5cVNtZk1selB3eGtUL0lwRDRtMEd3N2ZNMjVY?=
 =?utf-8?B?ek83dk9KMFNVZjlmeHUvNjNHaFRMQTFsV09ZMkRKU2QwdFl3TjFwdy8xMU9v?=
 =?utf-8?B?SzJZOUJPM3c0aGtCelJYVGl0Nm9HL29TMEJhd3hKTWNqMnBjWk1kS0FMRU5v?=
 =?utf-8?B?T1pSWkEyU0R0T3h3SjRrdjdnM291bVU2SWhtVGtnQ3JSM2syMVRyOFZoOUhs?=
 =?utf-8?B?ZEZMZEdFcW5yUERJWm1uVjZhNzVxa05OSXlyVlAvMVpvVnJ6NGJwdjlxb2JJ?=
 =?utf-8?B?NTJmT1JnZG9tQTROQzRJU2FrNFZDbUtEcWdUVW1pVTVFK2ZqR1EwVXVYdlU5?=
 =?utf-8?B?NnBuWXNsYmZuK04zeFAwUytQVWptek1WNGZBcnZmMUl3cVM3OWxMaVJyVXM4?=
 =?utf-8?B?UVBFTUtjNUtQam5nb0ppZ2lqV2xiU01MelZqcVRTaGpOSTI4UHRFdkR5Ukxp?=
 =?utf-8?B?bjg4QTJuem9yWmxJT1BObG1VVE12UzE3VitMYnpiQ1ZINzlKTnJVQm9tQ3Bn?=
 =?utf-8?B?MmJIRW1tZ2ZzNHluZytrSmVJREJzN1JGNUhTdUc1ZVlrSklTT2ZJcWs4SjJE?=
 =?utf-8?B?NHNWTlN1V1VFMHg5K25MV28rUmFkT2RVT3diTG5RckFmdytwR21zekRCYTFB?=
 =?utf-8?B?WTV3NlJLMTBjWTMwZWVYWkdpWHNOa1ZQdFpkUUpJVmx5M3NvOTUzNFZ3K09S?=
 =?utf-8?B?Y0tFUWZwc09pWmhlcENRWDUxelB2c0FlK3JnYTdiM2dUNFdUdGlLRkp2VG16?=
 =?utf-8?B?QWZSNGdqeldyZHZZeUNMbzFuQkVma0daQWc4ZlBrZTJzT0xGVlhrOWVzenUx?=
 =?utf-8?B?bFVVcDArUGp0dWliU0NXcFU2VmZVckVkZWhKQzFwSlNTYm5MWGVGMWdDOGU5?=
 =?utf-8?B?Y3AvejdHWFpWTm91dWNkR2RBcDAxWTh4NzZjWFIwSWR2SGtJQVZ5a0FOdzBN?=
 =?utf-8?B?WnJUV1l1NFBrcHZwV2taMEtuMyszWDdrVFNzcE5iZWJ3WlJzbWM3eVZqZ2RG?=
 =?utf-8?B?cFNxU2E2aW5wT25GbllWR3pvdEtneFZvOEc4NkRnS0RnNlBwVWpNODNHVlZx?=
 =?utf-8?B?V2FOamhXblZHYlhLbUZhNG1pdGt3d0dDSzh3akF0RVdsakRNY08yTXJlcHIr?=
 =?utf-8?B?WENBVTRyNUExL3JQNmwzZzE4S3laSUpIRDZwWjdrZzlpV2Y3bnUyV2VKQzFi?=
 =?utf-8?Q?OZDJj6utEU9uvWfv+0e0bYy+3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5853ef20-4cd3-4992-0933-08db52b74d96
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 07:05:43.8638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPcuBB7TT3yp6eT9nXopCX/1xdVH/oTvXwETyDaUT3REIAjSYSy6jtYvV7YWu1J3ooceKOKB/n8uu29Y2wtTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8846

On 11.05.2023 21:16, Stewart Hildebrand wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -219,7 +219,8 @@ int iommu_dt_domain_init(struct domain *d);
>  int iommu_release_dt_devices(struct domain *d);
>  
>  /*
> - * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
> + * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
> + * DT bindings.
>   *
>   * Return values:
>   *  0 : device is protected by an IOMMU
> @@ -228,6 +229,9 @@ int iommu_release_dt_devices(struct domain *d);
>   *      (IOMMU is not enabled/present or device is not connected to it).
>   */
>  int iommu_add_dt_device(struct dt_device_node *np);
> +#ifdef CONFIG_HAS_PCI
> +int iommu_add_dt_pci_device(struct pci_dev *pdev);
> +#endif

Is the #ifdef really necessary?

Jan


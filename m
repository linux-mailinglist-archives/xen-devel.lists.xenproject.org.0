Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774CD7FA0C1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642079.1001196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bVm-0000AU-Nj; Mon, 27 Nov 2023 13:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642079.1001196; Mon, 27 Nov 2023 13:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bVm-00009H-Jc; Mon, 27 Nov 2023 13:18:54 +0000
Received: by outflank-mailman (input) for mailman id 642079;
 Mon, 27 Nov 2023 13:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7bVl-00009B-9p
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:18:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81497e33-8d27-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 14:18:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7958.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 13:18:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 13:18:48 +0000
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
X-Inumbo-ID: 81497e33-8d27-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHKNRrqRVlAReSJps7xnAnSyOe/V/Va6cubP7jYaOqcBzcptGfUQ6oPZG1v+EqFCisaLzXax0llKio3yvlJXqwRcZWAvsdZIwKIXj3NA97AwwKIqxw+R3QcmI5MvxaO048H+JkxP8sCblRnvR1Gh5kVVKhOz5Q6Ak1H53LIDQjQGvw5euZkV+OAYu3wezFSE10RieViWQwizjM8kErehrlMWbFis7tTerG1dX+NVYDly+xoHOnSUz0hd5Vq9u95cKzdRn/DiLQWAeBZuUywPPgFHNvtRLpJ65Vi/go90uMK/iLvaI+NDnug/XHMnjjMY86KHjA/olofdESJShr/VsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXiHqxY2uQUxO8KQoAkTGn2iy7HTr8e1WQhV4uV3sHU=;
 b=C81VOkJyuQLwQ77KjWUZwYQywj/9E3WIpqTkuCkWpuwzKrb1Kz3arwWACPkfGepFuYFPzG2XX6WSMSuTngXNWBuFYqbxWP+HFPemJQ4K7iFBkJB0VKdVwLtwNrmHFtjRzCwcaS1Uz6RoHVvdpaT0hrK0TOiKgF+xTOHF+38FTE1B8Gl6uCUVnlefxPXmTWkml5zgRH52Gzk9yEMJMMznIMGla0CRlS7leL/QzS1xsYE66V3ch9cJtOi28Z9WyKpxyf5ojRRTo6GHSdkKOjDnvUUijLlMOCWm4JHVw2gNdykccYMhGDFpN7L3Dnzl3D7I6sulzgnTlBzo384Jdmdhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXiHqxY2uQUxO8KQoAkTGn2iy7HTr8e1WQhV4uV3sHU=;
 b=JMFVCwpHctY93AefQZ7nN/MVZSRNmns3OwMVA3QVSERVOBbdLn/Od39/x766aDb8mpYBPzbT10DteWgaUG1dlKog50aanfPz9vGZoammTO8rV02EnJ63PACkWji+fa4zuNHYwOJsgGw473RJkNXWM4SGTR6gSLzdEUge4Ub4TuiY2UapjnPt2CvhQQnrnx71RQSTOJa4tjJxMxFy5eimmWaPHnh7aWld+ovgcC7KjVoM6xBQ6BYEp8KpyUNsIdITetO4+aTeqP5w8I18IcWpYR6rdtGL4HhzhJke/+h4DnyY757KIaENzmcxwpq+bKQiQn8UsUTTTI79GytI1RNV6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b73bfba8-0c31-4f89-8a74-fdd326910b2e@suse.com>
Date: Mon, 27 Nov 2023 14:18:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/2] x86/mm: preparation work to uniform
 modify_xen_mappings* interfaces
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1700645120.git.federico.serafini@bugseng.com>
 <8f318ade9277b316a6f91df3b75a593d662ac586.1700645120.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2311221419530.2053963@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2311221419530.2053963@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 6221349b-aa79-444e-21bb-08dbef4b63fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OWeo5krrtp3bu/SjqCXsfZV/dkqyvb+gI13tmtLTI5CrNWGM6dI+1e0uMrkuzJ3fSvgnmtjoohX90g/fXLrcfuF0MKzC0Lvk590dZrJUZuEEWEV39zUF9Ix37ztK+I6/sgT6nfYgNWcrlDgDE4JiCD5TjRBNGOilnJtN37ZvjQg6j5cdvk+FDzvU9XynSIXrwnrbKNXMxel44KypYiBSw2s+xErQ5Hv/4C/6vk8VUu/jzX1LnN/LN6YlX84IQ8vzqu77t4eX/BEOJJhG52xllzEwyTJwBhNCs1CtJdiD2TGQzVtCVIStw14uz5TI2mhAaLOB2FR7q/QHas6GpuUKe/TIT/T4aLyaOENIK5hZoPuy+ehMjcCgJRtIrF0NpbxnMpUjWYkLLQ0VxJuhBvI/HO+UV+bi39YF7O8E6HwbGDvAHY1tla5zgxa5VDpHESpSqq3qZLt0i6DxwARlZdg5SUtJOA96gkuKMw+9njnFgaRyJwokDiUhIt6jQShhHxi5Iyb28NDO9IsspYTJu/zd4Cn0wnUWH4lLDLk0h2Nhb5zJwAudzfJNV9ciDOQI0M7Gdy/pypNCPJefv2fFXopzhWkGEidXqSVQj/WisTNyXpH0274QlSQnJVItJUYj/4EO5hO735NF07SDQLJ+jtpdlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(31686004)(4326008)(8936002)(8676002)(53546011)(6512007)(6506007)(66946007)(316002)(66556008)(6916009)(54906003)(66476007)(86362001)(31696002)(6486002)(5660300002)(478600001)(4744005)(41300700001)(36756003)(2906002)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZtU1dZU013cnltMG9hQkhscENQOENKa0YwZ3NVbTljVWxFS2U4bVBURVZt?=
 =?utf-8?B?dEFLYkFjaGhBY2JqMk1nLzZlMGpJWUdreFpkWkhwaGlybzFDZEdXT3pvT0NX?=
 =?utf-8?B?U3hGUFJaZEpocnNNNHJQemhMT0J0STJPRzJPNzFuRm1nVXRrN1IxelViY2NJ?=
 =?utf-8?B?T3dOVzVnS0VyM09uTjBoVnFKUFZyMHBEYlRzeWtzZ2dNOW8raWowbWsvK3FW?=
 =?utf-8?B?OWk5YzJER1hHMVRpZVMzK2pnckJjNDFMUXExWGdtcnNVcUJlTGoxL3VodzdE?=
 =?utf-8?B?M0xlaGhPMndGNXFsaEdEbGxPQ1JZa2RFcFZUbUt6L2t2N3NiWDFrUDRnNG81?=
 =?utf-8?B?RXlBVCtZMGlPVmwvR01VeDZFS3ZTREdkZm5nQUpDNlBIcG5XaW1aVGFyb3dR?=
 =?utf-8?B?UlNnVFBYRWhzT21EbTE2RzRCQmZacVpUQVJhL2M4RDcyRHhKZDhpajQwWmFK?=
 =?utf-8?B?SzFNcTN3aDVJS1ZtRG1jZk5COXlUKzlmSFF1QVBwbUZsZGFyOFdFS1hRWHRT?=
 =?utf-8?B?VFg1QW9STjRrSUMweUxoZGs2dzV6aGVWTEV3RWtZNDVQaVpvc2NpMUk1Z3BK?=
 =?utf-8?B?dTRzczRlSXRTL2lWdE1jSklUdUdNMktTNGhhQy8vVGdxOGJBUjcwbEdyT0lp?=
 =?utf-8?B?SDNqZElneWFNNCtFSFFoamJQbmlZUVg3bWx4cFlYNjlvbFYxaUVjaVZlQVEz?=
 =?utf-8?B?SlZmMW1xelVnZERKanpwTUZMS0piNDVFbElsTHhHMU9acjJKaGJtaFZObEJC?=
 =?utf-8?B?dGxyZElHZE1JTWx6b1FFR0ZXNmpCN2xLNGRrWU8yc0gva0dNR0ZEbHMxajNR?=
 =?utf-8?B?dlhkVDUzQU8xaFRSb1kyTFVnbnIreisxRjlBN2w3R09NQlU1d1VlQUNlZU04?=
 =?utf-8?B?dm84djB1TXJXd1pFM3BURlVzb1ZEU2dLNjVWeUVLKzgyT1RrTTBKVlRNN3pC?=
 =?utf-8?B?SnJ2WE93M3FqNmxGYzJzazFEVmpRaUY0SGRWU0NQLzZRQlptNmpIeGJaZGpo?=
 =?utf-8?B?NHBaNW15T0VQWmYyM3VmV010YUJyK0tYQlpYOXpyM0k2SmloT0pFMWo3aVJi?=
 =?utf-8?B?RVJmKzREWi9kK3UvYlYyYlNqOUE5dFNPaVRpT004QjlYWXVqeERGendxRnYz?=
 =?utf-8?B?TVBwaVBDbDB2WXMrWjlOc0swMnlCQk1DdTcxeTUxWGFEVnZJZ3VuSmw1Tmdu?=
 =?utf-8?B?QXgvQVJHUnY5cDJITDR1Z1hWOVZrZ1N6VW9NQjIxeUN1VTBOcXNIcHJ0dTRm?=
 =?utf-8?B?d3M1RDRIWjVneVVmUm1iYTExT2w1VTM4Ym03WG5mUjRmKzhDL3VvRFdENk1o?=
 =?utf-8?B?clNxS0crRWxZMHRIc3o4TCtQanhva3UzVHZsYnhJeEk0emlpMlpvZ2Jzc1Vz?=
 =?utf-8?B?Z0UyQTc1L29qbkhMRTVlN3NvVGZ0YUw0RitDdXBmWCtOWEJJaXZpYWNDWDFT?=
 =?utf-8?B?MEtZN09iampKUzBNWXE2eC9QUWpLQTVzRDFQaG1QMFFvVVZMZTdqcFNocXU5?=
 =?utf-8?B?d3IyV1dSL1NqdjVBOEMwM3FhUTdPbjd6Mkt3Z1VBQ1B2b0EvcEtabFJtdGpF?=
 =?utf-8?B?Si9BbjhIckM1OWUxYURRd1o3aElNZmxsT3pTMXhkWHB0U1RFV043ampkSXhz?=
 =?utf-8?B?OFJkOWJCL1lNMENNTWQrRWpCQ0ZkOUh4WktrM3BxdFRqYWJmVjA3Zjc1ZFAx?=
 =?utf-8?B?WUE2cTBVWmYxT21kRzNJUW9JTXpvUStvejFGUHRFR3VZRDR2RmZjbGE5cUZH?=
 =?utf-8?B?eUhvMU5qaDZ4c01wanVjU0pYQklRR3drdmJ6M245NHM3Zm5UOUFRcThyV0k0?=
 =?utf-8?B?aXpPenAyRWI0VmRMdzk2RXNycVdTMTFsdDJRWmN1M29CeU50V0ZtbUZ1elVH?=
 =?utf-8?B?OVZla0NMU29iRWZRT0I2OFZReFFVVU9nZWt6SmJQQ2x1c2tXcmM1a3ZrMzFD?=
 =?utf-8?B?eWJlVDVUc1YvZGdmcDZiV0hwSDRYTE5yQnljcGxKVUN5MjNmQjZtbnJkbC9J?=
 =?utf-8?B?cE11bU5MSmRWZW1zWm9odHFIS3dNZ0JCMFFnZnBuWDZDTEdpZkppNVYwZ08v?=
 =?utf-8?B?eEhSMTVJWURzOS9PdHQ5MXdGMmVqZzZoejY0dWRxcFcvOG1Sc05teUNPVStK?=
 =?utf-8?Q?T29EWfhxdNexD2Z7So2w1CgCS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6221349b-aa79-444e-21bb-08dbef4b63fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 13:18:48.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f93vvOTm5eMjNTw8oYuAeokDvqcDW4AEGthVrE1/4Lw5Vz2lkS2UnWhxmeWJxHIZka0o1HgJLFFywPh1DtrDHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7958

On 22.11.2023 23:20, Stefano Stabellini wrote:
> On Wed, 22 Nov 2023, Federico Serafini wrote:
>> The objective is to use parameter name "nf" to denote "new flags"
>> in all the modify_xen_mappings* functions.
>> Since modify_xen_mappings_lite() is currently using "nf" as identifier
>> for a local variable, bad things could happen if new uses of such
>> variable are committed while a renaming patch is waiting for the
>> approval.
>> To avoid such danger, as first thing rename the local variable from
>> "nf" to "flags".
>>
>> No functional change.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



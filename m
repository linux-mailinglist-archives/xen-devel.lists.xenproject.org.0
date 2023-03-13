Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34DC6B7014
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 08:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509132.784371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcYO-0005Na-FZ; Mon, 13 Mar 2023 07:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509132.784371; Mon, 13 Mar 2023 07:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcYO-0005LQ-By; Mon, 13 Mar 2023 07:25:08 +0000
Received: by outflank-mailman (input) for mailman id 509132;
 Mon, 13 Mar 2023 07:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKDe=7F=amd.com=Christian.Koenig@srs-se1.protection.inumbo.net>)
 id 1pbcYN-0005L4-BU
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 07:25:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca8ffa1-c170-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 08:25:06 +0100 (CET)
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:25:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:25:02 +0000
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
X-Inumbo-ID: 2ca8ffa1-c170-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRa5wXihvN++21foIDk7KvDpE6I9nc2BTjvc+mvh3wYoQEnB0x63XLBQTZJJGP2NUJ3HJOjyPVcxiThl2vXvKtDg5229gFZcKEz0cRAjdZgTsMdfQyNWg3rwiuF6S//onVvgSf3GfkfpTUlm8kHW3SWZhGEn2H9BG7Jml0auClxydP7fKUSdkxeHhbE/dSLDWgv65uwB9UoWNKtY9CKSlzm+0sVXNfUK6MlnPNgSe4emuVIvUhnaOz5R2zPstc7qK888PFb8N+9eF/hyyT5k4QLtiMepi8U8Ay3tufcUOcHfu8ZKt5ri+TwWSyavWSKiQpfw9gZJ+KpGUzY8rWr45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBfqC4qhMtRCl0gKzFStfehn6vE0hHmR3VrImV9VC6w=;
 b=DRKy5N9DQAocYUnhwb0SX8c0ybS2eNc9mGSEQNUBERO5TNGRtv83wAVMFwViYxyQm6KJ2vm+nx35uvy2UzVIg9VP56iZ7o2Pf30jDPJ+WgvOirMCSjl7egIpkdhXLPmoFhakCzFrl/lCrWMkN/0rP0zNpYl8YBgOgL3kxFojmly02JA1mhuycY23DSqF06IELnDj0AkpSlR522XWRwQ64g4i0s+YRHFTcIJ9WzCYn4HYRsK2ZlG/9Q1oNkIdvgbfOZgEhntGFezoOWpStfygwvDPLoCT9hHGYQjfQoE95+n/Y0WzCwQYU4zZD305K8Zxd9GBF/+3vNGqQcq6me/Axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBfqC4qhMtRCl0gKzFStfehn6vE0hHmR3VrImV9VC6w=;
 b=V/mOY+LlbY+n+I+3pUcBbDX2CQbxF1iVBIcRtEAHvjh8iRP+rH1XyTnbEMXws1hWDzGWy/kv4GbQO/5/6UUMhh5OIi9Iu2pE2xT4MFMyW2OIRVbmLZeGIRCZODeWf+c6SmB2exnf6trEbUKELQJW7cHAi7RIulqQPkJ3y7cEAik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e8e2a3e7-5191-e310-0900-a6a9b76c0458@amd.com>
Date: Mon, 13 Mar 2023 08:24:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC XEN PATCH 0/6] Introduce VirtIO GPU and Passthrough GPU
 support on Xen PVH dom0
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230312075455.450187-1-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1b74eb-fb00-483e-a3b6-08db23940f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BIJ6K64IyYXc8qfaAusa6nUiTEPsOckm/CWIUfers5EbSBh2Y41DgCRBQtEBG0Axz1FXoMDRokqWiNMy7TpgGYI1/806O4dC2TnG99NGsaLC8GiYX11DcmuPJZWev3ck7MWmeauoa/MKyv6ffEKYXFxUeFYKS5ccM2SpQFmXrb8WY7kmOO9TqWXbJRnrRuvk3pc1M+eaAmqqQxLMLBNCwY/PmF0VEb48eIFD1ba8x4i7HRMLyioQqzEg9NbiJAKX6SkqMDTd0OYfhm+Q3zB04iAegW/Epxkaj0zetoBm+tj4ZpEpSqBdafYOqGV1BSmbEchxUbamEFBCxJ9mvSaNd8WloKkAerM1bnvZ4JZOwboJClIOduRTLwPipqtz4heXOl910WfxjkOt3ta8hChMSUXNhot0wmdr8pFsS9/d9XYJsKdLWioWOBKR+ryZ53iRJHrRXSyRFrbYz0wGwEORcA2UP6S+b/tpc+BtbSzL9O/9QPiwTX4goi3u7kW3+JfFMBpy6cQjoxTyTfwwKol2aP7l15QDu8iF7xwFxnd/LUEt1OLdn29qUIdBSyTEH3gTnEN43Oix7C+sHouavUGvCBNuRdjtnY9KHdBP/J7ghNox0E1qx/CzDFmfeiLav/Vb6iYKZevSdWsgCYMnnY9GkELwkw93MFgjWsaErLjH8YrwPXeu8lgCx+Qr7LC+AXpZ5HFOC757fwiz8pp1AZhi5XAznRxseBxnE+/3713URL0KjPkm6xsawfSQXmxgcc3Csgj2ApYrSEP3vEUOHnD/e5DbpcnxhciQEIs5gjbfEJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3587.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(36756003)(86362001)(31696002)(41300700001)(186003)(26005)(6506007)(6512007)(5660300002)(4326008)(2616005)(8936002)(316002)(110136005)(54906003)(478600001)(8676002)(966005)(66476007)(6666004)(66556008)(66946007)(6486002)(38100700002)(2906002)(83380400001)(66574015)(5930299012)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnFxU3labFZ0NkFySDVyZE1NenVQNWdzY0crbHFXWENWNjNFZng1YS9yam5Q?=
 =?utf-8?B?NU5abFRFRnk2R0I4YkFtekVaeUVQWHNob2ZIY1FKbDkwd0diUm0xUzYxbEZJ?=
 =?utf-8?B?NzhjbzFLZzVOL0dUdlg4cCtSaGpXdTRZSHhHTm5xbC9RSHVUbUZ2Y1lFOE16?=
 =?utf-8?B?bmpvY3hNSUtxZUVUcWt6cW5mME5tK0pybStYeWh4TTJza25CNTBOeE1sYlhZ?=
 =?utf-8?B?eVFlcTJRVFpSYWJBaGdqOU4yd05Nd1VlcFhreU9ka3hjK0gzNUlDZUoxcmQr?=
 =?utf-8?B?NURTVDFpa24yeDVvZVBZd2w2Qi84Wjc4RUFYdXhUN0tmdUhDd2xmUk01UWRw?=
 =?utf-8?B?MkJwOFppWHI4VUdUaWh1bWk5Z0lYOC9NMURHNzBoalNvN3ZJZXVVVG95d0k3?=
 =?utf-8?B?TUdWcFgrZDFHbTkzeGJCcDZvV0w5YjJxNXhyakFvS2ZlK1dTOFBrR3FpdEFX?=
 =?utf-8?B?bm5mMmN1MnJhdXh1RFdkQjFvR2pKREtzdSs1TWtoSWordXh5VTJGbFlJWmVo?=
 =?utf-8?B?elVwdWFlSmxwQVhqYXZ0V3hnQXNwaVh6aTJ0R3hwdzNoTDNUT3ZjV2R4ZU1B?=
 =?utf-8?B?UUh2YTdXbm1WclhNSnNrbzJFbWIrWW16akZLaGJUTEg0b2hHcnpZU3l0RVFr?=
 =?utf-8?B?SHJFMitON3FFY0pTaGpnYU9YSjlFTXNOTG84a1pwN3NzVGE3bmkybWR6cGN6?=
 =?utf-8?B?MkJlU09PZUFldGtPWkJQamt5NloyRHZLeDdSNk8wSGNyekhwQzI4ZmFLWG9i?=
 =?utf-8?B?bENGL1hEUG5tMkdiYitFNUN6NG5NMXNLVUNZek5tZ3RNTDRIa1JBaXpSZFFF?=
 =?utf-8?B?anRsNjZob1Y2TDhBMkVuczlBRlVxQnNuV1RaYjVQY3JzV3BqdU5JOTY1RlBN?=
 =?utf-8?B?T0FGZEZ0WlY2Yjgzb1J5eFBhVXdFV2xxbldPbnByNkZaa2tlM0hKcWhvY3p3?=
 =?utf-8?B?bW0vdnlqNGJkTlE4aTdqLzZjMzVIU2VtekI0MjdpbHlFZ3haRTRUb3R4dGVZ?=
 =?utf-8?B?YXBybzYyVWJSbE9YaWt5cUxpUHV3WVFvWmJhcEl3ZEZSWDR4aVZSUWtPNnFH?=
 =?utf-8?B?VmNCdVhaSnV1aHRWYTJ4Yzk4UnpXeTNLaUhqRXM2SzVXSDRZTzRrODRLclJB?=
 =?utf-8?B?R0lEMnJ5aGhjZU1ISmdJclByQ0NycGdqQnZ2WUVlMStlaWhQTy9MRFoyNFI1?=
 =?utf-8?B?WEJlTTNPcnFVRDdWOWtlMWtxTEZ0YSt5OGFtR1dEZCtRRjMzOHZzdlhkQ29Y?=
 =?utf-8?B?TG8xWGZka3AwdkRtaXhzUkg1VWhLN1V0WTh6eGdxcEtvTkJBVDE1Z29VV1pv?=
 =?utf-8?B?TVNYbExCVHJiV2Fod01ITEJKZWVBWjZZTmlwNzhsYjlFdzQzbHNMMjNPWXhh?=
 =?utf-8?B?N0tlQ0FuS0dvc1BBNUlVRnNsZHkrT2dCSUh3TXBUSkt1ekNrai93OEFLV1Mr?=
 =?utf-8?B?SU9BalJUbW85TkV5VGRQaFZhT3ZobVE5dnpJN2QvaWZRaVNqMjVCWmN0dmRD?=
 =?utf-8?B?LzVyOVJuZU9LR0hLUEdKYVZ6dGVaSnNzZkVEQTcxRlVkZ3hvZXhDd0JVbDFH?=
 =?utf-8?B?K0RDMWpGRWpVUk8vYW8wbThhQ3JIdzJXSWdjU2lFcm1jR0pjMXpkSEYySkJw?=
 =?utf-8?B?WU5tQVV5eURtUjNIS3F3ZkpRM1U5cUYzM0I0QTZQc21Qc05xbUYvWmFOSGUz?=
 =?utf-8?B?ZUFJNE84QVNsaVVlY21Uc2d4REpqblRrdEtuNXdCRXRvbG9FV0lZUDlvUGxn?=
 =?utf-8?B?KzJXMkpwb0FaK0dpTVpXaXkvTVB5eVdnYmFSbTdLUHY3MWJZOW1aMisydTRJ?=
 =?utf-8?B?V2hISFhNNGJwaEJIMlJQT21paC90V29LQ1owU1RtN2l0cjB3VGNsQUtldEZD?=
 =?utf-8?B?T25lYWhYZVlUT21ETmxKZHk4U3lMNUswMW81RzNkMFFHejZPSy94d3IyTjRE?=
 =?utf-8?B?eUpzUEdsMENhUkdvUUdHOFJEanlqOXFHTy82K1BPWmxURmRpUmR4SEczUk1I?=
 =?utf-8?B?UGhBNzVLSy9lUUQxYjhwdVBlM2dVT2FJOXZoRkZTUzBpUVVNRDhQMTZQUUdz?=
 =?utf-8?B?amlmSE5DVVZBcU42d1ZsVXNFbEdqRk5zd0t1eEdzeFJGK2lORkZTRGtTMXRM?=
 =?utf-8?Q?VD42aju/4u/mBCyemEHsmP6KA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1b74eb-fb00-483e-a3b6-08db23940f12
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:25:02.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQphUPd1fH2Jo65Z9xxvALIxtP2d2TURFndpM2xaEemCHmyX6AJziwUxkFfkPhWN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236

Hi Ray,

one nit comment on the style, apart from that looks technical correct.

But I'm *really* not and expert on all that stuff.

Regards,
Christian.

Am 12.03.23 um 08:54 schrieb Huang Rui:
> Hi all,
>
> In graphic world, the 3D applications/games are runing based on open
> graphic libraries such as OpenGL and Vulkan. Mesa is the Linux
> implemenatation of OpenGL and Vulkan for multiple hardware platforms.
> Because the graphic libraries would like to have the GPU hardware
> acceleration. In virtualization world, virtio-gpu and passthrough-gpu are
> two of gpu virtualization technologies.
>
> Current Xen only supports OpenGL (virgl:
> https://docs.mesa3d.org/drivers/virgl.html) for virtio-gpu and passthrough
> gpu based on PV dom0 for x86 platform. Today, we would like to introduce
> Vulkan (venus: https://docs.mesa3d.org/drivers/venus.html) and another
> OpenGL on Vulkan (zink: https://docs.mesa3d.org/drivers/zink.html) support
> for VirtIO GPU on Xen. These functions are supported on KVM at this moment,
> but so far, they are not supported on Xen. And we also introduce the PCIe
> passthrough (GPU) function based on PVH dom0 for AMD x86 platform.
>
> These supports required multiple repositories changes on kernel, xen, qemu,
> mesa, and virglrenderer. Please check below branches:
>
> Kernel: https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/log/?h=upstream-fox-xen
> Xen: https://gitlab.com/huangrui123/xen/-/commits/upstream-for-xen
> QEMU: https://gitlab.com/huangrui123/qemu/-/commits/upstream-for-xen
> Mesa: https://gitlab.freedesktop.org/rui/mesa/-/commits/upstream-for-xen
> Virglrenderer: https://gitlab.freedesktop.org/rui/virglrenderer/-/commits/upstream-for-xen
>
> In xen part, we mainly add the PCIe passthrough support on PVH dom0. It's
> using the QEMU to passthrough the GPU device into guest HVM domU. And
> mainly work is to transfer the interrupt by using gsi, vector, and pirq.
>
> Below are the screenshot of these functions, please take a look.
>
> Venus:
> https://drive.google.com/file/d/1_lPq6DMwHu1JQv7LUUVRx31dBj0HJYcL/view?usp=share_link
>
> Zink:
> https://drive.google.com/file/d/1FxLmKu6X7uJOxx1ZzwOm1yA6IL5WMGzd/view?usp=share_link
>
> Passthrough GPU:
> https://drive.google.com/file/d/17onr5gvDK8KM_LniHTSQEI2hGJZlI09L/view?usp=share_link
>
> We are working to write the documentation that describe how to verify these
> functions in the xen wiki page. And will update it in the future version.
>
> Thanks,
> Ray
>
> Chen Jiqian (5):
>    vpci: accept BAR writes if dom0 is PVH
>    x86/pvh: shouldn't check pirq flag when map pirq in PVH
>    x86/pvh: PVH dom0 also need PHYSDEVOP_setup_gsi call
>    tools/libs/call: add linux os call to get gsi from irq
>    tools/libs/light: pci: translate irq to gsi
>
> Roger Pau Monne (1):
>    x86/pvh: report ACPI VFCT table to dom0 if present
>
>   tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
>   tools/include/xencall.h               |  2 ++
>   tools/include/xenctrl.h               |  2 ++
>   tools/libs/call/core.c                |  5 +++++
>   tools/libs/call/libxencall.map        |  2 ++
>   tools/libs/call/linux.c               | 14 ++++++++++++++
>   tools/libs/call/private.h             |  9 +++++++++
>   tools/libs/ctrl/xc_physdev.c          |  4 ++++
>   tools/libs/light/libxl_pci.c          |  1 +
>   xen/arch/x86/hvm/dom0_build.c         |  1 +
>   xen/arch/x86/hvm/hypercall.c          |  3 +--
>   xen/drivers/vpci/header.c             |  2 +-
>   xen/include/acpi/actbl3.h             |  1 +
>   13 files changed, 50 insertions(+), 3 deletions(-)
>



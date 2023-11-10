Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F77E7A4F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 09:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629981.982575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NHE-00070O-TP; Fri, 10 Nov 2023 08:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629981.982575; Fri, 10 Nov 2023 08:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NHE-0006xt-QP; Fri, 10 Nov 2023 08:54:08 +0000
Received: by outflank-mailman (input) for mailman id 629981;
 Fri, 10 Nov 2023 08:54:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1NHC-0006wa-Lv
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 08:54:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b353fb93-7fa6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 09:54:04 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Fri, 10 Nov
 2023 08:54:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 08:54:01 +0000
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
X-Inumbo-ID: b353fb93-7fa6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0MDxaTmCTuAKknKEW7lhauFvb2VtCvTZMv649XWL6bXrhlh0TNMnABtxr6Fy5KBoi0AmCfFbxGLdFlCRsRilKqK7+2K9Y1NVi+92dT+j/Me4iumUtd4TAdHN4HTbi6MiDFxadiktxofH/sAuYpV0ujclSDRJmAyC33sVvj8Fw50LQH0+roTlZoToeFdPK50cyKAMrVRctSEJeJnAuxx1yTNoGFAilVHO8wMjrr2mNcQu35SkAzwSn2vxINy3AsiFz3IH+bviwafZIOpI5E4rTw1ulIXqaGEaJyxWSM0DzWGxEgbjksfQxh6ujdPiLch8FuMYUAOGKLVYXT+wgOu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uwS8EQ9CkcWH+n9KkBP16NPb+wt9gGIoA9Hvva+wVs=;
 b=EksbzfQMBnAoeTpgEhkYR9kBwmUT4LOmf4dRGxRPoxsPn2wgr4LyPmCqDi2ucj0OfwJK2TBIFdvPljR0asUvZeRDiCzpIzl448WzsTvW0WQ0gHR69gMRD5ULMCIDO3hOIXi+MoO1mU1pi2288SRmflLLH/sJho5mXU9aMUZ5AwJy+IIsDx6GyrvqKbsS9cnS1B8VK4jCx8SBu9f73i8bjspfy2TBAd+KDxGESUgGyhoYj5xVQCJ1JhtreMQOxXLhm0VUw+6+7QPvDbKuewUrlboxr0zyt4qL71p0Zq2y02Demxfoae/fjnaAt6e6d8LaDWjxTYXbzrFBmlNV3CUTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uwS8EQ9CkcWH+n9KkBP16NPb+wt9gGIoA9Hvva+wVs=;
 b=WyXyWbXwk+gQ1ucmLiCLaZ5ik2KCxcspJGQJYaG5d1tObfu6YIknzveJcYeLKJW86Yn40/IVtzLUoVRYHtyOydsIw2LmaVkNgvZe3x7oAml0ocmBpYQsnoRtwM362/ac7lgKnlLmcTAjaNrL7EebufKNUoSt0guNR3wBOVRUzrm97QjcSurxgCkHblmlLWHn8Yiv+qPCprXLtuoy0NN1wqzrh9vNzgUUdHKbY5hY43UrHtrPdG4zG0O9EJTCuGOR3rz32GP2wiD/C+kJoLpPF8+U9KlaFQ8R1+gRkepcpIu+mrWHy8B9XWRNj1veiROG6Zrka+8IlMihsapWV87Gdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <119e2bf6-048c-e55e-af9c-4addb1d5c32c@suse.com>
Date: Fri, 10 Nov 2023 09:53:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 8/9] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-9-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231109182716.367119-9-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c849e94-8cd9-4f20-24e1-08dbe1ca95bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	au51vuzakzc00+RPQTovh8HABdAviaylMwi7ueV/rVCiUpLhhPD+/cn0SEhqYyMB4TkVRA9sX91WmGPGoNNz8pO6PUc8W/EP3WzMpPx8dnt10MKUCOXcW416lYLrjSkR85bY+PE2jIdyqvGb4KVUZUOSYbtjfBvZ9AGgR2FJM5DGzpFuodYlp6kXsvgQpFWFKOOUjX/Bd1uMjeSKfMmlltXa/VLVZJNys0wAVSgAAdKe/kzZhFDzDipDBA9FGapDJB6uj91O0iDHiigv/B0t3mZ50j2bioYuOZ8Mh6I2UBnkWjH7gR0yTtSBYMVGZRDhLrQtUcP/oqbHOh+xnjSa9MbZczMAZ+Y252qxGZcq6/k4RRcN/gx5jQqIwdeBYgMUyqmyc9DPInpK/bHf37zaBVh3tRENoLIQPdTzSC8lX0bmqYatd/qX3IUjdzIJYZzCa6l6c3+wmNjuAuRvS3Sb0JUCulP1KFnxfmdQt7E3VSvmpScAXVoociAFAomcWYanWLVA3X//RbPDTu4wngvkxIrWFnsD9WrGGYwYPlKPEDXIAnSIGcZgbdAtnxAj4n7KbYiFGGV4QUH0x6I/5xUd3wjFfK/JWmhIcC+x9jMzLEw95o4vZVPryeiZagRK5s1VNq5ukY1r5gmN9KeWBX143w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(36756003)(8936002)(26005)(2906002)(7416002)(66556008)(54906003)(4744005)(6916009)(316002)(66476007)(66946007)(8676002)(4326008)(6486002)(53546011)(5660300002)(478600001)(6666004)(6506007)(2616005)(6512007)(31686004)(86362001)(38100700002)(31696002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnYwZk5LcElXa0N5U01sKzRpbDI3QVFxUkdoTnRBMW80b3IybWxtMHZxZE1k?=
 =?utf-8?B?L1Vad3Yrc2g1N01PSnRlNWk2TFhidFFEdkQ1ZEVuTHRaek1hd0Y5YXIrdDFl?=
 =?utf-8?B?SmdEWUE3UEdMM1MvYVM1NjJwdmpRQ3pLWG9TUG93aENIRUxhNmVKZGtKeHlN?=
 =?utf-8?B?dzNMMURZQ2tpTndtTnVhUGhmOVg5T2tzcnI2NEJBekt6VWZhRXdyMTl2VjlR?=
 =?utf-8?B?M25mNGlkK0VtODEzMEhKQTVQRk8yQlNOTk8vRXJySzdXUlZVRVE5MmFMTWVE?=
 =?utf-8?B?ZGdwSWZKV1k2M3lTbGhoalFMMllzaE1ZRjBNR0ZSVldTRVU5cSs2WjQxWVRp?=
 =?utf-8?B?dHJxd0tLMnhNblhEblJ0T01XaDBhZFNCbmlXcUZDRFRaSzhyTEQ1aVBCbmFG?=
 =?utf-8?B?eE1lVFdKd2pnKys1RTdjcVZXYW1CL3phRUJIUE02d0dsVmUreldxODBsbEdO?=
 =?utf-8?B?MGZSRHVUL3FmWXdkU0dQYTE0ZE9jcVFFT09GL3BwM2RTNGxQa0YvVnFyVGlF?=
 =?utf-8?B?ME9jdFhYOTdVUGpKZ3NEczFxWlRUZ2dUa1l3cDkveWxYVFZHNG5VLzNRMGN6?=
 =?utf-8?B?cDVYSllKZXJCS2ppcjR1d3hDUXM3YndVVUR3c05ZdUV6RGFsRWVuRlRUUVFF?=
 =?utf-8?B?SkFWTzZxeE9kamhmd0NOeks4cVBjOGJQeE9WOGdEYW01NHZ0TmprSWpDTDBF?=
 =?utf-8?B?S2wvWWU0UEVUOWNaREdYbzZzUnpUdndXYzdISlFSc3pNSzN0OC9hdXVOdjJh?=
 =?utf-8?B?TVNZNnJ0QVluRVN2Zm05eEViTUY0T3l2d1BZTnkyZFo4MXorUndCek5kYkwz?=
 =?utf-8?B?RkxRWVpKYjRheThheDBid2hSZTJlZjc0aDdTaENiTDVNeHlMQmZHMkQxeHF5?=
 =?utf-8?B?NmVkMDVSNlc1Y2kyV1IxUUJOY0ZlTG5qWFp6YXlXZmFwSnFRbmRQSnN0aXFN?=
 =?utf-8?B?TDZNeTh2NW51TUlpajN1Y2Q0bVNmbmh3d1lHaDRQTUVoUnlJT3Y3VUNBZloy?=
 =?utf-8?B?UkNZV3NEejBlc1VNUFI5VjNiVGFjcUlZNE9VY0pMRlJ6LzhzRVNCL3dyYW1p?=
 =?utf-8?B?ZmJXZFZiYlJYWm1lRUttM1pXV0lUNFNpV29tUUZLSjFJT3dTYTlKZ3haOExq?=
 =?utf-8?B?MWhaVmpyRCtZOEpUNVQrZ3FDbGFNMnI5QVk3Q3RZZzBLUFBKaG1SZll0ZlBn?=
 =?utf-8?B?SzVVQ2V5TE1ONmxvakI0U0RtZ1BtaEhRLzJsZHhheDlEdG9LZ293TzRXOTEx?=
 =?utf-8?B?T0hJVEtkWGRNcWdTUWZ1Y09CUEwxWndKd1hIaHVMR2VEWEpqM0JrcUVjU2Zn?=
 =?utf-8?B?eTFrRC94VjBXT3V2L0NQa0NCQUczVnRVbmkzY2FhL0FOVjlaRlVrbmMybEJS?=
 =?utf-8?B?ZUt2SDZ6QldwUDR5SC80QUhQOVNoUklnclFxMjRaU1BlM0ZRNm1IVFZlMCsr?=
 =?utf-8?B?Z3NPeHo3enpNT1FrUWZ4UWZNQ3BHNHNkc0wraEwvS3NybWZ2T3NRbTdHQVB1?=
 =?utf-8?B?M2QzUmN6OWpnYTdpNVVGSnMyZFNCMGswQkc0R2FQNDRUZ2w1dEllRVJrWHlx?=
 =?utf-8?B?akdnTllBZ1I3Y05BbnRGVkxQWmxBNUdyY1ZhZW52d01neTIybzN3Q2xQMmlv?=
 =?utf-8?B?N1dJeG1VRUxqd29mR010YjBCSnRtMkZVcW9mYXF0bUZhQ3hWbkpuZnpzRXZU?=
 =?utf-8?B?cmo5M0I5aWErRUlpUEwwendQUDBmaklidEd1anp4MWlNeHhsRCtGUExMWTF6?=
 =?utf-8?B?cWUvQkU3N28zdjg1aXNVMVJkcHBwRkNhcnE5alpLVVo2WnJWZ2greXdRVytv?=
 =?utf-8?B?SXV5RDg2Njg3dm16UWo1Y1ZLNklTNkJnOGx5dlZidkpibVd1YnhIem8yL2V4?=
 =?utf-8?B?c3FublQ2T0hDNEFvSGJCbzdNQk9aTnZ1R0F6RWYwM25oejJPQlZaYlhEcDNZ?=
 =?utf-8?B?ZUFPbEhjUk1nNkRPSEVHbkJHRmFILzhJald4UHlCY2lGT3NBdjMyK3ltTUhM?=
 =?utf-8?B?MnliQlBTRUZpOXFPNmYyWjZNWGxqTCtxTnZCT3FrYkhVQnFWSTZFZ0M0bW1M?=
 =?utf-8?B?WWx4TU03TjFpOHZyTEVuMHZYNmc3UnBRNlU3NUJiYWJyY0V1MTNPM3liK1hC?=
 =?utf-8?Q?UiMXf9mz3xUnox0wteAs+HYeI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c849e94-8cd9-4f20-24e1-08dbe1ca95bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 08:54:01.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4016xaNKZMWPoFIjCqaIOyNOE2LkK8Nni40c8BtEHIKte8/QMlMqW50rFg0T4CXUNjooH65pGbbvg6YllneiMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716

On 09.11.2023 19:27, Stewart Hildebrand wrote:
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -18,9 +18,6 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node = NUMA_NO_NODE;
>  
> -        if ( !is_pci_passthrough_enabled() )
> -            return -EOPNOTSUPP;
> -
>          ret = -EFAULT;
>          if ( copy_from_guest(&add, arg, 1) != 0 )
>              break;
> @@ -56,9 +53,6 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> -        if ( !is_pci_passthrough_enabled() )
> -            return -EOPNOTSUPP;
> -
>          ret = -EFAULT;
>          if ( copy_from_guest(&dev, arg, 1) != 0 )
>              break;

This renders is_pci_passthrough_enabled() and Arm-only construct. IOW the
x86 definition of the function should then also be removed, for ending up
dead otherwise.

Jan


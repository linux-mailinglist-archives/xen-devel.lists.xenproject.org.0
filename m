Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE144AC64
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 12:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223886.386833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkP7e-0005mA-Mv; Tue, 09 Nov 2021 11:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223886.386833; Tue, 09 Nov 2021 11:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkP7e-0005jk-Jl; Tue, 09 Nov 2021 11:17:02 +0000
Received: by outflank-mailman (input) for mailman id 223886;
 Tue, 09 Nov 2021 11:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkP7c-0005jY-Jb
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 11:17:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e1b4ac7-414e-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 12:16:59 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-5zD3yDNyNuqaBKjGu2aiIQ-1; Tue, 09 Nov 2021 12:16:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 11:16:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 11:16:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0095.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16 via Frontend Transport; Tue, 9 Nov 2021 11:16:54 +0000
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
X-Inumbo-ID: 8e1b4ac7-414e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636456618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Q+8ODTp7u5v/Fccrsb7w//uPVkWKoGAWsfBRDCLCCQ=;
	b=NX/peM2GMCK/taUrgfdC57zdDIb60yKwkpKTrjHDzQ5KZrk7AQ69HYgyKVzilwcgY4N57M
	lZNyTlQz6kGwY5KQslsoEF0qAGNYtKDf/hgReTQglaRYjKssdyeSXPhJW6AZiYxu3DkVBU
	8bhO5IFijAZUkTtyqePQlxC3DbonywM=
X-MC-Unique: 5zD3yDNyNuqaBKjGu2aiIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vx05oZLh2du77kwlp+XJs+jPs6PpXtPYB2Y+Kb5ZiIHBthV+uXogz3huoMTbboEx3EuM4tjOyUVWfFwSncOZYKWfbuQq4iF1TirGNwcQCmCuAqx7NB3XGcoqBTr9+yUovP/PtKrxwVlR3tsyTy9bexhC+O1/1BtM94KZc0ynf0y8Ny6ZKsFBq9QJyt6r6nmwT6Iwaoqs+piRQgjcbWZsQ2dBB41vikLVsBqTLDcGORa4RzsrWpZXUPQ7G9uOwFWJO1u4R7xEkMPvIyfcNJbHXm7VsCm+cXxeB56n3/ybowgH9exChuLrWjSlSB6Pb9I/YgrGHAK637jMlCrw1ogSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q+8ODTp7u5v/Fccrsb7w//uPVkWKoGAWsfBRDCLCCQ=;
 b=AXNmbEYU32PHUyk2yf0ud3jC4laFpbbKvaOjWty3ujIRX3sKhKDlGH8SZOOuqEF+ylcUgymIVjfdPLkLnm5+OgC6EJm60y3QJNX28LV/gCyPAJnNlWGz983MN9D2M2z3bxTqPOZ8Ynn66UAGFsCCxk2tNu3cW8xwe9jrVw9ATiQsdy1ZrXZvBkQ38ha0HeYNU7UsTk8LLqUyc4gA6zXMwaEoEU+2TxOQxbCFHhRBxfF8bV8Fe7MnMBEZ4DZH2D1iarmNWW98arT8AqaHzsUHGrF5yTZlaeQgEXYP6byqHr4YAvczgjVvODCdA+rloR4M9Z9aNVIT6iYNlbEIOyOjDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3df9dab5-4152-77b7-55a1-8bfd4d91f9a5@suse.com>
Date: Tue, 9 Nov 2021 12:16:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [XEN][RFC PATCH v2 08/12] xen/arm: Implement device tree node
 removal functionalities
Content-Language: en-US
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-9-git-send-email-fnu.vikram@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1636441347-133850-9-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0095.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff83e031-21a8-484b-5a42-08d9a372704c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190AFD534C4853E353F582DB3929@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MIeOX+B1lTabsue4wKItREqqUExgZ1ChSOmjdhkuJ9CdFCByx+Ych+oIuoN5aAppsGnnAafqpPmocKkzmFV9mt/8crndnezdnJKM++OPrJzNjNBj7mpePupkfkaasYqpx4hGl8r5yf06m4HSg6RJ8ZEky/wLKs0jLOB3uam7jiqDScQeQFdFOZN2sk2Uk8XuBM0g40BMTo3FtRbMEWZvS51oT8yzkpjfcK9thtw+Wxv2aFF4UKn17biG74regqiYeIImktFb2exUR2paUYz6xOfHljYtEZOjHscT+UDFWVM0fY48pKVtIq0Iw0OJOpW8ni4FvJRoehZLuXTfcfIA2CUVm1PmgbHOslauqwuR+mzRqkm28Nw/MVjfvtgRJFCaKxnbLR7ZdRAPqyp6Myx2u9INdAYViST7cfN56szCkyeMHEU49h9lPLOVx6JvDP3pz2uXivwcCOlDYR3uxiXAxqeTTX3q7qdgvQBy0xVxn8V5U53I8/9LnH0Bjh5w4YtfaRedGvhIpkfHHdIX7AKtUskLJrKMbzDj8MIHZTnxlVtn91/Zj2TM3AF+8U2M+r8bIJrzZE068DHcbFUhATFbceX9CL54xLanBQ4SevCX3RMa5l5rAaZork56Et6yJQ7yYpoCVDUWLJra9uLrAb+12pAngXfm/wHkNmzWMUzr6iVamPRzqlhGD4fU+QT4wP0K51AsDDEU2CivXVhuBcRMz6zVuThWJ6Y2yh7LtEmh4AqUEoiIKPa9tqw19i4hdxHY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(66476007)(2906002)(7416002)(31696002)(36756003)(66556008)(86362001)(31686004)(186003)(8676002)(8936002)(38100700002)(5660300002)(54906003)(4326008)(66946007)(26005)(508600001)(2616005)(6486002)(956004)(83380400001)(53546011)(6916009)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFF2Z2FFMk1NdjVWa3ZnNkErU1pXRkFrWDg1VmUzejh5bmpyV0l0MExvTTly?=
 =?utf-8?B?dVl2ODFJV2ZaZm4zUHpabWtjWVQvMWE5V0k5VkFKNXRTS0xBVm1SYlNRanZz?=
 =?utf-8?B?TXVZUkhla3JTNDJYdjFRbjBLbmVaeTd3QTBrQVd5c2Rvbk5QV1NnY1hYVDBF?=
 =?utf-8?B?Mi9KRzhXV3c0c0hrVzNrWnU5eHhwMkFZdklQcUI3d3dGTDJxQjJxbHFTNFV4?=
 =?utf-8?B?MGI4ZU9nNHhiVTRuZkJyUU5LcW90aXArWTVqSFB0aDM4OXZxelBneCs3alRJ?=
 =?utf-8?B?OXc3WHN2UWhFc0NQQjBmK2pYakd3MnU2Z3pCNnJRRGZhV1ZQUGVOeEdkZHBH?=
 =?utf-8?B?SThpWlN4SkNEaFd0dGkxWUxTTnkxNHQ4NnN2L2tIMmh1Q0ZLb05ua0xhVWhK?=
 =?utf-8?B?UVB3R2xySGVLMzhwVFMrc3Fyb3ZORFI0RGdDRktVYTZWekxVdHZ6VmJZbEZK?=
 =?utf-8?B?L3hmRGdNSnJycE5Ha1g5RVRRdFRhUUhUN1JvbWIzMHJjZnY0UGVrNXIvTFow?=
 =?utf-8?B?NVJla0JhRGFFSGl4amZPSytYK3pERmhoRDg5enhPVGtJblRqa3loME1VSUJV?=
 =?utf-8?B?ME42RXZFU2RHVWpjc21BNFM0dnpSeldmbGRRdzRpRk5kdUorVXpEeThmSnhV?=
 =?utf-8?B?dTFmYlA4QU1uQjdKU0NZQ0FXd3pvUnJ2dFRUZmJnN2tDaXdwVGt1d0RIT2Uv?=
 =?utf-8?B?RW1MdFQvdkFXNVhLYmlMOWJPcE5VSzRKZWJPNDgra080aWJ4TU1HNjd6VjNT?=
 =?utf-8?B?dG1TQTV2blZpemVVYWRzWnFjWHJPTnhwcDZBTC9MRnRPanduT2kveVptNEVT?=
 =?utf-8?B?K0ROd29BVXhsS3F5SCtQa2NxMU5iWmg5NFQ2YWw2ZTVPYW9rdjlHVEhrbWtv?=
 =?utf-8?B?cG8rREZEL21MRFFPQncyRlFLeWJoekMva2Z4UElQOGZLNUUybkc4VVpmT2tT?=
 =?utf-8?B?MEdDQi9lODQ5cnU1MlBFWTZ5cklaZTZwRjB2Y0RaRVE2NisrS3Bka1FOS1Zz?=
 =?utf-8?B?SW41ZEVzSVJDWTZ4dHZVN241RFZSbkFhbzlwdWhQb2ErVTh0NmpTeXhlZVc0?=
 =?utf-8?B?VjM1VnRoR0RIdzRaTTJsN3Npd08yVDV2VWhWWkc5OVhuTTNRazVtQTNUZTNr?=
 =?utf-8?B?bnpNTjlGbjJMTXFnV3lvN2w1aTQ3TGl3b25wZkZvYUROK0dIaHI0MitlOFBY?=
 =?utf-8?B?alIwN1hqOURLYzdhaGJsUW5sMVloNy8wV3pjRkV5NXRBbTFSQTg1TUg4Sktj?=
 =?utf-8?B?ZDRzY1JWNGFEZjZaVC9oU2hCYlFxT3dIYmZ1L2wwM1BCSFRCN05aTkwxL2sw?=
 =?utf-8?B?QmJsdVc5TWZyRE9OL1FyRG9QcEtQS1Z6Q1BjUUtWc3dLOGs5c0V5UHdqcUJ4?=
 =?utf-8?B?Y0xtQjh4VENRQ24yTWdpWVEvU2tQZnZadWxVaTQ3ZnpwMmx1aVpTdmoxNDZJ?=
 =?utf-8?B?amdoeExTQ2xZa0Rqc21nc0RNbDZNWmxTSER5bUROMlkrZ0Y5WXNkWmZ1bHZZ?=
 =?utf-8?B?b081TXViWno4akJXQjd0bHFjWUhwejFLZlMxWVd1bnRHcWJnSk9KS0hYclJn?=
 =?utf-8?B?ZWpzVUU0dVZuNWZ5K2VvbzN3cC9ZeU1ZMkVXUGE4T2s3b0ZoL0Q4d1RnenRI?=
 =?utf-8?B?MlVlNjJ5QzJBbnlDZXpGbVFpMzhVdFJUNUtSKzVNbjZ1Q3FlL1ZVRkN2YkZK?=
 =?utf-8?B?QzVmWmFNdWtNT0s2MWtzTjZwNExEOWxjdjhnQzYxaUZ6dW1GSExkajZNSHlJ?=
 =?utf-8?B?TTdzUlFSK3RmOVQyRmFMNU1oVnA4a2VuVktOWFBBSkVacjE0YXJIVlh1WXRM?=
 =?utf-8?B?OXBOdndjc2tHSlNkOTR3YjFFUHBvdHgxUGhoZEtURkpEVFIySUp3ZE5MUmx0?=
 =?utf-8?B?NDM3Mlpoc3lkNE5WVDRVSy9TOWpVREp1Nmp6ZkNJSDgyWkd5RnlFMU1yS3FE?=
 =?utf-8?B?UUpDU0wyeTRvenk4MkozZkV6MWtyNXU4VWh3NjBBUVQxM0lORFNWdnlnNzdF?=
 =?utf-8?B?TWp1WmQ1WDMxZ2NVM2d4ZzR3djZLaUNIMDEwZHN3eTF0LzE4Q1Z6Tk5GV1pG?=
 =?utf-8?B?TDl1KzY0S1ZZeE0xZVZ2Yng5b3ZrZTBCeUVJTW96K1ZWN0dRS1lzRHVOcmo5?=
 =?utf-8?B?d3hYemgzb3F3Zzd5M2pDcnNyalIwb0xrM2JIMmo4VEpBZEhGNThZNWhTNnF4?=
 =?utf-8?Q?ghUkfM8o4U8FPx+cODBgL8A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff83e031-21a8-484b-5a42-08d9a372704c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:16:55.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYInl03ZjM6TrTGvKmu7V877I6w7P7MSTlBtcIeCqGsXMCt77QATdn/yQdFOok8CahM+xqVQOYAv1LmglbFEmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 09.11.2021 08:02, Vikram Garhwal wrote:
> Introduce sysctl XEN_SYSCTL_overlay to remove device-tree nodes added using
> device tree overlay.

XEN_SYSCTL_overlay is too generic a name imo.

> @@ -476,6 +781,73 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>              copyback = 1;
>          break;
>  
> +#if defined (CONFIG_OVERLAY_DTB)
> +    case XEN_SYSCTL_overlay:
> +    {
> +        void *overlay_fdt;
> +        char **node_full_path = NULL;
> +        int num_overlay_nodes;
> +
> +        if ( op->u.overlay_dt.overlay_fdt_size > 0 )
> +            overlay_fdt = xmalloc_bytes(op->u.overlay_dt.overlay_fdt_size);
> +        else
> +        {
> +            ret = -EINVAL;
> +            break;
> +        }
> +
> +        if ( overlay_fdt == NULL )
> +        {
> +            ret = -ENOMEM;
> +            break;
> +        }
> +
> +        ret = copy_from_guest(overlay_fdt, op->u.overlay_dt.overlay_fdt,
> +                             op->u.overlay_dt.overlay_fdt_size);
> +        if ( ret )
> +        {
> +            gprintk(XENLOG_ERR, "copy from guest failed\n");
> +            xfree(overlay_fdt);
> +
> +            ret = -EFAULT;
> +            break;
> +        }
> +
> +        if ( op->u.overlay_dt.overlay_op == XEN_SYSCTL_DT_OVERLAY_ADD )
> +        {
> +            ret = handle_add_overlay_nodes(overlay_fdt,
> +                                           op->u.overlay_dt.overlay_fdt_size);
> +        } else if ( op->u.overlay_dt.overlay_op ==
> +                                        XEN_SYSCTL_DT_OVERLAY_REMOVE )
> +        {
> +            ret = check_overlay_fdt(overlay_fdt,
> +                                    op->u.overlay_dt.overlay_fdt_size);
> +            if ( ret )
> +            {
> +                ret = -EFAULT;
> +                break;
> +            }
> +
> +            num_overlay_nodes = overlay_node_count(overlay_fdt);
> +            if ( num_overlay_nodes == 0 )
> +            {
> +                ret = -ENOMEM;
> +                break;
> +            }
> +
> +            overlay_get_node_info(overlay_fdt, &node_full_path,
> +                                  num_overlay_nodes);
> +
> +            ret = handle_remove_overlay_nodes(node_full_path,
> +                                              num_overlay_nodes);
> +        }
> +
> +        xfree(node_full_path);
> +
> +        break;
> +    }
> +#endif
> +
>      default:
>          ret = arch_do_sysctl(op, u_sysctl);

Seeing this call is even in (patch) context - would you mind clarifying
why you don't add the new code to arch_do_sysctl() (perhaps by way of
further forwarding to a new dt_sysctl(), which could then live in a DT-
specific source file)?

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1065,6 +1065,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +#if defined (CONFIG_OVERLAY_DTB)
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +
> +/*
> + * XEN_SYSCTL_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_overlay_dt {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;
> +    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
> +    uint8_t overlay_op; /* Add or remove. */
> +};

Please make padding explicit and check that it's zero on input (so
it can later be assigned a purpose without needing to bump the
sysctl interface version).

> @@ -1125,6 +1145,9 @@ struct xen_sysctl {
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
>  #endif
> +#if defined (CONFIG_OVERLAY_DTB)
> +        struct xen_sysctl_overlay_dt       overlay_dt;
> +#endif

No CONFIG_* dependencies in public headers, please.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7950E204
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312968.530390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niytW-0004YG-LR; Mon, 25 Apr 2022 13:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312968.530390; Mon, 25 Apr 2022 13:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niytW-0004Vf-IP; Mon, 25 Apr 2022 13:36:50 +0000
Received: by outflank-mailman (input) for mailman id 312968;
 Mon, 25 Apr 2022 13:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niytU-0004VX-Jb
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:36:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c11011b6-c49c-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:36:47 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-nEIQsjezN4GN7ckBup66hA-2; Mon, 25 Apr 2022 15:36:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:36:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:36:37 +0000
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
X-Inumbo-ID: c11011b6-c49c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650893807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJjRhj0zC21ekkO4MkALsPFI8gwH5FzS2z+xka8dvOo=;
	b=FEI0JosRSsM92NyRBKPZ0ENocp9dCPDmptUuGlM80J2jZ138N4w1VvcDzEltsq+xPJ9NzT
	dWhrjuXx5tqgekittScejQviSEB3cD2jEzZ5pTEczSJ4hHPNoJOrI5wiM8j08laBRTh9H8
	Gsl2iSgglO8xaf5lmDzKx6Oqp+k+lNo=
X-MC-Unique: nEIQsjezN4GN7ckBup66hA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iypJsdzCf/Pc4GpKjAp4tXANFj6VXrTn7sl42q1pmNOmL+bQgLoIKrGXBcLL4zXy1ZXsRCkbr3EgYdQGv/zNCfJiWwF8PijX9nXM6q1u4M3v11eAi/zI/tcXuivMEM71k/YfXbtbmIId/r1J1SVHTKzy0rNY9MUwUtAEYC++p5T53nRaJBVtnZDFQnb1wHPux+0XTsuyOOq9MIzl9ijJ4Dtaa7pccOi/9/jDGBDCv+KsCGKw7QLVIImH+CQEII1e7dD71CY9kfwNxNVxTPHAUoZy+/WyaeITlBvorbgT14XXP6oQ4Ls4T/xIdtUxIw5Gf33sss2+PPlUsn4bNNrgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJjRhj0zC21ekkO4MkALsPFI8gwH5FzS2z+xka8dvOo=;
 b=iBFhZqVxh/H58Oc4BjJkXWZWodY+xJmbDbx/TpqzFcJOyFPLjOnBTQ8wc4zZRbGOL3SRRIW8DPNoKj9CJpVRggFESOPb36xBQ/7nbyE8dTOM8Zse453TuWSLKm3YsXu+Y6cZzGDPlZTf2+kYWYHUynswirYUWdILLgDdwByO7lipiV4cgr/wOrYB7QkeEC5AVvPm7rl/3BJHZ7TbfpxseuXSWc9yfe0mhxo81OZFl3g8+irb5Qj1esoh6y7HKs1V7nOKvPCyiZb8gU81ZTHWT0E+BE+X0G1E9Aj2+npS244NPFfzXUVqnX/zYkcdt7KGLLFGlIQ0s+dGcm84vvJcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <704c371f-ae25-e2eb-dd90-67493a16fe1b@suse.com>
Date: Mon, 25 Apr 2022 15:36:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220425123717.18876-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425123717.18876-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab8ad33-2808-40af-b7e8-08da26c09f01
X-MS-TrafficTypeDiagnostic: AS8PR04MB7991:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7991035FF1EDE06354521474B3F89@AS8PR04MB7991.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ltw+qS7bPoQgJAbqWvjm/cfD9B1i8BzqMygTtjuM540MPojTBumQYjk/Dqe91SFxL0mN801WNEmc2kNJM+Z8luw5udIlUrvj+cLcf3ENDkBn51LzVB4dgbxQMSvEBh93IkCgcVU9ZUO6DMBASQOu7U2h7f4bfovR22+fzn1eoP0r2G7MbYD6G5AfMcn+TuTEbNODNWkwjWNABoiADslLc0bodsh3kshTGbD45+F7lXsuaG2Y+bxhYI6ZUvObWeWoRjoxSA8oQYHpQ8Nh4oZCD565tcscrHHOShCpwDYS7lnx8e6KcNJI78eXnZN0NSOXIZFgAGZq/nYcgdc8Y/TQ/Hhl8kNOwekpPZlzE4xVN/2nEVvhhpHCKgsCKDfE/mdLv0XfaZfBMOvFqKQaoynoeNCqT1FoSD2YOQ03vI2Bj0/pmOE9paSbVzglohmp4U22GT4TmrgJfEzTDNx5VU/6/bkKMxe2aj0EUJIK+aNcp7NL4HUKGAI9BuTsYPUWWSChztfhFnCBi+kvslg6lDSjsPI1qX3oIuH1NvxH76Lzt69X0VU0hfOrzH83IxGuvNKazVj7uAK/S1odXrty8DvE7AyaFNFhG0KdIiDQI5nRqBbBlupRKcnFXMv7b+JzaGOOJ6byDwZUPdmXBhVfCe4SQ5fuUtR99PSALVhSJqRnO2Yi1036zJxX/1RIVEvCXafOWkyOK2IL8pfANrJ9Id3ijGuJnJyNaViV7Czdmkz7sF4R9ERpVNKGxR+G1re/aXfX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(8936002)(5660300002)(8676002)(508600001)(4326008)(31696002)(86362001)(2616005)(316002)(31686004)(6916009)(66476007)(66556008)(66946007)(54906003)(38100700002)(83380400001)(36756003)(53546011)(6486002)(186003)(26005)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmlOUzdQOHpyTVowOFMrekVRZDhIREtpUnBzT2l1NzRuNHM1Rm5XM2xXT1Rr?=
 =?utf-8?B?RUMvUWRCZ05xMlU1VjVkbjVDYmVXSHlEYnVuKzM3NDMvODZsNnhsRktncmNz?=
 =?utf-8?B?OVZheEpaYkZJY241YTdtT0xiaWVGTVdaVXluYUQwUmw1OXZPYlMrU1dTVXJy?=
 =?utf-8?B?NGY2RnE4MjRWbUJVaVJxVlRxUTM1RkozZktFV1lOR21aM01rUzdlR2NFckRP?=
 =?utf-8?B?RVNPVUlBRjh5WTU3SWZ5WngxQTNMSHZYTHVkeTJTZGVuZUQ2aHJkdmh2QTFh?=
 =?utf-8?B?Vmx3NDBWdXFIUEkwWjNvckdrVVhxQUNaNzBsSlRIN0JVdWRiYTBMUjludnNu?=
 =?utf-8?B?RXdpTUxFUHhENmtBMElXRTV1VWo0ZFRzRTBBQWtyZjNIcEZyMnlUOW5Gb3ph?=
 =?utf-8?B?d1NLOU1SM25zQ1VUSmhLdEh3czYxMmVvNSsvVEhObC9paW5NaVhUNnM0Y0Z4?=
 =?utf-8?B?K1lwdDFvd3Y4UDZ5QmZLK1VrK2VkdkhIaDd3Z2ppVUhNam9qUDZURE5vaEtQ?=
 =?utf-8?B?YnBZN3Y0YkRrN1hDMHQ0WXovUGNlUkRkL3J3UGJzSjFOd3k2VmNUMG5ZTHJY?=
 =?utf-8?B?eVpaaE9TWGZLUE5JblVrdk5KWEhEVXdtY1E5SzY2YWVJd21JTHpGekZIbUV6?=
 =?utf-8?B?UVJZNU5wdE5vSTBxN2lnSmN0YzlqZVdsbmN0LzlUSzZRaWhjWnlmenY0L21Y?=
 =?utf-8?B?ZlptM1YzVVhleDJCM2dMSXBVZFc0N3puTHV1VEJYQ2tWZWhrN2tlSFR4a2xj?=
 =?utf-8?B?TjFhSk1lZTgzQm5RQTBwME41bEFSczJQcFRxeGNZandaY0NkYnFER2d1K3pu?=
 =?utf-8?B?UUpmalJ2eWJXNm5lYzFJNmJCN3BFU1EySEU1OTRyVFlhMktzdDVHb0FaU242?=
 =?utf-8?B?VUtQMlBseCthOS9HMHliYjdCcEtKcnRUY1E4REN0cmFSUFF3ZENxdCs2bTVV?=
 =?utf-8?B?Zk5QcU5KM3J2NjlmVXpXOWs2SVdMYzNWSmNLR0w1anlPTVJTdmQxOTZnRnl0?=
 =?utf-8?B?N25yRXpFS3dyTkZGNDMxMUZCMEE4eTFtK0JYOXdKWmp5d29SMDlEN2FwQUNC?=
 =?utf-8?B?bzBCL2l4NWZTalJacWFlNTl0cVBOQjlaZEcycGlsRGVSdnFybkpxWDEwbFA2?=
 =?utf-8?B?OTEyUHdGK3JRZ2cyYURlWEdibXB4eU5FaDJpQ2lrY2x2Zk9lbUdLaEtoL3Qy?=
 =?utf-8?B?cnpiK3YxNUlsVkd3YVpmb0FWRk5SM25ZTGxYbE02QjVYRFQ1WUtpdVB6SVNn?=
 =?utf-8?B?WHFUTHBQOHdyQWZqNHhxZmFZZHAwc1pCeGRJSnJ2Um43ZDJmb1pRTjI1MlQ5?=
 =?utf-8?B?cmlyY1JxcE9lUjhoSW15dEpHWHE5T1ZPQ01PbEY3S0dqTnoraXg5MDdHQXIr?=
 =?utf-8?B?UWc1NStQOTJtSDdrOU02cGkyaHJJM2YvbC85YUs1eW03QnE0SThxYTJrT3o5?=
 =?utf-8?B?blphUkFVUlYvY0YxY1RSSnVhOGorSEFIaTcrVUdFYjh0NkozbmZSN3NoNmc0?=
 =?utf-8?B?ZVhKTHQ2dk5SSzB5Y21iVDRSeEdNNTB5UFZRM0ZTb3RMbWFBeFpQYXI5ZVZD?=
 =?utf-8?B?R1kxcm9mN21ic2tYbUxQOXhqYmdQOVhKNnRwZEh4eTJVTmc4S1h4b1VjVnVm?=
 =?utf-8?B?YnZ4cXRiQzdYSGVLREVnSW40MnBpdlFBYStzemZUZ1JORzNzcXNvTnhHanZr?=
 =?utf-8?B?dkRXSDQzSHR2NzhKVGNjR3ljaHVkWjJJcWc4NjJUZTN5Z2JBc1dDTEE0Y0V5?=
 =?utf-8?B?KzdndjJkdFdraFNJcnJpK2NONkx3bEd4bjdmUU1PSVBIVnJyU01NMGd4OHVS?=
 =?utf-8?B?YTZMSzd0YWxJUkhQSEFnd3N3R1dTdklXYXNuVW9teGhhK09ONFhqdkZQTXg0?=
 =?utf-8?B?RXErNXNiUWlUZXJ3UDZBYTBYcFVqN0lRNlkwU0R1YkVmQ1pvRkZCcXBGTHIz?=
 =?utf-8?B?Q29WdzR4S3ZLckFzVlFQMXI0RUZQaldvY2laRGo5OXBZOW1ZemhFSFE4VlpM?=
 =?utf-8?B?TlRnbGtyTldyb3N5THkwRGRvTGdtV3BDL0dWQWFYUWc0WnRlWUZqQmY5ZUx0?=
 =?utf-8?B?ZjVRN0YrWGhwTEI1TTlqcWpYQWQ4YjREVWFhdGZrc0RYNnE1OGtuSm1DMWht?=
 =?utf-8?B?UWRoOUpaeTJ5RWFsSzlFWkk5S04zWTBmMitKSnBKRnUrY3Vxbmp1TzJJRVJS?=
 =?utf-8?B?OHR4KzkrYU1ZMHhibVVHajFnVGVHSEY4SCtLc3VXeVZTTTFldzNVOERNOGxZ?=
 =?utf-8?B?QWFrQVNCVHVjMmtkT0hlUFpFbE90SDFjS1ZLVTR5djZOajZmNHZIYU9JclV1?=
 =?utf-8?B?cE9FOG1rUUJGMnFXaDRsbDUyU2RTQkg3MFI0SXAyWEtHZDZiclpiZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab8ad33-2808-40af-b7e8-08da26c09f01
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:36:37.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDzzkoCNdeV2Y9tZsh3uFXLwQs4O04R3+N9U86RaAcW6T7iVv484dg8mfjUz5vY1wHZRjHseJfTqcjbHNQgGVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

On 25.04.2022 14:37, Andrew Cooper wrote:
> When CONFIG_GDBSX is compiled out, iommu_do_domctl() falls over a NULL
> pointer.  One of several bugs here is known-but-compiled-out subops falling
> into the default chain and hitting unrelated logic.
> 
> Remove the CONFIG_GDBSX ifdefary in arch_do_domctl() by implementing
> gdbsx_domctl() and moving the logic across.
> 
> As minor cleanup,
>  * gdbsx_guest_mem_io() can become static
>  * Remove opencoding of domain_vcpu() and %pd
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Technically
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Yet as mentioned before, ...

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -816,71 +816,12 @@ long arch_do_domctl(
>      }
>  #endif
>  
> -#ifdef CONFIG_GDBSX
>      case XEN_DOMCTL_gdbsx_guestmemio:
> -        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
> -        if ( !ret )
> -           copyback = true;
> -        break;
> -
>      case XEN_DOMCTL_gdbsx_pausevcpu:
> -    {
> -        struct vcpu *v;
> -
> -        ret = -EBUSY;
> -        if ( !d->controller_pause_count )
> -            break;
> -        ret = -EINVAL;
> -        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
> -             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) == NULL )
> -            break;
> -        ret = vcpu_pause_by_systemcontroller(v);
> -        break;
> -    }
> -
>      case XEN_DOMCTL_gdbsx_unpausevcpu:
> -    {
> -        struct vcpu *v;
> -
> -        ret = -EBUSY;
> -        if ( !d->controller_pause_count )
> -            break;
> -        ret = -EINVAL;
> -        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
> -             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) == NULL )
> -            break;
> -        ret = vcpu_unpause_by_systemcontroller(v);
> -        if ( ret == -EINVAL )
> -            printk(XENLOG_G_WARNING
> -                   "WARN: d%d attempting to unpause %pv which is not paused\n",
> -                   currd->domain_id, v);
> -        break;
> -    }
> -
>      case XEN_DOMCTL_gdbsx_domstatus:
> -    {
> -        struct vcpu *v;
> -
> -        domctl->u.gdbsx_domstatus.vcpu_id = -1;
> -        domctl->u.gdbsx_domstatus.paused = d->controller_pause_count > 0;
> -        if ( domctl->u.gdbsx_domstatus.paused )
> -        {
> -            for_each_vcpu ( d, v )
> -            {
> -                if ( v->arch.gdbsx_vcpu_event )
> -                {
> -                    domctl->u.gdbsx_domstatus.vcpu_id = v->vcpu_id;
> -                    domctl->u.gdbsx_domstatus.vcpu_ev =
> -                        v->arch.gdbsx_vcpu_event;
> -                    v->arch.gdbsx_vcpu_event = 0;
> -                    break;
> -                }
> -            }
> -        }
> -        copyback = true;
> +        ret = gdbsx_domctl(d, domctl, &copyback);
>          break;
> -    }
> -#endif

... I'm not overly happy with the retaining of the case labels here
(and the knock on effect it'll have for other subsystem domctl-s),
so unlike usually this R-b isn't implicitly an A-b. Which doesn't
matter in practice, aiui ...

Jan



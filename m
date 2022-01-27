Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32849E560
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261533.452943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6J1-0001i2-Lg; Thu, 27 Jan 2022 15:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261533.452943; Thu, 27 Jan 2022 15:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6J1-0001eV-Fv; Thu, 27 Jan 2022 15:03:23 +0000
Received: by outflank-mailman (input) for mailman id 261533;
 Thu, 27 Jan 2022 15:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6Iz-0001eD-VM
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:03:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4419e913-7f82-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 16:03:21 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-_WFbRH74M6CLUq2D5yVjYg-1; Thu, 27 Jan 2022 16:03:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6759.eurprd04.prod.outlook.com (2603:10a6:20b:d8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 15:03:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:03:16 +0000
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
X-Inumbo-ID: 4419e913-7f82-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643295800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tAsZ1INTzuG72sYTQK15mT+SFnZ9SnW+BPZRRBe+xys=;
	b=kShq4aDLZlT/UcGBEaGyvJR1zpN/PqxRM4MQxpRtLSnhM2kJhIFsa+4zI4vLlDz4g2S+R3
	nfj7DjCU5U5LtydoSffi/P8dOyP6Dj5VITspy1/H43pYqgwgGLbWEJBZ+9XO4uddSWTvLZ
	LAIYynORmokd5FBDu210Vi5uJnbGK8w=
X-MC-Unique: _WFbRH74M6CLUq2D5yVjYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7erZQjzedGN+JaOrPrSkxKyekOrWP8Zz8X90u0Gn3+++Lit4q3v434GSXZ0uCp54NeR0Z4qECAEW7JaQz8PI2ZCcFPaKAc9+OZog5LPMlCY7jHrv9+umUtbYE+WZle2kmXzrKndmf+hqmGNUQy/Nl6ZkCix7pFbk2rUc+xJw9ArOmFbBHpZQ9rM/ynDq2NIdyX6erOSYnUZjbuGrBsQr02fx94kh52Mb8aJFqbKKVRdOA/RbO0BCkvLMIOyizw5/7MQscRfkb4k/+09aHoDsXsMkjofZeGbdx2mNG+7ljPjyRnK5gSzIc2zzbHRFcUMGZTXCxl9RenOQBsegnSQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAsZ1INTzuG72sYTQK15mT+SFnZ9SnW+BPZRRBe+xys=;
 b=HeKMnRQpRYnPU3/qEFHF5UqM9er4I8SDgG80rti3Tc8PFD9/kOO72wo4Ti1QZVvgaBW7w7o9OEhgAzSEIgazh3Bpm2qQtgIxginnWos0CB1e+raOEQrtLvVRGbFrXcDBLSrRDZO0HtQpLvU/xAKiGX4gFwDpIevqGQptgNS42wfvnba+CxUO3ZhDPhyqjySCf9x1jrD+w8zCz3YgMuYbR2nZDqRPO6xnjosZZuNzvxFVRyjHWlYQFB1CElDlOvYTHwg1oTVM6xLrZyRecxsIZV7HUggkNx1RR3tuYcPnaDyC+RQc5Bf5c1dF/XtKqkkFjmUdHmsd5dHpvnhi32cT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb29d7cf-17ab-8fc9-cc12-789ba5cd0ca1@suse.com>
Date: Thu, 27 Jan 2022 16:03:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Ping: [PATCH v3 2/2] x86/mm: tidy XENMEM_{get,set}_pod_target
 handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
In-Reply-To: <8cba4cd0-d218-da1b-dcea-4cc3047c0946@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0064.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa19871d-4b5c-4e98-e0a0-08d9e1a625c8
X-MS-TrafficTypeDiagnostic: AM6PR04MB6759:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6759BDEAA0F10A88E953CD8FB3219@AM6PR04MB6759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QWLX8J78Bo+tK6rsqSHaqJ40FUCfoJTQkB3nlM4W2YbVKmgYbqacCoDbcNrjPp/5oo4DsMnz3cwfQEEhJrO1gFMiM030ghnMD20BC9fu0fhhbloPHN90iq9058s4+OwlhlmfR3aNGm93vfQiH5UukKOvdH6nCSvTOJ1xSTsSpOzhigdYyzmCt+m51xNrZvYR7hKX/ypR9J/7GGqPV2kYZJ+XNZ7DBtO+6PId690JBUZIbfZRhGSmiaJIN1Ip6uIZc4FzVcQ88xJ0/4DZxLJl4/3LEeghmz98ox9Pn7UhUhDPNzuhi7yzQdYHU5+C/u3FfisiLP20c6oubQrVMkcpqqT97BHkbj12xmsj7aU/qn+VW8iYTLqxvzLpVLXmycy3tAL+kDdNPRWQShWLaIojnY5EVzOATi7L9hEyh+3d9oul9BqEF2n7acS4f/BQ5yr2bNE/qb7mon6J1R+yNtaQk7axFUKl4BrGiSkgvkf4qU4rNUVF4MhSY3ZtWAk46u/vruLTmEGTNlMWDzdMuhaLrsyhp1sGyppbIFn0xhnBTCVYqSvQbimEW/eHS5iO4yjBLwdsOS3h4urPlcQdg8F9BqeJ4XEQoDTqQwSJ2uyq4rOzOjIAJRK5AoJ8TYs3HX3IuOEIwSitSw7lLaJqY7OO0FeN6HQnWYdPcY2TFrcg4+xlem3eKRqH52KEe3lNWVNdY802UxEYiZ96VM1UUiFSyZ8us4WpHPRmT7EUa+I9I4SJ1vi4h1DoNauyRp+EO8EK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6486002)(86362001)(31686004)(2616005)(36756003)(38100700002)(186003)(26005)(110136005)(316002)(6512007)(31696002)(508600001)(4326008)(8676002)(5660300002)(66476007)(66556008)(66946007)(8936002)(2906002)(6506007)(83380400001)(53546011)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU8wUWhsQVdXQzRuOUpaVEU1T2kybkZkMFJaaXpTK29oazJWcTF0MUlYTTlz?=
 =?utf-8?B?SUhDLzhGcUpwSzdLUm1kWkh0a0c2bkppZk5laG5zUkh6L3RjR091alFWdWxM?=
 =?utf-8?B?NFQ2c2dzQ0FOSk1kS0hFK2RDMjdoTmd5ck83dU02NnBzUWtReHh2OUZOdFI5?=
 =?utf-8?B?cnkvdkwxUnUrT1JsSTZwRmFkYm5hSEdtNUVUNVNzT1dkQWJjd1NPRytPZlJj?=
 =?utf-8?B?RVR4N3lsckJIdU0yYjdXVnIrb0wrNkhjTmpSMmp5NnF4bnZPMHl5RUoyTEFj?=
 =?utf-8?B?aUlLQjNBTXlBV3kxd1JnUXp5YWltRkFub29zK09jQXFKS1NGQ21MNUgzajB6?=
 =?utf-8?B?dnZqeW80c0JyZmRTbWtoQTJUWHIrVU1BTDlJdnp3V3c0OVMrdVdJc1RJYWk2?=
 =?utf-8?B?d2ZTb3A0WTRkYmJIQXRKM0FkNzVRSWZ4cDFGVkpwTXBiNG92eUxOeHY4Z1g4?=
 =?utf-8?B?WmVhd1crOVpXWWQxY1VDOE5ZM1g1N0xjZ0tKV0ovMDBUdFVUQUtNM1I4M1V2?=
 =?utf-8?B?ZHduckJFR1dmSUk0SFFQU3dzeUJjWFRORGcxcEdycHc4cUw1ejZ4SkhCL1Nm?=
 =?utf-8?B?dDI2U1ZHcHRFUXhkTjdrWWFlbWFTY2ZkdDZRNzBqb3A5Z05GNlpNOUZ5L1Bl?=
 =?utf-8?B?UDZFbk1FMi9SMmJTdml0NFFFVTN2ZUxzeS8rWWRjV0djU2pXQmNNVWU2NlhT?=
 =?utf-8?B?M0wvNUtwdG55QlJLMFowZ2R5UlpONmhEWE9WZUV3b3ZOREZ2QVJMclBiT0Vw?=
 =?utf-8?B?NjVvcjNsdWJlUnA2ajYzN2hEczdJZ2s1ZzVEdWIya0JodDdteCtQQ21SY0ps?=
 =?utf-8?B?b0k2M3J4dGdJTGRWbUhWbkVhRmMvNERiSit5bjZzU21lMXRMVEh5SHJ6d1RU?=
 =?utf-8?B?QVRRZ1hUYjlNdUx5WVQyc2RyVXlXSERPUUV5Z3NhYUJMVUtKT3FBQ3ZOZ01X?=
 =?utf-8?B?b3l1NnUxek4vZk1EZnBQV1NndlFpZzZxckJNb0U4bEJHTVJuSTlzS1ZJOHJk?=
 =?utf-8?B?a0VhSlJJL2JHRi9ibjE3MWRrUFpyTW13QUFsRjRxR2tHeGh5Wk9jUW5GUzJZ?=
 =?utf-8?B?NXRaL1krSi9ZWnFDQ25ZVVIyaEZING4rTkFySjFpb1FRS3l0U1FqbHVaNHRt?=
 =?utf-8?B?eUUrTStCVWU1bVA2S05iall5bHltaE9nMzIyOG9ENkFqRXk1cGQ4U0RJbHZk?=
 =?utf-8?B?MlVFK25scFY2UllvY0RNblkvanVVRkM0NTFLMFF3OGhvVUR3aGxheE11RGpq?=
 =?utf-8?B?WmtEUTFibDljaXNid1pxcEdEbTJsVlB3UWpFOVNYRDc0ZEg0SXcwRkFLU0pl?=
 =?utf-8?B?b1d3R084RmxKVDBpR0JuU1orRHVLeVdybGVtOXNtclZyTUJUMGlmRFo4TDdp?=
 =?utf-8?B?dnBOSDJXT1hKZ3RiaFUxMmVkL3VqUzVxemxNWUFvRGl2Uytaamt4VjV0V3lL?=
 =?utf-8?B?UGlNajkvNGY4SDl4dU1QMUFldXR2b0VVSmE2dnp0WGc0U1l0UExEMHF5aXE1?=
 =?utf-8?B?VHVENHFJMERDT25CbHEzdmV2Sng4c1B0UGxBUFlVUHBNcEw4eWtiODYvMjU2?=
 =?utf-8?B?VldlU2lKTTN3cXhOd2pSUDRJWHNXdTBjTjRwdDgrL21ZVlkyVHRlaG13WGla?=
 =?utf-8?B?NTZmMUJQTTNZZGdoUGlabHJSOWVQRlVWZ0ExRjFPSEl1SFpaeGc2V2hBYmVw?=
 =?utf-8?B?VXR4Smh0UTJBc25ZRm9OTG54Vmw4UlRkdEZzWjFxNEprK0FaUm8yTXBlbEwx?=
 =?utf-8?B?Lyt2cC9sNmpoOFJ6SmtFMkpkb0tIdmJzZlpsSEVGRmlwMzlPWDhqYUxwYVdM?=
 =?utf-8?B?bjZKeTgrSWtGUC9rWHVMRFJqOTl2NlpHalE0di9KeVp6SSsvcE16UmV0SENo?=
 =?utf-8?B?M2Y3alRnZ3Q5S0R1bFNBK1V5cXV2MnVJMk5sQW1RK3NJaHpPUmtzVVQ4b0xU?=
 =?utf-8?B?V0V4MFNvSVdZUlRDZnJmck5ZQ3JOSWRDd1NoaWVrdjFlbWJSakFQcGxxczdw?=
 =?utf-8?B?Tk1nbGJ2ekxNdGxGT2Y2YWFkOGFHaWl4SlpFTUtFZlp1VUorWk5oQzZDTHN6?=
 =?utf-8?B?TFI4S05JZHJLNnptSTZwSkM3eGhFeWQ5dGlGNFRBT01wOUxDbnVsQWQvOUNK?=
 =?utf-8?B?V2pMaDU1dWxNWGlNNTlvOC9YZExqVlBPRC9icXVCR1dvSGRHUTU0ZUxCNTEx?=
 =?utf-8?Q?y6oDe8Qi2yuXApcTjhPy7y8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa19871d-4b5c-4e98-e0a0-08d9e1a625c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:03:16.5940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6CvT81LZhcOFjUbXngHFLykn25o7onyuKZCrPKS9GMA8BecwsHaRCXYOw5IjUJMcP928DTucikOQBRZXWFbgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6759

On 04.01.2022 10:41, Jan Beulich wrote:
> Do away with the "pod_target_out_unlock" label. In particular by folding
> if()-s, the logic can be expressed with less code (and no goto-s) this
> way.
> 
> Limit scope of "p2m", constifying it at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ping?

Jan

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4789,23 +4789,17 @@ long arch_memory_op(unsigned long cmd, X
>          if ( !is_hvm_domain(d) )
>              rc = -EINVAL;
>          else if ( cmd == XENMEM_set_pod_target )
> -            rc = xsm_set_pod_target(XSM_PRIV, d);
> -        else
> -            rc = xsm_get_pod_target(XSM_PRIV, d);
> -
> -        if ( rc != 0 )
> -            goto pod_target_out_unlock;
> -
> -        if ( cmd == XENMEM_set_pod_target )
>          {
> -            if ( target.target_pages > d->max_pages )
> -            {
> +            rc = xsm_set_pod_target(XSM_PRIV, d);
> +            if ( rc )
> +                ASSERT(rc < 0);
> +            else if ( target.target_pages > d->max_pages )
>                  rc = -EINVAL;
> -                goto pod_target_out_unlock;
> -            }
> -
> -            rc = p2m_pod_set_mem_target(d, target.target_pages);
> +            else
> +                rc = p2m_pod_set_mem_target(d, target.target_pages);
>          }
> +        else
> +            rc = xsm_get_pod_target(XSM_PRIV, d);
>  
>          if ( rc == -ERESTART )
>          {
> @@ -4817,13 +4811,9 @@ long arch_memory_op(unsigned long cmd, X
>              p2m_pod_get_mem_target(d, &target);
>  
>              if ( __copy_to_guest(arg, &target, 1) )
> -            {
> -                rc= -EFAULT;
> -                goto pod_target_out_unlock;
> -            }
> +                rc = -EFAULT;
>          }
>  
> -    pod_target_out_unlock:
>          rcu_unlock_domain(d);
>          return rc;
>      }
> 
> 



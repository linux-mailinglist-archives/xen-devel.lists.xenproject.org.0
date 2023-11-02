Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B937DF447
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 14:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626916.977629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyY41-0000A5-Fg; Thu, 02 Nov 2023 13:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626916.977629; Thu, 02 Nov 2023 13:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyY41-00006p-Cl; Thu, 02 Nov 2023 13:48:49 +0000
Received: by outflank-mailman (input) for mailman id 626916;
 Thu, 02 Nov 2023 13:48:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyY3z-00005M-Kz
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 13:48:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe02::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b3b1c22-7986-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 14:48:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7975.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Thu, 2 Nov
 2023 13:48:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 13:48:44 +0000
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
X-Inumbo-ID: 8b3b1c22-7986-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNa9GWMVTPq6A1/BX8j5DmFOvMBGfvskliD7lWIdARcOhqSOmUTG9bwzi+1PFvu+UmzDShC5r3oiTPZe3Hpaoecs0ymerb5mg/pvlLs0au9HLSJJ615JZykXNf8PiukUW3mkr5Sk0410dJ7FV3No4t1KMYABh9m8Mfq8Povw+TELxBvWOGzmRRW13JMS1bzDU8UdT6bJ2K6+y3FcJzkfSDGjgOinDq6QRNl+co2dO0zyY+9/Sx4FqJFUotOoRhDoof5OLm0EdoVKG6YxteU2WXaPYjNTY3RpD0QqJVv52JWbvMGsLxvIi/u8y/IC7Tp6hAhZnmf2w+EhAg5EZgPqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsxli57NdPnbBLkRZQST2iOVkCwDLBT5mKJ4Grai8+c=;
 b=FF0vM8gy3ogbxI8O+IAoqQhEayssDEifFjfoPAOPjXRaWjOstZYRJ7bpmje6nyQEyelj2hDbajuSnE0PyNGHjhX9+1ro0cvABR1xKP8MvvKJ9/bXoJU3yZBIbVILMpIXsGStXGpUF7xjqbvgKxIl9MowKSQuqC449cWh/L6Hu0Tx+ZaqXRkKNLztW5VWvvmE6EOuvoCTfhJuHIsKOEicRLt7bNCu0qZTVITB0TeNPdDhcSg85xgwfK7HsUZPbEphUjEGRB0NFc9qBzG18HlX6JXbLzeQSkMYPQS26j3zIklCpujAM0+e9e/UcaPZUP9E32syf0NbYNydM540uiO7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsxli57NdPnbBLkRZQST2iOVkCwDLBT5mKJ4Grai8+c=;
 b=zOapNGZZCWEUNVdYP2ZZrEmmG2bNXgzSiwDRWYu4umdf3nmXCR5iZnRAOx07cu2/E8FrUIgiyziVvimXN6X7WadJ0vpJr0F9XSVEbvtNCPz/FIMfGm6xLqqrcO0ao82CG2IxkFMugE7Lf7shJNPw6uKMKw4zj5T4krLV2CPJH0yNqlS3WWfNTL5yXZvmAPG3WCGfwJjSVBoTnhiNikmrWLEvKGu1p/2hwrh8ys9pkXoCXK47DLlnPUonhFnzi2GjLf/yTThmXx8JMn4VBGooNxScO0ZRND4kIoOhjCPzC87zd2N+3vhxb4ZcYKUSEl1Rp6bVAmMotPUbgmqTt6d2xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e750007-5878-c08b-eadc-f84f9a504a0f@suse.com>
Date: Thu, 2 Nov 2023 14:48:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231031145259.77199-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231031145259.77199-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 7972c4da-27fe-4552-2a72-08dbdbaa6e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	860uQ8AG5SbGeqy2/zVi7WCHGE4prFSaw0fuRMKkoArFcGTvcTKERYaNWm2bdjlspOjPSe+AbeKpNsWhGne0lPsSjWUaBpovL9om8QzJco93l6AWxidUYsOdDQhhoIH3csN6qTcuOO7wOVrl69IHTcNmOVFF2O/iSO7WmHJ+sNyRWxPORqBBs3vt6O/o9gCyjILB0D3eatMd5Kkg8cPvmIKICeuZzdpK1xbN5spuvG27/jstmpu/y+uB6IR3RSw5CXxWtnryqrXsGLVKnM1fwyLid9dWoIoyR9Edq3PweFc4dQjCguMEjk0OHiEEiDXT6sQRL7vSl9Ek1Jxld0DXcS1lbPzi5litodYV15b1mQnPp1EGj85Qs+/hjQ7OsiAGKr3CBXk6XxZNaI0LxHUopjsBc73E67tNUJsns2uowuujlmczowFZqhtQm4rl+obIVrKPE83nYk9SpF08P1cHucb1eAWo3mK4Ez6mJh89RM2W4sd7VlWzkJ8+dV8q5Ggi/ycY7aVWNaqv14pDMYvqi7t+nOuhGCkiPaaE8YvY1QiJGkUBqBKkw0ds1XoTXPJeE1o8uwgeNElYzdq3awAYBhAc0lMy+qmyDJUOZL4RQe14zLTKCvuL0xP4hIAR9JPOmlGBU2bUQBb7pLNcD6xwrlVDlnmeTFc1w0zixSJC1Lbr4Kz7yqjMOAKQMgqhwrSR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799009)(64100799003)(186009)(6512007)(83380400001)(2906002)(66899024)(66946007)(478600001)(66556008)(6486002)(86362001)(41300700001)(8936002)(54906003)(5660300002)(6506007)(66476007)(316002)(6916009)(8676002)(38100700002)(36756003)(2616005)(26005)(4326008)(31696002)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlcyTGFFZ3lGdHZPcjY1c3UwelRZb3JGSEpPY0oxUlpwYlJidUo3K2dVMHF4?=
 =?utf-8?B?b2tRUTdsOEdlUDU1MTNyV1I0SEJGMVhWYURXMTkva3RNVEpnbXhsVTVtczJK?=
 =?utf-8?B?UEdBeHdneFFaN0NZeXNrc3FFUUJDUkszdWpxMCt5SkxsR2ZWWEwvaUV6M1h5?=
 =?utf-8?B?SWNKRGptZHhmd0VFNzJMait1OVMwR3Q2YU1EY0ZoUjJhOVY4R01nbU9wV3hm?=
 =?utf-8?B?YW5LYWg1cVFaRWM3dU5UWkdwbEM2clA4V2ROV0dodHlHY1RQL0R1TUp5OFNY?=
 =?utf-8?B?VmhuSG0xRFBGYWtLb3VMVWp2ZDFXRThvVVQzZ3lkUStZS2tQV1ZvdDVOS0Uz?=
 =?utf-8?B?eXRXMG56eHJXVkNBSE5xUm40L2ZqMFdYcnNQalVvUGt4d1p4NHJRdHJ5b05W?=
 =?utf-8?B?ekU3ayttNFQ2eFhKaGpkVXEzdTNLSkxTMDJ6R2RmVmlweXE3eDFQZmFaUEY0?=
 =?utf-8?B?cmszRUFjVzJLOVc0OFQvaHpZTDJ6dGF2eldPeHBzeFphV3VRUC9ZMWd2UmxS?=
 =?utf-8?B?S2RIZVY0eWVaQWFvcnlXb0M0REdQMlJlK052RDdFZDAxdGFRUFZjVEpieDZZ?=
 =?utf-8?B?d2VQNnUyb0dmWXB3TFU0Rk1SSSt3dFhCUXRscHQ0bmt2Smtkb3AxVmQyRzlG?=
 =?utf-8?B?WE8wcHVzbmhFdzdxT25Ed1lwL0xPQXhWN05ZeURsQ2lGY2M3clZ4cTAxckVx?=
 =?utf-8?B?VFdoQzIwaGVMNDF6eVo3VzN2aStUVVQ5S3VKZFE1dWtaajRpOTdxTXlXaExz?=
 =?utf-8?B?ZzIwanNXTmoyei9hYlB5MjVQQ3VQREI3cFpVYndxMUk2SlY0SmNNaG1ITTBx?=
 =?utf-8?B?N3oxN1VKQmZiQ2cyQzRoRUIwWGJhaUJKRkNWb0xja0xLQ1BEeWZvTmJka0dD?=
 =?utf-8?B?SDErMVpMSHpJNVp6V0ZaUFlqemlQeUdJRkZoOVZkMFd6QWF0VlZheWdxMjJO?=
 =?utf-8?B?UWllVlFGSkhZY2Q2aTZqcDZCeTc1b09kaS9jMGJrWjdLUGw4SHZ2QmFkOFRn?=
 =?utf-8?B?M2MvWWZ4azhTMEJ3bmZkY3Uwc3ljc09lWWsvUmNYS2Y4U1VmOERESzZqM0tG?=
 =?utf-8?B?cUt0WGRIZUw5TUtJRUpQWUVjTzlaSjFGdU90MStTOEUzajFqNGRMSG5aTUp6?=
 =?utf-8?B?Mld2MTk0NUhFUzh3bStTeTZ1c1pjeU5VZzhSdXRJVVc5Q05kN3pOQzd5L3Zl?=
 =?utf-8?B?cWpNZjdYVi9JemVIM3h1WWlTbUFPa2EyQU5pTjZmZ0hvUVE2L2F3SEVhMjJV?=
 =?utf-8?B?K3c4Ri9GYk9tNnJTZmcwWCsrTUp0YzAvbVc2TDFkQ21WY25JbVh3bXp1Wkp4?=
 =?utf-8?B?Rkp4NDNpSnI0SWJaeUxXZVAvdnk4UnJ1UGZIK1BMVm8raVNMVTIzZ3k5bVZ6?=
 =?utf-8?B?ejJ0aURFS0g3WmN1ODFBcFV4cGNWYS9xVFlONkxPK0oxMGRSNFVvZ3ZVK2FT?=
 =?utf-8?B?aVExZ0lJUjRZcWgwSmRnR2F1QWI0cDN2ZEkxSytUZlNRZXdoTStsTVVncHFC?=
 =?utf-8?B?U0VyclVleG90WHdkTG9NY1NjOWhBNWw0V3c5cnFVbUthNzZsS1VnQ0ZpL3Vq?=
 =?utf-8?B?S0RMSGxEMmtpcE12WEJGQndCb1pYTWI5UmpaTFZNSTR0VXdmSmV0L0dxZHVi?=
 =?utf-8?B?WWFxRmVSbGhsYnJDSmNjU21iVGVBeTM3UUFyUEFJamdkbHU5TzFnSEoyY3pY?=
 =?utf-8?B?Q0Uvc1JWSFNGUDR3R2F0RnNnRGxJSlAxMWUrNjJDVit1aWk3Nzg5akNndUdw?=
 =?utf-8?B?VVhoMUlLSnBld3Nlc0dFZVQ5NGg1ZXdwa0tiZGQ0YW4rSHZFc1o5SGFzSFVT?=
 =?utf-8?B?bE41RHEzY0hHMjEzbmVQTUZpVm1KSGk0TWt1eVd0K045b1dqUVVicUlIcDhF?=
 =?utf-8?B?MFB2UTkvNFd6UmhQWDRrb3JtNWtQQWNsYVBPSXoyaUJXeUtTanJHU2M4N2lX?=
 =?utf-8?B?NC9IU1phMkFPdWpsd290MURaUUtLZE82eUVsRVNFcUV2R21qbmU2bzB0MEY3?=
 =?utf-8?B?YSt2UXVWQ1RJK2tOUWRVMzB2dWErZDFZT29RR0l3dUJJb2NWSEQxK0xhWFRa?=
 =?utf-8?B?aW9JVHdVanVUcGpCUHpkb09JbncyWk82VXRZMDhkbXBDUytDbGtXTkozLzNQ?=
 =?utf-8?Q?IwNMB/SDls3Abtw6S2aQlBCop?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7972c4da-27fe-4552-2a72-08dbdbaa6e13
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:48:44.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0weZNPfbEWhl/NuVtakr/Me8ciPYH/MVrAPBKlnEGfepRRC2b5ej5CGJnewoLQv99vh5H9o5Ec/HFzeRZNm/rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7975

On 31.10.2023 15:52, Roger Pau Monne wrote:
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -180,6 +180,29 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
>      .send_IPI_self = send_IPI_self_x2apic
>  };
>  
> +/*
> + * Mixed x2APIC mode: use physical for external (device) interrupts, and
> + * cluster for inter processor interrupts.  Such mode has the benefits of not
> + * sharing the vector space with all CPUs on the cluster, while still allowing
> + * IPIs to be more efficiently delivered by not having to perform an ICR write
> + * for each target CPU.
> + */
> +static const struct genapic __initconstrel apic_x2apic_mixed = {
> +    APIC_INIT("x2apic_mixed", NULL),
> +    /*
> +     * NB: IPIs use the send_IPI_{mask,self} hooks only, other fields are
> +     * exclusively used by external interrupts and hence are set to use
> +     * Physical destination mode handlers.
> +     */
> +    .int_delivery_mode = dest_Fixed,
> +    .int_dest_mode = 0 /* physical delivery */,
> +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,

INT_DEST_MODE and the init_apic_ldr hook pointer are used in one place
that's neither IPI nor device-IRQ related: What connect_bsp_APIC() logs
is already not really correct for x2APIC mode, but clearly things go
worse with this further extension of the possible modes. I think this
wants adjusting to cover the (now) three x2APIC modes as well. (It
could also be updated up front to deal with the two original x2APIC
modes, but personally I'd fold the whole change right into here.)

Jan


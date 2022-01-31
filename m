Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253A04A4327
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262982.455487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUhT-0007iM-W4; Mon, 31 Jan 2022 11:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262982.455487; Mon, 31 Jan 2022 11:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUhT-0007ft-Sr; Mon, 31 Jan 2022 11:18:23 +0000
Received: by outflank-mailman (input) for mailman id 262982;
 Mon, 31 Jan 2022 11:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEUhS-0007fi-Ra
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:18:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f5e69d8-8287-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 12:18:21 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-reGFX9qPNki_zkbqjJta7g-1; Mon, 31 Jan 2022 12:18:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5451.eurprd04.prod.outlook.com (2603:10a6:10:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 11:18:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:18:16 +0000
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
X-Inumbo-ID: 7f5e69d8-8287-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643627901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKInQABOAG6EwivI5xz33uDcpTEGCbyEU1Ljw/C6TZY=;
	b=YVfkGCBKooHz7V2vRPTDiBmZw817jsOL6iQxGCYDt3i5RzWfuBvlUyVa/53uK3uRPkeLMZ
	qxFEzuq82dam7uZ4wg4EPyfNZJ28qU1PF+a0ZX2orW8/aPuWOU9Ah2NpkZTP20FrduBsgH
	wXZzE6fnbQP0IoikBhKm6nf1QOZ1w2k=
X-MC-Unique: reGFX9qPNki_zkbqjJta7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7IkF5hSi0js0cgZXuzYPK4LOuXEayRpqkqXwhBRtpisf8qoVpRhBEtQYZ9uCkAGNjRMXd0D8oAyEgvakFICL2FGBuCzZzINwwesesKtc0eea8hWvDCnaDwLBakPVAjh0VZAtLr0Br7dmjrMLgpuQsWIF9MBkHNWL6n2S76R212j820MTmHwCIsB54KGGDyBiD/z8uCciJXBxLETgmxg9luQpGc6Yncqn9iP9sd4InKjTvE0E5C3tEclp7DTx1GU29veo26Iyy68AMIXMvPFUN9i+eLrUT4965Ln6+GNe58yNqPZ233+luD9Qa11rBDZwXgs5DyLSNsI3FL5GTttgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKInQABOAG6EwivI5xz33uDcpTEGCbyEU1Ljw/C6TZY=;
 b=VPcFJz037RCBdoi81wiJKj89CHKnuiGiRcq1mb+fPp+dr82iQ5+PKlbyAI4+Ym/LWhk3uSPPVlHkZD0uAii03FzkdtnvYX/4Q0BUBMtg/L83RgbmSoSGfbvibaj8OPST2NjrvAGZvN6U6lwjbq1dJMz8yThi3V8/81kuoNESECA5oSOKPN+W1KRkZO2h0lp3Jq19lLoa3ILW9W6o2OT2zVCIOj8uEGYqi7eZLMmxgNGt+/hl+1xmnlZybqAN9JZ31msNNvKtoyEXIw75DDduE11iJeeEvDd9d5uYzU8nMBp0cOJswWMzzI4HK1Ih2xx7Ac5VGW5OSUwEWKHHhkhxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6319d33e-0572-f378-f715-b86f600bcca6@suse.com>
Date: Mon, 31 Jan 2022 12:18:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] xen+tools: Report Interrupt Controller Virtualization
 capabilities on x86
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-2-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220127160133.11608-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11263fd7-5b15-4278-480b-08d9e4ab60c8
X-MS-TrafficTypeDiagnostic: DB7PR04MB5451:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB545166DD09B02BF477C2C220B3259@DB7PR04MB5451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	By8pq/8L/VZ7FZK0Gqm0HQedzM3n2rzK1HSzrBp3h7P0kwEJTFluVx7hy4ZmvrKvJXTIShi6xYx8Yog7TrDfDDhGuxMHqpWrmSe9XkZi7figwR4l96p8XdOsVXqOhh2AZGhFVszEZhLeec2JQVBHMdtuyyW/yqemN3QFMO6QtJ6YRdeCMCocBk5dRokPIGY2vmnMZ4YJiZB0wjbfTX2Cl33Aq/N5159QD9WcbXlI+nfqYAOpGSRmE46Melj6uXWCgRDDYeQORVHQ2kGUNUor9N6j15YS7F4Tc9aFZKM+tQyEsPpNs42Zoe1CrHbXL/3KlUoqGRGGFACVqSFZ3+7QKb8jz1EYGXFlqnXyaOMigjVgt3SuEhGWp+guKdS08WFy80NOUESEAgFiNRBo+l39KV6Iq36mItpZE/5lBh3gyK44MAkpXhL7YCi9NxUPRWKO9b552mRVMUBKVzTNEgxrHkg9mPtZxKltoaNle22JQ1wVz4OrqoXgMscWq4S91Z/s/UmyjjnWslmJJHvQIlS4n1GcVtOLSntM4VznMr7+sFvpf+gnA/lqfDehu0JKyXlGMAUmkIERPDeFHg36gQmZD9ndVzCptiL6Q/1rvSpxAUibpgrUU2+bAmNbGCltQ6XGb258U0a56Zf3lBxm6+wekyJRuHBNeJ0+Y++8lUakByqEsYwz5ibOuOeawyvm9crUvNpzQLg3u1C6nT+kna+cNpASc9hnSvqMKVMVN31s3kEj8VeXWpvDBuLMr0th66JY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(86362001)(83380400001)(7416002)(2906002)(4326008)(54906003)(2616005)(5660300002)(66946007)(316002)(31686004)(66556008)(8676002)(6916009)(8936002)(66476007)(31696002)(53546011)(6506007)(6512007)(6486002)(38100700002)(26005)(186003)(508600001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFM1aGJuSFl6eThjZGVEaWZyOXNQM0lTdGZ6dkhwVHEyc3B5RnhDbEQvRkRk?=
 =?utf-8?B?NVlkSGNES3NDU1JQd1BIbW92Rlh2NzdKYWQ4NFlxQ2p3RUFiUzUyMjBLcU8x?=
 =?utf-8?B?V0NGK0pyZnBCemdLTENRRkY2NUtWUll3Rkp0WE9PNFJCaU5xaXpNL29BcFh3?=
 =?utf-8?B?KzVmZThFS2NhdGVVY095U1BKTzg5MXFmd0lTMVNLV0VDMmdzMmhEbXNlUGlR?=
 =?utf-8?B?QUlFRmhXTjNoR2xObVVJeTRsc1JnQXVBWk9MUHA2cDB5dWp6cG5wWkpWa1VZ?=
 =?utf-8?B?a1p6aVFwZjU5M2RtUWQwM2QwdVAwWHFDTUg1S0c5eGRPb052K1pvTmdHNnNo?=
 =?utf-8?B?V0wrK3N0bzNMQWN4TGtzUThMY04yOUYzY3MydkluSmhIWVFBUVBrOHBKcVdx?=
 =?utf-8?B?c3lvZmttZ3JjbTVDZHFuMmpFUUo0Y04wZ05kdzIvMnNHUVJoK0FPTVorNklP?=
 =?utf-8?B?UW9JVmZNZFRlOVFWQkZhd2pNa3pobng4Wm5GNUI0S3JzUTdERlNqa3ZMZ2N5?=
 =?utf-8?B?RXdpZ1h1ekp6dUU0aWVvT0ZMVlNTenQzMWRidGNtcjM3RlJuY3hKQW1qM1ZP?=
 =?utf-8?B?S0ttbHBKQ3VGWWtDZzMrZk94RDFoMElKMmZReWJGNm9zYW95VVpQY2NBcjF2?=
 =?utf-8?B?L1dQSWZqdEprdEVLSjVwb1hHM2d4eDF3NjVFQ2pVTVQ2UGJhdDVKQlk4RFFp?=
 =?utf-8?B?VnJBZy9DSFVZUThkdXYwNW54aUdnWGRMbzRsbDZ4SjV1Sms2RDc2cnlGQzhz?=
 =?utf-8?B?OHZzMDAvKzBuenZHdzJYcnZ5TU10eGNzT0hOSDRyM095bFNQVUxSd2xGUUFj?=
 =?utf-8?B?TFcvWXp2a0Q1dHJNR2thWTVWb01HSVFRd2t5bFJ4emdGZlk4NklUR3hMNGdv?=
 =?utf-8?B?VGV3WVhwaFkzNUxjdU9oMGorbldBeE1sNzYwazFaczFzTkh3dXQxL0g1d1Rr?=
 =?utf-8?B?ZHExWmhZaW5leHVLTXZidjFqMlJGWXdDRXRJSXY5aW9WVzdKRC9qZ05SR2t6?=
 =?utf-8?B?am1vQXRlRTZLOXY3bEFBUTFmWnoxekVWNGcwcDl1UE5Oa2NOV3B6ZkJnL0JP?=
 =?utf-8?B?SUVyV2w5MGNlV2lrOXdGUGFzY3RUU3BzbXV3YWRNODAyODdubXhTNUo2MnVn?=
 =?utf-8?B?S0lRRUkxRjJ1elNxbHVDNlRKUmw0R3g3MnROckUxRzdsbW5PNkp6TVJmL2Ez?=
 =?utf-8?B?bEVudEhRRWhDUXllODNXTFAwa0xtejJsRlZqQWF3ZUdkcDhtbDdLNFdPdDY0?=
 =?utf-8?B?VXNvQllGTGVnbnJQb0pXWW81cVg0Z3g4V3RaL0lQcTc4NE9SWkNNRDFhaUlU?=
 =?utf-8?B?d0hudmNIMHRkbGhQUVdadDJSeHg3VVpuWnQ2TFJXSUVQYlcxdFMwcFJleXJR?=
 =?utf-8?B?R0o5K2JQVUV3c3BhUVBkeC9rS3BFRDAwSXdaSjMvUCtlQWlOTnlGY3hCQmU1?=
 =?utf-8?B?WDRreEdoU2ZBdzd1ZzduY1dqRy9KajJDZzdobm0rQVdCNENTSXpXcTJHeVhj?=
 =?utf-8?B?T3U5M0JJVUplbXEyMzN5RUtyODVEOXQyMC80VThzTUtVSHRMNXUwbVhaTnRu?=
 =?utf-8?B?VER6UWppVE9PZUdBbDE1cG1tek1EWExYWTlraEJQS1pvaHkyVHpsckJUY09T?=
 =?utf-8?B?ZG0zbmd0RkVaOTV1KzFKVXZGbGNjRnYzcDlFWUNsSDFOdjFxc0NEZ1lPZGdi?=
 =?utf-8?B?emtxUkZ2Y2puMEVNZEdvVWJXZVdFTVZpakV6aUo4UmQ2cll4c0FnUFFWWDdJ?=
 =?utf-8?B?M3R0Q2xjcUJKbXpEV0JzbjlwWkhLbEJxWjcwN3oxcDEzQVIraDh6RmtnWldK?=
 =?utf-8?B?cmhmRHFmMGFKZDg4UnRwclFiM0o1NFFTQWpTS1hoT3I0OFhvSkNsZGhHTVFx?=
 =?utf-8?B?SDBmUm0wUFJuKzFkQVZ3QUtybDQ4ZEZnR1pxMDBLRVRQRlFncS9LbUhFbkMz?=
 =?utf-8?B?aUI2WERGSVJjUnR1M0dySkV1eWVLWkNvTnlmc3Y2UDNsK3A1dUhvSmJTQ3gy?=
 =?utf-8?B?ZWZWWUt4UEFYNlVaSFpsTXFHWGxUNGFvOVF5MGE1M0xkdkY0cGw1RWNoakFQ?=
 =?utf-8?B?STJxWVcrK0xSYWluMmZobkZPbGFXOERJcjgra2wxbEZ0M0svOTIyUGYxeXNK?=
 =?utf-8?B?aGZSUlhneS9hRkx6QmxjUC8vSGxMZWpHL3NSVFNobGx1My82bVU1WGdaU0ZZ?=
 =?utf-8?Q?2c1QqGOkHsuK+Atb7WhsUt4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11263fd7-5b15-4278-480b-08d9e4ab60c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:18:16.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLBDW21XcZwvTvVKumW7E77+ZchZfOEtI7Xoo+ehhjIAaseNDHXNHAzrLmKdHEXM9oaIJ1jKT/5y+FoqA7MA8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5451

On 27.01.2022 17:01, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Nit: Please try to keep tags in chronological order.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -343,6 +343,12 @@ static int vmx_init_vmcs_config(bool bsp)
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> +    assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
> +                                cpu_has_vmx_apic_reg_virt &&
> +                                cpu_has_vmx_virtual_intr_delivery;

Imo this would better live in .init.text, which would guarantee that
hot-onlined CPUs later cannot corrupt the original setting. IOW at the
very least the setting of the variables wants to be conditional upon
"bsp", but ideally this would move to e.g. vmx_vmcs_init().

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -756,6 +756,10 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
>                        : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
>                                                : PV64_VM_ASSIST_MASK)
>  
> +extern bool assisted_xapic_available;
> +
> +extern bool assisted_x2apic_available;

May I suggest that you omit the intermediate blank line, just like
you did below?

> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -69,6 +69,9 @@ struct l3_cache_info {
>      unsigned long size;
>  };
>  
> +bool __read_mostly assisted_xapic_available;
> +bool __read_mostly assisted_x2apic_available;

With the above this could then be __ro_after_init.

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -326,6 +326,10 @@ struct xen_arch_domainconfig {
>  
>  /* GPE0 bit set during CPU hotplug */
>  #define XEN_ACPI_GPE0_CPUHP_BIT      2
> +
> +#define XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_XAPIC  (1u << 0)
> +#define XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X2APIC (1u << 1)
> +
>  #endif

I have to admit I'm not convinced it is a good idea to put these here,
far away and disconnected from ...

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -120,6 +120,7 @@ struct xen_sysctl_physinfo {
>      uint32_t max_node_id; /* Largest possible node ID on this host */
>      uint32_t cpu_khz;
>      uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
> +    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_ARCH_ */

... this. See e.g. XEN_SYSCTL_get_cpu_levelling_caps which is entirely
x86-specific yet still fully contained in sysctl.h. Furthermore I
think you want "X86" somewhere in the names of the two #define-s.
While xAPIC and x2APIC are sufficiently clearly x86 terms, future
further bits may not as obviously be, yet we will want to have the
names be consistent. Perhaps best to replace "ARCH" by "X86"?

>      uint64_aligned_t total_pages;
>      uint64_aligned_t free_pages;
>      uint64_aligned_t scrub_pages;

With these subsequent fields you're introducing a padding hole.
Please make that explicit (including the setting of it to zero if
that doesn't happen implicitly already). And changing the layout of a
struct here also requires that XEN_SYSCTL_INTERFACE_VERSION be bumped,
at least as long as it hasn't yet in the current dev cycle.

Jan



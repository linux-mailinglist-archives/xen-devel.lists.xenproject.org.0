Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA1792399
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 16:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595736.929335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXGd-0005uL-3d; Tue, 05 Sep 2023 14:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595736.929335; Tue, 05 Sep 2023 14:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXGd-0005s1-0J; Tue, 05 Sep 2023 14:42:59 +0000
Received: by outflank-mailman (input) for mailman id 595736;
 Tue, 05 Sep 2023 14:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdXGb-0005rA-3g
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 14:42:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f91ca58-4bfa-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 16:42:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9639.eurprd04.prod.outlook.com (2603:10a6:102:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 14:42:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 14:42:52 +0000
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
X-Inumbo-ID: 7f91ca58-4bfa-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6N40g4BBBXFcFcRzjZY6jErGOI5izg6Reb78to9EPLDeFxhrBnNHNcvDAHLDuwwnqQPlLD+6iEYLesuAfe2DvDFZIRTFySd6fNyum8A95vZWNHxWiC3wejSlc6fayp6x9JYqVmJ7j8f4GLNk38lm/xM3iff3XE+n7BL23qJLw2x0E5QbD5cA4AxjxiANLOV2BLp25yr2uzlLY6CWTNY5D+SkAINqFSSffHmPvMJ9/xe5UKUhtjPnAfDTpgx2knIUIiFxYoqrpnUdunHi4xj7Ll8p8UN5co1luniSvhdZKIIHba9n1nNkK8rROwsUlEk+3RlCKWfeaaIHSmlhGFZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EckAGdbJxM6GXHklp4w84GtqGWjLoFS1T/JUXPQtwI=;
 b=NpDw9wyqmfMhUikqOZ0PdRVhKi+9YSXxOdH2gRCzqHMszEJEWDRUryP6ydqYGMJS46UGwe/uDWTtYmqQEW18y/f4PEAqoUADG4DlFAJ4jLrlQC4yNGNnPNGsxVv3ynOoLx9f1CPIiM2gXt+P43fmZvkSmpmlWpHAKjp6Ugd/fPKmOTL8/0R+pO22TK9ZgRAVlvcT5cOxg7EiNDEcutcT7mwVC1xk52wW/yorwAlUxMOfh25QChZ94yPz8EjpWbQWWufwF2BPvzvBWwNfxtEM7nCxtP0t7bMnVA9yfHrmJNVSYz0EADKDcINxrloD/e0n3S/Fsh4jVcBlS/kvVQo7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EckAGdbJxM6GXHklp4w84GtqGWjLoFS1T/JUXPQtwI=;
 b=UKVSjzbF/ivitUYMnYvGjKDvUw6nIvl6mNyidAgGLoNFx1LCdoeNe9pjXcUruGKpsaX3Z8CygRujeDcbJKOEzJt/X9HEcQ5EWatQJsijsiQ/LeuZTu6YgSNyMQ7tYWUL3aoC7UXk1tprdePN9lSHYG6jt14uWvK7K/CKjPmXVrFfjPPqHyBxvMI7NgBSJ/VjV23oL8Yd/0f+NW8YpaRS0jW1Q9gOofkUoiLgxrQeAfEDebuyNrtRg+2vpGR5x3EP/mdDMSr4pvlECa7t6o+bKiulvOjCgFz0K2H6oZ74TI1Gbi53rElALkICoDjP6HI+2iSZJsOXEeIxUfRunbUL5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2dc97f01-7088-1a91-77e2-79792840b828@suse.com>
Date: Tue, 5 Sep 2023 16:42:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v3] drivers/video: make declarations of defined
 functions available
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <d0266b549dd88d273918521ccb538592df9e58b1.1693551521.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0266b549dd88d273918521ccb538592df9e58b1.1693551521.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2d52e5-3c55-45a3-5cae-08dbae1e6243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YmCpdVutUGfBYdSQAUw2DT7t/g/Rwr12zcBDAH3sQvAPNX3TXvTmVIgQoWPRmawSDrJnS8oQXQPr3bu5iZATB7JUxIdxJ7hmA+meSQiGcphfN6UQMjZOl3i1c940egckCmf5fyqJo5LrnVNbeS+AfYDA0BVWKGnw2umf1dcrxuGoHoGdUH1bjbT3MDpkAhKQdD4UeX6p7o4/NC22583SAkzFZRU51TnP+4m1Mc8EjdDBnRfsqILNEszVYiXtmJunY0//Hp8Ygg2u8bGzVHnh2DOUe/1FBhjlovjPS40pWPIPsihypxwmXbL5d679SQ9zmprrZfblFJ1FC+gqvYedBRfZ+fZN1j5pPHnWcJsfO5Kk1KxeXjcLSw4zSorIr6W9jarG8Vf3qe49C+DP8iJ/RvdbQGM5gecMTjfqmqEAdpqlc75tdsvUKxVKKEpR4yb1nInxAn9ac8gVLY8Ee8ILMzNfsLuY5bKrH7zZxYSD+xz5hJqCGNPgW2a8zrbNdLP6lwD3e41UI/ErJ2rK5iLbFuVQ9CV2teiwvRfhj1eAlsLktb3/ng8zgPvOmp4Ul4zQH4g4K2wADnKyZqL8cPouFTyyZdTLCT1SwHVf0eJy0Vbqt96D4zAqd97BSLQ2ws5EECqtNbXHk9ikJ85OerSO0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(53546011)(26005)(5660300002)(2616005)(66556008)(66946007)(66476007)(54906003)(316002)(6512007)(6916009)(6506007)(41300700001)(6666004)(4326008)(8676002)(8936002)(31686004)(478600001)(6486002)(7416002)(2906002)(31696002)(86362001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHU0b0hUWkJDLzlhcFFZTjBTVzFJcURYMWFUSlZlZGduNVkveXdXMHc4L1Q1?=
 =?utf-8?B?WEpRMTQ4YWVjTjYyczJkcUlsQ3JQMFNjd2F2b3RQV1NtVzE1ZmRqaWI1TWNO?=
 =?utf-8?B?ZFBtT2tDUUVjQ3RKcHJBSlFHeHJBSi9qdndTVEowMFcrVHF4M0FzL3EveUJP?=
 =?utf-8?B?NjFzajFlMlhYdlpJZEtGY0JCMGpqWnZWUGp4VE9xVjFGeHJnUmYrOE1KT0V6?=
 =?utf-8?B?MUxIZXpjUzFGZjlmam1HVUpHWkdFRmgxZ3B1b1NJbGo4VmI4bjBja1hPWksr?=
 =?utf-8?B?YnBZRGovMGptN3ZnejVZTEo3ZnQyRFpHVk9reUNVbHpKNXU2UmdmYk91UTFD?=
 =?utf-8?B?UXJ0b1VGUVh5RFFLdG5nTmlDM09sVktvanEzZ2Y0bjliZHF2cDhYMlVDQTRH?=
 =?utf-8?B?cEpjeXdOenZoUVRaazVNSVRjeTV2OFVhVlBiNTNPeE5iNzZaY1VaVjEwdnBh?=
 =?utf-8?B?TXU3RFQ0ZEZLczBMaTdNa0s5azdnYXgxM0FCTlpyVkVxQTJJcldCckJJQVkv?=
 =?utf-8?B?K0owSmF5ZXNTbmNCYUJKUStVaDY3eFJCRjljK3hXckcvaXhFYVlUUTgvSDZB?=
 =?utf-8?B?eVlkMzY4b3k3d005QTRtRHZCL1FRZUY4RHBLVDAvSlZqeHZBekYvSXRjWWpU?=
 =?utf-8?B?RDIzYm8xbDJlRTNEYVNqU2xCWnRQNWVncTVIZmJESG1ieVdpdUNXK1psTTBH?=
 =?utf-8?B?eUt3dG9sb2tKMjl3cUlsbU1wWUFVdTVTQmNwbFdRY3hUazJWS2VLSnlvVCtn?=
 =?utf-8?B?ZGNteklSeEo4L2tUYTFVUHRnWW8rWXdrNXdDL3VMaE1FdmtZYUowTXdINXFZ?=
 =?utf-8?B?YkRrZUxxbzhoVVNUZkZ3YVk1cnU4My9qUDJkdTJlTmNBKzZuMFAzdVp5YS9U?=
 =?utf-8?B?Z1BuQk9mS2kycGYrUVJEUHNXdzE5SUNLNUNCcm84VnVlMjQvZDFTWDRFK21M?=
 =?utf-8?B?ellFOVBqL3FPYWpEV0tFTzM3b0xOVW9sZ3BhUVEyV09yN0ZIYndTWkxKNkk1?=
 =?utf-8?B?MGtHWld2eHN2Unk5ZzdmbWZmUXRnSjB3QS9HVUFRcDRrSUJLcklBRDE5bDJJ?=
 =?utf-8?B?TUNwM0tvMWVjR1pkSm9HQS9kaVVvckxTTEtUWUZFa0FMSzg5VEFGOXR3aC9u?=
 =?utf-8?B?MFpoUVh6V1ZWZkNML21pa0VyTU9WN25ySUg5OUJDQjRydTNwcWxZTXViZGl5?=
 =?utf-8?B?ZzAyWkRSYmxIMTlPZStOdDZ4a3MvUDU5c1A2Q3J1bHhuRkZkSDVjeVhjWHNk?=
 =?utf-8?B?NkRJZ25XN3hMVzMrMEN3SmJLRHBwQ3M0VzRZV2IzYmhOQnZVVVdFdk9MME1M?=
 =?utf-8?B?Tjczd01OK2x6bW5OQkd3N0ZuZ2xjOFMxdkdxdm5rTlo4S05Zekc2SEhIOG5h?=
 =?utf-8?B?YVlvazJRQ1kzRUVTbUZnVWl1Q1lFbkl1VDNzM1hUbHRlbUhXUGZOemlWbmoz?=
 =?utf-8?B?elFuODB6bXgwZVNjWnkzM0hVWU9YY3E4TjBTQjBSeWRXMnE1eURyYUtEYkRK?=
 =?utf-8?B?NmZMd0VTUFpRL0ZaaGl6U2FFdFNYdS9EcS80TVRsR08yLytOUjIrQzdMbmxr?=
 =?utf-8?B?RzVyQStJVW5USkxDcDBHQ2g2a0NlMGt2cUd3OWxXV3M4VjRlamxsVTQ4TGg3?=
 =?utf-8?B?dmNpZzNrV1E0bHZwNC9Ja1M3N3RkNksyb3RtUGR4QWZqeVU5MWM1UVdDeFRl?=
 =?utf-8?B?T2k1NUdONU1EMlRvYWYwZ0h1TFhrNmNhcXhYM1hNMTB6V2Z5VHBad1h0M3lM?=
 =?utf-8?B?MTVENU5VK3VpK0hyN1R2MUFkc3pOT2R2blYrYTRlOTZkRzVQekVUVE50MEda?=
 =?utf-8?B?UENuSkFxU3R2SHhOL1lPcFVHVmw2aG5pbVIydGEzV1VETEJydkU3bGxteHBT?=
 =?utf-8?B?RXpiQTJFY3ZCZjVoaVFmbEM5UjMvVEVxc3N0MFRZU1cvWGxpUE1WaVQyTXJB?=
 =?utf-8?B?d1p6VUdUa1VpRjNDdmhsZmxKSGFNOHdTTGZ2WjhCelVmU2p4bE5oaFJoZFV4?=
 =?utf-8?B?alk1bmI0eDQ0Y3p6ajdXb3BmcTJMdmlhRFE3ZWJZQUZZQ0FZR2lyREhYME5s?=
 =?utf-8?B?ZjJZUE5kMVpKWjFna0R6cHlMcXUybFUreHRYQ0t5L3pyV0h5UklvRlBzTjRn?=
 =?utf-8?Q?Td5hXgZ6fq4q1ivTNhRKSxkpl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2d52e5-3c55-45a3-5cae-08dbae1e6243
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 14:42:52.5173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWtDxGn89lypDv522oRWrFqhHRgNSeOPGErqwCj/qlmSj8A8CvnE+EkhoPV+PkxuDZXNJJafX50DMPgSzT9bhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9639

On 01.09.2023 09:02, Nicola Vetrini wrote:
> The declarations for 'vesa_{init,early_init,endboot}' needed by
> 'xen/drivers/video/vesa.c' and 'fill_console_start_info' in 'vga.c'
> are now available by moving the relative code inside 'vga.h'.
> 
> While moving the code, the alternative definitions are now guarded by
> CONFIG_VGA, since it implies all previously used constants.

But such an implication doesn't mean said adjustment is correct. Easiest
would likely be to simply drop that half sentence.

> --- a/xen/include/xen/vga.h
> +++ b/xen/include/xen/vga.h
> @@ -13,6 +13,14 @@
> 
>  #ifdef CONFIG_VGA
>  extern struct xen_vga_console_info vga_console_info;
> +int fill_console_start_info(struct dom0_vga_console_info *);
> +void vesa_init(void);
> +void vesa_early_init(void);
> +void vesa_endboot(bool_t keep);

Nit: Just "bool" please.

> +#else
> +#define vesa_early_init() ((void)0)
> +#define vesa_endboot(x)   ((void)0)
> +static inline void vesa_init(void) {};

So why two #define-s and one inline function? Just because it was that
way originally doesn't mean it needs to stay that way. Then again are
the two #define-s actually needed at all? It looks like they were added
to vga.c just out of precaution, covering the "VGA but no VESA" case.
Now that things are properly moved to headers (and keyed to CONFIG_VGA)
I think we'd better omit those. They can be introduced again when we
gain a VGA/VESA split (and a CONFIG_VESA).

Jan


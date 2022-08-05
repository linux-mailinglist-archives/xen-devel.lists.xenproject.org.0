Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C482858A658
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 09:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380838.615242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJrOp-0002E9-FW; Fri, 05 Aug 2022 07:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380838.615242; Fri, 05 Aug 2022 07:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJrOp-0002Bi-Ci; Fri, 05 Aug 2022 07:05:35 +0000
Received: by outflank-mailman (input) for mailman id 380838;
 Fri, 05 Aug 2022 07:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJrOo-0002Bc-Ij
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 07:05:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff15ad14-148c-11ed-bd2d-47488cf2e6aa;
 Fri, 05 Aug 2022 09:05:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8614.eurprd04.prod.outlook.com (2603:10a6:10:2d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 07:05:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 07:05:29 +0000
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
X-Inumbo-ID: ff15ad14-148c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd7aLK9jDcQ3g1wMdH4fg2i/elsw93Wh77M0s8e8TJX8edJocAK+mqLCTga5DykK13bMgJdbIleHnTsg7WRejp09cnoII2sfmRQH1rmKas9Lf4I+vebLwoCY6ew+5ZZQ5a1zTBkGqsLxxHpoFmVTba/9inQISR0LxLJIipeJtsd0cHxmq7V9+vXEbS95Hme7piskuCPrJk9PYy2UZdajQ0Ceer/EBRlZxbRyJ8i/yYYKVMFpH3FIzENKb90k/6w4yk7AyvGTTgnKr0yNU+1Z694m0IVT+eLxGiWcmKmmDVaN+7SrR991vKQ/0Pn4yKvPYkc/J6SJqTUKFtUlcHs8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptnKYsYaxIVJBuhKFvpn/8js8/bBe1mvTq4ZLb2YokQ=;
 b=O5etydUjJ4MuMhlMUEO/F8xyQDdn1iTelZHm1Vtw16Q2NoujCMo54IgFe31hEy10oXdHXYrnkS63roeaMt1rHs3k3nFnZMPO6phG+8xN18XFQRf9devSelAnrVVn1Q8Xznpoc1V8+y6K/DS0H8Bop7r1vOvZoYiWMTe/gDGsufwia4GPJJNPp0Y97WmQ7eOQSeCEwjfwG8k8PHA9EDLYyK7gLtWrVxdxQsV8psBy56zOZ5Q8+tgUkF9CAXbcrNExkic4rslbc/JplUHK7O1yJOHdlmuhVXfQ957f/Ixcl/AZl73dzgH+5GDwcYR49O4av3PhVFI12bUHnYBBHMaFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptnKYsYaxIVJBuhKFvpn/8js8/bBe1mvTq4ZLb2YokQ=;
 b=eoNaNBunAu62u/DjV1Of5+9W956ITnLvtaZZMRPASX8Oe97nwrvhhj2egWn70yC9hlPp7McbinlYGpqJld/s2By6o2f2XkIqKX0F5Mecu/yPE+Ghle//ixkNyLphu3pGq1q4mPy2vLL9LoETwANzmRjXDbyCGb9cmEdY+ltYRjFso/FXVU1wxDOxfvpUSMx4UJITozd0wiavWu6mSHa2tEQjC8+Mty/RbUmhUVAchoLMO9+RTIqyWpQdzgks7hZ4/ZoXsjQv4soSrb4O2UjBT5vtCLMz5oRQNO/DT+sIE4W1pirMmaryOl5i+fOqkufHOlJ6JnY7b1uL1J1xymC1iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6397ea86-7391-5044-8e8b-a3d291521028@suse.com>
Date: Fri, 5 Aug 2022 09:05:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/10] drivers/char: mark DMA buffers as reserved for
 the XHCI
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <b35f5a68502352396cf6d95cc726bfdeb72639c9.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b35f5a68502352396cf6d95cc726bfdeb72639c9.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acfb59e8-56b1-4d9d-515b-08da76b0e17b
X-MS-TrafficTypeDiagnostic: DU2PR04MB8614:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	norOw1kAVaIb8v+DLCmp/xhLuwmzYAbgVSa6Pf55yFlrmMS09j/wK3retKCA+qv0wjNgo/znWJ1yVHk2Rwc8D0IyawLM77A7gzI4wORj6ZKHF2Bz3cBdExR1aNgs8yVz2YF2v408WG0JXoRRrvvACXnIi/OcBLTfCC1WppP66I+hAhkuK5WGdSojfxzVg8E//OAys3c1iIR2TnGhkqyhWIsBC2pSvwGn3ZwePpr9JVSABwmPoANNwj7YS1H2Oq1UWLgfPdKhjcYSLwrvMOpTpA/T5pwhyZCibj8AoMYkjJYZMIE8DAFmOmoOLmmYzuI42QTblvWS0rT+hzeqi5dw+JDyI/ga9vYlJm47vnXr3YL0+5wYAWz94PBFRV8f1ULphO2K9coMV8d7N4RGNLrfRTF9srAIWJcW7ydpqp5BGaxkR7ZcYGKRviKl/z4eQcq3k2k9DccYDYUwaa9HyY+y8jMNTpJTh4oLPm8x6jEOO6/60qnfIl2L6W7N8iitoJINRljS8MAqA8BunmnvDrqMPzPwlNXweFXj8vTV1xCuR8y2+pjGVBu7tU2smkLdUKmMouwtEDc3zoFBHkM1LrSTfA21GN/cgTZzB5ED9yggN5MwDbT/OjAbOzFb7SZku1aiDy5Dn0FDUofQ2AeiWx12bVsNFIBbBhytCHci7/BFKtE46sjL1SBASeiCjr7OrVBtLFruxUAhSCC0SCSY/tpapl0a8nOE4VaTk1B7e/5dSKt00P3bQ40jEyQ9Yqr7hzkZ6v2P85JQt80BzvuvhMi2rGS5qVz+7mgB/BQCDdoJSFuKSjQRDZSMW6rbhx+ZhAbHyXcmHMo1BZJWuQEfdteE4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(39860400002)(396003)(376002)(4326008)(8676002)(6916009)(86362001)(31696002)(66556008)(66946007)(316002)(26005)(6512007)(38100700002)(2616005)(54906003)(53546011)(6506007)(6486002)(4744005)(31686004)(478600001)(66476007)(41300700001)(2906002)(5660300002)(186003)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2hrQXB2NHRYc3dzT1A5WVhiTCtvdklySXpjc1JZbnRNOGx3bExjSTI4dENs?=
 =?utf-8?B?bWIwcGF6QTVhYTR3TTR5NWVPVlZjM0p6T1pKblhKRmNuSzVSMmUvMU9kSno4?=
 =?utf-8?B?SW82WEE2cFJsaW1lWDJhVGVVSlVBRjdYNFlSd3h3V1hCako2N0swejBaS2pn?=
 =?utf-8?B?VzdyRWd3Y29NK2hka2ZYSmxzL3kxUG5tYXQyRTNJcWxhWWJPMzlkUWlEKzZU?=
 =?utf-8?B?SUdEc3RydGkrUms3amVIdXhRdHM4cUx1V2dXbmJWNExUbVpockVaSzQxdVEy?=
 =?utf-8?B?UG9iYTIzcXIrUDF3UzR1WERFYUtsYjQxcmFZQ0RmM2JsL3pHMWZNcTF0bVVz?=
 =?utf-8?B?TU9jQVllRE5HWC9ndVYzbk1NUllCd0JJN1hQVDNRcUtwSGdIU1VKUHJBcUtC?=
 =?utf-8?B?Zm0xYUJnVnVEY0lMSFJhdlNYbDBJUlJyQmprQ2s5YlJpUERteXZiRkdMOE1P?=
 =?utf-8?B?UnRuUXUvZ2ovSWpETUowZGNWc0I2WjRtWHljenhNNmxUMjRuYlJlazFmZmVC?=
 =?utf-8?B?TGQ4THBqWVlnL2lZK2ROY2t1TnN5SHJZMGtJVml5WnBCOVJPamkxZ3I5bmdy?=
 =?utf-8?B?MVJzQmF1czJKeHZaSmVYZDNleWZLK3hJKzZRNVF5a3hTb1ZUSkNFYzA1eG5z?=
 =?utf-8?B?TVQvNVNLYjRCc0RjUE5IeDZsK2FubUprbTJHbkFrL0xlaDZPWUgyZDMvQitx?=
 =?utf-8?B?OVkxWGt4eG1WTVhJcERvNWxuc29TalVpM09lNDVvaVJaSEl2eWtKaTBuMW1t?=
 =?utf-8?B?YzE3bUhMYnFFZkwrb3RWclJhSlNsbE5BTlZmYlNYRS9UOFphT0s2bzNxM3N1?=
 =?utf-8?B?YkEzMXZ1OGxVcU9sN1g5VEtpKzdOT21YVjc4WEFPUUFCdmJoVmV6QlV5K0Ra?=
 =?utf-8?B?VFVRT1YxbTZUcVE2RWkySTJKdlNwWmo2UWU1dFRUOVdoZkQ0aHpaS01acUR3?=
 =?utf-8?B?L2NQcWVrdlE1dCtYd2VSNnJyTTlhWmxJN1k5bm4wTGI0RTAwOHJaSDlnUXN0?=
 =?utf-8?B?dElTNG80UHpzQVRERmp5NkVjMDVZZTVFTEs5Z0Z2SjhrNmVOKzBVY1JjaVBO?=
 =?utf-8?B?SEd6OE9lU0dKcWJVU056bFQxWUI4TGJBa25wMHJXcytKZnZ2eUFidDFlamNR?=
 =?utf-8?B?dGFVRXB0akhaUE9WaEVna3NPWlFPQlVYNGVWNmdUNEw0RVhSaG5RMWF1T1E0?=
 =?utf-8?B?QUIrQXQrak9SMmZzYUptcC9RRkJON3RZYmZJc09OUjdMQmhwSk9QR3dPY2FR?=
 =?utf-8?B?dzliMU1DOE5WMXpPalhrVnFYaVJlM3IwTldCNnV0L0tuckJtc3NKMFdxUlBh?=
 =?utf-8?B?a0dTd0VzMnN1Sm53Mm1Fam13WExpRkMxZ3o2RG52L3FIZE5xZUZmSUlCQ0dZ?=
 =?utf-8?B?U2V0RFRkVm9iWUlUUWVyUGdMRjJSWkF5dndHQ2o5WEVPT052TXF3SjduSWNE?=
 =?utf-8?B?d2JrMWlmcmNZbFBQSjlGSzhhQjFxMXBUMlhjSjFUVndKcGVUYjBwNXNGOVVp?=
 =?utf-8?B?SWJlWHFwWTdSOHRkdlFERkpLVS9yLzFmUStXTG54SzIrSGUzdGpieHJYZW9B?=
 =?utf-8?B?blVWSlBROERQaW1aeHdhak82NE1oTHAwSlpGdlU5U1BkV21rQ1dCcVB1Z1l2?=
 =?utf-8?B?aHAxa3UwU2xyK0xqamozTTRDTU93MUE3bHJ0MFdDSjg3bllZWWROcjlTekU4?=
 =?utf-8?B?dDMrR2tBWVFscFRpV1pzd2wrRGpOb3BSeStIOUNKczAyTjljdEQrekg0UFE0?=
 =?utf-8?B?YTBTTzE1NkVCUXFmQ25qdzBiWlh1REN1ZGgzbWtHMm5qYjNjdjFmYTlvMzdR?=
 =?utf-8?B?MGw2ajg1c0hMTmhPd3kyNUw1SUVzcitoRGxlVDVzYVRLMnpQUWhQdWtlOFY0?=
 =?utf-8?B?RzdmTFV4WjdWeE1yYW1Xdy9hUWNYR0lTTlJsNHV0Q2VTelgxWS9tS3BzK2lq?=
 =?utf-8?B?UEUvLytlNkYrRmRZSU5BNVdOYlpmU1d4bk5CRlhnWVp5Z0RnbHR5NHl0MklF?=
 =?utf-8?B?TG9HbEZJV05LdWdvaW8zMU41OW5XdUcybzcvMzMvRkdrTHdHRVFuK1I0azNQ?=
 =?utf-8?B?a3NBUFdud2pzKzVjRXVCNEU1Q0d0Q1BUVFZ5Q3F5R2owUmdmWXpTSmtIY3RW?=
 =?utf-8?Q?dwt/WlHhLi5HvsDHXnb4JPXlU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfb59e8-56b1-4d9d-515b-08da76b0e17b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 07:05:29.7498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHAvBBGgkTYhXIPA5jMtbbF8HfppFeQF/E1QS/uU+UPT4hZY4B9ayljT/nRkvmQ4cWJxeD0gjAj3668QeCxV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8614

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> @@ -1046,13 +1047,20 @@ static struct uart_driver dbc_uart_driver = {
>      .flush = dbc_uart_flush,
>  };
>  
> -static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> -static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> -static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> -static struct xhci_erst_segment erst __aligned(64);
> -static struct xhci_dbc_ctx ctx __aligned(64);

Why the change from 64 ...

> -static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
> -static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> +struct dbc_dma_bufs {
> +    struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> +    struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> +    struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> +    uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
> +    struct xhci_erst_segment erst __aligned(16);
> +    struct xhci_dbc_ctx ctx __aligned(16);

... to 16?

Jan


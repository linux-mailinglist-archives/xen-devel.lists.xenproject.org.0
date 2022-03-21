Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9234E22FE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 10:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292820.497280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWE3u-00032M-EY; Mon, 21 Mar 2022 09:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292820.497280; Mon, 21 Mar 2022 09:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWE3u-0002z3-Ao; Mon, 21 Mar 2022 09:10:50 +0000
Received: by outflank-mailman (input) for mailman id 292820;
 Mon, 21 Mar 2022 09:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWE3s-0002yx-R2
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 09:10:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb8028e2-a8f6-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 10:10:47 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-cldyWBRqONKZzz9T1_nF7w-1; Mon, 21 Mar 2022 10:10:45 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6584.eurprd04.prod.outlook.com (2603:10a6:20b:f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 09:10:43 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 09:10:43 +0000
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
X-Inumbo-ID: cb8028e2-a8f6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647853847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMe4OJc7AcknnkGTat9CoAxDfE6TL6bWk5RzmIdSnpk=;
	b=hEQ4sujSv0kCSOebm430pb/MUvq/WbJ1LS8YPWzL3Tnr1VwZApKAsTgRijQG1D26/aVNHq
	b5A+KdejW0UgUGUaaqPhqpcjYIshI2+Rw6o2nOyM6vQOmaX60Ub/4DIK61laPjV/KsYfeT
	UA0nGhIPgeaiiUBZt6hR/m8S3eojX6w=
X-MC-Unique: cldyWBRqONKZzz9T1_nF7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8a8JqceswM+PFofitB9A04jsS4M+BbDSjncG3GXK4hxynFeQLO+M1WuaQD0S+NGKBaTW4flB4J41ewf4HRNsfUHnMoWU88dYs0loQPvElo1IRYOowCmDQ4TajGcubfuOscmz4YAwuilXDz1K670hPpzyu4rclLV+jimhLsrZluOacd7TxJ9BT0SAFpUhIrBa5FpsQEOnBP0IuAPd/NgSWRpoaH1ZwqcH2nmFROLZrEMII+g4rX//Q3sIRJvA5ImTnhmZk14gMIbd9uvCu2E4H/NWZtYq2SsZq1lCnV2RoDZDx+8aduNGDSzhApCqJGxO/nl1l0ijK52b/y+lp+7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMe4OJc7AcknnkGTat9CoAxDfE6TL6bWk5RzmIdSnpk=;
 b=Q2Lvu9BMjSfRYOmFc/TKoXOslLcfMJ9U4oeseAPQUP7gBuT8ewH7VLkq8wLlmrcsyOg9T4WWo156AYOMobaMvYNw7oVnpEsLWOnhPWpgbvc6L0QD0ovKK2BHok8WYZynbz/jGheBCIXuhjdJ14wYPo5cXD+Lg99vIBdll1xvdKE3kJWSInuytbyoIJs8G36yz9Ii8/lbEGn0Vw8xzI2DYs3c7RQayE/Yx49VQL2o7jaBoXYtiZ9OJeDpxpsS6mY0CJLhiBUXNsXZcu9WWteQ1ChU7r26UIGovmIgow5F2H/Q4EM0GHqddVyVtRwWByLlq5GFR+RFzAv4QGTtD1dYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d16f98aa-8307-3add-8253-0616cf5ba2b1@suse.com>
Date: Mon, 21 Mar 2022 10:10:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220318152541.7460-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 909142e5-e09e-4084-2f28-08da0b1aad34
X-MS-TrafficTypeDiagnostic: AM6PR04MB6584:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6584D51DA5F4A5FC701F4DE5B3169@AM6PR04MB6584.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WwA9xI3vIHcgMK0BNKK8ATKcCFfzxUxYRrPp1RkWjg25XfmlQpQ6keovhx1YrEdt1nGIVLcXTQ507Rn77oZhus7lweqTLhK58oU+ByOz/gq1TCpVruWIavPGtuuGFv0CCy9lnF3v3fSN3vF9L9/EajDQaneIU6b0WlUxOp3fPoFMy9yBLjlLl5rbkYXXXeUKzuWHOqnf8hRSkJNJRw7vBZD6jA1HrtTV+Bzo4gCHEP633cw9X+mCxWhrOEJ6py5KzLp7qyCVZiGfZsQipogCkB6aHAju58JAkwA5yAtrP3uGea1wWBbCKgP7zhWHVhw9f5fkok0LOTJ6+ge9s4QUDMH90oL/CBxdg3XIBXoG2beQ6mODpv2xusGglf6Uu9s0vGVz5MNuFx/ZaeuWueA9m0KAGly7RqpvE2WomS08M8MtrTZIn7LRsA2uTCb1IYl2hgqSkygZhIrn/bkUk+OmhTj92/lG4WOjGdsdy3JLuzhY9175VF/hWWg3ySyt3pLUJTdOP8vTNd/EPUhO/d+ZNxRipa5zvHE22jArXDcCDmqU94Yln5DD2pLEp4KNwPnsD66SifGE4ijGE5/BlYRYDSkaV1rFP2ExmFW/OCVl8FpS3SNEc9mfw5vMFY+gU/mry/cGdMEHvlU0K5ACJMOmrDhBbbEHhq/xt2pWXFx15Tru56M0Xt/C15SLtHksx8t01rlSaDGMpnWAuJLXVmtXwNAgblzhl7AbqGEUfEtmGCgL8x89iJE1dtcf00nhRzcR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(5660300002)(53546011)(7416002)(31686004)(6506007)(86362001)(8936002)(36756003)(316002)(2616005)(6486002)(4326008)(6916009)(8676002)(66556008)(66476007)(54906003)(26005)(186003)(66946007)(6512007)(508600001)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHRycDFCQUZSZjJLcXU3T1kwNEtwVlVLekh4U0drNUFDSlVQQlhVa1NFTFlv?=
 =?utf-8?B?TjRBeWxlVUptUkZCemhxRjlUVXcyQUU2WEFoNVUxTUtmSWpPemxSWTRKZ2RM?=
 =?utf-8?B?cUwyMnlBbXhFRktXTGdxK2pFTzd3SE5EL0hQZXk2ZmRlY0RYNitJNDhMQmtW?=
 =?utf-8?B?bjJpalI0RVU2RCtmS2NCRGZnU21sR2d4d3V1cUptQzk3RDNtdi9BOTNRMGti?=
 =?utf-8?B?RktoL1YvU2FqTG1ORXlUdWVBOFRYRGVnOGkwQit6N3QyMVRHRTl6WktUWXZF?=
 =?utf-8?B?N24vaFIxTjBFNkZONlQrVnFTVTZiaTI3UGlPeUJqWHVyOEwyNUFwc0NXZjhG?=
 =?utf-8?B?eUdiVDJINzREMEFNNzFlVlR2WXBqVkNSRk1RVjBaVUZ4UERWTDRWVzhsZDJz?=
 =?utf-8?B?WjVzS1RRenV1NS9iTmRVNUI3RFdDWGpwUENoRzNqY3d6eHozVTdpdjVkZVhw?=
 =?utf-8?B?TEFmZlV4RDNFK1EyUXgvckdYcFlYSERGdU1xeXhuemZ5NWl1M2hFZXhzSWgr?=
 =?utf-8?B?WHNYVGhYdzdIdkhaRWVBR0JuaU9CUmxvdlZoQVJtaExqZjBsVG9yK1p1dGhH?=
 =?utf-8?B?M0ltbTlrWFlQZFVIbStBWERXMk05WWtJRzFPbks1YWlnaHFjbEpFcjlsYVVX?=
 =?utf-8?B?cXJsTmdUUndtNGIzOGlVbEJ1ZmQwQTBYL0sxY2RFbkhLNWQrQ2MzTDNjZWFM?=
 =?utf-8?B?Q2MvL2VML2tLWjc2NXRqMEtHdEs1WXhOcFkxVnJvRVpQTlE1R05KR2FyYmpM?=
 =?utf-8?B?M002aCt5eDVjVFV0dVo0QWtRckh1UnY2cWhrZVltdDRwbW5Fa2Z1TnJtdjE2?=
 =?utf-8?B?MW8vOW5tRmhOUTA2cHEydTVySHQxY2d4WEZ3K0lyTWttcWhLZDdXbEJ2Vmhj?=
 =?utf-8?B?UDJRMm5KOXVPWUFIS1NzUjh3aXgxRkRvM1A2cU1oQ2xzL2habHVpcjVVeVBU?=
 =?utf-8?B?V1NYMU5kK0NncUF6NWlxVFdYWmI4alVDRlFISTdvVnZwbndDV3R2L3JudHNS?=
 =?utf-8?B?RFZaUTU1OTNkZllUY3RCNzRWOGhNTzhTRmROZEFxdnUrNkZIdHNGcE1XQjIw?=
 =?utf-8?B?QjgzR1R2YTFQMVRkbWMraDZDNWdkOEpaN0YwZzNHMkk0OWxKNnlWUExUYkNG?=
 =?utf-8?B?OUNLYUtpaU9UY3RrMTF1Nk9nVkJqb0lsVmpFb29QaW5HaDF6b1I1eTlIREhj?=
 =?utf-8?B?V041RUk1c2tGSjJMU3hiTUN3bHprekdZcGFpc0RzTmtBMXQyZENNbFFyZ2xp?=
 =?utf-8?B?ZEFVUll2alpFQVlxUlFCc0NZR1VDeE5sQ1FJeU9JalViSmZmd3BJd1UyK09O?=
 =?utf-8?B?eFJyR3VSd3J0ME1sSDZrMnBoMlkzZmQrdjdTMFlOdHZkcmJRU2E2bDIyU3h0?=
 =?utf-8?B?cmp2SzAyK0h3b1B4NUxKUnBZRjUvWU5qdTNBaHpQZGZFNk1nKytFWXFnUEUw?=
 =?utf-8?B?OXNIdXNNeld0MFJTbmZvUnVRcFpCc3huOGdUcHJtUjdwam5RTFJWRkdOWnQ0?=
 =?utf-8?B?bXVlZThhTDQxZytYNXVNZDlMUUdoRCtFc0JLdHdTdHpWVmt3bVZDdXNadUJJ?=
 =?utf-8?B?aERUbzlZTzdXVHJEWHU1OS84VXFBNXdFbklpYytTOXB5anlqWUtmbzQ0NmI3?=
 =?utf-8?B?UGFVODhsc2hzMXZ4bXM0eGkyR244R044dEt3QkhjZEdZQkV5dWs1eDlNMlI1?=
 =?utf-8?B?QnBkZVk3VVBjaVRoZm9ydHZwTlhqVzNaRlJSVVIyWDR1R2hxcElWMGtOUlky?=
 =?utf-8?B?WnJ3aUMxNWQyUnEwc3lMRitsb0YrYjI0b0s0dmpCcUZJYURQa29taHNWaXJi?=
 =?utf-8?B?VHk4NDBMenhUZ0JYRE1UcnQwZHNIN3FsbHZwVUVDaXorQ1VDRVhPeERySmI0?=
 =?utf-8?B?Rzl1eFcvd2R1TEVyd1pOMENaMjI2OWszdDlXTENMd2JrclVNUW1VSkhpNjA0?=
 =?utf-8?Q?LaJCPE/eqY8V/L9y5C64zCloUU68K3Gl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909142e5-e09e-4084-2f28-08da0b1aad34
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:10:43.0229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeTjrjXr5UrQbERwDsMRV7t8k+egf8PmPox+JZ7OKFWtQB9S8bPXwRkDFun+5t7p7YdSy3OuIY+W5eqTd6YxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6584

On 18.03.2022 16:25, Luca Fancellu wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_ARGO) += argo.o
>  obj-y += bitmap.o
> +obj-$(CONFIG_BOOT_TIME_CPUPOOLS) += boot_cpupools.o

By the looks of it you appear to want to specify boot_cpupools.init.o
here: All functions there are __init and all data is __initdata. That
was string literals (e.g. as used for printk() invocations) will also
move to .init.*.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1176,6 +1176,25 @@ extern void cf_check dump_runq(unsigned char key);
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
>  
> +#ifdef CONFIG_BOOT_TIME_CPUPOOLS
> +void btcpupools_allocate_pools(void);
> +unsigned int btcpupools_get_cpupool_id(unsigned int cpu);
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +void btcpupools_dtb_parse(void);
> +#else
> +static inline void btcpupools_dtb_parse(void) {}

I think you want to avoid having two stubs for this - one here and ...

> +#endif
> +
> +#else /* !CONFIG_BOOT_TIME_CPUPOOLS */
> +static inline void btcpupools_allocate_pools(void) {}
> +static inline void btcpupools_dtb_parse(void) {}

... another one here.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4E56A0BC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 13:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362928.593216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9PH3-0001yt-PO; Thu, 07 Jul 2022 11:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362928.593216; Thu, 07 Jul 2022 11:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9PH3-0001wM-Lx; Thu, 07 Jul 2022 11:02:21 +0000
Received: by outflank-mailman (input) for mailman id 362928;
 Thu, 07 Jul 2022 11:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9PH2-0001wG-2r
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 11:02:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 446ef526-fde4-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 13:02:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4627.eurprd04.prod.outlook.com (2603:10a6:208:74::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 11:02:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 11:02:16 +0000
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
X-Inumbo-ID: 446ef526-fde4-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3DUmzbGpHitjgWqA//jU9T2t7XetRXn05nLxUp/cQP8tGPwsIinkh18oSym4nMHz7IwZi/ArnUG8Gv+3WLh22PSV4lxeKbzPV5cvxciFYtKXeWAjSGxraZPtPTi/ocFNY0dGWqlzge+E6IHWpWWgNdzS/SniCjCAd5i13mdpt07lLOtpbAgL5JjK0GWau780RTLKqPof0+15DtqO3oivvwccnVlLh4hDDy6j7th1hyITFFfZE9SfeWwfNWoIbuoHrjz1QF6pomFjgqIVOpKQv+FgqEw5FLUyOYKfRCvSJtvx4vqK+jiGwnHCN7iAU5DzLXQQFktUT5HDQroYhOsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gTBnkG3u3nbW69rLllx7S8Ed/m8Y9An/koezV6cZ6Y=;
 b=m4CikfXT1mQLbtluMPnrKvgvL3itPk3863XGKMvmbw3EeLa2BGRHRrP8iyn2aUZMuKZRaniKyI9OiEiinvwjbBKid+xb8XRTW+8dtwCdIJjQbJgSXlGfXpfEpd2NYQARN62ET2AcKRB1kVfQ454sCaCF4IIk2CbQat9rPa2vmH19EwYmrR08GhdMYLN/TjbPjuuRtAJ1RocKeAiwfuPtuSclrV0MRMDBmkEmN+5sf3uVntizjuerznThqZ8ikw8sBk7y4K/Ysw0Vf6Qy/AUMsy739TLafkavTh7+5FNGUFGdWNOYJIFqSSLcqkTNRpQ7WWI+WyHoJtoq7iFyqZN40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gTBnkG3u3nbW69rLllx7S8Ed/m8Y9An/koezV6cZ6Y=;
 b=sitFvSYrVZPBhb5VjKWi6aMmBXMXbphuCrIsdP1//bMTBxR8eZRCCu6CeMa967gFdIehBfr111PVcZ02n3Msdtu7/oFVtcxDr8jAm/YP9nd+nTA4zdF9+iF3NyBnSsxQim08WuRPRjWSc4US0w9GCHlu3ONT0hCkv0PfNIcEluNSKAs+5R9ChjLkrAllAyUhmg1IYHWmbUL2KW85DSATuVn9PXW25cEmxuldItLn98e9qd1F29CdIi0hiqnGuJKFA4bTYTC8+kgqm9jyLXbgdFg9BKqUc315EwVVFQ6h4NpnY7+JxPj8Ejj6zubVfqVIilEvdGDgIZH83VAl4SlSig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d24ac7e-c46f-b6e1-64a8-e28b2eec471a@suse.com>
Date: Thu, 7 Jul 2022 13:02:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Config.mk: use newest Mini-OS commit
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220707093911.22182-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220707093911.22182-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6212f580-4141-4a38-27ad-08da60082741
X-MS-TrafficTypeDiagnostic: AM0PR04MB4627:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L4rXSit6fyRuOByYWmazqv6F2t+KGdygZZ6Qk6VDEJ4La7n+Vkg3N9KXVElhvLctCx8IS9CiVqasxhSpZc0oQEyYClWfxJoG/cLWOZq4SS1jINkQu4P73EAmtGh/Mer0+7M/gLJYXOVbsIKyrYEClcPw8Kb73vFfvcAQDZHLXiRydmv+jwMh3beuO9/2nia1nTEmUtBRV5o/Fp3nZH3PxHKBMwMhpwwoNxLJf4WQHVSFOVW9jekfzOUq4Quos0J8R/GMt0fW2VyXHl+zQbvxJNHz6T0vdS+Ku4GW+PmSS67JaneIRMjn7Fi6ffIuHFz/WuuVco6+JOI/HVz5CJz+EwycJ7whh9eYkfm5AvAa9zJgqg2fL2qj87fE7oe53fu2saEgPoesF9u4ngNxuGdSLEozhFnszl6lTKusNgNXPubUEAkML88BN9wMV9EthdWXL/fJhUpujzF1ddCH6dPJ1GF5neIfIPXu+Jfa3qEdxVYPyY5sgMOEPMhFRSgyceqnEYCddlnDZ30aPm/PwxtRCxLRHZFwODzUpApohHAw14jyeE7kHUd4nBy0PnfwK8qbqBL8XQRv2i5H4Nb2JlGHL8/Du+ioS89JN5I9aK/FyvLexIy2BUdyx7+KmDoasmOTIx6gcbBjq/Cv9M/PCi+SPCOAz9/5Yqqi0AMdhDv/3QaK51HY1B+wTQOKuQRN2q4E6UnISc/jCxlcKK3Zh0M/9Gyqy1VJKxVSstNzei/gl1gmjDkDWOKk7Po/xjikgN0k7NWFUaCHvKxbz9U8Kl2OI4z7e7KDxOSCQbSO0epQAzgoA7/yJ+f/NqzbCARKwxLPCQiXPjC6frdkG8nTv/xEFnoYKc7v34XN7AI7BOSPMoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(37006003)(66946007)(66556008)(66476007)(41300700001)(53546011)(8676002)(4326008)(38100700002)(36756003)(86362001)(6862004)(6506007)(5660300002)(31696002)(186003)(8936002)(2616005)(6486002)(2906002)(6512007)(478600001)(31686004)(26005)(6636002)(83380400001)(558084003)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkV1aUVlaUdDU1gyS2Y3UXNYVGpzNzJTSDVFclI1RklvSzJDTkt3citQZThD?=
 =?utf-8?B?aEtkd3lGaE5pOUppS25KNm5HNlZyQnJvT0MwSHZuWktBdU9JNnRhQmFwOGx0?=
 =?utf-8?B?RVF4eVlqb1YxTHk5SE4yR0lhY0JlY1dwdGR6TmpScktqNi9GOXluM1QxRVpI?=
 =?utf-8?B?Tm5EUE1LemdqUDNXd2R2Ti9HcHlZakJycGtYZWtaQXRSaDZNYmJzUXN3RXNQ?=
 =?utf-8?B?dTlXSmVMMWdkN255SGhYeGlWOGdxRWt1LzJBV1Q4aTlBN08vbEJHYjk0VnBu?=
 =?utf-8?B?ZVc1TjFOYXpiVWg0ODVTWWpQZHRrTkRUdU8rUWNONVloL3ZpRmtYWTczaGJs?=
 =?utf-8?B?aFZlczhwbFk2dnZxT0ZtVGtVNUdoS3ZFOHk3MTZhWWJIOXdqN2w3QlFqSDQz?=
 =?utf-8?B?TURSUGpwNU1jNUxrVzdnVU5tZ3R0VXAyUG1GQWNETHZ1Ym5PRGhTYWhPS0pj?=
 =?utf-8?B?REFjUThZWmNzcitDNTY3eE9sbm90Z0NZZ1h5U0VsMmV4b0plZFFlM0NLVS9n?=
 =?utf-8?B?QVlvZkJHRXozeUdoZXVOL1RHbUwxbXVUdHNFOXVSRmMyUVZzM1M5UFpkbVF2?=
 =?utf-8?B?UlAvTFVMN3BCY0FmSWYrbU9qK250S3cwME5EL2pBenBoQ2xkcHpDeFZZdGEv?=
 =?utf-8?B?dWExQXE2VUFZOHdVRmh1aE52anZSSm40WmVRTVdHeDlLT2NJVkZnOXVGelY5?=
 =?utf-8?B?SlkvZldQR0xNR0xyZ24reFRjcVRrY3A0VUpybjJ2R2tFN3pJQ0RQK2lTOHFP?=
 =?utf-8?B?SkR5eFY1KzNaVHoyKzczby8vamEvb2VFVWVDcXpEcENpQ1NrYm9Ca052TDQv?=
 =?utf-8?B?YXVreVBlTlZmL0ZWaUVISk95RzBYM3VGYVRzNjNHdDMwK1FwVHVpTTVUdXpS?=
 =?utf-8?B?STFDMTA5YWZDbkxGdmpDMWdLWFZ2RUVXc2tyV0c5a1IvNFY0cDZDNXlCTS93?=
 =?utf-8?B?RVlxVGtnaTBpSkM5VUo3VjVVTmJEMHhOVDMxR1FaMDhnakhSTnhPU01TdGRq?=
 =?utf-8?B?SldEbjUwTUZHMWVVNXpvd2g0b20vSUhtdzZZbU1uTGMrM2hzUTdRMXpBVWQ4?=
 =?utf-8?B?TW53L1NoYWlmTFUrOGN2U3NXNWVIWjdBU0RPZWI3akEyQU5GVDZYYkZuNHR2?=
 =?utf-8?B?S2Yva0NERHZTRHdxWHczUEE3NXlrSTBsR1VyTC91YXBCWXIrWmxpRmpNQ0sy?=
 =?utf-8?B?dWFDZHg3cjZJbnl6dURRbG1XVkozc0kwcWY2YndUS2lTeHUrN3RVbTdNNWQ2?=
 =?utf-8?B?Y1V1eTFkNm1DcHlRZVo0ZUFKWjJmV0d0UG8ybFlsb1N1Q2x2eWNXdEE4TDNY?=
 =?utf-8?B?RXF5b0x0TWxlRVdNSUFDaTFKK2h4MjZncWZXQjRlZ2pmOU83eW1oVTdzZzdi?=
 =?utf-8?B?Rk04ZWdsbEFZWkJSdWp0VFdjSnJ5M2lZRXJMOGtzTTcyc2ozeFdXekNGNGpw?=
 =?utf-8?B?Tk5OeWU2UTVZTXNVY3MyQ0g2WFZENkQ1MTJ0WHhxSWRGdXNmZWhKUElwc24r?=
 =?utf-8?B?Mndwekp6TVZhSDdVK1JQTWs2c1FTRGJaT3BLY0tTZlFCOTI3Q2NnSldnZWht?=
 =?utf-8?B?NEJzWkpSeEgwZ0E4OGpTU1FYNXh2OWltL0JSbDAxUjNBYmVubjdyQm1MeERx?=
 =?utf-8?B?ZDl5NW9rZ05udGhjY3BPRnp3U1d1Sm9maWVId2ZETHE4K2dIbEQvSE1UZUFu?=
 =?utf-8?B?emtqNVdEaVFHdWNqUW4rQ2txaWdhRGlPRVViUWo2czlBNTZqQWk0eGZqS3NG?=
 =?utf-8?B?OUtDQm9kTUVPWHVFMFE4ZWFtYUpGZHZzcWF0RVVKcEpUT0wvUnNCQWEvMGl0?=
 =?utf-8?B?ZVpZcitMMUpJL2pQQ29ZNTRGK2V4bEg3bHE1dVBIT3JpVnZkSEhrWExBdjlI?=
 =?utf-8?B?UmhMelJlTVY5S0lCaEwyMnVLaEMrYlRvVnM4UXcxRzhKNVRreWdCTHRtaDNp?=
 =?utf-8?B?RWtNT2h2aEdTRTNjRWdpaW5DUWlxc1YzVEx6N0VBV2VvZTZNbHBTY2h0Ylkx?=
 =?utf-8?B?ZWtmQmo2dkVYMlo3emRmeDczWE82c0xYRjJmelcvd0tzM2hrZFFVZVI3cVM1?=
 =?utf-8?B?bjR1L21oZjhDZUFXbTRzVHByUkRwZ0cybGNXQlJPZ0VjWEUyMHZaNTExcWRS?=
 =?utf-8?Q?5mXq6x9RiwuOudr3KdS21TNmG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6212f580-4141-4a38-27ad-08da60082741
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 11:02:16.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIyXsKRktADmb0GE0SI7YBx8dSw0ZdMoiwCSCZ0g2Bl4K7TCAhFFjwpnjZSYs/1BtNsQqi0jfgGY0wu0Im+6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4627

On 07.07.2022 11:39, Juergen Gross wrote:
> Switch to use the newest Mini-OS commit in order to get the recent
> fixes.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



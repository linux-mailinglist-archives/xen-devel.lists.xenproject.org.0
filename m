Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E2537972
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 12:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338487.563264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvcyP-0000Vc-Cd; Mon, 30 May 2022 10:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338487.563264; Mon, 30 May 2022 10:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvcyP-0000SG-9a; Mon, 30 May 2022 10:50:09 +0000
Received: by outflank-mailman (input) for mailman id 338487;
 Mon, 30 May 2022 10:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvcyN-0000HL-Bk
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 10:50:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 426ddfe3-e006-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 12:50:03 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-zfis8wzPNaO_UIwOyWzctg-1; Mon, 30 May 2022 12:50:02 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8019.eurprd04.prod.outlook.com (2603:10a6:20b:24b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 10:50:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 10:50:00 +0000
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
X-Inumbo-ID: 426ddfe3-e006-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653907803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/FKC5hZklglj8jT5R2319imn7GAD2On8rEgmbXVx6ac=;
	b=Z5uBCHvAbrMLAnIUDpkGbfjHAIsIyzza6QYsMKKT5THpS/IwvgHzUa2m8xQYfCgo+mFYzp
	pvbx7b4dYg9dGWBLET/qrIoYvbZq1ujmlgmGRU2tZdExYObqY2OEgG+kf0Stsrf+kHkASK
	LagIOlHvzSy9nZFtOj58XhzRqD271TY=
X-MC-Unique: zfis8wzPNaO_UIwOyWzctg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYHWgBHhVuByqnopQ11POKU38Rf/7bauHuwjzGJWyZaKjaE7X+A/jhEY4a7YweuJusHBs3Qf/3nMwxd6lUEd5WrlVwO3yuLxC/9XJRQyv/mcwHJW0/vwuvTMbhx1h09RFNhP/0u0Ttn9kMeVF5+0g9V0ezgDb1VxTGdEoDYjyZcfNUEL68EWEZky6r80pK6K3JGpJGTEn38WlxoZ2WqgOezVn1HqllIGuZjWDVAlFRsRQ7GmqGprmlHgZiao5vHQg5FxdGF8JBUxGFdjoFineJ0LnjzdWdX6HVRBmogc8KdjSZ8Dif2Qg5TqMYB9ql3jboIUzw+SQ1xrkHw0FKFMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FKC5hZklglj8jT5R2319imn7GAD2On8rEgmbXVx6ac=;
 b=a0ZI/WzGG1d4rYHXEXM1+3I3jC9cAzg9NEbBI93V4PBsIYNPe23AxjsbbT+3YYsnTpFONj+NOOUqcUhQqgOPha6ulOgc9VM5HpmHrLkYO6IK4Ib+ZVuSuuog3pVSPf+sWWblJ7+SyQxZ3O/dkrXoT674Uxb8KQA5dJeV74SA39gHSvfXh3L2a8Kb8IHLpNxtMn66jUimnDQAeZJno8yv7JJ5PviGNd176/3GPv4OFMkxR9ftYDJOpuI3R0oytZq3EApfKV4D7HBStQx3tY3Aj1i8Xa7Gk83q2xixakiBToX1nyhCSyDPAem4BTEvbFmKseAJA48pG1xMk5PHGonUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8fb558c5-bc9c-af86-d425-974b8c45768f@suse.com>
Date: Mon, 30 May 2022 12:49:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [linux-linus test] 170771: regressions - FAIL
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <osstest-170771-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-170771-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0029.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea09d61c-0fcb-49e7-6554-08da422a24ed
X-MS-TrafficTypeDiagnostic: AM8PR04MB8019:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB80194E6D0F6970CCC800FCE7B3DD9@AM8PR04MB8019.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3HwYsxEgnzfhOcNHalUUkSgyPOQYXMBVgIckC03rsqzrHv/hWrb8cf57SVCmLSEmmPlXgwFQgF3eKnhp3rgZNheKUnDSHPTOJcAlSamv0yBzHUTfA9GYw3tay07V4qX1kVYQ2bzTH3cmfd1j9c2a6+ycn4wREWvQH8iUCxB1EvQNnH/NBRDx381uB+UE8hzRfsQ7CC/VYfEgBswjE557e9TK821jkKnefBDLdlN4Nyv7QlFHGpVlwmLNx2oSH/2XjlKU+TXOh+Xz6IKpQWU0H/yo+H7QN9yQ9E8iYDgd4e5LhZQyIzQBieZUzrrpaoBxugvCM+FYYYdfEkYkor9g5IBYSeE9znoH+ocwOuKiI8R8I5Ntd8BRx/TSKUywDxzT5/e7VRu/TmB9dfL7Okhs5OiCa/lCJs/j5opONoLEsqvYQqIy2KK8IEea7j0wY2WfSKEPSIS5N5Z65fBzeFfLOlrqnXOxVFySn20+8ezDgdHBL/byU8vaFvGIz8nzCzSLcGhn6NeTu+ga+MPuGrQyxT08E18s56b1T51SjkwDOI0FpiDWcR2G8ikWeNATcWA8wWSPxL2hBsIloRvpBEJQ9qE6tvYw8Hqdrc1teVOQTffHhJPrO9EHa7813NjAYECvo2+CyZSLxxLEYv1Fdf12KBZ6RQkMJf+04eDjg9cIZ2ok97MgMhmbqIx0OdAvg9M4VgE7huJJSIitFfRIFTW6NTHFZ/Hc1+sZ4sbkl+okkoomD/EekwofGPZGDK61jLXuZO7NJvt+yNGerEcWXpO+S5a+AL17MkUlqJ4RTJxDoIs4KhRfwHlN7fw9IYUSogXBoV32HEtrXjkOTJI+ZJr6DQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(36756003)(508600001)(31696002)(66946007)(66476007)(186003)(966005)(83380400001)(4326008)(2616005)(86362001)(2906002)(38100700002)(6862004)(6512007)(26005)(6506007)(31686004)(8936002)(53546011)(6486002)(5660300002)(316002)(6636002)(37006003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVlZTNFL1M1WjFWTlpEWDlzb3JSVnZVQXBwQmNCQ0VWeGRwN1RGbzBmWjA3?=
 =?utf-8?B?S09yeG5uOEhYc3hrV3ZtNHYzbGRVVFMzRWRSajQwSkZ1bkYzVnlLL001dE9P?=
 =?utf-8?B?MlZtSnJ3ZmZpVWJVU2xORjZIU2t1TXdYcnBqNWpzZGZDblAxdWtIVndlUzlI?=
 =?utf-8?B?Qko2L09qeW1aM1d5S2dxcTQ2MUhMcDZZMHlpMnEvWVVCcy9GdUVENGJwc09I?=
 =?utf-8?B?VnJLSmFzMThKTG5TUjhwSUdjMGE4WjQ0cGRmeS9Gc0N6eFhMd3pnQTNhM2FK?=
 =?utf-8?B?RGV3NjVmTGxOVDZySFpISVVFTS9jbTNZdnczUk5hZysySEdxU0drbzBzMG1S?=
 =?utf-8?B?U3dSTXZtUDZsam5heCsvTFZYZURWR3llWnBOVGd5ZG05Tit5V2FiYWUrR0w5?=
 =?utf-8?B?U3Z5SGpiZ1RFcmdPNElub2V0cEtXK0huVk1WUWRUc1FBY0RpSnB4eElSeTFm?=
 =?utf-8?B?VFlJWDdpVUhpR2cvYW9lLy8vU3l3TnY2MFlKNU5na29SNHZaOTQ2UWphOFFa?=
 =?utf-8?B?UGhpVVNrNEJlYWhMaER5TUxOMlc2MERSWVRYNVlUbTUyUm11b2hVYTdvc1Fj?=
 =?utf-8?B?TTVHM0tWNHdWTTVtRnpPZGJ3eG5mUS84U3AxNzV1Yjkrc3RabXZuaDFzeWVR?=
 =?utf-8?B?SWRiYi9GMFpCOU8xTTBRQ3dyeUFiZG1HRzBJclM4OTZhSUQxenJCNkJmdHFp?=
 =?utf-8?B?RmhhdnIwU21VdlY5OEhoT0VvdGtQOWw3disvMHZiNFlEeWhwYXJOVDVJZmJ0?=
 =?utf-8?B?RHBjVGNQOVhSUmtPNENkL3Y2bDlQQ01wUzJYZnFsTVJjZ3JQOEFKQ0FiWjdQ?=
 =?utf-8?B?bEpHWnR1RjJtSlo2Uy9WRDVXZTM0U0ZSV1N6aUlnNDUwWm5zNVR1bVFlK0Rh?=
 =?utf-8?B?WW9HM2xZeDVXSXU5MHdGQ09Qd1ZEUDZRSU5EZzg5UG9ZelNnZitOTzNuRXRR?=
 =?utf-8?B?NGlyRnJNUnFIcXl4Si9aM0xKTnA3cnI2Yk1QVCtPTnA3Y3RJSkUyVmcrSkRO?=
 =?utf-8?B?QjJWNSs2bzZaSmZjMEwrUGQ3TC9ZYStMU0pmRmpaaGhoRFRWcDJta1dScENl?=
 =?utf-8?B?K3NHQXVMdnV6VUFaWXlPWmpzb0JZVmlnTWxHVHhsSzUzcEFNTk84QWtTR0gr?=
 =?utf-8?B?TTNydFJaWURWbGptTHl2SDJudUV5YVErSTRWbTZQcHIzK3Ivblpob2h5ZGVo?=
 =?utf-8?B?bGExRi9TWE12WW5hYnJXdlAzZzlVcmZLbUZBK0RxMWF4amlJc1RWbmQwZzdG?=
 =?utf-8?B?aVJaRDF0T0hZYVFKNGFFWS9Pd3NOVjlDSzRsZkhxVUs4TVplYXN2YWNJbklJ?=
 =?utf-8?B?RmNaWlljbzRvWEVwQzZXMG1QL0k3bG5YS251bGZnLzNPWFpBcmtrTERqOWRm?=
 =?utf-8?B?N0d4bHBScnZIMWxCN3gxa0dkZkt4ck40Smt3c3NuQkdGcVRqbUVmQ3JOZjlH?=
 =?utf-8?B?OUc5WUl6RUNGM1NyV1FSQUtLeFFRYy9sVGY5enUzWVNtNklOMU1yZjhXb0J2?=
 =?utf-8?B?YklOVjVMczdqbHJCVjVuMWxSR2VQbEJSL2srVk04RTZiMDg2cU1sVDVNUk1P?=
 =?utf-8?B?ZG9vdDhZaGliVG9ldXNtU0x1eVNubU1tRGw2bFNvQ0ZnVWl3VnZuQnFLclc1?=
 =?utf-8?B?aG1CZHV6elRNUVo5YkhLN1p4WE5VRGNGM3gzMldZZUxjRTV0b0ZXeXlwR0F3?=
 =?utf-8?B?S1NlK25ZLzQremo0NVNrNlIrc1M3VTl1cTdHV0ZSWThHTUFiOE5hV0pyb3Ar?=
 =?utf-8?B?QVJ4Y0tZQmxUTVVNdXNsbDdZclVVb3drOHZWdUM4UG5XOHhkNXdlaFZDTTIx?=
 =?utf-8?B?MTEweWFFWWFuSVNYbERMc2NQUzgwTzhWcThvanlhVklGNEE3bnlMZ3BvZmpY?=
 =?utf-8?B?TzFMOTNHNlF6b1pUK2diWXNXV3FnZVVoaDR5dER2cThwaGhSeE8zNC9KNkow?=
 =?utf-8?B?L1cwNkVUTlNkNTlqVEZkdCthSUNJL0U0VEh6QkdmbzlFcWg3OW9IWG9raERn?=
 =?utf-8?B?VTUraHY5MnZiVXVZRlExUkwyUmQyM1lOSDhnQldEaFZjVHBxS1dNbmM5Tk5V?=
 =?utf-8?B?UXRJSU9uN1FEam5CeGxmaWtSS0x4WWNIU0haRW1rVWJleE1ra1prRkpQajQv?=
 =?utf-8?B?UkpidXVMNEM1bGswNGVkSFNHWXVUZzl4UUlQMjYyd3hwY3pZS0MvbDc4YmZS?=
 =?utf-8?B?cWRXMWFPR1UvZzdhVmpqVXc2WENRa2h6UHlyYmdlZUNCTFlockYyVkk0ZHJL?=
 =?utf-8?B?bmJzTnVuOE9sLzhxQnJHS3BWT2JtcDdxcVRPblFNNVZqQVJwTlJHMURzOHJn?=
 =?utf-8?B?ZTR6SUJVSVlDRzh3QlIzQXdoRThhMEJrNWhwSnF0cW9QQ1RMdW1qQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea09d61c-0fcb-49e7-6554-08da422a24ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 10:50:00.3975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/tgBXPXZr0WJU+Z0jesl0IOemw6f/yvvrQemJ3AhqCA+1cC6Gr1/1hZ4HKDGTusiq4rncMcAAfZVZDgyW6mvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8019

On 30.05.2022 11:03, osstest service owner wrote:
> flight 170771 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/170771/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 170714
>  test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 170714
>  test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 170714
>  test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 170714
>  test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 170714
>  test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 170714
>  test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 170714
>  test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 170714

This

vif vif-1-0 vif1.0: Asked for 0 slots but exceeds this limit
vif vif-1-0 vif1.0: fatal error; disabling device

to me looks like a regression in netfront, considering that there
don't look to be any relevant netback changes. I have to admit
though that all three recent netfront commits don't have an
obvious connection to the slot count going wrong. Or wait - isn't
this a result of 6fac592cca60 ("xen: update ring.h") touching
only netfront, when netback also has a use of
RING_HAS_UNCONSUMED_REQUESTS() (in xenvif_tx_build_gops()) which
wants an actual count, not just a boolean?

Jan

>  test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-xl-pvhv2-amd 14 guest-start             fail REGR. vs. 170714
>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 170714
>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 170714
>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 170714
>  test-amd64-amd64-freebsd11-amd64 13 guest-start          fail REGR. vs. 170714
>  test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 170714
>  test-amd64-amd64-xl-credit2  14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-xl-multivcpu 14 guest-start             fail REGR. vs. 170714
>  test-amd64-amd64-xl-credit1  14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 170714
>  test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 170714
>  test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 170714
>  test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 170714
>  test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 170714
>  test-amd64-amd64-libvirt-pair 12 xen-boot/src_host       fail REGR. vs. 170714
>  test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 170714
>  test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 170714
>  test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-examine-bios  8 reboot                  fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 170714
>  test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 170714
>  test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 170714
>  test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 170714
>  test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 170714
>  test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 170714
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 170714
>  test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 170714
>  test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 170714
>  test-amd64-amd64-xl-vhd      12 debian-di-install        fail REGR. vs. 170714
>  test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 170714
>  test-arm64-arm64-xl-vhd      12 debian-di-install        fail REGR. vs. 170714
>  test-arm64-arm64-libvirt-raw 12 debian-di-install        fail REGR. vs. 170714
>  test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 170714
>  test-armhf-armhf-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 170714
>  test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 170714
>  test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 170714
> 
> Regressions which are regarded as allowable (not blocking):
>  test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 170714
>  test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 170714
> 
> Tests which did not succeed, but are not blocking:
>  test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170714
>  test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170714
>  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170714
>  test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170714
> 
> version targeted for testing:
>  linux                b00ed48bb0a7c295facf9036135a573a5cdbe7de
> baseline version:
>  linux                d6ecaa0024485effd065124fe774de2e22095f2d
> 
> Last test of basis   170714  2022-05-24 03:27:44 Z    6 days
> Failing since        170716  2022-05-24 11:12:06 Z    5 days   17 attempts
> Testing same since   170771  2022-05-30 00:40:40 Z    0 days    1 attempts
> 
> ------------------------------------------------------------
> 1928 people touched revisions under test,
> not listing them all
> 
> jobs:
>  build-amd64-xsm                                              pass    
>  build-arm64-xsm                                              pass    
>  build-i386-xsm                                               pass    
>  build-amd64                                                  pass    
>  build-arm64                                                  pass    
>  build-armhf                                                  pass    
>  build-i386                                                   pass    
>  build-amd64-libvirt                                          pass    
>  build-arm64-libvirt                                          pass    
>  build-armhf-libvirt                                          pass    
>  build-i386-libvirt                                           pass    
>  build-amd64-pvops                                            pass    
>  build-arm64-pvops                                            pass    
>  build-armhf-pvops                                            pass    
>  build-i386-pvops                                             pass    
>  test-amd64-amd64-xl                                          fail    
>  test-amd64-coresched-amd64-xl                                fail    
>  test-arm64-arm64-xl                                          fail    
>  test-armhf-armhf-xl                                          fail    
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
>  test-amd64-amd64-libvirt-xsm                                 fail    
>  test-arm64-arm64-libvirt-xsm                                 fail    
>  test-amd64-amd64-xl-xsm                                      fail    
>  test-arm64-arm64-xl-xsm                                      fail    
>  test-amd64-amd64-qemuu-nested-amd                            fail    
>  test-amd64-amd64-xl-pvhv2-amd                                fail    
>  test-amd64-amd64-dom0pvh-xl-amd                              fail    
>  test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
>  test-amd64-amd64-freebsd11-amd64                             fail    
>  test-amd64-amd64-freebsd12-amd64                             fail    
>  test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
>  test-amd64-amd64-xl-qemut-win7-amd64                         fail    
>  test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
>  test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
>  test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
>  test-armhf-armhf-xl-arndale                                  fail    
>  test-amd64-amd64-examine-bios                                fail    
>  test-amd64-amd64-xl-credit1                                  fail    
>  test-arm64-arm64-xl-credit1                                  fail    
>  test-armhf-armhf-xl-credit1                                  fail    
>  test-amd64-amd64-xl-credit2                                  fail    
>  test-arm64-arm64-xl-credit2                                  fail    
>  test-armhf-armhf-xl-credit2                                  fail    
>  test-armhf-armhf-xl-cubietruck                               fail    
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
>  test-amd64-amd64-examine                                     fail    
>  test-arm64-arm64-examine                                     fail    
>  test-armhf-armhf-examine                                     pass    
>  test-amd64-amd64-qemuu-nested-intel                          fail    
>  test-amd64-amd64-xl-pvhv2-intel                              fail    
>  test-amd64-amd64-dom0pvh-xl-intel                            fail    
>  test-amd64-amd64-libvirt                                     fail    
>  test-armhf-armhf-libvirt                                     fail    
>  test-amd64-amd64-xl-multivcpu                                fail    
>  test-armhf-armhf-xl-multivcpu                                fail    
>  test-amd64-amd64-pair                                        fail    
>  test-amd64-amd64-libvirt-pair                                fail    
>  test-amd64-amd64-xl-pvshim                                   fail    
>  test-amd64-amd64-pygrub                                      fail    
>  test-amd64-amd64-libvirt-qcow2                               fail    
>  test-armhf-armhf-libvirt-qcow2                               fail    
>  test-amd64-amd64-libvirt-raw                                 fail    
>  test-arm64-arm64-libvirt-raw                                 fail    
>  test-armhf-armhf-libvirt-raw                                 fail    
>  test-amd64-amd64-xl-rtds                                     fail    
>  test-armhf-armhf-xl-rtds                                     fail    
>  test-arm64-arm64-xl-seattle                                  fail    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
>  test-amd64-amd64-xl-shadow                                   fail    
>  test-arm64-arm64-xl-thunderx                                 fail    
>  test-amd64-amd64-examine-uefi                                pass    
>  test-amd64-amd64-xl-vhd                                      fail    
>  test-arm64-arm64-xl-vhd                                      fail    
>  test-armhf-armhf-xl-vhd                                      fail    
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>     http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>     http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 
> 
> Not pushing.
> 
> (No revision log; it would be 213846 lines long.)
> 



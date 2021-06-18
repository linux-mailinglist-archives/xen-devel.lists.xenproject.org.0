Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6719F3ACCE3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144677.266262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEz8-0007qq-PH; Fri, 18 Jun 2021 13:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144677.266262; Fri, 18 Jun 2021 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEz8-0007nk-LV; Fri, 18 Jun 2021 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 144677;
 Fri, 18 Jun 2021 13:56:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luEz6-0007nL-MG
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:56:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 799eaaca-c007-4cda-bb49-b270da288724;
 Fri, 18 Jun 2021 13:56:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24--X6NwHmXODa7Wrv3E9pPuA-1; Fri, 18 Jun 2021 15:56:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Fri, 18 Jun
 2021 13:56:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 13:56:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Fri, 18 Jun 2021 13:56:26 +0000
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
X-Inumbo-ID: 799eaaca-c007-4cda-bb49-b270da288724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624024594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0IlHbQIb8QAuQiCHRkHuq1/u0D/+ApbhwMnMZj1PMg=;
	b=GbrweQHiTWIWeJ+Jedbu8UKfWn5HYNgZfLohad8XWycNBvdejGOFafwK9LJpcBGwxhkRtK
	5b9XFDSvpcUz8DF2rCdJqZqx8XqEXL9XSOnUVxHBuS2lkKsT4+ubpYiv85G/SXzMI/A8Fj
	mMzxhq5liyhcsPuDP6DAecX/CSje8Pk=
X-MC-Unique: -X6NwHmXODa7Wrv3E9pPuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5LYxYfsUOQIUOBpPn2p8l3xsi/N2x0Sp933Q1cApTDjkSfWW5xPMeIb2uL+IiLj1VJW1X/98Wd1TTkl7oLtN4VXXmim2gmPGy8ZTOkIQTrKEiolhRB4bFnLK3PLYK+UuXoA+AQZlD6fV4SXr+/8OvlAuVMT2rkZy4rdSKyVvq6skz97hze2LNWwQTJXEck0Qh7so5YR6xrjlOjEWj/8hUHx/HL76aUuP8CuEwpCEiDCN4S1Bj7rC5QSbhgFalQWMMXpZOFkyncd8Vg7/166AIMxUfC9a0Vz9pvbAhcAKL2C3ypIG5/xjEO7O1RBiBLEP2Knrd7y1ZLOfuAV8n6+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0IlHbQIb8QAuQiCHRkHuq1/u0D/+ApbhwMnMZj1PMg=;
 b=TSPqOrhu8x2ESt3WanAdbSA7fKnUyOmBF/NWgN52HOKRHT+p2rC15j71wTVA49jebf7+Ui6wg5nk7zxtVmomVOLjrCHU/jQlHr8vUeVnOoKwBnDh2oMNqPDamXkeIWT3YcFisEw0rDChRBxFdqqyZGgGfMlN8uMKPJyop81ha7wfTHnXJOoqUmce/YckbMoTMB6rHCO8JLwWpQGKRNZJLpAi9kENkZjs8dz2gtcmOCCTusQXbjRVR2HJGDUygZSh70bE0mTn1e9c3ENa3QlKEdZsuvgfZ81ZTouXZkp3ywRNmdCQ3TcyXEhb7kPUOXRGkPkbRMiGb0g1fctpu2JTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=suse.com;
Subject: Re: [RFC PATCH 01/10] headers: introduce new default privilege model
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 wl@xen.org, roger.pau@citrix.com, tamas@tklengyel.com, tim@xen.org,
 jgross@suse.com, aisaila@bitdefender.com, ppircalabu@bitdefender.com,
 dfaggioli@suse.com, paul@xen.org, kevin.tian@intel.com,
 dgdegra@tycho.nsa.gov, adam.schwalm@starlab.io,
 xen-devel@lists.xenproject.org, scott.davis@starlab.io
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
 <20210514205437.13661-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9e634ab-6118-6c8c-7bc1-8df1f9ceec90@suse.com>
Date: Fri, 18 Jun 2021 15:56:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210514205437.13661-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0202cbd-b014-4a54-cefb-08d93260de04
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608602B73B97B685F53980FB30D9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G+fPw6tDrDs+YMkhGE/53rthRYRQlwVAVaNDdaSvYnfgAGS8ygT+L+eF8GaXT/3yhZJQityFBw0s5fSJQPT583coUBfZ2PghecR9l6DHLRhwflLUH+DcHmO8xa8ps2aU53onFKCsuH+JY1n95p6+3eYwU8+V24t0uGDgfKUMaMdEK4rnmA/Qc3MjqE2/fD/Z1EPUOO3+19fHwxFRSuzAaCVCMNIj+lGplfDVrjyimfwlxKmeUJEtCbVbX54ZFmYAtlWnLBfwmNHhpBnCabUbqydahwulUT3q5yfcoxHtVeOW+2ykke9dFS5p7oFgoNZEjyWXawPbCTVWU2AiysoT1OztucdkADoe3XTrfkxCpxeCQH7MlmTIhdouuuoNV4EJ4bkdZpn/Kgkxw0AFmdTSBRrbn3kcHPlsyGc/JWxFpwpVBenYja0NuwmO+ibx3qSor4KgcU06fGC3dRG020oRzzbSqTcNFs3WRQm0mrUHP1IUGPldar05OIqsQIu28Lrs0CwCZTRw7xFoKpfDi7EdhhzLaG/XYQNIU9/wQYvL1RAJsaeMWMMhCZiV8f7cV+crZngg+0WiQ8zE79qcGWNFhJmlGOhjMxFwkshh27OOpu4nQytvHMhgOpPPUXlu72Ta70XPDAaTzIFWTDHNJtqkfZH/c87INJt6Ag5qEYW2a0Xr8qk7ZA23OQ5phpiV1Lco
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(396003)(366004)(346002)(136003)(16526019)(6486002)(66556008)(86362001)(316002)(38100700002)(36756003)(186003)(83380400001)(478600001)(31696002)(2616005)(53546011)(8676002)(7416002)(26005)(956004)(5660300002)(66476007)(8936002)(31686004)(66946007)(16576012)(2906002)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czM1TVJBcER4UUxVS0VPR2djb08rN0tPTzdhdFMxTjF0REVQdWVyaFlxS3Jl?=
 =?utf-8?B?QS9hcjNvazNTYW51KzBIdXNYbVpHbEVmNGszT25vZ2NFcXpTOHhwRVFWV2dz?=
 =?utf-8?B?UkZZYzRRMEtVOU5jdlFUb2dLVTkrUXNXKzMzSWEwR1M0bkJaV2Fad2lDMHV2?=
 =?utf-8?B?b3VkUUgzVkJkbFdwNjErWVVZbkFMWUNianpvakZsR0FrYmFhM3VFQWVQNmo5?=
 =?utf-8?B?blFjTVBLL1hOL3pPUms2d3BuUGhPcUNZcWc4bExabWxDRUY3MWU2cFZKTi9D?=
 =?utf-8?B?UFZkNDBzQVEyVXovSEpJY2ZEbmNpZXVJQ2tXaCt4WVo0VllMdmVvYlZkbFIy?=
 =?utf-8?B?dkhmS0xNTWFuaTN2VkoxbkVFbFh5amZoZ1V3NW8zMHhtNmRrNS80Nm5WbDVC?=
 =?utf-8?B?M2ZRb2lMc2xpSEM3RFd4Rjh3SjJHbStHMUNoQy9xTWE0SU14cUFWMVAvL2RF?=
 =?utf-8?B?UXhHVlAzSWJuWTA0b2NDRXBOWmV1TXg2MnVHNkFGSjJTbDE4VlI5NXM1eGd1?=
 =?utf-8?B?R25mT05hUnBacVFhZzVOWGZwbVFNSjh3ZnRkMWQ5eXYvL3ZXOFJSS2JKbWMw?=
 =?utf-8?B?aC9vVTgzK1R3SjVvYlpFZGRaRmY2OUdSbGR2R25RaDkwWDhaREVGYTVTejJI?=
 =?utf-8?B?UTloZEZrTS9xUFlpWkRrZFRrME01S0xLTVRYZ1p2dGd1d2Y1M0RFeC83cjN4?=
 =?utf-8?B?YnJvRTYzSGZHV3BKL1BnRzJqMHdISVdQSHlXZmhiN0FQWlpwcm5SR2JIVlRy?=
 =?utf-8?B?NFFZdHYyVllsNlc5M1drTU1XSDhZbWs2RU8vYzU4U0huYzNUN0JxZnNOb1Rj?=
 =?utf-8?B?WlRuVUsvaHJhNUc0ZzhOTzJSaHU5ZmxhZ2NjSDNORGtzM1ZlMzhRaVNlNWRi?=
 =?utf-8?B?QXZGVXFkZndUQTJHQ3pvdExNQnQxbjdjN3MrdW1UakNBV2pCcGVHaEJNVHVj?=
 =?utf-8?B?R0h6SmV2djVZRTIveEhvTFk0L3VVb0taYjlmTUxmdE94VWp3dldMWFNnUGZ4?=
 =?utf-8?B?ZTc3MmpUYnNaTlJRMVBFVnQ3TDA5T3FUUnNtdWtYNmdRWE5ucHdxMGREbXo3?=
 =?utf-8?B?Mmpqb1NRMHlZcEpBWnA4aHBMckJHVDV0b01ocnk2elpEd042NGpxL3FFNVpp?=
 =?utf-8?B?cVBmN2RBS2lHS09RVzlRZTJRTkUyTVNQVmdvRjJKMG1sS2xhYTNYaDJVNmdK?=
 =?utf-8?B?Wk9sellOc0hDdFA3Uk5EaDRyYVJJSnVoNXlrUGwyNXNDNm1ST0ZWWTlmT2U3?=
 =?utf-8?B?NjVSckZLOG1YdndrZVN3LzVEN1EzamJiek94S0VVTmhXUklla2Q2V2FrRHVn?=
 =?utf-8?B?NnRWa3dLaGwxRTd3U0VwS3dFK1JBY0F0WUdKUGE0a1pyQUllc0FiWThCODZv?=
 =?utf-8?B?NGwyUTl0NzQ0R0RBSDFZWThWMG0yaFNQbnYzSG5seUdpS0xJaXJ6WVlDb1B5?=
 =?utf-8?B?U1NWbnNtMGxMV1hGNWs5WmhHZW44L29zazE0TDNWeTRQV2NzbHJRblZ5WUJQ?=
 =?utf-8?B?cUtSZ2ozYWJXMGUvZU91OGxRYnFuUVdiL2x5aEFWcWVjbjlnMndENEZaMGsz?=
 =?utf-8?B?Z1ZUdDZOeVJ6WWc1NTZ5YVdtdU4wSFlpeVdUV0UyTm5ONGU3ZmlEYU1KWmlX?=
 =?utf-8?B?Q1lOdkFPVjhzeWtqYldxUTduMEFKb2JxZEwrM1RTblo4Qm5VaE0wb3VieGYy?=
 =?utf-8?B?Mm9kUTZkM1JiQlJFL0J3V1lXdm83eUVmaVpRRnFHZkRjYWhvbGNEdU5LUnpO?=
 =?utf-8?Q?9EmEAB3VfqulL+HKe7di+mIvOWa7XJDWNxsVWA0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0202cbd-b014-4a54-cefb-08d93260de04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:56:27.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yN/XBUGQ0j5hTMnz83mhquCbw9/VSiB+/WjqpkhLUWAYKZlln5qAWAtice7T90usqWhpGkOydast2zX9eIhjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 14.05.2021 22:54, Daniel P. Smith wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,24 @@ struct domain
>       */
>      bool             creation_finished;
>  
> +    /* When SILO or Flask are not in use, a domain may have one or more roles
> +     * that are desired for it to fulfill. To accomplish these role a set of
> +     * privilege is required. A break down of the basic privilege is mapped
> +     * to a bit field for assignment and verification.
> +     */
> +#define XSM_NONE      (1U<<0)  /* No role required to make the call */
> +#define XSM_SELF      (1U<<1)  /* Allowed to make the call on self */
> +#define XSM_TARGET    (1U<<2)  /* Allowed to make the call on a domain's target */
> +#define XSM_PLAT_CTRL (1U<<3)  /* Platform Control: domain that control the overall platform */
> +#define XSM_DOM_BUILD (1U<<4)  /* Domain Builder: domain that does domain construction and destruction */
> +#define XSM_DOM_SUPER (1U<<5)  /* Domain Supervisor: domain that control the lifecycle, of all domains */
> +#define XSM_DEV_EMUL  (1U<<6)  /* Device Emulator: domain that provides its target domain's device emulator */
> +#define XSM_DEV_BACK  (1U<<7)  /* Device Backend: domain that provides a device backend */
> +#define XSM_HW_CTRL   (1U<<8)  /* Hardware Control: domain with physical hardware access and its allocation for domain usage */
> +#define XSM_HW_SUPER  (1U<<9)  /* Hardware Supervisor: domain that control allocated physical hardware */
> +#define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
> +    uint32_t         xsm_roles;
> +
>      /* Which guest this guest has privileges on */
>      struct domain   *target;

Besides the request to correct various issues with style, I'm struggling
with the differences between some of these, e.g. XSM_HW_CTRL ("allocation
for domain usage") and XSM_HW_SUPER ("control allocated physical hardware").
In the latter case it's not even clear to me what "allocated physical
hardware" is when comparing to just "physical hardware". IOW I think
there's some context (reference to doc) or further commentary missing here.

As a nit, I think in many cases you mean "controls".

I also wonder on what basis you've chosen the place at which you're
inserting the new struct member. I'd expect this to either live next to
related fields, or be put in an available 32-bit padding slot.

Jan



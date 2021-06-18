Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4F3ACD03
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 16:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144684.266273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luF4f-0000vG-EU; Fri, 18 Jun 2021 14:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144684.266273; Fri, 18 Jun 2021 14:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luF4f-0000sC-AY; Fri, 18 Jun 2021 14:02:21 +0000
Received: by outflank-mailman (input) for mailman id 144684;
 Fri, 18 Jun 2021 14:02:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luF4e-0000s6-4o
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 14:02:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ea348c6-9821-4310-9134-0e82431e4f9f;
 Fri, 18 Jun 2021 14:02:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8--vsdxk3KOZGoL1xTgbXdew-1; Fri, 18 Jun 2021 16:02:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 14:02:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 14:02:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Fri, 18 Jun 2021 14:02:12 +0000
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
X-Inumbo-ID: 8ea348c6-9821-4310-9134-0e82431e4f9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624024938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0YTZarNfnyQgzC4jCO/JDRvvCRODSqnhxN9u47kB1I=;
	b=S2AEdhjppXAeE5muUG3SkQy4KlLpp0Z8tEWWA2U/Wq97rAaQWnlKPVnTY8O445j5ceQMqd
	8d9igrqpLddDuOexuXnamNz6N0lsh4PJ+fkrMYf1+vjzWOhv8fLo5zWbyu5vxsS0zsQchz
	v6+FRTWGyzUvN1RJAaj20KBTstshkpU=
X-MC-Unique: -vsdxk3KOZGoL1xTgbXdew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/PahIRadT4vcalWQV9qQ7Y14FP5eJMaQMxTS9KJgZduHvafXcLdnEaL2by/wijNvaiXP37mMdMWP3cgawp/lryu2mSPh1rtei/54NuZRZIhCTTL96KmQcAmv8G4sV61FAaJaC+XU5kJDO2xz2K2gD6iMKbLua9oPNwj+PwC7IXIC6GtSMunDaQZMe2F1gyKY6q0A9JQcQXgjkBVgcrDKm0oNPb5ae4ZH2MRH+19NuSkmdA8SYygcZlKjEJCLc7t3OgTG/86eqjapDUPflgwZN3ls9i3M6ay9r7MXlOGBpXaBxPZ4a6ujQ0RRcMTZDmlxkRalWj3AGUY1sBkVxDfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0YTZarNfnyQgzC4jCO/JDRvvCRODSqnhxN9u47kB1I=;
 b=U1GF1ooFfcdrP1gcpm5XhOHmiI9vGXa3FrTJbagYrk/NDbrnUYnWo+h9iT+OUDYNRayUUWv1ukFrj5YNMW7leuMw1+SnHWdpr96Cp6ibflL7iGAIgBfhn0T6Ykg2vWNvX4RrSRT1MNpDNmBKv+7LqFN4El84Tp6dxsYOeY263jJy1WrYEGqBydtdsBGUWH4xk8vT7ka8fV2ZUB3PdL74iGJLYS0Svl8TNjc3nnnsuma+z16jSsiiMdyx0CBVAuEzxB4aTIt61D9/RElJRWfAJoMYqiXNtD3T+tfsSzVObN+zmC8gsUYd4JvAFfr98urxwJHTelNVyEpTC1pgNeWb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH 02/10] control domain: refactor is_control_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 wl@xen.org, roger.pau@citrix.com, tamas@tklengyel.com, tim@xen.org,
 jgross@suse.com, aisaila@bitdefender.com, ppircalabu@bitdefender.com,
 dfaggioli@suse.com, paul@xen.org, kevin.tian@intel.com,
 dgdegra@tycho.nsa.gov, adam.schwalm@starlab.io, scott.davis@starlab.io,
 xen-devel@lists.xenproject.org
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
 <20210514205437.13661-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <caedcf59-ae0c-987c-4574-a4a97757af36@suse.com>
Date: Fri, 18 Jun 2021 16:02:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210514205437.13661-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 858c2ab7-504f-4d57-831f-08d93261ac61
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63845AE3BEE093CEBA4A160CB30D9@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vtYiTK+D56rnoSzUx4B6zZbiWXJlFLPDkjfuPPam2V6FGzhtxNV2JltapqAzUR2zuLzAXltlnzamohlTXR3Nc7KfbqPFudO0TGYclnHosb74SCEYEgz8yEEAyTQCdb71U+zllGMlzXezf0JE+hY3gaQ/A0UvcYHjG0jusWp94bJILCjDMJZ+n4LSqnRRSxsERY/JF0M1alCEy8pZAl5eLZaDHenKtrhOfkGUFHU4JYvSDA2wtvYOhnFbxqLnDar3M0M6b8YTQJa3qV+34WCODHDqipzABY1OufBaZn5f0sae7o62AkMigiUbBTHiIgYWTxKYjUAzZJRMrAp8LaJOj8j4/2v2YlIiPRI3GnxqnV1pHEBGiFmA1NymMnRx5IKG3w6W1Cl6jnozvxaWTZeu4HI9yoqGtZoJvzVaKqQcqkklZQXsbYrH3jtCCDLf+rrvLR8SUgwFEGf3/0MvxX5VqvUnpVSuzVp4Gk40QQMSXCXL52Moi0W3XMngQDAOqkT7PrUSyIHmHeRk/c3XU7WFRwM8XeH8VWoJUblRh+N9Hiphf5EZncI40hdEeb1/VRLPb7ShhasCFcQc6pWq1A2kyqt0K5JwUEIyKEEUerJ1Rvq3kx6ZN3Aybst5SgQDd74dMO/9cUEKBS1nCS721ddXpUHp/URJIBOkETqi8oJxxdNMkDRNye4qmlJGGdOIIDjA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39850400004)(38100700002)(8676002)(31686004)(186003)(16576012)(31696002)(83380400001)(26005)(86362001)(316002)(2906002)(478600001)(36756003)(7416002)(8936002)(5660300002)(66556008)(66476007)(956004)(6486002)(66946007)(16526019)(4326008)(53546011)(2616005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3dvV1ZvNGFva3d3OG4zbVZvNkJUWUg3VjVGVDNoN3VGNVhlTkhKMjE1c2xV?=
 =?utf-8?B?S0tPWE1yeW8va2E3dGsrNGVZSXFmWUZaWEZSU0dqVWJza0x2aVFiVEE0UUxR?=
 =?utf-8?B?cGVTTFNyakozWUlHTUZidExDbHRPT2J5UHh3NWpGWDBIRWtOK2tLcTZRY0R3?=
 =?utf-8?B?eHB4TGpjTWxIZ0VtWXZ3akJGNmdJbWlwUklRQ3JvcjRLeDhIUWtXTUwwdmtj?=
 =?utf-8?B?aG1JSk1abDl0SWJuUTVnOStrR3dENHBRMko0ajJPVjBxVXA3Y1pHWUJPYzdE?=
 =?utf-8?B?YTkvYURlSmJWOFltUngwajE2VklHMkRmcGUxUG9JZUZvcnNPWXNFclRKaWNw?=
 =?utf-8?B?WjZDQVR2M21jTGFYcWdxZ2twNlU2RTRHcFhnaEpCdVJYWS9HN2F3NlpLTE41?=
 =?utf-8?B?Z1VqZzdHc1Yrb21iRUYwVWE4YVY2dkdkNGRvbUtpZGxBUFcxZ1VmRzk2L3hN?=
 =?utf-8?B?U3kzRmFzY05GZWloM1Brd1JldWsrdjRjYkxkQ0FFYmdhTnZrUkIxbFNiVGNX?=
 =?utf-8?B?UXhxbTVTK0FaZXlpZGhBelpBOE1PMnBScHhkNTVGeFZIN0htQ2VoTjlyeHZi?=
 =?utf-8?B?aWM1OVo0NXZxRS9pTkFPQkk4UE9GenB5cVphS2hVSjJjWjhhY050MGlhSjd4?=
 =?utf-8?B?Ympld01GNVlWMnYrYlFVbEw4aDhSTXN1em51Yk13MTZLN3MzRE1PbEtrTnFr?=
 =?utf-8?B?UXV3NzVOS1ZPekhnVnBWMFN2QVVrdllHczU0ZEFPWkhmT2NzbFdXd011a25U?=
 =?utf-8?B?UG15Q3F4OEhKMlowMGdpdUNXWk52S3YraE1rK2VaQmpLclNuaDdaQW94OWpk?=
 =?utf-8?B?Z1lFNFBZbktJUW5iL0s5cnhCcjZYdktUWXRQV2Zlb3llNXNzTGg5ZEFhMjVB?=
 =?utf-8?B?dDRzNksydXdMMHhvRFIzZ05iM25IcXRpaWpXVnR2ZUFYanowQWxzdmNtTDVq?=
 =?utf-8?B?aklmeG0xQWFFeEdjOUZ4N2xablFYRy82a041T1c0MGUxWGgrWDRrME5QRTJm?=
 =?utf-8?B?Ui90a1U5dzZIc21SamtHdWRONkNPMkhNb3pwUkRHMDE5eDNsZXJuVnJydy91?=
 =?utf-8?B?aU52VG9nN0dtZVNnR2poV0diZGcrRnhQTFlUYlJUemt1RUV4MzlpSTdmVlpH?=
 =?utf-8?B?VnpId2ZRSVdzWlF1WVhzK1U4WEwxVU8wSlpyRi9DQlZxU3N4SmNwZ3F3VStV?=
 =?utf-8?B?WmFTSTB5V3BJQUpzcHJ5WGVTOFhoZ1BRZGg0MUtjRFpPNEZTRXFzV2ZIbzJZ?=
 =?utf-8?B?SGRNb1JPbkJyWThwMmZsODdGb1lYbEVjcFMwRUtYVC9ZcHdYSmdiZzZxU3VH?=
 =?utf-8?B?Q3VCKytSTE9NWDhmMWlETWQ1TEl0eGJhaHUzem5wSGJsRUhkZ0JQcCtVZFg4?=
 =?utf-8?B?Q3RBRG8rNWp2aWRHd2pFVGtBSDZ5SE9vbmpHZWY4aCs0ZDRiWXdBQzFYS2RE?=
 =?utf-8?B?bW5XN0NzMi95cjVKSjJTeWJ2MElXT2doUGlGQlMxanlGK0t0eGN5b0I2bnpt?=
 =?utf-8?B?ejR4WlZ2UXBLWE1jYXN1bjJmUjdQaW1ETFgzQytoU2lPai9CcHNVQ3VKVnBu?=
 =?utf-8?B?Q2dmYjBQVE9VZ1VrVllxUWNvU2luTHBvUGQxSU1KSTRjcDJTOFFUN0hMdFZ3?=
 =?utf-8?B?QS9UcFJNQ2RiOEJsS1pMVkpCVGtwYmNkeGFCeldyQ3lPVXEvcXlkQXJkNFZN?=
 =?utf-8?B?TWpQSW9lMHRpYjRqTUE4RHV6VWtMR01YUmFzeDZwSVMrS2FQSzlHc0Z6b2RX?=
 =?utf-8?Q?WMWbrZU4PSikSu2n56oaJkUvAmCiCfLSFy8bTdX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858c2ab7-504f-4d57-831f-08d93261ac61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 14:02:14.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hux0AMxAlnVUgmP46LTfOVW7GULIPpLTCOAoIfVozPVQyZoPh2V70HBVJRSyoUaR5r7ksvurQRIKzQHXzGc6Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 14.05.2021 22:54, Daniel P. Smith wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -556,6 +556,9 @@ struct domain *domain_create(domid_t domid,
>      /* Sort out our idea of is_control_domain(). */
>      d->is_privileged = is_priv;

With the change to is_control_domain() this is the last use of the
field, so your patch should replace it rather than adding yet
another one. (For layout reasons, "replace" doesn't necessarily
mean "in place").

> +    if (is_priv)

Nit: Please add the missing blanks here.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -473,6 +473,8 @@ struct domain
>  #define XSM_HW_CTRL   (1U<<8)  /* Hardware Control: domain with physical hardware access and its allocation for domain usage */
>  #define XSM_HW_SUPER  (1U<<9)  /* Hardware Supervisor: domain that control allocated physical hardware */
>  #define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
> +#define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
> +		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)

The latest at this point I'm inclined to request that these #define-s
don't all live in the middle of struct domain. When you move them
elsewhere, simply have ...

>      uint32_t         xsm_roles;

... a brief comment next to this point at XSM_* as the values applicable
here.

Jan



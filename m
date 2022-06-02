Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073E53B654
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340999.566158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhQK-0006ri-Ok; Thu, 02 Jun 2022 09:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340999.566158; Thu, 02 Jun 2022 09:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhQK-0006oL-KM; Thu, 02 Jun 2022 09:47:24 +0000
Received: by outflank-mailman (input) for mailman id 340999;
 Thu, 02 Jun 2022 09:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwhQI-0006oF-Oi
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:47:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff73d2a9-e258-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 11:47:21 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-46-ZPj2J4fHM02g8Hhg8GW9aw-1; Thu, 02 Jun 2022 11:47:18 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:47:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:47:16 +0000
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
X-Inumbo-ID: ff73d2a9-e258-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654163241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2nAychlMBFxvawYdIVjlApNpLN1F+sVNEB0C89rDOo=;
	b=ZCauABVqLH5JnQ6TljekDnpd68GALssVM43wwErzi7KrOHdqhgoaqxZBwuPeWdkyTxUTe/
	d3mOzjcbnBmV+UWyvFzgzVklmuK+z5DnRhCdWAjVzfcgJwzcz2iekf9z1bnC0IVlF8Jueg
	dDXECuByeitWlTU4l/KHeU5HBS72KZs=
X-MC-Unique: ZPj2J4fHM02g8Hhg8GW9aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo8od4Dg3qGxAXEzUfChc7PvPm3Uk5AC7Tsz00WcN2qIi0Om40nHJssZaW74DGNQHa8U5oaKZDRC6UyK9X9HJliNqNGPDmsk+YOEDj9lTuqogkDxQlDP7QNkbEuQf0A2v9z5xLDwzdE4y5dlr10hrolpgY2amOkUA2aE70w0QafeKqKzVfpYXxbdMsyF8AVPhp1fDAfRcENAzRmR1DGd97AEzW3bKrpPVeCDoYkOoOAvN7l2Sa+64zELFUZg7A9Gm7sR0qwv5r9YS5zCXCPYMXdngD4L815+or9jYwjl/FgzDeopX0ZcQxQhIIrJM5Wkn885wfExZCW2RSgbpLjhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2nAychlMBFxvawYdIVjlApNpLN1F+sVNEB0C89rDOo=;
 b=GaEKOKI7zpsfKX0ThU+889UHuGRGmQnVBYvV6n97j2NAYnuQy+byl9G00NonCHg0V7oxGbDBqFONRoA9Qi4FwxjFyJ3WR0eJ2A4Lh+1hxUqba19mraddlzL+BSmI1gswU11I6v7sDHE4dMYShDygajxMNrlYSg7EJF8cshHAvE62mMZ7ZYvlokZjl4BptYoC4ereobI6b/bAm2oMmQSk26F8J0D8BUxRocRx4EFOGrzivFZq8EaNmBE+5wjSpW2a+miLi8R86OYLoAcdfGtfMcEd31NAm8k+lw5Dn1G7DroWRhq6ekbg9VUrPgpOqiaITuqW42G9EnwTXYaYmx36VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17edde4a-0d00-0da7-5910-09874ab70838@suse.com>
Date: Thu, 2 Jun 2022 11:47:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531182041.10640-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0748.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1360eb-7cfa-4782-2bb0-08da447ce0c6
X-MS-TrafficTypeDiagnostic: AM8PR04MB7409:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB740962E2C22519D3AC78783BB3DE9@AM8PR04MB7409.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3zrSQbFCDuHu4ErL0iE/cjT7ApzNYX1IBoJKegqfAmcfWXKrBW0wU4enPDfJU0GZfyuz3+C8sTQyNJPOO/gz/QUs6TWYTMqc088irqst84jHaNSBE9+pebdXBKR2eTcvsNQEBycXieuKLdyua6O6oWzyeDkjXmxcET8FKv6OCzMp0sFoKQdS72jV8+3XGoarBukap2XVPepdlYhGUzKVa7w/1AcO6yq2gUOLwNViOffkHqsuSC7+Hi+eABDX5HKWMg86A9IsVexqW95N7t9Ysj/PIPmd0W/5mXs7laep5+u+HpjAo5y0QmJivweEblMzdM5RDQlopuzu/yOv2A39Mz7XbuKp5QhTS67CrKHgGpi0ezN/TYpNQaSzgqwqBKW4e8bByeYBXPaQ3k9ACYq87kUAuLPbkRZXxFP/T6mLgmpiR2/PDucRAe8JX0V5iDh210TCA1iw0ACnl1NKXHbzvNMjh0uH1zppc69sKjGaQgQyvLo3at6bjZ05x/H9gF9+AquZeIlm09IvmGxDdCbKFey0m/NdBVuMXupcpNkulCut1QLNeSzCZ2AFwqwcS3izDgA45i4QSErVD5IoGOPnxXc/yfuhTZ2+mF5L+MK8tRIl7/HUhw6PvUTeOjheNZNFxXmBqU6N2wzYeInCQ8sSVsowiRzZGRecAlsVQzPPitM4CiUUUrbQxT1/YDsGXEBdU2yFFekCM5FkQdiClIHlCms8BmVKvqOYOZdwzAvH5/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(4326008)(8676002)(36756003)(6512007)(316002)(6916009)(83380400001)(66946007)(66476007)(86362001)(66556008)(31696002)(38100700002)(508600001)(26005)(186003)(2616005)(5660300002)(6506007)(53546011)(2906002)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTVZb3ZBdk1Dbm1zUE94dFVLQkhqeU9xTlQ3dFdDSEc3OGpFUkZObldNZVo5?=
 =?utf-8?B?YUFZVmhYWXBScVE4WU8ySDEzM3lCRzc4ZXh0N3Y1ZWlhV2ZFcCtabE5aV1hE?=
 =?utf-8?B?OTlSSklrVDRCL3RudHNtTjVoUFd1RzIwRmNrQWk2T25oNFB5cnpUTTJacUNi?=
 =?utf-8?B?VFBObXAwY3pyM0RPZmhiMGVvZFM5eG9oUzhjeUpnU3c1Q3loUkN3d2ZzeVB3?=
 =?utf-8?B?aWRGOTdBNFcrODJDZ1VZYUp3Qmp2Yk5jRm1MZzNOWlFYbTN1N1k4T0ZkSkRH?=
 =?utf-8?B?TVl5eUptdW52QVBISG95Vk1XYXl1bFhLSEE0T0dPeU5ESXRhUURORTdjNzBY?=
 =?utf-8?B?WnU1RE1DNDlsNW1Yd3FyRlFFd3lXMzdkb3RqN0JuRW5hbW1WMTNDODNpMWVt?=
 =?utf-8?B?WjFOL25nQ1VmYVB4MUh2TDh6Mk1QaHRIdzFOOVk3MDQvdTRDejhWR0VDUmhX?=
 =?utf-8?B?Z1NDYnBZeXB2OGVyUHNQMFNEeTcxaUpQZjZoT0JqLzhuQmg4Z2tHZkwrVmFD?=
 =?utf-8?B?eWtGSUx6N1VPbnVtWGVaREpVRWtkS0dWWWtKQnR0bEZkbGUzRHVYZU03RmVK?=
 =?utf-8?B?S1M4Vk5KeStITEN1aWQrZWNGUHFqa2Q5aitlRW50VTFUYzUzTG9PK2FCQTNl?=
 =?utf-8?B?Yk8zWXVZN3h3TmJhZ0gyL2NiVE93ajFsZlZ0Y0F4aGgrTmttK21TMXhwbXRl?=
 =?utf-8?B?WTdndkpKdmpVempDanR2QUdCWHdPeDNRMjhHZmh6YzV1ZUo2dzlIeFNXZ0Ev?=
 =?utf-8?B?dVNrUFYyS2hydDdoeUxOdy9KVHFUWlRRNmJBSkh5L1R6ZVowd1pJbXQ2UjdQ?=
 =?utf-8?B?YURKckluaS8zYkFOMkZhUDQwOVpGbGxMQnhnaU8zREgwVS9WUEE2MWdCTDVW?=
 =?utf-8?B?VXJHSnpENzYyWmNJdUJ1Qnp0QkRacDJEaWk0dGQvaXFlWTNxOTIxZ0x2UGM1?=
 =?utf-8?B?aVJodVgyVGhwZncxQ3FSbVZDdk5xWWlmWXZEamV0Y1dKZG1GeklzcTYvYURO?=
 =?utf-8?B?Qk9qV2U1VHBvcDcvdkhiUzR2c3JFNHZqdjR0R1JiZDM2OHpML05KVllvZmRW?=
 =?utf-8?B?dlRDNkRQbUdOY3ZVR25HUlJ3Mld2cTdhL2ZZWktqeU4xQStQMU9KUEt6cm9G?=
 =?utf-8?B?dm5uL1JRS1dRK280Tm1kOGsrZXEzdWlaaTBWM1pxSXc3UVVEbDZRQXdwQ29r?=
 =?utf-8?B?eXRZaFp6eU1UdTFlV0FORVQySWs1eWE2NVdpN3hUYlJtM1kvNnNvZWhDN1N5?=
 =?utf-8?B?Mm5Ga2lRYUNpWXVvOFFKZUJTZ0ZMZXpBZE1JcnZqSE9LYm13dW5CSGZaWkY2?=
 =?utf-8?B?eEg1dnFJMU80Y2piamRLVWdORFJlbTVrM1VvSFRUejlIYnAyTWVSOS9TNmJW?=
 =?utf-8?B?MXhLUlNNb25uNWRoUEZ1THI0eUdZSDM0SVJYUDBiWUFVcjl2WFltejkzdnhU?=
 =?utf-8?B?Nnlsbko0MlI3dTlaV0djT1FsSnc1eGNxNDdKWEdES05hQldHVExvRnJmeGFk?=
 =?utf-8?B?NFNhZVVyOUVWeGtPWU1CaHZ5d2RGUk1uWVQ3SVdZTjBFZUFpVW5YTnZSNHJr?=
 =?utf-8?B?bjc1ZmVRMkxUUjB2YXA0VEYxUzFXN2thRkdIdFhkcXowZEE3bjU4ZDB0NSsy?=
 =?utf-8?B?RWppVVljWkxJaldMYVpVUUhuRkQ1azltNXFvQTVtR2lPWlFUY25rQUIvOWJ1?=
 =?utf-8?B?cGVHd05rTHNqUitmN3Q3Q3hrWDZaKzUvejZERHF3dTI5eGdubjB5V2prQThE?=
 =?utf-8?B?U05uL2hqaGhKbkdER2tyTUt3Y1NFVUV6K3ROV0gxYkdSSUpvVFYza2JjRkx4?=
 =?utf-8?B?SHcyNEVNRjIwR2locmovSUo5S29icVNxWkduWU5tVUY1YjJmVGFxZ1plS2dP?=
 =?utf-8?B?QmZOU05ybW5EMm5xWWdOODR0RHNzTUtIUlRvOTVkMnVVd2R0MnZ1VUxFMDlp?=
 =?utf-8?B?aGZrNHdiTmJuR3Nqd1cvYldFM1Y3OFBsMzQ3VldTc1hMSmtKWDhOUzJHVis0?=
 =?utf-8?B?c1RTTkM1VXJYZk5SdUpVc2tuTUhjZGx2K2Y3S2NFTDN0YXFNbkdkdTZ3ZGdH?=
 =?utf-8?B?VGRtV0RrVWRWVE9jejYwKzB1NWVPTWhVU0NGMldkRXBvZS9vb2hiU1NCQnhz?=
 =?utf-8?B?anc1R2ZYU1A1Mk4yU3k0Z2pGZm1QOGhjaE1kdnhxUlRBdFI5ZzNOTnhXNlpY?=
 =?utf-8?B?OHdEbWhZWVQ3cFIxMFJVRklqangyUHowSVNROStjbGd4TDhYYVdNM0dqWDU0?=
 =?utf-8?B?QTNrU0VqYlFYalFCZWpGVVlGNHcrVGZFMzh4YXE5dnF3RkN0b050ZU9zOVVi?=
 =?utf-8?B?L0txTDNYK0ZhUHJjT3RycEVuOFo5TEVlbkdhdkU5dFlMRndjVHVVQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1360eb-7cfa-4782-2bb0-08da447ce0c6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:47:16.5469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udyJFlqFxjUNo7qJmeO59tcnjHUSrUF3WqriLvAn+lRRrs6FwZOieUABOBtqxr5O0DeJGpxCyvj9FbDnGSEuGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409

On 31.05.2022 20:20, Daniel P. Smith wrote:
> Previously, initializing the policy buffer was split between two functions,
> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
> the policy from boot modules and the former for falling back to built-in
> policy.
> 
> This patch moves all policy buffer initialization logic under the
> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
> message is printed for every error condition that may occur in the functions.
> With all policy buffer init contained and only called when the policy buffer
> must be populated, the respective xsm_{mb,dt}_init() functions will panic for
> all errors except ENOENT. An ENOENT signifies that a policy file could not be
> located. Since it is not possible to know if late loading of the policy file is
> intended, a warning is reported and XSM initialization is continued.

Is it really not possible to know? flask_init() panics in the one case
where a policy is strictly required. And I'm not convinced it is
appropriate to issue both an error and a warning in most (all?) of the
other cases (and it should be at most one of the two anyway imo).

> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -775,7 +775,7 @@ int xsm_multiboot_init(
>      unsigned long *module_map, const multiboot_info_t *mbi);
>  int xsm_multiboot_policy_init(
>      unsigned long *module_map, const multiboot_info_t *mbi,
> -    void **policy_buffer, size_t *policy_size);
> +    const unsigned char *policy_buffer[], size_t *policy_size);

See my v3 comment on the use of [] here. And that comment was actually
made before you sent v4 (unlike the later comment on patch 1). Oh,
actually you did change this in the function definition, just not here.

> @@ -32,14 +32,21 @@
>  #ifdef CONFIG_MULTIBOOT
>  int __init xsm_multiboot_policy_init(
>      unsigned long *module_map, const multiboot_info_t *mbi,
> -    void **policy_buffer, size_t *policy_size)
> +    const unsigned char **policy_buffer, size_t *policy_size)
>  {
>      int i;
>      module_t *mod = (module_t *)__va(mbi->mods_addr);
> -    int rc = 0;
> +    int rc = -ENOENT;
>      u32 *_policy_start;
>      unsigned long _policy_len;
>  
> +#ifdef CONFIG_XSM_FLASK_POLICY
> +    /* Initially set to builtin policy, overriden if boot module is found. */

Nit: "overridden"

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B5538D07
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339281.564114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxR5-0003Vk-53; Tue, 31 May 2022 08:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339281.564114; Tue, 31 May 2022 08:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxR5-0003TJ-1p; Tue, 31 May 2022 08:41:07 +0000
Received: by outflank-mailman (input) for mailman id 339281;
 Tue, 31 May 2022 08:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxR3-0003TD-NV
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:41:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67fc9a6d-e0bd-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 10:41:04 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-R-wPVTNlPBShMZdoW3X3vQ-1; Tue, 31 May 2022 10:41:03 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7596.eurprd04.prod.outlook.com (2603:10a6:10:201::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 08:41:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:41:01 +0000
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
X-Inumbo-ID: 67fc9a6d-e0bd-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653986464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdQ0tv9ZY927eDAi9KWK6S8eybd4UghsqJGeP20ui00=;
	b=OZA6mMvONTKbn8pckAY9Q9t06eLq1+KpqvU5D8cBCauAodQ02KO9Kye5blmt52kuc0cB8S
	WDKQYz/75V+KNJR7gkqt1Qgqq4KLYYXW3WZY/DeB27CmitRQ4yA+EGfOPmcXSPvyvORxZm
	bp3O+CGHoHMj05dZPfyY0K+Gqri4sjc=
X-MC-Unique: R-wPVTNlPBShMZdoW3X3vQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyX4wipu7NPCWeCV3puswQdF4GdS8XHVE7QaowKidcGVndH9Dnt17dH+rcI9Mhpju0JVl5B/E+Jk9Hc4tu1cEMAs2SkCaebFPuabT4RJwTXy5ZxJkR+lxIipnqcFpA90ba+ZqDtWoOW6ZRFRlmzVRznjWrWPjN02AeUr7rifRLDjkJWJSwvYltP95im+YqUQV+tTnvfm4SmB5xyCOe7L3IhH1ZN/eu7cRZ6+E6gatOGVtPdQWGrni/bpzf0+sDkRPYaFlMfa0ewPTyY0TiI06AY79cd7gRrL4ThHHVYFwOYCfBXxLKbIwtEil0Czt2NEJ2CHo7Le44YNzY+lxGS2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdQ0tv9ZY927eDAi9KWK6S8eybd4UghsqJGeP20ui00=;
 b=HWbRdpsBS0DXfNQ4pY2ccj8QnLyCtFWIyYttGMofdbp9xL+tZIj+IpP3JgifSssq0S4dSSXzErnL6KA6hB0LfIq2eyYnHZ56931fQggkPEyEeRiev1ooDJ7abPu6r9N0eABAxZUwlGYXS6e2ohcG9Znk4MpWZseDlplIyr4OZcv5+WYjeiiMMsS5Qv6RaK7xDiFjzZX+doBJnDGZAyc8XN6KFqZESb+HY6fpcWi06LEXj9cULDHnIYIfFl60xMlJCQ2YSKF5PiI7brITj+A3bCWaVEWImkIEe26sVT3IX4Vz0t4fjo+ZoF+T3RSFy8BbyZAxj0O3/FsiPoee92TuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd7455ab-c26f-8a91-fbf0-acf988d8371f@suse.com>
Date: Tue, 31 May 2022 10:40:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 6/9] xen/arm: introduce CDF_staticmem
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531031241.90374-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb64f5d3-d83f-492b-b640-08da42e14a79
X-MS-TrafficTypeDiagnostic: DBBPR04MB7596:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB75961B8F9096726E2B87B1CAB3DC9@DBBPR04MB7596.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yDSlmmZP25pr0c996ETBEM1ZGBkjTAaTJ4tj7AfBbWp7G+Im0OyzPAHamy2i0btUuh31xNCzRIZXoanmtxGsVvguUowUWTkhpcq369B5QNC0RHGVcbuiBQuaCMThAR0v6MRM8vXH3lZL+aEIwDPFrDiOYqR/fVAEXQLMd0W+yalyx72Q4+X2Jto+UxIcW6qTT0+VnYCpEGC+XVxUy/HB7ZarNZWwIYWeM4k0JskDXaQzbhLRvCAgRdK8I1yCJQwyL+HXjWUHa4zr2h2pszBmNCidA3RiUFpd0SNkozJX+5X96zYDhmTnrtvlPB7IggeSCXW/HOOx6K00++ys3GoKdTJq3Ip+NcSDSB6g224S2C8BCy8iqqwaW/79CgLGV4ZDZ7SOJPOgjBFXPoFOZUP4YMD67nMLhz3qJBF8P9uI9NbITgTC/naL28uGj4LaVwePJUhfKM50Ujsvb+UwUjkZHQc5XWkM4Qv+tEW6kQ1Ur5+mbgcZBm+ZzF+TzhVQzHJLuvgsxsSymRYXb4KNfQfFlQil3Q8AFlN/4ufp6ndysLNaNJEobT60BKj+z+IoJvNMuLEUnJbE/huNR/aVBapVVRpNPpMCmhvslZUhj+RtyGOGy8sZ1sOdgDUzLKRvAl1j8EQ1QM7GDS3PuevqXoDkGWmKwQ/NTfc1EJZYO7PaS4wlSISPlpqnsymFa9BvelX4pDOMIzdgrCN64RX2XqXcllR7qPY87u+08+jmiuCCup0mlo1bNX4d95czCXIL4C22
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(66556008)(66946007)(66476007)(38100700002)(36756003)(31696002)(7416002)(4326008)(8676002)(316002)(8936002)(186003)(5660300002)(6916009)(2616005)(2906002)(508600001)(83380400001)(53546011)(6506007)(6512007)(26005)(6486002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFNrVU14RVlHU0x1OEdOTzVXYkltQW5BNG9GYXZjOWk1emJYaFRqODVScGIy?=
 =?utf-8?B?aHVZcTQxVkdEcnptZGs2azRrdFNzdTZRSjlJU3licE5qUVFVdlBxOE1yTWgr?=
 =?utf-8?B?aytKRy8vZjBKejhJYStueFN1N3p6Wk9BTzZUbGFjYlBRWGxGMzh6RDRPMTcy?=
 =?utf-8?B?RWFzK1BHOEpKOVk3c1Bab1V0SVpuZzkwSGVJUEhTUktGZ1hPcjZxZDRyL1RM?=
 =?utf-8?B?ZnQ2NDI1djFKMFluZGdUTEIwMVVQN0s1d1QyOXFBdjdSWEU1dVpVc3VNT3Y1?=
 =?utf-8?B?bC80TmJaOUttSXJsRmVhYmlZVTlQU2hrd0FxNVdsRDFlTTkvNDViZFhhVWV2?=
 =?utf-8?B?NnM0dTdZQjRmVFhoZjJwSWZzRUtMMzZLT1hJZ3ZqRjg1a3hxKzBRVjVpTnEz?=
 =?utf-8?B?QUNDTDN1SXkzdDcyKzJBbWVFR3hkcG1IT0ZaTS9DTWQzSWlYckpjMGpCcUEx?=
 =?utf-8?B?YlRON3hmdzZJRlBrN0tOOS9pVzYrUkQ1SzIvRjhCMDFjOXVWcWVCZXlqcmZC?=
 =?utf-8?B?MStGZlNlTnpMTGlidTNiQXRjT1hCaXc1eGFCZDk3QzdjSFF5bDZUZEpYV2Jq?=
 =?utf-8?B?NFRmaFNYcFFCSUs3RFg2NEFTZnJEZjEzTTRRT3RRTjRPTXF2LzdXMGtiejFp?=
 =?utf-8?B?Q3hyTDNSc0JPdmR5MWZNMVFwNjNDa2RHY1k0bVcxakhacXhpZngyV0gxWTV4?=
 =?utf-8?B?NW15Y0d0MkxBRW9LNytmS0hHSGJQWTBCWU5YeEErWDQrVHVydzRsaE5rUWF2?=
 =?utf-8?B?ekZuLzlkRDFXL0xVVGUxRnJQTnpPSmMrbDhYSURxaUZ0ZHl5L2poUmRBaERl?=
 =?utf-8?B?OTBnNDNmWVJGNjZ0cCt5NmdtNGpRN1QvM0R4M1A2eWJpaHVFL0NWODhZYUF4?=
 =?utf-8?B?Tm9vQXUwbWFiTlBUVDBtc2VkNzNGSU1zWGZzcFVKaCtxVjZTVUtPU1BzTEtF?=
 =?utf-8?B?Ymlvc2taZzhCRTdEWFRVbzV6U1FBK0ZhQ3FYYXNPM2tDUzRYL210UWdOQ3ll?=
 =?utf-8?B?WjJGbmpRNkVmM2xQSXhmcXZOVnBtTFJLQkFMSjhQREx1aGZTbSs5VXdqSXFo?=
 =?utf-8?B?aFd4ZDh1RDB0Y2VkZE1ZVFBETlY1YmVNVFM5TVBDMUQvbUZIV1RqV2Mvc2pQ?=
 =?utf-8?B?OTFxQlM5eVNWRTNSbDYxUXVSUGhrMjI2S1BGbEhtTEMwRnI1cEY4ZFlUdThw?=
 =?utf-8?B?SkNpTURJODZ5cWd1aUVDQjNQOTlFRlh4M2JiOWxKWGFzcG1YOHFqRlBBNDFX?=
 =?utf-8?B?dEt6aXhTN2tTMzZTM21pZXVUemQ3aG9vZFdMeUY4Nnh4SVJRdGlET3FtbWxk?=
 =?utf-8?B?d1k3THlvSTViREU2cnVNclYyUXN4elA4SFpJa2NTZGRXajdxNUYwLzZxQmJF?=
 =?utf-8?B?NGdBS2JaeFZhWEM4TmxXL3I2MHpLYWIySVZRazF2WHd5S0ovd24yYk9ZZXhT?=
 =?utf-8?B?eXBINVN1bFFsV3hXQWx5QmxRdndWajgxY1Zid3F6a1pTTjQrem5RdFQ4bnBZ?=
 =?utf-8?B?Tk9PbHJhdTQwM21lNUFrVjZIMzQ0YUlWb2dhTTJDd0xCZnRsOHVKUG9QbEJS?=
 =?utf-8?B?aXpXYzFVR3BTK01sK2lHRWhBV1VjenNta3c1eUpRUnMxVU9heERTMkFTSVNL?=
 =?utf-8?B?RVF5NmxnN25PaGRORFRQS2VTdm0wcXBneG9ZK1AxRlNWOXB4YmxGbWF0VzZR?=
 =?utf-8?B?NWtteGVjd3RPb3hKTklPaUJIUTN1V3FrdHkzUm9tRUFDNmE3dm1OK2hRd2Vp?=
 =?utf-8?B?LzVxdWxPWTFTM0RqRG13enFTUS9rU2UzSGVRUGFscHl4WTdQYUZrbHFiekxM?=
 =?utf-8?B?bk5KSndxVDQrL3VwREJuc1JXRkY1eklyWFRyaDdkNUJSTXZ3dmU4ekxBVnBY?=
 =?utf-8?B?NkZjSCtWcFdwM29QZE5SMmlla01Xdmo2V2pHbU93bEhOOS9weGdHTGNCT2pj?=
 =?utf-8?B?N0YvRHE5MGxPeFlvYjBIeitPa2V4YVlGNFV5d3lrQ2h5QWJCTVIySnliSzNy?=
 =?utf-8?B?N2hJcEx5U0tMRkVkaEdyQjdOVTg0Y1dBTGVhS1BFSGhrY0JvTEh5R1ZhUUNE?=
 =?utf-8?B?OEttRldFcWRQRnhoc0t6YmF2TlVtRTFDT0FqQU5VVFJzcnZsLzZZbmZja2ZO?=
 =?utf-8?B?dWV3ejhQM1BNOG1UUHVGTzNNeVZNVWZxQkd2TGoxR0dBZ1pWNlFmQnlTem9N?=
 =?utf-8?B?VVprK2lxMndpRzBLSkdRb2hLcVVzMjhmcVdRcDlIMTZyaTJNbTJVeFhOb2d4?=
 =?utf-8?B?cTdqNEVpTi9QVmVNSWw2UDljb1B3VUFXNzN2Vnl0cUI2NUdXdXJxVU1yMUR4?=
 =?utf-8?B?RjM4QjVWd2UyUjg5MnR6eTFPNThvZ3dySjJQa3dNK0Y3cU5CRkJDUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb64f5d3-d83f-492b-b640-08da42e14a79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:41:01.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sMu4UY7VxAeEUBhGTCnm4KDZxCz8qtEMZ97MDLG2Ii5qBrgvima0GM3AKaGn5NdQp4Bfv0xJCcDuxyl5mhtVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7596

On 31.05.2022 05:12, Penny Zheng wrote:
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,10 @@ enum domain_type {
>  
>  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
> +#endif

Why is this in the Arm header, rather than ...

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -34,6 +34,12 @@ void arch_get_domain_info(const struct domain *d,
>  #ifdef CONFIG_ARM
>  /* Should domain memory be directly mapped? */
>  #define CDF_directmap            (1U << 1)
> +/* Is domain memory on static allocation? */
> +#define CDF_staticmem            (1U << 2)
> +#endif
> +
> +#ifndef is_domain_using_staticmem
> +#define is_domain_using_staticmem(d) ((void)(d), false)
>  #endif

... here (with what you have here now simply becoming the #else part)?
Once living here, I expect it also can be an inline function rather
than a macro, with the #ifdef merely inside its body.

Jan



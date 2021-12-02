Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B78746635A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 13:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236522.410301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskzU-0007cy-Eh; Thu, 02 Dec 2021 12:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236522.410301; Thu, 02 Dec 2021 12:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskzU-0007au-BI; Thu, 02 Dec 2021 12:15:08 +0000
Received: by outflank-mailman (input) for mailman id 236522;
 Thu, 02 Dec 2021 12:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mskzS-0007al-HQ
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 12:15:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b7ac3a3-5369-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 13:15:05 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-z-PyQip9M4aerapB6xIA1A-1; Thu, 02 Dec 2021 13:15:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 12:15:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 12:15:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0324.eurprd06.prod.outlook.com (2603:10a6:20b:45b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 12:15:01 +0000
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
X-Inumbo-ID: 7b7ac3a3-5369-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638447304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oVtE6UF9HP/6aSuHtY3p01RV6M7y4FaPNq6PT45yM4c=;
	b=DJlG77t0t6FJDAVflfVhADG2hslPJ0TdybiwRf5LEbEux15ETxSGgc7vr8vux3mQP0QINP
	TqZnf7xIJlQ2e8ehhcoFXc2efu5Ot0+8dAKcgrS8wHMceYnjUXrN8SRTYd/byJQdarOZr6
	5VFh7xua3thNpodXCZAu48UQX0L38ss=
X-MC-Unique: z-PyQip9M4aerapB6xIA1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEDWWyoHr32Shu3wLHMmgNJtJbB7n+KSu3CMysbrYbxFC0WB/7YTheUZFdW8ATaEE9Z+LtVRVmchviIg6tk45TnU8ePJTAG3WE1KtxskxiT/q0P8izMJS/ia70ZyN09TIpbWuB5yix06aargTv6l873PBrh74gwp0WasyZidKi0a9ulbIX7gvbCE6wc9/j8SEPC0m2Q7gyMrShYQpFS/3BvJduY7NIkPVDduppHcs4tA6NkW1IlH2atpBx6vuiUOqMwLXl1pMw8lnJYqQC/UmTAwz6zZLCWRgljjq9HRUpcv2W/Le2e6gLVHa/8jw4fyYgGcYBj+v67ypwLr9E5Kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVtE6UF9HP/6aSuHtY3p01RV6M7y4FaPNq6PT45yM4c=;
 b=FwWhKH2sDanJrOW2zQIqrEbDoN9SMmkfXux/WR6efgwvuECJWwsQTiaeIvXk9bZjJcW+4RkfpWTifz/SRgoMErFW0d9vUbtpaz15TxydSDVTmSKeTIamHRNDsAgTXqYtIHda/DAj74te229TXoqD4aJ3yVDZAQYPyIXZDA4aWIhvwiyofZNreKgpH/8bZQDb4P1Jx4SuBN6d7078xnZAgfHyL4zd7/m6AWERxsOcjkslI5t73F6TFtMsmp2LCo8HRb4z6bYQAEoreehD8+zi8SfoCg+smtegWq2QlskyzBxd2UR+gdGD6H3zTpMtOGlBb1Yapb5FVTPinglfe6Sb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb5bede2-365f-2c7d-196f-b624621ff4ae@suse.com>
Date: Thu, 2 Dec 2021 13:15:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 6/8] x86/boot: Adjust .text/.rodata/etc permissions in one
 place
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130100445.31156-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0324.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5764cd7d-8a3d-45c0-a8ac-08d9b58d5dc8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23361799547003FA9CBBD14EB3699@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T41w5flmCc9Ybvtd5aOlXDNn+dvyjBVD6egdnI1lQDuJmfoVLlqKr6aGOQf1ralkjiX19HtM0FdwotiXGhu2ur0lgnYud9Sa7ITSLmSj23cC4ZdcFiKj/bi8rpelqgqChp27rWEOnsHFmm3DpHhqVXl/qYlSKSo62x6qubtTJg5IFnq76yn0OcRR/SjAIbCNiGoxJeIRrgtyV1mE5bQ7gJx1N9+uv33noaQeXR7LV0EoQzaOam89AyuhA38tXpbUrCl8tcVaT6lsXobeNwXNhcyuVGcNIzcrhlVeiycconk7kaVXL+0OHZRBSyqbXs2qYtcB8XntnDhH6UOQTS+VLzME+y5NyRF6czwfM3VAAOQKq4cSEBO9hQUu747RT9Hh6XkPvgX7Apgim1ykqmkQPZR2cRVf80MV8HYutX/QpbKfHwTmZy8T/6syUElvx/N9nWiflF+QZ5gXaIUHy1SQ2z54fwijapElOQ1FQGt9hyo6cHh+HBEkDeIU2EByYVDW5/NdTXjXzlUsDS1e1tNv9WPSpVMOUE8ZmjSxJeiAOwqX9CT+K+SsWJYqq/G/hF3siztGSxNwvRssmttCJyM3mkuBWNox6kG+T1aUgoBk5HAuB1QxOiK3OuLASLsOooZ7i2TovcHno6PrqgW9BA9PBeH0rgsoWPK+KiR/8v7+C+8CtGfKyA52FBadNQ0G2pj05gqFcN82ymi0vx4Adnsbz4ivpMvIjJyfYxvKDEy8QSS6pcAV/3wAl8QDJxZZRlkqgeFBhYw3A+vztKAbCxwZuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(66476007)(6916009)(38100700002)(5660300002)(31686004)(16576012)(66556008)(66946007)(2906002)(8676002)(53546011)(86362001)(54906003)(4744005)(6486002)(956004)(316002)(4326008)(8936002)(36756003)(508600001)(186003)(2616005)(26005)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am04NE9IT1FvTnVxeGNWS3BaUFJ4RGcvTEVkbzBYTmt2cW9DeTBlTTFWMnB5?=
 =?utf-8?B?eUhpTHJIeDBkNGhQOGR5dVB3dnhETmsxOElrMmFvcWxsMTNjWUUzelBuRzJC?=
 =?utf-8?B?Rnl1ajI4RHhCam1QaGFhVm5WS3djTFQ0eXl3WkdGSDlhYmZFcVRURFUxWG1z?=
 =?utf-8?B?NnVqcUdLbnhzQmpyanQ4OVZiVTZqcmhiZTNkMGhnK2RXc0NMakZRcDFBM1FP?=
 =?utf-8?B?SjRpNjg4aTFLNHVPakRUSnFOb1hvd3U1SVg2S2ZGZERjUko2N1dNeWFqWGxh?=
 =?utf-8?B?WWQ0cnczNkN4V29VenFoMEo2d1ZHRTJLZnBwdTJLTzViSkdUZStPWFZEZDJv?=
 =?utf-8?B?YlJyUDlOZ2VZcFpJbGdrenRIemxzclFHajUwM3JBMDkvSDhkSG9BdVN5Yys2?=
 =?utf-8?B?Z3pzU0xXVXF2OG04bjM2elJ3RGZLYzlBZmNyV3NKdGJsQWVWanNoU080dDd5?=
 =?utf-8?B?aXRCbThEdmkzT2lOL0g1RW5DRHMxREx5THVwa2NzYXJGSWxRUGdRb01HSTlm?=
 =?utf-8?B?VVBCRUZSOXN6OEtSV1pGRmRYT1J1bmFEUDRVcUc2NUtVc2ZwMnFQWExxTnBD?=
 =?utf-8?B?TjlmZkJ4R2NMbmd3eUtqMGRibmY1WG1zdlpITUIrb0cwZ2hlUVhNSjBNakl0?=
 =?utf-8?B?VkpKL3RLMkZKbFEzTDNpVU9jbEl5WDlrNG4xd3cyc1hiMWJOQ2J2TFBaTUR6?=
 =?utf-8?B?RFZSMVcyQ3l6clpaT3g4T2VRbElnVmluaHg1OUxEN2xaVjJLbzdFYkVLelIr?=
 =?utf-8?B?WHN1eXJGb3dHL0F0dTFXcUI0S3VQaXRLYVNuSXlNOFVjRUozMXNnQU4zazIy?=
 =?utf-8?B?M0FTaStmU3ZYZDkvZlNlaVBqTm4vZnBTTXVaeWhSb2pvSGw4M2lqL2hUM29T?=
 =?utf-8?B?Q0tkWUx6M1JNL3FndkZFT2VxY09vM0dJUmNtNmhXbjFFS2ZSbithMHdFd242?=
 =?utf-8?B?eXZXby9maTZwVHI0N0llSnJYMlBDQ3VzTGVoNkVONVovOVNVY3V3Tkxrb0NY?=
 =?utf-8?B?TkpZdXU4V3VqM0ZCK1hpdlhoa0RSV2E1aFdFOGpGOXJ5ZVVDVmdWU1Y5OGox?=
 =?utf-8?B?UWtnbjdrc2tleDMvaTlXbHlFRVZtTjNZRHVuZGczZ21zLzVITlM1KzExemV5?=
 =?utf-8?B?NjJnSW9FVUxhWVlOcTJuTkdQdkJhdlViSVpzS0tEM0lWWllrZlluS2FBbEtE?=
 =?utf-8?B?WS9ZQ01JLzRuWUFRSS9sQVNtYm5HMmtEcTVGMXpzZ042VG14eElYeHJGNEhP?=
 =?utf-8?B?NEx1ZSs2VVdQSUphNEFqZHNaODVSbm9QS0Z0VFBGcTFaQlY2UnFrV0NpU1ow?=
 =?utf-8?B?M2UrZzdxaSt6RmErZGJNRUtqdWNFTnpaU0I4NGw4TlltelF4RCtieXF4T3BL?=
 =?utf-8?B?Lzgrbmpuc3hJdW5wUk9iVEYyeWRxRWpGQ25MSVJHYVpIdjBJMS9ZWkhXZ2Vi?=
 =?utf-8?B?c0IyU0NpUThrUVZUcjRneXZGVWJHSDZnSmhlRzNJOE9DeDVSVGJOeHBJTHJU?=
 =?utf-8?B?Uk01eVI0S29HMkZUMmExWmNRYjY4elVHa3pzVW5Yd2l0VEozZE5qNUlSNFEx?=
 =?utf-8?B?QVZad05LRDRmc3krTU1wWDkzNlFDUWs1d3lxYjBrZFBWUTlDcUZocWg5aUFs?=
 =?utf-8?B?SHBwZ3J5aFFyV0FTbHVSaEpiWE1NV3BQQUhSaFBsVFp0RjJDa2pUYzBXNkRV?=
 =?utf-8?B?OHpxa00zSzBMOFRyV3ExUEgwajhlTUpQcTlYN1R5ZzdnRXlMSWFPUGhnclpT?=
 =?utf-8?B?VTAyWTI4Nm51VjY4S0QwYTMxblJoZlNhcmFKNWxjbVNzY0dHd2dwS1paV1Zv?=
 =?utf-8?B?YnNpVEZYc1kvYXNRMFJDNlZGRVJDM0VnZ2MwbkNwM2l6Q3pkaGVzMG5jV1hv?=
 =?utf-8?B?TW5VRnE1ayt5RStic1ppcEN6U3NLNm1RSTFsU1Q5Qnk0U3l3MGtBeTBOL1g4?=
 =?utf-8?B?QUNzekpOUGxBTzVzblRnVUQ0bWxBeTNFaUZQNkszdWFxcEtxcytlY00rMUIx?=
 =?utf-8?B?MnFyYXVjRERjb2RsMjZ1SGZVQXdCdVYySUpWZWExQVBoZ3pkeHJJWUtrb0tu?=
 =?utf-8?B?Y1lNN2R5RVI4UlQzMi9JSDBqV3BoUGx6TUM0bStNUndWUnliTVI5ako5VHls?=
 =?utf-8?B?L1N0ZjI5ZjhaL1hjOGRFNDBkNzE2SFVzNHdjQmpuWGJFMkhvZnlDcU1SMXpt?=
 =?utf-8?Q?c0al78nWdDkes96co1UlaNM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5764cd7d-8a3d-45c0-a8ac-08d9b58d5dc8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 12:15:01.9482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUoHPl4uGyjLyAvwp54jV2hnv+NRDyYjZIyTzKa4YkyCdRjJsMsL+UMx6EfLERl2fZzWBQnHCY+9KjXHmUPjiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 30.11.2021 11:04, Andrew Cooper wrote:
> At the moment, we have two locations selecting restricted permissions, not
> very far apart on boot, dependent on opposite answers from using_2M_mapping().
> The later location however can shatter superpages if needed, while the former
> cannot.
> 
> Collect together all the permission adjustments at the slightly later point in
> boot, as we're may need to shatter a superpage to support __ro_after_init.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Again with the understanding that this doesn't really depend on patch 4:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan



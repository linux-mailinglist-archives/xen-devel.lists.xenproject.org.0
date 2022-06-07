Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8B53F78A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 09:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342982.568105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTtj-0002Oy-Cc; Tue, 07 Jun 2022 07:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342982.568105; Tue, 07 Jun 2022 07:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTtj-0002ML-9Q; Tue, 07 Jun 2022 07:45:07 +0000
Received: by outflank-mailman (input) for mailman id 342982;
 Tue, 07 Jun 2022 07:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyTth-0002LF-MW
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 07:45:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bea83ba9-e635-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 09:45:05 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-T_y9WbukMSe1Wj9xMsjCOA-1; Tue, 07 Jun 2022 09:44:59 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2892.eurprd04.prod.outlook.com (2603:10a6:3:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 07:44:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:44:57 +0000
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
X-Inumbo-ID: bea83ba9-e635-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654587904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VEcfuKnWPAwXRS34bYZ3siJsGnmt23cq2YsXEe/AUM0=;
	b=YLT/glt2GieDLr0wbb3lUWOgk5ecIJNzz5wZAzCs7ghLTbaGb6CIYDceefmCRT3IhZNqfn
	UVTopu507POr4VOQAriG0JOtRjrsAWavbl1bZ38vUX8a5UnH3RCwI/W7U5AhE+Re9C9RAX
	aQTrWIixLsaT4DqJ+ki0xBxXazwrsL4=
X-MC-Unique: T_y9WbukMSe1Wj9xMsjCOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZyt7RHZskAL9ZtFTImWhaVTTX5x00Jyrgb8bC8LtwMn8MJ/SUAJrxqRNH3T/F2XzPsYL/A9hrLQlEjXRq+D1/YqDLfvxz/Fe+MdQIg3szaRoLc3IW/DhrDFd3UtGEwLyvu8PgfV/hFQOVWNTZSFvaIfPbADTATIYPGB57pbt2PFpY0qWWy4T6TL5PxbWJv+f8+TLlOUiddpwTlRzC+U4XyekggsN9vjDknz+DzbW50gm50IOW8bwwAVZSS8qbikPGH2/SH+xXE3Ceo/iq84PPFS53YXYA7OVublkkFiA5D0pJTclXDT+wZzmRMH4cmOF0VKsuRKdHO3YKDnro8LSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEcfuKnWPAwXRS34bYZ3siJsGnmt23cq2YsXEe/AUM0=;
 b=im1DU8Dzkj2ClgT7EFpwfRL8duGutNxg65KFE5xK7mdWtt7m5Ckzgxx48W9/pI0FKbs0Km2dXaNN3EUYrwYB0D3z6jvWkxf54HzHw+YwLVQLz1r/5ae+90hynB7fqchLD2LbJyllBmHiKUxVF95NjhZWX0/1kS3Nq8G5CM8c+EBmYKnifLSx6T4gO+3ICOFDlDgMoVj7nf5X0oJ3yOTjflhO3opX1loYjYid4AY9Hoj0VznKhY4rLficCqEu+s4qbktp/Ma6XAyZmsKlkWln2CGsUDWXamxyc2ixdOw5lFejzDxl7Pu+o3vVJ/mOeMmmIZCdnZk6mqFP8swCSBTluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEcfuKnWPAwXRS34bYZ3siJsGnmt23cq2YsXEe/AUM0=;
 b=detzoG8bOLU2NPxRo+FdrRRk51S4ash61vgz+PmY7M72lUSYYdqgLP+lhr65ygJ3MJ1n/DMjHY4Gm2Q+T659fogiCjRaTikp4rvNoM5NXXguGcwMWio8mln3zIz34rvWljTge7iB2MrsRAVQF8x9rmoXFcNFMnOVwlaNz1sGY7HTl3YAVtPDDqqplfIRou5eBRmwftqupvzfCrC08Ni+7+sY/G8i9XXdmeh6ReqxPxbZpLFg28Uul8Y/F6iN7g/2CbNhyAxOh4dIQvAK/pSLwBkNi4bdcNEFCy/aBRTUncUo35LsXya9P4SqJ7e3LgaMIOXUOr2aluMNtM8LDVEtBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb7cc2b9-51cd-b3f5-8e48-9311d0d11cb6@suse.com>
Date: Tue, 7 Jun 2022 09:44:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/9] xen/arm: rename PGC_reserved to PGC_static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-2-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220607073031.722174-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0047.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3af9618-96ee-46e4-d9dc-08da48599ea1
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2892:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB28926D42EA83F66935073781B3A59@HE1PR0402MB2892.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AZYaXttg130vm3tWS2bU1NgcQBiqudIVJBILuY1w1UOO/nZyaihI5LDnD/uu5MFPe7IDuUbu84uUiEieQ8ZLzKNpKH3qg1bF+brdcsptvvFeTRg30TUVjPTvvogDoL4Zyf5ec77r9YCo2zvIG7Q0CoOxVL30L6OFcJMkQemtFsTFhlK2ZzmP5ck8vZshKUU3/76PC4M+m+ihasMkh5euXcVGwhWGTRLc6QM5VHcmwVTO/d7j/as8YOCNOyFiAnuHvfzc32LMx5JEU5EYX24xceYchmGV79eFquA0s94N70z34tjYHs9qr9nZ7THVUomfNjL8DA9LDJh3h3oKG5XbGP4v5o16ad0Aj+FftvnsbLRewJPIcsg+2oYmVPVgvg7b0Cwa43RJ6gl0ab0V11Oxu+qud/vzX2UzmTT1KxoWMG6vWsTIe66fR7Af1dRtNlhijwv5d/D1CmzBYldYmU+wKTGvcA+jsAqMLQKoQzMmaKJjv7jjwtHB2mnNj/ZYpvbhaUtLRk7hs9S2TiFo51E2AqlIMjo3qssmYNKrnEXu7k8LYUcP9zWbK7l5ZlSJb1+J5F36JokgUOrwkrx3NYf8XXXkE/R6A5UuBswhlCrbhlZqx5j1HovR/T878sQiZBwZTMcc9bAMCkuOK2WBo4O/CnYzscYDZ1DH0LKgTfCBfsP4HmrXh+Y9+eTgGLxoDub1A+iGizmp3NBLvtGbQYD5+xQfqoAOY0lOim/v4XlycCEAK6/KIMccXIjgteyfuFhO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31696002)(316002)(54906003)(6916009)(66476007)(66556008)(66946007)(186003)(8676002)(4326008)(2616005)(7416002)(6506007)(53546011)(6512007)(86362001)(26005)(6486002)(2906002)(4744005)(508600001)(38100700002)(5660300002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXpHenh3R1NLcmYxajlyZmNBMnRxTytTS2h5a1ZYemQwMHNQRDdzYmdsTGcr?=
 =?utf-8?B?aU1MN0hMdk5DcDRSejJyOXVsQXZRS0ZZWXgzTkZmTk9NS1MvaTVOT3lQTkdu?=
 =?utf-8?B?SFJEUUF3WDBNa3NvSUJ1L0hqSW5tZjI2bGZBSElHT2NhVE43OCtrRDJNYlBh?=
 =?utf-8?B?aG16RDFXZUc1Yk1WMUhjZG9zOFkxUWw1ZGRId3E4T3hlelNrR3p4YTB1cE5Z?=
 =?utf-8?B?SGVjY3lHbU9mNjlZemtHRWs5MTVWRys0ZEdsclI1OGdIN0t1c202cWF3UFRX?=
 =?utf-8?B?QStzZ1RRcHBWVHdDSXh2MGNlejA3cmlhcWxHN1preW1za1FFYmlwUlJ5WjZr?=
 =?utf-8?B?QWlCYW9RKzJpZXY5UVFvZUliQUplcXZObWp1OU51blJJUnA0TE9JL0d2b3JD?=
 =?utf-8?B?U0l4eHZ3RUQwTTdtamJZMHVBS1RpN0lmUXdoM2hKejdKcWp3cEROejRKdnF2?=
 =?utf-8?B?Sjd2MmIyL0lNZHBMMzF0VzMrbVNJWGZpL0w2aEdqQjZIR0pGQ01YMitQWnJx?=
 =?utf-8?B?OFFnVWZ4QmVKL1dMOTdZbUJwMVhiWVBGYlhxVVBzeTNseFQxbkQybTViOCtm?=
 =?utf-8?B?UHRJNE01czlUNk1kVk5BdVhnN1lHYVpZSzJDWlRLNHR4Z29vN1VTTEtwdkNy?=
 =?utf-8?B?ZFdEZ1hOTVZhUGV3ZmcvaERFZzhzTmliTXJ4THRMUDRrYzNIK3VKaHZxZU44?=
 =?utf-8?B?Z0xLMDBKTXhXY0h2UWxqczNjZXRRSk5zZ3JIOXp2K3ArL3N2VFNhWGp4TjI1?=
 =?utf-8?B?eGpNZzIzbmNqTllZaThvWjJBVGtZZTlPUHhtUzlnVi9IOVorM3ZEZ1Y4R2xQ?=
 =?utf-8?B?dDUwN3VmczN2S2RFUnlwelRLNlhycDNVc1NZWklDbmQ5VHZzdUVTOHZZNVdw?=
 =?utf-8?B?dFRITnpySVlGMlZXODZUTlNDQ1Zuenl0NXB3Y1ZzN0xyM1F1SVlLVklyeHQw?=
 =?utf-8?B?WVJPYi9XTVV5emt5eGlUM1dEL2lWUWFVQTNFRDVFaUlYZlhWakFpTXIyeTRO?=
 =?utf-8?B?ZEl4Rm9NbEVJS0FQZTFPQ0t1ZkZQSnNDditvK2dvbGMxYWVUVW85bmY3RGV5?=
 =?utf-8?B?UDV2M1dQUXgvUFgxZjhQNVZyQ29FU1NDbGk3ZnJyOS92MVY3RDhENTZNUmFW?=
 =?utf-8?B?R1IvdWxTc0J2WGlJcUpWbXF0K3pjV3M3SUo1UXQ5ZjRGNjFSOXdsYkpuRTdD?=
 =?utf-8?B?STkxOWpZaUN5SXduc0pMSE1lV0hHWDlITkhnbHcza2liSzRGUUNaSG5PQlJm?=
 =?utf-8?B?aGRvdzlwRzhwTWE2akNTaXFjeXk3dkhkaEN5NkZpZWlxaGQ2NWhSMlhVeEcz?=
 =?utf-8?B?dFM5VWhuclFzZndPR3BocGFld3c3aDIzd21XY3JaWmM0eEp4SUtCb2tJSkJF?=
 =?utf-8?B?a0N4eVpxOVN4V0EyZ1FoWDY0WE1JcU1yRU9TMnAvaC90K3l6V1FYbEd5UWxW?=
 =?utf-8?B?VFlIYmxDMEpSNGFwZmNKMFA3Y2VKUUdVeUE5SUVqYjdWczBvcmpJY0NYSDV6?=
 =?utf-8?B?ckRxWjhZdjAraTNkNzdOejJhU1lXdE9mSXpXUktsUlZLSkJ0SGdIeHVKVloy?=
 =?utf-8?B?d1Q4Y1hHL3hYRlg0aVZMdE5QWjM4d0ExWDBGYzY0Z2MvMHV0VlUzUVJjdjlv?=
 =?utf-8?B?aU8wY21CUTJWU2Z1N1RpT051QkVkaUw5ZnY5djRYZWc0ZUxISkY2TS9LSzMx?=
 =?utf-8?B?YUZqS043RmtGVERxakxrYUFvRUN3QlVvSitIcTlWRDZBbXpCRExVeWhZZDF1?=
 =?utf-8?B?UUxSVjlkUXdDNGpvYnpDamVCeUoxNTZzeWluS2J6OWFNMFJUY3VrTmdDeUxs?=
 =?utf-8?B?bUdQZ2x0Q1N1WS91WjA3M3hIcGQ1bUV3S3JCYVRFNExxckUxTWR6R3RTSzVq?=
 =?utf-8?B?TWRXS0xTSm9TeUkzMGJFa0lYcENzdHVxVVI5b3NpZXJ0dWhZVjVDR28wZkpE?=
 =?utf-8?B?cXNmQTN0RnJSbFl6VGZSMkxocUFrd292MG51dGFlU2xnSk9Iam9TRERkMXJP?=
 =?utf-8?B?a3pBeUdldHlneWpJeWRUZGZqMDdBbld1bUZ3bkFXZGtSS0NPbVVsWmtpUVB1?=
 =?utf-8?B?LzlLWklSdFVqYkJUUy9POHoxekhaeFFoVGxpVTB5Qkk3MUxybCtsTEVvb3dv?=
 =?utf-8?B?UXZIQnJNMm50RDUxb2NsVUUyVk5iZnhUTFVwMVdJcW5DTXQ5cFBlc3oxdnA3?=
 =?utf-8?B?MTlncXBRb2xQRGtaQkVIb1Y4SGM5bkJRVTZHNFIzWloyMmJRVEpGKzBaWC9l?=
 =?utf-8?B?V1BrM2NmTllvZEdoSFNDaEdIdDNvYlp3dXRtSFYzUm1PMzM4QTVieStkR0xj?=
 =?utf-8?B?VWpMZlhOZkEwT3VsYUtUZGZicklYVmNhTWxVTzkwKzNDak5udEltUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3af9618-96ee-46e4-d9dc-08da48599ea1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:44:57.8449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSvpTuW2qo6gtyhUdm19z2Nb0/FjFFslD529u8F9+LmS97uI8eAr424RoeuDVaMAZO9lXFN3OFaA1mTQigBM+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2892

On 07.06.2022 09:30, Penny Zheng wrote:
> PGC_reserved could be ambiguous, and we have to tell what the pages are
> reserved for, so this commit intends to rename PGC_reserved to
> PGC_static, which clearly indicates the page is reserved for static
> memory.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



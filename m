Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFBA53B5C6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340957.566103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgrW-0000Js-NV; Thu, 02 Jun 2022 09:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340957.566103; Thu, 02 Jun 2022 09:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgrW-0000HL-KA; Thu, 02 Jun 2022 09:11:26 +0000
Received: by outflank-mailman (input) for mailman id 340957;
 Thu, 02 Jun 2022 09:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwgrV-0000HF-20
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:11:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9247587-e253-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 11:11:24 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-prTvffC3PKmDYHPMyIYW2Q-1; Thu, 02 Jun 2022 11:11:20 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2441.eurprd04.prod.outlook.com (2603:10a6:3:7e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:11:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:11:17 +0000
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
X-Inumbo-ID: f9247587-e253-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654161083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLWD3VcNB0vWWMWTO4wRtqhdJKKGbreu5BnmIxRUPxI=;
	b=PjM9ow/wsB5op8Or52odGFczOO/vC7C34/1LVj0U8IdkEUurYjwa2F3q6Z4LNJxCyaGySo
	Wej8/gldB3RdR/bgVHJVx1L0HU88ctMSp17CL2F5QwYXgmjwm1u2781kZOW/5thEm/K2LO
	OqgSu7aZZ4FZdwbP84cDoin03s3elZo=
X-MC-Unique: prTvffC3PKmDYHPMyIYW2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhy5bNpN38w7T5GLqBm1a17mNDhGmu3RoINsKGXzrm4Uq0kfYdZ6M2xQ6hNBptQr3XC0cmt/rmOnkuG4r6aQbgC/Q7nMn0oVGjCleVLKC8yK9Sp2frLtXcvJ9qSwx6F0u3oMSxRpqr0I4Pyh/W91AuF4fdXsc1z4ZSym7k3LCucAYSMbRGPEN+4BeuHhRrs7ke3kyA35OhdKgpELE+yqFSH3z0m/D3aeC8n/VtHfQrLLDfYQzQm2J8RDc6MrlS9pEfsJ0hpXHjr6NUwDSmgcNKNbwlvL3+pP5gXovAcDrCnGhUUsdVMkd8bCc4rqQzQgjRD4FndoWX9rSuOrVI9Jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLWD3VcNB0vWWMWTO4wRtqhdJKKGbreu5BnmIxRUPxI=;
 b=F1BGONFrYh9JHJbBuD31d8jBpTiX7EQHcFa6aYmEjJwOHr3YtSKjnJrp1TvlMQ7CiIYg9bz8ZUQzVSrdVFqai6oip1qdrlxA2a8aY2/0sGUBi3q+72SgJe1MNWWTra75vd5Hy/srMY1FPCUw+02THYJojrNmHGtgjBHtD2+vCtoecOZlw+Cfe7+ROd42gOLU9SgfB4wXrE1Vbgu+KvtsuP5Esb0qG5+02L4PraT2HVM5jLWPK+RimyN8W9jPsbMHXsiFIqRsQCJL2kbhjHPx2XO2zMeCthlOnz2KENHA2MM22YNedCguQWLw5/mPgp1hQOCNWkPVta8fYIxgkH/z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f8f0c20-690c-f02a-e1f8-957462118999@suse.com>
Date: Thu, 2 Jun 2022 11:11:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220601165909.46588-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0186.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d482c5de-41c5-4f78-1952-08da4477d9e6
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2441:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2441FEA81DC0E9696A84BD00B3DE9@HE1PR0401MB2441.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4bOxqF4Ttn7ad9dToYexd5q9SG/StgJ2k0076Lb6xb7GaTUAb/Cdf9lmvfTh08scbR0UnbdHEFJO56devaDMD+wpfm0vZg/c2zZERFygNnQCky5X1k6H7zdYMD0Q6o3dXxAZbhI2ZWb8jfqnx+F/d798R96hxeZENiyfq4yqC5oqrpPSescj49iGdRS3+NDMNF+69kL+u7Ho1k57DY2ta+eHbDiOPh4syW5Uxs2VeUQARFm0jaBEqKyUjrgPxOj/88ZRU5l+rbzQyr2BqCDyLXyq+h05IifS7q/fC9a0atx2HRZF1q52UNUi0ZJuK+d3g5D/k/10MTuMzZaJ17YusIOW74uzSyBpcdh7yEpSfsSWoc5FSy3WZyazcK2io6RrcUBKjcVF5F/jLvzdE2AnT4ZG4AbuC2gSHncmUha/B5P0uHWKxDKZDh9yv0A02pPu0yEcZi1nOEEIBI5fwh4FaggWKMedmenAiozQh/Aq/0cb/3ew/+DG3CDhG9mJHGpUBWpVVRAPZ46GRGJReyFXMEDF1k5JFdYiBT6YAuFIONY9klwQu0j0PQBKcKs8hZe6+S2jfmWotDx33q1iCmT9mf5rd6/Io7TjOBDfDeV7lBEGv23BFs77a+RLG1apOKRqdQNypQxlpLDeGcBG/UGuLBJKfiJC8Cir7sKswHo/4pjYJWhDnNc+Dj+5VbxyOF3MJTQOcRWkEZjkENckBF7ZoViLrMVauu8puTwuQLQlpzADMGQhWRfCbhWTMjM/vCUU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6506007)(186003)(31696002)(26005)(6512007)(6486002)(86362001)(2616005)(8936002)(5660300002)(4744005)(508600001)(53546011)(316002)(6916009)(31686004)(54906003)(36756003)(66476007)(8676002)(4326008)(2906002)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFRNL0RnQW9KeFU3NXhSU05EVXh1TVRiT2JQOGwyK3NXaGw5eGhCc3M4Q0JH?=
 =?utf-8?B?TEE4aysxd1haTjYrTlJzWERvNVNza1IyR3NLYnlaUENEajR2ampXOSt5RkxG?=
 =?utf-8?B?YmFhOUp4b3NhblVXcVduRzVpWnhtNGpaYng4d3ZyY1NvRDBydXRsdmVreGFm?=
 =?utf-8?B?MjRwTTYra292SjJweVROdFVNV2w3VlNWRDBuRWhvOWhEV0tVTER4RURaVHU1?=
 =?utf-8?B?Q1pBaVBZTFJxR2oycU1ESnlwMHVFTE5KaDFvTHp5VnZSeUc4U0JoRnNGTENC?=
 =?utf-8?B?SG1zeThXQWpzZitINkVHellLYy9ZUFB6VmFuTnFQcksxRTAvYS9ueUJFSEwr?=
 =?utf-8?B?UGViMUpOcjNueTNDaWJoMTNNYmh3cTRxS3RWbGh2RmFiamhNMy83NkVaQWN6?=
 =?utf-8?B?SkRSNnU0cW1Fa3I5RFpjRTc1aGdZOUk4U0ZKcEl3NU5PN3hnM1YvUldBbllQ?=
 =?utf-8?B?UkJ2QkxvVE11eitqdDdlMnJ5NFJTeFE2VjVmNG9jS1hmQkQyUWhOeFExTVJC?=
 =?utf-8?B?bXEyZ2NQTUs4R2QwNlBqTXRMaTRKTmFxUFowSGhqbmRXMFd5SVZsVFd5OHVM?=
 =?utf-8?B?RC9Dd1BhVEVDTzJZVzNTWTNBQmY2ZFFHVm9TU2lxdThmSjhBak5HUC9yditm?=
 =?utf-8?B?d0VLc3dWUzB1Vzh5SU01TVFWeTRoSUhzYTJJZ1c1RHI2czFiQmFsR0N6Z05K?=
 =?utf-8?B?dE96NXQ5N05KWHY1U3FqWjNqU2dqN0JKQUhkUFlkQmZwc2tQTElkWk1NQzk3?=
 =?utf-8?B?M00vSk5ZL1c2K3NOZW9rWkhFT1NhTjNVUHpZcXZxbTNWU3VQY2REUGhVbjlK?=
 =?utf-8?B?UVg4ZTl3RE9RUVR4Z3U2RzBrdHlRb0QrYk4ycGQ0ZDVjb3lUbXFmcm9NeXZi?=
 =?utf-8?B?anNoNDk5ZjI0azVseVRLLzRpRzNPYzJ3YXozTkhLNnphMFhFTHN5QTNVMHpC?=
 =?utf-8?B?SzJMMGxJNmRENDA2c3pQNDFCVXFmcTFzSFVVais0cldGdWR3OGZoR1o3R0to?=
 =?utf-8?B?eXp6ZnFhM25sakF5Ti9neE9SMDU0MHprZkNGaCtGNlJ5dUJjdXRmYnhFdWEv?=
 =?utf-8?B?TS85WVNqdGZuUVJCWVBzU2dxMlgrOXAwU2V1TEI2Y0RNYkF3MCtWWCt3TGxr?=
 =?utf-8?B?MXVTOFB5TWkwUW9VOXE3aG1XV3oyMGpCRGxZNG1NeDhkU1BrZmhkaFVya3Qw?=
 =?utf-8?B?WU85RXZ2aGVFamM4WXBBdDM5NkxybzdyYzgvQVY1TFd4RnNKbjhaamNqTHg4?=
 =?utf-8?B?ckxsVFVoRUsxNzRRbU00MSs4b2VQNzNFN1lqWDgxUFgvbDYwTEhDb2R3dU9C?=
 =?utf-8?B?bFdnRlNuck8rQUJqK1pYUEhNSDZ3Sk5MUG1VN0Z3bHlocFYrZzBUK01udDRq?=
 =?utf-8?B?NCtJRk40bzNxTExXMVdUS01tcWJlTHY4aDJNL3JNWEdUMktvZnQ2Wks1SVlT?=
 =?utf-8?B?NmwvWEdPKzBRdG5sNTJKVWloN1prN3R6MmxlMnBSZnlyMWYxcmtZZ3RabEo2?=
 =?utf-8?B?SldjRFpHVjd0RWN0TkF0dmt4Z2JCTG0rTm1sQm5nV0gxZjZrL1IveXd5NlNC?=
 =?utf-8?B?VnhHanV0eS9lTUk4UW9PUGh6NGM1cjhCWWtvL2lSbllPUHU3dEk4NFVqZGth?=
 =?utf-8?B?Z1lUSWVyalozL2lnM1dvbW1ZanRsb1ZSZTZDb2VNY2tyTXMrMm5IOEhKVjha?=
 =?utf-8?B?WDMxeHZ6OWNhS3NGR3lJL1pITVRSNU9LZ3B2K1d4S290RXZYUzVLemFIWUhJ?=
 =?utf-8?B?WHRIK3dxbkRaZW5WK0NMc0tnRGNxRGZUdDlPMWpmWlJzR0VWeXVFZi8rdzBF?=
 =?utf-8?B?bEFoMVVneGRFZWZjNXg2dWFjQUFaQ2FqSCtLK2tOcTBkK2szWlk0dm5SV3Nr?=
 =?utf-8?B?cllnMFplQkpFZzBPY3N1TGpJSGRiTlNRRG43MkY1aGhTYlF1cXUyN29JeHNa?=
 =?utf-8?B?RGpWaHdwVTlhL3RJUjNPNFhUMDYxTVE3NjdHOVR4NHFCVUg1Nmp1WnJFU01r?=
 =?utf-8?B?dkhJbEdXTjRNcmZ3eXZYUFd5ZFBTSmFRenFDRWRCSVZSaUExcXRJZVlRSlc3?=
 =?utf-8?B?QmFXQTMxTi9ybVVKUWJtWDRGUFZrZ3BsNTBOSStZcUErNE5yM0xIeUdUSllN?=
 =?utf-8?B?eXprT05LL2QwOE9XMlJlcWlyS0FYMm1DSkxvODg1NE1FRTUzRXQyanNQS053?=
 =?utf-8?B?d1BpYW42djk4YVMzQ05BUGRFcS9sTG5kZnE2VkJKVkVDVDhUa2VMVjVCdUg0?=
 =?utf-8?B?WWJtR21vQmoyc2VCc0ozTmdERFdVdzRBelBMT2Jhc3hES2VGV2diMjRPVGhV?=
 =?utf-8?B?M1FVcmVtVG9JQUNwZzhrMUtGaysvZnFUeDJoOTJxUGVsc0xBKzIzdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d482c5de-41c5-4f78-1952-08da4477d9e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:11:17.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAOq+LtbUoLIDCSM0zCD27Y4Md9adY7gRsdXlgNJ1Ub+jLhEnTs+OfVS8d/GyES95OnwR1+VNqbM95URekI4Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2441

On 01.06.2022 18:59, Anthony PERARD wrote:
> Use "define" for the headers*_chk commands as otherwise the "#"
> is interpreted as a comment and make can't find the end of
> $(foreach,).

In cmd_xlat_lst you use $(pound) - any reason this doesn't work in
these rules? Note that I don't mind the use of "define", just that I'm
puzzled by the justification.

Jan



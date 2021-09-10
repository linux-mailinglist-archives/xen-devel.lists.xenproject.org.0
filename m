Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946C740671C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 08:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184071.332607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZoj-0000Qq-7x; Fri, 10 Sep 2021 06:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184071.332607; Fri, 10 Sep 2021 06:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZoj-0000OZ-45; Fri, 10 Sep 2021 06:15:17 +0000
Received: by outflank-mailman (input) for mailman id 184071;
 Fri, 10 Sep 2021 06:15:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOZoh-0000OR-9J
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 06:15:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75c9cca0-11fe-11ec-b210-12813bfff9fa;
 Fri, 10 Sep 2021 06:15:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-6s-UVfiWOA-GJXKrP2ThHw-1; Fri, 10 Sep 2021 08:15:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 06:15:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 06:15:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:208:14::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 06:15:11 +0000
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
X-Inumbo-ID: 75c9cca0-11fe-11ec-b210-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631254513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oa6kPufnjAtEzVpGtQRxfkESNGWmP/ZewBL4bZsgzo8=;
	b=iOMdzYspu1DvCCI2et5B7zYyhAvLAOE9+S9xEmnagz86a1XjwVLRLi6IzY6bjv9fftSzaH
	EtoEHPqHhjAQjJqqXduIU3DAjcKzsgvTrgLTCqJ3EFUk6c85dIrxPvU93mrY2dAAsW0htL
	W2mAb7gFIlcjByBovEuzJaD/jrNmrE4=
X-MC-Unique: 6s-UVfiWOA-GJXKrP2ThHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/XWkjstGGo7eXhH5EthMNse6B8Am9T8n4jSNytI/5Eoh2r9jxEYK7mVcq2rxx27nEL5TY31z9jprxHmZspMR/Hy1W5AV2rOGQDJ/EduxaQa4qRQfyRH1Ld87ZWf3SKUqi952zE1j7EtIa2Yrddf47DHMyPhLu0DLCTwkw5kX1hXeIVBttCzYQC3cTqXPB+44PVwFwCFyhvuNrdEVqnEeJisRboQJqx4YD55Tu/ZdHXkO6gdGx3aevZYx1csvvMr2L9gfHGqsiJzMTYGg7N6Y9yL88gerEe2p9AGEfeWjRVeH1XYM+VdVMb7GJfgeeiP8EZO+82BjHv42ZqG3DVZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oa6kPufnjAtEzVpGtQRxfkESNGWmP/ZewBL4bZsgzo8=;
 b=DSZDP5LHsnNwx9IR6r4R+mRTDThajz9d9q44YFc2JWlZ+6napwrBAKRI5hxQBX9z1GoVkTUElm+KcvWfRfBPwI8VBUp/oYeQ2GWGXb6+C85UwTSLCup5zpIngt6dcOPjVjZGyHlRwp7G9o4fqJ/lqYP19rY7T2uNi91S+XvLam45LjGvc8qnIPcigq5JWedpv+U1HW32b07knSbZJN2esFMalifBFYEheKEqeJdCDt+FmcrawmsYQVFOw1cJzkZAHepmf3FaV5BFO4HU4pLwTRkAvuchl/jKLs8bzOssRb5GGZD7+W/wywIlkGVwaARqAsbKWnVGvyoL55WibgqkxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 05/10] xsm: apply coding style
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
 <20210910021236.15082-6-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea0a2e43-6c8c-bfcd-34aa-ec181600ea2d@suse.com>
Date: Fri, 10 Sep 2021 08:15:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910021236.15082-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0035.eurprd03.prod.outlook.com
 (2603:10a6:208:14::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1175bc13-a1b9-4afd-3ec5-08d9742258ed
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703828FFFA4D9EF9F7988F7AB3D69@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+WzLWLfgkZS6WzC3PxUR/jA4Q6OjKN5LqdXB2QelYN5yP1tjfVOT4pnpJPBLIPU/JEMk39KLeNLQV6oylpgCHNArt4KWdw5kfWU2cNftKF/rcYw1cbHekB9oxBrSeLyCPWLcCW9SZ2dWYILSRTSWQZlbh19WZisfJlsQFBDWxRAagQX3R5STRVYQL5vHCuDh/DYp4tIV9NM4QJ76bTrxnlSSIB10kuYuAuxGW4lUlUqGSO0RQFh7SsTKIvbyzA/oLjI6lsS0O+uptQteX0k6LUyznYZrCS/Uif+pv2Too68ZWgaQx1fA/XMDyJds3Yx9ZyuD8TN3jaz9MDC+/SY2/Fed/Vr5FVrbfhJA8gPP1W76SRaXbkUX0H5c33GB+hzxWsBsEuFp1TfNWx3971cpPCGbTTuYkPTR3ICFJjRHrys5SdRFiE3OQuET4BnjXnugatFSE7K3CJ7nb+r3cVX3JjzTa7JXKNotw1XZ44Ahy/Msqj4oxmTFiuCZN+MG/jlG3KiN9+W3C9P7hB2FNLpaC83Kg4Qis8o7NVtNW9KEAAbpeOztMSk9vbFPfClAwZRsCjMotZVN+6oUsaGMWCvs7EeQq+DOwtovvzC4ohNn2lhX1hwsNLZE8Xal3uV/SGfNSoswXsQKOUCGT5+6yLSg+HFaMg5G6NYCqPMdbYzUcHTUWck3BEmX3PyqGw0onOwxaU9f3+xyqtFwIhcBtiEIbEJlh5U6Y0G7AEQ2GhcdsFyCbkQeNI+qHmvO+fyJDY9o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39850400004)(136003)(346002)(376002)(6486002)(83380400001)(8676002)(186003)(2616005)(38100700002)(66476007)(66556008)(4744005)(26005)(31686004)(8936002)(2906002)(53546011)(16576012)(31696002)(5660300002)(956004)(86362001)(316002)(478600001)(66946007)(4326008)(6916009)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlFkVnRvZlFnUE9QYW5naTBXS1ptenloRVFtVXF1V3ZacFZNRkEwV2U2MWd0?=
 =?utf-8?B?VU1na0VFNTMzSHVZYW9kdjlwYVNVMzhIUjhGTG9qcTU0dEZGMGJwYjN5VGly?=
 =?utf-8?B?OGMwaHVqV0JqamtMTDJwYTF3UUNyQzdsVVo0U3R4Rm5peVJTbi9rNVVXakdC?=
 =?utf-8?B?WElNclU2N1NnSGM4VmMyU29lUm4xMWpVVlJJQ0NHS3hwcjYvK0gvWmxvUTcw?=
 =?utf-8?B?OHJjY08vaklDSHpjYldMcWx2aGtkbnA3WFdkeVZzc1F3YjkveEhMc3UrSzZJ?=
 =?utf-8?B?Sm1wUW9OMWtwTFZEZHRzK1doN25UclJ6RFB4bGxLKzlaWWxua21JS1pSakdq?=
 =?utf-8?B?M21jSXRuYWE0Tm0yWE9PVjRBaFluWnFCZkpqMThIQ2VvT2hsZHZCYlZUMWU1?=
 =?utf-8?B?TU5BeWZQTi83Y25YaXQ4Z1ViNUU1QmFzUkRvN1QyUkNPR0NkRjZibmxNa2FE?=
 =?utf-8?B?ZjRoWStDQnB3WmRlY29pdlliZkZUUW1WakFFV05yWnFSYy9TVHRZa09GVVNn?=
 =?utf-8?B?VEhOS2ZxWU8yb25WWjJwajFxRmJqZEdjeFRTanN1ampLWjBnQlRFdVNuTUx3?=
 =?utf-8?B?SWl6dVBTVGRHM3pVOUlVMS8wVUNHMzVWVURvZVRGbjg5TThOaXNETHJCTHN4?=
 =?utf-8?B?RmN0ZVV6U2JseVpBT2FkSkZ6ZU1oYlFDUWpFUHVSVE5WdlhYOFFBdkY2SjVW?=
 =?utf-8?B?OEZmTW5lY21DU2hGUXNrdmpoTTBINlgvd0dUeUFqOTJYQU9IUVNtMVVpTEVo?=
 =?utf-8?B?bDMxRUJINlVtL3NTNHhKUEZGd3hGekFGVTFVT09NNTNkeFJoUmVpTnFPcnhx?=
 =?utf-8?B?MTRabkd1Y0pTKytJbUo1cXZZdmFuU3JqaUM5U0ZRUXJyRXRzYUF3Y3FRRmE3?=
 =?utf-8?B?MVhCMG5XVHRkT1AvQ3VtanFqQlFibGZ6L2ZGOFZIbzRmM21hbm4yRy9JYmJj?=
 =?utf-8?B?L3VxdStOa0djbnVhUFlFZHBuN00xR1ZWamZWQU03ODM4WUhxR0JYdHJqZnc1?=
 =?utf-8?B?T2lsZmt3MjZnMlJaenFxNW1aZmNpdU92SmRibVRaSFV5THdGeTRJZFVhVDZn?=
 =?utf-8?B?ZXM3SFdyYVNKNGN1bnRxKzNvWDFsdVpvZlpUYStiM0RXV2gvTE1CSFVUN01E?=
 =?utf-8?B?QXVFWDlHeXRyTldjSFg5OWZLWTkwMHU4ZkxwVUpqdHBrZ2x6Qkh5SFBoTXg0?=
 =?utf-8?B?UHQ4WGNndWFjaWFUMnQ5TmNCR2paeTNBWlpxdDNnMFNEWlZsM2w0K2w2dlNy?=
 =?utf-8?B?V3ZPWTJEcGoydFk0NDBGVDhZTThjQlJVZFRvOTVTSGRYcWdQdGtVbTRSQ29h?=
 =?utf-8?B?T3FFT0V4VlNZTTVXdTNGWVR2emxSZUdlY2dTUnhSZzZzSXZHU2ljaVkweUZG?=
 =?utf-8?B?UkJreTZHT0c2b2JId1IyYlNFNzVRUVBZZE03MjNWL1pVN0hGOElqLzd3MElK?=
 =?utf-8?B?Y2hlMWhzZHl3NzE3UmJxWVhDZGllNHdTdHlMaWFqMjF0WnBwakZ6dFpGbG1m?=
 =?utf-8?B?cEFZdjBFcEFuNTAxUWU1VmxYKyt5aWRSWUFWWDl5bEhDYzZrWWoyMWhnd0U3?=
 =?utf-8?B?L2xvK3k0ZlljM0lOY0w5enZuMU95UUxtQkJjYXpGRFpjSHdwcjhvd1AzeUps?=
 =?utf-8?B?TXFyRnl1d0YzWmFhU243L0Uzd1U2dUMyaGdmS1cxOEhLNWJOM204NzVoc3BX?=
 =?utf-8?B?R3piMk9WTll6RmNvZjlXU3c3QkJjRWdEYnlvL3pDN0NtUUY5N3RGOGlOM29L?=
 =?utf-8?Q?G1qMLbHGqc7BsMME1dhtSRdf2+hwK3MbdXcbTbo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1175bc13-a1b9-4afd-3ec5-08d9742258ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 06:15:12.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X82tJxGKQky9uldzStufKCNkeuP1WaPGj8cp+f+v00bRjBQ43H2ViNLy70zdckgGg2AemcAmlgGbHNLUNpR0Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 10.09.2021 04:12, Daniel P. Smith wrote:
> @@ -70,7 +73,7 @@ void __xsm_action_mismatch_detected(void);
>  #endif /* CONFIG_XSM */
>  
>  static always_inline int xsm_default_action(
> -    xsm_default_t action, struct domain *src, struct domain *target)
> +	xsm_default_t action, struct domain *src, struct domain *target)

Here and below you're now introducing hard tabs. In Xen style
we don't ever use hard tabs for indentation; this is limited to
files inherited from elsewhere.

It's also not clear why you've touched this instance at all:
The 4 chars indentation was correct already, as previously
pointed out by Andrew (on perhaps a different example).

Jan



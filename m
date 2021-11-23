Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4E459CE7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 08:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229147.396579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQOM-0002SX-HU; Tue, 23 Nov 2021 07:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229147.396579; Tue, 23 Nov 2021 07:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQOM-0002Pk-ES; Tue, 23 Nov 2021 07:39:02 +0000
Received: by outflank-mailman (input) for mailman id 229147;
 Tue, 23 Nov 2021 07:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpQOK-0002Pe-4e
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 07:39:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b4c4934-4c30-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 08:38:58 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-Dp1IG8TYNT-_9QSyZeQf6A-1; Tue, 23 Nov 2021 08:38:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3296.eurprd04.prod.outlook.com (2603:10a6:802:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 07:38:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 07:38:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0097.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Tue, 23 Nov 2021 07:38:53 +0000
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
X-Inumbo-ID: 6b4c4934-4c30-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637653138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHnV7MU7uIYAtUCZ4oASC2bkm3izyOi9lC5heFtHsEA=;
	b=f6JeEvi406lIQGCEt2CHbDmKtb+wux1I1qPUHcUhz9cl2V4fq0AdkmfYSdclVbuAdURFNc
	90PQZr5hHSAfxSCYBfPbmRUvHdeFNU0qzoUVXi0pWwmr/rCtGOoUrqCA96Ow5CFUCM0PfL
	ORHCK0H5msUvSvDJUCVo6IqT5iCK/gQ=
X-MC-Unique: Dp1IG8TYNT-_9QSyZeQf6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTiXVKnRgBYetc3WFQkI5PhJM6tSksZRMXYJ96eyayvL3Yg8Vfdo65F1OTQGNBoovwqcydFFqQ79Jig+//P4Ro5wclDoV5MaeESoorMD5xjC14EpU/5YLY2l3q7iLMPN3aI6UNCqH1HW/+gXz1/8Vaza1/bi8ZsEPzlQ0b5WdQTVw7MWV9L9NxhOICrrsLWF7kBvn3B1DEDtHJ9OGsd6h1221dcHDw+/LWxaqi4bYldJgpwng1mZFuVOrJC+hf4dTVXZLY2TvEjLoqnbpjCN5EORBrbk45IkSlaNTynpBQBBTv0XuOdXcQVrGJlRXxgq/+gKjrCgXQiKPK3jR9JERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHnV7MU7uIYAtUCZ4oASC2bkm3izyOi9lC5heFtHsEA=;
 b=c2grFKi7e3GZPNaGt78Na+weQwZzuJhmm9YD85oRrrzdvxbpBHUZWA2DPi5WGKfG6O7LUV6OjpRtDJtaHe+6jlZ1drqLWOuN+9WzLiqtuWY5uuTvOiw29Qj4E2gQQdpG+no8yEsO3t4XfGUsgJzSur66mINHuhy/G1qByYWt5Bdes9MwPTKLf/N7/IzODdjWRl0JuD5i2ECKAWiQGtEEBJH5AgD9n7qF0FV9MSM7MacT8sfGS9ANYu/Fs0X3a/hK51zkK4pvn+udnACEs7oQhTa/40uH/JnR99FWyG5Z4JaWZ0Vq2VC8iBnlZ0Hmtgk92HYxiiThgtxfyICDrRWogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6b298a2-bc04-8845-eaea-09502e32dcf1@suse.com>
Date: Tue, 23 Nov 2021 08:38:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: roger.pau@citrix.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211122092825.2502306-1-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211122092825.2502306-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0097.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d03a67c-ea23-4737-4dc2-08d9ae544d0a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3296:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3296371B7ABCC919F6CC917AB3609@VI1PR04MB3296.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oMal6FPGg2JeTe5tCixJ3kFOjgk/WT00upNsH9T0UsBlWHyDS8H9uCEjLnngrdlyGyEYLqP6+I5l4Jr4ZwDWh7C5P9EoMqDYsRrKfisKp9+5VKGaBAVTy34Enl3AvIMY4ioci0w/zEmNrEnv07VisApf1tk5i6pauDyRjGPTR/iFD8kLApY7pM4L+ITdpmkJ+MupvNVz6kqSQ08K6OQIePIx6ZcCup8woc6J49WBVOAbcLIffml39rCwfuPSjAxIghvWrsQpeWl+ANb3Hj491IDa6jqt4elLGcNPv2TSn9JNoRFesgpKlzciR/gf+tH9Z5g0PrRqx+y72v+t1t8dBT19OszD9xVdu8Pn8zS7i8vcJ75n+QUamcQIq01G6Nbbe27e2cgvWyMjgjpfF0mWacBfQNltKOawVG6kxtHPP0HTetgE5Fk95l2mAs9tcJlLpSJm4CUPh9zq1PpBk37zp/LnEplf0QzQ1SOayIF8No7ErilivPeVe4HbHBBGIqdzIrUQ41VzuZKMoxX10ceHAj/mTLJlXn+AAWmfcUomsw93ipwBYebEgO6TFYKkFLdo0KSsAKr2GklbhtcEWtTHySH7EFM822FzrVWCBBuf5jgED/4oAroA1U9oIeUip1FzAtN8Ltb0+Mi1NGPFywAttoSXvSiTNn8bjhGa7UXOpy9K6nmWzqHtIqIxbBHS/PnBZn01Xf48A8TM3Y9xMTw3ApdI9CokUW8P3r8S3IRxMGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(86362001)(66476007)(31696002)(66556008)(6486002)(66946007)(16576012)(83380400001)(2906002)(2616005)(956004)(4744005)(316002)(6916009)(4326008)(8936002)(508600001)(186003)(5660300002)(31686004)(38100700002)(26005)(8676002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05Ha1NhakJub3l6dTkydG1SRy9ZbGpCVXVwWldhUnM5Mm9CRXFTYlBMaEtl?=
 =?utf-8?B?aVBCbTRVRFJvaWZqR3JXcTdoVk1vSXVKTm9IRHdZKy95Z21oRE5vMkZGL1or?=
 =?utf-8?B?cVhxQkRnNkZEeDJjUjIvdWtFc3I0QjJmYjAxOWQzUGhOTWVMVmFrYkdDZTVa?=
 =?utf-8?B?SldzZW13TFBGNHVPTzgyTCtWRHBkcVVYQXVWeENaYjUxeDdFMVpMenZtQURo?=
 =?utf-8?B?MkNEZ3ZBUXc3VG1XNjQzd2NhYy9GSmErSWthSnlUU3BsMXhiMkNreWNuR05m?=
 =?utf-8?B?MGR5T2ZJZFB0bzk1c1dRMGdLaFNEMkhtdkFSbTIvdGd0TXhLMkNqRXA3RktK?=
 =?utf-8?B?UmgxWkxVRU43eHFDVkxlY3hteWVkN21zYWpmR2xqVmdsOFJvNEJYWGdVRXg0?=
 =?utf-8?B?UThtQXd4aFpmaU1udFpEN2wzR21hWnYrOVBGOUxvL1VEYkxkNXN5RVJpSHd0?=
 =?utf-8?B?WUgyczFMNUkwSmE3WXJaMEtGdUFGcm43LzI2MnpPSS8yTW5WZndWZkh4bFE0?=
 =?utf-8?B?dHRRQXRNUWQ1SkxTdkJWZC9LOEJwcEZZNkhWYVd3ZXJEdkhyUWZYUTJCeXZB?=
 =?utf-8?B?dG1GRHh1c2Z6UEk4RXhhTjdSMlF2TEM3aG5GdEs0SVZ0SHllSUdYenN5djNP?=
 =?utf-8?B?RE1ETEFKVnVlczk5TXFqZmZadEwyamRuMkhqNU4xb010bllsR29mTFR2Yitl?=
 =?utf-8?B?MDhUbnZLbEVBck9yNlNnS1gvUTkzTnhHcWpDVFNLY0owc2NnU1B3TGlXeDRY?=
 =?utf-8?B?dE4vRGtwM2EzK2p0S1l2ZU5RQUpiMWZLU1FVZTRMWDEwYXhrNG1DRC9hOEVv?=
 =?utf-8?B?eGY5czdIdTNkTHFDSmQwUmNLUGFoOWExd09taTZkMG0xWEM0Y2xSRDdnMjND?=
 =?utf-8?B?Ti9uUHVqS2ZCWmsza3FxUHFzRFJtby9mY2ZYT0xzZzFxek5uWlNyQ1d6VTkr?=
 =?utf-8?B?bXZHOU94VFpPN2xVVWthU0VwWEh5b1lyUm95K0trTmoyZzJtNlJCYlVZcEx3?=
 =?utf-8?B?Y1Q1QmtuKzJZMTBEbVMxSjY4WGs2T3IrRWJKV3JEMmVkOUhBUHVrMTIrMlNu?=
 =?utf-8?B?a0ZBUzV1S0YwOXFqc014Z1diM2hyN20zOEl6TjZmc2V5eHRmUkc5aXJBd3M1?=
 =?utf-8?B?S1NrTHpEUVU2VkI1MmVkbTlENi9HcnphU1dIQ2FDUnZ1L3g2YnQ3SGVoU0dX?=
 =?utf-8?B?bWhRRUhsTGNQSVRGRUllYlJqZ0o0WjZLUjN1U1RqWVFMUDZlbzRCLzM4Nnhp?=
 =?utf-8?B?a1VjVndmTHQ2VnRMRUJhTTNhVVMrNDBWWml3RnQ0ckx4UkRFd1FKeEZ1c3hZ?=
 =?utf-8?B?SzlGZjNCa296UkpZanhWaE1seEpxbnhjQUFpYzdTajRQeFhoeUpXSE43eHpn?=
 =?utf-8?B?bDlaOE9tL0hvTldtRk92WDc5WHJubHBzZGs4Syt3bzNTUDBGbXBJdmlJN25l?=
 =?utf-8?B?RUdEWmFMU2lSMVoxaXc5dXBURHBKTXIwVFg4RTBML2ZpQkw3ckhKNktzendj?=
 =?utf-8?B?aldpV3RwR0QyUDJxdk81NlE5Vkp0MWUydXhSVDBtUEtSWnBOWEordUpvQXJw?=
 =?utf-8?B?L3dQblNWWWdPR1VuazAwZm9qL1JueitNMVpCellGVDFHM2o0TzdDeThxY0pu?=
 =?utf-8?B?YWhBK1pzOXdKQ0syc2ZkM3l3SDVEUHU0am5OMm1WM0NPV1VrTEtnR2NGKzNu?=
 =?utf-8?B?Rmg2VFVLdzBwR3N5WEg0VEdLelErcXNOQjZnQUNKRVF1bWlocVBYUjNlRjNm?=
 =?utf-8?B?ZkxLY0xQUkMvNVRuUHFsSXp4SWErRlhTM1hTS3VRbGJyOXZrUnByalVXc3JV?=
 =?utf-8?B?M0MvM1pnT0UrLzJtRWg5YXo4ZlJFZjVJTmt5cURtVTBqalJSRWdEWmQxQktr?=
 =?utf-8?B?Tk95OE12V1RTNDVFSVQ0YTR0MkowaXV3elBQdGJnbURkcmxIeWpUNVNIdEpl?=
 =?utf-8?B?WkcwanYyYWJSUTRpM1RrbzlhUlBhSHlJTm44OHdPMzlWVzZ0eXpFYmZhQkJr?=
 =?utf-8?B?NUo2cHBXNDVXY1gzb1JINi9EUmFNeEZ5WHM1b2NOQnU4YTgyN1pZOTZ4cEN4?=
 =?utf-8?B?czJWTnNrMThQU1E3ZE9FeHlLUHFmQXpjY2c5b0Z3QUxiMURxNkg4UHJkVUQ0?=
 =?utf-8?B?Q3duaFREZThxY3dBazc4OHpZaFk5NzB5OHdLK2JKaHZMRnpYZURBdGhUajMw?=
 =?utf-8?Q?0hJz7sCPzksFSawlHPLf6N4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d03a67c-ea23-4737-4dc2-08d9ae544d0a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 07:38:54.4121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoNsJVVoY5j6JgBpJDkaJwb2YNrwRD96e7Go5CC7pY6yUpIb0VhBHInwzdZpVs6hWXxKN1qYLavGHh1yG1zTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3296

On 22.11.2021 10:28, Oleksandr Andrushchenko wrote:
> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -51,6 +51,9 @@ void rangeset_limit(
>   /* Pretty-print range limits in hexadecimal. */
>  #define _RANGESETF_prettyprint_hex 0
>  #define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
> +/* Do not print entries marked with this flag. */
> +#define _RANGESETF_no_print 1

There's no need for this, so I'd like to ask that you add ...

> +#define RANGESETF_no_print  (1U << _RANGESETF_no_print)

... just this. In due course we should do away with
_RANGESETF_prettyprint_hex as well (unless you want to do so right
at this occasion).

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC6462D6B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 08:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234862.407558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxPO-0001qp-Do; Tue, 30 Nov 2021 07:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234862.407558; Tue, 30 Nov 2021 07:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrxPO-0001np-8W; Tue, 30 Nov 2021 07:18:34 +0000
Received: by outflank-mailman (input) for mailman id 234862;
 Tue, 30 Nov 2021 07:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrxPM-0001nj-7v
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 07:18:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e37192-51ad-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 08:18:31 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-Lm5c1lnSNI2rfiLJiDHyuQ-2; Tue, 30 Nov 2021 08:18:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 07:18:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 07:18:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0070.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 07:18:24 +0000
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
X-Inumbo-ID: b7e37192-51ad-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638256709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KjXlqqwe38smy/OrV4Wn96gzR6zzZoVPtENYaKdRqd4=;
	b=GaX7MEcs3hZPFDgutp+k8BQqXp3KUrmqnXkq4aPjApNeuIw36U9osyOFpbgBfxeHy79DWo
	KT5m1LT8r13bFMLdR9YqlzJRtHS3507XsdMkHa4LVFQcsNoYAZPzPU71srcp0Mr24EJ7jZ
	1FtYG/HPrVnP1pzNCJBGKeCbjY84068=
X-MC-Unique: Lm5c1lnSNI2rfiLJiDHyuQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vx6x/LZgve1qPJjHGNVxE+t0ZOJHe236Ff5l6ee+pcKBajcMyVXoZ/TYhynCQhvQV/9lichI4fTEm9wQJK44FkNH62Qoc84SUFYzkPp1f2EKhqtkSYnNp0ZxBrNRYgxJ5NkoGXJxx65ei7YFopQ9GcJdWzPGMv9J8J3diJn7uRQanAbEd8VIoAei3PRlLfhlTrfBYeceLzcXhbzaa3LVy0w3N0wjaF5mm+mj1ZMbCCAhUzr4WxPvImb6lwO0QKlZamVxCASUKSxNnt6U+mYh+ung4X5OOTtGcaOpmryS3Njh1wlZnuan33xjuaMFJEVZXIotIKd8IxsI6Fr9yjJuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjXlqqwe38smy/OrV4Wn96gzR6zzZoVPtENYaKdRqd4=;
 b=k9FcylFxvPuVh/COcQBMHE2o2CdKiSQk/Pt8ZiRXcTti6mHlGQ3c4i8QSQa8W9QZ+4we0jEmBHZOiTDzt8MQv+09tC7fnyLRE135kixiviIm1QgEG4wi5EizfLi5u+FupySHKLArI401naPb8TX7Sfyx28PuuEy+ve4W5ZrS7PDTgs+r+ihgCI4txqhg5oPSOEgBwl9x4oXWCSm3eXp5SxdIpSSDF825FMv332YkQncWw/INh3dgTRd4ygyKOu6bgrpI1KPOylvB3K/JS8iakyXC/zYxa08+9SxxXbGBLDIOH60Ue1ODqwEy5T6Abyq9db+hvLjslDSC5sOb33nzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f0230f3-79d2-d40e-f3f3-33201c2792b0@suse.com>
Date: Tue, 30 Nov 2021 08:18:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] Fixed an incorrect value
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 Ayan Kumar Halder <ayankuma@xilinx.com>, xen-devel@lists.xenproject.org
References: <20211129194450.62467-1-ayankuma@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129194450.62467-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0070.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88afcb8d-616c-4cb1-9774-08d9b3d199dd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4605749F21E98894C3D50150B3679@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g6PUpvvy/rakZwq+6BmB1EpSr/c3xJELUAr1DSqN3DGlhfKe4e9+bUosuo7rE941LeAJQHxA7mfaHUVEJYU/9nr58Rj2GIFp1W52HLrNonqQ7HiD7UbIqdIOT+n5VrSTGbG+6dYQLk/lJrpnrlSfw8TvVtwiFBd9E36DXj5VeuK3CDKL/7ZcJ9Xw+Hcui2F2lWGdlEmEe7ShXENIsYWuj6BuN9q2SlXI/2A+QpP1jtGz46GgO3Rr0JN3Bg+Q7EZ/DVFvgikLuTlJOghxwccRnG3pAd1fWJzAa74KSim+XVpOp/UoeP1HrSNJA3pBXWn/ZLdaN+KuqiARGiy+UnNeYtCxFzUt648riJwe4HYBqtwsQyjQfPWkjlMZlTgnsaqPAYLOPuHXCOO37mXechyvgEoxb91CFCnMHgxWDrD4OV9XiM8E2RuPX8KnK9WIH2iXwMAbfSt2968S+B9jOB73XO2iPIZ1JGdDN9dlAfo+KvJISbo5kuzu0Mw4WYAKzxNMLnN4fYQ5n5wwdiZKttwg9zLVPC1Dtn1g6k3Vz08+vJQ+sMOKT1WSPAWM1+z5iTTdfTTsDvMD6fjG3L0lDFDwQ/Ja533ppwC7AVjxix8eOM5QBWt116Y8YGRS0IXWABnwFzhAESoyzlfUAIciyA5+5LfX3teTz1lmTnun6ESWxuMitErJN0DPF1hvvvZ5JWvxfM1P0l2RcIQPiHzVegW/1cGscOSv0P0UcGLxLDNT32M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(508600001)(86362001)(53546011)(31696002)(4326008)(8936002)(38100700002)(8676002)(36756003)(6916009)(6486002)(26005)(4744005)(2616005)(2906002)(66556008)(5660300002)(186003)(66476007)(16576012)(66946007)(316002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHNEQmVlNE9OQTBpOWM4blRTcU5QejIrdDdLN1dwRWpxV1VJdXRDV25OYnR5?=
 =?utf-8?B?RURVdEwyZm93dWdMVzJ2ZFM2RzdjVHdkSElVTlVCWHVrU25TdGJqOWlJbERD?=
 =?utf-8?B?cGlGQWRvUHE5VHlZOW9Makt4bVRjWlhkN2hxMlVyTzBMK253SWg4Vlo4RS9Y?=
 =?utf-8?B?OThPZUpudnNXa05WYVQ4Yy9OQ1FtYmpoL1d0RzZ5OXNCTEtxU29zZW1IQ3lv?=
 =?utf-8?B?aWdaT2pnWmlLMVdtV3owcGM1QU5UUS9JcGxBNUVQSGZXUnJER0V5VXRpTURG?=
 =?utf-8?B?RXlKWVVTWmZYTzBmdTZCS2FrdGZlcWFkNGJ1THRqb3hCSUlZbUI3c1RjUnAy?=
 =?utf-8?B?Q3dSNk1vcXF4MS9ZVDRlMXQ3Z0lTazlPYXJDQkNSVDlBTGpsbmhYb04zc1lB?=
 =?utf-8?B?SHZpOG4ybEdtbmtKYk4zWi9vNUpRNVRrb29kN09JY1pYQWVQWExrZWFOczdD?=
 =?utf-8?B?aDFRSXdJejdyZlZCaUdKaWIwYkR0WFhjeXpBbTZPUk9XRUVMQnBiVS9OYitC?=
 =?utf-8?B?OFU2RlQrZHR0YUYwbXloY3QxY2t2UUNLN0trKzNud3psVkE5dGtUMy9vQjV0?=
 =?utf-8?B?MUduam40T3FURmJkMmZDcHdXWG5WS29vek1jbkQ2dUtoSFIvbDFLUzgwWEtm?=
 =?utf-8?B?SjZWaHd2a0orcHNEN3RaQTVraFFCWmtJNkhKM0RtYldmUXB2QmliSUdqYTlL?=
 =?utf-8?B?dFNSbDIyUGtKQXh6cHRPZlM2T3JLTGNxdUl3Mmt5ZzdVQms0MVJkZkdMaWNj?=
 =?utf-8?B?Z1kwSTR1Vk56ZFAza1NrOHhOTG5sVkJxWldwSk9pbXdpeHhLZEtLNkFxUnFl?=
 =?utf-8?B?cm9YTEdha2JVRk82d0hDT0JQWjZXUEFFRjRabE0ydXlOYy9VcTBBYkJua0g1?=
 =?utf-8?B?VGU2VUFGMlJ6bjRSVnhNekVkU2RaMUZwZktGc0RRWk96R3pKcDlmaS9zbmsy?=
 =?utf-8?B?VHVwdWkyYVJkOWRUSE1XRHdsaGxSY21kei9VVWlHTE9SUlYrcWt3Qk5rVEhK?=
 =?utf-8?B?Vk44bDFvUDlwQ2EvbG1xTDRYV1M1N25yS1o4cnY1aDFIclBCaVZIYVFVLzll?=
 =?utf-8?B?eGFqYjJha1A3RGd0N2w1VFVNQWYrSS9LdWd4WjdVMzRBMmp2MDBWNlBxdFdW?=
 =?utf-8?B?R0F1MFVsNkJWeDBVTVlnNmg1UUJZM1d0YnFFU3ZSc2tlb1dMOFRPdElJcnhz?=
 =?utf-8?B?b21qTDJMRTVQS2tZSVE3NURmSU1ySmwvYURYTU9SWDJOWHBma1lHVXlQWnF3?=
 =?utf-8?B?dVFNdlVZSGppaTdYSFpWVEpqNUVDRnpYK1JuR3hsSWpRYkVCa0YzVUtLT3Y4?=
 =?utf-8?B?NUw5SEZIY01ja0xJdEFkQzQydFZNeWNoYUEwd1hoaEZqYWtTU0YxT1pDWXJY?=
 =?utf-8?B?RU9uQ3JJNnpnZWFCVnMvU3dqL0Z1TVRjQUFZa05MWFB6NDEwQ0k1SlhqazBK?=
 =?utf-8?B?RnZqYnV1T044amhOYndRUTJZaWJaVVo3L2FYNEdROVRCZ1FWRWNvY2FGQmpu?=
 =?utf-8?B?NGgzSmN4L081NmNScFZFS1ZKYlBQNE5PQ3hRRDY1ZTRJQS9PbmZUZlRTS0l2?=
 =?utf-8?B?RlRvQ3NuT2JUWHVJbEJOdW9EdXVKV1kzem9vZ052UTVSc0RUNVBLYnJNS2NV?=
 =?utf-8?B?NEtickN5U0dyYmx4andmZTRKTy9oVGY4OXBabGtmZjhKYnZDT1cwS2lmWXY2?=
 =?utf-8?B?dzd5dEgrSnNESHF1SnR0cU9yUnRvTFhwMHl1TnFlZEdtaFhKd2tmK29zVU9a?=
 =?utf-8?B?Z0dDOW8yL09STG8vYWVoaG9DUXFNNjJsSTRLaStmNnlvNFBmYlRBRllUcUNG?=
 =?utf-8?B?b25tc0U2Szl6K3RrVVQvQVgvSFVFK2xuWGs1RjB0RVZyVVdzZmJmV3Ntb3gx?=
 =?utf-8?B?TW9WU1VFa1JUMHJpSWhaTGcwdmZESFZrelk4dzl3T3RDMjA4WGNSeW9FU0pN?=
 =?utf-8?B?WVlHeVVKSjBFclVrQkhHK01hV2lFTi83MUNmRGl1YWhmQ3NMK2t3TWRqUStB?=
 =?utf-8?B?V3FUcVRsMHlEL3VzZTh5VGl5RjlENDk3MXVNZENKVDJxNGRubnBiVy9hU0sx?=
 =?utf-8?B?UGx0bGN3UDJaNzlSS0FmSVpvNWY2NW1jd1N0SkhHN2dteWdnNDNHOEtPbVZa?=
 =?utf-8?B?V0g5TUo2T2JMTEVKV2syaUtuMVZZazRGWlU5OTdGM3BXek5PUjJLWGQ0NmpP?=
 =?utf-8?Q?GgxX0NameRGao2nHQPFC/3w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88afcb8d-616c-4cb1-9774-08d9b3d199dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 07:18:26.2068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANNW/uKdRbQpVtSvzINKhosAvIWPCgSDZ+mlCbndB5zTff3X9Ntffw94u1keNgmkX95Svm167lpxfDJm8EshmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 29.11.2021 20:44, Ayan Kumar Halder wrote:
> GENMASK(30, 21) should be 0x07fe00000

Please can this have a meaningful title? E.g. "bitops: fix incorrect
value in comment"?

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -5,7 +5,7 @@
>  /*
>   * Create a contiguous bitmask starting at bit position @l and ending at
>   * position @h. For example
> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
> + * GENMASK(30, 21) gives us the 32bit vector 0x07fe00000.

Once at it I think you also want to
- replace the word "vector",
- drop the odd leading 0: The number would better be 8 digits or
  16 digits, but not 9.

Jan



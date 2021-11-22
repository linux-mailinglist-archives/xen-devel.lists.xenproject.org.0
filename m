Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80F458A5C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228610.395637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4Qt-0003YS-Tr; Mon, 22 Nov 2021 08:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228610.395637; Mon, 22 Nov 2021 08:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4Qt-0003W4-QV; Mon, 22 Nov 2021 08:12:11 +0000
Received: by outflank-mailman (input) for mailman id 228610;
 Mon, 22 Nov 2021 08:12:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp4Qr-0003Vw-Iw
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:12:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2da898e-4b6b-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 09:12:08 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-b_6fewYDPiG-sHPdq8XvxQ-1; Mon, 22 Nov 2021 09:12:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 08:12:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:12:04 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS9PR06CA0216.eurprd06.prod.outlook.com (2603:10a6:20b:45e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 08:12:03 +0000
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
X-Inumbo-ID: e2da898e-4b6b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637568728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFkw2et8qdxmeLhhN6v/KQ5SW+Y1viEB5bxI7tM5hEo=;
	b=DFw3JKSMfarmPbTFuA8LRkFqfCrswnTHssIZ+Xdfbk0G4d2okDWLMC73ZDP47Y0mVpLfWc
	0D6kdliBLJITFEaqBDIjFVevnPwL3+nEpx/aD2ie/ktFFrYjnSYG1+pDB17M/eH0SGhZ8l
	kZR+MGpuVDSwx894/VS0Mg+KJrnzdFc=
X-MC-Unique: b_6fewYDPiG-sHPdq8XvxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDV1vJKJdZciZZSXoKkvsbWQlXUQF3S7nC+4cKY8QAMacFSsQlL/cWlboSjmr1xPmg9JSiW1c5NKGkOjzqHOjdu2mCteT1kDhHHPX7dcvhjeRBpX0cXR/jnysy9oY3EDBJz/t+60wWZQNFlTGQ/DY6FKs8UB/4USKX58s94THjgDPANgjvQzDT6e3l8rkKiUpk6/MiZM/cM+j4J62cRcseFsWopOjCMwr0YvYKxQtW53lvH1athnJqJ3dXH2xtKv7lE8d2ZxJoPV0/hAqVmY3CEngvxj8gTaiRu3LeK8nHwKzyTpB433XtqsiD/D9E6reM2DHGTTBhJ5QHyT19/M1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFkw2et8qdxmeLhhN6v/KQ5SW+Y1viEB5bxI7tM5hEo=;
 b=frE9DUM1ukcPsnaK2c9LdeKbCtoBbVSGN5JMQChbh4Xjfji0vzNSO6ONX4XrPU1O0dnbB/9/hE+CElYIK4+qAjKFYeE28uvhyeQnbJNCdtKeQCx9A27rKmBVpG2iTwe+k44Mqi8/kZI0PO07kzg3Ys1g5z05EfiAkjTNSfqOdtT1eVXHiWe6UiCRSYK0JHlCTm5hvoru6hwmogBC756JARsYqgdFEHGwx5MXDjtg8LohevrJS3uVlth5CcuUTvXX2Ok62KzkcQdgl5T6r4XU21U/X7r27GToH0OXzIAqqmicckIq0fYTtal8sFUpDzOp0JHlQhcNgeHbSL2qEFiM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25431a55-6103-3301-96c3-806689da327c@suse.com>
Date: Mon, 22 Nov 2021 09:12:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: sstabellini@kernel.org, stefano.stabellini@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 ayankuma@xilinx.com, xen-devel@lists.xenproject.org
References: <20211119165202.42442-1-ayankuma@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119165202.42442-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0216.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67adb961-0754-4ac3-6a66-08d9ad8fc4b6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166AE0B857A14DAA8517E26B39F9@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hodEfkZFrZqP5nDtiP5XIjN7wvrGXcbt0F4OhQuZiHffePjFIvBFM1evjNnjywevKwv2w7v2hUxp+s2UwecQXuGj+MrUw8C0Z7BQH7Yc45ghddC99dHNMtooJt/JoKTiSYuqwRwrZQktEmu5C5TBtphFQCthW3m+X005s7epo/aADLIhQTYqWfinFhbxzSTWQXPywUPDtQxdMbWGLX5ZrHLMmKv28xO8ioDqvmYtIBBT7eB1NCMohOG5kTwcgwmeHKyHE30F1fWrR55NS4Sui3glny20eNLCxPVzBC5nM6/PHCaUQvqSy4UZaYIdEQBRog6jG51dthhX3aTmuM78j8qYn/kw3qAOz1ruxzkLoGuzsKcoF436Q2+hdwv+aZ7qxxU9iDZFaPgNm+1WJieyh3izWw1jPniW5Ok2jZI4zzjptzGxU3iKRFEl2QDfKLxxDuEA6PV+yj7UrLfbWjvo7uYxxMGnWXeZL+2c1jredoRK+6HT8RRCPIDrpKtuucoPEmFCnmcOFowikq8jQdvMwlQDJBYUz4rQmhWUD/5LV/roenIDLuXRuuu5xt/bv+KZt0OUulzY+T3Notx6XiWiCySDx7AQbD0gmWLhw31PYYAe9rrdvLwiO1YIPBCvgYRFvZwFc4GxQR9X4aKDvd6MTHMLnAVmBLS12s22VPwFh3iZhO9kw+Y+90dbzn6xjNuDmSj6zS4AqgiqYXbT9PS07TKA6eL23jEokTyR13qClZpL/MzaNMGNo+/c/AS7Y4WY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(53546011)(31696002)(2906002)(38100700002)(8936002)(508600001)(186003)(2616005)(5660300002)(66556008)(6916009)(66476007)(31686004)(66946007)(4326008)(316002)(8676002)(36756003)(6486002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0J4RWIzRVV1SGRPVm9uYmswU2VCMkErK1B6d2xpVG1aenFTTXlwN0hqV2xw?=
 =?utf-8?B?NXlGQ3YyWUUyRE9yQ2R4dEJSVE9LWUZWc3U1K01oUXhTU3lrWDV4UHFJNU02?=
 =?utf-8?B?cHArOERQZ0JGOUlTQXdBd1pmdGNLUkJGMDVXRUdVTFVLeXdkL3BkVjNKeEEy?=
 =?utf-8?B?NGd5SmxkaEsyWGRFamlaaHpQcG51WE9YcjYzQTFDZ1FRa3E4TVU5RzQ4ZDVT?=
 =?utf-8?B?aGtHZXJRVENFYnNvUjdSYlpCbForMk1WMUJMY1hBZVBUaXpJVkYxUDl1eERX?=
 =?utf-8?B?Zm5ML1hHRW10dmZFWk4vb1BTVTM2cE50NVN0R2JmV1ZycGZjQkhuMzYxc3oy?=
 =?utf-8?B?eE93NW9wUE9rUVhnYWw0TFRzdytUbkh6WUtjVE40ajBmMHBqZWVjUjUweDdJ?=
 =?utf-8?B?bHd0Ykk1THJHampTNHBTRDcrOW9WenY2V0c5TTJiblNmRlNRbVp0VkFhVDc4?=
 =?utf-8?B?ajdna0twOUtSeCtReXpFYm1heWcraTJuTTgzVHpUcVFJWHdDczc4cVo1VTlR?=
 =?utf-8?B?Q2xqakNKSFJ6WlE1UGFCWCtQUEFyVnN3TzVVaHBMcWROUzFVaUhaNmIrL2dX?=
 =?utf-8?B?SktFeWc2SjlwZDdIUHVHUzNuYlg0TURpNkhOcFAwWmJhMWdNWjIwdFBEamlH?=
 =?utf-8?B?Z2xOSDdFaE13N0NQMEl4SnRyQnQrWnR5Ti9TOVJuRHJ5NWRZaU9TemlHMGFu?=
 =?utf-8?B?SFFxYkFrSGdORXMxMnlIeXZZUy9jL2pWd2haRTREbFhyaUVKanlOQkxpMk1V?=
 =?utf-8?B?azNNQmhIQzhUNDhkYWpvMDlGTVJ3alBFSXZJQ1NNQ0RUS1FSUEcyc1lJeVFI?=
 =?utf-8?B?L3JTeUtPdVJ6NXlEcWR5RlNCTnhBT3BHdXF3a2h1L3RzV0JzKzROZHUvWVFo?=
 =?utf-8?B?d2d3bS9VSVY2MnBudzJnY25kdVJNYmNWRndTWVYwTi9OM2N0eWZQREd6cTlv?=
 =?utf-8?B?SDNwQU1JaDBIUDVHdWMyRmhLQWYvYTN1QjM3ZHo2ZmpDRzg0MEp5YzJRUkRo?=
 =?utf-8?B?NDZOSkV3dGdIMGZJT2hUaEQ4TVMxNUt6SVpvSUFSZjhCdFovWmJTVkFBVm1Q?=
 =?utf-8?B?NG5BcnVZQVpJaHVMMEppamxCYkxraWhXYWVSZDRzQ2RFWUxrNDQyelFsL2Jv?=
 =?utf-8?B?dU9yRWwwUjNoQUJ2WW1MYmhDOFJtTjhZNVd4M0N1K2FJYm5WYTcwSXYyOVU3?=
 =?utf-8?B?bWlUb0cxVHlhR3FtdmdIY0dGbUIrWk02aW1xKzY4MzFRc0FvMDhZQ1RDRnhv?=
 =?utf-8?B?M1dxN1JuTkdYbTV2R2hTRVdMUVZySkNqWG44M1RBMXVSc3Zjbjg2aTVyS052?=
 =?utf-8?B?MGJmUVppZXJGeFZhWGt4dGJkMDlNUjdxaFJvKzUxYmpTb3lBL1JtdksxT05n?=
 =?utf-8?B?YTdyQTRjRkFReHZYU2ZTbjlucjVuZ3NKODFnaHgwYkZHZEpqa1NrcmhoTXFK?=
 =?utf-8?B?c0dFMXZBSjJXS2hPKzB4cWllUmpxUHRIZytZT0dpNWJpcjJaTitRTjA0Q0NQ?=
 =?utf-8?B?YlV3MS8xTzlqbmx5L2p1M3NVeExscVN2Qy9sdEE0Z29vdnpveTBTT3lZWXhD?=
 =?utf-8?B?Sk9Oc3hOVkxCazd2dlRtSGhyNkRHT09iZ1FteEo5eFBOL1FTU1E2K3Z4Snhq?=
 =?utf-8?B?bEVVaDBGQUZwSHd3TmNaREtJR2hBK1N1clJudGR6M0xTcVpYSGU0c3dJZVNj?=
 =?utf-8?B?TmFnbTQzaXFkM1NSd3oycVlnbnN2UlMwa1Z4a3JjWjJ2TzBQa2o1R2hrd2xK?=
 =?utf-8?B?d3dlWm5OVm1sUlZ6ZUxsZkV1Y3U2eDJZZEVPSDJSczVqYVZwSmJjYkJPa2R3?=
 =?utf-8?B?QXJZN3pNNzZHRCs3YWJiRUR4a3I2MW9CZ2NwT0FxNFFUaFRKNXkrTWxqcEUw?=
 =?utf-8?B?VVREeEhzaEZOVkRiRTNZZVJkTVY2RUdqOEcwakYzQ2J6eG1sTG16L1ZEMi9R?=
 =?utf-8?B?SGNiV0I2dXZwc1hXdzhnY3owZkcrR1p0MVZ2QnpsL0JjZGx1SXNNNnZSMjdQ?=
 =?utf-8?B?ampybzNlbUNscWRYcGhNQjk0bEJteGpsYXZXRmp4UVlITkgxUmJ6MEtTQUwr?=
 =?utf-8?B?RmhhMWhnaU9zTE4xMHdSblpscFRKWFBqUGtpTkoxWnQ2Uno5VXo3cmQzaW1U?=
 =?utf-8?B?ZFMzbW9mTVEydkVoYmxUdE50L1dibnY2eDZUNzJnRTdrRjJKWmppcVFHR1lS?=
 =?utf-8?B?MGIxQm9MVjJsVkI0UTRVWnpTeUtjMlMyV0VPY2p4UitYVnB0NnNQNC9SM3lk?=
 =?utf-8?Q?e/VRqV78EKOdXlgmYFHD+MrLM6KD64cTg+e/RVzRgY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67adb961-0754-4ac3-6a66-08d9ad8fc4b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:12:04.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cttQVNvKmFm5cSKmpfxZlHlYdKq5Kg23G36ppwCd7NUoWw9h3MVKnvd5P+8rHnzOvg6sKF0HwKTjnWoxkR//Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 19.11.2021 17:52, Ayan Kumar Halder wrote:
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,80 @@ bad_thumb2:
>      return 1;
>  }
>  
> +static inline int32_t extract32(uint32_t value, int start, int length)
> +{
> +    int32_t ret;
> +
> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
> +        return -EINVAL;
> +
> +    ret = (value >> start) & (~0U >> (32 - length));
> +
> +    return ret;
> +}

In addition to Julien's comment regarding the function parameters - why
is the return type int32_t and not uint32_t? Plus as per ./CODING_STYLE
it really shouldn't be a fixed width type anyway, but e.g. unsigned int.

Jan



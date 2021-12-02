Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FF466146
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 11:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236439.410140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msj5M-0005CV-Dy; Thu, 02 Dec 2021 10:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236439.410140; Thu, 02 Dec 2021 10:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msj5M-0005A8-Aa; Thu, 02 Dec 2021 10:13:04 +0000
Received: by outflank-mailman (input) for mailman id 236439;
 Thu, 02 Dec 2021 10:13:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msj5K-0005A2-BD
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 10:13:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e117559-5358-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 11:13:01 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-u7kz9J7PP92-inCO1rwkmQ-1; Thu, 02 Dec 2021 11:12:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 10:12:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 10:12:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0045.eurprd02.prod.outlook.com (2603:10a6:20b:3a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 10:12:57 +0000
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
X-Inumbo-ID: 6e117559-5358-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638439981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hb6wXT7j+7j5WnsHGVg+Hd3o/WlwkCVs1TK7CN19H/4=;
	b=Lisn8zHbEgwLtGpVd1qYHi9/r+2ELlTfncwbZw1oaWX5m7h8wg/PPPg8bGoLlcNmKYFOdb
	Ydg2KhKdCmYw2MQClBFJi3oUI93xiZ/bPu3NMozYZh13qpzfbb/pk7xjlETVGpr9rK/GQr
	3QkNsNmPothPvT8ABiwgTu65ZQnMNuE=
X-MC-Unique: u7kz9J7PP92-inCO1rwkmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVct31ihfcaaiQr50VgN2WGFe1QTLBdhf9ZXuz9eT6pa2eVxvb18HM+680Px6czdJ3umF7Kk71XJk/hzX+5ol6tU1c7lpLSu1VB64L2ygZseRprBbTchwWpBGzSXoNhnsQsMNEXv8NOQmQ0YKWykr6coxH9QklC7dY22/Wg2/08vwCWcL3LANUGkZQvqFKDWETTH6uW6WH7wGclKsWMbnJZ7xRNIhVa/zrsyM+wze6/6NIv7xtsj/f6fhCaD2r5NqTW4T2cqvXI9IGNf/f0u7p7gqL31jR8o5pz3DblbcaC79R0OXufPiHnqbvuaQkIYRiognI/Erfo2cu6Kc+hGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb6wXT7j+7j5WnsHGVg+Hd3o/WlwkCVs1TK7CN19H/4=;
 b=iGZcbnBwUy+bnGIUHX7rIIrp09XouVVK6LBZB0f9wfMN1H0GFdNAL0n0Ryqv/MIR61pewSdF17tbdaHe09FlawnW5tu2oHbRicgmOoHpf3JyoWXG9NrthwCPzrMcBToUA/ZDPL4JqAJasIVZy/QLWQbjvcru8eHpbO+/f2K+WLKp0VogoB1fqJpfDg+MoZODgNNVPYCDk2zll+LxeulW/9fQuUMDbj04tdr9wMqzORYJZulTcSm6SJgpuRpyY4wNomOpguzXCc6kXxdC4XShlC9SwvGiQsXg2DT9EFjsnZayxwWMy40SJZLhWROTHhyRvfH36jXNlf9DrzmRhXFC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09847780-10b4-5b14-b15f-d82597fa8b3e@suse.com>
Date: Thu, 2 Dec 2021 11:12:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <b6eeab97-90ed-85f8-79ea-ac86e912dc43@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b6eeab97-90ed-85f8-79ea-ac86e912dc43@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0045.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22a532ac-09bb-4b8d-979a-08d9b57c5046
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393588E6133A7DC183D87031B3699@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LP2spPJ83IgQFW5TSxd3rWVobmwDNWFz3BrMbnvl70qZpRyWGsbftQ4BZ6LTeZsUd5sWz+vm7152pxYOZVs1DqfRXQgMunUSYXMp+UfWjTq5cbAwMnaI0eIRlVTqwdArz/mVH2R05q2vIzSlHTLx6ZIrvNCPQrT35XwuhttjEuKmt/NeD2t+oPb4o43nL8ztzdp7Nr3kaqf1z2/zO4QGxwhMEEOhmic/JOwOw8kFeq2N/WKlF6Nc5lBoTz7rcF0VeshQli2+2gQR5xXiXrPOzqvPj53un2kRux7qFwHeHC7TFPM4usSTOKkH+zFEV+W3GPrXy3ktYkRHlwFaBRsuqmKle1kW5FnnwNGaL0jTi7eVFi3hi1ihaHyCQRvdUToYN1qFREDksdXQDW3jT9zmCu67JDF5faEXPLBkxA6tZx8wVmrpPOD4KTg39H9q0cMhNd3uJpoqP10L/C62XWuZT9mWMVwUKbsXBSKFswlm6RafR89i42WZbdi1HI2RrE5iSEnv25IZW2dlQXLVRwKljrHUwPuAoyfzTmSljn1IuZyYAMQdhmMGwrmMzi/CHjrfTKROFo6LawkCcMULbfC1Yhh2B9SW6FDI6CRaQbBLgNv6DpbiSRQayRBDTB33+joZkmqtccWOpxezPB3+PC2knIPW5Lu9TN+T2/V56kGEvwZ7VeNCcmZ8XNPg7gHK4zN+d8ch5gqpx1Tslu+epttPDTvjOUIpRFMEdf4JmKqXxto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(36756003)(956004)(6916009)(26005)(31686004)(508600001)(66946007)(66556008)(4326008)(8676002)(8936002)(86362001)(53546011)(31696002)(2906002)(38100700002)(5660300002)(186003)(66476007)(54906003)(16576012)(316002)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFpzbTRwd01hYWdZUG9wakpoRm55T3RlS2ZZYUdrQmVRNDFRU3dpK3hZak5J?=
 =?utf-8?B?elh3ek9NSlhCNzJoaXFrT3FaV0dHVlhLWmxNZjh4WDBoNlAyWll0S05IWjNu?=
 =?utf-8?B?NTR6MFhoQ3QrM3RpR3M4TWI0SUFNTkxFQzNsNFJLVnJPUExoem9LWnNuLzdP?=
 =?utf-8?B?eWFSY2RWdkZ4R3hUbkIweEZkbXV5T205UmpHbmhHZ1N3anJYSlEzbzJCVC9r?=
 =?utf-8?B?QnJxMDlUMUtKVGNHUTlRWlJvZkluUVhYNzdDMHA2eklDL1VLYkJBV0YvZEZB?=
 =?utf-8?B?RjBvRDFoTFNuVVF0ZUZEWTEzbXhVREpUOUpBMjdBdVlRTUEwcmk3cW5aNGhI?=
 =?utf-8?B?Ni9QYjFCWDFWVUN5RFdxazc5R2RFYndhN25Fa0piVVVKWHVCVHBHL2FBUGFh?=
 =?utf-8?B?cGk1dnNCMkZpQys2VTErU3M3cmgvSzAzTEhWVnM2allpeVFhK3hDNVlRUFor?=
 =?utf-8?B?SFZsRC93b1JLRU00b2R1a2d5NTBqQU5yQ0xka042UUdQVkJ5ZGdpZDFNM2lD?=
 =?utf-8?B?Y255VTlEcTc4QU9DbjJiM1ZKOGVNbEs3R0tOUGdYaDdudzQ4OXUvTWVNS2w3?=
 =?utf-8?B?RTI2Nmo0WUFJVTRrL2hvWE1sbGdLaWR3RUEzbjl1aHRFaUp6M0ZPQ3J3Rmts?=
 =?utf-8?B?YnBlNGRmbGkxZ0drTzg5aFRvelljUVAwc0FQeFJBdFhXR2FSSGxjVkJMVzA2?=
 =?utf-8?B?RTdUZEVIbzN1TDd2bitXT0ZncGc0eFJLZ0FLM2NlNEJhcW9uR3NacTQ3ajVz?=
 =?utf-8?B?TDBvc3c0Y3hVTGxlaUUvcVcrcW0zY1ZPbENBcWVkcUI4anVlRFVoK0IzQ1p3?=
 =?utf-8?B?dE50bmJOWC9SWXdlRmRrR1o0TE1VT3RXZzlzM0tmNGZld1RsOXgzemVxOEdQ?=
 =?utf-8?B?MzhVSmJyWStzY05OZ00zd2x3c0w3b2NIeUtaS3ZIOWZ1SXROWXBKMVNUeXhz?=
 =?utf-8?B?RWlHSXFRRjRmb0hYZ2ZqWUFIYThXWStrWXpCS3RxYldXMWhwNzlvZkowTjFk?=
 =?utf-8?B?ckFrY1VmTnlWaUtZc2lVeFBMRUpTR2VRKzZaaWp1WDNrTkZNMGFDVEozbGt1?=
 =?utf-8?B?VFZTZFkxZkR1bFcxWVJSZDN2Nll0R0pvd3E4dkdESjJLMHBZUEZURUgzQUF1?=
 =?utf-8?B?M1ExWDJTL251WDJ1cG1rUERjZ0pwQjI4eXlubUdpeFFmSWVQT2x1ZTV0cE43?=
 =?utf-8?B?QVhHTWFSdEFtTUIrb0F4YzZiWTY2ZzZUbFhQVGRQTkpEQWRHb3ZoVkJTVW40?=
 =?utf-8?B?UXFPenE0ZEZDUGpZQVRCcFRsWHQ3U1JXTitrNFB4OGkxYVFJTjMwcklPNTha?=
 =?utf-8?B?VFh4bnFvdTFrejlUbjJobUJkdHIwRHJJV1NBem1SNFM1b0tabGlFTVcxakNz?=
 =?utf-8?B?REVPa3pFZGpQY3JqaEVEYUpDQkZmeXAyL2FmeUZudlVaNit2Z05CVFJ3bVY5?=
 =?utf-8?B?Yk5qOFNvRkQ5SFJpNXN6RlhNZjBsTTRlSWZhZERaVUdvd1lCN2o5WThmc05O?=
 =?utf-8?B?U0FNVHJyUVZUT1p2Y1hHcHQ0ajFNVWN1WDdBdHlCWkw2WFRGUmlVT2NEc0xt?=
 =?utf-8?B?cXJ3OWNrOXl6Qk91ejV2UFZnVUpheWJiaG53ak9QNytIVEwvakpEa3RWM010?=
 =?utf-8?B?YXdGdDdkakVWQ0VGVUtINkNlb1o5OFhnTnJvTXhmeFpvcDIvUXN3OVhYWjEz?=
 =?utf-8?B?MkFnUVY3alR3alpaVUxTbFdEWncxbHdMSkJqR29MbzFZN3VLTFhzZllTOHBG?=
 =?utf-8?B?YjVZK0d6Y0FRdE5oT25FdjdVc1grVTNHRHFwMVR3c0RONHF6MWdCcks5cVMy?=
 =?utf-8?B?VnlHUU04VHZOd2NwNVJBQXd1R0IyWStjb0g2TW5zT3RIS1RETTErdDZpenZu?=
 =?utf-8?B?TTE2Q0d0UDh4UUdra1NVTTFXMGJycEJRazYra05ESm1xdlkvUlJ2Umt4T1d4?=
 =?utf-8?B?b2hIRnoxL0NmTzExK3hjMzJ6R2pQWmZhMTlRQlFtTXpyOGVSaHVXQnBJOUNM?=
 =?utf-8?B?VzZuN3lKOTdicGJTVWdYYXZkb1RMV0NBWFFlbWNWaSswc1Y3RExQTzlvdmlx?=
 =?utf-8?B?bm1RcEZoTVlvdW9yUlZocE00ZGpVYlA4OHRpUHlDOVE3NWtRS2JWdHM1U2pL?=
 =?utf-8?B?T0Q3aEFFOUVhWElJTE82YWZsRFl0Rk0weHVBeDEvR05hSi83NXgvWHFVRXVO?=
 =?utf-8?Q?i3GPvjd43aIMYZV/Bn4ecNg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a532ac-09bb-4b8d-979a-08d9b57c5046
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 10:12:58.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHdRf/0rI+k/PUOLMP/CjBf6EheaynGBvDqMqBq6k90SIFy8qMRIFuMs/dUN1rV4G5utgROq2uwNNJtWfT9Rhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 02.12.2021 10:09, Julien Grall wrote:
> Hi Jan,
> 
> On 13/09/2021 07:41, Jan Beulich wrote:
>> Without holding appropriate locks, attempting to remove a prior mapping
>> of the underlying page is pointless, as the same (or another) mapping
>> could be re-established by a parallel request on another vCPU. Move the
>> code to Arm's gnttab_set_frame_gfn(). Of course this new placement
>> doesn't improve things in any way as far as the security of grant status
>> frame mappings goes (see XSA-379). Proper locking would be needed here
>> to allow status frames to be mapped securely.
>>
>> In turn this then requires replacing the other use in
>> gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
>> x86's gnttab_set_frame_gfn(). Note that with proper locking inside
>> guest_physmap_remove_page() combined with checking the GFN's mapping
>> there against the passed in MFN, there then is no issue with the
>> involved multiple gnttab_set_frame_gfn()-s potentially returning varying
>> values (due to a racing XENMAPSPACE_grant_table request).
>>
>> This, as a side effect, does away with gnttab_map_frame() having a local
>> variable "gfn" which shadows a function parameter of the same name.
>>
>> Together with XSA-379 this points out that XSA-255's addition to
>> gnttab_map_frame() was really useless.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> As discussed in the thread, I expect the Arm part to be simplified after 
> Oleksandr's series. So for the Arm part:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks, but let me ask for a clarification: Explicitly just the Arm part,
or also the common code change? I ask because from the x86 side I already
have an ack by Roger, but strictly speaking that doesn't cover common
code.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D144E6E7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225234.388968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlW9K-0004VR-Ru; Fri, 12 Nov 2021 12:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225234.388968; Fri, 12 Nov 2021 12:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlW9K-0004TJ-Oi; Fri, 12 Nov 2021 12:59:22 +0000
Received: by outflank-mailman (input) for mailman id 225234;
 Fri, 12 Nov 2021 12:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlW9J-0004TD-Gq
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:59:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59e8ebc6-43b8-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 13:59:20 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-WhwtxWS4OsmnFm7TMywzyg-1;
 Fri, 12 Nov 2021 13:59:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 12 Nov
 2021 12:59:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 12:59:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 12:59:17 +0000
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
X-Inumbo-ID: 59e8ebc6-43b8-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636721960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTpQ8uBBM4wVG066hSj/citS4kN7RORlHQ0hRfXiZCo=;
	b=KEYfw23dyEiczMO5xCBu1C30LEKPZEL42v7MMu1hcPZg3RelFW+kbKrQj3CFFHY7VVX7mV
	uhnvfbbclfYhhP+ybYU2kWi/kYqDNbmq4VKGJAKAswylZxcAeE+Uxn11mAoexzU2vIzmgK
	BzCvTz8MYlpu2306AX2mGNWJkkv7mOA=
X-MC-Unique: WhwtxWS4OsmnFm7TMywzyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUlco766soOgiRe+Brj/q7O8qWPf52fQqSWs9fxIQBqUMKWJ/MXepov7Vs+7wDNTHeNHo+bi3bSlMK4CfwpSS2og2V7FAUbgNodTgDU18tyTQtZPYs87JRiVcmMNAzv3fZEi54lVhpxzCEwQNNpKNcCQq1175ytx/DJZtSDqM5lQS4/fths3VKl5rL/VayDTWAKlaXmQWt+1XEHcGdvR8KzdWxdETjR7AxabXrkKG8/6nuvhATxhpxQpLgX3CzD0wBSaCeIY5Gq6ghYq3WmUa+yNNECurbZoen0GfLQWh6mTFPbjNUNYnuSduqyb7X8Ga4yEiwc+zifdiKrbPG4/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTpQ8uBBM4wVG066hSj/citS4kN7RORlHQ0hRfXiZCo=;
 b=EeJ9v9qBl2DlLbn27llROPTd/yvJx2CmEHD46mzTl1d+93B7aTGck4N5ZPWLYP8vXTD0yJKwlkU9Hg4f8bQYVgO6M81iLkuxSs5pVZ9Iw8Y3cZogf5AWV9JpBB+wuzXlSwWBKFJ486bYLqon7n+l6IQ6wXx67OOHqgE024iV18CGi6dvaVX5P22gIJ+SveAs1l4tpMYl1gMGweYAPY99BdYP1mSWi4erlyEWKlV31WtUOfj4UyqqN+bA5qD8tZAgQgPuwb1lkfOTAB2fgZgjjZaTQZ/Is+r3sQ26nI79MEMYtFxJiRSCh4O0GCiOHO2spbeZ9+ZgMaUPzNR4K9M/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8a68b6c-ed08-7ff3-1cde-7f3f192d6fc7@suse.com>
Date: Fri, 12 Nov 2021 13:59:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH RESEND 1/3][4.16] VT-d: per-domain IOMMU bitmap needs to
 have dynamic size
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
 <684f2650-7230-debf-1de6-21745c8efa9b@suse.com>
 <24974.24958.17968.347517@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24974.24958.17968.347517@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f816fbb4-4038-484a-a563-08d9a5dc3c64
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5903CF576D1DBE64AFBDB7BFB3959@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BqHzXCGAjphvmXV0YrPx/Pu9fILsc3DzSAeUC6EgbpctV2MPk9xRP1/lKrIp7Pa3ctp9Egl4pHoRrK84argpG+wXeOKQ6ml5q2s34c+DuHeUKLuGp6G8IVbX1dD1UR+q2o46KBGAZQXCelBo8hePF8La6q2YP1pn5LcBiEic78sjs3T8vW88muwzCGpVWOIAUdLmQd+0e51kBJnLy6DcajFUXmkzWE6bHxo5l9694NagKzz4BgrB7Ox7nYIkLQq4JX3x87PV7O5fpyoY7lzs+x9pWLh5O4vKQRxwjj4Sxj2AdMl8E9uKuRnYm8hod7OFtxetlw7F6wH3IMkA+3shaFAcqyLlhH3QkvT0O3KMEQVogL51JPxqdZJtEYrNM7eXjZikdWQ65d0Da4Q5XFJe0tdlx44vAVdM/cyNVCp3PGeThWhXpKE4356H2i2PMcf261z8oSO2K2lLzNHr2+3fvmOw+wu0KIf3xQNPoSQJ9iiP5a2Akgyxq7TPibi8SJbRawgtyE1XJBzkoXNIIS1bk9eZ5VeDxPhFNosrVa+Tinn08sHVajNtZRJ1hyf5KVqyzbMrufV7wzPxPkeX79qqZBYd0E9vMNSvuGMNTdw+ttkmDKXfobYVhB3zpzJyk33jxowKBodi4W57HL/eVfEWbGLztiiTdEEh8QWx1FbAlEGAiBBlV1dj7VQNUWKvOkse6WLEqyf5FycpW1WmkeN2SuhsfO7ZM2aKzbLugdadZijf8Ka8Z95pUnIbzSQ7jin9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6486002)(31696002)(66476007)(8936002)(38100700002)(36756003)(4326008)(53546011)(54906003)(2906002)(66946007)(2616005)(956004)(8676002)(6916009)(83380400001)(16576012)(186003)(5660300002)(316002)(26005)(4744005)(86362001)(66556008)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlJDbDhXbUlVQTVRdStiME1EdC96dTJBYVRtWDcrcUF6MUc3TStNNlV3NXMy?=
 =?utf-8?B?ZzhhdVd4U3NNTUZ3clRpS1BYS0prL2dHSnE2ckthUWxjR1ZKYlV2U2NHbGJp?=
 =?utf-8?B?UlJ0SzFmRDQ0YmJlaC9ZbG5EYzdSNE5MQ2UwN2FHTlpIanZPUkl2Wnh2U1Ez?=
 =?utf-8?B?Uld2ZkR2UzNXSmZIeEtxdTNnTUxSSmFibDczUHF1ejN0eWVJRkZYNy84Wmxl?=
 =?utf-8?B?Y2pOZlY1eGJHOGJEaGRUd1BWd1ByeldTNDFHYWZucFMvZGc4LzhyMXgyVXpW?=
 =?utf-8?B?QS9ONjVqTkVLVmI3U0xvbGN6czFtMVpNZW5QbnpwRGxqRlcvSUxsMEN5YUxK?=
 =?utf-8?B?Z0FlYk40QUp5UUJJWjR4NmRCQmZQcmlmU3N4RWtEZUJpUUlOa1JMREhFS281?=
 =?utf-8?B?aWZKdTRpMHdvZ2JSRGRseWlWRlBhMWw2cUZCYytiVlExd3h1cURlTUU5Wkdk?=
 =?utf-8?B?aGpva2QrS01vSXc4aHY5QkYrQlZseWJiU2o4b1RSUTlZOXdVTEZGRHhqNGFX?=
 =?utf-8?B?YXdvb2xlNU9ZZnI5aU9Uc0hnRWZ0MnErSVd4c2d1bGVsTGFQUGpOUkxhTklu?=
 =?utf-8?B?Z1Flb081akhGdDJSaDRZNHh0R2JXSmRsRmJ1R2V1UEMyNlZ3K0MyQnZFNjlt?=
 =?utf-8?B?bWdtMnY0Y3FHRWJPSitPamw5MjVycnI5VE1PbU51YmF5VUxsNGVLK3B6d09E?=
 =?utf-8?B?ckRQUkdPWUFHS2dvbndmNVpGRGxwUWI0eTBrdk1SRzlXdEloaFp5SDV3dnFJ?=
 =?utf-8?B?K3NSZTZEV3R6QXk1QThaVlNpb3g5Ui9BMmN4SWpvdGxiOXlhVW1aSjREME8w?=
 =?utf-8?B?SktScjIrelJvakVTOGJGN2FSbEh1QW5Ja2VEc3pNODZjZ1FEVzh1am9PL2R3?=
 =?utf-8?B?ZWZoblIvOUhjZ0tkc29pT1luZUM4aGJIaTFzTnRuUXZNU0RnZi82SmEwSGxt?=
 =?utf-8?B?a1I3WUs0THJCV1ZsRkd6TnBMN0ErdlVHZ0Nxd1lzK05hSUo3U0NqZWIzR2xV?=
 =?utf-8?B?V1ozZ0FzUHZYaFJTenljaGlZVE9KaGlQSGlrZmFramJpQlBNN2RWaTJMVm5p?=
 =?utf-8?B?aFpMQ0xrMktHd0RONFI4Y21xSTREZU9DYjhVZEJkbVhiK203SDVwaGFDRGVy?=
 =?utf-8?B?QmRzd3psVHptZDN2RWxwZ2NNUUFzMmJ0ejl5NDlUK3dia2tpWkJqekR4NWJ2?=
 =?utf-8?B?WWoxVTllUk9taGZkNVJyUEIweVNWMGljaFV1ZTVIbTNmUEVmd296S1FNcHJh?=
 =?utf-8?B?b0tCemJuaDIvSGNicWYwM1BIbkszajFZZjlxSDJBNWJ0SHVLK1JobThNbjVT?=
 =?utf-8?B?djNCbWxDVlg1a1dBb2toeGxPWmZGaU5hQmVWMnNvSUZUVzBMK01Id29FaWdm?=
 =?utf-8?B?RVBodGFYTDAwNVE3bk9xa3pab21OQTlwOGRFK09PN01Cb2dlM2NEK2xDejd6?=
 =?utf-8?B?ek5rdjJBbXRWRGtkdVRuM3FiMGpLVVFNTXZXNnc0TnRZcmEwWDBTemtlaGxT?=
 =?utf-8?B?QVZYSVdwcjNOM0g0RElJSjJqYXg0OUpxK1dHN2EyeGpuNCt1RGhSemhjV1Iz?=
 =?utf-8?B?UFN4U0dlMGIxeTNTd2FDOVhPYngrTDcvVHhJWXo0aWFaajlSeFhYaGpCWjhZ?=
 =?utf-8?B?RVB3Zks1dmhhL2F0NTE3VmVYdHgzNFpsTmlHU1lWY0x3UFo3WWlSb3QxR0s3?=
 =?utf-8?B?dmt3UzRNVFhVRkdwYWdic0NQZ2JtMkQ1YmNSSWpiUzJHS2NHSnQ2RUVReWsx?=
 =?utf-8?B?d1FnZ0pRUm5MbThjVDdCcitwUU1MWnZWcjgwZjdVb3lab3J1VlBOSGNKSXJl?=
 =?utf-8?B?eVM5dzR5RzR4RmluWWFZUUZ5MXlvUFNCNHJlS2srTCtEdThINmg0Nzl6MEFv?=
 =?utf-8?B?OXRndjhWeU9MT3paSWJkYVNTREVGYm1kV1VPUDJJRSthTVVhTi9SMVNTWlhy?=
 =?utf-8?B?RGRoNVZYbjBqVzZHRHIwUWI1MnZCNXlrR2hoL3NFZ1RpcEZDVDFDY1pnRXMz?=
 =?utf-8?B?a0hleU95QitLNVJnVENFYm9zUmxMQU9XaTA0akxKVXhZVHhjOG5lbXhZSWFT?=
 =?utf-8?B?b1RVamEzSGJTRnFVTXE0a21zZDQyL09CenFxakxCNlduQWQrOTVNMEo2UWZF?=
 =?utf-8?B?Y0VkemxhMC9lajhtR0xQSkx3dkdNeFJ2ZzFtK0FzeFFJdVZXSkRHZnJta21h?=
 =?utf-8?Q?f2sRiriPEj1lfjKwkI8I6Fo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f816fbb4-4038-484a-a563-08d9a5dc3c64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:59:17.5372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiMkGlzRw8c3XgS9y1BlNs/U4nrpXJIt+ozgkU1n078aWHuZY2iqIRvsRid+GKJv5xmn5iUDdTTrFxd+XKeAoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 12.11.2021 13:43, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH RESEND 1/3][4.16] VT-d: per-domain IOMMU bitmap needs to have dynamic size"):
>> With no upper bound (anymore) on the number of IOMMUs, a fixed-size
>> 64-bit map may be insufficient (systems with 40 IOMMUs have already been
>> observed).
>>
>> Fixes: 27713fa2aa21 ("VT-d: improve save/restore of registers across S3")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> provided it can be committed today.

Committed. I'm not aware of anything else I would have needed to wait for.

Jan



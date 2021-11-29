Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C6461946
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 15:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234592.407119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhjB-0003sz-QY; Mon, 29 Nov 2021 14:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234592.407119; Mon, 29 Nov 2021 14:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhjB-0003rB-Mr; Mon, 29 Nov 2021 14:33:57 +0000
Received: by outflank-mailman (input) for mailman id 234592;
 Mon, 29 Nov 2021 14:33:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrhjA-0003r5-6T
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 14:33:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61522397-5121-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 15:33:55 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-qqJAP19gOI2JZgPqYUqZoQ-1; Mon, 29 Nov 2021 15:33:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 29 Nov
 2021 14:33:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 14:33:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:488::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 14:33:51 +0000
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
X-Inumbo-ID: 61522397-5121-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638196434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80HM+vVH4HR29fbmRWlk816mx/hHXCJtIKvfYbWGsjI=;
	b=PX+803j8BALeiLWvP9tFBEOCHMIL7cGoxkO5amwvHP7AMsD6fcMVLd+5mqfDQ3Cd7sY+Rg
	78AZH2lCb4H8BmY/givGNJjKR8ewX3TT6SjvtIDNrMGklYJFf/zw7EPBpfEvtOhBm2AZnj
	Fn/aJon1IXVdpcPZMpugycRpgMkTK3c=
X-MC-Unique: qqJAP19gOI2JZgPqYUqZoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMwlTlWy7IaKx4l42pKropImf0e6fHkD5lHoh/DnrLDFUN8shA6gxdAzNRVAKvn4+n3kmVIZnPr22w4eJM6sUdI/vxtiluSbalYYdO+ye+Fq2IMrFyNrYNAAJPAm7Y2PCjmOwYWCwP5GMzh8cCQcAq47zyzKzAO3R1q8/y57PGeCx/DTynXSJFXqV8PgSVT6LilAJXpASEDZsphhWumggegV/V3Kb0WKMChwaZzY1tAsNbnj1DKclZvU77O686DNsB9nU5uo+ihs6m/V2kTMsgWDFnBQ2htGyiBrvY07xj/6JIgZ3GM2XTApJeotkMD3PpFhFVzAY4qo1pZw7DAARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80HM+vVH4HR29fbmRWlk816mx/hHXCJtIKvfYbWGsjI=;
 b=dvL+GjNOXEdyJEii0AGjHKjpQxj4YjJHxNvE8XtM+WRiGr3VnYhkcQMNzsu4uECMIugy1IQKUjWNCLXfgINQT6P2Uf7ojFAV8F1dHcvEI3HVkoY0aRLPeSdPH2H+eIJauMmQ59Ov/qmNXAn5AFqrSEzxzbK7WIRLiwprFWvV3jcEY0REuvGXiOlSRAk5ebsVXwo905GU/QND/FSf7tIqryMa2HnExp1ci9b2jHCy3qGADCAzenOAG+ekUiARj9Bpk6zpFPmDbmaO3j87l+w1Yp/2V6wiptxN8pCvja7i++UYiUbBg+HNgW0TcCPBImgI5jHGSbLAWwiRU26xHBX1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b7fef71-6c29-554a-8c6d-6d1d91c8aeeb@suse.com>
Date: Mon, 29 Nov 2021 15:33:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 48/65] x86/aepi: Annotate fnptr targets
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-49-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-49-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0029.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3f26647-9c85-4748-58f1-08d9b34543cb
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295970AE73ABA635C8B25694B3669@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y0+a9E2oVVbTUS+kRrhMAdXyJ2iUDUk81cwtBqyDjzcjLjPWMn9QTz4rz9BjUdvjOLxs8MXQMZ7FlIrpGvP1EIPBlllttDVM+o8GohSnQyPuX+KDeSo78T/srUMfgL7FwD/FKlGbPlV89RsVKtlHR+Q2oC+0kfqTQ6uazpDFvZnurU9tWTuakenWAzYSsYVRfi3BPUbca9vSQDHv2f92RCvmv58EWxfioKPhU5lmh0GIyfaoKuo4N0c6JDpM4/JmehhwJqRE6gzDwB02dzwE/IwuqKa0D5Bo/HgOV0HPs29Sb3LtHJblXVcinIkvlFBrdGQLxMbkyfVYu7huZzha0+9NZujqftTi7IgRRFa15wuHwjh2R2bciGCaDDXhp6gtTpSWz9d2/J8Ouo5KbRzXTk9OAr2GFpzSwBj6EGR0txgd7LTJCIgbtMeu9BtAUTrW9rGfo1Q80NDo3hHu5bmketi1d+U7nRoIqiAsq5Bzp02Xb35LwoZLh4bjDHYDSbo1Zc0K+UCxO+561vCWhYZ5+2xjkGtCdfO1XqZJE300Y46bb1BqTBG4JZclVS8FEySwZco/koFpSwS54e83ykeF1SLhRpczdAABe2LKiYfojQ1rF6Ks4KFb2sNsUllAQG4H3/DUpbOjNVfIS2sQ2At8+l0wfodkNGFNwW2pe9fhuA88Pu0SEW+mmOlIQACMHUJbzgVjP4Q8yl4aVq6ccd8OOKcjsyyDbm9XS4GQgzq5M0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(316002)(54906003)(2616005)(66556008)(956004)(36756003)(66946007)(186003)(5660300002)(8936002)(2906002)(26005)(66476007)(16576012)(558084003)(8676002)(31696002)(53546011)(38100700002)(4326008)(31686004)(508600001)(86362001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1pROUlmNXI0NkRlTkZxT2NvWFRySzkyNzBJM2J4NkJ0T0F0SmxPdnZzYmQ4?=
 =?utf-8?B?c2hYYVI5YmlFN3JidU8xdFkyQjk5dWt3aFVob3RxRENwSGFhMFpkckx2a2pi?=
 =?utf-8?B?bHdqak52Rm5NZjlxZ2NlVytjWkVPdUtGaWVlRGVtV1prVVJYSW5mY2t0TG1m?=
 =?utf-8?B?ZHdrdFlYOEViSnF3SWZEanBWT2tkYldPUFRmWnVBVzB5eTIyYnNCLzNzMVhy?=
 =?utf-8?B?ckk0UHU5Wm0vc00yVG9CYXBoZUpRc2hTUDlzKzE0dk1KeURiWE9VMFJiczVo?=
 =?utf-8?B?bzFTdHYyYlVhL0dYbGVpQzdTYlBxQWJHV1lvd3lzYm5zVzF3Q1VZdnlNQW1y?=
 =?utf-8?B?cWFzUWQyNjhVNWpmK3hKZWJPQStwV205RTZYZVIyeFFTODkyaDFlNFVGUGF5?=
 =?utf-8?B?TlFTeXp4bkpITVVKZFhTakJkSER6KzNENWxsMjBBSVBVYS91YmJoYkdjN25a?=
 =?utf-8?B?dzRzOHh6TDc3cks2eEtDQzlnRDlDRHl3V3U0ZThpUnBMbktCRE00RzFpYk9V?=
 =?utf-8?B?T3Y0UlV3UFhmT1pPNTBEVTdnNzQrbmp0YXhVUUtPUGF2eW9EYWU4bmJNbjRt?=
 =?utf-8?B?VGdKdjNOMmlmTDBOUkpYdUQ0NkRXdWVGUlNTUmpUSnVWRmFIRDJTSXp3eVVW?=
 =?utf-8?B?WXdxUm1PWkVaSklQWTZpUUtaTk9CRVUvSmh5NjRJUmxOZ1ZDYUU5Y0lWdUN4?=
 =?utf-8?B?MXpPaUxSVUp5OGl5MzR2WFREVHIxaHBjbWUvZFJxRTRvUjRwZUJOV1FiQnJE?=
 =?utf-8?B?UHBFYzhYNVBLa0FwZFdzS2NtSEpMMS9aektZVlNuYTZyaWRybWZOTUFlckVv?=
 =?utf-8?B?dUVMVTU0VVZVSS9TUTFqRGFHT3FHbkEzRU8wYzNBWWo0WDhjQWlkUVVZVnFl?=
 =?utf-8?B?c1Q4ZThhcW40dGlCSEtZdlIwRjN4d05SdUI3SDVUWUxyZk1IZmZ5aGJRSFVV?=
 =?utf-8?B?NFhzQU9NemJJWUZUYmx0K29Pb0xOL0s2NGhlVjVYOG94YU9uUFE1ZjJhc3dt?=
 =?utf-8?B?aW9zZ3laeVlEQUhHK2NaTGt4QTJFU1B6dEVJTjcyUlVCUXdaazNsc0hwR2FI?=
 =?utf-8?B?TEJmbDBuRXNwWVI0eTl5WUtQaG5nVjhXWG4xQWlHRHRWS2pFMFBnK3dmbFlB?=
 =?utf-8?B?SlVmazV0NGkyU2F5WFpRWmNrcXM0WUhKZWxGVnFjZmIvMzY4UzNHdUFTMWtG?=
 =?utf-8?B?VGpMcEFBcnJlSjhKc0xZSVAyN3ZFNnFSd2ZiRFFOTEJ1eW9VRXB5c0cwZkI1?=
 =?utf-8?B?VTBGdzArYThUSlV2QlRoSWtieHI2cmRHUnlUNXl4S1N5dkt2djdyU1I0RHR4?=
 =?utf-8?B?NHh6akRXTnV1ZGxHenBZR0Rsalo5VTM4Wm0yTkhMQjQwaDZ2ZmtoY25vN3Vy?=
 =?utf-8?B?b3I0emRIOUtWWEo0QzRvRk1DN3FNWHQ2Z1NLMGpFcWY2REc1eENVOHRvc0lO?=
 =?utf-8?B?c0dNZ3kxYkxqcEtPeXVDQmpCMnR4emdCQnh4Z3NHZ1VqV2dRakdiNityUzBs?=
 =?utf-8?B?QW45RXg2TGJJNm5YWHc5KzVybUo5NDNlZzE4Tkx3RzZqYW5SVTJBVXdJN2RL?=
 =?utf-8?B?SC9la3lkMW1VR3FlSkl4dG45eWlhYURKMmJoS0UxVmdrZVVoVklkNE9tT3N3?=
 =?utf-8?B?Yk9uSWFCdEtRYW9oZGZrR2IxQ2dUKzB3ZlZzUzBWV1pPQXErQk9UYWk0RUpo?=
 =?utf-8?B?TnIrZlRpVG94Um9xd3BhTEdzbE9Db014UFp5WWIvVk5wV2oyajA1ZE4zaUJS?=
 =?utf-8?B?Z1dndjZrbVRZSzdpTTJ4ZHNRRXA3R2tGNFQ1Ym9VbWVXVXM1MUU5SlpHYzUv?=
 =?utf-8?B?WWZjTUpNWnFiU2FxYnhtRDl4eGMzMXlaQnNTNllyNEpBN0JNRlRTN3piMHVx?=
 =?utf-8?B?dWt6RkpOS0hsekdPaXU3cWNBcUxUNkZPUDZLNGphZ0pwSWpHN1Y3Q0toUmhh?=
 =?utf-8?B?SGpORHdWUkNkRHJpbGxyR2tNU0NrczgzM2g1eisxU2RoMUtodjNVck1qS2Fx?=
 =?utf-8?B?MnB0Z3Z2T3dXVnpBTEV3OXMxRGhDSndjcDhMb2VtOERmV21BTHExd2hNelRy?=
 =?utf-8?B?aStjbVpaeVlqNUcxOWpuQkxFZ0FtakJvVU9ieERhNXhiUWVRTUR1K0Q5SFNX?=
 =?utf-8?B?aC81blR2ZFl0VFFpaXd2R21IUmZISnEwdWFHb1pXeXFZZndnTlZRVHlmUnlx?=
 =?utf-8?Q?I1f7Q5JqtOanc1mDzrzud6k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f26647-9c85-4748-58f1-08d9b34543cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 14:33:52.2810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzDFQADmYAB3KXEKJnVk9fSGufWC6c15KZzBsek5fd8y5IF5F7TI5C9tMPoGZXlB0u6Z6TDvMSkfyFVx0COzug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 26.11.2021 13:34, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Nit: In the title I think you mean "x86/apei:".

Jan



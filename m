Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73695530E8B
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 13:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335844.560053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5xn-0005eK-Ax; Mon, 23 May 2022 11:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335844.560053; Mon, 23 May 2022 11:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5xn-0005bV-6z; Mon, 23 May 2022 11:11:03 +0000
Received: by outflank-mailman (input) for mailman id 335844;
 Mon, 23 May 2022 11:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt5xl-0005bF-IG
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 11:11:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06eac531-da89-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 13:11:00 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-TU8B1xhYNoeYEmIo9DhNyw-1; Mon, 23 May 2022 13:10:56 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4594.eurprd04.prod.outlook.com (2603:10a6:208:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 11:10:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 11:10:55 +0000
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
X-Inumbo-ID: 06eac531-da89-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653304260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fPPiBlgOPs6P6JF+blXy1krqzPMpVTVaSWtLH9QW94=;
	b=Tb/AQQQcWWW9XA+S/U8VLaKRtZi8iyj+ptrQ8UrIrLWjZrcN3qm+gA7iWH5RNAES5ZzTfN
	yvuzaOa8x1lc58JKN4jLgG+Oqk3jIbBvaALv+mutBJM9exNaTtYFwHMQ1/bQHMW+cw2J/E
	c6gPmnC4uMMAdlXeZyIgd5SUoh8pP58=
X-MC-Unique: TU8B1xhYNoeYEmIo9DhNyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljXMtkR+XpfZw4dwNvzd9XfdAq1YI6dFC42VUP3i1cA+bAr9XDjHkeZmGJUoimB1tkrdrzYpnwfXl6R6ws0RaZpnrepGQlAi2t42poB+qrh8rD9l1MfsKCGN6tLu922UApBG5aqOESoWpKrnpPQiV8m0Iy9KAtZ5Z+f//tnULVQ0NW+UB69Tt+EeI+VALbwxBJuIK+ptkAWFZMby8sUAgYeMlaDqVQ1lDpCrS6FuA5OiDnL7OWG+ZDGsnIc5P89CD2p3N5onks901VGrOdYc84UFXEKL6amtnHHo9RBmok4s9KcHpIgfCpzjCqbghXYmkgcl69789+09PaM5XZYAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fPPiBlgOPs6P6JF+blXy1krqzPMpVTVaSWtLH9QW94=;
 b=Dja7mO19nj2Er8lvq1xoS3DAY1+ioNKQG6sScSaOOhG/F0S17su7TLmQFdHI/p4L3lCzeEwB9f9qOCuMZ0qb2Su0JCfglyrb9LNM5rE9n1ikFFTHRk1D+jYNlRQaoRYXUEVLUfw/LI26wIqNFDK3YASe7QCu2SwRTC8ihxBWoR2NFpj2mfHEeMKC4j0+/1t8b7G30Sw5MBnRXf/2caj8Xw54AWeqslFMjNuLZ7zoiQJEDKjTOG61IMZWKPmn/cCZQpOVlQNNPpMFY+aE+0Yi7XkVno7cyQuHuggz65Oo/LGgtmqioAqZgvB2hcVWQLWWgAEJZouhIQZxdeYVh2ET+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
Date: Mon, 23 May 2022 13:10:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 5/6] tools: Use new byteswap helper
Content-Language: en-US
To: Lin Liu <lin.liu@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1653295437.git.lin.liu@citrix.com>
 <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0210.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10e87fb-b18d-4c37-8c5b-08da3cace7eb
X-MS-TrafficTypeDiagnostic: AM0PR04MB4594:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4594B0225B513200BC107676B3D49@AM0PR04MB4594.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EvVM1zqLsDM7CREDkXBHQ4i5LJT6du6diM8ST8NvqXSxqrqHlmGQBKeNTs/QlZlFXyjRpEZmJpRv0/Yl/S4poqjoajkrLLjusc3uZDxkl0JlvV3Z5Hz/NFmVLv62/H8EBRO7xXhTc8WFEyNp1WDU8y5laqr6PIsRNabhOahPL4fzD3h0EmnlOBkvDKoQKiz3PdiAY4aBIoN6DKoqR6G3+cemFCCPKHBSj3DBw+kQdHB/2bD56030Dsw8WSrlOZfvJlSTNYGmO9zvOBmALjCCKt3FIA7UMPvflLihRmf+VSkGv88PFL0nn1PpGwDzGlCpqa2ryO+jVDEgtTDikxb9jGDbLd/up3aMzbxid5xDEgd+QQGiBOrr50zX42arm7IyYqwSyvuWU6iV1YV6+46p4QtZIPYkXJMUyIe1AquOgAc1AQjO1QwWeIEo6BE6WzvFURR/23w1dO/EMeP6VxophEeTPlH7LMUJttE0yM9AlK3vA5Jn2LuZJraaJ6OIVX1RmnJ5QWIMz1eFrWfnMxTyEb4QRfcriMS+APY1V5Eo43DUR57dCjtTcg7rCCcj0HFQbjZEg3kJoaSEmsSCl3XefVTayayyIlbcOAYIS00K7VpQu0pJdk+sepMmIchkxF03HMn4Usik1Fpn1Xw5Yq3FJ1LZpNAiAnNI7l3h3RUQZOWT2ljeKtD8/dwmn8Zt/iLGJiYDJCn99fxZJZYl8kORxWTLrujKlsd53ORtVge2cCj86lzC1q07Mctbd2lj5799
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2906002)(6486002)(26005)(6512007)(36756003)(186003)(508600001)(6506007)(2616005)(66476007)(66556008)(66946007)(5660300002)(4326008)(54906003)(31696002)(316002)(6916009)(38100700002)(8936002)(31686004)(8676002)(4744005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG5pamRDTDJXVUFMVTczSHlOWmU2YllHMXBVYWZ5a2JXUS9QeVN5blM4N1ZZ?=
 =?utf-8?B?ZE93dDk1a3doTmpPNW9Db0xMeEJybWpQQzlza2RjMlhOWEViNnZpM1FrQkJD?=
 =?utf-8?B?N1QyemZYS2FQRktRc1lrWS9DaXlkK3BnSjJPQ2xsT2lRWjBtYVNvN0tITUJW?=
 =?utf-8?B?RW85ZDR5dDN4bHJXSmtNaTZEUytCVGFCSUZHbTUrSlRRVGl0V0pwck01NURh?=
 =?utf-8?B?SCtMNnFUYlA1ZXhhOFhuMU1rY0dsWDFYWW9OUVJFNWtqWldXZXptUW9VOG0y?=
 =?utf-8?B?Y05vcTAwWnBONThKWkNZWVpUV2lwdUVVTDYwYlNwMCtMMmxTUlNjYTVJNWNY?=
 =?utf-8?B?YVZiVFcvazUyeXg4WWVDQ1k3TjVhZU9vVmFZSWIyMW9LcmlTTXBsejIyVmg0?=
 =?utf-8?B?NlVRVjB4bGxGVWlxd3BBalk1aGNtZ1VnaXAzYlJIT2IvYVNBOU1IZUdlbTRJ?=
 =?utf-8?B?a0l5dHpzbUJzdmNLQ2U2NXBFNXN5eWw3eHNqdlJpRWhJdmpHOWpqT3ZZblFE?=
 =?utf-8?B?S1Z3Rk9ybW5raStOOUl3UzZVaWo4ZWJkeW4rSTlyTEo4dGpsb2pQSjVZaGNT?=
 =?utf-8?B?OXE3emt2bTRtWjdYbmhCakd1SStQNzBOSk1SaGdkcGF4Q25mV3ByUXJWOFFU?=
 =?utf-8?B?dGRPN0RmTi9Kc1hHd3hpb29SR25TNnp6d2JTclZtMU9LM3dyUVRTQ0tGSDY2?=
 =?utf-8?B?STBJazVic1VTSElKTUFnUTBLenpDbDRWU2U2OFVjV1FhbmZDRHlpRnZSemtF?=
 =?utf-8?B?YWx0VlVQYXhVTDBySXdNZUg5Tlp2RVNCWkF2TkhVT1U5d1dVQjhxTEhxREFr?=
 =?utf-8?B?aE9JSFdOZ1ZzTlhjanh5anArSHBHaktjRWFiTERmSDVEbS93clFDSlVad3ll?=
 =?utf-8?B?U1VtemhXeDFydm1LQVN1WHk1dkhOUWJ0QVpIUWtuUnhkUHNIQ3NDV21XKzky?=
 =?utf-8?B?WEZ2WGl6RFlwV0hhNUlPT1lXdW8rTmYvL0lPcGVJWmw3VnNVT1hBNTU1MDVp?=
 =?utf-8?B?QUIwSUZ4N293a29kU2UrWjJtOXVTZW96WGY5WlpyVVNQZFE0QUdkVVRkUlRN?=
 =?utf-8?B?ZlNoeXZTU2ovamNmbytDYW5GRTAzUE82a3VQSVhzaUlPK3ZRMkg3RzdwUUsz?=
 =?utf-8?B?ZlJkTU1HQTIyeHlhRmdrNHVpMG1rY3k1Vytmam5SWUJVaVJ1dnhsUXZNdGRp?=
 =?utf-8?B?MUVERlNhZWpmdnk4ckFXcW8zRFgwMUxQY0NLYy90YjA0VTBqbVJMSER2Znk1?=
 =?utf-8?B?ZUtOOVhnbFRTamJ1UDhXekZhS3JBYmcrUGNpQVJObVh4c0JLRVNzV1VIbDlB?=
 =?utf-8?B?RlVhZUw0VUQ2WXcycGNka1luK2dMSXg2Ni9qOVVKeWxrbVNIRkdQMXdYTzB0?=
 =?utf-8?B?K1pHbHBJNitRM1JoMXlZMUM5dEE5WlpGM3FCZStIb3dGUFZ1L0EzLy9JSkpH?=
 =?utf-8?B?aSt0L1VaL25nTjZOSWZKOWpRNTF4VGRxOTJzZDZQeHFOcldHZkZNOUpqem8x?=
 =?utf-8?B?QzhWelZRbGcrV1NLeElDeE10aGdNdmJjWUtGb1RnUFAyeFRLN3NzVzVrbnJT?=
 =?utf-8?B?Z3lxOTRUenRmOUF0TGRDelhUOEhTY1BNK2xOcnA3clJ2UjA1K0ZjQ0J5YzRv?=
 =?utf-8?B?bXJ3dW9XNURVZURpNC81a3FtOVNEMjVTSXZsWlVoSDFvSDRCMGlIaUN4ejIx?=
 =?utf-8?B?TjdyMFNPOXh5amZiQ2pzRW1Ea0ZLVjIwUVVhaGJ6Q09IL0ZyeDIvOHJsVTM4?=
 =?utf-8?B?dC93SXFDWlZIeDhNTzloOXBXZ3QxcUU2SEVJRlBOOXc4Q01lVDgzNTQ1a0lw?=
 =?utf-8?B?Qk0xRSswMGpRdm52a1pwRXZ2VkRBeVhzcGVkMnlEeEthVHJaKyt1bkVZRDlX?=
 =?utf-8?B?Wlh0K3dhNTdVNDh5WkM3YjZkQVB3VXVxekpJVHUvdW9oVEd1ZlRDajNKZVVU?=
 =?utf-8?B?V3d1cVN5Z0tyVHFJWmIrOWEyakFHUUg0REtwMDRMV3VyYUgrSkl0bzArQ01a?=
 =?utf-8?B?TC9oZEVLMEFIZWgzVmFHT2l4R29xaGhDL0VIaVdyTkl6UGlIanF2UkoxYjUr?=
 =?utf-8?B?OGExZHg0N0x2Mi8yaUo2RXM2WVB0NzJvd0d0OW9kN2hkdktvL040M09TSXVZ?=
 =?utf-8?B?L3dzUGFVSEZ4OTIyWHlFQ3IwMnptUUQxTlhrZHFYY3NwcHdRaU1Ia2E5a2JF?=
 =?utf-8?B?MXRrNGU5ZXU0RmYxOTRoOTZzWEdxQlh2ZTR5d1VMSFk4b1U3WmdxVGRwRXFO?=
 =?utf-8?B?VlBFd1FsTlNFUnJveTRlYjBmckhBK0I2c0gwMlhkZWhBNEZydUR1OVVSb3BX?=
 =?utf-8?B?WVBpOVJIODFxaTZCenF4WHMyVWdMWlBJdDRBT05CdVpqRDkyU1RQQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10e87fb-b18d-4c37-8c5b-08da3cace7eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 11:10:55.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQuicLxbTuajfbVLRE1r0ckK0kUPkhSo3+qoWzWr/MWwYurx+7rNDIKiNA5qcEBCs86ERKEAPkuqkDuaX4w6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4594

On 23.05.2022 11:52, Lin Liu wrote:
> --- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> +++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> @@ -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)
>  	return cpu_to_le32(*p);
>  }
>  
> +static inline u32 le32_to_cpu(u32 val)
> +{
> +   return le32_to_cpup((const u32 *)&val);
> +}

Why the cast? And why not uint32_t?

Jan



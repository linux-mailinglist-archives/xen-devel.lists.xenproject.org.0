Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8D4C6D47
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 13:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280512.478472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfbp-0000IU-95; Mon, 28 Feb 2022 12:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280512.478472; Mon, 28 Feb 2022 12:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfbp-0000F4-5q; Mon, 28 Feb 2022 12:58:37 +0000
Received: by outflank-mailman (input) for mailman id 280512;
 Mon, 28 Feb 2022 12:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOfbn-0000Ey-BH
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 12:58:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22d7c7f7-9896-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 13:58:34 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-6Wd69oKDMayBQGKWkHkJXA-1; Mon, 28 Feb 2022 13:58:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6090.eurprd04.prod.outlook.com (2603:10a6:10:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 12:58:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 12:58:31 +0000
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
X-Inumbo-ID: 22d7c7f7-9896-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646053113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoSZ/LGH2JLPAvVg1wsK8TIky8uV/2hj0t3L4LzJP6w=;
	b=jEyjwBES2CCYGZhUUIpC/Yt0gpVJpbYjla946bhzSAPOaKj44Z9OqLduYfF+W5vFJn/+7t
	J/pAvAqg1C6/FbpR5RK1rQZ3Z3xx5hWdkclQhKX9Ou2sk6izsquI8PPZD3mv5pSDF9rbFN
	brUDMMqkymS0CwI9FuOVCtd9VZiEpq8=
X-MC-Unique: 6Wd69oKDMayBQGKWkHkJXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp8tM92x7Ec8qwuepvCKYG1V8U/sTol+sdlPw5ez+TPLwUopxzfAf/1xSYx8CWMtj2SXImYzXC9/wO7aOP40sW4GYU70lWF9Pe3OjDlU5o9s1oOE8cIwgThDVKM+4J8D91j+dXDKMkQh1fIWpYeyo+KE29tZAmow1mhcGH24XU95vlFoYepWPNnQDJjX+eOaqasIRyy28cIk2Fc3v7/J4A0FDnAtzRu1LZ8LUkw6r7MhqOyn9KJ5MbQWHNTCZwpJkNBBbNoFGxHfIYMBov+rfyCn2oOO4vGpCY/WlrR0EhNaIL93waAU4wz8ii6E26bLRZSCet6PumS12FNItczn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoSZ/LGH2JLPAvVg1wsK8TIky8uV/2hj0t3L4LzJP6w=;
 b=dkzQ2Y3ZKORcHdTEykctl1DEydecc+cm47dKzlwp9Cd1lioO4R8hrFHQDvIPTww9JsWL3rt0fLxZVwABJ02vCjZ1akSmtKfBfZldEkaYddQDEUJTRNrSr3HKU2CoEsUUB25J4GZeS4kV8WDOB3bqTjOPK0K/a00glV1Fr5AdvWJeqia4sOyNXsfvLuPjR+hvxr1vNc0QyQoNdxm+xX+kuEl/9Zfxk1RhYWT7+dCOR9FPn9zkjKesBo44DKTJivj3GMPfPZGjIK0iE8ZD0laqInBzeqX4ne3RaxtNhJnvUZmF7beXLqfCIjyNSaSRR+DX8fiIFliPZueW6+dT6RfH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c87b3d0a-3cd2-1fa3-e920-4b6f0c23fbaf@suse.com>
Date: Mon, 28 Feb 2022 13:58:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 06/70] x86: Introduce support for CET-IBT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222152645.8844-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13fff092-54a7-405c-18f6-08d9faba0523
X-MS-TrafficTypeDiagnostic: DBBPR04MB6090:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6090AC7253B95D5C3312C95CB3019@DBBPR04MB6090.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46ai7EsFgxkUgYnHDFh1lS/6LRB0f3iaZBGABQRoEX15va1lXK8g8OUDmNnXGV3XJ6+c3skbQ474tAnGOE8gxnLywwzx+D/LpGs57dosTjYq2xfJR0HHGaVfU96cmnkh0TwsYdf1aY1hm4GjSPLHDk7TvoUr/ngNGwwsM0Na+IeBOYG8Uen1sj9NKPzxXzub93qllVU52aVT6dQ+SPAH1dgGbizIAaXTZkptVt7hKLRXBCDlLj/494agi/I3WP6CuG41irbJlyh54v71LabM/Yq6OenwJ4pmzLykZ4Am+nPBDtupubF+uBa54olSTvmE9DSYpPB39uPI50nbCdc+/qaSPVg86Tu3iDRtW99qQed+0ea7Unp8Zuejt3g4ysCzNdkonLwKpdUzT5g8Y4kZTRKU0t+yEmTS4urXxJTcBB1YkadriGN/4bYHiw4UQcCdQHKeqK1yvmdb/GXIgXkGY5o+sPmQKF6MMEvJjSGa4gIaWQ4tZYl5/ouiyJziUXjiCvBgwR10Ba5bsLwGiYDOMgIeM+a5nO/zCyVGd60fznXuYHWJZFQKWtTfaXgW01ijwzBv0188y9pyJjE0e9aoQ5tpxOhPiwhrzx3l/qkEvtslYNTQUiAH1Ikkian+3uYjFMP6+B3xK7l1AjE5jizm/WCEDYeA01lTWi+RKoMTRRVD3CuP6p3lw3Ibfg7uZ2gFlAdF3LquDLRRxnlwwPsJzb/zXehN+jr6u33mYgLks2xw4shsx47HWm+PYp2m5rie6IUQuTIQF1MDSQrCNZnIJTCkXQpvk2p7Jag3/mnUI79lHXOCMaAaFYwKMRqSPGyf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(4744005)(66556008)(8936002)(5660300002)(66476007)(8676002)(66946007)(4326008)(6486002)(316002)(36756003)(2906002)(966005)(54906003)(6916009)(508600001)(186003)(26005)(6666004)(53546011)(6506007)(2616005)(83380400001)(31696002)(6512007)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVlNdUhvdHhSSmlIN3hmKzdvSjJIdG15MlpXSGlkaFdTMTVIVTlCR0N3ZXpE?=
 =?utf-8?B?N204T0g3eS80cEFDOHF5MkxkQ3JCZUJ5QmdsaDBTL0JpdlZ3dUZRd0ZvajBz?=
 =?utf-8?B?SG9tVldWYVQ0N3YyWndhUzBoV0Q1S3Q4SzJpdVVBc3kyV3c1T3BpYkQ3enYy?=
 =?utf-8?B?V29CL2lRNmJieUE4bUIyUjdNRzEzVUQ4aVBrZ2VKeFFvWEV5NHQrZ05PWStE?=
 =?utf-8?B?alhRTkkxM3lzQ1NBQmpWMXV5Q0w0VzZhM256aCs4WnAxeTcyUFk0Rms5VUtv?=
 =?utf-8?B?WTNFZzA4VnMrbHNBK1o1RzY0MkdWc1l5bSsvRmptclJSZ0RZcjF2V0s0a2pY?=
 =?utf-8?B?ZWFmZHJUQnRUa2xuR0NZLytEKy84SjJlaWF2WVRPVUJrcnh5clB3ekQ3ckZj?=
 =?utf-8?B?bktXTlFPT2ZiTHBxT0l2TGxoZ1AzTnc3a0JibnUrSERhd0ZodVo4bjBHYUFx?=
 =?utf-8?B?Ujc1S0o3QWJVQTdWVTRjUlF2dWhHR0tTSUJuRENCRDM5RG14UlowOUpNRzdR?=
 =?utf-8?B?T3BVZGJxMnFLbDlwL1pHSHZmSmFFRXRDUWJTNXpaK2w1YWtLUkJ3VHZTWW5V?=
 =?utf-8?B?eFNsOTgrUERocWRzVzNHS01STG1PWGlpVjAvejlRKzV3RFZuejdwdk9PVEF5?=
 =?utf-8?B?MEJScXd0SllHTzlNNC9POFBOT1llLzF6SVV5TWJKc2U5czA4aTVkU2cwWUc0?=
 =?utf-8?B?b3lKRXZjSXRCRmM2MlZQNnRMK3lTUUxwbkhFYmlpMmxKY3BZODlMbHB1RFpj?=
 =?utf-8?B?NXgwcHhpczdyNC91VWovWTdOTExlYnNUaUdZMXRVMjdXZWdvMExtYVhQTU1n?=
 =?utf-8?B?c3NGOTRyVnROcE5MRWxadTVDNkp3SlZKajhoclBRT0JrU2E5djdva056V0dE?=
 =?utf-8?B?QnY0dXlGT2lSZlNLczlobWV1b0l0S0JxWGJTa1l3MDRseTlod0tVMkcyM2RN?=
 =?utf-8?B?RVpYUlFYaC9YYzlLNGNub1laUzdiNW9ieU0wV0tpUm9WZnVjSG04ak5haWRL?=
 =?utf-8?B?VXQ0Z0IxbGVTY1AyQ0oxU09NWTFOOXM2aXRJQ1VDdW5zeTY5cThoWmswZVRa?=
 =?utf-8?B?Y2NpMWIySmVzL1Z6Q09UWHVBTkRLVnhuS3Ixbk5oNGZaUjNwYmZvR3V3V3ow?=
 =?utf-8?B?V3FXUWY3Tlo1Q3UrV05weHdPZDhnZCt2aFh3VXk4OXkwKzFqbkRDZFRHc1Vw?=
 =?utf-8?B?N25LeW04TlFoTUdFMmNMZWo0YWU1UXBCczVjS1czeWdzU1NBc2o2Vkd1NWRo?=
 =?utf-8?B?aUUvc05YbWdMODg0ZnBoRTd3cDVkU3RIaWY1RnA3a0VCNTdWdUNBWE5BcHRO?=
 =?utf-8?B?RTBBSlh5aHJleFNhL05OK292N3I0bGhDNFJhaHJSU3ZxK01yMXhyQlFyWXZm?=
 =?utf-8?B?UHVjcUwvRHVPMmNDd2tTN2RhcVF3RFRGcUNWbloyVml2dFlVbjBNeXUxRWVQ?=
 =?utf-8?B?L2ZYOXQ4UEdwOERnZUFIL0RlMFRmZ28zenFhVnlGaTE1Wnphc1FPUVhpL3Vu?=
 =?utf-8?B?UlBTNVoyRmZOUXVsS0pNWStSalkwMHRMZnN4Uit2RUh3L25TY0x2b00xUzl6?=
 =?utf-8?B?aWZ6aVpPR3QraHd4Tlg2L1duMGsvK0RiRXEvUUFzakFSWEFVWnNtSnFCTnRN?=
 =?utf-8?B?aElvNzJ0M2FjM3VSelBuNHE5aHFIZDB3RTlvVW9EV1ByL3F2bElraVIxNWRE?=
 =?utf-8?B?Q21sZXA2aWMwUVFwdlUwM1BtSGFtTnFyVXZkQm1PTXpFRDVpNnp1NU5Fem1z?=
 =?utf-8?B?U2xwT3AvdU9sY2VnVXpIcHJYTENmZTdSQTZnbzdQQzRFT3lod1BzRnRCUCt0?=
 =?utf-8?B?QmdKOHFtWEtqVUVLNXZGYzA0ZHlzblZjbUZ5ODFRUis1RXlxWUdRSXp3SVZi?=
 =?utf-8?B?R1VaR1pzK3lDQzFPRFdpRTRQZFZzQS9nTTBZNzF6Z2U5Q25aT3M1RW5wcmxp?=
 =?utf-8?B?T0IyaTNDMmxMR2tyaUU5UUZ2ZVkxNkFHS1AvNzY4ek5iYlAzSThEUCtKbU1T?=
 =?utf-8?B?S3JhamdtR09UMWlBazV2aklMRUcyWTFEbU9hREZsR0lGaE5kdG11R3oxMHVl?=
 =?utf-8?B?RkhucHJ1K1Fyam9SZWhVaTRDVVNHSEhxUWFCNUhsNDJaYk9zUFdxMUE1aThR?=
 =?utf-8?B?N2xjcDBEVU9yV0JrYnFDSEFDOUdJbktOQ2xjazNsUWVTWnV0WU5kQ2x4bXd0?=
 =?utf-8?Q?aDynsG+gwuyDQyS9/ba895M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fff092-54a7-405c-18f6-08d9faba0523
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 12:58:31.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxvejg8t1ESkJGqCPQOae0+p9a8ip6qHycjb5QaixI40zdeTVuInGkQnnKEZ0/XxtlX0c6BglelcQ/12KsvmAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6090

On 22.02.2022 16:26, Andrew Cooper wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -40,6 +40,11 @@ config HAS_AS_CET_SS
>  	# binutils >= 2.29 or LLVM >= 6
>  	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
>  
> +config HAS_CC_CET_IBT
> +	# GCC >= 9 and binutils >= 2.29
> +	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
> +	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)

Noticed only now: Since the commit message doesn't say anything either
way, was it intentional for this to differ from XEN_SHSTK in the EXPERT
dependency?

Jan



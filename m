Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF84B5139
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271857.466569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb88-0005QC-OT; Mon, 14 Feb 2022 13:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271857.466569; Mon, 14 Feb 2022 13:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb88-0005OB-Jw; Mon, 14 Feb 2022 13:11:00 +0000
Received: by outflank-mailman (input) for mailman id 271857;
 Mon, 14 Feb 2022 13:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJb86-00054q-Rh
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:10:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c78580b-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:10:58 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12--a9CkPfXOnC_2A83FqRHNA-1; Mon, 14 Feb 2022 14:10:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5302.eurprd04.prod.outlook.com (2603:10a6:20b:7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 14 Feb
 2022 13:10:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:10:53 +0000
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
X-Inumbo-ID: 8c78580b-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644844257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jBhE8pdS0z6X5OGHjjYTQ2s9u5suaBp+9zliY5yvTy8=;
	b=I1emouU+Rq9SIolNCX0qPN/eOMledQ8i5s85iYebvmSmTjFEk/ouz/DHrS6oa3PaykrbHD
	HuNaoOYMesWBoLD0QP5poMfT0YCm4vA0IqC4gpqoMRM6Etx0EDWHYxWqxyxxH3E+GljMoO
	n01B314/nX5uSXDKxZHiZQoymagqkds=
X-MC-Unique: -a9CkPfXOnC_2A83FqRHNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBRdkQOrxhH1JhAs1g1LZ0k0AkAbMWWODznuk03LVg2rFqkFfG7LqsRxIXyKwvdcgDl3A9INaq6BPvLZn+ZJh3HEALlCZtr6Y6v6Sg8+p3TC5veCnBKbBh3zMQQxRDdIk7VwSTQlW8vVyg404pr8CEf26+NJYvj+744xBjGN9rQ2TX8C9cg3RUfnGoJMAo4zIjqk1NBR4Ezg4UkDWSO704T0O8DsErwKtS68jCAqLk7hg6nbgbiPselj+Kry0RRw5CO+8cCkjQlZRsaUCRAeTtq7D7PoKfY61VuEzlW0qTkgVP+TlFFDPsZw//+7iDyGOd0bBp6Mvxfh6T/MVVtBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBhE8pdS0z6X5OGHjjYTQ2s9u5suaBp+9zliY5yvTy8=;
 b=Ubpky9QnI+z2AhfEoIYdKvx8cLx+pp23gsAvQ5cnZdjHaBMnZ31OBUkiWyivixkpn+DCef/GfPlPt7hAy8VrQQn9nXGlSO921hYTA5TH8qQIMpPGv1Jw8RkIOADfoCwkXbwOuzTs0Axpw/SeG4azFWkCyFpijh7pIxg0ttGxISdc8GUfbYevT0HgKyVW7yvW5jcuYSoaSLlZLgPcJZTQwZu6rNmjMZUu1AY0C0X48fE4RDVrOYIV9BgaRunKX0cpqeWR5lq27n+5qjpIHTQLb/ykuwtEE96BHVH1v/9bz82AT4lU4H4JaBMJs2POVoeOcjQKEaunHpEEM0irtCcUTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <785653bd-db3a-df22-f2a0-c20b3f3bf8c1@suse.com>
Date: Mon, 14 Feb 2022 14:10:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/7] x86/hvm: Use __initdata_cf_clobber for hvm_funcs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125632.24563-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0067.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8487f105-852f-4224-cf15-08d9efbb6e3c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5302:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB53020F3E8F722C114ED731FFB3339@AM6PR04MB5302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l7PVAPRuPeXEu6S47QFt1Ep0CoYIABTWWkSig5wOoy+jfZXkiU4UMVtzPJp51cGWJ+kTfvZAH/Z+CPhfQGDk3CvJc7P6o/DCgVE1UiMpifMQufGlD6txEKPyMhQb+LSjSTR09xMqHBg8JjWlGdjJCcHKdECEkdZlt0WmrCw3GKBVlah3kMZA5w5uR+JMHVfCfqjUqatTXXUKFXgcku0eB5gd+fUzpm0dlmfdXK00rM/62XQOk9DmQJ4GLzI9cJqEp8kvwty7DddDmIc9Sp5S6WlmxtNLRCwTcrlPU0A3TRCZ4TxBNv5cjNsjsO9yplwYjABT//o7ZBvAXxdTGqExSnrTBfnYXF99RVg4e8dQaccc6ZaHJnJ3vLr/FT81hhZeV8PKNzvx0lSUm7vS/xus9dyKiu7ousCUh+7lYtLRxIrpLg3ZecmoVObRyQM9kjPzeSt0ViQ9tJzBIRhMsBORrjCqJiH+8E4MWkJTcFjeFdECNAhCO/+5UDY4i7hL5n4dERTa1khdulP9ZrlcrwA3hHTPVmrX3BhTrc/hU2ulxZjt63p3hz33lEA5+blPPHMIBbF7No4kG7hb0rw7stgtkAQWqXNwfX19k4LvPAJXyp0bDQfQjBJFuTmtPDdAmmKCN8NMJy8BF+e6wWYKXxV2EjHGg1j6y4wkdwbP4W7EUatDZuOVpq0/OSo70GX59RrllTmXrSMA0x4154tD9qjC3QNAKXpON/MUA27sNW2SePybR73NVrZD/FwGeaDDoMmE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(38100700002)(54906003)(6916009)(316002)(5660300002)(8936002)(8676002)(6486002)(66946007)(2906002)(66556008)(66476007)(4326008)(2616005)(26005)(6512007)(36756003)(186003)(53546011)(6506007)(31686004)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZCtiMjdNNnV0MlNURS84YlJaQ2tQWW9EVXBhYnhZRyt6R1BXWnU4eVpRUzdC?=
 =?utf-8?B?Y01LTlR2VlB5dXhtUUluV3N6THJsTHBTNUNzSStuNlltaE9LaVJrVWZoS1hk?=
 =?utf-8?B?cC9qZ1hGR1FXZStwU2tuaVFlS1Y0TGx3SHdSVTRPd0Q1S2N5N0lPckJDNkhh?=
 =?utf-8?B?d2RXbUVBZzREZW5DZWUyS1U1QjNUMXJnYUdvakJhVU5lTDlHZ0YrMWRBWGw2?=
 =?utf-8?B?RWhGYklXcUZvR1V2V3lpZWZ1VlhGZ1ZsV3llcVZqNGVTSUN1RGoyUTZvTHZr?=
 =?utf-8?B?M1Yza2syWm9yVVBVRnFIalpHVXRwUHJOVy9YN1VZL003QlovSUV6WGN1M2xF?=
 =?utf-8?B?a0ZyNnF1cVJ2SmJHQVlwT3VLM0VxMm8rcWVqWG82ejdnQXFkckhQdTZPUGha?=
 =?utf-8?B?SGozZnlIbitKY3drSGZ2YUIwanFFc2UxT3RXVjZHY3JSUTVnR0U0MjBtdGt0?=
 =?utf-8?B?WU9iUzFaYThoS3R6NzJNNUo1QnUyNnMrdWZGWGVUbVFlRUxGeFZRSHRzM3Bh?=
 =?utf-8?B?SWxWOFBDaW1uUS8wTGdTYW5iYldQZ28zQ0p0MWtFaFhuOEJxVVRCUzMzUHpQ?=
 =?utf-8?B?YnBhdGJtdkE0djFlV05EUVl1b0pjbnlLWWNicTJhb1Zudy9JOFV6UHZFd28x?=
 =?utf-8?B?R2VTZ2xEdHFDYjQ3dW5iR2NlU21Yd1RrcGVkdkhTRy9SNEsyUzQwU3pzR2Zl?=
 =?utf-8?B?aklqNTIwTDRYYXliVW9Bc0xzaUp1Y0pLNUJHTlZrRm9oemhMUkxDOUxFSUx1?=
 =?utf-8?B?L240OTAxTzBIMEFScTlWWVdiaU1DWTEwNmR2ZmZ6Yk12OEw0ckUrTUtDNmFB?=
 =?utf-8?B?YURvODQyc0xKTVM4MDBnSWxSL25ZQi9WdEw4SzRuMk5JZVVnYnZiNDdHcmll?=
 =?utf-8?B?SThzV3JNSUZSN3BLSzNZaFh5UFdWRGlucFBBWlZTWTJqd255c2VJM0lmS1RR?=
 =?utf-8?B?OUY0bURvaXFBR21YOG1EVWVsZ1I0eUJhM3ZOaTFYY01sKzVHZEQ2MnhGVEgx?=
 =?utf-8?B?bUhlL0ZyR0k0WjFad1dReGZNdjVrTkpCREkyWE0xZ3JSdEZoaWg3Z1RUMTBV?=
 =?utf-8?B?djFZOWRMbmdZMWU3S09YOVVBMGtSWEEvdVBUSkJUcUp1RkdZL3lVSXRubkl3?=
 =?utf-8?B?R0lYaFROdlBia2M0L1hiTjQzYTMvMno0K3YvancrNHQ1SDQ5aHMyd0tVN1RG?=
 =?utf-8?B?ZFZoYzNYNmR5YUNMZmFGR2J5anJOL2dhaEhiWVZ3TGJCTnhXRHB5RHc5aXZj?=
 =?utf-8?B?WElDcGhERXRFNDVxNS93N2lEMG9STGs0WGc5MklSaG14eWhSVzZuVHFFMUJF?=
 =?utf-8?B?bG5QNFY5OFdMSDBWeEdFeTBLRnd1TEVFZldVWDFQRjV3MFg4MFF1ZVpER2dj?=
 =?utf-8?B?aVZBV2hYSFNybXFRZ2xFcHBtTVFKQysrNS9YU0VrUWJWWkZFWVFKbjB5QkJV?=
 =?utf-8?B?UUVrTUNJdHF5OE42aXRRK0lVanZweWpjdUdkbEdnR3cxdjFNT3JHYm5pRGd5?=
 =?utf-8?B?ejYrQW5IOFNvc1lvdTI3TTVycnpqczhrSElLNis4YUlRd3dQOCtOR2Q4UjQw?=
 =?utf-8?B?UFV5YjdOQXNnOUx3MStqWWVGbmlORHRQOVRBZlp6TDJWRDdTbitteFpHSmw1?=
 =?utf-8?B?U1hCSU9MMnBES05MSlo4VStCR2xpQTJEWm9CbndMUllFVk1TRWVUTnM4OTBw?=
 =?utf-8?B?R3JKQ0g5WkNtNFhXQmlMNitabExkcGNITjFVcmdrbVdrMXBGVmJjY3N3VWxx?=
 =?utf-8?B?ZTQ1c21HTzJ2MWMxTnl0UlZsQWlFZ2lIMXBnN1VDbzVjb2V0alF0a1lSS1RY?=
 =?utf-8?B?YmpZakhic1MxREhRaE84Q3VNK2Jpa2Uxb1FFWUszTzFMUUR3RWduWnIrd3R0?=
 =?utf-8?B?Nk9lc0pOemVDcUQwZWp2TG5uMVI1aDlXWFNrdGY4QXRndHdqQ1FETm80cGJq?=
 =?utf-8?B?SXNOOFg4WThtMFNzWkVqU2Vqa3QwaXl1NkYxUHRIUWUzTnBjb3krOGlyeStn?=
 =?utf-8?B?Mm9SZTNlQ1lWL0ZkeVc4WXNLMkMwL2xwakN5S1BCVmUzdGthUm9qTkxoY2xz?=
 =?utf-8?B?eWlHem9zUUozeUUxbTlLRnVxWE9nSzU2N3ZzeFBBeWVMaVMwY0NMY2hrR2Jt?=
 =?utf-8?B?UmlSK3MxcE1tT0pFWnpFR0ZDeExCUTJTaWJseVh5cmYvdWxUVm45c1NSZGRo?=
 =?utf-8?Q?Ns/cPjc1/fUnAeY1zDAYRWs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8487f105-852f-4224-cf15-08d9efbb6e3c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:10:53.8287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jx4YrH+XfCfvPIjgx7LUv4BL5cQd9JQDiwccInkLoq8AgqR2CMH20gFtQTaXdW8ROWZCZXwpialyPUShBuk6bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5302

On 14.02.2022 13:56, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -88,7 +88,7 @@ unsigned int opt_hvm_debug_level __read_mostly;
>  integer_param("hvm_debug", opt_hvm_debug_level);
>  #endif
>  
> -struct hvm_function_table hvm_funcs __read_mostly;
> +struct hvm_function_table __ro_after_init hvm_funcs;

Strictly speaking this is an unrelated change. I'm fine with it living here,
but half a sentence would be nice in the description.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2513,7 +2513,7 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>      }
>  }
>  
> -static struct hvm_function_table __initdata svm_function_table = {
> +static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
>      .name                 = "SVM",
>      .cpu_up_prepare       = svm_cpu_up_prepare,
>      .cpu_dead             = svm_cpu_dead,
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 41db538a9e3d..758df3321884 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2473,7 +2473,7 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>      vmx_vmcs_exit(v);
>  }
>  
> -static struct hvm_function_table __initdata vmx_function_table = {
> +static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .name                 = "VMX",
>      .cpu_up_prepare       = vmx_cpu_up_prepare,
>      .cpu_dead             = vmx_cpu_dead,

While I'd like to re-raise my concern regarding the non-pointer fields
in these structure instances (just consider a sequence of enough bool
bitfields, which effectively can express any value, including ones
which would appear like pointers into .text), since for now all is okay
afaict:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049C509C32
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309957.526490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhT1S-0002Hs-Cj; Thu, 21 Apr 2022 09:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309957.526490; Thu, 21 Apr 2022 09:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhT1S-0002Fq-9Y; Thu, 21 Apr 2022 09:22:46 +0000
Received: by outflank-mailman (input) for mailman id 309957;
 Thu, 21 Apr 2022 09:22:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhT1Q-0002Fk-1s
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:22:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50086984-c154-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 11:20:40 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-jM4CN3CLN9a6DLCXNX-n8A-1; Thu, 21 Apr 2022 11:22:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB8204.eurprd04.prod.outlook.com (2603:10a6:10:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 09:22:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 09:22:34 +0000
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
X-Inumbo-ID: 50086984-c154-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650532962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/ZlOqVFCb6lqWPaD9Ie2gDedpd7uWNY7wAaDj5S0og=;
	b=EQEVFzUdLVSAh5w8jaWSC2MOSMyZaEOzwl7nu5NowOCeW54THxr3yJ6w1UofMcI6tlQoK6
	XUPI3ksTkiunKzdOG7vmmZWrL31+6ZunVF3pTGMND1a98i1qUR6y9Rc/tWVRVcA35Cm76P
	QU+w5uU+4sVeacdTO7D0Wl1eIk7MiwI=
X-MC-Unique: jM4CN3CLN9a6DLCXNX-n8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSiYtQW0BdkUCZQ8h+ZF58pFPmoikLrEui1bvFS22TBkpmuk/nu+OMnz8csn7Ki74/bOHhQoOdsMpn8cOC0PJBY9Oe4YqT06+FU7TBN+qijPf3Sm2eZR+E1m9EGQKquFGlTZBJ62OwfsmLTwslmkhQge2n7rw8KFRGQ73iafiPRD3k1+uaIM4/1mntpzFcXDNKtqJpI4N7Y7rEKR2U5E+tvS7gSKJRAad1oPq1YCfz5WNf305B23Xe9F3ES3Xqh4QCYZNKMXrNrny6fAlXwNPmsn17FQZHB6biNpx4+Yay+tXCMogQVndQbbyEP3pOFJ8gKNPSohIqTg93oEeUYnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/ZlOqVFCb6lqWPaD9Ie2gDedpd7uWNY7wAaDj5S0og=;
 b=dwnkGWsAd8kuUHWnTayrfKlpQxVbzFyHtUJ18k8xWarpBpAt08ARFmS14isglVpviTmiTL1811YE4lz1OzECxt2RNz+6g6waaA3NeKuioN1Cp3Dx9OjTYVNrFTarEpGBqNqV4yEiLBJKTtO9OT1t8liMbcuazcDqKDGPcVDB+TGUMiy5tCpho9YRJe8Gc2LDJQ6cKusdfEyRQWaoCzG//1AS0+RGUPr47xOb2sNZbKj1EE/DF8e1LQ87zCV3qogiZJ/+ErQycUR5k+gBxlN3AOJYgs8hQph/Ch6LgwU4cbV4R4hGjDi0jBNCgmSXxkj1AWAoidHNAOUHvdfUWqvmBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <201cc975-7566-7e96-d964-dd65e1a15c25@suse.com>
Date: Thu, 21 Apr 2022 11:22:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/2] flask: implement xsm_transtion_running
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
 <20220420222834.5478-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420222834.5478-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0103.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::44) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0f3a7ce-c162-4343-5078-08da23787830
X-MS-TrafficTypeDiagnostic: DB9PR04MB8204:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB820435B156DB13C0DABFA6A7B3F49@DB9PR04MB8204.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mDbVSwxWnrfs/TXUP8eUXNXHp9LVCWObj8Hj4a4bCyI0y/XqGACpb9GnBrLJVZ1H5iZ6Hc29HkFbdp3JogKt6zZ9yoQcWzeey+Lxw4hIo+qLy2zueXFrg2F5ZXAmqU6GRYAFMqhPawvG9ewTiIN6zuovCClEmkya3UpG9wHjwXNDWDvQPSNXk3MODtUrrMfH3SDayxhss3sQOyZcUHvmZt4rgk7fHEKJqh8LOfYCbth8yKJgznAHSLLo2O/G1Nai/sDu7zy9qcWjkwPsRGAK44OrUesxupPqrPnJPJ14bKZHA3U7CQFajpaV3/emmj65nCvPw3e9TsMdxUaFjlsip8LulJ7sm/T39YI7yQbMxlAxAGseM1Ze3FzDNdJm2DxYoBmHJnz4P4gL5eld/zglOm7FuhKLZQcbNZDGPdn0yqcpZxAHUIcY+YX0yuhx3zZMkRIuR9Gnrvc032mWHul22r18lkGkpGQLol96j4im26vAyFFUOQL/htw5mlUbiu5S2qECLc5yy/EZVsd1Kywub/1Yw/F1KasPiX+dahyBiCb5bMKhOSTrYpqZAee58YqF38WYRmuC5onIzlQ2WbJ6WUTeby7vLDBI44SZl/wXsF1JOWA7va2BUlPvEZqNNbK5i9Z/meoIQTgxvVA0il9203eBqvjazcDDU3niH5bdTqHg14XclO9bJziWW4czBzdgTMMUOU2uDkppDpBb/W2/IdZtmkthUSf5LpwzngrcPYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6512007)(6506007)(26005)(5660300002)(316002)(6916009)(4326008)(86362001)(66476007)(66556008)(66946007)(8676002)(54906003)(508600001)(31696002)(38100700002)(6486002)(2616005)(36756003)(83380400001)(8936002)(31686004)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURrNDk4K1dITjRkc0l4eXBDRlZnblRUK01pL1lFUUNDVmlnVXpzZEs3eG1U?=
 =?utf-8?B?bDZmcDNRNnViSjh0YkF0a3ExckpkOHBVaXpRT3p6UUdUb2FJNHFJVkVNWU1w?=
 =?utf-8?B?SFhJaXROYjRWcWRqNFRlTkVqc3k0NG01YUwzWE9oeUM3d3NXcnE5S0lYK0Nz?=
 =?utf-8?B?Q0VVMC94ajBYTkptVG43OWJsWFl0ZVdKNEpBOFB6WG5IcGwvODZsakQ5aWd6?=
 =?utf-8?B?TFdJL3kzVHN4aXRwNEJRY3hCYXF4ZENETGZqNG5oYVF2dFV1TXI1S2Z3cjEz?=
 =?utf-8?B?RXF3Z0ErTWU5ZUJOWXdkcGJoQ2hNL1dFMlBUWTBGQjdYUS9tVUwwZnRjdmJB?=
 =?utf-8?B?NDFLTVVJV2Uvb1N6bHVMSHFDeFZvZmNFdGZzM0tEM0VRUGxGRGRWR3pUN2c5?=
 =?utf-8?B?dW9rd0FmbzJtNzFja3Mwck5PdFdqdjlIZUFGcXFnTUxDOHhBUVROaVVON1d5?=
 =?utf-8?B?Zy8zclQzRlpqZW52RFZ2Z3ZscXpRRXlqN1haTVVZaVRXRnR6c1RSRmlGMnA2?=
 =?utf-8?B?cENibFFOcUljd0FCNjBCNG1kVDI3STZCOEFQbVZ3TXZlS1k2ejYyOWZiM3U1?=
 =?utf-8?B?aUl6MlNiUjJYOG1wZGRXdEdxdmwyQ3lFK1E0MklVWEtzT1BpVmlIS3N5a1Bv?=
 =?utf-8?B?NFB1bS84MGNYZEJYZDIrMGgzWmlpMnM4cUZZUW5EaG9lYzVWeEtIdDdtd0Vh?=
 =?utf-8?B?ZzJNYURFZnZIbUFVK1RGUVBYK2NTMFU3OVBLdnJIL2ZjRFczU3FYL2M0Y3o4?=
 =?utf-8?B?UjcrcEJ3TXUrTHE5TFVDRzNCbjBDUTZxb2RScmx3Sm1UbUpzbGtSenhaVlJV?=
 =?utf-8?B?enM2VG5xWWMydmR6S0RIL3A1V3lrTG9sOSt2Yno2bFQ4SG5hYkR6TGdkc2ZQ?=
 =?utf-8?B?c013ajdVeEtDdTZ4MWpJWEVqdjAyR3pHVzJlSGJDVVZEWnJtcXBEM3pZZGJF?=
 =?utf-8?B?YWUySGg5T25BM2ZOaTNkMjlXOUFIcXVReUYxL0xSNG1ySk5qQTZoVk4vMjdi?=
 =?utf-8?B?WWFDcnNXMTZoM2c0U3NHR3RQancwUEQ3TTcvTjJZZHNDQXFiUzErN1dvVzZQ?=
 =?utf-8?B?bWRhb3RGVmxqK3BOZ29FN0xYTzc3V0ErQlpIcHRDRW9zZjV4K2QwclBBemFo?=
 =?utf-8?B?TXBHdmZTSWxTU2pCUG1IWEgvMzFUM0pKRmJ3akg4NmxIRE92RmJzaGJiekQ2?=
 =?utf-8?B?OGJnemhsVVpmTXMzS2N3TzBic2NmbytzT0lDRnZRaTI3aHN6THdNby9rS3k4?=
 =?utf-8?B?THB0RnFpSmV5eExQZ3c1ZlJ4M2dJbDVWNWpzV3hpYlMrbzVrMTBKT2M3SFdj?=
 =?utf-8?B?dldqWWh4cEY5MWZqbEhvRnErUUNkTWFZa0VCQVg5aGcvMTk5a3h4VnFXOUd0?=
 =?utf-8?B?TUZhenBsdFBCUysxbFdXT0RpcHpQZ1ZNYkMzOTdqK0l1T2xpMzlDTEZERHVK?=
 =?utf-8?B?dVl1QjhEb3BNZDhGUmk1QUN5QmV6Z3NwNy82Y2dBNjBLbDdpYUlnZ01tc3RI?=
 =?utf-8?B?TlJQVklINDNKK3NKUzRrYnVaVkFjYUFrR2JMSnovWTI0T1NrSEpZQ25KQUE2?=
 =?utf-8?B?N2JoSC9qUHFLNFhSYU5vb2h4ZXlSdlpmZ2RoYWZPbngwdTJnRS9JUzFoNXcr?=
 =?utf-8?B?Q1liVURzSkIxWnlGaUZyNEV0ZlRRRUwrSmQ4WS9veVVGVVQvYTlDS3grT0t5?=
 =?utf-8?B?UTF2dXhDYVQvSHc3eWM4UER1eXlXejZCTEYrYUhwZ1V5QmdtRXZPMTFTOUFn?=
 =?utf-8?B?UWpOSTE4akl3ZmMrbEs2Vjd4MjFkY1hIUDFIMUpNVFNKS0NvOW5TTkM0SDVv?=
 =?utf-8?B?WkhCN2RnZXNjUGZ6S2VNaUFRREdIbDB2Tit5VGc0dUR0N25CTHBsc05SZTIy?=
 =?utf-8?B?MTBsci9JTllrTFBGYXZkeFNkbFV6aDlXbnJHMUdUWE1RTjNrZnBGWlMrMmt4?=
 =?utf-8?B?YjcwNDduV211UU5PblpwVnEybEFmSE5QYU9GMlVCWXA3Zk1OaVBjSHplQnZm?=
 =?utf-8?B?emUxc0YxWCtoMTZxcFlRNEh0N2R6MUQ0L3ZhSGNQZE1RS1NvWEpKYzdjRGM4?=
 =?utf-8?B?TmwrYVFzbG1QUHRlaEFNK1k1cE9sWFgxYlplNWFNamNaRmtNZ0ZCSGluMHor?=
 =?utf-8?B?aHN4SHMyMnVoN1VsbEtHTy9uZHI1K2NZUk1MMHl5Uy8wenFJZnM3S3ZKei84?=
 =?utf-8?B?K1puOW9IN01vVVBCbitaUjhmNVNlRmxVN2pMYjhMM2VXV3ZhZEhjNlBBK2cx?=
 =?utf-8?B?RWpja1ZMdWw0anhFeWhLd1A1U0U5L3RuS3pRYUlzQmI2MUluekV4aHNDQm5L?=
 =?utf-8?B?MHp5Q0RzODB3WldHc2xtVjZ4ODc2RUpFbHVxSFd5MTNzYjdXTFBPdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f3a7ce-c162-4343-5078-08da23787830
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:22:34.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqSacwp6NFuSoxKIk3kD54GzLG37zHx/4ZyOMlU2pRMTlbpL4X0XBDh/r84cyuH9WOqKPMMsgq6DzR47a4EHTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8204

On 21.04.2022 00:28, Daniel P. Smith wrote:
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -168,7 +168,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>      switch ( d->domain_id )
>      {
>      case DOMID_IDLE:
> -        dsec->sid = SECINITSID_XEN;
> +        dsec->sid = SECINITSID_XENBOOT;
>          break;
>      case DOMID_XEN:
>          dsec->sid = SECINITSID_DOMXEN;
> @@ -188,6 +188,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>  
>  static void cf_check flask_transition_running(void)
>  {
> +    struct domain_security_struct *dsec;
>      struct domain *d = current->domain;
>  
>      if ( d->domain_id != DOMID_IDLE )
> @@ -198,6 +199,10 @@ static void cf_check flask_transition_running(void)
>       * set to false for the consistency check(s) in the setup code.
>       */
>      d->is_privileged = false;
> +
> +    dsec = d->ssid;
> +    dsec->sid = SECINITSID_XEN;
> +    dsec->self_sid = dsec->sid;
>  }

If replacing SIDs is an okay thing to do, perhaps assert that the
values haven't changed from SECINITSID_XENBOOT prior to replacing
them?

Jan



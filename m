Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD65532DD8
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 17:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336619.560979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntWoK-0002pT-5c; Tue, 24 May 2022 15:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336619.560979; Tue, 24 May 2022 15:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntWoK-0002nd-23; Tue, 24 May 2022 15:51:04 +0000
Received: by outflank-mailman (input) for mailman id 336619;
 Tue, 24 May 2022 15:51:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntWoI-0002nX-Mi
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 15:51:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4efe00a7-db79-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 17:51:01 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-jCpPxoJCNx-HI-Em7NwCKQ-2; Tue, 24 May 2022 17:50:59 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4180.eurprd04.prod.outlook.com (2603:10a6:208:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Tue, 24 May
 2022 15:50:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:50:57 +0000
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
X-Inumbo-ID: 4efe00a7-db79-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653407460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8ExjgSwA7dRiOPzPOEtjjhk7KUDe/c7dT4XCf5Fh3M=;
	b=aA7t69YiKurRa9XtuH0WcS3zurSTBM/wGy+vmozUv2XuVR+SYx9zGEYokbR66OcWR8SV5J
	+nehJyjJZnwB4I0VCsCxYXx00wTqkWLDu5kJQNiQNhe3Sk0bElu78ULL20iI5UFN0vNUsO
	0vCsGcO4yMZPAHJTg5LFE62W7PuyW18=
X-MC-Unique: jCpPxoJCNx-HI-Em7NwCKQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBfAH8q7aUFjyTwMJpAStqeZThOvCcqtbLN6HOCA4sBcgh/LjUmhzhXiaubyEikNas0INzuu3EutklNsXfxN54oxXGJc6+cur1PqSlwYi2PrPDi3Ms6B4g/XRel6OM1QjJIsG6uUFNTg1gjT649lM7w2fcP1oHzS+FWsEF7O7ylGPSRFFqmBPsUnmYpO53RvQPpNLDzO811PfT9BDyLd4aGHHK8IhyEEa3FIhZw/fPrdVoagzLNwl3BKYq2RNhI7xPyOq4yDX0cIMsEnzc4NEYVeuLm5DaXkTxwUD7MdOPLT0PVAV6FjEqU4DJgMSsZST64n4QZHdMCN1MMUyrivFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8ExjgSwA7dRiOPzPOEtjjhk7KUDe/c7dT4XCf5Fh3M=;
 b=Z0rXC/b6oe8zhsojtz/dcCmMCa2KakeGce9SNl04amzzB6VA2EJKLjdXCCu2aJytmlYE9t55m497LW8RjjNrGTL6iZkOYnrv+iuJ0bQiUZnAm6oeDsPizd5cRgcAyxVbbabMJ5lr5VPikBrqIT/kpVorRk2TbzET++4z32h3oXHhuTp/BeergGlgLZJRn7VTiXanrL3AoyPvXdnl0F5tCtbJwZ9dLuk4ek+mrBXQTO1eUnnY3sqNqyD3x1yIW8/tp0mEtxqejDR2v7GiQdhB+JE53bOYfA6tkKSF7K9vmdHl1vw8O+4aoNSyvLZ12xDmDbnfDO0vuaD0lL+mX7qANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc50678e-0a35-e3a2-110b-9b5ba7f7364b@suse.com>
Date: Tue, 24 May 2022 17:50:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xsm: refactor and optimize policy loading
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220523154024.1947-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220523154024.1947-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0001.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a69afbd8-fcf4-48e9-8a0c-08da3d9d312c
X-MS-TrafficTypeDiagnostic: AM0PR04MB4180:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB41802BB4A6469C93A5841290B3D79@AM0PR04MB4180.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gBzetiBL/mn2K0R0azN9tDHazQkdBjZlAsTlk5hVsgmXB+ht8uXwkaa8y9/UvsC1V58eedI1Z+1AnynNWeIzByfta28vXq8fXCM1rO+KVRFRCPs38Ft0JyctnrKtM/ceyvL1clHoHmL2fPxXIjCdn/pWW3SeHDOxTxagdYP2sdHtKeZnNvWGerNLCq6fhQ0weN3HiXhQOQEvoWxBVDqyF+Gi7yCpcR4e/CZ68yp/BqFd43Hw+Ut09Eo7TUxhLIajHdI86asuQCDDsR6EGESfppX91+AxiNf2UCgqFGW2pyDDUk4fMVgezjC/pm0BkveXQv7BvyrLhFMGlGnzSJ2S2k852Q2yLkJEQ7DEHSwjZnLhSS22ADHPWkZxlA4wNl2Lfs7f29+L+lk5cbtCRo11HvqdPpWsTePXlm3bB4G78qT1k2CEFNui3FwFkJsXXFsRwutrclSeR5TzYUwdl25/eiJ064eL393fi7HMCuiIUp8AevU9z/U6WnqRYyX/pMq06Mda7XY06tkoPxJP8LYOe7gTmccuk7ejniZMpurPadSIPwGvj5u4kCaYVwL1Jv/tqJGXisxBkxBST6dLbDc3CXRKLvU/aE2KdfDZhpmVr7rQxazOz58cFoDWF9lX9TqpZRv+4AMpDcbDrITDd6EKUE75ZwxeekWj+1CbaSwW+XCwD0DjnsiwqjN4V1FgdLd41NPN3/uSbpGHSEdF7FiHBEgzQiNDrnywQMa3P/2jVyupZPuk4b1AM9jqt1ehYDGE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(66476007)(86362001)(6486002)(66946007)(4326008)(8676002)(66556008)(508600001)(38100700002)(316002)(6916009)(186003)(6506007)(6512007)(26005)(53546011)(2616005)(36756003)(5660300002)(8936002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWQ1ZjBMQ2ltaHJGZkZEdFlzK0hJY1R3S3hPTXl6TTNZNVNUT3NhYW9rckMw?=
 =?utf-8?B?VkxQenVlVWg4eEVoOWVabUFFS2xodVpYdm1TK0hDK2ZoQTcxQkJhYnp4NlhL?=
 =?utf-8?B?NHRHajVYTjR2WlB2cTM4Rm93aTg3TFZvTUNSTFM4OE9ZMlk4WERiN2RFNml2?=
 =?utf-8?B?b0JwQ0RZVng4OWVYUU5XR3l0YjFKblBObS8xakJlVitmVkFZbDFiSExrZEFj?=
 =?utf-8?B?TFVobmw5UlZ2TU5vcXZLdjJmK1ZCT1ZvWnFaUjRkK0Y5Q1JQdkp3aDJ3UGpH?=
 =?utf-8?B?VGVZL0JjcTlvQU9DU0FaaGlpRXF1OXJjU0Y1V1dtN0xqMm42ZFIzN3lGOGJO?=
 =?utf-8?B?M040azZCK0EwaFhxcVRxSGVJaDQ3UjVTRFFRVnZtQjV0UUgzblNPNGVyLzB1?=
 =?utf-8?B?cXkzU2VsNFdCTnNJK2xMa2NjR3M0QitsL2ZiY0Iybm4rUS9VYXo1eVp3RzMy?=
 =?utf-8?B?L2V5b3JZVmlrTk5xcFJWdURFeUM5K3FQVDlWeCtZbC9JbHRVdk44bzMweTlJ?=
 =?utf-8?B?cE1MaTdVUmRyMzFuMlZ5YWxFTnpyTUlmdGFOT1FBM3MrbzBZNG1DTHgwMXdh?=
 =?utf-8?B?Q1pHd0ZsdmY5YkxQWTNKalkyQVBpcFNGcFgrNnlEaVRZcHlGZGhzUTV0a1Jw?=
 =?utf-8?B?ZFBVRUdnVnRUSGdnUFJJbG9pZk5mbU0rb2ErdjE1cWE4NHlMa3V1aWRWZTdp?=
 =?utf-8?B?YlJUQ0IvN2JXbmZWVjVxRVlNVmE5VTVJQTFGczhoei9tT01uSzhvdXZST0FB?=
 =?utf-8?B?QTZJQXpURy9rUnVIdDlVU3JPaDN3amdmbmhhcXJkWGU3blZCUnprWXFPNk9m?=
 =?utf-8?B?a2tmNk5jZ0cwYjdNLzh3eU8zRyszcW9XWk14MWlzZjlqMDZXSTZuYUFNT3Ja?=
 =?utf-8?B?ZnVYTFRpRDEyRDVRckc5S0Q1cDVuM0dnUnhvVFBhOWQ2SDIzREIxajBWR3dn?=
 =?utf-8?B?NDBhM2xlU0Y2ZmcrMHlsbm1ORnI5V0lINzUzLzZBd3B3WW1ueGRkeC9oeFZ3?=
 =?utf-8?B?bnRTeTA4ai9QeThPcmdST1FVek03UkgzL2RHZi9OOXlxeU9mMEc2WXZ4TjF6?=
 =?utf-8?B?UHBYSUpqVXFRdWJyeVkyRk5Ed3N3bFhNdmhISFdVZVJFcFM1L1R1NXVUMFI3?=
 =?utf-8?B?N25XaHFwVENjdHhiSmVIZnFpSi9Fd3FrdWpmcjgvM2xGMUJkUEVoRGlHYVla?=
 =?utf-8?B?aUlSamZkamZmK3FRMldobTNpRzdyUTZHQ1FmTThrd2J2R2I3UTJrV21QcVZt?=
 =?utf-8?B?QTc2QURITTdqTDQ5cEtiTGI2YllveklpWm42ZldqMkQxcW1YMWtWOGVtQ05u?=
 =?utf-8?B?OTE2TkVxajBVUXNNY1pNblR6U1k4RkdEVmRyNVdabEUyWVlkb242NlZmMkRC?=
 =?utf-8?B?WG81ZUpUQzlsK1dXalAyR2tXTVJET2w3U1NsdGc2c1RPSkUwVmtKZW5xbDcv?=
 =?utf-8?B?elNINExVOGdjTkFZTlRWZ21LcmJWMy9aZzN6NGdsS2g5aU1kSVpmeGNhUTF3?=
 =?utf-8?B?cTZkL3U0d3I0dm5WV3VYWmdJT0ZTMnN5MEE4Sk50UTJJa2JiQmJKVFY2YTBs?=
 =?utf-8?B?N2VJd2NDaEVKMzlFNk5pakU3WEU5V3lndFN2VXU5U09uZUtDcTVkYTFUcXJ3?=
 =?utf-8?B?YkVzZFZYUVhOYXdGSTV1Ti9KQXdPMklHMkE2R3kvSjZ2dmR6QittYkhEVWt0?=
 =?utf-8?B?Q1I3VXhsVnlZMEZuMWFhNDc1cjlCZFBEeEhlUnphbU9YelBWZkxKbXJrMHIr?=
 =?utf-8?B?cDRNV2JtSlR5TThodmpuYVhyZCt4OTlBRitwemNVa2M1aVZBR1VOVmM4YlZk?=
 =?utf-8?B?K001R0ZTNW45WVJmaEQ4VDU2cGVRQXlzZ3M1eWdOczNQTk1NVHZxV2ZwMjZY?=
 =?utf-8?B?alZmQUV2QVpNRklkV2pUSUVSWXkxN3Z5aThKTHdyN1BQZFprMU02RHZMekN3?=
 =?utf-8?B?cGhLSEFOOXE2WTlPSUlWTWk0NE9aaHVoNVNKc0grRTZYdUhtVjh4cVA2eSsw?=
 =?utf-8?B?WWVHRU5PWXNvRkU2dm5sd1pQQlFtOXNTN0RmTWs0enpqMWtHZDRnY21MWXZW?=
 =?utf-8?B?N0JtbzRLU3pQVXBjVENQMWFxa1dFOWx3bkUvdk80QU11MFEwT0U0UEtjNTFl?=
 =?utf-8?B?aFhrMGUvaUFoeVliVzJaemVyd1FiaWNQckV3azRFSnQ3bmdyOTF4MGM2c0cx?=
 =?utf-8?B?cVRjSGFqNTJ5UXpRd3hSQTg3WkJ3M01FTTFYeC85MXIxdUZrOG5XSTR1YTh3?=
 =?utf-8?B?U3dwSVpUUitqUFZPWW1TazREUGtpRnk5VnMrdCt4bU8vNTVYaTVuOURhbHQy?=
 =?utf-8?B?WmF5YnNQaUJtckkzZTRzZjgxd2JpYUI4cWljYTNPdVJqSjJjR1c5Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69afbd8-fcf4-48e9-8a0c-08da3d9d312c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:50:57.2383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naXtPGujtExBuHnzxWahv2DZOasAtR1FlIX9AKO+9R8wJj8Los6vuWo8+dCmOtUq77w4cJJNbd5aBxIWJ5kMMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4180

On 23.05.2022 17:40, Daniel P. Smith wrote:
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -55,19 +55,35 @@ static enum xsm_bootparam __initdata xsm_bootparam =
>      XSM_BOOTPARAM_DUMMY;
>  #endif
>  
> +static bool __initdata init_policy =
> +#ifdef CONFIG_XSM_FLASK_DEFAULT
> +    true;
> +#else
> +    false;
> +#endif

Simply IS_ENABLED(CONFIG_XSM_FLASK_DEFAULT) without any #ifdef-ary?

> @@ -148,11 +156,11 @@ int __init xsm_multiboot_init(
>  
>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>  
> -    if ( XSM_MAGIC )
> +    if ( init_policy && XSM_MAGIC )
>      {
>          ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
>                                          &policy_size);
> -        if ( ret )
> +        if ( ret != 0 )

Nit: Stray change?

> @@ -36,10 +36,17 @@ int __init xsm_multiboot_policy_init(
>  {
>      int i;
>      module_t *mod = (module_t *)__va(mbi->mods_addr);
> -    int rc = 0;
> +    int rc = -ENOENT;

I'm afraid I can't easily convince myself that this and the other
-ENOENT is really relevant to this change and/or not breaking
anything which currently does work (i.e. not entirely benign).
Please can you extend the description accordingly or split off
this adjustment?

> @@ -79,7 +87,16 @@ int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
>      paddr_t paddr, len;
>  
>      if ( !mod || !mod->size )
> +#ifdef CONFIG_XSM_FLASK_POLICY
> +    {
> +        *policy_buffer = (void *)xsm_flask_init_policy;

I don't think we want a cast here, especially not when it discards
"const". Instead the local variables' types want adjusting in
xsm_{multiboot,dt}_init() as well as the types of the respective
parameters of xsm_{multiboot,dt}_policy_init().

> +        *policy_size = xsm_flask_init_policy_size;
>          return 0;
> +    }
> +#else
> +        /* No policy was loaded */
> +        return -ENOENT;
> +#endif

I think this is easier to read if you put the braces there
unconditionally and have the #if / #else inside. And if you wanted
to I think you could get away without any #else then.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BDE3B5DC5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147842.272926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqAX-0003Zp-E9; Mon, 28 Jun 2021 12:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147842.272926; Mon, 28 Jun 2021 12:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqAX-0003XT-AI; Mon, 28 Jun 2021 12:15:17 +0000
Received: by outflank-mailman (input) for mailman id 147842;
 Mon, 28 Jun 2021 12:15:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxqAW-0003XL-1h
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:15:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cea285c-0e81-432c-adfc-2b8d9c93342f;
 Mon, 28 Jun 2021 12:15:15 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-9Z-f6F6fOdCcX4PRrCX-Bg-1; Mon, 28 Jun 2021 14:15:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 12:15:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:15:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:15:09 +0000
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
X-Inumbo-ID: 3cea285c-0e81-432c-adfc-2b8d9c93342f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624882513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3xhD2WCbCxNPzWRzSrAxXsfY7wluQcriH8hyeBCdB8=;
	b=al+ebbjjjWOVEXnutjZaFp6idv0QI6et9rtsqP032nwrmdVBveEV5C0pj23nqOPAJ5OJIf
	Q2Gg9ninGvezuRFTWqPADzI6aICTQQTwev6B2LARbW8MUykOfhBId7ndJUHHl3rOy7EFqa
	N0B0W0ny5njYVGqI1+jIsXR7LYC7pMo=
X-MC-Unique: 9Z-f6F6fOdCcX4PRrCX-Bg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/d2uoENX2TTCf2W/ZRcksPJdLNNrbDCxhNk0iW7/3mB7hTmih/hIU1aLwshmA4GqlCHgJN/DUlcirwOxA6xUyl4Pzk5JHR//mSKduzIc1SQUDdV9zQU6PVkAPa+klqS5og6CzIx03DZerbbxHiFQzHawJX9u4ytr45mM6iYEBHfVJR5dGZzlfjMm7EY3JtJyVIjTS7CM7/eYgh92p8rq+I5jn6P5oGzWlLJRhK3kUSkov1ofBpU07GO9v3jVPfc0icVL+mTsMMyCR0GtUC1Ey+rg64gq6XWWXJKwzr/Fxm/jvOpLHRnh0DuxxxaPZlzn0f9BnvSMYF/R8tqoXJWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3xhD2WCbCxNPzWRzSrAxXsfY7wluQcriH8hyeBCdB8=;
 b=IbvRasCDg6V6OCEQF6nkpbrPuqcfGjc1a0uBNwJ876ONe8unOTIHsolUA0MtJjuP+HRVGPkZ1fEzmAwAJ+tWmVCuu5BNJ6XZ6LHN6qm95Uh83pwx612r0OdHwT/DbrqOWRqpvwSC/UQMCZ+oKJmSvNJiAu4XYe1/xzgy6jtpYTqd/mduGAeng3+ANU1tzX3boPPvfS83an57WSyTZlM0zv5CMsP3FjsaBJ6dSvWtfL5ZCv2KhAFTLwwLx/1L5de9/xqonp4aF1IcrZFrbfMVb9WymKTxI+R/qscgQlloxcapd34cMKc9Lx5+UdEs0gsoHDb/nHOx8s4V969PB2LuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH] x86emul: pad blob-execution "okay" messages
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3250a871-e49d-d3c4-333a-eff435e092c2@suse.com>
Message-ID: <e53a10ad-3489-eccb-2707-8445746d84b5@suse.com>
Date: Mon, 28 Jun 2021 14:15:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3250a871-e49d-d3c4-333a-eff435e092c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::14)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 375242a7-6c5d-4ff8-9674-08d93a2e5f79
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64771E0022DEB9436914EFF5B3039@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wGn1+P2ZotPTYm/aa1oYeK/nm+iEb62Cib2aebhH5O0iINiWQbT1T3PnykqdVrEDpf0LFArZzYoNoJwjmMHTQQPZ3ft5xV8V+lur34zeDj5zla0nv2nmdwviVZxjYKyvnA1qukbyQGRcb1jklsWxIIdQykcqBUHlPRT8pY4ZPBNtskCF0rQvVmbuQDjEc2kk7T2NXE2ES60lCAlUgoxQFvRFej6LrXa1YQBkvinnI2/Auqm0fw+R1QGCpibl0BNb9D74MSQ23tPIy7B/hlHjcNd9s7VdBKPZCC/CboYHH9+pPQPCXZBNnv2v/LpboCyHoDw7JdtFxyqwCoGnigHe3elazvf9n+tFoxjZcc+RTEH8HhZZ1cAMCCcUzXNugU9LxiWaG+fAdSbJGb6WOsElxC97Dh6H1AwQaMWeHCnpFC2jxqkPbQ+0GuTiCMz7g4Eiuoi41nlnPT4WdryqI0MLKVkDdIIr7P2yMPxCAKs9QO6nnClraryx8DreW1lvfkX3OBHizJMcOAYefDNMLl5aiX4qF5Dta/12aq1Vmb0rtFZ50DqEEgrT3zKXec5YmVJTWV53RkFzjk1Hpd4Hszm+om1HocH/KEfibdJRTnqLsSAkMWI0AYPvLII5LNbsoxrgiI4cZKLWlGxO2zLtw+i4q3S7/eglqJqvHQVuBi/RHq/yCNDxKU9W4sIGjrkcK4dC8V+HGB9sC6eekjv08TzApMIJdVsBpJzmcslNAeg5YZc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39860400002)(376002)(346002)(66556008)(66476007)(5660300002)(8676002)(186003)(36756003)(53546011)(15650500001)(16526019)(2906002)(38100700002)(16576012)(8936002)(66946007)(86362001)(26005)(31696002)(83380400001)(110136005)(4326008)(2616005)(478600001)(31686004)(956004)(6486002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkFMZm5rNFdhV2Z1cmJTdHBvdjFsOFNERVI5T2VwcGQ2WVgyYkxMcjhPZk9S?=
 =?utf-8?B?Z0hiNkZBZVROMFlyL3ZLemRJWS9USGVTQXZaUkNPWU5WT1o5ZmJSZzZYMnlp?=
 =?utf-8?B?RHhYRWFJOWNlMDNVTmRGOVNORzAvekUxME8wQzZmYmkwcmU2cnhKSDhVUUNz?=
 =?utf-8?B?OTJVTTJMbWVVYStvRElhM1pFR1UrbU5zU29XQVp6ekxoL0txTkgzOUdkVjcv?=
 =?utf-8?B?eERiTVhjcFptR2RQcDN0Zjk3QWIra0h5NVRTS29vTGVpWXRaWmlFOGNPc1JQ?=
 =?utf-8?B?YllFSWJrbUJsbDI1eGF0NHBFMkI4U21pSkE2VUo2MXVyV2ZCZ21VOGFVMUhD?=
 =?utf-8?B?VDhrUGM1TnNpYVltWm1uWWxWMWFXM3NHUkh2RzlFQ2NWdmZxTVcwUDJlZjJl?=
 =?utf-8?B?dU5SYWN5Ynp6WU90Yk1EdUpiZjJaQzNCMThVYzZoMnhPa0lIMkFRSEFwNCtH?=
 =?utf-8?B?TEFlemJzaU5JRnRVckRJV0JyUmhRMWZuZnVNY293akI3dFh5dGluWGdaMlZh?=
 =?utf-8?B?bnBPM2x1WkM3aTAzd2hYb2Q5Y3hUOUZ4RDZEZm5GNkx0Ky8zcEc4MUxMdUhy?=
 =?utf-8?B?VmUram9BMzlTMEo3ZEIxN3pPc2UzcFFkT2VOeHhqYzJXTU95N0FaRWNpZ0NU?=
 =?utf-8?B?OU9ZNlhNU1lUaW5tRGNSblIybDZRTTdnTE83WkdlSXg0N244TnRPb2JoVzVB?=
 =?utf-8?B?R0tHU2J4ekFRc2Z2SzFRUmMrY1E1bTAyVGF5WHpva1ZqYjdtV3ZJRUxMeldC?=
 =?utf-8?B?QVJUMkcwbXlQRko0WVlBMjQ3UmRUclFkZy8wWWMwdVFtU1ZlQ2gwWkJyeURa?=
 =?utf-8?B?SThnNlZEN1BFQWpnQXpTVHVDN3Q0ZUs0eFpWbWQ4NTF6QWhYT2tvb2hzd3Vy?=
 =?utf-8?B?aUJKU0YvZ0ViQXlGdHdTT05YNFc4bk5kQy9vRHlzbHRwYTA1SnI4TWxUb0o2?=
 =?utf-8?B?b1UvS1hJbjZ4K0RpU09lYUE1bGpXQ0k0KzNQLzRrMUJPT1FWYTFqbHQ0Q2RB?=
 =?utf-8?B?a2ZnSVFTOTZ3SWJwNWhwNjBsWGk0QzFYdE1xK1h3ekJQU2cwL2V0ZTlYZkRo?=
 =?utf-8?B?Q3RMN0o3MnAyenltYmRkR0s5K3U5TzBvbTlmaWUveW9MOFNjcEREMGRacWov?=
 =?utf-8?B?Q0JrVHN6QnhEaVIxZGFkRkg4K0xaeHdjdXFBcUtQNUMxWkU5bU5qN3B4eEhy?=
 =?utf-8?B?YmRpcG9MSmJPbHlSTjRnb1gxSGhDNkdLdFljNmR6MGRnR1N6elBYSjBOUnBv?=
 =?utf-8?B?SG80N1Q5TTBDY29yODlOR3F0RnlCVzNiZTQ0N1pjNTY4NW9KejEvS0sxKy9H?=
 =?utf-8?B?ZHBNNUo0c2R2aUdXdVBheGt6dTRtdlE1NFRGdXlzZk1aNkxUckM3QnhCS1lh?=
 =?utf-8?B?TzJ3MmdBZUtzTDJZeTFRMFExcVhJK3BoZWxIK1JqalRvUHFqSVI2bHdJcVlh?=
 =?utf-8?B?YTVXcHlMNllyeFZSWUxSMEJWeWtwaGdJQkNvS29LdlFLTlgrd3JNajdTT2tT?=
 =?utf-8?B?UjdxUGpoeVBCYnFiUVdyVlJqbisxSHk1bGwvNDNrSU5aa2ZjNi9DM2RYT2Ns?=
 =?utf-8?B?Qi9TWWlRUWJ6c3FMd2IxbXJuYzAwbGtFMURJdXVtcVdtTk1BSzQ5c2xMdWlL?=
 =?utf-8?B?K3lyZ1luc3Zja2VhbG1IRmFlYS9lOUxzclNuRG9YUkIzNHRuSzZIOGJEdDQw?=
 =?utf-8?B?VmMrd243NG5ES1I4Nkt6RGlPS0RSUzJ3TEFqbXJCeXZTODVKcmljUm1sSVhl?=
 =?utf-8?Q?AMON1ySHM15gyEGh/YrG7oWLk4lK5LiIeITcX+c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375242a7-6c5d-4ff8-9674-08d93a2e5f79
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:15:09.5305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeTkHdFTAz9JrRq+ocfaFnFbFYvKtJys7pPO+JXn4ikF0xDFjL7rp/hxixHU4ndLzRi9jyrPewkxtQ2fnBv0IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 02.06.2021 16:38, Jan Beulich wrote:
> We already do so in the native execution case, and a few descriptions (I
> did notice this with SHA ones) are short enough for the output to look
> slightly odd.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Again - anyone?

Thanks, Jan

> ---
> Many descriptions are longer than 37 characters, so I wonder whether we
> wouldn't want to bump the padding to 50, 60, or even 70. And this
> perhaps despite then going out of sync with the individual insn tests
> earlier on (which I wouldn't want to touch).
> 
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -5181,6 +5181,8 @@ int main(int argc, char **argv)
>  
>      for ( j = 0; j < ARRAY_SIZE(blobs); j++ )
>      {
> +        unsigned int nr;
> +
>          if ( blobs[j].check_cpu && !blobs[j].check_cpu() )
>              continue;
>  
> @@ -5196,7 +5198,8 @@ int main(int argc, char **argv)
>  
>          if ( ctxt.addr_size == sizeof(void *) * CHAR_BIT )
>          {
> -            i = printf("Testing %s native execution...", blobs[j].name);
> +            nr = printf("Testing %s native execution...", blobs[j].name);
> +
>              if ( blobs[j].set_regs )
>                  blobs[j].set_regs(&regs);
>              asm volatile (
> @@ -5212,11 +5215,13 @@ int main(int argc, char **argv)
>              );
>              if ( !blobs[j].check_regs(&regs) )
>                  goto fail;
> -            printf("%*sokay\n", i < 40 ? 40 - i : 0, "");
> +
> +            printf("%*sokay\n", nr < 40 ? 40 - nr : 0, "");
>          }
>  
> -        printf("Testing %s %u-bit code sequence",
> -               blobs[j].name, ctxt.addr_size);
> +        nr = printf("Testing %s %u-bit code sequence",
> +                    blobs[j].name, ctxt.addr_size);
> +
>          if ( blobs[j].set_regs )
>              blobs[j].set_regs(&regs);
>          regs.eip = (unsigned long)res;
> @@ -5233,7 +5238,10 @@ int main(int argc, char **argv)
>                  regs.eip < (unsigned long)res + blobs[j].size )
>          {
>              if ( (i++ & 8191) == 0 )
> +            {
>                  printf(".");
> +                ++nr;
> +            }
>              rc = x86_emulate(&ctxt, &emulops);
>              if ( rc != X86EMUL_OKAY )
>              {
> @@ -5242,13 +5250,17 @@ int main(int argc, char **argv)
>                  return 1;
>              }
>          }
> -        for ( ; i < 2 * 8192; i += 8192 )
> +        for ( ; i < 2 * 8192; i += 8192 ) {
>              printf(".");
> +            ++nr;
> +        }
> +
>          if ( (regs.eip != 0x12345678) ||
>               (regs.esp != ((unsigned long)res + MMAP_SZ)) ||
>               !blobs[j].check_regs(&regs) )
>              goto fail;
> -        printf("okay\n");
> +
> +        printf("%*sokay\n", nr < 40 ? 40 - nr : 0, "");
>      }
>  
>      return 0;
> 
> 



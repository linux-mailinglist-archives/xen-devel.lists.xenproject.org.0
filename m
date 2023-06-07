Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B48F725B54
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544651.850569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6q87-0001AZ-4g; Wed, 07 Jun 2023 10:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544651.850569; Wed, 07 Jun 2023 10:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6q87-00018M-0V; Wed, 07 Jun 2023 10:11:03 +0000
Received: by outflank-mailman (input) for mailman id 544651;
 Wed, 07 Jun 2023 10:11:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6q85-00018G-EG
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:11:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9974401f-051b-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 12:10:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7536.eurprd04.prod.outlook.com (2603:10a6:102:e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 10:10:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:10:30 +0000
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
X-Inumbo-ID: 9974401f-051b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz8UMz/cHOLiWErazJMJ9g0Peklsk085iknONArTUNAjBv9rAAWykxp6K8dHw2HDWA0Nd3Y2rMalti46e9lcp4jYJRgUvOoKsUtpyaJq+L8l16PTkcokzrj8EtyGsBpa/uao2YcmCX0Z2/7CWdEWouVnOaK6I2bcL3Lk47yHcNMaTlrv69yC6MUUR5j2YER7NE9WPrScabaXZaAiZiA7seAhlHtpfLhlemyFAjEXLhdEEYVm5Cf5kS3P4Ubrp91OMz70XLXFBfHLhr6apiAgL/09m/ofPKeZ+RBi1xae+nzs5hB6kAHaiPPtAx46VTlaqcjb3hpmY4+8w+LN28hDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRbe3Kmu+Sx6WUUptByxwKbGx12xnGMNkv8suN/TSWE=;
 b=EV0VJ0I1Nm2HUA54wpwji6hSy/glMR5kwr3wsnfmRLycObbytwpAD2htFf0OCR+OhU6M51LzXVS2cK3SKoskum1RMh1yQqCwCgUoaqXgdBiLJt4fDDeG+NwKg+aj01NlvW7BpJutxPY3/pQvYgKBQOtRAeYnXIXoGf6k0kibTGVPwFV8jGsrMO5tQiYi/jPmKUbBVm3Kt/aHJWnhgDyq1amv7rSsQTAFGFGPejBbpaNIOrxfHMeEnDvYt6ZwAMwFG6TmPsShkpl1PGGsJ2FPASVhlXuBJLeIJEvy/W0zNryn2z+1I/QfYCkqCYwwdOSFW/PSiHmapA4tSnr4G9a6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRbe3Kmu+Sx6WUUptByxwKbGx12xnGMNkv8suN/TSWE=;
 b=XfsKTTf3Q9pSYLc0EkTHlxBOugciI1N16tycFroYr/iCF5R1Qv4uuNuSb2TCFOUNnbB9JW67kzjZ75NmI2keAct7Ej6rpB0ioEt5gW0l1IihsYFR205sFBxn1DEf4H2JROe9qXy6BghdfUhFNPYLNR8cwPkRngRdYQFxScCeK78IJUfzW+rMZrXIRLj2RgpOrXm00YzRhQ056SpC0M7UL1ey0xtgeH2E1z4f2Z5FF5UjghomkZA8nQ3SwP6nFOk3aU+365dlTdWFOPpdNgM0rUoLynTwBnCKgBXhDyLs7W93uLUcm85hr27KDEHZduYCbU39z3zHu6fjZUcFKv31ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7453fd92-0dcc-c278-df57-f119240bae65@suse.com>
Date: Wed, 7 Jun 2023 12:10:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/3] multiboot2: parse vga= option when setting GOP
 mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601130518.48874-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: c21e6f8f-bd48-4384-64a3-08db673f6c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a11F5hqV/E5EXFkSPfbIaTGXkLWcagTKon1ZJiQ6nwlt4nOV3SPBWqoP2ZQRlskzNVLU+Mp94Id1n8g6+6nA8mAM1q+BRPP43RgsB7DYen55LVv91CSeikkaXjZAsRa/8NdjgVZWrLmQr/seRDaPz5ZQMCCiW5ljz0h3BeRM4tRtE73J5NcQWoha1j6j3scvx06qQiCGcYk3IyMYBsbYNN8seUIUw1ofLBnb/AWnLpkGlgwqw8thgmdUkn+Wmr4Bh+UOKq4gRIRF2ZkUi/ELymB0UEmM8SS5akL9zMbJc+dccUbigMzZeprx6Dq4ytgvV8rTCjxIuTEldfflefBdAnt1IlcRRZgzhwq5AnsN7Sdw9tm+Avyb4ABAx+a1nZTwh7Mtc4qAQEfecUfZvUT6oYlnLJzb2Xl0bGkhf2J1Okfb+kCYSxP4A9zn/+wc1cTR0MR+2CbNUcUKelB8m8t2K3SRrt+8izwH+XMKz3qV89dZ+fCmG0rtKuZmY+HWQkE2//2uzNe3/g0Twz9bCWYwSLfaxMB+/Li9SuZPoUaoArZu2mZs3QXdnrKqBARd5PeVtRLDZ5RvRarzPivY7DxFERednPZ2gfF2BBp5/ITnZa57V6rbahaEZWQFGqtRX4TBQ4Vm5H9dFOlyr2KMzjMUbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(478600001)(54906003)(6486002)(8676002)(8936002)(4326008)(66476007)(316002)(66556008)(66946007)(31696002)(6916009)(5660300002)(41300700001)(38100700002)(86362001)(36756003)(2906002)(6512007)(26005)(186003)(6506007)(31686004)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkFSZm45Qk9pMlIxb2hObndsYUFIOTd1Z3FnU3lUTXY5YjZ1SXNENTRsQzdl?=
 =?utf-8?B?T3FHWnRHaW9TbkdKOWdvREVnY2hYNUZnTlFjdnVkT2tqM0oxWUNFcnlMdS9q?=
 =?utf-8?B?UlZwOUdQc2IyNXEwMktXMWMrZFAwNDdYaWNRTGRoK013dXkvUnNNWHpPUngw?=
 =?utf-8?B?bEs1bmQ3RTROV0pHNEY4aFZHYlJUUkNiblp0VDVKdnhxQ0txRzhSNXlsWkw2?=
 =?utf-8?B?eDIxZDV5S1JNTnhCcXUzQmEvd1MvdVZLeEVQOU50UEVXZ2xyQlp6cTZ2eUkx?=
 =?utf-8?B?Y3RuUUJXVjRvQ2xINHdmajlJQzVJTmxXRUJFUzVtejh6SzBsbTY3WHNpamta?=
 =?utf-8?B?TWJnVVA2YS9VcTdqZm5HdHBpd1M4YnZzemoxcldJVVJqQldTYWo3VXZTMHdp?=
 =?utf-8?B?Z2RmbjB6a01vamhrQVc0WmlKU3dibzdMRHVCVkcyUDRLUHVRaE9GRDZ6R0oz?=
 =?utf-8?B?Uk0rNUIvcHdoRjZMbDFmSXJVS1VUN1pyUnd6SzJjNlQvSURlajc5WTc1a1hl?=
 =?utf-8?B?Y2pTY2FLNWNNL2xWMUg3TzY0R09DNVZsb2paZU5NY2F6d2c5YTl5Y1l2cFFN?=
 =?utf-8?B?eXU1ZjZsUy9nUFhKL2hVOWdLRjZBT0luaHNtd0ZCUm95VEZSWjVBbTdKK2kv?=
 =?utf-8?B?dGt3UlEwUkpEUmt1MUNRUWJqblBFakJxSUZGUnc5UWpSTEkyYVhBUVFzbGxy?=
 =?utf-8?B?a29QSmZSeDhlR0REcGhXRzArMURoUER2OWc4TThob2xyT2xFdk0vemVoWWxy?=
 =?utf-8?B?Tm9LNXZGazBxZUNFd05BOFBQZWthYWNZNEx5UURVSW56VVBmOXptSHZYMUIw?=
 =?utf-8?B?YmJJU2I5WEMyMXVveGp6ME1wc2QrY1FKK0pVRS9hM3N5TEcrcmkxQ203eEda?=
 =?utf-8?B?Wll2T3J2UFExYXFBTzNwVnlIb3dIdTVhYnF1VFh2TVg4eVZlZFdFTmwwKzhK?=
 =?utf-8?B?WjVjWGQvTTZUZVpMSVpNb25mdkdtQkhkU1hXcHJvQkp3REVJRGFZYVBvMWpy?=
 =?utf-8?B?R012NzRCdysxSzNXUk1tcEx3bVZkWXZqZ0JLYVM3eElxb1ZFSnR5aUZmdFBG?=
 =?utf-8?B?V1dhSFJzWk13OXJsQ200SHhnV1JBaXE3QXUyNHRNOG43Z05yL3dweExkYTRa?=
 =?utf-8?B?WXRFYkpUa3ZIN1pBMk5YNklLWEgrRWczMFBuWU93Slo0SjNheTRleGJrK1ht?=
 =?utf-8?B?ejNMS0FZY0paNjRZdStabEhGZGxTRGJ2SVJ0Um80NDFXZlpTb0ZtMDQ2SHZj?=
 =?utf-8?B?aVpTaWtBUk9oWlRvS2p3U1d3SzU5a3dwK014U0dDMldwMndjc0JGSEhYa3h0?=
 =?utf-8?B?dnFmbUx1S2lWRFNEeWYvNzRwM3loc3B4NHFDb2gyWmFJbTZ3WmY3ZERZVGZ4?=
 =?utf-8?B?V2lXSGw1Q3FvcWJrQkFPbW5JcXlBNnhKa3pDajFBd1VvVVNxOE5jY1VCaFM4?=
 =?utf-8?B?amNSNGtzYjBrdVYrY0lUVHFVcHJ3L2plUzd3Z2RVV0s1ZWEwdkNtYjUvK3F3?=
 =?utf-8?B?UWlBWjdQTEJmQVVHRGFmWkVUYkNKU2dPcW5JZzZhTkE1NmRrc1I3ZkxXVFZX?=
 =?utf-8?B?bnJrdzdxSXFpZkd3TlhvYmFrc3ZWYnUrRk9LaEhmWXNpNGVyR1B4MVNVVHVE?=
 =?utf-8?B?QVVuUHpyVGdEUGFyNUJQQzBGaUh0a3YraCtzaXRKell2VU1JaGsyTVg2NVF6?=
 =?utf-8?B?OE1FYzM5ZjhNdExPcktjSTZVaWJ5RnBWdk95VW9naGZheXhNRXVvci9xaTFN?=
 =?utf-8?B?ajBMRjNodUFnRjRnUW5mNGJYeldkQm1oY09OSDJ1NW1hSlR3aElmampYa1U4?=
 =?utf-8?B?MThDOG11eERQWXlHMitHRmw0dW1HcHR6ZmJUM200bkJKbTBScmxPY0VCNGxh?=
 =?utf-8?B?RSt5OW41SkVwVC9nUDQ2L3NTRkNTT29iNVJ4Szlrbkd1Nit1cFN5SFNGTXIw?=
 =?utf-8?B?WWd4TVVFZ0ZDQTlKdUJHcW5CTTRGalQvSC9LaGd2MGtCQUUxNXB0OE9SQkpW?=
 =?utf-8?B?TkEwNXFwWG80M2ozUno2MFQzZ0sva3BFV3pXcmtKemxvQWNCclEwZFlPbjFs?=
 =?utf-8?B?YXlpdjJ1NXpISkIwTTVQVWIxbWxNekdPWE9OVnhHR0RzYkZMWWlMOFVsZFpM?=
 =?utf-8?Q?DH8Qy8cQAdsARaHp07bt6diYX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21e6f8f-bd48-4384-64a3-08db673f6c8f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:10:30.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FIqCWbJfLl/2tH1a7mpy5lVVifY7vjiOkjzn3QeJ3W6mvm4zUAeEX37gAIcf2oUFhQfrWNavowFQzwdJN0L2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7536

On 01.06.2023 15:05, Roger Pau Monne wrote:
> @@ -807,7 +830,41 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>  
>      if ( gop )
>      {
> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> +        const char *last = cmdline;
> +        unsigned int width = 0, height = 0, depth = 0;
> +        bool keep_current = false;
> +
> +        while ( (last = get_option(last, "vga=")) != NULL )
> +        {
> +            if ( !strncmp(last, "gfx-", 4) )
> +            {
> +                width = simple_strtoul(last + 4, &last, 10);
> +                if ( *last == 'x' )
> +                    height = simple_strtoul(last + 1, &last, 10);
> +                if ( *last == 'x' )
> +                    depth = simple_strtoul(last + 1, &last, 10);
> +                if ( *last != ' ' && *last != '\t' && *last != '\0' &&
> +                     *last != ',' )

You check for an appropriate terminator here.

> +                    width = height = depth = 0;
> +                keep_current = false;
> +            }
> +            else if ( !strncmp(last, "current", 7) )

Don't you also need to do so here, and maybe even ...

> +                keep_current = true;
> +            else if ( !strncmp(last, "keep", 4) )
> +            {
> +                /* Ignore. */

... here?

Jan


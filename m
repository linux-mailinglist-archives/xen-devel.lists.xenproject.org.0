Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B11539CFA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 08:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340218.565192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHWg-0006Ow-32; Wed, 01 Jun 2022 06:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340218.565192; Wed, 01 Jun 2022 06:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHWf-0006MB-VI; Wed, 01 Jun 2022 06:08:13 +0000
Received: by outflank-mailman (input) for mailman id 340218;
 Wed, 01 Jun 2022 06:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwHWe-0006M5-Q0
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 06:08:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36bc9111-e171-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 08:08:11 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-DJf_wPZWM6OXTpJdiZGj8g-1; Wed, 01 Jun 2022 08:08:09 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4692.eurprd04.prod.outlook.com (2603:10a6:208:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 06:08:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 06:08:08 +0000
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
X-Inumbo-ID: 36bc9111-e171-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654063690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEUwB/AVRNW+SOSSQmEQiPixxgsqNXK7nt7cMYX3VFA=;
	b=J9VmMy2wdlVEOFeHBde4bKasMHAFNmUS1J9Af6EtK5FjWRCPeiTv/rs5TWLPXwA8ajnDdg
	ZG0H3VIHJBBxgwGGWGS4hFK8lo+Bn8JN5htFgJpC/C5B6wQ8xT4vF5v5sa9/+IdkU2IduA
	LpE5Wla071p2B8KB8GTnmeiW0QXKw/M=
X-MC-Unique: DJf_wPZWM6OXTpJdiZGj8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3eReNnavcFxzYI4gwF5T+X1BLMV+XA0B4w2ombN6bU05fRZJg7m4KDLljCiqqg4Y5gW/tG6UfgEZcFr1DvjVE2qHQYW6NYXecsax80lwSgOnbCBZ+j02g+onpwndJfx7vxyp9m0Q1A4rAC2suJybBxLIuvoWLbMGugps9VY+ytBCtwlZmohKP/jYPRqyu7NdcyIsTDTsUSP/cY//Gm9rn1EA5g7JAjvTZdB3sx6IXvV8oHwoLh2OlcV5pSWAtGW3vqjW6zA1379ym3AkkYfpkLC3TQgsBdM+BZiAvQF3IiPk4eLJr9ykpBUjww1KdzxVuuK5u49SMdwpj+WfCl9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEUwB/AVRNW+SOSSQmEQiPixxgsqNXK7nt7cMYX3VFA=;
 b=HaTmJSW/2Dbu1xcEDv6HYIUEi2afhaqoPkQ69FkoS9E1y12/ldNXV9Y/l63RKZHqttIM6KxPqxFbghwHCp9SblfBdUrZjr0fF2f+X3ma/uUxxVzFmDOAqM3d689isCdFDRIpT2Gpgjvj8jbsBpdxQ6nsC/7TsJdLBwU2kbevx3gCpS89YdIigbozSYBVIUiZieOsZgEB49IXtx+o0SsyeQ0Ops4fv/5uuuEsz5WcG00cPVHWF52FxOLMNGVVfH/kp2y4B/TZTAImXMKJ9Z3XnChWIBSZ0BLbuEQsm4NSIYSk6uP9WakxKV+XlUYv9XLl9sifZaATjafQmNn3JebQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8697e9f-6b48-0c1b-8d5a-2d36dafa75b4@suse.com>
Date: Wed, 1 Jun 2022 08:08:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/3] xsm: only search for a policy file when needed
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531150857.19727-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3d2a808-52e6-4fea-d34e-08da43951944
X-MS-TrafficTypeDiagnostic: AM0PR04MB4692:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB469239A57EA0A6FE8162BC66B3DF9@AM0PR04MB4692.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zbdG5fc3dL46Kcaem8obARmMJ4bO2TlywIMdU3ZUxwvkCRnIfjgQb1npwfETzi9dJE7fdBOG+3dgCWsuoX0GUrqRgOZ/7XSsMUEwQ/BTac4R0u78CLNd/3tNyHinI4CfCgxgVGBby0vonqF9vAvu/bd/sqsLSLz0ChqvhaPaGJSfFEymlyPHrILVXEGq5r8KzCfaIv+f5rMXnufnZClnB5Nd1pC0y9Z5m3HrbGuuRxIIfBl2enxAtV8sj2msdfc0tn2w2jttGgINE9eM6Puw8LZEwqwKSefeVGFPb8JaTb+HJ89Md/8XoxLGJIZhMEu9tGGGfhYSBC8gyKzhthxyNjhhzK7R3ppFpBDiwr3tikdVoGqAjcf1k/rMbLJYp4b/MVRbO6ilVL0ZTJbLYbgFFAEjfDYYd+kLcsUknCHV6zb3Egtu8Gay7xtikXeBl8ewHfLzgmdJLYJniMbl6FfeBq6mceu+mislhJmOByUB7QMQXJjv2Js8pP4NRfiwdJvV/ccvmYv4Ds8Fj9pEacgywN8prH5BTSvm1y0JwTXmjRh0nVZXVib9O28PaCXuqsO8DjjaUAnM20ZqWAWCOBYWSmG6ydGh/iPwz+l4w7Sfn5sd/QoMVJGFcVne2S6FjG7OVSAkXMHeN07hZelML/00AdH8t3/A588iUjLcbaoyo4KyzicufyT+C8yu4EBZoB53CG0UXZtG265o5LjAGcXNPoT0DfBrYyHs0dJ6yPC6UqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(6506007)(38100700002)(186003)(53546011)(6916009)(2906002)(8676002)(6666004)(4326008)(66946007)(508600001)(26005)(316002)(5660300002)(66556008)(36756003)(66476007)(31686004)(2616005)(6486002)(6512007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHk3YUxGdG9OeUt0WHVqc1lQQzdxUjZteThmTFhXRXdqZ29hOHV4Nyt3RkNE?=
 =?utf-8?B?cHN2eVVmQ0JDWlA2eGRsbmoxS1dCblV0QWh1dnNtOW1UTDNnUFhrOEZlN3RW?=
 =?utf-8?B?MnpPdEs1Z3Z4Q21IeHJzNW9sTERaTm5rQWlPeXpoMi9ZS3hZVmg1QXNPY01k?=
 =?utf-8?B?aUJmeWU1S0w0WHN0RDFrYUc3NW02Q285ZXd2aituUHhEY2VoenhhVEZ3OGQ4?=
 =?utf-8?B?MGtaNkkrdVppbGl4TFdPdGI1ejM2YVVvd09jb0dHaFdRaEpvMFZWcUNiUXNR?=
 =?utf-8?B?MFI1UTQvaG1VbGwyelBrdTZYcERsSHlXclYvMzdrY3FIQitkNVFGN0J6NCtm?=
 =?utf-8?B?NHNQMEpMT3R0RXI1VzlrUUhub3d2RW9wWUJiTlZOUDR5R1I4M0MvK1liNVVO?=
 =?utf-8?B?MWhUMW1mVmVjanB6Vm5Dak9YVm1EempjdkxYNlRnYk51RFpWR25CVDNLKzVj?=
 =?utf-8?B?a0xEREdaaEhReGFxRnRTWWd2eFJRQ1dCT2lJUVJuT0RRRkdNRVU3YnBkc2hI?=
 =?utf-8?B?dE4yWjZWR1JXcU1NTEVGc0pFNVlvRkNOM2tDTlJ3WE1obHFVdFFxeGJldlJl?=
 =?utf-8?B?bjFhYVdkc2hZWUtCdTQrZ2xaL2VMYmpjZFpNUjJxUHNTNDluVXBZY01rdVVM?=
 =?utf-8?B?YUdqcDVRMXV6VGxVUDk0Yyt0eklLalg3TEd1WWJzQk1xU2w0WXk4YUhBTVFW?=
 =?utf-8?B?eUlpUXlteW5KTjdzbFpkSlVVSGd1VGw2OUZxYkI5RUE1dm51NGhwUnY1V29P?=
 =?utf-8?B?MmhJT2JMTmwxWk1DY0ZscTVKRkd6L0laMmkrd2dWWURwc3RFbWNyZnQ5czlY?=
 =?utf-8?B?dGZPNFFiak02NC93dExOUFROL3pXNStqMHl0NU12V3FNWjRQNEU5UUg5UHBl?=
 =?utf-8?B?NXFYZ2JvS0RhYzJiNDFYMTc2UTVBcGpUelplb09NQVV5VzNIOGYwNEpzS21s?=
 =?utf-8?B?VXZlbWxHUTVDTUZVQ1B0Rit0TUMrdlJGdjZLZzdsWktnWFJRMEJQRUg0d0NH?=
 =?utf-8?B?UWFYcU5zZXFCTjVrVkdTZWZWWjJBbHpqOThVaHZPcFVDcnNPMmk2c3FJVTNX?=
 =?utf-8?B?STEvZzE1QVprZjdnaWdGY3lnK2ZjRHkyaThYMjlCTEdXaDFpR3Y1eUNtczNS?=
 =?utf-8?B?YThsQ2lZVFZXTDRrVG5lSUdIbTg0cDhwNUI2SjFjemgzSGd0aHNtalJERlRm?=
 =?utf-8?B?cnhuenhMdm9EOW0rT2ZRR1c1WFV2c1dSUEJEVkw1cElPenpVT1pWQ1RqVURs?=
 =?utf-8?B?VXJWdmR2RzhvYWw2Q25Ia0F5MTVTVEIybE9nVHlwMlQ4RzNtVVZ5Y3VKb09K?=
 =?utf-8?B?VWhVWTZESG1qQUFmLzJqazRoYXFoQm4ySmNPSUNwb1l0VVpTViszYWJ1cmdp?=
 =?utf-8?B?NDVSdExHemNpazNxeGlUZnB3MS9CNndQVG80WFFkRnByR3p2OVVkMHNOZExQ?=
 =?utf-8?B?c1ozSjhaWUtTaTJjN1d6bkNZck9FYlI1b3dEaFhXeU10ZTJZS0VRRDdlMi9O?=
 =?utf-8?B?bnRqMnh6Q2JtcUx6SlZ0dmNDUXpMZmJkY1hPNmI0SHB5RXlKV0x5STcwTS9l?=
 =?utf-8?B?aVBKSTRCYjhPRkNWNitRc1lZWHlZdVlod3MwTjB1dzdieU9uMVlKaWR4d25p?=
 =?utf-8?B?amRlMXAyQkxKTW84cDFHaTlUQ0Zsa0I1ejlpRm80NkxGNkhlS29nUVMwdzdh?=
 =?utf-8?B?Y3o0aFZOV3AxK1piVWxSelRSME9JWWhnQ3pLMi9Qd2dRM1VSZFBoTkZJSjZE?=
 =?utf-8?B?WjFkeEpxcFFEZWNaZ1NudGFEU1I1TGR0R1lGek44dlNRMm1aSE84U0xBdUtV?=
 =?utf-8?B?eklzRzVpY015bGp0Q2MxL3Iwb1ZyQkpOU0lKbmIyanNLbUgzNU9NSldiQkc2?=
 =?utf-8?B?cVp3eEMrL0oyOEJrRllGN25RTEtHdHY0d3o3b1l3Q1VFK1FyNEFLS1AvSHp3?=
 =?utf-8?B?ZUVhTGwyMzI1YzdKWlQwb0NiRHRPam5obzVrNzMrYmhYZzBLZFJ1Rk1JTFhL?=
 =?utf-8?B?M0ZqQjhyclRXdG9hd0JkRkVsYUNpUzZldEJGQytFNThJcm9XbTEyU3ZxdjlF?=
 =?utf-8?B?OVdxemprSFdqdVpwdlJTOWYzYWxsU2IzNTRLMWd4aDkyTWtwU3hJc0QxeER6?=
 =?utf-8?B?Znc0UGhSTDFmdmhYMmRqT1Qzb0FBdzZQd3p6QWhSQ3h1Nm5Teko1eVpQNlhE?=
 =?utf-8?B?UjJvL1pxSHRFMmxOa3cweUhoMThIRkF4TFVnWkt2dm5QNlBjVW43LzhFamsy?=
 =?utf-8?B?VE0rODVhOXdYelBrd044UmJQOEZ4Y2tycm9TZTQrVnZjUFNPdWZoWXJQYkd5?=
 =?utf-8?B?YjF1cGVwbGJ1UWpIWmpNenRiRis3LzF1MTdWTHgwTXdjVlZlN2JVZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d2a808-52e6-4fea-d34e-08da43951944
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 06:08:08.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar0q+NiH28/8+09vZFX4iOzCh6BTMU8/WHiicVIeg9Vs0MYR/1CDYEuCr8zsAJybDUa4UQe52wWh4HXZaOfUFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4692

On 31.05.2022 17:08, Daniel P. Smith wrote:
> It is possible to select a few different build configurations that results in
> the unnecessary walking of the boot module list looking for a policy module.
> This specifically occurs when the flask policy is enabled but either the dummy
> or the SILO policy is selected as the enforcing policy. This is not ideal for
> configurations like hyperlaunch and dom0less when there could be a number of
> modules to be walked or doing an unnecessary device tree lookup.
> 
> This patch introduces the policy_file_required flag for tracking when an XSM
> policy module requires a policy file.

In light of the "flask=late" aspect of patch 2, I'd like to suggest to
slightly alter wording here: "... requires looking for a policy file."

> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -55,19 +55,31 @@ static enum xsm_bootparam __initdata xsm_bootparam =
>      XSM_BOOTPARAM_DUMMY;
>  #endif
>  
> +static bool __initdata policy_file_required =
> +    IS_ENABLED(CONFIG_XSM_FLASK_DEFAULT);

The variable may then also want renaming, to e.g. "find_policy_file".

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FFB776006
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581072.909601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTimX-0006NY-2z; Wed, 09 Aug 2023 12:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581072.909601; Wed, 09 Aug 2023 12:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTimX-0006Kt-0C; Wed, 09 Aug 2023 12:59:21 +0000
Received: by outflank-mailman (input) for mailman id 581072;
 Wed, 09 Aug 2023 12:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTimV-0006Kn-8t
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:59:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c19a59d-36b4-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 14:59:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9070.eurprd04.prod.outlook.com (2603:10a6:150:21::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 12:58:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 12:58:45 +0000
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
X-Inumbo-ID: 8c19a59d-36b4-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1OnF6DE7Hoi1yBe1sQmmA8DzP+dzWnVxnTf3VcRXrTvBYZ4PueEv4ut+5ofbR6nNPqhKbwdDU5ZAYK4vQNKn5vukjgzmorTYpL5B+bb896fquBCwq6qUBwREo726vJfSoTW6AmIByZY9873JEUIyVLIbGUrPFLhz2NRZRIiA0Lv+gdLlsyFFs0UZHzI6OwKJruw4N64wvJiU84hufJFPsg6C+0Z8p+XP6EIGM+YJBebm3MFJFoxXnsd/2hcSKq1uk0GNhh2O7OQrXyPd4lC+Yd3R0+qi/c2JIW/TcqEB8NsZDg7LN5q0C3JtG/t6hYAj3F88Hb9HasqD1OSQdKg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBb2vbJvdTKzia1A1t1ysqiU/HUf11dh6j3TxeCtJPQ=;
 b=AioXwZwHqkFXityjHxMOesZkEqjSU/ARJ3csksedg9ETeBJUsbeOA4/C9FCjQM050e/T7KJ5RyktTd+3qOEJaM9ARj6a2tM0SHrk8Yd39EuJau87oEwb9h/lqKrgb2/p1ZnWM2D4fEd3ao0SYFBi2m+Zp/dQlIcqPd8eHOR+4hbd+XUJNGK2JfN+Ajt4wMLL8T5sQxS9dJJUpCz0TkOPrweaOgCEI/dp4cu6i96rCavS1J1Bhus82VPAu7lq+3u7NV4INGFeofLahuBHjcUD49MF0t9hvjyqAU0Obm9bpV25PC1xbU8o0U8tmbKTMZIAnophnA5+HxVxh2MyQcjf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBb2vbJvdTKzia1A1t1ysqiU/HUf11dh6j3TxeCtJPQ=;
 b=W2YIsL7itZZ1RgymwIv/QZztChAU+g+GXnxsb3itHSlB16peukc0bvofbzi4q46I6G6B8LXTKOn41nVjVprg0zkFT4sSgtw8vCb8aWx2h2LoxlrskrvN3J+R6Nt8ihrW1cHbt+saIdjVharuzvDgiEkh+1jypom8CiHtCOMgrKpRxyvbj9fcJPfmKWdaf1jn3ydxJfGMXeU2SzZgfzJF4qCbLXvFtrgiTLMdJ+YzuNS9YxhZOYvZmEYyWTNhttyP27UfaTX3lMqokBGOf/adInJbGd1acmsNs6fpmO7ARnFurCeko4s+FzkgUgJc+TmQiSkBl9QwYOWdybXhPEwgog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c2b3ce5-2081-0894-5e47-2feaaacea830@suse.com>
Date: Wed, 9 Aug 2023 14:58:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 8/8] x86/nmi: address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <cb600b79b3f603302a58198c1f5e84488441b736.1691575243.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cb600b79b3f603302a58198c1f5e84488441b736.1691575243.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: f4414fe0-a2ef-431d-4975-08db98d85d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5u0AjMjMwrION3nWk5qsSp3Z3cJpu8bMrvdL2PEiOZ/LCAha3Jxxsk4vMxzigzNzpQzSHNu21M0HTKJuq1qQPZF/DT4hDhSdMBVtm3m0CifsO3h2wwWqR5H11q275Yj30/P8d2aboLYl/wtQWWY6l9PIlHSY7YMPwVxCu+pAjtTwHEPyR1bUD3v7PWUa0XPJhaLlWS4fzsliv17lNWONXIxDfi6iZviUrYbcJsJhTmPlbt43liwBljVx22bxpbNmlJwU+Ms6XG5bYZ8JXAnRR9O9rTfA7erz0dikdVK+Rlfe2St9Qrvig7+sqXlEHHdxcMEQSLKE6nz/6QGkp1AqD18KB8ljH2yi6ZdGq1+anGctdLl33/e+YeqhYpq15agPSIH/F/Hi1eqsviiCe0Ad9aVXbq+2RXx04dwxjGVE4tNgfOtp5dqbCu+sSCxUTYKJD3JuQdT+MTNmAZfLU0aTjS21zqArIOtRE7xSMhL+XdAV4dG/aaMtFM0k1lgIHNBwNYhiu8zHL1Vf5dS2+g8kY3BeFkJyr55dvkf/WwctPgodc3hfLCxUvPBuiFIYPczWx3AJG/dEk+/IvfPVP8naKHzoqC78g+4h1LnTNNWdDywTl8g/0uAqTl+HKxdJmyJ39arBcPdl+0jdeG0at9/QnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(186006)(1800799006)(451199021)(2616005)(26005)(36756003)(6506007)(53546011)(31686004)(6486002)(6512007)(478600001)(38100700002)(54906003)(66476007)(66946007)(66556008)(6916009)(4326008)(316002)(41300700001)(8936002)(5660300002)(8676002)(7416002)(4744005)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1NGcDVYcDFHQ3Q2R2JkMiswVTcwb1gzQ250U2w1Um11V3RQampvUkROODlB?=
 =?utf-8?B?RzBwZEE5eDdOQ3lXYWI2ZmNEMEpodXdVUkRrNjdwc3VHMlBLelFVaGtTWmdN?=
 =?utf-8?B?WUtHUnF0NjEvbTRnVTRnTkNHK2huQy80WldNZExKWEVwSVNhQ0RzekFCMXBM?=
 =?utf-8?B?U0VSbkREaFBBenpwV0szb3VsWnRJRUt5LzlFdWNpRGduZXc5TE1MamQvTkJm?=
 =?utf-8?B?aE5TeTRBSEtWcURza2s3ZE1yNW1ISklTTnRqT1NtaDBRRzZjWkJEcnA0RG9N?=
 =?utf-8?B?RktVZi94MHBSSTgwUjIyM3ZsdThHMnF4Vk9VZlEzUllUTEFvM2ZZTXNSaXdP?=
 =?utf-8?B?V1FLOGRtNEhOYlZDbUJGejJTNXdFbHFiVk9yQWJkUmp4RlJaU1NDNlFzV0E3?=
 =?utf-8?B?aS9LYTA1aHplREl5RmZIUlZzNVdGd0dFVXJBckpyZ1BGUlZsay95UlRVdjNz?=
 =?utf-8?B?LzNRcGpsZjlkQVBtTEhwS3NSaDBxK04rUngyVmszWVZBWWorcUdJeFBrdWI0?=
 =?utf-8?B?RGw3VVFtZWtJVjVtNmVUQU9mbFNoODFTQjczSVNER3Bia2ZTam5YWC9KN2Ri?=
 =?utf-8?B?SWdLSGpGV05BazVLRE9sYzluQlpGZjVHTVppVTlaV2c2aHI3aGZSNHVWNXRP?=
 =?utf-8?B?U2RPaWlndGVnZC9vK3NzOW5pakZiT3RsVkdNeE9FZ2RYVG5aeHNtL0R3K0w4?=
 =?utf-8?B?RE9FQU92d09ZWmZuZ0dLQ0Rva2JhY3NrZWE0Ujk1NU9aUzJDN0NMV3I1NlI2?=
 =?utf-8?B?elhlMThPOXNrak8wZ01XcVEwMnd5SWMwUjRNdkVobE5TQjVnaFFYYjF2dE96?=
 =?utf-8?B?c0YxMVNxRnJURzFQK1k4cmc2ZCtHT3RkT3VFMTRrb2hLRFZoQzZoSHF5UWdP?=
 =?utf-8?B?RW90L0IvS0cvSVNrNFpYRzRPZkVuSHNBc0tTSis3WjhwQVZOOGNTVTlYWnRw?=
 =?utf-8?B?ZE1QSFdSV3dHd2cwejJOMW5lVUlGbi9GS1Z2cnZXam9JZzdrbm14WFhRZHMz?=
 =?utf-8?B?cXJrYWhGWTgwYkVsdWZwZHpjV1k1b0xVZXBPM3cwcWpPWGhMWUdxMmZZSE9m?=
 =?utf-8?B?V0Jmam9rdmtoNVVSNkNHV3d2cHBoblZCUG8ybWVnTGlLUGRuVTZ0SitrNHBj?=
 =?utf-8?B?b3VaYnpsbXZVdStuTXE3QS9iTEpnMEFJZ0pkemRJM1BWK3UrK0R2SGo5WS9T?=
 =?utf-8?B?Nnhic0lLM3ZZaGFmMklhNlZTRnFmR3MxSG1jbGREN3A1M3pKckRySEhUY05t?=
 =?utf-8?B?K2FreGVVUFI2SW0zT2U2L3VVbWRUeElTSFREL0RBQk9rTmJLSHh1Rnl5dGlJ?=
 =?utf-8?B?QkI4WUROdTBiSGhrbzNBZUJtRkdzbVNnV1hhMi9nRHFUVFBXMlRuVDJ2UDNK?=
 =?utf-8?B?UWtweXFlc1ZWVW5vdm9zbUg1VXVjaXlmVktwWDlLMk1DVU1od0JCR05RUHE4?=
 =?utf-8?B?enlvc1BOU2JvOGQwK2V0UjIvbjk5dUwyQTRBeDVUeVlDZW92Z3I3bGtDNlVs?=
 =?utf-8?B?eGljZytWeEgrZjBLaS92SzNRMmlLWmJTejEzQkQxcGE3RmFvK0E1YnFQcStE?=
 =?utf-8?B?STNyUDUrUjArSWpvZE54aE12Tkp3ZmZoZ2llYjA5TjU1bFhvTUFHZ0JsMkZD?=
 =?utf-8?B?UGRnV0tmS0VqTXRuYnJsWGM3bkx5Vi9FRC9WOVAweUtyYlkrRm5IN1NINTlh?=
 =?utf-8?B?K1lGakN6TUQzYXN2dUtLOFVReFpkN1NVdlVXa3M3aGw5UlNodjByQ2loQkk1?=
 =?utf-8?B?ajVrTkErS292K2F0SVNvTEI3blU2SGhyUHdoTURNSSt6bkZxQVd5WkVnNFJi?=
 =?utf-8?B?ZDFwMFg4aHNmUndaT1JtMnIySXpZSGwzcjY3VGdmUzU2ekpMZjNhNldvb1c3?=
 =?utf-8?B?QVdRaEhwT1crQVZRZzBtODlhYkZRdFVrQ29salc4MGFXRHdKbDNZNE5sdGdZ?=
 =?utf-8?B?TFNpb2lxTGlvZU5QYWtMNlRQUG5TV0c5MUdrRmhqdHpKVnEyYkVYQkNBR2V2?=
 =?utf-8?B?SGVMZ0NmM0tGc2lvckRwdjNPTFZHWit6Q0plRkJNSzdBajJ2RjQzYXNOZis4?=
 =?utf-8?B?VlFFdnF6SFNLR0ZUZmFsbktiSTNBSmhRUFl6YkljVWxydFZsblhyR2ErYU80?=
 =?utf-8?Q?O1esKU1jQE5EGnXz/KzW9XPMj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4414fe0-a2ef-431d-4975-08db98d85d8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 12:58:45.4072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYON/srCWxvtWmE/UfEEd78TRmz960poGioiIJedsr1+dNkkUA+xfviNH6FcJdBd5XBKuGGGOAjEsN0BvpANIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9070

On 09.08.2023 13:02, Nicola Vetrini wrote:
> Include an additional header to make the declarations for
> functions 'watchdog_*' visible prior to their definition in
> the file, thereby resolving the violations of Rule 8.4.
> 
> No functional change.

Fixes: c8177e691f0f ("watchdog: Move watchdog from being x86 specific to common code")

> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




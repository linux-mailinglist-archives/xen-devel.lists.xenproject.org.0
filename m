Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC1538D63
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339327.564169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxmh-0008W2-9l; Tue, 31 May 2022 09:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339327.564169; Tue, 31 May 2022 09:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxmh-0008Tb-6d; Tue, 31 May 2022 09:03:27 +0000
Received: by outflank-mailman (input) for mailman id 339327;
 Tue, 31 May 2022 09:03:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxmf-0008T2-5Q
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:03:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8680490f-e0c0-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 11:03:24 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-OdJEqrylM4WWzzIKq-maCg-1; Tue, 31 May 2022 11:03:21 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4389.eurprd04.prod.outlook.com (2603:10a6:20b:1d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 09:03:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 09:03:19 +0000
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
X-Inumbo-ID: 8680490f-e0c0-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653987803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+XXGINd+vyXCDIMq8ifrggk2Suqyy/MwmeDVjy+D6I=;
	b=jyffy3i0btNLTKOEvnIH/k5Za8a3l8pUxtK2YQKs3HBZ9bf2wzBW9Z48mBfGTQdTZpWi/c
	GCqHVcPSmervjS9kRhAGgDj7KbKUmwbgAwI4SjtIDFMpj1LafoRjGzi3lKrD19zEU8OPTm
	7wD5R3qjaPvST6CBRk1e4JEJteYH2Jc=
X-MC-Unique: OdJEqrylM4WWzzIKq-maCg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRciIQ+M4v5+OH5K68a38/7wLHisXcXFNAZocZrgUbd8wDlmA0LLsLPz+mLeLyXO0708ZUFbMMqI4WMoubyAJ25PhR2jTv+C5EDPgw+g1OAtGDfnQFUgHI0UnGBc4IbzivExPfANS/tHLJYcIx1Y9zIVxjFzkWP9ChHUPkLK8AOk5i/9CBdEQNhS8h9eloCUrRyM7ZibG3grtd50u2V6C3HBAGSP32yj3pk8iZ9giDmelFzAPPdqemmQHXZK6v0RQxBbRHliy6JKLajfduTSuxQw1vOR/p3qmjcji7rxpKcOEHUatBY79786RlUBZxzfJmAJmZXrST7jo49d3J9DnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+XXGINd+vyXCDIMq8ifrggk2Suqyy/MwmeDVjy+D6I=;
 b=JKmnCqnPkdEDdd0ZzEUtYSVaTHin6RyNmJAm9OsjMwmoEcpXwncHQbCWVYc2Xr9B4rbv9T1x76esyjihcSAYGRWrL+Y8l7dnwma2ZTEH63ifUMjh1KxPHhZYFmK4PuZ8NtgKk9KTZ8/A5Fgbe3Whk8QRthZ5oSDslQd93nis8UC31fiYInL0AFVaChlBIkRhXf1cj0hfbsF+Xe+BrHZSEP5zqvXjPv341kWZaTAPZNAvsCCJjc1l8Is7Z44VxqFCGfkEYaIJuubbBRLdDV0D31LKUt7a9fFshb5+5GA31C1NjxQSoxPM4RTVCKiMvkR2eROydRnPkn/N/GPU0/G1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55be7afb-dc71-fa26-a1dd-59e573b9ac4c@suse.com>
Date: Tue, 31 May 2022 11:03:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] tools/symbols: fix memory leak in
 build_initial_tok_table()
Content-Language: en-US
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
References: <20220531082320.31294-1-ruc_gongyuanjun@163.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531082320.31294-1-ruc_gongyuanjun@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1d77d3b-118a-4bb1-1db6-08da42e46826
X-MS-TrafficTypeDiagnostic: AM6PR04MB4389:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4389CB032A38B6B9FB968B57B3DC9@AM6PR04MB4389.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K3OvK+v/yU8Ul2OKIu+oIqXpNlp/stHoQBNNgbXXup+PTdM3MokQXcZm6v4Djy4PAgdotASlgBwTDmiR7ArcQpe3wAdMSIASi+V1pFZguQ4pwaV4ukzzrAOO/8O0/IDNVwaS+odrGBTwA3/a3hEoi69EDIA8WHbjqyMVe0H4hMrULCLcTHEj5mpYvT4meIiKEbXkJE2oU4LUCH/WwM12KQy8HJkNQD14bLRvlXYbCpzusbuLjsHf2cB0Gc3Ynh7kTGrlMz1nEnRfnWPjygltZZB8dEMlyjRgM/FR5kCU94WW+IEP6yfvg4sngcDb1tAbyvUDuWQDLaMtm7pUlZBmt17WTdngQruADC7cJzvXAl/nOitys+J+PsoAoeIroCCQVUXntb0IQzUyl1bvg4ZtkEt+bwWxNNgCihE09pKS2RKRKecVmSV+ec5Q5E+E61Y3KVJXZBsdkfYai4STT2kD8v4zfuEe/Zo1c2mTOacfVemG5j4eulcATdeH5RqgC4hKx5HSBJsVIZXoTLjRUiNUTwZe0EfOXaN9ViVRVGnsXbt0zutsq4rRwD8azjBKOuAR40HdlVqnqWHtRXMurhMYSHh4LxgImMXS1K+ejVJk6N8DtUuN4mDJ4ZTKYIXE0gbuoeD9AGyIyWQbqElEXG/KbZLFr68q7DHgwd0/gFfzEiKCRDA2AYzSdjE2DSuQZUBCXzB4MhvvVSfzUbghBYjMioqyhFhKzZjbj7OVlfX6aZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(66476007)(2616005)(66946007)(4326008)(8936002)(66556008)(31696002)(8676002)(26005)(6512007)(86362001)(508600001)(53546011)(6506007)(6486002)(38100700002)(36756003)(6916009)(2906002)(186003)(31686004)(5660300002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjlhVFNxWjQ5SHVmcUtHbXcrR0tHR0pwYUE1YStjUkFFR3g3RmxOcmdKbEhW?=
 =?utf-8?B?RU94amI0SkxFTVY4L1UxK2NHQmVmZlBhTGJCSXZMSmNWNjQ4YnI2RjQyRGsw?=
 =?utf-8?B?Q3FHY1I1d3U1OFNCcU9Tc21PR0hsVlloTkVhNC8vM1ZNK2x3Y09KQlJ5Tjdt?=
 =?utf-8?B?K291OFpYQlAyKzVJUGcyVGFOOW1JWllFUTh0MXljRVBtSGdob0FJTVdmV0R5?=
 =?utf-8?B?SXRTcFlYbE5zamNMUnBzSTFvOGltaTdIaGNVMXhMQmlSeDQ0MFh4c2YvSEFk?=
 =?utf-8?B?RUo3NEcwR3llcll3OFpES0YrY0tUODcya1kxd2l4TU1MN0N4cGlTcWI0T1Zv?=
 =?utf-8?B?WUMzQlJlQ2tBZFJpQWQxZ0oxcHhOaTRuMWhPV0xPNjlvNXJ1YURvTElsenp6?=
 =?utf-8?B?Z2ZSbjh0ZTMwNFFYS0JZdFgzZkVBaGlycDdzM3ZXSWNJQlRtUzlVT25hRm1i?=
 =?utf-8?B?SXNleWlvNUpxb0ZzbGR3ZDZLTGtBTXNyQ3ZFM1hFcHkvREpBV255SFdFOUxK?=
 =?utf-8?B?ZXFFR3YxaXFpTWV0NHhsaXh5ZVZZN2p1NHphYzlvY1ZuYjZBQnIva1NPSVda?=
 =?utf-8?B?ejBkamhIQTR6RENuQVgzUkN5U1N1MmtyOS9qN2xXQ052N1FRMzdPS050RTRP?=
 =?utf-8?B?L3N0NHZoYlZkOTVCQmpJWEJrS3NMdmhwTE05WDd6eHM0Zm9KS2dXR0xIcFBl?=
 =?utf-8?B?dkh1Rk5HTkRqSzBxY0h4eWFqeDVDLzAwSWwxYWVtN29qaUNTajlnQjE2bzBq?=
 =?utf-8?B?cmRwc1N5QkZpSnpPcy9wRlQ3eWpYUHd0NnF3cmJCMVZFcnpiNkl4MWlCVko1?=
 =?utf-8?B?UW1aOGZUaUViVFp5RlZ5ZWJTeEhjcFFuYkRDeHpPNFJhYjlNQm9TLzByTTVt?=
 =?utf-8?B?VzJzRkIzNk8reGJCRms0YjNnNEFLWUxXQjF4UTY3dGRFUjlrQXdML29LNkJr?=
 =?utf-8?B?a2FQci9zclg5eVlVUUx1TWQ1S2tKQ2FmbXB0Q2FYK09LamxBb3d2ajkxbTVo?=
 =?utf-8?B?bGs2byt1ZS9sK3BSSmFFVUJEeC9sLzR3cHoyTEJaNG4xcU9YZEk1S3paVXVG?=
 =?utf-8?B?WStMdnF2emxXWGZhalhCQllPUlRyVjlmaG15WXhQMyt0Umxuai9hdVhHMnd0?=
 =?utf-8?B?akprSUFXQnZjR3VHYVpMWXQzeEp6aWJjNmxwalY4eUxzejZ0djRNd2Q4SlZp?=
 =?utf-8?B?OElyUmIxWXpiV3ZTTGs5SFdLRnhYR25UY1AvcERLZlRXZTFkNXpRQ28zQ3Zk?=
 =?utf-8?B?T0JxRWtjajZLaGhtRzN6KzR1Y3VnMHJyV3dWcFFEd3M5bFp5RW9vYXZhY2NZ?=
 =?utf-8?B?SGd2eGtTOCtZOHhxaTJqMTkzSjNtTklQTnZ4Y0k2bTNTNm5rNEdjZmpOUTA5?=
 =?utf-8?B?Y0ZrKzBaWENMRWJ0amxoUVVTVkdxMDk0RlZFRk1iclFaNVVIbjRQMkhYTURq?=
 =?utf-8?B?SUdSRzNpOXhXbEV5R3J0amtwOTNaZGxFYkpBandYdmYxd0tQSFFGcWpBR01E?=
 =?utf-8?B?NGhpSGdwbUtodC9xb0x0RTlpYjBrdTU5MVRCYmh6WWp3aENhanBXK2QxV216?=
 =?utf-8?B?Y2poOFI0ajQxUGlDa1VMTzYwa1RObFlpN3dNN1lVZFNWMzQ5OWxYYUF0a3Fj?=
 =?utf-8?B?MWdtSW1yczJ5dlhtL0UwbmhBWmZreVFRMWNOVk9IMFE5Q0twa25Hdmd2S1N1?=
 =?utf-8?B?d1ErY1JxZFBmQ2NodUQyeWVUTzByM3ZmODgyREZkTlVRbWxGNVY0bVNUT1Ri?=
 =?utf-8?B?OExyZDN0TkRMTjc2eUZUa0dzMGRrcUVOTGZ0czRMb0RxMlBYUS9EZG1uaGVt?=
 =?utf-8?B?WG9UL09reDQvRkovOGw1N0VnUUxMVlV1ckowVWVqbW10K0hDU2lET3lLejYz?=
 =?utf-8?B?VHhZckM1R28rKzRDSWxsVXFremJrdXJ3QU5rN3BObll5MGlJRHRhdERpVnQ3?=
 =?utf-8?B?MTRIRGhYSTNkL1l0OVErTnk0RTN4VlZpUHk5ZlBxRDV0UVUyWEkvaWhBelhO?=
 =?utf-8?B?UDRYckpEaE9TalF3Y0lnSTJUdmxNYlRKQmdvcFd0T3JWZUllWG5hRnU5UnJn?=
 =?utf-8?B?cHZwdXoxLzNFKy9Yb3RzVXN1RDNnWmROZFJ1VXpuRkNBbTlRekpvb05XaEtJ?=
 =?utf-8?B?czlLWEZTUjR6QzVHNVZVTm8yOHN6TEtucmtHOVJSMXVidlcyV3hxUnJyQ2U1?=
 =?utf-8?B?ejRFV0cwdzFiWGRpaVhDb0p4d3FJRjE1cTZFVUt4MnBjaHBIcjllb1N4SVZq?=
 =?utf-8?B?ZWw0cHIxZ1RsRFlHM0JUVnRKS2xQb0xsOCtoMlJqcmd3L1JDVXIxVGRMem13?=
 =?utf-8?B?cWROZXgzdWN0WVdSOG4vck1kdVp5UHV3YWtvSkhxMDc0aWY3ZzF0Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d77d3b-118a-4bb1-1db6-08da42e46826
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 09:03:19.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVT15eUC3HrlVNXNc25XNwJQNzb7mnqZs0oif/wRC1jGYYauUYlnHp5xblTRpXafw2jw1upRq8Pu+Gep433PMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4389

On 31.05.2022 10:23, Yuanjun Gong wrote:
> Free the table[i].sym field of the invalid sym_entry since
> it is malloc'ed data.

It would help if you said whether this was just an observation from
e.g. static code analysis vs you actually having observed the tool
running out of memory. This is a short-lived process after all, so
"leaking" memory is not normally much of a problem.

> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -422,6 +422,8 @@ static void build_initial_tok_table(void)
>  				table[pos] = table[i];
>  			learn_symbol(table[pos].sym, table[pos].len);
>  			pos++;
> +			} else {
> +				free(table[i].sym);

Indentation is wrong here.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EBB753DC3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563678.881059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJyq-00008T-V4; Fri, 14 Jul 2023 14:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563678.881059; Fri, 14 Jul 2023 14:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJyq-00005i-Rb; Fri, 14 Jul 2023 14:41:12 +0000
Received: by outflank-mailman (input) for mailman id 563678;
 Fri, 14 Jul 2023 14:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZ6j=DA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qKJyp-00005b-Iy
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:41:11 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2084.outbound.protection.outlook.com [40.107.13.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 791dd57c-2254-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 16:41:10 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:40:41 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Fri, 14 Jul 2023
 14:40:41 +0000
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
X-Inumbo-ID: 791dd57c-2254-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lH/6N6NI1YGBsBsHZgbln0EYwciZkBRewVvGWlDKiyf98wSTk/Y+6LKbG1pNLq7gZD3IsVoN9jmoF+IP29Nq+eWeIUk8AUPMjlmLqOaha+DhK09pCmiv3xr1W53aq2Ik7Y8XG4FONw5VPiI77IxEeEt/pRTsGhNG7KpalTQotbsQYNV/LWcBNA7IKzCtaNXIiIopkgAYoS/WZvJk3EzU+N/IgZbl75m3fU5NJHGHFJfjkrsarfguTcvAQll+NLFnszvg+XYJxbOlPIi+CsmNE+uQyeUhpMtWN5kfTD63b/fzh+GKlX3b+kWZKwMOXf2WSmYpHooP63AaIJEqHocXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9xcCZ5bULcjU42W+HOvGot+c19JR3wgzQ1lNA+t24M=;
 b=IC3y1NIuKY4xOcatgLjjW/BAhylsByywPVUpqpXoQG+urC+NEGBEs2GXLkwZciE6/jd1wrrEpqtvgHWagA/FVw88qGt2ttN210Ma2VCY5sjpzjbXo7O2PhbKkwYzYqVigqGoT3JioG+1u8xnTEIxx8fQruJNWRQ8Zeg31qxseIPq9OMp0zRexCnJWWZHxM6nq7K3wQaUf5fbB8zlmRd211J4p72dZAOhFM3BMkS8SkI3WG4Jx+TFwADB0OKy1rD4Enp+V4+vwj/PG0v1ykOCKusz8eeJJS82Mq8ScugjZvgJSmp370HZu7nEdiPzVlUeyXGQ7/I8s7SqBgu4MFThQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9xcCZ5bULcjU42W+HOvGot+c19JR3wgzQ1lNA+t24M=;
 b=RdikRxh6r9CUMMXStt9Ht98pZTyNzBmbujVPWpqj6sZlOk3b9otuljjqtLevKtL4GrOTXX7WRTuXTHDn79r3xoYv57haCsoogpyJG+SaAtHeIaKUKf6N9y6a6rt4EAM0WSXAGl1II8QjD9jdVWvIS3zP0aODkhF74J+qe+i0qCwr5dV/e26rOfuzLDARWpCmTXW78+yuwSGwt9gzGg4Qc1SYrwaP9Igt26xl7o2JsvNGB31Cfqr/Ran4OYdPvnrZ9K/XvMfHhda6jorvY+vawb8hGiINMDmYIakv+au4HTOxfEH9Gg5G0L5rB7QU6Dh5IkHBgfLy1xS1gpgHtcnW0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <792966c8-835d-d388-463e-e341f7975419@suse.com>
Date: Fri, 14 Jul 2023 16:40:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/ACPI: Remove the acpi_string type
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Roberto Bagnara
 <roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230714130411.3055187-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230714130411.3055187-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cb3cf1-ef75-4999-ed71-08db84784c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4sunRXq2DEX08bXKj6k1eMXGQb3gv7yxSl2jAV6L2IKdWvt8QsLaM3lajfPb3xu9cMbo+SLb6wzHxYE5IMDXdxigkCfBWKXSbHuJCSbiGuXJmPn+BbQtAfrBvc1NfdmuPWTykfHIc5RA0PY8c/Vr3E0ITV6ZQkAK3HRrsXMLy+bK0et5EvWfahVKXJnw8YHB6CWWrtbwts2UOlkyUU0Su9EeTeI+D5bsAvH1H8VCE5qn5aWDJr3hB4UcRpRebnYrYEoq3Ed1Juub89EAS9UCx8RFqfQOfyaDsbpyT8l8THIBuNHGjooQyqkLiYkJE/SvlPCSGx8RkmFTjRWteWEwu1OCg6ewd3ILQp6Vp3AUajq3qpwZYzLBh2OyRngwhWfcCRu/ldcrnNeF5XvHCDTozKX4tsVEBsvjrOPPjBCc54QgfkWwof4mdQwtWEshVSuwCmUoB8/WZzr5kDFit02VUF5lBPNPUwoGEd011ggyCnPVGvQMhCj1ynzC7Mdd4GbnkT0VNCImZlIgHamvCIlLgdTEFwftI4sS8tfn8Qxfb+PsST+QSclL1yjTbcqwhVcJtupa0tEae1d83pgvolAjnnG4nE+4VP7HEXwOqA9ZWhzZYhgKFTCvrH0H6VTqjoG6B3jphOgkbtIKPWehi/cHIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(83380400001)(2616005)(478600001)(31686004)(186003)(53546011)(6506007)(26005)(6512007)(6916009)(4326008)(66946007)(66556008)(316002)(86362001)(2906002)(8936002)(66476007)(6486002)(41300700001)(36756003)(38100700002)(54906003)(31696002)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkFsemhjWnJaTTBWMFlTbHZBM3VzZEdnR1JaUWY1WnBzMlFCRksvdmQzVTJn?=
 =?utf-8?B?alVVeVpkalNpaGMzRUR1QWxUN2hQbkkxWkJtcWc0TjhSUFVjbk1CblB2bEt0?=
 =?utf-8?B?RWtOSFJaODFJUWc1L0RCbGJvT1JGbndjeTVQdkwzTWZ1K3MvZEZVVkx0bjgz?=
 =?utf-8?B?cHA1RXMvclA0VjU3cmZjYmUrLzl2OXJ1WWJBblRocjF3bjBMV0tEMWQySTBM?=
 =?utf-8?B?OFcrazg2L2REMm9rckFOQWJRTTlMSnBxMlBJZlZtVzcwRUV0LzVmTVU4aytI?=
 =?utf-8?B?cWYvTy9oUmgwazMrNzM0eTRkYkp2UU1YYXE1bWg5eFh0Y3VaeU5NVkM0US9Y?=
 =?utf-8?B?UFBQS1hRUEJQcDRBUnVtQThrbEFaZVBad1pyVExHVm10bE9VZ2xiSnQzZmtY?=
 =?utf-8?B?VHFRTGtQdHVGOXdVQXI3aUcvRi81RkhYUnZ4c2RiRW5tK29ueUxMZlFZelNi?=
 =?utf-8?B?TTNtRDkrdUMydCtrZ3FobEd0WDBHYlM2bXVKL0JaaU9EY20wYmhFQ2xpZmkv?=
 =?utf-8?B?T0F6YjVEcGFqYS9KU1p0U0k0d0dkN3M5aGgzNXhvSU1OcFV6TVJlVzhYQW1T?=
 =?utf-8?B?T0NhQXBoTVZMNi9TTUxDNnJNRmpLTnY0ZDI3NEE1Q2Q0R3JKTSt1OWFBSXNx?=
 =?utf-8?B?cHFTSFBMd3UzNlg4b2RFRVB1ZVdiMWhpSVBHN041ZnppWERPSDllbnFyZnF2?=
 =?utf-8?B?YWZ0d1daTU1aODNlcGxOQ2toR1dZcDM1THcyV2dMODRSMWtFZWRDaHJ2Mnpz?=
 =?utf-8?B?bXl1NlhOY2Y1a3pzZldVT0xMZ3VEQW5xanRPSVEzMlU2MWdIb0RuT1daWXF6?=
 =?utf-8?B?YmJwYWF6WXczaGFOdmJTR3JnbjhyNkJ0c3JtNEZ4V0ZMelp2YTREcUw1clUy?=
 =?utf-8?B?bmloRm5tQzV3cld5NVFOdXhDZ1BlczBrbldxSkRacW5sV3FCUkRoKzZWeDkw?=
 =?utf-8?B?QlhwcXFqOHVubGFRbWVFSjBXRWZHVDVaVzZKUGxtemlsc21OdDRlUXJ2V1dL?=
 =?utf-8?B?c2NlZ0xibDc4eE5meDRrTjU3aVd3MkIyNFZXNXlZa1ZTYXhGaWFRWlhSWThI?=
 =?utf-8?B?Z3kyZ1RYRXFYSWZPc0lXY01FYWJiRjNaSWtuOHJCbmVnSVVZaDRzQWZnLzJn?=
 =?utf-8?B?NU1melJ5Mmw2V0IrVHlLODRUK29LNVhNeVhnMGR3bTFkYzJwcWpmV05QS21X?=
 =?utf-8?B?SW1OOWJ1blJxbjZIZkxwbDFRZ3ZjZ1dPSjVKZGZ3U1UwczFuR1BKRzV0RnR4?=
 =?utf-8?B?WnAxb3FyZzlyOWlKcG9VTGtSRmRYcGVId3JINUtwUS9NMis5ckFrdis1UVVG?=
 =?utf-8?B?eG1oTmVXanNnMHJkcVFDbDRiRC8ybGpqNWVsbnZwSjBpNVIzMkd2MDJEOE9t?=
 =?utf-8?B?QysvRExidktFZ1NUK2dvLzQzT2pTSzNQSTZzV0taV2pZVTFsQktGd2tIMEtZ?=
 =?utf-8?B?anZxSEJObXFtblNtcCt4c2RqTzhaaEJPTXdYUDBqQ1B3V2U1cFhVNnozb2g0?=
 =?utf-8?B?S056VG9PZGxlcE1IL0QvTUFHYkl2MEgyUURIb082czFxaHV4ejdWa1VzeDdw?=
 =?utf-8?B?TnVjWndPM093Q2gxQlYvNnZIYkh2Uzh2a2ExanRkTHArejlycjdLNjQwUU1K?=
 =?utf-8?B?N2tpS1FiamhFeGlRUDdTR1ZXYzMvSm1kT0FudEY0WWh5TUYyZWxLajJIcU96?=
 =?utf-8?B?OW1EV1l6cGdoSFVuUERiT3Jad2Q3aGc0NkE1Q2RrcHErdjQ4Z01CajB2b0ow?=
 =?utf-8?B?enluUFFraGFIem9DSjc4SWxDNFN2RFdwaGFvN2ZpWXBiQ1ZQL2lOQi9hRHEr?=
 =?utf-8?B?V2JBT2xKVTVxeEJXckpJdnlKZDJxcXYreWkyeWdqU2c5TGhwcWVkNkZ1Szh0?=
 =?utf-8?B?WjFqUGZIaDA5ZjlOZytXYzhwQkliQnRUNkRkb2ozekVJMW9LVWxQSXhTNG84?=
 =?utf-8?B?SHlmU00xbk94OEQ5Zk9ZaEhkSEc5MmZsR08xZEhBZVdpbThXekdsU0pNTkNN?=
 =?utf-8?B?bDJRSEt4RWIyT0lwb1o0RmRmRWJZNEJkUFR2bXFNLytWZCs5Q2pLc0VYaExY?=
 =?utf-8?B?UU9xSE5OUXBwWEE4a2tNZFl3Ti9RV3VNNVJyc0tNdHRmZVhVNlF0ZG1QRnVE?=
 =?utf-8?Q?hcHUrhr9w9PB7pGfazz0GI6Xo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cb3cf1-ef75-4999-ed71-08db84784c2c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:40:41.2988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7hymnpSbj8xFgX7qWoZt2KnqIYsGzsdrSNEt7B/RIxKiOCMvghYTESaUOfARM57W8lP9KXv3mW5Qhx98kuEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308

On 14.07.2023 15:04, Andrew Cooper wrote:
> Typedef-ing a naked pointer like this an anti-pattern which is best avoided.
> Furthermore, it's bad to pass a string literate in a mutable type.  Delete the
> type entirely, and replace it with a plain 'const char *'.
> 
> This highlights two futher bugs.  acpi_get_table() already had a mismatch in
> types between it's declaration and definition, and we have declarations for
> acpi_get_handle() and acpi_get_table_header() but no definition at all (nor
> any callers).
> 
> This fixes violations of MISRA Rule 7.4:
> 
>   A string literal shall not be assigned to an object unless the object's type
>   is "pointer to const-qualified char".
> 
> and of Rule 8.3:
> 
>   All declarations of an object or function shall use the same names and type
>   qualifiers.
> 
> and of Rule 8.6:
> 
>   An identifier with external linkage shall have exactly one external
>   definition.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




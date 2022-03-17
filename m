Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F24DC8A9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291617.495071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr0r-0007We-B0; Thu, 17 Mar 2022 14:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291617.495071; Thu, 17 Mar 2022 14:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr0r-0007UW-7e; Thu, 17 Mar 2022 14:22:01 +0000
Received: by outflank-mailman (input) for mailman id 291617;
 Thu, 17 Mar 2022 14:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUr0p-0007UQ-M1
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:21:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a650faa-a5fd-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 15:21:58 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-MgmPDf2yN1G7wTghHMdPlQ-1; Thu, 17 Mar 2022 15:21:56 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6537.eurprd04.prod.outlook.com (2603:10a6:10:10c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 14:21:55 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 14:21:55 +0000
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
X-Inumbo-ID: 9a650faa-a5fd-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647526917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtsCjFJy3SAf5+62VquVWL7CN9CufFRJlebFQ8TFX1I=;
	b=RfkAhhRNqZFvVCH1MNBDjv5Rnfxs90+VsxEu79IX605Bt51q62mxZu0dPqbO6yGPufgHKF
	t5fZpsIAoYpsSI1Fpz9+Py9rFfIHnQLjW0JYqIA/35Plr0tF3L1t64BOjuZ+34F3eRL5Fb
	GXQf/a6eKXPfBnm5HBJ8x6Q7abyGEgE=
X-MC-Unique: MgmPDf2yN1G7wTghHMdPlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drPH2deXTHslqJEWFKk+1UnXZ5JeC2pgMiIoe78M/83run3ae7yhpEA8bibjqKpQLtDMik2k0r1xEoqH/5e4vBAP8cwLsLCHCCU7A0S/z8qAAdIGqCY0rPoaXgNZODWh1KegoUKbVWDpAtrsnmUNngAjc3DgGSlLAHAXHcvDqBPgCpQQJdsApvUUUiMeLI7HOuse0X3WuqZI/6f3EoA+NuO+oodcRbuPvg9Z4q3kR9GePcup3gbIokINR+J8oS92oA2X3kMJKoYC+PkP0tp5f100IRHGTB3R1FC+LxT3R4Iso7+JTcotpeGDeoVXktph6EveNCbQlKCM/dzIyzICiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtsCjFJy3SAf5+62VquVWL7CN9CufFRJlebFQ8TFX1I=;
 b=Wp1MMxsUqWShtqv00QL0wpCIHodBxTlis+frJdDxtJS0bzaoHDp9T3K6Qasyi4Wd5P8UWyIyOvBx7IM9IIij8XMn1DRWhQwZBghyH/U5CaoCSODIfiKtq2onGRNOZLddurrur9yu1tYOOC7MMAA/9Z4i/2X4RqQKd5Z41p1WLZVTtvGHDH216hzBKyImHqzBiUNTEQqk3QDZC1exi3NBHC40d+P7babRSVMG7yjhXb8O4OrQCRr3X8+lHqZ269kBBdBz8gvLY6pH3yRHUj8H8vICenpL/kIJKhrKjpSgqSEWy0WFldD7XUPnThNDQUWO3ZpdSKB/Lv/MTxf5uS/kfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cb4767e-4ea8-8a66-0e12-b5b5fa6bb1dc@suse.com>
Date: Thu, 17 Mar 2022 15:21:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] x86/cet: Use dedicated NOP4 for cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Bjoern Doebel <doebel@amazon.de>,
 Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220317140624.4258-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220317140624.4258-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0032.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::45) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2b41dc6-6b41-49a8-d25a-08da08217d1b
X-MS-TrafficTypeDiagnostic: DB8PR04MB6537:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6537EC26FF9518F00AC7F8A7B3129@DB8PR04MB6537.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1WndknIAoxhXWa97bnW8Ezyg8PU2Z4RPEpi0elUn19Tz8/KVQJklMLFOWrYlw0R+SeNfFEHK2/RPxuFEtRSe8zL+9CqQyQu/TYIhDFZwh3hpQhlRxCVBSTQnduVsFFGCvImz4imF/VJEQCkvolGbS9oPx5k/mgRXZiQJHzh97WqxU16JD/DjGAfEfNpQQ0zaWBHwNYNNs43N77E4vGC5TreYL1wZ1S//r8Ixcld9NNj5jGLIqQv/ivNrXYFCdYQ24JFpoVjZvYvenWMVKsRBpUoxcCu4FKwJnteGDOhGTgqPc2CVPtm5nC52S55Y+3NAAjfjOTd1DEHNx5aT4yg5d56cld789mZgYYSUpHSqC2p2PuVEEJQghU3hSMsTtxLZkYYrlGZ7wVtSQSLINP8CY3lzkYSGDdZNRwirtpv/4yJs9Jqbdyp9segQLGWnrSVeBOkju0qLnjiezxCeBDDJNL0PF9pF/JkmNMANu2iZ8oDwS6rD0nlhVmXisSmD68CnTFabDoecdilt879aOSFcwPMhSL+ZfJdlHpUYZ1RYW4TkIWvtwLkhJhGTWpNG596yrHkTI4FfFPhl8kKCkju+76VpQhhR423RGIs8GrD0aMfW7d78nUsOJbiWm+fYNkuEVD8jwz+03tQ6EV4p+PPDpCGDWlAZS7a8DWfltcynzZw6wwz5t7X6/2+eonHX9V+EDDRKcOnjINXB0PoSpEUC41m5TPOMOAUeg9BDpV9YUYau1rvdQBbm959eb41CBo2Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(86362001)(31696002)(6916009)(8936002)(54906003)(38100700002)(66946007)(316002)(5660300002)(8676002)(4326008)(66476007)(66556008)(53546011)(6512007)(6506007)(2616005)(186003)(26005)(6486002)(508600001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVJGakVBUkxPcWJUM05RbkhUNnY1eWlmTk9NUzZUZE9CUUdseUprSXJlS3Rz?=
 =?utf-8?B?V0Z5V0V4bzdqMjg0NHYvb3dLSEVkbWFWZDQ2RzVpZElkOVVpWVBtSzVETDBK?=
 =?utf-8?B?bnJKWm9xbG1CRG5SL01UeXIvWGJMZEVSTDJIN0hPa1hITE9BbVVlcGppTXZ6?=
 =?utf-8?B?V1ZIZ21DRVF6eCtsT1Z2YzVOSWlYTjFDdFhsMEhiNS9ZTjY0RWg0M1U0bE5Y?=
 =?utf-8?B?K0FsbjY2clZhMTNod2hFcVhiVDJIaHRNM0JlTmtzbHM4S0NiN2tMQUhNNXAx?=
 =?utf-8?B?d2V2V3ZtMTBxRmxiejVxZFhsOGlkMSsydFVyOHI2S2VqN1RrNHdnbVF5U0g4?=
 =?utf-8?B?ZklpNExlQ3Q1Y29hOXdGTGF5OUpNeCs4cHFlRzJUeGtTR3RLK3hLcjA0T2po?=
 =?utf-8?B?bjNiWUVDSTFpbkdLR0Y0NHVuN2RIeW9oUVVFMko2czA0VDlNU1lSNDNMMHFF?=
 =?utf-8?B?S295MFNzeFIvVjhlbW1vQ0Uvb0NsOTVyc05wd3VCTFYwOE81UWZGWWJ6ZUJp?=
 =?utf-8?B?cVE3RzYyNktFdVo1WitvQlZBa2hMM0VDOVB3RFZ6bFozanUrbHdwOWZEcHhv?=
 =?utf-8?B?aHVCSkxJZDlnM2pTQUtjRnc2QTBIY3NTK1plTkJvZnVBSzZYRytEYlBJd3ZM?=
 =?utf-8?B?bUlKWDRPelJEcGNnYUt6Tk9HSDhmK1VqclZHZFdKS204blpNOTJ3dEFaY1dI?=
 =?utf-8?B?NFFrUFYrVjYyVVFjSGZxdWNZWDlNTDQzcjE3blMrUldscGpqOUpiajkxU1RI?=
 =?utf-8?B?eU1NcjBaMkNDbHBMb3hKU09hcGZaaUZjckcvczJGRWlsNTd2YXBoV2VUZ0d3?=
 =?utf-8?B?S2hRdSthSDQ3eS8zbFdHK3JWQnFoZ3N2ellrelV2RGd3MFFFRTBwUWVnNG55?=
 =?utf-8?B?THAyMy9UWEljb05EaHMyNjIvSzd4eVVsK2szV2F4NHpLK0dyWEs4bUE0em1E?=
 =?utf-8?B?clA5VmVQczdNUnErcGswL3U3aUVpU0lhVkF4SWI4TWhJeCtLUVhKOEh6MkNG?=
 =?utf-8?B?WkhvMURlT0tSUU1POXpWZXYzUlNJSXNFZFNLQkRzaXA1VkppT0s1UFZmWW5V?=
 =?utf-8?B?MGtBblRHbWNQN2ZOZ3cwRGdzWXBCMHpLeE41amZteDZuWDhkSWpmNnVnQk0v?=
 =?utf-8?B?Wm55TmI3blFvWEM1UkdLMEhyS0pBWGlOdDN3eEJGV0FtR0REVmVpdVZSQjk4?=
 =?utf-8?B?WnRqdjQzdVRZNzdrT29GTGIwYUVZTEpLL05MM2dWRFRmZEwwY2dRRUloYUww?=
 =?utf-8?B?MUZ5dEpzemVvVUFkajR4R3diYVg3Tk1kdnNDbEhMZXlJdm9sVjdQMmVvY3h5?=
 =?utf-8?B?dzlXMXhZQ0wwTERVOXBzOGQ0eUpxbnNFc1pTR00xUnFndjlkTE5EenRPM252?=
 =?utf-8?B?cUJQSkJ0UllYaG1uZXppWlZrQldobEpJbGtJTHkvRnhseEI3QWRQUlQrUFZs?=
 =?utf-8?B?QkpLNmhlem5DYnFtTVBtUTdLQ2o5MlR4NGlXai9SRkNEejdUc0xWbkFFSE5o?=
 =?utf-8?B?b2JIVFdoZzlWd01xQ2J2bFp5cGVkK3pPbFhoMXM3OHJLRVg3UlhRNVNDNkJM?=
 =?utf-8?B?WGp1R2RJVVdZT3BVL3lVdlZIanRCcEVtT0xveUgvTzNtM1VhQlgrZzkyRTlu?=
 =?utf-8?B?ZW8wc0tiUSt2SnlvcUd4bXBQSzFtTEcyNnR5K1lDc3J1SWlGNzdHT2R6QUND?=
 =?utf-8?B?UTdRSjlNRXcvQmdGNjVOWWJkZytRWUpxSkVnUFdPN2pwZ0licXBDN2huZXhY?=
 =?utf-8?B?MEwyTDh6V0Q0eElLTXFYQVJTM2g1aTJFbjBCdGpJODVaVGRwdHdwajVSSHI4?=
 =?utf-8?B?RnNuYzFaajhqK2N4b3MzTFZBUEtFR0crSVJjYldZYitwaHZoM1NPckZGWmRr?=
 =?utf-8?B?aE9MY3A4OHA5cGJ0ZEJIRGFhaUFoUmdvOHBWWFhuY1RqZlRIbnZ3TGN1a1dh?=
 =?utf-8?Q?WmCOq1qEzxn5z4UgZ0Jh3F9NdDpvqSuF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b41dc6-6b41-49a8-d25a-08da08217d1b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:21:55.4507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gP/eUG4AZW/GmjYlEtpBccGisooua062QTTbctpBMamBtZjCYVQP/JkBTuciJgJ/IyACVgWwOzyRQfQ5jtnEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6537

On 17.03.2022 15:06, Andrew Cooper wrote:
> For livepatching, we need to look at a potentially clobbered function and
> determine whether it used to have an ENDBR64 instruction.
> 
> Use a non-default 4-byte P6 long nop, not emitted by toolchains, and extend
> check-endbr.sh to look for it.  The same logic can check for the absence of
> any endbr32 instructions, so include a check for those too.
> 
> The choice of nop has some complicated consequences.  nopw (%rax) has a ModRM
> byte of 0, which the Bourne compatible shells unconditionally strip from
> parameters, meaning that we can't pass it to `grep -aob`.
> 
> Therefore, use nopw (%rcx) so the ModRM byte becomes 1.
> 
> This then demonstrates another bug.  Under perl regexes, \1 thru \9 are
> subpattern matches, and not octal escapes, while the behaviour of \10 and
> higher depend on the number of capture groups.  Switch the `grep -P` runes to
> use hex escapes instead, which are unambiguous
> 
> The build time check then requires that the endbr64 poison have the same
> treatment as endbr64 to avoid placing the byte pattern in immediate operands.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (which likely I should have spotted before):

> @@ -45,13 +45,15 @@ echo "X" | grep -aobP "\130" -q 2>/dev/null || perl_re=false
>  ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>  
>  #
> -# Second, look for any endbr64 byte sequence
> +# Second, look for all endbr64, endbr32 and nop poison byte sequences
>  # This has a couple of complications:
>  #
>  # 1) Grep binary search isn't VMA aware.  Copy .text out as binary, causing
>  #    the grep offset to be from the start of .text.
>  #
>  # 2) dash's printf doesn't understand hex escapes, hence the use of octal.
> +#    `grep -P` on the other hand can has various ambiguities with octal-like
> +#    escapes, so use hex escapes instead which are unambiguous.

There looks to be a stray "can" in here.

Jan



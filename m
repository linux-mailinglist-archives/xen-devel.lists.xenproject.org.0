Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805F2036E9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 14:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnLgL-0002c4-3X; Mon, 22 Jun 2020 12:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnLgJ-0002bz-QD
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 12:36:11 +0000
X-Inumbo-ID: f27881ca-b484-11ea-be86-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f27881ca-b484-11ea-be86-12813bfff9fa;
 Mon, 22 Jun 2020 12:36:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUegx7t13yIqVFmrh6EF9tAeP+6Fq+p+YFuSl6HDNEX2JJE9y0ZHKE3QuZgtnBteRktXVr62f5O41iO0Qqtfj5/O3ehogCh5M4sndiJARi/XEgVpL9zvVeTstdLbMNcD7kGjYTsC7eW0kQmTDvsQdfCGCd7RRu4xSGFo2ttH6unqHcy2F77NAgMICRFaLI9dwxdJbuAwDDRoVuWB0kEY3vwaFyxjtrRg7g4C30QOKTeXluIOxezT5X2VSvZoqCeJzGqC+0uUC8qPlhbrxVTMBi+9YQlLX/uuqSrjlGCbllrt2KJ84QJDXSTSE92II23O6YawCvXWLHniBy0aSpw6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDMm5egDgN3EYbBLG3djJ7VTHj0NgvGfUORgRWj74og=;
 b=ciDUrRFH57g29/kuErccHMdODURGYOntHkK3agpU+Mm3xWxJizEdoLt+cLHmDC98wu3lzISymZ+zAR0bjWgtO/LD4LHpqBDdeNvpILkygg8maBxkPhS56YxYYcg/A9b9mZjWVAWF/zbSoovY0OYORsmCRCToYAjCsMLJwQA2tFlkhR5njFpe881jWObdjW6MxtZkp+Yp779kAuCOzZdbcl32qkK53eoO4yd/AbpYekAPO+jdirSzJR91iOubfT5/3VwC383b8EulS9nBB0WwWXwiaZQ76LfEY6SE1AG1W4n7cwKb2z+qDFLrb2VvcSYVc5BvcZdYywRceTSxuyuxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDMm5egDgN3EYbBLG3djJ7VTHj0NgvGfUORgRWj74og=;
 b=fVzenMpBTvlE26JOnsVn1vKvUc/uVYQStFc5p4sHUL4R15JUlYoDB045xeiaO9OnMlFBjDNB/q67CpvwGF6YlLk4fI7re7Jm4yIl0ITP5w8UtULUVonClmdoG+lt0vEgCsJMP/un0eTMSOGHfblDJWrRRjlfSCbKm2qjUCwe43CyP0r9Zy4La7OGOsfxxdT7gTanKJAUr7ycBs3vsw4ub/YtsGrDWUr2s+YIQ8oQH2oBbwnj3A1g4ig5pKoGgP/1omP8cGwzMjne/boqlXkJweOUdQFWd2izDk0SW26IU1zVpSduzNQwLZR5Z29X3FDoRT/6R6RxG1aOeRVJf1hIYg==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5583.eurprd04.prod.outlook.com (2603:10a6:803:d4::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 12:36:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 12:36:06 +0000
Subject: Re: [PATCH v2 2/7] x86/vmx: add Intel PT MSR definitions
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <61296395.9820908.1592523575731.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5cbc6d81-03f3-2c24-4d6e-5aba458ebfc7@suse.com>
Date: Mon, 22 Jun 2020 14:35:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <61296395.9820908.1592523575731.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 12:36:05 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 827dd706-6302-4357-eda1-08d816a8d563
X-MS-TrafficTypeDiagnostic: VI1PR04MB5583:
X-Microsoft-Antispam-PRVS: <VI1PR04MB558327B3BBE7B726C5DAEBDEB3970@VI1PR04MB5583.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FpxeuP5bUSqpgmNPQMHH5frKhdZJfsbVcXa1atR53M1qLyFbhQogXavq0PvZfcSVK3oBqos08XPE/zIZ1RARyPP+XCIPwA08jvaYYX4AnUYDbk5VY15lZ2TN7/4/DXwshbg/wmp101sRxH0Z9HKQfn3r4XJOAFzL/rTn5jXZnq58Qo0DzO8uc3QiAK6/OpE3Anqm3+NHHj0KfBGD9r7agz+F3V351+C5vx5Qo1OeJncM3UeMtycvdBaLc+719fUT+KKy4uTwlwYWi1CNSGEECm4xjgTQWxghBcDv2i/ezrRGorw/b4hGXdhP/wmBf9YX/U9pNd3ZlI1hn1E04q3pbRR604cD/HqN06Cj9km/1wElR8DrARE0L7xajE43VDX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(346002)(136003)(366004)(396003)(86362001)(8676002)(5660300002)(16526019)(66556008)(66476007)(66946007)(8936002)(26005)(186003)(36756003)(2906002)(66574015)(31686004)(4326008)(31696002)(52116002)(478600001)(54906003)(16576012)(6666004)(53546011)(83380400001)(316002)(956004)(6916009)(2616005)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZyPVAIMn1yNwH9GD0kPV4b56aE1G2rG83s7pgwP2nmtLwCx9hSA+w5a93kMPoUfeQIuyaOsVX90NwMrT3pTQFDjjai5YMu1b6NxkUDWTfqHhFlTvmtTrIZB2NeIdplAnazOeV6QO/DGrJxQDA7rDrPo9oSstweL9lletgHfh147JlDrzMJozh5uJSndfTEaQz88QFqS2gtSmITQpvAKw/P/612zFlnvgP4TBkqZMARTjb04lkWqPimmJqH+VyqqLwYG5nmKiUWsuQat44p86HJipvMzyGWcWregs1UJt1FMM9qKBuPFNQNpr6j39kfEOKv5W8YM5EPAhHc6kPux1a/+Ojq6mVEHBVcDfvSjmh1GDbJDpDJ7lRUul6WJfTArOdbNgUNuXyv6rAmPGNnvhPAXWuOAyg3zZDFHz9n3ojlSyqKSE9kJjCdZRz1ZkCO40GuXRlmsy+J5Kthl983cfla9o8tIzQ0VCAhTTPzeZ72o=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827dd706-6302-4357-eda1-08d816a8d563
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 12:36:06.4267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOwzU7L3v93BixDuo1ppQGwIM9HKZmj8YcgQTd5sNxwJUaOcJG4Sdgih/wpKo9S4WX/65A8h7xWTUVQvrCJGtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5583
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Kang, Luwei" <luwei.kang@intel.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 01:39, Michał Leszczyński wrote:
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -621,4 +621,41 @@
>  #define MSR_PKGC9_IRTL			0x00000634
>  #define MSR_PKGC10_IRTL			0x00000635
>  
> +/* Intel PT MSRs */
> +#define MSR_RTIT_OUTPUT_BASE           0x00000560
> +#define MSR_RTIT_OUTPUT_MASK           0x00000561
> +#define MSR_RTIT_CTL                   0x00000570
> +#define RTIT_CTL_TRACEEN               (_AC(1, ULL) << 0)
> +#define RTIT_CTL_CYCEN                 (_AC(1, ULL) << 1)
> +#define RTIT_CTL_OS                    (_AC(1, ULL) << 2)
> +#define RTIT_CTL_USR                   (_AC(1, ULL) << 3)
> +#define RTIT_CTL_PWR_EVT_EN            (_AC(1, ULL) << 4)
> +#define RTIT_CTL_FUP_ON_PTW            (_AC(1, ULL) << 5)
> +#define RTIT_CTL_FABRIC_EN             (_AC(1, ULL) << 6)
> +#define RTIT_CTL_CR3_FILTER            (_AC(1, ULL) << 7)
> +#define RTIT_CTL_TOPA                  (_AC(1, ULL) << 8)
> +#define RTIT_CTL_MTC_EN                (_AC(1, ULL) << 9)
> +#define RTIT_CTL_TSC_EN                (_AC(1, ULL) << 10)
> +#define RTIT_CTL_DIS_RETC              (_AC(1, ULL) << 11)
> +#define RTIT_CTL_PTW_EN                (_AC(1, ULL) << 12)
> +#define RTIT_CTL_BRANCH_EN             (_AC(1, ULL) << 13)
> +#define RTIT_CTL_MTC_FREQ_OFFSET       14
> +#define RTIT_CTL_MTC_FREQ              (0x0fULL << RTIT_CTL_MTC_FREQ_OFFSET)

This was a fair step in the right direction, but you've missed
some instances (like here) wanting to use _AC(), and you've
also not moved the whole block up above the legacy line. As
Andrew's "x86/msr: Disallow access to Processor Trace MSRs" is
likely to go in before 4.14 in some form, you'll want to
re-base over it eventually anyway. You may want to take a look
there right away, to see where in the header to place your
addition.

If you look further up in the file you'll also notice how we
try to visually separate MSR numbers from bit-within-MSR
definitions.

Finally I'd also like to ask that you omit all RTIT_CTL_*_OFFSET
values. Only the _OFFSET-less #define-s should really be needed
- see MASK_EXTR() and MASK_INSR() in case right now you're using
these for some open-coded shifting ...

Jan


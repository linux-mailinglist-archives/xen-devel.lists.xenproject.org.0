Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7273120349A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 12:13:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnJRx-0006io-LQ; Mon, 22 Jun 2020 10:13:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnJRv-0006ij-OS
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 10:13:11 +0000
X-Inumbo-ID: f91ceef8-b470-11ea-be67-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.65]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f91ceef8-b470-11ea-be67-12813bfff9fa;
 Mon, 22 Jun 2020 10:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR5JBbEA45jQ11tvnYYANudscsx/5bEMetrsX+mQ5Y4PMcjnmG+0gv6LqW/g7F0DBzQfxmuFH2wkysQUEwNKhziKNG/SmGv+RRGSS4EERu1DUwUzahy3vgIYifejtwgcJT7spyqJ0JKhArFbxEhL3+Ve8EZ4R9172u3h86K8MKI5Z7FreTMhy3dzlMNFBoaOqPKoYWJ7Sxv1Gu6PmhMWWk6ezykfX02RaR7jx+kQcQfX6tFzeWfMuldNOUb1L/U0cHjptbC5wqL9nQUXCdZrrHlzd08SXgVPQbou6S1yvr6tO6L9TQR39AtlHEwyolwgop8dynvIJ215CrW5uGJ/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+UPrxyc4/+1Zs7EAwGKH1DqHIk5F3sdmAc6aSj1IYs=;
 b=JBpUE+U1oul/FEAc/Nhbe632S1neW4Qf2zQxoY3lSIXXkSHFUDnVrfTnx8IUMatA074tTVT8CajbpWOqKLysCe0VVC19AlLjkj9kWqTgqUvcGKYzT6HggKDajuHixIGnQlUE44FSt8O+u19hE5vbwOJa/afTXTmWEw0wEjCWBetvyYGrt08PTd60KNW2JfGja1a2l6Ayq/FH7GamgpHzTDjD2wPdstENIwEpHy11SNa0YkQpFNjWyrBWiq9/AXbKGr/gzBFM7kx7bmxjxNWBC7e7z4vX7Aw0TvQmKYxc0UmpS20rpHKFsfcwljbfbhI721AVciC9H/daNNif5FRTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+UPrxyc4/+1Zs7EAwGKH1DqHIk5F3sdmAc6aSj1IYs=;
 b=LkXNVOQTSg+cEG7get3g+Yi/Hk/9GlHfQ3Yc6QvEA9ho35uheWHl/xkxIw3zAxFVhB/Gk7hFDioWh82Hy7SsvGYmgW0DozVqsf+VAQysb4menH5Sg72eF5wWklU+LR+/AtVYJ8rPS00POSrYZ/w8qTdYPAD30q8ey/Upoo6/O4223ERR4dRPVQ9gNXWcOz2yDRgDOzxU8Xtw03gPdSduvT12ggPCJcBbxricA9wRw8/8PEcI98+fLx0YLiWgOG4y1PifnDN85+4KspkBgYNRZFpubjCzEwV2JLo26SEG3z2MRHzGvUHUTz5V80u0dyFPW7C4jmWxBzR30YFXg7wzCw==
Authentication-Results: student.uw.edu.pl; dkim=none (message not signed)
 header.d=none; student.uw.edu.pl; dmarc=none action=none header.from=suse.com; 
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6797.eurprd04.prod.outlook.com (2603:10a6:803:13e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 10:13:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 10:13:08 +0000
Subject: Re: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1592603468.git.gorbak25@gmail.com>
 <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
 <20200622085400.GG735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c286697-99d6-93f3-1bbf-925ce54c08fb@suse.com>
Date: Mon, 22 Jun 2020 12:13:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622085400.GG735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0126.eurprd05.prod.outlook.com
 (2603:10a6:207:2::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM3PR05CA0126.eurprd05.prod.outlook.com (2603:10a6:207:2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 10:13:07 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 445327d8-2f29-46fd-097a-08d81694dc61
X-MS-TrafficTypeDiagnostic: VI1PR04MB6797:
X-Microsoft-Antispam-PRVS: <VI1PR04MB6797211145EFAE866C9915A2B3970@VI1PR04MB6797.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YiVEYNRLfWNUKZClve6XuQ2AHk8cg7vWyLJg6gLAho/oFNcGUSmwHoec8zgTMoR4BmH16iov8DU9s8XLuJ9qQCk8bYqGO2xMV+W4TM41sSKQ0ruVgP/hE2ZvqT+sNjAobBJN5CgFvvso73/89rcaEfubFGGr5GoMo5WdaGFJU8NGpCWlXnxoATemhjaUqhP08xu5vvRmWzjxFb7ZQkCY0gg2ZAWFnmxxqF5ud3djVPi78wHvhn9FggRcMzkuInj+VpNjiSfT1wmkkYzn7JJjyOoPfSoODpiu73Ir46KpTQTaS6JGn0cYij4rYaj2JUKbLFQ4jYpOs+H7dw7wJ+RVtryTLSYBoEMEN4tyjGnt98txbuAWhCpc8ot9oA9fACsn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(346002)(376002)(39860400002)(396003)(6666004)(26005)(53546011)(6916009)(8676002)(5660300002)(31696002)(52116002)(316002)(66946007)(66476007)(66556008)(31686004)(4326008)(478600001)(16576012)(86362001)(36756003)(54906003)(6486002)(956004)(2616005)(16526019)(4744005)(8936002)(186003)(83380400001)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: w67RjlETI+ful9UTtxSAoF3mWAMR69zK66h+6IQcO53lK08peiQMbrDLaSMcE7ViXbEABc34wjPA9ziixwHiY6xRBWyDhfb5+Hl18d6pJoZm4CQuO+1K1zwWe8pbHoBJY6CbBaQMHNs8kbKNSGQn66myFpLE1VTuR3WeOIa75wRseAtt7UGsq4XoQR3BnmG/7lzvZzROmAFMhnFwwUQxtStnFAv2y+NpKBISpeT47hjX+x25S/39L+MnhIlEvxF2pjyI8yw01KMxkgZi1TDYaiWtgOZbtqhivFSdCSpARgUo/TVsDWEjOyOBQIXlLR7f0FVR7eouTTGeYWvUupFsRf5BTj7xCFDStEH5oOdq+bnjWQENZP2ufQKk7vLVDJQtMbnBOowSFSRk383VwHlzCfl3HcLUY53xm4iLru91AW3VC0lI1k1Q6rfwQEJMfMCnRAvChYgaNLDy3Yg5LAP8HQsTcbwPDTktKp+pvVGtzqU=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445327d8-2f29-46fd-097a-08d81694dc61
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 10:13:08.3201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtg7fSFUhgkr63tzelsFs7rKmYmIvkk0mdaxYeswdiguUpIVCQ3qaYwENlLjs1QKz7GgMDvaF9wc5qSzkXtvZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6797
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 10:54, Roger Pau Monné wrote:
> On Fri, Jun 19, 2020 at 10:00:16PM +0000, Grzegorz Uriasz wrote:
>> @@ -490,8 +497,12 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>>   	 */
>>  	if (!pmtmr_ioport) {
>>  		pmtmr_ioport = fadt->pm_timer_block;
>> -		pmtmr_width = fadt->pm_timer_length == 4 ? 24 : 0;
>> +		pmtmr_width = fadt->pm_timer_length == 4 ? 32 : 0;
>>  	}
>> +	if (pmtmr_width < 32 && fadt->flags & ACPI_FADT_32BIT_TIMER)
>> +        printk(KERN_WARNING PREFIX "PM-Timer is too short\n");
> 
> Indentation. Also this should be a fatal error likely? You should set
> pmtmr_ioport = 0?

Not sure, to be honest. It's entirely fuzzy what mode to use in this
case, yet assuming a working 24-bit timer looks valid in this case.
And indeed we'd use the timer (with a 24-bit mask) exactly when
pmtmr_width == 24 (alongside the bogus set ACPI_FADT_32BIT_TIMER bit).

What I do notice only now though is that inside the if() there's a
pair of parentheses missing.

Jan


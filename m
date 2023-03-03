Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD3E6A91AE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 08:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505563.778400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzln-0003bX-Qf; Fri, 03 Mar 2023 07:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505563.778400; Fri, 03 Mar 2023 07:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzln-0003Zn-NG; Fri, 03 Mar 2023 07:23:59 +0000
Received: by outflank-mailman (input) for mailman id 505563;
 Fri, 03 Mar 2023 07:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXzlm-0003Zh-4J
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 07:23:58 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b6e39e7-b994-11ed-96ae-2f268f93b82a;
 Fri, 03 Mar 2023 08:23:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8073.eurprd04.prod.outlook.com (2603:10a6:10:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 07:23:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 07:23:53 +0000
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
X-Inumbo-ID: 5b6e39e7-b994-11ed-96ae-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCMrQ/VYUZfOjSLVk5nYSZNfbrmp3NdioUVT7y1zYk5/ct9hTEIIABsQ0uICLcglP2zpktISRrt/bZA3DOTPhqUk05TqdUCPc+KKsdR5WHwVXQAYt6/XXnLYPnTVCejitOkinOE5zi28jcHmyWyvvaxx/iiW1sQUDzrLOrEJKaHvMuObzI7SfNAPhGjO4YM4aVqTHDsFZqdSlE/bJZRVKOJjJP/jwXWkb56njZaGv+xpZT4dtTLRiFFi+rZsauQDAgPkPkJlq5UxG4ZWU+BexgUKE0Kr8HXhYqWK9QzLwZamsftVdpfRTO7Xo8MQhw08M3LSux+Tk9qKQ8pXWZfTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0UzuyRR8sdtDrQN2G11WCXyguBqD/LRcpMATfRQDbU=;
 b=DX1cRdPfq1NgLHsNeXZ1a5+yBjaEIRs4JaOpi+sMdztPL2KRZkCxaFJznyCaPurpj4TlLroO+phg/Awjh9S/nIsOO2giHmuKkYpSCs3ZuBlpTp0KIFy/foQnJtl1BjrqFqYS7TfF8lzdh09x6r2x/0O0myw0ef7eXcSxf17Tye86avYO8OWGeAtBRfN6481oYu2MyNvHzrWAVnCIkLJowZ/9oY63vwS0LEHZUOpqkjMtMUGcxr+jQfxdmJHDThrN4uQmlyaCaddqfz28l532DW41XOHCcSc8dtYBI1qBe8QhgcHcNpZRkJd2hWaL0X2OpUgQZ/DQPCsMDOf07TxjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0UzuyRR8sdtDrQN2G11WCXyguBqD/LRcpMATfRQDbU=;
 b=Ngq/NB59RMMEJwewpiqqN1k2RR55tF6yuaxhbnPDQadEkBYQ4cCjflbfpR7gciqYIFWY8E6hvR2fJ9IstMN7Ryj8+pSeWUMVBP/FfoXVRlAqswpiuTGWIjinUwWoWBvddzcg6HQ5tYnLsom/WLkC+E9BMJ+XLuJ69oxF15SUfwO4aLB0GlNcYkMO8CgCE4YIALCflfDQFrCtgiAr2YmNzwQBGLsiUpnGaFDEiZSwf71JB5UshDVPaPfl5dSF/bNSuC972Id2ShwxjYgu+8qXtpdrhuJ9oxVgLOZ4bmiKfSdNQz+QCzTYrmDaMVAPbUJnuv6cp3qy/78cXdQkFN99hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f62293e3-94f5-005b-dafd-4c9084f5d84b@suse.com>
Date: Fri, 3 Mar 2023 08:23:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
 <20230104111146.2094-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104111146.2094-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: ed381fb7-5993-4a05-78d3-08db1bb83def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WLPBrp9IlT98DzA2N9TIJqkWiuIgwWnuXE81LJSsDest/R4nhtV/GTpN7RA832bl50j02LH4mnQZWWQ9rWys+SAz/qJC9r+F67Y6hRajpseehjyRVbYZuZL3aDeaTgAD16X8zp/HPuqd1veN98Klqi+0VcpoMULr05RA0cfneCQuSsEMyoh1n8K7F/CuBpMt7685J/Hzivcq3EYxpAyFqyNRn3988VYgWrUvKU3ri3/1cktJ86t/UPIZntt/P8wH6mOXXcmd1tqwJx93Jo5zgayxfhbJL8B2SBEbL9FB0JUEzq88Yz65WP6IRGrU3Btnhwxvij0e9jn7N59FFVy2l7B2aeXwxGQvMFrMJH0ZppLL0qoZY77LczOYCAc/DD2cXT9SiMNNqPTXeruyfSTqLPlZ9ZHwY3MkNDsLrAlqUcCvqaKBj22tXxF2cm5Xj0Knc0raZ1DjoBGbLDHeWBudvzFn2M17Zg8CsvKk4e2i66NFhK8KRp4P1a44kIx8av0mfHNoPMhywEcm7E0R5BtPl5cXDNe5E4G8hFWymJGUEZ7O2YACaGyKhj59g9OE8AiAqrcq4B4h9QJxhuiZ+hs8PE6DTBksTiEIiyiDtagG2AGy+JGnTKFWwK/yv6ChYw87MYPRvOR92bASJIMCVaCWdg//mJ7bYACxRDFg29dOi4Xwz31NmhdHnfOrW6TLGyhhdY9s8XI3+SEXEX1KgPH/ebyghjskP1+gvfQl3OjoQLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199018)(31686004)(5660300002)(4326008)(41300700001)(36756003)(83380400001)(66556008)(66946007)(66476007)(2906002)(316002)(8676002)(8936002)(6916009)(6486002)(38100700002)(186003)(6506007)(31696002)(53546011)(6512007)(2616005)(478600001)(26005)(86362001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGJzVUdyNm5PVlJxM000U2NoNE1jbC9KOVUxLzA0WmRHZmRqaW5pVUwzREZk?=
 =?utf-8?B?eHdVY3ozN3VTRXRUOEkxZ0dJeURpeUtWMUNRZlpGTzNQaVp2eGtESVh0d0hp?=
 =?utf-8?B?NUYwK1g0NEpqQ1dDNno0aXpFVkY0YmJxaDdBLytmRTJpUGRPVmV1THRjbitu?=
 =?utf-8?B?U25WMkV4ZHNkeDhBZE1qUk1hQ2FJbVhKdGRGVWRVMHJHaThPUUFjNTQxb2VF?=
 =?utf-8?B?RXdKb2VCTXJIRjQ5Qjc2QlRBNE40VUhtZVJpY1NpUkh2U3lzUHdyZ3RnYUdr?=
 =?utf-8?B?QXpyN3JmTXRZQWhTNjRzKzRZOGxENlhra3lvUC9TUnFCWCs5R0szbU9IL2JR?=
 =?utf-8?B?U1ZKcTVxRGF4cUdPMXE3MkNVUmtsQ3o1TVd2azM4dVluYXQxdGxMUUNrUCtM?=
 =?utf-8?B?cGRHYUZMcVVWeGk3OFo5VjVSSFdrTm9OZjVBU3p0NUx0cHVPR1YyRldjVnJN?=
 =?utf-8?B?T2Vub281cncvSlVIUzRmNE1DTHgyTzVaY3plQmxaeUtpUWViY3NjUDFlOGhn?=
 =?utf-8?B?WEs2ZElRUEhZR1UxRHRreVYzNUdzMlhXRndCamd2SklWaUl2NVVUVEVpeVRp?=
 =?utf-8?B?L2plMmhlZmp5YVZwQTFlNFlGOVNLV0R4U09OSW1ReENrVDhYTWNMZEl4Tm1u?=
 =?utf-8?B?RkR3Mm9XOU10dzVpeXZOOVJMT2RtaXF6Rmw3ck1lSis4bGhtM3dwSmNyYVk2?=
 =?utf-8?B?UlZVRVhWTlRFM0lvd201cHFCczI0Mnc4WEpFTGtlTW9EK3d0dHFFd1VGenJm?=
 =?utf-8?B?R0tZZFE3SWdabm5lYUUxbmExUGVrMGtzRnpXZSt1NW9jOWpob2paOWcxNGcy?=
 =?utf-8?B?OVRQaDhYM01GMEZMSEpqVlNMcit5eDZweGtCT3U3UGhYTEVKMHVxRXI5OWtu?=
 =?utf-8?B?dmdza3lpNmxjS3h2cmhXeDNTU1BYUENWL1V3S3hLbXhBOXVwQ3RzVWhEQnpi?=
 =?utf-8?B?QlZlSDJvVXF6SmxvejdnZzhuakVYK1pPSktnbEVVNG02bmowZWVxbkZzTlha?=
 =?utf-8?B?TFhmY1JzV0dxSUZsK2k4VWNxUy9WY3EzTHBnTGk0TEJObEg4bmZlK0UvRzht?=
 =?utf-8?B?aFlHSDl0azcwaEg5dHp4SEQ3SmtXMEdYeWRtNDVHZTNOL09NK2xNSVZtcEUw?=
 =?utf-8?B?UHg2QkVaaTloc2VUVUVES2lyMUdPTS9FdUY4Q01jZjdVL2d3UjF6OGdxUHBj?=
 =?utf-8?B?YjBkMkhlNEpETGM5d2drUXBISWxrS3d2SVdFUXdaSy9rQ0ErbUp4cGlwOGVv?=
 =?utf-8?B?OTNvdUVaWmM2TUJQbGNXY0dWdzJlWEEwMnJtdHphenJLb1VRMmd5b1h2ZzJW?=
 =?utf-8?B?bUl1RGNFa2RscEswdU5TWE0ybnltR0dDOWdZb2xVMlhPakxjM0lWbDBvM0dj?=
 =?utf-8?B?Wk41WFNDSnR0bVBZSlIzOHhDYWp5bUxpTklxSUd1U0FiOVdLWXlOaWRLb0NX?=
 =?utf-8?B?N3ZVWWVzZ1Fxc1RnbDRiNm14cmx3ODBkSXVKWTFOYkNLbk9ibFFNOXZtWUhm?=
 =?utf-8?B?RzhTTklxRGwzN09pUG5INENwZTdmWTZUVGZ6b2c1WCt5Z0c1TFBqMlVsOVZH?=
 =?utf-8?B?TFN4eXA5c085dnVZRWNhK2VlT1M5NzBRWDljME01NlNEYW9ySGxYWjBXNFBV?=
 =?utf-8?B?OHF0N1BBQXFhY3NUYW1BYjJHanFKVkZNRktZS1hlcUJoY0tZRmIxcE40aTYr?=
 =?utf-8?B?czBYT2VHdStZWi9kYlNxYkJUM3FzdElTM2wrYjlDN1ZXY3Q5Y2gxb01jYTJE?=
 =?utf-8?B?R005NlM2RTdhdng2cC9HbEluL1BTb01YZVM3VE51cDdlYW1kYjRKcWFYYWpx?=
 =?utf-8?B?ZWQrN09DdWl2SmVmbnJZQWtqeXh0Z3djcWduNlhMTFIyMXh5M1ZFZUwwR3pH?=
 =?utf-8?B?eTBycWFrU1NGTWZiYjR6VlZ4SXk0c1JZeGdrYVdHMkoyK3JBQ3h1cUJKS0hw?=
 =?utf-8?B?ekVKc0liZXQ2YWFuY1hWQVVRZmlQaVJtWVNvNUNaWkhhaUJiMTE1eXpOL3lE?=
 =?utf-8?B?WVBDMHozMVc4N09FT0tET0tRUWRZM2o2TzliNi9UMVFKWjVBMlEvVmZXYzMy?=
 =?utf-8?B?TktUcnoxS0JYR0cxVnZIMnpPRThKNXB0WUNTTHpTMW9aZzYxY3RUQkZVMS96?=
 =?utf-8?Q?heokstBGiDEICXS4PpFMS5iRp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed381fb7-5993-4a05-78d3-08db1bb83def
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 07:23:53.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXFFZ9wQj1lO4u+dSJQS1oil5HAKof8iJ9/ysz9Sw5P+Zj1hKFCcoTxn1e8qGUaYp5gXn4KMMRDRIxG2xm4mBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8073

On 04.01.2023 12:11, Andrew Cooper wrote:
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -288,6 +288,9 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
>  /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
>  XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
>  
> +/* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
> +/* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */

While committing the backports of this (where I normally test-build
every commit individually) I came to notice that this introduces a
transient (until the next commit) build breakage: FEATURESET_NR_ENTRIES
is calculated from the highest entry found; the comments here don't
matter at all. Therefore ...

> @@ -343,6 +352,8 @@ static inline void cpuid_policy_to_featureset(
>      fs[FEATURESET_e21a] = p->extd.e21a;
>      fs[FEATURESET_7b1] = p->feat._7b1;
>      fs[FEATURESET_7d2] = p->feat._7d2;
> +    fs[FEATURESET_7c1] = p->feat._7c1;
> +    fs[FEATURESET_7d1] = p->feat._7d1;
>  }
>  
>  /* Fill in a CPUID policy from a featureset bitmap. */
> @@ -363,6 +374,8 @@ static inline void cpuid_featureset_to_policy(
>      p->extd.e21a  = fs[FEATURESET_e21a];
>      p->feat._7b1  = fs[FEATURESET_7b1];
>      p->feat._7d2  = fs[FEATURESET_7d2];
> +    p->feat._7c1  = fs[FEATURESET_7c1];
> +    p->feat._7d1  = fs[FEATURESET_7d1];
>  }

... the compiler legitimately complains about out-of-bounds array
accesses here. This is just fyi for the future (to arrange patch
splitting differently); I've left the backports as they were.

Jan


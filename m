Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612AA5F9840
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 08:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419104.663825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohm85-0004mS-L9; Mon, 10 Oct 2022 06:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419104.663825; Mon, 10 Oct 2022 06:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohm85-0004jI-Hx; Mon, 10 Oct 2022 06:19:09 +0000
Received: by outflank-mailman (input) for mailman id 419104;
 Mon, 10 Oct 2022 06:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ohm83-0004iw-0Z
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 06:19:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c87e0ff-4863-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 08:18:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9380.eurprd04.prod.outlook.com (2603:10a6:10:368::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 10 Oct
 2022 06:19:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Mon, 10 Oct 2022
 06:19:02 +0000
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
X-Inumbo-ID: 6c87e0ff-4863-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcJzmQ9og4039wGM08mYGcQepv0Nwj2cFbjeL3i4LsJQ2Isw3Bp4Z82bbevFmZ0qd79fKa4/tiatRnDw9O8Kvo0BiLxUE+VjQ6vaqhYYrxvT9UlrafkElWv9Hl+pnJsNmoXSc59TFUlMO3Fz94Q3iEAq7TUkbXFxmI9l1fQWpqWRwGbEM7qQwZ98V89lmwifQhx7YiSvKpAreQyOiEIf3XFYvNmEVZTBLc/TBFbDkorbHAmYHqVvviu0JKpsA5+rZ1nKuR6pqEZcd2uPUoCzCAk8hFlaZSeuOoPtq/2U2Le/nXjNJhXPTPm6eTjpR4rL6x7SMmwuVuMkfUTz+P9w1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfrW9xDO3p/KtxAA3jnh286ln62fMs6xCFkbcN3D4Ls=;
 b=SV3QRK/m/3nBNedBlI6NMQiniV+598NeFYYLOue+e/eVEaDMJLzjUpQhKVBEcTpwUUHC1sH7+tZcPpBLGo6lWND+LGhB4rDE9qVzgmMfGElhB7ezm8e34bVjRB44tvaJDLpsQ4rrUzrDQd+eJS4XmdvPFlBuj5ApTgyPxb6avelKJU5Q+oZD4iVv58i7TbuZ2dw6BoSjdwob3qtLKKW/9pJUjNDzqrTceMu3Q5+gU4A8PmVS6LuFkPiiO/P9t6YdzgskKsfk5tqrz3IQnGdmg3WUJNM3T3lB2IsXHReVyXXhyiBdPlsN3cwTVQPxOx2AYmTqvGV104mfuY7tNvTFDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfrW9xDO3p/KtxAA3jnh286ln62fMs6xCFkbcN3D4Ls=;
 b=J8cBMmvdxgnG1KuvbYmvI6Dty34he4gFcKlwRYPQ7vRAVJauQaBhColvalbOZYE6CCL+vJBd1oIPYzCnCy+ao7rxNkVhRbqM2f6/Id/dPGxUyadUT4abY7wSoyDQMRgARlu+hAfgsZJeZH5Do8UDyFf65h7xEQx7y9dDUuq986V12eGcrDGa3ScExCxvESg5Rm+yQwhGQfjtB7fV74865UJDp4cMJpIwRiDIBOLsvv3CLWShev9sRRTG13OiDQYdt3/HCsw8Fl1QbYpBdkqPRoZaRiN8qkFy3xTlGCClu04UmIAWJ8rDwIK8BDyXeTFwKjdBf7Ll2dySQ6S5YrXMKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bafacf7-0eb1-75c1-954c-d492059cecb5@suse.com>
Date: Mon, 10 Oct 2022 08:18:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [linux-linus test] 173480: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-173480-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-173480-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0225.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9380:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c6adb3-0ce4-4ef7-8422-08daaa8752ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pweNNezDhv+Ih2xG1Q099ojdBlIDQv5xqhdepSvY7Z8ZTtfZqXEaDk2p3pJwZk9hre5ke1uVf9pZqKZq3wC8QcHoj9yp/K/uO+QgK1ToMvmjCAComppklBVLJow8KuplmAsY21QS99RJVTtAsluB24dnXzX0oA/vTV2FuCJHbu/aLCWeXC/5GkWs642O/yIJvw7srJWjeUuGlBx0h1BLBiShq4Z0TiJOwzSN/xwQl3eYrCjTZU5CmPnEwBFAa+h0DKnZWNc2XhdWbgx/SkGrq0JwQRCEL9PNCzMEsx8Chb7tfO4hRTKumx7yxAjwaNba0I41yVkGq/ogK0h8g4JEnMlHLpmQQgptqXBHrbFWH3/E22tkA+//z6kGvao8oqTtIyoo3+PZk74uc2LRQxWLYFZf98J+6WUaO9+D/RSOz2GvWTMDArvHGLz2XeXAHXyN7/N/WLGYTJOsWEOGNutn4qDD+jwchZqQqs6AM5bzl9yFeD9y4m46otFUMSmq48P2tmh+JfDj3oaMD5MpFO/8DCbLdXFzLgNUraSVG4cM5rS/Tf5XTCSE1jW0JO0PzkY+iJ/N9WKyA4jZsn+3NPiIj1vrl6inelFNB9PKt8nYqmrdyT8rVjC93ksRPURcDK1Nxjzkhola256duiN4lP8Olki8iR4QVqZ2uQbxLwLPtpqArCUY2r7zHMNVBrtQOO0OJtoN/etYKP1/3IrovWNsVcBDhTHgaoaxWkX9wtXEjOMDXLkhywCqNybcq8ZWQI67TWcqUaCdTiD5KUQ3LoU8eup6jte1uJhxYN8oNWM2Srfa0cHxmcYr99L1enA3fOASB4MIHztFu5X/Q3N7Skr/5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(66946007)(2906002)(36756003)(8936002)(478600001)(316002)(6506007)(6512007)(66556008)(31696002)(6916009)(6666004)(83380400001)(4326008)(186003)(41300700001)(66476007)(2616005)(6486002)(8676002)(53546011)(86362001)(5660300002)(31686004)(966005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UllMTzIvRlAyRWpzaWp0YWdBTnUvWnUxZTRIZktjS01iNnljWlB1cVIyd3JG?=
 =?utf-8?B?RFJTbVhocWFLbVJsdjVHYWROUDJFMTdxeEJXWU5QREFGRE84R01iYW1MZUVy?=
 =?utf-8?B?bmREdnk1MlZyZlVkMSt1MTA5czhTT3lHd1FJSitSMFdoVlgzd2QrUWxTYm1J?=
 =?utf-8?B?N1U1aHRaZ0ZvOEZFRWhydEVmTlBoRkppMytUaTBudWdsck5aY1JZd1dHcDRO?=
 =?utf-8?B?ZG83Uk9CNDgwM0RqNGdlOWxydHMxNHRrK29GYUxyTnIxUEp0eXpjQW1PRjZt?=
 =?utf-8?B?Sk04ekwxOHYwSGMrd2dUUHN2YWxjYmxWbWJaNTFvaHYwdWVFTjNuZjNLNHNz?=
 =?utf-8?B?VDRoVE5zMHR5VjdYemEwcGRVMm9Ydk9kS0tQTi9FMWc5ZFFwSGhzRjJaUU9D?=
 =?utf-8?B?K1hDY29SR0JMTC9ndlRXSWtHV2FJcjErUHVNTXh5Z0NaeWpILzhodXk2Rngx?=
 =?utf-8?B?ME1qc1AvZythc2ZVZ0NpaTVQN2FpNFFGRWZBaGVSMVNCdDRkMFZ4NUZWd3or?=
 =?utf-8?B?TkFVTStRNUEraDRaaHJCUG9jWVFtQUIzcWRNM0I0RXZuSnBRZ1hvckJqN1cx?=
 =?utf-8?B?a2hCRDI1dTgyY2lhY25OWlVkaGFnMUJXcHQ1bXVOSUZOa2g4dGlKMys4aVR2?=
 =?utf-8?B?K1ZZMW16M2hmKzNobytJcjJmcWREYjBOV1E5bzhxc3E2eGZoT3czMHdCNWFG?=
 =?utf-8?B?UEpSVy9MMS9SUlI2clVxMjFhU0tQaTFkTE9NN3h5cHoyQ2hVT2hVWHRUVGVK?=
 =?utf-8?B?OEpldGpaRmVGSHpHdzc3b1VsUWxaYmNNMXhOaHFrQit4cTlyeDhCUjEvMERl?=
 =?utf-8?B?ODdyWTk5c1JvN0dKS0F1Szhpb01GZC9Tb0I0SVp5Tk5BbEt4VDVYMy9tcHBr?=
 =?utf-8?B?cEpmRG1PRmRvbllORXQyQUJxbXhPME1lbFFPSlFiSzlESUoxdUhCVGc5N21O?=
 =?utf-8?B?YzIxazM4VmUvZy96bUZDODRLVFlJcENtbkJqR3VESDlyaDBJUUxvZGQzMnhC?=
 =?utf-8?B?NkJHcWtlbzFsT3FEdFE4VW1CWDJzaHlqU3RkcjhmenVheHZJaDVHZUdRTS9K?=
 =?utf-8?B?RFNML3l3VC91aW1pK25LQXQ4N1JEMU5ENGxwRUhwV0RLcVFIVkQwUk4zSVpn?=
 =?utf-8?B?ZUZ4WEczS2tiOGxyVVNhOWVnNlRWWDlxVWlKdVpxV3RsWk9OcXA1b1EyZ05I?=
 =?utf-8?B?Q2JFbllHZFkrK2JBSDI0THAvdlluVnNRbGd4Qkd6YUU3ejBIQkZCL3EzczRC?=
 =?utf-8?B?c28wdjAwM1VuSFo2bEQxL2NOMm80Y3E0a3VIcUZKeXlyWWJDdXREa01nMDRo?=
 =?utf-8?B?Q3RnVkplQTU5eTNDTXVnRG5nSW5La1E5VXE1SVZpdFBJNC8rWitkK1g2M3Jj?=
 =?utf-8?B?WUJPZWdOTk41Rk1ZSENJUDVibkxzMnZlVFJRdFh0dXZvcUZadnVnNE9EU2lQ?=
 =?utf-8?B?UEFsSUNpcEttZ1pUQk42S2VrNFpWV2V2UGtIcUlNcTN5bjVMMUZxb2lEV2JU?=
 =?utf-8?B?SVJOOE54UHF6ckc3T2p4cjJxcStDNG5JNzJLNzJxQXdPTkJKdnhaVG5obWE4?=
 =?utf-8?B?WTRmblJyeW1wT2lvdGhjSC9ud0NyWUxKN0xDR0ZqWWRzWVJKQjJxdWZHWW02?=
 =?utf-8?B?S2ltbytlMmZHRGpwa3VwSnU5Ri9ab1F0SjJjb2ZuL1RnRHBkQTl3OHJ2SGxK?=
 =?utf-8?B?VEZ6SGVaR2FOL1dmOHZDZDZNd2VxdzRaMkdLRm5zdWMwaUpraEZiVklTNldy?=
 =?utf-8?B?OHV2UURuMmhHalpDUkZkK3JtbmVkWDJTeGRvZlphdytXbmFOc3pJOEpSRGRR?=
 =?utf-8?B?UWc1S2w4T0RZOFJvanNWcEdOSjl2SzI2R3FJeHY1UHA4eU11Yi9hZTFQT0pX?=
 =?utf-8?B?NXg2amcwUWtvT1REYVRXUTNTMnFjZ2pKdnFyeGUwS2ZqMmVFSWE5UW1xL1dJ?=
 =?utf-8?B?ZDgrbi9OODdYVndGcnB0OFlJaEZRWkpuNlVnTjhaZG1pR2ZENEtnaXFYTlNv?=
 =?utf-8?B?TzgvL1liWWFOS1Erb09VNUVtRU9MbStmQXE4UGZEbzNpcW56M2lGNkduT1hX?=
 =?utf-8?B?UkIxZ09jZFYrYWhTZjA4NEQxR3d2NnM2Y2ZweUxVRGlUWSt6SkRjTm4xMXpE?=
 =?utf-8?B?RkhFeFVWRFhrdk9hMTl4eWc2S3NVNXJEMHlkTjIycmdSbjZWclpNa3Z1eUEw?=
 =?utf-8?Q?iuyM5fgbGyKM5wS0XarP+OFk20iGStF+QuLWM3l/5xxC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c6adb3-0ce4-4ef7-8422-08daaa8752ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 06:19:02.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUe6RwRpfaktNoJX3SB0HkT1tpW3T09rN7h+Lt/vs2V0RBnlwlc+fH1KmRNtIgw1ALghfM+HVQpq4T1EztdJsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9380

On 10.10.2022 04:26, osstest service owner wrote:
> flight 173480 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/173480/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
>  test-arm64-arm64-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 173462
>  test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 173462
>  test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 173462
>  test-armhf-armhf-xl-arndale   8 xen-boot                 fail REGR. vs. 173462

Hmm, they can't find their volume groups. Since xen-unstable flights have
been working afaics, is there perhaps a kernel Kconfig change needed (e.g.
because of a newly present or split option)? Albeit then it's not really
clear to me why only Arm would be affected - I assume basic arrangements
like these match between x86 and Arm.

Jan


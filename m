Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9B49B158
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 11:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260044.449014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJ1r-0008DJ-Ee; Tue, 25 Jan 2022 10:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260044.449014; Tue, 25 Jan 2022 10:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJ1r-0008BS-B4; Tue, 25 Jan 2022 10:26:23 +0000
Received: by outflank-mailman (input) for mailman id 260044;
 Tue, 25 Jan 2022 10:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCJ1p-0008BM-7s
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 10:26:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c4abb90-7dc9-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 11:26:19 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-5xAcTVYXNIehXFcBAy630g-1; Tue, 25 Jan 2022 11:26:18 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR0402MB3812.eurprd04.prod.outlook.com (2603:10a6:208:f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.19; Tue, 25 Jan
 2022 10:26:17 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 10:26:17 +0000
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
X-Inumbo-ID: 3c4abb90-7dc9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643106379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjFCwNET1LN7m0OaJm3b1ozrDNbofMdfG2n7rcZK6pI=;
	b=SoqLJjNBiAbltWRzG96AKG0+dUNQKOmaVtiXmqkL08tcYOA111Or9WC1eClbaDt4RwfLnh
	ltU/gjAjaHPZXMTZZftpAkOqbNNRE4oec08ZWhvgEHNMgCLMtAIdU43GAsRZH+RD58769R
	9t1cVKxL3IeCUpmeaamH1QUtala1B40=
X-MC-Unique: 5xAcTVYXNIehXFcBAy630g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE7abCf0Hyh34V32f/nL8cMEfPz56uJeA75x2kLWriSmRLByoRAvnU3yD1ORpqiH6riLTpUhbaEzWdGcXbplcYfxOT4Ft33SZxC7+t33n2YnJi9sjxRp/nr2frtGMPJYYKeeuicLDyHfQJhjPwHtqd2llDATuyka+we9mxk0mM+SWo64yuYGI44/lJ0WVX+AOmovHJTiSrYf1z4ONN2tfZSA9wphREL8yRL1KH0M9EK5OmCocZ/XLqukXEamws7pSoOHkgOCGbGcB2LJTAZEZwA6KT8p4DM2ry5F1MVLAEgoh+DJKUkcACExHkFuGn/DpPbKRNKDtZAX+yEFXxpNeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjFCwNET1LN7m0OaJm3b1ozrDNbofMdfG2n7rcZK6pI=;
 b=CiqvneGhvSi32xiKP1rsQxQD6LWCKO5+St5BZROBStRzPvCqrEceWA8EQvQVpnqWvWC3+Tms7izdZi/EQ4aC75kPTlK6qFE9DBI7YrxbIEkE0Q6ndcdSdk8PAVCst0/srw/C3gcadl7wy8cUHGNXMspBl8G1mo+wGkMy2nZfbIBFNeSPLXsjhUczOp3rn27DHYKI5aOVbGPUAVHG4k4W8fLwMUiWXdOZr6yyW69Ad3k2sb2wyTWvBgVPJRdtg8iDNY3qELyfvtgEwXmoTpLiEkswO9YBeXb8iRCR7veCL3JBM4D+HUzj+LKxQnMEIkTe+OxDqaNlDR5YMvRF54zsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e862e6c2-8e3f-3cdd-88ce-127dd65b6255@suse.com>
Date: Tue, 25 Jan 2022 11:26:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 17/37] xen/x86: use CONFIG_NUMA to gate numa_scan_nodes
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-18-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-18-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::19) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e77f6279-1b56-4f05-be93-08d9dfed1eed
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3812:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB381265A8B688B80B104D216BB35F9@AM0PR0402MB3812.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XGVvl8s6tIUlYwjAfP6hYY2b81emHZvZhm+Pnl0EwKJl3w6T4mR/sxBXriJN5YCCibb6llJy2WnHcL/mwNd5YO4AAx0ax+432Tz898NIFr9dr+RlJBoIKgTiP1lxsOYXhRTw/Jqb7hhgZrh1JyXuDVPBgZ9A+7sumQc9XBP179X4F3OtZJ/EeLbgp47ypVByatltZXq2FzFQ7xYoko/DPmc/VrbhYRjA3N1NyZ8jhAc5h5rA/4O/o4oef49B5BZdfbT983D+Ep+OGKgazHYX/ycoBmEDddr3U7FzYkXmjtBU9rlVY1/3z8DA6aW4AHIGPN2e41qS694MIBBCpEtGExDshS350KMo0VJDfBNUst8msNADgQXpKCGdihEn8BSDRdAGRyk8ovL7ALp5BwKMgIoZByjqIskgu2DSHyg9/XOLRhKWVBBoBGwqcL6mi9jYXb+S+yy5aAI6FywRVe3xH6uJDvbuF1+zLHKqrMyYEtYMTAAbKh1nlr97IhS7n86k03VYwzAbpM14COSDIayy34eRe5HJhC1Z6B/XfA5G80FO9dI+ucekDH7/k1/cW7WAD2BHzljMsLPBNDUUuUKzgFlxcqQmImMUZ0SClvyYUe/Zs6oVyyAdfSPt2xUolrkpxWzvdWIwjwlZK+oq0XQG8BLZqnp7zUovPVnV69dPDMsDUuKJi+XlAOv2Rofo+hqovKJ3o2wj4Mi6sFf7bofZJ81xuNXzeIVurQzHRgC7JGupqt2AtffiTzcv09CQUO/k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(53546011)(8936002)(26005)(4326008)(186003)(36756003)(6506007)(316002)(86362001)(31686004)(31696002)(4744005)(66946007)(66476007)(6512007)(38100700002)(8676002)(508600001)(5660300002)(2906002)(66556008)(6916009)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXkxNWY0OEMzRWZ4MTVTRHByb1NnTC81R2tnbzl5V0xrSWREL0xnMXpzaEFa?=
 =?utf-8?B?K1Rua3ZpVjl4MytEV3Y1MkIxUlp5RklEOW1FRWhuZmJDeUNsdHUyVkk1WGw5?=
 =?utf-8?B?UldnVVBCTEUvVlBHVXl5RGpWVnN4V1Y1UVdKRVhkVm9Gb09SQmhoWU1FNjZn?=
 =?utf-8?B?dGNxV3BFTGkxS2w0b1dyZ2FNVlZsTGRUMW9yN3BaYTYzSU00a1hQY3RGdXA4?=
 =?utf-8?B?ZXlLWHVqMXE1RXNMTldNcVVwaU1KQ0QyMk8zWldPc0JmSHJHakJqem51YnQv?=
 =?utf-8?B?ZDVUQ21nRWpLUHoyNkQvemNmWDljN01mTFFKa0w2R056SGdZV0FFYkNibEpl?=
 =?utf-8?B?dWNqYmJGMS9Md3NGM0dySXZ4TWhTMjJsa2c1YTJTZlZSZ090Qk5UK1dHeW5U?=
 =?utf-8?B?S0NwRzZJV1FQM0NPYWRSeWdrNTFqQUN4UWwzR251ZGZ4N0FuSWw5MzU5aDlk?=
 =?utf-8?B?ZXUwR3VLbUYwRldWZTNjak8rWmFNTmdabFVJOWVMN21EZlMvZlUxWUY2R1Bw?=
 =?utf-8?B?REdqS1FCTU13QjE0NDZRbXVEYTc3aHdVVjdsVUhIMjBNMHZUY28vTkxnK0xY?=
 =?utf-8?B?ak1WSERCMUk0U3BVYUFwbURPcjNYa1pzUlZIZ0cvdHRzakE2Y1hHano2VnVn?=
 =?utf-8?B?V2Rvby9wdVJYTEt5ME9yM1NCMFM1ZlFTZGlzU1UwQkFkS2dmSUpPaHZ3Qjk0?=
 =?utf-8?B?UXBzSmpNYzBqbmRadWlqNmZDNXVQa1RLTjlMUnFkMVlGNmkvQmF2bGtWTlRu?=
 =?utf-8?B?RFFPOUZvMVFWamsyeEtQWnkzdzU5S0E5dDlMNXIwV0pRWnZwelM1UzZ0Q2FQ?=
 =?utf-8?B?bzBEN050MkdOUEhZWXo0R2tTaCtNSk5SMjlSVmxMNXEzc1M3VSs2dE84Smlx?=
 =?utf-8?B?bW9XWEhFcmZoalVDTDhEbk1ibng4SFhmUUtEalkwOEdaTUg4djNPdTdkMmtV?=
 =?utf-8?B?Vkw1Z3AvNDZ2T0ZnSXQrTGZ6amRubXVlcEFJM2RDV2tqczBqS3JYc0haSmht?=
 =?utf-8?B?UnV1c1VmVDIvTVNNWnFWbnZYY05DUW8rQUlSaVlwR2tObllvbGhyODRLdlBu?=
 =?utf-8?B?SVNmZllNMERUOURWZllJRHFWSW5NUjVKYUJPWDNLZmdkZmFKRTRwVjVlVUFD?=
 =?utf-8?B?NkN1UStrL01hbWNoaDE1MXVwNi9xWTQxWEI4Q1hQMmtUbHJoNWoxREZWY1Va?=
 =?utf-8?B?UjgwT1ViMTgrZ0ZsMUpicGVQc0dzZFVTU0I0d0pjMEo3cTlLZ3BLY0RFRHFO?=
 =?utf-8?B?K3lncUxkbDExaVE5cmZQa25DL3kwdkRjeUNWOThTMmtNZHlmQVZnYXNyM1R3?=
 =?utf-8?B?VWk0M2J2RzQ5QTFYbTkyQnR0NmxqUVl3ckVzZW16NE9pSzBRV00xckc0Ykt0?=
 =?utf-8?B?alFjVlNmczFhbzExazJOQ1pIK0tnV283UURocGhNVm81TVJ5T3FMOW02d1dQ?=
 =?utf-8?B?VjNrTGlFbmRiaWdIRWZ6cXdUSThRd1IzZmErQVRmaXhlRjJaTkdSaG5WZFhD?=
 =?utf-8?B?QjBNSHhuQ1FMM0lNSUVEeStRbzBVMy9ZTnlHTW1hOWROUFBic2xQTkVYaTRS?=
 =?utf-8?B?Rk5BM0E0OTRrWWhPbCsvVXNRVkZ0bTV0cUhxeTlObGtSeUZJd05jcUlWRmtG?=
 =?utf-8?B?TUswT2xvQVNwQm1sYVZiWjBVb2lxSzgzZzBtWUh6b2kxVWlEaGpvK2JRNjRE?=
 =?utf-8?B?aGhlNUE2QnZXWHJTVkRiNWJseDR4VXdHRFFOZzg5L2Z0OFVjZEowWVZNZDE3?=
 =?utf-8?B?bmluRU1MaXJ6OEFLZndTNG1lM1Y0ZDNhMGNRSWNaVURmS1VUNXJjcUxtdFdI?=
 =?utf-8?B?eEZWVmJ0RHZYdVB3alpocSs0YXNqOGRhUTRZQk94V1JQMWVlMlAyT1c1dXRy?=
 =?utf-8?B?c2JPMDE5TFV0QktHbjZKRFl2VWMveThjb040bVQ4RjJoNHNQVHZwdTNPZjkv?=
 =?utf-8?B?N3YwZXZPaHlHV3pPeEF5YU1HZDRPTHA1Vyt3TjlBNjRLUjNwZnlOYWdHR0Qy?=
 =?utf-8?B?anBEOWZXbzV6U0pwVEh1WFBOMmlBRHNodjZWWkRZOWZRb0F1eTF1RnB2TWxQ?=
 =?utf-8?B?b3UvZ1M0TTVCSURwd1FSVmVndXVNN3ZnVDMxZGc4cG96M1ZocmtHMWRBL3lF?=
 =?utf-8?B?Q09jcC94VERDQVhqeDd4ZksrUXlTNmx5RWg2aC9hdnpCU0FwY0ZYNFFhbExy?=
 =?utf-8?Q?9dRjhEVmjEH2XU/7UXsyc5U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77f6279-1b56-4f05-be93-08d9dfed1eed
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:26:17.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbOUrcrO9Z1BzXwT03aVf8KYR0sFHpD93i8zcN4xvbsWQlVtMn7WtOUdbfFN65fi6Ps+EVEXrOF4t5IBDs9FVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3812

On 23.09.2021 14:02, Wei Chen wrote:
> As we have turned numa_scan_nodes to neutral function. If we
> still use CONFIG_ACPI_NUMA in numa_initmem_init to gate
> numa_scan_nodes that doesn't make sense. As CONFIG_ACPI_NUMA
> will be selected by CONFIG_NUMA for x86. So in this patch,
> we replace CONFIG_ACPI_NUMA by CONFIG_NUMA.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 8a4710df39..509d2738c0 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -260,7 +260,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>      start = pfn_to_paddr(start_pfn);
>      end = pfn_to_paddr(end_pfn);
>  
> -#ifdef CONFIG_ACPI_NUMA
> +#ifdef CONFIG_NUMA
>      if ( !numa_off && !numa_scan_nodes(start, end) )
>          return;
>  #endif

Why is this a separate patch, rather than part of the one renaming
the function?

Jan



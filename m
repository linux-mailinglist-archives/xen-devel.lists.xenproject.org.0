Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D844C53F611
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 08:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342849.567940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nySfZ-0002YH-Cy; Tue, 07 Jun 2022 06:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342849.567940; Tue, 07 Jun 2022 06:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nySfZ-0002VH-9l; Tue, 07 Jun 2022 06:26:25 +0000
Received: by outflank-mailman (input) for mailman id 342849;
 Tue, 07 Jun 2022 06:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nySfY-0002VB-Lv
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 06:26:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c081359c-e62a-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 08:26:23 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-fdvmRkQJOlCsRkL7AGhntQ-1; Tue, 07 Jun 2022 08:26:22 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8740.eurprd04.prod.outlook.com (2603:10a6:20b:42d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 06:26:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 06:26:20 +0000
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
X-Inumbo-ID: c081359c-e62a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654583183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0LUxGRu6M1umnyDasRxv1iWXBTB8HSglNSzzceqsfo=;
	b=NMwsRYd+txJ1gmereDGJHRjE3659PzS5VnTeCALdQJh82xW3uIlZtDKXw/5HNpzGnqkyiA
	BJagBpTcoVM+rskGcaFOqjP+08eyclG2m0uHEtIZNbsjhLajYw+VpT2g6P4swlu+B/FpMa
	Mq2G7zOXuqW46+XxG0IHNzo5I1PoUVk=
X-MC-Unique: fdvmRkQJOlCsRkL7AGhntQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyK0B+5QqUog+2L+1APVs5BvfY5trp7dxupV6OaX+s1EYXpBI2lUtOZ5VDas7Z3Jf8RrIahaxHBP3qducb955LqRIdPnUa6U853T1Pr4z7TA91kMTj/RIdiHJZz4OQ23kwroCtzoEXB1hnrUQLj45oDJ2HBhy3TAvFWaCb6XGR98IElPoY7fKvkJoXyRoFJXsfxwpmI8KMTdn/MoogKfviOr77AiDQXT14q/XdX7Ol10auW359Lyk88Qc2uBiHA3yJETxvan10XJOERG1u95021Tx5UH6Xk7/dD4TefxaDBBMNTAsuTexceEJKQJLDYdZLOL8SS4PVu6L26fMWKDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0LUxGRu6M1umnyDasRxv1iWXBTB8HSglNSzzceqsfo=;
 b=ee2mHRRsywWnepscHCzhyy63nFk3CyHICt/eE/7eupW5wgeAdkMUsnoItEsMqpehZzaQecIxroQFJquPBP5VvMxC8LJotRlF7zVUcsPoHLrNTQOW2dQT/T2qpuvt2XpRw0SY3BImuXLQatGQDksPqUcQv6CYgitVTMAgPE/OJ6I3uMFv2PMe8f6ddgRH2IGizQSBp5fP6FnhixkWbHR8lFMR5yxft0UUQAMuF6cM4NNG/vveYtWD9hNWzj/EvxHmPxtz7cvGcXqivc3GAEQ3aztJK/so2KpbWlhhH1rzUq7wGJp6umzc0CPE+fKXPfK3cNnyYCVGFMJpxjW8+mTfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0LUxGRu6M1umnyDasRxv1iWXBTB8HSglNSzzceqsfo=;
 b=CBTpevhYyF7gtgixlXo8ccRw5eJX7qqLobdNi5DvgjQ+c1iWyw22oKHZMEe2Bd0R6WFSdwVJBRZ288eGW2U8lznXrfzlPAf02NV5CgIP8A0tijN0yDF+Bu/odI4d9N73ZThi3461+vDQ5BtG4z9bqbFSb77z9HPav+lsXNZ8GM5DWVqA6U10SaW2rE311WNhjjJ8ehivTrQs++IGD/Na9behydG7IkHSIl43DiLMNG7oI1UsbmzIBWCgd/mCCrqRvUayT/k8X78uovVzYklIPZA1+8BczpNfA3dok6natJg+ZGeWMsXUSp1hMTzKRFZmNi2+kL79sQbBP0zu2x7mxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fb634bf-d13a-ccb0-a01f-83d7c0424b00@suse.com>
Date: Tue, 7 Jun 2022 08:26:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <0f8f0c20-690c-f02a-e1f8-957462118999@suse.com>
 <Yp4Dhj4UkORelT8D@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yp4Dhj4UkORelT8D@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P250CA0016.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e783c82b-ff21-4902-f7d2-08da484ea2a2
X-MS-TrafficTypeDiagnostic: AS8PR04MB8740:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB874014F9E05764A0BB676F9FB3A59@AS8PR04MB8740.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ay2sViwtM9o9+BxKtGmVNZDbABIdDDVYZvdm048LT/ExwdftFWzpeZWvHbJmgJpYAzBKBzyd7oGGltDvqpZXSvhm2A0iVC944uZncSy3Q1sHHTuFh99xakAAelrsAZHVfbh7GLIOhf1STLIXlvTeTFe1GsNPU0yxky1sazg2kE7UxPTfiZbZsOrDzY2KgmedjsbsAfyP0qlp4LKSw9IpZ5AlLdCEeUos/F/gU0To9xd4jTnoTd1oaqaaioIDPX9eCCqdXrFDFwlI2DHRin3+H2H/yG6IjHLLpgY/mb2v6wSU5KeweD/TylEN9Y3JQxza/dQlaqpnDdQqd8/5Ed8Irp2tQRPGwtKvVcewD+sMiLuzd1A0FUFXAy5Rw/0+hshkyZTtc5Ceo3P0aFin71f5FvoyWNh/7lLa0eKuT26MKFHwdX7XL7/WcKKojXeT2xzpbBvVshwvR+ivUpqLQS/O2BoSN2+h9rfj0Q0YSqjZRNp5OGMieAx0TacJgcvxhaGI+ecSsXr+fad53bm3LlrMrShvlfhQtcL3XwMzoAaEl2n8NqcFT7q1w6c/vmobOBA9Vea/m0tYN5Ht46cLTrt7OsLNeFZVikRqRUOhDDiRXhibzNBmoZYEWY4X8ARwbZKGpToj+DOEosuqTNbXXwKjCzlW4DVmTiHL5Zb70QzakokNWkUx5MtihH2zmy9HyxhaSBZt2yrEkMWHhslN6qO95OxDLjftYh95D2SehgihJGddeZSmqWLY/Fww1Kzs3JnS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(26005)(186003)(53546011)(8936002)(54906003)(6916009)(6512007)(2616005)(508600001)(2906002)(36756003)(31696002)(6486002)(38100700002)(86362001)(6506007)(5660300002)(31686004)(4326008)(8676002)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TENLTzRXQldDd0RoODJkWlVwRVM5TkxEYkdsNTRJbWRwRmkzZUFGUG9PZll5?=
 =?utf-8?B?NkszYXdlVExGQXhqcjhjL3AxRmNralYwbEZTY0YyMjhtc25UWENJRlpKV3ZD?=
 =?utf-8?B?NUFNSXNuK0dLcEh3VUFWOFZUNW5oelhBeDcrWTlGR1c4Ymkyb1VoNk1RN3Y5?=
 =?utf-8?B?VEdkSnU5M3lUbG1jbzZXcHlOUTBQZHplNWtLTmxhOG5MTkgwTHRmS3hSNHhV?=
 =?utf-8?B?Q1VhdlRIcUdhYUJzd1NBajdsOVVKRDM1d1Z2SkNoZlBEL3EzZEw0dXlCWEFY?=
 =?utf-8?B?RkY3S29pQkRqdlpKNC84UktyQklnY2xzMmx6NEtoSmVNRTdDak1FVy9DeFFR?=
 =?utf-8?B?bTNKSW12VGtTR2NQc0o4dmh0bUk5WUwrWmZZenJmMGJQT3ArRmNQa0hMNnpB?=
 =?utf-8?B?eER4TlRmWW9BUjhqSzdmZkxaSStReWgwWGFUTjVqUXZrWTFmN0ZjL0IwSHVs?=
 =?utf-8?B?NmpaVmdPYWpXdmpaTlJUa2dPTUFYdUZHWVdDWDVMVGhFZHplK1U3eTAvYWpO?=
 =?utf-8?B?cDFMdXBKRG01SjFRMVIzOHJHeUhVOFI0UFdKWDNnTHg1dU1scjcvMXFITlV6?=
 =?utf-8?B?RFdtdWhKV3k3alZJUlZ0aXExb1hEY0djbFM1UzZPTEgzU2RsOHdOSThFbFlj?=
 =?utf-8?B?c1JMZW9mZ3Y5TS9tWjJxVWVuUmtjNEFKZkxucVJERGZWNVBmeURJak1oSmRJ?=
 =?utf-8?B?TEJoT0pVNGVNR3ZGMFViU0xRbk45dG5VQ3ZYOG8zV3VnRUtoQmVIOWtvd2JE?=
 =?utf-8?B?WS83YTVuUnFhbUQwcmFDTTJ3OW1JUHNxdVFVNUVvbDExYzYyaW9nU09ydXpB?=
 =?utf-8?B?Z01XMmg2MlNkWElvRDBkSjQwRm02ZytDd0dMdVZGczJYWVBPd2VWNGgwMmJu?=
 =?utf-8?B?a3dBZGNuRjNhc0RESkIvSHJlNXBubVBzRVpDMW5DVWlQOWR6ZzNpd3BuNTlh?=
 =?utf-8?B?cThEQmowSi96WC9EVzEzWTd6blBVdVljZ090L3BZblZuOFFON1VndnVnd3BJ?=
 =?utf-8?B?Nm1PTm9ZS3Rkc212bVVNV3J0K0ZMc1lyV3RaOUtucWhVeURNbUxZS3FybXlZ?=
 =?utf-8?B?SCtFaU13bllZaUlWRWErcEs0M2w0YW1DWVhWaEJjNXh1L2g2RERPZitLdkhN?=
 =?utf-8?B?RFpwNEVtN0ZMSDd0ZjQ5WFhVVmVzcWh6c0xwb2h2cTFRUDU3S3BuOUdDMVZV?=
 =?utf-8?B?R2dlemZKVFF1VUhaRmZzRXFPT0ZBZmI0dzltbmlLK0pwREgvQjhyODE2R3Vl?=
 =?utf-8?B?c2N1dXdkaFJYM2dLT3Q2Y1ZibmVNNzgrTlFjb0hZZVpIMERUdUlmVkQrWDNs?=
 =?utf-8?B?ZExVUmtjZmRQaXl1YzluMEwxL3g2WVlGZFQ2QmtIajN3ZzhIZ3BvOTBIN3E2?=
 =?utf-8?B?VG5uZlQ1U042SnhsQWQ4UmFIUk5meU1ocTlnc1o1WUpJQWtBb3lCcFFuODFt?=
 =?utf-8?B?VmxNYUxFQ0J6QU9WdlJEOFpUN2ozNGZsTjlwUUhWYjFyM1FwblFhaHIrNG9C?=
 =?utf-8?B?MzRlYm40T0pCUXJFbWR5dzk3V0JHaythazJ3RGVSYUlRZVhaMW01UXhYT1N4?=
 =?utf-8?B?SUFLbVllMmoyQXpmK0lqVVNNYVdrNGhiSVFnbVUrVWdvWnA3MXpzLy9JQVZB?=
 =?utf-8?B?M2Y2K0gwZWVKWUt3dEgzUlRwbEdXVXdQVEFIL2U2ZDNqOVVkdU1qR1lDVjF2?=
 =?utf-8?B?T1UxMzVRcnR1d1UzbFpWRjJUVU00bmVWblJrSktNNWVEaEtjVW1wdkx1N0k2?=
 =?utf-8?B?bzhVekRSM1orOExWbkd6a3A3RWRmdFppbjhzU2ljYzgzTmZCNlJlRjMyVmpR?=
 =?utf-8?B?NnpvR1ZXMnJQemlyOUtnUEo0Um1UdEgrS0lhWitsY256UnZpcHBJMVFiU2pz?=
 =?utf-8?B?RU5kYVNNaEp0Ujc1THJWS24zZXEzS0dwMEY0VCt0RkNXTjIzOVB1MTJMbzky?=
 =?utf-8?B?cVY1UlRLNzdreHVWbnBGcjFiM25WNC8ydVBoVHJSVWNQM0NyNXhQbTNQUmRQ?=
 =?utf-8?B?R1JMNmVZZGxZTGwyV2VVS25iM0tvRTNrM1ZoVDAyeWhvZ01oekorMjh5WkJu?=
 =?utf-8?B?NlE3eTRMaVhJRjZudE40cTBVVUxUZUU0eVBPa3M3TTVLTks3RWJDWU9iRmlC?=
 =?utf-8?B?KzhUTkx5N0NYcEp1WEVxK3ZiU3dhNlZ6bFlwc096dnhHNzBJUXdMclZ1bXVV?=
 =?utf-8?B?WlVZekVSenVVKzY5ZkZOaVdybEIyU0QxOGJTTWlMTUJSYkRKTUVDVDN4TUd2?=
 =?utf-8?B?bXNTU1ZUbFk0MW9vQzVqemFERWZRbEdsZnBNdUdLMXVNb01MOGZGNkNKMGYv?=
 =?utf-8?B?YlE3RnRVNXJTdVBXWnA1Q2xHYldRUFRidXhybEZMSUg2LzVSSCs0UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e783c82b-ff21-4902-f7d2-08da484ea2a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 06:26:20.1147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSO2vLqBHfTeUScyyg/cKDA/TizWnapZdINRKu2NqYvasIhYyRbwjjWaZOVA+3gNM3vgFl7QkjOPqIsvpmcZug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8740

On 06.06.2022 15:39, Anthony PERARD wrote:
> On Thu, Jun 02, 2022 at 11:11:15AM +0200, Jan Beulich wrote:
>> On 01.06.2022 18:59, Anthony PERARD wrote:
>>> Use "define" for the headers*_chk commands as otherwise the "#"
>>> is interpreted as a comment and make can't find the end of
>>> $(foreach,).
>>
>> In cmd_xlat_lst you use $(pound) - any reason this doesn't work in
>> these rules? Note that I don't mind the use of "define", just that I'm
>> puzzled by the justification.
> 
> I think I just forgot about $(pound) when I tried to debug why the
> command didn't work in some environment (that is when not using define).
> 
> I think the second thing that make me not replacing '#' by "$(pound)" is
> that reading "#include" in the Makefile is probably better that
> reading "$(pound)include".
> 
> I guess we should add something to the justification like:
>     That allow us to keep writing "#include" in the Makefile without
>     having to replace that by "$(pound)include" which would be a bit
>     less obvious about the command line purpose.

I'd be okay with this, and I'd also be okay with adding this while
committing. With it added
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan



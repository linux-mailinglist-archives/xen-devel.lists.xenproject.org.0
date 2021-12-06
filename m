Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B9C469740
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238937.414139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE9w-0006t1-KK; Mon, 06 Dec 2021 13:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238937.414139; Mon, 06 Dec 2021 13:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE9w-0006qv-HG; Mon, 06 Dec 2021 13:36:00 +0000
Received: by outflank-mailman (input) for mailman id 238937;
 Mon, 06 Dec 2021 13:36:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE9w-0006qp-1N
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:36:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 724cc350-5699-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:35:59 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-efPC-gXYPD-k-aF7yfLXpQ-1; Mon, 06 Dec 2021 14:35:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:35:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:35:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 13:35:55 +0000
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
X-Inumbo-ID: 724cc350-5699-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwCd0k1dZADe9T46w75OhIlRsJRPbYwLRfHEwwId6XU=;
	b=MqBZfLUJ5v68pvSdw4PPY+I3xg1l4XEJZkDQu62Vj0MPFRs5+EYv+J5rLsVRuPlyS76od/
	C7jr6Dv9/ki0gewhiq8WzL5qbLrJo0NaKtWJRYIWJ5z7kJfDKMTz0w3hCtjanZt0R6fAgr
	aEvhk4TtrMWRQmoldqkEznSjl0vPaJE=
X-MC-Unique: efPC-gXYPD-k-aF7yfLXpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDA/qV57OVeITELoC0D4pCtwDi/5N7RNspqIfQlTlMCH1Zxnv1Cm+hNE+T+J7r1INEekgE/hKnPFDV387re3MwNdR14P7eqFlMZcAXu+iyS++DQ5cwXNBXCeylYD/JEgJxVK7RJ2SQ5JwhbKOYDPd+I3imS2CaGAxzG2mz86e5mHFmdYjrg4KBXp5D600C+hZvnoh/e4ZJOLNwvpquFozq37Jq30SNxpK3kc4J1mubG1LhVHUpixRseA4WgovW9V7jeaxTEY2kVs8sKXJGfRWn50W58HNCGnnWnFmmM31N74C8uevensF07ul1IOUAMx6n6ugyLjxe8kcN66C7p7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwCd0k1dZADe9T46w75OhIlRsJRPbYwLRfHEwwId6XU=;
 b=dfqxF+S5qYCkYVtoQAUHh8YBAXyNrhoixqCqjVdNmRuvu2qOS44+b+VRv890UylKj+x/qXLi/4loeSteAw6CMOJU5JFVAnl5IpS2Kc277IzRMvDZsJCjWMiNrTAFclZgGbla2q/KOP7PF7XoCdnJ7rMUfFl3vMY9nLspRViBJRsj6ZDRVS7GG3Zwt5hWozpL/4n1lrn1kPhTUG6dYqkKNI4RdrcNoync9950XH+YpAz80lbefjcjVGCvXscXwILtoxdI5sTri+ZQkzmv5ZrN0Yqea9MUR1aXx53+XGU1iL0PwYQgn2kQNYuImLODS00toQ9VfH+EmTj6Y3TsiSgh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <526c1f1e-3a67-91ca-a69f-0d1f5ffb2ce4@suse.com>
Date: Mon, 6 Dec 2021 14:35:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 0/7] (mainly) xz imports from Linux
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
In-Reply-To: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0077.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ada3803-e281-419c-b3b6-08d9b8bd54df
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741E42366F63727520A9624B36D9@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kkLIZUVcytpHhqNYdZdZWwCnuQRrksJsZGZLU/qTs7E4YzNtO5zKreX8gGjgykucJ1oen6c7C6xgZDoZljlrOUqCMzm3vppfKfvCLNn6scK53lqvwaY7+ja4Z7ZzJT4PQjM29LpsohKZXt6KxWqVxDn6fSdnx73v3+ai33wUNzAWRSkQOjAFHfZV5qCcb2lSHxfZQIuFwrHeHVUk9JvItPgTaoqGXhNuwFglYeYMFpCSjw1GmUXRUhVfQ3ubmnAgRk7VFmlTAXO14OZqspk8PxuzHuB5QTAySX1ko02yTUqiFXSeYIvDcXmuHQZwW+88uCGCFvn9ZUQwQX6fBIFJOSXPNx0HZPPVH47WyhataSNK6niwbsm+7srkMc6JOexNTo88XiYyFbOIAH+Jh5pBxQ13OuuTALgnYncSYEqCRnhS+hHomOHzCGMfoEZveFTbCRPuslMjBKM4oNN53KevIGL2f5u9JfP6o0K4WuZZhwIsW830AporWkga4XWpix8E99ICJSKRy4DgJrDe5epmt2P7g2DRiLRwhn7Us0oiqyDC6l6qb4vDLl4568gMESXK09iq2fEwDKIgjdEhvmw/avybZnMPTC19ES+zOkvZ6ZsYHJHBlBeHdXprviLdrVbARh9ikI5sj5QUX/cSnMzEJnjMYyfzxBN4uEFob5efIHcgef/w3EOHg1fWz3pfFyecG4WJ3QRuHH5xtV7aol+X0/lyPoSmA5boEP7YFElTBYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6486002)(8676002)(83380400001)(956004)(186003)(26005)(4326008)(2616005)(38100700002)(53546011)(86362001)(31696002)(36756003)(8936002)(66946007)(66476007)(66556008)(508600001)(316002)(2906002)(5660300002)(6916009)(54906003)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZuUkNYRWk1MDdKenFETGxJaGx0ejBHM2o3ZVhLTmhQRTRMa1ZqUm9Wanh0?=
 =?utf-8?B?V0swaDAyUHFJdXh0TUp3STBnc2E3ZlY3REtScjB1T21meGk4S0RUMUpxdEhQ?=
 =?utf-8?B?Nm8rVGUwWHJWUHVHTWU0RVVjNEpmN3dDL3R1SGNSRmxHWVJpTituM2N0akhQ?=
 =?utf-8?B?dXVZRmlzOExOaEdzdWQzNFJwd0JrL0lYM1hRb3RZVmowaUJVaENDanA4aXFk?=
 =?utf-8?B?YjNSSGZsaGJrUHBCUWphSktiR0o5WGtXS21TazNOYVB1NWpPcVJUTlVqbzB0?=
 =?utf-8?B?a2Z2aGxEZU85M0ZzN3Fwb254Y0hDenF6QVEyc2dXUllQK2lNTTN3QmpuSUI4?=
 =?utf-8?B?Ni95WU1xTWRpMGtoNEJZQUZtc0hEOTg4RFk1NFFodzU2dUVzRmNiR0lZVkYz?=
 =?utf-8?B?UUJGTWRmZlArZ2hCSCtwTmhFNDNWZHYrd3NUcS81cjlJSS9GK0tYUjRKUTcr?=
 =?utf-8?B?UUVMbXRzbVZ5UDdydWIrdWdDbnB4SUdlRWcvZUl4Rk5sK005SFpsakR2VkhZ?=
 =?utf-8?B?KzFlQlpHTFBVemk1bGh0QWtUMnBFK01zOUdhYXlVQzhnZ21LYXowdnNMSnZL?=
 =?utf-8?B?VHZYSUh3Zlh2bEtDTVgrcWxUdnQwMnkwSjhOd2FYVWNSZGVGWDhES3kzd29O?=
 =?utf-8?B?RUd3elhjTWxSNWlRUDZmNmY1T0ZRSWNPdStEb0JoTTBiOG1lemlvb0RqREhz?=
 =?utf-8?B?aXl0OUxHbDNsNm5OaTBIOXlzT3VaR1d3ODNwT240aU5PdTJSQmJtMUFZRGwr?=
 =?utf-8?B?RXVRRUNqVWVMWElWZUwwYWZFYTRJaXNEd2NFZmwvZDBhUUoxY2JNQm0xTU1v?=
 =?utf-8?B?R3ZsR2VrbklWbmloVGYvSmFKa2lXNC9CaDdGY1lFY3RpUVl1VFRtMEpZbFIy?=
 =?utf-8?B?b09uYnVmZThvclptTkJUdlhvclI2SVphbUxreTFybm1teVRSWEM2N2pDRmR3?=
 =?utf-8?B?QWkzOVpHbFlYeHVkSTFzWjNJd3BZZEUwMWFDRUUrWHBPT081SkdpZWZ4SVVG?=
 =?utf-8?B?cWlZNEd4UEtlb1A4Znkwek1SSUhZN0JRWVBKNEVNTEVsMC92NDVTWjRRK0Q0?=
 =?utf-8?B?ZFJXVEc5N3FaRzVHMTNpc2tDanU0RVlHZjdHeXd1NGVLc1R5RXl3TGY2Nk1F?=
 =?utf-8?B?NWpTaC9NSjk5TWJBNXd1clovTUVNT0F1VlJzUUlYUWZvREhydzBLUjkyR0VN?=
 =?utf-8?B?SndNTVZqSTFsT2hCNSt0LzErVXd1QmlIN1ZENzVySVEyMDBZQmx3ekVUS2h0?=
 =?utf-8?B?VVo1NzVzYUo3c2RJc1ZvemVxakoxckY5dzZtcUMzUDBhcUVkWU92UU9XbDRl?=
 =?utf-8?B?enowcGZhM0tWMG9RcGNNVjIzSFliQTdQU2FxRzd4WlRVS1FQRDNpQ1I0Qy9r?=
 =?utf-8?B?YkZZTkx4Qm41VzBYOGxQZXlxNklsT1BKZk5WNFB1RXd2VS9xc1g1ajZiaDd1?=
 =?utf-8?B?SDdTU3FYblB2OVNLWkZKWmlkMFlyMjlyMGk3T2VEOEY1U2xRNVVSUG51R0NC?=
 =?utf-8?B?S3FidENnaWhNWTEyYWtGbWJKYkxSenloYURKQWFTRkhYdExjbnRlelh5R3VQ?=
 =?utf-8?B?aFZpdkxvM1EwWFZlQWZUdUY2dTVSVGR0Tkc3ZWJDbDJneHNuemZiTUFQZ2lL?=
 =?utf-8?B?TEdrdmthb0h2UWpQSktmU2RzL3c2aWdXaHRLM1VwWnRhM3VoTEppV0hMUUZW?=
 =?utf-8?B?SkpnNU8vMGZ6QWhxV2xGaDErVnErWWY1ODhRVXBzWHRUcUswMFRDVXpzU0Vw?=
 =?utf-8?B?Q3lDZXpUT0ZWNEM1a3BrSithYndENWF3ZUNoMG5GeTNCbXVDK0xyVElBZWVY?=
 =?utf-8?B?V0ZTUDJFanhWRXNSdTI0eFNBMldMb0NYZmw5WmxaUit0eERtaHBtYll1OUtq?=
 =?utf-8?B?OE84eTJZMGhsVVFvSFcra0xHRWxsbUd0TDNmZm80K1l6SFFVaWRSOWlpR3hs?=
 =?utf-8?B?MGhLWjVsOWFKUFlCY3J4Ty96NGxSVmJ6eUZiMWUvTHk5RmZ4eU1WSEQyRWto?=
 =?utf-8?B?Mm1hdmxvM3pWUlRZaDJTTk1PUEdLMWFnK0RlV1h1UGVpS05GbENuMlpHUFJ5?=
 =?utf-8?B?N0JOYzVUWmIrWnQrRGd3MTk5ZlpubWNaM2c2Qm1mY0txTHo5bDN0cUdOcGlz?=
 =?utf-8?B?RlZDM2ZkY1JOVTQ2Y0k5SGFxRzhLdFpBYnBOYmxZbUp6S2tHNkNNaXlRRVRO?=
 =?utf-8?Q?ONw7wUwiBUDHs3go6vOkRJw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ada3803-e281-419c-b3b6-08d9b8bd54df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:35:56.3301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fj/pG6cVQzLhe61+AAyJfnvVGDpO/HgWmXLWcNK8s6cauhW4k6KAsabhdGdZc33YnlxaJAmFLK5d/zFeTivuPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 06.12.2021 14:29, Jan Beulich wrote:
> While going through their 5.15.3 log I did notice two changes, which made
> me go check what else we might be missing. The series here is the result.
> Linux has also updated zstd, but that includes a pretty large change which
> I'm not ready to deal with right now. Them moving closer to the upstream
> zstd sources is certainly a good thing, so I suppose sooner or later we
> will want to follow them in doing so.
> 
> The only change in v2 is the re-adding of some previously dropped S-o-b
> representing the original, documentable submission flow.

Oh, actually there was another (benign) change:

> 1: xz: add fall-through comments to a switch statement
> 2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
> 3: decompressors: fix spelling mistakes
> 4: xz: avoid overlapping memcpy() with invalid input with in-place decompression
> 5: xz: fix spelling in comments
> 6: xz: move s->lzma.len = 0 initialization to lzma_reset()
> 7: xz: validate the value before assigning it to an enum variable

The last three have been switched around to match the sequence they went
into upstream Linux (IOW the order spelled out above does not match the
actual series; I'm sorry).

Jan



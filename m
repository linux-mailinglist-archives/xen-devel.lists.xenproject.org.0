Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D77845423B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 08:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226615.391654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFqM-0002BN-B6; Wed, 17 Nov 2021 07:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226615.391654; Wed, 17 Nov 2021 07:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFqM-00028T-6V; Wed, 17 Nov 2021 07:58:58 +0000
Received: by outflank-mailman (input) for mailman id 226615;
 Wed, 17 Nov 2021 07:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnFqK-00028N-ND
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 07:58:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35f8f8cd-477c-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 08:58:55 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-SBwRWn_OPeKYtTUHnVqhZg-1; Wed, 17 Nov 2021 08:58:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 07:58:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 07:58:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Wed, 17 Nov 2021 07:58:51 +0000
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
X-Inumbo-ID: 35f8f8cd-477c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637135934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TAU8668aoQAaQgi26rJKscd5joxlTGYJbu+sCcmhmn4=;
	b=LaD1NVDnL0Fd4ZNMN17ySxzCxPuCePGutiyORIojI72UxlNzaN0NnSNdDr99WZrWm+2xd0
	NkEyPqE81OQDL8eH8dGlBtPNKrW31hLJ86TktWfK1W4Ylry6a+NWlK1eG3vqmrgDBxYzKd
	7UPAdD9wiVMgMVUoiEsVXV7/be4wKK4=
X-MC-Unique: SBwRWn_OPeKYtTUHnVqhZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzJz0C2F6NlWlblddBWkCPc5nNnmiZdkfmkqajaDkaopGt/YM5zOmQqXx+cf1FDvexoY3Vo0JY1MVGt6fBnwBnT3fE51LV2iTivDrerJCUsSAXZgXZsqYN4bME/SZXe7/maqAwBvY1+5g/CpweHVQXTiBEcv2GpXg9Go4gzogpzuoJZuuFfh0JRp3e1FwRLxSv3DoFNiE5zsAw4ij1ufo7erokEUNRtmZPYP2YuudErJCZNLSyvQYDl5TP89pmXsiC2k5sT+9Lb19OUeGHYd3XtfAg3RYLqCPJ92GSMeoVA9zsaiPnZhcMiZAC2eOWsUaDPTybENmVLmKQzgbAlFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAU8668aoQAaQgi26rJKscd5joxlTGYJbu+sCcmhmn4=;
 b=VhrNWAX/stTsCVSx4Mk9lAYsgyzNg6axdwyJca6jrl7IqVHiIhiLDSpFNMv8E3hfBsvYvQH5X/3q5JMFk68IqkG3Mz4l9GENgsBtlSkDes3pc7Fl2LPivBK2vDhSfc8opxmPY5hczjsqgD/vb7zeww5v8LGbCOAAnPrdiUfkT4vuYGqGCOdjhsvXW6A/9QykCgRZuSyWkIWnLyKHgh1x/93kMvAYTbdXBOBjtAI8DMce+8xbHEItEBgC3I9+Gri6vY+TSE5KH3cv0Jyl3m1A1nTkYn6KhVn9snavTU+IFniOXE+YG21PHAh/rH3gikguYulafd50bvh1lVP+CBPStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ef681e6-0274-7b84-494d-29d2c3b3870b@suse.com>
Date: Wed, 17 Nov 2021 08:58:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: alternatives handling adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4a25b60-b9fc-464d-44d9-08d9a9a01847
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23364977943BB97005D3FD9CB39A9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FqsuQGzopIz1srzkqGy0aA15AbNCKXMyQlDVMLMewce74DXs/wWopzN+YUB31bDhpotwdFHprHkeHR/cnkZQgKsd195DXYXOT+HNYIv/oUYfUdbZo2u455ReKjJnnVP4SN/UIZSjXtIfdNfXd7nOLyo4d+kq8g1P1CIM+TSAihHDgAVP6h6Bpv1cFHO1WMM+1C1C6nIyJYS8PbUZxQnNiQWXW/U1Wt1zFv73kKl7R97nEGQvw51A4CUDAb7NnT8gqbf69qH6j57yYjNF/0WiuHgHKD2iDVeY8Ah+qOTFFK/zfb12vh3Ly6IGVwNe7mMINnMuUdBWYZobSem7jQvBxMk7oZlchtY4UHxtg75g8t/YWO5VGvCN92Jh41Qox+sLHtoJSABZkKkLRAxKskf7aY4jhOCYlAband3xaphxg5HReHW5DwkQIhMG83GUEncs3y5sTLgn3lMBzHzFQtGYUMzSZ2V6/wVw7chQ6gqq1DGDf9ifyemmlMIc23aDr40Vz3IXACeSNzUHUKsa2IkVCF4cadEZntTfTM/rBLfFqWPMb3W4kyR1kcBn1jSnty1WTaiHwBGb8eDS6q4YLiFKn4KHgn/dlqnNkB2dT/Aj+1WcFjAOa+1PWbXu06xDUFAGfqcnLLkAtBDR4TwoZPsBkLXAzoy7F59titVJ4raVc26nor9b/z/5lBNaWHbpzmMpgd8XIoIO/g0N9Sp/3waP/eHEzZQ3eo6G9omr5x57J8+IpuC6qI+wZ4TnB1bTYff3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66476007)(86362001)(66556008)(38100700002)(558084003)(16576012)(5660300002)(316002)(66946007)(8676002)(31696002)(956004)(4326008)(2616005)(8936002)(83380400001)(54906003)(26005)(31686004)(508600001)(36756003)(2906002)(6486002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVN0cHVxV3VlNlp6cElMRGl6angrR2ovREp0bnFxZHczbXpDc1VTQ2RlTk9E?=
 =?utf-8?B?VzllY1BTZ2pwV0ZFWUU2aE9ESlRsYzlSbkVwaHduUHNlb0krdE91ekVoWXJ2?=
 =?utf-8?B?SnV4anUreGxlWmQwMytpelNPaGtldkE0bmtrKzBpT1FSakQxOXJDMHlrK1Jv?=
 =?utf-8?B?S1RHWU1aYTZZdEFvaHJSM2hrRHZQajd6V2FsUCttaHJTdzljcHZURHRZV2RO?=
 =?utf-8?B?M3lGeTN6a0llTTV0VlVSeXhXRnFTQmVJSjkwejFzNWRGSWVBOHJuODJzZURK?=
 =?utf-8?B?QjVlM0Z6YjNPNXlaQlJBM2lXekMwWFp6bTZSdlZWWU1jY1R5TStVWkN4OGVY?=
 =?utf-8?B?cjd2RlVCdDE1Q2pZRVFqOCttRkNySlM1bDIwYnlKNGFvZ1B3Z0F0V2xQRWJB?=
 =?utf-8?B?SlV0NjdtR2VWSTFEb29ybzJFZEQycW92RVlIZTVCU2FjRmVoRFVrcFlqcGlQ?=
 =?utf-8?B?OFZTNVhRNDJnL2ZxUlIxTk1ZUUJHbEFTVFBiNFpBRERzUUcyM0J4Mmo3OUdG?=
 =?utf-8?B?ajRDQS9ha0VITXp6NW5xQklQdUVRdk9meHV2RlNOd1pvMGpWV0taMjgySlZx?=
 =?utf-8?B?L0N3ZGMzMGFpZ0x5RVVZS21BRmk0bHh3ZTJpQXdYeXFGUnpRZVJKQldmZUxZ?=
 =?utf-8?B?b3U1aCtwY2xNWlAwMG8rZXdKaUdtSnVqejFVcWl5cjFhWGRZUVJ0cTgvM1ZM?=
 =?utf-8?B?Z0dMQThFZjJVYmk2eDNnWU5BMFI1ZnM0QlprUzJEQlUxN3lNUVF6SFcwNThL?=
 =?utf-8?B?MmU3K3VReE5ROEtsY2p3VjcwNUI3cHZ2aFlwYWV1RUJKd3VuU1VJQmpQUGNq?=
 =?utf-8?B?L1VPSUpoVW55QktqaW5ZbWpLR0t1SjRpbCtFZS9EQ2FRazdZSFU5N3A4NkVO?=
 =?utf-8?B?aTYwc0c3bWs1ME5jRnpTSUtmNTlqUkNPeHp5cEJuM3k5ZmlKdlFGR0JQSWs5?=
 =?utf-8?B?SkxLWTVhSHJ2M3BoL1FreEVxL3U2MDBxcDRJZ3Z4eG9mNWk3cjJkVGJXcTMr?=
 =?utf-8?B?REZCQ0hSWnhwd1pwcUkvcFkvckMwbEJzUDhRNUdYOWpnS1RNdFF4RjZhcC9O?=
 =?utf-8?B?b0hEeGlsaS9aeXBUTGZIb1Z4cEU1ejlCYlowSThjbjErV21QRlQ2Vm83QlRt?=
 =?utf-8?B?clkyTnl6dTFYWFZabFhZenloWm9QRDFQRkdiK3JNR1NXU2lIbGdnbFZFSUYx?=
 =?utf-8?B?cTJOdnhqZEV6VFNGSXF2VkM2c295dzZ0UmRHNmpQa2FsenphN1lDR2VPbHZX?=
 =?utf-8?B?Ym5QaTBSRzExaVhmVG9kRnhIR09CcHRVRHdIZnQ4Qkp2UXg2V09vVHl3M25j?=
 =?utf-8?B?UC9lbDhDY0QyeDlMei8zSlQrSUdSQUtTbmljTnBuck1nbVFMZ0dYemFNaFVh?=
 =?utf-8?B?SVlhd0JhZ3YxckgrYmJzRWR0UGhEYllQNm1wdnkxNENXNWhEcmt6YThEL1Ir?=
 =?utf-8?B?U05pOENrSHlpWGNtS3hSZU1FZXZid3AzVys5M2ZEbHJJbjg0MExpVlNTTUFq?=
 =?utf-8?B?RndDWWt4a1R1QjNqWVdNTjQ3QXpBWDhFdEhKOXR2YjVOdGZESVVKM1QwYVN4?=
 =?utf-8?B?SUpNbGNnTWRTYkEyYjYxN2g2RUcyK29PL21Jb1hDNGpIVHkyVFZ6YXU5OEhB?=
 =?utf-8?B?Q3pKZTF2R05Pb0tmRW8zVWZFQyt0RWorRW5UMHR6bU5TdWF4VmpJRGs3Vm12?=
 =?utf-8?B?OXBKZC91UkdxRlBFTHlIS3FRQ2t1VndPSWgrTFJDM1ZiSVhpSWJaVlJSaTJY?=
 =?utf-8?B?MkFJMUZicld4aVJ5WVNOSk54YWNxTVVOQ00yLy95L3Ava3p1WGRxTG9LeWpR?=
 =?utf-8?B?RDhtNXQrWXNhU0FxZ1cyRnRkUzIycjlJMHJlT1BCdkRJV1ljSE1ITjQrZXRu?=
 =?utf-8?B?dmh3Y3k3ZkZWY0VLVTd3cWNjU1lRUmhjeXlPMjNJZ0tvcjk4ajB6SmpjdE9m?=
 =?utf-8?B?M015NmVOV3Q2R0JsVDhPanZSNzV4V25kd2xmazVrWUlnb01BUkR4NHJSRDVF?=
 =?utf-8?B?SUcycUd0NEZSaWN4WFIySE5qaFBwejVpQjYwR0MvaXM1TEswaHZET1ppK2Zv?=
 =?utf-8?B?ZTJnTFl5WjNJUmRqa3QzR1J6a1FoYU8ySjZxN0RNZEVQdzZWYXdLWEpMdWly?=
 =?utf-8?B?QUN6cmF5b0YyVFBFOUE5WlROWFRZdkgraTN1QXcwYTZ6ZGxxSUh3Yy9UQVVU?=
 =?utf-8?Q?WkWx6aQ/jlexAwCJ426iGkU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a25b60-b9fc-464d-44d9-08d9a9a01847
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 07:58:51.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWk1W/fVrsx8uaLhZ6FkPlkqegqSBwfYmShWKajFZgTNsn9HAeWrfdKRBKVdLv5YotdOG+D22iJRMK5XTUxuIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

The 1st patch here is incomplete and hence RFC, while the 2nd is merely
a tiny bit of cleanup noticed on the way.

1: allow replacement code snippets to be merged
2: adjust alternative_vcall0()

Jan



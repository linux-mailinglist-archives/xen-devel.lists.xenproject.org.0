Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6382500FE4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 16:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304811.519585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf0Ki-0004uM-I1; Thu, 14 Apr 2022 14:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304811.519585; Thu, 14 Apr 2022 14:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf0Ki-0004qp-Dp; Thu, 14 Apr 2022 14:20:28 +0000
Received: by outflank-mailman (input) for mailman id 304811;
 Thu, 14 Apr 2022 14:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nf0Kg-0004qc-9F
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 14:20:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06c9d52f-bbfe-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 16:20:25 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-7QDFHWLWOV2FtGb6eOWJoQ-1; Thu, 14 Apr 2022 16:20:24 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0402MB2854.eurprd04.prod.outlook.com (2603:10a6:4:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 14:20:23 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 14:20:23 +0000
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
X-Inumbo-ID: 06c9d52f-bbfe-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649946025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HIpINN10M4B1EE/hnQMA0x4phNaVNsddRcEiCwGhGac=;
	b=c7Bt/LYzsq1if+6XHngo1gD7YI5Jim027iayMdgMxTN+bieTyhnOYPu81lfSI8nDAMsnti
	12rX8GJo08EVZpu33ww/cfGYgMaGy/YDtMUcXP1bFjOXR2+KhnGzCwsy/et+y18CQMoRr7
	M48iyznpasWvBS+cOWySecguVZOzE9A=
X-MC-Unique: 7QDFHWLWOV2FtGb6eOWJoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLfFBv7GlmQuYpAuF5mJGN5gmA3cPALHW2+9qepQUbC1A/Y5TH5KA6HDzoe7CENQLv7m1fL+6CFRthtAi3WKTo7sRfxo5bqgnNSHhQZ+g1prF4ppzvYYFTRN4TPDHy84PaccoeM1C1ohZO6I6OtkviuRjpC1yxB87r0z2F3Nu5Iqy3XZPvUtqxqRPMM4RIEvd0ofhAViFBL54F+SpJHC/jszP/vFxIxSCxEOI9z8je1gvH/yvvYTDBlbvCwZhDC1L49O2ykM+25bhugQSJ3mOdcI2aFCsGyZszDxZ6SC5s5QffmkLeuJKSutsOtl0Qxo2c9vSW7z3n0jZk0HiIhIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIpINN10M4B1EE/hnQMA0x4phNaVNsddRcEiCwGhGac=;
 b=S6HhldSFYsODfguuoCWhmbIrNLJkUMmMhTTqAYs8djQjFCd0zVRaJm2b0lX6T08y61zepUqjmNZcFP3y6rVlXTvGVhimzBrPr9+r3wY0ZdbUhzcT6GLSzat4J2gplckv7iNYYEP88zzocHgQz3vD3CwooKwZNTz1LOYxbYTUDgX9E7m4BCNU78Pm9EpT9IcmKqOC0/HL2C7vH259HxPuHyXTiLZ0e3wN2cAC1xPGJcSWhrAcq8CeBbcfW4b1t2Ckei/PvrUr1KfaXJ470egpo+E6odBScRa7Jk4uhulAnzNe0iJHfZTMtQTOUHuT5Ikn9+cubMCp0dDYcE3uYCsp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d846f9b4-4404-668e-4045-7ae07fc79583@suse.com>
Date: Thu, 14 Apr 2022 16:20:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.14.5 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b477532-cd0c-41ed-ec4f-08da1e21e9b9
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2854:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB2854EA403C20BA1FD72CAFE0B3EF9@DB6PR0402MB2854.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4mIqEVNk0RcE61elEf25dZ+l0jjBqr8ehylKKnlD7cYL2jVxee8SSjtV+ToFOi/uQgUJNQIiEOjdY270q2Al7KwEA2U2eHW5E0UM2T2ZcDuDZVqimzPim+trTfjp6DCL8nj4k+dBBnnOb4M7QSwYNp32DE27SURp4XIz7QnOnmnPNsyaxDQpaAWgzOKU3q0L9a0rn7fNL3TlLkKScmOKo3ZjuU0k5PRfrNTn9UGNW8XNrECttedoExVBMEgeSLL0qwPgxGFj5xseA83P4/NJoRBkIneB9H6uTuQLkdCjuHk9Yfz9oSHsIfgY2V19MRArza+tpuonE6KEDvXT/xaqudztU/UHjk0TCxYFpncptO42Hq+nrzpXU47DKnGNtUsaDgmXvVk2wPN5d7rVh8atImhQvuNIhKe0PfaCrIT4oKQwmk7uFRbEak2NM2L11eq3/+HjLXZD4ZCb56pzejVmOQlwn/bQHSpqhrYsc8DIXWaUsFOx8adEWoaflayp2mm50LqAHIK7c8QhdPoPkrlLLTyKlu3gXYUij/FrHfQ6VKh4zK3VX9j8/WyidCQIj+jzYgre4W7ZHPQRu6YRoHBy/xcm9L0EJabhvMdnKYz3r8o5a0BjK0d4cjd1golKsVE4OUMHu5At/GrXrzP4KZ/D9GnIrDgss6C7wSeRa8IVRjyOSXrfNeVygUSIxSUu9T/QbGONfxaym/Hg2Hw+YAgUi7JkVhdLxeUnNNMZCsH/7Cx2X7OfJ8ZBvSBVv2BwqPehbZzVmUd9TE96+j1qm0oOx5OAmiCsUlKiKmyVqaS+lo2zWg0cbhlHZXK/6wT6SOGbGY6cL5HBllKi78SYjnx2MA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(2906002)(6512007)(86362001)(5660300002)(6486002)(4744005)(7116003)(966005)(508600001)(31696002)(6506007)(450100002)(8936002)(8676002)(66476007)(4326008)(66556008)(38100700002)(36756003)(6916009)(316002)(31686004)(26005)(83380400001)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUh5djBnUVZpQlkxRU1uUzM0dzdsWVNnWDBoWnNhZGQvRGtlaVFhNnBhcmNJ?=
 =?utf-8?B?a1ZPalNTWEVIc3hLQjFMbUZIVzBXbkZ2RWxLT1hQeFNzelRpWkVYOER2QXRa?=
 =?utf-8?B?Z2Y4Yy9zYmF2bW5LRzIyNXZoQ0RkT2dZOFJNeHBya2pKTnAvaWRkYTFWd1Z6?=
 =?utf-8?B?WTM4eXptWnVhQk5FeGtkNGMvSHZFcW9kemVJTHQzZ3ZEMVZtc3IzdVIyRy9S?=
 =?utf-8?B?TWppZmRsb2lIajNwd0xoMzZpS1k5dVpkWkF4bWtVdFV2bERKM2tDeDJ0WHJX?=
 =?utf-8?B?V0ZwNS84czhPVmdhd3lIa1Q5OEZmWVBtRG81S1N4UGFDeWdlR0dMc3dEQ0lp?=
 =?utf-8?B?L2xtNkJZRDNsRXJ4NmNodXJ6dzhabWFlU3ZLWHdkcmVOZVNFeWNDNFcreDd3?=
 =?utf-8?B?dXhpdVBGRk9iRzM3ci9kSHZtdTdSeGxvNmFKbkk2M3p2T2tOM0xncUxxS2Nm?=
 =?utf-8?B?bEdub1c3TisybElsd2tzR2xzWFJjcHFOTks0MDg5bUlUWjBVWXJscWc4WUs2?=
 =?utf-8?B?MVI2WWNpa2ZlRE9kSFlNMEIwUFdYbGxxMnVzMlRINmxoS0FZWmFGYVc2ZHFa?=
 =?utf-8?B?K1c5ZmhpMG5STXlXSDUzTzdkeDI5WlEzV2lBSEFrOVJFRlp0TmNTWmhnU2FL?=
 =?utf-8?B?STRoWmE3NnRTQkVQNG1UbE9ySEZ4UUU4Y3NhMW5INUVHd3JsTVRPa2pYM3V1?=
 =?utf-8?B?QytGSzkvK0h4QWQ1ZHpkN1dLTDk5S2R4YmpoRzA0ZEsyQnM0bzY3WmcydjZx?=
 =?utf-8?B?eWNjZGM0S0RDV1dzYXZNVEZNS0laQWRRRmFkU3ptSlcxWG5HditYaFROclNq?=
 =?utf-8?B?RW9JcXVmTk5tYjVzcmhBZmhFQTNaL0dKY3B5b1lleDBSeE5EOHdaNzNrRzVo?=
 =?utf-8?B?NjdVbm9MZjZpcjhZVnU5dkZZTkRxZTNyZ0tHZ1hzYmxRSzZGSnJra2FpZGc2?=
 =?utf-8?B?ZFoxOGs5eWt3RnhBVE5EVHlocm0ydFFnZGVEeDdTSEw1a21DNENZbmhEMWJ3?=
 =?utf-8?B?eW5lSXdBR3pYZDd2SEtzQU1nM1UrZW1DVjNjYUg3bmtxQXdtclNnSnFOcFJu?=
 =?utf-8?B?ZEdoRG4xckVtbjNvaGh3SHRkSS9ySXBaNTlxaDZZR1NWTUhidUtYMGlVRE9K?=
 =?utf-8?B?dk80SEk3OTk2Vkg1MlpobXRmWEtMa0NUdVdTQ2pGVFpyamRMV1RXRzhjb1k5?=
 =?utf-8?B?a2l2cmduQVV1azVMS1haa3NlMXhVTit5WTFGNGVRQ3NpZXROblpmNjdOdWhD?=
 =?utf-8?B?U0RVc0hXTHpHYlVDcGFpU242SVdDc3FwWXl6MG1MeThGTnJSUnN2M1AxeEJn?=
 =?utf-8?B?VnA0OENRVnphOVd0SEM3eXBtVHBxVVpUU2hwb1VvbG9lbXd6Z1ZJM2ZWVXVV?=
 =?utf-8?B?ZklSbVNJMVNuRG9UbTFoVmY1RjJ0Zy9qcEw4NC95RVE0dEg2V2RWUzhSZnlQ?=
 =?utf-8?B?bnBEZlpFd3BpR1Qzc0VIRFQrc0dKZlhzQ3dxUm40U1hyTDdlUDhzazZoZkRw?=
 =?utf-8?B?Z0ZSWHUxbjYxRis0QVlKbHc0azU2SFpjY0dTdUJacUNtUzhRazVDcE1XOVdv?=
 =?utf-8?B?MGlaVGZieWdSUzg3RUpJVUltcTVLcTRmdTY0U0xyMjBCbG14NUE0Sm9Db1cy?=
 =?utf-8?B?NlJBREdYMzBBYU9wbHBlRlBvTmZZZVhjREd2dVc1SUtoY1JvM3RMY3RVZXZ6?=
 =?utf-8?B?UUJ2ZU8rNHBJWU93emhINWt5a3grVEFBSTM2QjdsNHFPZFZ4Nm56bXhMTTAr?=
 =?utf-8?B?RzR5Y2o5YzdYTkRzeDExVmNJblVUK05jV0NYWGRDZXcvdVlSbkRwQ1FqdkhS?=
 =?utf-8?B?ZncwUjEvaW9ndDlJb29PZE1RWCtaVkRrUCtPdi91aVRmNVlNd0Z6VVY4RUto?=
 =?utf-8?B?NVphcUYxQUVkY3A4b2RnWlYxSEh5SDl1UFJLcDhaemhIc1dKN1B5UlBoOFlK?=
 =?utf-8?B?cCtkeHJneGxGVTRrdUhQakRsZ2pvMWVnbFVFNDJ2UWtZVU04bHcxODBwZWlU?=
 =?utf-8?B?NGpOYzU4cHhHRWh6eDNBUm5nazNtZkpiWnNINzc0SVdiNVZza0prNGR5QnAz?=
 =?utf-8?B?dURydGJlU0k3d3grRDhaQlF6Skw4OUFsVFpJekM0d2lHYUhqQVR1eEV6WkFn?=
 =?utf-8?B?dWp5L1dHTGU5elBDVDQ2RnRjYjNOMzBPTXhtYnBWcHZTUWo2RmZTdkJkbDY1?=
 =?utf-8?B?Y1IxOVF6V3ZEYThnNGFhYm9uSGQ0THZWRVhTZlhidlpBMFFmY0pOS3hMSy9H?=
 =?utf-8?B?eWJISHNBTmtrZjJFWVhWZEl6NHZhWjNtQlNrVVJuS2ZXN0ZhVXZaV0VxQlp4?=
 =?utf-8?B?RXVXL01JRkg3NWRqWVB1SnI2OFJqV0lMd1ZSQkdVT2w2aGxGQXp3UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b477532-cd0c-41ed-ec4f-08da1e21e9b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 14:20:23.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIL6dYxPLUpBKLkzNkA3pJpWJQRR+K+kEOrTFdqKib+MrP5PD9DynQivQMxTnL879zwZot68UmrN4Gy8NKS+PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2854

All,

we're pleased to announce the out-of-band release of Xen 4.14.5. This is
available immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.14
(tag RELEASE-4.14.5) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-5/
(where a list of changes can also be found).

We recommend all users of the 4.14 stable series to update to this
now hopefully really last point release scheduled to be made by the Xen
Project team from this branch.

Regards, Jan



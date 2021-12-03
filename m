Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5C46786B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237646.412190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8gC-0001is-4o; Fri, 03 Dec 2021 13:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237646.412190; Fri, 03 Dec 2021 13:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8gC-0001gb-0W; Fri, 03 Dec 2021 13:32:48 +0000
Received: by outflank-mailman (input) for mailman id 237646;
 Fri, 03 Dec 2021 13:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt8gA-0001gV-Ha
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:32:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f9eb962-543d-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 14:32:45 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21--N13POSsMTaLjAY_p2puEQ-1; Fri, 03 Dec 2021 14:32:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 13:32:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 13:32:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:20b:313::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 13:32:42 +0000
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
X-Inumbo-ID: 7f9eb962-543d-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638538365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zb7cm9reoOABpbeZcWOi636UrNj1FmHcrdrZtUHPBoU=;
	b=GseGT8KcP8QPuWZ7gNWROghKdMqiET6JJCIZDoUKXaeWdB3vhjyB+WVi7AAx97qwkcDBWq
	hlHdS0djhpk//25tk0wpQ8aeNwRKdPEglnPGBuiv3gNPyIdm1g6y10VtzQuC0SR1aBOE6Y
	OTai3Xn0iOsJSJjmbSy/2H/Qy/weqYI=
X-MC-Unique: -N13POSsMTaLjAY_p2puEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8UpvYNlwl08JamvKz/I6q0dcEHPmjCq8VXnrgWQVSq5Wm50h38ttgSfJFjJM/S5vj7Ef5Rq/ejH9Juw9JWynqXaqVc2HGx4rlWxjIVqWm5j4LFyS+grifsijG2XpuEIFj85eVBmy+giIFhB1VB6HSgk25I6xGRcGT1tdNz0r5YnIU7O8TB04w3pbTkTy3LWS9w/NBl9iq5KAlh4ManWQloa+FAfyJxu6KVxEUFyvnfghi1PlNnIO2c1NVh0RF2fRtSoMLMR3zVvjyDKo2Bo0J6sTfoAaRAsW3mrV85qap3JoMlkTPC6L9dKJdDvfNaFU80Rc9wsIW8LpwPzihZyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zb7cm9reoOABpbeZcWOi636UrNj1FmHcrdrZtUHPBoU=;
 b=efdUoGqPhwdHi9gH8xq6xprEcSu8LK98cDEZ5zSaaNSUttjm4lRoeZX4nDlkuphBWp9WjMtrCG/oOD4kbsB7FU1AOQTnmYbjFxFX51cuJtv2kIEBoneUGbnn7t+CK+WRj4N07OfINPjfODhcK08FwTn2YKakc6fwu4RSVkc+Ifi9Q4T6hZWkuYyGaoy+BC//ZcvWv5nHDDaNKCqvY10KUpskjbDjWagf98ymvOow0XKKEVoMPEnBNwJ4CHZs5O04Y2LfCAeMjvaepJE+FMR9zJoE7K11K7GnD3N0QYaF+emztBS4bqXDBfDTzFtxRqFIOKolvaIpwASDcJXmNdyQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a64a40ef-82f7-2264-5656-aaa5c94384f1@suse.com>
Date: Fri, 3 Dec 2021 14:32:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-63-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-63-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0078.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a0331c4-bc73-4245-ea90-08d9b6616234
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165A87AFE77F83A50DC1D67B36A9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Cdfd1IjHibNbTjEy+jzPX7VsOY2aNmlom5oJZCRx5HHjU+qxk8iQAP9J6CmEc86LmEL3KPhQ06LZch6habLRp8ov2BLdfooGPCP4yDmGxVcshoYRgcLwbrFpBKLHH+QGWvN3JKry6a7JTbu42sKYZ6OP0kk0AEyfSjBvr+H7dKI0b7F+lxijUva5Soldwc2eOou/b58CdkJgdsYSuKuJl0h46c6PvW2ZIdBv/9KYeg9KnsCBId8s+UqbaVrFBM/tYDo0ssnKyj3/kARGWTHeHu11gIIEwIl1kPrtDqGlU79QL7D8fCQMkeqkwT60Ki2PwB9clPNTcqEnnx7MGS1u9q+xpb+j/NXEjSsZMzLXrvqIKnnF+Lp1TTDU3NQG+wQ/jTiALE6D2BmmpKryXN1VbACn8YfdWt4TBnqzPVmQ7IzeDkBaHc/fPKMa/mlsJFqGf7VWSg4w4Qs+740YVBN1rwAcnnQIXC8js694uQtHwlpi35nIrFqmUS8/9EfFipqUnkBBHPCfIsB21NkmBjBoG6Miym7BErli6MuSWSr0KRWQqi1f6sFidewrSo3ruqskahH53MBmWp/+nBaeJMLayjb62cxTeCMm+rS8gUrjz6SgrTTupJuM4Mk4YBBh5LyyeDHB0oVwcOnYGUbhoL7Bssrwd9cfd+d0h9VQhzCVk6sINpW3divbw3ctWUQIUMwu/S8d6XJJgo5pzwyHe5qPoBx7lr80PfZ4Ltc0/TVqxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(54906003)(186003)(4326008)(6916009)(8936002)(2906002)(26005)(16576012)(86362001)(8676002)(5660300002)(6666004)(508600001)(53546011)(38100700002)(316002)(66476007)(956004)(31686004)(2616005)(66556008)(4744005)(36756003)(31696002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3dyVHhzSjk2dkpLOUxEVW00ZWI0b0Vyb2VnV1ZPdTF5ZnBjL1BJMTF3ekt2?=
 =?utf-8?B?ZlkvSU1Ea21aTC91MDg2aUxPcWpzOUo3bUZIRVNDdTd2R01MbmhWYnN2MzRv?=
 =?utf-8?B?aTF4ck5GTitid0FYcVBTRTJnSFFtWGpxYkNzYmc1eGx5N2E0a01oaU9FSWQ1?=
 =?utf-8?B?NkVhTnlMUGZOWlJkR1hBNXdQTCtNWm5wWWc4Q2FNdXZMR0ptemNtOUdDQW9L?=
 =?utf-8?B?MnlRdVVsUzRybmpSR0tsc3FwbTQ0aEQwM3ZaeUNtOWY3TSsweVFFbE1KNkE2?=
 =?utf-8?B?ZXF2dm9RY2l4VERzOGo1K3ord3J3TTFIdXVwbkh1dzh4S3l1cXlXbmdYVlZI?=
 =?utf-8?B?eW5MNlowRW45K0lESjBoZXdJOFU4NlNGUzZpSHpyNFhnQWZ0ZVRQR2NOTHV1?=
 =?utf-8?B?a0Y2alpqL1NuNXdXLzk3NVlBcG5CTlRwaUNmVFJuSmVMMmtVdVo3MHM3bjZz?=
 =?utf-8?B?L2xtTGhnaUVybG5wYzd2TXNsbnJBUzVNWDhIM1BWdi83MnFxTEVtc1M2aUli?=
 =?utf-8?B?ekIyZndFN2ZQUXBMTGYyNEpMQ3RNOXU2VGM4eko0VFZ5QVlkODFmRjNhY08y?=
 =?utf-8?B?NnlObUNyVjZHMjdiQ282TDFGNEdJdXpnS0VIei93cmRacFN0R09ZaWRMVWh6?=
 =?utf-8?B?cTZjRzgwUWRyZmxYeVhJVjlqNUpWSUFHTWdjUERpcjZEV0RhM1VVS3JvMEF0?=
 =?utf-8?B?a0JSSFFFK3VtRW41YUtPa0hDbEZraXJBWkxINjNKYWtLdWxJMGdGZ3RRWHl2?=
 =?utf-8?B?T1FBTkRlQUZwdVFMVXJqbTdJQXZlcU53VVNjd1YyYU8xT01PVnRUTE1hSzR2?=
 =?utf-8?B?N3NmNGE5YXY4REZNRUk4VjcrYWhzOTJYVURhOUEzaVQrLzJtcmVyZ1FMZ3N4?=
 =?utf-8?B?eFZuOWNucFNvamx1MktCeDJVM0dGdXpCeitqMVhWaXlzOGJPRjhqWXBRVG9u?=
 =?utf-8?B?SDF3Ni9wRGxIcU5XeTJjc0tyWUNjQnFIempwTWxNcGJKSytBOXlIWUtwck5t?=
 =?utf-8?B?WXUxMGQ0SXJqeG44YjBiU2E1d204bkdLMmpGc2IxRkJYVVJCZU5pTUdMWUZT?=
 =?utf-8?B?U0l6ZldyQjlnbUlLVHlYRHc5K1kyNjBYWEJ2Y2N2eFRRbFlzdE9QNEZJUU9Y?=
 =?utf-8?B?V005d2RrQTR2WjJjbkI5Y01pNkh3SmhJeENvWGxKdGtsamVDcUNaQXlOWkt3?=
 =?utf-8?B?Y3VQMW40RFdNVld4ZEYwRTBUbzVNV3grTHRXa3YwK2VDODhsMzkvQjIxTzdU?=
 =?utf-8?B?VmZlMUpiYk9mOWp6VDU4K3J0MG5rVnZHQlJOa2JBSTVJMEhDMGk3dXdnLytV?=
 =?utf-8?B?eGpEZHB4REVPcVgrS2VBVXhzM3hTM2tjeWQxa2xuSXB3Tmg4MFhqM2RZYWVz?=
 =?utf-8?B?Rm10T05qRjFXR05zc3ZURFBqMGFKcHB4UVhDSWhZL3p1a3hlczBON2J5Zi9h?=
 =?utf-8?B?M0NrYXVHQ2FLYktlOTJMY1JpaldJTnlNV2diU282bDE3WFFIL0RkNjl3SW9K?=
 =?utf-8?B?eEUxbEMrM0NiajdOUUI0amVTSVp5SU54R3UzRXVOcDBGWStrUFE2V3RCNVFG?=
 =?utf-8?B?VlRXQk94SlcvYVJ0d3BHWWh3S2RGMVhrWmh6RnVnNzVtb0NYUXNnYkNERTRk?=
 =?utf-8?B?L3c0bjlaUjZXMElrREpzUUNUVUloaTZXbUpodWJPSytxRU4rd3YyT1ZPY0k4?=
 =?utf-8?B?ZVNHWEZ5NHFYQUZJUTNoQTBmbGJwS1BZbDJHTWJpcE4xYXJSZTQ0SzJnbnkx?=
 =?utf-8?B?ZkJxejJiTmh6azcrL2lxeTdoTVR0THBaQmpNYjBCc1d5aWtZays0cG1rbVdY?=
 =?utf-8?B?azRmR3ZKV1JVdHFvb1FSc3cvS1VaVlczbzgrRUx6aTJxVEJldngzeUtXR1hI?=
 =?utf-8?B?YTVvb3ArOUhsb00rZUZvT3JRb29DZlo1OXdqTFB0ekxpV1pPV0Y2V3QzYVdy?=
 =?utf-8?B?OWJyUTMyNHVzdXFCeHhkK0ZkelJiTEZVaGhVNVlhTWhlWkJjS0lPUU9uWFB2?=
 =?utf-8?B?RFY3RHlGeCt1dUlkUDVuZW55ZUJsYlFkSE42SXJLdDQ4NFp1MVZFRFpHeHh0?=
 =?utf-8?B?QmhsSjdhZFFpbTRRekk3Mk51TitMdkE1bkpQVmFTL0lLa0pCMTFrTkY5N0hI?=
 =?utf-8?B?VWRwTzhnaEpXZFFxdHJZbnVwZ1ZtZnlER0tVU1RlRFd5dlA5QkxHTE1zaDRI?=
 =?utf-8?Q?kUTQVfuwkA04LOjUWZi7yX8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0331c4-bc73-4245-ea90-08d9b6616234
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:32:42.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKmH3YSDOax2B57YhufyeM48zsAEi7U492fFWQuEwBSt2L5bbUt4zJQh6GujNBsEuZvXnvC53xNBOLH/8oBhAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 26.11.2021 13:34, Andrew Cooper wrote:
> Each IDT vector needs to land on an endbr64 instruction.  This is especially
> important for the #CP handler, which will escalate to #DF if the endbr64 is
> missing.

One question here: How does this work? I don't recall there being any "CET
shadow" along the lines of "STI shadow" and "SS shadow", yet there's
clearly an insn boundary here that gets "skipped" if the 2nd #CP gets
converted to #DF. And fetching of the first handler insn also isn't part
of exception delivery (and could cause other exceptions first, like #PF).

Jan



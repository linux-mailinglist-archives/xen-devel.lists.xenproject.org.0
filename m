Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9A4AB693
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 09:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266545.460230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzUT-0004VK-Fp; Mon, 07 Feb 2022 08:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266545.460230; Mon, 07 Feb 2022 08:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzUT-0004Rp-CR; Mon, 07 Feb 2022 08:35:17 +0000
Received: by outflank-mailman (input) for mailman id 266545;
 Mon, 07 Feb 2022 08:35:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGzUS-0004Rj-5G
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 08:35:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df1bb4c1-87f0-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 09:35:14 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-oCWiB_DcNeSPS9v1-oL3WQ-1; Mon, 07 Feb 2022 09:35:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2555.eurprd04.prod.outlook.com (2603:10a6:3:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 08:35:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:35:10 +0000
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
X-Inumbo-ID: df1bb4c1-87f0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644222914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IR1Sa7Q6SJr+f4dIgzplWhh6/ah/H9TUn9U3Wf2dutA=;
	b=jWTr+3ZQSsE7FHF95anYcpdRA6e87XInEYjEQs1AvpFpligcOQwRnd8hlBGxBdcmcnHYkx
	nIlIAZTZxb1Jj7F+gH9DDQxEyCYfrsFGYy3q2nl4jsbAndVhSAgnJzsbNwna/Ay+jO9qXp
	HhgpwRwi59yPKZ6shWHh1wostaxsc/w=
X-MC-Unique: oCWiB_DcNeSPS9v1-oL3WQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N81hTzsV+PNnET5nl4eYekmBlwrXBRtttQgOS29HXovRgtOw/wJXQTwjwX1Zmc2c9IZkj46aUBdqQVEw4lYOGoq4kOde6TU9BB3W5vtci7AOlOudtD50e2jcRm2tCjZAKwawjnoi2tmH6EgoDMR4HsJYBw5062Lpmgs5ezOJ9MVV4GPOt4rXc8aQTm+dXFZ4VaKy1raZ/7j2+IIIZsJs2w/I+0OpZXvGuidp5pbyLJU751GVJyAmjyrXD57alwoPOUb74ega47FGu867adNq0VCZ2o5804YxKojDAuwGm/MEh3GvZxBUqFlcQdp/6Oc5H4P47p5zhHeGjl1wNRmhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR1Sa7Q6SJr+f4dIgzplWhh6/ah/H9TUn9U3Wf2dutA=;
 b=BsWWinet9lvsPiaXt2e4S0Uwzs8aGFZvD/PyvAq2tj8Ga9KeeP/K+J9C44Y2Mi3c/L2mMHRr9X66drx5tDQu1W7zOB8X9gbq1i4mmEqoc/+12wsijVLZQhP0F4CMtzgjXTkKOWh1GJsp3CkzpcwCR2CIaLqyJuzSOecsd+0baAss8Xhfjd+uqVnZdZrkzhnpCNa2I8WEOxMqx5u4YqhLZR0nG0Yu7nLFWlQqkzCdc6ykdQQ5MwqdlIIvi99vq63iLRf5lz+OPr1UMZgsOMQFf2aLZT0sAASDy4pgCO5IJOjmadvwlJAx/ew4tVTeH4cwLJFnTV01pVeryjEAKUI4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <107963a5-fdd5-c1b7-9dd8-3ad7567f2463@suse.com>
Date: Mon, 7 Feb 2022 09:35:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 0/3] xen/arm: Allow dom0 to use the EFI framebuffer
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220206192839.75711-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220206192839.75711-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0020.eurprd03.prod.outlook.com
 (2603:10a6:206:14::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1a46620-b80b-4364-2266-08d9ea14c0f9
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2555:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2555823B9552BD7A4CE87D48B32C9@HE1PR0401MB2555.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dQSIrSvjwtC7GYG/sxmfPM25uNRreHeqLmcIEKk3w+Edt9cfEM0g+J11OtQnCrUUpfALwKHn+eZ3ubdIZhD51+qILd4sRDBJl/LJ8PJO8MbjQfxW3KoG8U+aqGZoGyFKw6v3kLZWec1/ma+/TWomgeIn5HNbINAY6NP1cTVzipqbfR9xBRB2ozlUE03HRr41u6aCDcBKpGqCwxuMy5c7G25ZO4NuyBl1NKDs3B5NLApD7XYbFnTRYCm5tqOgEUEKZtJSfxcnfZIQN/ock2SwJXIzEucgDbZDQ2Eh4cgAj72Z/ULNUofMXJK/FPG7BfcQyIWxOxkqssp8/FgHm7AYUz+a/7GNOQ227lnnNzpTpQJetFLy1cCxq+bHDdIkuY7v/GQrGCyg+LGNV/BxDedfLbQAkp6DF+ghyY/grMKxD+5L0Bw68TcJmNv7P2Z6yID43Elm1vxGgAPvXpMDVjgtaJx7f+qC68ehORkc934UxvrEYs8t36ZTtxH+JKtZrV1mKDErfcbBBfrnCCGQnMq+GKY2IAtsfRDXAVtCIIYUao8R/e2sSb5qTwhjnevVQdRYQirjHWVPSFfT4yGzv7wk1Xgb4y/t6Lf+qbyKiIPS1IYNndRytT9lZaeeVtN//X5EqFZxHiaE9TUHOtHZJdoCz7+4w6OBiDgQBUcxwpJGX2Q9x5bQ62QyTlAWy6RetajE1Zcam3niefghJrxQTCPE8oBEBtVdgojRTMgqyPiPctE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(4326008)(8676002)(8936002)(66476007)(53546011)(54906003)(6916009)(316002)(36756003)(6506007)(4744005)(31686004)(186003)(26005)(2616005)(2906002)(6512007)(86362001)(5660300002)(38100700002)(7416002)(6486002)(508600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCs5aWU3WGRxYlRuWVQ2dVM0NEV6ZW1JdmEzclc3N00wK0RFY1pKcURMUjR5?=
 =?utf-8?B?QnRwWjdtWGlpOFRpamhaZWZjeTJlbURJM2xXUjV6aVJBWmdoeGw4Vkh0NnU4?=
 =?utf-8?B?S0wrWjdJZEJKNloydXNUc0d3ZmhkNitRODNRWlhCVHFnMGc1NldjQjBIbm9w?=
 =?utf-8?B?MFFCYzBTRXcvQzZFVDhDd0xKNmNXVXRCZS85eG1OYWtQVFpleVp1V0dINWU1?=
 =?utf-8?B?L3Q4MUlXYlVndW9icjRRNkhvTjVlZkI0cHB2RHNIUWRENnI3NEpNZTRoOEJh?=
 =?utf-8?B?ZlFlS2hMc0NKTERRbllnSnhMMWd6ZnZsV3pOSVFBY0Z3UGV6QWVwSmdKSDE4?=
 =?utf-8?B?NFhRWng4TTRydm5Ic2lzdmF5YzduQ0laWjJqYUkrdGd6eW91NWxOZUdkRFNW?=
 =?utf-8?B?N3dERnRVWEdaZWoxUExSdTE1TXoxc3g0dlZwOHQ5UkFaaG85Zjh6bzkwY1Vl?=
 =?utf-8?B?eDd6SzZ3VzdtMjBPWXc1aXAra2dPaTFoVWdnVExGQjNWakVNTTBkOXlLTWJQ?=
 =?utf-8?B?SUZQUFZzT01RaHJ0QUJBTDUvNTgzUzhXK0lXQmRWZmgyTzlkNDJnK2R3dDhT?=
 =?utf-8?B?YnVSWHFVSVFBOXJxL0RJc3g4cERQN0RobnBXdXZMRTJ2amtOVmtOOStIdktE?=
 =?utf-8?B?SVk4aTVVL1ZDRjRPa3VYYm9EZ1phTWxXSTFjd3MzZ292RmU2OUdxVHlOL3A1?=
 =?utf-8?B?cER3U2NrRmpRaTJXMWs4ay9tODc0VDVkOTFXazlHS3pQR0JJS25KVklpclIz?=
 =?utf-8?B?UDZTTXZzcVpuUmtFdUtJRXlTRXhxWHVmVnM2Tksxd3doSVNBNDErVjV4MDFC?=
 =?utf-8?B?ZkViMm1HSUNXbFRTbFJCWEVrNUd0U0lsbm13YW1SdlE3OWxKS2w0WUwvR1V4?=
 =?utf-8?B?SEZkYzlPU2xKQVZrN2o5ZkNaSGZvOXFnZXNmSGMvNlZPYml0SlROV1B3ZFpr?=
 =?utf-8?B?TVJEVjFCUWU4Uk5SQUNteEZpNG4zaHBzR1kxL0k1T1E0OFFaN1lKSnh4NXhx?=
 =?utf-8?B?bDVsZ0QzYzNSdGdneC9ITUlmeWdOTWNJbGhnQXhFNFdNVklLSFFhbzYweGxr?=
 =?utf-8?B?Rk11YXg3b3dzQTBaZ3VCSkVHODlVZ1hEaGJZT21pYlJCRERpc2tBZHFTRC9L?=
 =?utf-8?B?cm1uaGxwVWFPQnI5YzBtMVJON2JNaUpzSjYzVzBiZ0N4Z2xTVW02NWhXT2NR?=
 =?utf-8?B?V09qTk9zNGQxSWxBZE1BTmZyR0FEZk9Bb21vOS9QTjdMS08zNDNydlJSNDNR?=
 =?utf-8?B?NFRCTEpwWVpZRnlvd0pkcXVWSC9Va1QrZjJieVZPdEhDOXI2QUpERHBKa3Za?=
 =?utf-8?B?dFA2a1Jod3FGVUpnaW85dmk4WC9VRTVFVk1mVGZyUm5Yb0ZMQlp5WExxdnhV?=
 =?utf-8?B?VDhOWHJVSFZJMzgwZ21nZ2hWWGpSQ0djZC9FQUdVV3orVTByVE9BaDlGaUNJ?=
 =?utf-8?B?bSt1b2pPQktQd05Fc2ZRNUlacDROT1BhakJ6dmFVT09Zb2wzRHduNjJkWWN1?=
 =?utf-8?B?ditLeXpMclpUZFZGNHBHN01PN1ozQkpCUWlmUWRHR1prcG5ndTFEb3lwSTNR?=
 =?utf-8?B?SG1aQTlZbTZMZTBFdVhtRWhlRGlhdFZxZUlqc25GQmZHSlZjVE9KR2RaOWVZ?=
 =?utf-8?B?UUJQbDZ3MDJMWTM4dmhOdzV2NzkvOWh0dEUxdWJqckRDbDdRSjFhSE1XWkFp?=
 =?utf-8?B?R282WGJzamZ1U1JmS0VTeU5CZ0lyemtPNmZ5ZnV4M1pLaE1qTGczM2VHcFU5?=
 =?utf-8?B?WkNoejN3VW0rV1AvUzdSb3JuemJOdlR2eWd2R2txdHBDKytlNlZ3S2k1VDJa?=
 =?utf-8?B?SURqMVpNSE9zczlLZ2NxVEpwSEV0N3d3MUlRU0lEZnlwWENxMUJlZDhneDRt?=
 =?utf-8?B?a1BDdHlTZllhU2V6Wk1Ja1V6bHhCK0JlVGRxYnB0emR2VmVabXYzNncxck9k?=
 =?utf-8?B?TFc1YTdWYVVJNGkrK0FleVoyTk10cWV5M1hqYU9xVWhXRXQ5S1g5SW1OQjFE?=
 =?utf-8?B?Z1BUZ0x0NFJKREVvajk0TktVcktQRHZLajQvbFJnVnMxeXExczJqRXdSUm1R?=
 =?utf-8?B?TmJienUyVGJoVHBEQXkxdC8zcnljcUpWalM1ZE85MWhXSTUwK0dUVnlvcU9j?=
 =?utf-8?B?YWRQRnFkMStiRVFjZHArSzh2dGZhMThISkgrV3UrbVBIaWZUTlJVbE50b3lY?=
 =?utf-8?Q?asNt4Amo92Aw3NcJxOcLmpM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a46620-b80b-4364-2266-08d9ea14c0f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:35:10.8840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDvKSGA96qesJgA7IcgB33AZPVYcdq7ZI/5dJxoNuPwtkfTvRv8IK6GMeYQ+d/vNb8BUheqYIEbTdCLxApboIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2555

On 06.02.2022 20:28, Julien Grall wrote:
> Looking through the dmesg, there are still a few TODOs to handle:
>     - Linux is not able to use the BGRT (Invalid address). This is
>       because the driver checks the Image address is part of the UEFI
>       Boot Services Area. Such area is not exposed to dom0 (yet).
>       By-passing the check doesn't much help because all the EFI Boot
>       Services area are given to the normal allocator. So we would
>       need to reserve them.

Respective checking is supposed to by done by (only) Xen in our case.
I thought we do so, hence if there's a bug in there I think it wants
fixing on the Xen side. The Dom0 kernel should never be exposed the
Boot Services areas, and hence it should really trust Xen having done
whatever needs doing.

Jan



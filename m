Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9113FD61A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 11:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176146.320611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM6M-0002Jr-CM; Wed, 01 Sep 2021 09:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176146.320611; Wed, 01 Sep 2021 09:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLM6M-0002Hb-9A; Wed, 01 Sep 2021 09:00:10 +0000
Received: by outflank-mailman (input) for mailman id 176146;
 Wed, 01 Sep 2021 09:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLM6K-0001Ea-KM
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 09:00:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8bd7362-c5c4-44d9-b891-ff5aaeec671b;
 Wed, 01 Sep 2021 09:00:03 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-kl2wIvanN7-Qe8fHEPjJFw-1;
 Wed, 01 Sep 2021 11:00:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:59:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 08:59:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 08:59:59 +0000
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
X-Inumbo-ID: a8bd7362-c5c4-44d9-b891-ff5aaeec671b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630486802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hcz99EKLAguPUtj+MYXe/atzn888fi5RnKG/mjRKRuY=;
	b=XjtR/Kd4JgoOXi/Sz5c/oMKlQgNd/0Pzxdugf9rsQ3gjE7jZDFZdGQ7cPqmh4WIsbLsqbN
	Zwq44B8rXV4oXbUsOImcGKicpd9RA2LR+r2AHDNWnQkKPmRqk7COOJxKqLZp3S4AeMKxtb
	1gTsCOJ4DrQieH2nMz8p3DqSf18bWVA=
X-MC-Unique: kl2wIvanN7-Qe8fHEPjJFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPjrxb9HzE2Dsm5BmMFpNIRmxHkHsXYXlVeL8Snxo2jpbBMsSnMJdacIBEXROAcR/mjvYb2KPW1En7spXwuVOIm367uFo80JnPbvpOrZcMyTTSnXwhfFaTTSGTT2bZiUsj39uLacoFbAKPUk4yABl87hSxsE3u8S/NeyOw7dctrcCTlmMhmWa51d5ZaLgnTeQ1m72XAaT1Vyg1ffd8Ad+4KxL2hWiyLlcjP0lNVz+TwQ+EZvb6+T+Eka4govxznIudsMfu5lyODm2Tx9fjr3NueCfx8n0U3eow3HVW0EtBlTta4Xg42rAD7ABBXsN5B7bg6FQRkD25bSP1FKaqpwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hcz99EKLAguPUtj+MYXe/atzn888fi5RnKG/mjRKRuY=;
 b=WD1fgt6DL936HyV3rO/vpO/9YRxGSGe4ACQaJm0qtQK3x/XtlR9a0fLl6dRMwC7MhU3BFKdcdcdCbOcrAtH+jLjDpLTc5JbUHKtX1Qn07eGXDY0FbOC7A7rL0+SJUoEVsJNmNzGTCPPrgDHQehYDGTE3MswuMKUc45gtCd1YTZn492moxHz2TNEtuKV7wBVcGeGvCBydI1MlfL+0RI2NHprsAKjY/S/EGK4jpvhnlHX7i9BeR0CZEmp/H6Mngtj92Q6bpIT3OZJnCqatg0+SueckndkAStzgMVkz62qoGnPu9krNhcv3/Ee5/eIgn5z6Atpz1RjVZ974mrs7IOe/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Config: use Mini-OS master for xen-unstable
To: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20210831073039.7101-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6837d551-6473-e34d-c0ae-043fcaa9482b@suse.com>
Date: Wed, 1 Sep 2021 10:59:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210831073039.7101-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::23)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52089834-26b8-43ea-c279-08d96d26e0bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166821E4151009657B70B60B3CD9@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n5aI0wSi3lX2/9ONxciXPCNdhDDz5hbNZQtf6UjymPToUHsD0WtB1sZdN04jintrqhZUdTYrEz7+4ptFmVF9razZkyLRW/ed+GoJJAOTfdU44YtmWuSblsdCSIygKvDo9tnHVzZboKdXwdb2BVXXZqDveX5PfxFHOgTbGi5zxTXZcTLqjqXCWr3zOBfhXjG5FO2fnHfG/W84njpdX1esXurnl7/g7y6Iu07e2pfVcXpPWDzuv78yoCstVv2qmCiyB7e9P90JL8XMV7UtwI5q4eI84vlC2apjddXDQuG1LlDHu4Mxgp66ZlT8MWLWgk4ixdRhHZ5zEMp2taGOjJksD4SSVGeITYbpZtwcLRdxhfYv8iAj9As6URERpNvn0mylkL3ftCH8NrPMIpcSNS90ZvVhoKQKCNbwKyz+0ZA9xZzi/vl7RBvVUjWdO+Wua+9wgrkQZ5hYRuVL96muZuf2HtdYChph7gRHURHDQxE0bFq4+DUkpSt+VJH2SQjj03xWhvsGsnOwTO9+2K4iTaY5K4/qg9fBF+3rerchw6rxRMhvt7J+d8sQ3WxqCm4PHQsq2Ed01tsgRFbSeZTTgUxDZpnxnonlkxsML9vwfX5g3jSWdUi3mGkI7H7Te2bFYJ1KzEWTqjrR07G0qdU0Qruz/GDh2BzJTtmf9zX0bVYlREYnEBe17xM6MZNCcOlCVINfAPNIQmnVCjsUaQLMnl85MfRJOpVe9X3sqLHSNQAVYhQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(366004)(136003)(39860400002)(5660300002)(66946007)(54906003)(86362001)(2616005)(8936002)(66476007)(38100700002)(16576012)(31696002)(26005)(36756003)(4326008)(66556008)(53546011)(186003)(6486002)(956004)(31686004)(478600001)(83380400001)(2906002)(110136005)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDB2em12OFFpdVNWYkVLek55MEFUWXBiY0phaHVOSUpjQXY0aEFJbXZuR3o3?=
 =?utf-8?B?dkptb2t5TDAzM2V4em9rWkQwY1dxN3FwZGVnNGV2VXZ4MFVxcDI3TG9NWmxj?=
 =?utf-8?B?eU1Ka2ZFcFZPMzlhUDJjSENDT09FQWRpNzRyR2E2MlVBWlk1cENBOEdyVW56?=
 =?utf-8?B?MkpkVzlkSE9ndHArQU45aDg5bmkwNkZvQmV6bXYyVWtaSDNDTEo0WDY2Ylln?=
 =?utf-8?B?UlE1dVpkSmFuejBDMytTK0pKclRwQmQ3R3V1MFF0U1ZCYWNHbVlLNGdNZDZJ?=
 =?utf-8?B?RFZ0T21KVUlhMjdRMER2cEVPUEN1a2JycWthMTY2bFdmRmhKWmJ3TG1MZkF2?=
 =?utf-8?B?WFIxaFhhWDU4cFVnUkFKaSt3dlZhUTVTVWFqR2ZLS1VxTFdSMkRzTjc2cHQ4?=
 =?utf-8?B?QnlBbHM2dkhVZHJIS3JhSzJ3MDBpVFZ2YzFETzFUZEwvQUJwaUZPMjlVaVo5?=
 =?utf-8?B?bFFSTGxMcWV4OGUva3R0Q0czVThSWkQ3QllWcVp5YVZJQmM5cUZiY3VzRVdq?=
 =?utf-8?B?dG9FeGNBMFJjY0FMTVhWVVpNaFNIYmlrc2NJZXNKRVNsQjJac2wzMTdDTnZV?=
 =?utf-8?B?Y1IreFpqcDU1UG5DR1FKTWZnZnZQQ2UyY1hTOXdwNlU4S0dXVXNyYTQ5TE44?=
 =?utf-8?B?N013OUwrUkN0eVNpVU1KNWsvVXRLYVYxY1VzcEhCNWQ2eHdTSGtIZHVTZk5N?=
 =?utf-8?B?S3hCcVpnUHFSNG9nY1VsOUx3ajlsS3l2WTRkQS9UUks1WG02ak1BODdrT01m?=
 =?utf-8?B?blFhQ3czRzhKdG1mK29LWWo4R2ZhdDhabmd6SW9HQlY3UHJvNjZNSU1PYy9S?=
 =?utf-8?B?UUU1cGdwZUU5MHJZYXJ2djJZdFIwZm5NWmV0ZGliL0hBZC9SangvTTJ4UU93?=
 =?utf-8?B?Q25FY29DMW1CV1FmVkZLeUozWlhYYjc3bnlhTlpkRGRKc0tGVy9WT3F6ekRC?=
 =?utf-8?B?T3p1Z1cvWGJEV1NRVEh6Zlg1VndLRXdFQTdOc0o1bVo0YXQ1Zm42THo1aUda?=
 =?utf-8?B?UTRqZW1uOTNLVGM5azJta3lTRTV5SkpoYm9iVnpqMUhETnhpYmErZVBFemFt?=
 =?utf-8?B?ZDZ4MmI5TTUxTHQ5NXFWcG9mVHdHYlo3aGcxVG54ZVppcEU4b00zSFRjOTVj?=
 =?utf-8?B?ejJoN0xOTTAwcVJoVG1iYTJLVG9xajRXWnFLQ1M3TWFwY3lXVkNaVWRnN3Ns?=
 =?utf-8?B?OFZkQW82ME5IL0lOUWVRVDFZTmdVUkI5bDUxMFBiL29ERW1kKzdkWUVvbXkw?=
 =?utf-8?B?aHl1UFFVK08yQTY0Z3duYzBmS2p0d1V5L2ZIZERwb29Ib3VsSG8yVjZoY05R?=
 =?utf-8?B?bVdrWm9tRXQzTmt1RUZxbUVwdWM4MkJsQm9qQVpGZTUyd3dSNnRFbk5NTHpa?=
 =?utf-8?B?OTlYZUpqb2h1d2VER2crTnorSFNGQzNYUnJzMXZ2RTdiQ0xMWjhRTVI4WVdB?=
 =?utf-8?B?TFo4WFpOOFZZbDhwdngwQisvakliK2ZoWm9iQzNnbEhsaDFDclR1MEE5TjAy?=
 =?utf-8?B?eWpXbEk4ektwd3ByWVBzdWdsRFpWbHdodVlXdWI4eXkxL1VYOElOK3pSZFBU?=
 =?utf-8?B?Y0pReDRXYi9DVTdzUFdvcHQvVXVEaVFjSWtzSUVTWmM1cnpPcHI2OUNYK0pV?=
 =?utf-8?B?NkhnT3BnQ0N5dVZ6OXZYYzQ5UDF0aktGOTFuN0hmQUlrTi94cmVTN3RkRlZp?=
 =?utf-8?B?TUp4SFRkS01Ydm82WnpaT0xHLzNScWhYVjNqdVR3QjgxMFJ2UHpRMnNRUVdC?=
 =?utf-8?Q?GS56lvII8Nm67IEzk+z1tIge/l3hgCgj4CLZdLf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52089834-26b8-43ea-c279-08d96d26e0bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:59:59.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtS+A2rPT0pqBFluKaKUyD3nK26IxnMeQvVNQCjfY7O8h0+b6Qtv6eQXss7wlV672M7qpihj/5sGpTxJPVsHhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 31.08.2021 09:30, Juergen Gross wrote:
> In order to get Mini-OS master branch tested by OSStest, use it for
> xen-unstable.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> There are some Mini-OS patches pending, of which at least the Mini-OS
> netfront fix should be committed as it will be required for qemu-stubdom
> to work.
> ---
>  Config.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 4d723eec1d..d4e8ced104 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
>  endif
>  OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
>  QEMU_UPSTREAM_REVISION ?= master
> -MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
> +MINIOS_UPSTREAM_REVISION ?= master

I'm afraid this, effectively reverting 82c3d15c903a ("minios: Revert recent
change and revert to working minios"), would set us up for the same problem
again that was dealt with there. IOW you're re-proposing a change of yours
(e013e8514389 ["config: use mini-os master for unstable"]) which was
subsequently reverted, without spelling out what has since changed.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074E507087
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308195.523808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngour-0004ry-Kh; Tue, 19 Apr 2022 14:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308195.523808; Tue, 19 Apr 2022 14:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngour-0004p4-FS; Tue, 19 Apr 2022 14:33:17 +0000
Received: by outflank-mailman (input) for mailman id 308195;
 Tue, 19 Apr 2022 14:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngoup-0004nY-Ti
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:33:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a68a4b-bfed-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 16:32:55 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-u_huJRDpNjGtcGAcch6UuQ-1; Tue, 19 Apr 2022 16:32:53 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB2968.eurprd04.prod.outlook.com (2603:10a6:6:b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Tue, 19 Apr 2022 14:32:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 14:32:51 +0000
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
X-Inumbo-ID: 99a68a4b-bfed-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650378774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNoTc6Lxd1UaM4Rgoa/wAPOPcVvuByaA/Ul5UoBxyKk=;
	b=GQw5Yqsv8sz5/d5u36HiIxUzVf/4RYw5xogK9alRgKc1LMQdMlvrn1A04B/4xPsRDJVXL9
	q4bDdcLH8Qiztxs+LILmYPfyi3a8oBJeFPzRQznKp2ihGgku8PbvVniOgG/l64AXXjTkys
	x7XzCYSitVLxX/91KJA0wNZm+4JAVsU=
X-MC-Unique: u_huJRDpNjGtcGAcch6UuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ98zdCdpoF5sgO4ayPf31Hp4CjiWJ1FxsklNlhFhUP+aPWQ+NSYD6EjBMnRXjsixaVBh1VAdo7YPmeBk9n2OkBgfL1gQz6TxuuIe30hV6h/JTuNCrQvS01ISZ8+aopVsV4lufV4xMu4Ztk6VwuH/SojJ4E6qUwfhu3FImaq7umRqzj52j7GFhL/TcmfzYQmMUE3q2VOlxyrUeSAV3VNzpDVMl9udPrAbfqBrKk9XwDsfU7TaV32wAFRZyUaLV13JkHlzetTTvqetNB0QVeuTWsTpj8Sy6eG2XftK4ueh4niVhM7BGXTlrj8Ep+U6xt+B91gASvaj1sbXleQ4Xrxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNoTc6Lxd1UaM4Rgoa/wAPOPcVvuByaA/Ul5UoBxyKk=;
 b=Vg+gg+WXB35ATm9HbD2lcjz3EdM3NE1okbb8fwQQt7VSNA5mbXx5G6z1gY2YDLV2IQ0m5t3Ll/0s/ZnKYpSkg1z//Ox/fMRnOKIkGCZZ3n38tpxi2yfyf4FsvlnYkudq8JcLudZGRk/0dnEE8j21EzJOlFXLqNq3YCrgZGqRqGlsi96OQsWYDxqOOv4vvZ448cYRAAwg4V2+h8zNaNBX6IsVUVIJQNR38BFpHXIcqj5o401jxvJsxyKYpTXNbEeRDBBqDZxZA5nctDzw2tZWuGkiv7GVZ2KbQLdu253a5QRzvadVyGGVYr2hWRrsiKUJcnUqWWvhf7fqCKs+vB2NxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b6b0f0f-795f-d37e-6f59-e6946872361d@suse.com>
Date: Tue, 19 Apr 2022 16:32:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/3] xen: cleanup gdbsx_guest_mem_io() call
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220419135254.21729-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0546.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 251b928f-6cd9-44eb-dab3-08da22117bfd
X-MS-TrafficTypeDiagnostic: DB6PR04MB2968:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB2968942994C7823496EC164AB3F29@DB6PR04MB2968.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UdexMZWeWzAoNGPOtUFJmie0UFHvcbf54ONilb6zECJL6CquEL+9hBaoObE8IrPQNL+nEWNs1RwiVAGyPaskP686KULoKSXExwWa81sKEiJDuG9ZA0xJQp+6KB4LcRcQJN9A3FVBHJD8gWLsUAGKQWk3esvVL5Pys4311RC1ZBX/NYJdF5QfIGxx3VwUDf8fbDs4ULPUgpdfnL/G3hX9Lekd/tQFmXdswCq0lgo8NyBHKJRDAO8wK0Q3NK76jjO61SWV35Zgi5iQAwS1ikLWny4xHCP5JI1sHkVxqsBYsAVZHEzG8jdkvP4ZRfTxkITUmt2W/HOwlGN4VblrGQWt3M3oh/Ti8bQOGpmmG8XP8/I3inlGBmYmGTA2QVWKP1uslD7RgItG43IjJRJPnf62i4yMI7Q0wvl6jTTF8TEwIP32CTjW1EgZtiaMxbfXZxhsUiaEwDNOVW3UhIeABc5Inkhp+l+KXIM1MZEaaXXQJZ9sHe6eAH4gLmB2eDSV/bsgR4mkc9J3JfT3RBMK0CglPO9dOtoO8K9BrSbbGUiI2IvV2B6LoRmgyDyfpIRAEkMscRz2SVKFPvNSnHw3/n7hpw+qoDq8BHzTzmuhZ0aPxbDgtFtzhqhj9ebNirNg0F5KJRCkmA3ZrY/YPqsXM3i0ZhmtF/MJgYqpeGwvwQHKG57G57QpeQGSaf4Y/QTjZIfYUQ3LSDQfEu5ECKzAumDQRTAdpx+Idq4Tjwn7Pk24z6RWkk4PvTXI3DkuqGuBvp/K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6506007)(4744005)(26005)(6512007)(37006003)(36756003)(53546011)(54906003)(2906002)(316002)(66946007)(38100700002)(4326008)(66556008)(6636002)(6486002)(508600001)(8676002)(5660300002)(66476007)(31686004)(2616005)(186003)(86362001)(31696002)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmRGQkhidEZaTGpCRXVCVDRyaGVqMmsxaTFkSzh5NEFzdnBWRm1QR0RvSUhC?=
 =?utf-8?B?NFFLc2JNNUhXcWFYMk0yQjUwc2JHOTN1Z2xJcjhRNmU3TlJDQWZwMlUwWFZh?=
 =?utf-8?B?UElTVjE3dHV3eDQ0QVN0SEdvNWNJdU1mNTRXdENzTy9paU9vMDgweGtyVGxz?=
 =?utf-8?B?TUgyeUhyZXhzY3NORlNraGt3anFZa09xVFl4MVE2ZG5lVjBQellPemxvbC9I?=
 =?utf-8?B?OS9lN0FRWjVEbUlqaTQ1WEkwZ0NTZVlKcnR2eURxSzRTQm4waUJINFRYS3Rj?=
 =?utf-8?B?WTEyWnJXMTcvR1RFVHdnUzFkM0JSZWpMNEF1NjdWMzhhY3ZPSWxDOEdCeldr?=
 =?utf-8?B?RXZaRThSeEFjWXZ4ZTVuaThibnRGbDlmS2lvYjFKRndYUTQ3dHB3cFkvck5t?=
 =?utf-8?B?aFo1Y08xUFdobmJsK0NGeE5tSktLRlVuNzZNZ2FHdHFOTm5xbkZsVFFLL1pR?=
 =?utf-8?B?NmttMXNKUitJdUZRSGdpU1gxM21EWHh0ZUJJTFJqK1IwamdQRWw0T1JGMHFP?=
 =?utf-8?B?cDgyKyt0QTI1cjVvQWxZa290bkNvS0RaZnlla2o3bkpJUGVxTnhUNlRUNll6?=
 =?utf-8?B?ZGxRd1FETVVSS25SY1pJQUhNYk8zWlJnR2l5WnYwUzNkUUVtR1owRmZrTXN0?=
 =?utf-8?B?c3psY0JSR1VmQXo4YUJYOXlOWjkyMEx1alNmSUsvK2JEMTB0Y1cvSXU0SXNU?=
 =?utf-8?B?cU52NDErUjZGbnZTWUlacjN6RnY3YXllVUNnOGN4T0w0ZGlLMGNncHBRL2dG?=
 =?utf-8?B?VmJpY1JwNEpOUFM4YlBJckFhRUdpTmJBMVM0ajJycURjY2ZZNkJSYi9nbTIx?=
 =?utf-8?B?Zys5cW1sVXJqRzQrRnIzNGNkbDlnR0RXeWRMeXhOSXBzdS84VHpKMkhGZURM?=
 =?utf-8?B?dG4vNFZ0cThCdzQzZ3Z1b3RwWFB4blVLL0xKdmVvMlkxVTdpZmwxK1hCejYx?=
 =?utf-8?B?a1MyWnpma2VkWThlcUpoMy9CZ1UxQVl6R09sdTMvUkdpd3dnRUlXQzdkbkk1?=
 =?utf-8?B?NkVBaDlPaUIyTE9MZ2F5a2FtTysyTEV1VkJrZ2lkd3cyLzVyV2NMYmFaQzM5?=
 =?utf-8?B?Y3JVVEozalQ5aTQySml0WXFFSWt6VVpuYW5jTXViVm43blRhL2c0RnRWd3Vv?=
 =?utf-8?B?Y0hWYno3VmNuZU83U2pydW84cExwcmExQ1dYbUtadnFnN2RhazN6bWpOSUt2?=
 =?utf-8?B?blRZOFBmbG5KZ3pkMGQvb0ZNZVFGc0VUSkR1YlErNUZ5azE3VWduUHErNEFm?=
 =?utf-8?B?ODlNOHVjODdTWktuYTBIclZEaHJYZWt6YjJCZWJaSHU3NlNNMTNJQjdxQyts?=
 =?utf-8?B?bXBXK3BhdkxiUkovZk5hejVqb0EwUHNNTjJKeS9VOWFIZkxnSVF6c1ZQbHda?=
 =?utf-8?B?Y1l6ZE5KNHNBQ3dlL2tjVVpnYlJJd3k4eHc0cmh4UEI1TzQ0S2FxWXM0dEpw?=
 =?utf-8?B?M3V5aUJSeWdlYTlJRXlscGtlb3RoVS9jYTJZMDdzbDF0blg1WS9JaWpPK1hZ?=
 =?utf-8?B?TG1xelFuU0dLcEpld0dJcGtYQ1NxNnlYOXdwWWZlM0M3cnRJY2VrMUdISm5m?=
 =?utf-8?B?aWkyYTV5VkQvaDNtekZOUU9leGM0b09hVkhGdXhDVXZUbmVMZjhLN1hGZFhS?=
 =?utf-8?B?L2xDVXkzVjA1cG01NWJQaGpPMXR5aFlMOVk5KytjVXQxamppVEZuaktpOVFp?=
 =?utf-8?B?SGs5bmZSb0d3SW1BanNDMzZuRFhoR3JnNVNUendLdlBWMDYzeGpYdlE2U3I1?=
 =?utf-8?B?VllvNzhtU1ZmZ21rTE1tb1BnMjJsMnArSFB4aDMyY1oraU1BY0xGYVRFOHFI?=
 =?utf-8?B?TUNoc3hSVXFSMmFUMnNZZGExUXZCamxrMjFtczltaVlKdFpIODZveFFtWmpG?=
 =?utf-8?B?eGxqQXNFNXhSeDZDbFd3VzArb3hYN1RGejFLdnI4NlViRHMxL0I0aDU4b21j?=
 =?utf-8?B?c3RNamJRdDJWVjlFUS9HY091NitvaGhyUWdHdlo3aG1kaUpSUk1MNFliV0hW?=
 =?utf-8?B?d2FKVFdJL0ZOMHNYelZqWFR5eWxFSHVkVFc2VEZLTkZJQ2h5TDBvRG9ReXlO?=
 =?utf-8?B?cStzeEVZV2RpRnJ2TjRpRGFYQ3hHck5scEpzZ3VmVHRrRmh1eHduOFlLb1pJ?=
 =?utf-8?B?VHM4cXkzb0s0WGNNTGt1enBrdHNnL0d2R0RWSVBMMGlyaEM4UjRxT1BrRE51?=
 =?utf-8?B?NkoraVNpeTRNYUJ0RWg5dnVIQXZCaDBoaEpqdmZYait1M3IxUEhjY1FNLzFO?=
 =?utf-8?B?UEFvRTc3U1BsblVQWDhFeHBNdzViVStyaFBheW92QjNuUWtDaXZWaEUwc3ly?=
 =?utf-8?B?ZWVHMkRPYXNPVEFvOEZxY1o5SmNGOXh1ekdoZzRrVTNTT0Y0ZXZLdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251b928f-6cd9-44eb-dab3-08da22117bfd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 14:32:51.7931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tQaBvBdkWQ7gdbS8qzl3BjVz+7kvvP/F6fhDfM5neLl9IAzvvgekN8I2O/GSovQu9pJR9HyDaAVz6OFSdy9nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB2968

On 19.04.2022 15:52, Juergen Gross wrote:
> Modify the gdbsx_guest_mem_io() interface to take the already known
> domain pointer as parameter instead of the domid. This enables to
> remove some more code further down the call tree.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D53FDD39
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176414.321023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQSo-0008NC-VK; Wed, 01 Sep 2021 13:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176414.321023; Wed, 01 Sep 2021 13:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQSo-0008Km-S2; Wed, 01 Sep 2021 13:39:38 +0000
Received: by outflank-mailman (input) for mailman id 176414;
 Wed, 01 Sep 2021 13:39:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLQSo-0008Kg-1K
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 13:39:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c2ac658-0b2a-11ec-ade2-12813bfff9fa;
 Wed, 01 Sep 2021 13:39:37 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-fbMU7R2YNQioOZLaDSkUtQ-1; Wed, 01 Sep 2021 15:39:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 13:39:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 13:39:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 13:39:32 +0000
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
X-Inumbo-ID: 0c2ac658-0b2a-11ec-ade2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630503576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6gOIlwfeDw151rTxi3HU+tBg3DOPTUR73ZuMPiIZHoc=;
	b=Z482f9E7EEmo6MVfw58J/4W1+m1CYfp6Nqr/DXVVLrcKisF7NavRafDuwn9T+trw6AOtvd
	L6XSiLCr85ZBNOfiYGxCyUgB5thTvk0wPluICpB5SemewSXsl8qyPOq4HluupM+5GJStkO
	JZ+N+TCmE/U5XgaD1fl9hGnw/9VDY6U=
X-MC-Unique: fbMU7R2YNQioOZLaDSkUtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBhcJGpW5huymKKurh1Y480OXWQYKrpZ0ZPCfYX/2LQcj/OTZxGIWy0BhYkNF26PqQQxLraxurcPWSFrsyE3MOHV/x4Hrbd7K5L1qa7Bl7Xf1b/I7F8+aUuxoe9FmvNly07BKavMIdm9QzuLzcu8WY4ly+KLzvI5NawY4lBjdP2htQC8XCd9fA+bOMbu9yRUbvSYziTHM8zQxQsP0dn42k0PBsgGzjUieeSdvNWaWV1U7iWfCyhIF/iVau1EgDwKL2oG23hcmfRCXaJ47TSfhhhs91QL7srqbRPrfvPre/q5uTU65SPLl1feU9tN/+uxXvwKolew9rgfkaV8gq61RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6gOIlwfeDw151rTxi3HU+tBg3DOPTUR73ZuMPiIZHoc=;
 b=CRp3Ye82S0aOXdlC4tp4jCzjyS9ZmS92mF73ZVYdbNG6BqTgbMRzU2ylYQFyCcflU1qpQTUky9sQNpJBdzjesEtAjWjOQTIIxVqUKKEv2rd/8EOgm/9C2uKF7USILMQN69fso0fz7qKWyVtbP4DytqfdEkWV03gKBgtafki0piCDK7KyS8bDlpW3D7QVnYBAM5Mj/K7KfCmdOVtnaZnAmt16D8wdQtCcFdh0R3bii38FmlImXRzUDsT6UDO249NL+8uoVjZ3kh/5kBOZdWDJT3ONSJ9Ehfke8o57BHUuFwcQe1dRAg/1KdpS/aD8kQDHnT0DxlTMTK4bz4Gd9L5E0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: vcpu_show_execution_state() difference between Arm and x86
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <85dc06ff-04df-2148-81c5-26bd25d1142f@suse.com>
Date: Wed, 1 Sep 2021 15:39:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0279.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e96cb151-17a3-4cd7-69e4-08d96d4dee7f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23350E89D1744C4B0A104C1CB3CD9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+++OrTw4EWygWwWI14Rtt7qgQeSSx4f6jECIqLjA/sGU65yRp+VV+o/k8wy66ExXG1SHJKDy5O30ULidjBv0cdgGQlcHUCi90mC2HsQELaD3uEaVB2zNI4zqzK3twtfWKMk6zroiSqwMeOYtqkTzpvemuksW1/VKAVUP6VuiBksUv2WL0DgNus+1nenMx/nsvS3FCNssgSZX9I2TlDr0bF3YJehyRukPUFhyR9oSq5+S6tqq4yOKeZ7RTrcXpWBuWFXgAXTaTLt5sZXZ04bvZ+8diHxSUhSVZUlUDZqK4BBLsdt1eI6b5ogiGKUdW9292vcQjczdcoLXHQihowKdCWEmZR8ocRI1CWX4BLEfO17e0lfULpmhBmQn/Q3v/GsXcd6jsjlHiVOfdrTVNjYkDU+kFwkkzC7fe1MAGARRcmObUFwQQEzOnNiE2XxhvYj94GmP98qpcbgAFgvWpYwDoe2mJcUoS2Ft2+NyOKAg4DLlacmYrKabLhYBB3D2q6d9qXxZT+6ITMQ3Y/wUeFFeTwdN0MUNov3BbmaA07kFjpp4eEonE6gzz8603d/l/N/PuQ4pH6+A4Y70pKwZIZog7TUTLHWRrnLboQr2cOfUqRCyzLrxIQc6i4Q1TnSVvY/gE3nAVy2cXC+ROEYnzy+jki4Pue4r3TxXE4n+SwW2FMLh22t/jp3aFiqpYr4LF3o3n/tGBGf0F7YvtU4nPb5oPTX219IJrNoPANekTfyjqTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(366004)(346002)(39860400002)(4326008)(36756003)(5660300002)(478600001)(2906002)(31696002)(31686004)(8676002)(38100700002)(956004)(86362001)(2616005)(4744005)(6486002)(66946007)(83380400001)(66556008)(66476007)(8936002)(316002)(16576012)(110136005)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVhjT20wOWl0bEFvSHl1eFNXYUk0L3MzWVlNODJ5VTRNbUNTcGJ0QzB6bjZE?=
 =?utf-8?B?SFpUL0JTOU1WYUNzN1NUS05jUE1UNXpLUmE0UFRhRVJtOEpUVXM1TXUyVUV4?=
 =?utf-8?B?NTFVSDNkc1hyTVVWNjlqeDZBRmNaZnhvaC95cVdJcklzRTZKdkJnQXg3akNn?=
 =?utf-8?B?ZjVwNkt6MCtWRnQ4NUNlUFRCVk1yV3J2b2VDeHBxcVBzQjdiQ2V0SGhRaFVS?=
 =?utf-8?B?T2M4azlMOUlQVmFLbkV1Q3ZGcXcxeFVHN21OalVhSUZ4UCsza0w2WndqL2JW?=
 =?utf-8?B?NDAxNlhpRU5XYy8vcWN2RnhEeFR0Z3NXYlhHeHJuV2hNaXZVcUY0N0tSa2dU?=
 =?utf-8?B?WmRQRjZ0WkJYMitlOVdDZnUxaEdITjQ1YjkyOGZ5ZGFSUUcycy9qUkFQQkQ0?=
 =?utf-8?B?ZEtGYkhtRWZZbDlVNkZzMHRxVEZZM1BETWpIK25Od21JazdwY2ZGMVBKMU9J?=
 =?utf-8?B?cWl2a2F1REZFazV3VzQ0OVBIR0JWODFjNHIwYngxTk00Z2VZdU1jSmk2eHpj?=
 =?utf-8?B?eEZTLy90dkNyQ0FUU0xuYktscCtIazkxZ3YzcnczN2w3cmVSZmpEdzVWSGRN?=
 =?utf-8?B?V3NsSmk2ZmJ4TDlRU0F5YXd0UThRYW0xb2xJdU00aGRSaG5Nd3FJeTRoV2lj?=
 =?utf-8?B?VmFxT1c3QkZqRTYxeHRkekFSeis0LzUxQVpmL3FYZHlVSmE5SnYxMFBxdEhK?=
 =?utf-8?B?VXVNMDZnWGxEVjhhSGdITnhCWlZmdDdtTEEzYUV2ZkZ2ZmhRZEh4QXZZMEF5?=
 =?utf-8?B?eUsyeTl0bWtFck1MMzJSY2R1UXlaOEZ0Q1RGQTBmenhDdGFMblRGbHBvV25z?=
 =?utf-8?B?Q25hR3lyQjZTOHF6R2xjVFdzZzBWYkE3QjRVZU1rb25lMStyMjNHdFFYK3FX?=
 =?utf-8?B?anBZbzliRms5ZTJub3ZlaTQ4a2FJYytSQThiamdnUllicjZNMmsyR2hYb01y?=
 =?utf-8?B?Nk5BMXRiTUFLbEt3blk3eUsvWkpzK2xlbXhvMlhQcDdVaEw4TGxmWVUyUnRp?=
 =?utf-8?B?STlJSkpGVWpLTDNXVjFtOE10dkRVRUhDbTVwSGp6Q1hPamdCaXZhZHkzMmdZ?=
 =?utf-8?B?SWFwSXhVTjI0Z0x1STNMNUUxZlpWaXJIZmZkcFUyQTBySDRvTFNaVnd1NUFR?=
 =?utf-8?B?VFBrSDRXaFpzZWZHalA2ZGtBQjZRVFNMc1FyWmxtcURWbk9nT1UrcWNxY2dN?=
 =?utf-8?B?RTdsK1R1UlNQa0svbnBZUlhZNGE3dENDblkrT0E3NU5uWFUrV0RxcEVJN0pw?=
 =?utf-8?B?VXdlMzM5ZzRFZDA3VGtTWkZIa1VlSkk3VnNmRXJ0VWY0c3N6L3pySEtKbVBi?=
 =?utf-8?B?WHBZNzJZRGx6ZjhpR2ZPVVN1UWlsZGk4dzNZazdmSmJ4YUYwMkl5SzdoVjFs?=
 =?utf-8?B?RXhsSVhibTN0UzRVV2tuOXMvTVlldG5ReWdNSnBTYXJ5ZTlQRW5kKzRWZDkv?=
 =?utf-8?B?RXMweVRrcnZ1MnREdnNZcUVyRGZYRHlYalQ3T1M4OWg2OUQ4VUNOcjE4RFRI?=
 =?utf-8?B?a0w0Rm94TW5EelhVWWhyUGRTWnpCbXNiV3d0d0RJYW1SSnNrMG90MG5CenBz?=
 =?utf-8?B?UFhwNmhwa0hjOGRZZjZkVEdBd2VpSG5ENnBMRThUalIyaGNIMU5xNkxWazhv?=
 =?utf-8?B?bnN4Zm9JSEJvdGxmb3B5UmlvOHJSVXhmOVQwaGZpSlpSVGpUZEthaWdYdDNi?=
 =?utf-8?B?Z2tKenczRk5qVGtoRlFsQkdOdCtLY1VtVFI3KzVTMkxxdlU2VHo0VW1LbEpB?=
 =?utf-8?Q?bu68Kq05zmHGd2uBKDkowWwCgQqlLLKIizgLpu7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96cb151-17a3-4cd7-69e4-08d96d4dee7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:39:33.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+DLaaVeiAmqLYWFog5pgxerKDbudS7thTvwuaPC+/CYtxuuwAQwhF2M4MZUlein1YesZpdQtJltB6ESARnjyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

All,

back in 2016 Andrew added code to x86'es variant to avoid interleaving
of output. The same issue ought to exist on Arm. The lock acquired,
or more importantly the turning off of IRQs while doing so, is now
getting in the way of having PVH Dom0's state dumped the 2nd time. For
register state I did find a sufficiently simple (yet not pretty)
workaround. For the stack, where I can't reasonably avoid using p2m
functions, this is going to be more difficult.

Since I expect Arm to want to also have interleave protection at some
point, and since Arm also acquires the p2m lock while accessing Dom0's
stacks, I wonder whether anyone has any clever idea on how to avoid
the (valid) triggering of check_lock()'s assertion without intrusive
changes. (As to intrusive changes - acquiring the p2m lock up front in
recursive mode, plus silencing check_lock() for nested acquires of a
lock that's already being held by a CPU was my initial idea.)

Thanks, Jan



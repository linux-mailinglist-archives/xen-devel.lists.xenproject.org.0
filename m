Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C430F4C3107
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 17:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278458.475720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGjQ-0002Q8-TK; Thu, 24 Feb 2022 16:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278458.475720; Thu, 24 Feb 2022 16:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGjQ-0002NF-PT; Thu, 24 Feb 2022 16:12:40 +0000
Received: by outflank-mailman (input) for mailman id 278458;
 Thu, 24 Feb 2022 16:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNGjP-0002N9-5s
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:12:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 959b46c0-958c-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 17:12:38 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-QXE8fecLOuebZUWcgNbJeQ-1; Thu, 24 Feb 2022 17:12:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB7009.eurprd04.prod.outlook.com (2603:10a6:208:19b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 16:12:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 16:12:34 +0000
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
X-Inumbo-ID: 959b46c0-958c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645719157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fes2X8LHR3MmHa1Ck0Ecg5/fD1KI8vhvIkifjMXos50=;
	b=b/PAzeJGzH75exYi/GIBLSfHsgY14AmCs/z4ODVHvix4WuoocfYOjF1dEF5xi+LZukjGb2
	fl5jpskDDoJPdsmVPd+0d9bEraRHJnALpxyxj5bdI5u3SMtOUi7oO6otCVy1MqWdNWpQKF
	FIi6a1ZDWT4WKRV5SDOMtYp+ImqDO3k=
X-MC-Unique: QXE8fecLOuebZUWcgNbJeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1AsVCk6Px3c2/+YbNqJC29nsRKKNDHPplikvJ3VPMMSkpOr4pC7T9Apeq7GB8Qa4Yd/DaSqRgjI4LWH8ANsPJ99jtQ3O/Tx7f2ov3ya1qR1zc6XZ7irbhH2roBq3cs9ue0Y7+NCZYAb4DMr36T0uuFaTho/AsjGyOVmJEmFsHWWCgqnxtgjmwvcuQdFuamWrhHRnoAjHvj6bqCsSllD2PNgGtN36VZDtXKu8k4KAnxUvUgz0zxsb0dA3ndj0otp6C9OiDZKXiuiFerHhqzZIBtviNe+NEbdsSNx5cjoTP/RaRfDsj8hkjb7BahTCU5yy2CoADkmAZQiL0HrDKkLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fes2X8LHR3MmHa1Ck0Ecg5/fD1KI8vhvIkifjMXos50=;
 b=H92E9n1bEdFo2IwoUmjzHzKwjdlMxvyO21bmozor8UHgX4v8V2eEy7D5E3DDHsVsX6TVBjWRCkJQZSXCfKRyxpW1g7S1JN02GIj2O2UwupIuJ0JFVM3FSWvN9AvxBhk9i4awz8yA0RcGMx4vtufDx8m/nxLe57+4Rk3PLmFtntv9iOUOutfckYduZjUt1XnLse4GIPdj0hBxr4H7amtB2Lx507Y2IEL1s013HwyxHpEHujfXf+xNB16MNGLgXUsjRJJfBx2tmengmgQQsJbuUl7esg35I5mIJ3tE9BE1+IWBVAw3uZ/1IC/b2R4FKft8EpJ0ps7COmMLICxzMwXJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7009dbf4-d814-6181-7315-a4fce21ee338@suse.com>
Date: Thu, 24 Feb 2022 17:12:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] xen/spinlock: use lock address for lock debug
 functions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220224105436.1480-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0157.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8547a57-f89b-4b29-ebef-08d9f7b077d3
X-MS-TrafficTypeDiagnostic: AM0PR04MB7009:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB7009C263F6D124979FA91411B33D9@AM0PR04MB7009.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RKzXo4Yf9UbLlQnEH4DBNOVa1comUaP7TK7RUHC+qhK06oFp97f3nouA+OD+XN9F65LL2Ils28usZpRc2MAHRYJl4S0hWajMhqtTpvETP96wAPzdaKmp1/OjaXZNjd8JamBcUf8tHzbQfh+6KYqRi3+PVZSStlByXDHak4C6zEXemx4WdmY8BTObrx67aMlhbYuaQWmCpZCZiNTZyVyyKkKmxpYJSGPUDhEqnmRIEA/5d/+rKK0conYZGyWQtbD6zoMWfffnJBK51kMUxvPlQLWoDni/ok7pQXecdbO7UdyUsZegA/xeKwEOgSXYj3esTgPPvey2Wq8Vhtz/9tc5GjZnBal5VsgPbvBvlg2YJH/ibrsyZhQ8iAQCkR/KlxlrpsbcOW5DWg5GX3mRjAzO2GFVLZQ8Um/v2y7cSdXrM76LF0cvEiP5pgq4TlhyPBmvsu5qq/wMFBkgcAEZrMUTmjuTtllw3phOTHcRm5qilYYGKEGV7wR0HiTEJUFmtW0ZYVwC9zJYvEGOXiVwswHYUpHEWYHD3Vil3zib2xXtBFrtznPk9AZnSwPV21xwc+ueiyzsj7viReoezj3GAd5d1qKOKUwxeXi37kgBSjsDYCXvF9kASm+XQAy0wcJOrYBD2j77ZhOs+7UBEwBvtizeUj+p+e0E/qcq49NcOmVCwi1F2Ts/K9fo2P6uLHkPGnoE9F+Leiy0a6Y/r44HpNI14fxosNGTqEvLXGjpqCu10cE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(26005)(2616005)(53546011)(186003)(6506007)(6512007)(36756003)(5660300002)(54906003)(316002)(31696002)(6636002)(37006003)(86362001)(66476007)(66946007)(4326008)(558084003)(508600001)(6862004)(2906002)(38100700002)(31686004)(8936002)(66556008)(8676002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0N5YWVITDI2djN4VWgvTHg5UVNCUE1mdUFDZEUxakY2ZHV3S3doTlNUNGY3?=
 =?utf-8?B?ek1HUU1GU1c3ZU8vUnFpTldlYmRDRGZ0QW4xT2dRVzhtN3hTK2lHdzhmRUVh?=
 =?utf-8?B?VXhiZDUzRnh1L3l3blhKMC9qUzR6OXFVQ2QxL1NXRzdjdkV0K050cDlFelV3?=
 =?utf-8?B?NEhiaWEvQlR5UHVHZmZ3L2hVTXFBUjV4T05uYkxPY1ZvV2xqZHJlbjZlRVRt?=
 =?utf-8?B?Q1dGWmpiRTZCeEhOMUltanZrdlI1SHd3d3luakFCQkNrU0dNQ0F2N0k1N3J0?=
 =?utf-8?B?eWVBUnd6Yk82S05JdXdqRndkQjdpUitpTytwYkRWVkRYMXV0Kys0Sndna3Qy?=
 =?utf-8?B?b0lJQlJOR25HVjBRam00Vzd2aWdYV2ZIMWYrT2pBUDVrOGRBb2xUNXE2ZVht?=
 =?utf-8?B?ZW82VnliM29yZ1FFMnRrTFdpSEJjRFBqR0lxTytnUmZtSzR3Q3VtYjNOVHhW?=
 =?utf-8?B?R0tqcmJGNngyb2RnVlV3ckRXRHBnRFA4M1BYZU93cXZxRnQ2Tlk1U3BjRzlP?=
 =?utf-8?B?NTRDN1ZrdW9JMnZxTjR1WWx3bW9xVi9uZlJPYzkzVW1BYmJ4VTM4OEdrSk4r?=
 =?utf-8?B?dDFOakIrVGVSaGwweCtiYktiRkx5WWJFNDk1UTk1L0lObkVORTVXZDJ5T3Qw?=
 =?utf-8?B?czd0enI1VFBMZVFnK29hVy9icHViTHF4ejBsNW5DcEZQeXVjbVlPdXRldDNq?=
 =?utf-8?B?czFHcGRZc1JhYVorY2JnaUlmck1WK2ZlSUx4b0IyYzVGQWorYlBGSXJTUE5D?=
 =?utf-8?B?VjZUN1hDV0h2MHhybXhnT2tOWXFmMEszVXR4ZFZQemNNcnNCMGd3ZUcrQ0Jp?=
 =?utf-8?B?bHlraHdBdWxRc0FJdk5NTWZMd0tBYmFCbDUxaS8rRXFQVlcybFJQVE1YNnd6?=
 =?utf-8?B?V1pVbklCd0JFVmVCemxOSERmcy9YSnhIQW81bjduS0Z6cDlaUHFCZW1aUUdv?=
 =?utf-8?B?WVhJdzIxZzVvTXExZmJIQUtnZ3dhY1BuTVhCY3JhMGEwcnU2SkpqZ0ZubHFO?=
 =?utf-8?B?aExnZDF2dWRYSWxKckhsTHA1NGxLczd4UHVvckxRbWhJNHZnWGJ6Y3JzNDFn?=
 =?utf-8?B?M1ZYeXJqbmR1TDFOU0NDZGprUURydDhsU2d6b0tTN2VSZnNveldvRm5XeFpw?=
 =?utf-8?B?bjNHSzhTTVdRbmdtQ2owNDBlYjJ4YWNTZWs1UmpKN2dtcHdaQ2w2SkhIMGJW?=
 =?utf-8?B?Y3JxSVZ4aFNGYXpxSEhqTnpNdk1XV3lNZEpjcHdmbHd2RFNpWjNaYVhtNHow?=
 =?utf-8?B?OXl4elQyUjZnRlEyZFozMFovZ09xMFBiTG9vTjZiMzQ2aXVIYjRObm0vZzN4?=
 =?utf-8?B?RGtLS0drdFFyZVp4dVZQTWJnMU5PMjloa0plOFlaOXd4M1JiZGM1eWpYZ0NT?=
 =?utf-8?B?ZnlaWmViMHJDZTg2TGVIcjBBUzdlSmkwdEdzTnJJem5OZ2dwVkk2d1ZodW9Q?=
 =?utf-8?B?M2ZzWlA5QlQvYlhEcDk3QWY5azJrNTloU1c2TVpTK3c5U0JwcWVjU0l2cjd3?=
 =?utf-8?B?Vm84NDdrSDlkcTd1alcwNW5pOUFyQ3Y3STNJSm5iNERiK0ExR2QxZm8zM0Uv?=
 =?utf-8?B?SFhLM3RHcTFUcmpsQXVBbStNaXJXY0ovcmQwSlZaNWVJbDNlays4L3VoTURh?=
 =?utf-8?B?aDZtSjRBRjU0cUR0b1p6MVQvZ3dpcVlXclZvS2ErWnR1b3VoNUpQcFNzdTNK?=
 =?utf-8?B?NGh3N0JLZGxuejloNmdoUnp3WDc1NGVNSVkwanNJSzR3TlAxaXdMblVuV1lp?=
 =?utf-8?B?ZWZZUlNHZmxmMHgzbnNGOHAyQ0MxajNYc3dRMDRRb0dwa2gvVXRNNXBVazVU?=
 =?utf-8?B?MWpaRzJWY0x2Vi9xWDg4YzB2SHVMb1crMDlFZEN1WU1GZS9lVGRxc2lOajhw?=
 =?utf-8?B?dGNFbHkrbWpCeUs1U29Hc3ZUTmFNSHZOb28yR3hvL3NhaW9EWUdRSHpkOC9k?=
 =?utf-8?B?UVFuKy9tNHYyL1BjOG1YTEFUbWVKaVJKSWRwczFEMXBGY0RhT0k0VFRwbC9U?=
 =?utf-8?B?dUFGa3BtOVhQQUdLV2h5QUVvWVVneW1vMnFPY3I1MU5LYlI5b3RXRDVlUkVG?=
 =?utf-8?B?TmJnbHhPOUoraUc3MVdzZXljR1BaWFhpcFlHdmRibk16L3dBemxsZUliV3pF?=
 =?utf-8?B?NjZvL1dGNFlFZHNGaVdvMTkvY1JEQWdNd3N5RXhsNHVpVktWR215SW5rd3Fk?=
 =?utf-8?Q?Jba6qUq+U6dZp7BZbSN7PR4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8547a57-f89b-4b29-ebef-08d9f7b077d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:12:34.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iFnLf6ucBKEKDoXjc+6HYyAUJlPiI5R7t7Ad2Rg934zwnwKLFAzOEVF82ddgV0ZDWzxk9JpWUSh6KR0QS2tEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7009

On 24.02.2022 11:54, Juergen Gross wrote:
> Instead of only passing the lock_debug address to check_lock() et al
> use the address of the spinlock.

I'm uncertain about this full exposure. The next patch looks to again
only use the new "data" subfield in these debugging helpers.

Jan



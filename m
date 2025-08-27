Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA466B37AA5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 08:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095570.1450526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9uS-0005pg-VT; Wed, 27 Aug 2025 06:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095570.1450526; Wed, 27 Aug 2025 06:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9uS-0005nd-Sq; Wed, 27 Aug 2025 06:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1095570;
 Wed, 27 Aug 2025 06:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euo8=3H=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ur9uR-0005nV-1v
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 06:45:27 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 693d7d0d-8311-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 08:45:25 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB7671.eurprd03.prod.outlook.com (2603:10a6:20b:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Wed, 27 Aug
 2025 06:45:23 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 06:45:23 +0000
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
X-Inumbo-ID: 693d7d0d-8311-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gp4qjLgU1pxZAObQ4lqJ4P4E5kV2+v7Q+fnFIS34gzp2YqipDQEl5Xcs423SXdPUQxADGhlW7R4UcD2Ih4z6bfIEpGJPtbD5QSrgJY6GyWRiWGq0cB95JGxZ9w6rBJZKBA1to7xXkWrTnX0b2/81DgWv75X0n1+6h/rSM/QShcQJFaHiFwVIORuf99lxbxw5N2SbLoFRNIn29FSlv0Fp8xk19hpwR+zq3O9/9IFSsMoNN05OHwTAjWqO1DitvhOxqeAQNOlOIRCGTOAXBib7OOPh0Hvmg7PTSjXwYi91JPYvwi52QS6YoU8zBn7+t/qqWh7aP5kSgS8A2QBaySyobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRORh+1FOtzPfYjKN6/si1q0pOD2N+uDqaDZI6o+pSs=;
 b=fa9RBOKfmXfy1dFYVeVuxYJJPlQGmQvRDVK8tE4r9NZV9yUynXT+ooBU5e+rzKDGGBXnfSa4RGQtn+ubaWJAdgZ7eLjzFicwojC1irvkdRthOxj4hpqHuUbAuiO+Mix50LXJWO0oVUtax51WQynHaHxVuLtt6bUZb+I/RU85zr4zU91/0Cs9cmtXR0ezntYu63ZRd5y+ONOzJZ7wldk7qNejMOrhk4UnroS5t8CMxITXwLmEuWWwKR312fbJrNaBxVqFfDyKc0antNPKYjZzAo343X11YzWC7xM/SMNIINSrfgBWHGpQpCANAd2eDoSaIUmWcF5ALLvXMaVP31mFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRORh+1FOtzPfYjKN6/si1q0pOD2N+uDqaDZI6o+pSs=;
 b=h5xiF+CDHE3x6NaRaTbQ1WekYlaB0SjeeaWayfjvoDjAZ+/UGV24vm208rwApbbsI7N9b6uVeK7P5e0v4FOEID5I2caoAv/FwCBkodqIQqfnBM0AhyNeXcGtcFxVzv7A8XBlKYCa/CwvSIH7PeUsKItX/e0zwO+ZLslqmNFduNWW+EJYk7OWOX8m3xqwGdQ0zwATbt0vMEQsFDRjIYnO9Qe3EE9XLrIXUx98acdDUSxNv3XnzzKz/tbu+FuZBClPnt5WzHQUa211CtrE9hNL3HG23ENJzdz3YOsd0j1tca+TwhkMcvzGsIJV7uC1rjRHnx02zuo4WS8xW8rlPmDiYA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Jan Beulich <jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcFQc77bBOPokbA0m9oV6J6fEgkLRzJgAAgAIYbQCAABMZAIAATP2AgABzv4A=
Date: Wed, 27 Aug 2025 06:45:23 +0000
Message-ID: <fd663009-fdaa-4208-910a-1ffda39df051@epam.com>
References:
 <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
 <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
 <d9e9deaa-fa3e-4f4a-aa70-772af4bc1371@epam.com>
 <97fe4a398af94ee08a15a586ac4a6b4e@bugseng.com>
 <alpine.DEB.2.22.394.2508261648590.3391208@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2508261648590.3391208@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB7671:EE_
x-ms-office365-filtering-correlation-id: b53fbdc8-3b4c-4032-f1c0-08dde5354c32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHZEdUcxV3ZkcGZpSDdBY2dIekY0RTRkUVdhRUxZZm5pcVRvdkxHTmJKWHVo?=
 =?utf-8?B?enRmWnRzVGhtaHZSSXpTaHM1RStsVi9mZnl1b2s5MGgvWk5aREZaMUFJWjZV?=
 =?utf-8?B?T3BoNG5rK3BFUXowc3BxNzdoUTk4TXlNVUJEZzlQM3MzUnJXb09SZ0tkZk1a?=
 =?utf-8?B?ekR0aTV3Ykl5ZlFGNGNtV1hPTXlaa2VBbHdjRm9vU25RRWJGQ2dVT1FNL090?=
 =?utf-8?B?N2JlVGpGZEdienBzTUIrNGhKSlN1WmZJK3YxeXFCSklpUzlBM0pMTkNhR1JC?=
 =?utf-8?B?WHBrYVdqUTEzN0lkc2tjdklldnhwcU5helg0TDdtZlNkbFhZaUVsa2ZGaGoz?=
 =?utf-8?B?VStOOFpXb0k5ZFg1NGVFamIzNUR4Um5jaUZFNFpsbWhaYU9wSFFua0JmcVFp?=
 =?utf-8?B?MUJSRkxaZHFIek1JMnNxdGphRm9VSXNZWnFyRlBrYjlDejBKZnpKdHlRYVJR?=
 =?utf-8?B?SHNXY2JnYXZXTzhLbTA3Mnk0dzQvaUVCOThvWlh2UFBEWXJUdlpVM0hHbXdG?=
 =?utf-8?B?bGJ1aEVJbEZaci95SlEwdFUvdTVGQnEyN3dqOEtZSTY5WC9yZ0F5RDFIb1Ja?=
 =?utf-8?B?QmYwUUoyMzRZTkp2Y3M1NXZOMnhFZEFrQ2ovMklEWG8vU0cybjRiOUxHaHNz?=
 =?utf-8?B?d1FNTmxqZWFxa1lMYWdsVkZnb1VWMUlDODlWZTBaWGRoVWZwa1djZnIyd2RJ?=
 =?utf-8?B?MFR4Z2dMb3czeWdieGYxVlp2eVlwRkd6SGcvN2RGZFhSSncrN3dTWHI0cHd6?=
 =?utf-8?B?TE5CVlRCWmRsN0FlYk9hNkJuaTh0WWdhNTNKNHltazhEQ2pzcS9URmMvN2Rx?=
 =?utf-8?B?cmNaUTNKOTBMVjVPMEpwWnJlTHdNSG9MNzRNaTZkdEZEeGRBUkRxd2VKNlhq?=
 =?utf-8?B?L25UUlVUVG5zNUl0WndzS3ZKdTI3UjIzWGlDYVc1a2hibytUdnVkWVdySW1L?=
 =?utf-8?B?SGhCVWhRb01ad0xMWmk5Y0hBTEpWVk1SQ2JNMEh3YWoxWGlJVkI4R29URDc2?=
 =?utf-8?B?aGkxNWkremZnOHpVaTFnb0hranYyeUttZGtQdjErMFpCMkNSaVJXbGdHWWpr?=
 =?utf-8?B?VXZFME53L0t0RjJJNEtCZThoNEhGVEh0cHRiM2krUisvc04xd1FRWEtrakM3?=
 =?utf-8?B?RWRMcDY5SHoxVS9hZTJuNXhRdzJ0MW9QdVBSZ0VpMFV2b2hyMXJIbXh2cnly?=
 =?utf-8?B?MEIwRldQNnc4Y000ajJNbGtNWWw2VzREUmRNTDljNWR6d1BMTHNJdGpNTEs2?=
 =?utf-8?B?c3pLdmY2VHEwZC9INjFieFJpK2k1MXpNSjVFK2NXWmFJbWhsMWp4QU9oaVQ4?=
 =?utf-8?B?SVVjeCszQS9jdDRndE16ZVc1RkkreXBZTWV1NDg2Z2tua1NYOUNkWldOWEE5?=
 =?utf-8?B?cFhSQ3NrR0FqWUhYMlJwREE5VGJTeDI5REtsQm1MWVZ1L0kxNVZrcWEvKytt?=
 =?utf-8?B?N3pESnZJMlMvVkZ0cGMvdXYyREZGc3RQSmxHa0lzR0hUeit1K2oxSVlabkgw?=
 =?utf-8?B?UUlVdU9GMHFqMDdSeUljTzlHTTZsYmF3akEzUzlTYjhPSzVISlNwdFVMQm9r?=
 =?utf-8?B?eURIT0hJazB6ellIczlZRm5DT1hEM2dRUjRZcy9vRE5heHFkQkZOL05oSDFj?=
 =?utf-8?B?Yzc2ZVhXbXV5cHlvMGhNRHBlSkNPYkNMMDY0RGh6dEg0eDhURWNYaURsQWFo?=
 =?utf-8?B?QVgydG9LTDhGSWsrUEh6Vkk0eGZMUWN1Q3ptYXFuSEo4cFBwNXp3VU52QnJj?=
 =?utf-8?B?OWtmaWJoRTJhNldQVGhXd2ZUcDYyYVpQMllqZEhubGNXVnhFSFVIZ1VvcTBh?=
 =?utf-8?B?RGFnUWpMTmtlZEsrM3BwdExrd0xqTDFVRzVBVXdaYWFmRlFIUWpYb1JpeVg3?=
 =?utf-8?B?S0Z3VmVIZmRvM3hCd0NXODNhTUEweFVEcVpuV0lvVkY4NEVDNHA5OXRHR21o?=
 =?utf-8?Q?EkHE/Q/iEDw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uzl5UTlkT0lQTU03SmxBZGhOMXYwSDc1Vk9ldlVONitOY0dzOWtMekhRZG95?=
 =?utf-8?B?blFHZVJQN3Y4RGc2WlNyQjR0VXhINnZ3Y3pna2lha3JZc1FhQTQxblg5cEJ0?=
 =?utf-8?B?RDlFV2tyRHFzKzNjRndQSm5mempuU3dpMUd5Q2lMQjF6QTljT25rek1yS3Vv?=
 =?utf-8?B?ZlhwWTYxR0VBOVlmSFdoK09kdVZ0eS81YThHWjdBcXNrbE5WUG15ekZNay9V?=
 =?utf-8?B?TXpqcm5zcitBTzZmemZzTkdwMm56RzFSZTI4OGQ3ZExNTjBYNm9tQzVrTGpx?=
 =?utf-8?B?SFE2NnEvZXQ4REJ4WGRIbVV1VllvUTlsZ0pyZGRMcXpCZjRneGI5OHFnUjBr?=
 =?utf-8?B?UFdKWFRxWVhjMjVmSHp0YUVTV2JIMzBhTEZiemorQlBnazhjM2ZSRUxkZGkr?=
 =?utf-8?B?VkhMRGpxR2FuU1FaTmJkR3BzSlUxRVVPekhYSVVjWE83Mmc2Z01KY2lWSTlD?=
 =?utf-8?B?ajIzQUpMR3NxT1hvNjk0dk41UllPUklLUWZlYkpJQmxQV21ML2x3R1NlKy9D?=
 =?utf-8?B?b3BTVUhROTZhUGlMNjFWT1NTMkJoTXdQUkpFc0xDWFFFZnBQd2gvL0Q1ZGZY?=
 =?utf-8?B?OHpMM0xMV29vSUtNOHkvV0ZUUDJ0bU9QZzI2VEV3c3R2elA2NWlxZ0lSOFBl?=
 =?utf-8?B?WmxqYWZIaEYxRnlTcHUvdFRDMVpLNGR3cmorQnJHRldrMStIdEE5UmZIYjB1?=
 =?utf-8?B?aGZ0QnFSZnZ3Y3AzWVJpY2dxUFJBMmVtU3JZdDFDdGdQUWlCV2ZHN3FmOHJ4?=
 =?utf-8?B?MHY2SHllbkppN3FFUkhhWnJiUS94WkdCdnk0QmNhRUlwK2VnaTJ5QUZFOGw0?=
 =?utf-8?B?U1FEZUJjN3ZveXI0VkZqQTZEWFU4STlYNGthU1o3N2JVYWlFc3htNWorQ1R1?=
 =?utf-8?B?YlNsaWNMZHBPRVIvenRycVlJc2E4V1N3eS9CL1hIU3dMNzBpWUltaUx2NGtU?=
 =?utf-8?B?SmZOMjNhYlZFV3I5OWxlRXhTL0pKUlNsUjl1MUxscUQyV3ViUXpnUWQ3emdp?=
 =?utf-8?B?dFUzTGxQN1hKWG1Ba2dWVWVGYmxKQ3JJNW41OU1IUC80aFd5THZiM2RWSE93?=
 =?utf-8?B?ZG5wMCtQeExEODZUQzNTM2VsaDROTFgwb1JLNUt3ODJVbUowODl1RENqdHNF?=
 =?utf-8?B?dmVOUkhBSnlHVzBkbGtWYzZDOVNNdys4MmxGRTVQalh0cG1xeThPZXF4MU9Z?=
 =?utf-8?B?eks3L0FoNXVJRlpRdmpZc25KWlhKSjVxOUMyVE01THdzMnRYeVhwVXdYa3Zr?=
 =?utf-8?B?cDliUU9HSDFwOW1uTXgxMW8xVm5qUTBtS0VVSDFvRTUxTVZwMWt3UTBWd1BP?=
 =?utf-8?B?VEpHSTlsUi9UbCtMNy90OU1JSHB3RG51MkUrN1BaSWJrNndBZmtrL3ZRaE45?=
 =?utf-8?B?UDRXUzlGR0dQckRseTNMMk5yRWZIZUxrVUczSEs2TzVLUGVlbEZtRDdDdkht?=
 =?utf-8?B?aS9GaTdWM3BrN3ZZS1BBWHpTdWJ0MldQcFV0MWVibEQ0b2pnWTA4aTJ2ZXY3?=
 =?utf-8?B?TjVPNHYzc0R1R0dkdEVsMkZ3dERXdXcwazgxcGIvYk5RZWtFR240TVZoWjVj?=
 =?utf-8?B?a05oTWkwZlBTQnFCdk9YYlZHTDQ2NkROWmZxWDB6VDZkeU1lT0MwVkJYRFUw?=
 =?utf-8?B?eTVQUEYrVzZibGNyUHpyQitLY2tSQmFQTXZYbSswU2Z1RGdYWGhUdW9Bdll2?=
 =?utf-8?B?VldCajlQamFxNXc3eTZoMUVFbkpsWkhSNVgxVDBjQW9SSllETThPSUlPMTZ6?=
 =?utf-8?B?WVFGRHZhQU8rTkJVakd6OXFZam1DVHJsYk92U08zRU5LZEVWckZjZWlONmpO?=
 =?utf-8?B?MGx2L3RCK0tldTErcFN6UVd1aU1QenZMbHQ5MWpVQ0p6aSt0SHZjSDNVNUdv?=
 =?utf-8?B?TTduVlhiNmord1ZPZmVYa0JsSTVHcksyRWUvb0IxMnhPNFFBWnlIRTZ5ZTgy?=
 =?utf-8?B?dlZjWGgrWkg0Snd3a2hFMXZuWDF5SmY5dVEycnBwSC9YUEI4b3JaVWdHOHJj?=
 =?utf-8?B?bERpZnVNZDAyS1FLZVRzZ25pRjJrUWlJOS9YZzBzWkpQaFVqTEoyVW9oNk12?=
 =?utf-8?B?d3JhMWcwRS9SeUM1UlhzMytEbWF1ZGlnT2ZucitmRWRiOUVhV3hMb1ZoSjl3?=
 =?utf-8?B?bHBFdzV2SDhKek84OGpnYU9CVHJaei9zc0F4U0phaWtQU0ovVDZpYkhJZUF5?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAC9BBD13395664D9AA5543DF1858665@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53fbdc8-3b4c-4032-f1c0-08dde5354c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 06:45:23.0775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okMGnnygvE1CtHxkPWiqTwTsD54rTN44Cd2xSAHhREuD9V/gVcZVrqOn2Oum65Pms8YaMsX3bp/ahBSG+x+32AP5Jh8FziUNL4Cqfau7NyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7671

DQoNCk9uIDgvMjcvMjUgMDI6NTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gVHVl
LCAyNiBBdWcgMjAyNSwgTmljb2xhIFZldHJpbmkgd3JvdGU6DQo+PiBPbiAyMDI1LTA4LTI2IDIw
OjA3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pj4gT24gOC8yNS8yNSAxMzowNywgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDI0LjA4LjIwMjUgMTY6NTYsIERteXRybyBQcm9rb3Bj
aHVrMSB3cm90ZToNCj4+Pj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+Pj4+
ICsrKyBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+Pj4+IEBAIC05Nyw2ICs5NywxOSBA
QCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4+Pj4gICAgICAg
ICAgIFhlbiBleHBlY3RzIGRldmVsb3BlcnMgdG8gZW5zdXJlIGNvZGUgcmVtYWlucyBzYWZlIGFu
ZCByZWxpYWJsZQ0KPj4+Pj4gaW4gYnVpbGRzLA0KPj4+Pj4gICAgICAgICAgIGV2ZW4gd2hlbiBk
ZWJ1Zy1vbmx5IGFzc2VydGlvbnMgbGlrZSBgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgYXJlDQo+Pj4+
PiByZW1vdmVkLg0KPj4+Pj4NCj4+Pj4+ICsgICAqIC0gUjIuMQ0KPj4+Pj4gKyAgICAgLSBUaGUg
J0JVRygpJyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gdGhlICdwcmVwYXJlX2FjcGko
KScNCj4+Pj4+IGZ1bmN0aW9uDQo+Pj4+PiArICAgICAgIGluIHNwZWNpZmljIGJ1aWxkIGNvbmZp
Z3VyYXRpb24gKHdoZW4gdGhlIGNvbmZpZyBDT05GSUdfQUNQSSBpcw0KPj4+Pj4gbm90DQo+Pj4+
PiArICAgICAgIGRlZmluZWQpIHRvIHRyaWdnZXIgYW4gZXJyb3IgaWYgQUNQSS1yZWxhdGVkIGZl
YXR1cmVzIGFyZSB1c2VkDQo+Pj4+PiBpbmNvcnJlY3RseS4NCj4+Pj4+ICsgICAgIC0gVGFnZ2Vk
IGFzIGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlSLg0KPj4+Pg0KPj4+PiBXaXRoDQo+Pj4+DQo+Pj4+
ICNkZWZpbmUgYWNwaV9kaXNhYmxlZCB0cnVlDQo+Pj4+DQo+Pj4+IGluIHhlbi9hY3BpLmggSSBk
b24ndCBzZWUgd2h5IHdlIGV2ZW4gaGF2ZSB0aGF0IGlubGluZSBzdHViLiBXaGVuIGl0J3MNCj4+
Pj4gZHJvcHBlZA0KPj4+PiBhbmQgdGhlIGRlY2xhcmF0aW9uIGxlZnQgaW4gcGxhY2Ugd2l0aG91
dCAjaWZkZWYgQ09ORklHX0FDUEkgYXJvdW5kIGl0LA0KPj4+PiB0aGUNCj4+Pj4gY29tcGlsZXIg
d2lsbCBEQ0UgdGhlIGNvZGUgKG11Y2ggbGlrZSB3ZSBhcnJhbmdlIGZvciBpbiBtYW55IG90aGVy
DQo+Pj4+IHBsYWNlcykuIE5vDQo+Pj4+IGRldmlhdGlvbiBuZWVkZWQgdGhlbi4NCj4+Pj4NCj4+
Pj4gSWYgc3VjaCBhIGRldmlhdGlvbiB3YXMgdG8gYmUgYWRkZWQsIGl0IHdvdWxkIG5lZWQgZGlz
YW1iaWd1YXRpbmcuIEENCj4+Pj4gZnVuY3Rpb24NCj4+Pj4gb2YgdGhlIGdpdmVuIG5hbWUgY291
bGQgYXBwZWFyIGluIHg4NiBhcyB3ZWxsLiBUaGF0IHdvdWxkbid0IGJlIGNvdmVyZWQgYnkNCj4+
Pj4gdGhlDQo+Pj4+IEVjbGFpciBjb25maWcgdGhlbiwgYnV0IGl0IHdvdWxkIGJlIGNvdmVyZWQg
YnkgdGhlIHRleHQgaGVyZS4NCj4+Pj4NCj4+Pj4+ICsgICAqIC0gUjIuMQ0KPj4+Pj4gKyAgICAg
LSBUaGUgJ0JVRygpJyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gJ2dpY3YzX2RvX0xQ
SScoKSBhbmQNCj4+Pj4+ICsgICAgICAgJ2dpY3YzX2l0c19zZXR1cF9jb2xsZWN0aW9uKCknIGZ1
bmN0aW9ucyBpbiBzcGVjaWZpYyBidWlsZA0KPj4+Pj4gY29uZmlndXJhdGlvbg0KPj4+Pj4gKyAg
ICAgICAod2hlbiB0aGUgY29uZmlnIENPTkZJR19IQVNfSVRTIGlzIG5vdCBkZWZpbmVkKSB0byBj
YXRjaCBhbmQNCj4+Pj4+IHByZXZlbnQgYW55DQo+Pj4+PiArICAgICAgIHVuaW50ZW5kZWQgZXhl
Y3V0aW9uIG9mIGNvZGUgdGhhdCBzaG91bGQgb25seSBydW4gd2hlbiBJVFMgaXMNCj4+Pj4+IGF2
YWlsYWJsZS4NCj4+Pj4+ICsgICAgIC0gVGFnZ2VkIGFzIGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlS
Lg0KPj4+Pg0KPj4+PiBJIGRpZG4ndCBsb29rIGF0IHRoaXMsIGJ1dCBJIHdvdWxkIHZlcnkgbXVj
aCBob3BlIHRoYXQgc29tZXRoaW5nIHNpbWlsYXINCj4+Pj4gY291bGQNCj4+Pj4gYmUgZG9uZSB0
aGVyZSBhcyB3ZWxsLg0KPj4+Pg0KPj4+PiBKYW4NCj4+Pg0KPj4+IEFmdGVyIHNtYWxsIGNoYW5n
ZXMgcmVsYXRlZCB0byBwcmVwYXJlX2FjcGkoKSBmdW5jdGlvbiwgTWlzcmEgUjIuMQ0KPj4+IHZp
b2xhdGlvbiBoYXMgZ29uZS4gVGhlIGNvbXBpbGVyIHJlYWxseSBkb2VzIERDRToNCj4+Pg0KPj4+
ICAgICAgIGlmICggYWNwaV9kaXNhYmxlZCA8PDwgdGhpcyBpcyBUUlVFICkNCj4+PiAgICAgICB7
DQo+Pj4gICAgICAgICAgIHJjID0gcHJlcGFyZV9kdGJfaHdkb20oZCwga2luZm8pOw0KPj4+ICAg
ICAgICAgICBpZiAoIHJjIDwgMCApDQo+Pj4gICAgICAgICAgICAgICByZXR1cm4gcmM7DQo+Pj4g
I2lmZGVmIENPTkZJR19IQVNfUENJDQo+Pj4gICAgICAgICAgIHJjID0gcGNpX2hvc3RfYnJpZGdl
X21hcHBpbmdzKGQpOw0KPj4+ICNlbmRpZg0KPj4+ICAgICAgIH0NCj4+PiAgICAgICBlbHNlDQo+
Pj4gICAgICAgICAgIHJjID0gcHJlcGFyZV9hY3BpKGQsIGtpbmZvKTsgPDw8IERDRQ0KPj4+DQo+
Pj4gSSB3aWxsIHB1Ymxpc2ggaXQgYXMgc2VwYXJhdGUgcGF0Y2guDQo+Pj4gVGhhbmtzIHRvIEph
biwgSSByZWFsbHkgYXBwcmVjaWF0ZSBoaXMgaGVscC4NCj4+Pg0KPj4+DQo+Pj4gVGhlIHNpdHVh
dGlvbiB3aXRoIGZ1bmN0aW9ucyBnaWN2M19kb19MUEkoKSwNCj4+PiBnaWN2M19pdHNfc2V0dXBf
Y29sbGVjdGlvbigpIGFuZCBjb25maWcgQ09ORklHX0hBU19JVFMgaXMgbGl0dGxlIGJpdA0KPj4+
IGRpZmZlcmVudC4NCj4+PiBUaGUgY29tcGlsZXIgY2FuIGRvIERDRSBpbiBjYXNlIHdoZW4gY29u
ZmlnIENPTkZJR19IQVNfSVRTIGlzICJ5IiwgYW5kDQo+Pj4gTWlzcmEgUjIuMSB2aW9sYXRpb24g
cmVsYXRlZCB0byB0aGVzZSBmdW5jdGlvbnMgYWxzbyBjYW4gYmUgcmVzb2x2ZWQuDQo+Pj4gQWN0
dWFsbHksIG5vIGNoYW5nZXMgaW4gc291cmNlIGNvZGUgbmVlZCBmb3IgdGhhdC4NCj4+PiBCdXQg
RWNsYWlyIGRldGVjdHMgdGhlc2UgdmlvbGF0aW9ucyBiZWNhdXNlIGNvbmZpZyBDT05GSUdfSEFT
X0lUUyBpcw0KPj4+ICJuIiwgYW5kIHNvdXJjZSBjb2RlIGlzIHJlYWxseSBjb21waWxlZCB3aXRo
IGlubGluZSBzdHViIGZ1bmN0aW9ucyAod2l0aA0KPj4+IEJVRygpIG1hY3JvKS4NCj4+PiBUaGlz
IGlzIGJlY2F1c2UgY29uZmlnIENPTkZJR19IQVNfSVRTIGlzICJleHBlcmltZW50YWwvdW5zdXBw
b3J0ZWQiDQo+Pj4NCj4+PiAgICAgICBjb25maWcgSEFTX0lUUw0KPj4+ICAgICAgICAgICAgICAg
Ym9vbCAiR0lDdjMgSVRTIE1TSSBjb250cm9sbGVyIHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYN
Cj4+PiAgICBVTlNVUFBPUlRFRA0KPj4+ICAgICAgICAgICBkZXBlbmRzIG9uIEdJQ1YzICYmICFO
RVdfVkdJQyAmJiAhQVJNXzMyDQo+Pj4NCj4+PiBhbmQgdG8gZW5hYmxlIGl0IG5lZWQgdG8gc2V0
IGFkZGl0aW9uYWwgY29uZmlnOiAiQ09ORklHX1VOU1VQUE9SVEVEPXkiLg0KPj4+DQo+Pj4gSSB0
cmllZCB0byB0ZXN0IGl0IChhZGRlZCAiQ09ORklHX1VOU1VQUE9SVEVEPXkiIGludG8NCj4+PiBh
dXRvbWF0aW9uL2dpdGxhYi1jaS9hbmFseXplLnlhbWwgZmlsZSkuIFlvdSBjYW4gc2VlIG15IENJ
IHBpcGVsaW5lOg0KPj4+IGh0dHBzOi8vZWNsYWlyLWFuYWx5c2lzLWxvZ3MueGVucHJvamVjdC5v
cmcvZnMvdmFyL2xvY2FsL2VjbGFpci94ZW4tcHJvamVjdC5lY2RmL3hlbi1wcm9qZWN0L3Blb3Bs
ZS9kaW1hcHJrcDRrL3hlbi9FQ0xBSVJfbm9ybWFsL3J1bGVfMi4xX2dpY3YzX2l0c19ob3N0X2hh
c19pdHNfdjIvQVJNNjQvMTExNDQ4NTQwOTIvUFJPSkVDVC5lY2Q7L2J5X3NlcnZpY2UuaHRtbCNz
ZXJ2aWNlJmtpbmQNCj4+Pg0KPj4+IFVuZm9ydHVuYXRlbHksIEkgb2JzZXJ2ZWQgKzYgbmV3IHZp
b2xhdGlvbnMgd2l0aCB0aGF0IGFkZGl0aW9uYWwgY29uZmlnDQo+Pj4gIkNPTkZJR19VTlNVUFBP
UlRFRD15Ii4NCj4+Pg0KPj4+IEkgZG9uJ3Qga25vdyBob3cgYW5kIHdoeSB0aGVzZSBFWFRSQV9Y
RU5fQ09ORklHIHdlcmUgc2VsZWN0ZWQgaW4gdGhlDQo+Pj4gZmlsZSAnYXV0b21hdGlvbi9naXRs
YWItY2kvYW5hbHl6ZS55YW1sJy4gQW5kIGFyZSB3ZSBhYmxlIHRvIGFkZCBuZXcNCj4+PiBjb25m
aWdzIGhlcmUgPy4uLi4NCj4+Pg0KPj4NCj4+IFlvdSdsbCBoYXZlIHRvIGFzayBTdGVmYW5vIGFi
b3V0IHRoYXQsIGJ1dCBJIGRvdWJ0IGF0IHRoaXMgc3RhZ2UuIFRob3NlIHNldCBvZg0KPj4gY29u
ZmlncyBmb3IgQXJtIGFuZCBYODYgaGFzIGJlZW4gc2VsZWN0ZWQgfjIgeWVhcnMgYWdvLg0KPg0K
PiBXZSBoYXZlIG1pZ3JhdGVkIHRvIGEgbmV3IGZhc3RlciBFQ0xBSVIgcnVubmVyLg0KPg0KPiBJ
IGRvIG5vdCB0aGluayB3ZSBzaG91bGQgY2hhbmdlIHRoZSBleGlzdGluZyBjb25maWd1cmF0aW9u
LiBJZiBhbnl0aGluZywNCj4gSSB3b3VsZCByZW1vdmUgb3B0aW9ucyBmcm9tIGl0IHJhdGhlciB0
aGFuIGFkZCBtb3JlLg0KPg0KPiBIb3dldmVyLCB3ZSBjYW4gYWRkIGFkZGl0aW9uYWwgY29uZmln
dXJhdGlvbnMgYnkgY3JlYXRpbmcgbW9yZSBFQ0xBSVINCj4gam9icywgYW5kIHRoYW5rcyB0byB0
aGUgbmV3IHJ1bm5lciB3ZSBzaG91bGQgYmUgYWJsZSB0byBrZWVwIHVwLg0KDQpJIGp1c3QgcmVh
bGl6ZWQsIHRoYXQgdGhlIGNvbXBpbGVyIHNob3VsZCBkbyBEQ0UgZm9yDQpnaWN2M19pdHNfc2V0
dXBfY29sbGVjdGlvbigpIGluIGNhc2Ugb2YgY29uZmlnIENPTkZJR19IQVNfSVRTIGlzICJuIi4N
Cg0KICAgICBpZiAoIGdpY3YzX2l0c19ob3N0X2hhc19pdHMoKSA8PDwgdGhpcyBpcyBGQUxTRSAp
DQogICAgIHsNCiAgICAgICAgIGlmICggIWdpY3YzX2VuYWJsZV9scGlzKCkgKQ0KICAgICAgICAg
ICAgIHJldHVybiAtRUJVU1k7DQogICAgICAgICByZXQgPSBnaWN2M19pdHNfc2V0dXBfY29sbGVj
dGlvbihzbXBfcHJvY2Vzc29yX2lkKCkpOw0KICAgICAgICAgaWYgKCByZXQgKQ0KICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQogICAgIH0NCkknbGwgdGFrZSBhIGxvb2sgYWdhaW4uDQoNCg==


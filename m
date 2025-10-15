Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EF5BDED3F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 15:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143608.1477273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rF-0002Cq-Od; Wed, 15 Oct 2025 13:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143608.1477273; Wed, 15 Oct 2025 13:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rF-0002AQ-Kx; Wed, 15 Oct 2025 13:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1143608;
 Wed, 15 Oct 2025 13:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v91rE-0002AF-16
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:48:00 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8efe10dc-a9cd-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 15:47:58 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5176.namprd03.prod.outlook.com (2603:10b6:610:97::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:47:55 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:47:55 +0000
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
X-Inumbo-ID: 8efe10dc-a9cd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfYde3y3riSFT1G65ZibNoaItQWojvQpN6IKAa9LjCMlNiCvwT+td5mgXrp9z1pybxDvUocMHJmy6wgoGlGjMenw0MMQ3PPvCM9UQNDzZGKFVvoY6Trd26Pku4HxwuPCtyVAYpp/YCF692UgMFBOkMisnbJ+Cwv+KQ0LYltDGweDXBck1Jzl2du4ejkyQhVbLtpQh04QHxz/ru6hzicKcqAhyu+Pum0psflFHl4ZzVGVn8hXcY4AYVxpiBkDpZoSCtNoeOs46iXTjQfDeJ9GFdO2bSnMKRuQSwlIG/9eMpxu+L1Qj5OaI55Yfznfz8MwwheNeXqr7GyGN98XKNcsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jAaEkbPMClbdXrDp068D9KRbyTHRkgW/ifsonbGhPQ=;
 b=bzm3zW3Hh65jYYCKm/FzFnReb3A74SjmC1gYba/XrsPIgUVL9N0ZGIp2KBuguatyFIaa6HJ2uQYKXn+35woXrx14hf/ijNUa9BH5dQa846sPTIVoxxcT/xOmNozd0ixPjliRovA0qsLiU3RLLG8ODYTczlSTvWp/zont7KhScYMhJeTLtrFP36x6KtasPZQIxpoU6QWjGBh1WvRezD5MYiVSbhfXvONgWafxzCYXsYqUufwznrV1nM9TWCOG6X950yjg+3j+BRVnWJS/OkerKcw4V5kyYEgOSh4oGZAgYwXmu2cC94vsnr3vJd5caoknyI8LPyVrAiuZzlqPAv2jVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jAaEkbPMClbdXrDp068D9KRbyTHRkgW/ifsonbGhPQ=;
 b=R0jrf2QVpipJsOEpUf/huSNwwzwWO6DcMu/xVMZ5Jszluur5GKep7tjZGohjKz6xl9iUY5Mcny6zatlCnLTKmmXMcy+NC+oFRq7moTOQjra+2saAW4GKYA8sr3s01k0jHSio5LnzfC9YF/bRQ65oEYWp/CCXuIi9Kn4+HGL/J0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.21 1/6] tools/{lib,}xl: fix usage of error return from json_tokener_parse_verbose()
Date: Wed, 15 Oct 2025 15:40:38 +0200
Message-ID: <20251015134043.72316-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0028.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::15)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdaecdc-0590-4a66-f4ba-08de0bf17168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlpHQ3JleXVUNGdmRFcrOFB2YitiOEVKdTBnQUx0L0ZuaDl6TzBLZ211c2dE?=
 =?utf-8?B?ZGoyRGFwVkNrZndpbmE5c0UzYW1iWlNLSld3UEIyT3BEY2VTQ1ppaFhieUMw?=
 =?utf-8?B?SkxVcFNVL3pXeVUxQ2ovU1dvb3VsWlh2QXZPRmhJUEFJYkErUjdFS0liREg5?=
 =?utf-8?B?SEE0a3N5TVZkem56L1hWVTcwYXErOEZvZnlrN0xOcCthdHBZN3V4MTFpZ1Zs?=
 =?utf-8?B?bUs5aXVWRmNQNUFtVUxEdjV1dnRYWFR6V3VDVVJwVmw2OGpIOHhManJxaEhy?=
 =?utf-8?B?cC9CdUVZNGl2THFhNVRTZWczS1prMm90SmpFVDRBbE1RQ1RyZGxnT3RWbVZm?=
 =?utf-8?B?VGVINmQvVCtaMXduMWR3Uks5SGszZlJSaFdOUnBMU0E4SUVqUEcwb0w3Tjc2?=
 =?utf-8?B?aGFRUHJZS1dPTlI2ZG9TTkVzdys4d2RwbUhEQkhqZ1RYMXpFOFVXM3ZXN1NF?=
 =?utf-8?B?UUZxQmNYTkwyNkwyL2VXcmdEVGRlbDJFdnNmcjQram9NWXlOM2w0clA2SGFZ?=
 =?utf-8?B?SjRvRzFHeFlXWTN4Ull5ZDdLSFVvL2IweC9NdVZuOVZFYXZuSndnR0EzSTlI?=
 =?utf-8?B?bnprWDB4cWpuUjJqMlgzRWJZZ0NIMm5MeGxDOExlYUpaS1A3eGlEaXBDamVx?=
 =?utf-8?B?SWpxMnY4R3RkM3Zrb0R4TE1yY3JtbXpuUTJHMDdMZWxDdGJTbnNDWmNHYTFU?=
 =?utf-8?B?Z2RBL2FHaUtoU0p0Y1N3WlBudE5oVWdIU3A3TUtJWkxKNi8zSVEyZDZoRnZE?=
 =?utf-8?B?aFM2eTQyM2dFOFc0VE1vMlI3NDUvMlhHOXJmVDF0d1R6S25VSC9BelZjSTRi?=
 =?utf-8?B?WUtLSElaRHdyZHdBK1FGcmViR1ZaNmtzQndFRjFrSHVubFg4L2VlQi9iWDR0?=
 =?utf-8?B?NktHZkJQUHlYTWZTbTFCWm9oT3hRaDVZSGJnQ01Wakw3MmtBSnNlQnJNdk9a?=
 =?utf-8?B?YklYSHJnY1ZOQkQ4bWhValIweWF0d3VOWjhNeWdnVzFjakprdjRESVZyS2ZN?=
 =?utf-8?B?SWowZnAzaVlPQUdiVlU1NXpMSy8vb3lJeEs3MlRUQXRzd1RHOTZxR001R0ZQ?=
 =?utf-8?B?Sm5wR3ExMklNNVd3d21CZXRSbm91NWpEWCs3UVFuVDczRml3SWhnWXFGN2pT?=
 =?utf-8?B?ZWRCaGJONjNxY3dSLzBnK3kxYzdIVDVCQWJ5YmxidDB1WlQ5TTVNNDNjZTdM?=
 =?utf-8?B?V2lCcGM5OUFvTGlIdjZkbVY3a1NxU3V3Q2hGeTRoT2c2ZEV5V2lIbU9wNldO?=
 =?utf-8?B?RmcveHZURGV1QWh4QWtrUm96VHpkUTU0YkQwWHB4a0MvOEY1Z3BtZFJZUHVG?=
 =?utf-8?B?QzcyQjhtdGJTMDJnTW94Yk5RNkRqN3Ftb2hoRlFmUlByVGVOSmduOEU0RFFV?=
 =?utf-8?B?UHZ4Y0pVbHhOa0RobDQwT2xITERUOUVuS0VWME91SXd1OHlHK25tVW5FNDl2?=
 =?utf-8?B?R1FyZHVjKzBxaVhhQTlxdlRTMnlOdkw2SFVmWk9mN1VmaGo2cm1UUnlrYkFh?=
 =?utf-8?B?cXRvUm11dlhRTUVCbzQ4TEE3anVOSFIram9JUFJNWGdqc0VXSm5kbjZkekpm?=
 =?utf-8?B?VEVIZ1dKMTRseW9ZT0pBb3hWTGtCVGhWU3N0Ym9WM0t1SzFFTGtjV2xGRXhy?=
 =?utf-8?B?bVhnbndSVnhFeUx0cHhJemh3VlJHL2gwSFJhMElBOFNKQUtqMmxhb1NycEtS?=
 =?utf-8?B?KzUrTy9LWUtUTEZyU091V3VZV1V3SmdEenRiT2s1VCtxVnF1MHVJQkNZRWNR?=
 =?utf-8?B?Ty9GVU41enlSSjgyeE5EdzFpWTJNUW5ISjVFTUg3UmRvZmtISFdXTEZYNFY2?=
 =?utf-8?B?LzRadkhab1Q0Zmt6SEM1aWJRQ0RvUlI4ZG5Ta2xkRDdCSndZaFYrNG1ZdjZJ?=
 =?utf-8?B?VHhBNTlicnV2NWxDUHVwNWw5NXFkS0xTUWtmdWFONzNUUkhwUm0wL21iMFh3?=
 =?utf-8?Q?T3fXqUgKxDGY0FBo2Mg3MLJwHg3MqV5T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVN1UmpoRHpmbUkvUGRUVVpZcmRHV2VCS3ZXdTlJODM5clpRRTlJRGRSTGQ3?=
 =?utf-8?B?SXdMWGxwbUdRRUN3amc1MiswdEZPOGU2V3JaODVIcGUzaHFkcHA3dzJIZDFR?=
 =?utf-8?B?VjFTY3E5ZFV1TS91aU5tQjEzd0VFZmxjZTF4ZURLTzJUSWRuOFJVNEVndVp3?=
 =?utf-8?B?THRXUk9sQ3JFNC9oeXFRM0xubGtpb3FDQTljbEdWOWVHaHlVSmw1TEphTDB4?=
 =?utf-8?B?TnBIVE5qaHhkdFhETC9Ic3gremtBOS9CY2VXSFloekVvL0N2UkVRZUNKT0Mw?=
 =?utf-8?B?NUlncjNBbUlJcmdaTnFCL28xWHFVQ2xFRjJETGFMZHdSTVBnbTB5Ujg5R0tY?=
 =?utf-8?B?VGRHVnM1OG1reUtLOENmQXJIUXJ2S04relc3MXVJSDY3VDQrVmhQRlh0VE1z?=
 =?utf-8?B?VzU3Q2JXbHNkR3FaUUNWTTZPSEN3MjNyWUlidStWQkV3SUJCaS9HMjB1RXkz?=
 =?utf-8?B?RnhNVzA2RkZWN0VVUXpkb1BLK0VQZEVqSmJaOEJDRlNjRHFkQWFCdDJoREhF?=
 =?utf-8?B?dnpMOVpxeGd4dENQc1Q5UWl1cEVWWjE2bG1tUjJLZ2V6R0gwQTlVdGxCQWJn?=
 =?utf-8?B?Z3owZFdkcmVWZ3htMEVpWjJNeGlDVmZVdVJGK09FSEJjV3pTcFNGM1JrS2VB?=
 =?utf-8?B?cGZlOU1uZ1JvVFpHWk5URmFKVFhUUzg1bW5Jc0pGN1hsdFExMnEvVkg3RGRV?=
 =?utf-8?B?dWEzVFUzTHZWQmtVU3V5d1dYLzB6QWozN0hxOHdIVmlEVUdzVFFLWjdrUFpD?=
 =?utf-8?B?Y1ZacDhEOGY4YVBtS2psRWsrT1lMMElFK2NTL3RaSnNWZmJ6eWkzVFljRFIr?=
 =?utf-8?B?YzEzMXl6a0Q1cmNJOXkvOGZPQVFQR0FROGhSY20wZmJ4dGVNL3pZRXNMczBi?=
 =?utf-8?B?UkpIYllYWDIxU3doVzlzUnh4alc2KzFPSE03YTFabUNsbXJWT3F6bS9IM0Ra?=
 =?utf-8?B?dm5tb1hpMkdnZjQxTEU0ZWlheVJudkhMOXlEVkRzTndJWHpjR0UrWVYxSlYr?=
 =?utf-8?B?clEvWTNBMk43WWRlOWl1OEludFdBczhtdndrakRHQmdtdWtXemtFaXMxVTlF?=
 =?utf-8?B?a0t6eGRJcWJ5dzRkaENleXQ0M1lqdDVHWS9kY05VOXVPb1RKWTVvNG5EdTF3?=
 =?utf-8?B?bW9URlJ3cEZGQ2NzVUZaT0Y5UEIyM3BCV050K2drRjN2OFlsS1RXK285OTZt?=
 =?utf-8?B?YnFZVDZoYlU5UU5SdklDK2ttTXFYdGFVREEwMzJqRklNNHFjVjRyY2VPQzdx?=
 =?utf-8?B?NXNFSC9zZktGZThNbmJYTVlkNUZjNkhmaWlIejd1WkhuNWgzdExaMGN1d2dx?=
 =?utf-8?B?U090akErTUMxRjA3b2c1Uy9haUh3ZjRoUjM4N1RHYVpjSkc5L0MrYVp5Z1Vi?=
 =?utf-8?B?ZXRPanU2N3RtWDdhNmNScStXYjFQL0ZHWHh5a25OWHNaNkNOcXdIMTBFaDg1?=
 =?utf-8?B?WHlISGtaVVdxTi8rWVRvSTFOZ1FYRkhZQ1VGWTI1dWdGNFMxUHg0d05TY1Q0?=
 =?utf-8?B?bENqTjFhMkxuR2RsTXBSRTlhNmFLNUpNbmtCRVJldFEzdWxPR3BQQkFLcVRm?=
 =?utf-8?B?cEdVVWJrckxtSW5JTno5c0hGS1M1ZFcwYlFqSTJVaU5ONW9rb1h5ME9hZ2ZX?=
 =?utf-8?B?Wk1UdDdvSHY0ME5CbzZudVYwcUZmQVBsTW4vTWdrTFR3Nk8xNkc5ZGloS0E0?=
 =?utf-8?B?SUczMWZyR2Y2Wm5aZWNjcHV5OVgxbXE4MHZRcWhmdGwvc2N3UVhvUFpOUE5Q?=
 =?utf-8?B?UnQ4eGE0ZU1IYkQyWDFxSWZNcEcvUE5XZVZkYTFudi9DQ3d2Mnk2YzlHSVB6?=
 =?utf-8?B?akdBVFEwOXVSQTRHSm9sQzBCaGMvajNUOXRmaktSTklDaEZ3WDVJcmE5bm9R?=
 =?utf-8?B?bHh6dmNxVXBUcnRKVCs3WC9YR0VRenhkaWduNUVjWTlFUmVlTW5SL2FzVFBG?=
 =?utf-8?B?ekh1Q0dFbEhENFYzL1YvRzlWS2tBZGEydVVsb2tIdzU3eU8yUTBGTUlEbTFw?=
 =?utf-8?B?bm5CYWcrVHhtbTlKNVJ3ZXRnRGhRcVVrYlBzVXc3bDZkaklGZ0dKZExNdUZt?=
 =?utf-8?B?L0d6Z1J0QUxMUWRPVUhHa3NGNnR3UnJvaFlPTytBL0N4ZnNVSnJnWklzMHVx?=
 =?utf-8?Q?aPtA4QYBjEkx6Rt6aKc/cc0T8?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdaecdc-0590-4a66-f4ba-08de0bf17168
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:47:55.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71oJRwGfHZVqcm02hv/aRII8EbB82I+Ryx2oXlg+cmzt/Uw71tUEsr9DB9IpdS79UtA3csoe1gg+QLAznK4zRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5176

It's possible for json_tokener_parse_verbose() to return NULL and leave the
error parameter unset.  Initialize the error token to success, and only
print it if the function has actually set it to a value different than
success.

Reported by XenServer internal Coverity instance.

Fixes: 7e95dab9eb63 ("libxl: Convert libxl__json_parse() to use json-c")
Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_json.c | 6 ++++--
 tools/xl/xl_info.c            | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index c76ae9f64a9d..a9e06b06932d 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -1366,11 +1366,13 @@ libxl__json_object *libxl__json_parse(libxl__gc *gc, const char *s)
     libxl__json_object *o = NULL;
 #ifdef USE_LIBJSONC_PARSER
     json_object *jso;
-    enum json_tokener_error error;
+    enum json_tokener_error error = json_tokener_success;
 
     jso = json_tokener_parse_verbose(s, &error);
     if (!jso) {
-        LOG(ERROR, "json-c parse error: %s", json_tokener_error_desc(error));
+        LOG(ERROR, "json-c parse error: %s",
+            error != json_tokener_success ? json_tokener_error_desc(error)
+                                          : "unspecified error");
         goto out;
     }
 #endif
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 80a3b25aac81..777ff2c64294 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -67,7 +67,7 @@ static int printf_info_one_json(json_object **jso_r, int domid,
 {
     json_object *jso = NULL;
     json_object *jso_config = NULL;
-    enum json_tokener_error error;
+    enum json_tokener_error error = json_tokener_success;
     char *s = NULL;
     int r = EXIT_FAILURE;
 
@@ -75,7 +75,8 @@ static int printf_info_one_json(json_object **jso_r, int domid,
     jso_config = json_tokener_parse_verbose(s, &error);
     if (!jso_config) {
         fprintf(stderr, "fail to parse JSON from libxl_domain_config_to_json(): %s\n",
-                json_tokener_error_desc(error));
+                error != json_tokener_success ? json_tokener_error_desc(error)
+                                              : "unspecified error");
         goto out;
     }
 
-- 
2.51.0



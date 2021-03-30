Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3E34E248
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 09:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103348.197219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lR8vi-0002K7-RK; Tue, 30 Mar 2021 07:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103348.197219; Tue, 30 Mar 2021 07:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lR8vi-0002Ji-O9; Tue, 30 Mar 2021 07:36:50 +0000
Received: by outflank-mailman (input) for mailman id 103348;
 Tue, 30 Mar 2021 07:36:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+zKW=I4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lR8vg-0002Jd-Kj
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 07:36:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cab94b86-5019-4269-bc46-c910418c3c95;
 Tue, 30 Mar 2021 07:36:47 +0000 (UTC)
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
X-Inumbo-ID: cab94b86-5019-4269-bc46-c910418c3c95
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617089807;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Mg3f2tInI3XQfEfu0YLCafyhfelZUjhIiyxCrmiLubw=;
  b=IGcBjVXZTA1Ci1dBipSY6IhvUPjCqseK1tefh6uE+dv0nL3057v/NW4W
   A77uR8mdk5Ctl0AYe+quk7Ha5xkRsGGxt66HagdAG2Ozdmjx7ahaRIFvW
   ugWdCDGj2zG/pzhU0mHiznFcIsXKugNzGeOtFFUZBkcrzLFnnqpR3lles
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WxKklPlqZSGexaY34wYBVWt73qHxfuy8l4nrmipXy1TNpGz6ZSIhgwTIjQYyh8ZeszBzSORGpw
 cVhuoe2pkVHXXLhe5XXsFojXmkF6ibak0YI2YkH2L5P0Uw7EBHPwQ9Xt44REiPhbEFvhHRDOXn
 SGShtJGty3oy2jd54ltCT2b/ni6OK9n5g5Gf3Sj8ufqhaxJWlGTkHGFzibIvB40Elw6/GAzD/6
 Beb1fR0JupHMc9CDk0vOtUVO+DJ20IIuKj3ESc6CnxYxvyBEFppDWt/RgQzjZUep/2h+f6TMkf
 Bco=
X-SBRS: 5.2
X-MesageID: 40424356
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rGgBWa6747ApFaST3APXwXiEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbTqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH76GL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnk4j41VTRTzbA+tV
 XUigCR3NTZj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+2SVTat7XbnqhkFRnMiO7xIQnM
 DIs1McOa1Img/sV0WUhTeo5AX6yjYp7BbZuC+lqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmKzoA3H69fFTB1snEavyEBS6dI7tHBDTZAYLIZYsI13xjIlLL47ACn45Io7ed
 Meav302fA+SyL/U1np+kNrwNCqQ00pGAaHTkUoqqWuokZrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO5ALdZEZfHyJn3GQBrKPm7XCVP7FJsfM3aIj5Ls+r066MyjZZRg9up8pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjulD+plQoNTHNfrWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3jf5R4JZJRAlIYwok+d+f2jLjtPAK4XsuOCeWu3UPqDRHTEtXX66LW
 AEWBT1OcVc/mGmUnL1m3HqKjHQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOCTAqiN1yQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F1dDpQoANVLIYa8O0u/vPVx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaBPn+FiWAQ4FaHVY0VlKHGxcqNQOJ3Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzYO/jJIVA+nbX8JmgBiiJPNVrX63jzTemegfAl8gGxK+W8+ehggjAxBOgE
 dqzqMZiL2c3Qq0JXAHm+Q+Ol1UYGGxCLZLZT71I7l8q/TOQkVdXG2KjTuVh1UWdnDx/0sfvG
 DnMBaZYOrGGFZbp3Be3Jv76V8cTBTvQ2tALlRB9aFtH2XPvXh+ldWGYae+yEO9QFoPyON1Ck
 CPXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfAIaLfIwE6gL4WOiIALF/JZ54xeKdjrq+MHON
 jvPTO9HXfdMacEygaVrnEqNG1Is3Eii+rvwwCgw26i3nIzaMCiVmhOdvU+GZW74GflTfrTj8
 k8otIxoOeqMmL+LvSB0rraajZfKhXV5U66JttY3ax8jOYXjv9UGZKebB7jkFdg9z86JN3vlE
 wfTL9giYqxcrNHTog3QWZh4lEtlN6zN0MlvQz9P/8mcTgW/grmFuLMx4CNlKEmDUKArjbhIF
 Wz8yVS+PHeQiuIvIRqfJ4YECBzaEIm7m5l8/7HX4rMCB+yf+UrxivxDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27d1BrLtTV2ZoJI/GDPe7L+PCu8XcpJ+ce9I1KCn++D59Oyli7+TX+DUHsj7L
 c1PHA4X4BkkTktjIo+zyi0ROjWmyse4iRjyAAisEXs1Iig6HrcBmdcP2Ti88xrYQU=
X-IronPort-AV: E=Sophos;i="5.81,290,1610427600"; 
   d="scan'208";a="40424356"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZt756R/PvSgMhSjqcFoX8psWt/GEaACfYWPyvfl68NRM2ucA8lMZIdCizRLlTEirWr3Veu3yiIa90Rqzcz2Oy+dS9AAGpiaIQBPO8f/p8/4xUtdRZrg5hUymiFKtUQE1xSG4z3hUpjeLPTd5QYzwZd8gpP/ONf0W/zqJ8wQFpmP3nXDEA8q32c+ME7pQF0rAAHTmFjTxnXa+En56y2ZmZGI0cLHBx2TI3kNPvYzO0hHScsu+mxFoWRoecU3UCdG0eMdca2lY6X+N43O2zaxGj149IHs8bp8XFbDtFfEzsfIkqtK4nLouSN1h/k2l5FNYniqqI5aY0//b2EiX897rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=525GPiB0IPOPfB0ATOYfQQh19wiwQ8jGEvUEH8Nje6g=;
 b=e2Z4I0ziZHVhDlJ1roE8JCBgMkixzhPUacUfOzhKWyrnJr3+KAR2gcgZLG5jdSMnhX3fm18BFb9UrD7/bn+buNZN8VQlujLMv75b0zoFvVEUGmx3yKaw4mG5k8XgTznU7bDItBcJAdsgrB2TlvLW+JFtpIABkFXS2L96wMBAW8yz7g70Wm7khUnYRPDB3uyyhAF5RXhG3n8FWFhWSzO9Q9rnjtlHzInNcndtigbBRsMHadyUxD4HFRXehqiVCWiut7LLgi6XKNpPs/qUe9L3A8pSqkdvR9Y6evi7kjOszfxlKuvVwJ3NwwEn6oyHqA69dgoVPkn3LkZRktzVEza7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=525GPiB0IPOPfB0ATOYfQQh19wiwQ8jGEvUEH8Nje6g=;
 b=ZhnaWfj4f+XXYnQ3BBu34M2IVhVf0wF1U3fPsZF7d+PN9LoU/nn4vNd8liPLeEjV6+SJXioYWRc02Jlnlul1dgUhhGGhN4cfRRhJVFUrVxZo5xz5Dfcvh4Oyl5Isxa2Ou9yBVJHjb/85RIc9/qKWPl0WoFSZB1XrWiX5+o5qSAI=
Date: Tue, 30 Mar 2021 09:36:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <wl@xen.org>, <stephen.s.brennan@oracle.com>,
	<iwj@xenproject.org>
Subject: Re: [PATCH v3 2/2] x86/vpt: Simplify locking argument to
 write_{un}lock
Message-ID: <YGLU78AZmN2SAIbV@Air-de-Roger>
References: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
 <1617052502-14181-3-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1617052502-14181-3-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: PR3P189CA0052.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0115518-29b5-41c4-f057-08d8f34e82fc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB41404AAE3F9FBFC6E170B3568F7D9@DM6PR03MB4140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRH2XRv30afaTpP8lgfvjebNtsAeYV68NMVGYwQWzjuiA2RSH9vKdmvk1QRzsos2X7Sy10pKfFPhJ/5nY1UUInffSTkyyRb3IKSbSS9tdfI2+kq6I+Ue7KyM4uVMSzUzONClAuZt+SVXTPToBYP68JuwduWmmgx1XZnyUuAe2ZCHucXe5X13pR11pkpWYghcC70sbc+0dNmPcUkZOAdL+0utx3oqazxNJ0Cq/ym21qol5HrhLr2zTLrXyj+V1xlarVpKCatq+CXC9fFIoPsKghs28nuUeRjTLZ0y4EhAgKkCqAnvQwhR9hM4SbKsy7rPXFtZIggZYFmpulcdqEvqWVTZFxDb2sy3VHR3D5bX/D3P/59GFKZdpwHUTNoQ4bPlJ1XcjTZAxVzhKwX8xxKd8+lv7Os2OP0ntr4C9mtKErUS8MouzwcGz9ywYst22rrLEDN4D9Bllf7wQTxl2yPydYdk+PSnppv4ntlwSB74AAmypSK9XxV6qeigJ6Fa26JwY6kYnz8Zf/0r8E3/CMKg7kNppuYv/us6a6cjqEruOa8Wq8RLLZpFQhXblv+JKh0qJ7BdPVBh12YQjq2hYt7udb8iU8VGR++GYyN8UZPXyXx/knb99w2ZayOmQm5RH6bSSROsgB2RokrShYD5XpIo/6ICyQpWSqwrwkjT1rr7Xm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(346002)(366004)(396003)(39860400002)(6666004)(5660300002)(85182001)(956004)(6496006)(4744005)(26005)(33716001)(2906002)(478600001)(38100700001)(186003)(4326008)(16526019)(66476007)(66946007)(83380400001)(86362001)(8936002)(8676002)(6486002)(6916009)(66556008)(316002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUZiT2t6R2Y3dkxyZFR6bnp4SDFPYXFzd2h4V1hzRHlvbCt5ZEZFSFdwOU9r?=
 =?utf-8?B?bm0wZmdyQVVac3ZuWG1zbG81aEJMYlJHeTF6OUozOU9QZENhYlBIOW1pRmVh?=
 =?utf-8?B?VnpUNTFJV3FGMm1meXBVWXhRYU5aa21iamhNOVJ4ZTVHc3ZjL3NTTFpwancr?=
 =?utf-8?B?dG96cW1OenpncE5GN3h3c0FsdXpJd2YxRWNwWVVZVEl1UVdnNnMrNVFxenUw?=
 =?utf-8?B?a2NPcWJ5YU9LeHV1VFMwSjVCamgvYmYzeEM2N21jeGpWK0c2VDVtWGo5YXkz?=
 =?utf-8?B?dTZQSHlEYy9NQUx4eVRJWngwTmVWa3VSMTB1Nk9XSVhDY005R3RaZnhaM2V4?=
 =?utf-8?B?enNyZXBWOVdyV0dNU2tsZFM5dkdsMExJbmxsOUxUSnRsZlNEa3owcmZJdnp3?=
 =?utf-8?B?VCt0MWJmdE9DL3ZXZ1dzazcyVnFOMGVSNGhoYTZCVFc0clFwVDlGYitGeHpj?=
 =?utf-8?B?WmQ3OWZjdmdjNHprMzRITzgwNVc1Uy9BNGdXeWNPMk1LazhDZGdqK2NibFZC?=
 =?utf-8?B?UEViZWlTdlR0U1h6d2xEVVY0RE5XRUppNzJMeTgvOFA1YXVwSXFKdVRRN2Fa?=
 =?utf-8?B?VEQ4b2tmZWtrclgvRjZnaGFZYjRiTVI5Y1Z3QnZLRWVIR2dmNC9kdkhuVEU1?=
 =?utf-8?B?N2U0b3R6RDFvMVZmbkc4cFgyOXFqRjA2N3VmT2FkVy9NMWFwdWZTbHJjWWow?=
 =?utf-8?B?dHltcU44WVQ2REs2RG9kNG5YZFlaQkFnZnl5Y2dTL1lBZnRzTUhPYXUvMG9M?=
 =?utf-8?B?OVZjWjZDMDd3b2lhOG1VUXJLNUxvd2o0RG9wRXlVcFUySWtoMUFNNTNqVVBZ?=
 =?utf-8?B?S0N5K0F1RGtWV09TOVA0UG9yUk5pNGxyTUxDRXhodGtrSDdZbEJYbW9BdEU4?=
 =?utf-8?B?cVBLb3lGYks2c29qRkcwY1dmV3YreEJDa09Ed1kwTlI4ZUhVSFR6R3BVc1hG?=
 =?utf-8?B?aGlWQkEzUVdiYWRGKzBkeDQraHdVQjc3azUvT1hKdzhQS2xQQ1dPU0tzb0xF?=
 =?utf-8?B?VU9admxXb0pIU3RNZ1BsUjJseUVuRXprelZEdXF2aWJvbHJoTXV0cUpvM094?=
 =?utf-8?B?cEkvZGE1NmdmWlpIbWpab3MzUFpaNllLcVRwK0k0ak5lS2pxZTlSNmQwZmc0?=
 =?utf-8?B?Y3VpSjJVVnNOUExHa0Y4d1VaSmQ0WFc4OEs2djB5R0dDSjN4cURXVlFnQXht?=
 =?utf-8?B?VHZ5bU5BazhFaVBwUk5ZelRiR21ROXBiRVpNOXVOSFV5eXRSRUhPL0tEaTEz?=
 =?utf-8?B?Yk1YWGVBcUNMY0FjUGs1YWpIZ3dldEhMZW9RbjY2YUUrdDY5Z2sxT01PT0Rs?=
 =?utf-8?B?UG1GYTE3cnZFRVVyYUxBZUZvYzhPdTE1OENabVoxZTJDcms2SGF1Y1J6QXR4?=
 =?utf-8?B?Z1BRQ2ozTnFtZnRoaUZGL3NPeVZWdnpNOFllYmRYSWFQZFV0YkhaeE9hc0Ji?=
 =?utf-8?B?VlduRnRDSlF6WlJNZ0hyV0xhL3B0UjBHUVlaQndSSGF4U0lOL1B4d0s0clZl?=
 =?utf-8?B?TzFKa1c1cTM5UWZiUHBBc28zaGZJNitzYzFkV1k5UVduN1UrWWNtNnFsbm0z?=
 =?utf-8?B?U09vZEpkNEtBSWpEU3VHekg2Zy9NcmlqSFBPT2EyUHQ1TjQwY2VhRzFTOTFo?=
 =?utf-8?B?Qlh1d3lSRXc0cDFiUU1tTzdMT1NBTDVuczB5aDhUSUo0NVd5N0syeWgrN3JR?=
 =?utf-8?B?RThXMjN6Y211Qzk1UWlVS2ZuWlBvSlZiTlpJQWVmbmgxZTRGeVAyanBDQ0tN?=
 =?utf-8?Q?5vJ/YOz21PTeSj8Iry/A18hPiYmdFir1c5RZlGY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0115518-29b5-41c4-f057-08d8f34e82fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 07:36:20.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7/ZMGTGK5F1WxdioqW9SdbcvQH/HM71EQFMiFvy2MS5bxl2CQ7OO3VFSVuOncU8dUgnHB1O0KnL7Brtsj6dkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4140
X-OriginatorOrg: citrix.com

On Mon, Mar 29, 2021 at 05:15:02PM -0400, Boris Ostrovsky wrote:
> Make both create_periodic_time() and pt_adjust_vcpu() call
> write_{un}lock with similar arguments.
> 

Might be worth adding that this is not a functional change?

> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Either way:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> New patch.
> 
> I ended up doing what Jan asked --- create_periodic_time() is also using different
> start pointers in lock() and unlock().

Hm, I'm not sure I'm following, create_periodic_time uses 'v' in both
write_{un}lock calls, which doesn't change across the function.

Thanks, Roger.


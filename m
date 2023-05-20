Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E363C70A72E
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 12:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537438.836631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Jpv-0007DW-Fb; Sat, 20 May 2023 10:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537438.836631; Sat, 20 May 2023 10:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Jpv-0007BY-CH; Sat, 20 May 2023 10:29:19 +0000
Received: by outflank-mailman (input) for mailman id 537438;
 Sat, 20 May 2023 10:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gC4k=BJ=citrix.com=prvs=49700c0d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q0Jps-0007BS-RS
 for xen-devel@lists.xenproject.org; Sat, 20 May 2023 10:29:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 286ac7a9-f6f9-11ed-8611-37d641c3527e;
 Sat, 20 May 2023 12:29:12 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2023 06:29:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5424.namprd03.prod.outlook.com (2603:10b6:a03:288::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Sat, 20 May
 2023 10:29:05 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Sat, 20 May 2023
 10:29:05 +0000
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
X-Inumbo-ID: 286ac7a9-f6f9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684578552;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3499sCilo3iEujJFGnrENNT5RUBhvZC85sDOwfu2T5g=;
  b=NCkclGaWs7G+ktgy1DEXx8rzXwTd7fmdhGJuA88B7c7FbQCcNmqFMI6a
   AcbRHKZ2nJPVfuW6IPsr1dAGNjyVSAHGMuKp0WORO9itvDR9bObYykrS9
   p18i00dg5IkjuJUqp6OB32g3gIcNChfF8nbhhMqRi4lpncgM/wjm4p/Wm
   o=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 108509498
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wANGX6MpTFshqBfvrR1KlsFynXyQoLVcMsEvi/4bfWQNrUp23mFTn
 zNLXj3SaKqJYmumKox/PNyx9xkOvpPQnd5lHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5ARmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0skpGTpc/
 vdJEhoQMTm52LKd6bHiQMA506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr827eewXKrMG4UPI+IxvBRjQHO+n0sIwQ3el+5/KawzWfrDrqzL
 GRRoELCt5Ma71e3R9PwWxm5pn+svRMGXddUVeog52mlyKDZ/gKYDWgsVSNaZZots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsSAIf5tD5rYIbjxTRT81iGqq4kt30Hz7rx
 zmA6iM5gt07ncMN1qz951nIgjugr5vOUyY84wmRVWWghj6Vf6agbo2srFLdvfBJKd/DSkHb5
 SZV3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxewC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:kUE96aHGaw/GQCtGpLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rtiMc9wxhOk3I9ervBEDiex/hHPxOgbX5VI3KNDUO01HGEGgN1+rfKjTbakjDytI=
X-Talos-CUID: =?us-ascii?q?9a23=3AE/CPX2uOTbyOwQfRtS1cqpO06IsKLGWG3nzbcnW?=
 =?us-ascii?q?SFDlAcuLFYnaToalNxp8=3D?=
X-Talos-MUID: 9a23:90jt4At3ggta4MHdes2ntgFSOvxlv/mSGX8miLQpv8vZaiU3EmLI
X-IronPort-AV: E=Sophos;i="6.00,179,1681185600"; 
   d="scan'208";a="108509498"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTJOBV6wqALcj7yQ2wQGmJtXfPpRPm8BwVg5Nau5R/gqEaRM+JdHvilMZX/i+gWJ8h6xrE+PRWeM+MB6eHWfr996OpJuhPLHTsA3zilu4gZ6bmsqbobIUdqX5+u+4J3XvF5fIW7yk/EuigunTjlc+iXx+vfWMTiUWQ9YMf7XueloekfX6xJt5515mQfZmJxlwrY/otpTiKiIHiDinwcB6HWMREfk7S+j/gzEP1EUOmfi3pHFGfz9NDJYIS/GjTtPJrJ8Bkgwigy7EqzE0q/+u6O0uLQcR2b/U09m2CBUE6xJqrN1BoEvFnD+Y2aEDASsL0Z3bDwZtW2Tz/FZKF7Cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNK6oQIqbVqYEq+1yNQdn3vyXnTqWQNd+tznevS4kcg=;
 b=mDZa1LITgRGoJb5FPwdeDwvZIQKF5nyv1VTgbVUh4Cd1Md8uv/oA9bLmt2CVpmZtyxUnT11mdXCRAEbj5nq7jr7C63Q1O71TcEHBG+5jXq+0QJUlkhLfqKkBowDNQKfUa1CZ0PSgpD8dsOo5m+Eu6iMCvGZVQNrS0qwZoAWVyNIS7Bi1swk+sruzIq0BGfAeHRrmlvQmLv5k4Bf0x9Er1RL7Ma/BptT0IJRJ8LJ65PHIRowky7aIgu/CMueUfcNygl90xbDPjbJoys9T/IlEGdA7i2LlldBD0XRGRZB6KPEm5R0C8vGtz82GQDz4zIpq3GyPFT1pfF7tM8cAhVQ1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNK6oQIqbVqYEq+1yNQdn3vyXnTqWQNd+tznevS4kcg=;
 b=LIQtIz8vMewnfKdqTL5YiKDDgTJPCxTB5+z4W2HjUHiQoi2CFBa3jrb9p9aPIT5QU7gHrm/yEHqEuYlFmuWDD80rbau4vd9iT0X28Y+0twyJRxzEJUTcMyHda4pAmUuNPtKvLnd66I+ePT2qaNZa6zzRGfim6NDdIV1N/wQLqTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Sat, 20 May 2023 12:28:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGig68UTddfEwR6P@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5424:EE_
X-MS-Office365-Filtering-Correlation-Id: c208c769-2c7b-468c-0be3-08db591d0928
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y8oQ++qcvMYBIGUBI/33tu3AWoiTpya3ft1DoffH7gEBgN/kZPo3tI2pjUbqILc+SrDl1OntT5mIlfvYejFHyowTje4e1KB925bUxzLXb0pORRqYN+z8tVJ7QlZFH28gYLE78lbqSW7/QhCUGeGV07c8QzPztRV6lK/H+fanVhqImXw+WCo6xs8F++TL5KYB472pa4qC2CyoGxJcS74o/+Fi2ipY9rr6/SGqeAvjUHpWa3ukrpIm/s8tI1+I9TXj1rEvFCLjrvO/BwLfEo8mmplnAQ+xfSV6WFyQa8bGP3sWr5lVgUTTyJBcHE7UNcBtb3WnaDbugkxX1EDM9+E+e5PKTVlv5eM2dapU6RHSRiFdIWcfF/7Vp5KgNy0n7oY//2RNpEubvLyjjG8vsraHIlvKmHpNMCMZ1k95XrRP/bPCjbugl7gEXfHqrime9p+NCUkJss0PJMPQHeTY272MZU7qnn7susm1+1BA+OxflsIuN7nbOdEs2yyMHXvCEJ35qhFmqG/L0zeAZOI9owLNFEZ9qav+yvZOg785r2wj4vgQCWXN7j5h4+YldAWHRL421NG+ADlXBj97H4rxKsaAJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(6666004)(478600001)(26005)(66556008)(66476007)(6916009)(66946007)(4326008)(316002)(6486002)(66899021)(41300700001)(966005)(8676002)(8936002)(5660300002)(6506007)(83380400001)(85182001)(82960400001)(33716001)(86362001)(38100700002)(186003)(2906002)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czNxc1F1RjJqYjFhaU5rRDdLVWk4YzJPbWdxQ0xxYWpub0dYWWNTbngxM1Ji?=
 =?utf-8?B?bkt4bEIrajZYSUh1OGxlR1dRNVFPUG1TUEU5YVNQNFhGODQ0RDFwMXZHdGdU?=
 =?utf-8?B?WUc0YWp5U0FhZlNQZFR4cVFnMFJoYmRkVWhmeFBka0lKenZyMjFncDNWTU10?=
 =?utf-8?B?OVhZTmNCOUlXNmE0dmJqZElqWjNRMEQrU3htdFlhdWp4WWNjRXlzaG53ZitD?=
 =?utf-8?B?cUNLY0ZnRUJ0VkMwWWxyOHhjdnVIVElFb1NZdyt5TTR4YU9LR1BrVXNOZlUx?=
 =?utf-8?B?MFZnV1VTL3oxRzQ2ZTl2aERsR0c2WFJoY0U4SUZEWkR6ME5mSFA4U0l5VGV0?=
 =?utf-8?B?SGt4MUJaZWk5ZGlVVHJ1aXkvNEdJczZxZm5wdmFtVDd4V0dOb2w2RHlxaE85?=
 =?utf-8?B?VU95TmdpTUVsM1NOQ2UyOEtBSVltYnVEL0d4Y3U1b09EaFFRUmRYb29NdmxF?=
 =?utf-8?B?TGlmMHpNWWlHTG5BcHRVSUNRWXRUekx4ZFB3Vk1rcmh6cDJtWFV0VWxvczAv?=
 =?utf-8?B?TGMwUzh2TWs1d0lSeS9CY0IyamtJaHhyaG5SU2xrSDBXQnVDdGk5QUxrYjho?=
 =?utf-8?B?Wm1EOHZZVlBEbGhieUZmdkdubjVVODRsQmV2VUl5ZlhSZnhBaGpEVU9hZDZx?=
 =?utf-8?B?ekFzVEFxb3dMYnBQcW5tdjRETnpxbXJ0a3ZLR0wxNzUvS1V1Z3VTWXRGZmpQ?=
 =?utf-8?B?MEdBZUQrZVErTmlDV3hydnRqTzhMV3IxNDNnTUlZK0N2NWFsWU9nZXR1blRY?=
 =?utf-8?B?V3BBK051NjZZWml2UVhsQStJMXBpcDFZdDdYdklqSVFKVUx1UHU3NWFFb0dw?=
 =?utf-8?B?LzQraElqOU9JQklDdFp0TTlpOXRaRmg1OU9CVWZwY1ZCcWd0WVN5Q0tleGxL?=
 =?utf-8?B?SlJraWMzVlZxMmxiVlVJdTV6UlovLzZpeGlOcHpBWGUwRlJxT1lVMHhaRXd5?=
 =?utf-8?B?SmFDRnV1MnBmdXFWQVJiVzhOQXVWUzg3aUlxdkhyUkh6dnBLOGQ5UXJkd3B0?=
 =?utf-8?B?cUFWYm5MSnlKK1NQbVFjYloyZUpuT290bjJ4OEMvanAweVlxa2ZVbzdCTk5E?=
 =?utf-8?B?YVFGcHdjSDZadkY2ZU1IUk9yeUhEWkpTZGhhUzBQbmU1MkdNSU8rTkZmcmZi?=
 =?utf-8?B?b3FhMEJmT1Blb0hHUk96aGxTeGhjQTZEeHRQUU44UlF4akRVcEUvT05OSU8z?=
 =?utf-8?B?UXA1T1VZN0JGYytzNjNXQ3VHNERsNFQxb3d2dS81YThBU2RNT28rMjFDMjVw?=
 =?utf-8?B?SlpXdkh3MFN4TzcyUzRZUER5Y2xndm9Od1R3K1gxQkNDdk1uZG1BNEtyd0xE?=
 =?utf-8?B?MDJmaXJTVGh1TC9kNDNmVTJUdWplYkwrMitsQnBqU3ZDNVZEc3hBd3RxZmwv?=
 =?utf-8?B?SERrd1BtR2c0UWhoYUhWcGx1YVNzc0ZaMGpYeTJGVlVKd3ZMUUQ5VVpjWEY2?=
 =?utf-8?B?NCtaa1BmRjZCMFFiekY0M0xKY2xCenAxbVVFSHhCdldKa1FSVUU5ZTVld1lt?=
 =?utf-8?B?dGlRNG45TGFhOHdEMzNzNko2T01nZ3l6ZVhsR0lvT3Z6LzNvZ1Vsb2t4eS9H?=
 =?utf-8?B?VTBkMjI2Q2l5b1BnTmtDOGhiVUVNalVFMnJnd2RQYmJjTVc2dURkVmJFckln?=
 =?utf-8?B?em8weXlGNkw3dnBjNmJuWkduNXI5OXE1eUtSNmJNS3pyNUdPUHh4VFhUelh4?=
 =?utf-8?B?NFVhQUczemJiYzA2bXoyaTVoUGloSjNwRUZ0b293SnZIZWhFRmtCQi90akkx?=
 =?utf-8?B?elM1U0VCZGxLcUE3a0p5R2NkcytGdlZFM1ZRSlVyRVRXUlpNa3RnWUNqT2Va?=
 =?utf-8?B?WkVqVTJOY3hMdE84Q3Rkc0U3Sk1uSXdxQjEzYlowM2pVQjM1RDNXcDY5SmdO?=
 =?utf-8?B?MkZwby94RVBPL3ViNDBBY2hWYm1HVW9SalF6Y0lnN3BnVnM3Qk5NaVRNK2lE?=
 =?utf-8?B?aWFRYjAwdFNGVmNPWFZmeU1NZFgwQ293S1B2bXJMbVlzKzRxWGF4ZVNhdy9j?=
 =?utf-8?B?Zlg0aHRaU1k5MllqVWlKaDB1UXhhckNEOTJXcFNuRmdjWjBRMXh2eVIxZ0l5?=
 =?utf-8?B?bkVBYmR1UmNYUXdqMGpnM1hIT1lzZWNSKzF2Vm5UcHBzYm9nOHJWVW9hZFFa?=
 =?utf-8?Q?tT+ZB2nb7W3SPHD04WC9gm2FT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r1A7H+49IJ11NP3zqaEOiJrOzVgqHdOaV/D8aJJ2COb51kRka3gS74auUG4yZ7m/P1V9zpRQUsyXVxEaA9LJR756qxf2wRO0FdFahce+yARcvpisr9S+K9dUSAwiwRMeVD7iLbHZvekAXzXOzdZ5VK8q1KcUZ2N45CivIfVHOsVR6Rqix8FW/caquZMtxAn6UC9gyT4nON4lQw8sQAAlUdrJj2FnpRdE7ywz7kRsSq0zuLX+3jlOVpv67s9psKy8gtUhqFCBu/RYwcq/jwafi1tR+OS4vSe1HjJpCBZ54/Ygigf4JEZzgBe8tLXpLITkr3YSvHrbqEzxg+BGA8UgvB56tymR+78hPUZ8RTQuSuDgxpyvNuYozOiTn9W7ymvg2Lh2DJCeHCl4WsWF/5V5DuLbYzOfcM3T/lxvfMHKo04Mbs7jN4mgoxhFAr8g2W8XJ3wxbbycWyRSKo5mEnHw8uaWPuFlgp+obh2vY1vUfn4uZN1DX2CO90jruDefhutEadAUbFJ/0CgoID+Ee3XLHJZ5uIMDLzHAWs7m7rN+mhxkcJbT9Xr3mJ6GKB11sNJrgUAWCWMIpRdfmYqwf0lent61IRqlHCU2vBVCoTP+WHh9ENLWkEug2URgtZgsgwnNWo1rR3P9i5V1AINv0hmXqcEzhbLlL9en5/3q0y0KiKDkEA7jtyUMta9pP44HpPNTFAcTJOilDcNfbaCZy1vsS1KDK7aEcDYWF7v0cH8LhWzxAnrB8uqBu35jDQIk6rZu+XYUEkEZAaq4/uMdtuDTGnyOXwarheBzfIXqaoM3nsh87zElo5KJJf6iazwI3iKG9FL2mN2mTH/HKRcqlcqKrUHuJrb6az9wHSsHZDuG+2qZf6K6QiJ9Gg+R+tMReT8uTzy9jG0szsmgA711ZEkmBvfMKM4A9y1ZPJksTwFcLzI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c208c769-2c7b-468c-0be3-08db591d0928
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 10:29:04.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yg9OPkg/CwLn5OUO1XxRvZeDZI+SUaK0uhAsHz6EpWsit4fNBNeuRnxq51IolnFuUKHOnQmsvksIkUR2ZliAmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5424

On Fri, May 19, 2023 at 05:02:21PM -0700, Stefano Stabellini wrote:
> On Fri, 19 May 2023, Roger Pau Monné wrote:
> > On Thu, May 18, 2023 at 06:46:52PM -0700, Stefano Stabellini wrote:
> > > On Thu, 18 May 2023, Roger Pau Monné wrote:
> > > > On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> > > > > Hi all,
> > > > > 
> > > > > I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> > > > > test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> > > > > Zen3 system and we already have a few successful tests with it, see
> > > > > automation/gitlab-ci/test.yaml.
> > > > > 
> > > > > We managed to narrow down the issue to a console problem. We are
> > > > > currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> > > > > options, it works with PV Dom0 and it is using a PCI UART card.
> > > > > 
> > > > > In the case of Dom0 PVH:
> > > > > - it works without console=com1
> > > > > - it works with console=com1 and with the patch appended below
> > > > > - it doesn't work otherwise and crashes with this error:
> > > > > https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> > > > 
> > > > Jan also noticed this, and we have a ticket for it in gitlab:
> > > > 
> > > > https://gitlab.com/xen-project/xen/-/issues/85
> > > > 
> > > > > What is the right way to fix it?
> > > > 
> > > > I think the right fix is to simply avoid hidden devices from being
> > > > handled by vPCI, in any case such devices won't work propewrly with
> > > > vPCI because they are in use by Xen, and so any cached information by
> > > > vPCI is likely to become stable as Xen can modify the device without
> > > > vPCI noticing.
> > > > 
> > > > I think the chunk below should help.  It's not clear to me however how
> > > > hidden devices should be handled, is the intention to completely hide
> > > > such devices from dom0?
> > > 
> > > I like the idea but the patch below still failed:
> > > 
> > > (XEN) Xen call trace:
> > > (XEN)    [<ffff82d0402682b0>] R drivers/vpci/header.c#modify_bars+0x2b3/0x44d
> > > (XEN)    [<ffff82d040268714>] F drivers/vpci/header.c#init_bars+0x2ca/0x372
> > > (XEN)    [<ffff82d0402673b3>] F vpci_add_handlers+0xd5/0x10a
> > > (XEN)    [<ffff82d0404408b9>] F drivers/passthrough/pci.c#setup_one_hwdom_device+0x73/0x97
> > > (XEN)    [<ffff82d0404409b0>] F drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x63/0x15b
> > > (XEN)    [<ffff82d04027df08>] F drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
> > > (XEN)    [<ffff82d040440e29>] F setup_hwdom_pci_devices+0x25/0x2c
> > > (XEN)    [<ffff82d04043cb1a>] F drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xd4/0xdd
> > > (XEN)    [<ffff82d0404403c9>] F iommu_hwdom_init+0x49/0x53
> > > (XEN)    [<ffff82d04045175e>] F dom0_construct_pvh+0x160/0x138d
> > > (XEN)    [<ffff82d040468914>] F construct_dom0+0x5c/0xb7
> > > (XEN)    [<ffff82d0404619c1>] F __start_xen+0x2423/0x272d
> > > (XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0
> > > 
> > > I haven't managed to figure out why yet.
> > 
> > Do you have some other patches applied?
> > 
> > I've tested this by manually hiding a device on my system and can
> > confirm that without the fix I hit the ASSERT, but with the patch
> > applied I no longer hit it.  I have no idea how can you get into
> > init_bars if the device is hidden and thus belongs to dom_xen.
> 
> Unfortunately it doesn't work. Here are the full logs with interesting
> DEBUG messages (search for "DEBUG"):
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4318489116
> https://gitlab.com/xen-project/people/sstabellini/xen/-/commit/31c400caa7b86d4c14f9553138e02af18d3b3284
> 
> [...]
> (XEN) DEBUG ns16550_init_postirq 432  03:00.0
> [...]
> (XEN) DEBUG vpci_add_handlers 75 0000:00:00.0 0^M
> (XEN) DEBUG vpci_add_handlers 75 0000:00:00.2 1^M
> (XEN) DEBUG vpci_add_handlers 78 0000:00:00.2^M

This device is not handled by vPCI either, and is not the console
device.

> (XEN) DEBUG vpci_add_handlers 75 0000:00:01.0 0^M
> (XEN) DEBUG vpci_add_handlers 75 0000:00:02.0 0^M
> (XEN) DEBUG vpci_add_handlers 75 0000:00:02.1 0^M
> 
> Then crash on drivers/vpci/header.c#modify_bars

Interesting.  The crash however is a page fault instead of the
previous assert:

(XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040268312>] drivers/vpci/header.c#modify_bars+0x2b3/0x44d
[...]
(XEN) Xen call trace:
(XEN)    [<ffff82d040268312>] R drivers/vpci/header.c#modify_bars+0x2b3/0x44d
(XEN)    [<ffff82d040268776>] F drivers/vpci/header.c#init_bars+0x2ca/0x372
(XEN)    [<ffff82d040267412>] F vpci_add_handlers+0x134/0x16c
(XEN)    [<ffff82d0404408e5>] F drivers/passthrough/pci.c#setup_one_hwdom_device+0x73/0x97
(XEN)    [<ffff82d0404409dc>] F drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x63/0x15b
(XEN)    [<ffff82d04027df6a>] F drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
(XEN)    [<ffff82d040440e55>] F setup_hwdom_pci_devices+0x25/0x2c
(XEN)    [<ffff82d04043cb46>] F drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xd4/0xdd
(XEN)    [<ffff82d0404403f5>] F iommu_hwdom_init+0x49/0x53
(XEN)    [<ffff82d04045177e>] F dom0_construct_pvh+0x160/0x138d
(XEN)    [<ffff82d040468934>] F construct_dom0+0x5c/0xb7
(XEN)    [<ffff82d0404619e1>] F __start_xen+0x2423/0x272d
(XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0
(XEN) 
(XEN) Pagetable walk from 000000000000002c:
(XEN)  L4[0x000] = 000000039015b063 ffffffffffffffff
(XEN)  L3[0x000] = 000000039015a063 ffffffffffffffff
(XEN)  L2[0x000] = 0000000390159063 ffffffffffffffff
(XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 000000000000002c
(XEN) ****************************************

Looks like a NULL pointer deref.

Using addr2line it points at xen/drivers/vpci/header.c:314, which is:

    for_each_pdev ( pdev->domain, tmp )
    {
        if ( tmp == pdev )
        {
            /*
             * Need to store the device so it's not constified and defer_map
             * can modify it in case of error.
             */
            dev = tmp;
            if ( !rom_only )
                /*
                 * If memory decoding is toggled avoid checking against the
                 * same device, or else all regions will be removed from the
                 * memory map in the unmap case.
                 */
                continue;
        }

        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
        {
            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
            unsigned long start = PFN_DOWN(bar->addr);
            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);

->          if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||

So we have a device added to the domain device list that doesn't have
vPCI enabled.  I'm unsure how we get into that situation in the
current scenario, but Xen should be capable of coping with a domain
having devices not handled by vPCI.

Can you please try the following combined fix, it should also print
the offending device.

Thanks, Roger.
---
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec2e978a4e6b..0ff8e940fa8d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -289,6 +289,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      */
     for_each_pdev ( pdev->domain, tmp )
     {
+        if ( !tmp->vpci )
+        {
+            printk(XENLOG_G_WARNING "%pp: not handled by vPCI for %pd\n",
+                   &tmp->sbdf, pdev->domain);
+            continue;
+        }
+
         if ( tmp == pdev )
         {
             /*
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 652807a4a454..0baef3a8d3a1 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
     unsigned int i;
     int rc = 0;
 
-    if ( !has_vpci(pdev->domain) )
+    if ( !has_vpci(pdev->domain) ||
+         /*
+          * Ignore RO and hidden devices, those are in use by Xen and vPCI
+          * won't work on them.
+          */
+         pci_get_pdev(dom_xen, pdev->sbdf) )
         return 0;
 
     /* We should not get here twice for the same device. */


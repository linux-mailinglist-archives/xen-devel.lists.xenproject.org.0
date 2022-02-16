Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F54B869D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274007.469329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKISW-00089R-P2; Wed, 16 Feb 2022 11:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274007.469329; Wed, 16 Feb 2022 11:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKISW-00086d-Lg; Wed, 16 Feb 2022 11:26:56 +0000
Received: by outflank-mailman (input) for mailman id 274007;
 Wed, 16 Feb 2022 11:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKISV-00086X-1S
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 11:26:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 561d03dc-8f1b-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 12:26:52 +0100 (CET)
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
X-Inumbo-ID: 561d03dc-8f1b-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645010813;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MwoTkKHCCdRbCC8vzc6d2mcfaVwb8s020CqGAIs+tkM=;
  b=hwEVkls/XflYAixVcSomxAWTmnEIHO+pPOEKvl7vu4aBT7BjAkFQ63yg
   zurNeUWGV0aRkEk5wiG9VbLjHuRWwp4VZu8mqEtCUp2s0B/AWxdQmSXJL
   ZiRzlGhi4KQ5H6TqRfJmdLGHkmgYPD/LqvZzkEBdQu8s1XmI4HD+SzHRK
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MzalmwrdxonjexbZ6CXgALhsRdjii26eAsK6C44GTRioSNQiyqZBDnPTnh5H7l/4/e4Qfo9p5D
 dJ4kzQlr1n4icp7blgZ3gypM/dEDXtM442T+DpERMXgtAyp4iAkEhl3Ds3N4THRjT3Kql8PX6B
 AnYUL6AXtf18nET2OVCNGPpU1BDc2EZkgwv8prFDoT5PYZijIUvDJyPSAkmNNLRjWzN+a15FlX
 sFOoaDwQ0a6soRPblGGWAJlLP6o3MQ8+ZroDumv48wRqX0/3gExasTxvccyspXnWUEsCM7xWmP
 MuSxwvlTp8huk4scjW+k9L8r
X-SBRS: 5.1
X-MesageID: 64330511
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pcbNbazWmVGdxO6cKSd6t+frwSrEfRIJ4+MujC+fZmUNrF6WrkUHn
 zQfDW2BPPjYamegKox2bIS+p08EvpHczoJgTQJvqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdn2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8hj5
 9VUlKWvcgQWJ6iPqM05YR14HwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEEh2xo25kXdRrYT
 8EXdWs2TRHCWRpCfQslCooQzc2SlnaqJlW0r3rK/PFqsgA/1jdZwLXrddbYZNGObcFUhVqD4
 HLL+XzjBRMXP8DZziCKmlqzgsffkCW9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQuGyrvgc9YsVrENIj7UK9447m5yaVLz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94ace51qXHb4
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL/LN0JumAvdR4zWirhRdMPS
 BWO0e+2zMUNVEZGkIctO97hYyjU5fSI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5Ham08EAbKkO3S/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chYwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:E/zKa6tg39OZSLyYgS9MLfYr7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64330511"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACY9VyE2kkPwYe4gnc2If7g4LE2+CPOrmksYDTutFte25hkbR7mbfclVP3YwQs44qYAWDcCzPwgws86DPxsru6SQahU2h3eH0tbRm4dRYJg0mdQhkOqTHVf8XjiMY0uPTR6niROF7dc6ONCNVZ44UiMHTVfg++zUkiPt8XcRJqudZ8HOASE1Dda9V2N5T41JvCLqu5tT2Ymja406wTM6EZun4S7N6dMicyNqz85HNEQf+HLT30CZPdIyEbW5sOPLlK7E7VlfS+WX3vD8pnheEjx5X+4T1tgIx/WcwCTxuOmHDxk97+EY7SAdwKGrvvaBmnukyOwqro1oSDH7B5xQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABOy2eIDdsp6vK3CxREgVkNbS5AWcW3H7w/PlWtH0JY=;
 b=jCv0H6XvGs6paO9fo96nxByHd7XXFEmmsZ+p9QF6chZMDKH2mbaNh/m8DuywCjl2CW445RbWSOFxzTDdMfyMbtEPPm2ABAB1+eanliOz+fpRXrtJhC55qJNl8NkW6lRqXV1TL4nZ3gYtomubu1RRax3C0760icAMb8VOuk23CRFloeYkkko63Mpr2PLL9tHiPWV7RdO+T9T5RjhNk5qm79Cr1dH2ViKR9VXNQSXP2m0kJS54cKfpc7p+ePZzZvjFs3u5nAol1zfj9abnmkd/bTkpjVY8tSFua4wFWGtWMG+cLbktYIqT0Tds2hbyqUXKFLotCNpXvkHQMCp5xacdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABOy2eIDdsp6vK3CxREgVkNbS5AWcW3H7w/PlWtH0JY=;
 b=qPdjbYloyBYRXR6AZ2Bp1GqdJUxaOxJJPC83ANkWpPITnJzbC7KPhqrT6pvo8Jrf0SWAUyEBMfvsvnN021KLVtOmGjL90Fb3+/AjdCeDk/T8PUSkQyD8x2zbMUEVzTt4Y2iCbaXVRhzKWOWf5IU7ocefofZNFJo2V+T3UNWPSuM=
Date: Wed, 16 Feb 2022 12:26:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/clang: add retpoline support
Message-ID: <Ygzfcop5TrpeXfG1@Air-de-Roger>
References: <20220216090300.9424-1-roger.pau@citrix.com>
 <20220216090300.9424-3-roger.pau@citrix.com>
 <c5657f85-e3c4-9c39-1a67-b5162b1f86ef@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5657f85-e3c4-9c39-1a67-b5162b1f86ef@suse.com>
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e62d399-560e-425e-5650-08d9f13f37a4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3447:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3447A07DF0F2921FA983752E8F359@BYAPR03MB3447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4iR7aJLhudHIzl/GQkMt9+zrPNE5wpdj52izv6ZLL2g86Q4sTFgIlNK+i2v17VDiT562nv5Hc5pf/bx+hjZU6OwnBQ+EyPlWmOJk9Y50mUGF98EeMplhbJTG84T4go/9Wubaof+q5Ch6W+yBOMES/VY6FL2gM7W6/bx1KWBApBzQMGCvjrvEhivtftg/rk4o6YmkfXBohezOIqURzT1WKAvMz9tRE69xJ2Te8Tt7OQp5azqQb8UdTeW08T11dkyW/lzV7QmvmxK0slg8pbjinrS/XeU9jWFCjhCjiP76rjhEH8V6XvNqb3nBqQzQMEuXAjq26/M8h4H8XYERZj9AXKpuMliMYVsl6elTdWxnq4mlUmJPN4vpejfAswxsFqhM/Rjc3TMDi5y3ragTNexanPtwHsdfCVrvtQPW/CGkR3MHV/rNSJT6TGms5Ic5fmUx1CCtaclh299VwdV30AfnUGJg6vmPFNgM8g/C/ufo8y2LwcOpXVG8aeyxRsz8sIHI91GtM72dadW/aP1iiRrs6YkB1nTuUAvzRzNrXhUQgc0zGRMk4s+/a/hqycEo5bjLr+qSKphOO5GJzULUM6rpaM+6++uRRD/xn1N4bOO+n/sPosCCAuocp8kqZJ3yjVqz13braeHcmp3Rr3/XZdhgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(4326008)(33716001)(2906002)(38100700002)(508600001)(82960400001)(6512007)(66556008)(66946007)(54906003)(66476007)(316002)(6916009)(8936002)(83380400001)(53546011)(186003)(6666004)(4744005)(6506007)(9686003)(85182001)(5660300002)(8676002)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEtjWDRSU01CeklHam5acHBKK0tZQzl5TXlsWnpVelVkT1ZCVEdUUjFOWS8y?=
 =?utf-8?B?Q1U2OFgyOEJSM0FnMlo4Y3BCeHF0N1dKVGl1MndIV0lad0FQNFlKRlFXNnRP?=
 =?utf-8?B?N1Z0VFB0UTdaeC9zeUYyM29DVE1XbUhKUC8yWHlPTFdzTEZwN2plbmpXaDFm?=
 =?utf-8?B?S1dPRkhEcXJlbFFveGx1dFJiMS9UQStaUjdIRzhxZGtsMTNEUDZvQ3MycTc4?=
 =?utf-8?B?bVc0dWIzR3hISmsybkxXV3Z1YVp4ZGFzMktONnRWS0xCSFJxVFNsMDZ5bkY4?=
 =?utf-8?B?SFdmQzBhek9mR3NpRk5zd2YyUmVCK0xaZHFlbVZNTWtBNXdrTGdJdjQrUFRl?=
 =?utf-8?B?elFvQkYwaXBFSTF5WVVHeU5pLzdEKzZtTHNKZ2J4SVZ0OFJybzZjM1NtVXll?=
 =?utf-8?B?Y0tDQU5qbDlKZ1J6Z0xYN2NuOHRpbGNQcDkzQ0M2VW9WYmp3Sy95ejZyUzJm?=
 =?utf-8?B?VDloMDd6M1NFdVF0cHUzRDRtTCtSYUxob05OVWREUmcvaWhlZTJmVDFudDNm?=
 =?utf-8?B?Y2xoRVZKdEM5a3k2ZnBCcm83M0ZqNGlPODNjT1hXQXYrN2pLZDh2WmgvdG8v?=
 =?utf-8?B?NlNSbHhrNXpaL0dvVVhQQy8yOTVhQmtVWWsxM2I0SlNpQTN1N2ZDQk9mL1hS?=
 =?utf-8?B?anVGZUY1aDNxd041L0pDaVRVL0kxTUd5UGVDQml5RkZVejd3ODVYQXJQbUE5?=
 =?utf-8?B?WjBwdnZuMFFKbHFCTnZqdDRraGo1Rk9Ja0dURmJmVzJIQzU4V3dIVG1PQkZ0?=
 =?utf-8?B?RXBTcGZ2SEk0dG93V2w3ak12ODhzNENYT3JmZWN6S3IwYXZCUUdMRDUxSFV1?=
 =?utf-8?B?VzBvK3R0OVV1c0tJQ2lsVTJUS0phaXllOU9qWFE0WXpBYVM5UzNVdDgwMDhP?=
 =?utf-8?B?c3plQS9mT2tmSXVyL2Zhd0dhN0l3OVF6UWJtVzZhbWZSQzRvSE93NEc3Vzg3?=
 =?utf-8?B?M3pPWnVwazdqRUVHQ2piWUI2N0tRZVhqKzhLMUp0TTZlcDArZmJTNVJKcWh6?=
 =?utf-8?B?MERwZnhnekpjMllsRDJUWmpGTkpmalV5ZUpVeVBFN0lGZTM5bWl0blNmNUJ3?=
 =?utf-8?B?dEdHRFo1V2c1TFRhRFJvU0hUdTlSaVVBYkpBaCtNZUtWdlNoY0RVVUtjK2Rt?=
 =?utf-8?B?THlLc3p4K0JRT3lVemhTRGIxQUc1SWMvYUZOTGxaWUZEa1FCWndXK2VRYjFl?=
 =?utf-8?B?R0l3UDdoTUM2QVlQSm1qODdqSmNXaThsRFgwZE9FNVdZclc5UVczelVIZTRZ?=
 =?utf-8?B?cGNZcWNuOEJtMHh1eGN3VVNLMEtUMTlneTBCYXFCNWZOOXFDb1NDMXhha20r?=
 =?utf-8?B?VTlHdS96cUNWNWVZNHNNT1NrM0pTdStURFMvTVdBWEdyV3NDQXJiL29tcVJw?=
 =?utf-8?B?N2swVHVKR0NvZlViT1dQaFl5TXJYZk1lWVBKdm0rSUZhN0lqb2ZHejJHTVY2?=
 =?utf-8?B?SEMzWlFiVGJUbzBpbWVBYm5zcGJNeXhTNElzb3pZTmtCQXRhYnkyY2FoaFQy?=
 =?utf-8?B?ZXM3eHRlSSsrdUdtQVFlZ1dZdFV6Y1J2WUhEaE95eDBRUWlTWDN4MDNXUlBM?=
 =?utf-8?B?V1pQVWlubXhrQTlVL2tJOThuL0NxeTZGa01VQlJGQitKK0VwbDBmVGcwN1E1?=
 =?utf-8?B?cmtQMDYwU1BmQkFuZ0NFMjZMK01pM3piU3NDSExTaGJVOElpZmtFeStOK0NM?=
 =?utf-8?B?em1xTGRxVGlHbU9JODNpVEVuUldkSXI2WDNvQzczek1keGRDRDRCWFdsT1JQ?=
 =?utf-8?B?WDRlc0Z0N1ZKcmlLWklvblRUdXhhREJuaGtGVURyQUxLNkhhUjJBT2NRb0or?=
 =?utf-8?B?Zno4bFlqMEN0WVZXVi9PYVdHVGJxdmV5TEFIQTdXKzkyTGQ4WXVsQnRpbWNK?=
 =?utf-8?B?eW1oRG9MdkhaZ21VUE9qek92dVd6dFkwVVN1OHA2WDVJYjNmUTN2UElnSUJG?=
 =?utf-8?B?WXB6Uk1BS3ZsOTVJUHpvYmVvVkhpOHNnQjYwUTIxMTFFWi9yNEJac09NKzNO?=
 =?utf-8?B?TzRtSEErVWN2K1hVQ0lhUE9xbEhyeE1Dc3BOaVdJa2RLeVhkdVJLSjNVMHhB?=
 =?utf-8?B?RlMxYWdRa05HUlBKR0tTbEwxYmwzRUsxOXljRXQrRGpmY3g5ajcyVW5jNzR5?=
 =?utf-8?B?RXZHRzc4elZYZ0ZOdHQyVUVNTkNndUhOYWd6YXQyaStaUW90QWVpcWc2ZzVB?=
 =?utf-8?Q?DkZiy5uSGPl7YQtg/NUigKQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e62d399-560e-425e-5650-08d9f13f37a4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:26:46.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLyH39yWK688Toa5VMEdD9nPL3dFL1ERmXkTNmW5mzyrFh68EVuTQWTINDy2ytrO3dPDKAfI0dvxbyPSG31D2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3447
X-OriginatorOrg: citrix.com

On Wed, Feb 16, 2022 at 10:47:52AM +0100, Jan Beulich wrote:
> On 16.02.2022 10:02, Roger Pau Monne wrote:
> > Detect whether the compiler supports clang retpoline option and enable
> > by default if available, just like it's done for gcc.
> > 
> > Note clang already disables jump tables when retpoline is enabled, so
> > there's no need to also pass the fno-jump-tables parameter.
> 
> That's one of the secondary gcc side arrangements. What about the other
> (-mindirect-branch-register)?

clang already passes the return address on a register always on amd64
so that's not needed either. I can add a comment like I've done for
no-jump-tables.

> > Reported-by: Jan Beulich <JBeulich@suse.com>
> 
> That's Andrew, not me?

Ops, sorry, I got that mixed up then.

Thanks, Roger.


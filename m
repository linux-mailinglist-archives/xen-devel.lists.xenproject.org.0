Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF34348EC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213794.372122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8p3-0003U8-At; Wed, 20 Oct 2021 10:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213794.372122; Wed, 20 Oct 2021 10:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8p3-0003SG-7r; Wed, 20 Oct 2021 10:27:49 +0000
Received: by outflank-mailman (input) for mailman id 213794;
 Wed, 20 Oct 2021 10:27:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md8p1-0003Rp-LY
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:27:47 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 186d7433-f8d0-4c26-836b-c1c26c679f09;
 Wed, 20 Oct 2021 10:27:46 +0000 (UTC)
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
X-Inumbo-ID: 186d7433-f8d0-4c26-836b-c1c26c679f09
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634725666;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=g0oYlOXVfe9/xZ2lIN0vY5yWflgsTIOudTzzggWbILI=;
  b=NTXrvIyODsRPBkzVQZXVNM6nrmn4cEk9hGj31Sk9qftOn9S3pH1A+xYK
   qnthxBcXPIMDIG6vDX3MZE1NoRAjU3vqd/JYTrClTdVbXjnPVwrVNayFL
   Nzk8RZu9B5urJvSrCQHWtWo0j79YzhQNe0QRmdcFSsy/Ghxxad7hFPVjx
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8ReL9pOnWMQP5Dhcw+v3YZwQayTsRRWztyUTZQ0yymdhD7k8bWGV340EnZCNStm+ztwSQkrjA8
 lP1LRadEAcvmGIlZnmHqnyiznS2AUAjkNCkHCPxD7mJGWNvsgW0l5ZNxNCZlmu2UcUKuEUBFNT
 6KE5vF1ccJibubQ1xAoLi7Nu57uuYyFhhKVY5mGtrwb//6puNFost8V3P2lqQUhoh+2nH1BOBU
 0xB3fGheVWw+nZ68Dg13Shzge3nkc63gjQEmtKzrfHUB1tSlOJ/aNhVUUqJbqNM5kR3RljF1Pr
 jldyUZeYqTEdgKJtmbAkjouy
X-SBRS: 5.1
X-MesageID: 55627253
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qfEG1Kt6F0ESNevFN+5QQDA9iOfnVFJYMUV32f8akzHdYApBsoF/q
 tZmKWDQP/2IM2rxc9wna4zi9h4EvsfTy9ZqTVE5/3pmRCsX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnoyWGCYLB67wo8cHYSZHHAhTY/Fv0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY250QR6mEO
 pFxhTxHZg+bXR9+GUYrKsgjosGouyHgXCN/twfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEhPLLnC79cJIfEvu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M/pHI
 lEQ0jojq+417kPDZsb5dw21pjiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 Tehld7zGSZmtrHTTHuH76qVthu7Iy1TJmgHDQcFUgkt89TluJs0jB/EUpBkCqHdpsbuBTj6z
 jSOrS4/r7Yel8gG0+O851+vqxWoq5vSRwg5/DL+WG6/8xh5b46oYY+vwVXD5PMGJ4GcJmRtp
 1BdxZLYtrpXS8jQymrdG43hAY1F+d6uIBuNoHxWHKUa1C6fxGGsVK0OvBhXcRIB3tk/RRflZ
 0rauAV07ZBVPWe3YaIfX79dG/jG3oC7Soy7DqG8gs5mJ8ErLlferX4GiVu4hji1yCARfbcD1
 YB3mCpGJU0RDrh713KITuMZ3K5DKssWlD6LG86TI/hK19OjiJ+ppVUtbATmggMRtvrsTODpH
 zB3bZfiJ/J3C7WWX8Uv2dRPRW3m1FBibXwMl+RZd/SYPi1tE3w7BvnazNsJItI+w/oLx7+So
 inkAye0LWYTY1WddW1mjVg4MNvSsWtX9ypnbUTAw375s5TcXWpfxPhGLMZmFVXW3Odi0eR1X
 5E4lzaoWZxypsD8021FN/HV9dU6HDzy3F7mF3f1MVAXIs87LySUq4CMQ+ca3HRXZsZBnZBl+
 OPIO8KyacdrejmO++6MNqL0kQ3s5SRH8A+wNmORSuRulIzX2NECAwT6j+MtItFKLhPGxzCA0
 B2RDwteru7Iy7LZOvGT2chodq+lTLlzGFR0BW7e4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQd8NraD2PgYlyP89/MwJEmmtiZ78KDeCRdZPgWWiTwbJ7xwadt3z
 eAksc8Qygq+lht1bYrW0nEKrzyBdyVSXb8mu5cWBJ7QpjAqklwSM4bBDiLW4Y2Ub4keOEcdP
 TLJ1rHJgK5RxxSefiNrR2TNx+dUmb8HpAtOkA0ZP12Ml9fI2q030RlW/WhlRwhZ1Ewaged6O
 2wtPExpP6SeuTxvgZEbDWyrHghAAjyf+1DwlARVxDGIERHwWzyfNnA5NMaM4FsdojBVcTVs9
 b2FzHroDGTxd8br0ypuAUNoppQPlzCqGtEuTCx/I/m4Ig==
IronPort-HdrOrdr: A9a23:ET9iwq8oxIPk8F8j1DVuk+FJdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8vgdQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLX3OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mLryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idnrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6fDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amJazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCc2B9vSyLZU5nlhBgr/DT1NU5DWituA3Jy9PB96gIm30yQlCAjtYsidnRpzuN1d3AL3Z
 WDDkzE/Is+OvP+VpgNdtvpd/HHfFAlcSi8Q156Hm6XYZ3vG0i94KIfs49Frt1DRvQzvewPcd
 L6IQpliVI=
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55627253"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyEbiE5LvwzlYl+oW/AEnl1/S5IUObS42Fbbb27oagUW/4I30C5aYHcuvRxRWgX7acrbUI8AWyGYX2ZbZmtLvdA0/UYTow5pJFaSSnDhbaHJl8ZDRFyBDqMLjUDigTpkL/BKjeXwxgmjgngO8CeFoP42iai4Ppa7E9YE2ugWH2O8ghGuPx4dRA/QwmsEKkSevSG3toggPVvIE6yX0EkG+xOByIJYJ0sjEEeREugo0mx9ggpUJw/KGI8XNrcE10xj3Jry7INBIr2A9DwUVAKWdzv/OqdtD1Ns8lv3Of79aHSqXMvhhcYhwuz5PbCRDkcubgFPzldYEee3mYeYv02c1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IyDp+stLFzCj8UtIhdvIq32s5l76V2yUjZdHjCCAWk=;
 b=GZtkFqZ0c58/ijufcMih068FyrqkWwwRJYsRwwFEBY/wnnE1PA2wWyF4TR6uwSI02Umg/YXOxU3upV7kpQyZzMI5q+SuqCreueEj33bU1muRDmHKUjZSZV2T60OwAKSZbn04gFp73d34D8zptDl7TYiiIf8MB/e8Snq4p+Xhd6fUFuZHmlGxCgUcCaQWEraDnLbw8xyNjDCBplaGAdLvIryXGOaAhpZyc/MK98sfWgCZA4pDswSRyMa5V6DBrW8Fo2g3Kd6G26Ff888sETyTdzM+ezAurU17nG+Lily7HBVO+pr+RGsuA4tLS40krIbVtv1JjmjCgKOHEKKKhKwmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IyDp+stLFzCj8UtIhdvIq32s5l76V2yUjZdHjCCAWk=;
 b=mUQQnmmbVHr0CzzyS+tSZL1XdbRlLxkzjL3kY2vMywAt/9a6kd0U5cCbd2MpXDvLbRkNAEsyxNvkhVX1vW5MSHrr2aqwl73IQ7tkZ0pMOtENBMvaK0cwGrCvfQd97tXRTDx6u3bICUffC709j2r2sOzahPWF23Y8Sf7NvaGfRPA=
Date: Wed, 20 Oct 2021 12:27:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v3 1/1] xen/pci: Install vpci handlers on x86 and fix
 error paths
Message-ID: <YW/u/NZ1usX7nJYt@MacBook-Air-de-Roger.local>
References: <cover.1634723903.git.bertrand.marquis@arm.com>
 <c82cc9c933e09806c9d043c61d92bd793060f9ab.1634723903.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c82cc9c933e09806c9d043c61d92bd793060f9ab.1634723903.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: LO4P123CA0311.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f875cc6-cef0-46ed-fcc5-08d993b42e9c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB40592BE7F935409C1F2FCC7D8FBE9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y5IAlaCWo/2awqKXG0iCCiTiAw3t/ken0QXlSQoX2DT8nBaFt2FblbPGyLr+j9FSXuDJU/SR0G4SeY1oDfXpGaZFXM7X1G8dpQWJpEWJsdWY703w4i3Ro0eKfoKDYiohCQcrG19GRHInVLpIol4UdNiOLOKx1lV41Kamel1XZsGlNeykcLzMj3n/hnHytcEZGUkfLDBTHdvCsAXIAEXrIQMfQnVeTLyYy0vooT6+JpIajCu132bvBvNrgwoXIMsHypIFLR/parszOJvMGww+13OYgRTqInrTfhtFS+oanrUiMqUhCoSN+RlD1RmlvvrnzaHJOvXHKvT4nJUNpeYoPsAYh/ivNdeOu6/PTJ2Y8/SXkiLwWYiC5kemCaiAol7BjoklhyYQqg3O9pIFZkVnQWRsprG25o8yUy12CnI1/rX+oP7lZfaxwd8yCTZNnioSV+B8Tq8gqQtPw0zKxJI88KJB/5MhSNbXClFYfwMMUr1j1DV1azmJzz5OTdVtznyPLDGStz6R8bmNpLRsO3em+h52/gZ9SCnMXh/fGWJgO3X/Veepdfz1EIHXzhJ2A2DKOfw1x5ec7e3fa9tPtcUGMwHCPoKYuQqN+ifS2/mckahQ1bgeIa5Ru0pjR00B+6KGV9rjF3fEgtGNaS1TTa/FLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(6496006)(8936002)(82960400001)(83380400001)(26005)(54906003)(6666004)(956004)(4326008)(6486002)(86362001)(38100700002)(316002)(5660300002)(85182001)(186003)(508600001)(9686003)(66946007)(6916009)(8676002)(2906002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0xwNDZrdkJJK084eW10VS9wd0lKaGdKUWo1NnFyOStJektUUExURFNsdXFs?=
 =?utf-8?B?dEZBVW5YenEyQkxOZlgwSkVYZGZqZUgwdmR4MGJMam5xWkJJdE9MSTRTZm1a?=
 =?utf-8?B?eUg3TXlwcE8xc1FWMTc3OWRtaHFqcjV4ZFF1ZzdMb1I1VmNoZXp3ZXRIM3ZO?=
 =?utf-8?B?UmpJTjVmakx2RWhicFJDQ2hEV1pBd09ldkw1NVJJelZHM1FraC9GUE9ObTV1?=
 =?utf-8?B?OUNHSFNybXM4SVRVYWJQN05ocE8vQW9IeTJlcWJlQ0FWWEJvblkyR1FibnNL?=
 =?utf-8?B?TnM2NkZNUjVGWGhDWFZhT1JjK3NFelFrbldnL2FaMnlRMjluemxYelRNcldS?=
 =?utf-8?B?enk0NERsTTNKU1ZUeG1FYmFSNk1MK3hDSjAvZGpqSVJvL09ubzFtMm1IdGUr?=
 =?utf-8?B?dFBuS25CcEZCcFczYTVyczREME5VL1Y1RWxMbVVXNDlLc1dhdVdZVGRLYzVl?=
 =?utf-8?B?L1dZZlhuMWhhR2lqM0YxZFFUS3N5Z05pMFplc2NnZTJQS1k2dExneUVDdXNH?=
 =?utf-8?B?a1RnbTNQMzgxejYyZVhQL1ZMRWliYVZwN1ltWkcrbjArN1dxZldPTlBaWDE0?=
 =?utf-8?B?dHZneVZ1Zk1ia1BndmREMlNhNWdtS2ZuZTNvZTY4YlM1RVlncEI1bHNQT1NH?=
 =?utf-8?B?eHdYMWtZNGo2aUc0NnBzdVFKVHhKRVZFRUYyMFIrTGJWZTVQUzVZNnpjbHZm?=
 =?utf-8?B?MEx1djBiNENkTVp5VnNlWndOK0JQc20rM2IrTWpJU2poblR4bEZLb3hTczU4?=
 =?utf-8?B?dGhOQVR2dTVqV0dzaklud1JWQTB5VWJoVGtHM2N3aHhVTXRmSi9BVVhCa2VQ?=
 =?utf-8?B?alVHcDhZbWxKV2g5cDVZQnBXRmtBbVRwTXdiMnkxa3d3VE11MHRQYmQyWXRJ?=
 =?utf-8?B?ZHN5VU9POTB1TU40OXJ5RmhweEE1NXJYeFFyNzhUVHZTVjNmY1hXRU5ITWZE?=
 =?utf-8?B?bDdKaGFYa1VEYTd6SU1uNVNyZUVraXlFbGMwai9CZ2diZnBrb3ViZ0xzbXdS?=
 =?utf-8?B?elpUTGZQUXAwQ1lkcDgzZGttdUZkTzBsbWdmbzlsQWRndFFKUW1ja2JKM214?=
 =?utf-8?B?Yks5U1NkQnM2U09nUnlIeVlWeVo2azVvc1NRbzNoL0V3MUdlUnd6b0Z0UWg4?=
 =?utf-8?B?ZVZJWmxOZUx2Mlg5TnFNaFg1Nno3eUxjUkJWY1c2SUVWS0dTWTdJaVVjb2pl?=
 =?utf-8?B?SXFzaFl4U2tQVjhRNkVPUlpIaWF3cXlPZlA1eTRIZ0RnZjQ3TVpUM0JRbktz?=
 =?utf-8?B?SmJqYmhZemNqVzZ2TFJFWVdYejdyQzcyYjd5NmZtTVRCWmRzanVaaS9xOHVa?=
 =?utf-8?B?R21YVjhEZVFjTU1ubDVmdEJWT2ZNWmpOS3B0TFhOeVg3clhIRS9Nb1VDNEZU?=
 =?utf-8?B?ZGtHWVFzL3ZDeTBvSDE2Q1F2U3cwaEhuYWk0RjlSQ3pKZVVCNUNOTFJqd0hW?=
 =?utf-8?B?ZEUwQlhibk9KNTJEeXpydmpUbklocENrZ0U3ZTUwWXZxeUgxN240bXpUblEr?=
 =?utf-8?B?Qm94R3dhdDN5dWI4NXJXRE5WMVQvNEJYYjFjcFZ4bTZKYmhVSlAzeFZyU2oz?=
 =?utf-8?B?bWV6cWlhRGNFNmhhZVk3cXpqTnAxVjF5VzlhRmdBNldjOVpiVy9jTkcyZXR0?=
 =?utf-8?B?eGtza0xXVjk5a053Yy9uRjZ5N0ZYVlFrQ1crbEszaklDTzhTVjZ0NHFyVjEy?=
 =?utf-8?B?Y1FmOXNRRG5Db3NUNExxenJzclJwaTBZWWZwZ3ZEVElaUU9SSWRlRVJJanNC?=
 =?utf-8?Q?/WL0L0SwdoEr6TyJxE/2QrUR8lQ+VgAHuW/qzgJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f875cc6-cef0-46ed-fcc5-08d993b42e9c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 10:27:13.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

On Wed, Oct 20, 2021 at 11:05:37AM +0100, Bertrand Marquis wrote:
> Xen might not be able to discover at boot time all devices or some devices
> might appear after specific actions from dom0.
> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> PCI devices to Xen.
> As those devices where not known from Xen before, the vpci handlers must
> be properly installed during pci_device_add for x86 PVH Dom0, in the
> same way as what is done currently on arm (where Xen does not detect PCI
> devices but relies on Dom0 to declare them all the time).
> 
> So this patch is removing the ifdef protecting the call to
> vpci_add_handlers and the comment which was arm specific.
> 
> vpci_add_handlers is called on during pci_device_add which can be called
> at runtime through hypercall physdev_op.
> Remove __hwdom_init as the call is not limited anymore to hardware
> domain init and fix linker script to only keep vpci_array in rodata
> section.
> 
> Add missing vpci handlers cleanup during pci_device_remove and in case
> of error with iommu during pci_device_add.
> 
> Move code adding the domain to the pdev domain_list as vpci_add_handlers
> needs this to be set and remove it from the list in the error path.
> 
> Exit early of vpci_remove_device if the domain has no vpci support.
> 
> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> defined.
> 
> Add an ASSERT in vpci_add_handlers to check that the function is not
> called twice for the same device.
> 
> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> for ARM")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!


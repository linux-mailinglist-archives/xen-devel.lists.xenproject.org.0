Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9D4F15DF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 15:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298349.508220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMmD-0007Ik-6W; Mon, 04 Apr 2022 13:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298349.508220; Mon, 04 Apr 2022 13:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMmD-0007GJ-3S; Mon, 04 Apr 2022 13:29:49 +0000
Received: by outflank-mailman (input) for mailman id 298349;
 Mon, 04 Apr 2022 13:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbMmB-0007GB-PV
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 13:29:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41b65d81-b41b-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 15:29:31 +0200 (CEST)
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
X-Inumbo-ID: 41b65d81-b41b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649078986;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jNHtSpkVeVU9PK7XQzxRXedgdkQzIZtHHSiTYoudnuY=;
  b=CyQe7UQO4xjWM9C7iON9XQjg18R+0SkPtxt5LGd1Ba5/eTX11uneYHx3
   YBL0h2wMKDnIajdILw1VnFVsug7jiZWIE6kzddrJmEpO0p2iyN5OpxVU1
   8nw/FUehEp+cCfUEhmBAUvNqPmWTWL6pV3Lc/vU7g4364FvPYyo0vmXIl
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67839801
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bsde/qpQWW61kmsJz2yoSFMI54JeBmInZRIvgKrLsJaIsI4StFCzt
 garIBmEO/qKZmf2cop3O4/j/E4E6JHXyoBiHVM+qi1jFywa9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y+q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBFaztu9ggb0ZhNQ5OEotYwoHqeiemiJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZVJMms/NE2ojxtnGXM2Vpwuh8CRo2j6XS9WtFCWtaQF/D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IAYNSVKxrP29i0i/c9FSM
 UoZ/mwpt6da3E6hQ8T5Xha4iGWZpRNaUN1Ve8U49QWMx6z88wufQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy13ba1jg+PBXcsC0AySgkadzUouIb6mdRm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM0d3XC3270k5JGQWy2yGsjTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPskpLlfboX01ORL4M4XRfK4Ey/xX1
 XCzK5jEMJrnIf4/kGreqxk1j9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SriChcBmAOg3RUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 pHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:HE/tJa8TAPy/16lys2luk+E2db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICOgqTM2ftWzd2VdAQ7sSiLcKrweQfxEWs9QtqZ
 uIEJIOeeEYb2IK9foSiTPQe71LrajlgcKVbKXlvgxQpGlRGt9dBmxCe3+m+yNNNW577c1TLu
 vi2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W2Dk1ZrsA/ciYoV9MOOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67839801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk6pL53UONV7dOTI4Sudv6j26RrahzXa8yO02fSZeYPqc+ZPqhZqZczHKtW52Vf6tgR2YI1YjOcw4lqmz1U9rBxEw6P921s3UIF3wDPeB3RhgCNZu1TGSFtvYiSl9/sXZQ293xBjzb3Qj4SyAu6Y0IkpNdRlrttfooahsM2CjRIuzsR9pA3j6JngWJb7/74UgGsp2jNjiEh9e7p7aEiYNntLK8wclcC7C2LGmww2sdYdXumT0wNioQf59+QagOK9vWMxYc1MFKSYomPF9jSS7yTAlhXXQJrlbhBi7AzKDHTnhaNdd16/5dkzm+snc8XN6ALH9EVUP6taD41qlxFIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNHtSpkVeVU9PK7XQzxRXedgdkQzIZtHHSiTYoudnuY=;
 b=H64ntOq8q/UF4/4Eo7yqslw6B2WLQymJs/V+jVuGYHVKIwXxzdJKPAsXyzPAnk3Fo06T/ud96ia3QTN5HXstpKFEiJ99Q56LYfuyLVmxUw3CUAWxoShh7tHMfzbEAluK/jAue2yolYMs1xB+kvBzlRrtNHNuBNTskRS/b5Mosm7iAvFH785CMKzvUYWg7xRLuK6Odu6T4R6o4Ietutgyj+560NCnBIZJTM4Ny94MLXXRJA21pYlOpBV2h8SQSZfIKIxNMmItvbZTzAEm4PX6OOjs2CBDiT5OhR1jgaT+59RB0njjWE0L0pJFRJUD1PcMtqFBUrimdVftWXSlmMf8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNHtSpkVeVU9PK7XQzxRXedgdkQzIZtHHSiTYoudnuY=;
 b=V1xFgEr0Fq2hjNzuvcKYPswY59rliP1H1xyBLmD84HSav7buxf3WWkZugrRreZ9Ly/DDkkJXFxrU/xvRySWxF67/q3jNoeOaocr2qPiLz2OQoz9tjOUsPJ2oODGBjiw89gvUNxdi182tcQoE3wGa4t19GaQWg1jwLbfUVG18X/Y=
Date: Mon, 4 Apr 2022 15:29:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] tools/firmware: do not add a .note.gnu.property
 section
Message-ID: <Ykryv8hE30eL2y5N@Air-de-Roger>
References: <20220404104044.37652-1-roger.pau@citrix.com>
 <20220404104044.37652-3-roger.pau@citrix.com>
 <aba2f53d-0790-d337-ce9f-76546201bcdf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aba2f53d-0790-d337-ce9f-76546201bcdf@suse.com>
X-ClientProxiedBy: MR1P264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1529697a-6bd5-4710-c2db-08da163f2aed
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5518:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB55183CE6093DDC2306EA7A618FE59@SJ0PR03MB5518.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hYGJ1SUvlQC3CsyFXyuQQMk5sezDfMb8Ps9nRYgUltJPLClxsJlaeNkqWd3CehUxywjQH4HEbTd+MrjmoXr8rl9ku6pJMioMlDQPWWChuCFN9S1+jeHR2I/HqGgMFnsmy1jd7vBUs4zPXwENZwhvOi6fYgdn150x/AkU6rJlOwaIafK7TDpASvK8QzbRjManQtehPUVKQ968d/nXbWc3UyfXgefKFKjAIdJofVYIXlT0ZD3cRse85krgoJsYll2CttxOMTc+WwNz/qzZkRtEh1l1KQmLpBr+7YdZWWXGFv88/hmE2feKMW28Ukgsi88m9Ldo9Ucb+OWOaXHUYmLzyl/MsPv2roT2gTBw3pTbUMPRV6+rYjUG4kVGmi+il7uXhFhlb1EhpmzSvqo2z8sQdCXiH1A7c8ijS/4kZOi2oLogjgmV0GZ8ME+DZPvBbHfmY2+rcJVV+rt0NL1ySbmIk+WQv7UvKxboUEvHvMvV4ZTv83wK4G0FJwNHYTsFaFKNkR0tcu7Wdp9mlS3V4qkflLYikMCrkD0KxKq23xnYPD/91wTzjFIqIO3CpgDnCYM1gSmmApNOUQDqAJ8lrDUbvtWE+Ih5qOw2pb4dOw64Wcg6Vx261hpUU4UuIdUlROP97eozoWOspWhHGndCQU5Hg6sIqaqT1w/aGvRQb2utUR8nXJQz75mw5/s3f4cqkoQsH+BKsM9F2/hOAsu0XbE4/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(6512007)(6506007)(26005)(316002)(66476007)(66556008)(86362001)(186003)(83380400001)(6916009)(66946007)(8676002)(85182001)(9686003)(2906002)(6486002)(54906003)(4326008)(4744005)(82960400001)(33716001)(508600001)(5660300002)(8936002)(38100700002)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWV5VDVIOEF5Zm44VlQzTFVoTnhzQWlyQkc4Y3hVOHk1N0wzZXNsVjRwM3JD?=
 =?utf-8?B?SUZldGIzYWtJclhSM0x4aEE3UThtLy84ZnNsUUhyMHpwYTNoRjVxQVE3WTFz?=
 =?utf-8?B?RU42R05kRzh6cFQ2RWU0MXc5SzdFNnBtQldNa0pZVmFtUWk1U3FyRzZEVGor?=
 =?utf-8?B?ZitXSHFma1AxbG5Wdk5zSllNM2Rtb0crNVVDd2ZMUkxzdGhUYzhGSkFobm9r?=
 =?utf-8?B?eC84TXVSRkNET2hLU0pXNTMrVlpyOGhESmp6QkVtbjNTRHBxbHl3UUFZTTU3?=
 =?utf-8?B?NjQ0SFk4djZ1T3ZCQlN0MkZUMTJJK3grNEh0RVk4T3hEWDBpbHJoRWc5ZmQw?=
 =?utf-8?B?Tzk2OHdsek1NdjFDaXIyYWFXdzZDWE5OcWVHUHdodkFXN0daS09XcS83MW9t?=
 =?utf-8?B?emkrZlhPTUFCTGpUdmYrVUo3N3V3TFFUZXBCb2FOeVZDM1UvUUFQZS9SQmtq?=
 =?utf-8?B?ZTVwdU91cU5Mc2s1UW9hblFBdHpNdWUrazBnSzNkL2ZIeXFWZXZwakJ6ckxB?=
 =?utf-8?B?bGd5MFlySTlXb1pkd2l4SmpVVitXd0NKOGlqMjdXcld4WHFybHI3VUU1ZFBO?=
 =?utf-8?B?aHpQZU5ZQ244aGFrdWtWZWx6Zjg1RWFFZVdoV0pHbVBiTzlFWnRtc3RtVGdN?=
 =?utf-8?B?MjZEV0RYVjdwTklicjVxbXRSMjdvVVRJOFV4eDQzdU9pM3hqMEdydUlJWmJG?=
 =?utf-8?B?OStMTnJWamg3NkE2V0hOWlBHYmFUa1QrbXNzcHNlQVVKS1UzMWZIdm5DcjVH?=
 =?utf-8?B?ZUpkdFhub0tlRDdMdEpuNEpWWlFSelVuVnA3dXVZaFpKRy90TFBpSTlDb2t6?=
 =?utf-8?B?NWl4aGRydXVCSEFscitUT2R0TFA3Mk9qdkR1T3VVK0Z1YW0vR0p2M2VndlUr?=
 =?utf-8?B?RHUvSjQvdDZiMzdHUXZtc2puRVhHbTFIaHJ3dUgwZjBhUjFJN1RvRVFHRkJO?=
 =?utf-8?B?clhhV3dHUDFxYTVPNkJGT2VYM2hqOXNUOXZsck5oZCtkclNGSFdTczBRL1hV?=
 =?utf-8?B?MGE3dk96UkdXR1FGZDQzYkZiUERobXBNZW83U0M5Y1NSSS9KVElibks1WWNT?=
 =?utf-8?B?bzl1REYwSEpyV2pZdTh6dE9TQThXTURBOWJSWWJRdER3SFJUYlRTZmtTYUhY?=
 =?utf-8?B?QXFQVXBqSkRhT0c2dHNoYmlkN0w4ZnlOQVhuNEFLa05NRW44ZFV5cmtLZzZj?=
 =?utf-8?B?OTg2UStqVVZiRVc4bXo5NkY1djlCT003cW5KcWVHSndIeUszeFJiQXp1Nlpu?=
 =?utf-8?B?UjkzWTcyZW1OeTQ1S2NWb2RiQTNyNmdseEM3bTNzVFFzMWtxSTF1WDhkeHhY?=
 =?utf-8?B?YkprWTRnZ0tKaDhFV1l6LzNTaUhpTVZqTWNOMlJaVUltQ2tlOUFHT3lPK1pF?=
 =?utf-8?B?dXo1VnV1SkN6YkZscHk3RjlMbDlIMURtN1NzbXpzZHhUb05uSGU2YmdlZ2ZM?=
 =?utf-8?B?anYvQlc1cGhzZVVUWWgvT0ZKRTEvNFFnV0VyeFowY0gxaE5KNllKRHFLVmNQ?=
 =?utf-8?B?TmN1Vk43ZGY1dlI1RFlpang5VDZHbDBsY0pNMGpNZTlRQ0V6MTBCZlpUZjI5?=
 =?utf-8?B?Q1FyWDRZWVlXT2s4c3p5b1JaMzNsTG03VzB6bkE0bUt1MHFxWWtzTkw2Mzkr?=
 =?utf-8?B?RnJxRUp5d0t0S2ZJK2VnNkd6Q0ZIQWFLUWU1NjUvbTNaOHRWMzdvU0FBcWww?=
 =?utf-8?B?dEhueFRTYlMzQzR3Y1RhM3g0NFplQk9WTnBPQkF5bWtzb0FpSHVqY0g4a3J6?=
 =?utf-8?B?UDZHcnNlSzZvY3lTMDUzQkRudHVlUDJ0MmtTaWpod1FBb2Y3NTlDQW5tNTkv?=
 =?utf-8?B?VEQ1ODI3ZFN2VXoxRTBTS1NwdTRyME9wcXpPYWNFTGFxSkdKMk56MFhMUTNW?=
 =?utf-8?B?Y0RlUjJSOTQ2UG4xaHRvZHhWemU3VCt1MlBKQmxBOEpIMHVSZDQvVkoycUxm?=
 =?utf-8?B?Q1o1cDNqdkJzaHhRclRHb2prOGtsZ3djby9sUWs0V2lESzBUbmc0TndMamhG?=
 =?utf-8?B?YlYwRFRaNFBQQytlYjExRnNWd2dhdVdZWW9zRW1Eem1rK3RpTXRXdVUzaDh5?=
 =?utf-8?B?elBhekFCcXh6aE9kQkMybFZqaDJ1U0FuaVNKbXdaNnBZQWJiZmhmNUoxS1lk?=
 =?utf-8?B?aFNjS2hxVDhJYmpXYkJjaWdkZ2M2RVpYMkF3d01BTGNuZEVreWJoNUNZaWIy?=
 =?utf-8?B?OHdvWUcvVW9IbHdnTSt1NzAwbDIydkRPQ0E5eEJoOFdaL21KU3R0Mi9mL2kz?=
 =?utf-8?B?N25DMDF1NFArbUVMTW15WC9ocEJYeFBpYUE3dGt2ZEhQSVRJRWduUld3Wk5j?=
 =?utf-8?B?dlMxQVFPTlN4UkRKbVN0NmRSNmJ1V2w1ajM3ZWkrdk1IWDVJamh2Ykg4aGly?=
 =?utf-8?Q?zjj8Ww3gja9xUwh4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1529697a-6bd5-4710-c2db-08da163f2aed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:29:38.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGFEHv2faoodIhkbFCvj4y1j3hDbNBO8b3uwdU0Qceqqxz2wbddINHx+Rk+sCbQ8If4lHU5qgXQLqstGMFNjgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5518
X-OriginatorOrg: citrix.com

On Mon, Apr 04, 2022 at 02:45:05PM +0200, Jan Beulich wrote:
> (This, as an aside, also makes pretty clear that - unlike the title
> of the series suggests - this has nothing to do with gcc 11.)

I've started debugging this as reported as an issue associated with
building with gcc 11, until I realized it was the assembler that was
adding such section. I guess in my mind I still had the idea of fixing
the build with gcc 11, and hence the misleading subject of the cover
letter. The commit messages should be fine however.

Thanks, Roger.


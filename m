Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5979243FA21
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 11:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218472.378921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgOOU-0001fe-0x; Fri, 29 Oct 2021 09:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218472.378921; Fri, 29 Oct 2021 09:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgOOT-0001cj-TK; Fri, 29 Oct 2021 09:41:49 +0000
Received: by outflank-mailman (input) for mailman id 218472;
 Fri, 29 Oct 2021 09:41:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slsI=PR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgOOS-0001ca-BC
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 09:41:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ecb50f8-389c-11ec-8510-12813bfff9fa;
 Fri, 29 Oct 2021 09:41:47 +0000 (UTC)
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
X-Inumbo-ID: 6ecb50f8-389c-11ec-8510-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635500507;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1QdTVul8JI5HeVBMcOd2XK68E5F5bpRRbHmoudlRHac=;
  b=UaIXAC/O/Jr5V4msXUWrUxrzD08u5oKmKH2r54srywU6ZAZtXYScm5Xo
   Df0PpTxnr7IMTQTEB3f73Khwgctss2IA3KPk+gC0RGLWff13s0G8CsYv1
   IjU3oBED4R9KOe0qKsxg4XMKsedFN2Gxobr0KQdnsSkNYmnFP9wnNB+l8
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UOq4mzm7rZGYRiX24Y5CoARygo4UBwPB3S/A6JZH9MD2wSfKszBydANv+pu4DGDKpiRM2An9FD
 XDb3rBLBjBYeVhnFqhbC4RBUQ6JGTz6FV93jWtL27jUsVKe2sJdwZ8Y0PtKkqWtX0RwWh8s+Vg
 jLOaXaPVm4a9+BD12IIKsIso4IPkc3FvqTs/Oin0s8xGm+/R3Mv8Gs5fU/iPnV7aklT6zEM7ho
 fTzLT/EEg4ojDS4yyAQCtv+gXKJtN1oy1b+1M9UykSEwifInUR7D1F/n1CGs6dSk4RcUIw77gL
 PiAcCNSKIU235XCmgWGD0mDo
X-SBRS: 5.1
X-MesageID: 56618865
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:45qp+a10Cq9uRSdvsfbD5Y93kn2cJEfYwER7XKvMYLTBsI5bpzBVz
 jYbWzuAOPmJM2DwetF/b46ypB4C7JGHy4VkSAJkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es7wb9h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhu/Apl
 IQdi4aJTl0wJo7uvu9EWQNnDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIEGhWdg2J0m8fD2Y
 PUVZBFUMjD8ewBFFFM8J7kMw9ysryyqG9FfgA3M/vdmi4TJ9yR92abgGMDYcduLQYNShEnwj
 mDJ5WPiGTkBKceSjzGC9xqEh/DNtTP2XpoIE7+1/eIsh0ecrkQtDxkRWUq+sOOOoEe0UNJCK
 GQZ4iMr66M18SSDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf67OVoDWaKSUTa2gYakcsTwEI/t3iq4EblQ/UQ5BoF6vdpsLxMSH9x
 XaNtidWulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdkaFtl8oNLC/Xovy8ED4z9BLdYyDcUbU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J+r2r1qhZPaagVuWskfB44ba7obBewO
 BeL0T698qO/K5dDgUVfWIm2F9gxhZbpEdDoR5g4hfIfP8AvKmdrEMxoDHN8PlwBcmBwzsnT2
 r/BKK5A6Er274w9kVJaoM9GiNcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 Y0Ca5fUlkgPCbWkCsUyzWL1BQpXRZTcLcuvw/G7i8bZelY2cI3fI6aJqV/eR2CVt/sMzbqZl
 p1MckRZ1ED+lRX6xfaiMRhehEfUdc8n9xoTZHV0VX7xgiRLSdv/vc83KspsFZF6pbML8BKBZ
 6RcEyl2Kq8UEWqvFvV0RcSVkbGOgzzw1FzfYHP/MGhjF3OiLiSQkuLZksLU3HBmJgK8tNcko
 q3m0QXeQJEZQB9lAtqQY/Wqp25dd1BG8A6rd0eXcNRVZmv2941md374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iquYCnARpFXnGdXqxDbZkLiXU1MVDrPQVlLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtflseRf0/i56+raDQH5+BRjUhXwPNqZxPaMk3
 fwl5Jwc5Tugh0d4Kd2BlC1VqTiBdyRST6U9u5gGK4b3kQ53mEpaaJnRByKqspGCb9JAbhsjL
 jOO3feQgr1dwgzJcmYpFGiL1u1Y3MxctBdPxV4EBlKIhtua2aNngEwPqWw6HlZP0xFK8+NvI
 Ww6ZUR6KJKH8ypsmMUeDXunHBtMBUHB90H8o7fTeLY1k6V8urTxEVAA
IronPort-HdrOrdr: A9a23:8UH4AqCez7TpO+flHehKsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHP9OkPMs1NKZPTUO11HYSb2KgbGSpwEIXheOitK1tp
 0QApSWaueAdWSS5PySiGLTfqdCsbv3gJxAx92utEuFJTsaFZ2IhD0JczpzfHcGIzWvUvECZe
 WhD4d81nCdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn9y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zX0IidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6q9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFL9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc4a+d
 FVfYLhDcttABGnhyizhBgr/DXsZAV9Iv6+eDlDhiTPuAIm2EyQzCMjtboidzk7hdUAoqJ/lp
 b525JT5cZzp/8tHNFA7dg6ML6K40z2MFrx2TGpUB/a/J9uAQO4l3ew2sRy2N2X
X-IronPort-AV: E=Sophos;i="5.87,192,1631592000"; 
   d="scan'208";a="56618865"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9XFupziMqMsGo5093H4IRzBJdsr2XA/IjIYPJdU+lcsqcbX7fpZG/m6Tu20XdocdVKJW4sD5eq4S1SzGP7YuL10+6cAS0Rr8z8zwd8ShEHvPi3c2Ld+DPLf8ldM5W77hjBoHyN25WMmVw6GRND4o/kzMzEwEFCu0ejcOZav3L2P1NcaLQQno/HAZGqJS1XKqac2Y8uTCZn09dEQztFYVcnu6onpIK/1XImuWQrb0orE5KCJuSFqTjeJ0pusHbU69Z3VFUu2LQM4YmUbB4VoyuflXa1Pg/5cio1EE+cgigWcwC23Lr/k4EroJMdqNNMMKHTnAgeD8bdnlcnCvQSwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFjzSNwd3zDvhkZOMQl7twjqykhZdXQ8hSCSuHYErp8=;
 b=UUoILe1B8gZ1Vshob73zfq5dpmxpBBu6iG+krJCq9JLrGIVJ/mIBDb6k1rXFFhbQnu6EO4jlMjqCrX/y8lbWo5LLXyhECiu/hgp+3vKQE+7uXqrAYtl62rxKdFr3yF+bWkdbyCJNhR8UnK9xo+EAg3fIJbMRYQYRP2dAf8dABJQq82mHQ+TuRFfV1S0YQG7dz6aj7McKi+6koFLCTz4BwTyU7NMPAfcAUBGqYTM7/s5c7SB5BQILGiM6ohZd/aXTgVZ4dCYsNO8ZE/JM+5HnE4I44Y/wNE4Tbyvyra3tHPThM0C3+Kys48WB5MogDMUyeUWBRsz0KyMXAb9pSgyv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFjzSNwd3zDvhkZOMQl7twjqykhZdXQ8hSCSuHYErp8=;
 b=BgzPduSH/iDywZHRWBiE2uFQLHp552uJGng9Gnf4xhnTBR9GzsvetcEQ4Q/PbKvIsk1dD+Wd9PEoSqoXaC+CLkTCXOawcSvXNE1zYf9xLOxpBz8rSDTrHm7R8kXgILFXhvogeCg+ONVMsxX3rUa8Xc5Qm/hzlL7rofa7/8osuAA=
Date: Fri, 29 Oct 2021 11:41:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Ian
 Jackson" <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Message-ID: <YXvBz4OdpcmVRAGM@Air-de-Roger>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <2e198e53-e3fb-4ea6-0c44-f326b5e5f5fc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e198e53-e3fb-4ea6-0c44-f326b5e5f5fc@xen.org>
X-ClientProxiedBy: MR2P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::31) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 457ce1f9-7f34-4e33-f454-08d99ac05037
X-MS-TrafficTypeDiagnostic: SN6PR03MB4493:
X-Microsoft-Antispam-PRVS: <SN6PR03MB44936C298AC58C3C5D9E86368F879@SN6PR03MB4493.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XK1dHCkj0xDHMe8Qsi3PT2/obyg3nFHiZK1gNLIXcFbV/NBxsYgjDoxsjOpN84bFu2vAKqpmu4VKrY/WZ/iVf5KLuFNGlQBgjBUkG1CpcBAE/4C1/pfMghAD9xDhhk1vlvYJ2UXJKNommreFX8aVOPelpwHNfKBu1PVMFm7AWEEkTlcTGYbDR6M/EqcCkJ5k5smYmepebl21TkgopDOiLkhMG3P8Yty/bgkJpg4FthxIusofk27IJ2YoNVAqeaKLK6XrPf3xeZxKOx+ZCWz6kjZ2kiHW9LksCXlfR15k1e9mcQkrH0SiZC/N6Cp/6Zq2+4mNnyqAOLElTCDY08g04q99A2qUFj3k1lzgocOhgfxiKn/O4cxJH5+L7HH1YUSHMLVIDh8QwG2PMCHkqMtjEu6eUbwj3Oo5TCw7OBbBOXPCIlcxM3UHMaAGGLNdtw3MTdvp00uWWe7uFlpEC1qz6mXXJEWs1MQd53UFuyHSNsbnHlILK+2DMozgwEDnIsHCVanZVhxvc8e6im5eu9TPi+UwI+fKg1BjvsFgcIYktN6/dfgwNw/Wei4OHi9pwZfnokoTLFBzDN4jDXzIiO9ODWKRFAhVMnf04V3E1NBULJyi53/FwXHXmxqUF4nKM0+PRrWdLj/pqly6jgRqq5RO0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(8936002)(2906002)(186003)(8676002)(316002)(33716001)(82960400001)(54906003)(508600001)(83380400001)(956004)(26005)(4326008)(86362001)(66476007)(66556008)(5660300002)(6916009)(6496006)(85182001)(6666004)(6486002)(66946007)(38100700002)(9686003)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVFoNHRIakNsTWh5ZTdMSkVPWTZzTHU3V0x1TXkzeGQ3QWI5aXFLSUVSNXBz?=
 =?utf-8?B?eDJrdU5tSjIvMFowRm1oYi8zUFBndlpFNnhBbzRLc2dwRTZxR0k4aUFHQUF5?=
 =?utf-8?B?ZEVMbzNXeWVrbjRzcGZ0MlRqblV2WVNDbzdObktZQ0Nld0FNa1UrWUx6Tm1C?=
 =?utf-8?B?bnUwNUtEQVp3aklEMllFQVRWMkcwSFdVUkhCY2thL0xWMUNyU2hQbTNYYVRh?=
 =?utf-8?B?aVJBbmxBVGw2aDcxVnVtR252MnNFTzBQcGRSa0xmeDFsdEdLMHlKdWxEczcz?=
 =?utf-8?B?UkNRbnRZNk8rQ2FsRE1Lc0wxQkpUVXBzZkdackpxZWZNSFdlN3g0REtPeTN3?=
 =?utf-8?B?dkVqcEpBOGZjYUlsczdjU0tzNVd1REplNk5qeEpjdVc2SGJCT2J6TXdzMkJa?=
 =?utf-8?B?T0RCNTJaWUlDcDA1WlVncVNBaEh6STZkMTMyWHRPVExyejB3a1QzeXZTTGpE?=
 =?utf-8?B?R0lLUWtKVUtLV3hFL0JodUswN01seStIUFRZMmRsZG4wVit0enlLbWpwY0c4?=
 =?utf-8?B?TUEzbDZ5UHA5UnJtMEdYRm0wR0JLV1F2Ynp5ejBWUTd3ajRZYmQrTmZ2d1Q2?=
 =?utf-8?B?Q0xwdENqUTJRdFNiVlIyQXFTQUVTcDF3a081UjFodjRoMVpKWWhwZ3lhVXFG?=
 =?utf-8?B?MVRJbjg4Zm1nTmY0RHBrSkJYWXhFQ2ZoTTkvVFFKMXdkeVA4NW5XMU1meGlm?=
 =?utf-8?B?VnFnWm5acitvZXdyV1JqRTVlRWVtU0REWUtlYWVWRjJGUERLS1JhSWZ0TFp2?=
 =?utf-8?B?b1JyZ01oOTdta3ZreDFCZlVxNHVEWENWTGFRdDA4L08xYk0zTHZIQ0ZvR29q?=
 =?utf-8?B?WjhPRlk4dTdCY3F0UFg1WTM5Ykx4V1JULy9jaDJXTjhTeFhJU3dMZWRnSTZR?=
 =?utf-8?B?dWxBZ05ycGhhYmFReEJsbTBzN2NnUi9nQlBBMWZTYTh4Ny8xSUxTNjJmTHZn?=
 =?utf-8?B?SytyU285cnU0UEZnVTJqZnptNVZ3cnFyalRENEVad0pxSEpqMVBIcTlkUjgy?=
 =?utf-8?B?RVIvK29TMjRkMGpKN3hGZzlxVWw3OEJPL09iT2NnVXJweVpLSmEyYklSdnoz?=
 =?utf-8?B?SkxuanhMZ21qM1hidUM4YXpkYW8zWjFnbFZxR2pMbTM4R3JFdFZ5L05EekVL?=
 =?utf-8?B?OFY4M1gzQUpBR1BEWDU4OWF3NmlCeGo4UFNFMzVmU2cvdWNhNHE4Y1FieVpQ?=
 =?utf-8?B?MFVPN25UVGpXQUhBNXBYT1J4RElNUWxpREMzdWgvTUFyRHlYdXp5UDdwQldv?=
 =?utf-8?B?ZnFsZVdBWXY3S0l1Sk5VVUE3YmpGa3o5OVE5bEZ6RUcwNXNGa0Q5anZsZG4w?=
 =?utf-8?B?dm9mK2dBdXowelZHNnVwclF5bjF2V3M3dDhGdElkdUVPclJVNUtSaTcyY3Yw?=
 =?utf-8?B?aE9Ba3U5RXFtaU1VNGh6R2V4M2REcU00QW41VFF3T0ZadEh0UTJPWWJ4aHZF?=
 =?utf-8?B?bTFVcWRnWjZzdmpnV0kyT0JpandWaWloeXdmMDR6TTNteHFmZ0ozZS9zdndw?=
 =?utf-8?B?bVpoNmxIQnhUMGVpV21UZU13cFNYY2VZbVNjNkFoS0pSS3ZPaHRiNy8rTW5M?=
 =?utf-8?B?aVI2VGF3RVpQcUtFS05maEcvRGwzbDN3bEJTZk1JWGljRDVJbllSZmpNR0VT?=
 =?utf-8?B?TUtFRUZoUFRSdE9IdVNYc0RCcXArRTRUb21nM21FWW9nem1HZFdzbk5KSElw?=
 =?utf-8?B?OHRxRk84NmxMUTR1VXNWaXZmZkVGOWFDSlBGV2M5NkY2K25OK2xtSTdaek1v?=
 =?utf-8?B?VGdFeklXQW5zWElMRWl0OGVjbGs5RzNKRDlWK3JCSnREK3ZCYUlQR2Fqalh4?=
 =?utf-8?B?a2RGMUNISS8zZVdpWHlqT3JYdXpkSTdPY3FGejRwd2RYUGhhQnlMYnVUeldr?=
 =?utf-8?B?RUlMTTZyY1A3WUxwTEJLYVlDS1dhWUZWTWkxNjFpY2xpYnhFQ3hGc0QwZkNy?=
 =?utf-8?B?cDEyeG9wM2dTMzZUTVpuWEJtTmxnWVVxeGQwNWw4Wk5hekpDYVlGRXBhMDlT?=
 =?utf-8?B?cy9SVFFWYnQ2VStFOGx0OWZLRERBREFwRXZYUVdjanFCRjhhV05RdDhCZm5x?=
 =?utf-8?B?RzZIS2s3Qkt5VzFXYStPbFcyM3JtZGo5UCs5cVVlN2llc1VEcmlyNFEwUTdZ?=
 =?utf-8?B?a2Z0Wit1bGl4bWNZM0RLZ2dBazBCamUzWWhJVTkybnZLL2lScTEwSDlmU1BS?=
 =?utf-8?Q?MzX3/n72ya8jkNC9KGbJyqI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 457ce1f9-7f34-4e33-f454-08d99ac05037
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 09:41:42.3054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ3OZViV1Zhl+7otgYwRjk4drs7Ug7iZaC0R2WwtGesCdqfKH+PbFwF/9QhC+C07EgzXGpo50TlWpl6Fg1EZUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4493
X-OriginatorOrg: citrix.com

On Fri, Oct 29, 2021 at 09:58:55AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 29/10/2021 08:59, Roger Pau Monne wrote:
> > diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> > index e510395d08..f94f0f272c 100644
> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -53,6 +53,7 @@ struct grant_table {
> >       percpu_rwlock_t       lock;
> >       /* Lock protecting the maptrack limit */
> >       spinlock_t            maptrack_lock;
> > +    unsigned int          max_version;
> >       /*
> >        * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
> >        * values are invalid.
> > @@ -1917,11 +1918,33 @@ active_alloc_failed:
> >   }
> >   int grant_table_init(struct domain *d, int max_grant_frames,
> > -                     int max_maptrack_frames)
> > +                     int max_maptrack_frames, unsigned int options)
> >   {
> >       struct grant_table *gt;
> > +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
> >       int ret = -ENOMEM;
> > +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
> > +        max_grant_version = opt_gnttab_max_version;
> > +    if ( !max_grant_version )
> > +    {
> > +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> > +                d);
> > +        return -EINVAL;
> > +    }
> > +    if ( max_grant_version > opt_gnttab_max_version )
> > +    {
> > +        dprintk(XENLOG_INFO,
> > +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> > +                d, max_grant_version, opt_gnttab_max_version);
> > +        return -EINVAL;
> > +    }
> > +    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
> 
> From my understanding, the limit for the grant table v1 is based on the page
> granularity used and the size of the fields.
> 
> So the limit you add is valid for 4KB but not 16KB/64KB. Therefore, I think
> it would be better to use:
> 
> 'max_page >= (1U << 32)'

I'm slightly confused. Isn't Xen always using a 4KB page granularity,
and that also applies to the grant table entries?

I don't think it's possible to use correctly use a 16KB or 64KB page
as an entry for the grant table, as Xen assumes those to always be 4KB
based.

> Furthermore, it would add a comment explaining where this limit comes from.
> 
> Lastly, did you check the compiler wouldn't throw an error on arm32?

I've tested a previous version (v2), but not this one. I assume it
doesn't build?

I've pushed it to gitlab and will adjust as needed.

> > +         max_grant_version < 2 )
> > +        dprintk(XENLOG_INFO,
> > +                "%pd: host memory above 16Tb and grant table v2 disabled\n",
> > +                d);
> 
> I would switch this one to a printk().

That's fine, will adjust unless someone has objections.

Thanks, Roger.


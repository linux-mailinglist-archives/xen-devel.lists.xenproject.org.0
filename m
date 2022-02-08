Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9914AD5D2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268106.461888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO4g-0003ci-PS; Tue, 08 Feb 2022 10:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268106.461888; Tue, 08 Feb 2022 10:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO4g-0003az-Ld; Tue, 08 Feb 2022 10:50:18 +0000
Received: by outflank-mailman (input) for mailman id 268106;
 Tue, 08 Feb 2022 10:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHO4f-0003ap-DB
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:50:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e508c7cd-88cc-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:50:15 +0100 (CET)
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
X-Inumbo-ID: e508c7cd-88cc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644317415;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=W2sZy2rV6WUG2bZo8PIEkizxWMFoZ9Ura8FR2J5zWrE=;
  b=L1g4hlrBrG9SY3jDYrJqeIdKWFbW40NcVP3Baysnf4zFhWaNLUd72iC9
   O+Y0HeAxfLI+1KLNKM8qPuyIvyEPnD9Te0B0Pyear7MY1c+7uqQggHZbz
   l+TCk5jGLLvT75R/PEcnvbBH30Ali9uXyYmwKgimQD8moq8yUildOzxkY
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: n+8gErvBko1hIKVPkTu4UKa6vrBE1hEN0ZGvmwAmx82pYH14379CWaigwuaXWv1AyPASXdu0/+
 vToor7K6cW82Lpe1c8UVUbHXLwg1dfyl+eG1rB6cZx/Lo3amV+2F3Qm5pvE9SJcDRD/+PKH8u2
 cAdbIpgEOXib1ay1ozTMUINt0rYLWHzgD+pUjYou/pmsi/e+wltw3GxPXegP+0yEXQo3atCwVt
 HFFRGR6OGhEdt+0nL4CZcQ24ulrDeR7XDPMSrLhKQHXk876gbQN3a87TQzlJwkZvKsz7b1pGe3
 otmiqfP/TwaQlllePMb9OLUU
X-SBRS: 5.1
X-MesageID: 64125556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EGcqSqxALQEd63SBSjx6t+cXwCrEfRIJ4+MujC+fZmUNrF6WrkVRm
 2ZKW2uPOPvZMWSnfNp+bd/ioR4A6JXRxtM2HVBqqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZp2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Fbz
 /YWjaaKcBgSMo/FvOE4TDYGHj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEEhW1t250QdRrYT
 +gmchltTh7aWAdGHlVOV7wHwuOLn2aqJlW0r3rK/PFqsgA/1jdZyLHwNPLFd9rMQt9a9m6xv
 H7L+lPcEx4TNdGB4Ted+3fqjejK9QvxVZgODrS++rhviUeK220IIBQMUB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4CeQ69QXL0avS7AaxD3IBCDVGbbQOisgyQjA70
 06TqPngDzdvrb69RGqU8/GfqjbaESofIHIGZCQEZRAY+NSlq4Y25jroSttgC6ezgsfCMDf82
 S2RrCM+irMQiuYGz6y+u1vAhlqEpIXNTwMzzhXaWCSi9AwRTKmhao+z4F7X98F8PZ2ZRVmMu
 nsDs8WG5eVIBpaI/ASWW/kEFryt4/eDMRXfjERpEp1n8C6ik0NPZqgJvms4fh0wdJ9ZJ3m5O
 yc/pD+9+rdyFnyJNpdNWbuuMMgIxIzlMMvKCP3LO48mjodKSCeL+yRnZEi11m/rkVQxnaxXB
 ap3YfpAHl5BV/05kWPeq/M1lOZym3tgnT+7qYXTkkz/uYdyckJ5Xlvs3LGmSukipJ2JrwzOm
 zq0H5vbkk4POAESj8S+zGLyEbzoBSVhbXwVg5YOHgJmHuaBMDtwY8I9OZt7J+RYc119z48kB
 E2VVE5C00bYjnbaMwiMYX0LQOqxAcom/CtiY312ZA3AN50fjWGHtvZ3SnfKVeN/qLwLIQBcE
 5HphPls8twQE2+aqlzxnLH2rZB4dQTDuO59F3HNXdTLRLY5H1ah0oa9JmPHrXBSZgLq5ZpWi
 +DxjWvzHMtcLyw8V5y+QKz0kDuMUY01xbsas73geYIIJi0BMeFCdkTMsxPAC5tUdkyYm2DKj
 l3+7NVxjbClnrLZOeLh3Mish4yoD/F/DgxdGWza5qyxLi7U4iyoxooobQpCVWq1uLrc9Prwa
 ONL4ev7NfFbzl9Gv5AlS+RgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHVasnrJ0EceVg+ZeOZ2PBKxjSLtaYpIF/37TNc9aacVRkAJAGFjSFQdeMnMI4sz
 eo7ltQR7giz1kgjPtqc13gG/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxBzc
 DGOhafEi7BN/Wb4ciI+RSrXwO5QpZUSoxQWnlUMEEuEx4jejfgt0RwPrTluFlZJzg9K2v5YM
 3RwMxEnPr2H+jpliZQRX22oHA0dVhSV9laolgkMnWzdCUKpSnbMPCs2PuPUpBIV9GdVfz56+
 rCEyTm6DWa2LZ+phiZiC1R4r/HDTMBq8lyQkc+qKM2JAp0mbGe3maSpf2cJ90PqDM5ZaJcrf
 gW2EDKcsZHGCBM=
IronPort-HdrOrdr: A9a23:5QGIwK9uMSVwTpFRvNtuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="64125556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjM7RrsEK+IjUkw2EMi+KiQhp1dHu8QcHLRVToHZ7XjuIJRrPyZwpRVAdL7GXO1BgHkWqR+TN3QxsLlVmWbFUmxxU41hQTE/GLYNV7o4o2mf5frp3MMvPaRIX0QOdwELr69vArswYk2v87cbZBlalmiyk9GmVfYnIN463McdjN6tN452HL+6q4RwNKadTwY4M2GZ7mikgvDO19xN5TK4i3VTmX4I9pU0/bchkoZ11QBMYt+Np8GGb2MX0GIaaqymB1JHLzJCXPGhCqKzNZIAYRKN8BrB1FfhRFXP8rWbV1uphq2hdE3DqBr9fhZptjNplwmmZDvGaPVTiyLZFNaNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmVQHcuVkLutcxkbKnI79dJyv/G70MnZrJPD8qAKEYI=;
 b=aTfy2t9Qp2VsS6g6uhYHIZ2HJQzqi/4EKAIhlLzy2XDWH6UHk2T4AhfXt0DnuqDiGgFPvF8aSD4oFl5OPVv3z1BkD3ILtsdhQxVOsDCVjgC3ZLGBjR3xEiYuzztoFOpzi0CW2/d1P1NB20HYW2MZNqmHcHKdlYfNvvwefu2aXTy7OoJv6B0t5KmBi2mGa4a28Q7ITkKardREz6cQB6uJM6OJM9e/naY8zLR4a5Xp0+1twA/+pP+YXB5P2uTWGCaN56LuiITLBlVUJdQueJcE5+9LeVv0Zb1IeiBmOW+cIE6s/gN8BtfaW1jUwII7QLiNAr1HzBQDfTsvekhGO4sMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmVQHcuVkLutcxkbKnI79dJyv/G70MnZrJPD8qAKEYI=;
 b=fzG4JMDX0mew7IqeiXtvI3UmQpES4+kjvCtj328oCPZ93FfUHcU+0FkZslyn2BudR/2Qmg1nd+9r5dEgf7l9n2V2Z44H8zUEmQWBB06Lx4O8SMYsCJjC4/UV7nGG7/j7QwGitYv5hXt+sMIIDp/OClTT01J0ppnsh7egT7x5jwU=
Date: Tue, 8 Feb 2022 11:50:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <YgJK2zPszyTXGxMM@Air-de-Roger>
References: <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
 <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
X-ClientProxiedBy: LO3P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4726d038-1b5d-45b1-76f0-08d9eaf0c60d
X-MS-TrafficTypeDiagnostic: CY4PR03MB2965:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB296524F13C5CA82FE00811188F2D9@CY4PR03MB2965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cNLnqvh5kzCsN4wRIhNcKgAlBK3nQbYwrRwObYJ0i2JLwdv2P0jM2m4BWhHu2zMdKkkjFcdtCcBZUAJew/anLK6HTqo+/FD3C1IglZ1snCr0AHTElAOxyKsaLfz9i0x+25CHTG5M7orpvPH40sXPiklaPWWptOBe2TdRCR3ZXBfoGu9+Q5A8pwyOzAmaWZzWneWI+u1CDDrmpCVQk0kofYHDYx4YYqps6SAnStaxbFbYL3OAahxwa+zrLtzpvG9TvGLxin0m9oHZ6ZkWTs+FAFcr2RH7aMkqvWXfDBEVeeAKBKsKokLR6UMb8D92pCivEFw3WhBsHN/cnngzLbvtWWTa1xOdwXZg0x8NqZ3vvosXej6RkxAXF9eFZgTesfQ9nbJscfzcyA5yl3YOEEfuZA2cDGLiX5Wcqc2nDqQsFklA/kGUIUzSufGRcYoAaalHNyfUlFTDLmydmCKv/0E0LkVEiLwx5lvaE7Y9RlPhuLRtxd38AfFYOQv83cq+eeFCJOtLi0BxUUbrA90VrX2y8Kep+8E6hDiZx1P/u7ZBPssua+TIWiILFKpe3MngaKZam99UGACS/AjHxTaDHSzBIMyxMmESgMN25xCHaB2WM8y4NoazI23j+qk/HYVgfwRPlxO0ADR6HcDaIFjQnDWQ2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(6666004)(6512007)(6506007)(53546011)(9686003)(82960400001)(186003)(5660300002)(33716001)(86362001)(6916009)(316002)(54906003)(7416002)(85182001)(83380400001)(66946007)(66476007)(38100700002)(4326008)(6486002)(66556008)(508600001)(2906002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEcyWTV2TEZFcC96Q3RHc05PYmRrYkROQ3o2akh4Q1IyM2lzM2Rlb1lXNWM0?=
 =?utf-8?B?RVhQaVRsVGNVbWRPMk1UbE8vN281YWthdnJJRE5FWXVldlBKazhIQjdhL1FT?=
 =?utf-8?B?V0ZvV2kvaUp2MnFzODkvMks3WmlCVkdjQXUyTjNiQ3AvQ0gvV3R1dXk5UWFh?=
 =?utf-8?B?RnU2OFpONnpPRlovcmR6TUFnNCtXZitKU01XdjZvTFBoNHU0N1E5MG52YWZR?=
 =?utf-8?B?b3ZWODdZWG51QWhUWnYvNkVqUFBiVlc0eXN2MG5KeWt3TklkSy92a0FRVHA1?=
 =?utf-8?B?QUQ5VGxLK3lYRUpEaStVYkRqUmpuOVZYV1dxUjAyd3dpcTZrUm9XQWRWZld5?=
 =?utf-8?B?OVdzUHFqVVoyZzZPNmVISUFEVittK2NaWU10RXlmMUJsZWxGR2NPbUpnV25Y?=
 =?utf-8?B?ZU9IZ1FiQUt3bHZzRTh1L3pSYWU3YnoxWDBSNHNJZVFjYlU3VE91OWRoaHRW?=
 =?utf-8?B?cEVRZzhBdEg3K2IwUmRLT1gzVGczTFV4ZUhzckJBdTlRYVpZU0dmY0hWM0NL?=
 =?utf-8?B?SG9DQ2N6eitTM1ZVcGxnN3l4ZDZjOE5xTUFSOHVQT0lmUGZwbGV0ckQ1YVJL?=
 =?utf-8?B?OGhHV0QyL001cWtjV1JvMTdIK1dRZC9SekZMRGhNcDhMZEFmNjhXc050RkM3?=
 =?utf-8?B?MCtxZWtBckE3cWtZdjF2aTdTc2VQT3pXT04vRTZ1bWpzL2VBMjlsMkxyL0l2?=
 =?utf-8?B?YTNYaDRHbEFIeXdPNVBURnpCdjYySnNUYmcwWG9PT1luRUdyVFpGSytGSDht?=
 =?utf-8?B?czE0ZmdVUG9SeE41eFo1WFZFd3puZXI0QlprdmNNRXJlbXFtdU1HTVN0bWdr?=
 =?utf-8?B?WkllOXFiN3N6bFZoeVJTVWlCcnRmQTJxTHhJU1dPOGZGdUYzWTYxUWRkM0p1?=
 =?utf-8?B?YzFESzF5K0RuMkhqVFFUdFp1eVhUVXBrc1Q1NUhiVXd2T3BjelZEdzI1Rmt1?=
 =?utf-8?B?bGRnUzVld2NsNC9ZQVBmMXdFR0h4Q25Iby9KR0FrVDFOd1FzL2FuZitHRlpl?=
 =?utf-8?B?a0NkS21SZVJQWERiV0ZnVHVpTVFWMmhwalFUMTRIWXQ0NVB6c1F4TUNTbGEr?=
 =?utf-8?B?RHFWaEhtSkR1amNGVmJ3ZW5lMnVzMGxoQXBZQXUxbnh2S283ZHozdTJYTjVV?=
 =?utf-8?B?UWdMelc1QmhQYXUwWUpBY2VUQ1R0UjV3RFpsWlg1amNCcThGUDIwbnJ1Y205?=
 =?utf-8?B?L1NUYWZudXdSMmk2SlVmd3lQQnNiaGVhR2prUC9Vdk52dTVHR210UnlzeVcz?=
 =?utf-8?B?MUVoRkhrMDB4RGxKSFcySTVKK3RlOEk4bHJCQjk3YjVoZ1VsakdjT054Z0py?=
 =?utf-8?B?aFRSRkNpRWIyOGpxMjdJa3M4UHRLZWt0eEphN1BiVEZwMjN2d2dsNzVsVmFF?=
 =?utf-8?B?TXkwaWVyblNDd05ua3gxbDI1NHMwVnRCbmFJczJZVi8wdllseDcxK21jcE1h?=
 =?utf-8?B?ZDVpVlB2OVNFOGUxREJhdHl3OXpSK0NldzNPOHZWS0Z2enZmdFdsb0dadm5z?=
 =?utf-8?B?elgyREFWOFgrSGtpcUQ4Y3Q5Qno5T21vT3c0OVc2T0dNVGJoM3N5bE85Qm5H?=
 =?utf-8?B?MkVKRG5xMjY2ZTZSbzcvYURxblRzZzN6NVNDUHpaeHJRMHNmazNYOXNnNjFS?=
 =?utf-8?B?MmEweXZQaTZHM1JCOWo1SXg4T1BDTnJtTHJxNlcxL0ZrOURsdTlVSGFJMXZT?=
 =?utf-8?B?aWNOTkMyOTRCM3pCMmFvakJWc1dINmsyTVIxV1V4K0Z3ZlBRNkUxbGFhQnpk?=
 =?utf-8?B?TE0xVVZmaWFidjB0Vk05dHpRUmlTT0NHdXBvNThCay9mVzZvOThGeGQxWUw4?=
 =?utf-8?B?azFBdXBvMjBWdHdVaXM0S1I2NkNWdWhSczJNQzlSc2duMkJDUmxwM0I3eHd6?=
 =?utf-8?B?MFNQOEVrQWpVMk5HbFlqTjRURjZVV3RPNDBVclhseGV6SWVyR2lzYkJjUzJC?=
 =?utf-8?B?QjVSOWVaQXROaFBZNDJPcWlORjcyRW53THk0MStaSDRLcXFuKzliSmtvLzdj?=
 =?utf-8?B?SHA4UXU0QXV1dVYxRFJzN0JXYVVsR05BdGZKM2pvdEtSdXFCSEdwS0xhNCtX?=
 =?utf-8?B?MWk2ZWZmVTUrVjBlNk1HVXhERXBXSjV4R0dWVXEyT1IxZjBBR0ZjZkhDR09N?=
 =?utf-8?B?WWl0VzIzREM2UUVrNUxlMCtvcE5ERHNFbUdjRVdlNEl4R3NnK0tnZEhHTExp?=
 =?utf-8?Q?inYq+Qqgu2YkGwlazcszxNU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4726d038-1b5d-45b1-76f0-08d9eaf0c60d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:50:08.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CShlM0uvU1VTTkdgYXrhJ8KXpvZ1dmvokqDnBcyG17trJIicPw2dABq7gqAKrfuP5UsDT0I3XWEmI2qe3Roxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2965
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 07:35:34AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 07.02.22 18:44, Oleksandr Andrushchenko wrote:
> >
> > On 07.02.22 18:37, Jan Beulich wrote:
> >> On 07.02.2022 17:21, Oleksandr Andrushchenko wrote:
> >>> On 07.02.22 18:15, Jan Beulich wrote:
> >>>> On 07.02.2022 17:07, Oleksandr Andrushchenko wrote:
> >>>>> On 07.02.22 17:26, Jan Beulich wrote:
> >>>>>> 1b. Make vpci_write use write lock for writes to command register and BARs
> >>>>>> only; keep using the read lock for all other writes.
> >>>>> I am not quite sure how to do that. Do you mean something like:
> >>>>> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>>>>                     uint32_t data)
> >>>>> [snip]
> >>>>>         list_for_each_entry ( r, &pdev->vpci->handlers, node )
> >>>>> {
> >>>>> [snip]
> >>>>>         if ( r->needs_write_lock)
> >>>>>             write_lock(d->vpci_lock)
> >>>>>         else
> >>>>>             read_lock(d->vpci_lock)
> >>>>> ....
> >>>>>
> >>>>> And provide rw as an argument to:
> >>>>>
> >>>>> int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
> >>>>>                           vpci_write_t *write_handler, unsigned int offset,
> >>>>>                           unsigned int size, void *data, --->>> bool write_path <<<-----)
> >>>>>
> >>>>> Is this what you mean?
> >>>> This sounds overly complicated. You can derive locally in vpci_write(),
> >>>> from just its "reg" and "size" parameters, whether the lock needs taking
> >>>> in write mode.
> >>> Yes, I started writing a reply with that. So, the summary (ROM
> >>> position depends on header type):
> >>> if ( (reg == PCI_COMMAND) || (reg == ROM) )
> >>> {
> >>>        read PCI_COMMAND and see if memory or IO decoding are enabled.
> >>>        if ( enabled )
> >>>            write_lock(d->vpci_lock)
> >>>        else
> >>>            read_lock(d->vpci_lock)
> >>> }
> >> Hmm, yes, you can actually get away without using "size", since both
> >> command register and ROM BAR are 32-bit aligned registers, and 64-bit
> >> accesses get split in vpci_ecam_write().
> > But, OS may want reading a single byte of ROM BAR, so I think
> > I'll need to check if reg+size fall into PCI_COMAND and ROM BAR
> > ranges
> >> For the command register the memory- / IO-decoding-enabled check may
> >> end up a little more complicated, as the value to be written also
> >> matters. Maybe read the command register only for the ROM BAR write,
> >> using the write lock uniformly for all command register writes?
> > Sounds good for the start.
> > Another concern is that if we go with a read_lock and then in the
> > underlying code we disable memory decoding and try doing
> > something and calling cmd_write handler for any reason then....
> >
> > I mean that the check in the vpci_write is somewhat we can tolerate,
> > but then it is must be considered that no code in the read path
> > is allowed to perform write path functions. Which brings a pretty
> > valid use-case: say in read mode we detect an unrecoverable error
> > and need to remove the device:
> > vpci_process_pending -> ERROR -> vpci_remove_device or similar.
> >
> > What do we do then? It is all going to be fragile...
> I have tried to summarize the options we have wrt locking
> and would love to hear from @Roger and @Jan.
> 
> In every variant there is a task of dealing with the overlap
> detection in modify_bars, so this is the only place as of now
> which needs special treatment.
> 
> Existing limitations: there is no way to upgrade a read lock to a write
> lock, so paths which may require write lock protection need to use
> write lock from the very beginning. Workarounds can be applied.
> 
> 1. Per-domain rw lock, aka d->vpci_lock
> ==============================================================
> Note: with per-domain rw lock it is possible to do without introducing
> per-device locks, so pdev->vpci->lock can be removed and no pdev->vpci_lock
> should be required.

Er, no, I think you still need a per-device lock unless you intent to
take the per-domain rwlock in write mode every time you modify data
in vpci. I still think you need pdev->vpci->lock. It's possible this
approach doesn't require moving the lock outside of the vpci struct.

> This is only going to work in case if vpci_write always takes the write lock
> and vpci_read takes a read lock and no path in vpci_read is allowed to
> perform write path operations.

I think that's likely too strong?

You could get away with both vpci_{read,write} only taking the read
lock and use a per-device vpci lock?

Otherwise you are likely to introduce contention in msix_write if a
guest makes heavy use of the MSI-X entry mask bit.

> vpci_process_pending uses write lock as it have vpci_remove_device in its
> error path.
> 
> Pros:
> - no per-device vpci lock is needed?
> - solves overlap code ABBA in modify_bars
> 
> Cons:
> - all writes are serialized
> - need to carefully select read paths, so they are guaranteed not to lead
>    to lock upgrade use-cases
> 
> 1.1. Semi read lock upgrade in modify bars
> --------------------------------------------------------------
> In this case both vpci_read and vpci_write take a read lock and when it comes
> to modify_bars:
> 
> 1. read_unlock(d->vpci_lock)
> 2. write_lock(d->vpci_lock)
> 3. Check that pdev->vpci is still available and is the same object:
> if (pdev->vpci && (pdev->vpci == old_vpci) )
> {
>      /* vpci structure is valid and can be used. */
> }
> else
> {
>      /* vpci has gone, return an error. */
> }
> 
> Pros:
> - no per-device vpci lock is needed?
> - solves overlap code ABBA in modify_bars
> - readers and writers are NOT serialized
> - NO need to carefully select read paths, so they are guaranteed not to lead
>    to lock upgrade use-cases
> 
> Cons:
> - ???
> 
> 2. per-device lock (pdev->vpci_lock) + d->overlap_chk_lock
> ==============================================================
> In order to solve overlap ABBA, we introduce a per-domain helper
> lock to protect the overlapping code in modify_bars:
> 
>      old_vpci = pdev->vpci;
>      spin_unlock(pdev->vpci_lock);
>      spin_lock(pdev->domain->overlap_chk_lock);

Since you drop the pdev lock you get a window here where either vpci
or even pdev itself could be removed under your feet, so using
pdev->vpci_lock like you do below could dereference a stale pdev.

>      spin_lock(pdev->vpci_lock);
>      if ( pdev->vpci && (pdev->vpci == old_vpci) )
>          for_each_pdev ( pdev->domain, tmp )
>          {
>              if ( tmp != pdev )
>              {
>                  spin_lock(tmp->vpci_lock);
>                  if ( tmp->vpci )
>                      ...
>              }
>          }
> 
> Pros:
> - all accesses are independent, only the same device access is serialized
> - no need to care about readers and writers wrt read lock upgrade issues
> 
> Cons:
> - helper spin lock
> 
> 3. Move overlap detection into process pending
> ==============================================================
> There is a Roger's patch [1] which adds a possibility for vpci_process_pending
> to perform different tasks rather than just map/unmap. With this patch extended
> in a way that it can hold a request queue it is possible to delay execution
> of the overlap code until no pdev->vpci_lock is held, but before returning to
> a guest after vpci_{read|write} or similar.
> 
> Pros:
> - no need to emulate read lock upgrade
> - fully parallel read/write
> - queue in the vpci_process_pending will later on be used by SR-IOV,
>    so this is going to help the future code
> Cons:
> - ???

Maybe? It's hard to devise how that would end up looking like, and
whether it won't still require such kind of double locking. We would
still need to prevent doing a rangeset_remove_range for the device we
are trying to setup the mapping for, at which point we still need to
lock the current device plus the device we are iterating against?

Since the code in vpci_process_pending is always executed in guest
vCPU context requiring all guest vCPUs to be paused when doing a
device addition or removal would prevent devices from going away, but
we could still have issues with concurrent accesses from other vCPUs.

> 
> 4. Re-write overlap detection code
> ==============================================================
> It is possible to re-write overlap detection code, so the information about the
> mapped/unmapped regions is not read from vpci->header->bars[i] of each device,
> but instead there is a per-domain structure which holds the regions and
> implements reference counting.
> 
> Pros:
> - solves ABBA
> 
> Cons:
> - very complex code is expected
> 
> 5. You name it
> ==============================================================
> 
>  From all the above I would recommend we go with option 2 which seems to reliably
> solve ABBA and does not bring cons of the other approaches.

6. per-domain rwlock + per-device vpci lock

Introduce vpci_header_write_lock(start, {end, size}) helper: return
whether a range requires the per-domain lock in write mode. This will
only return true if the range overlaps with the BAR ROM or the command
register.

In vpci_{read,write}:

if ( vpci_header_write_lock(...) )
    /* Gain exclusive access to all of the domain pdevs vpci. */
    write_lock(d->vpci);
else
{
    read_lock(d->vpci);
    spin_lock(vpci->lock);
}
...

The vpci assign/deassign functions would need to be modified to write
lock the per-domain rwlock. The MSI-X table MMIO handler will also
need to read lock the per domain vpci lock.

I think it's either something along the lines of my suggestion above,
or maybe option 3, albeit you would have to investigate how to
implement option 3.

Thanks, Roger.


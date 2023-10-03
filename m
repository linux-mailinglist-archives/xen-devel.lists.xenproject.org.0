Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F167B625B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612063.951912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZcv-0006pg-Ul; Tue, 03 Oct 2023 07:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612063.951912; Tue, 03 Oct 2023 07:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZcv-0006nh-Ry; Tue, 03 Oct 2023 07:15:29 +0000
Received: by outflank-mailman (input) for mailman id 612063;
 Tue, 03 Oct 2023 07:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/VM=FR=citrix.com=prvs=63394bc6a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnZcu-0006nV-9u
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:15:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e7d22c1-61bc-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 09:15:26 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2023 03:15:23 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SA0PR03MB5628.namprd03.prod.outlook.com (2603:10b6:806:b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Tue, 3 Oct
 2023 07:15:19 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Tue, 3 Oct 2023
 07:15:19 +0000
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
X-Inumbo-ID: 9e7d22c1-61bc-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696317326;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YRSfF+8fh98uyOMqSO/jvfCTjC14NLnOd+Ku74M2ZLU=;
  b=YYBEVMjQpiDFw2LkLZ9Gk2Onz3jVBErItDBU9us7K9EEAHlcJN2egLIs
   98CGs4Jgbdh1Myow5E1ZeZqvybPLQub6QCLhstKgbOW8JnaRGcA4dLNiv
   ozusismtikH5Yc7PRhTp0djiZKlIyVMrvYRDIqRbj6DOBLRcYfPyJXB9h
   E=;
X-CSE-ConnectionGUID: cJ8e/eYNTxKAQ3AiQMDpWQ==
X-CSE-MsgGUID: JEb18z/ETx66HMyR3ZHbDg==
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 124320247
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:MMl07qu9aMciCdrkRYIYrARfEOfnVJ9fMUV32f8akzHdYApBsoF/q
 tZmKWuDaP3YZmLzfdsna4S+/UNXuJbcy4QwTlQ4qXtjH3wW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeGzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwIxJdY1eOtsSK0JGSc7JFh/0GANHUBdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4C9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt5JTuXiqqECbFu75EEZUU0EEnaHsafnqmuvYYltC
 0Y49X97xUQ13AnxJjXnZDWkqXuNpTYAWN5dFeIr5QXLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313reZqymjfzccK2AqbDUBCwAC5rHLoos+kxbORdZLC7Oug5v+HjSY6
 y+OhDgzgfMUl8Fj6kmg1VXOgjbprZ+QSAcwv1zTRjj8sVk/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:wGS5fqtrON1Iy+qfbT2XEELj7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: =?us-ascii?q?9a23=3AhWBV2Gkirgen8EYRQwk2jzXMXvXXOXb/nHqXLn6?=
 =?us-ascii?q?eNXZKYYTOYF6p3Y98rPM7zg=3D=3D?=
X-Talos-MUID: 9a23:LtVm8wXky5aNPTvq/B3BjmgyJoBF37TwVmAogK9diemOGSMlbg==
X-IronPort-AV: E=Sophos;i="6.03,196,1694750400"; 
   d="scan'208";a="124320247"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcrLbaiP2XnifDKlzBEQtrJV/bH7exmlCT/H985Qjw50WkskoAiiLEReMXYIh0J9W8E5TvTdhIUJVmIz/FQpl11+s3/RKSm1ZGOZVY0egGjpeMf+JiMpuRNSeGDGoJs5VOxZ2nZaiqLZrISmBkaosdWEcGswIUpqUgTiAgOpfcSQ86tMtXEhadJqoArD7u0I6wQ9kMmnqr2EvCZd6zlc82KuX7aReGAK4IT4BltAxd3tW0ivQ3yN9suJgpHNm10Zp2i2lT1AMIjlB1Ur04D9bBKH8NnYQy5NmmUwD2SOoL4wp3sNEio+Olc3sAD5nx5E4eaptJC0Aj1wl/xBIS5Ypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHP9YXezTIkQHtH/UNEzKdM20E7PMa/NJKdQERuHM9E=;
 b=bACGk5fVjt01+PQVE0X/4s442CU5y5m+JLoWMmUaXmZJ28KmUa1Gz6inL916aHPyTeSe24ewFrUjGpBedknCFKG6zlwkYb4DnJLpC4s4gaS2pIQ2cmRrKn0q7f+QJ0+QM5XsGNi1CLUz4rIwG0YBDTQfngftpNPuVMyvHnPgvzClaV/jxxaIoPKg2BlvVvJyGmQZ9Y7FgHzZXm5nhMKwPVrUrhK8e+cy5uR7daClqPJ47/zZHtr7ZtEuPjpBFJqvb/0SN0nsgbZfXrQPT/3SI/xYTGjw88akp2NWKY/8U/txLrZaTP/vhnDB9h2eElSY5rTLKMNeZhWcZKoKIq1Rdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHP9YXezTIkQHtH/UNEzKdM20E7PMa/NJKdQERuHM9E=;
 b=DosiymIreEc96ttB2UoGw7JEvP+ljRaaP3V6cCoEOu+vrEESwrxsHQHoew6XTwShe2Kd+QTntnfush7G3gzLKq7UBXlpZzCFJieTf+z8jzjhP4oGi9oR3HoVzKuHhF8+/6gm1r9QbJ4eGzYmze8bdEnw3cqlGgL4LkZ8HTwrU8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Oct 2023 09:15:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 01/10] mem_sharing/fork: do not attempt to populate
 vcpu_info page
Message-ID: <ZRu_gfHVsytln_-p@MacBookPdeRoger>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-2-roger.pau@citrix.com>
 <CABfawhm2XMmfyx7vZvGdLZcot3=Mrrx3T5nS3vUR+Ur9j5mkWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhm2XMmfyx7vZvGdLZcot3=Mrrx3T5nS3vUR+Ur9j5mkWg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SA0PR03MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 986b2af9-b6f9-4599-12bb-08dbc3e08014
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+S0P6M850NiUkNz7MSQyszCVAxxRVRNeJg8sIU612ufia2KzsGwxXVxBBexIkjO4U2gurWfT5plXB11gEWnv9bLL9jPstwBuh8yaHDyrPOm5bACMmWT6cm7T6DxJOPbLElFhXphzLaKAC68lg84RhbxlmMiH4I25KpkuClZM75oBLqZKo4OCstxCB4dnHX75+tf0+I/LIKJ8ld8IfpfkrNpqxhW56d/p2UWv+jXgVPQYKzbU700lthLhEZkculZxZaWH2gijl+fbt35lEymUQYpwncRPE03JUeq+CDYeFKjJmlP+xBbdMeLY23DTpxQlzPLQgVDknncH5F4o2I2HaEPSjnMSkU55pUyQj6SfgUDqGySLrZehIDnc/dmZkhlofbLXttO53uiT5q5ZUQ1r6guOmSKH0T9xqzVKjzspSmq+tQqMbABtRVH2N3fRH4MhjCl1QurdVacTIURvHHbx1Y4iEZ2YjIfhJks90X6mqBBxPGUFA7K8JhlsqOR91Qhe1xezTBVOG5+HgbBbfFwvvdCa0I56xFMgmZd3RnZVMn0FX0DQa761FgeYPrg+zQNX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(26005)(33716001)(83380400001)(38100700002)(82960400001)(85182001)(86362001)(316002)(54906003)(8676002)(5660300002)(8936002)(4326008)(6916009)(41300700001)(66556008)(66476007)(66946007)(2906002)(6666004)(53546011)(6506007)(9686003)(6512007)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2pjNXBodDB3ZnF0UjB5c28wOThZV3BBV2lucnk4Lzh5SnVRZkdzOXRURU95?=
 =?utf-8?B?ZzdBVGtJdll3M21JSUNWaEg4aTRFK096N3hwU2tkSDZtMzcxRURVNS9OdXEw?=
 =?utf-8?B?bDYxRTNrYS90dlFJbnJoRFVmR0ZSM1FKUm8yblRRRmxpQU12Qm43T2RxYko3?=
 =?utf-8?B?N0lQeDh0MWgwM3BKeXU1NzhmM0RPVUtEN3pEYzhiNTg4R2l2QUxWOUQwTDhD?=
 =?utf-8?B?RTh4bUZleDhUSWRxZ3E5RHRPVXA2MDYzUERhMHZ3NlFhdlh4cU9mV2RNY0VN?=
 =?utf-8?B?Q3ZmMlB3TGxWZVZmUnpWL1d1eUFMS2xPV041LzZiQVpxVXE1YXg4eXVGZmt0?=
 =?utf-8?B?OEJYekpzbjQvNmN4QkE0Z3ZkNFBDNGMzTzRpUi8rVytDVHJKeEFQUlUzazNW?=
 =?utf-8?B?a1BueVh4SmdkQUd5bE8veDZGenU4ZXpYdk5CSlFCQm5SMmhqRXpJYjgvTGdB?=
 =?utf-8?B?MU16L05GZ2FlaEdSdFZYaE40VThIYTFkbWozUzJtL0VFME51WVpCSHlLOWNE?=
 =?utf-8?B?ZC9iUDZBSjNhNGRFY0JWTllkeG9vNU1GcEJ4T3lFdDhab1RUdzFTNzMyRWZI?=
 =?utf-8?B?QkFrZXJrbzRzeDVLVXk1cGZ1Q0tsa3VtNGF3UGJxaWFUalo4WHhFNCtMdTcx?=
 =?utf-8?B?V2hGMFkrKzFVc0k1MWNJckVEanJ0dUNJcDNuS25jRXNDem02Q0pBSndEV3o3?=
 =?utf-8?B?bno5SHErbXVPbGMxSkVtNkcxbGdTK2FqajRZcTY5bjdjalR3UWIzMVI2UTU2?=
 =?utf-8?B?OXBiRFhVckhDYVo0bm55R20rd01lYXp3TS9mWG5WWFFuTW11UGsreXQ0dHVk?=
 =?utf-8?B?TlZCeWxvOFVSMjRDYVJ4NEhUZTVEOXBGcmJZYTZlUlU2MURRTnBrVElDQzhD?=
 =?utf-8?B?WGFVSlJGU0ZFY2FhelluekVWOGlYVmRZd3I5Z1lrbXhNT0R5aGwxS0hYQ2Zq?=
 =?utf-8?B?VVd2WUxUSkthZHc5aXhkQzFDcXJ5blUzRUhZdWJCYzdvM1RmS0QyejdXemt4?=
 =?utf-8?B?SjNBRjdiNWt0S1JQbFcrcmMyWW1MWllzaFhNUktsQXAxaDdkUnFXWW9WSHBD?=
 =?utf-8?B?MUhQTjd0dWtsZk85R1E4S0lySWd5STRoSXAvbTFvM0YvTWZYNThmbmZ3YkVS?=
 =?utf-8?B?cmtWM2hRd2N2RDZHWHdLenVNSGdQd3BqemFPbTRnYWZ3VzRrelgzL1BVcksv?=
 =?utf-8?B?Q2doSnJ6dVBJSFZwMmp0S1BwSTNZYzRENEV3SmpNRnphMTZQVFlTV0FJbFky?=
 =?utf-8?B?cG40Z0dOR3NhbFVvRjVMSkkyQkxCbktyZzBoQndtSWZJOElIWlhUMjJqakFl?=
 =?utf-8?B?RzBGK2UwV0c0Kzl2dWtLZHA3NkpwK3F5NUczSU5ORHhCRFVyZ1A2aXlhNS91?=
 =?utf-8?B?SndNUWswelhVRE5uT3d3TFRETkp0bTJrNmVsVjhmcmRzMHY3OVdWMXN4WGl0?=
 =?utf-8?B?UU1HNjY3Y0RuYnZpdVBxbUFGNUtmNWh2ZkFZUklTWkVFZHBUVU5tS2xpenVS?=
 =?utf-8?B?RVFGcXFmUmo1b1VuTktMWm5FMHo1dFlPUlF1TTVjS01NU1JPRGRQZ0hkN3ZU?=
 =?utf-8?B?eitsanBsTmFXNGtJbW96RXBHdU02UVJOYlpoNXliUExoTUlUK2lwcVdZT1A2?=
 =?utf-8?B?b1BLdEFXMVlWUzBwZkRjZmY3WGh5Z1IvL1Y0OVpaL3AwQTRaTUU0Z2lRL3Fh?=
 =?utf-8?B?dmRudDVsNU1qSjNuKzV5TS9uZVp4UmVxOXNUaU1keEtZNTNpUHdQNk1NZU1P?=
 =?utf-8?B?Zi80SzJaK2hiSjUwZmNxREFqOXpwalk2b2dLazdZamdiVHFTSjhkTzRmbnJF?=
 =?utf-8?B?cXdCR0RtK2NySXliYmQ4MWUrc3JXS1BOWVRpQUZrenVEQm84cjlEREIzY0J6?=
 =?utf-8?B?OHdDeUgxVEtiVVFmWUxEQ3UrbTc2S3RXeHZIZFR6R3ppQURtNkxSc0RQR2sr?=
 =?utf-8?B?aUwwV253T3lJVFNnbzZBM3FZL01hM3BFTmJXNFJLeGRRdTRsK2JwY0wraHRC?=
 =?utf-8?B?Y3JyQmVlZGNGSGVveS9xVmhoUFZEN2hRb0VmMlIrQlVLNWJPb1VJcEJQN3Jw?=
 =?utf-8?B?UytYWTlER3FsT0h0SkFZbHVFSFhxUWJyUU5md1A1RFNLMHA5cGJkK1dDdVlB?=
 =?utf-8?B?WUE1VnVpeHl0SmpNV2lNVUVpQmY5d3dBKzlGbWJycVl3Rk54bHl3QkVuR2pz?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e3BCRQAUzHusEmfKKQBwHJEY7vMPMXA7zGcqPyhQpNf7Xsh19IcuKKLcHY6Roufwc5G8cU1plyhlC35iAQckxesoFqJmZYYmp4pruIzrOqmBdxBXH7mfIwZ8o+laxkVqoX9WlqXZi5fI1/5WlhbVrtcJGBeCnvfFHaoMt2ahPKqAGJQdBtOoyp2bAXObCiyjB/5TA0c9Nk3tbRErceyoH07LDXTxOTm1SFrspdymHkrowz6MqxJIF0iHt6fA+TKo1PrMFpN4+4yVNCxb/T11wevFP1knOYIC41tBvlOvBMhWKJkDxuHCj/1s3+Wtb445gI5wU/xlfSQQ7SAYz3NIhH2YyKG2LZ+UjRx+BMtygtJOoF7mxDHCciubqWdvlZ7kDI5Re0I89O20UOjZcm0Il8x5gf6UyqN7uMSmCubHFt6fyjAhrXWQzb2ki52kT6Wfdtb88SY58oIyTnTL2blp6+2itI/8b/j++RFMCRo6Pvm0zgB4LMwBLEIOELr1pwTc2pFAz0Ej/1bWrDQC8K4xdFSVE+mL5ZoDXdL1k01Sr38n5hDrTgtQsvVOwVIeDmWZ5yKTm5Q03p7qj1s2MI1xz+cPHUKcAzCtp2dvGsQXJsvO6BpxwDgk5XxzhxVraJ70N8TzhcQOCokDMIENMQx10y9IxfqyHkjuy4xVPuGqVjYzWn3LzIwCmIn2p6V9u4YqBDnJ577x2E3KSKL3QCAma7EFTUbv9b9soMzSZSJorYxWdxfyoOL77DN6aLU6yrPNJLf6HZYEE98b8xZyqP6E8SFmJFXY1hemnKJxHkYNGg6uENTJLwyGwOT8nNuHuRxR4clzDO710ntmQ82fvIk1I8ntW4V/QXGV/7PzBbRmg8DmgnOD37jG7Wc61m3LHbNe
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986b2af9-b6f9-4599-12bb-08dbc3e08014
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 07:15:19.5368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kly59IHZ6Lb/C1BhkQGIPpFZyAuiN70jD+I95WUyGnv+dEaP2LD+1D1EZrzU0favz20Itsw3shuXnbN9AjT5yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5628

On Mon, Oct 02, 2023 at 01:05:24PM -0400, Tamas K Lengyel wrote:
> On Mon, Oct 2, 2023 at 11:12 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > Instead let map_vcpu_info() and it's call to get_page_from_gfn()
> > populate the page in the child as needed.  Also remove the bogus
> > copy_domain_page(): should be placed before the call to map_vcpu_info(),
> > as the later can update the contents of the vcpu_info page.
> >
> > Note that this eliminates a bug in copy_vcpu_settings(): The function did
> > allocate a new page regardless of the GFN already having a mapping, thus in
> > particular breaking the case of two vCPU-s having their info areas on the same
> > page.
> >
> > Fixes: 41548c5472a3 ('mem_sharing: VM forking')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Only build tested.
> 
> So this will allocate & map a page in, but its content won't be
> matching that of the parent. Is that not an issue? If there is no
> state on this page the guest is going to rely on, it looks fine to me.
> But if the guest may expect a certain state to be already setup on
> this page we could run into weird issues in the fork, no?

mem_sharing_fork_page() will do the copy from the parent, and this is
what gets called from get_page_from_gfn().

map_vcpu_info() might change some of the vcpu_info contents when
compared to the parent, but such changes could also happen without the
fork, and the guest should be able to handle it just like any update
to vcpu_info.  There will likely be an spurious event channel upcall
injected depending on the delivery method selected by the guest, but
again this could also happen without the fork taking place.

Thanks, Roger.


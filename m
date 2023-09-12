Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC279CC46
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600215.935861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg00A-0008PH-Py; Tue, 12 Sep 2023 09:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600215.935861; Tue, 12 Sep 2023 09:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg00A-0008Ie-Lx; Tue, 12 Sep 2023 09:48:10 +0000
Received: by outflank-mailman (input) for mailman id 600215;
 Tue, 12 Sep 2023 09:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIu2=E4=citrix.com=prvs=6128f91ed=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qfzrH-0008Jk-Ed
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302d05b1-5150-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 11:38:56 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Sep 2023 05:38:52 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6962.namprd03.prod.outlook.com (2603:10b6:a03:430::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 09:38:50 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:38:50 +0000
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
X-Inumbo-ID: 302d05b1-5150-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694511536;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sVgNWibj/xft+ODTKXvmfQPRsftM27mryFZiMF1Khig=;
  b=PLGxSQ5fiWwCPLMdHlntXzHI2TLKFNA4piKOWZlL/BUB/FoTTOhkCLej
   IoyNTTLS9RLbME2TsUY1y+rlsOiDfayx3+7ShlddaCXmBEdR6jCt0uvYV
   ZYQhlulrrctMPQ3/pKyWHr077/SDZlbXaOiDTFxLtwYegghjl8LDwaMgN
   Q=;
X-CSE-ConnectionGUID: vT+3jjhoTdCU2Hv6OV3yYg==
X-CSE-MsgGUID: RXNMYJXaS7edDmarXS4R7w==
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 122379131
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:CZQdVa80svhHVVUOZqU3DrUDGH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GYdUGCGPK6MNzPyfYwgbY2+8xxVvJeBy9RjQFdorCs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKkR5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklQy
 b9DKjINaSyPrN/s4Kzlbdc3l/UseZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUuiNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVx3ikCdtJTdVU8NZQsHu2904jASZJWFeXpPCjunXiYY1Af
 hl8Fi0G6PJaGFaQZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neSntbuAxRutqOUUnOX8rqIrTK0NjMRJGVEbigBJSMO5NzmoZ0vgwjUZsZuFravid/4Ei22x
 CqFxAA7jq8WhNQG1I26+07GmDOmopXVTg8z6R7TV2jj5QR8DKa1aort5VXF4PJoKIeCUkLHr
 HUCg9KZ7u0FEdeKjiPlaPkCGKGB4/eDLSHGhlhuD98t+lyQF2WLeIlR5HRyIRlvO8NdIzvxO
 haM4UVW+YNZO2asYelveYWtBs82zK/mU9P4SvTTadkIaZ90HOOawBxTiYer9ziFuCARfWsXY
 v93re7E4a4mNJla
IronPort-HdrOrdr: A9a23:l2WIR6jGaSTijNS5gCh/NjFl3nBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-Talos-CUID: 9a23:Y1HJW2PhQuE4MO5DRhUkr0wWGscZflbgllfOfWiGUndYR+jA
X-Talos-MUID: 9a23:4JXm8AVM9ssLXX3q/AXcohRTFvdh2PujBGwImI82gJW+ajMlbg==
X-IronPort-AV: E=Sophos;i="6.02,139,1688443200"; 
   d="scan'208";a="122379131"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftmjGGzhs71EI5kxWe+6nBNgYGkN4fBPlyMvU/3OC+q+1uUZLg+HlqaXqIr+2SqWXbErEfp5TpTx7OP5lKzfuQpwkRA5r3hfOkwlzt64istkCnBd5o+ZdLrHy2UhxEzolHVC9sZK3T1lx1yFVwIg/ht/Itc+N/ZPLO1Pbd7us+3oySG0MJ94LUbnxetDhgFUwcslr+nYTKdkPV92B7Eus/pStiNJXh28HgmyKeI72vk+KT4SAmbFglRw7xHLK/1kubsjGIN6Xk31MWot43PAyGN4Rt/jtB09cztzP2xd4g66i2GawKy1rX/Y/jnJNENfAnPOy9iCwg9GtU7ZGJfU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKGehjcDFxDvafGb/YS+UFYDTsyd+QPlvnD0N4zYXmA=;
 b=h51KoXCyUjNepGuckNrS9ZVQJFqUUIe9R3WOQZAd8hkaJJ8cTpUiKasNW27LsAinA3GBR8pLXVcZJVeJzU1zmVKeEqxzgVWMHRkM/5QhWrK+7cyIOBOkhB8BPH0lnPZIV+HtgHlCwR3rTuz4Nn/w6qZk430fFv1r1Sn2ZnyvlYPMHdGvkOj/bSmU/sHNZKIIg3DQdSNZS4u6QL6S981WFK9pG4jWcLg1WVTUG/Gyj5t6zBudZpQshqil1yjSxyDtSoDDlXBm2wYQgDFd4twyUZXqsf3p7rHHr3lBtZcBRh0VoeYT8lAloJQNrOA0VVxH5xn/2h2DvjpA0Y9Z1/TPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKGehjcDFxDvafGb/YS+UFYDTsyd+QPlvnD0N4zYXmA=;
 b=uIKvor1I+NEJ+pG6DNvZI9WmYlEvWBqhjhze6byDhgVkJHxE5TYwlK4pMDeUiggCo7ZWtugd5HtWhZiee2EE2+v4jB+UwWzTx9Pm7qGjriUqMToWukfaSRyyBHa9CiZ7+2gMEGxNRGViTKVsMbJepWbt5DQU/+I2FwHPNkrq7wI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 12 Sep 2023 11:38:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	"committers@xenproject.org" <committers@xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Message-ID: <ZQAxLuMqLwiBWhKy@MacBook-MacBook-Pro-de-Roger.local>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
 <alpine.DEB.2.22.394.2309111534030.1847660@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2309111534030.1847660@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO2P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c2d10d-e269-45a1-f90a-08dbb3741203
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	foszqKCGuN/iDLEzj+Z32nW853029vDXuDbsSvw98dr7f60mpPtdaenfMimKsKFmRb1nLefEY49k363sfzuUkSmrydKbBARuesHRHF5ej56QJjsgSX/bGP7lBGH00q1oJbT5Sj762VhTPuMwCWCZnRz9SqhQs97eXLOLkbY4H1JnzkUULHJNIibKTWlVqrRgK4fB/u5iIUMJq70ghMztE02IDgTA7c9y8QBgGkZorKFyVpq7pX7gXSFEHKWBMgG3rbFVAXRNoPyAhwod4tX+G6dcsTaCQc3zsxrnd4NgLmgPkUpFQ1Qe/zPvVj+B/DPDVuEz13FNfkb+dvPu8pjKsqQmNjERe9/PBZGU0rL+fmDD5bwsTmszT1+FTZQCC8vDf+YZfchFjln0Umsfk3xMvyhePWabJS2j36pnWjM4XrOx7D7LGsNEMDP7eMiJ7i2k4VP8MyPtKNWneLFxPsTraexmpeXRJgMuMPuZPvdeC2JkoRnYNzBqYv9rsg7TiGkD3/7KKGBmZGjP5BSWRXOapAXabx1i+CfLCsg3k58T72qtWhFi4z4181zn+CSimIPa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(186009)(451199024)(1800799009)(83380400001)(82960400001)(6512007)(9686003)(5660300002)(66476007)(8936002)(6916009)(85182001)(8676002)(54906003)(2906002)(66556008)(41300700001)(316002)(86362001)(4326008)(66946007)(478600001)(6506007)(6486002)(6666004)(38100700002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2dQVU5PdHV5cVNrUzBOT1E0bTFHdHM2c3NRU00wUkp4ZzE1eFpwQmk0d1hP?=
 =?utf-8?B?UG82NVFpRWdBRXVuOGZrSmZXYUFnYjU2SWtvZnJ4SE1aKytxcU5rVVFTWjVI?=
 =?utf-8?B?S1ZReDVGV2ZtN3BMS0JPNkRPdGhmWnE0ekxXeU9QdGx4STBTOTVzUE9pUGFX?=
 =?utf-8?B?MWN1M3FLc0NGVVJySllNSGU2SklLYTR5U1FlNWdhd3dWWjgzcTkrTjJWMXVs?=
 =?utf-8?B?Z3pPc1hkd1F0TWJOTzd1VFBsYmw3QWlTZTc1YklkZ2w5eENtOGkyYWhGSUNn?=
 =?utf-8?B?eExxbTVZZXE1UThMaks0WjZYSDRaemNYZTdOb296RGNtNlR0YVlnR3pPREdK?=
 =?utf-8?B?TngvZnFzUDBhNU52bGZnd3NCMjdWRUdoZnM4aXJFb2JCRWhldDFoZnlCaldF?=
 =?utf-8?B?eFN6U0U4b01iUml1WFY0YTc3RzVWaytmWFQzK0xETHFsZW9BdWlzeXIzWUFu?=
 =?utf-8?B?NEx4N3RSNU1rcGFORGNTekVTUXJIcmlYNDBPaFp6azc4aUcwWm5MVzBOcHN4?=
 =?utf-8?B?RDhhc0drTW01S053QjJDQ0VHamhYdFg1eEZobmhoVWdvZnFBL2FxczNYTnd3?=
 =?utf-8?B?Q3RCbkR0KzVHZ0hCcG9jZE0rWXRmRFlVVERFZUJ3aU5KeUhKZ1NUZHc2Z1pj?=
 =?utf-8?B?cW13L0NjdndjeEJVL1ZrNmR6TmgrZWdCZ3lpbEJla2MvZDRIbnQxYkVla090?=
 =?utf-8?B?TTRtU1kyalNoVnRwaUp2Z1VxK2VVZlBPaUt3cExmdHk4K1d0WDF5aEE1Z1Zo?=
 =?utf-8?B?d0t6UFRSRFFnQ25IOHVmb1A0dkk5RVRreGVURkVaL0hQSDJYOCtRYjRxRXFV?=
 =?utf-8?B?UlQ0RjlxSFdZMHJna0JUcUp2UUJqL2d6QlB2N25NdjZVRWVaVHdmeVVZV1Yy?=
 =?utf-8?B?RnFBejBnNy9lR1QrSGVBUmhtM2I4aE50QkZ4c3doeVZtRjhlNkJHWml0eWZG?=
 =?utf-8?B?bWtYZ1BrZTl2ZEp6ZkhVakswVFdWZjdGbm11bEFIamtNRWdkZ3U4MmV1K0Zn?=
 =?utf-8?B?TXdwSGZXSTNGVEtXQTZhL0syME9lRlRrWDhzclE0aFBUanFEVjdldThHMmtv?=
 =?utf-8?B?YkkzSVBxdHBPd05leTNrQzBhanZjSjhZc0JWdVAyaUFFak8yb1l3UituUC9X?=
 =?utf-8?B?WUpuWjBFVDlRSDdQZlU2b1JzVkdiUTAxbWwyTUp0amROYTFEcFVYd21lZFJY?=
 =?utf-8?B?WkVNRmZFVUZWdWFlUFkxcFBDaDNYTDZsVzR0QmpZUFF0UTBjUjZMVGMrNkdn?=
 =?utf-8?B?Y0MydmFURnZzVC9yYzd5TXRWeVgzZGs1d3dJRE1UUjJ2L2RPZjBPNzFDKzFt?=
 =?utf-8?B?N3M5S2FnY3dQQWJqcUM2aisyeUIwL3F4L0FZL1lIbk05cFNYdG5neVFkRWZt?=
 =?utf-8?B?dmVvTlp4STRDY1BndFBRMjMvRUg2QkNCZnpCM0dJejRJZWxNbWdOUGFzZ1BS?=
 =?utf-8?B?L0s2VEJCNjNKM0x5cFJESFE4aVBMM3dJQk5zRFBHRDExdmd5bSthbWJjUStW?=
 =?utf-8?B?MHRkZ1gvR0FOZ3BsMkR2blJPbXdZd21nOWhRWm5GN21pbWRJbnpFTnQ4clNh?=
 =?utf-8?B?OUZTekUrNmd3aEVESnNPYWdaV29IR0dDcWVNQkFMWUhRNTJPbzg5WGF3M2JX?=
 =?utf-8?B?eGhBWXJ3ZFgrOHBJbUNuQVVkZWU1dWJnRUJha2xRVVBsOEo3MC94bm5Oekxj?=
 =?utf-8?B?OTMxajlTajc4Wi9teGZLQzZHbm11enEwQ1RNQk1udnk4WHFTMmZCRFhzMU91?=
 =?utf-8?B?SllPcjZOQlU3ZDVTRWhNQ250N0lqKzB0c2J3a0RyOWFneGpsWVdsazgzZXEv?=
 =?utf-8?B?dTk1RHBONEpVRnFNRHh1dlJBN2dSdk9zdDR4R1lQaVR4dkVrVnFxbTBnc0Vm?=
 =?utf-8?B?a1UwajlmcUE4MGRrSEhpZmVlMk85MU9adEJUQ2UvajdmQkNCbm95a1EwV2JG?=
 =?utf-8?B?eTdKZm5ySU51Vm5mWDZyTlBmbkR0ZzBCU0NMaTExWXZ3amZXTXhxUjVneW5H?=
 =?utf-8?B?RG1Yck1nckFKeFp1L1ppNFc0ZkNock5jTWkwMjJaV0l0YzRjSk9JaEdSMjVl?=
 =?utf-8?B?TVRkQWNPUjhVYzhuMHltQjlwbVIxbU1FY2xadjJIUUlKQW5MYXBXN0dJVnAv?=
 =?utf-8?B?UmVscTZqaTJqZ0JZb1ZkL3I5cHAzYnNhdkZCakhmWDg5bGkyd2VUNVhTc3o3?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?SWZHWmhsN0hPQkdRb3NIWkcxR052OWpUTU5DV2w2a0lJNXQ2Yy93SXY4OWtv?=
 =?utf-8?B?MEY1Nzc4YUtTSWNyTUZLYXN2TmN1d0dpenozeFhrNDIvV0VNOFU5K2JHZFBO?=
 =?utf-8?B?RXlielB0clJFN3gvMmZ1d0s1R0R0NHQzM29hSnU1Z1BSOG5pd0tMUUNUNndV?=
 =?utf-8?B?L1lrckpyenFkNWxWeTVjSGtZMGVURWxIWkpRTk9GTGxZZng5OWRWTnpYdi80?=
 =?utf-8?B?amREMmNWcU1BUmwyK2l0ek1saWtUTThudmdFbGF0MVNXRXUvRHVRdXVpeW5Q?=
 =?utf-8?B?WGsxTTB4S3lwaE4wVlNqdnZyamZrM3h6Y3BoRUNnYTFHMTFqYXJETEpKc1JJ?=
 =?utf-8?B?R2FPU2tQSUJPTHI4TlAwL1dPODR2V05nUW0zWjZyTGkvV0k1YkY0M1F4UVk4?=
 =?utf-8?B?UWpJZVB0b0tYTXEvRVArRnFuTEh4NUdMbHlsbCtlMlV5UWtyRyt5aUdmazFo?=
 =?utf-8?B?bG9MUE1oRVV6OVZlZU5XRFBvR1NmTVZPZUxha1cvVTQybnhCOTRGZE5sb1dL?=
 =?utf-8?B?TzBaaVRvRklhQkIzREN4Q1dtbkszVFllR25odU5kVWlmVjJQKzJsdUpVdXUy?=
 =?utf-8?B?eTNVejFvYmNualZIY210aEVBOHJ0UXFCbXYxR3JoaklUdElRVkFjc3NiRkU4?=
 =?utf-8?B?L0pUR05aMVp3SEF2SE55TmZiVHNoL0w3RGQxMGgyTnFPbnJBQ3VVNXgxMWpY?=
 =?utf-8?B?cUpSMGpML2E4OFpxY3F2eXFzckZPZG9SRFp5cEhqWGVMRUpqY3NHa2w5bUd4?=
 =?utf-8?B?RkxFVEFGcVhiY0pSamFXbnN4dGxrbXYrOG5DRFVseElNOG4rMVJGQkxSRXIv?=
 =?utf-8?B?MHF3U1BCNTJ4bFBPSFY3UlVFTUZUeldvYjlabjU0c3BLKzFTVFhqWEFOUWVC?=
 =?utf-8?B?Z1FNRlRSZlZRc1VYMHRrWGZOeHdOOUZackttOGowTWtQcWpYSHN3RWpNQkkv?=
 =?utf-8?B?OFBrSExoSGdZa2RlZE5IKzV1YVY0YzNDVjVjWVR3SVNsRlZCeE9FanVnTlZk?=
 =?utf-8?B?YndZSWxZNnhFMURRR0doNVlqNzR4cE5XcFk1UkZpd0VQd3JzSkdZT1lGNG95?=
 =?utf-8?B?Z1QxNC9DVk5ZU2QwVjU5R0VYeGRBTFFrZ3BaQkxvamhuYzZ3NzBjQVN1T1hF?=
 =?utf-8?B?NlVuOS9ZOWdvbFpTVTJUWUlmSEkzS3NGR3VnbktsenpneFgrZndZU2o2M2ww?=
 =?utf-8?B?MjFNNEl0QUFjQXRVNjNMbytsR3lMQ2ZGY2c5QVo1Q21kdVFYa1Y1cWZ6RzY4?=
 =?utf-8?B?TC9Xd05mNGxOOEgvOGJYYnErN2hvUlZtZkhpQUV4ZzAxQTlsdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c2d10d-e269-45a1-f90a-08dbb3741203
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:38:50.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPTGBSbME1gGzjMIoU5cKtzJLN0Eca7kH56xIxyTIF7DAO/Z4MNO8qW4qfh5rkatpYNf0NSRRc4gzR4nJIV66g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6962

On Mon, Sep 11, 2023 at 03:38:05PM -0700, Stefano Stabellini wrote:
> On Mon, 11 Sep 2023, Andrew Cooper wrote:
> > Physical CPU Hotplug does not pass the bar for being anything more than
> > experimental.  It's absolutely not tech-preview level because the only
> > demo it has had in an environment (admittedly virtual) which does
> > implement the spec in a usable way demonstrates that it doesn't function.
> > 
> > The fact no-one has noticed until now shows that the feature isn't used,
> > which comes back around full circle to the fact that Intel never made it
> > work and never shipped it.
> 
> So we actually have agreement on how to move forward
> 
> ---
> SUPPORT: downgrade Physical CPU Hotplug to Experimental
> 
> The feature is not commonly used, and we don't have hardware to test it,
> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> members.

We could use QEMU to test, so it's not impossible to test, just that
AFAICT there aren't (that m)any users of it.

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 3461f5cf2f..02e2f6eaa8 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -48,7 +48,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
>  
>  ### Physical CPU Hotplug

I think it would be clearer to rename this to "ACPI CPU Hotplug", as
to not be confused with the late CPU bringup done by the pvshim.

Thanks, Roger.


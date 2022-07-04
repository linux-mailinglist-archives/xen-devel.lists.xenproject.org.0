Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019605651B9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 12:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360126.589497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IzK-000862-GL; Mon, 04 Jul 2022 10:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360126.589497; Mon, 04 Jul 2022 10:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IzK-00084G-CN; Mon, 04 Jul 2022 10:07:30 +0000
Received: by outflank-mailman (input) for mailman id 360126;
 Mon, 04 Jul 2022 10:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Xk=XJ=citrix.com=prvs=1776e108b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o8IzI-00084A-Eg
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 10:07:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1946af4a-fb81-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 12:07:25 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 06:07:20 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH0PR03MB5987.namprd03.prod.outlook.com (2603:10b6:610:e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 10:07:19 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 10:07:18 +0000
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
X-Inumbo-ID: 1946af4a-fb81-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656929245;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rJ/JhJWFXZCOroLn+n3FdEA+T6RlqhtkAgrakPFEtEY=;
  b=Kf5Bp/1olrcvQYO754fKuD0HbdqxNTYSdOTdsN6hQ6Qp2PUwflYYsgKe
   o/hROC39izwQLQSqSd2XnuMXmkvfWXpUeBrjN7h+p2b8xnqwHFIhtDtzB
   x8KuPJrSiL8PRhXqp7DkWF8RQbOZtoBv7sk37YzqBAlVxPjfuz5bjLxzV
   k=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 74346089
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d0r7kKgll72qgDQG4v8fb8KQX161ehEKZh0ujC45NGQN5FlHY01je
 htvDWnXO/3fY2ehe492aIix8kxQu8WBztJhT1Bv+C03QS4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXFvW4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRlxO4rWn8khaSl/Fx5RDKpi37TIGFHq5KR/z2WeG5ft69NHKRhveKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIAehWhv7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9w7O+fRvszm7IApZ+uLkM+H8V9uwWsAWgB+xq
 V7f72LbK0RPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7CgAQE12yovC7i0u3c9NZN
 0EQvCEpqMAa90G1T9+7QxyxplaFuAIRX5xbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoISFUD6ty6+YUr1EuQEZBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:VHXgBq9z2jAjC3cRpShuk+FEdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 yhDo0tnUvRRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIG/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF9nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1sop5PzuN+d3B+3Z
 W7Dk1ZrsAwciYoV9MNOA4ge7rCNoWfe2O6DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="scan'208";a="74346089"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TycFsGFoe/nTc8KuMZyDkXjig+t9QQulxO9PkJM0XvGTolDWnBguPlKaNraqwl0ogDVRGV1y0+2Oc6ogLh64OM9+7NcGippoFUFVcH/NkArEDcup3pmgUEnObRBXQWQIL8YtLn893vjmscjSHGE5jltVW3WhwrkXHqUrccdjpD7YZtwFLs/GtYcNZ9B/c166+37lUEudqrjhn2azStdpZMpD5SRRKp02EEuzIYJZgN/yp4CxIBWaKPOLo0dgualC2CyVNBZvfjRHGGwzObQ2Sb8JqacoUrgWEGUobKW9B2iYJ1jtRwFqY4nSwr8IcX7NyDrIXWOVf4GYp0K7JEhL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/eoU4HS7oUI5jbCrKJ6hYEphK9oyK1oMtredb0lIVU=;
 b=MP9Ka3aAoLekPKy+XkbT/nNUMSr/dqLGavHHzUZEPJ5DPvDDMeXO7xq8oHygaFHCRoRSlhhPaowDbzQeLm0pQEmqwQMybq5LhMBF9Jq8g4611iNYOg3zZge39aFvgiWTBUg49GLTzh3uvl8wjBamTKv6MBQidLHgnhbXdMJJRhPGYODzFlRAODFB6Bf49pVzfmmnja5S+xIrLbFnkRZ1FV0dnBnNgK8Z2uTlUq2IH4M/x+ASa+Qc6FEToSnuxWTGxXhryLGmKgJIafoo1x1lUlhEqGvyk9yPx1CBU7ApnmJ2cdERi9HZK860utYE8P0m+eoiwDU/UPTix6SDVbiVwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/eoU4HS7oUI5jbCrKJ6hYEphK9oyK1oMtredb0lIVU=;
 b=kC2zWGR3gf/P1etpUk8xjrIkJbNa2SaP53534TIH0+Mk4bHbDGVrSpLz5Tk5aHxOw5UVSzzvj9LVfAzEwY7pkJZthZycRcGG+NnxP8+3nhg9clvZ/G44lMqPcL1DVP39EUxQXruCRgDoaopsLKGWtCXUESvJbi0Ymz+7AdTMXek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 Jul 2022 12:07:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Message-ID: <YsK71YGh7hlTFuYm@MacBook-Air-de-Roger.local>
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-2-roger.pau@citrix.com>
 <325bbf52-3b56-4062-88b5-a04dc21404bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <325bbf52-3b56-4062-88b5-a04dc21404bc@suse.com>
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faae81be-7b2b-4ccc-d7c8-08da5da4fa47
X-MS-TrafficTypeDiagnostic: CH0PR03MB5987:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O9lBpsHn4nZLcWIK6bJJZsTSvxxQHuTtbNO9PjXKvAmwb0o0o+HZMhhjNt68iuvd8vVPGwBmrU79dvu8TAcMK7Mm7nrTLqEZc/s0cdVghIT61mpRwcq/BRBaFS9aNX7YVBIbQm9Gc1yAe+sS8yjPj47j9FMsMKPj0KrlzxWDaZo4cxtNbavhTDuTquz0M61voJpXeRiBkgWRQZluRVcGSkvnH9yQNIoNQ7AsDDWAAC9ngGkZAsmstPApmsez9ie1MssD+4BdYZ1KdXflkAbbK+TzoOUae1YqXixqCYtfDCeZbdPa0MzcZQHCj4mnZ0F+w2HRYQ9XedDKd9vWCOe9T6jzbggZAB3lWaPjuDh40ePrlSb+CDv5KJjLiSK+ANXnWQxWtOzM51tBX+8GoLD1fIJBAwAlhYNawyQ20SSP0ma0kYFE/E4jM0+veGjn0O2l9A68a7ElA4sQTl2oFVUDT1U+Mb2DpkFe4XsiEhW0QizyDsi6FM8IzRluAKmMp1FVwe7Q7QUCw1nwo2RM4l4rtHxCKPnSxown6puDLSoL7/qiOwN06WrnOPXMbe/R7y6ZjQY3X+oJ+0vCQgD97xPJxHcaHc/5EROA4JWHW/1IjMwBer04M8tKuxO0tOw1kFbiVvGRtQwSg+AB9gFXe3hjHpe1lQwK+IcVjSqflgsEuypAGsIkOHYv3E6IrOarVj+Ef0x5WWF62Wr6Ps62wp5IK0/W6at6dQOUsG44RUt+vao70TrtA7P7ViyJJkFc+DTDOk6QuDn73p5lkdhgftpuqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(5660300002)(9686003)(6512007)(8936002)(478600001)(6506007)(86362001)(82960400001)(53546011)(41300700001)(2906002)(38100700002)(26005)(85182001)(83380400001)(186003)(54906003)(6916009)(4326008)(316002)(66946007)(8676002)(66476007)(66556008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1F6SG5WRjZyWEZ1RFkzeDBZdDNCY1hIWjV2VHNnWkhrWW9Hd0hpdC91QzJz?=
 =?utf-8?B?T0ErcW9QSXBHaXVMNUZ0VG5tUmJrQ1RVY1BrOXpOVTlqNHE3VDZFWDV2cWlj?=
 =?utf-8?B?bEFNcWQ5VUR4WXFHZTArbFJwa1d6eHJYdW5PdFBhTWFhWXJYTndlVnpUZW9Y?=
 =?utf-8?B?YkRKUUZudkNUZ09VMElDcC92SFVFR1dIWGNFVkNOTmJJNlNBYUFUMjgxTW5t?=
 =?utf-8?B?NlVmbUN4Q2R4V2owYmJTMzNPNFAzNWVYNDZFQ1Jnd29HUFFQYUkydDVTSVFH?=
 =?utf-8?B?L0R2bjZSdjB3dFUxMWhGN0F1WFJsWmFJQkthWHYvOE9jbWJhQW1IekZUaDg3?=
 =?utf-8?B?V2pPM3NZUjY2aHdldUdMNUVNeldGbG1LeGVZWDk1QTNCMyt1SUtucktmRHRK?=
 =?utf-8?B?UlY2NytyUGhpdExlYXp0MVo2ejhGRkdEWDhIVmxoRkhoUDZ3bk0yVTVyRnYr?=
 =?utf-8?B?TUkrMDNvK2N3clFCanpEZ1RPN3BpMnhNUW5GVm4rdG80aHRubU1XV0ttRnlt?=
 =?utf-8?B?M2daU0ZWMDFUdVFYNUEwZFVQRmxvaTliWWNiYkM3djJYQ2VKMjFlYlAwakRW?=
 =?utf-8?B?azlLTE5Tb2lITERDTlZwZnRGWTQ5WVZIL01Jc3k1UnpPMC8wK1RLOHNZK1F3?=
 =?utf-8?B?TmFKc3o4Q3pjREJPK0plbkdvSUtSVjJHTXpZM1R0aHJUOUo1SnRLNHBYSklB?=
 =?utf-8?B?dHp2NE5lRys2U3MrREY4TGRSaHkzNG5USGVJY3lmOXl2OWh2d0cwc0g3SnJT?=
 =?utf-8?B?TEpHR1R5T1ViNHFqTk1USVJLeFFOOGlBWVp2MEV0aWlkaytDMGZLMHBuQjBS?=
 =?utf-8?B?cjNiZHZkNmZQUFA3WjQ5Nlc4VGVqdElVYVdueDR2d1F4ZXVobFVQQm9JL2JZ?=
 =?utf-8?B?cjQxWklNdEl5LzkwZ0ZmMHBNdHZORmY5a1g0MnhqRTFqQmtUdmlUSXdiUHZa?=
 =?utf-8?B?cEJIRUhDSDJ2N04ySE5IN3VaZjkzaXlxODhuWFhjVjVVckt4MzIzcno2Vms5?=
 =?utf-8?B?OUNSeFFrd084T0N2OURpakRDVnl2SVVTdDJaVE43YW0vMVVuaGZLdjVveWlp?=
 =?utf-8?B?eDB0YmVWelJDYlVjNlc4ME5lRnQ1Y0oweHpPVThNVys1aFAvZFR0a2x5QVBh?=
 =?utf-8?B?NmJJTGhOZEFjSTZkNWFqN3RPZDJTZHdKQXpYQkdQTXgvVUdHbEhjYXYwMnVP?=
 =?utf-8?B?a0tJbkN2STJsYkNhandzQzNVZHVOK1dFUWNXWXlUR2R6ZTAxNlVTZll6VVZU?=
 =?utf-8?B?WDB1Q1Q0ZzdpeHFUSTVtR1dEY09EYjhwRm83ZTBBTXJhRXJKRGVBdEN5Y0Va?=
 =?utf-8?B?ZXVyemJZSFZ6bjY4MG8yenU1U1VWdTZHRFc0bHVsZTNsM0dHL24xOG1zYTJ4?=
 =?utf-8?B?NUpiajZsVFJJM0xzb3hRMnpvSEg0NktHVXVZV28wL3VMZzlLL2RleW5tUEZN?=
 =?utf-8?B?ZzNya3pjNGpiOGxmYTM5aW5mQWpRamgrRTRWUlcyS1JUM2I2YTJsMTRUbkZ4?=
 =?utf-8?B?NFl6VjRFdTlBM2lNN1R6Sy9qQjE2UnB3Nm5JUkZBaXRkZEQweEM3RVZPTExR?=
 =?utf-8?B?OG9MZnI5bTJ6Zld5UHVYOWkyZ20wcVlUcWpIaEFNeWRuLzBEQjl5aXc0cHQw?=
 =?utf-8?B?MDRLUEVYMjI0SUwzeDYyUlJBMnpnVEFFVFZudjFuWTBjZGY5OFRmRkRSeEV0?=
 =?utf-8?B?c1g0VDBFUTE1Q0tDRnpTeWNkclVnNFpwWUFFMGpXemJQdVJ3UzdQbXZhTVpp?=
 =?utf-8?B?anVrc2EwYzFuSGdrN1ZyaHJxa082NGdqM2RZSTlIL01iREVBbHpUdVc2RzdK?=
 =?utf-8?B?Sk9pYzloMjBqeVJRTWJOTkFYL0o2dlFYYVVTS2ZXNFcvT2JDYmtDTTRYeE1Z?=
 =?utf-8?B?WVR4TkxrRjBiaEZRL0pPcTFSUjdqR2ZxQ01pcjhHYXhLblJGRWE4aSttTHd0?=
 =?utf-8?B?THkwbVEvTmpHQjFwZ1UwU29aYTJQdW05dmVlMnlSV21HRHRXREdWRUhUdXlR?=
 =?utf-8?B?aStQY2lacVBDVnVaNDRDQmpaZjBMUHc2RzRCMmNMVnZkREhoTjBaS2lxWlIr?=
 =?utf-8?B?TVUvN1ByS3dHZ25YQ01LZUNOY1lMK0N4VWlFUlhpRldBM0FRRm0yZHZmY2lB?=
 =?utf-8?Q?1Hz4yHIYTpNg6DL7w0DJHYt+n?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faae81be-7b2b-4ccc-d7c8-08da5da4fa47
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 10:07:18.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVBt0jaHwXzlg4nnbdepo4Xhew1yem1bXkeeTe/cfvDfzat//HW1pKKU8vderf1HXRyXIoaaQxVj2hga0ZhGFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5987

On Mon, Jul 04, 2022 at 11:27:37AM +0200, Jan Beulich wrote:
> On 01.07.2022 15:16, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -4065,6 +4065,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >  
> >      if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
> >          return vmx_failed_vmentry(exit_reason, regs);
> > +    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
> > +    {
> > +        perfc_incr(buslock);
> > +        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
> > +    }
> 
> To cover for the flag bit, don't you also need to mask it off in
> nvmx_idtv_handling()? Or (didn't go into detail with checking whether
> there aren't any counter indications) pass the exit reason there from
> vmx_vmexit_handler(), instead of re-reading it from the VMCS?

This seem to be an existing issue with nvmx_idtv_handling(), as it
should use just the low 16bits to check against the VM Exit reason
codes.

I can send a pre-patch to fix it, could pass exit reason from
vmx_vmexit_handler(), but I would still need to cast to uint16_t for
comparing against exit reason codes, as there's a jump into the 'out'
label before VMX_EXIT_REASONS_BUS_LOCK is masked out.

I think there's a similar issue with nvmx_n2_vmexit_handler() that
doesn't cast the value to uint16_t and is called before
VMX_EXIT_REASONS_BUS_LOCK is removed from exit reason.

Thanks, Roger.


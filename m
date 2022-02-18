Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8E84BBA29
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275434.471300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Qn-0006En-Ts; Fri, 18 Feb 2022 13:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275434.471300; Fri, 18 Feb 2022 13:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Qn-0006CY-QB; Fri, 18 Feb 2022 13:36:17 +0000
Received: by outflank-mailman (input) for mailman id 275434;
 Fri, 18 Feb 2022 13:36:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL3Qm-0006CK-3F
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:36:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd135f36-90bf-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 14:36:14 +0100 (CET)
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
X-Inumbo-ID: bd135f36-90bf-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645191374;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RNQ+X39j3WBOcf6XAmYjL4d8gDvIpgPH/GbrzvAZnE0=;
  b=VJFLt8zphc25YsKX2Ut+VDzzEtlY+vAhAod8pEQ+jfxezTtXeOPfoHDt
   3xeZydrPpRUe2N5UAvjaU5BlkMN7pmYRHOrl+HBGZ4U/zv2AZoXjSon/G
   URzR4ZpBPtCmIOwCY5ae+uRm/oFZpfuqnYw8WIqTZkeiEU0cqgmZfsd8u
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64921623
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fFQZFKIiC7ECzOMtFE+RHpUlxSXFcZb7ZxGr2PjKsXjdYENSg2dSy
 2dJXWGFOPyJY2P9LYp3aN+28hhSvcXXxoNlS1FlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Otxma7zDjd1BJaSotYhaj9hFSV4OqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls15oXQ6yFD
 yYfQWNBYSvubCdyAwsGE4wyubrzgCKiMBQN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IBQTXgrlieKjgUD4Xd9DQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4qje7hudB2MEZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwArEUMwJmg0ETE+vePRnLgVtxTLSNFsRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zsK4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yLyFWyzyGsnTKuMDiriUWa4C
 KM0kVkMjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwORPJhTy1wRRyyPtX1
 XKnnSCEVCdy5UNPlmfeegvg+eVzmnBWKZ37HvgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3yOfclzSMig5AF4tNL4mxU8G0eUXFQ/A81AoYJq17bdZcJ0yfLI98/dkw+IyR
 P4AE/hsyNwVItgb01zxtaXAkbE=
IronPort-HdrOrdr: A9a23:gd1tFKPwnatXh8BcT1n155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64921623"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXvcwjzvg23FCWONa9bJI007oRLCTehjQlvqZLcgGMSO0G+XMKvNvSf4RHzjF6mBDb1TB29UCJWgf0RCxg6YxyCwoI+BbPOPqU9CjFYkKY6hxdFF4KND3h2QG3xsMB1lW4uhlbQSlTFqL2W1UnESkHMtRHpHY4Hc+s4vJPhlNMGkdkzIX1LuWhqBsZ5M9C+2NgvJ127nM230CbqSjiiRo8eFPVe831RZ8eAicQ0u98H7aVX51kXVXdKiFTrD9B56WI2j4wCeJMIh0uTCKKZTF7B8DrUXh2DJUGrJ8eWOjQnJoD58Aum+Hw/YAyeq5vbpmj+wcrYh8CqtV+FLxPjH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/5CpKoyKCE/Gsh5aSSZpTE6RwlvYPQR20z+RqO1Gfc=;
 b=UWB5vqJS9y7ePfu9xmu7ujPkCDzWVvyy0+JSpJO2YO6DyfpSd7eUAtnQ7Sxy6Am9UFDQ5b8Wr1Ykt4CFD4CxlmduprwBf8DRXWyH+ImtYg0zJJ3+dAY6Mrd9CHkcq6A9HpQ7m5O2k52VMxwIEk3X1yHrnQVWDFHqPoq6SF+IUBI8Gj2IARMty7/tk4G774KokLwakmfwz7v2X3Zl+GCl2LkQlGxGjIfjtNDBoSP8EwuedJsZWVQxSQ0fi17STK5mRmMPJHbyUD+GcODhzUIjEYE+nXqsZWj1m1KNi8LcftMsow/xfmJYW69Ujb4oYPRe8e7z5ST6Jr4COGmYv4i7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/5CpKoyKCE/Gsh5aSSZpTE6RwlvYPQR20z+RqO1Gfc=;
 b=l08nns2saS9gdZrOioYpSGya6FpM2tHQUySisOEt/7NE2uJPfgyGlvj7dK++Id7ae8TrNUGNZBWQvUoTNX4UvztpGTrm8LrkPdcmoZ1tlezIejtzfJiJjKnfnzJvnnbxWf351zgKYbkJydXtc7abrDKRKcwY5HKps5izuGOMTNs=
Date: Fri, 18 Feb 2022 14:36:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] github: add workflow to run Coverity scans
Message-ID: <Yg+gwfRqetYoT4Th@Air-de-Roger>
References: <20220218120042.32102-1-roger.pau@citrix.com>
 <20220218120042.32102-2-roger.pau@citrix.com>
 <0eeb8f5f-d049-8a8e-9e65-d1966c21a781@srcf.net>
 <34ebc66c-e55f-3f98-b769-0e73bdf3c2fe@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34ebc66c-e55f-3f98-b769-0e73bdf3c2fe@srcf.net>
X-ClientProxiedBy: LO4P123CA0456.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87282880-412c-48b5-91f6-08d9f2e39dd6
X-MS-TrafficTypeDiagnostic: BN6PR03MB2868:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB28682EB7BCBBACCCBDCCC7AF8F379@BN6PR03MB2868.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2x6BA+NYlCU299tgbTBZthNoBkfy/t//S459VndGuijekLvowuMpgqJV2uEw8mLIXmlc+O/NO1IH0LkUyCou3APD+t8B9NP641mYBQ0vlYoJ631JgoIXnwF76+BlN69eVl1LaCwJnlgk+ZjrX6xQTZF2iVLz6IwzNYC1OopU1kCo54mZlG99uGc19Us83GkzDdLlrL9Nvb/58qlIRRX667aoyAhxDtpiv7uGZxO3TyPA4i7drdRh2UhAlFnnePSyZfb4SVJah+e2+xXpsfz9KArKWsrcuiLZGsZ3G5VjCCCo6xjvca0gw1iVmLJhknSVemjtfji2uSd8uZCo8kKU7ZXQKlSdcSb+JuvPgz1jhQHkb12JBcvti4wVEB///zdCtEe5iCSpDuA3CXKwcWzXMrSaStX1mymZHFoiOXb8S5MCZzxehiCnFhJl1wKZO5UogLOqeEyk+5P231qwXiIJR8IJn/9KRq8oxLV5s7QU5vnNIOT5NE+y2PY0AUquq3hkLJ3QcCbqpR9Zg0vjEyTq69dMEn8rwvwLNt7ywsPu3Z8V5yaFaLamDcOdtm2sT40ZQpO8ItTPlSGpxEpcPr3U0p+0iS4guZGzD3XbCPYZQ2a5Mh2eCzwtcNiDI0gEqxJCzfCvDcKnE1PC7tZ+uYnj3YHtLzoVCxL8AmN7MNY9Qa307zzUAnEvsnJzDKwCIaUeoh1BfgGjHVyvshVXraI0yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(53546011)(82960400001)(8676002)(66556008)(4326008)(86362001)(316002)(2906002)(85182001)(83380400001)(6666004)(26005)(6512007)(186003)(6506007)(508600001)(33716001)(9686003)(6916009)(38100700002)(6486002)(66946007)(54906003)(5660300002)(66476007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkFDNEkzZVJNRUVYc2RPUU9CRDlYQ2U3NVduUldsQW5ER1ZjSFNoMHk5end2?=
 =?utf-8?B?eHpIRkhTekhGSW84bGlvODBmUXltNm5jRSsvZFFkVFl5YWd6cENsdXJ5d1pI?=
 =?utf-8?B?UGRjc1pWZHUvWCtLV2JENkF6SXZwYktVN0NKSmVpMzdBVlR3cGpNaUMyRENI?=
 =?utf-8?B?WmRTbXl0enJwcUU0VkVKVjlGa3RFK0xKRFd5QWR0aWhWNUU0c1hzSjVhVVZE?=
 =?utf-8?B?K05vOUlNeVZBZi8zTElZMjNicmEwZVlmYTZFQWVyREMwQ0hIN2FSQmx1REtm?=
 =?utf-8?B?TFNWcjFWOThXcndpUkpGSWM4RERXSGxJSzZEdTFiZDVLNXdjb2VBZkdNRzV2?=
 =?utf-8?B?M2hEWkVtMkM0U3dOaTVEK2dGMFJkelNiRE91WUJuZUpsdFB2RmhHOEtyb0ZQ?=
 =?utf-8?B?MnZiRnhTSzBKZ242STA5TDZ2YTNYSGpuZVU0MmxiUFpHZWVLTFpWR2ttWWRy?=
 =?utf-8?B?ZlV3aWl4QnBCdmVoalZVbElackZsYlN3VzZURlR5SkJhMHRqR1REalpYN0pq?=
 =?utf-8?B?dzFnZ1BsaUw4SVpwVFM4eC9FVTZFaE5XYm5NbzZveUtKVXlBOGUwYWJhRFJT?=
 =?utf-8?B?cXd4U05WcUwvVVBiM0xQakI3NDNaYjdCaWxlVjlHbWtzMDlVbVdYV2JTb2l5?=
 =?utf-8?B?a0Iwc1JDZ3NQQTd2K2RTOVkwcUE3OVR3eHpjeStlOHNpazNjU2NaUUsxdWl0?=
 =?utf-8?B?cFllUGxZV2JLQ0pzWEJoSitidE4vNVBqemlJdHhyVVpXYktXZDByb0l0eVpQ?=
 =?utf-8?B?MHBIblhOZ0VGVWtNVTVZQktKWHU5Vkp5RjNRenJFTlgzWitHQVlldUl4NmIv?=
 =?utf-8?B?N25pUDlSSGYwOS8yVTJlSzV6YnUrdjVxTmhFWjZkc3NCME95U0drZWl1WUVk?=
 =?utf-8?B?UnVBKzFOQkFkWVlPdTVNWEQ3R3RHRFFZWTFoa2Y2TGFwMFp4cktkeTBNRDJS?=
 =?utf-8?B?cm1rNlZ6NmVadjVTREo5Z0NkVFY3ZXBjV0RCblZNTEhPVm5MTjFmUHpZdVhU?=
 =?utf-8?B?cGVuaXg0M1NWWDZXR3dSR01VTUo2cktXenZWRE9hVDVvUVRoY2FqNTUxWGRo?=
 =?utf-8?B?UVZGbmVPanRPZm1YclM2ejFXYkZ3cEt6d01aaVN6VUp6TWlRSVk4Y2t0WDdF?=
 =?utf-8?B?Sk8yV0hmaTlxRmVPakdWY2Nzd2tEajNzZStTMDY2bUlFdEhMcFQ5bENNa2k2?=
 =?utf-8?B?OHJBbWlwSlhhSUxUUGx6dXAyQktlcHNXM054bHIveGg1c2pSOWh3UUp4WFhj?=
 =?utf-8?B?K1ROSUVRQjdaV0tFNUZ2bEQ1Tmk2QVJTdGY3V0FLMnFUNVZ1dkZmVUxsOGlQ?=
 =?utf-8?B?SkhyeURyWi9TcDVsR1dCcUdYYytSZ1VMVDVtTVdlTGIzTFNiUnJqWDlxUm0v?=
 =?utf-8?B?cTJiclFNZnNLS05ZRVVIYUVtNFVsM2VXUFcrYlFzN0R1cGU0dmlMaDhrOUpz?=
 =?utf-8?B?WVZYdjJTNmQ4anpzZTRsRUthdXc2YU40eTBsUURJekQ5NitaZzMrUno1NEpZ?=
 =?utf-8?B?aUp4YW1TT04yK0FZOG12TXdiT0lsOWNqc2tiSWs1emNEMzZqVC9ud2Y0UzFl?=
 =?utf-8?B?WWI4SU9KS1h3WjhTdXRkaVpTZHhzL3VJM0Q3bzZBeEN0QUhtMGVKd2w4d0tO?=
 =?utf-8?B?MzFWTVNsSy9JTEl0ZTE4ZDFSWDArTzQ1ZzhEQ09NM3VyVlI0QnQ1L0NTQkpr?=
 =?utf-8?B?enlkdVJvNUhMeG1xdUZEWk12d1A5TjRBbE5wQW83NC9DSEZRVzcvYlBXYmY1?=
 =?utf-8?B?K3BVSFRSbEtCdUtZVUxXVC9tdXFNN2VhMWtsQ2ZRdUkvazBNT2MvUlFGL0M5?=
 =?utf-8?B?dm1MQXpFeU1CZ2ZVWlo0T055c0liTWZiUHEybkQzUDNRWW5rV282emtNWmJS?=
 =?utf-8?B?WnhsNGhoWlUrRDFIZ2tZNE9GdzEwODVTMGx3aTF5TEZ0QVNrcVU2U2IybG0x?=
 =?utf-8?B?SWttb2dpUHdaY0czclNrZUF1YmlaYVJ6SGJUcDZNdlJHcnU3WXZGUW1KZFBh?=
 =?utf-8?B?VXVKdFRXUmdaTmJLUG9ZVnJ4bDJMMGNxb05RKzRpVHl4aW1PRnJOaWorQ3do?=
 =?utf-8?B?amkxU2cwa2I0V0lDYTVaQk4yMFg3UXdNaUhDNmc2V1RJQjFER2JMalh5REZh?=
 =?utf-8?B?Y0gzMVhqTzJleEt5UVhvSXpDaTl2Q0R1Z2VrSjV6MmZUc3FGWnYrS0FmZU1p?=
 =?utf-8?Q?rzPE9UI4z7QlBI53vssZv10=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87282880-412c-48b5-91f6-08d9f2e39dd6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 13:36:07.0781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGfePxJYKDBnGSHlZO7bLLiAU8WJgj8/jn5m9Nb2rY1rlvTuUZNwVDcrHkhKR/edomyZ4pakePMYbm6ElyF0FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2868
X-OriginatorOrg: citrix.com

On Fri, Feb 18, 2022 at 12:23:47PM +0000, Andrew Cooper wrote:
> On 18/02/2022 12:21, Andrew Cooper wrote:
> > On 18/02/2022 12:00, Roger Pau Monne wrote:
> >> Add a workflow that performs a build like it's done by osstest
> >> Coverity flight and uploads the result to Coverity for analysis. The
> >> build process is exactly the same as the one currently used in
> >> osstest, and it's also run at the same time (bi-weekly).
> >>
> >> This has one big benefit over using osstest: we no longer have to care
> >> about keeping the Coverity tools up to date in osstest.
> >>
> >> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >>  .github/workflows/coverity.yml | 35 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>  create mode 100644 .github/workflows/coverity.yml
> >>
> >> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> >> new file mode 100644
> >> index 0000000000..12fc9c782b
> >> --- /dev/null
> >> +++ b/.github/workflows/coverity.yml
> >> @@ -0,0 +1,35 @@
> >> +name: Coverity Scan
> >> +
> >> +# We only want to test official release code, not every pull request.
> >> +on:
> >> +  schedule:
> >> +    - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
> >> +
> >> +jobs:
> >> +  coverity:
> >> +    runs-on: ubuntu-latest
> >> +    steps:
> >> +    - name: Install build dependencies
> >> +      run: |
> >> +        sudo apt-get install -y wget git bcc bin86 gawk bridge-utils \
> >> +          iproute2 libcurl4-openssl-dev bzip2 libpci-dev build-essential \
> >> +          make gcc libc6-dev libc6-dev-i386 linux-libc-dev zlib1g-dev \
> >> +          libncurses5-dev patch libvncserver-dev libssl-dev libsdl-dev iasl \
> >> +          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml libx11-dev \
> >> +          ocaml-findlib xz-utils gettext libyajl-dev libpixman-1-dev \
> >> +          libaio-dev libfdt-dev cabextract libglib2.0-dev autoconf automake \
> >> +          libtool libfuse-dev liblzma-dev ninja-build \
> >> +          kpartx python3-dev python3-pip golang python-dev libsystemd-dev
> > We dropped gettext as a dependency a few releases ago, and we don't need
> > python3-pip either.  Can fix on commit.
> >
> >> +    - uses: actions/checkout@v2
> > I think we want
> >
> > - uses: actions/checkout@v2
> >   with:
> >     ref: staging
> >
> > Can also fix on commit.
> >
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> (mainly because I
> > can see that Coverity has done the right thing with this.)
> >
> >> +    - name: Configure Xen
> >> +      run: |
> >> +        ./configure
> 
> On second thoughts, we can probably --disable-docs here, because it's
> just wasted processing time when all we care about is the C.

We do not build the docs already, because the build command is `make
xen tools`.

Thanks, Roger.


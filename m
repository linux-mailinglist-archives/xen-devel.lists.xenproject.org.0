Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F17495CDB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 10:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259289.447404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAqHP-0008Ef-L4; Fri, 21 Jan 2022 09:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259289.447404; Fri, 21 Jan 2022 09:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAqHP-0008BM-HZ; Fri, 21 Jan 2022 09:32:23 +0000
Received: by outflank-mailman (input) for mailman id 259289;
 Fri, 21 Jan 2022 09:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g0ta=SF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAqHO-0008BG-F6
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 09:32:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06584705-7a9d-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 10:32:19 +0100 (CET)
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
X-Inumbo-ID: 06584705-7a9d-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642757539;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ur9QsD4xF1dFsWbhDEbXog97eGAjq87d7rhdKDO9Uco=;
  b=LK4owlyh4yphXgrl63pQ6NBi2JyPPRrgV+LY1plzgIcOXHfg87Ctk0Hm
   iKc3H/TYc+lQ5cnHW7BAB4zcS+0kFTjwFePLXPwIfmhsZR7laW2V8phQ7
   KFd3ZbDLiQmYsLpaUNTWEbYqwzepAH3ueCI4ZLb4hs2DeZc5bKHkJiK7o
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tzg6Rm0arnzdlTVMVCrn9d8279QOjkps4k9xN6B9cfZ51i7RBO+vdW/Qf0pgabcvq+bhQ8LA4Y
 nVTaszzRGT9u9vhTxN7DHi9vKEWkYo5d6M/KBMhBe76lZ2nb8iUP6RbQD9coCkw1nvjwW/YzNd
 U/17S4GTGInOaBA6O5UP1eIdEDqFZTV2D4FiixhDhTyDd21PLU8VI2/6Ks03b49ZKtzlrxaMEH
 JeZiM0HfNU4XSbqihhIVH3WYcqEBol8J76Pp1D9m9DL7nBnNa0R7+I3JBRgSBmHSWCG4wiy4u8
 AVD3ou2igXzHNo58/T7HnDCa
X-SBRS: 5.2
X-MesageID: 62477247
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BeqRNaClImCUoBVW/8jkw5YqxClBgxIJ4kV8jS/XYbTApDhw32MEn
 TYbXW6HOKmCNDGketElaNzl8UNVvcTTnIUwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En9400s7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kDq3zt91w
 vx0kpGCdl4sYqLvouMnXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+WuoACgGhYasZmQ83MX
 PopTyhVbxXaRztPIggFNZxjk7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHmUCPpr3qOlyc7VuhvSuhm5yK3zZDbtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL+dlr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2KBgpJDSsjPeZJgrBED3CBvJ6sy67DHzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj3pCb4LNEJvG8mTKuMDiriUWSxC
 KM0kVgJjKK/wVPwNfMnC25PI5lCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrlBuZd2mHFW7T6DFPjTkkX8uZLDNSH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WnMnCIqtZCdA5TRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:jM+JrarCuiDdtlWONUjMlWAaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62477247"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9cv7+3scWVBXu2XZE+7cyd/rHWnbY2lP0IyVrZ3MZJWJ3jHXJmUrVd3xTR7dI4uATkoHYBkQgRJ7q4QxQJ9ZhTpuT7EV0a6zQ+qmtK3mrUYqvswBG1VOrHX5PYMndjQkXYCyI4swvOAXHaP33soPVRaSJN09mt4v4qz3ToADgkhmeBatnayghDWjxyaInt4uc39QfTOnxg6/lIQMNy0kiN3hFtFCGsAtXhriK5MUCWYefMZmRGgNvur5eWV8bFecrvd7jQ08RkmvFDe8XdhFTfl5GRdV+LGPb95J/m80ByjfFpMuLIp2BoNSy5OPQT3CvPoMbtPL7W5xFdvNIcIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2ezVA96y3qqPoKVbdkfWHxz5mF0Cqrodn0s1V5j08c=;
 b=mTQoyEp+c5UxCrQ+1oNvJ5rlRoS1nXGiTx6MvHnVsx8/joAYSUI2bGdFovl+v0iYEnXsmcfyyD3Hxyt0DzlP7uQKCE/1bMq85X9v2WkBb7Gqha5rSWrxKjH9TyuGnFw8kR2t1FIHZx2MwMAxmHyQsqYAvUa1TGllZ9sVXcy4pS9J3VzNRvgwBA0Z2j519hTCrvyFD+vnM9PNFWJBrlaTC6K3B4SMtQX7MBnNcwdBrGUCl9xLeNpQ4yHjBLjGox7Qiwv7PeOauKxBsfzahALKvZmDN2hFyMxWvFgIt/8lBcg892cHtETuxC79LzsgKveVrIHO3LBrUJGHfZi3Ha4TUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2ezVA96y3qqPoKVbdkfWHxz5mF0Cqrodn0s1V5j08c=;
 b=nETUqAlDzDQKZGpXVuQ8yOHPK+2KBzu3tbdrx/rmTPtE2r6wnKinTGOAjZ+cawSl3HO6rYTMgtuDAuGc9t13ORx8YxhB+S30S8kCm9iq9RX5B/BU8glGrOBkr5U2BxfsRjnzWF/jlAN+XzTSVAg3YnZbyTSh6GKr9CD0Es7fbMo=
Date: Fri, 21 Jan 2022 10:32:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC v2 5/5] x86/mwait-idle: squash stats update when not
 actually entering C-state
Message-ID: <Yep9l/FvUh0flqP/@Air-de-Roger>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <b9270896-efea-3e81-99fb-685fc5b708be@suse.com>
 <YemHNOVyqGwZ7/eC@Air-de-Roger>
 <99f6520d-833b-bb90-5f72-f2a888379169@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99f6520d-833b-bb90-5f72-f2a888379169@suse.com>
X-ClientProxiedBy: MRXP264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8873a0db-72e9-4c20-af6f-08d9dcc0e7d2
X-MS-TrafficTypeDiagnostic: SN2PR03MB2303:EE_
X-Microsoft-Antispam-PRVS: <SN2PR03MB23035D28C8D36C59F11570E08F5B9@SN2PR03MB2303.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p+e3vIklmmP2l+tSiT8voSBsbLFjao9TfBCFBvKgefQh151GZ4Rnq/cVpHpGwsTaC3SqANn8OaoTTlODvCApJxe98WSnWr3hrVJcr5/EvBuaBUquPCGgavIbSzKyHmb8TfsvDnUUBBvdbI94msYfnGbKav6R1XQO1XH+nCozeL6AnwaidapbgF/wQa4k060O34mobPph8jaCTltNRYXMv0NF5cjfHVqui4IyYmH/KkCde57UdA1MMZKImuW2QGnAUI4bcVtZChjyqWn00OeUxzmlqKOPfTgnrpO+xJjkp1EmOoaoLoO69BVEMJ4lCE8DXvyW973K79+T9ODN0R8UV/Fihtld3CCeDzERpw5pqY/IaiT3B7iPKmOVTNKGgfnnIZcygb9YllCYlm4XQqckiV3TG5XHvlxXvbxUBpDwY9o48dudu+RrJ5CyLj2NiohHEw1HhFoZ7wV43t2buZAkK7RF8QQVlK2vKFL3I41/hBW7axevVa8EN7zkNcsf+ChYEcpGl8hE5pXntCLL4M0KUMU/TKh/S7dl/VlbQV0vt7KzVuh8qwqjoQatwKCywJAtAZ5HRoJSTvL0OPELooF/0j5eWew+CNJhhqPv0YYarMmJtLCo3K1NaltCq3ZCoG7eZ+gR4vqvyNBw604ZDf4tHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(9686003)(6512007)(6916009)(5660300002)(54906003)(186003)(4744005)(82960400001)(85182001)(316002)(38100700002)(6486002)(83380400001)(6666004)(66476007)(8676002)(8936002)(66556008)(15650500001)(66946007)(86362001)(4326008)(26005)(2906002)(33716001)(53546011)(508600001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RndrNXpxWHNveFNER3pQejRua1k4OG9FbHdBRlFVSWJZTk0yREZHTnlTU0x1?=
 =?utf-8?B?TGV6THQzTGE4R2RaZHNNYkNac2hRVThUUFFiR1IxQS9ySUg2TnNqZXkzS3pp?=
 =?utf-8?B?d0ptaUpaWGtnRDF2dGRHMWZLUTRYK3IzQzhZT3paSGNiTTIrc0dpQUJ2QzJC?=
 =?utf-8?B?dHV1QklUbTdWUElQYzBSWlhxcUFLVkFJQWxCaWExbTV6cWoySlV0N2krOG1W?=
 =?utf-8?B?dklUbFl1S3JuV0I5MkJBRTk4eUdXczNILzdSem16VkNjbUtwZHVYWXRTQTJX?=
 =?utf-8?B?dm8raExPVzd1L2lMdUhla2V1aHRLcDZ2bUtBSTMyT0ZJd0V3UlRud2tWalpQ?=
 =?utf-8?B?bGQzektKME40N21aTFhlZDNHS05nZDEwaGFQNXlUcDkyU1NmYkxzVDZjR3FT?=
 =?utf-8?B?VkZjZGtzTkxabWtwWkhFRWh3QXdHenU3Sk1pS1RDMHg5akpLNHlVdTVIOVFz?=
 =?utf-8?B?MnhYakJvZC93QjluTmpJOFg0TUtmbkVOb2NqcWRhUU4zUWdybkJSYVpqcHoz?=
 =?utf-8?B?YWJHYTdnWGVlN1BMaUV4bm9jcUkwanNDRXJ6Q0huWWwwOTlsb0NBSitKWVNL?=
 =?utf-8?B?RnY0Y0lRQ3VMZHEzNFFyQ0YwZUhkazMwMVMxVzZvTDlyL1RNUUhVMkRlYzFu?=
 =?utf-8?B?aTNPSkdyaHlTV2xnKzhTZWhWS2dLVHlYSlViU2J6LzhiRmJVZCt5ZlJudHdC?=
 =?utf-8?B?bURwVmM5V2lRL1dmM2ZDY3JabFRZaStYM29hSkd1YjVURGx4NFZ1UXdkSGF1?=
 =?utf-8?B?enZ5VlZqNWN2MVJiSlViejFSSGU4UFFYcHJYdmFDQmpjemFLdUdiVlhzbEti?=
 =?utf-8?B?VFZzN09FTW5ENTRTd2xQSjM0cGwzNm9BT01NNWQ4RmlndTJVY1B0QkVZb211?=
 =?utf-8?B?MTNpSXNZUFF0S0lvWFRmWFNEUzduZFBiayt6VVppTnh6dkpZTmtCdXhicnRV?=
 =?utf-8?B?cGNnMlhRRzU3Tmo2REJSMUlKeGw0RVU5SWxoTDBvaE9HQUltWlpwV3Zja1Jq?=
 =?utf-8?B?MDlCZy9kMGFHbVdmZUEvLzhhOUFNa281bGdhZjl1aXF6dURhZzdObHBGVmlE?=
 =?utf-8?B?cG82b1QyY1F6UFdXUzlYY2E5WTZEcEdrdERDRFpRTjFDR2YrcDhNeTZaZ1ZM?=
 =?utf-8?B?SXZENDArcm1tV1FXL1EvbXRydEl0anA3ZHV4R3ZpK1puMHpzc0RtQzZxQmtW?=
 =?utf-8?B?Ym93dGlwMGRaelN3eUJTT0Q1Q0JwVnUxU2RMcGRRMzBpM3JoK3kwSTZKWjRt?=
 =?utf-8?B?YVVLZW9YLzdlYmxQZjY4cDBYMUNGdHhvUmFFYWtTR1cyaHpzdThJamtSMzk0?=
 =?utf-8?B?ckM1ajJpY1dHUURhdTVTcVA1N3pRKzNSbFMxaXhGNTV3YjZkT3BHZFphWXl4?=
 =?utf-8?B?U1Z1ZmZ4Z0Jpd0VQMkZocUJ5MnltOHVDblRIZ25kdEZUZGFiNXB5aTdDOXEw?=
 =?utf-8?B?TTFVZXNGUTBRQ2VpN2JOM1MvWld6UFJlYU5HVmw5U1BEZ0JMZ3J3VEh3eFBI?=
 =?utf-8?B?SVFxUzIxTlk2SFFOaENvSWdGNFZ5OHNwNG5SS1Y5ckdudEt5UllVSENCelZw?=
 =?utf-8?B?eWhGSnViSlRzbGZMT0QvSnNGVlFQWHJlaTRsYnRDSXVzQVpIaGxid3FmOW5O?=
 =?utf-8?B?T1VIdEtXazhxSUV4RlFYRktickxsMXljVGUrUjkrN1ZRdkdRVW5yU2h4MTFh?=
 =?utf-8?B?UFluK1REMEx0b0lrSUY1WUt3VjMyV2NJSGxudmZWQm9yNlQ5L0pJQXorUXFC?=
 =?utf-8?B?TWxra1VkVlhadDFCWmx2bHpwRlBySEdBTnhoQ2dBT2tDSWFsYTM5R0lNVFE0?=
 =?utf-8?B?SGYzaDBqUThaajRET0lBMmI1c1k1REtVZDgxU2Q4c0RQWElFeFpyb1Noc0lM?=
 =?utf-8?B?VnNLRWRRWGdSamNlMXo5VG05VldTNkZFelAxK0F3ODBEOHEzbHhIY1p5R1Rn?=
 =?utf-8?B?Z3ovTDRtUTdqbzRUd014Snk4Tm5lc093Y0p1RkoyWTZCSjA0d3lZU0FJUzRa?=
 =?utf-8?B?RDRKN29OSGRBMk9nSTlRaE5YUmU5b1lBZGxwMTNnT0NpRGY0WGN3b3QyT2VT?=
 =?utf-8?B?NFJYZE1zVmdYRWJxSkZucWF6Z2dORzJuR0t5OEx2MmwzWklrSU9vUWVzZElN?=
 =?utf-8?B?OUovY3l3RG52WHp4WmhadDEvcnhXQTJVdjArdVNORWtnUXlGTzlDNHoyNUhX?=
 =?utf-8?Q?4NMhJB1raDi5Az0R3BjBQLo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8873a0db-72e9-4c20-af6f-08d9dcc0e7d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 09:32:13.3011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnK6WIW2G/bEOP/1RkH/VG8bDu4jHdDET0J8xgYqMgYmG5BG3jiiqoXWcMETP1icNj98MZAqw46m+lPkRHY+9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2303
X-OriginatorOrg: citrix.com

On Thu, Jan 20, 2022 at 05:21:31PM +0100, Jan Beulich wrote:
> On 20.01.2022 17:00, Roger Pau Monné wrote:
> > On Thu, Jan 20, 2022 at 03:05:12PM +0100, Jan Beulich wrote:
> >> While we don't want to skip calling update_idle_stats(), arrange for it
> >> to not increment the overall time spent in the state we didn't really
> >> enter.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: Arguably more of what follows could be moved into the if() -
> >>      thoughts?
> > 
> > I would move at least the restoring of the TSC, but I would be fine
> > with moving everything up to local_irq_enable unless I'm missing
> > something.
> 
> Yes, that's what I was considering.
> 
> > I think you could likely also avoid the call to update_idle_stats so
> > there's no need to fetch the new tick count.
> 
> No, this call cannot be bypassed. At least not without further
> rearrangements elsewhere.

Ack, I would move everything you can then.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94564C2C03
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 13:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278208.475374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDU3-0006i9-I7; Thu, 24 Feb 2022 12:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278208.475374; Thu, 24 Feb 2022 12:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDU3-0006g8-Eg; Thu, 24 Feb 2022 12:44:35 +0000
Received: by outflank-mailman (input) for mailman id 278208;
 Thu, 24 Feb 2022 12:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gX/V=TH=citrix.com=prvs=047ddeb39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNDU1-0006g2-G3
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 12:44:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812f46a0-956f-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 13:44:30 +0100 (CET)
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
X-Inumbo-ID: 812f46a0-956f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645706670;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=lGxRk9A5yMbQlhmYLkG9mwdJ6empyG6N7zD9TZXNuJQ=;
  b=VfA3E0vX/39c7U920MXNEtgPzPN8UfQD9vjQi8sxav1iCuKQmIS6/X2Z
   CY7x3o1nBl+NTLmwjwxbm1zcHOPgX+XvbeYtz67cxpqaDgGLrDBfNa3qh
   sHsJzTOCPGicIIlL6nTZJbMTis2QaEOk4TtdeP2q3eP2t6HtoBY3lH/2Y
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64897704
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ysAyCKP3uvljGDTvrR1Sl8FynXyQoLVcMsEvi/4bfWQNrUp30GRWy
 mIXWG/Xa6mJN2fzf4t3YNuyoB9V7ZTVm4RrSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2NIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 tRXpL+iVyIQM5bHt+8GegkCKAxUFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmtg158RRaq2i
 8wxdWVwbDbKTTx2B3hGMNFlo7+Fr2HjfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvyXo4ITuXgrtZlhVSSwioYDxh+fVi2v/i/zFK/UtR3K
 koI9y5opq83nGSpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRtrbmURHS15rqS6zSoNkA9NWYfYQcUQA1D5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ0ZjNQa9Lel2GnKuDmDrYPgXlQOyy/+CzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHQsF5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fW4fTgGfqqNBjarXnSXXFXZlM2JTRTNt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGc2lk077i+HBPCX9pVI53L2mNL5RAESs+li9z
 jqiH5HSl0U3vBPWOEE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZETAy37zgCN9CWtuhY9CH6YKkU4PrrI7lqcsF
 6FfEyhCa9wWIgn6F/0mRcCVhKRpdQixhBLIOCygYTMleIVnSRCP8djhFjYDPgFVZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:xGFen6zJl412aCnvF66pKrPxweskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZq6z+8O3WBxB8bYYOCCggWVxe5ZnO3fKlHbak/DH41mpN
 hdmspFeaTN5DFB5K6QimnIcOrIqOP3jJxA7t2uqEuFIzsaDp2JuGxCe3um+wBNNUB77d1TLu
 vu2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpAoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEN86JX/r1cop46zuNNd3B13Z
 W7Dk1WrsA/ciZvV9MEOA4ge7rBNoWfe2O7DIqtSW6XZp3vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.88,133,1635220800"; 
   d="scan'208";a="64897704"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5kJLBAeNRCNoQt2iRc81q/mvldhHe5oZ86M4shxZtJS11IY8FKAR6NB5YGZICiUtplSQ39ZJ6KHi5jvKfHWZ82dUkPKqhCIXMXDaEJCC0uBHsXWNEZweCnHW790PDyRCJvC6LkfaN1lTD6OT72HW7X2yJFLAmrcfTN4ofDiueUk/sN5zL7e3KSyc+71MToyoaKRt65qtCFFYGyZl6AFwqqSXBWLQMkV96XCMgvjPTKA/1+pE47joCzrO5BJQf0P98wdLxZzjJVPVvp8aj8DMpeCZ5ADCHWsnEibTifsdvWXMLSre3wE98IsWZ810+sRrY89hB9numM4et6Mv5B5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jXTgjdRJs365AwCkKuWOBqmkndkRkK1qNIbfym/3+k=;
 b=afd/3Oul+Dr409B+R28TQihcTYE3Zfe7BT0wlMGXGx0kn4NAsc3+bpXZXD4yp1Aprm4GoZ/1GDXriAbIAHlwxyKNliNcaLSxy2MBD5Yf5BB4xzU+w1VuvPZkURnqcAQrH41oR9IWU0gRe6bxGNv79ebA6IPRXfY0Ik8KKfB5ek3csul3LdoRyr+1CHFVKvYz/Hng8TetqnW7z1IdhkzBMuC3FHO62UCkyMqhlgNz9rxqk4fwLxOaB9A7iC2Mqm/j7y7rjjHGo46m5GeSW1FttfXEubDwRGTg4zC9gDDKjgYjg3d4lnhvym+o9Hdb1KExeGX0G/E02GNPKJcLp8bMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jXTgjdRJs365AwCkKuWOBqmkndkRkK1qNIbfym/3+k=;
 b=acyWNWea9oeb8g1V0wFEYYUu7T4MJx6oWSIJyGJKGQU7/1MLpmhSWDtbBgdtgQWNB4yzssO0KtkSGfMejohDpXcPp5OLzTFmSWIqWgd9bXoh61lST7V5LA6k2HiIkArPowacxp0KpNKGG8teXATc8SBFXuju7b7aQksSR58APCc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH RFC] pci/ats: do not allow broken devices to be assigned
Date: Thu, 24 Feb 2022 13:43:44 +0100
Message-ID: <20220224124344.86192-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9aedf9e-d055-43f6-b665-08d9f7935de3
X-MS-TrafficTypeDiagnostic: PH0PR03MB5926:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR03MB5926CB3D1840E42A3A3B7B728F3D9@PH0PR03MB5926.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsmucvI0XyplzdGeYcZcLYKCbqNMfo2V4x9B/1hqOmo82dS70HH1deavqoJD8IYuE2PlI8l1fShN1JDpPKRJdroDYgie5uPo75ifhNvmbZ4ksLgFOWCR8PndKtvZa61NeZPW6d4sGWpFed2hAc6C2iPM09q/1J4utUCNY21L5rCLOyo0WbbuFH88w+HhDbv3cUT1gg6aqfBLRyYQZEZk+acEqHZWepZearqG9kL9ufuBqQwiJXjWXU/jwtGHzA19kvwpj6mLfx9ng1NQDoiLRkMNfs487Qz0ux3oXIleN2h1oQXARDjKfMn/PYP9kIxuCsskFJYdNJ4wrtRJ4wuBOMRcUjdaRCQEpNteeGEaJHl8eLhs6fbSJ5NwJvTZagvq19TvJE92d/GUPQ8b1uaqEzkMiAfxyGaY63WvKJbJ2FzKUhHjVXMNM09rhlyMui56LuCCwglFZP+dNCq4MS32Tx8O/gtldWfEwCAKl6kTY5c+oZFqcKCa8ZHWfWbb2Mbm8asC0A8da6R/nlkFA9EF/4xq1fjmtzT1LErsVeRcL9q+Gj8vvDTqZyUKWYfkHHyFkP+09OXSYaAFu91gUUga078savCgGYGZox7kO2YOTJM9+kbdrVwYpdTu9CoLLyuBUb1YdCRxKEQpycEofGAygg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(66556008)(8676002)(4326008)(36756003)(66476007)(8936002)(38100700002)(5660300002)(86362001)(82960400001)(66946007)(6506007)(6512007)(54906003)(6666004)(2616005)(1076003)(83380400001)(316002)(6486002)(186003)(26005)(508600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NSt5eHoyNVdZekE5WFM1TGFGNjRJREltQjZQdUQvNFhLbmdJUjZacDZrU2Vs?=
 =?utf-8?B?bENDak5XaFJVVTczZElzQnUzM0U0V2RvZWFuckdPVDUxYzcvaW5NQXAvdlhW?=
 =?utf-8?B?c1VsS2U0UVNYYW5qdForK08vZVlZZENRSDdjQjBkeEp1dVl2bDdSSFFCQW5D?=
 =?utf-8?B?NllSYkEzSzM2cEhzS0tNallWVmN5YnhQQmlHWURQNWlKTmFKTDJvd252VnYw?=
 =?utf-8?B?MEZKNjM1Ri9iWkFRcjlMTnBUOG5wN016M3o4Vkw1Ty91eVFCcUhrUzFqR2hl?=
 =?utf-8?B?UzU1alJhVlM5VmZBTXlJMGdkM01KdFI0OU9PbHI3L3JDRHZZNFVkSFU2WUVk?=
 =?utf-8?B?NXlpK0JsR0lmR0dJSisvdllITzdmc2VvbmVkOVkxb1pFbW8vTE5RQ1dZejhz?=
 =?utf-8?B?aGprdi95RHMyUFh3R1NhaG9wWjZEWjlYaThKYTEzRHBMdjBJUk1vNVFpbTF4?=
 =?utf-8?B?NXZiRmNnaXAzcDNYZnA5WDFGcVEwUTJ2ajNxMml3cDRWQzMwVnR6Wmgyb29w?=
 =?utf-8?B?QUZxT0U0Nkl6b0hYSDJpYUMyWGpWMEN3a08xSHVhUmtnSC9DNW43ang3RzRh?=
 =?utf-8?B?L29NTVJwNmprUm44QUhlc0w1RWNHNVR0dGt2SDBib2M5VnBaWktsOURpZDY0?=
 =?utf-8?B?Qk1DWGVjRGZ4WERuVisrc3UxNFQyNG1wdGljMC8xTHZQL3BkYmo5anhoT20x?=
 =?utf-8?B?ZFpGMkRBUW5iZmZ1UjRFUmFKcUFYM0Z2d3BZNHc0ZUxxdXV4eHNLN1RJMnBo?=
 =?utf-8?B?NGxwR2cwUi9pczBZS25aZm43L21XMm5pRjRPOVg3MmZsUENMdWFxVGJFZFdq?=
 =?utf-8?B?WDhNaFlZNHAxdG41MFBIeTdHY2t1TlRiM2laU0RCeW5KTDFxRkRXVFVlWVdp?=
 =?utf-8?B?aW1PRDFsWmdoRWx5K0NRZEUrd1M4Z0tjVFd0SC9WUUlXNGJrUHZZYmppaHlu?=
 =?utf-8?B?bEorYlFmenpvem5sUHdJMlBWY0JFVktrV1lNR2pXbHNCeDJQOFZQbnZMQ2FN?=
 =?utf-8?B?YzJtc2ZJQVM4T1gwTzk5bWU5MFNOcC91ZXFiZVpRTEN0WEhXMlBsYWFPVXpF?=
 =?utf-8?B?RDE5dEowSGJYTGdGN2MrdnppTkh6MExsRWtsVzRiazhNWThsOHFYdXNKWjVU?=
 =?utf-8?B?cGYrb3ZRSThvUE14YUZiREJiYXVaOWhrSHZxQW1WSFdtcG1vMTdXaUVobk5T?=
 =?utf-8?B?QUpFY2hnU24wc2t3WUZPZmVGOHExTHh5dHE3dUNndzBxNDNvWTZyeVRUUHlS?=
 =?utf-8?B?MXV0a1hTbk8zZ0ZXY2o5amRlVTU0cWNOL3I3dG0vV3QrVFRZZTJwTStqT240?=
 =?utf-8?B?dTRTbFNBWmpoVmxveDYxQ0xFVG1HZmN0NDRDaktIQW95VGdmVC9LcUE0ZERQ?=
 =?utf-8?B?YnllazNmMFYwY2RicWxoaVhYaDlRM1djRHJPOS9qRDBoaWh5Rkl3MjhTcnla?=
 =?utf-8?B?ZXpMbDFaVGsrdTg3czUxOEdiVE9uVDVxcnNtWGFSbkFRTWlZUHIxT0ZpZ0F6?=
 =?utf-8?B?ZjlRT25TUnE4VDQzZlhhRjdtRjhCSUR5bGkyYTRNRkYrSlRWVUlZK3R3a1k2?=
 =?utf-8?B?YWJxOUIwNUxLa3Izc3JnMzdDS0FZTFhncDlPeVduZFpqZWMrbFpZcTkvV0NX?=
 =?utf-8?B?Z0c1VGhjN0l0WnF5TUJXS1BiYW54UktrRkt4SHBtcWpkeUJ1UVMwNEd3b1gv?=
 =?utf-8?B?RzNxNWJZTzcxQWtDTithMTNvRjhnSnowdDI3RTFOQksxb0t1Z3VOdHVuYlhJ?=
 =?utf-8?B?OGJqeDRNL1ZGQnJBcEc4RmNvQjZMTFBOSCtnQUs4dTBFUHhQL05ZMCt5NTl5?=
 =?utf-8?B?anE0SjhPOXhKMUkxRm1GbzJoWkc2S0p2T1JtWmZRVWt0NjJHa0hpRTZKcklz?=
 =?utf-8?B?VzRPdjhzR1VQM040a2NLV3dFL3ZSTlFYM0JNSXRlSkdFRHhoZ3QzRzdBWWJz?=
 =?utf-8?B?VFFCZGVrZ09RWHZ5OWxKa3RJODFwWjVFVTVQa0syN3BDU2N0T0lybEZVTTBn?=
 =?utf-8?B?Y2psdEU2YytxbnBnaENyTHRBK0VZSFl2aFBuaDBhbEk0Sk5RUURHNmN3cW1x?=
 =?utf-8?B?U2VuQUNQRUdZdVRHYlB2RThhZlp0bjJLcW1iSjdKd0M3NXE2TTZSdzF6NGlK?=
 =?utf-8?B?eVgyc2JXcTVESmZKWVRLcG5GcGl2ZTBHQ21oSktxT3BVMDVvUlRRRElPRmNW?=
 =?utf-8?Q?KEssPVLiCXLgZr7eq0Am2Ek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9aedf9e-d055-43f6-b665-08d9f7935de3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 12:44:15.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46YHoTGXBI2szIbBFAZqDncDzVpRGkcM610pRE3OaUifE1QwonacV/523B7Fi/Kp6p9OpTYvQiwf1MCwHjxrDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5926
X-OriginatorOrg: citrix.com

Introduce a new field to mark devices as broken: having it set
prevents the device from being assigned to domains. Use the field in
order to mark ATS devices that have failed a flush as broken, thus
preventing them to be assigned to any guest.

This allows the device IOMMU context entry to be cleaned up properly,
as calling _pci_hide_device will just change the ownership of the
device, but the IOMMU context entry of the device would be left as-is.
It would also leak a Domain ID, as removing the device from it's
previous owner will allow releasing the DID used by the device without
having cleaned up the context entry.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
RFC: I haven't tested the code path, as I have no ATS devices on the
box I'm currently testing on. In any case, ATS is not supported, and
removing the call to _pci_hide_device in iommu_dev_iotlb_flush_timeout
should allow to remove the dependency on recursive pcidevs lock.

TBD: it's unclear whether we still need the pcidevs_lock in
iommu_dev_iotlb_flush_timeout. The caller of
iommu_dev_iotlb_flush_timeout is already bogus as it iterates over a
list of pdevs without holding the pcidevs_lock.

TBD: getting rid of ATS altogether could also be an option, but it's
more work.
---
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>
---
 xen/drivers/passthrough/pci.c        | 11 +++++++----
 xen/drivers/passthrough/vtd/qinval.c |  8 +++++++-
 xen/include/xen/pci.h                |  3 +++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 70b6684981..4b81c1c04a 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -501,7 +501,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
     xfree(pdev);
 }
 
-static void _pci_hide_device(struct pci_dev *pdev)
+static void __init _pci_hide_device(struct pci_dev *pdev)
 {
     if ( pdev->domain )
         return;
@@ -1487,6 +1487,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
+    /* Do not allow broken devices to be assigned. */
+    rc = -EBADF;
+    if ( pdev->broken )
+        goto done;
+
     rc = pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1585,9 +1590,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
         return;
     }
 
-    list_del(&pdev->domain_list);
-    pdev->domain = NULL;
-    _pci_hide_device(pdev);
+    pdev->broken = true;
 
     if ( !d->is_shutting_down && printk_ratelimit() )
         printk(XENLOG_ERR "dom%d: ATS device %pp flush failed\n",
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 9f291f47e5..4436c22c05 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -227,7 +227,7 @@ static int __must_check dev_invalidate_sync(struct vtd_iommu *iommu,
 
     ASSERT(iommu->qinval_maddr);
     rc = queue_invalidate_wait(iommu, 0, 1, 1, 1);
-    if ( rc == -ETIMEDOUT )
+    if ( rc == -ETIMEDOUT && !pdev->broken )
     {
         struct domain *d = rcu_lock_domain_by_id(did_to_domain_id(iommu, did));
 
@@ -241,6 +241,12 @@ static int __must_check dev_invalidate_sync(struct vtd_iommu *iommu,
         iommu_dev_iotlb_flush_timeout(d, pdev);
         rcu_unlock_domain(d);
     }
+    else if ( rc == -ETIMEDOUT )
+        /*
+         * The device is already marked as broken, ignore the error in order to
+         * allow deassign to succeed.
+         */
+        rc = 0;
 
     return rc;
 }
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index b6d7e454f8..00b44e8487 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -108,6 +108,9 @@ struct pci_dev {
     /* Device with errata, ignore the BARs. */
     bool ignore_bars;
 
+    /* Device misbehaving, prevent assigning it. */
+    bool broken;
+
     enum pdev_type {
         DEV_TYPE_PCI_UNKNOWN,
         DEV_TYPE_PCIe_ENDPOINT,
-- 
2.34.1



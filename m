Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9C4ED566
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 10:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296742.505179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZq4I-0003DH-As; Thu, 31 Mar 2022 08:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296742.505179; Thu, 31 Mar 2022 08:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZq4I-0003AS-7f; Thu, 31 Mar 2022 08:22:10 +0000
Received: by outflank-mailman (input) for mailman id 296742;
 Thu, 31 Mar 2022 08:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZq4G-0003AM-AK
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 08:22:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5583be0-b0cb-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 10:22:05 +0200 (CEST)
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
X-Inumbo-ID: a5583be0-b0cb-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648714925;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YacsaPmymek6FNIfUNv9niisnhYsjOBf8Zu2v/EHGGI=;
  b=R3+HTLEjohC6o8xeAoQp/FWDxzFd1hYM+6BVp0cr1j9JkTgDheVcceqn
   PjNt15cN5Czooog5VuW3kbgpDRDv2EENtRWOVo1NUxu8xoS9ZY4NsY3tw
   o/Bav0LEpNjNX0lMd0gk17EdMWlQsXM5pIkpgIyclo9sAotYQy7ZAnOsW
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67629059
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MnPSs6DgwICD/BVW/xDjw5YqxClBgxIJ4kV8jS/XYbTApDMigjwDy
 DAXDzuCPK2DZGSmKt9+OY7i/U9QsMKAyt9iQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vi29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh9w
 4xBuICudTwQEZLWweQzUAQbDA5XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg2lq15gTTJ4yY
 eI9c2FNTCrCTyZ+M28RDcljwL/3n3TGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkqfq
 2jL+0zwBxgIM9rZxTft2nGrgPXGkWXkWYYRPLqi//VujRuYwWl7IB8cWEa/oPK5olWjQN8ZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTBk6bGYVWyhzY67kinrOQYWMCwdSgZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNERz3oRZPmqgKvFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i1CK6JMYQUP8csHONiwM2ITRTKt4wKuBJx+ZzTx
 L/BKZr8ZZrkIfoPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9c7x/4MzLeZo
 ynVt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:fB8S+q9JGxTnGyUXYcFuk+E8db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA9ciYnV9MPOA4/e7rDNoXse2OEDIvAGyWuKEk4U0i936Ifpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.90,224,1643691600"; 
   d="scan'208";a="67629059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMFcXqU/jONp8ZWIuKtKoAJaS6BFKC8WbdOWqs/7JxwcLYTJ5PujyWnzlfMcHcdHOybT/V4ZHJPm2Q6dtAlmcOmtm4jdOYghDRdhFND+y6JV/rWp6O9xFMb+rH9Eqg5R9TywcN86IHtdj6LlMbWGpuMqqkJC3pktNuxIXKFZVD0M3MWQ/INj4Vqk7XJ4H3ahwVpjyn/8Aa6EoJIn9GjcCuadjAh9X9ibu4APhunssPNm4ZT34bAaTAMbQ0MHYI3j3HA45MNJ1ePS5XaaIZxDMENrIPiuyIlAR930uMh9gfCyUqJwhWOV2AiyfqapwWfRnz7jmurkdjy/HXAts0HO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7INZ2eQuq3ukCrCe0To8LZmNN4291FOUF3EXb4WdD4=;
 b=VUgWlw5BdMQBarRoq90O3jJh/P0434IZg/9nnrwqSJD2VngMfH7/JCqd6vd7p1NXzDElduDmk+x+ENl4hfwiHsXXHMsqPJNyyVHJrIVaBMBflYNR4972aunKNpTnryifrdMFivJ5Dvym5aDfX8qR2NggP+0Xh0k3BHb8fCYKrLL7JzLk6/7V8cAD12CH8cn/Cpu0NFQtlqhPeaLDsC7O+q9eVyIYC30KMyUvulauOayWemGW+uTglVoo1KxUQMswNrvaLuLN3Fqxll19RtcaNvgXxCnMm79I2guXswfpq1vxfEsqda4FHctxH7rrG7PUx9TVmp4tAh5z8tpnlKLOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7INZ2eQuq3ukCrCe0To8LZmNN4291FOUF3EXb4WdD4=;
 b=S2pJOInugcIiSdUQdsrQfJdksrhFDwQtndFSKlzujrYHd5bBw8d+2vFVqhrS4lGYKcbmmaeNHd0sBOih5EZ8NIu/o+VaWaCoL2rO+C+JhiGaxmsfdTl6lJCJY0LlnDrGE8P9EzlzWfS4DvvBgLXozl7cfcpJ06xwave9Gntzmjo=
Date: Thu, 31 Mar 2022 10:21:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Bjoern
 Doebel" <doebel@amazon.de>
Subject: Re: [PATCH v3] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YkVko/vqhfAfS5Jb@Air-de-Roger>
References: <8db632ef-9d9c-d17a-54fd-49912d88d599@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8db632ef-9d9c-d17a-54fd-49912d88d599@suse.com>
X-ClientProxiedBy: PR0P264CA0277.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31f3bd38-ea74-43a9-8891-08da12ef8709
X-MS-TrafficTypeDiagnostic: BN8PR03MB4756:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB4756E3F12C82BF49423805018FE19@BN8PR03MB4756.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VC2gUHUjCOZEeErkc28z268YYP8ty2r3ZpFEP+mlyrXRuSkEsxGqNiMILjVAzg6hHl86nV/vXBxeLvDPJo10Gwl95TOO0PthFNd4fhCoqc+R2Hpu0Ha+Z56J1gNfyyhw4JeBC0i4HpjM8Cpon4DcClPgh2fRgNTYZzrvre0yu5xQ6SqwWYHM5kuseDPsNEff7SQAnr5fcuIz/z7BV+tb31OurY6oyzryx3S0BBu3bl3Rpc/ifVZUmbw1KsJbUUxcgVb8MZ+Zw9GFKv4JQDHmVx64zsgpzvfIE99sGkaqdDYxiN1uP5QSiANYs+tD2hy84hDFT+gNSlsFHqPFXtiEp9HhW6DHyY55tl4OEP76+24NcRiUnhDklLbjdn6v44MlwFNZXkmUI8Dy/enx5mpoAL1Ixf+ttuImZ+8XPbq6YefZOuTvOn+yTXQvZWFMwXtrLJic62E2mPiJ1jDloT201rgZn8lbfbHdmovT3+s99PfpkH0JwLSnlMVb4JfBq5l0GUgQ707BXN5/XCWMplEwhqCZhkt+jXGejjMndwgnwlNwfYtLnmtbDyJoOrlWIGA+tA64FF5OmNOS5QYV1yXa+sKZYzcGBCCTL4zSHFXZPq533+7KfDh8S+gJjKzteSQRQdWKqrx8dTxaDLcP/k1Oqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(86362001)(4326008)(66476007)(5660300002)(6486002)(9686003)(2906002)(33716001)(6506007)(8936002)(8676002)(82960400001)(6666004)(6512007)(85182001)(15650500001)(6916009)(66556008)(54906003)(38100700002)(66946007)(186003)(26005)(83380400001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0UyenRuWHdQMmVXR2xTdXZLbU1PNUEwbjlnLy9LNmIvSHdCMVdUb2hnejk4?=
 =?utf-8?B?S3VocXJFajhmL2FMRUttUVRQUGZ0aERzSy9FbHR6TkJCVkdSUEhtWVN4YzZX?=
 =?utf-8?B?TFRtaFNkYS80NXFreTZNVUEwSUh5ZTUrV0J4bkZPbmxQYnhFVHZlTjJEUnB4?=
 =?utf-8?B?N3hXUEJqQWErYXR3QTdpeGdLdG8wVGFHSS9SOFM0K3pPOGVhUTBEaDFEZnlI?=
 =?utf-8?B?b09wVmZXT0lOcVNqMWQ0ZjJnODhncERaMHVLWHQrR21QYkRRTmVkZnVWaXIw?=
 =?utf-8?B?UGNScTVleENxdGw3TzdnOWl3QVlVSTRQZzJFb0dEaFlDQzAzRks4MXl2YmEv?=
 =?utf-8?B?enIwbEtHOHdDb000YVhORm12YUJ2VWVFZnQrelIvYzJyUmRUdXloNElWUWZN?=
 =?utf-8?B?U0VXL3M2RlZrTmxudVEzcGZ2MDgwUW16L000SFp4Yk9HZkRrdE1Wc1dmRjlK?=
 =?utf-8?B?TDQwOWpTSmdmMlE5d2xSSVhiVEZta1VVQTFEQisyV2svRm92aVZ1ODhwb1N1?=
 =?utf-8?B?SXVkME1hQThtZ1JXVXNBL05IbmE2OTl4R3ArV05zR1NzMlQ3QUxUbDdUanRr?=
 =?utf-8?B?a1NWVHFpQjFuRnJaQVUrRkdmcXY1U1BoZ3IrZEF2aVdjTTZRTDRRbytkKzJB?=
 =?utf-8?B?YzBXbk1XbGVicitRNUFQd3Y4SFdYOFNQWEFmN3BINWg2UlNyYWpSMlkyMnAy?=
 =?utf-8?B?NVFWTFB4MXFkUGFzQlpWRzBGN1htcjI4cHkrODhDMk55c0FDR0pCcStDVmg4?=
 =?utf-8?B?Ry9PblIxOC9iYkRTekROczhvY2FUck9sRkpHOXpETTBRSFExcnl6SlFDVjhY?=
 =?utf-8?B?S0oxdjJseEFhbkhkZE9WMm1kR0V3L2M1dEYzTUZCMVpFZUdJSi9tSGg5Mnd6?=
 =?utf-8?B?aTBiNXFrYUM2TFJCNlZtNzIrRWlnZU1qYTdSdVYzZ0doOG5pMG84aVU2V1g0?=
 =?utf-8?B?dU1Kd0ZpeWZJYVJzWGx3M3FSODljWnFTdVE3WUtwdVUxUllPVkp1VEE2WnpH?=
 =?utf-8?B?QzFxc05RVEZjcEs4U1lINk9IUU5DNkZZSTF3NkFBamwvckhFTlhjR0NPYTM1?=
 =?utf-8?B?OFlLL3A4WHNqTk91VkNBWG9BWFJ1ZnJKQmVvWVZmeTVTaExRa0JwLzdQRzF5?=
 =?utf-8?B?MTdsODdvZktvMFVFR0tpazQ0SmlmcXpyTTFLRTRRNW5sb01CamxiOEd4Z1J6?=
 =?utf-8?B?R01HSFZsSVp2QndLS2IxWVVHVUpVTTE4WDhwM09ZVk94NHJ2NXZ5dXJVWEtS?=
 =?utf-8?B?eFRDQTZ5eWNReVNOdlJraU9IWkhtTExKL0dJbE4vYUFpcHN2V0dvc2crVGhz?=
 =?utf-8?B?SnVqakVBNlkyUWlweUs5WXE4NUZEZFczbGJlUkFoVjdmaFBQeGZBQlVQQzdv?=
 =?utf-8?B?UGFvK2F5ZWJ0MkFnUkdTV1Bid3Fxd0hpMzBOcXNaWkxzcS81MjM3U29CWlVP?=
 =?utf-8?B?T21iVERpU2hkcUdCWkh6bk5pZnR6bWRQUFFrRW04d1d6U3F0eVVqQXNZWGZh?=
 =?utf-8?B?ejdtMC9ZdThJZkdPUWtkS2hQRkZpYW1xTktPQkRBRUhWNkpURytQT2w5Tmdq?=
 =?utf-8?B?N25vV2Zpb0cycTBJaHhidFNjdVM4cnVkanlEVkZSaVNJRE5zM29VL1JOR2dU?=
 =?utf-8?B?QWdHVnlYcEg0SGwyZ0xJTVVqdDk4RjAwZnRBZkVpT3FmbURmUmVLaDE1REVv?=
 =?utf-8?B?Wm9tODQ1ZWhxRlA0WWZoK0hZc3o4Z1VZVHVWRnRuQld6UWd4UFZhREpqV0x3?=
 =?utf-8?B?Y2tnOUZMV1hWZlNrTlc0VVduR3FZU3huSEcxbTVRTTk0MUxDTFJMQ1ZWVXdo?=
 =?utf-8?B?c0JHY3lBZGxPWldlRkhVUW1TV3NWTGlTRnc5NHJFV1MvYzJIU2k1bTBxL3o3?=
 =?utf-8?B?Tm9EdG9aNGNBWDdKZTRuM055bDJQSThtZ3doczREQ05oRXo1QThDS0J2VXd2?=
 =?utf-8?B?bHQrZis5K1VVK3d5eGFsR1RmekRtRytOVTcyNmUzRDI3RlpaTTN5UVNxd1pQ?=
 =?utf-8?B?RUtFZXdRTWRKY3JhUnBrbWN3MVZQTERJTC9QeSt2M25GT3B3NEQvWloxOHhG?=
 =?utf-8?B?cElNT2RDbVZwbEdVSVFYMGlCaTlZc2dNTTd4U1dRZDRQeXJrU0FDa1ZRNHZF?=
 =?utf-8?B?Q3BiS2ttSmFDaFBIVHdpTVhrWW9kZTE2ZElrdW5TWUlINXFyRjBJam1RSWNk?=
 =?utf-8?B?WkpyV0ZSbkx6dmxFUno5K0grT0ErUGc1c0lQYUg4RTBoSVNGRlEzNXpsOUdU?=
 =?utf-8?B?S082SERHQ1hPSTZJVjFwMk1JbEJmQTJWWXBVN0tOZjZMNS9CbE1tVWxLUlFG?=
 =?utf-8?B?Z2V3dkEzalFwSVBSZU54Q0RGWE1TUjBFc2I5MHc4TzI5RHpvQ05kN1B4RW1H?=
 =?utf-8?Q?FGyss+4LYdOREHNM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f3bd38-ea74-43a9-8891-08da12ef8709
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:22:00.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBjVNzNysa/ZPa0c5kNWNNTXdbsnugBDtXzV0xKX0ZaanZgRdYOR9mtlD4unpW1xOoEDQQV2vEo+GhORwHn4kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4756
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 08:49:46AM +0200, Jan Beulich wrote:
> While not triggered by the trivial xen_nop in-tree patch on
> staging/master, that patch exposes a problem on the stable trees, where
> all functions have ENDBR inserted. When NOP-ing out a range, we need to
> account for this. Handle this right in livepatch_insn_len().
> 
> This requires livepatch_insn_len() to be called _after_ ->patch_offset
> was set.
> 
> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I don't think I understand how the in-place patching is done. I
would expect the !func->new_addr branch of the if in
arch_livepatch_apply to fill the insn buffer with the in-place
replacement instructions, but I only see the buffer getting filled
with nops. I'm likely missing something (not that this patch changes
any of this).

I'm also having trouble figuring out how we assert that the len value
(which is derived from new_size if !new_addr) is not greater than
LIVEPATCH_OPAQUE_SIZE, which is the limit of the insn buffer. Maybe
that's already checked elsewhere.

Thanks, Roger.


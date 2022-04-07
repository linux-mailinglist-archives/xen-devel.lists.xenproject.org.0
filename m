Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92F4F795F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300493.512589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNLu-00081a-7S; Thu, 07 Apr 2022 08:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300493.512589; Thu, 07 Apr 2022 08:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNLu-0007zU-2x; Thu, 07 Apr 2022 08:18:50 +0000
Received: by outflank-mailman (input) for mailman id 300493;
 Thu, 07 Apr 2022 08:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncNLs-0007zO-K5
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:18:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57254402-b64b-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 10:18:47 +0200 (CEST)
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
X-Inumbo-ID: 57254402-b64b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649319526;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=qY7FBTagxd4jhkKjTx/xVU9t2OTJ9bU81KNufS2Swck=;
  b=MjspBlR9jF9dUJC7gjvwzpn//Rz4Y5G9WXaR6z0Vk3npoHVkuSLGwNxu
   NfvfK8LH0vXJ6OQSQZeCfrMffGwOt48x0noz2YSvZaaNdRC+bj0djeKow
   BZ+yUvb/4DSbiT9ql5se9nmyasU6Sps/7Sz/Bmkz+zpeFf58Ybs9/cJqP
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68645317
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:45DzuKN8beG7Mg3vrR2Zl8FynXyQoLVcMsEvi/4bfWQNrUoq12RSz
 mYeCjiAPfrbZGamfdgiPI2w80JVuJWGmtVnTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 OgKrIaVTCkQDqjnw7gCThdIHiQlMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmdu2p0VRKm2i
 8wxRwFiZRLBTg12ZU5JK59mvumur1X9bGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW6qnOZuh8XW/JLDvY3rgqKz8LpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BVQEoqaewTFykxrK/9m+tJCYFIGpZanpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNOzxjxpmGGeF6bKKI3XH327wk5JEVdoNiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SYW/Bq2JPoURO8EZmOq7EMdGPxP4M4fFyhZErE3CE
 c3DLZbE4YgyV8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJJ9Q+z/sIzL+Rl
 px/M2cBoGfCabT8AVziQlhoaa/1XIY5qnQ+PCc2Ok2v1WRlaoGqhJrzvbNsFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:myXtBaoHzzZSQsiC6QZsuK8aV5vdL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPMs1NaZLXLbUQ6TQr2KgrGSpQEIdxeOlNK1tp
 0QDJSWaueAdGSS5PySiGLTc6dC/DDuytHVuQ609QYLcegFUdAE0+8vYTzrb3GeCTM2c6YRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnZ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvtn+9KK1wUx4S1bpXXt
 WHVKrnlbdrmBKhHjvkV1BUsZCRti9ZJGbHfqAA0vbloQS+0koJjHfw//Zv70voxKhNNaWs2N
 60QpiA7Is+NvP+TZgNcNvpEvHHfVAkf3r3QRGvyBLcZeM6B04=
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68645317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3sBmV9vxh1iQ8gMCnWSoV2MxsgRIMxnVlrWp8Tw4tZefCemqwJsVyDji9QAYvEmHSQAgN3dackY4FwHz4ONDbRtwaiE8m8Z9L8mLJY5T6qCik/tqOyyx/0W390DOeKMF4RjrW0jgWI3dqbyVAsAHiXqnWnHXCmYK8OJ2STW21N9ED75e5lgMJiMvfGXWG+gvmXWul+sg8zA4/oTFN4oGI0c8Tc/EsLCUJHBSPUIYwPzne8Qyo1dgOr18J5HCOY3Pfd3BM3c7Au9Hhyml8QJrI4/aFfAhingXd+dNmdJcEN6ADEV3T8yCrru2mQxm5VPZgbQfPF6zW0zaUKrEn0fhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnWFLCRmcqKxtQAxn4E6pLSOOXyBQJiiTqwqs5RlTYc=;
 b=DuC21If1ts/jw96UOCvM4sR8C16DlouV8gPFm4MmnvmF2bKvzWahXr1DT/lRp9i1cNE0hhJMscsFwANM0lnk0PniqKoqOIqUbiLKispA0dPQ8Tn2tVkgUHb2C7idDLD9NuEd47v3COyZnjyHFHJTHbzjGSV/eMqFMw/BTEpgAWJd6wROnfsMiNRyW2+HVuEMjkzHypFnWbA1EgqUL8XwLNUwq0S/Ywp4W4L1yms5+yei9mQhs6XJNZQr8q2+jmSAe4zLsZgpUE/5ncm4sxjQu3UdqQgd7kHnDUzXJIEAMbleh88ETgCpDRr1FSsh8/5c8rNUFJQ5bTm/G/psJ4+lsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnWFLCRmcqKxtQAxn4E6pLSOOXyBQJiiTqwqs5RlTYc=;
 b=BOI8mPQ3UcpHNpmrn6tvFMZ7Qbnlfr8yyxY8CkoDvSMYhv/x44ouD4E6fbi5TvnzPGnvGJ8GemR4d8cLcbBDKi88NvJeBUrlfDBajAuk+JZM3mDl9+RpmggZVnApVE5dBJDsRQjirz00xYPHDr9YF3RphepuhfC6zVDfngr0x/Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] platform/cpufreq: add public defines for CPUFREQ_SHARED_TYPE_
Date: Thu,  7 Apr 2022 10:18:28 +0200
Message-ID: <20220407081828.38747-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66eed729-6337-4ed0-c6fa-08da186f384f
X-MS-TrafficTypeDiagnostic: BN6PR03MB3235:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB3235B872436456E78FFF09888FE69@BN6PR03MB3235.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cc6cjepdoafVUuhOFe9MuilHAMC3tZJv+tYQ5za/z+h+irJRnqicBzUBT+bVfhztkFHl/z6TYhgmGJj6FDzYo6krUO7teH0jCN4lDeonJpNuHwlsvyfysR311xarVmwUfT7Pf6fOn7q/mawqz/KMXJC11X7rxhck6jBk8+ii3KPrt2ne7vhyLD3o0Oh6w/CEWthuueHA094rFbuEftFMYPSnH2snDrlXzVXNlClzMQFUuw6X6sgjXPyHIvEVXi1fsiHdteHS1xefXpu6VckvhDJUOUN/cNNGu65KwVLATsMiIL9pxgzU2keI8zdQ5pNHOpzzH5rFgfmUOK0zrTffA4paasuSwV/rGIvVAbrPhOPhAALUf3hjoSx9cJpsgc/iNpgdPHbvybeaXv5AKpoB381vuT8HyUY+Rg6O+F+E8l/1ESDizVJjYPqW+m29eUH5BGT3ubmRBHpGGda/xXb1Emlixd7nAWUNmi3e5kNDbD8a2NcgAuvOvSBo8fvZYPupiHE7RhWtPOrajsTGh/dejXv25s/Bb6rSxkNldDHWaQiK2MEEoMRYUVjzrxb1/LunHhmHSPxfOGQDeQaGxgz1yZvOtrQ7dpaXB9xS740db27WJF70WKZu7pG6A4s+F5EBoKK1RHC8o2Qq26hnSFF++g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6916009)(54906003)(186003)(86362001)(26005)(83380400001)(2616005)(1076003)(316002)(6486002)(508600001)(6506007)(5660300002)(6666004)(4326008)(82960400001)(8936002)(2906002)(36756003)(8676002)(66556008)(66946007)(38100700002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxNdlZPVWtjbDAwWUhydkhMVHlKeWNqTCtVajdQcWRkVk55NHorYXdYMXRn?=
 =?utf-8?B?ME84cFk4YlhwdVlDZXVkbGxTZWRHU3VYajFMc2ZOM0lDT0JGMytjcER6bDc4?=
 =?utf-8?B?Z3grb3BYRlhEaGVNRFMxRFFrVlg2dGFvS0M0aE1pZDl1N1pta2huYXVOWXBy?=
 =?utf-8?B?aU56ajc3clJDcUltZTlTcXNERzNGaTYwaVZxVEdsajBGUmVnOWFLVlU3azNz?=
 =?utf-8?B?cXgweXNhTkM1dm1rMHVaT25tcGpqc1dvWVFKN0E5cjhXcXloR2YyN29peEF5?=
 =?utf-8?B?NHI3REtWaHJ1bW1WNy9GL1NQQlU1SEpqM0NkZWZlSlYxL0luQ0g1bW00MlhS?=
 =?utf-8?B?N0hvUlVMdzN0d05iZzJDS1RhZm5IcngwTElvQm93OUxjK1ZrcTNSYmYzRVg3?=
 =?utf-8?B?YjIwS210Z0lPbG5CNE8rN3ZtR0tIQXI4bjVDNHhyNkRkV2JKTURnSjlvTHph?=
 =?utf-8?B?QTNVL1doL3REcG5wUVZJNlVjR3ZBMlM3b1pnblVvRXVqQ0p4Qks2QWpWbElY?=
 =?utf-8?B?ZXljWjhFQkgyNGNvMUd5bUdaRTI2eTZmZDJnYVplMWo4aC9NNUFFZXJXN1ln?=
 =?utf-8?B?cTNpbDU5TVAvaE1FdWhWU2dwQnBjblNoS0kzWEt3SnNtVmt2YXdMYU9Jd3RT?=
 =?utf-8?B?K3JqV2d1U20yQlZBWEJYNjZoNjV5NlY3bkpuSXMzQ3lyZy8xeGFtbUIyejFI?=
 =?utf-8?B?RFMvZWQ1RXkwM0ZjbTNDN21YR0xiTVNtUnhGZFNDY0Q4K0x4WXFZUnBuaExR?=
 =?utf-8?B?QmRrNUFpZzhJU1pDQjhOUzJWeGZUSVl5R1BkNFovalBudVMyc2pORmVMZ0hY?=
 =?utf-8?B?cHFIV1VJcmIrMUFucUlLTzNDRXh0RmVyckVjVEUrMlhpTVdCUFNaaUdYT2Vt?=
 =?utf-8?B?ZitXeTVZMU9BTzRlL05OdGd3QzZnNWJIZC9MTy81UHhvNDRDZWhrYnpqekF3?=
 =?utf-8?B?WUNFNjBZQlRSTUFVMURETm85SFFJN0x1Q0FLdml1Y1FjWnhZN29kWlZib2N6?=
 =?utf-8?B?MXRxcm1jVUl6aFA4WWpLdm01aHVDU2JVb2ViL3lmS0MrOWlvUW9NbU16enJU?=
 =?utf-8?B?amJZNDVVNGN0MFNUYmRnZGdhajRabzJhc3V3R2hOWVhTdHlreFE5WWV0V3du?=
 =?utf-8?B?eVA3dVcvdWthK2toYVdvR2xBek1VVEJlYjEyNUpCRVZGM3EvZ01MQXhHSDBG?=
 =?utf-8?B?Q09YdDF0dStlRkR6L2QraXEvbXliTVBEdXhLU0ZkaTllRnh1aEdnSFlpN3Z4?=
 =?utf-8?B?S2cvdDVsT1ZNT0djOVlvVFBXQWRDc1gzSk01cGtCb1R1THFNS2RYc2x0bWtt?=
 =?utf-8?B?a3d1RndSZXo1OHYwOVhQWUtFU0wrTVNZTWF3WFd0eTM2bDZKTkx4NE54RXEy?=
 =?utf-8?B?dU5tOFNqQnNOOTVZZkY3WDVJTE40MzhrTitucE1pNXgzNHBCemxhbklEQWs5?=
 =?utf-8?B?dnA2MTRKL3NWazhiVUZtdzN6ckVEeTlCN1JGOURpLzVQOFQ3M3JDTFdPR2NN?=
 =?utf-8?B?N2RtWTQvZHVkQkFncE9JZG5WN0ZIUmd0UU5jMk1jeFBmdzd5NlVPUHEreTN0?=
 =?utf-8?B?M1c3WDFqejhiQkgrSmpTeFNuMTIyREtJcks5M2RRYWZJbko2MXFlTHNwMEF2?=
 =?utf-8?B?R0o3VFlROUN5U2ZkMmJWU2lFTDNvM2UxRXpZeEl6OWVjV3RqaUVveHhiYStr?=
 =?utf-8?B?QkVyS01mcDZCSlBkeTJoeEoycEo1VlFPN0pCckI0dTgrKzY3V3JodjJwNG41?=
 =?utf-8?B?YjJybXFCQjRzdEE4cWsrTlA0Z1FsQm9BYWtMUGxFYlJMaG9od2M1bUo1bW8x?=
 =?utf-8?B?K1RBWUZFV3hXQjIvZDVSMzJOVko0UjlWNWRNU01ZeDBzeXQ1dThLVlhieldj?=
 =?utf-8?B?WFZQMDRobFlJcGtxNlRSKzdwQUVoMDBpMk13ZTUzTGZQQ2JIMUlZb0EzbmpY?=
 =?utf-8?B?TllOMjNrTDJsbmFGNlhMT3hGN3FQSUdQN1RXWkZqZGhSV0g5WjEwZWdpSnJG?=
 =?utf-8?B?UWlRQ1dhK1BTUDZqc3JSRFJseUMwYUQvaW5HekRvZVF2TDhHR2tuMzVWZUVo?=
 =?utf-8?B?Nm8wdkUrWFVmV3Q5NVBMbWgyYm1qbkRWL3RRRTJYZjZXUitTL1hTUXdjL2xo?=
 =?utf-8?B?RExHMUxFa3FsbTNTRWxrSjZnY1lXb2tWV0F0SVdlOS8rbjhUZGY2TmdyMWl2?=
 =?utf-8?B?UE95Yk11MVpZNi9OV1hmRGcyKzhWZVp2emtVT2hkeVhYVjRnRGhWK2NkRWFB?=
 =?utf-8?B?UlF6SGFGK2FaeU11SStxay94amNURzRBemMxUVNHZGcwSWFMKzJKSjZSd2hz?=
 =?utf-8?B?THNmOUhLWE1Obzc0L3ZvRE1xbXVPcGZTQWo0aDE5NjRvT2xxN1BUd25aaDVr?=
 =?utf-8?Q?0kImyv53j2h1Mgaw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eed729-6337-4ed0-c6fa-08da186f384f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:18:39.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1slDTW3ka4/xtusxo0OB1QNN2hLbgLQJ0WFF2fxYhT2BINgmUSDi0c5RjpwTCsrGFQS5OoLtW6JDJVfwBHHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3235
X-OriginatorOrg: citrix.com

The values set in the shared_type field of xen_processor_performance
have so far relied on Xen and Linux having the same
CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
public interface.

Formalize by adding the defines for the allowed values in the public
header, while renaming them to use the XEN_CPUPERF_SHARED_TYPE_ prefix
for clarity.

Set the Xen internal defines for CPUFREQ_SHARED_TYPE_ using the newly
introduced XEN_CPUPERF_SHARED_TYPE_ public defines in order to avoid
unnecessary code churn.  While there also drop
CPUFREQ_SHARED_TYPE_NONE as it's unused.

Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Keep CPUFREQ_SHARED_TYPE_ and define them on top of
   XEN_CPUPERF_SHARED_TYPE_.
 - Use CPUPERF instead of plain PERF.
---
 xen/include/acpi/cpufreq/cpufreq.h | 7 +++----
 xen/include/public/platform.h      | 6 +++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index e5e58c6c30..35dcf21e8f 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -78,10 +78,9 @@ DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 extern int __cpufreq_set_policy(struct cpufreq_policy *data,
                                 struct cpufreq_policy *policy);
 
-#define CPUFREQ_SHARED_TYPE_NONE (0) /* None */
-#define CPUFREQ_SHARED_TYPE_HW   (1) /* HW does needed coordination */
-#define CPUFREQ_SHARED_TYPE_ALL  (2) /* All dependent CPUs should set freq */
-#define CPUFREQ_SHARED_TYPE_ANY  (3) /* Freq can be set from any dependent CPU*/
+#define CPUFREQ_SHARED_TYPE_HW   XEN_CPUPERF_SHARED_TYPE_HW
+#define CPUFREQ_SHARED_TYPE_ALL  XEN_CPUPERF_SHARED_TYPE_ALL
+#define CPUFREQ_SHARED_TYPE_ANY  XEN_CPUPERF_SHARED_TYPE_ANY
 
 /******************** cpufreq transition notifiers *******************/
 
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index a4c0eb6224..8100133509 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -465,7 +465,11 @@ struct xen_processor_performance {
     uint32_t state_count;     /* total available performance states */
     XEN_GUEST_HANDLE(xen_processor_px_t) states;
     struct xen_psd_package domain_info;
-    uint32_t shared_type;     /* coordination type of this processor */
+    /* Coordination type of this processor */
+#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
+#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
+#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
+    uint32_t shared_type;
 };
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
-- 
2.35.1



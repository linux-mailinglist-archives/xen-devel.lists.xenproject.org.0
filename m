Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977D49056C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258041.443922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OdY-0003JW-U1; Mon, 17 Jan 2022 09:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258041.443922; Mon, 17 Jan 2022 09:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9OdY-0003Gu-PH; Mon, 17 Jan 2022 09:49:16 +0000
Received: by outflank-mailman (input) for mailman id 258041;
 Mon, 17 Jan 2022 09:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9OdW-0002gi-Ik
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8925665-777a-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 10:49:12 +0100 (CET)
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
X-Inumbo-ID: b8925665-777a-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=W5pxdwQqMysZPVE+sPNorSRWEA6/ol2TOm/u2VyLMiM=;
  b=Np9kP/aJQ49aHGYfid91nwt/UupFaA/dIzEJKItqR+sFXvM8PdJaN2el
   CP2KOipow1ufmSYr2iKBXfHHIy2sgGZAR4B5UALn7tUdduwEXTTSbE4Am
   VsH3xIb61Q/s3oYG/ohQ2zPdj7VgkGxuoAWuCoUWjcqAC0kYc7OWQTC2K
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qTlKfe1ZZ+AmLjb52rVQcOL0KTM852hOEC6EjY2odKymqeqOO41uHWEe/ZUEucL48bcDPEUZRw
 j+35wGL9ir49ia2Au4/hJmHrssuV4ir5p8OI3eYtH/SGDl9BIcrKyal3zEVWJ3eC+yyouKCj7n
 RvM7ALtT+cWkR3vEWSfZGTqZvF4l84Zx+HIkvUInDwLiPr+u/ooOMEi6zJQiuMMscQHd+1Vcvr
 bnJKi99rDA6GKbcQt8jChwX6BW7gG6rBgZDJ9TQPk+elTVEjLKl9leRKF/wpJlXCieAT6eQ57Q
 W5TUP+WXC5FPen7Do8RvEhcP
X-SBRS: 5.2
X-MesageID: 62053269
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:H9oTDahkED1EycWIKtLdjsPIX161iBcKZh0ujC45NGQN5FlHY01je
 htvXTzQPfnfYWr2ct12btm2oxkE7JTRzoJrSgVkrykxRiob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcx3oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /10iaDuFlwRDJbrlelHfRZlSRAvYodZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3JgTRqyAN
 qL1bxJCZRf+cjJTO2wSM74Fpdypm0vNWT5H/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalicgZ4QPSNUI0yaAx/D67DvDNzlbZCEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP/D2BLwQKChRqlEGp/ZgPb1
 JTjs5LPhN3i9bnXyESwrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL5Jt0Au2EieBk5WirhRdMPS
 BWO0e+2zMUCVEZGkIctO97hYyjU5fWI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jOF3rghjmzK7bc2rnnyPjOvFDFbIGOhtDbd7Rr1jhIuevh7v+
 spSX+PTjU03vBvWOHeHqOb+7DkicBAGOHwBg5cGKb7YfFs3QTFJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXdE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:jDc7aKuYXn2UWEX54HGTQA0y7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hsAV7CZniahILMFu9fBOTZslvd8kHFh4xgPO
 JbAtND4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNz2CA5sQkTuRYTzrdXGeKjM2YKbQQ/
 Gnl7V6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9dVfYd1P7srhJJGdZc8qPSMex7wqGr3QRqvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62053269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4KPoWSOqJBCB/kkZi1NdQtkXoWgZ8vuSuNf16r93kuT3XAvxd1YmeKQOUzEsYEEBWQE0Mw+Q9tckjoRW64qyBtcEDPk2ASUHJe4zN6f8rlpwcMboAJm9GVneGoBFTiAOkKNV6aXg3kps+7RQH965NdqlaxPjZDzhuykWuZrOtl2LAEyz4gJFDkDmk8BCpINDg3AjQ9S+bZUD2KBtBk/yYB4yEPqntvi6cfpO1GpBCAn8DNR9fSPWf4Ti9Fyk6YbjfJjGxg3qDqS58Q30kjlNVVxoH9tAQTbdi5ra4I/a00wB1Fx8OqpUzScIy+Cja0woSzYW2hgS2WYGW9KIm7SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9+702mCtiIIBJRcU6EH6oz52cs5/19MUClB4O9/ed4=;
 b=bxrEowCZoRYxAsqJwDSy68I3MvImUG1MKmV0ArGwtfJHWHHNT4Q3LjW9pEUMCpqq1alIlBE9PRjLQ00S56yOLJrvl90ZwPsXuODJmhqSx/l8GQ15JJ5BOblCytC0uuSXuq8JNtjIs5Movkxg8tpny/dwbjMbMumC3MQodMOKgkkuUzeFgGuDHeJA7BKBHflyq5589nDidWmQlvd2+d3ePgC2ZT8IUUu9u+owcwRFbqhtmI2dpjH0RYf6gF1WD4sGdutcwXrTLCb9GuPK/tp0KI/j0DPK6dNmvKUGoMO8E30NaAiFW1P6KxF/0CQEEHC67z1aG8rl1Cenj+liHKjYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9+702mCtiIIBJRcU6EH6oz52cs5/19MUClB4O9/ed4=;
 b=V0To2AxthW6jvBr56Zs12RZsse6CR67bBESZbrY22Ltex0vh/2YLbuJKbkJxnpazOWFL8W061vKCbJUFMqN5OZGfBoDG5H+a2wGMhY/GBTBwOecBDAvxQKjCBhhkZ2PwaqRAf0C91tLaCo4DSGrHH7EgOISa5yIsADJhMtOdV+g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [PATCH v6 02/12] libx86: introduce helper to fetch cpuid leaf
Date: Mon, 17 Jan 2022 10:48:17 +0100
Message-ID: <20220117094827.16756-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c189451-aa07-4286-bd65-08d9d99e9b14
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059D96331C0FE956830697C8F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1UJpmelXSNOopWx+o8MFio6VT2w92DyRyJ0Q9VUqOU9ue92edtHFF1KEYzu2gLcNTBKyM5C73vMZZf7ynR3xPUce1DPg+agrNwd967+O9BxgMbfLFIZ1kxFBc2ZpYc7eESf5BwEvkFtjtRwINC7NPTHypuej87cd9wOd2eTnT6VUwczL7+CzRsUj8JykWG5kFcg7DHCPImxR4zA6HrshS/Hl3AUVdDNzjsyrp7MBXv+DtzoDJSrNuKxuG8V7qSTAMvVOlWP9pAbOOaZkE2ewq+jxoUPb6QrVSGjc8b1hnQ+eMzaGdbpN1Qu/CJK5rAwLHOIS4Ry1lSlmIhfHt10iDJYyoxScWKMazPwYC3oqqSRz4dOs3udja86MnQM6G4kri5HvdVRRGE1k0A9o8gaUbuNnPIQt6yTOuSfoCO8auALkf7bRv9+Bs0CisY/ZbG6gEGKzv0ASFuVMcVGWE3yV3+sIp1j9wnVt+0vomi9FzACDmvqxs8VkwGluGiy5lMsN152mfeO13AcFaDDm+HX/fORZ55pQ2HNkPA+a9HhTkmAADHTsg8Gmjyq4lNc0/FF5pjKxvhnuBJYHRWYsCraLIPUY/moI3L3PPImTIi5qwsmzwm65j6inAUNhfAVkvuuZB5XaNgkup+w2xRDzzAcC4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(107886003)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWF5Q0FPd2M1M3F2cTZwZlJYWjNCMTZKd2psL1hka1JweXlNWStOby9MR0FX?=
 =?utf-8?B?ZXJNM1NheHdmWmhhMkh5disyUnF1a2RIaFBINmNvbjFHNkZjRXlBL0kxdmVH?=
 =?utf-8?B?RUhCdkFLMDBYQ29td2ZhcGpQL2RJR3hGMWZXZVlycjBjdmd1YVRBSEVvaFdK?=
 =?utf-8?B?V3JSZUtYdkg2WW1HSm9Ec1MwbkhTRnVuS2FlNW1LUkNETjUzYzYzajhiZVJP?=
 =?utf-8?B?VDYzSU9UNWErck81TkRpTXpTYU5vZ2k0NTBhRWlCWmhiNjV5VmR3VFYraDQx?=
 =?utf-8?B?V0IzNG1XdHBKNitJeVl3TTJMRjk5bWFGNTdCS1YvTXhyYTByZWQ4ZW45ZFll?=
 =?utf-8?B?Z0JCVHRNOFhLVTQ0cWRUUi9JVUpYMVUwajVUNGlhQkJ5TUswU0RCYS9zRUNK?=
 =?utf-8?B?NzVxbUNhbWNGUXY3TWl3U29rQ2JmKzlGaXQ5bWpmcFRHNWxFSlA2ZW50Ny85?=
 =?utf-8?B?SG9UZFdPYmRQOUY0aXdJdFVFNXhxenppdWFNVFZKR3plSGpnazVTLzZlTGM1?=
 =?utf-8?B?VFA1WXVrc1JrNVl1N0lCVVVIdElzdzFhK2NMd1pRYnF5Uk0vcVo3WjVHQ2pJ?=
 =?utf-8?B?aVdxWU1sVFU5THY0dFNjSkRhTzkyNW9jRU5mVllmNGhJbHEyQnBMV1o3aVNY?=
 =?utf-8?B?bzNBV2IrNEI4N0JHd1RUN0FsVjZQRmdHUGc0NE5IUVZXSDBMeGFCZnZqcjJH?=
 =?utf-8?B?cHl4eng0ZDJsTVBPeFhtSlgwTmdsRW9NajlWTktXWm43Nnp1TXBUU1g0VXhB?=
 =?utf-8?B?OGFoYk1CRVZKMTYzam1tTjBTejkzYWNXTFJOOVRWSkMzT0szaG1xeFRScExD?=
 =?utf-8?B?d01EUlJUOWo1SUZJNCttWk9Va0d2dG5YQjFsM0MvNmRaQTRpS2xoRkg5NDli?=
 =?utf-8?B?aVhnRDZFRmdoaVlXb0ZJd284YjNzQlhwd1EycUN2d1VSRG44TG5Ia3E5eXM4?=
 =?utf-8?B?VEdnU05WN2NtZFRBditOTFdqdGt3Q2ZkN0lEVFVod1FhMVQzekZTZTdkNFJD?=
 =?utf-8?B?YUx2bXZ4Q01SNFFxbFcrUHI5M2dGbTRZZFRiaHFnRmVlMVFTMFpReUdEQS9G?=
 =?utf-8?B?dDBrOFZmczdiWlJlMW5YQ0c5YnhsUjk1QXhyVnQ2c0JrSjBNeXZkdzhFMVZF?=
 =?utf-8?B?TmxYZVJZZGtFTmQ2VlhSQi9odys0YnlJSllTdVM0SFl6bFpoNEpwaU9jRkNF?=
 =?utf-8?B?OHhGSWVUOElydDJlT3BBZDNIM01Pc0t6RjBvdU9Ga0xQTExsWVdpOTBVd2Z5?=
 =?utf-8?B?WDZaT09jbHNsSjlTZWRxNmpZRzRTR1gxUEdjMGtBNlJwNHNRRmsrNS9UUi94?=
 =?utf-8?B?QnVpaDhiWElLK2xub0xQU0xJUEZ1YjFyZHc4cVpGK3pNeHVSTitJNGJPdnVC?=
 =?utf-8?B?NWoyNVFqT2hvbDFRM2s5TVNSUnNpQ0NlV0RSdUhWOVFncVV5ajJ0Rnl4Vk5F?=
 =?utf-8?B?bEhYeHBSYmp1MXI5YnFhOFVCQTBCS3BtOStLWVRITVZOcG1iNjRydlovMXZ4?=
 =?utf-8?B?eXpveXVxL2RvcVU1TS9VazE1SC8rc1dmTUlNeVp0RCtEcGV1cUE4VmZabCt3?=
 =?utf-8?B?WFZwSlFBSjRXQVNIcmpVUG93VEFTQ25MWEJVTHRSZzJmVHgyYW9INThRakpN?=
 =?utf-8?B?OGkrcS9zRUNIVHU4YXQzMDFocmRhalVQTmRQSElqTnR0bUM3OVZtUGhsWHh6?=
 =?utf-8?B?VVllbzVKQk1vYmZrdEVLREorM296KzU3cThXUDFNeUg0NkFpTW9SUVE0QXU5?=
 =?utf-8?B?eVNJb1d2Ny9FMk5IWCsxQkRnWXByb3kyR1d3UVM5KzBCc1pYWk5BM2FhUnpO?=
 =?utf-8?B?WHpVWDVacUVWM2hmczdNeEVLUG0vUVFNS3FTeVpreEQ3RkVlek9nUnFUczhI?=
 =?utf-8?B?VDNYUHlaaTR1dWxFcmgxM3NueDROQlZmQWppbWl5SlMrYS81QXNNbW5zd2F3?=
 =?utf-8?B?OU84RE5SNU42NzFTb0d6akhkOUYxazRpRVhmYldXdkhVcGloNy9iSkozbEpJ?=
 =?utf-8?B?RE42b3J0SmxEdzZhOE54bUdMMU9CM0hSSmMzZTJwSXNJNU5HUGR2NjFlckVs?=
 =?utf-8?B?K0VOeUlSRXV2a1NnUU5ycTE5M0g3TDhwRXl6Qnp6UnQ5d3hyZzRMUm92enB3?=
 =?utf-8?B?UTdjaVgxYWdWTm51YkhuY2srWTRWRWx0cnZJRTVWRzZMN1VrMGlvZkJ6QVVV?=
 =?utf-8?Q?0L5qs7VXYidln6x7bO9EZbY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c189451-aa07-4286-bd65-08d9d99e9b14
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:08.0474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmBtm/ciOMLALYZPD9xuCrAtQcwwktzCUxoKpHiGMAtVX7mZlXPpthxnpZTnm1cSrxwWWhH83JHdBAGQX3322A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Introduce a helper based on the current Xen guest_cpuid code in order
to fetch a cpuid leaf from a policy. The newly introduced function in
cpuid.c should not be directly called and instead the provided
x86_cpuid_get_leaf macro should be used that will properly deal with
const and non-const inputs.

Also add a test to check that the introduced helper doesn't go over
the bounds of the policy.

Note the code in x86_cpuid_copy_from_buffer is not switched to use the
new function because of the boundary checks against the max fields of
the policy, which might not be properly set at the point where
x86_cpuid_copy_from_buffer get called, for example when filling an
empty policy from scratch.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
 - Rename _x86_cpuid_get_leaf to x86_cpuid_get_leaf_const.

Changes since v3:
 - New in this version.
---
Regarding safety of the usage of array_access_nospec to obtain a
pointer to an element of an array, there are already other instances
of this usage, for example in viridian_time_wrmsr, so I would assume
this is fine.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 75 ++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                     | 55 +++--------------
 xen/include/xen/lib/x86/cpuid.h          | 19 ++++++
 xen/lib/x86/cpuid.c                      | 52 ++++++++++++++++
 4 files changed, 153 insertions(+), 48 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index ed450a0997..3f777fc1fc 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -570,6 +570,80 @@ static void test_cpuid_out_of_range_clearing(void)
     }
 }
 
+static void test_cpuid_get_leaf_failure(void)
+{
+    static const struct test {
+        struct cpuid_policy p;
+        const char *name;
+        uint32_t leaf, subleaf;
+    } tests[] = {
+        /* Bound checking logic. */
+        {
+            .name = "Basic max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC,
+            },
+        },
+        {
+            .name = "Feature max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT,
+            },
+            .leaf = 0x00000007,
+        },
+        {
+            .name = "Extended max leaf >= array size",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+            },
+            .leaf = 0x80000000,
+        },
+
+        {
+            .name = "Basic leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = CPUID_GUEST_NR_BASIC,
+        },
+        {
+            .name = "Feature leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
+            },
+            .leaf = 0x00000007,
+            .subleaf = CPUID_GUEST_NR_FEAT,
+        },
+        {
+            .name = "Extended leaf >= max leaf",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
+            },
+            .leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+        },
+    };
+    const struct cpuid_policy pc;
+    const struct cpuid_leaf *lc;
+    struct cpuid_policy p;
+    struct cpuid_leaf *l;
+
+    /* Constness build test. */
+    lc = x86_cpuid_get_leaf(&pc, 0, 0);
+    l = x86_cpuid_get_leaf(&p, 0, 0);
+
+    printf("Testing CPUID get leaf bound checking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( x86_cpuid_get_leaf(&t->p, t->leaf, t->subleaf) )
+            fail("  Test %s get leaf fail\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -685,6 +759,7 @@ int main(int argc, char **argv)
     test_cpuid_serialise_success();
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
+    test_cpuid_get_leaf_failure();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index b5af48324a..0407a54626 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -825,48 +825,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     switch ( leaf )
     {
     case 0 ... CPUID_GUEST_NR_BASIC - 1:
-        ASSERT(p->basic.max_leaf < ARRAY_SIZE(p->basic.raw));
-        if ( leaf > min_t(uint32_t, p->basic.max_leaf,
-                          ARRAY_SIZE(p->basic.raw) - 1) )
-            return;
-
-        switch ( leaf )
-        {
-        case 0x4:
-            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
-                return;
-
-            *res = array_access_nospec(p->cache.raw, subleaf);
-            break;
-
-        case 0x7:
-            ASSERT(p->feat.max_subleaf < ARRAY_SIZE(p->feat.raw));
-            if ( subleaf > min_t(uint32_t, p->feat.max_subleaf,
-                                 ARRAY_SIZE(p->feat.raw) - 1) )
-                return;
-
-            *res = array_access_nospec(p->feat.raw, subleaf);
-            break;
-
-        case 0xb:
-            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
-                return;
-
-            *res = array_access_nospec(p->topo.raw, subleaf);
-            break;
-
-        case XSTATE_CPUID:
-            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
-                return;
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+    {
+        const struct cpuid_leaf *tmp = x86_cpuid_get_leaf(p, leaf, subleaf);
 
-            *res = array_access_nospec(p->xstate.raw, subleaf);
-            break;
+        if ( !tmp )
+            return;
 
-        default:
-            *res = array_access_nospec(p->basic.raw, leaf);
-            break;
-        }
+        *res = *tmp;
         break;
+    }
 
     case 0x40000000 ... 0x400000ff:
         if ( is_viridian_domain(d) )
@@ -881,15 +849,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case 0x40000100 ... 0x400001ff:
         return cpuid_hypervisor_leaves(v, leaf, subleaf, res);
 
-    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
-        ASSERT((p->extd.max_leaf & 0xffff) < ARRAY_SIZE(p->extd.raw));
-        if ( (leaf & 0xffff) > min_t(uint32_t, p->extd.max_leaf & 0xffff,
-                                     ARRAY_SIZE(p->extd.raw) - 1) )
-            return;
-
-        *res = array_access_nospec(p->extd.raw, leaf & 0xffff);
-        break;
-
     default:
         return;
     }
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index a4d254ea96..050cd4f9d1 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -431,6 +431,25 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
 
+/**
+ * Get a cpuid leaf from a policy object.
+ *
+ * @param policy      The cpuid_policy object.
+ * @param leaf        The leaf index.
+ * @param subleaf     The subleaf index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * The function will perform out of bound checks. Do not call this function
+ * directly and instead use x86_cpuid_get_leaf that will deal with both const
+ * and non-const policies returning a pointer with constness matching that of
+ * the input.
+ */
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf);
+#define x86_cpuid_get_leaf(p, l, s) \
+    ((__typeof__(&(p)->basic.raw[0]))x86_cpuid_get_leaf_const(p, l, s))
+
 #endif /* !XEN_LIB_X86_CPUID_H */
 
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 8eb88314f5..924f882fc4 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -493,6 +493,58 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *p,
     return -ERANGE;
 }
 
+const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
+                                                  uint32_t leaf,
+                                                  uint32_t subleaf)
+{
+    switch ( leaf )
+    {
+    case 0 ... CPUID_GUEST_NR_BASIC - 1:
+        if ( p->basic.max_leaf >= ARRAY_SIZE(p->basic.raw) ||
+             leaf > p->basic.max_leaf )
+            return NULL;
+
+        switch ( leaf )
+        {
+        case 0x4:
+            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->cache.raw, subleaf);
+
+        case 0x7:
+            if ( p->feat.max_subleaf >= ARRAY_SIZE(p->feat.raw) ||
+                 subleaf > p->feat.max_subleaf )
+                return NULL;
+
+            return &array_access_nospec(p->feat.raw, subleaf);
+
+        case 0xb:
+            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->topo.raw, subleaf);
+
+        case 0xd:
+            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->xstate.raw, subleaf);
+        }
+
+        return &array_access_nospec(p->basic.raw, leaf);
+
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+        if ( (p->extd.max_leaf & 0xffff) >= ARRAY_SIZE(p->extd.raw) ||
+             leaf > p->extd.max_leaf )
+            return NULL;
+
+        return &array_access_nospec(p->extd.raw, leaf & 0xffff);
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D64BBA60
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275486.471384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3sC-0003wf-Oh; Fri, 18 Feb 2022 14:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275486.471384; Fri, 18 Feb 2022 14:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3sC-0003ud-Jy; Fri, 18 Feb 2022 14:04:36 +0000
Received: by outflank-mailman (input) for mailman id 275486;
 Fri, 18 Feb 2022 14:04:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL3sB-0003uX-6x
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:04:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1e12dd7-90c3-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 15:04:33 +0100 (CET)
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
X-Inumbo-ID: b1e12dd7-90c3-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645193073;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=uO04jYTwFolGGSq5mq8Wfiylf/SJH6GDhgE4weFwY9Q=;
  b=eNTuSJ12kbTAU/yvjDTzNlP5nFLwDwUi49FQxRyYJYiHuP6uoTcxIVIr
   V3/6RgQGYHtzOQOwqmcwuwr026aquEGqaCLKhzhk+Be8BxAoVjIH5qzUG
   s6qDkFkbhBTRzCNk/a6l2gdhCViy3pxgl64m6oVj9WdWjOHNry5ZCeW27
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 63957588
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tgbvSKkhDWX62wYNj8TMz8/o5gyLJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKXWuHPP7bZzSnfNhwYI3gpBwAvJ+Hx9EwGwdlrXtmESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWlPV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYEFsOHf2ViLsmED4DL3pbLPFK5pzCPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHMmsyM0mQM3WjPH87I4wHof+Pr0XybjNz706ZgYYNukHMmVkZPL/Fb4OOJ43iqd9utlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ/PxthEaUwDVJV00+Wl6yoP3/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZFB/1zQ7QqtzrO7fHouCOIWmQabTtePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp/ZgDQ1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGwnfhsxY5paIGWBj
 KrvVeV5vc470JyCN/IfXm5MI55ykfiI+SrNDZg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CrOmOXCPqdZJRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:YcXoGK93FUuwJdXr1Y5uk+F1db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQsdcUjpAtjOfZquz+8J3WB3B8btYOCGghrlEGgG1+XfKlLbakvDH4JmpM
 Rdmu1FeabN5DtB/IfHCWuDYq8dKbC8mcjC74a/854ud3ATV0gJ1XYjNu/xKDwSeOAyP+tfKH
 Pq3Lsim9PPQwV0Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInNy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0WVjcVaKv+/VQIO0aWSAWUR4Z
 7xStAbToJOAkbqDySISN3WqlDdOXgVmiffIBSj8AfeSITCNU0H4ox69Nhkm1LimjsdVJsX6t
 M040uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pUVFZ9l/1XwKpuKuZJIMs60vFTLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpU+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOGl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hCwlgF/NKggF5vsulKSRi4eMMIYDaxfzOGzGu/HQ0ckiPg==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="63957588"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCJU55CEvRyrLtgg/FTLdp74h9x4WDCItbUw8/NeCPodUKiPFDiRciZfnrhQp2Uj3t43dAUAhjDhKI/zzdnFgFjQEvev3Am/aNTSt51lQKnBehU6ZE70msjRxrRn7NGn7p+ReYO24d3TrgWyydu4pJhR0ANaFmhwA01VDrUwI/dV//02nOK88gy+RAgsmU6kOmlO/gucESlUOn8b5KNOjzQp1Lg2LAIWsFMT/0C0Y3zZQKPwYPH8yXbPNnEvobpjNnBg1nfGtSxbU2Yn1fQRI8HZNCI4Mm0ssmb+/Bh8VNxMgHMl9YE38yfkuPCf1cr3xBnOt8Txih4LuT/e3KkyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO04jYTwFolGGSq5mq8Wfiylf/SJH6GDhgE4weFwY9Q=;
 b=NvhZvBEaXyMgccEDqpT8arrd8ul7SIGiFByyDTuXaFOk9IJ2YE3JgYMnJWB6mKKFAiAKit9KffKdniMPlMXWY34ZDlRMd+1YAN17zXW3J7lcY6F4nJYwywgVtuV7HKX05mNQl9DX4XDBYg1d/ay+vYyL7pyf8iaUBfNwSWi1ZSB7hIZ8Lc3ZS3jnDVatGHrGxXeMZedxzToOpBmvkyMsrK4VA8FIX2ffycxmU1yMWW2hC6KCvGWi4baIfKIlkVsrH7C/CLck1lt4kho+0FmT6/QS8JhZT5cw3mnn0O2iBR5pzpQBmiGOGApER22sa6LQ688MFUczem6kMOp3h69drg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO04jYTwFolGGSq5mq8Wfiylf/SJH6GDhgE4weFwY9Q=;
 b=Wr1C0PKQsesyhuiouO+DR1er10j4e3Em+aOLbjxVILNaAsaqa63TF9IkLt5eNrG8mbiofIX99TkGyDB7RSbcRIdJY84xAJeRkAO32/tVm6xnDftpEA0SmaPgYrq7K/s5zIyXD3CVwwS/NJYcF/Zn3jtkl/0fMjg+LfB1jOqnCeQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Brian Olson <bjolson1278@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: [unsubscribe from xen-devel] Re: [PATCH 1/2] github: add workflow to
 run Coverity scans
Thread-Topic: [unsubscribe from xen-devel] Re: [PATCH 1/2] github: add
 workflow to run Coverity scans
Thread-Index: AQHYJL8wuvXnHhxuC0qfnAoHQI92b6yZOqQAgAAAnoCAABQvgIAAANKAgAAHIQA=
Date: Fri, 18 Feb 2022 14:04:28 +0000
Message-ID: <43c3d27d-e68b-60f6-b0d1-13435276ac5a@citrix.com>
References: <20220218120042.32102-1-roger.pau@citrix.com>
 <20220218120042.32102-2-roger.pau@citrix.com>
 <0eeb8f5f-d049-8a8e-9e65-d1966c21a781@srcf.net>
 <34ebc66c-e55f-3f98-b769-0e73bdf3c2fe@srcf.net>
 <Yg+gwfRqetYoT4Th@Air-de-Roger>
 <a44ed8cb-0bdc-0f6f-fc6e-7f831605a71c@gmail.com>
In-Reply-To: <a44ed8cb-0bdc-0f6f-fc6e-7f831605a71c@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 224fb4c2-983b-4b1f-7e5c-08d9f2e7940b
x-ms-traffictypediagnostic: MN2PR03MB4605:EE_
x-microsoft-antispam-prvs: <MN2PR03MB4605B51E8C5C231B55CB43D6BA379@MN2PR03MB4605.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ddzMqZNqdCfOSB4ab33TV0JGWU3KVHSaMz+3mwsY10llF+DYzbKKJhBtx0lvA0dZ/Fg4rcsNb+PAkbQoHuCrHr1I64WpI6/kYTXBX5tpIWUiWd4Sc6Rg30sghgllv1pk7be578DDx7FvB/Csj4N9XoT338BQftA7VkKULcZAsyXANNWlInhvN9fY82bmWqe1z/HKj2MAQgtT6/7lIoGE7NHgXcRnr4t5j7YX7Z8y6hO+PseAXvnKww8N1kp29CbKycLXYwtHZzNf2i2UQLW2XXnakR4H16ZyZEADhYrWYcbDFv6mR5rzqWEBTvsW27b1ibz9aeX5xkyQT/2Ap1NoR+ftkzHpG2hPLc5Y6fskE7YeY52UmoQwxMM5dEx/YSPVsvdj3i9GJOpor4cjOIUS2y6RvN9yR/m7tRwptY0it7O7ewK1EMwySgMcY5BNWqywzsXS8gO47DlbOGIkhQq/fON2RGqTBPjisYtgA+0Yg0MQZDs5v4t91WdxXVVw1R78eILuk0EytYV8L7xWgCYrr+2LWXN3mCgpqJz7sfVuepWHkVQIz2QdcENOQI6mUqntRCD6ljW1d/jtmkj3/8/R113zngzjBXg5hu6fiUcoqJRpMIV4HkP39Gc8irZmmf69gE7EltwDHFc1QB/mQ9rxCCcC1h/8Sb+YJPVE/24HS48gsKSI7By68Yn7AzRpC0Haw3mUXOYW8pj1NBN/jGMGLY/0/rJd9dndqZ1BHCXRjeItU8tUdxg1tpcewgdU5kWKFKo2VVSpVz2NMDiM3NZsn/Mtwtm20o/LgkOSNSUdISgM2UYqRBEsLZwsHMkY9Ur8Ma6eDsj30h9/XshFfLhDAl5vXGkhdEyOenaSQK+SBLI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(966005)(6506007)(31686004)(6486002)(186003)(83380400001)(508600001)(2906002)(6512007)(82960400001)(53546011)(38070700005)(8936002)(316002)(2616005)(86362001)(110136005)(558084003)(26005)(71200400001)(5660300002)(38100700002)(122000001)(91956017)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmxJSmxUZFVuZG0zZGFWVm1NWmMyOG1DYk44MWUzeXlKQnIyOTZ3dlBQWUlx?=
 =?utf-8?B?bjJ1d1dTR29QVGVFUEdYOHk5cTBvYzladTFLTmZOOGlldFRSVG1mYUJZRStx?=
 =?utf-8?B?WkxFU3dSdzh3eDRGbHJlV04yVEFydzZkMFltSTF5bDlOa0haMEw0Q1dmMWJV?=
 =?utf-8?B?TlBOZDZNUTFObnM4Tzc2bUFtVGlRU2ZabFRZei9raFhTSFUwWXpCWEcvQzJQ?=
 =?utf-8?B?ajZSc0lpRlRiQ2E4aFVLL3JvNkQ5aXVIZFY0WXRabThhV1h4OWdtcFJ6eWxM?=
 =?utf-8?B?Nis2YUFReFJCNDlpRjE1Q3VaR2V1VlRrSXM3SUJPZEYwdzhDYlZFYnFWU2Rm?=
 =?utf-8?B?SCt1NitmZ2hsMm1VNUVlVWVWaFpqUHgvYW9SekVOQzVkSGI1MHRFNHRCVXBO?=
 =?utf-8?B?bmVRa0M3M2dzZTRTVWhpVTFwTUZZZUlZeEV0eTBrVmZkeUZzcFpGMXpWMnN5?=
 =?utf-8?B?VTVZTmltMEpCNTRYU0pCVGhIUjluRlE5enZvMTF6aXhhdXlKU0haenFuTmh4?=
 =?utf-8?B?MUU5U2I1RHhNSnFpaEJkcDVzVWFMak9PZkdmdUYvcGdpcGVTbnVNSzhwSG1p?=
 =?utf-8?B?Q1pFQXR4d0VJVzcvQkthZDBTc1VzRFd5YXA0dGFJcjZNQjVDWFduRkczU1pP?=
 =?utf-8?B?M210Qml0bkJ5amErS2JhZEl1YWt1Z2VuaXhRZGNxTWxnRE5KRkVLbFJRK2d5?=
 =?utf-8?B?TkE1ek1iMjlLS0pvZzdlUHU4RTVXS0VrRUtLWVE2dTVBQkFzekdwZGhSWFI1?=
 =?utf-8?B?dXVMTmpGNkRKZkdZVkRXdFBjSXlMeTJzdHY0STlYbGhDcURYZ3VPQXh3ODNp?=
 =?utf-8?B?VmtDZFdTdGVQY1ZjMzIwQUt2VVkwWGNmRjRWaURNL0FwTHZBLzhMSE4zeDRE?=
 =?utf-8?B?SUVPTzNwcTkrZ2ZNcnRxbGtoMTVKM2Z2K0lNNkYzbC9PdnBuRlBzeHJTaVBM?=
 =?utf-8?B?U09QMmYvSFVvZFd4TDJMR3ZRTXFLcmFPSTk2NTNWQm0xNnEzOUVMNjFmQldG?=
 =?utf-8?B?YTJnNThudll3OTBzMkx3YTNkRWVZWFkwSHZISzR1dGlMMis5UGcxQkZpdWZ1?=
 =?utf-8?B?T2ptaVV5dlk1d1QvblVDVTBSeGt6N0xXMkJpMEJTR0NDdk9HNk1ueXZQNkpa?=
 =?utf-8?B?amZ3L3RsMzJCc0pSNEYxa2o0MG9qeGFhN2tvaTdYcWJrdS9zRFZ1R2NOS2M1?=
 =?utf-8?B?aUJkUnplVGJhYkU0cU9NVzBsenZZbE1wb05mU3c0V2JtclRKelcyS2NwWHVC?=
 =?utf-8?B?S05JOUJqcXpkNzFWMFgxSXV5SDU0N2tGWkJlbnpqSmxHZWhCUkJOSW0zc1R0?=
 =?utf-8?B?MDhaM0RUVWNWdFNsNWdvakYycDM3MlAwajI2ZGFqMlhPSFpqa0JwZU9hRk5F?=
 =?utf-8?B?TjltU1Evczc2azBOWTFUbmYvaXg1M1NoYjBvTElyM1kwUDVtNVF4NzRnZ1Fa?=
 =?utf-8?B?WHRqL05FaHhtczI5SENiRmRLVWFiNmJSRU9sZ2JGV1FhVmFERlhqTXJQbzhK?=
 =?utf-8?B?YlhJd1BYbk1JNEhZQTZOZVF4RSsrdTlEMEpaRytBYldnT3gvbjRhVjhKWWp6?=
 =?utf-8?B?bkRuVUZpaUpPei8wR1pUUFZqcm5aL0JtaTBqMDJHUXljLytjcXlkUFJFY2wy?=
 =?utf-8?B?dVowSnJUWWZ0bGNxcEMwa1M5VlpxYUpaV3Btd01pUks1b2JVUldzNnZ1MzFp?=
 =?utf-8?B?eTVWeGhOK2pzK3JIVTdoNERZbDZBblRqeitmSW90NFFlYmNCYXlYNVYvTkdk?=
 =?utf-8?B?dEtBR3pMVS93UFNuSjZGM3dpQTBYS3Z0dUNDRDNXRVBsOTdDaDI2NGhHTHF5?=
 =?utf-8?B?UWV0TTM2YmdiQk9lanN6YTZ2SFg5VElPQldWSnlJUVN0NFdBWXhQWW9Ubi8x?=
 =?utf-8?B?RnYwd2RTcmJyemRRaGxRY2R1NWNwb3hnYWVRdXVJOW1VK1JLcEEwT0lPb2dv?=
 =?utf-8?B?RDl4Njk1SlZ3SjZpZk0rUVpLQnEwa2lIenFsRDBucEx3cW1FTENzeEtGNkUx?=
 =?utf-8?B?cnZ1UUFuVzdzOHlqalB4a3NNa3YxRWp4UFMyRjBBQWo2TlBpU2puS25wMGRx?=
 =?utf-8?B?Y2oxVDZseEdQa0xHWjNCRDB0UzJLSEs5ckZLSTdyVlNLaDUyM0lHMlU0T3lo?=
 =?utf-8?B?ajc3YmVTMVVmMGxNaDJ1V0JsckRRelFGUTVqLzQwNlZFVlZXU213VHNQVlE1?=
 =?utf-8?B?OU82UnRaNEM5MFA5d1E5NVJGZWQ2WXpnRTE1V3BVZDhNaTROeTUvV1M0cW1s?=
 =?utf-8?B?QlZySG1DUk45ZXVMRlB2U0ZCMEdRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC778E3BB4B50D43883BB638FAA7C413@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224fb4c2-983b-4b1f-7e5c-08d9f2e7940b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 14:04:28.3690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00cE9j/E8gshUKvHDy02b0B++/rhXq5qacznEPbHLLyNld8UBkNbqqm5qaxONcqEehZaYuk+g0DaFB98ji35GQyCuLHOFlRPy7KHCOx7v4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4605
X-OriginatorOrg: citrix.com

T24gMTgvMDIvMjAyMiAxMzozOCwgQnJpYW4gT2xzb24gd3JvdGU6DQo+IENhbiBzb21lb25lIHBs
ZWFzZSB0ZWxsIG1lIGhvdyB0byByZW1vdmUgbXkgZW1haWwgYWNjb3VudCBmcm9tIHRoaXMNCj4g
bGlzdD8gVGhhbmsgeW91Lg0KDQpVc2UgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbCB0byB1bnN1YnNjcmliZS4NCg0KfkFuZHJldw0K


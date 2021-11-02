Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01DE443129
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220332.381552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvGD-00038y-A7; Tue, 02 Nov 2021 14:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220332.381552; Tue, 02 Nov 2021 14:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvGD-00036J-62; Tue, 02 Nov 2021 14:59:37 +0000
Received: by outflank-mailman (input) for mailman id 220332;
 Tue, 02 Nov 2021 14:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhvGC-00036D-2O
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:59:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d78adae-3bed-11ec-8558-12813bfff9fa;
 Tue, 02 Nov 2021 14:59:34 +0000 (UTC)
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
X-Inumbo-ID: 7d78adae-3bed-11ec-8558-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635865174;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8gu023aN47b+737YY1ykLBFne1697NqFA2mtCoP07lg=;
  b=XF7wC9Qs/lXfpoQxWggFjLqELyICSaGiNjTq+/Dw2dThtoNG91i16BJv
   To3BW7IBXTl0KsgyxxekDdZPMffqjM8f7PuN+ZY82DsrD+mFosJTJOQof
   9Ro9EwrAUt6PA2GZXvLjfvXqusEqmQuI4Mb3JQVwFT36Ys5MPGlz1U150
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mS4kfjS1rtxCVtOIOgesasxYRTT25Qh50f+zHYqn+SuUHbWb1CJ4xy4G9vnCupfEmNp5wADdPt
 Y85QkBBm8nkzHlWjTM+lEzwXq2D0RfDiDYmW+L4iCdLC9EyKOxdoy4MmeOC72DdnLCIeXnvos/
 6olRUOuCNf4rZzeOtJMrvlZX5ocp0VjIs8BLkgOpSsW8zDrBTKnuT2ZgXIvB8MF1adX+N9Kfjc
 GooFOUUybgYe3nOi2z0+5taHc4/1PViLx03kTmnWz2QuK3p8PVezTSkdY8+ydTEtn2HWEgjqfe
 unQH9tiULvj9cwiaWvDAcppH
X-SBRS: 5.1
X-MesageID: 56865661
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N7zQMaiEOzwZZ+4hs6wllSE7X161lBcKZh0ujC45NGQN5FlHY01je
 htvXTjUbKuCMDOnfYx2YIy09EIGv8LVzNYyHlFk+Xo9Hyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cw24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0dkMHrbhwYA5eSlecMVR5bNyUgZ5ZvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2JAQQKiAP
 qL1bxJPSg7uPTltOm0NN7sh2/W0hiTzKzRh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nrP4mDREhwcctuFxlKt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8syPEXU8ffwN7NtElpckxRhgui
 AWytoa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEgnpU
 JsswZH2AAUy4XelznXlrAIlR+nB2hp9GGeA6WOD5aUJ+TW34GKEdotN+jx4L0oBGp9aImK2M
 RWL5lkLvcM70J6WgUlfOdvZ5yMClvCIKDgYfqqMMoomjmZZLVfvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy92
 8xBLPGD1xg3eLS4OkE7B6ZIdgtURZX6bLirw/Fqmhmre1E7RTp+V6eJqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937xs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:1B6ARa3rftVV3D86HeKppwqjBQxyeYIsimQD101hICG9Lfb4qy
 n+ppomPEHP5wr5AEtQ5exoS5PwPk80lKQFr7X5WI3DYOCIghrREGgP1/qG/9SkIVyCygc/79
 YgT0EdMqyKMbESt6+Ti2PUf6dCsbu6GeKT9J3jJhxWPGZXgtRbnn5E43GgYytLrWd9dP4EPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+zQ+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRieerRfb8yPT9GA+czjpAV74RHIFqewpF5t1H3Wxa1e
 UkZS1QZvibpUmhJl1d6iGdpTUImAxemkMKj2Xo2kcL6PaJNw7TB6d69PJkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5weJSFcZ4KUuZkZkIMEjgX5q3Psi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369Mwc/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MF7xGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiIRiYfzQTOmNSSj5uw/zvn9ehTKYd228LAt23FQgMyJeIbW
X-IronPort-AV: E=Sophos;i="5.87,203,1631592000"; 
   d="scan'208";a="56865661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+8WRUuhrO2B4mYjNcl7MNqxUBRyQKX4rTa6o6n1VCCnIIjaYi1nqgtn0/8zQR4UNfjbem+Egu4YTXpFLBq+PSCZaEQS9YdHFsFeYgQNPVqg1vWKLqXvCQT+0+Nb4SbNwwTVNXX4iP1jQQ3VpZuqkHs3YYyX1gxXAWhr6q290vuZZd1ZB8G4yfYW4eBOqz0uOxtZr2OzkN/P0x7zg5495QA9BfZkybjCz8pgLa0Wb5jWWQBsdOJ6V0nyUCz2pfH+0F3wrY7L1hZH9ELEkqC4pPIRz0BGZYK92I/jLRvX7krPCOqaeI/b7qV1sXgA568KqY4IxwsiFZM7bxMIwmZ9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S++vtPwOdNCj2y2NfpBgHT5ySSjxkdoiNpJml/6d3AI=;
 b=bIZsZ0QoW9PW5S4VOFeZdKO3PoWVdkNGbztVlkjUKI0ghITxZlCTkJIZD4keh5YjI7KfNBZ3EjRHCrSgw1cuyQxT10fsZCH+f/cRVuQOh8DqXA+oqVa3iIlcx7sU3cqWwzcDMWqxB93UuqU+Y4h5gEthf6OWvHAqT/s4pCUAT2TSxrQUQ5w6x3whR81O3hHcIxVWyKNvolbQZ/NveSWAlb2lllwAXvXKepT0KSY8MG+4v6sOx0vo0OdbxnYnk7wKAAfe32g6i43ndci5pdm8jvZJH4l5Gbu/8hx4RI/8HkUPmzBP/XGbWrkc9vTI7KoocinjQQaMlRk4HcNQxu2XUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S++vtPwOdNCj2y2NfpBgHT5ySSjxkdoiNpJml/6d3AI=;
 b=DBz2jx6wmU4uWaHmyLW1g2dxTnhXnpunGm1fjbDhCGg2/teOJ0NzvOVQH98J9gK/Up6nFHf8p0rVLxp21E0Rg1J20nb3EnvB43b7XAOvmLzL3UXKua0k63NBVt28QKbKfXx5Jkv2RYEgNI2hJx5g+uiY9msBUzQiUPCMQfgl90I=
Date: Tue, 2 Nov 2021 15:59:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Message-ID: <YYFSTv85MoVdKH+V@Air-de-Roger>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
 <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
 <YYEa6HQGR1cHJBw/@Air-de-Roger>
 <1c604641-0dd9-6912-7bd5-02ee1cb868b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c604641-0dd9-6912-7bd5-02ee1cb868b6@suse.com>
X-ClientProxiedBy: MR2P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5951300-1efe-4acb-2f23-08d99e116035
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-Microsoft-Antispam-PRVS: <DS7PR03MB560745231187CA412B7FBF118F8B9@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6yz36QQaXIJA1XfIYMJ3Vqgc2+feInPMTj3sIDxikeRVmoG9LHtQcWJHq+nvNexnfkIMzs/pmdY/l0JQvroppptrQMlQwSjAFtncTsYCOHbub8H8ZUpvGRNubz/gB1ohOHK31dH+XcFqaANkt4Tv53Zo0yi0bpdrS7XmabCjkdxMsjIOdu7w5Flrrq8seW5NfOyZ8y0gR6xFpX/fseTE8gGWjN9qPeX7OeXZNST64hCDwUHXPUd6O6X+cNiL7cdJXl7t+CcMZV00doq9Og9ZdpRbz1MVwo5ShIgSzwlCqkfHGcqb9QJxYWNjqH8Ty5DzmvEUtsSixIfzsa1c+sPyLDe4Ty60CG9/lsqXfe7ESSuQpUMzHZ8g+lcqCoTzqyOzPCV5gVrRMGYSEOM/PQ6qZ+x9VxSiZUfCwbwGg2nm49SrTwDYyZSBOyAH+rNoAs8BKIVYvGk3R8VGNUON5kxrZwByfaSuFk6X4lE7ddU2i0sBwIutUhr4c46BrIsAgR+O8YaEyZ5LIW8qVowaQhT49l/azFbbNxSMTX9cUiUTzFmVMo2mhH/WlNdTgmRLIT4ma2ipM6ct0NdVVtEvWV1pMVlA0+7sXwghbFXPAtnp94U7B5YYvPGUNs2Aru0seSGPpEIq3WiRZmWA/wVTyvdgTE3xoyj1cptoG7wwE3Ifq85J28Z93VE+HCM+Y36fqxWGWp2JwWLYyMd0FerrwvrNxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6666004)(26005)(86362001)(316002)(66556008)(82960400001)(83380400001)(9686003)(8676002)(33716001)(54906003)(6486002)(2906002)(66476007)(508600001)(53546011)(66946007)(8936002)(85182001)(6916009)(4326008)(38100700002)(6496006)(186003)(5660300002)(956004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1hFcGR2KzNzTUp6YmdlSE5qTkdhY3lMdlpRcEVONjB4VUtZMjJPWnJHOGYr?=
 =?utf-8?B?c20vMS9aWTBwOVpDODVpaHFxYmlJVTM2SDVVTEk2VzF5c1UzckF4V1FoeCt5?=
 =?utf-8?B?WE9WTVlKKzJrSHhhSmc1K2s2SUZZRnhuWHZxSW1kK1NDT3V5ZG8rcUpxTzhD?=
 =?utf-8?B?eHkzcGZ2L0tZS1ppWnVBcThjalY4REMzb3k2THE3eTRDU3B6Y053WjBxWXpq?=
 =?utf-8?B?dTM1cDFKNjVmR05abnBzRTV3bmc3N3JTRTgyYnNqRk0vcHJSZ3VNOGFmZi8r?=
 =?utf-8?B?aWg4d1VzenJESVM2RDQvMjJ2elAyQ0pmbHhtV3c5U1pHNXpoQVJPbHVTZnZa?=
 =?utf-8?B?YXBkTzl0RDBuaUxDeXgralhhQ3p4c0lpY3BzTHdYRVpLOTZaNUFxdkZuQ3U1?=
 =?utf-8?B?L2Y1NTg4VzJvNnc2SG1MVUlSLzgyU2Z0SUY2bVkxVFBubVdrVWhlZG5zVStw?=
 =?utf-8?B?cVcySkZUWmJCOVBwRTQ0dXI3aU5wSWc1WkZYK2JCQ2JsV1hkMUlpa1dyaE9v?=
 =?utf-8?B?MkZYeHFzbkc5VU5mZUFpZTM1NjV5bHdkeE84aHBVS3FzUGFrazJCMCszOTJk?=
 =?utf-8?B?L282eUZTek1nbllyZTZBT2JObStDUVZ0cmtlcGpxQ3VuSVN1M2dHVkR0SUtx?=
 =?utf-8?B?WFhvNDV2di96dzJqd0dSWFNuUDhiTmFOTHNSclZFRlkycFFrNk9VMmxuYi9y?=
 =?utf-8?B?eFZINGcwK1B4bXBDL2pmampnWVI3YzEybGVaeVgxMnpmQlZDUkd1Wm9yeHJ5?=
 =?utf-8?B?ZjFaY1dMalBWSHQ4Sm1KSHRlS1pBRlVBUW1DeVNTZmxMU051YXM1YklobHNq?=
 =?utf-8?B?bzRkRlZkWStoTVRuYTF5RW8xSmxtUndqT2plaWNTdWNQN2o3djlCZUdvUitt?=
 =?utf-8?B?Vk9DbkZvdzBaVTZpVS9jc3FORHBWbVhZaDQ5bXkzY2hjQVpZRWs3ekNCSmtp?=
 =?utf-8?B?VG5FQ25kK0xwNStNY1RLRnduc0p2c3Zxa0ZhNDZNR1phdThLNCtEYnhYdUEx?=
 =?utf-8?B?NGRQWkxWeFR5cEs2MkZDTVV2TmpYdGNKcVRSbjUyb3lZSWNuckxUQ2hFSFdY?=
 =?utf-8?B?M0xIZFJOOGFkRzVscmZhYU9KMFBtNWVsbldQMWxqQ1RqbnVDN2hsdHE4UEl2?=
 =?utf-8?B?azZlZWUxSWw5eU5idmF6a2VWMDFOZ1U1VTFaSGxRRnVadEd2VEwvT1lUTDlv?=
 =?utf-8?B?dVFMMElpRkNJL0g1THZsZ0thR0dZRVhJUmpoTEZhcXFGTVB4M1hxelhJSGVB?=
 =?utf-8?B?S2tLcG1jakFLbjlSWnVubEdueTNVd1R1bkNKd0gwTkFmQWdONHNDckowZUts?=
 =?utf-8?B?eXAxUDlGYXZUU3BrOUE0a29yRk5MRjYzT21Ld3ZpZ1VmU3NFU2diWjZRSkJ6?=
 =?utf-8?B?bDd0amZRS2dOQnQxNkxYb2VNckNCWU9vVmVZRnNJVFVuM1hNenFYSTBVMnVH?=
 =?utf-8?B?OHBqZjJibEVodnJ3LzNFU3Rya09WbWdQbXZUeDdNemp6WmpIdm1ya2ZmNDhu?=
 =?utf-8?B?VEtHWU4yYnZiNlRBVnZPOEhUQmRrajltdmdQWHRMWXQ0ZzNBQmlwcUluRGtR?=
 =?utf-8?B?cG9YS2hzTHh2ZVRYRi9GdVlEZ2hxNHJJU1J5VzF2QUUxalRoQXAranBwREp0?=
 =?utf-8?B?MlN5RFRHb1Mwc1JIdldBbXdGaGtXSHVQK2RESThSblVMWk12RW1OVCs2cmVy?=
 =?utf-8?B?cnVaaDdpR0F1Y0R5MXlKS3hONWdOeHdnaXFOZDJHQ2F2b29WRnRKcnM0U240?=
 =?utf-8?B?WUpVSUd0aEtkaDR1TE9GVGNtc1B4cWZBb0htUnRoRi9WSXE4SHJkWEpjUTNp?=
 =?utf-8?B?eDJjT0ptOU15a2h4QTR2alFrUnVQMTBtRkg3UEFmTEVNeVI2Y0NZMkdxbklU?=
 =?utf-8?B?ZEtVZStOcGdkcFJRL2szOGhFbnBZNEZmSk95Rk5pc3NzQWlHZ2RIcEVBSGdm?=
 =?utf-8?B?S3ZpVTFlaURqUmJ3Q3lCRTc2bTNYKzlqWEwyZndYTXZ2eEtkSGFaVTJBM0c4?=
 =?utf-8?B?dVphREViVWhrN1c1dHF4blBNTUVRSnl6RWZBWUFCZmZGUUkzQlRxUmp0cmk1?=
 =?utf-8?B?VUpSem9JZUcxNDNGWEpSWXplMkVENXFoZHZJb2lDU2swU3ppVWlldWxWRzRO?=
 =?utf-8?B?SGkvTVVzTzlLejQ5Unh6SnhJQ0czdmh6ZE9TVmh0NjVSOGJQU2VPb0Z3MU1l?=
 =?utf-8?Q?fRwshO1+kPB+wBPGIfGxw/A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5951300-1efe-4acb-2f23-08d99e116035
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:59:31.6412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R5cqT/WwPCo1vJMTrR9sAMJ7mN4GA/jrge70ZRwrHcro2l9AEmR0hM1MVwCgIAty85d4MDnZQ1WvZH8SERTYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

On Tue, Nov 02, 2021 at 03:00:24PM +0100, Jan Beulich wrote:
> On 02.11.2021 12:03, Roger Pau Monné wrote:
> > On Tue, Nov 02, 2021 at 11:13:08AM +0100, Jan Beulich wrote:
> >> On 25.10.2021 12:28, Roger Pau Monné wrote:
> >>> On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
> >>>> The two are really meant to be independent settings; iov_supports_xt()
> >>>> using || instead of && was simply wrong. The corrected check is,
> >>>> however, redundant, just like the (correct) one in iov_detect(): These
> >>>> hook functions are unreachable without acpi_ivrs_init() installing the
> >>>> iommu_init_ops pointer, which it does only upon success. (Unlike for
> >>>> VT-d there is no late clearing of iommu_enable due to quirks, and any
> >>>> possible clearing of iommu_intremap happens only after iov_supports_xt()
> >>>> has run.)
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> In fact in iov_detect() it could be iommu_enable alone which gets
> >>>> checked, but this felt overly aggressive to me. Instead I'm getting the
> >>>> impression that the function may wrongly not get called when "iommu=off"
> >>>> but interrupt remapping is in use: We'd not get the interrupt handler
> >>>> installed, and hence interrupt remapping related events would never get
> >>>> reported. (Same on VT-d, FTAOD.)
> >>>
> >>> I've spend a non-trivial amount of time looking into this before
> >>> reading this note. AFAICT you could set iommu=off and still get x2APIC
> >>> enabled and relying on interrupt remapping.
> >>
> >> Right, contrary to ...
> >>
> >>>> For iov_supports_xt() the question is whether, like VT-d's
> >>>> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
> >>>> alone (in which case it would need to remain a check rather than getting
> >>>> converted to ASSERT()).
> >>>
> >>> Hm, no, I don't think so. I think iommu_enable should take precedence
> >>> over iommu_intremap, and having iommu_enable == false should force
> >>> interrupt remapping to be reported as disabled. Note that disabling it
> >>> in iommu_setup is too late, as the APIC initialization will have
> >>> already taken place.
> >>>
> >>> It's my reading of the command line parameter documentation that
> >>> setting iommu=off should disable all usage of the IOMMU, and that
> >>> includes the interrupt remapping support (ie: a user should not need
> >>> to set iommu=off,no-intremap)
> >>
> >> ... that documentation. But I think it's the documentation that
> >> wants fixing, such that iommu=off really only control DMA remap.
> > 
> > IMO I think it's confusing to have sub-options that could be enabled
> > when you set the global one to off. I would expect `iommu=off` to
> > disable all the iommu related options, and I think it's fair for
> > people to expect that behavior.
> > 
> > I'm unsure whether it's fair to change the documentation now, we
> > should instead fix the code, so that people using `iommu=off` get the
> > expected behavior. Then we would likely need to introduce a way to
> > disable just dma remapping (dmaremap, similar to intremap). That
> > would make a much better and saner interface IMO.
> 
> But from an x2APIC perspective it is a problem to have "iommu=off"
> also turn off intremap.

I think we could log a message in that case? (x2APIC could be enabled
but iommu explicitly disabled)

And maybe expand the documentation to notice that disabling the iommu
or interrupt remapping will disable x2APIC support.

> And indeed the option has never (fully)
> worked that way: It clears iommu_enable, but not iommu_intremap
> (nor any of the other sub-options, but there it's less of a problem
> because they're not used in isolation), and iommu_intremap only
> may have happened to either get turned off later or to not get
> evaluated in at least some of the case.

While I understand there's some baggage here, I'm not sure keeping the
current behavior is correct. I would rather have iommu=off to cover
all iommu functionality, and then we should add dmaremap sub-option to
disable remapping only. I think that would be a sane and logic
interface for users to understand.

We should also note the implications of disabling interrupt remapping
regarding x2APIC support in the documentation.

Thanks, Roger.


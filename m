Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249594EC7AA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 17:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296416.504526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZoF-0004B9-UZ; Wed, 30 Mar 2022 15:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296416.504526; Wed, 30 Mar 2022 15:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZoF-00048T-RK; Wed, 30 Mar 2022 15:00:31 +0000
Received: by outflank-mailman (input) for mailman id 296416;
 Wed, 30 Mar 2022 15:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZZoF-00048N-4e
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 15:00:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c0e639-b03a-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 17:00:28 +0200 (CEST)
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
X-Inumbo-ID: 21c0e639-b03a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648652428;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/UHdTELRYmwjmgV9VY4BxNaqBHztj5nlwNw0GN4Qiz4=;
  b=SfMZCTWcia+pkqAc0EOw/3LQ+UIugWjie5OKHF1n0Iwq+et7732esfeV
   eulEsSQm9bRfh56+990jR/HeQD7CstuOtSMQQhyIB9FR4opx5ifHQS0yG
   NZKOSnBYnHH9oRhZjkZEdrJnkGGwqSEkSBDjvCt0k64qdzsD+kbzYcqea
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67963392
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kXSrya8mUmGhN7LoOSjSDrUDH36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 moXUWyFb6uKYzP0f90nYIi3p0MPscPWz9RlGwVrqCk8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oPhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ73Fwd5GLHHpP9eeRcFPxkkHJFY47CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4RTKiFP
 JtDAdZpRDeYeBNfMHILMcwB38qSuWvjdC0AuHvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru5H/lCxsXMNiezzut8X+2gOLL2yThV+o6FrS++uR7nV67yWkaCRlQXly+ydG1hUKzVMhWA
 1AF8Sop664p/QqkSceVdx+lpH+JuDYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmLGNUnec6re8pCu/IzQINnQFYTIYTAwD+J/op4RbphDFQ8tnEaW1psboAjy2y
 DePxAAljLIPkYgH3ru65njcnzu2opHDCA8yjjg7RUr8sFk/PtT8IdX1tx6Ltp6sMbp1UHGD+
 yYEy+6C59wVTruDyQC1GsQxAqqmsqPt3CLnvXZjGJwo9jKI8nGlfJxN7DwWGHqFIvroaheyP
 haN5Fo5CIt7eSLzMPQpO97Z59ECl/CIKDjzahzDgjOiiLBVfRTPwixhbFX4M4vFwBl1yvFX1
 Xt2nK+R4Zcm5UZPkWLeqwQ1i+ZDKsUCKYX7H8qTI/OPi+f2WZJtYe1ZWGZil8hghE9+nC3b8
 sxEK+yBwAhFXev1b0H/qNBPfQ1adyFhXcqu96S7k9JvxCI8QgnN7NeLnNscl3FNxfwJxo8kA
 FnjMqOn9LYPrSKecljbApySQLjuQYx+vRoG0d8EZj6VN4wYSd/3ts83LsJvFZF+rbAL5aMkH
 pEtJpTbatwSG2uvxtjoRcSkxGCUXE/w3lzm0uvMSGVXQqOMsCSUo4e9JVG+rXNm4+jenZJWn
 oBMHzjzGPIrbw9jENzXeLSoyVawtmIag+V8Qw3DJdw7Rakm2NICx/DZ5hPvH/wxFA==
IronPort-HdrOrdr: A9a23:Q9WeDqspAJ5rMHWtt02ILcQG7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,222,1643691600"; 
   d="scan'208";a="67963392"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIPQkW84LtCinkFGhmlfg3Bz4DMzLZrgopellglRG1JCCL2WdoQ6VojUj8bcITIvIcb4ntecAxS6D758F05zs1sZ/NrC7soQfkU9YkxQJACUp2gEm8CfuxhuQ0r8VIjJpjUF3zNEBCfhme+lIDOLrkx7Q/EzHInD+G1iz7RjDHsfmL8cKHaky+1NZxNZ7KqQGeAjXBqZO1uktmlxh9L6+/bTFVJhhbjN37A6S61zf8l3P31kqpJ/igJn7+FUvnJg9ACcdGdv7F3c/O32H8K2Yoou3g0HKq0ZD2wStxggODCySqwzGaUN+UyZvIEU72y5uloT4dLXb9aWMQJy4hPe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRDBXnP9C9M2vsmyTw79C19QJ56/HRm2OQRPejgum9U=;
 b=O2x51jWgT/FOfAZEnKQr1hpaNGeRgDIkSU3TyP3HwQc8jxs6gC1yrwX1lV3bzFOArgXpchrucJvMjfJsoJF4zT+hFIXw4Duq34hgBRN8HWNCJzQ2Z6qhKGCMiz9cjQK07qG5Hcut/34EmZgHjZPGZIqCAgYL7dqu8zQ7cSwzU34bfNcooP95sc3tj68pAxqbG8o4SxJD4n1lvCla9zMmUTvyPVG/sOSSB6Z2ZOyDmGwrqE1U8VVimtWjWkpcECXDIPoRSBAnxuHsJvw/Zcthi07ZWF5L+toeAX5+b3NCpa+wEw6NlQHn30ruV992tbnPxz1VL1O7E/Sl1tfZ9yK5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRDBXnP9C9M2vsmyTw79C19QJ56/HRm2OQRPejgum9U=;
 b=itwKqnFeZld1cSEIAs9JmB7TJTIMqToCuITnm+FcZyJWBvAaMzHvtxrMUSzifqZ11kG+VxqNY/MbdPwAkDeVupdQMzavTks/AfAPIbYJL5GSLNSpjTmMGgvE/xmj+UBRHhTkPl4WGlRKF8RG/debh2yk6vSiXkqBOw6yUW/wwCo=
Date: Wed, 30 Mar 2022 17:00:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
Message-ID: <YkRwf3BHj01SAjbT@Air-de-Roger>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <YkK1dSS6RZ9hzyh6@Air-de-Roger>
 <ae3ba2f9-ace5-0c30-9190-06c747953b20@apertussolutions.com>
 <YkQlkOWtXqGBAoM/@Air-de-Roger>
 <d7c2f9ab-561c-01dd-e1a4-8f99f356d56d@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7c2f9ab-561c-01dd-e1a4-8f99f356d56d@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8053240-ed45-4f52-1959-08da125e028f
X-MS-TrafficTypeDiagnostic: BL0PR03MB4148:EE_
X-Microsoft-Antispam-PRVS: <BL0PR03MB41480B66BC4DD3FE0A1751398F1F9@BL0PR03MB4148.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NcCX5csleWFNFgEsZeM4PbQOulDMd4XHPqWwEzTWhQN2zpgotyREHrlv6/Z8l78P2jo52gMgZ315eA2XDWEUcGXNZ6OKrVjaLcRsxafv5gQZPiNfL2t2xgf64SaYGouNi0iEjvwFbit7CdoTC93c7y+WrusKTExHosP7eAfYGClJNtElpTWFfdFbM60RN36g2wzwnp9+5/CMPJmwBionl/C8BdvJTdLVqprXTlWtSvQ/bRpxhbkcQQMuQ9dlo13zqJKsKZRS5qy6VlvmQ4/ahLtEUf53qK36SG6NCFaG40MVrQLVELSywVM2xmnin+cyJ9qOvZVY/trvGOesqbUgdMJsaZZw1AXrccJRz863Z3VHfGcc7u5e7cijGt/a4hpQZ8Qg6JdzPsuKo23evPKOGC54wNPy2N/E5OB36Hzj9llRfCM1uNaLNRTIFfxNFHmiEKsTs7mKWFT7Cq0K7nusjKc6sDIYPjFzcUqLzGknf6nPzWcVNiY5xpLP3CO2CdAJ32g9cv7EwSqUsc0SFqhBvf111yaHAObgehuktMFIOAqgQhLbmtYtXSBBgLPTwtBLfvrPbODxhXkQZVTe8nNO7Z6FsBCJy4z39Qzd0q5jIP3UzFMPAo4kteElS5/caG/Rs31NiCWBPW4oL1vCmGP9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(4326008)(66476007)(6916009)(66556008)(66946007)(54906003)(26005)(86362001)(186003)(53546011)(316002)(6486002)(508600001)(33716001)(9686003)(6512007)(6666004)(6506007)(85182001)(82960400001)(2906002)(5660300002)(8936002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGNqekRSKzVVTkxVTDZPOFdIK0xMRnQrQWFyK1h5NGd1SWtrNWVqTEdmMjRK?=
 =?utf-8?B?Tm8vYi9BeTBCc1hOdS90dW96cHdIMENuYVlvVVFqZURQVnBocWF5bm5yNkYz?=
 =?utf-8?B?OHc1R1pSMHFibjVpcWRrOEtEWEExOWJtOFBSc0haTkxTa1pJdnV0RWN1ZlVF?=
 =?utf-8?B?azlKSnJkdURxM1Fic1NQT040ZmswSDVEZWlOWFFLd2MzeEMzN0x3eUJCeHJ0?=
 =?utf-8?B?YnBIYW1ZQVRYMm91VU9rSjU4V25QVWJLL0tPNkFBMTFrRjN1V2NnU09iV2NW?=
 =?utf-8?B?Z1Z3UXMzWk56OStCeDBIbHF0OXFCcXFiTkVsWG9vOC9DYm5mSHFkVXNhTmkr?=
 =?utf-8?B?TTN6L0xTanZhL2gzRWJlZUk2WlVzbDJWRFpZa3d0cUV3blI0WTNUSlFudzUy?=
 =?utf-8?B?Zzlpdm9jTDZuNGRKbXdmRlJrUk1YRldkd1Q1TkYvTnQ1RU1Ubkw5aGdpUmdP?=
 =?utf-8?B?MlQwWDFvcFZTWXZrSHR4MUszNVRnM1pHSUxEZytEYzZDVHdwMjVYRmtBVG9o?=
 =?utf-8?B?Wk1OM0d5WjJGKzg1UzBYUHVxa1NjbmlyT3EyM0dsUnova2RxbFdSTkhaTDBu?=
 =?utf-8?B?ZkdhQnh3elZJbTdmLzFIdlk2Q0VBZjQvTU91aUxabHFSOUR3ZWptYnZYMWVj?=
 =?utf-8?B?OVpwUHgvcHBHU0ZyNjJPcjJhVGtjNGRXNlhNcCtCUTY0Zmc0RElYQlY5bUt3?=
 =?utf-8?B?Ym12dW9BbEFvSm8vVElxSU94cElyeTZoY3Y4WUxMTzh3MjhUWHJnQlVHZlZR?=
 =?utf-8?B?WCttbk9YRW5rVmI0dTV3SEUyQ2tIN2tRTldyeGwwSmpJVTVIbnF2SDBCb1RT?=
 =?utf-8?B?WVpBTDc4M1JDT3ZveU1PRGtKaGJGaVY2UVpmOEZZdlJaeEQ5eUVseVE1MGM1?=
 =?utf-8?B?QjViVTNyRFlWTUNnT3kvbVVWTEJCRGZEN09CWDZjK2NNdW1pVlY0SE5Bcm1y?=
 =?utf-8?B?dktPaFBrc3BCUGd1Tkd3NlUweFRYUmxyWkRhZEdOVUJMaTUvRnd6QjhTcWJG?=
 =?utf-8?B?V21tMEF0Z2xEcmphUHBCelo3UGF5K3dwT1BVdW9oY294V3RyVExJSHgwVld5?=
 =?utf-8?B?eHE1cG8wNjd6c0FidFVWRGJUdkZmRmxRU2ora3JmcmJGZVFaZ3JsZ0VIR280?=
 =?utf-8?B?Tm9SRWhJOS90Z1IwV3FMY2x4M3BqSWlIT01FMG1CeEg1QWxuUkpwbTlLMElh?=
 =?utf-8?B?b3g4SVdMQWJ2RDNKVXZWeTRxSEtKN09ZK0Uzb2hramhjRUh2MGtpYW1nVTF1?=
 =?utf-8?B?OGlJSDJmdTI1RUV1SVlxQmh1Tlcydm9Dc3NKWGxmUGpVYWthZ1YvK2psZUlR?=
 =?utf-8?B?VHgvMEdpdldyWGQwYnRkalhsd3Zrd0lHUmhNSDZ3VVRIREZ1NCt5aDJtMTFN?=
 =?utf-8?B?QlRhN1JBMklnTmFPQnQ3TWxzTG5MR21zTmxXc2VvN0tDblpmR0JscHh3Mzlm?=
 =?utf-8?B?V2Y0c2piUE1jckltTWtPRXViZ2NSUUdsZnBiNUkySWorMG10ckdjRHh1WUEw?=
 =?utf-8?B?ZTNYWVg0SUtaRmQvbjR6VHdpQVNKS0R1UUUzODR6N1BNUVcvUWFBZndrZGgy?=
 =?utf-8?B?UEord1J2Z3ZrOWQ5YlFoYy90bmpQVXRZcEYyZTFjQ2JDNmh6YWFHYTJ6Zkkx?=
 =?utf-8?B?ckhPdnp3MzF1dWhiZENHeHlsMysxNE9HSkZWVXZiVk5rY1JpZnBLSHM0Zm9v?=
 =?utf-8?B?RnNGVzRvVWl3bktycndWZFdGQndGcTFGNm43RlFEMU9LVCs5cVFSbFZ3cm1W?=
 =?utf-8?B?b2tuTGxUQ2JFNUZGdk5tUUxtbG5PR2NidW1lRmtRRVhnMzNscWMzQk1QcnVL?=
 =?utf-8?B?QXRmcnNoZHMrK1poZlJic05NQXk0UkpHTCtNT2V5ZXFZTUhtWEZILy9Tc0wv?=
 =?utf-8?B?WEVEZGhHc1p2eWFCL01UeXBGK3NIZjBHSXR4a2R6WlUvNGMyMmpha1BPOXFt?=
 =?utf-8?B?R3dpM0ZTb1J1Q1d4eldzc0hPTy9qSE84L0swZ1NUM3VlRkt6bkEzN2JJeEhx?=
 =?utf-8?B?dDBvQlp1MDBmRXNpMXVVTy81SWpFNGhZYSszVFk2YXBKYzgzM0t2WHVpS2FQ?=
 =?utf-8?B?NXZzRi83cHJ3WS9GZ3oySVpiQVU1KzVFUmFDYlpXNDZKcW9aUTlMNWY3ektZ?=
 =?utf-8?B?QlJhSnA1YldZS0dIalhhZllWS1Npb0pidXUzcHljbGhTb0diSUV4cU5wM3Zq?=
 =?utf-8?B?Rjh2bmpiMmtqQ2U0VkhkbnNuTmpnZFZQTzhMVnQxSGlpc0hQMjFERTZZOHBr?=
 =?utf-8?B?clUwUS9LZndtbnNocDdIT1BuV1ZCTkllSE5pM09ibXNmdERWbGlsR3VwMzFW?=
 =?utf-8?B?eGtieWtla0lHSUNnOFNnWkRmWDFoc0twNERkSnZnbFZJNFI4R29kU1JjdXE3?=
 =?utf-8?Q?yurGoJenGmhN1H1M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8053240-ed45-4f52-1959-08da125e028f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 15:00:20.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qR7t5qcwq80hyJ8uDxvl5ZQ6oZQGpOJwOXm2rcyRxygI6SWc+GHa4bFsUiLtEctWQ2l4VA+C8bTIcanNbCR3bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4148
X-OriginatorOrg: citrix.com

On Wed, Mar 30, 2022 at 09:42:18AM -0400, Daniel P. Smith wrote:
> On 3/30/22 05:40, Roger Pau Monné wrote:
> > On Tue, Mar 29, 2022 at 07:12:56PM -0400, Daniel P. Smith wrote:
> >> On 3/29/22 03:29, Roger Pau Monné wrote:
> >>> On Mon, Mar 28, 2022 at 04:36:22PM -0400, Daniel P. Smith wrote:
> >>>> During domain construction under dom0less and hyperlaunch it is necessary to
> >>>> allocate at least the event channel for xenstore and potentially the event
> >>>> channel for the core console. When dom0less and hyperlaunch are doing their
> >>>> construction logic they are executing under the idle domain context. The idle
> >>>> domain is not a privileged domain, it is not the target domain, and as a result
> >>>> under the current default XSM policy is not allowed to allocate the event
> >>>> channel.
> >>>
> >>> I've not been following the discussion around this patch, but I would
> >>> assume such privileges are only required for init code when no other
> >>> domains are running?
> >>
> >> At this time, correct.
> >>
> >>> Since it's only at that point where the idle domain context needs to
> >>> allocate event channels would it make sense to temporary elevate it's
> >>> privileges by setting d->is_privileged while doing the domain creation?
> >>
> >> This is initially what I did but it seemed like there was some
> >> reluctance. As I was looking to formalize/abstract this in XSM instead
> >> of doing direct manipulations, I realized I could achieve it in the hook
> >> which would allow the hyperlaunch and dom0less code work without having
> >> to ensure priv escalation is properly handled.
> >>
> >>> That way we wouldn't need to grant those permissions for the lifetime
> >>> of the host when they are only needed for initialization code.
> >>
> >> Correct, which is why I adjusted the effective default policy only on
> >> the check instead of in xsm_default_action() as Jan has suggested.
> >> Outside of a code fault, all other times that evtchn_alloc_unbound() is
> >> called `current->domain` should be pointing at the caller of the hypercall.
> >>
> >> This works as an interim solution with minimal impact as it is all
> >> internal to XSM and can easily be evolved. My concern is that exposing a
> >> function call to provide priv escalation for the idle domain as an
> >> interim solution for dom0less and hyperlaunch will have more impactful
> >> code churn in both of these when a longer term approach is adopted.
> >>
> >>> Another option would be switching to the initial vCPU of the domain
> >>> being created, but that's likely to be more complex, or even create a
> >>> short lived system domain with is_privileged set just for the purpose
> >>> of building other domains.
> >>
> >> Longer term I would like to explore doing this in general. Some initial
> >> thinking is the fact that hypervisor has a few contexts, relative to
> >> external entities, under which it is executing. When it is handling
> >> internal house keeping (e.g. scheduler and security server), when it is
> >> interacting with guest domains, when it is interacting with hardware
> >> (e.g. vpci), and now when it is processing boot material to construct
> >> domains. It  has been mentioned that today in Xen if one of these
> >> contexts acting with external entities is corrupted, it can interfere
> >> with operations occurring in the other contexts. In the past the have
> >> advocated and been working to split these contexts using hard L0/L1
> >> separation. As noted in other discussions, some architectures are
> >> gaining hardware features that can be used in hard L0/L1 partitioning
> >> but also could be used in a more "soft" partitioning more a kin to
> >> Nested Kernel[1] and Dune[2]. Again just some initial thoughts.
> >>
> >>> Overall I'm not sure it's worth giving those extra privileges to the
> >>> idle domain when they are just need for a known and bounded period of
> >>> time.
> >>
> >> IMHO that is a slight over simplification. Setting is_privileged to the
> >> idle domain while it is processing domain construction data from outside
> >> the hypervisor means that during that bounded period the idle domain is
> >> complete unrestricted and may invoke any XSM protected call.
> > 
> > The domain builder code executed in the idle domain context can make
> > direct calls to any functions that are otherwise protected behind an
> > XSM check on the hypercall paths, so I don't see much difference.  The
> > code executed by the idle domain in order to do domain creation is
> > already part of the trusted code base (ie: it's hypervisor code)
> > likewise with the data used as input.
> 
> I am only referring to what legit code paths exist, not what a full
> control exploit could achieve at this time. My comments below was
> discussing what might want to be considered down the road.

Maybe I wasn't very clear on that paragraph, what I meant to say is
that the domain builder code does already bypass XSM checks that would
otherwise fail, just by calling functions that are behind the XSM
checks.

For example the domain builder will likely call
alloc_domheap_pages(target,...); which would otherwise be protected by
xsm_memory_adjust_reservation(XSM_TARGET, current, target) when
populating the domain physmap, so here you are basically bypassing an
XSM check already.

> >> Contrast
> >> this with only granting the idle domain the ability to allocate event
> >> channels between domains at any time with the only codified usage is
> >> during init/setup. While I am unsure how, theoretically malformed
> >> construction data could expose a logic flaw to do some very unsavory
> >> allocations without any guards.
> > 
> > It's kind of like that already, it's just that in other instances the
> > calls done by the domain builder in idle domain context bypass the
> > hypercall XSM checks.
> 
> Not on legitimate code paths, which is what I am focused on since the
> primary vector that I was considering here is data attacks which are
> about steering execution down legitimate paths as opposed to attacks
> like ROP that allows runtime construction of execution paths.

The internal domain builder does bypass XSM checks by calling
functions that on hypercall paths are otherwise protected by an XSM
check, see my comment above about alloc_domheap_pages() for example.

> > This might be giving you a false sense of security, but what's done in
> > the idle domain context in order to do domain creation would strictly
> > speaking require the idle domain to be a fully privileged entity, it's
> > just that we mostly bypass the XSM checks by calling functions
> > directly instead of using the hypercall entry paths.
> 
> Not at all as long as it is understood this is just about
> least-privilege with the concern being around data attacks.
> 
> To be clear, I am not saying either solution is wrong and standing
> firmly for one or the other. I am just trying to ensure that we consider
> the applicable security aspects and thus make an informed decision.
> 
> >> Whereas during runtime if the idle
> >> domain was tricked into establishing an event channel between two
> >> domains, it would only serve to provide a covert channel between the two
> >> domains. Neither is desirable but IMHO I find the former a little more
> >> concerning than the latter.
> >>
> >> With that said, I am not completely against doing the priv escalation if
> >> overall this is the direction that is preferred. If so, I would prefer
> >> to provide a pair of static inlines under XSM name space to provide a
> >> consistent implementation and be able to easily locate the places where
> >> it is applied if/when a longer term approach is implemented.
> > 
> > I think those helpers must be __init, and we need to assert that by
> > the time domains are started the idle domain is no longer
> > privileged.
> 
> That is fine, I am not sure if there is a difference between static
> inline functions that are only invoked from __init code (and I would
> think would thus not exist anywhere else in the binary) over__init
> functions.

__init functions are freed after boot, so any attempt to call them
after boot will result in a page fault. This is what we want here, as
after boot the permissions of the idle domain shouldn't ever be
increased.

> Although I have not been keeping Live Update in mind but I
> think this is where the controlled privileged builder context is really
> needed that dom0less, hyperlaunch, and Live Update can all utilize.
> 
> Good point regarding the assert. This was a concern I forgot to mention
> with using priv escalation. Once a legitimate path exists to do such an
> action, what locations should there be checks/assertions it is has not
> occurred.
> 
> > From my PoV increasing the privileges of the idle domain just for the
> > time it acts as a domain builder is merely formalizing what is already
> > a fact: if the domain building was executed outside of Xen it would
> > require the context domain to be privileged.
> 
> Except that it is now in guest space and can only reach resources
> through the controlled hypercall interface. Any data that is sent is
> considered trustworthy because the domain builder is trusted.

So if it is trusted then there's no issue in formalizing this by
setting its context to is_privileged = true.  Ideally we might want to
do domain build on a separate system domain just for the purpose of
executing that code, but given the system is not live yet (no
domains are scheduled in parallel with the idle domain) I don't see an
issue with re-using the idle domain for that purpose.

> I will send out my original priv escalation patch later today.

Thanks! Will give it a look (likely tomorrow).

Roger.


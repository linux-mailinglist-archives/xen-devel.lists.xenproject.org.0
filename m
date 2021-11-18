Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574C4558FB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227300.393099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneXE-00007o-5q; Thu, 18 Nov 2021 10:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227300.393099; Thu, 18 Nov 2021 10:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mneXE-0008WO-2E; Thu, 18 Nov 2021 10:20:52 +0000
Received: by outflank-mailman (input) for mailman id 227300;
 Thu, 18 Nov 2021 10:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mneXC-0008WI-5A
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:20:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31c80bcd-4859-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 11:20:48 +0100 (CET)
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
X-Inumbo-ID: 31c80bcd-4859-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637230848;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WbA3nqP4lQWOX2GpJIOG0Fo9bUPV0YAjuTTfD6x6Ky4=;
  b=GjZ8CmUVM4CsYBcxTjWiLShLbt/SX6s5GXVi5/BiIWBtcNNYOmu4/u5+
   MM5Pp+rDRbzGcry9X7nTljHIRp7oHwIKQylZHx+2m6F++SHkveAveRvI6
   gHKsOV/GBKUIv/lF9A1BG4ti5Tbv2k+WUIx/icQYNm422VTL9rPVqhbqT
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j8bf7tjGWMINYw/cB5mB43JSKtf78ZpxjfpjXkFk8qk/BhM9kG1kBUsE3xKehdz/kOLR+7XZ6K
 i5WXWs7YX/8v/1reek2uvaQpWblgDqbb/XmkZBR6/JiEopT5BRylH+fkmsZiqsPDRb5hl4EpKz
 VfI5muV7JGuk0EYwCPe8/eh1qui1/2F4jVeXWGJbsBkdUEzFkB5X4S2DQIAZQfEgtuYFPVXjJR
 3QGwt/U5mnPhZE0PovIxEqY27klsXzkxdJDT5MV5zHVOEm0IwacWLu6S2wPrtq5oKi6BGMnMH2
 01we4MOlzNKuDCYGYAtx686c
X-SBRS: 5.1
X-MesageID: 58133309
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4b4J+qiTxj9crl8tyHmhVvyEX161hxcKZh0ujC45NGQN5FlHY01je
 htvCDuDM/iPa2H8Ld51at+09BgD7ZbUm98yTlRoqS5mEC8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0Up5mTdCR3N5Tsxu8yXiBXMmJ/DO5vreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1pkVRq2GN
 qL1bxJpUzbtPCBLIWw9Ea4QoNyvvFSuWj1x/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnnDz5cJIfEqWi8fxni0HVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MSsROI6Zf3vQ+gJjYPYTN4Z/1ltf51bGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWiom
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsaYowGWxFADpU
 J04dy62trxm4XalznLlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfJma2P
 BKP6V4Bvve/2UdGi4ctP+pd7Oxwk8Dd+SnNDKiIPrKinLAvHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdw1XdiZiWsitwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg5AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:IAy/fKmNcOmMfj1CadAj7OHMAk3pDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,244,1631592000"; 
   d="scan'208";a="58133309"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfDIAcPYzf5FgfjcurvhCHbZF+Ou+uBMsXYhVs38kumWuFP0cb9AHKiMB1Njqsmn7/YfTCfi4H5gVIJW6OZelb1F7dFQkCmWIORurtNFjac4J+qW1b5VLati9oPYbMnpEj5BwZlhnT7mScj5ekBhGTjxbmVHSJDsW/wgJ2XaEg3BKaiDl0EzPKIdyBMbbc4iXQgCKD9tIFoPNDs9Bf3PWDL/5f3saMeUgb/nafYU+3fSltwb7Wkgs5C/SeTGQOcC9jR1TVCzhOiqcWZluLkY2NFlv8JEQpt/b7o8NTT6Wrdo6U9PDQIx/vl+nvFYUSiFYOaheNdnQzd3Ju3Ybke2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlgMutMQb+2IUHmemPA9szW1fAYLAb1w4VIV8ymViM8=;
 b=a1vq/2VihPRMeFBmaxPo+r4EOB7pMZOrG+4hZBugc/uoVUDkYqGWEO5wSWHxJh8q92Ivd/rQRFtSaEy6F2cg3zuzfdFU0cJ+vFxJ12b8OJCnY31pvTX1HnbmmqSdjVlUENcWT6RF7+cisaDxssaRmaeVlHCDshZtGK4N2gYlWPvfZ4wBPkDCSyaqvQiWHfkW1NPngMsWCOD64B0NpZspO9Gdwk/nfPoWdd1wsb5n6bAfmZ4i1H7FKtzqzCo2fvX6gemT+lkladJBMxhvC5E80WA2GOEhm4fymJ8kpoQvgUFVHgOTBMiKZocbIHBo8vA4vALDoXYGxSUoa7wEBZhlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlgMutMQb+2IUHmemPA9szW1fAYLAb1w4VIV8ymViM8=;
 b=AWZ51anX3QwvDru0ooto3i4mISUX3j9ZwcAKxShFkPovTB7rAyZoEnKYmvE6MuwfA2XGypez0J3pHjL1NOe60QArboER92AU1mKDFTgR1pLoOfVCIPZURXerqUcwM7VysN470kbzOM1E7+r1kXcJgfQ0DsEPJ8yqtXIDBai3tfs=
Date: Thu, 18 Nov 2021 11:20:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16 v2] efi: fix alignment of function parameters in
 compat mode
Message-ID: <YZYo9oGq2Bzontjw@Air-de-Roger>
References: <20211118082806.23335-1-roger.pau@citrix.com>
 <1377adb3-e3f5-2865-a2df-e6dd8098645e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1377adb3-e3f5-2865-a2df-e6dd8098645e@suse.com>
X-ClientProxiedBy: PR3P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6597a52-4f57-4779-8f78-08d9aa7d1478
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-Microsoft-Antispam-PRVS: <DM5PR03MB337033140E1C0671B9443E6C8F9B9@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yLd8othD5XooVFdAwD9wxR5SMEeJKS3fZT625yIRfCbMeUi1+kr6BP7dQ6hU0nZ+P9CDYwBuNWEYi/a0J74HTUA2gC7j9KXzR1HSlkxIDeCNvlyaGtTKwn8/Ogt8skCcv4Q0A4XI8hcFYlpkBcuVnsXKNrLfVMoUXMH97jR6kuCtfa4ZEhKgQouq713aaLdcHsqJvLcaaxJyK9bTGp4i/4CFTpr2HeM7E5vJakAnLrY3L6s4rUd73mQ7UzGpqJommwWH9/2/q1QMJSFUH6WZCW6Im0jpq9a9i52Y8DOio/L0gIe5vhUP2sRe9LpqKIbUAmLXhhbiRUYmnWrtE+YESnl5ADxvgdMhQKJWzYIrIHRkgCOYHU0joWg2PdE82t/MyrbdVfqsfOSyQIldRB9NnxzHfYxkOX9X9y6GnAdw/y9omHhEj014Z5rtt0fnvs0DyugTBjeSD+pqd32a5QwYXmCeLnfamj2siWiq/fZlImjj9MwctnjSk07FxU1FPXk5F+wB7TExWwLxdh3XXqPMt8Q9rpnfvnW75BENKtWbldxlAOukXNGnBft831TzOWp/Q5UhYo6k+PEuufMd64KB1ojZ+CZDaAqj85c4tPXvqRPGqgUFSBYsy4arOLwk93yY4oZxBmKee0XCdRzdB5ubFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6486002)(38100700002)(33716001)(6496006)(5660300002)(508600001)(6666004)(8676002)(2906002)(316002)(9686003)(66556008)(66476007)(8936002)(4326008)(956004)(85182001)(66946007)(6916009)(53546011)(83380400001)(186003)(26005)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEtVejgyQ2JwdlQwdVZIeUQ1NXQ4SmN6Ri9wV1RtMHZ2M0FQZlJISCtiNlVo?=
 =?utf-8?B?ZmxESVR6cEdIU2EyemhGZE1SU0RFNkl5NWx0aFdXOU53b2hyVDZWeTNQamxV?=
 =?utf-8?B?UGhadUI3eFowbWRLTFZHSU9VTXZ5OUFORE1kZ0ZYd0VHM3c0bUlQT29mMzRY?=
 =?utf-8?B?NHhXalN0blNzVHVLMUpKK2k4MStuOVVKbklYNUJsZms2YmhPUHhWZHh4Mk1t?=
 =?utf-8?B?bkp5SWlYUGhDVlVISkdheGJnOWZ5WEQ2QVVOZnRoL0pEQkViZ2RoYjQzWGta?=
 =?utf-8?B?Zk5TWERkN3VRNlNkc3RvaFQ4YzJsSEh6RU1USklVaFFjMXE1eE8vZmgwYzB5?=
 =?utf-8?B?bVNMU3dsRlNNcTZwMld5STlvQXdGSzNNSkdQS1RaejdITDh3OEY2TVJQZjJu?=
 =?utf-8?B?VUlIMStrUDRFb29HOVB6YjJOZnhQU3BvWStWYlNaU0hzSUNQYTUzS3FLRWQw?=
 =?utf-8?B?LzdpdHZHTGhLWW1MUkowQzRGWHl1SGZsTmpwcmtzeGtNdTlFRFQwSTRnVWov?=
 =?utf-8?B?QnVLZ0hPaVgyeDV6cVU5QU1ZNG1YNEROYkJKMGFCVDBKUFY2VTZxTVJmeVBO?=
 =?utf-8?B?MytsbEtmQThla3NDMWhlSDZzMmN2anl0OGVFeUpESnlvYnVKVVVPWW8yZFgv?=
 =?utf-8?B?Q2Vta2tHREplUW5wRkpzVG9UaFlTNnZyQmlNRENRbTEvajNhWGRkbDJUWlVs?=
 =?utf-8?B?OFJBWXh4Y3kvaC9ReEJvNWJBU3NOTXB3dFhtb2NpdForWkZBRGplbGRkLzQy?=
 =?utf-8?B?ejl2blhlQS9nSXFsMWl2LzR6cENaL2c2aEVIMHIveEtXQjJWamhwMzM1QnVB?=
 =?utf-8?B?ckcvcC9yVXdHUjNiVUo1NTRja2d4Ykl6VXlYcVF0d1AwUjdmcmN6ajNZZVNt?=
 =?utf-8?B?S2RYWkZZUkpjaGlYY0FLQ1Mvcmx2YktpNmNhRmhRbDFPdC9ISFNKd0tvbHUv?=
 =?utf-8?B?L2V2aVJuaGhUK0VqK3hOTWtOUGxBYjkzTkNHQWg0aWVmam9YbkZYVFlQRVhm?=
 =?utf-8?B?dlJFaFU1bmErMU8xOVZVYUJFU2REVUhRUVVZcUlKV0pRcDdKU3d4OUhxdVls?=
 =?utf-8?B?QnpUMFo2M2trMHRVSkwzOUErdXlPNGJHVFQ5MytrbHh6b2tmd2JoQTJJazBS?=
 =?utf-8?B?dm9Lbjc3VXB5dEZwVkFSUktxd0ppVHdsZUt6VEZIeXRvMjhNVTBkQUJXYUpL?=
 =?utf-8?B?cGxXWjYzL1R2c1ErTFh5Z29MZDVsQVhCQXJyTWticVpoMnVhT3gzSzRTMjBu?=
 =?utf-8?B?SmM1WkdQamYxei8vT2wrdGp4SVdRSkFzemlOWVpuMnllM2JmeUV2c2xpUXIz?=
 =?utf-8?B?MjBLbGs4OHR4dUFvOU02VnBFRmV0MjQ4QnlZdmdsdmt2TEFFNHJGM29YUTZC?=
 =?utf-8?B?OGhwRzN1cGxsVElsMy9UWW8xWnBWK3FvNVAvdTVWSkxQM3c4Rk9kOG45cWcr?=
 =?utf-8?B?bzFwS3d4bUFCNGxvZ3RtY0xjVVpMS3lxL3hmUlNrTFJHRkVKVWp5NXZXNjc2?=
 =?utf-8?B?VUhqQVQ2VU8yanhxcFVaNTZuKzFtRUFJWjRYNjV1ZHZaNXQwYjNZK1FCeXBB?=
 =?utf-8?B?RXBhcTEyVkFLbU8wNFMwSk02bkROZmppN2tPRXlXc2tnRy9aZ1p6bUFjV1VW?=
 =?utf-8?B?UEZ3QmZBUkh6MnEyQmR0MTRmOUM0dlo1S2tMMGxlbGR3ZjFQYVNtbEpxOWY0?=
 =?utf-8?B?UlQxQmVFVkxkQ09BbWJwUUJ3TUtQb0xaZXdVTkpSV05KRUtFdFI0Y0RhdVg2?=
 =?utf-8?B?QnFBU2FqTWNlQ0t2ZUY1NmtHb0YyR0NXQzVsVmVIMlNiQmZsT0Nkc3BxTGZR?=
 =?utf-8?B?c1d4SCtVMGVZUVhWTWdwaHF2WGZCRGFXTEJVSjBNRm05Ui9hUVUzSEJvSUxB?=
 =?utf-8?B?S0owdEdsc2lMRCsrbVdTOXhxSWM3b2VHaEJCWFZCK05OTFRmZWUyUnFjSjli?=
 =?utf-8?B?dTRSZ3ZBdkxRQUhZSFB4cDdiZUN5YW9WNkNIUlcxVURIOEtURXVKL1RVanlZ?=
 =?utf-8?B?Z3g2YUtqWjBSVGpiRDR1SVg2bkZTNi9EM2dIVGFOVlM4aEFEV0JRYk9kWkdT?=
 =?utf-8?B?WEhadkQrYnJ3MmVYTDZZeitYRVY3UDdzYVNJbnpCbnNTMlZuV3ZLa0hVdE5n?=
 =?utf-8?B?U1lIeU82bHR0THV6WTI5SzN2N0hBcGYyNjNjQ3dRdEFQRTloMVJ4MVJ1NEI5?=
 =?utf-8?Q?voWbvQj+PjJ/psGmoAZlkcY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6597a52-4f57-4779-8f78-08d9aa7d1478
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:20:44.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo2J6QZ6A/V14T+wab7qe05tpq/aWC4QZoQxYk5FBVYQUDnRUekzsQnEfM2U6a4AlBGQiCM8ciezX3s63mzETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Thu, Nov 18, 2021 at 10:46:32AM +0100, Jan Beulich wrote:
> On 18.11.2021 09:28, Roger Pau Monne wrote:
> > Currently the max_store_size, remain_store_size and max_size in
> > compat_pf_efi_runtime_call are 4 byte aligned, which makes clang
> > 13.0.0 complain with:
> > 
> > In file included from compat.c:30:
> > ./runtime.c:646:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 2 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
> >             &op->u.query_variable_info.max_store_size,
> >             ^
> > ./runtime.c:647:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 3 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
> >             &op->u.query_variable_info.remain_store_size,
> >             ^
> > ./runtime.c:648:13: error: passing 4-byte aligned argument to 8-byte aligned parameter 4 of 'QueryVariableInfo' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
> >             &op->u.query_variable_info.max_size);
> >             ^
> > Fix this by bouncing the variables on the stack in order for them to
> > be 8 byte aligned.
> > 
> > Note this could be done in a more selective manner to only apply to
> > compat code calls, but given the overhead of making an EFI call doing
> > an extra copy of 3 variables doesn't seem to warrant the special
> > casing.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> The code change looks correct to me, so it could have my R-b, but I'd
> like to ask for some clarification first.
> 
> > --- a/xen/common/efi/runtime.c
> > +++ b/xen/common/efi/runtime.c
> > @@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> >      break;
> >  
> >      case XEN_EFI_query_variable_info:
> > +    {
> > +        uint64_t max_store_size, remain_store_size, max_size;
> > +
> >          if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
> >              return -EINVAL;
> >  
> > @@ -638,16 +641,34 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
> >  
> >          if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
> >              return -EOPNOTSUPP;
> > +
> > +        /*
> > +         * Bounce the variables onto the stack to make them 8 byte aligned when
> > +         * called from the compat handler, as their placement in
> > +         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
> > +         * clang will complain.
> 
> I expect future gcc would also complain; I'm actually surprised it
> doesn't already, as I recall work in that direction was done for one
> of the more recent releases. Hence while I'm fine with referring to
> clang specifically in the description, I'd prefer the comment here
> to be more generic. E.g. "... and compilers may validly complain."

Sure.

> > +         * Note we do this regardless of whether called from the compat handler
> > +         * or not, as it's not worth the extra logic to differentiate.
> > +         */
> > +        max_store_size = op->u.query_variable_info.max_store_size;
> > +        remain_store_size = op->u.query_variable_info.remain_store_size;
> > +        max_size = op->u.query_variable_info.max_size;
> 
> All three are OUT only as per the EFI spec. I'm not going to insist
> on dropping these assignments, but their presence wants justifying
> in the comment if you want to retain them. E.g. "While the function
> parameters are OUT only, copy the values here anyway just in case."
> Obviously if the assignments here were dropped, the local variables
> would need to gain initializers to avoid leaking hypervisor stack
> data.

I think it's important to do the copy in order to prevent changes in
behavior. Even if explicitly listed as OUT I won't be surprised if
there where quirks that passed something in.

What about replacing the last paragraph with:

"Note that while the function parameters are OUT only, copy the values
here anyway just in case. This is done regardless of whether called
from the compat handler or not, as it's not worth the extra logic to
differentiate."

> If you agree with the suggested comment adjustments (and don't want
> to e.g. go the route of dropping the assignments), I'd be happy to
> make such adjustments while committing alongside adding my R-b. For
> anything else I'd like to ask for a v3 submission.

Sure.

Thanks, Roger.


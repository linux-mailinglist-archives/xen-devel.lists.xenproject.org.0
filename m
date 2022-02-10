Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E04B0A72
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 11:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269772.463863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI6Xh-0006It-PK; Thu, 10 Feb 2022 10:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269772.463863; Thu, 10 Feb 2022 10:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI6Xh-0006Fi-M6; Thu, 10 Feb 2022 10:19:13 +0000
Received: by outflank-mailman (input) for mailman id 269772;
 Thu, 10 Feb 2022 10:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9Dk=SZ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nI6Xg-0006Fc-0z
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 10:19:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e13f970c-8a5a-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 11:19:09 +0100 (CET)
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
X-Inumbo-ID: e13f970c-8a5a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644488349;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/GeQuziQB206cLzZHKpMdbkssAbKN0TVQ12wh4KuzaA=;
  b=ZQCFk1klATCrtsReOFCbr7wKstI2MWamZR+4I0cR/MkKDRY+E7xWeTJE
   Dlb5rcZr6qtxFSv7pQNUPeCJXs8+4Wc/IoaRBskm4IQKr6Dj2nRG99K5l
   5/OP+rAD5epXxIYa/2KYEQZUj9jaBOOZseVM5evNm1wjmRb1AFrdHrf01
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1fQE89PZh/+93ylIoxoh1muDEpZcglxB8hTGWPSoKcldJYHBMpKVDBbfgra37rNUDTxnQxnCDb
 PuYDAHpo6Bsx0H8+ubbbPf8H32pJxb3O4CRNLSx09BBVBXq0rGtnnhhE7AAsOiiuNiA4ppVWb0
 3SzC8dmZCzVNTucDQvBL5zkyJzkL11LUjKXQZwxI+PwrmS2MrGKuOsnYb25I4L3RxijWi6q8x/
 Hh7xhixaEaFCuo75VE+yRxIDd/IZCRYJ0bj+GLIQMSS0NASkN8/c0TWPjIVSuApslnUKCcKdRM
 fOBn6hbBdmZ0D9SwgaxNVNsj
X-SBRS: 5.1
X-MesageID: 63912501
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LkVDYazPZiyEWMwUSY96t+fewSrEfRIJ4+MujC+fZmUNrF6WrkVUm
 GAdXDqAb/bYa2D1KdAkb9iz9ENTu5/cnIVqSAs5riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdh2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt5NS2
 YlitJC+chY0OImTuuRebSRpEAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEDjW5q25gXdRrYT
 5YpYhs1ZRWeWEwVYU0+VKsuvrf3j0CqJlW0r3rK/PFqsgA/1jdZ0rLgLd7UcdyiXthOkwCTo
 Weu13v9KgEXMpqY0zXt2n6tgO/JkiTwHp4PPLyi9+Isjkf77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixRUsVEhFAZNIdpdIwYWMI1
 hy3ouLqLGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+hL1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 BDoeODEtYji6K1hcgTWGY3h+5nzuZ643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518NuMQJZCPxPfAmC25UNyjM5fO5fTgCfqqKBuein7ArLFPXlM2QTRL4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLc6q9ZIHLLPfSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:K6Z9W6rQe+3a23/xcVOkD38aV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QpiAoos+O/P+XZgNddvpfvHHeVAlYSi8Rl56cm6XXZ3uBRr22uzKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.88,358,1635220800"; 
   d="scan'208";a="63912501"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl49r/W5HuVJ/vNOKJC6Lxa1TRKJOG/knfAHgAuTmp0tJKohWFfJvwFMZJozwteh1xU/zJcYyzUvSK93xveuXbNg+O60lqdvwaY0iUaumXfT7uOa6gJpTOLWdB9QbjBeNzo65ia2REXbEEHa3JrV4jA1qeDfgan55tS3Mcd+lSJYmRS6l7YWeSdsN2AZsnTEDePil/Zm7faMJofUztCO0CZ4WtMHeh0jLxmwlhFSzWzH8/b7MF165fJWq2dJp1I3IfXvPy+QP+9PXPjkxT13+dF8HHDxRKsLMzGKJMmwPHnlSVteJbagzQ7WY4PMcmAr+gQsNOxMEU1LdyGvufQAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvA6aYddxr3wvbK3Zkc+A3oqbUfpExSTOOEMkQLjD08=;
 b=WTE6cR4mUWpiQDP00z/8MEEamk49/ZJEqc8FYeZraGwZqjdvYqhk3RYPesrjzMfJvIlEEClAiTGXMTQuKE5nh8k57IhoUVjYtPpYXmN6cZwSQkSVFNi5XAPNCwcPteE5fJHi4d3TeXLkiMvlq9wCH882lh04l64ggzvGLQ3eHcIjkRrkAFG6djF9JmGrploz1dJq7q3RgGtn/wG6CvPdiuYDbuBT4xRhXUmIONfncx8IBJ9n2zHitbIjhH0HNNELVsWw3N3x28KwiL0ClQNVkukIy4S+wPZS7hE52vzSPGRB+8euxg46m1MaAfeRHK5zs1HVVM8mZ/OEZeu6qXmJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvA6aYddxr3wvbK3Zkc+A3oqbUfpExSTOOEMkQLjD08=;
 b=LW0rAVdPzEZyPcXXLmR6xoQBKT6pVqzF7KNmH/UW+Bi/9y44oQb/9U50MXZdvFTEg44LMmUw6bRAY3uPTmkZL+snjaWv38IwjukPEjFIKu0DKuELeSftzddOYdL+qEYdwGnRqItr127EL9Iaz337y72FrX/w4F0Y9lmI9lQT9H8=
Date: Thu, 10 Feb 2022 11:18:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86: Prioritize low memory size from Multiboot
Message-ID: <YgTmksnAoHRSAdF7@Air-de-Roger>
References: <000c01d81dcae25e6f0irit.fr>
 <20220210084436.84-1-dinhngoc.tu@irit.fr>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210084436.84-1-dinhngoc.tu@irit.fr>
X-ClientProxiedBy: LO2P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 370315db-5860-4da4-aa0c-08d9ec7ec2d8
X-MS-TrafficTypeDiagnostic: SN6PR03MB3741:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3741509F9519548F9F439FF98F2F9@SN6PR03MB3741.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAMG5NeMHfIDffTeITYdwOqsL81uVRFyw1ZflI6c9geu0xSA9hcv7MOEuXtbyHQnGd4eqDdHiVF8Meu+GaCzo4xy+shx7UYmS4Jp+ILpmUf7CVN2b/KFf1lfv+kobv6Rd945Ve6H6UVfSH/z4Q62nCrPoZnLHEyAsIPkYFDhLTgDKbyDgN9vsFWF6veq2IurGMzSkwaPEplqLixwrCQA6iJFFdB/oszb54hORWI4mRfcwynivbQO/pGymoK1LD7Ms3LLmhMNo0sCiamd+yQqZJKPwG1ue7G5D1fjM5Ox9NFC5GYdzND7+ojziCvn0Ch3Q7rEWrhEJ12jpRn3FI8aWzuSV76qhhuxxgoCRPeikbM97lKUOJFXdlK9y5f++K+OtVnmaU5kQ5rBCqp5dUh/P03nb9sazbvUV+fYzxDbRrXZAaVOtGQzbiZGNkrHS8TFPVRy7b9E2yGmDlV0MAi91JacyWNle+mjeseKxCzkPBxe8fW4mHuyhtPtzp7bRb2mKIHUP79ipQATwPOauDSMOPPPYcTB8X/49lrpjNuO+Xmzy7/JDj+pM9sPmMCFQzfCTkF5Fb7Ih7cFY0+fLV53dthhkD3wpdn3DMfskPtKTYFC1ak+6npGHCQh5kljbIrIYj893PCOgLiEE2p3w6hz1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(33716001)(6666004)(508600001)(6486002)(5660300002)(85182001)(2906002)(66556008)(4326008)(66476007)(186003)(8676002)(66946007)(54906003)(26005)(6916009)(8936002)(316002)(9686003)(6512007)(82960400001)(38100700002)(86362001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzdYa0cvbmVQZjN1SUpnemlvYmU1c2ZkSGhXU1lNeVFTUWtnMzk1a2ZoK1Fo?=
 =?utf-8?B?U3lZd1REOEYyQ1d6T0VwZXo3bnc1YnpwYUhsQ1IyUDU4ODVtRzg3Zm9RQ0xE?=
 =?utf-8?B?Vzd4Q3IzZVU0MkprSUlHWmlRRkQ0VE92UTlxNHZsR29NZFpSbUs5ZlFVRDdL?=
 =?utf-8?B?YTRzdlBhbCt0OVM3U0hnRElEQ05DeFgvZDl5VFdDVzUxMHFTQWk1UTNxU1VK?=
 =?utf-8?B?aFVXcjNVYWRyRHcxV095ZDhOQmNva1dKVkh6OGJzVUc1VlVTQTJ2YmNnL01u?=
 =?utf-8?B?S2s3TTM3alNFbS9Rb0pneE94d0U0UG9UMGtqZjhQTXplVEhieENGU21YMHZa?=
 =?utf-8?B?QkUzUGlFTzRNWE5BUStWV3pwWXJoS1dUYnFKVDZLeWprSmNkK1ZMKzNSY2VK?=
 =?utf-8?B?Qy9tQ1g1eFY0MldiWnR1WDVpZjRRVXZRWmJXVU5LZm1mVXlxNVZPWTlDbjhs?=
 =?utf-8?B?S09vT1AxMHpFaGZJYlYyM3J4RS9YeGQzWmY1QkN1aEsxeVkvSk5DdzVoaGts?=
 =?utf-8?B?bm9LT3RHaDE3VkFhZjJjVmQxRUN0NTNpU2RRUGdtQkxzek5mdEFkTzhLR09j?=
 =?utf-8?B?VmRzcFllZ2JKM3hUR0JPa2oxRVNVaVJuK0h5Z3psZWVUakNDZFY5bzhDWWFZ?=
 =?utf-8?B?RmJ4UWxFVkdEeGI0TTFBQ29SNGhWRXp4T2Jlc3AzWnQ2OXdPaUZ4WkdVQVgr?=
 =?utf-8?B?K3Y0QjJQRHJoWTgxMEJBZzMzZlU3MWd0aWtRSnNHbGltZFp3NjcrNTd3SHVL?=
 =?utf-8?B?Z3BuSm0vUXMraW95cU5vL2NkU2NvbGVwcWRzMHNJRUVZN2hTeGNKNkhacjBP?=
 =?utf-8?B?Mnp4ZERrVjMwNktXdzlGVFBKcmdUSCtKaWlNWHZYeDE0Y3d4VDlEWGQ1d25m?=
 =?utf-8?B?VENHYjlrbzhORU1qVEFlOVZqRUdhZDY4cC9mZ1U2bkxTTzMwcWFmWjZ1eGVX?=
 =?utf-8?B?MWY0dmRFZU1xTlFmeG9YZGl2MkIxd0RGWCs4ZDM1Mnh4cm1pY3ZDc1B6anJS?=
 =?utf-8?B?ejd3MThuRjgyRHRGS0lOa3ZPbjNsZjNKUjU5aUkrV0tON29NbWhaWjIwS1ZR?=
 =?utf-8?B?Uk5odVM4Z3RXcERoa2JvTTZ3MHV1N254aDFqTmFNeXdJTXEwcG0vd21LQjZi?=
 =?utf-8?B?MWdGZHRHeFFFVHF0ZUpOckRsakM3dG5SUklic2Z2VHNZSWlWNHlFdWVtVG82?=
 =?utf-8?B?QUFKUzJiYXYwRy9FVVhRMGFBRW8vUGlFbmtzNmJoN3QvTGdEMDc0UzdyU1pM?=
 =?utf-8?B?MFE2VnMxTTdOUXJnY0tsZWdjMTE0QTYvbncrWHdDN3FYck9EeEJIRHdBMkRN?=
 =?utf-8?B?eFQ2TVlhcnNqb0tFWTVhWkUwNnpXektjVXdxbVZha0J0U2ZqVFhqNWNUanpT?=
 =?utf-8?B?U1hIU2EwY1k1dlV2MjZMMlRIR1RwMzdHQUUxdG5vcUJnc2xhK01WZXUzaWVP?=
 =?utf-8?B?MElyOTF1N3NwMTFieVl0RDk1REEwWDdsYVV6a3luYUcwVm9QMzlLcld6cndL?=
 =?utf-8?B?SVpPaWFhczFsdHBJeEd0Nm9icU1iS2J4TjZSY24rdnV1bmFVK3BERTNUMk9o?=
 =?utf-8?B?dnMzWFh3QUtRczBxaGxLeDBIZk1YNXFPekd1ZkpPRE5vZXdjSXlNdzBEWmIx?=
 =?utf-8?B?ait2ZDhJSUpvcklFTUdLcXdPRWliMm51RS9Rb25SRUxidE12OVdCdzNXcDg0?=
 =?utf-8?B?QmtCTE1rQUZsbVhvU2tHL0ovanV2cVF4NFhkWnNqK24vR3ZabHFzRlBQUXFE?=
 =?utf-8?B?dmpaQ3RVdXVJN3g1SDNrdHNKQzNRRWloUEpSekR2T0x6NDN5a1loUGUzSmEv?=
 =?utf-8?B?N2RrUlpJTHdROE9EZVNlellUOXJCcGRtYTBxenQwTUZNWFhCR1E0aEV2ZjVS?=
 =?utf-8?B?MUZnQVF6b3A5U1lMNVpnYlkwR3ZxaEQ0N0M0aVFTYzFVY1BKSXZqRHFUdzdv?=
 =?utf-8?B?WnlubWYyNGZoOUhheWdSMzBZbWh6UEFHa2xiaEFjZ0RTWHBrWDF4eDRwOUt3?=
 =?utf-8?B?cWF5NENSUTVONnIzbXJyMlVGYzdDTGg3TnIxNGp1ZFpyNFBscVdKUmZGMTI5?=
 =?utf-8?B?NlUwRUh6SVV6YTV4c3U4cDRwSnpYQ0c5NFNLZjROUFJXcEVCeU5iUFcrSTZF?=
 =?utf-8?B?T000ZW4yTE5iYm9JWDdJZmR2SHp6QTRkL2hRZktodU5pOXJwcWZ4cEVrSU81?=
 =?utf-8?Q?SOEBw+5ZshkW9CnFRKiIdfY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 370315db-5860-4da4-aa0c-08d9ec7ec2d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:19:03.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWglbpNojadgIBJc9WJdsezkfiiUSwPG3UxSILzVgl6+TazV9oJ/A+LQ0W2yVYFtis/5w4zgywV2U3Rluy6BaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3741
X-OriginatorOrg: citrix.com

On Thu, Feb 10, 2022 at 09:44:36AM +0100, Tu Dinh Ngoc wrote:
> Previously, Xen used information from the BDA to detect the amount of
> available low memory. This does not work on some scenarios such as
> Coreboot, or when booting from Kexec on a UEFI system without CSM.
> 
> Prioritize the information supplied by Multiboot instead. If this is not
> available, fall back to the old BDA method.
> 
> Signed-off-by: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
> ---
> Changes in v3:
> - Prioritize using Multiboot's memory information.. Fall back to using
>   BDA in case MBI does not supply memory info.
> 
> Changes in v2:
> - Detect if Multiboot claims there's more than 640 KB of low memory
>   (happens with old Kexec versions), and correct the memory unit in such
>   cases.
> ---
>  xen/arch/x86/boot/head.S | 44 ++++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index dd1bea0d10..da7810060e 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -524,27 +524,41 @@ trampoline_bios_setup:
>          mov     %ecx,%fs
>          mov     %ecx,%gs
>  
> -        /* Set up trampoline segment 64k below EBDA */
> -        movzwl  0x40e,%ecx          /* EBDA segment */
> -        cmp     $0xa000,%ecx        /* sanity check (high) */
> -        jae     0f
> -        cmp     $0x4000,%ecx        /* sanity check (low) */
> -        jae     1f
> +        /* Check if Multiboot provides us with low memory size. */
> +        mov     %edx,%ecx
> +        test    %ecx,%ecx
> +        jz      1f
> +
> +        /*
> +         * Old Kexec used to report memory sizes in bytes instead of kilobytes
> +         * like it's supposed to.
> +         *
> +         * If Multiboot reports more than 640 KB of low memory, assume we have
> +         * this problem.

Is 640KB the absolute maximum of low memory that can be reported?

It would seem to me that reporting 1000KB or more is obviously wrong,
and would satisfy the check for old kexec reporting in bytes instead of
KB?

Do you need to also check that the adjusted value is between a sane
range also?

Thanks, Roger.


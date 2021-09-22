Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F57414CA1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 17:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192917.343648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3kH-0001YC-9m; Wed, 22 Sep 2021 15:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192917.343648; Wed, 22 Sep 2021 15:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3kH-0001WP-6W; Wed, 22 Sep 2021 15:01:13 +0000
Received: by outflank-mailman (input) for mailman id 192917;
 Wed, 22 Sep 2021 15:01:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mT3kF-0001WJ-D4
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 15:01:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb7578ee-1bb5-11ec-b9aa-12813bfff9fa;
 Wed, 22 Sep 2021 15:01:10 +0000 (UTC)
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
X-Inumbo-ID: eb7578ee-1bb5-11ec-b9aa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632322870;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=H/XeDceVUZmrCI+i2Zrio2zJqsWUdhQduoFMbScE0EI=;
  b=REQwoioQ0nbrG31NnyX7dYMAtfTbcyD2749U+P8wKwvE6jCHr6S1T+3E
   azYYzCwm+WqChDPru9AKZ87fBIzq5gAwiDLoo9n4KwsdnVZ0833odocb2
   nVWXUPd7dCRc5SofxL/t4RIMgN+Pq9pzA03RLPJp71PrHYhHgN12B0YRj
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cNkhPGJWi+ZqP0lk0cKxYdKWTku5w3uONyK3qVOBOPF9pS/oMG4/Fa/+/cV3n4VluNejvoINzl
 jgM2aKvpnbtlot+yiwHwxrrNYGwo5+o9DLE2HR3iGLXdgj6PPryH3H+uc8gwEBZzNis7NKUpAh
 B85gVlR2ldbXXfxEhhO50ypcfmaOaZfdWjlVtbQ0wrugcBc3ccT1F6S2mx3gQSO6abyfLbFnPz
 zbZ57y/smM7YLUxJ2L05pZ/4rqIEfenXauuFCRshqoFZMhcIPjYxfBmvExsWMWBQYudgUIs629
 yX/dbTEOCkc9dfyP4535bpCe
X-SBRS: 5.1
X-MesageID: 53328899
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NpMRe6rmzH/8K1SBAzylLTn08KxeBmItYhIvgKrLsJaIsI4StFCzt
 garIBmBbq2OMTPye9klPoS2/UgG7ZPRyNAySVY6rHszQnkU85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncw0ILjW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb+2RlwLO7DmpMMEYV5qNBEgJbF3+LCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0VRqyON
 5tIAdZpRE7MTBprI3UGMs4jzNv0nSTeX2BH913A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0eNxfSM8/9Sux7bPmpDS+NjYcUg9BZ4lz3CMpfgDGx
 mNljvuwW2c16e3LFSrEnluHhWjtYnlOdAfucQdBFFFcsoe5+OnfmzqSFo4LLUKjsjHi9dgcK
 RixpS4ijv04iccR3s1XFniW3mrx+vAlouMzjzg7v15JDCsiP+ZJhKTysDA3CMqsy67DFTG8U
 IAswZT20Qz3JcjleNaxrAAx8FaBvKztDdEhqQQ3Q8lJG8qFoib+FWyv3N2ODBgwaZtVEdMYS
 GTSpRlQ9Pdu0IiCNPQsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7npvnT+MHc+rkUvPPHj3TCf9dIrp+WCmN4gRxKiFvB/U4
 5BYMc6LwA9YS+rwfm/c9ot7ELzABSFnbXwvg8AIJOOFPCR8H2QtV63Yzb87ItQ3lKVJjObYu
 Hq6XxYAmlb4gHTGLySMa2xiN+yzDcou8ypjMHx+J0us1lgifZ2rsPUVeawocOR17+dk1/N1E
 aUIIp3SHvRVRz3b0D0Bdp2h/pd6fRGmiFvWbSqoaTQyZbB6QAnN9oO2dwfj7nBWXCG2qdE/s
 /ur0QaCGcgPQAFrDcD3bvOzzgzu4ShBybwqB0aRe4tdYkTh9oRuOhfdtP5vLpFeMwjHyxuby
 x2SXUUSq97SrtJn69LOn62F8dukSrMsAkpAEmDHxr+qLi2GrHG7yIpNXevULzDQUGT4pPera
 elPlqyuNfQGmBBBspZmEqYtxqU7voO9q7hfxwViPXPKc1X0Ve8wfijYhZFC5v9X27tUmQqqQ
 UbeqNBVNIKANN7hDFNMdhEuaf6O1K1MlzTfhRjvzJ4WOMOjEGK7bHhv
IronPort-HdrOrdr: A9a23:Tx6Wi6Oi9wqgRcBcT1r155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrVQseVvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4B6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1sjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvC/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdm11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixttqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWzHAbgcYa
 pT5fznlbRrmQvwVQGdgoAv+q3iYp0LJGbHfqBY0fbllwS/nxhCvj0lLYIk7zA9HD9Ucegw2w
 3+CNUaqFh5dL5gUUtMPpZwfSKJMB2+ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="53328899"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfzUsxEtMltTMgVOSBjatt8jbISTriFzUXLLWSZVii0byh+h1jLPsSmd40eXXkQPAD9R+c02cU68hLMgjkAc95rB0/nbSeYehU+y++Nx6G0CbsYBtrYB+A7rxgc6uLNOhIBOTKO/8oCqGQdaXOIGNe2nnHHpKz/ojU5650nXWqjkzSVE6vvMoAS5cwZ/tYtmvMaHVhmvUMXcZq0VqBNHj9n1F156uKXJpEqkthdk1PVspW6oFatnmXdtm6DlULqTh54TmE+G46QFjp7ZlqlSLdRoNxTtUQToV+NRi0/24tIDViiY9FS0BQR2ItgLKpEBFc5sOvBmDKX1x+qDmnneLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1h4IqLri73dplB8TL9as5DYbuvW6hilkS1CEbax3ywY=;
 b=mW4qyvlMGS1i9Fpq4Bppuz+S+DCD/2NdV/AfcXSwj8ArMtCOdQ03fQn/k56oSbjoj3p7cs9E2v+NM6fIItjJGFvWC07J2sqlJcPL19vZF/8P/ThVfjdhQs04K/MMrmhCPQX+5nMEYzCknEzhNlxHOLNCp5VL24VlvDDVfkzXf+Z26ixG8eFgnwEaMkiDlLtzIMBTWBJEKf5OWOZPyq1XP8X6+FUr95FcgltDrIKUEics/L0M1fXFCycdoP8/YnOXOF4G6DIGC5lXY6722biMr1/DNJLakTSBJb0I+A4iXYtNBqJLL8SGOUkJqxbP89aM19EUlYtO2iX5bdT2O2poCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h4IqLri73dplB8TL9as5DYbuvW6hilkS1CEbax3ywY=;
 b=CNTZ9KMjknOOWFUj54RbfZ1vWe/CaSfqJhSUagmyK+bX4s79iCx+47h2V2cGc82q+f1gFMUn/4K9psFIlRIKst0MG8oFjCKHQBMZDtgCigExVnvkpnB3za486GEBNu3y6WQ2lILbjyuY48btWmfnxtROjRc/Yd00dMzycRXGw74=
Date: Wed, 22 Sep 2021 17:01:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/9] x86/PVH: provide VGA console info to Dom0
Message-ID: <YUtFLB+n2piR+cHe@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <215e2ea4-cb49-7d94-7f97-c6b81e522a60@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <215e2ea4-cb49-7d94-7f97-c6b81e522a60@suse.com>
X-ClientProxiedBy: LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b92f659d-2ac7-41f8-4344-08d97dd9ccee
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590C8BFD4CD8D5A7B3F5BDE8FA29@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hudBDJVj/ApgrdcwONBTUfogWBbtW3/jF2KpfX5SBb6NO21t2/WF41oPmAa4m2LTBHHEfOi+9/QVvwBD5U/U4T+zDtYF2sVlcHzOwPrT6WQRX4L5AgwhYZb9tIQGpobWdbPF4ER5tZxpMB6DiWXdX3BplLh6DKKksKlAsCYdEHIjzKG9seHOYCsh/tgDNcDsSJw5npZHMW4jQNKFCrgxoDkHRd/3knJ1P+RklsHcvmCMbYJiuKYBzNbgWEDEbaRH7Wc6VPtrWr+zoPbQN/sd4d9y9NbX4CrJVB5dM6X5bHWeFeNjcj6sxGqIyF5KYOFkgxp9mwelc9185Gpwfhhb/Q1hWPgWJ3pST5Nn0QRSxz9SLkXraWIriqDhEHNARkQ9b3LyXbyp9rLJ3Jp0D7/8216VKpvXghSfiFXZKoiCVEkU7K37HLFF4QqeJDCpB49Zej4UauOU5dFBoKCdDJVrXaT+VtcV+sEQb6GoAibJ+vkgKPjDflZhU+CE4TFLiNgBJ8QNbD84FLfeJ7MfOVYVHJAdTEORlJhjIeNZ3XfGZM+BXQAPyNL+TxpZ75blU4CzkgbQie/uqLLExHoaCa+fgnMSOPNxzzKeVCpN+k65708qB2UwRORjvMBMJHQQ7Uy9JqYWdudqYZ0pgH773Iehhhx+uNuVdsPgLexGaDhlTomCFlV6OknAyx+VjjAl2dFxzQBMIufTi97snHZS3IGroQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(86362001)(8676002)(9686003)(5660300002)(6666004)(2906002)(186003)(316002)(85182001)(54906003)(8936002)(6916009)(26005)(4326008)(83380400001)(956004)(508600001)(66476007)(6486002)(6496006)(66556008)(66946007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVRTN0ttbE1WYzYxaHdlOU9aYUZsT3JPditQcUViRDFvYXVVcU9WSUhFdDBI?=
 =?utf-8?B?WVhXTzVMVCtxV1IyVVp3dVhRanR1dVc0K0NMVk9JTHFLaGdlV01DQ0U2bC9q?=
 =?utf-8?B?YzJCcDNXS3MzY01pVmViRzFQVmFsNHFITk9iSHF5bGZ6MUhHUGh1VWV3WkYw?=
 =?utf-8?B?dUEyU3o4aXB5WVJOVlRxVW5sQUlHQy9vNDlHOGN6MEpkRXYxTFJ4NnRmWU1U?=
 =?utf-8?B?MUNDNDJNMm9pMktKV3dqai94bm5DYVpBWDY0MFh6bXFBak5lbEZxWHpGRHpS?=
 =?utf-8?B?V2gxZHlKZVlhRjJiTXVidXpjSk85ekJVSDBtb2NmTXc5aUdmWnR2b3NqOEhD?=
 =?utf-8?B?bG9VZFR2aWtUc2ROSkc4M1RvRnJ3c2I5NnJjZXZEMnVDWUcxRjNUSFlrWUEz?=
 =?utf-8?B?N0NOa1FZRFFkS2pGVU1Hek0wOUlhT2p6QXc1UndTU1cwU0FtSkp2TFZWbXla?=
 =?utf-8?B?eURabWRqTXhXTGxxY0R2R2xXT3BlcWo4TDVjZWNwcWJzeHdQVUdTU3oyQUVq?=
 =?utf-8?B?ZTBNY2JFOG0rS0JkRjNBbmN1UjR6QWo2cHZkaXI2YThxVU1TeTg5MjVha0Jo?=
 =?utf-8?B?eDBROU81LzFLc0QyRzQ3MmMwMEd6a3RacTE3ak9UL0V4Y3pLVjNSMXA4cVpR?=
 =?utf-8?B?NU5oRXF3L1pDT0t1NWRYSHkzeVBhQ1U3Wnl0cEVlN21IcFg4cWgwZUEwZVc4?=
 =?utf-8?B?QXFtOXE1SlNRc1hnYS9tbVN5Y2FVM1VZcHN2dDZ5bGZUZFFxNE5Ib0FPZzhU?=
 =?utf-8?B?ejN2UnlNcERFK3hFVGlYRjV5dDU1bkN5UXdSZ1ZwbUoyZUJwQk5YQTFCMnI0?=
 =?utf-8?B?ZnZzU3BDUlZFN01tYUtaWEVOdGtTdFhNR0hHVEkydThZRWI0TmthbWdqUUlH?=
 =?utf-8?B?OElGRkFCeDdZa3FWNlBJUHdLcWsyQ2k1RGcrK0ptSmVOSUFJWU8vc2NoZUtK?=
 =?utf-8?B?cHRLZEM1WmdCR2hEMGhzSU1CTVlISVo0VWZYVDVScWZzS3dndWJMell6Zzh0?=
 =?utf-8?B?ZjRhUnZyeUJYZzNjNGY0M2c5NnNWSWJSTFd3MjJDdGZId0RUcVVTdU5Yamdo?=
 =?utf-8?B?c3Awazc5cCs2QWZRUEQ5S0ZKNGdDZEN5QUcvVGxtc2VKTHEzZVUxc1ZDMzAw?=
 =?utf-8?B?c1E1RG4zZllZVkZiTkN6UHpheWVvNDE3RWlqSFg4UE1va2J1RGhGRWJadkZp?=
 =?utf-8?B?bGpoSmpsT3BzbHUwZVM4VnpzQmxxV3ltR0FzSk00dWs0SUNUSmVXWUtXWDkx?=
 =?utf-8?B?Lzd2emRGNit2dnMyMklIUUVaWDFBUmdla1V6WHVtdTh0Q1grbWFWTU83VU8v?=
 =?utf-8?B?b0twSHdob1lzSlJvelpoODhDcitQVjhrMktHMG9NT3RXOElBL3FjYS9keEJG?=
 =?utf-8?B?R1JMUzNtNmFQT0JTQWhqSTlhMGJ1VzJCRkFTVm1GR2VEcks3MTJkdWg1WGR1?=
 =?utf-8?B?bzZhOWpmOWhZQlBxak5Sc3VydG9qNm45ZDkyUDY0S0lJdzcvOUlURHAwZm1p?=
 =?utf-8?B?TXhkc2RBQkZNUlY1MnJ0WWIyNTloSDloSERUdFRzSk8yWnJWUlNibzczV1cx?=
 =?utf-8?B?WTdWdVVGN2YyWXM3aUlCZnRHMjFxYnIvMjd5ZWxUQjB4UU9zSlNzL2dlendE?=
 =?utf-8?B?a2RZeHhkK01JWjVMaU43N2hUUzd2T3VxNFlhMlpIdTZaMWc5MTBwTnJYb0Vr?=
 =?utf-8?B?WjV0K2Y3dUFMWUxXdE5YMHFJQWM1cFlLNUpkRGZhNjErUUxFYlhNeWlqbjd6?=
 =?utf-8?Q?Vy5ICtIGS1K3Q5ilpnYkgNSSBoSbpdazmq60CaV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b92f659d-2ac7-41f8-4344-08d97dd9ccee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 15:01:05.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7v3VBdUoJUeg6riCsoxTLSsgaUPJND5RBmp73stMR3clR1rMmrzTE+6p/BucXmUhFF6hwuDGYS9flU1HnpoN9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:18:05AM +0200, Jan Beulich wrote:
> Like PV Dom0 in order to use the console if in a mode other than text
> 80x25 the kernel needs to be provided information about this mode. Bump
> HVM start info's "current" version to 2 and use a previously reserved
> 32-bit field to provide struct dom0_vga_console_info's position and
> size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -19,6 +19,7 @@
>   */
>  
>  #include <xen/acpi.h>
> +#include <xen/console.h>
>  #include <xen/init.h>
>  #include <xen/libelf.h>
>  #include <xen/multiboot.h>
> @@ -549,6 +550,11 @@ static int __init pvh_load_kernel(struct
>      paddr_t last_addr;
>      struct hvm_start_info start_info = { 0 };
>      struct hvm_modlist_entry mod = { 0 };
> +#ifdef CONFIG_VIDEO
> +    struct dom0_vga_console_info vga_info = { 0 };
> +#else
> +    struct {} __maybe_unused vga_info;
> +#endif
>      struct vcpu *v = d->vcpu[0];
>      int rc;
>  
> @@ -598,7 +604,7 @@ static int __init pvh_load_kernel(struct
>       * split into smaller allocations, done as a single region in order to
>       * simplify it.
>       */
> -    last_addr = find_memory(d, &elf, sizeof(start_info) +
> +    last_addr = find_memory(d, &elf, sizeof(start_info) + sizeof(vga_info) +
>                              (initrd ? ROUNDUP(initrd->mod_end, PAGE_SIZE) +
>                                        sizeof(mod)
>                                      : 0) +
> @@ -672,6 +678,22 @@ static int __init pvh_load_kernel(struct
>          last_addr += sizeof(mod);
>      }
>  
> +#ifdef CONFIG_VIDEO
> +    if ( fill_console_start_info(&vga_info) )
> +    {
> +        rc = hvm_copy_to_guest_phys(last_addr + sizeof(start_info),
> +                                    &vga_info, sizeof(vga_info), v);
> +        if ( !rc )
> +        {
> +            start_info.version = 2;
> +            start_info.vga_info.offset = sizeof(start_info);
> +            start_info.vga_info.size = sizeof(vga_info);
> +        }
> +        else
> +            printk("Unable to copy VGA info to guest\n");
> +    }
> +#endif
> +
>      start_info.magic = XEN_HVM_START_MAGIC_VALUE;
>      start_info.flags = SIF_PRIVILEGED | SIF_INITDOMAIN;
>      rc = hvm_copy_to_guest_phys(last_addr, &start_info, sizeof(start_info), v);
> --- a/xen/include/public/arch-x86/hvm/start_info.h
> +++ b/xen/include/public/arch-x86/hvm/start_info.h
> @@ -33,7 +33,7 @@
>   *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_VALUE
>   *    |                | ("xEn3" with the 0x80 bit of the "E" set).
>   *  4 +----------------+
> - *    | version        | Version of this structure. Current version is 1. New
> + *    | version        | Version of this structure. Current version is 2. New
>   *    |                | versions are guaranteed to be backwards-compatible.
>   *  8 +----------------+
>   *    | flags          | SIF_xxx flags.
> @@ -55,7 +55,15 @@
>   *    |                | if there is no memory map being provided. Only
>   *    |                | present in version 1 and newer of the structure.
>   * 52 +----------------+
> - *    | reserved       | Version 1 and newer only.
> + *    | vga_info.offset| Offset of struct dom0_vga_console_info from base of

I'm not sure we are supposed to reference external structures like
that. We took a lot of care to not depend on other headers, and to
make this as agnostic as possible (IIRC KVM is also capable of using
the PVH entry point natively, and hence depends on this header).

IF we want to add support for dom0_vga_console_info I think we need to
at least provide a binary layout for it, like all the other pieces
that are part of the HVM start info.

> + *    |                | struct hvm_start_info. Optional and only present in
> + *    |                | version 2 and newer of the structure when
> + *    |                | SIF_INITDOMAIN is set; zero if absent.

We have usually used an absolute physical address to reference other
data, and I think we should likely keep in that way for coherency.

> + * 54 +----------------+
> + *    | vga_info.size  | Size of present parts of struct dom0_vga_console_info.
> + *    |                | Optional and only present in version 2 and newer of
> + *    |                | the structure when SIF_INITDOMAIN is set; zero if
> + *    |                | absent.
>   * 56 +----------------+
>   *
>   * The layout of each entry in the module structure is the following:
> @@ -139,7 +147,15 @@ struct hvm_start_info {
>      uint32_t memmap_entries;    /* Number of entries in the memmap table.    */
>                                  /* Value will be zero if there is no memory  */
>                                  /* map being provided.                       */
> -    uint32_t reserved;          /* Must be zero.                             */

This 'Must be zero' comment troubles me a bit, I'm not convinced we
can just place data here (ie: it would no longer be 0). It's even
worse because the must be zero comment is only present in the C
representation of the struct, the layout above just denotes the field
is reserved (which would imply it's fine to use for other means in
v2).

Thanks, Roger.


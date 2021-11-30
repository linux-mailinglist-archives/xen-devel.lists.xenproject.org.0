Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C34639FD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 16:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235274.408257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms507-0000z9-6a; Tue, 30 Nov 2021 15:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235274.408257; Tue, 30 Nov 2021 15:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms507-0000wF-3W; Tue, 30 Nov 2021 15:24:59 +0000
Received: by outflank-mailman (input) for mailman id 235274;
 Tue, 30 Nov 2021 15:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xd2=QR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ms505-0000w9-4R
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 15:24:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa54448a-51f1-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 16:24:55 +0100 (CET)
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
X-Inumbo-ID: aa54448a-51f1-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638285895;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CrF6bE6mWyPuE25qTu2OvWJvirtbfqyDxMAeU7F4KO0=;
  b=WeCGzl26sFuJmVx4LJCBw49ZWMKz8NR9KSA9++YudD4ObKffC69MUQz+
   ArMABH2BLs/GkgF8mAyIfESiczY43CMUIxADaZpbPGNTSi+mhW7yQIA7+
   opUlndJowwUZnbMlzUctRt7rGKDDufu4JLUhiYMdNcQ7xE08LTG+XRa2v
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TvPflXJMeJpYzGDSf/yH0RKmktlsvS66hbb3G29pJVpJ+D0KKz9Y0+VVsGPt2efnRr20g4gXwE
 JKSrNc+yLL6yHo/0ALeuAYVBUqY59KIGXbVVExJxyLv9ZhrzuN3KK0G+AaaD18RfjP3CoqOfmQ
 R1NWyIFmJn6syW3V4X+2iycThEJPld0ptEGcUh201KZTVdL/JJNwdoPZbDfBb9j2usQrV+cqfS
 OMSXej5yvPcGg4nI4y4bPAJB/qznR3n/HQtU9bBpMFx5hd7RkofpKXZY4Us9uKoja81Nb0u2k5
 BGqS9UtC7cnkecbCPRxVmEAK
X-SBRS: 5.1
X-MesageID: 58874094
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sEPzqazDq7VlBWfZgqR6t+fuwSrEfRIJ4+MujC+fZmUNrF6WrkUBy
 mBJCzvXO/3ZZWahfY93aNvj8B9Tu5PXy9djTVE/ryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrVh2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt81Jz
 upcmq7hczgOb6rxiuYkdjIAED4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIIjGhs3pESdRrYT
 9MidD59TgzrWS1wYg0nUbFjld33mECqJlW0r3rK/PFqsgA/1jdZyLHwNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaZhhgjSvViQtcFz1CK97jW2iOyXmsbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7CFTFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sAumgnfxw3aJpeEdMMX
 KM1kVgKjHO0FCH3BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4AaXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:MYoZ1q/Vvbn2hzAxfbFuk+E8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICOgqTMyftWzd1ldAQ7sSj7cKrweQfhEWs9QtqJ
 uIEJIOduEYb2IK9PoSiTPQe71LoKjlgdGVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.87,276,1631592000"; 
   d="scan'208";a="58874094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9VyUbBmNYgOfzkkC5qJv4wYvFc54NQfdUkBXXa0FiTxskoGB81ckzL4bflk/ROv150BCTYvoUZnYcCqJSUsNVP79XARV5Lw2KcYbxxr4sMb9IfyCJfMASzcUUu1dVQer+uKpU/ga9VBM2OgX/lulgC46fhIs4DBh96ANMJPSc6NcNKnWMT/wvlKh4Lrm/4YLg1cjYUfbjYn6WKANVnDosLdUj8FU0V7ylXGgoeYzuacPq635g77nTVEbXHeCletG9vRY3cdwGzD1eEU5FvXqID6ArsOp9WtulgV2QTYaSP+lb92P1PEO4GBVfjHn2CRPzmxq6y/TrdBw3zLFyrnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISLsqZxJvVYtJW0BVuapftjJk/ha01IJN2Cj/DfsBbU=;
 b=I06RFNakPMmadqA4QH/yDaHLdmvqwmHLTA5w8dfIJMhw9ueIlNL8gfQeeLNADFl3DgHA9WbIzle80cicpV7FvaU6Gz5rytOM6gyJpiYtoRBUQN2oE2D73InveTlvDM6XieRLipSFsaVyFp3nOadKDQKzB2yGieg40nMhiTBm5BhYloAwZ8FIs9FSJvfgb0RI8OyGI9/O1PRYZFRDeobfqW1+Mqyh5T00xw4+rjriPvkk0JaEqker0xIAIRXZRZIbhxSTJrp6YltuXwt/R8+YfCBXibAPFwJ4vgKkL1rORDNhMbc9FNXoyZjgp3ux1+FcRwZVbpDeamXoWV3yxpafLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISLsqZxJvVYtJW0BVuapftjJk/ha01IJN2Cj/DfsBbU=;
 b=pbBSmQpWHkfDFVWib4VFHa/uNcSjdPqRxbP2gLesOHuXxf+wXFT06QH3gg2fm8lBEMylVNaLJTDpXrTAdyYLdhKMPiWd9VqYtyyEOlcTfkoQ15Sq1pvGmkBGZac4wvbJfnJxaNwS7G+QkR1b7dTYAsrM5NH8FyZhyu+59PMmxhE=
Date: Tue, 30 Nov 2021 16:24:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 05/18] IOMMU: have iommu_{,un}map() split requests
 into largest possible chunks
Message-ID: <YaZCOHoTua8al3fU@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <134785fb-8ac1-50f0-de75-e0d6fe22f711@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <134785fb-8ac1-50f0-de75-e0d6fe22f711@suse.com>
X-ClientProxiedBy: MR1P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46c6b14e-1f45-4920-8881-08d9b41589d6
X-MS-TrafficTypeDiagnostic: DS7PR03MB5526:
X-Microsoft-Antispam-PRVS: <DS7PR03MB552636375B4931547A4A407A8F679@DS7PR03MB5526.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4WmWjVLxSCA25J9ZXxU8JPX07Oy5gkcIwFpk8oNK85vg3xtcvInYdfw7bUMV0YTiYMosB3qKRs7DKPzaeqfoh/YfN7+OjBnPGA9Sc/1nl5KPpTBOGLUekNAsp255C+UXDx1yqLw/sRKASJDxn8NHi2N9GW+XZ5bWnURkt9/doCl5tbtkyPwV2ZTDUDsVOJ2PEp2GA+EfyKWSSLjgGTDlNmZUv1hzhVCRal1Ity5ZUs5kEYCQwAGfUDWoaAyTC7nh38glt1E/e4hj05jT6ETMcVE58WBsmLbsdx9DLaFVk9JoYk+p8gEVN1m8f8/4XSi/1ZD0bS4pR1xZ/tIX85sJVe5P4ldFBkVEsNPTmVbqPQWpqrlpc+k+rATZVGUQ3ODrLfxX7tSMGGPUq26hBi08zyX1kUFYWn+6M+BhAygHk+Y3M0YoQhtGy1VsLLwVdxaSqO+QJXjypXpxieIm3KJQE9l9ue0a2u63UYLDlSG8QMCqkY9qmxEifwOX+YXZPHE8DZG0EwN9DQPkkkCuE0S4TCe+dOaoA8hJZumCaWXfyGba97sasgpJNLpYZ4U8Imz1vEmpJz1OVfs3/Ac9BY9JhnMklQdI8vLf6Ijavl3YMd5H4Bb7uLjbMFSPgMmcOinI1J9/45cMI1voc55sH9joZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(9686003)(54906003)(82960400001)(186003)(66476007)(66946007)(6486002)(66556008)(6496006)(8936002)(33716001)(316002)(83380400001)(4326008)(6916009)(86362001)(5660300002)(26005)(2906002)(956004)(8676002)(38100700002)(6666004)(85182001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGRPOFh1R1VPYldJZThRcVk3R0ZnNTRPeUlzMEtjWWE1MlNjbzV1VEoyWDdL?=
 =?utf-8?B?aC9HV2N3M0VlSzF5L0ZsT09HaVRFZGpzRlpGTkFHRklvWWFUZ3o4dkZPTnRt?=
 =?utf-8?B?d0htRld6dXRabCtPVkZLeFFkMzNQblFwa0xsOXg1MDNIUmRyU1RDMmVUTElM?=
 =?utf-8?B?cW91eE1iRnUxTFczTDltU1FyRXBiVThsTWdOTXg1Z2JRcytNdDNVNWt1MFZT?=
 =?utf-8?B?c2dReUxuV2oyUitlT2tsV0xxMzlNTDFIL0RLVVFoY0pRd1VyMFFHS3NRRzVQ?=
 =?utf-8?B?UnZNRTZ1bzkycjlWQkJsclBuekVhNHV4S3ZlWS9KK2ZEbzNQNVBJSUpJckF3?=
 =?utf-8?B?REF1YzJrNGZCaDNxa0NuSVdSaTNhYjI5OW1tVDVWQjdVY2dpMEdoL0IzT2ov?=
 =?utf-8?B?KzBmam1kSFNhWGtMcCtrZnorYzgxODZJRHpCc3pNbFJFMjUwOFUxdGRSK2Ru?=
 =?utf-8?B?dXJxN3Nubkl4dnk3RmN3V1Q5cnpPbktNV25TSnZjeHB4NnBvWm54alQrc3Qx?=
 =?utf-8?B?ckVkdFJyK2srRlVNWURjTXNmZjUwQWRXU2JMYlhnNkRESjV0VUpNUkQ0Ny85?=
 =?utf-8?B?MTFaaE1PS2Q2LytydXVBMlRoSzQ5d1hHcHdjdVVNMWd3dFhSaGYveHdsbkJB?=
 =?utf-8?B?TUVIWlN3c01icHlJTWMxVzFPdTZ6T1FxYU95U3gwTXJVNUxyaFlPZWI1VWVh?=
 =?utf-8?B?dUNIbkNvQk93UzVwbzF3Nm5Nd0ZXdlg1Z240UmNMMy9KaHQxb0tUNFYzUis0?=
 =?utf-8?B?U1B2cU9FUGF3SnY5WnFBWEpJT3dLZkxlQ2dTVzdVWUFuWUdOWHlrQWJGdUV0?=
 =?utf-8?B?TVNsSUFkMjV3T1RpajhxY0xEQWdrSTVZRzhoVlBBMkNNQVhJQzdXTDQ0c2FU?=
 =?utf-8?B?QVV6N0tCZ1NTN1RsdTN4NjZnQklaejdkZlJSN3ovVFpyS3h1OTRPYnMyY0to?=
 =?utf-8?B?UUxyek9ReXVaaVNVdE5ta2V6bUNEaFg4OVdhWVdQWmJLQXhBZWc2cm1QYUhT?=
 =?utf-8?B?ZHRPc1gyUkFHWXU4WUJjdFhBVkV4SVNqUVpHc2doVnNPbWl4aEVuVm9PMXRF?=
 =?utf-8?B?WXppOWZnb1lQOS9jSmhQQ0NTUnU4YWVyMmNJNUw4RU5CZGpWMXBoYmtjd1Bl?=
 =?utf-8?B?R0VOSzUweTZIakRPaWg5NjZiaVpPcndFdEgwMGRqbUtNeEw5UXJ5amlsS3hS?=
 =?utf-8?B?NmFCK2l5b2hrMjF2T2hjbSt0OG15RStISWZ6bkZ3SXBjUWhHdzRpekwrS2dr?=
 =?utf-8?B?ZitJMHQ0Ym5pU1NuSHpIMFg0SVBKd2o2K2xkaWh2dHlPUW51YkIrY2xOYTBP?=
 =?utf-8?B?TXdyS1VFR011RzVWTEpxaE5qeURNSHlqdldWVDB6QllMTGtZaDdJNjRrMzFy?=
 =?utf-8?B?UURPME94SCt1TW5XcTdhbzJqOVFOYk1OYlJ5YWI4RGFoT1U3bFV4WHBoU2Na?=
 =?utf-8?B?L1p0TmRCbnpEc2ppQi9RbEl2U2dSTXJ0S0dZcFE4R3EzTXk5R0NBMzdLaDF1?=
 =?utf-8?B?Zm93RTdQOWxpenJURVpUOExqbHAyaEpCOVE3QndUa1J3OThXeGV1b0dxU3BW?=
 =?utf-8?B?MERUMlhqSC96TUhabU8zbXNrbEpwNkF5TGZLMWpsK0JTalVRWDBLdGV5aWV4?=
 =?utf-8?B?UGhCb1cwdmVsMlpRcWN6TFhmN285TmRJSnlwUEExS2xmam1vc2R0Rnpwdm9M?=
 =?utf-8?B?Wm40RzdhYkRuYzB3SHhPVWJKK0o2T3IvYit3YmRwUklkR3Q4b2ZPRFdJc2NP?=
 =?utf-8?B?VG8ydFlmQ3kxRFZEQy8vZXRzV2E3bjBFZ2hLWFE3ZXg0UEluSC9aSWJXWHJn?=
 =?utf-8?B?dnBzZDFsR0FiV1BSZExSdGUrNFpZbmdRanlwWEQ5SVhqcDhtSUtQdTFESld4?=
 =?utf-8?B?WGQ4anhKdjV0RzNOYUtJN2NpUnd4S21nQTlpcGNIcGVLTXRRMVpnMStaVlhi?=
 =?utf-8?B?cXArQ0JqNU1IMGNodWpRS0tTaEJDV0hiMWI3eW8yelBoNTVNVmpjL2E3MUgy?=
 =?utf-8?B?ejU2NmhpU1liUDdwOUJiTXpCNzBnWTJNb2MyRDl6UHI1ZUIxWEJnK0srUll2?=
 =?utf-8?B?OTV0Q2E3emhrTzZWZDJ5ZmZlZ1Z0cEhoVFIvenJlUVVIR0srSHRYOFlhZzBn?=
 =?utf-8?B?aWhsYXpnSVdmMWRyRVZZNW1jTGo4bDNDa1dDWkZuRE8ycEY4QlBCV250WHJs?=
 =?utf-8?Q?5ky5TmD5RVloTyViMl9BI50=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c6b14e-1f45-4920-8881-08d9b41589d6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:24:45.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPDtWzui4jOB8IBmGWpgvjW1hnzIAhe94wLrtmvHUkdlHnkzf/MR7J8EJyecWz/MGyOvWa3aBgkF0pIAiQewgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5526
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:45:57AM +0200, Jan Beulich wrote:
> Introduce a helper function to determine the largest possible mapping
> that allows covering a request (or the next part of it that is left to
> be processed).
> 
> In order to not add yet more recurring dfn_add() / mfn_add() to the two
> callers of the new helper, also introduce local variables holding the
> values presently operated on.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -260,12 +260,38 @@ void iommu_domain_destroy(struct domain
>      arch_iommu_domain_destroy(d);
>  }
>  
> -int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
> +static unsigned int mapping_order(const struct domain_iommu *hd,
> +                                  dfn_t dfn, mfn_t mfn, unsigned long nr)
> +{
> +    unsigned long res = dfn_x(dfn) | mfn_x(mfn);
> +    unsigned long sizes = hd->platform_ops->page_sizes;
> +    unsigned int bit = find_first_set_bit(sizes), order = 0;
> +
> +    ASSERT(bit == PAGE_SHIFT);
> +
> +    while ( (sizes = (sizes >> bit) & ~1) )
> +    {
> +        unsigned long mask;
> +
> +        bit = find_first_set_bit(sizes);
> +        mask = (1UL << bit) - 1;
> +        if ( nr <= mask || (res & mask) )
> +            break;
> +        order += bit;
> +        nr >>= bit;
> +        res >>= bit;
> +    }
> +
> +    return order;
> +}

This looks like it could be used in other places, I would at least
consider using it in pvh_populate_memory_range where we also need to
figure out the maximum order given an address and a number of pages.

Do you think you could place it in a more generic file and also use
more generic parameters (ie: unsigned long gfn and mfn)?

> +
> +int iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
>                unsigned long page_count, unsigned int flags,
>                unsigned int *flush_flags)
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
>      unsigned long i;
> +    unsigned int order;
>      int rc = 0;
>  
>      if ( !is_iommu_enabled(d) )
> @@ -273,10 +299,16 @@ int iommu_map(struct domain *d, dfn_t df
>  
>      ASSERT(!IOMMUF_order(flags));
>  
> -    for ( i = 0; i < page_count; i++ )
> +    for ( i = 0; i < page_count; i += 1UL << order )
>      {
> -        rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
> -                        mfn_add(mfn, i), flags, flush_flags);
> +        dfn_t dfn = dfn_add(dfn0, i);
> +        mfn_t mfn = mfn_add(mfn0, i);
> +        unsigned long j;
> +
> +        order = mapping_order(hd, dfn, mfn, page_count - i);
> +
> +        rc = iommu_call(hd->platform_ops, map_page, d, dfn, mfn,
> +                        flags | IOMMUF_order(order), flush_flags);
>  
>          if ( likely(!rc) )
>              continue;
> @@ -284,14 +316,18 @@ int iommu_map(struct domain *d, dfn_t df
>          if ( !d->is_shutting_down && printk_ratelimit() )
>              printk(XENLOG_ERR
>                     "d%d: IOMMU mapping dfn %"PRI_dfn" to mfn %"PRI_mfn" failed: %d\n",
> -                   d->domain_id, dfn_x(dfn_add(dfn, i)),
> -                   mfn_x(mfn_add(mfn, i)), rc);
> +                   d->domain_id, dfn_x(dfn), mfn_x(mfn), rc);
> +
> +        for ( j = 0; j < i; j += 1UL << order )
> +        {
> +            dfn = dfn_add(dfn0, j);
> +            order = mapping_order(hd, dfn, _mfn(0), i - j);
>  
> -        while ( i-- )
>              /* if statement to satisfy __must_check */
> -            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
> -                            0, flush_flags) )
> +            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn, order,
> +                            flush_flags) )
>                  continue;
> +        }

Why you need this unmap loop here, can't you just use iommu_unmap?

Thanks, Roger.


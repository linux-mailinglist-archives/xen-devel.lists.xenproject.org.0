Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459754B1284
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 17:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269917.464062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIC7R-00061V-NU; Thu, 10 Feb 2022 16:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269917.464062; Thu, 10 Feb 2022 16:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIC7R-0005yh-JT; Thu, 10 Feb 2022 16:16:29 +0000
Received: by outflank-mailman (input) for mailman id 269917;
 Thu, 10 Feb 2022 16:16:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9Dk=SZ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIC7P-0005yb-DV
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 16:16:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c98a5bd4-8a8c-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 17:16:23 +0100 (CET)
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
X-Inumbo-ID: c98a5bd4-8a8c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644509783;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HpgrniM/GR9flc47TLdhA0mQkK9wxxlQYC2qAjHjRGY=;
  b=YDU41omWVc9fX6CvsVmAFn+ZZmMAuEUQsxP1vzrv9HbhzdUhxmaHdHWd
   rwJOYa1kfXdLBGTwimHnmlRMlSO+W8ZPk/Aiy/aeQbDLC7uzR/vSsz17j
   /KZGE20da3B32yHemB3/KosBlf08bhiICxoAj0WGbSjKzhJGn7DIXehRU
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WpS0jnluU8ig2mjyDh1xJ+0dSMHPG3GBLgP7BsBxZ3uqYJXzLU0DbniAy0qK9QthtJOMHKbxvp
 UqD3l3t6JS2Y/PLHVWSjFJt1I9HQS72ysm1a4l1TSwhRi7aTisqVv8v9TxsMypoZGqsYv8sa4g
 nOWlKnOKV882v1t5sHMRtZrOFUc9tF5Mh3jWVUHuIkynwxu5DqG7JKM74CE3M3T4WLa7MtHRSt
 p3KcLv6Ni0qpJx7cVADZLEsOtiJX1McptKIXjxbCZcDljZSoHmOxXEG1un3muAywN+PcUc2XAs
 5S0Z5hy0WY4jyUFcODWpPzRu
X-SBRS: 5.1
X-MesageID: 63389810
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vxPFeq5+80Xh7uLy+2aAVAxRtBbBchMFZxGqfqrLsTDasY5as4F+v
 jAZUD2CPamKZmP9f4x+bNnkpkhV6MSDzt81Sgdpryk0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Yw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 4xR7ITrbyESDoaTpNUNbjpaLAVwMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxr1pEeRK62i
 8wxYz9UdBT7W0J1E15NOJcGnMuE3XL1WmgNwL6SjfVuuDWCpOBr65DkKsbYf+uPVMpcn0uGj
 m/e9mG/CRYfXPSBzj6C/mOpl/X4lyrxU4IPF5W17vdvxlaUwwQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGSsStT+RBS+rGSztxgQQcdLE+Y65QeOzYLZ+w+cQGMDS1ZpctUmqctwXj0s2
 V+hlsnsQzdotdW9TnaQ9aydqz+oDjQENm8JZSICTgwt7sHqpcc4iRenZsZuFuu5g8P4HRn0w
 iuWt24uirMLl8kJ2q6nu1fdjFqEr57FVFRtvl3/UWes7wc/b4mgD6Sq41XG6fdLLK6CU0KM+
 nMDnqC29/sSBJuAkCiMRuQlH7yz4fuBdjrGjjZHHYQl9jmr026ue8ZX+j4WGatyGp9aI3mzO
 haV4F4Pos8IVJe3UUNpS9noF50ylo7GLuTOCczlfudtYKdVegDSqUmCenWs92zqlUEtl4Q2N
 pGabdugAB4mNEh38Nalb7xDiOF2n0jS0UuWHMmmlEr/jdJycVbIEe9tDbeYUgwuAEpoSi3x+
 s0XCcaFwg43vAbWMniOqt57wbznwBEG6XHKRy5/K7brzulOQjhJ5xrtLVUJINUNc0N9zLmgw
 51FchUEoGcTfFWeQelwVlhtaan0QbF0pm8hMConMD6AgiZ/Pdr0tv9HLMtoLNHLEdCPK9YvF
 pHpnO3aXJxypsnvoWxBPfERUqQ+HPhUue5+F3X8O2VuF3KRbwfI5sXlbmPSGNomVUKKWT8Fi
 +T4jGvzGMNbLyw7VZq+QK//njuZ4ClG8MovDhSgHzWmUBi1mGScA3eq1aFfzgBlAUir+wZ2I
 C7IXUlG9bOQ/+fYMrDh3Mi5kmtgKMMndmJyFGjH97emcy7c+2uo24hbV+iUOzvaUQvJFG+KP
 I25Ftnwb68KmkhkqY15H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Op44JwW5gWzhwAEKNGDiiwIpW2AImZZC/cst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP3u0OyFDDfnw/EWn28dBc3Zle6gpXyFIiJkiSnoaXjPEAwxAMoy88SR5Yz0sb3rsra
 HRrLUB8OY6H4yxs2JpYR2mpFgxMWE+Z90j2xwdbnWHVVRD1BGnELWl7MueR5kEJtWlbe2EDr
 r2fzW/kVxfsfd3wgXRuCRI09aS7QIwj7BDGleCmA9+BTsszbjfSi6OzYXYF9kn8CsQriUyb/
 eRn8Y6cs0Eg2fL8d0HjN7Sn6A==
IronPort-HdrOrdr: A9a23:kbITY68QTIXOZRnVs1huk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,359,1635220800"; 
   d="scan'208";a="63389810"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l25MdkKBl+IF0x1CXeVuLIFa4eHS9qhoT1xEev9L0+qv+K8TyxI8CcW9P2E9l3aiN1wf2Z9sJW/Bik1l+WlEjdmoVI5kByrHjeLuhusawIIfIZV5InpmpR8EqNLsUxS1NcyRiQvzZjbkmOXQGlkX0LieVfp/ldo+Q/EVHaobKMGIZARlCStP4Naq1TzniycDaKfW08bC4JutUszE25dgJ/oz4xuX0WRLaE1ZxIDYyhHwXiyfqoNTWhxXqMdZ15GG5hd99HP5JBd/uf0xxVWmX4tzmKkF6rSGKYGkraCLso5fL8fJwbF9RuNsJGW0mbYr2p9gf1VVfr4Sp/6V7+TU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sJ+hCBcfx7fBWMzoFN1Gqj03lwJkNNyShDXtGng+tU=;
 b=IZsV0wqSaZcp9BeShQ6B36MQh3LKT8c1vzZf2pDRv1/o4/+JuEF+AvogdTfyN8EbpIje2Nf+LGOdbGM9q6Mw3qTu2JRuFaoJmN3Utco1lRj+GvcJGIJXXHQRGZTHsFcVQ7IWpvJLwtovd4VvbOlYmUgWNxRvAEXGBbN1KhZ+fdgTQ8vxLL054iHq+Z4puDElNbWFdAVnyX+jHOvR7ZwvgnRN2RylPt5HxdN5qVswLOhee1N3j2CwaUUC9lV5ildTNOMpB+JMjCAoO9cAUWn+Xn2gjH1v7GJHQZdKqzTv2ZCPb2l8nGYpLgYTgwSD/sI2MGedF/uxu1pBfnb1na1HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sJ+hCBcfx7fBWMzoFN1Gqj03lwJkNNyShDXtGng+tU=;
 b=aLQNhpU/51Z3JWkrt91onywaLvQsoOBER6bJIHaiexdK0qC9yTK2kfk/wFMTsCJgQc9TUKtoImqAAcHnLjEnIO3w5iqhX3aXTsD1sXq6eRrnfzx3e+4NgV3Lr/rbuSr3aP+gXDZrQ0SS0Hf4d7SplyqVMnrkn0NmCR5PNnwItSg=
Date: Thu, 10 Feb 2022 17:16:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <artem_mygaiev@epam.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <YgU6Snk8GTytJXZp@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220209133627.959649-1-andr2000@gmail.com>
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6f76b0a-0e7e-4711-f30e-08d9ecb0a965
X-MS-TrafficTypeDiagnostic: MWHPR03MB2957:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2957F56BA94B2CB481D3BF868F2F9@MWHPR03MB2957.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JDIe1OO7hQ40Yb0IJOdvWkWQbX4Mzf6aO9AVLVVNexy9JytBA/c3YMxgrOuWzAwKzi4uH5sgBY/33tarPSjUBNzxcihWa/R0PioJysxBsuB3cfDyLp00giCJkBlBdD61gR+5F1eNKmc0KEaQX+bwxHwIfH+ZnNC9x6BLflryskpajuFpZrttu3RKuyen7V5DK1s0JDpBtjQBkEfts1FpXhLzgszZQLYAJNgxXPm7kWJY5CoUiQm4n7oiTYHHwZ6CX4Zm1+nZesmn5kF/1njkMsi2WECvtOOx5tIIvb5IuamfytqwVmUhZdyKyNiIqZnX9HBd2muTbkcFhICfqwApKHgMSV6PJTOIVKtZZXK/Uu3+dD3k9lVgbrGjANnDZ7QT+9znXtof1dZUb484InP/Ez+PM2N5OeqXySM6yO8cr8rdom6cu1NHaq8WXSjNVf4L4nqsAsrmuioBNAxhlAIlaDjCGFObVroSd48YnQxEr9TCqnJpyFK6KL1hHXx9MSWI6CNWJ8rPOOj4iPbOSR+IXF1+eSnX7RkXih8Gb8/DJ/Xd3lDKOtEOC/huK23WfoP+Rwe+YSxvrwS7DcxtKtEoad8FeNBhqqVmjX5hfP76vP+baEBhzSRCFlKGJ/zkxtv/zUFA/NzGXcL0WotAjoasYrsAky0hIrn/M5A2NyyfeiY/0/vc8yTQZn7RfysGV4U1cVRNxz0ae96Zaute2hcWlyH2lS13zfLHQ3c01NsEsMBZMgrmKSrxHfUejxHgLnyIt9QA/qsV/EeZIR1Jmvv0l0PMkL9FOAH4wbCr5QxFnuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(9686003)(966005)(6486002)(86362001)(85182001)(6916009)(33716001)(316002)(508600001)(38100700002)(6512007)(66946007)(6506007)(2906002)(66476007)(66556008)(4326008)(30864003)(8936002)(7416002)(83380400001)(8676002)(82960400001)(5660300002)(186003)(26005)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9LVmpUYURxN3pkcEdzaFBuSUVhaGtseEYzcXR4MDd4NzVyRkZIT1kwb2x4?=
 =?utf-8?B?bDZqOSsxK2RyYitvWGRhdWs4MEJ1ZDRsUDAwNDR5a2hINGoyK2hEa1hQUXBz?=
 =?utf-8?B?NFNpNDg0NmNxSnBPSmJMS1lkTmwrdnlhenR1UW9qNzZlWFRlZTJwbFlIKzVN?=
 =?utf-8?B?TDMrNXd5NWY1OVp1em9aeUVhZUZ4TTRXSlo5dlZnWDViNjZSM2FEU1p3ZUwz?=
 =?utf-8?B?RURkUHJvRlN0ZXp3a3BKUVFQbXNtQXRQRXNQNU9yYW9DS0lNYkY3VytiaVpP?=
 =?utf-8?B?NE5vRHJUU2Zpcjl2Zkt5c1FuTkpEN0YxVDhrbVZRNG5qSlBaZUNvNURjSlhz?=
 =?utf-8?B?TVhCYTE4VDlBNWFMb0dmbjhNbklOdmJieTRCMDh5MURRT1pCQkVQeTZweFVs?=
 =?utf-8?B?dzJCNy84bHdqQXVxU2hoc1UwRFA1UlpMWFRYQ0Z5cy8yRVErdGh3RVlseWdH?=
 =?utf-8?B?ZkZJUC96bTJReWlkSUxKR2wyM3lvSTNjMklXai85SDBWc3hjdlprVUd5ODZx?=
 =?utf-8?B?SDJRRFJLMElxTlJ1UUlWaklkdlVoYThZM1R1U29kTTVHRnBMMGhhaXdINmFq?=
 =?utf-8?B?VHNzNUUydFpaMGk2OWZZQVpldHhjUTV0WDljbFNoa201K1BManBXanA1dVh5?=
 =?utf-8?B?ZlpNampVa0RTdmY4SVBhS3pHS3c1ZVljNHl0Nlo1dUp4b21EZS9jYUI2R1pv?=
 =?utf-8?B?dEFmaUZwckYwTUhSUDU3QjZnVmVrUHh3YzRVZGF1Lzk3eEtjN1cwWmFjNER3?=
 =?utf-8?B?RWxJTldOUXpTOUtlUDJramI0RklUWlgvVHR0MVVabWlnUzhpTU1MdUdDUXFw?=
 =?utf-8?B?NFVsNm1Ba0M5V0t1ajkxQitpc1lQOGVDRFFLMWo1dU1ERjJ1eFRqcnJIc2hn?=
 =?utf-8?B?enJOU01Zc2xBNUlDVTE0bDBUaGg1cGYvL3RTM3VQT1Q3a05nNTFIMGZLSyta?=
 =?utf-8?B?bHJIcWM1U1VIZWN2b2E0aHZYV2thU2x1Z1RkamRhbmFtWjJwdytNTmwyeGhu?=
 =?utf-8?B?cFFRdnowTTFraDhtRDdTV0VTSGgvK3FvdmtManF2U3ZFTG16MnlDa2phTXAw?=
 =?utf-8?B?K2RSOVJRTGdmQkdSamxQRVJwRXJYMVQzQSsrSzVwR1hIczc3VGNpeWVlYzhJ?=
 =?utf-8?B?MzZxSEpwYXBHbFQyejRCR3VSQ2o1K2l0Z3RHazlHUDJpSzJYWVlUaDlpN2pF?=
 =?utf-8?B?b09vUmZwcW04WVpadld6R0NuMmZpckpOVGJpTVZnUXBveTZYSWdxdkRwa01I?=
 =?utf-8?B?UWNjZ3c1VEN4N2dGeEJraWtBbmxNVTF3Mkd4VWV0d1Q3TXoyTjVXRkVVWmFs?=
 =?utf-8?B?ajNPdnN6Y3BpNHpiM3doeTMzNmI3M2prOWdiRFdQRGo3eUtLdTFBaXA2dHpD?=
 =?utf-8?B?SDZITUNvS2I2YzIyTFdieUVEVDNPU1hjYUJYOE1SMWI5a2NUTkFUSVpZa1po?=
 =?utf-8?B?Q3dQQjJPNTRFb1RZa0lVYWVRUkZsc0pFekU4dDBxazcxWmpzbHVwQTN4SGF4?=
 =?utf-8?B?Wi8weGl3N3JFOTNJZWE2YVFRMmFVejZ3bjFZc0QvYkZyQWdIMlNzSXEwWUUz?=
 =?utf-8?B?azVEM09ZUkx4dFlJeWsxUVV2akNwSFFSWmxpWkRxaDl3Ym9CQnNoTXZHVVZE?=
 =?utf-8?B?bGhBM0RXSVI4eVlKREJmY0kwQ04wQ0ZaTHQ5TEpZOEcwSTlld0wvM3RnT0lh?=
 =?utf-8?B?anlDb21KUHZNQkhOL0ZUbmRRT2FGMnFWaHRYRW5hcThmWDFJcm9HOVhhR25r?=
 =?utf-8?B?ZVZCRCtucDJRWTlNeWtEODg2NUc3VkpYODV4b1hTWUYvMlRNeDdseE9MaXlL?=
 =?utf-8?B?RHh0RlBBR0FSQzZqa2EzcDB3RlV3emovTDRoSzRERjlqSnpRMUFYc2tDSzAy?=
 =?utf-8?B?dGVybDNCZnNDeFJ1dGprRlhnNlI3TlJPMENjVzNmdjVlb25JMVNkN3ZySzRT?=
 =?utf-8?B?WGxWNmh2M3Vma0xEcmxiYXFtT2V3WURzTHBadENFbk5qR2ZpOHVBTjhaY3RQ?=
 =?utf-8?B?aE15N3pWSHNEVytReHNJQ0p5ZW03eEdsaHMrRWJsTklzUFU4em8wZU9VWGpS?=
 =?utf-8?B?b2dlRU5CYlVOdi9TUEFqemJlbTZyR0ZUUWRKOVV4WnBGRjRGUjZCSW1MdXEw?=
 =?utf-8?B?blc4eTZNUFAzWG9JcXMzTVRIeVN4L213aEwwRndDYUthMnFNWVlhN1lmbFNN?=
 =?utf-8?Q?ey1qTQlOYLPPciCk6HlJxXo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f76b0a-0e7e-4711-f30e-08d9ecb0a965
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 16:16:15.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+/J3xYy5NiWNyflu8OxMG3wyjyEzRt998NIdvMFWMzjKhYi3adBn8xQmCS4JDg6+vkTcYhFtPdOhNmt+xU6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2957
X-OriginatorOrg: citrix.com

On Wed, Feb 09, 2022 at 03:36:27PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Introduce a per-domain read/write lock to check whether vpci is present,
> so we are sure there are no accesses to the contents of the vpci struct
> if not. This lock can be used (and in a few cases is used right away)
> so that vpci removal can be performed while holding the lock in write
> mode. Previously such removal could race with vpci_read for example.

Sadly there's still a race in the usage of pci_get_pdev_by_domain wrt
pci_remove_device, and likely when vPCI gets also used in
{de}assign_device I think.

> 1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
> from being removed.
> 
> 2. Writing the command register and ROM BAR register may trigger
> modify_bars to run, which in turn may access multiple pdevs while
> checking for the existing BAR's overlap. The overlapping check, if done
> under the read lock, requires vpci->lock to be acquired on both devices
> being compared, which may produce a deadlock. It is not possible to
> upgrade read lock to write lock in such a case. So, in order to prevent
> the deadlock, check which registers are going to be written and acquire
> the lock in the appropriate mode from the beginning.
> 
> All other code, which doesn't lead to pdev->vpci destruction and does not
> access multiple pdevs at the same time, can still use a combination of the
> read lock and pdev->vpci->lock.
> 
> 3. Optimize if ROM BAR write lock required detection by caching offset
> of the ROM BAR register in vpci->header->rom_reg which depends on
> header's type.
> 
> 4. Reduce locked region in vpci_remove_device as it is now possible
> to set pdev->vpci to NULL early right after the write lock is acquired.
> 
> 5. Reduce locked region in vpci_add_handlers as it is possible to
> initialize many more fields of the struct vpci before assigning it to
> pdev->vpci.
> 
> 6. vpci_{add|remove}_register are required to be called with the write lock
> held, but it is not feasible to add an assert there as it requires
> struct domain to be passed for that. So, add a comment about this requirement
> to these and other functions with the equivalent constraints.
> 
> 7. Drop const qualifier where the new rwlock is used and this is appropriate.
> 
> 8. This is based on the discussion at [1].
> 
> [1] https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> This was checked on x86: with and without PVH Dom0.
> ---
>  xen/arch/x86/hvm/vmsi.c   |   2 +
>  xen/common/domain.c       |   3 +
>  xen/drivers/vpci/header.c |   8 +++
>  xen/drivers/vpci/msi.c    |   8 ++-
>  xen/drivers/vpci/msix.c   |  40 +++++++++++--
>  xen/drivers/vpci/vpci.c   | 114 ++++++++++++++++++++++++++++----------
>  xen/include/xen/sched.h   |   3 +
>  xen/include/xen/vpci.h    |   2 +
>  8 files changed, 146 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 13e2a190b439..351cb968a423 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -893,6 +893,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>  {
>      unsigned int i;
>  
> +    ASSERT(!!rw_is_locked(&msix->pdev->domain->vpci_rwlock));
              ^ no need for the double negation.

Also this asserts that the lock is taken, but could be by a different
pCPU.  I guess it's better than nothing.

> +
>      for ( i = 0; i < msix->max_entries; i++ )
>      {
>          const struct vpci_msix_entry *entry = &msix->entries[i];

Since this function is now called with the per-domain rwlock read
locked it's likely not appropriate to call process_pending_softirqs
while holding such lock (check below).

We will likely need to re-iterate over the list of pdevs assigned to
the domain and assert that the pdev is still assigned to the same
domain.

> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 2048ebad86ff..10558c22285d 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -616,6 +616,9 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PCI
>      INIT_LIST_HEAD(&d->pdev_list);
> +#ifdef CONFIG_HAS_VPCI
> +    rwlock_init(&d->vpci_rwlock);
> +#endif
>  #endif
>  
>      /* All error paths can depend on the above setup. */
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 40ff79c33f8f..9e2aeb2055c9 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -142,12 +142,14 @@ bool vpci_process_pending(struct vcpu *v)
>          if ( rc == -ERESTART )
>              return true;
>  
> +        read_lock(&v->domain->vpci_rwlock);
>          spin_lock(&v->vpci.pdev->vpci->lock);
>          /* Disable memory decoding unconditionally on failure. */
>          modify_decoding(v->vpci.pdev,
>                          rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
>                          !rc && v->vpci.rom_only);
>          spin_unlock(&v->vpci.pdev->vpci->lock);
> +        read_unlock(&v->domain->vpci_rwlock);
>  
>          rangeset_destroy(v->vpci.mem);
>          v->vpci.mem = NULL;
> @@ -203,6 +205,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>      raise_softirq(SCHEDULE_SOFTIRQ);
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> @@ -454,6 +457,8 @@ static int init_bars(struct pci_dev *pdev)
>      struct vpci_bar *bars = header->bars;
>      int rc;
>  
> +    ASSERT(!!rw_is_write_locked(&pdev->domain->vpci_rwlock));
> +
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
>      case PCI_HEADER_TYPE_NORMAL:
> @@ -548,6 +553,7 @@ static int init_bars(struct pci_dev *pdev)
>      {
>          struct vpci_bar *rom = &header->bars[num_bars];
>  
> +        header->rom_reg = rom_reg;
>          rom->type = VPCI_BAR_ROM;
>          rom->size = size;
>          rom->addr = addr;
> @@ -559,6 +565,8 @@ static int init_bars(struct pci_dev *pdev)
>          if ( rc )
>              rom->type = VPCI_BAR_EMPTY;

You can also set 'rom_reg = ~0' here. Or move the setting of rom_reg
after the handler has been successfully installed.

I think it would be easier to just signal no ROM BAR with rom_reg ==
0.  There's no header where the ROM BAR is at offset 0.  That way you
will only have to set rom_reg on the successful path, but you don't
need to care about the case where there's no ROM BAR.

>      }
> +    else
> +        header->rom_reg = ~(unsigned int)0;

No need for the cast.

>  
>      return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
>  }
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 5757a7aed20f..5df3dfa8243c 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -190,6 +190,8 @@ static int init_msi(struct pci_dev *pdev)
>      uint16_t control;
>      int ret;
>  
> +    ASSERT(!!rw_is_write_locked(&pdev->domain->vpci_rwlock));
> +
>      if ( !pos )
>          return 0;
>  
> @@ -265,7 +267,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
>  
>  void vpci_dump_msi(void)
>  {
> -    const struct domain *d;
> +    struct domain *d;
>  
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
> @@ -277,6 +279,9 @@ void vpci_dump_msi(void)
>  
>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>  
> +        if ( !read_trylock(&d->vpci_rwlock) )
> +            continue;
> +
>          for_each_pdev ( d, pdev )
>          {
>              const struct vpci_msi *msi;
> @@ -326,6 +331,7 @@ void vpci_dump_msi(void)
>              spin_unlock(&pdev->vpci->lock);
>              process_pending_softirqs();
>          }
> +        read_unlock(&d->vpci_rwlock);

Same here, you are calling process_pending_softirqs while holding
vpci_rwlock.

>      }
>      rcu_read_unlock(&domlist_read_lock);
>  }
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 846f1b8d7038..5296d6025d8e 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -138,6 +138,7 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, val);
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */
>  static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  {
>      struct vpci_msix *msix;
> @@ -158,7 +159,12 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
>  
>  static int msix_accept(struct vcpu *v, unsigned long addr)
>  {
> -    return !!msix_find(v->domain, addr);
> +    int rc;
> +
> +    read_lock(&v->domain->vpci_rwlock);
> +    rc = !!msix_find(v->domain, addr);
> +    read_unlock(&v->domain->vpci_rwlock);

Newline before return.

> +    return rc;
>  }
>  
>  static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
> index fb0947179b79..16bb3b832e6a 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -89,22 +104,28 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
>  #endif /* __XEN__ */
>  
> -static int vpci_register_cmp(const struct vpci_register *r1,
> -                             const struct vpci_register *r2)
> +static int vpci_offset_cmp(unsigned int r1_offset, unsigned int r1_size,
> +                           unsigned int r2_offset, unsigned int r2_size)
>  {
>      /* Return 0 if registers overlap. */
> -    if ( r1->offset < r2->offset + r2->size &&
> -         r2->offset < r1->offset + r1->size )
> +    if ( r1_offset < r2_offset + r2_size &&
> +         r2_offset < r1_offset + r1_size )
>          return 0;
> -    if ( r1->offset < r2->offset )
> +    if ( r1_offset < r2_offset )
>          return -1;
> -    if ( r1->offset > r2->offset )
> +    if ( r1_offset > r2_offset )
>          return 1;
>  
>      ASSERT_UNREACHABLE();
>      return 0;
>  }
>  
> +static int vpci_register_cmp(const struct vpci_register *r1,
> +                             const struct vpci_register *r2)
> +{
> +    return vpci_offset_cmp(r1->offset, r1->size, r2->offset, r2->size);
> +}

Seeing how this gets used below I'm not sure it's very helpful to
reuse vpci_register_cmp, see my comment below.

> +
>  /* Dummy hooks, writes are ignored, reads return 1's */
>  static uint32_t vpci_ignored_read(const struct pci_dev *pdev, unsigned int reg,
>                                    void *data)
> @@ -129,6 +150,7 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
>      return pci_conf_read32(pdev->sbdf, reg);
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */
>  int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>                        vpci_write_t *write_handler, unsigned int offset,
>                        unsigned int size, void *data)
> @@ -152,8 +174,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      r->offset = offset;
>      r->private = data;
>  
> -    spin_lock(&vpci->lock);
> -
>      /* The list of handlers must be kept sorted at all times. */
>      list_for_each ( prev, &vpci->handlers )
>      {
> @@ -165,25 +185,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>              break;
>          if ( cmp == 0 )
>          {
> -            spin_unlock(&vpci->lock);
>              xfree(r);
>              return -EEXIST;
>          }
>      }
>  
>      list_add_tail(&r->node, prev);
> -    spin_unlock(&vpci->lock);
>  
>      return 0;
>  }
>  
> +/* This must hold domain's vpci_rwlock in write mode. */
>  int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>                           unsigned int size)
>  {
>      const struct vpci_register r = { .offset = offset, .size = size };
>      struct vpci_register *rm;
>  
> -    spin_lock(&vpci->lock);
>      list_for_each_entry ( rm, &vpci->handlers, node )
>      {
>          int cmp = vpci_register_cmp(&r, rm);
> @@ -195,14 +213,12 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>          if ( !cmp && rm->offset == offset && rm->size == size )
>          {
>              list_del(&rm->node);
> -            spin_unlock(&vpci->lock);
>              xfree(rm);
>              return 0;
>          }
>          if ( cmp <= 0 )
>              break;
>      }
> -    spin_unlock(&vpci->lock);
>  
>      return -ENOENT;
>  }
> @@ -310,7 +326,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>  
>  uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
> @@ -327,6 +343,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>      if ( !pdev )
>          return vpci_read_hw(sbdf, reg, size);
>  
> +    read_lock(&d->vpci_rwlock);

After taking the domain lock you need to check that pdev->vpci !=
NULL, as vpci_remove_device will set pdev->vpci == NULL before
removing the device from the domain. Same applies to vpci_add_handlers
which will be called with the device already added to the domain, but
with pdev->vpci == NULL.

We would also need some kind of protection arround
pci_get_pdev_by_domain so that devices are not removed (from the
domain) while we are iterating over it.

>      spin_lock(&pdev->vpci->lock);
>  
>      /* Read from the hardware or the emulated register handlers. */
> @@ -371,6 +388,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          ASSERT(data_offset < size);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    read_unlock(&d->vpci_rwlock);
>  
>      if ( data_offset < size )
>      {
> @@ -410,14 +428,37 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>               r->private);
>  }
>  
> +static bool vpci_header_write_lock(const struct pci_dev *pdev,
> +                                   unsigned int start, unsigned int size)

I think this should live in header.c, for consistency.

I'm also not sure it's worth adding vpci_offset_cmp: you just need to
do a range overlap check, and that can be easily open coded. It's just
the first 'if' in vpci_register_cmp that you want, the rest of the
code is just adding overhead.

> +{
> +    /*
> +     * Writing the command register and ROM BAR register may trigger
> +     * modify_bars to run which in turn may access multiple pdevs while
> +     * checking for the existing BAR's overlap. The overlapping check, if done
> +     * under the read lock, requires vpci->lock to be acquired on both devices
> +     * being compared, which may produce a deadlock. It is not possible to
> +     * upgrade read lock to write lock in such a case. So, in order to prevent
> +     * the deadlock, check which registers are going to be written and acquire
> +     * the lock in the appropriate mode from the beginning.
> +     */
> +    if ( !vpci_offset_cmp(start, size, PCI_COMMAND, 2) )
> +        return true;
> +
> +    if ( !vpci_offset_cmp(start, size, pdev->vpci->header.rom_reg, 4) )

No need for the comparison if rom_reg is unset. Also you can OR both
conditions into a single if.

> +        return true;
> +
> +    return false;
> +}
> +
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
>  {
> -    const struct domain *d = current->domain;
> +    struct domain *d = current->domain;
>      const struct pci_dev *pdev;
>      const struct vpci_register *r;
>      unsigned int data_offset = 0;
>      const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
> +    bool write_locked = false;
>  
>      if ( !size )
>      {
> @@ -440,7 +481,17 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>          return;
>      }
>  
> -    spin_lock(&pdev->vpci->lock);
> +    if ( vpci_header_write_lock(pdev, reg, size) )
> +    {
> +        /* Gain exclusive access to all of the domain pdevs vpci. */
> +        write_lock(&d->vpci_rwlock);
> +        write_locked = true;

Here you need to check that pdev->vpci != NULL...

> +    }
> +    else
> +    {
> +        read_lock(&d->vpci_rwlock);

...and also here.

> +        spin_lock(&pdev->vpci->lock);
> +    }
>  
>      /* Write the value to the hardware or emulated registers. */
>      list_for_each_entry ( r, &pdev->vpci->handlers, node )
> @@ -475,7 +526,14 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>              break;
>          ASSERT(data_offset < size);
>      }
> -    spin_unlock(&pdev->vpci->lock);
> +
> +    if ( write_locked )
> +        write_unlock(&d->vpci_rwlock);
> +    else
> +    {
> +        spin_unlock(&pdev->vpci->lock);
> +        read_unlock(&d->vpci_rwlock);
> +    }
>  
>      if ( data_offset < size )
>          /* Tailing gap, write the remaining. */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 37f78cc4c4c9..ecd34481a7af 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -444,6 +444,9 @@ struct domain
>  
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
> +#ifdef CONFIG_HAS_VPCI
> +    rwlock_t vpci_rwlock;
> +#endif
>  #endif
>  
>  #ifdef CONFIG_HAS_PASSTHROUGH
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index e8ac1eb39513..e19e462ee5cb 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -88,6 +88,8 @@ struct vpci {
>           * is mapped into guest p2m) if there's a ROM BAR on the device.
>           */
>          bool rom_enabled      : 1;
> +        /* Offset to the ROM BAR register if any. */
> +        unsigned int rom_reg;

Could you please place this field after 'type'? That will avoid some
padding in the structure.

Thanks, Roger.


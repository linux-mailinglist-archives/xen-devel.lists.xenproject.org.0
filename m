Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1B49515C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 16:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259100.446949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIm-00031H-3e; Thu, 20 Jan 2022 15:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259100.446949; Thu, 20 Jan 2022 15:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIl-0002xS-W3; Thu, 20 Jan 2022 15:24:39 +0000
Received: by outflank-mailman (input) for mailman id 259100;
 Thu, 20 Jan 2022 15:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAZIk-0002If-DH
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 15:24:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1310879e-7a05-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 16:24:37 +0100 (CET)
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
X-Inumbo-ID: 1310879e-7a05-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642692277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=m2MqR2DhtFMiEHrt+YuWBuOssJ0Pw1+H41fXQNlG5gw=;
  b=fAx0v8G/XKa9vZ/KTve3k2IcQF9e1R/6Gh3nB7Ho+wAqy8D0PCVZo+C7
   mrAHuiLCCEuJipXcawTg92nn9oRirfk2mRpStNDBGvdCCdZUgDDsOnFeZ
   nDaTZQfyk3/aWQ1EZ6TSCcQhatvbvlxlVc7BJMCdoSS3d59XHR7Gl9Mac
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N9XddzcHgt/QmCskYWkQuzs662NBi30PHrU1coqx5L7XoUUh+1Lp2IMQK1oXtKkKRF0AHmZsBt
 sDUnH5dXfZLKoENJz5g1ZhaAUl/OHjZ0NaeZPjZRVEFOEYH8I7Hy6lq6Nk2WppU+WSNVgqrO3y
 Yn3QPDyTIszwHNq/O8EsPiwoNtrFeD3gXweV0C9l186DFz9GmdtwNr32eBZnqbVnS55KRjKvFo
 i15HlKYQ1Jy0mIabSqBQoKDgp4Mlx5SEozrP1fKCJE1D1IWwat96QH1N5xINgDbQsDbaQEowwx
 tNpitsnNOE0sJZ+JuPjrFW+H
X-SBRS: 5.2
X-MesageID: 62414611
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h/u3x6DqE0x5SRVW/8jkw5YqxClBgxIJ4kV8jS/XYbTApD8i32NUy
 DFJUTzTP6vcNDPwKt0jOoq38UgH65bXndIyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En9400o7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tRCjvtQp9
 et2lY2IUVktOe6WtctFakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+WvIMGhW5YasZmB8/xW
 o0QUBZUQxmdeQxwGl0XJ7Ajg7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSIT8hImkeTp
 krd4n/0RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHDejeZpCa5gCU8SuJITek9q1ug5fLttlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL+dlr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2LDwpJDSsjPeZJgrBED3CBsZ6sy67DHzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj3pSf8LdwOvGguTKuMDiriUWW1C
 KM0kVgJjKK/wVPwNfMnC25PI5lCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrlBuZd2mHFW7T6DFPjTkkX8uZLDNSH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WnMnCIqtZCdA5TRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:znjMIqt+J2lty3M8cgjdScSW7skC7IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcT2/hsAV7CZniYhILMFuBfBOTZskTd8kHFh4tgPO
 JbAtJD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AWV0gJ1XYJNu/xKDwReOApP+tcKH
 LKjfA32QZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kSFjiWmgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62414611"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAA6/hyJe/xMcKlts8mf4I9Zr6c7j31+iNZbjTOO1Nd3J584XqsDgsFrcMqgrWxtWDtCkk9Nky8BYPQHjCV/kFPiECsH+r7MFflU/rU+Dg0DsJoTFKR0aNYkW8gGQOt3TF7ZPqJhWmZX8jeori9iyphpoHh5Ixfz21D3Onx87Xk6crqE+3KkGD66CbdX9jHAyQt1drafFfnhznmmA1R9N6iuPyhTENRhZQTWfEb0rMiF3Hi5mVCWudXRd61q5Sf491XrFdb2YxPgcgvpNNxNllA7v5gUsVk44KdVtyQ2NZsr0twa1CHV8hNmkOXNM/d4+41y9EgxtAIstoUYH217tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABP7/Br+owApC9qj4NTH4SDtKCbcra77tGh7FujuLWU=;
 b=k5vV/Oh8bg3Twm6g9FwI/ZqsDCY4+bB34ckDh/iyv2Vnc/R3mqiyoOAyUmIBsDq+UQha05QHw6Doqnp69WGLcE8Qw4Fkl1N/lL1u904eB4chK1IprbkquSYZNbXKGmR2s0gxfystrha6yL6vGBUPGDP2H3clMlWLpiO3bnkAFlMM1N3X8jkNQTCrEXsm9sPtGYeobZVCzS028v9SJHIhry/rSa0EH1LcM0CQlvzqtVaD0WuiN1/Vzvkj8yNv4APpY3WZ2BDCdkHI9AOpAZpywpLr2IGn5Q9mCqo6Yd7MLTu/5opSJs22yyNniIvJMa0J6Dmfzh5UFM8l3tPv1j4JXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABP7/Br+owApC9qj4NTH4SDtKCbcra77tGh7FujuLWU=;
 b=Mzra39GQKtdruqOD4NPH4ug9HsaIuwSXoHmwFYAL4/9/n2P/l+FA4uvMQfXxI9cJku8nvxysVd7OBeunkplRXF/TsIIID+0nW+z2MUE8fpEVX+gW3mpoRffnfX95OGy6IdmXzrV33+Ie/AShDKC/DmBAPPjiKtrtieh1mVZOz2Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] HACK: allow adding an offset to the x2APIC ID
Date: Thu, 20 Jan 2022 16:23:19 +0100
Message-ID: <20220120152319.7448-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120152319.7448-1-roger.pau@citrix.com>
References: <20220120152319.7448-1-roger.pau@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3da4c9b4-487d-45a9-f12f-08d9dc28f4a7
X-MS-TrafficTypeDiagnostic: BN7PR03MB3681:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB36810BC40C3818669061A41E8F5A9@BN7PR03MB3681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxURhUScCdN0F98Y1jiB3ibxYPl3QV58mURM+b4vD1ZGyoL5jzE8zS5CLZU9tEkGplOZktyAaud/0TVLQjbg9D10jAr60gYz8aTiSgtd/nM/jN69q4gIY0OrWMjrq8pJNe9iKHePHxmlLvGL+uHoYe93bfgUuvANY1oi7KUrLjOs8wJVdA2PC8qPlbqL3EfWAeHr/d9SlQw/ac+z2G07fWIipN7PqfWD7d/eCRFs/hHTLHuiben8EAayeCBxm0OX0MSHej1CROGRHIa1pOpn4ukO2/QOMW200RPCil6wk+IEh1jAK/MfauYYSU60SiT8bsqElF1769rC1j2IZyWDaRib+ekyN4GD688+xZ9lEGVBvlbaGOuR3D+79bFRBCVJLRuLR0YMkQS8znJYaYzLja1TT66xx5n9hiQ+FOej8LJvyL5KlQo9kKC+sQKyyigwhs+VI/Ew1ns1ioBoE4WD3HrvWigqhoha+qFqbUkDNnCI9m30d5NxC1wolZYza+xyB7QMVepgE7R6eg17jqsO2WD4Dyg8Nq7FEN6cZbgt4o7lNcYvejaVrcR+IJrUZ7i/ZOUbwcRHxUMpsLBOg4ExPZ0h5j9j82gUILYBPj1g/cQs3m0Hvrhf4+rpqPBUkusmlPbOHcWamLr0CDlRjdzQ0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(8676002)(6666004)(1076003)(508600001)(66476007)(54906003)(66556008)(2906002)(6512007)(82960400001)(8936002)(38100700002)(83380400001)(5660300002)(36756003)(26005)(6916009)(186003)(316002)(6506007)(6486002)(86362001)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O3UAM1EA45Ndo11H0cOGq3hsmTKotJ4h/SddcmxxesvINuUavS/cuKubU3TO?=
 =?us-ascii?Q?NryAsNG5XDjpgqKQmSCOM/sUbOQUxO0XVEPRD1FLV0qMCwUKGemKl+vhZiue?=
 =?us-ascii?Q?ov3C2t8StasGHdxw20I/VyuuZ4xz212vzAwT1OluRxtVY1qagelVgw3Uj86j?=
 =?us-ascii?Q?zVbZ8Zj4/mXAqQXjEVJT7n75jgpMfjd1zh85rr2gAsUWmFrjwKj0cHPbO4mB?=
 =?us-ascii?Q?pLNS3LEM/nZRYIXjCcS421vL+03iLE4CYLj+apcFSa10T7K3INpyrALueouf?=
 =?us-ascii?Q?oYKedpbvl9PpkTFH2xxFeyYxa5l+46MwB4fGDgK8HC1XAUUllSDQ0qkuEclx?=
 =?us-ascii?Q?XaU3IH/VP7RmbERf8CaGb8NION5ZECm7+SThTDcgOOr6gDaUFSzKQNn/1Arx?=
 =?us-ascii?Q?T5wAN2hkq0gnHrpieuEtTGh2UIsdWRBa/LV/amnqQMUbhJDL1jnDV+FrIt0q?=
 =?us-ascii?Q?6aDaZOwZ5O5qPcP00UKy2Jowa4PJYIZwvcEv+GrKKDYtY+X4ekVVmfplkuFR?=
 =?us-ascii?Q?tnqBixtbHRVmyqWLcst2rLo5yxTf0wC/UXXRKGYsrW/CrY7FwQw2hoz65oJS?=
 =?us-ascii?Q?DHRcmqDzDta3GhTO6udbgwW+jhF9GMTIkqXOKjRjl8z1pjzR3csJmQ1I9QDt?=
 =?us-ascii?Q?hs0q0/VWHTuShmuKNzFT3ci2X34G1m8GFOWSjqbzeX5UKR7wxgQFjSSqhl6t?=
 =?us-ascii?Q?73OJuB0ah8SKa/va1TDmkXmfZwl3DKgwJqmMiC6we+tyzU+N1ExjqYFT/GKZ?=
 =?us-ascii?Q?+LNcnW348tfGVjNRgz1BeZho+WHY/BbW5bmF0YKDeL4tYqeWRaWdIkYhDWmE?=
 =?us-ascii?Q?msP4X3DAwTSAyVKfsRobKA9j7jBv/4+QCuU706ob5iPN4KAAvGzmxdYAY9GC?=
 =?us-ascii?Q?l1ngGbbgY8MI+jSZGYaeb5ZkWKbWdvRaPiAYf0R/mnlavP2Xf7SLgSrotH2G?=
 =?us-ascii?Q?l5ONw09Oxz7tNUA2Xdt+Ept5aOJlg2NoEK8yHT/beLtiKqzQQpJK5NJCwzr0?=
 =?us-ascii?Q?zji2n64dUgAIc5RT4oYE54Pv7mJNGUX84bn5srye893FMgJI1mTYVvGeNFjd?=
 =?us-ascii?Q?Ry/upi7Z+UXys2DlimusMBsHDZjeH8D7Sfw1N0sJkuDCIzZWluHXRUKHNnQm?=
 =?us-ascii?Q?jhpcUtSwDOHDzNOx3c9/6pJn3iu3396IDHnfl0XJR2HT4Iz+2On/UPnzPdx5?=
 =?us-ascii?Q?MqrxalXz/SL3o2lgDRMhIUc6eft9cgX1jOSaK0ibmfxGaGExMhsy544Lwwz1?=
 =?us-ascii?Q?s/9FFDMGU2DdMAkJVpLThQ6fj6lOPs/o9vsMQ7SkoIla+DfmIwd/MquEyXdF?=
 =?us-ascii?Q?EyNlXSu9Y8Eefg14dQbvUMFqVF1qhEBhnQ6/KZjypSZGig1szLsIbNPDpSis?=
 =?us-ascii?Q?wb1HZBaRhbLqc4nmhBzx1ZKdaP/JybFvT5GVXA/w8fgg2yufNXlmhmhx/d0S?=
 =?us-ascii?Q?8zbq0CE0x1JFMKs17zkLd7zJ+CsAgD5EWAC0MzlZDM6pkilK4gGivEKvuQvw?=
 =?us-ascii?Q?nyrbQUZe3XHcGiKDUm23oGmtzai2iC5JRVNZyRdn7ZSKzPIyyGCAL5AjMBsD?=
 =?us-ascii?Q?h7EBIBstb0BmTfj9YstYQlN/FMbKZEriUHg+42RA/K7t1TwJUhjW+ooOR7oc?=
 =?us-ascii?Q?YFXsiaQTi1CT2a/cZSHWQTU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da4c9b4-487d-45a9-f12f-08d9dc28f4a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 15:24:31.2318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++DY6MbWyAPo5KmYvYRcOpkYQfQqJwMUPV017N84GDPzG8GSaYj94mYC79pKXooDppJD4em9zpz68xwvzdjc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3681
X-OriginatorOrg: citrix.com

In order to test external interrupts using a destination ID > 255.
Also start vCPUs with the APIC in x2APIC mode.
---
 xen/arch/x86/cpuid.c                  | 12 +++++++++++-
 xen/arch/x86/hvm/dom0_build.c         |  3 ++-
 xen/arch/x86/hvm/vlapic.c             | 14 ++++++++++++--
 xen/arch/x86/include/asm/hvm/vlapic.h |  2 ++
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 0407a54626..01dcd474e8 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -8,6 +8,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/viridian.h>
+#include <asm/hvm/vlapic.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/paging.h>
 #include <asm/processor.h>
@@ -876,7 +877,14 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
         if ( is_hvm_domain(d) )
-            res->b |= (v->vcpu_id * 2) << 24;
+        {
+            unsigned int id = v->vcpu_id * 2;
+
+            if ( id )
+                id += opt_x2apic_id_offset;
+
+            res->b |= id << 24;
+        }
 
         /* TODO: Rework vPMU control in terms of toolstack choices. */
         if ( vpmu_available(v) &&
@@ -1058,6 +1066,8 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
             /* Fix the x2APIC identifier. */
             res->d = v->vcpu_id * 2;
+            if ( res->d )
+                res->d += opt_x2apic_id_offset;
         }
         break;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 43e1bf1248..b00e45885c 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -30,6 +30,7 @@
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
 #include <asm/hvm/support.h>
+#include <asm/hvm/vlapic.h>
 #include <asm/io_apic.h>
 #include <asm/p2m.h>
 #include <asm/paging.h>
@@ -845,7 +846,7 @@ static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
         x2apic->header.type = ACPI_MADT_TYPE_LOCAL_X2APIC;
         x2apic->header.length = sizeof(*x2apic);
         x2apic->uid = i;
-        x2apic->local_apic_id = i * 2;
+        x2apic->local_apic_id = i * 2 + (i ? opt_x2apic_id_offset : 0);
         x2apic->lapic_flags = ACPI_MADT_ENABLED;
         x2apic++;
     }
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index b8c84458ff..34209d5378 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -24,6 +24,7 @@
 #include <xen/domain_page.h>
 #include <xen/event.h>
 #include <xen/nospec.h>
+#include <xen/param.h>
 #include <xen/trace.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
@@ -53,6 +54,9 @@
     (LVT_MASK | APIC_MODE_MASK | APIC_INPUT_POLARITY |\
     APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
 
+unsigned int opt_x2apic_id_offset;
+integer_param("x2apic_id_offset", opt_x2apic_id_offset);
+
 static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
 {
      /* LVTT */
@@ -1073,7 +1077,7 @@ static void set_x2apic_id(struct vlapic *vlapic)
     u32 id = vlapic_vcpu(vlapic)->vcpu_id;
     u32 ldr = ((id & ~0xf) << 12) | (1 << (id & 0xf));
 
-    vlapic_set_reg(vlapic, APIC_ID, id * 2);
+    vlapic_set_reg(vlapic, APIC_ID, id * 2 + (id ? opt_x2apic_id_offset : 0));
     vlapic_set_reg(vlapic, APIC_LDR, ldr);
 }
 
@@ -1443,7 +1447,13 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    /* start in x2APIC mode. */
+    vlapic->hw.apic_base_msr |= APIC_BASE_EXTD;
+    set_x2apic_id(vlapic);
+#if 0
+    vlapic_set_reg(vlapic, APIC_ID, id << 24);
+#endif
+
     vlapic_do_init(vlapic);
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 8f908928c3..6e837cb5bf 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -91,6 +91,8 @@ struct vlapic {
     } init_sipi;
 };
 
+extern unsigned int opt_x2apic_id_offset;
+
 /* vlapic's frequence is 100 MHz */
 #define APIC_BUS_CYCLE_NS               10
 
-- 
2.34.1



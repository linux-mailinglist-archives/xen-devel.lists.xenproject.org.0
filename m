Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC7415D1C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193797.345226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNJr-0002O1-8V; Thu, 23 Sep 2021 11:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193797.345226; Thu, 23 Sep 2021 11:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNJr-0002Li-5M; Thu, 23 Sep 2021 11:55:15 +0000
Received: by outflank-mailman (input) for mailman id 193797;
 Thu, 23 Sep 2021 11:55:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTNJp-0002LY-Ni
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:55:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b70ad8e-1c65-11ec-ba2d-12813bfff9fa;
 Thu, 23 Sep 2021 11:55:12 +0000 (UTC)
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
X-Inumbo-ID: 1b70ad8e-1c65-11ec-ba2d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632398112;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3L0djTs7W8tieHKvjiA5ogm9JOdtYDpi5RzCDIyBREM=;
  b=QysV6S95saHMml3t1oXg0DtMpG0IhHm0rZhNEacPPPsYqSFyW4aTmCL2
   FUe1tO9HY5PqvfCoEWl1yMML4FaoT9d1ifuOyZ+9Sr1mZat0LyU+yRgx0
   8hC3Cw/8tuqnHNtrfED+zj9YMlam1FXNgTU6urT7F5IM7PPQfbt6Ymomy
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NcP5u+Bz3F64K0KPa/n4y+XV5ihyRP/qO/AReLsDExZ/vYED7CCS79+tG9qgZbuMPdMuz5oc3d
 iYrEoqzClfW5TjburCWnxgXqN55CtCBMnhl/tvz7hgF1cIbdjVTr8Iqi6OOsqnQyYIu//6TsWt
 hjXwZCWOsJ7PU880vWy9qqFdziNwG1eV6pKdG3lG0OPZVaVmVaRxEzUTy8U0jOuEIkecPpoMYt
 PjWak4RllCFpLmtr6HeJM2x5UTWekBQarbqCWWoB4WiZsBiZDsLCaDJ528Od8AjfzoSE2f4w+H
 4Y4tcpFacbKSkXaDsUsNowy9
X-SBRS: 5.1
X-MesageID: 53448195
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ACmKoa/sAnMpE7oXZ1ceDrUDXnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 mpOXDjQb/bYa2T2ct0iYYm3/RlV68SGy9MyT1Nq/Hg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhRw
 vkSj52fSDs2ZI3phOUiQyV5DR1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFh2ts1pkfQJ4yY
 eJBbTpxZgT7XidsPwkvJJY1s92XvDrGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiF6OkkEmWvVRL/JgyCSRy5XE3yeHOkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjtYnVPcwfucQdBFFFcsoS/+enfmzqSFo4LLUKjsjHi9dgcK
 RixpS4ijv04iccR3s1XFniW3mrx/vAlouMzjzg7v15JDCslP+ZJhKTysDA3CMqsyq7DFTFtW
 1Bex6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sKu2omfBw3aJdVEdMMX
 KM1kVkKjHO0FCH2BZKbnqrrU5h6pUQePY6Nug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYollU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9408EDbKiMnWJq957wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4AGXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:jh29qa7TpENJ1D07NwPXwVuBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYfcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LSkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IfEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4FC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspMq+SWnqKkwxg1MfhOBFBh8Ib1C7qwk5y42oOgFt7TJEJxBy/r1Yop8CnKhNA6Wsqd
 60a5iBOdl1P7grhJlGdZI8qP2MeyXwqCL3QRCvyGvcZdU60lL22tTKCeYOlayXkKJh9upFpH
 2GaiIBiVIP
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53448195"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzQKPyq3Y2MMXbsZ54ZbP9TXwmgmCRkvBmECFvNsw5RLepTzHoADFzoVgEC6/CkHW/oC0+FPj/7f6uroD1sFH2n5gLtgCG0eQ90fiXl4/GJA+jaqKyOY+5EzxRCZh6ZnDhExeE7GPA5HsCquhz26rY6t8Q1O+iMDq1Acanl5l/ulfBa1LK6hxMcIL8GlTN4sreiWBUPLHxN3i/vnpN0ifULfr8hChZkr9p3edp4CpiD+vY+6qtDTcbSazwQRI2fhsbDAKrskj1FBiBcYR4pBd4g9xkOH9YLAV8SW8dYkZibGWmUBFVC2HEerE9A5gxBF50/L/9iyHSyaNgy3J1gOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zl8HNQkhaNkXceTYB3Jh85Oznx7vvJQEKqJc+/lXEcQ=;
 b=ETeA78JNUvg+r2FtXn0B0OrRLxoaw7jzsuxTRYh7Ah+hoCieHJ4it2PyvdarpK2ybtsZQNrdmD1HokuBDynxQyEOhqnbjiitw9G989x4zFkjLMvzD+FCapBY16Ycg9sz0nS7u9jZ/xgfhk1soMoFGHUZH59QiVjFDnO9D7aPanwLk/M8HAcFZCYLpvZuOPpDuLgbl2EbxJggn/O7lJMJmKuiEFpOt5gh7G50m2xHoEigzsDnBryUNKQdV7WfMPZ4WZyQA/lY8fhEqCSAzp4S9QRMq3Bt1L1QYPui4vBh1tIqnm7PRda9uK/6saPZRqIaT8MHCTbXELGRPyygjfbu+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl8HNQkhaNkXceTYB3Jh85Oznx7vvJQEKqJc+/lXEcQ=;
 b=hnFFUg4yMOZPOQhFw/zTdG8dLX8cH3f2tpKxzuZkCRH37IT9jMM7y5DrBlQAkhgW1vGMXAcIQS7DLwxvEES+4gXsKlmcbJIr/l9A0FnQCmKkXDcHJSsT7O1oi3zRkwwwHttqWcvY9qvABF+/tm4H46s8nty/DUQ+sFuooIQJ8aU=
Date: Thu, 23 Sep 2021 13:54:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
Message-ID: <YUxrE/kx8wmftVIX@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
 <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
 <ec456bf7-df78-59f2-6c14-5bda165125c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec456bf7-df78-59f2-6c14-5bda165125c8@suse.com>
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d18372e-6dff-4a3b-e0d3-08d97e88fbc5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923A791C4D69BB1CE126E248FA39@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BxGxY0IIaSUKIuizi4HhKREXsJuD06gNjeX7412Xgjcbpb900hyqZ7NLTBqt1HM4pKyO9RD+FnifJBBZPtd9YdXrNhqG/VhejF/pX2kFPSvFcOsf1i2ShgNN0kNtBwS5qsoqfL+ORv1u97alxJZi9uL3z+EY6qD2bQGK2CfMJKqNrWJO7cZ1el9iSpue7PT0iKpXfZuoRBuIlEcbe1ewqapJBMxKjGjuprni6zEbIcUx+Y1T/BGJvla/EcRtjWL6XUa6Au7Ah/7YYwMKHR+q4dy49ufZ4sqFw2tI3KO+9AKwEQIm2/ne0GywGNQwM+eaJbrpN+ltudpFHbKRMX/Q1GXSoboQYURvis2CVsc4rOwJyRs+1//JZPf4v0PtC8XZ3Pvamt+Fe6T1nM2WwXdSNVGn/mGchctyxnV89IZ7hxgLkiZdqEpjRS5c2zQFF8xSVWjYEQF8V6fp9sID89WzILDXf7Xei95J2CgeXXRep3V2WA8pQa/IASIpjMnvTetDOKQz2kB5EdAEkg0CTjkgwh9hEV0NIL7KcMD2cjN2djz8dm7IjHPd4Z7WB6wTtXSWN+8NK6MxJZdqZ570Y7PXsGg4NSzhBomzOHyaRHjA+rs9ibiN3zhty5jucN9APdy9VhsqDov4DPk7iIIqcvnooA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(508600001)(4326008)(26005)(85182001)(186003)(107886003)(54906003)(9686003)(66946007)(6916009)(6496006)(83380400001)(86362001)(6666004)(8676002)(316002)(66476007)(38100700002)(53546011)(8936002)(6486002)(66556008)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTd1NzY0ajVBVThPOGRLc0t0OFBIRTIrbGJHUkxQTHBVWVFMN1BOOTVmY2ls?=
 =?utf-8?B?a3JkSW1YdEVTM25LOW54SmVXcEw3RWpZaEttSFowczVQbmllU3M0Q0JUSUVR?=
 =?utf-8?B?RnBJVk5mcG10RmMwd0NQR0I1SkdVbmkwN3FaUHBzT0c0WjVKaXduNytabWNJ?=
 =?utf-8?B?QitmOXcrdHVMMzdQdkJmODZlM2V0K25JVjEzZTVudlpRM2NHSy9WMFpJakkv?=
 =?utf-8?B?R1U4VTNqNjREaUkrakpTNis0akNLRi94RUdYNEZ4d1ZvbWhtYU1vWnNHaDFr?=
 =?utf-8?B?Y21tUEtoemJuZWRVbnF3TW1qM0FSbGhnYUlYYkY5Z05heXAzT21MVTVzU1pK?=
 =?utf-8?B?cjRrR1JjQ2RvMVdnWDAwSUNuMk1pYnVMc0VqMm5ocU16Z3p4TEUxNWFiQ21H?=
 =?utf-8?B?QVE4NGtpc2pDRmRLdEFiZlB2aUFsYi9Tdy9EU3ljNTh2R1FoTHV1bVp3bGtu?=
 =?utf-8?B?ZnQ5dlR3L01OcEtXeFVidit2Uld3c2hHdVJTMGRlMWVWUHRFZlU3amVKN0RL?=
 =?utf-8?B?RlZBRm9iUlZVT2dQb1VUdkNneVdGYkE4Yjh5ZzNYcU1LQU1jZzVRcUlOakVz?=
 =?utf-8?B?Y0JTMHY3bk0xVHNuWGErMjhtTE1RRk1zSFZLWVVZQ1V3cnBpMHgwNGhLS1dW?=
 =?utf-8?B?NDlqZ09sdHVTcGI1UTZRc2lGZW1oUzJCWE9LOExveko4bUtGZHArekdjQkk4?=
 =?utf-8?B?QWhvNzAzMDFLeTlGSG1rTDlaalpCZ2tDSmhQVGU4VVZrVnU2azY2Ry9Wbm8x?=
 =?utf-8?B?cGxEYUJlam1sT2h2WnV6SXFZY3JIaTBrWVlxWjg1b2NheWNWbzNjWkxEQ2pT?=
 =?utf-8?B?K3Avb3RVNU9Cc3N4VGJmZGhnUUE2U094ejdkWjAxRFNsRnB5TTI2eDFSM3p5?=
 =?utf-8?B?L01TQ0hTYUVmN1FFWmZFWUZ2ZVZFakZETmtwMXJmNWs5SFBFQTMvUlB3akRu?=
 =?utf-8?B?Tnk3Z1kwNDdQWm84Q0ljd3BDRVdkT2pYQ0laRng4bzJvdEpNUUVGZEJ0eUEy?=
 =?utf-8?B?M2phVDNVaVBJSENYSWdTTUdYRVZFdW1qSUlhK1lvcUtoMU5DYlRZejJ2OXBW?=
 =?utf-8?B?VmpRR2RMT2dTbW1LTnNTR042dUtKb1pFT1hSbUJ3eHNBekp3bkRzMWh3bEJw?=
 =?utf-8?B?NlJObUZ3MXJBNHhBVjdTZ3NKaHJ3VTNnbGtSckwzeWI4emZ4c1Z3bWRKajkw?=
 =?utf-8?B?N25aRW1lVldGVm95ZDhJSTlOdmpVcmljTjFvbEltOWFUYmszaEtyb2pxR0RK?=
 =?utf-8?B?K3AwQjQ2Y1V5eU83OXhyQVEvRlhRN1c4RkJhcDQxNXExd3NGTWxOdEpyVWhL?=
 =?utf-8?B?SnNiWU5oakNGdWc3STdGbHJucFI1eGFCM0ljTWE3eXQ2OXpYZk9Sa0NzTEhS?=
 =?utf-8?B?a3JKR0FVYUI2SERJbDZlWE14TFFsT0FTUHdWRUJ2UTFsMjJFZmZyd0dGN2pR?=
 =?utf-8?B?SXMxa0xORHd6a3JaWGduYnNmRVhqWGRLaDN0WTdFTnp2MVZzZE14eW9jZERZ?=
 =?utf-8?B?cVNrWmxUMzN0L01HUTNRTWhFRk05UzNxQmZIWS9ZbTRDUmxDRVRSUmhVTjRr?=
 =?utf-8?B?NnlQWVR5aTVFNW9QK0NoNkpkVVhocHQzdjFPOFFKNm9TSnFRNkw3NzZuaS9L?=
 =?utf-8?B?ZnNFMG82Y1pSaFJ1dHJhcXlGWHc3bHRUMFpmVm1GdS9OMTQvOHZMTWw5ME1w?=
 =?utf-8?B?STBMelVsWW9ka2ttUWMxYkdxZi96a0JkVW9DNFQvOFdCbzEzOG8vTHVWWi94?=
 =?utf-8?Q?CXzav/lZrBhIgZkZRzUoOBZ7CxbI9bCjy774O6N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d18372e-6dff-4a3b-e0d3-08d97e88fbc5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:55:05.6826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+Ci536Wumb3qR9oLunSqX1z65e5j7d+LGNghlKDZVbgUnnHhxJJlwczOY0y/8qTHI80tf0xtPwaeUAy+0ZpPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 01:32:52PM +0200, Jan Beulich wrote:
> On 23.09.2021 13:10, Roger Pau Monné wrote:
> > On Tue, Sep 21, 2021 at 09:21:11AM +0200, Jan Beulich wrote:
> >> To become independent of the sequence of mapping operations, permit
> >> "access" to accumulate for Dom0, noting that there's not going to be an
> >> introspection agent for it which this might interfere with. While e.g.
> >> ideally only ROM regions would get mapped with X set, getting there is
> >> quite a bit of work. Plus the use of p2m_access_* here is abusive in the
> >> first place.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v3: Move last in series, for being controversial.
> >> v2: Split off from original patch. Accumulate all of R, W, and X.
> >>
> >> --- a/xen/arch/x86/mm/p2m.c
> >> +++ b/xen/arch/x86/mm/p2m.c
> >> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
> >>              return -EPERM;
> >>          }
> >>  
> >> +        /*
> >> +         * Gross bodge, to go away again rather sooner than later:
> >> +         *
> >> +         * For MMIO allow access permissions to accumulate, but only for Dom0.
> >> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
> >> +         * the way they specify "access", this will allow the ultimate result
> >> +         * to be independent of the sequence of operations.
> > 
> > Wouldn't it be better to 'fix' those operations so that they can work
> > together?
> 
> Yes, but then we should do this properly by removing all abuse of
> p2m_access_t.

I'm not sure I follow what that abuse is.

> > It's my understanding that set_identity_p2m_entry is the one that has
> > strong requirements regarding the access permissions, as on AMD ACPI
> > tables can specify how should regions be mapped.
> > 
> > A possible solution might be to make set_mmio_p2m_entry more tolerant
> > to how present mappings are handled. For once that function doesn't
> > let callers specify access permissions, so I would consider that if a
> > mapping is present on the gfn and it already points to the requested
> > mfn no error should be returned to the caller. At the end the 'default
> > access' for that gfn -> mfn relation is the one established by
> > set_identity_p2m_entry and shouldn't be subject to the p2m default
> > access.
> 
> I think further reducing access is in theory supposed to be possible.

Couldn't an access reduction introduce issues, kind of similar to what
would happen if the regions are unmapped? (and that XSA-378 addressed)

I think whatever permissions set_identity_p2m_entry sets should be
mandatory ones, and no changes should be allowed. That would maybe
require introducing a new p2m type (p2m_mmio_mandatory) in order to
differentiate firmware mandatory MMIO mappings from the rest.

> For Dom0 all of this (including the potential of default access not
> being RWX) a questionable thing though, as pointed out in earlier
> discussions. After all there's no introspection (or alike) agent
> supposed to be controlling Dom0.

Ideally I would prefer a solution that could be applied to both dom0
and domU, if that's possible.

Thanks, Roger.


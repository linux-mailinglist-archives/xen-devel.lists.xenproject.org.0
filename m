Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7A4EBC3D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 10:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296064.503955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZTFD-0004iC-13; Wed, 30 Mar 2022 07:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296064.503955; Wed, 30 Mar 2022 07:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZTFC-0004fm-UH; Wed, 30 Mar 2022 07:59:54 +0000
Received: by outflank-mailman (input) for mailman id 296064;
 Wed, 30 Mar 2022 07:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZTFA-0004fg-RB
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 07:59:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef33e65-afff-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 09:59:50 +0200 (CEST)
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
X-Inumbo-ID: 5ef33e65-afff-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648627190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XmmCBuFoz9B3UuZIlDiQNWn+ycIK9/e+ZiIYaxEU7g=;
  b=SP4pQ4HIveGDXZ0BxbK8s+AFZkYWHU4I7H5b/q6ur0y3WOcRmduPgUJw
   N0bx2LPv+5XXezFCIr6wHmnAHH/CL+cL0/ke+u9tWGE1qDqn72i9cnENZ
   3S0dvV4p36D4yVPdChuZjzdv0ufOfNVTYDKdhd0Gq7xj1wlowWMLsYiL3
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66957289
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yakIdKpoIV+mC9SIv/i5IQC0+fNeBmIbZRIvgKrLsJaIsI4StFCzt
 garIBmDPamMajHzedx0aovjoUtS7ZKAmIBlSQI4/yEwQSNG9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 ouq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBZI2Lvd48DFphGmJsLasfpOTYflSmmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZRINGU1PEWojxtnOnUcC5cPsdiSnUbCcRF4lm2PrKdm7D2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PLyn9NZ6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQ+l7DmyQ9BJlpGq4o+AfUlvHLvCqALz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkiXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj/9hu+aTNT8D2BN1bQ9xawaRGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpy7+LdoJumkkfBsB3iM4ldnBO
 hW7VeR5vsI7AZdXRfUvP9LZ5zoCk8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3apLSkk4FAbSkCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:Aw2+L64hwJS4zfQW9APXwTiBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsjqKdgLNhRYtKOTOJhILGFvAB0WKP+UyEJ8SczJ8g6U
 4DSdkGNDSYNzET5qybkWqF+r4bsaS6GcuT9IHjJhlWPGVXg/YK1XYCNu/XKDwAeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njGsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLliFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhDF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtrgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4bkWUmxjIYLH48JlO01Gh+e9
 MeQv00pcwmOW9yVkqp81WGm7eXLzUO9hTveDlwhiXa6UkXoJlD9Tpn+CUupAZ+yHsDceg02w
 3lCNUcqFgcdL5jUUpCbN1xMfdfTFa9Ai7xDA==
X-IronPort-AV: E=Sophos;i="5.90,222,1643691600"; 
   d="scan'208";a="66957289"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjKb9Jkhbjv451NzDe62fmpaVW+N1idBPsPk/B4mAsGaq+UxgW1+4OQwuaPqssWjrK3/MZHYKJJP81HDfVbl3s76kvREGWt1Zw/mzE4fxXsSHfl/zcbjZZXLDl/UXXMyHxVoEgSwmYFc2NzaIzyruXV+Q3GVIBqJvsjW0Uuds3XdVY+FYyfrgxsOlIxBhlOYyHc79EODRaoI+uVoswYcfA2HEJY9MlHsPPw6FS9GrNzS/9kFWviOwLBFTGcfNFTJ/8wKmOnQ4L9oAytJ0dcXAFxhzRZ2VBSwf3fxoaogBAzSwJ2RlXxB/kjLxNeJf1u3qH2CEKuVQsmvWTjqUQEz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqPR970sCbzzQyuOuDV/KYtFMieIFAyfURFeANLx/i0=;
 b=oBKPhfE4wop3ZuSPl2smpwHFOdD27OLLdC1Qj1ddEs8QRUOa7yePW6Y6fjB8JRdNrxugIJ7Pm2nIAi+TSIS0LX6V3FSmOpIN9Dq2nP12niCAHQzO/sb46WA9Vo0dlkzy4chOpvG47u0CnHIa313dddMXq4E/2NvrUugeQfiQ6FOIXJe0nHptG8QZkIUXw/6WJSsnkgSNJy+Q+DFUWySwYRmEJyOAQPbWpC8LbqCtA4MlrGMZbeTHScYF4gATE12aAf8wWP7Scfy5tuqjbD8sdUzfJwBN7O85sqySUKd2U3k13sDJXO1Iowm4cC4t9/vNDCLSTCaqgl20/UBg5kwSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqPR970sCbzzQyuOuDV/KYtFMieIFAyfURFeANLx/i0=;
 b=LAI7Vg0nDj4FdVcdft5dVNT/0oE8s9qMgp2K3f+AXZL0GWx5+VTkKdSESCBMJobsdXsAgyjCCp6EcYHtsv+Vb7rmykek8aR4JynbfTRMpB+Z4IMdchu9vpUgqcRTiXvAD9aDeS96skj+6hL2Z2kCFRHx8WRTplgp3ECMJhKAIWg=
Date: Wed, 30 Mar 2022 09:59:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: osstest: new boxes to be added into production
Message-ID: <YkQN6zmOQV2F+jUf@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: MR2P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::14)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4019a70c-6b0e-4d47-8def-08da122340a8
X-MS-TrafficTypeDiagnostic: DM6PR03MB3915:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB3915A4BE3430A0F7B28659318F1F9@DM6PR03MB3915.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eFNU8Fr3sIoTNEFZTymbZzTOoq0C8C0jybUZUfbxYVQEheGnR9WDEKang+OiGGXKYSYVF/7hl5Uth5TLhbYfj3Q3ZhpNAcIWCqILS1HIZYNAanR+a616vP9w+YNc46lpFtol7V3Gq6MUQfCzsAGDE8JrdTNX/MYXVxJqOhRtK5cJyLyfjhzR0Bh5wO9LQyAhqSg5FIWuGH9M/4H8+TubAAxVNYxrKRMZwlh2JvjmXjlRogLaQ2UmTrF+q3WjBfAqREr7SLPDVK1x46dC09bbaerW6RnAOdjed/UZC/ZmJoOBOMFT8kWfnGvBL/iqeV6eWrCu0/ALGKuyHfHmfFjIB9bN9YCOZ4fnczMFKaFugsLwg8RPqmsn9N49DUbRfBcBCiihcbZVYJzJfzNx+7J168HxNcP1KwTdgqt9mM77giIAxzmCxmtyKHNWbttynRlROXO7DT8WbxQ8ajaG9TfuSTaohb1RUlKAohkOB1sK8Oo+r2Em0b8OJFoSad5tG2Nn3SkizHUb9zesbXIXEWSBijH6fzBz9pDWeE0/Kdo1C9sb0XYc8UjAenUGjafTFgtdbf3d1qYW10p6Cqcofr+aKIev1hMzS58sNM2at8m2I5zv7EU6wwuteGpsAtf9Akxnp6VZ3NOup0JkjOO5hesuzwgEb2YcGFhIBzSL5M6caIJ4zjTS9piJfH800SW6lYKJkEi1NbG46Mh85e6dfWw0Z0KO2lVv5hCkdhQPp3I2cbDuvd3s5mAl2RcmfCcd8R91WNxLvFZmnDvuiwMpX2EvViZVHHKEKIC42KcCJuwSjj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(5660300002)(8936002)(4744005)(2906002)(6512007)(186003)(316002)(26005)(9686003)(82960400001)(107886003)(508600001)(86362001)(6506007)(6486002)(8676002)(4326008)(66476007)(6666004)(66556008)(966005)(66946007)(85182001)(33716001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFFBMDdtOWplQldobUFjdllZWWEvNE1HOU9NMW5BcEFJenBZNjRGQXd5WGNV?=
 =?utf-8?B?RmxDa3MvRkU1WVlKQ1ZGcStEdTJzbzR2WEdwaU5XbUZUd0Y3Y21sVzB6ZDNj?=
 =?utf-8?B?SHh5UFdsK0l1SDk4WUdGMUhTeFZCSFZvVVBJcFd2cGRndHVpb0VVSXA3c25X?=
 =?utf-8?B?c2UzZ3RyMUszdytneWVyM0hIcmthdldsK2F4c1M3RldhMDQzNE40NWk2RVMx?=
 =?utf-8?B?dER5UER0YnUrZjBESWpCOFZSN2JKZlBsRElqamh1dTB1T0FVemxqbGhUVFFY?=
 =?utf-8?B?dWpEdzNFNDVQZExlSHV6TWdVTGx5NERHU1BzWGRnTGNLL1NvL09DTTRMbm15?=
 =?utf-8?B?L1VMVFlvYmE1RkIvV3FhSS9yU2p6QndqT0pnN0xPbDFZMlJ1VjV2eHF1dWo1?=
 =?utf-8?B?V1N3QU84ZGhoS20vZjUvWGtscGExR2lQRlIzN3BRVzY4TFNSZzQ4ZVB1T25B?=
 =?utf-8?B?SUtwTXdtT3g3QzJCQnZsTmgzVmdXbGM3a013WXEzaXBOU0wwaWVTYXo5NGNR?=
 =?utf-8?B?c3JzOHlyRVViUDhmUE9aaWRMZzIvR3BQc0p2WGQrLzRUMjN3ZFJ0RFAvRUx4?=
 =?utf-8?B?U2xOWXNRUzRpNERZQ2EyTi9NVldkZGZlZENxaWlRQmJZZngxUWJscjNwRU9F?=
 =?utf-8?B?dXBSb2QvS0oreWxNdlpBZ0pmU2taU0dGWmdQZjFsU0hVVDlKMmNjV2I1dFlF?=
 =?utf-8?B?c3JiNGZ0R1p3azZtSTRMbE9LYm1lZk5vWkxuWXdvSDdJbWhhRGE4YjNyMWxt?=
 =?utf-8?B?SWh1Y1RkaW1RZDE0V2ZSYlpiTFF5VDIzc0JuMHM3Wis1RWhSYlZ3Y3VTY3ov?=
 =?utf-8?B?Y2JXNExCSi9GR0RHOVFyWktySm8xb3hnUnVKMWE2UVltUjJyTm94aU5ySWxh?=
 =?utf-8?B?U2o0WTRETlJ3S0xPRWRHbUdvanFXVU5kb0JZUGhTNGpyQ09LSjVMcG1WLzBs?=
 =?utf-8?B?d3NNN1pmWmpaM3djS0hZdWdZRWhhTS8zc0o1eVEwMU8yN2ZKVi94RUlndFBK?=
 =?utf-8?B?WVBrZDJhMkxYSnNBQXgrc2wzditwNnl2WHpSSzM0bTVHMVpsZVo1TmhqL3N1?=
 =?utf-8?B?alpJczR2R0ZjVnptOGFia1RYVGV5ZE9BVFlWbnZtdUJqYkJjaGUrZXFjN3RI?=
 =?utf-8?B?anlDN1JuVnZYZkRCOEtRaC9JWXowVmdrK1VKd2E3WEJrMFRDbzh0MXArT0tD?=
 =?utf-8?B?VTNRQk9uRnQ1S2JQNzZhTzlhVGZzMDdWeUVBUUh0OE5KT01Pajc4Sm13Ym9n?=
 =?utf-8?B?Rk92RE1xTUlYRWlNOHg3M05FUmxkS2I5Qk1QeGNub3p6aDVKNmJiaDBGM1lh?=
 =?utf-8?B?Y1R5bDh3MEp0R2psVk9yT0NtNzA4OTBySlFYMVRpR3VyN0lkODRYRG9BZjMr?=
 =?utf-8?B?eGk0OGkyRWNpME1UVm50SUoyRE9VWnc1OFhNV0M1eWF3YmpuaUJIaUFXR1cx?=
 =?utf-8?B?d1dsTGc1RTZiZDNUN1J6UXpNWnZwdzBWYlBOVW9RMDVwcnVvNTd2UWkyM1Vq?=
 =?utf-8?B?THFSUjlQeEZXT016MEsvN0VuYm9rQzUxQ091OUkrcDh3UGxPS3N2TFk1eDZq?=
 =?utf-8?B?SHNQdmVOUHpZWWNqVElFYTBnY0hHNCttcEorZE5jRzI5REhZOXplaUswWURW?=
 =?utf-8?B?WWl0dGpMNXBJV245NjNNdUkyWlRndHJwT2RGd0VjNTV2SzNTUkNBcFZ6OGNG?=
 =?utf-8?B?Vi9yZ1lyZm11OWtNTkhYVXdJZXNQL0NHeUNKQnVIcmd2QjJuU1g0ZnB0RUY3?=
 =?utf-8?B?YllhU2t5RG5wWElqbHlPUHJPT2ZDSW9jU0ovTzA1akxzSjMya29SaXRRQURm?=
 =?utf-8?B?QzlrTkR6Rm14ZjRUUFBTakRpMG5GQlByNTNRU0QwSU5xSDBEZE5FOFpwbkVB?=
 =?utf-8?B?d3J4T1JBTG41NXRTK255NjFOaEZCekdEZjV5Yk94QVRZcmpLVXlnMzAxallN?=
 =?utf-8?B?Zkt3bjkrQ3FIT0V6MHJWMXRsZmJIUVVYUG1KaXlOUE56d0Q3aXFnVjJQM202?=
 =?utf-8?B?d3cwaWRDaWl3aFlhZUZLblJBdFl2ZGtXc2c5WWVkcXZuT0FZRW92M3JEbnZJ?=
 =?utf-8?B?UHdqblUwUzhNUVpiSzhFTHo4VlpCMDFBR2libEFScHFkUE54MzU2b1pjaUV4?=
 =?utf-8?B?YytvMnk5cEZENndUL2ZRZDYrRTRsRmYyMTUxK2tJbXo3RDR1bmxLN0h1ZzV2?=
 =?utf-8?B?LzdvNHNJNTkwWEg4WlNvSHNaOGtLcHdmNGlGVmx6cFdiVzQ3VDVuY2NnZEE5?=
 =?utf-8?B?elFweCtnR09rc3ZOODg1WGZqUmRwWm84SDZBUmtjMWt0bDZYNGtBTEUxQith?=
 =?utf-8?B?U1owVkpVYTJncVkrR3hWWk1mZTN2Y25Sb3J0d0JKclpWZzllVDhtMWdjWnM4?=
 =?utf-8?Q?ukZzoQXY8ne7qv2o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4019a70c-6b0e-4d47-8def-08da122340a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 07:59:44.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/ze09/D49eJUTGzumrgwrG1nfK3QmPHfOnZgJNTl6I8Kglv6cRXnH5uX5wgrS1A2KPEkRiDXYJ50EtgAFXgXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3915
X-OriginatorOrg: citrix.com

Hello,

We have a bunch of x86 boxes in the colo that are currently not
blessed for osstest usage because they were broken at some point, or
managed by a broken PDU. We believe this is all solved now.

I'm still running more commissioning flights ATM on other boxes, but I
think the noblings are ready for production again:

 * Commission flight: http://logs.test-lab.xenproject.org/osstest/logs/168847/
 * Only regressions are either Arm or AMD related, as those boxes are
   Intel.

Unless anyone objects I will bless the noblings for real test usage
tomorrow.

Thanks, Roger.


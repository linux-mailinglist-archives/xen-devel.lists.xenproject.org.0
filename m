Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D72427065
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 20:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204847.360035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYuHI-0004kn-VB; Fri, 08 Oct 2021 18:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204847.360035; Fri, 08 Oct 2021 18:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYuHI-0004iS-RI; Fri, 08 Oct 2021 18:07:28 +0000
Received: by outflank-mailman (input) for mailman id 204847;
 Fri, 08 Oct 2021 18:07:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPMe=O4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mYuHG-0004iM-Uw
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 18:07:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54c58e04-bc4e-4833-ae30-0d0c512608ec;
 Fri, 08 Oct 2021 18:07:25 +0000 (UTC)
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
X-Inumbo-ID: 54c58e04-bc4e-4833-ae30-0d0c512608ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633716445;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rQhlx4wtZb7Wi4rVykfIpQlZmIumaYt5vzYfpm3VwZU=;
  b=gOCZ5X7HwwBSL+E/p/lxJy2kRXinh57dQareUUJi1CArhSwyagSALMsW
   eC1mtVGCzH+Gd7VvlaTfD8wjs7rVDW8z056L7UmKYbZyon50xIty7do/s
   KgUOSQh5snz10gxzjk0KDbegilLrgVUt3HKrXaESFP+/syV0U6A/QQx/8
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /aKyFA+IsRvFbZCdxq5uXCkhx174BsK31SvQszqZD6oYSAcpuGRPaUqsp4Q11JulC61/S/lmzr
 3X5/J+k8L453g8nmF43x8Az5dtfDkHPVOERmDRVgXqiOHh0SCKA0ee5UwwNwlx+a6tB+LNHLX8
 KmgPbYXv8oJmd4jEyLn4QvmFBs/i4Ez9rQ36y6K++IXnBd5VLKjb3JLNyEYXzMGxS77FwFyavf
 Ch1As9CGuTNtU9D0Z62QebaS7mZk3ukx/k5v7SwKYCy+wiwbXOCF2agadcIOWlfPZmFuyOEp6A
 RA0t7CCIVVClw8m6mIqh5ixs
X-SBRS: 5.1
X-MesageID: 55150512
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8FoH2q1+ak3QcpmHBPbD5cR3kn2cJEfYwER7XKvMYLTBsI5bpzUHy
 mMZCmCBPfnZYmGmf9x1a9/k8R4D7cLRz9FgTVZvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7w75h2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhh8x7y
 PtLlseKZSx5H5Xzl8MtbAcCHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t25kTRauHP
 aL1bxJAMBjSYiwSE2sQFawEls2hwSb+eh1x/Qf9Sa0fvDGIkV0ZPKLWGPPTdsaHA/1PjFeHr
 3jP123jB1cRM9n34TaM7H+EnOLEmiL/HoUIG9WQ/PNwnEeawGBVDRQMTEa6utGwkEv4UNVaQ
 2QO8yozqe4p9UqkTvH0RRj+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 l6Wnfv5CDp3qrqXRHmBsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LLqmxidHkHCDq9
 BqDpiM+mrY7gNYC0uOw+lWvqzCxopnESCYl6wORWXiqhitmYKa1aoru7kLUhd5CJouESliKv
 FAfhtOTqusJCPmweDelGbtXWuvzvrDcbWOa0QUH84QdGyqF42Kpfa5Ww2pECGw5E/47dhjZX
 1GJtlYEjHNMB0eCYahyaoO3Ls0ly6n8CNjoPszpgspyjotZLlHeo3A3DaKE9yW9yBFzzfFX1
 YKzK57EMJoMNUhwINNarc8z1qU3jgQ32G/eX5zyyxnPPVG2PyXOEeZt3LdjdIkEAEK4TOf9r
 4g32yiikUw3vAjCjs//qtV7wbcidyhTOHwOg5YLHtNv2yI/cI3bN9ffwKk6Z6tulLlPm+HD8
 xmVAxEDkwSk3yafeVzSMBiPjY8Du74k9hrX2gR2bT6VN4ULO97zvM/zibNtFVXYyACT5aEtF
 KRUEylxKv9OVi7G61wggWrV9+RfmOCQrVvWZUKNOWFnF7Y5HlCh0oK0L2PHqXhVZgLq5JRWn
 lFV/l6CKXb1b185V5i+hTPG5w7ZgEXxb8orBxGWfYIJJBm1mGWoQgSo5sIKzwg3AUyr7hOR1
 hqMAAdeou/IooQv98LOi7zCpICse9aS1GIDd4UCxbrpZyTc4ES5xopMDLSBcTzHDTum86S+f
 +RFifr7NaRfzlpNtoN9FZdtzL4/uISz9+MLkFw8ESWZdUmvB5NhPmKCgZtFuJpSy+ILogCxQ
 E+OpIVXYO3bJMP/HVcNDwM5deDfh+oMkzzf4K1tckX37SN65pSdVkBWM0XegSBRNuItYogk3
 f0gqIgd7Anm0kgmNdOPjyZ18WWQLyNfD/V7589CWIKy01gl0FBPZ5DYGxTa2pDXZoUeKFQuL
 x+VmLHG2+ZWyH3dfidhDnPKx+dc28gD4UgY0F8YKl2VsdPZnftrjgZJ+DE6QwkJnBVK1+V/Z
 jpiO0FvfPjc+j5pgI5IXny2GhEHDxqcoxSjx1wMnWzfbk+pSm2SczFtZbfTpBgUozBGYzxW3
 LCE02K0Az/lcfb40jY2RUM4+efoSsZ891Galc2qdyhf80LWvdYxbneSWFc1
IronPort-HdrOrdr: A9a23:VGLZHKst0n1+E2wou8xji46K7skC4YMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK4yXcH2/hvAV7EZnibhILIFvAe0WKG+VPd8kLFh5ZgPM
 tbAs9D4ZjLfCJHZKXBkXmF+rQbsaC6GcmT7I+0pRcdLnAYV0gj1XYcNu/yKDwGeOAsP+teKH
 Pz3Lskm9PtQwVtUiztbUN1IdQr6ue72K7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhCP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpE/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MlkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS0tI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/lWH+ObcG0jbIy32BnTr4qeuon9rdTFCvgolLfUk7zU9HMlXcegD2w
 zGWp4Y3I2mAPVmNJ6UqY86MLyK41f2MGfx2VSpUB3a/ZE8SgDwQqHMkcEIDcGRCdY1JcgJ6d
 n8uG0xjx9FR6upM7zX4KF2
X-IronPort-AV: E=Sophos;i="5.85,358,1624334400"; 
   d="scan'208";a="55150512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUcV5oWzRcjqrSFXxjKYaNz6e9SYez2feHJT+S+lyD9t9K3D1bfJc6Ctw/ikaJVuV/Fi0vInlE//GVzsPOP4nd8cbO+37j/JPWIFZ77NnDdYnIjgFSHd8iNc8pFMj2IMOZafyXgTH2racJiVkINBd664vSUKc1VXhtbD1uUDqICBXReMWL7yu6aIOQO1sFpug85ONDpm8e9ek3pw3ZkZM01fS3nLE7Y4OEY54axE/zMrTtICs06QTTbs3boczSY2UhQ3ppygEcMAukje+cktMLar8gBYvO/5/eK+aJ2rW3rYISsui3p6ffQ7YU+meEFfqRblBFYmeiK6RNzYVYtpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQhlx4wtZb7Wi4rVykfIpQlZmIumaYt5vzYfpm3VwZU=;
 b=Ss2bn8Kvnz9T+gxM0psSiqCvxj7aucopoUBRtLRLVi1m+hnIeeej8hgxez5Z+TAgKqj4GHwSzDosUGxKIbdcXEuWsqJQUYdVKS7Y9uQ5iCgRMnhD3kPnNP4EExCVT9pW8dTG7NiK6y8Egxf1I2MwB79tK97kAI/1Z2zQnCl5X4hF+EKG3nAj8oSK3Rlzk1h4tSAtpsDyrVYSe1X7YJPq/ySN0HGca00o+o22ILRLALA/l99qXc9Qs2jIk7HkdRQl2MuNieBQJEcSJsbBerCq5fa3DNNHkr24YzuiUspVsJAwtkuD1s0gPDPmTH19KmteBv50HNBAprMTuJqc0jwOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQhlx4wtZb7Wi4rVykfIpQlZmIumaYt5vzYfpm3VwZU=;
 b=JwnW92pP24nHOy2pSVNWTWSu0f6E37aZFq34nB70a/4W7PYLdfOcLg1qlov9BUaAbl2lbrxks/uziU9UC3KZMS4VEN9kUZuNQuRy5VZ0mo8N3OzGDj511UbiKscZRroRJpPvC2dBOntYGR34VyBeKdvKB5bnNWjZYszvqiB8Y+Y=
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, <Andre.Przywara@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Message-ID: <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
Date: Fri, 8 Oct 2021 19:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c7671bc-0864-4a16-cdc0-08d98a865be3
X-MS-TrafficTypeDiagnostic: BN8PR03MB4802:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB4802689219EAC3B475ECC6C6BAB29@BN8PR03MB4802.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F3uHnAVDHECoWnTrD4ruGk/xAfvMXozydaxXiDGw3rPOvs2NZKWnBKW8Ld2zK68NZq+/i+GVMLh5F8ZeZgvH/30L+TLmxXjcmZ3ELI1eNFyww7E/u27cp1bI/iGZA0bharjzTE8y+NZAPpG7qfXqjoTu+A9lKEE9UwCGG6wx254ZKpP+lNLvQ4fRXyP4Os7HbPOnuJQpwBspDRnmzc9RKkwRbBIJzlEi+OUjOKUjGHnRHzn9WjAfvUyDAPcNNt/VleZgPSVsJybrh4OuIyMX538WsuRhN+9Z6dINklwvngMZDzM/d4wRS5Ccf1RTtTcweUllU7FSO042TulKTV2Y7lMi6INo2DEnZRbAUHcJxIw4q5gRoM7fgFYUgcZeZXqVDSY731zToMuCr8vuvanh05DgyV4hKDprytHQkuuDVEfeY4rROBoGhKkEmCIphR/eDWKH/zuSh8CCFTDZYoHLBC7xM/gej+E8ThwzK8BnsCGtYoDbsnLOv6qUfHxSP5weXjlSxGr8N1hmPxeQzDqlQ4TbXIgcIow64EIBfNiDdQ+02XRLwJ2OIX/Bp3zz8Fw5iK1zcKfwHLvHWbxWOgbWhwcKLs+dHKZ3D1TKL785za2LWK00nDpf1RsDKyXAssWZCElxwonFJKR4AGm5wA+lZ2B6NteQM6kkNL6GWv2Wc7FI3rsxt0f/3b+ZhHss+gze/EpzKrfFuUiSRLPyO1LpwY09ZEDfb4Lhi00TGdgctt5cLsFUGVKAtt2vMNqE9TFG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55236004)(31696002)(66946007)(7416002)(53546011)(316002)(16576012)(5660300002)(36756003)(86362001)(26005)(2906002)(6486002)(2616005)(31686004)(107886003)(38100700002)(956004)(8676002)(186003)(8936002)(508600001)(66476007)(54906003)(66556008)(4744005)(4326008)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TERPUmI4K3ZhWlNqdGYxVm9DczRodkhmMitJc00wZWtHQUdkMEljQ1FtR1RP?=
 =?utf-8?B?WnpaS3VCemFOLzR5SDNjaGlsR3BqN0pRSDZpdS9JSkdHUi90cmZocmV2Q0pl?=
 =?utf-8?B?SzNuaGpIb2l1Qm1IM3FUYlp0eHZiK1ptK1V3RC8zdy82aHZaUFRRL2VHd1Fy?=
 =?utf-8?B?MGJueitlb3h0S2FCa3JCNjRQMHEvUDdSRm1WTXN0YnJvcE1WaGExZUd3dXk3?=
 =?utf-8?B?ak9pR3FMdEF6MEIyYjVJZlBoZEYxNUtua0xkY25BdE93NzZVUlBEblp6NzNP?=
 =?utf-8?B?UFhhN0tUSHNOakpjZHJBL28xUjcwdDBjb2JKWkRUNUFLSFhkU2RpUDF1ZG1D?=
 =?utf-8?B?S0dabHJVZEZwcHVQU0szYkZ1L3NSSTdqQnUwNS9aa1ArMTJtaHo1ZlJKUWtX?=
 =?utf-8?B?T0VlZVdwWmtXZDBsUjNFYjNDNjFkOG1LenpaRHRZZG01QXBJOUxSUFR6a3pt?=
 =?utf-8?B?RFRsSTFlOW5UMy9SZW9MUERzYndWdDFnUHRERXRCbmpRUG9USHlQdHV1ZkRX?=
 =?utf-8?B?b0l6Zm4wU1NLOFlqVkVWdDc3TzlzS3NkNXhRcXJXMVNpRyttODBBSGNWb2F5?=
 =?utf-8?B?clBIK013NUlFak9uUnBQeHZMZE9lQmtTUzJ6OEtrdWNPb0Y3RjN6OWxhd1Mv?=
 =?utf-8?B?QTEvWWZXUkFpMGw5U1hpMHlMaWtVaWJHYkRUd3EvdGJ0RFhva1pwMTIwQitD?=
 =?utf-8?B?NjMwb25oMW51aDFyTTZaYVMrNFVjNm5FM3JZNWJLVkUrdEVpd0NQTnp5aDN2?=
 =?utf-8?B?VjlicW5aVW4yOWpGS0E5dkR5SVpma3hkU0NodnVTdk5HYUZyV0hUTTB4cGh1?=
 =?utf-8?B?eFhaWmRmL1pzQWlTTTcvMFphMFEzb1cram9qUTl1QmpIYm52bXMvcGZXMmQz?=
 =?utf-8?B?Q1EyYVpQampjeWdabEtFd2dvM3lDZDNtaGFWTi9EMVY2UUtqd0xDU1BnWkts?=
 =?utf-8?B?c0c2U3RXRGpoaUFsalF0QkdsV3hoSkd4TjBqYzd0YUZ4Q05NN3BsbG5UR2xo?=
 =?utf-8?B?MGp4cnpadDNKdExYaE1EbVN5NEF4NEIxRDhUL2JuTWk4ZkFOZUNDVHVnNGRL?=
 =?utf-8?B?aTNuSG1zK25EL1RqRnQrMHh2UDZMV1JVV0lwTUpDTmJOWDJtOHdIT213dzBN?=
 =?utf-8?B?R3ZWSmw5UkpxZllYbU1OU0tEMTY3UHB5RlE2VFAzRVpzcEx0ZFVkOEpkMUVJ?=
 =?utf-8?B?TDlUdm83TnRCQUhVL01UT1Vib2R1VDlqWnVhMWVaVnVpcjRqd0RQc3Yzdzcz?=
 =?utf-8?B?R0daU3RPNlZBZ3VLOUtqNHVkcUlVUDBIemlDcVkramxTeWQyZjQ5YTlMSXo1?=
 =?utf-8?B?d0FBelJQNWg0K29uakswTk10VTNSakRmSWc4SFZqS1doZTh4UDhMN3d1Uzgv?=
 =?utf-8?B?bGl2U1ZUcEQvYnlzVE50M2kzYlVZVVFSVGw3QXJVZGJWNjRadUV6bEo1enc5?=
 =?utf-8?B?RlpxN3pHMzZ2L2JrWWtxVjgwelB4NWJtSi92T1lUaCtxdkUxQmxrVGtFY0ll?=
 =?utf-8?B?bkxDWFJGeDBoMVpPemY5Q0g0WC9LZ1VrN0FQcHBYYU0vbkhNeXlTTjFYV2Zm?=
 =?utf-8?B?b1RRLzJzNjd0UkVGbEhzaXVkejNKdDlFeHErNGZVMytvMGxGZXdXQUo2UG9B?=
 =?utf-8?B?SmJ6Ri9GeUowN0gyUi91R3UyNUdxb1NvSDdNRU5SZVA5dHpkTkdHcEo5M0pj?=
 =?utf-8?B?eEhLQ29ValNNdXhTYUduZGMzWk5wQ0NvOTYxdEcrbURyYUNQTDlUVmZycUd6?=
 =?utf-8?Q?w0A5I7z8u51jJwBxE0DAWDWdLfsb8BAe10SOmiO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7671bc-0864-4a16-cdc0-08d98a865be3
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 18:06:32.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCVkO27xMdIuotuppJUbtaIVL4C4BPB26uvSvNCroU5pwk7Afd5y2/oXrdJ7BkMdS3XukxyFs+Z22nagPNUNjJDopxZDg0l0LbBMibXhTS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4802
X-OriginatorOrg: citrix.com

On 06/10/2021 18:40, Rahul Singh wrote:
> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> Reject the use of this new flag for x86 as VPCI is not supported for
> DOMU guests for x86.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

I'm afraid this logic is broken.

There's no matching feature to indicate to the toolstack whether
XEN_DOMCTL_CDF_vpci will be accepted or not.=C2=A0 The usual way of doing
this is with a physinfo_cap field.

This flag needs using in Patch 10 to reject attempts to create a VM with
devices when passthrough support is unavailable.

Ian, for the 4.16 release, this series either needs completing with the
additional flag implemented, or this patch needs reverting to avoid us
shipping a broken interface.

~Andrew



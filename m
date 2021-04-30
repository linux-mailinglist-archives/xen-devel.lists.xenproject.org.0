Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7F36FE1F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120629.228180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTO-0001JJ-Dn; Fri, 30 Apr 2021 15:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120629.228180; Fri, 30 Apr 2021 15:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVTO-0001Io-97; Fri, 30 Apr 2021 15:54:34 +0000
Received: by outflank-mailman (input) for mailman id 120629;
 Fri, 30 Apr 2021 15:54:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVTM-0001HD-1q
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5139e80-954e-4ae4-89da-6d7871d49a3f;
 Fri, 30 Apr 2021 15:54:30 +0000 (UTC)
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
X-Inumbo-ID: a5139e80-954e-4ae4-89da-6d7871d49a3f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oc4vJ9FpsItMZ9oM+720ChbMm7Y8/Upo9eZYs7rpJ94=;
  b=fzSbAxMgzZHpLzrn3mDqYrbl1xHA//5gv5qJ92xR18Sb3EKyZ2ZQtZz+
   3XfYWro2fw53bBcAzqHrj7jMxaTUybsH2fsxKlBnm+iYXP77pzZ1GXE7q
   FZ2gvgBRK5ivYd49qTKYH0CwQ6HdBCbgtvm/wzQlkxA9CoaXNu26kanoZ
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Mcrl3ekkTHGoFBoh2GtV1viL2f35URWjUhtUJ8N5Cyxc4FZk7HHxdY7jpHTdmsS9UnXM59wGX7
 /Y5/87B5a0nec6SFTpOdvJJ2/g2YajZmMBtBrz8J3jcPu15rvuaW9J0GGql7P6RrPCgXfFJ1yX
 oznKXaClKimNPHx4Fbw5m612CZucaxbYLEfF2nr8VHAQIPCVVThQdLjvPqA/pAXuA+4u9Pq8oS
 2KXd7u7ln3lOJ34h4pFK3n9TOaoB0IgGZ0VJ5sksYdIUdDbXmmTlvPHnIb6kwD4NjEr69yF+Mw
 IZs=
X-SBRS: 5.1
X-MesageID: 42625713
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5XK9O6nu9HmyU6Quw34nC0Wl0MHpDfOrj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW57LLA+E4
 eR4dcCmiGpfm4ZYt/+Kn4OWeXCoNOjruOYXTctARk75A6SyQ658bKSKWnl4j4ycRNqhY0j/2
 /MjhDj6syY0s2T5xfA2wbonu1rsfT7zN8rPr3otuE0LXHWhh+sdMBdXdS5zUoIicWOzHpvr9
 XWuRcnOK1ImgDsV0W4uwHk1QWl8BtG0Q6b9XaijXHuodP0SVsBYqIr7+8pEWq6mj8dlepx36
 5R02WSu4A/N2K8oA3H68XVTBYvr0KooBMZ4J4upkZCWogTYqI5l/14wGppFv47bUbHwbFiOu
 xvAMbA3e1RYFOXYlvI11MfseCEbzAdGAyLTVMFvdHQ+z9KnGphx09d/8AHmGwcnahNBKVs1q
 DhCOBFhbtORsgZYeZUA/oAe9K+DijoTQjXOGyfDFz7HMg8Sjzwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rIdGS3bVQmyq9A1mVbHDI8IVz9pJ5srrzSP7AKiuYUm0jlMOmvrE2HtDbYf
 CuI5hbasWTbVfGKMJs5UnTSpNSIX4RXIk+odAgQW+DpcrNN8nErereXPHPJKf8MDotV2/la0
 FzGQTbFYFl1ASGS3X4iB/eVzfGYUrk5699F6Dc4qwyxeE2R8lxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz2W7J6m5uKydMF0o92sSmb1p64Ssxd2/ke7cKvNuSPUpI2mGcGxN5R8TKVC
 lSukpw4qDyC5CL3ygtB5aGPwuh/joujUPPa61ZtryI5M/jdJ99JI0hQrZNGQLCEAEwvx1rpm
 dFYAotXVTeCTvqtKWggPUvdaPiXug5pD3uDd9fqHrZu0nZj9ooXGEnUzmnVtPSvRwjXANOhl
 p687YWhZ2JnTrHExp4vM0IdHl3LEiHCrNPCwqIIKFZgKridg1LQWCWvjCCkB0odm3290Idu3
 z5IUSvCIP2K2sYnkod/rfh8VtyeGnYRU52Z3xgmaBWFGjNuB9IoKW2T5v291HURkoJw+kbPj
 2AXCAbJRl2wcurkDSPniyZKHkgzpIyH+DUAbg5aYvP0ne1JIDgr9BeI9ZkuLJecPz+uO4CVu
 ySPzKPJDTjEuUzxki7oG0mNCQckghsrdrYnDneqE620340DaCMfBBIR7QHL8qd6GahbfCSy5
 l9hc80u+z1EmiZUK/w9YjnKxp4bjXUqiqKasttj7Z+l6c7rqFyEJnWSiGg7gAN4DwOaOPP0H
 oDS6F66o3bMoBhf8YuaztUl2BZ4OinHQ8OiEjKGecwclEmsm/DM/6I67TOr6AzAkfpnnqHBX
 CvtwlU//LIREK4pMUnIpN1BWRdc04n7nt+uMuEao3LEQ2vHtszsWaSAzuYcLVHTrKCFqhVhh
 Fm48uQl+vSUybjwgjfsX9aJa1JmlzXDf+aMUapGeRS9ca9NknJqqy24NSrhDOycACFUS0j9M
 V4XH1VSN9ChDkkhJA21Sb3apWfmDNar3JupRd9llDs3YC65nz8Bk8uC3yAvqlr
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42625713"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxUs+zcBaXCyCH6+sFio+wyI4jMjQaIm7PWI0vR5dumin7kdn6HNZ3GTHjizLRO3rWuypxug+iBRc09bfKV345wVyvzkXABY8uHfsWZGH5piJdjP8CJsJMjrOwIFypc6WSa3uBBkNFRPOGUFRAR/cOmDM1XeK1kaNEpKwuaM1N2kKqOeXWmKC5e0kXMuEmCucpcM/DyNvyGGmyj7DtdlQ5mS1K3xtFzska1Sm9ajZZGXM2vicp5ElSNAwm0s1jQIEvDMDBGjMgpxdPu3/r4qbRqOxA5lpMDdGwn6sfRuloleZTvhCBAZwY87MC3ENMeXlVA0Xn9IPEKUxBd8OY06jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea2OyWmpWeWANsLogJ31RjsyaXJdLUB3QXTZ/zC3WVM=;
 b=HqI+nBPQxOgqxSiaP4jXZny3faXwKjlRxDGigd3foODLORdiy8dcNNKEi44hBUZVnPLIESeWBBdrY1a2fNhzpx5IUq1QPaDj/sjSpPH04qZ9iZvTal5VPlK17NQZThwzFgkb3mhGco6WiENHS3fkmnuRhIb0nev9TN62yiOHWXHRfnKNkdW9qNpN+carTQ5/dfgBxplcV3VtK/1x/nb2TE9eSxOQUT7dHnXZb2U9ztfGwsfj/RzAIWxY4ryKX6Ymbtj67hCNDrbpPI/KBsTdoz/Y6OhF4WPXPUDSayWnyDzKNzxai89AWwQgQXpe9wLoVFE/eBGATWJOQlt3PaSBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea2OyWmpWeWANsLogJ31RjsyaXJdLUB3QXTZ/zC3WVM=;
 b=gZRllac2G+iqsgaFzBQr92epK8lM6BuOr04NP8Q3fItq4BYPB5BBfOPxkxrWH7nOY5p0LxDhybl4KqtFTreURxdSZhM1pPrvFEK8JyrefozLEow+xpXjJS0Cgu/T6UPZeq+pixANIrSZbuAN5WUbhOwYYAC5eE/UW+eBuGVC1xk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 09/13] libs/guest: introduce helper set cpu topology in cpu policy
Date: Fri, 30 Apr 2021 17:52:07 +0200
Message-ID: <20210430155211.3709-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f7c8eed-39a8-401e-6040-08d90bf03baf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4218A150493697B087CA4BAD8F5E9@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NexlH798I11O0XMu7kvnHnqCExwGNssKX9lJyFejlnmflMyaZjIqIZwCR5A+C/CHkOBVJJAua8klLS4FnrRIDewgCQUmfrsLBKwyF/Q75VMjsP8TRCkKphIH+ICtpWzOMzxI3Hgk+aoI14ibWpgULahIJfVjf6sHdGX/8BSUJU588VRGR4MCl5owMFVLEQ4R0tAPhlSlqGxYlG39t/XZ7Sh1GwWxAJvV4LEHnvgjaJf5W9977X0qOvQ7yp80HajOX4ues/2/U6rGIZDYlND5HuKFI+O3bykiZHVavTpw3wY2ozOoz8ghQhPaFcyESEpODQdN/ZoyrjnwXqxtvFomhQRIcRheYwEIYN331DQHfBLmJJHLEt0jfpEhkBi1AT1DcL7m6KgLyYkGrCObdqPorAQyWeWVnwkpzl3m/6zKnNWrnPQPm7tpgNeP2X0ZE1VeEE5ZrIn2ijLR7dUBzrUM8irDS7YjzKBYE0tuEgxMO+7zDwxkMTtGges9vs6qtU5vyNFygvoVCBFHA+WS79Ob32uzlGhRXV1yexQUkjvSrBBTaA0GDyfFDV0IEi4BRBGqmyXPt4BPuU5BaB6+v2Yeh2RLhNVdnWUmbPNqTevflts=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(478600001)(54906003)(36756003)(316002)(186003)(26005)(66476007)(6666004)(6496006)(4326008)(83380400001)(1076003)(2616005)(66556008)(2906002)(8936002)(66946007)(38100700002)(6916009)(6486002)(956004)(5660300002)(16526019)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVN6Mm90VHhDR2Z0bWRuRGFyUC9HTGNCUkFwTTdaaTBvQ01UVlZ4Z0tBSUdo?=
 =?utf-8?B?TFl4bjc1OG1kZVRJeTYzd2ZacUtHakxGeGhVWXZQb3NWNEI2NG5maHF0NUtK?=
 =?utf-8?B?V1VOOGVYTHZyQndGRldVM2c1TUFrd296SFhTM2xPc0FJVGp0V3Z3STh5aHZR?=
 =?utf-8?B?bGlMS1JGZEtNZlRWKzNqL0IwaXdmUzBya08xdEFJcGN6UW9OYWRsWGxzaVp2?=
 =?utf-8?B?N1VkS3ZmY3IrQkdpVnFpaDFDRk84Wkt1VmcyemR0aHBISklBSXY4T0oyVGNO?=
 =?utf-8?B?WjYrMGdXa2hOd2xzWFFqRnZyaXl1eFh6L0IvdktUYVBmbHhUZkJHVzdBd1Nj?=
 =?utf-8?B?ODM5T1U0amphMFpIeGJ6ZElDTE51TGFLY3I0YmxlTUp4REpFd3dCS3JxV3gx?=
 =?utf-8?B?SlJhRVJVbm8ycUQvT0l0MGwvR2hZaXpKSHdxa1hGQ0RXK2I4M2Z1dnhnSFls?=
 =?utf-8?B?RHZObjBGNk5lVDF5SEJlRVZCYjUzSzN1SWNlTkl1Mll2QWljQ1NOd2h3NVNl?=
 =?utf-8?B?U2Y5VVUyWkI2ZEVJQ3ltOVZlQllYWmYrUlVqTzI3dkl5Mm0xVUpucEZmRDZw?=
 =?utf-8?B?d3dsT3o0VFdGeHRMRElGMis5OTJCVjRyNTBtSmxjSjlDVjZUYzJuSE9LQVUv?=
 =?utf-8?B?SjRaK3JsbjdlVzk2YUJteHhQcGF5Rmk2Mm1Ic25VSG9GOW5jU280a2RFbzg1?=
 =?utf-8?B?NEZBZS9wRzlDaHZiNDJweHRkNnVaTWFKZ0xJUjcrM0plTTVkRkhFMldFRkxP?=
 =?utf-8?B?V3lxMGRqMmJrLzY3QXJXWEtRa1ljQkpmb1ZTRmd6RmRJSGZmeVRMWnBRTkFS?=
 =?utf-8?B?YmJ5V1JseHNNb1lTQlA1dHV2TXlKd0xIQmpnOEVqWmU2Z1BzMzRPVGRBSUhH?=
 =?utf-8?B?c2dSazhsL2ZyRUw5U21VQ1Y1ai9LQ3hUcTZJbFgyN0k1a2pGRmJHMEN1R1U4?=
 =?utf-8?B?aFF2cmFEbGpnRjJKbFY0VGZtU3dad21TTklndE5nQURBeXd1aWd0enpBRmQr?=
 =?utf-8?B?anVoMHZYVUNpdHhyTzRIVGN3VU13VHhjNGNlZXI4U2VRS01QalhFWTQxOVlW?=
 =?utf-8?B?Wlk3WWxsVmpjSENseVg0Tk9ESzVaYkJCbUxkNXVtUSt6cllqU3BQS1NKREwx?=
 =?utf-8?B?bnRCdFBNcXJHNEJuMmkvaENTaW43Z2JaS01mdmhyalJQZDZrWEVpRE1CYmlU?=
 =?utf-8?B?MWU1VU5Nb0VmajRLcHNLRFBoV0JLSUZYMmtxN1Mxb2hoRStKTzRDT2JlL2Jm?=
 =?utf-8?B?V3RtdU9EYkJoZkVYTitBWi9NTDI3MGZoSjRySFArL2IzS09RV01Tc3M5ZXpH?=
 =?utf-8?B?dEk3bmd0R3VoN3ZkVFNWU2JzODhBZDFxTmUzYjRURTgyVi9TVXF1MFhPakow?=
 =?utf-8?B?aE82TmY2NFYyNDhpZWd0RW1jR0tOMW9yNjZ3NkR2eVRYeU5XVHRhVDY4VVo4?=
 =?utf-8?B?ZkhwVUdjM0l6RXc4WFhxcDd4eHJCbzRjYlVhejg0RTZrd0hFTlFwcGNkQzdQ?=
 =?utf-8?B?QnNqaTJlR08xdlAxMDlOZ3l1Y0JzSWlHbkVyUEFIMWNpNm15Y3hydVFWMEdx?=
 =?utf-8?B?eVo0WU9LbnplOVpYSnJpZmZ6cm5CL3hQTmdXazNIRWppdEVrZVZDVFJ6aURD?=
 =?utf-8?B?Q3FRQW5DK3RjM0JNaldTUVIyK2FPZFlPbWt3a0E3L1EzWG5PK3cxMDBKcndF?=
 =?utf-8?B?a0EwMnc1eVNWQXlWczJLTlZGV05rYXRNRFRsSmdvVGRyWFA5OHh2K29uNTZ2?=
 =?utf-8?Q?sVTEB4LXrBVsmywcJNEPY84qSGUJQq7KL7gw3EF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7c8eed-39a8-401e-6040-08d90bf03baf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:27.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkTcfXjmbOjQnbRFG93ULT3/UUBR0LP3EzrhzTqFMS/EtciQAV4pgPZ5H31RWkPaL/j96kupHIJcLouh4SE0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

This logic is pulled out from xc_cpuid_apply_policy and placed into a
separate helper. Note the legacy part of the introduced function, as
long term Xen will require a proper topology setter function capable
of expressing a more diverse set of topologies.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 - s/xc_cpu_policy_topology/xc_cpu_policy_legacy_topology/
---
 tools/include/xenctrl.h         |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 182 +++++++++++++++++---------------
 2 files changed, 103 insertions(+), 83 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 89a73fd6823..ec184bccd3f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2631,6 +2631,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
 int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
                                   bool hvm);
 
+/* Setup the legacy policy topology. */
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 855d252e067..dbf2ef67ee0 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -443,13 +443,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 {
     int rc;
     xc_dominfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -472,22 +470,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (p = calloc(1, sizeof(*p))) == NULL )
         goto out;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    if ( rc )
-    {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
-    }
-
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -571,70 +553,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
-    {
-        /*
-         * On hardware without CPUID Faulting, PV guests see real topology.
-         * As a consequence, they also need to see the host htt/cmp fields.
-         */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
-    }
-    else
-    {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
-
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
-            {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->extd.nc < 0x7f )
-            {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
-            }
-            break;
-        }
-    }
+    policy.cpuid = *p;
+    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
+    if ( rc )
+        goto out;
+    *p = policy.cpuid;
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
@@ -1114,3 +1037,96 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
     xc_cpu_policy_destroy(host);
     return rc;
 }
+
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm)
+{
+    if ( !hvm )
+    {
+        xc_cpu_policy_t host;
+        int rc;
+
+        host = xc_cpu_policy_init();
+        if ( !host )
+        {
+            errno = ENOMEM;
+            return -1;
+        }
+
+        rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy");
+            xc_cpu_policy_destroy(host);
+            return rc;
+        }
+
+
+        /*
+         * On hardware without CPUID Faulting, PV guests see real topology.
+         * As a consequence, they also need to see the host htt/cmp fields.
+         */
+        policy->cpuid.basic.htt = host->cpuid.basic.htt;
+        policy->cpuid.extd.cmp_legacy = host->cpuid.extd.cmp_legacy;
+    }
+    else
+    {
+        unsigned int i;
+
+        /*
+         * Topology for HVM guests is entirely controlled by Xen.  For now, we
+         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+         */
+        policy->cpuid.basic.htt = true;
+        policy->cpuid.extd.cmp_legacy = false;
+
+        /*
+         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+         * overflow.
+         */
+        if ( !(policy->cpuid.basic.lppp & 0x80) )
+            policy->cpuid.basic.lppp *= 2;
+
+        switch ( policy->cpuid.x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
+            {
+                policy->cpuid.cache.subleaf[i].cores_per_package =
+                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
+                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
+            }
+            break;
+
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /*
+             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+             * - overflow,
+             * - going out of sync with leaf 1 EBX[23:16],
+             * - incrementing ApicIdCoreSize when it's zero (which changes the
+             *   meaning of bits 7:0).
+             *
+             * UPDATE: I addition to avoiding overflow, some
+             * proprietary operating systems have trouble with
+             * apic_id_size values greater than 7.  Limit the value to
+             * 7 for now.
+             */
+            if ( policy->cpuid.extd.nc < 0x7f )
+            {
+                if ( policy->cpuid.extd.apic_id_size != 0 &&
+                     policy->cpuid.extd.apic_id_size < 0x7 )
+                    policy->cpuid.extd.apic_id_size++;
+
+                policy->cpuid.extd.nc = (policy->cpuid.extd.nc << 1) | 1;
+            }
+            break;
+        }
+    }
+
+    return 0;
+}
-- 
2.31.1



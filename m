Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092136C70C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118519.224690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNoY-00085g-Ms; Tue, 27 Apr 2021 13:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118519.224690; Tue, 27 Apr 2021 13:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNoY-00085J-Jo; Tue, 27 Apr 2021 13:31:46 +0000
Received: by outflank-mailman (input) for mailman id 118519;
 Tue, 27 Apr 2021 13:31:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbNoW-00085E-HH
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:31:44 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3711e990-4fc5-4190-99e6-8a98ae7551ea;
 Tue, 27 Apr 2021 13:31:43 +0000 (UTC)
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
X-Inumbo-ID: 3711e990-4fc5-4190-99e6-8a98ae7551ea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619530303;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YWKbgukm4XKoHrvXDpW87wh8q/Vmje5ke70McYW2k6o=;
  b=J3yahkiU/PBhKSN4DMG3GDbuyiEjQndO1HSPQ3uByIjmkMmuGEOJPc7e
   l2aBQovVOk2kxDvTFCKwzDDTb4X34hR5Ca4aoeSQ46Eq74SWKXFNIOADY
   6Rvd54FxAtEpT/nIRGkf2960aJnlYLH12XCwCRG3GBtRzLlJptwfvFsJa
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +L1ODzA2H4Z9vnOQlSjSRcHxwv2hcRKVXIhUH/aXZZCPwIGLaXgiTsFIWLoMKaAu6QEB6leObt
 FnTul0ojgs6SJb7YKEE0vOgiKWQNCoiKTJjrwJxlBhMYly82HYZNsVUpIfJXqYfdqOZSJDERpG
 7N6SCEhHTsQsvQoPrJAvnMpfrq3fRXpFSjpN0jB5dMrip2rnxrafvNIjh1xJUaZGRyWX3dcM9y
 2aJbRpZywgu7sKZ69EkoNE4sgbcYZPt167ogw9e4B3WleRccLnrRPgLprEEr8lPvjfVuuo7v5w
 GOQ=
X-SBRS: 5.1
X-MesageID: 44007917
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JvxXf6sU3xfTJ7w2IU17dyh97skCxoYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwQeCBtA50lGJ
 2AoudGvSOnY3QLbsK9b0N1JdTrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lIk5y6J0l9n
 XIlBG827W7v5iAu2Th/kLwz7ATotvuzdNfGNeB4/J6FhzAghulDb4ROYGqkysypIiUmTMXuf
 nK5ywtJsFir07WF1vF3SfF/ynF/HIQ52T5yVme6EGT0fDRYD4hEcJOicZ4X3LimjMdlepx2q
 5KwG6V3qA/ZXir/FWflqr1fipnmUaurX0pnfR7tQ0mbaIkZKJMtotaxUtJEf47bVPHwbo6G+
 pjBty03ocxTXqmaRnizw1S6e3pdHEyEhCae1MFq8yY3hNH9UoJsXcw9YgxmGwN+4k6TIQBz+
 PYMr5wnLULdcMOa7lhbd1xDfefOyjoe1bhIWiSKVPoGOUuPG/MkYf+5PEQ6PuxcJIF4ZMukP
 36IRxlnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRZLwWBfzCGwGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5PwknXR4RSE38DS8cY0+xLGm6mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXzdP8NFwke3WmLpoRTYVn/3E3aPv65YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gXcS
 JFUfbau5L+gVPz0XfD7m1vNBYYJF1S+q/cX3RDohJPF0v1dL0EquiOYGw65grCGjZPC+ftVC
 JPrVV+/qy6a7aKwzo5Nt6hOmWGy1weuWyNVJVZvqGY/8/qdtcZA/8dKeJMPDSOMyYwtRdhqW
 9FZgNBbFTYDCnShaKsi4FRIvreedl6iAKCOtVVtnrbiEWZqagUNzgmdg/rdfTSrRclRjJSiF
 E02bQYmqC8lTGmLnZ6vP41K2RWaGOcAKtPCSOMYIk8oMGtRChACUOxwRCKgRA6fWTns2EfnH
 boIyGvdfbXOVZFoXxD3qH28FR7S3WFcytLGwNHmLw4MV6Dlmd40OeNaKb26WeXZ1cY6sw2MT
 3OY1IpU0hT7uHy8CTQtCeJFH0gyJlrA/fUC647darPnlm3LpeTqK0AF/hI3ZpsOdz0qNUXWe
 aHdwL9FkK/N8oZnyiu4lo1Mih9r3cp1c7y0Br+9W6iwToRB+HRLFkOfcBsH/isq0zfA9CG35
 VygYhr4a+eMmDtZsWHzq+SRThZMR/XqXO3SeZtiZ08h9NHiJJDW73gFR3P3zV7+T97CuHevk
 YXWr5677DMIZUHRb1bRwtpun4S0O2SJ04quDHsCuAwfVsRn2bWVun5lobgmP4KOAm9vwP+Nl
 mUzj1F89rEVyWF06QGC6hYGxUgVGEMrFBj9viFbYveFUGDcPxC5kOzNhaGAfVgYZnAPbUbtR
 Bh5d6U28eRairjwQjV+R92OLhH/WriYcS8Bmu3aKN12u3/HVSHma2x5sGvyB/xVDugckwdwb
 R/SnZ4VLULthASyKst0iazTaTrokUq13tmiAsX6WLF68yB+2fUHUZPLAvDpI5ZNAMja0S1sQ
 ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="44007917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGjv/N2ZFZY92QInw01b9flEiEuEJm09AD/GB3102Hse3tUeIPI624RCo7rkLUZ9hTvVtHP25/rhsGOIyRsVBleMYJtmFOEY58JRVQy+4MS8oZzs3xy6yUCNMPfeOOAkIsy1A+jr2gYbH11Uzt9Ws0dcxP7SLG1eR1rxnFD57sQqlDuqpO1iq+jeVAnpFmKlkB+MAfS3mO43CXZhkMGX6A1cbfVyis0G+HGBIjK+t/XxCT8h9PoMXPkHzsIpn5rJSu8gEghRBUfXRYuEjfSR9Z/OYiNOKcbWMgJ7Vo73M0iw72B8P9+5m9iBrujV4RhlokQnGzhbh3+hQ+exUb4EOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4qPPYs7ylAFq+D4F8H6y9XshZfXSK7Ok3uVpRHKs3E=;
 b=Ir7lBFGsh1841C4B6UCoYa0gHjy9XUfcyfacSJePm7s9CfdR4jW+90jhbrbW40TNl4cX5zjbPpUpaKgEcpNy1IKQvz46VWVQaOphRgvRSqvVk/ZWyRubOSAlwPmLRUGAGK3DN5MuVRV4/HSYZcGPrNqv0iNGMXAn1K3DfjVfimQAG0SjrUy4tJVsb81z/lpL6q4SHAfx4y7IYsPP1cjZ+nob8kPbFkXtupyPWUOu44CCru9ihvb0Ot9wH09Rak4cidqV4CwURQEJpCpzwzG1tcPYmggKQ4Kwe7o4ApkI0/GK5SFSvBPNU9iOUErMd8RojCQn8bmFy6eBAjhYN08sAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4qPPYs7ylAFq+D4F8H6y9XshZfXSK7Ok3uVpRHKs3E=;
 b=cnUXfAYdyKdFCV+p0jyRn+lp/53tjL+n9OklR4CAL0fHJR3P6PkeT4hqR8y36U88c/S6c0opk6zDCkAPcoZQv9YqCFvEmPYbLv7oeJs78QAKSLS21eiU4qIJpSKDXut0C9dRUs7qYDWBPWsjBYol2b9Az5VkxChAGUMoeV7zHGA=
Date: Tue, 27 Apr 2021 15:31:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
Message-ID: <YIgSNRq2w7KSSaiD@Air-de-Roger>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <YH7zXpPz03+kLzEr@Air-de-Roger>
 <e9de883b-604b-1193-b748-5a59795a9f31@suse.com>
 <YH7/SvkrB2yGgRij@Air-de-Roger>
 <5170aa51-8e34-3a45-5bf6-c0a187b1c427@suse.com>
 <YIfTyT4rvD9yEqiM@Air-de-Roger>
 <5018479d-b566-a32b-9a01-5ccf01fe0880@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5018479d-b566-a32b-9a01-5ccf01fe0880@suse.com>
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f76b496-2eb6-4f6e-06ea-08d90980c9ea
X-MS-TrafficTypeDiagnostic: DM6PR03MB4681:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4681D104955D5586D4A3F0C98F419@DM6PR03MB4681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQTIC4DUKV/a3H9ibmMumBgHWpQQrM6HrxPc7FnGcsY8I8ZzSHmT4DD2D1LWJCLQgsfVSMn0bDhON+5mdfqhbywIqdjS+5sQkyZtHMSY7T8ApPr2Ml1lGk2GkTiVjXHbYQZVV5hoqtiYVTgr0EpXPJPT97VRSyOnoCzOtkIUu0r9pUl6ck79kWekbO0oZYX8Nrfbxf/t4rvNgG5OKUom7e0aorcPct2CcYn/POt7h78qJwmS99ZVETEi78S92kw5kq82/A8zDDNqc3kKvWchBNhKz9vtmRiYMRfnnJAHr1O9DAK+zXvsv1ii1XSTpeacySLxyBPSIUYS5KCjbzJXbjBnbFkEQR77tdxYO6RdcP2wsR5kd3jzUdsNbmptjpuBSVtTPFNVvSIFLMOphOGI26tRBAv5uBvY3smN1QfURc6C29Gfs3T8F77IvrbJZVJ7UyMc/gUK+WoFFFKW/T2vHD3L0bfoRDiC3/1ruQ0NFexG9asmFAiMIkJoBji+Xdhwl9Ooj9m+4aLJ7pJP1WPWuA3ShbLDynBapgYmps/c0qTi/7ykCjIDasZ7MkbgUEgSDgtWKMp82fYn93zsj7Gf4IhTTHzed6X8158EQZmYvsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(5660300002)(956004)(2906002)(6916009)(4326008)(33716001)(316002)(16526019)(54906003)(9686003)(478600001)(26005)(6486002)(186003)(6666004)(6496006)(85182001)(66556008)(86362001)(8936002)(66476007)(8676002)(66946007)(83380400001)(53546011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NU9IcWdJM1BJd0ZqeTNSUHdrOTIwRnZUdTRwSEtWeExCZ1V5MGRXNVFxSWo5?=
 =?utf-8?B?VTlyeFVkMHEzeDRJbFNTQ1R0VEZGODBmbms4RmoxMVJEb2ZZOVpTV1p5ZThl?=
 =?utf-8?B?enQySWJwT0ZDU25OcDRIVksreTViRGNLZHRaM3Z1ZkdEYUtGR1lrMGN3MmxM?=
 =?utf-8?B?MmViSmZueVpURkRRMXRXTXFDaDl4L0hMY0prU3BkejVNcGJZbjBFM3hRNU5p?=
 =?utf-8?B?dHU1OTRrZ2l4STVrb0NlNnFhS2RLMktSQUtsVkVjOUQwTUxPOEJWUU5TeXgw?=
 =?utf-8?B?UytNUzg5b0JGanN4MUtZNnJjcFVzVForK0N3OEhUdS9lbTZDZE9RZDNyZ2dk?=
 =?utf-8?B?SzkwK2t4T2hEUk8yRzJ3eXZxZUJsN0VuVlh5YytkZDBiY2RJSEJFNlJYSUho?=
 =?utf-8?B?ejdVUkQycUs4a3lqeFR3MHJ6L2Y4blpCKzdNRzVFcHZaUm16bE9oWnpBUHUw?=
 =?utf-8?B?bHFlYWdGZDMwbEJWZXJjb3NUOC9SeUZzWDRxZ3gyTnZIZHoyMmNpYWlnc3p0?=
 =?utf-8?B?MDJ0Vk11c3J6b1ZST0diOGhtU1hWVVpFYldDRzgzYStiMW1lVGlzZHdCcnRY?=
 =?utf-8?B?RVhMV3dscGZIZW9QSDNxY3dmQ2g3cWE2U2FDamhna3RHM1lqenNqTFpMc3lt?=
 =?utf-8?B?dkJaUmhwK3NrQS8yQTJBbm1wTzNPRW1uMHJ2Q0Y4Q1dEVXVqcFMwanJTMGJm?=
 =?utf-8?B?djBWcmJqT3pFZ1hwazErRzZzWjZzWGdjbHIwbVg1MmV6UGxyUHZ2YmtacEdi?=
 =?utf-8?B?R0s0Wm1CNHFHOUx2aTBSc1B0ZnRPeWlUN3dQUitMZ3RhRGxuZk1XN2Z4Z3hq?=
 =?utf-8?B?YU81STBwamRQYVlHWkxJWVNTdGpNQVNRZURtanJZZkllWmY3V3J3TDRkWnN1?=
 =?utf-8?B?T0RNNHRPNkQrN0VISHJNQmFwbWJYRGZQMEt1U3dXdXkwQngxZ1VnczZhcU5U?=
 =?utf-8?B?aXppOHdzbzdxY3I0SFN0eHp1NkFaNVVCcERDWUlPTjhNS3F0Q1BnVEZoeUEw?=
 =?utf-8?B?aDhGMTFnc0ZrRHc4MzVncWJacEtFRzJJdExKbVBNc3N4RC91V2tvSktqalR4?=
 =?utf-8?B?K3JYb1JHWTM3MnlHUERVRDNYNkoxYjROOXI3azFpRzFKVk5kVEVvcFVRQy9p?=
 =?utf-8?B?VnQ1U0xhQzVmc0kybkk4SmZxbDh5akFFVDNlK2xlVWt1Z253Lzl3ZlY2QkJX?=
 =?utf-8?B?N2VXSFc2VEU3UFhTOXY4ekl2VmhZbGNheGJvOG53bFpiZ0J2TTRHTnNEQ3pO?=
 =?utf-8?B?Qm9pYjZ5b2cvNU1HTXNvbHpCVEJMQ3cvRXAwblA3TkQ2VnZTYnlMZ3pOWjFm?=
 =?utf-8?B?Q09sQUtOVzIveWVKSG5xUGZjMlNpNHZuenBZaGZtVWROaXowZ1dCT2hwZWRE?=
 =?utf-8?B?RUNmdEM2ODl2R1hHYUFPemtCYnFrbkdrRks4eHo0OWEycnF4ckxJeEJIN0dL?=
 =?utf-8?B?M2ZiMDM5ZTRUVk5PZGh3QVBXeWtOYmgxbGg3SjZZeHJIbTM4Z0JVbjFLMlZD?=
 =?utf-8?B?T2RTYkdHWXRTUWdsdHU1dUxFaCttY1ZwS256U1E4K2J5L0xZVkpyWDJISzJv?=
 =?utf-8?B?NkRDbUlhWjdhNUlIQzhOd2IwZFR3MXpxZTlMSkVhTG5UWm40REUwbmNVTng2?=
 =?utf-8?B?eXU0LzkyMVY1MW9zeC9ZazNFYnRwUnN0bXBmdTk3bXF0RnZpWHZUM3NPb0Iv?=
 =?utf-8?B?T3RwcFpjOWsvQ2wycDFwakJ5UCtLSUE4MEZXdHN6Nkl5MVpDM2JJN1loL21s?=
 =?utf-8?Q?dCLTC53N+T1S2aqQvrUt6MbfMuk3yys9t7nZmSZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f76b496-2eb6-4f6e-06ea-08d90980c9ea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 13:31:39.8672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuSg2MzQeKenmLo6+ZwoG/t2uakzEWx1eMDH5AbBZ1OHO8tJvpd9Dmkxs/nUWQqvs8rcN1Goe4RF+MoBKCJbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4681
X-OriginatorOrg: citrix.com

On Tue, Apr 27, 2021 at 02:30:35PM +0200, Jan Beulich wrote:
> On 27.04.2021 11:05, Roger Pau Monné wrote:
> > On Wed, Apr 21, 2021 at 04:09:03PM +0200, Jan Beulich wrote:
> >> On 20.04.2021 18:20, Roger Pau Monné wrote:
> >>> On Tue, Apr 20, 2021 at 05:47:49PM +0200, Jan Beulich wrote:
> >>>> On 20.04.2021 17:29, Roger Pau Monné wrote:
> >>>>> On Thu, Apr 01, 2021 at 10:33:47AM +0200, Jan Beulich wrote:
> >>>>>> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
> >>>>>>  	@sed -rf tools/process-banner.sed < .banner >> $@.new
> >>>>>>  	@mv -f $@.new $@
> >>>>>>  
> >>>>>> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
> >>>>>> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
> >>>>>> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
> >>>>>> +	$(call move-if-changed,$@.new,$@)
> >>>>>
> >>>>> Won't it be more natural to keep the .s file in arch/$(TARGET_ARCH)?
> >>>>
> >>>> Yes and no: Yes as far as the actual file location is concerned.
> >>>> No when considering where it gets generated: I generally consider
> >>>> it risky to generate files outside of the directory where make
> >>>> currently runs. There may be good reasons for certain exceptions,
> >>>> but personally I don't see this case as good enough a reason.
> >>>>
> >>>> Somewhat related - if doing as you suggest, which Makefile's
> >>>> clean: rule should clean up that file in your opinion?
> >>>
> >>> The clean rule should be in the makefile where it's generated IMO,
> >>> same as asm-offsets.h clean rule currently in xen/Makefile.
> >>>
> >>>> Nevertheless, if there's general agreement that keeping the file
> >>>> there is better, I'd make the change and simply ignore my unhappy
> >>>> feelings about it.
> >>>
> >>> I don't have a strong opinion, it just feels weird to have this IMO
> >>> stray asm-offsets.s outside of it's arch directory, taking into
> >>> account that we have asm-offsets.h generated from xen/Makefile into an
> >>> arch specific directory already as a precedent in that makefile.
> >>
> >> Well, asm-offsets.h generation doesn't involve the compiler, hence
> >> no .*.d files get generated and want including later. For
> >> asm-offsets.s to have dependencies properly honored, if we
> >> generated it in xen/arch/<arch>, .asm-offsets.d would also end up
> >> there, and hence including of it would need separately taking care
> >> of.
> > 
> > I'm not sure I understand what do you mean with inclusion need taking
> > care of separately. Isn't it expected for .d file to reside in the
> > same directory as the output,
> 
> Yes, ...
> 
> > and hence picked up automatically?
> 
> ... and hence they _wouldn't_ be picked up automatically while
> building in xen/ if the .s file got created in xen/arch/<arch>/.

Hm, so that would prevent re-building the target when the dependencies
changed as the .d file being in the arch directory would attempt the
rebuild from there instead of the top level xen/?

I guess the alternative would be to force a rebuild of the target
every time, in order to not depend on the .d logic?

Thanks, Roger.


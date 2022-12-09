Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F10648A55
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 22:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458276.716179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lFD-0005uY-U7; Fri, 09 Dec 2022 21:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458276.716179; Fri, 09 Dec 2022 21:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lFD-0005s7-Pc; Fri, 09 Dec 2022 21:49:23 +0000
Received: by outflank-mailman (input) for mailman id 458276;
 Fri, 09 Dec 2022 21:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vX0=4H=citrix.com=prvs=3351f26b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3lFB-0005hu-Kf
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 21:49:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 556b8d23-780b-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 22:49:20 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Dec 2022 16:49:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5802.namprd03.prod.outlook.com (2603:10b6:806:f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 21:49:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 21:49:13 +0000
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
X-Inumbo-ID: 556b8d23-780b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670622560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8bEO41YrrVBemOqsA3aJJd+20ey22j0dzcw32If2DJU=;
  b=Bm3GzklSbdXBR/w6Nw08UKL0jVndyOvYQjwFPy/Ff/2k4FPp5N4KmzBG
   wSOTGcPr1G4TzuitofPV7exIlhPhaUdGP90seeJNkTDzioJunwIeNEKMQ
   ueEDVAcFaMi3abzDm3bdiv1JPsqwxgRXUOiOyYtJPPz92axHDgHckzez1
   M=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 86621389
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IzRjIqu8RxFXm5QcyJiPDFHc3OfnVKFfMUV32f8akzHdYApBsoF/q
 tZmKW6FOfmMM2r8LtF/Ydzj8k9UsZeGmt5rTgM4+Sw8En4b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWGxiFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwd2wnQym42emNmJWXTfRchpRkD8v0I9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3mqKQz2w3CroAVIA8WBHewp+iAsUn9UO8cO
 XQq8wUIqbdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsSRYG6sLxiIE6kQjeStVkVrax5vX5ASr1w
 iyKhCEmiq8PkNUQ0KGm4VHAhSnqrZ/MJiYw7xnaQ3m3qAZ+e42sT42u9VXfq/1HKe6kokKpu
 XEFn42U6rAIBJTUzSiVGrxTTfeu+uqPNyDajRh3BZ49+j+x+nmlO4dN/DV5I0QvOcEBEdP0X
 HLuVcpqzMc7FBOXgWVfOepd1+xCIXDcKOnY
IronPort-HdrOrdr: A9a23:3wno1qO9E2mlzMBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-IronPort-AV: E=Sophos;i="5.96,232,1665460800"; 
   d="scan'208";a="86621389"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekZClgiJfMdlSbq62S9dv540FU5TyHSePXoHPrVSLoWra361Q1E5Py24ZcOEkEDae9haUh0tCVdoInrlxydSeAm73QOK/q7UXkpZbBM3EuRbZnKFhUH7reEqtHzc1pasJfgxKhtA9xDvJI8dtgZ6/O0tLNwq56gVyS1nznlikOm0p9ZKOfVAxP1/crojVgOdLzh2+Z+ocFBUHfPQp/IisYja+niW1Jx5NdwgQzhBwB9qbcBrVh6kY2FZYII+hAdJg/+wG7HojQD6cucln9hmvq04DFHgTiv9O6M7+KxHDb1Y4uYyM/wsj66QQ3PVmohKnCH4rbpIV+SXCt0EO0lvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bEO41YrrVBemOqsA3aJJd+20ey22j0dzcw32If2DJU=;
 b=VdWEQn3308GOPca5Zs/6cjG4lx3E2IHRyJnD6xeLJ+oEBATp9n/nj395qHokey+I6eR8OsR8VWJVTy9xONeCuQaT4GShEkCoq26nd3ZX63lV1oCnxABn47V+5IpnT6zyJpmV7D1JYZIS0pzQDzKbnWnICC6VgG+snxMdzX7MqWeISfU4jeQAI66LJgxLuXqlOpCrporTcC/D4vsOXWjlct6/cfcy1C+gXYqFdXyp3bS9HGpXYsXrzTq7dbu57fFSPbzB0zts4nnHRmP0F10DE2wObC4xmNQPnpjeZZPBshsKFzFlSMQ/cBU4qjxBa0ArhHpyH/VWYVDhqwp5OGdU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bEO41YrrVBemOqsA3aJJd+20ey22j0dzcw32If2DJU=;
 b=lzYGN7UCshNOgDaF4NtODirY/aGcJrjvaz8aazUsi/pqITTtBqWBxBBKQmc4hcApDFjtEJndIlgfpuOKh25UBUswzr8YqyFDii4cmB1mCiSy5Dlnbzkcd3nUkqoMyRf7s/xfthxzFLpYVQS9XZue+W3/J/0eT7cVTA1Vmx4uEoA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWF0ZXVzeiBNw7N3a2E=?= <mateusz.mowka@intel.com>
Subject: Re: [PATCH 4/5] x86/tboot: correct IOMMU (VT-d) interaction
Thread-Topic: [PATCH 4/5] x86/tboot: correct IOMMU (VT-d) interaction
Thread-Index: AQHZCXqD4CsJ8bMLQU6FJmXA+M68565mHTAA
Date: Fri, 9 Dec 2022 21:49:13 +0000
Message-ID: <fd47bb13-6943-64e1-fdf6-2ac9207090f8@citrix.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
 <bae74b9b-eeb6-76d9-b4d4-55c9a4fb2835@suse.com>
In-Reply-To: <bae74b9b-eeb6-76d9-b4d4-55c9a4fb2835@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5802:EE_
x-ms-office365-filtering-correlation-id: 05b46e4c-a1ee-48aa-8606-08dada2f3608
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e6Idcp56H9ccP+hOEzDozGzV3eowgE8uFLfJ2JKMkfPS4YTDlxaOGUI9lZ5NJbn/Kz+ARa6BaA+hmpCIQugEMCVc5Jc0JcFGjVMlDX3i3EVY5V4q8cDhytUrBLOud3LoeIXk1vJY7ZNhDg0U3ONd3gFHxdoY5ViD4WoA564ZbVbmF2ejeBiB7Nhm6/daP1XifirmK+nprQYiHAUXGU/bp53uFc0dClZipIbsy8AhoNKamDEe2I5xYTdS6BC5Ugcu7BZNo7oJbr6BVafu80/FeU2KpgA+uyZRPGswefd+o300BVRyRugXXspUUvvQYPO3ASVMWIJ/sBXUbnrsE/aF1VNX7T6VL5/fBwmmWYXZ7h0TgoJMhvGEqE1aEsgm0WrcMkfqXLzosmJWZjotgWMBwpzbb3dNnv6T8jhCiors4TvSjO9PCnVwwXaarRA3ZISDG3Cr3C/v/pQ+tqnrcZe/5uBh6xrqJR6hlQZIBYp+cNiJtQ8xkgAqxqZNQIQszBkeQTbESxFaPkm+ww5WrhHRP9QcoFzQbS/PThXJ0knn13OH2v/c1xud4Wd4Li+oZDF/XDt4OjiP5B3HOiCJlEF9mqyGx8wfV+17ZjSgBbrd79UXIvucEpSa27HTBdRzSmddwWziNmAtRAlimHzcp39qXXlaHITR4B2rWwRqMK4juvBhZ9LEa9a3dXbi8wbMfiWfF/7CYV+iVz1JQXfso3vXBCLfb2b46L/OTy1293x7ccA3RnTkxC37ss07zyHm7t2aPxR4JUUoSxWdBiUPcnqB8Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(316002)(31686004)(54906003)(110136005)(71200400001)(36756003)(91956017)(76116006)(6506007)(122000001)(8936002)(5660300002)(38070700005)(53546011)(8676002)(66946007)(4326008)(64756008)(66556008)(66446008)(478600001)(66476007)(6486002)(2616005)(41300700001)(6512007)(2906002)(4744005)(186003)(26005)(82960400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2IwSDJvbGVLcXp2a2UzcEtCVjJ3VVhwczZrTGRVeDZlNk9pWm12OTVqc3F3?=
 =?utf-8?B?MTI1aDFVYlhLOFdxSUFyVzhyLzNDZlpMR1ZucjVXSkNZQW50bEpoRXN1dE9q?=
 =?utf-8?B?RGpYZnZwRlhaQjFWN0E5OGhLZ204QjdHK1lsSWhER281N0tqL2t5VUFPanVu?=
 =?utf-8?B?WUNOYVgvb0ppS1Z5cjJ6Uy80d0ZhK29PMUIyd2krb3JleHQvYjBWVHpnZm5L?=
 =?utf-8?B?MXRTNE1nc2hDOHU1cmc2Tmx4SXpFUllHOHdQb1lEL3prTG1rS2ZLM0RKRFlq?=
 =?utf-8?B?bUVVSjdrUnh1VkJ0TWFaTXRkSmJJZlBNM0hQOVo2d1BmMUw5ZXNsekFFYktm?=
 =?utf-8?B?eU9mSHM3bVhhYTRET21acVU4dUxSU21aaFZOb0t5ZllCbXhpMzdDYUZPSWxR?=
 =?utf-8?B?bmVmUjVoMmZ3TVE5aitHZVp3UUlLc1pKem1GT3dHazdXUC9abFZNakFCSlZm?=
 =?utf-8?B?aGdJVXQ1cmx0MmpOVnIvdXJacmpmeURkU092dkpLdDB1MGlGV0lVODRWbXZ6?=
 =?utf-8?B?Nnd3ZFhUa2tJT3Nobk0vVGxWdkxWUlBURmlwNlRTVDJGUWtYWHp0anRhdCtG?=
 =?utf-8?B?a2xrRm9HYllBRFVONjl1M3Y0dTgyRE5qZ0NFdHNhL0d2bS9SUHNjZElVeFZZ?=
 =?utf-8?B?WnJVdkxPRGtJSEN4NFlHUFl6clZ6VjNTNnRQOFlkS2YvZm43SHh0V2xSYVBh?=
 =?utf-8?B?VXIxMkkyT2JKOGc2YUxwTXFBZS9YUm9OZXprOHRBT3pkQmttSy9sS1IzVHVp?=
 =?utf-8?B?WkJiRm5yLzdvMXU5MDVpWUJGSEVwK3pwVzgwL2RrSFg4TkEyYUFHWktoLzdM?=
 =?utf-8?B?VXg3N2U3b0M5dkIwcm82SEFCbXkyYnp4UDhYVE1wTXU5elRzMWI5MXdQMjBT?=
 =?utf-8?B?UStuSUMraWRaUHU3ZTc0dVdkaVNSSHhyK1VjOFVtQ0dKZXI3U24wMmhrRzUw?=
 =?utf-8?B?MGgrcWowUGs4czJ1czYvV1ZaMlF6NGRKOG5DYVd4R0ZkMkh3YjlqSDRWYlRB?=
 =?utf-8?B?TjJKT1JuZEthbTBIenBkdE43Rjk5cjNWWElNc0tadDdra3JQWE05bDdFb3Rj?=
 =?utf-8?B?ejl4bU1YNzdiK1M3aCsxUGZDSVBaU002ZW9RaWU0dWh2SGNBSzA5VVM3bWNG?=
 =?utf-8?B?NDNKWTR3YzEzckZFOTloK0czMTF2dkNscENHNFU0OFNYWEJLK3dCc2xSaTB0?=
 =?utf-8?B?N05iKzFzRktIbTdOa1JzdTZhYkFodThtZlgrMDRWK1lzNk5pQ2V5NCtWNTJK?=
 =?utf-8?B?Yk0xZm1RczhCdEMzN0VadEdLbGRVMHR0STZXQVNoNUxVRlNyWDl0SzA3djVU?=
 =?utf-8?B?Z05FRGVpNUdCSGdBMklNaFFDdmVYR2tqU2gwQmNRNkdJNkhBK3RmUUVXY3py?=
 =?utf-8?B?K25QZlp0bVRHUTByUUExOGFWTEVFdS9uekFVQVNTOWtMSEdZQU9McDliclNY?=
 =?utf-8?B?ZThqRUF0dFRuU29WVzhLTnljeEkwNy9uZ0ozSVlrSkhGUnBld3VsU1FuRTl1?=
 =?utf-8?B?U1lrejhRaEk3b1kzWVdkNVhBUW8wbERieWUzUE5mU1UyT2d5VnVDSDRpNTRO?=
 =?utf-8?B?amd0OVZKM2tnMkxNOVhhNmdneUtCdmFYRWhnQ2FmeHpJd1JKVm8vWkI1bmNH?=
 =?utf-8?B?aEFuM1ltK0thd2tCRkdrblJHNnZsbWRQZ3dqMkk1cmpkRElkbGdobDhpalNy?=
 =?utf-8?B?YWxHMWszOEgvNi9GbkZlektFNVBlME9kcUE4MENuQ0pzNDlpeGd5MzRWZ3p3?=
 =?utf-8?B?TVpCQVNzZmNxdU4yTDZWMmd0Nllaall1UkxrK0dUR1Vqb0Rzb0FUSFdqa0Nx?=
 =?utf-8?B?MnhzVjR0K2VoelFqY3Nqd2lrQTU4QStXUkNzcm9TcCsyekhKbVN5Z0t1cWtV?=
 =?utf-8?B?OWp3aDg5QmIrYk1kZHBINWhkOThNVFA2RENhSXpNNXRZMXZYb01wYUdZODRZ?=
 =?utf-8?B?RkVZUGEvWlJkcmlBZE9qaWdYZzhkZUhkd3hPNi9VYlBLUzR1anl3SVZMTlNL?=
 =?utf-8?B?c1F6K2x0TzVzc0RPaHYwdjJHaENyaTZGTDNQSG9veTJVS2k4bzZVRThpZ1Nx?=
 =?utf-8?B?dFpWRWZjbDNoNjNPTDlrYnN5S2RUeGQrOUZ1UVpLZnRmTHhuRjQ0K2JtQnJJ?=
 =?utf-8?Q?x4NmbvjOxih1AfXaVOnvkPdTW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13DDFA65DEE1574E82A2F7263EA1EF9B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b46e4c-a1ee-48aa-8606-08dada2f3608
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 21:49:13.0880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZN2N9dPWFk496H6cAGPMYBtmxQffMZcG28ZgdZHbcmd9atx0/oq5zXxIBmaioIzbKhEWfNc+HKIgHtDI22716Q0TBg5hlg60H4HVtWFazo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5802

T24gMDYvMTIvMjAyMiAxMzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEZpcnN0IG9mIGFsbCB1
c2luZyBpc19pZGxlX2RvbWFpbigpIG9uIHRoZSBzdWJqZWN0IGRvbWFpbiBpbiB0aGUgYm9keSBv
Zg0KPiBmb3JfZWFjaF9kb21haW4oKSBpcyBwb2ludGxlc3MuIFJlcGxhY2UgdGhhdCBjb25kaXRp
b25hbCBieSBvbmUgY2hlY2tpbmcNCj4gdGhhdCBhIGRvbWFpbiBhY3R1YWxseSBoYXMgSU9NTVUg
c3VwcG9ydCBlbmFibGVkIGZvciBpdCwgYW5kIHRoYXQgd2UncmUNCj4gYWN0dWFsbHkgb24gYSBW
VC1kIHN5c3RlbSAoYm90aCBhcmUgbGFyZ2VseSBjb3NtZXRpYyAvIGRvY3VtZW50YXJ5IHdpdGgN
Cj4gaG93IHRoaW5ncyB3b3JrIGVsc2V3aGVyZSwgYnV0IHN0aWxsKS4NCj4NCj4gUmVwb3J0ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=


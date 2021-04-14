Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622D35F4F1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110633.211171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfiG-00041c-ST; Wed, 14 Apr 2021 13:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110633.211171; Wed, 14 Apr 2021 13:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfiG-00041F-PP; Wed, 14 Apr 2021 13:37:48 +0000
Received: by outflank-mailman (input) for mailman id 110633;
 Wed, 14 Apr 2021 13:37:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5rk=JL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWfiF-000419-A0
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:37:47 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 324f73a0-416a-40bf-bcac-8210dd6ae24b;
 Wed, 14 Apr 2021 13:37:46 +0000 (UTC)
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
X-Inumbo-ID: 324f73a0-416a-40bf-bcac-8210dd6ae24b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618407466;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=m3G5bwKNdY5NDinTToRZFVdVjR9zU2NYqUMcnJvj7mg=;
  b=HDdKOtRQ0N2hxMed0XzL9OC0bFPqEajIUu4KvSBkZG9rLVrS7cVrcxvn
   9mbvuLJEKclChuAITKiG7dTQqbd4XiGIl876sLmR9oR/H5GDImpiRQKAs
   ViZc8h9/ofxp6PhahPxktPnwaoJg+gnshKKF4RknClQUBI+b/d+okmRER
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LerZZRyA23BiGxvBbmBlVPKkrljyB3yn3Z6NX0VMz2MTwSktBH+uyds8DjUDOWHtg5P90Fiu0Y
 GXGbDIrktv5nEVYOPhjiNvwzoSLfonJtm50Jf/GxSl8fbaLCgFJqskcIlwetIThTXRAKMej5bc
 HgEffIbKQYraz/7KBG7xqHTpQOjQiA9Dp3OPRyA7Zg80JuRkur9V8wH6HjU00fY8AHPzUlbwxh
 oMCvr8wqbVPjJvib/Zb/dCd6niZsv1vxwN8iGU7lRq8jlkP7cV79rc1WqKR3GzlKbUuvepr63C
 Uu0=
X-SBRS: 5.2
X-MesageID: 41570130
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Z8Xh+qn3Vi3398RNs050EgtJFj/pDfNRjmdD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLNhX4uKdDLN/E+lNptr44en+T3vHCXi6vVQvJ
 0QEJRWIObbSWJ3hcOS2mmFOv4rytWf7eSMjeDR039iQWhRGtBdxi1SYzzra3Febg9AGJY/Cd
 647s1IuzKvdR0sH7SGL1MCWPXOoMCOqYL+bXc9dl4awSSHkD/A0s+GLzG2xREbOgk/posK0W
 +AqADh47XmjvfT8G6j60by9JJQod371594KffksKMoAxHNrirtW4h7Qb2Fu1kO0aKSwXInis
 PFrRtlH+kb0QKsQkiPrRHg2xbt3V8VghePpjH48B6TxfDRfz40B9FMgohUaHLimjUdlepxzb
 5R2Cahv4dXZCmwwRjV3cTCVB1hiyOP0AIfuNMTlHBWXM8/b7JcvOUkjTloOaoABy7z5cQbFv
 BvBqjnlY1rWG6dBkqp2FVH8ZiNRXI1JxGcXwwrhaWuuQR+rTRc4WNd3tAVmncb7pI6TPB/it
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOOl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wp9uhuo7xC/pHsTrviNiOODHo0ldG7nvkZCsrHH9
 G+JYxRGP2mCWf1A45G00nfVvBpWD0jefxQnux+d0OFo8rNJIGvnPfcauzvKL3kFithVXj4Bn
 cFQTjvNMRN5k2mQRbD8V7sckKoXna60YN7EaDc8eRW4pMKLJdwvg8cjkn85szjE0wajoUGOG
 9FZJ/3mKKyome7uUzS6X9yBxZbBkFJpLHpU3ZAox4WI1r5GIxz4+m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQlENKoMmWTinMJv3KUR5IAmqmOjP2VPa8QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fzk6m/lYcVA+vebtF4hw+uLadv2CninHTZgftqamoQXjaoX8LSvB0nQCBMgE
 Ztt4UFhqCbpDqpIWwjoegxPVFWcl6LCLZeAAntXvQPppnbPCVLCUaDn3izlgw6cGuCzTRguk
 XRaQmvPcztLnUYkHZCyaru+E5zbQymDjBNQ0E/l5Z8G2TAsmt0ysmRaMOIojSsQ2pH/8VYCh
 b5W38pBj5WrurHiCK9kCqeFHkg25UlNvHcCrNmaL3IxnaxMuSz5NQ7Nu4R85B/ON/0tOgXFe
 qZZg+ONTv9T/gkwgqPux8eSWdJgWhhlfPjwxv+6mekmHY5HPrJOVxjLotrb+20/izhR/yS1o
 9+gs9wteysMn/pYtrDza3MdTZMJlfSpmGxJttY5qx8rOY3tLFpGYPcXiaN3HZb3A8mJMOxjV
 gAWs1Akfv8E54qe9ZXdzNS/1IvmtjKJEw3shbuCut7eV02lXfUM96A/rKgk8tvPmSR4A/rfV
 WP+SxU+PnIGzGO0rMXEKo8K2VbYkpU0gUuwMqSM4nLTAm6feBK+1S3dmKneLhGUa6fBPEeqA
 1579zgpZ7eSwPonATL+T11LaJF/zz5HYe8AAeQFfVJ9NL/M1KWmaeu6NOyijCySTbTUTVvua
 RVMUgLKsJEgX0+iYdy1C64QKn+uFgknFtT+isPrC+m5qG2pGPAWVhbOgjYiIhMVTZdMnKUnd
 3ImNLoo0jV8XxAw93fD09ecdFFBsgIQoX2JyloL9IMvLTAxdtnvg1TJBE0D2A9jzjh3+Rpmb
 ehsc+iL9HfNQ==
X-IronPort-AV: E=Sophos;i="5.82,222,1613451600"; 
   d="scan'208";a="41570130"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAmog8hdcOd9J5KLxGnhInijQpGp/4AyzRWDcOoXoWSrrPEDKgi0+D34/P9p063N4kJp91GzpbmoOLaopJpOCBEAIv8UQeCmfKhIHj6JC75cI2f9m9h5k6hkL4x7KB10o07ndwB3vasoZXDNf2pMgFcDYFr/rbxd5wwgHb+tx7X+GH/45aTKcbtEsxriU36/xHE8BhAOgQCY81MWS3qPj/mnlytr1l+apDqE7iToR+gAaffxlmYqH5cjg67RQnYP8XZfgV+TBxpO4U+bGtMcdNxWvmMyRQGzKmcS1ITpbdF4/JZ5dZKRX/0BlM7nSuLXYvFC0lbbRasZV0r13E4o4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Soq1EBdFHw/yXJPdksV/Nn1vxVrkLWEhIiQuluttx6w=;
 b=V0kCcxJYdI8Oq5t3jNEDWyfRqK4nMz4SXQXLoxPuhIte0Tb1mGQvWjOCnFk88KpwTH7PuQ0Iz02wrCL+0FNL3q1OXEAA5uBPTpmA9KDyn1VfBmkcPVqpTjLmfsVpnjgAKcyCPeOwgmtw+jF0rCTYo/T/esqHwDTmoycJrCvKOT8FNo7c+ccxF4aKp2gfl2BfzfRRPc43zcjHDGPl3I5ZLiosolE1j16cJs2Or+hBgnmM1seN91+vekZH9/ZE0n8emA5ZW7xEJcLvi+9fXHAZfpH4OjHgnxRv9f0hz1YVZigL52yE/AgMtzTUOdB5j35QQkwVIqh/S/U0vHjjVsQLag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Soq1EBdFHw/yXJPdksV/Nn1vxVrkLWEhIiQuluttx6w=;
 b=Ts6VY5pembH5Ss6oXWK5R45smCFZ7dBCCruQwu2uJAJc0SFYcD7ImLDM3aE6/a5xuzwibMLTtVV9svG/PrFxlZWc0n8I5aik26Z3NMNtUIFKIa4NHfAs+PXQKIbObcW8aO28/8N5jVBVEbKhQyUxDEx1b4WSkrI3dHe2Pl0C0GI=
Date: Wed, 14 Apr 2021 15:37:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 09/11] x86/vpt: switch interrupt injection model
Message-ID: <YHbwII1L1O7AjJhl@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-10-roger.pau@citrix.com>
 <3cb01098-887b-c952-1f93-e89c443ba471@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3cb01098-887b-c952-1f93-e89c443ba471@suse.com>
X-ClientProxiedBy: MRXP264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bc9185b-ef96-4078-94fb-08d8ff4a7ab7
X-MS-TrafficTypeDiagnostic: DM8PR03MB6232:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR03MB6232F67E8F282200FA8BA16A8F4E9@DM8PR03MB6232.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JeFnfenPYJJj8C9koQZR+PYXdbhc6o/A0hL70CVmN9qmppAvPWHTq4X6yWA4I/RdtTYkAqmmQZFZlCZLZLV5eoqYWu0UAIsi5fb91MdaKYJcWncXhXyJPbwoThUrO8WX9nv0QYyqd4uLoXSRVYj8qZbcHbkHsbgpB/RBvl2JUcAEBeB+Y/EYVEwZGnjlD/SCCRKda9ZGz0QjjFxt/QzVSdOIc2e5Sg4mIAOZL2LCMkhmaZxrSJO3pcEivV6Lt5s7QfeRtJ3wOHluVTwjViA0Hcq+NJT0pTWaFGYG116KnnTXDgEoRtZDKoHQ230vpBAb9ByD2ItY1dTQGxRU535Bk77m01IyKQDT6dhx+UiYYQaD1TRnNqbRyI7hEZoooBNxo7ZZRw9vIyQwSUiOV+2yScQfIy0AKKbzA1PbRi37XlyH4tUe11xU+DNPkhfdbOG8Z7HRuTVWVnOmbAfhoweYkL74PN+U8vtpBPgWiJzgyS8AXuqr6ZAs5dTOjVJ/qW//2vp6icGv6/K2F2yU7jE4o8mahmTkVmie7/p5NFO93Gj1xX0ah9EqR975Tv9NaE2emwifDo9Okj2NLXJyUEKM3rQMJINIKFSYPkRS+avdmOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(376002)(346002)(366004)(396003)(16526019)(5660300002)(53546011)(26005)(6496006)(186003)(83380400001)(38100700002)(478600001)(6486002)(4326008)(8936002)(956004)(33716001)(8676002)(54906003)(86362001)(85182001)(2906002)(66946007)(66556008)(66476007)(9686003)(6916009)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVNvM3VOenFEdlIwc3NQZllRaERtVmtRVVNXa0liM2dTemphR3d6eTJESmU3?=
 =?utf-8?B?Zk9JZ09XVklIZ3o1UGF1aHc2cGdZRmR2QnpPZDVQZHN3SkJIVytIRUNndUEw?=
 =?utf-8?B?K1N4bTFCYlRnVmpVSmJUdnZCRHppa0pIQm9ham9qbkc1KzZ4VGoySlhOK2FL?=
 =?utf-8?B?L0c1aXAwTkRlRS9ibDB1Y29NQUd4OGhMOE1MTE45WVd2dE1XQ2M2U2VpWGJQ?=
 =?utf-8?B?ZXlvMUZMcSthQ1JXMTBpTnorT3hKNFR0dGpuZ09DWGxodzNsNTRHZGwzVlhV?=
 =?utf-8?B?MXNlU3Z2UTQzNUhNZFZ6M1IrM0hSTDNXWVR6aDE1RW9zS1lxUUZReEFhR2Jz?=
 =?utf-8?B?cExWWkpOTGMzQTlWNlh6MDI2NUdJZEJ1ZHA1U1ZnTU9uN3BpQWtkMWNQT2pE?=
 =?utf-8?B?NkV6ZVB4bFZ5TmJFY0p5Ni9GTTI0YWlla2pYOHRYeUpXaFE0QkU4NEl1QlYw?=
 =?utf-8?B?MFExSEdlQzBhVHExd1JQZ1NuS1p5aFVKZWRwb2V4aWZxaTdheHpmcC9zcWZG?=
 =?utf-8?B?cERURDczOGcvL001bXJFYktMREZlTFhOODFReGFpVG1kYmM4ZG1SNkpCRFpQ?=
 =?utf-8?B?VzZOWll4b3hDQ2lKUi8vNmh2cDB3SVZxMTlybyt4M0NXei9pQWR0UW9hWUha?=
 =?utf-8?B?a2UxTWd5cVJxWG5kdXNpWjVaYXkrWnQxNHBrb1RPa0lZdXBRckhiRStxWE9Z?=
 =?utf-8?B?VklJWHMzV2tZUG1xYWp1WTFTS2lLbHZIZ1Qwa0ExanM5REpuV0dKaXYreFlD?=
 =?utf-8?B?MFFzL0liM0ltMGdGYmlzQnZJeVNIUm9NbmtSWUhFM0hQaGZtZ2ZGeHVyMjVX?=
 =?utf-8?B?U0Y1eFhxMGRuY01uNWs3RlhVZ252QUM2dEpJdHRoMVRlSDdnUGtsWVVwM0VG?=
 =?utf-8?B?S0NZd1JNZFhuenN2SVR5cXZrclpTOUFoM3d3aWVoMnY2c1h6QjUwdVp0QmRM?=
 =?utf-8?B?Ri8wN1Vnd25sQVVmN1YzMVhzQVRjQldOcHdwMmdIeXNzQUtkVno0Yjg4b3FE?=
 =?utf-8?B?YmJXU3VMWVNOc0xjNTJCMVpDWjk3aXM0b3RKWFN1OEFVdTJaSUZRTUl1UEZw?=
 =?utf-8?B?MlREN3B0NU1YN2FpVElkMUtHbm5kUHVoZm5RbVJ3MHZSdWhtcTNjN1J2U2RC?=
 =?utf-8?B?VFk0UENrNnFhMDZ2dXo4YURPWHRxemlKbSttWFNGU09YbzJQc3JaR2ZOTXlr?=
 =?utf-8?B?dDhxYytCZ253aEwxQWJkK1FyQlpmdmJHZjBSS3pkdCswUFBPaHc1TEw4YVBB?=
 =?utf-8?B?eGgzSFRIV2hnRm5yS1NNY0VReXNpYS9tdUJFTFNvQzVINnJZVUcwUUNhclpT?=
 =?utf-8?B?Q3N6UXRDNEJiM3RFOVNrOGZ0RmRQYk9CYkVpaVVFV1BMNWM1WmlyNlY0TWFz?=
 =?utf-8?B?UE84NlNONlhsVzBFWHpIY05Eb3pNVFlub1BBTm4zZkhKdTBMZWhrWXdaRmtM?=
 =?utf-8?B?R1FPbWJjck1yUThlMzZTanBoQ1pIU0ppNVpFeDNoRU5BeHVoV2p5aEpVWlZT?=
 =?utf-8?B?SmYveEFacXYyVmVySExQTHF0a1UydnlqaTk5VXZzcEtKOVZ0dlF1UDBQYy93?=
 =?utf-8?B?R2lTSVViYjdNakVaUks3bUl3N1I0WjJ1MCswTUxkRVdUS0FlTGNERUJxbnRv?=
 =?utf-8?B?clYwaTFyUlNrWHRaenZSRGJrcitvVGxmOGg1WnZnYmxXamlHYWIzMjQ1L3pE?=
 =?utf-8?B?UVR5OVFWVzQrREI0cXY2Nzd1TDJlczJ6YlRqUkNkMzQyQ2RWdkg2eGsrNjFI?=
 =?utf-8?B?ZlYrRzBrUUFldnQ1UWhLa0V3OTdiS1NqWGZ5cVN5b2twTzAvU3JabHJsaHJo?=
 =?utf-8?B?TGp5dVQxdTdhTTdMb3lsUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc9185b-ef96-4078-94fb-08d8ff4a7ab7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 13:37:42.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOoFbBE5O3zKPbWF3B9M9wYTxRyuOe9lD94QYRHoqczudhxl83XwKtsFLeytGViG7krhPngSFsPm8aFAZ6ifDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6232
X-OriginatorOrg: citrix.com

On Wed, Apr 14, 2021 at 12:28:43PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:33, Roger Pau Monne wrote:
> > ---
> >  xen/arch/x86/hvm/svm/intr.c   |   3 -
> >  xen/arch/x86/hvm/vmx/intr.c   |  59 ------
> >  xen/arch/x86/hvm/vpt.c        | 334 ++++++++++++++--------------------
> >  xen/include/asm-x86/hvm/vpt.h |   5 +-
> >  4 files changed, 143 insertions(+), 258 deletions(-)
> 
> Nice.
> 
> > @@ -285,189 +238,144 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
> >              list_del(&pt->list);
> >          pt->on_list = false;
> >          pt->pending_intr_nr = 0;
> > +
> > +        return;
> >      }
> > -    else if ( mode_is(v->domain, one_missed_tick_pending) ||
> > -              mode_is(v->domain, no_missed_ticks_pending) )
> > +
> > +    if ( mode_is(v->domain, one_missed_tick_pending) ||
> > +         mode_is(v->domain, no_missed_ticks_pending) )
> >      {
> > -        pt->last_plt_gtime = hvm_get_guest_time(v);
> >          pt_process_missed_ticks(pt);
> >          pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
> > +    }
> > +    else if ( !pt->pending_intr_nr )
> > +        pt_process_missed_ticks(pt);
> 
> Did you lose a -- here? I.e. does the condition mean to match ...
> 
> > +    if ( !pt->pending_intr_nr )
> >          set_timer(&pt->timer, pt->scheduled);
> > +}
> > +
> > +static void pt_timer_fn(void *data)
> > +{
> > +    struct periodic_time *pt = data;
> > +    struct vcpu *v;
> > +    time_cb *cb = NULL;
> > +    void *cb_priv;
> > +    unsigned int irq;
> > +
> > +    pt_lock(pt);
> > +
> > +    v = pt->vcpu;
> > +    irq = pt->irq;
> > +
> > +    if ( inject_interrupt(pt) )
> > +    {
> > +        pt->scheduled += pt->period;
> > +        pt->do_not_freeze = 0;
> > +        cb = pt->cb;
> > +        cb_priv = pt->priv;
> >      }
> >      else
> >      {
> > -        pt->last_plt_gtime += pt->period;
> > -        if ( --pt->pending_intr_nr == 0 )
> 
> ... this original code? Otherwise I can't see why the condition
> guards a pt_process_missed_ticks() invocation.

I think the logic here changed enough to not match anymore. Certainly
pending_intr_nr shouldn't be decreased there, as pt_irq_fired is
invoked after an EOI in this patch, instead of being invoked when a
vpt related interrupt was injected. I think I should better rename
pt_irq_fired to pt_irq_eoi and that would make it clearer.

FWIW, decreasing pending_intr_nr should only be done after an
inject_interrupt call.

> > @@ -617,20 +556,29 @@ void pt_adjust_global_vcpu_target(struct vcpu *v)
> >      write_unlock(&pl_time->vhpet.lock);
> >  }
> >  
> > -
> >  static void pt_resume(struct periodic_time *pt)
> >  {
> > +    struct vcpu *v;
> > +    time_cb *cb = NULL;
> > +    void *cb_priv;
> > +
> >      if ( pt->vcpu == NULL )
> >          return;
> >  
> >      pt_lock(pt);
> > -    if ( pt->pending_intr_nr && !pt->on_list )
> > +    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
> >      {
> > +        pt->pending_intr_nr--;
> > +        cb = pt->cb;
> > +        cb_priv = pt->priv;
> > +        v = pt->vcpu;
> >          pt->on_list = 1;
> >          list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
> > -        vcpu_kick(pt->vcpu);
> >      }
> >      pt_unlock(pt);
> > +
> > +    if ( cb )
> > +        cb(v, cb_priv);
> >  }
> 
> I'm afraid until we raise our supported gcc versions baseline, v and
> cb_priv will need an initializer at the top of the function just like
> cb.

Will add such initializations.

Thanks, Roger.


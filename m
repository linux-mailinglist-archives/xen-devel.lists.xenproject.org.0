Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4B6219C2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440313.694469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRmx-000197-4h; Tue, 08 Nov 2022 16:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440313.694469; Tue, 08 Nov 2022 16:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRmx-00016A-1F; Tue, 08 Nov 2022 16:49:27 +0000
Received: by outflank-mailman (input) for mailman id 440313;
 Tue, 08 Nov 2022 16:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osRmv-000164-GK
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:49:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a48b82a-5f85-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 17:49:23 +0100 (CET)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 11:49:14 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5057.namprd03.prod.outlook.com (2603:10b6:408:da::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 16:49:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 16:49:11 +0000
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
X-Inumbo-ID: 4a48b82a-5f85-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667926163;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7uHVE6tvVidYXgPFWupiMcDyQ+5Yp2OHDfBdcUaudbg=;
  b=CxbiaYJwtwmPb5KUALlnH2DWpLEEfYKOh4ddshZABAH3Ms75VDbR+csJ
   RuePimOZA/Szllh90XUGOkWc7ya8ag1BkARjqU6aZZy/wQChySxVisQNI
   4JjIEh6G72I0ejNN8QtEromzu7MQo5rOVeCOIorL+A1h/1jR7b53XiKrU
   c=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 84406476
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:r2b//amb44orKRhFpMJxjoDo5gxhJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfCzqGbq7YYzT8f9FxYY/g90wP6sSHmNJlTQs9+X81RiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5A+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cQaCA8GUTnTvaGznJe9R+RCpes6L/C+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iea8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+nANxOS+PQGvhCoFm143IIEDsvVgGSi/qZqHK3X4tdA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml6qfS+RffOWECQRZIctlgv8gzLRQw3
 07Pn87gAzNHubiZD3ma89+8hDe/KSETIWIYIwMJUAAF7sPLqYQ/yBnIS75LD6qdntDzXzbqz
 FiivCU4wrkek8MP/6G65kzcxSKhoIDTSQw47RmRWXiqhj6Vf6agbo2srFLdvfBJKd/DSkHb5
 SZV3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxezO
 Cc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:uj5Wua6E4WMcnitJawPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84406476"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gc2w7x0y+SDZETtZ8JtzxyaTQX2UNMhC/6n8eoFAMZSkkbIsM6vQWz9xuxQIXzlvRPVQqDH1NbdBB65HUTdVLVVoveG6UhfNFrdxbANmL1PqIAWslLJF3geNXWlKQRLcbkIGr+bp6hWds0nuvObKlVSh0A30HP3XQNbGl4DsBdphV5KSWBrXyAJ+dkpfnt0/5k+Edn6SlKqtYzwi7vJ2Bk0grcV4cSXQ2x3ivLdHwrltuONPaqWkz8dzLOdTUcSi8+af0fuQf/DU95h17qLdOdaM6ykZjTKhIXX6HYxx0oCEibzluMHprnbrvbfG7gDwfGByOsoJcE5I6HjObku5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkpIb/z8eiIlRllcG96IJyMPPG0asRaSYB/J7lUyigk=;
 b=euhPSyzkZDfSB6HQyBCp2wUbl/wSU5hVYdwubl1cNuun1gmWJabkmdL3wRVQTnkEHYnzTw/ywCoZ3gqWVQRzC/yc01ZFp9QjIV/lTiwEC+A5uOeYQGL9Mo6LG9I+OHVE+gQlV6eGcW0XN4bZmBkECMIJ76KSa9COLtoDpnGaIQSNdOEQN7UpcIHb8I+AS8eYnZH70nfZownZw2uicpmvGPRJd0wzE3cq/opKPWQ+F2jmtzHCTZKpH1ALn237DUCKIVuPHlHtbjkQHMzi8cCCJUQSXaQ+HEWT0OkLHbzIW+kLxmOhqOJ2GlOBtjBchscodDtT7xi4KZ4h2qe6Bnwi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkpIb/z8eiIlRllcG96IJyMPPG0asRaSYB/J7lUyigk=;
 b=U03t2EReHonjcqSUXCaUNpTxTi2rNMd6PeaH+k4hGG2QV1L1jCtfiuZAUlW66+h5HsFi2kKb2Er2VQ/ei2YS6KlrxE9kuyHzsqE4ONOZEbip+kMo0TCyvYE6mDZsf0kE68t7viIgSsj4kc7Gsir4pLIx2G03wBVo6t00ZiAL8SE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 8 Nov 2022 17:49:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, ray.huang@amd.com, Alexander.Deucher@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Message-ID: <Y2qIghA3+gs3d/TI@Air-de-Roger>
References: <20221108135516.62775-1-roger.pau@citrix.com>
 <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com>
 <Y2qERaoix1Ff4yZA@Air-de-Roger>
 <b129ba0a-73a0-9a2b-015f-2eaa1011b08b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b129ba0a-73a0-9a2b-015f-2eaa1011b08b@suse.com>
X-ClientProxiedBy: LO2P265CA0109.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::25) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f29643-0a2e-4551-62e5-08dac1a92961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UiViT08FhntS1SJRbcEPFcvNkN9qeAZAYfFB0BySlHiqORqdUDBPeFnl3hwL3m2jnYLV5EVrlcaNbWpmQBVMRUfcvzXxTm33mHpPzNcPqAV1PKUluSEEUpTYVg0cDWrlZFMEfgbxYVBBZAhU+QchXGMfT7NaF9j+2iF/xxwgJvNCZc39jNCrDdYyOBON32Bs2a45otyxaOI+gZOs3Md1ugqC/altFdAVd1QOze5hxP1l5oVcPPjL+jguq1qoAgNC3Ppg1dhoyC1bEAtYjkVDc/ZOdj1oyvir+DZdgUyZwZGAkciNP0jtocpQQN3JvM8gOMA4ZTmyvMUpCKlp0yabRAlMG1a/6V/nUOcHC91TxunyKgYmBDT5u4T336X4tfAGPjsMKcU4A9I38JcdBqPyMYGkXJIBsYS13Syb+xnu66AmaUvDkhE5Q8Cb3CGgLkqAnVYaXzVRdwxXSVIti5cIXA+NDE7PX2kwRnNJ79WZ0p3o+u+biaZNLbsFfH2mmUIq/bLkYpXRhgBER7zfS8B0qmUIt9itAhh1aYYKb2vBKkmSCEexDG23pf8jc+vh/3HHW9e1Go/DqgxEeCs6TUFHLcoIJ3pQqCmTKo1bDnRPkNIe1K67a0P9c5Iy8+kej2RgWMr0K0UkbxhLBZZBHxt2sml8PzXEpM/h/VJGpRTRGf9kchi1Yr1DslYRbuFph3t3zsTZHtzjBdO/+h3I/os/quUduejwQbQUNARhMcJ4vTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(86362001)(85182001)(5660300002)(2906002)(53546011)(6506007)(9686003)(6512007)(26005)(38100700002)(82960400001)(186003)(66946007)(66556008)(66476007)(316002)(6916009)(54906003)(966005)(8676002)(41300700001)(8936002)(4326008)(478600001)(6486002)(33716001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFRqL0lhdUovd1lpMXhnTC80YXdxS1lUOFU0MDB5a0U1c2w2U2syZFFXMzda?=
 =?utf-8?B?dTB4QzNrRXBJTnhFRi9HYkFZZ25HR2IwZnB1YzR0a0RtS0t3OVhrZSs1dzF2?=
 =?utf-8?B?OEppeWdrWGRvbUdlOTZPMERYeGgzdFpBbmJFWVlnalBvWEEyZzFrcW9WY3Zy?=
 =?utf-8?B?ZGpCZ1FEYmwvZi9GSVVkejZGd0F5ZU92eGZHSCtoSUw3N0JRNDZJZEdBcGd0?=
 =?utf-8?B?V2xWNms4UWNLdmhiMXZLUlNZY2UxeHpjRTZobzViLzl1UUNHdUZIWHZzY2hG?=
 =?utf-8?B?ZCtaaWxndkZnVm9VMElSVU1vdWtVY1Bxc2h0YnJydzJDY0pVL0tFcTFKcDRr?=
 =?utf-8?B?TjM5UjJad2ZkWHlobGtaYkgwSzVzZlozcEwxMERLRHVqcTMzSWJXUjZSTGp4?=
 =?utf-8?B?dlBDeDhxNmlRWmxwM3ZmR29ObjY1OWZFL3pVODFKZ2JvY0VpREsxcGZNOUl6?=
 =?utf-8?B?bDN2a2IwWm1oZTczcG9McGNmZDBsY284TWNqYjgwcVl1MCtpVGtheEMzdkh4?=
 =?utf-8?B?cktXK2FlbjRCVlE3NEVOcHB2ZUxSZ05VRno2SUxmMXRzQUtBeHk0NlRuaUU3?=
 =?utf-8?B?S1liUG9JajROa2Fjd0tFdXRidzdXWkNIWTJvSGJ5MnBuQnRhWkpPVlI3V21i?=
 =?utf-8?B?QmxlSmkyZXU5SVEzdjNaM1lyS0ZxaFNwYjVZSXhNNUFNVmo5akdRb3FoOWEr?=
 =?utf-8?B?dHFNUEg0aVFLbjRqK2gvemt3bHA2STAvUEphR2hSYzJnZVFnOGdhY1M4ZS9I?=
 =?utf-8?B?QUNpVjNjaHV2VytQemN0SmM5a3ZWTTU3b0t0b01YYnBLWGRtelFYNUZiOXZG?=
 =?utf-8?B?bTg5TGlNeC9OYjF2c1F3dXRhcERQdjRHbzJWWm9UaWx2bi9RT2F3WVdoVzht?=
 =?utf-8?B?QVEzNlFCRGJ6bDJmbTk1dkMweFh3T1JUQTVSSFo2VUU3dlM5WTJ3REpSUTd6?=
 =?utf-8?B?dk5ndXJObTR3c1hVdTVGNTRkZWhvaEplazJRdGNHdFNkcmgxUjBIeUtxUXdz?=
 =?utf-8?B?aytlRzhLL1VTbWhqZnMva3ptaTlmS1Zad1lIYURzZ1BiaXgrZnlXT3B2VFpP?=
 =?utf-8?B?bjJYeENsckRtK1FCT05IR2hZa3ZSWHd1Y1Q4MDNmVDVrckExVjB4YW5YTTl3?=
 =?utf-8?B?TmlOaUJWdjFYSWNkc1JxYUo1VTBvbHJKcWZmckZsVDRjQXJlYTV3QmVuSU1J?=
 =?utf-8?B?UUplMk9CNFFKa0l4VmtmWm51UDNmdWNrVzhCWXZUZ1Nvc3g1T09jeHJqMFRR?=
 =?utf-8?B?YVdRSDEyci84eEdFMWVVdWlNbnZlcVJmaUt1c243ak1yb0xRRDZKMFFrcHBj?=
 =?utf-8?B?TUo5YjY3NERWcFMzN1NFeXo1cHArZEQ1Ykx1KzQ2aGI2TjV1bmlvMVpmUU1Q?=
 =?utf-8?B?WFZwNFUwQUdPbEh1Y1RPMG16enlQNkVPdTJyRWUwUEwycTBMc25vM3B4Tlh1?=
 =?utf-8?B?Nzk0bVlJR2FHKzRlVGNGVEZKTG5zcU00QlhjbWZPVkFUZGxSRWFRZzRTTmR5?=
 =?utf-8?B?VXFjU2dobGljaGg4Vmk2ZWgzK212bzZrZTF0RjJ0N0UybDJ3UzVNQzgvclVQ?=
 =?utf-8?B?QngxOU8xOS9maEZyaGcrMHVtUTFFWnJLbVdtemxPVjhZbXdzeThNZWNZNjQ5?=
 =?utf-8?B?alJKOERQUHVrcWhtZ2VzdjdLT1MwTU40MmhCU2xWWE80bGpwMjQ4RWJPck56?=
 =?utf-8?B?V3ZEcVAzNGN6aDlOVHg2eDRORGN1YjJ2dWlvMVFEUnNIdTFuMWptWE90cjdp?=
 =?utf-8?B?aGxYOUJteUY4RjNmU3dBcWlMcHlGS3RYTVZOcHZxVUhDQ2wyRnMzdDc3ZXlp?=
 =?utf-8?B?T1o0TjdkQW1VZ2hnRDB6WklHTHpZK0w2RzZtM1NXLy9WZUZYRVFYb1VtQUx6?=
 =?utf-8?B?SlRFSXNVTENOTllrS0UrM1hJSmE3emJ1NXpyZ3JHMS91MTg0cHNrSGFLV3l6?=
 =?utf-8?B?aXpCaTNJdTV1NFlTZ2xoUEtrdkVMRHJaaUdNVXBJRjVLaEhGMEdMZGZ3ZnI3?=
 =?utf-8?B?TzA2b3lVUExPSW8wQlFtZE5TdDVkdmVHenF4VGZqanI2RUpzbzI1YVF5RTRp?=
 =?utf-8?B?VU1DaElPbHMvVlFDMGdZbHpDbUF0dDFCaUx6cWo3TXRrNi9PcjNJZDJMWXQ0?=
 =?utf-8?B?eTQ1V1lTeG9NTVZjQjMzMVBIdU5JWHcyWTNZUjBaWW5Mb2cyNklvc1BTSVFK?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f29643-0a2e-4551-62e5-08dac1a92961
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:49:11.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbQIM1Q4SBjrnem7RUUUZyFk2k0keJXDExVdf7mNqnvAIwnvjYILWdC/Rj0z2mbdKZh0yiRnnboGULBLWGAn5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5057

On Tue, Nov 08, 2022 at 05:35:04PM +0100, Jan Beulich wrote:
> On 08.11.2022 17:31, Roger Pau Monné wrote:
> > On Tue, Nov 08, 2022 at 04:56:17PM +0100, Jan Beulich wrote:
> >> On 08.11.2022 14:55, Roger Pau Monne wrote:
> >>> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> >>> from the firmware instead of doing it on the PCI ROM on the physical
> >>> device.
> >>
> >> I can't find any mention of VFCT in the ACPI 6.3 spec, nor anywhere
> >> under Linux'es include/acpi/. I don't mind the addition that you're
> >> doing, but there needs to be a pointer to a sufficiently "official"
> >> spec.
> > 
> > I've also asked for some kind of official spec, as I would assume it
> > should be in:
> > 
> > https://uefi.org/acpi
> > 
> > With the rest of tables not in the spec itself, but there's none.
> > 
> > I could add a link to the Linux header, but that's suboptimal IMO.
> > 
> > Are you fine with this as-is, or would you like me to elaborate about
> > the lack of an official spec in the commit description?
> 
> A pointer to the Linux bits is better than nothing, but as just said
> in reply to Ray there needs to be sufficient guarantee that "VFCT"
> really isn't going to be used for something else down the road.

I will leave this for the AMD folks to clarify.  I would assume AMD
has not picked a random table signature and started using it without
having it reserved with the ACPI folks.  Having that said I don't see
the signature in the table of reserved ones in the ACPI 6.5 spec
from August.

Regards, Roger.


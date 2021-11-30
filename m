Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6B4635CF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 14:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235124.407973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms3W4-0001I1-2B; Tue, 30 Nov 2021 13:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235124.407973; Tue, 30 Nov 2021 13:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms3W3-0001Ea-UO; Tue, 30 Nov 2021 13:49:51 +0000
Received: by outflank-mailman (input) for mailman id 235124;
 Tue, 30 Nov 2021 13:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xd2=QR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ms3W2-0000h5-1L
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 13:49:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60858453-51e4-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 14:49:47 +0100 (CET)
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
X-Inumbo-ID: 60858453-51e4-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638280187;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/9lZkaq1Ksh3RnGpCUWnC2S1l6e/qMMFOwebBte/cac=;
  b=R34baCWz49WRPRwB9P1ODSUdVnN5Y3QGyvGLxQbZWrqVbqTPJtWHeNfN
   HllRlUgejakPaznOWDy1QxUHbCQKXfei9EDeXuRNYLDz6qvqi3K/eR5Fh
   9FA9Q4h73cV/Cs0h4ZUpWt8p2s0ws5AZFBANVp0HlCnb7jmsy7scBA5Qu
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: h8NL3t8UF66hCayPf7D0UgwnXoRcREbNCZifwogGU0gzM+1DsKgZN1OGuoKkpcv1YKDxn+DzpQ
 N7znr7CiEsP4V6pmu3Q0aKxviit50jGB0Cdi0oIVglAZ3T3UQvh38HgcQokAwjcO+LZWp0hldD
 Nzi2HWkT/fBPAzENoVG8THvsZ6SSFbjehkhTYSHGkTxE/gyrCSGnTtM7W6vQwA3zmOjU6dbwEn
 W+JX19v4J0i2KzmCNvVaJaJt65aMaSUy0AUBUsjGGRKuY8Watczxiulv2H+a4kxMYjeZQqtkl/
 fdGn6ZZWFgLBqdiO7xOSSh9N
X-SBRS: 5.1
X-MesageID: 58422091
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Dn5zyKhM2FBGbmnc6YAA/HfeX1610xcKZh0ujC45NGQN5FlHY01je
 htvWm+Ba/iKZ2GgctlxPti19U0FscLUyoBnTFY4qC5nHykb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cz2YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1z5J7rVyUpYpf3meEeYjxlDThhBJVvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1pwUR66PP
 qL1bxIxUh34TRhvCG0II45vo9yriGvhfi1H/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWm8fptjEyW13YkAhQcXlumotG0kke7HdlYL
 iQ8+ScwrK506E2iSPH8WQG1pDiPuRt0c9haHvA+6QqN4rHJ+AvfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETAcMGsqdSICCwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWueQR1tAp1/mBxlHCgAOJm4bQUTcNz1CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQc3R8FJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCkfiI+TfNDKm8gj9yjn5ZL1TvEMZGPxP44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2IFcqilk/8j+DCPhZ5rIvp1nPVNYjVC4ve/W3oH
 yt3bZPWm32zrsWgCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF7rrE+lqAtE
 KFeEyhCa9wWIgn6F/0mRcCVhKRpdQixhBLIOCygYTMleIVnSRCP8djhFjYDPgFXZsZuncdh8
 bCmyC3BRp8PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2vIz
 RuSDDcZufLJ/90//u7WiP3WtIyuCeZ/QBZXRjGJ8basOCDG1WO/2oscAv2QdDXQWTqsqqWvb
 OlY1d/mN/gDkAoYuoZwCe8zn6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbvA
 xCB4NhXP7mNKfjJKl9JKVp3dPmH2NEVhiLWsaY/LnLl6XIl57GAS0hTYUWB0XQPMLtvPYo56
 u49o8pKuRengx8nP9va3CBZ82OAci4JX6k978xIBYbqjkwgy01YYIyaASjzucndZ9JJO0gsA
 zmVmKud2OgMmhucKyI+RSrXwO5QpZUSoxQbnlYNKmOAlsfBmvJqjgZa9i46T1gNwxhKuw6p1
 rOH66GhyX2ywgpV
IronPort-HdrOrdr: A9a23:hjYWkKHdM/A/0cBepLqFeZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nI/hSQRI+Lpz+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzp/QtHNBA7dE6ML2K41z2MGHx2V2pUCHa/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.87,276,1631592000"; 
   d="scan'208";a="58422091"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw4Hx2tGFYv/nGaWcsipGESRRAwZVjo/mLoPi22w++8Sg7LWBw5AZZSVPuptWTY6FtoubyTxd6ENvE4QJu0czW7xF5Bco3zfUmVwSvQ/LA/BJYUzcEz39YenSHE0dSRMMXEgN/h6GnCU8FBP+mjZf4aF8SRCI3AAu+a+m60ReEQ3Q1VhVGZXI6rX0L8SHhLdnCE82gB90D7JKPi0G8QCC2nJMHIBU5xdPCfUbTNXK1pBgSXur2pqfLwezbYgtLqn8Yevbdnxg+v8hsnWtPZj3t0e5CNLJrVdB2TCwPiytzyO8NVGBma2JbJhqAmmuKzv4J61Z1oK5HrZ2fctztjM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97JxshL09EykikuVLy+TEx2ahxglZNsYcqeRYEmB30g=;
 b=hVLWt6TzvJrKCX9zPqwt3ednig51XNhPY8M5Cja3Px1B//u87nv+RcxnxxEMYHbX8M61m56MhIrz/fLLfTS04pjlTeyOXCuLnXSWAuwbsoucTb0rb0eDMBXljZf8i8KlFijW6C68/ggD6fd7QDJgXCB7qz2BL/kz3qZn/Gi/ZhjPTO+dy76UJw8Fr4cchyoDlFY0gSjvrJOcHa3aj3Ij1ZNC/IgocGCF4Ln2jO3dE7G8d0N+LRKWoN2KGxbiZr2ojRQY6SLBuQSI85QwDzOJafYw/vf2IrC5GwN1NkjlmJF+s9/lCkkA5cTT7c7+bCqSw1MVanw5fbUvfr2IbECHlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97JxshL09EykikuVLy+TEx2ahxglZNsYcqeRYEmB30g=;
 b=tqbVQ0IKLrk85+mlSryIQTVWMkrtObGfd7y3W2I8y8Hgrsw2m9x+JinB51z/zDk4mNjuxVE7d12EYisoAgbT26fgRl3lwBsB3k1po3qZyGzR6ZnpV6cu6gCXhGQDRlBCL7aw01NGgbPtJPTz0TOMkHNCibiobKdrvzvjUH/bRpE=
Date: Tue, 30 Nov 2021 14:49:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 04/18] IOMMU: add order parameter to ->{,un}map_page()
 hooks
Message-ID: <YaYr8bY+yUDATyR0@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <7500296c-588e-983e-35ac-39048a72cb47@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7500296c-588e-983e-35ac-39048a72cb47@suse.com>
X-ClientProxiedBy: MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e975032-fbc5-4ad4-2a74-08d9b4084292
X-MS-TrafficTypeDiagnostic: DM6PR03MB4971:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB49712E1E4422E507A3FD2A868F679@DM6PR03MB4971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1PE+GkO3q0oBzP3Fx+X2rtFO+huaK/qExyzjSTGsPa0I7lPERMlYjz5WCodNtBGxe34lYTsuWMnydTBUGiGjQuMkzfyoPgHAxzjvCl6EXFgzA8u93yZZsxDo+haq7dqHDa4wisfd1qLkImDEc67bk/Yr29ZA90gxWXh6MKAnigIyTBmlRKRfvaUEiYa6lOAc6D2a/aE302thDS2IfV37iRAw1RKE4vYuuvteYNtOLDgbtRDt3CpOoi6xZ/cGuxXyGESDPyfllzg1REINOTqhe6uEJwEioM27x02S/lNe8GNAYGRlUg3gQLr/qbLRb4U6wFwfZ7EL5GLFPvcN9B3lmcg6hLD/j0sgzP2coGYgFkUW1pfNPopnAwe26CRiPspeiIXauh6FyI3Wts3K+U54jQ1D2y6V3/i/sPkjPkXMW0Slf+v5R/9Y57D/OVAmZgQpJHnKIT5ICvbxRFeCDDUcH4PrJxo67QXWxSav93EnKrm0kc18PaIxE0NUJs21+OZEl1yOmLzdD4ItLRYJGjz2KQnEtq5k+g8XGck2UsKOjEed8Vd4tua9eBckafEbn4MpmGDvn7qWkOPpb0TnqoaviDnTGua2VCf3l8A/fIWbI5Zd+lKjp4F6hao1hZuEvu8g7RYZ/nmGf0Xo87W2INEVu4+cLLGJx0z8MuS08di7SaTXxGwP2/nCEmmwZ00RvH9lF2v3Y7OFsbAqFuqA6pYZyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(9686003)(316002)(86362001)(5660300002)(186003)(956004)(6666004)(85182001)(54906003)(4326008)(38100700002)(66556008)(83380400001)(82960400001)(66476007)(8936002)(2906002)(33716001)(4744005)(6486002)(66946007)(508600001)(26005)(8676002)(6496006)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVhSFZERWU3d3NFRmgxL1hRcGtwVGorR2VHZlJHdWFIc21BWStBcHJ3ZjdT?=
 =?utf-8?B?TXF0Qk90SFdERlZzQ092aE5PUVhrRGRtRkF1TVpwZWhlZFI5T0RhNEtYSDlv?=
 =?utf-8?B?MDhTUlVJRm9nam14Tk45dW9PUkhOSTAvbC9kWTNaWjFpeDQ5Nlh0OThUOUht?=
 =?utf-8?B?SVk0cklOYUtVV0Q5TkVQN29ZN2V0T2JPNDlCYkpwU2ErV2ZaZEZXM3grcGpI?=
 =?utf-8?B?NmV0VVl4VmJzWmluTGJ2U0w3TnZMd3FvaklWOFpSTHIxVG1VMGFzdUF0VGhm?=
 =?utf-8?B?WXQ3Z3B3MDFIV1lGRWl1eUxwSGlmTFZGZWs5bjZMejhNK21LbTg4KzM3UXA2?=
 =?utf-8?B?b3VyTCtqVU1pVjRIZjhOSmI4dU91L0RUMmg4a0kzRzdZbmRNTmxQOHVYSm9r?=
 =?utf-8?B?eDhWQnVXdURjc0RVa3IxeUJUWFR1QlhleHFmanAxTG40NklSdlRIbkMzV0Fr?=
 =?utf-8?B?b241Vk56VWdpajB1aDQzaVZCbE1pczRVVzFqYzZwWThaTkNFK2ExelV3bmt1?=
 =?utf-8?B?L0FPSkxUZ1lraW1pbHQ2MFVRTnllck5aY3RtNFlsc3BiYnEwWWk1T3NtV0Q4?=
 =?utf-8?B?R2U1NTZwTnJ3akh6RDQzbHZHQ0NER1ROWlNUSEt5NENoMVp4a1E3VUVuL0pH?=
 =?utf-8?B?OFVlRzNqZmhIUC9aK1FobWtyL2pvZU5kL205ZzU2YWxxL2NPa2Zzc3BMN0U1?=
 =?utf-8?B?MnM4aFVIR1hCVUJvbmhSbkdESlMwNkFuTE91amxsQWpQTW1CVmEzQ3o1SlAr?=
 =?utf-8?B?UzBzOXNTSFVUK2w0NEhDU1JCREQ1R0tTMzhBUzYzUnRtMnhkdUx1Rm1GYnQ0?=
 =?utf-8?B?MTJOSTlFMXVwTzFGNXZOVnZLSHdWbDVkNFZtVk1KbEtJSThIejNma0dpbjZk?=
 =?utf-8?B?NTdRM1hsb3A1K1pzVm5pUUhzd3NlOWJ3eUt3NERZZDJXVkdmVkFMVmZZZkVR?=
 =?utf-8?B?emhuaE91SWpKaVdBYkVSdjloRWFITFRlR2VXQm1vOWxQRUJYRjRPVFRZOWVv?=
 =?utf-8?B?WGd4RU1hd1AvNm1raElEYlFYZnBwRWFJalVmZHVYNlRrd0hlUmxJQklFMFZC?=
 =?utf-8?B?Y0hMTTcwdlpUSEFwQWE4cFlkK0lnM0FGd2x1K09aWTgwY0lOOFMwUXBKcUpD?=
 =?utf-8?B?WU1MblZZN0RJZkV2RzNObWJPQ1RqemJrY2xaWE84Rmg3ZXNCc0RZWWNYTVAw?=
 =?utf-8?B?WUpHdS9SV3NOakZ4eTlsb0UwakdocmY2b2VwRk1VVGFiTTRzZnQ3MVM1T09R?=
 =?utf-8?B?V1hGRzVtU2Era3FYTG1vRnE1NmoxV25EN0FrdDFPQ1F5dlVCc05oZFAxQ3J4?=
 =?utf-8?B?VDIwaE9ubGVBQWZhbFduTzVCOVlxblQ5THkxVXFLdlpjTEphcXR5d0I4TVBp?=
 =?utf-8?B?VFJQcm04ZkdtT2RkcEQvRFdnVTNUcE5LQmhiRlNkZStkZ2FYZ1FYbzA5bGMw?=
 =?utf-8?B?M0VyM3NDTlhXb3Z0WTFYa3VjRDlINXZOcXozYmVqWDZMSWozVnZjcTBjSlBa?=
 =?utf-8?B?SzVWeDRKVThEejJ6TFZFVVE4eGdwQUxieWxMeDI5akRNSllnUDJpbTZkcU9i?=
 =?utf-8?B?bklxemRKdmIyNVcyRFYwSDZyYnJXcTJCNVF5NGxtZms5WUwzWGFTK3ZFZE1s?=
 =?utf-8?B?Y3BOWDBDNFlTMnQ1YUFZZnhPa2NoZHROamdYWmJzenBTbTZmcTR3Zy9qRVRV?=
 =?utf-8?B?K2dHS21NRFFpcHJnblRPNXliZjFQVFgxUU5sRDJIRHA1VFE3dGw5QkswUVNI?=
 =?utf-8?B?RXl0M1hPL0M0MkFCWHBUeWJIZ3oyVkdwcHBTZUJ3M0hkWG55ZEJoeU1TbjlW?=
 =?utf-8?B?cmU0cmlXZ0FLNy9SMVV3NTh4QXY2Y3RaOEdKZjNCeEpxVTFCUUpVemhqT0dq?=
 =?utf-8?B?MUZVc2MxYThrUHpUU0lsZFJGd3ZMREZGUHFqOTk2Yld6SDlHNC8rbEFDSzFX?=
 =?utf-8?B?WWhxVXBucFZzbHg2WXRHTzBMLzFiM1JmTllucksveW5BeVdzV3BScU5lRlEz?=
 =?utf-8?B?K0l5cllNQXJzdmZUeWRndmR5Zk1LTDF1NFh1bXB6M1JyWUNVK0dBUzZxTjcw?=
 =?utf-8?B?SGNWUGZZNCswTk1mWU9WNCsweTZienB0M2VBdmJxV2l5Qy9IMnI2SEJjSVFX?=
 =?utf-8?B?QitnWUNGWEt3QmtvYWJ1LzFnaVAzelJLRVRhSjZTTkg1T0g2dmx3Ly9Gc2py?=
 =?utf-8?Q?992vgpK7suEyfmqd/fYnqrY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e975032-fbc5-4ad4-2a74-08d9b4084292
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 13:49:42.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzmCG3YdKBUHY1Z9SPu/ado20UqGyp7mSCG3jq1cZrt4/uXC02+urIO8o0jqs1x70LK4jOmZr/s1xqF6Jn9S1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4971
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:44:50AM +0200, Jan Beulich wrote:
> Or really, in the case of ->map_page(), accommodate it in the existing
> "flags" parameter. All call sites will pass 0 for now.

It feels slightly weird from an interface PoV that the map handler
takes the order from the flags parameter, while the unmap one has a
function parameter for it.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


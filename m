Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9C4CFF36
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 13:55:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285994.485305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCsm-0001QF-HD; Mon, 07 Mar 2022 12:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285994.485305; Mon, 07 Mar 2022 12:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCsm-0001OJ-D0; Mon, 07 Mar 2022 12:54:36 +0000
Received: by outflank-mailman (input) for mailman id 285994;
 Mon, 07 Mar 2022 12:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRCsk-0001OD-P6
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 12:54:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bad5ee64-9e15-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 13:54:32 +0100 (CET)
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
X-Inumbo-ID: bad5ee64-9e15-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646657672;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=1D/2i18TRwfN1jVi+Ba0ny5SLfpW8SDuGNPWRheWh8Q=;
  b=QV6062eiBPafksP/5QNRyOCVIsq4HE6CUbEK5t7Z8FzFDWSiCxkQkQHf
   saLyfekSLEC9VxQUzadj/lvpio+xOumeAUAmxKX2CfGTALrtBkvVD0TbC
   cCbLgZ/lK6jUZ4021ZPEc3TnCmbJLRH4BnnEeRQ4z0f9wHIhrn7UZMlCM
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65082412
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BHWwlqyYKHsose6Tcpx6t+cnxirEfRIJ4+MujC+fZmUNrF6WrkVSn
 2cZCm+HPq3ZZWvzetgkbt7j/UIG7JXUz4RgHgprqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliZKuaRkkbpP3suk2fjQbEDFiDPJN0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0WTayCP
 pBxhTxHPDTdZj9VGFUuKY8gu8u5n3faWh1RkQfAzUYwyzeKl1EguFT3C/LJet2RA8RO2E/Ao
 nnB+Uz2BxgbMJqUzj/t2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyzqXGEgaQ25/U/Yrn+IbBj86y
 m7WlPq8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBj3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwPpU
 JsswZH2AAUy4XalznDlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJ2K4P
 heM4lMBuPe/2UdGioctP+qM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlOniHqdNIdAtSRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:zRBQAahyz7Lo5iUncIyZLHAXLXBQXyx13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhR4tKPTOWw1dASbsN0WKM+UyHJ8STzJ8+6U
 4CSdkANDSTNykCsS+S2mDReLxBsbq6GciT9JvjJhxWPGZXgs9bnmJE4lHxKDwKeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+zLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfgWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MH40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIeLH45JlO01GkbKp
 ghMCmFj8wmMG9yLkqp9VWH+ebcEkjaRXy9Mwg/Us/86UkloJk29Tpa+CUlpAZwyHsMceg72w
 36CNUZqFg3dL5vUUtcPpZ0fSLlMB27ffrzWFjiUmgPUpt3eU7wlw==
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65082412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwpa431UfSVJcrrhS8eaQJgi/v2r+D4zOqTmrPjoHa2Sqmv+M+CdITJcTiNjwBRlzz9uE/K3o0AvAAmLKUMo7yvj43iZgQx8knSJ5E7PsdhGGSkppTb1AUUPBa6nqMa1Umn6TQOuS/8zYt2sL2odm/VXjbUBASpxw/Sb0IYVX+h+g6o+j0z8HmNAAr/YxKS98RtNVl1mrAGctwXVBcDdgU645iLexwxkK9Z/mmZdUCBoEL5wlBqgXEndZNYVz3Rt+d1ySqmFZBEfWJ6BZAIBWGNcmr659HYsbq8Wp+nQ6ziyGDSAmCUt810mukD8/MUCyY0TuD7r3UpqI4XMn0HdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faQe+RKeQDpG2+OeeF6Y6gflGnNZ4uulMco+3ISpJvs=;
 b=CL05k2WWaTvfWSfqvNxWQciJ+yG01sBgN2QEj+1yOhC9/m72mSMpyrjWpV1eLmwdqHqAEgmcQ44G502FQJ0H2n7mpE5xHnfNmap5TMJt1q2ro7nSoviLgq/ISRqnAZWfbChZ+xErQisr94HhNpZ7sMyEV2fkdEnk9N0RVIYBf9C/WTEi/WQOModPfTqbQxn+si9taWBMIzlMHyDCcIzda1ROqLr4usm1rGi+3aCBkIx97ycNvBiaA9tQNK9rQz1hmByEAZDWAydC9ZwIvmmE4QIBp5M5+zC4PE6WUblXM3OVgYNZ2g1dfdbXQXMCEEJr+qdz+zdDjkprWoEF1CoD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faQe+RKeQDpG2+OeeF6Y6gflGnNZ4uulMco+3ISpJvs=;
 b=sv7zRmJ0PLg59X/yFTUks7JUEVw/sYFMw2BWyeVl//O6dS2Js6BsRzLLUdZ7C4ujm+ZonmqFBMA6kNjrwPpqg0L2EcDOSYuQ1pXZ3TQrROatg/+01NPUJMu4nSpAlFuQk9r5mKd3fSJvW5VvLnJLGJWYu7Thb+hAQKF5vYIncr4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Alex Olson <this.is.a0lson@gmail.com>
Subject: [PATCH v3] vpci/msix: fix PBA accesses
Date: Mon,  7 Mar 2022 13:53:47 +0100
Message-ID: <20220307125347.71814-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78d79ada-db63-4847-214c-08da00399c59
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6303:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6303AE71A3FCD2FD72E79C948F089@SJ0PR03MB6303.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OX1/3sxkl20zkZMY96hVt/VenEvrj4qNO1HdNMFZ18yl6LH0jAEhMbA1OxA/juJD0haN1sxaIyKpREl8gvMr9msj3foXQZrY23RPELNZtN04Ce3hG1vuaBRtq2rFmIZ5sSCG2FbUfFjzIK0yjz2MnQxmLCAB60bY07APSfVJcreAXl9EPeDNTMj1mHwjxIHWm0Z5rgnxrwr/t3Po3ny1DpkWqPGEIz9HIBcs1Z4c4iXRQ9QS9dhhvl3eqfSoD1j4eVnODY/Fha/NiSGcfe5SkF7Fq518oUsGuM/ry9i/eDxwbFl8HZm7O/FFdAmaJMci37h3F4UY3Eb/qZHAlJkhgFd1fI+OdaE09liiJtjZzzHlXlh1UP4pWAdAo5xp38Mv6ixp7l7JaGeuTvilXDQbaEl+vT0A49Z69uDTik6DCwFzs1torVtTMaOr4IKazqdwZk8+vu+3GJgGQxq8ZFZYnxHNSnP51isAdNvZkfzuN873FsUbXP5pDVAqana1wyU0vr5XtHlaHcP3NTcFzh60D9lgUHst3ChOItTdj+X2xjcUeZ/cZPIMP10/YEd8rTDmVVJrNVp7+KcuBuYod/HfsoViOFv8RALbmA2w+9F8j3dvWWBGQl+Hh0B6Yx6m8iW/UpMW/50V8DibK/wlHUnnog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(54906003)(83380400001)(186003)(26005)(86362001)(2616005)(316002)(1076003)(5660300002)(8936002)(36756003)(2906002)(6666004)(508600001)(4326008)(8676002)(66476007)(66946007)(66556008)(38100700002)(6512007)(6486002)(6506007)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFZUXF4SXVtWVJaVkNtYVV3Zm15RDcyblIzUDRYZWNNTTM2Mm5DYmNzUWRU?=
 =?utf-8?B?VHRXb2tPam11S0oydnl3T24rNFk4dVFJZW9HWW1FaDZzK3dFaXdvQStnbDd0?=
 =?utf-8?B?U1N4aTF1K1VVTGEwYjNvSlQ3c2x3ZTJicnh2QlVGZ01YVVlvb2tPdXhFZHN6?=
 =?utf-8?B?cHZod0pvQlhSVk44d05EbEVURXZTMy8vY056OG9Ua3Q0WVBWU3dyRWI0dmNZ?=
 =?utf-8?B?T3NRWkp0YUhrVHl1RVA5UGQ4eGl0OFczaXorOHR3QmJicVR2b2ZtcE9keWFU?=
 =?utf-8?B?dU5mZm9Sb2hvcnlaY1FGaUppTDdZSWRVWEk0bXVvZDNya1ZuRlVpOERxcGdw?=
 =?utf-8?B?VzBCTEs0RHJmaGZ4b1pBYnZHS3djMlRiajN0a0lwZm9jbVhIQjJOaGw5ZU0v?=
 =?utf-8?B?a3NHVHJDTFZJQ3RPVW5ScDF1NVA0ZjhXbkM3OUkySDM4U1AxMmVrOEJyQ05X?=
 =?utf-8?B?WXM5R3I4eVNScXl2WFM2WEhrNlBaNFpvS3pZRDRpREVrQ0lDM3hYV3FLbk8v?=
 =?utf-8?B?d2tGcjI0cDd2S2Z0Z3VydVFiTno1aWNUTVN0dENmOVZtdGtLdU8vMVFSUXRa?=
 =?utf-8?B?RjNSNDdhVmFLcnllL0QwSFgrb1ZQL0pnMFQ1ZThjNGlyanR3V1dqTW9SNW9k?=
 =?utf-8?B?NXNtMXlMWnR0K3BDQU5pMDVmdXJ2V1pWVjUwOWU0RlhoQVBQUTJMTHUrWjhV?=
 =?utf-8?B?eWtLckVBejJYazhHbnZTbTBKOWxCSTVPR1ZLK0JDZEhLYndTVHFLbE1rUGtX?=
 =?utf-8?B?K3A5UGd4VE50MkJqT1NLUmNBTXViT0VhMG9UbG9kUVdEZ29xTHp2UEU5TXJW?=
 =?utf-8?B?bW5WQ3hMeUh6TjZIb1pDRmliZ0t5SU8wVVI1TVo2WkFEaGVqbVF1MmpYVW5o?=
 =?utf-8?B?eWNiKzRrTTdqeEhKYzh3RlRYdlJLeXBQdG1BaHd6dytabVhPL2gyc2ZCZEtr?=
 =?utf-8?B?cXRJbnNRbWg5NU5rNnJ2cGE3ZklKam9hWmJxWEF5KyttWW1hUUg1ZkFWQXIz?=
 =?utf-8?B?WU5CNzlHUVNiWkNGRzE3cEgvN3ZzYTZOZHgvdVRaRDRldGFqUUNPREJLdVcx?=
 =?utf-8?B?aUtYWmY3QzVkcFdzZ3B4anpnVVRnTGZMdlk5UEJtOFUyYTIxa0pFZ0RlT1Rh?=
 =?utf-8?B?M2hhaTAwdkV4emlLckdYaHVQRmVsWC9Ga3ZFTGtSZkdSTks3cC84eDY3NW12?=
 =?utf-8?B?R3lUOHpLRG9aa2JORExnK2lOaTBsSkN6VU9INnlmSTdvRUR1VFVKWS9VRDN1?=
 =?utf-8?B?dUtQVDZIUGtvVWptVDhCUmVIOE9uSi9hR0U5NVVMUGpzdThYWG4wa2xDaG5J?=
 =?utf-8?B?dzM2dXBXTkkwMy92NXNXZGNyRzhabUh5L1RZZmpiandSaXcwcHc4ai9BZmNS?=
 =?utf-8?B?dHFIL01xY25tTnZ2MlZMUERQYjlTeXN6VUNQbWhkK1N5aGQ4L2E1QjRKQWcw?=
 =?utf-8?B?WDRHOWc1U3l1c1g1ZjhISmpxdTFrMFA4cXdDbjl2Y2tCSXg1OUI5STEwazZX?=
 =?utf-8?B?dDJKV3JBdDR2dVpUSjhHdjhEcHY2NDdOQitwK0Z4TXBrd3dpWWpoY3NTQWFu?=
 =?utf-8?B?eVNtZGN3RHoyM2d4czNhOHYwUzd4aDhYMkdRS3hCc0tUZG1MeXhRaldzQmhD?=
 =?utf-8?B?V3Nta2RvUklHbVVJbkQ2bVBDWGhpTmR0SDFjMUZJUWVld0NWQnlGZ2hIZVIr?=
 =?utf-8?B?bnFSQSsvd3BEOC83M1pWYzc5MDVoT05nNnJ5Q08yK00yTk5YSDZ6Q25OTk5p?=
 =?utf-8?B?ZWhxbTFlbTE3c3FBWitpTUhQQ2pIcFArcitJZ2poNWNvcmpyaVppZnZia2tv?=
 =?utf-8?B?M0JtL2NlZWV0UHQ5MElYNVpTRjJ2R0R1WkxuNGhHNGVQWVZmVmp6LzEySit4?=
 =?utf-8?B?TjJWeVVuemdLR1JqWC9lQldMVnBvRm9QRzZPUHhWd3NmR0o5WUp6M0llcnlY?=
 =?utf-8?B?dFZoY1czaW5WWFFWdkFsTUtERFM4V3A4bkxnM0RoSG5yRUcxOTU5bitiVlUz?=
 =?utf-8?B?SzlodmVsVXN5cjNyb25PNXBGUFlraUhuRFh5ODQyQ0xwSlB4MDJWT3piMzFx?=
 =?utf-8?B?YmI1SHF1eDdkUkEyd1A5L0U3QUc2enNDNWV5RkRVbWVqeFVSeVVtdDFYUS9l?=
 =?utf-8?B?UmtXSXpPTXZVZHRLMXRVb1BJc3o2MVVxc3I3YU5EMkFnT2pkSk1FQmt0MVFp?=
 =?utf-8?Q?jMRnK12045huDq7/mm+xrUI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d79ada-db63-4847-214c-08da00399c59
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:54:26.3662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thLYmyYrI9Wj5gZ9F1ZdedACQmhi+QwV2obXqxDsOlU8zSjp/1EMJceeab9zZXIjFv/3Pf0th651j9OBybwrVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6303
X-OriginatorOrg: citrix.com

Map the PBA in order to access it from the MSI-X read and write
handlers. Note that previously the handlers would pass the physical
host address into the {read,write}{l,q} handlers, which is wrong as
those expect a linear address.

Map the PBA using ioremap when the first access is performed. Note
that 32bit arches might want to abstract the call to ioremap into a
vPCI arch handler, so they can use a fixmap range to map the PBA.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Alex Olson <this.is.a0lson@gmail.com>
---
Changes since v2:
 - Use helper function to map PBA.
 - Mark memory as iomem.

Changes since v1:
 - Also handle writes.

I don't seem to have a box with a driver that will try to access the
PBA, so I would consider this specific code path only build tested. At
least it doesn't seem to regress the current state of vPCI.
---
 xen/drivers/vpci/msix.c | 59 ++++++++++++++++++++++++++++++++++++++---
 xen/drivers/vpci/vpci.c |  2 ++
 xen/include/xen/vpci.h  |  2 ++
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index a1fa7a5f13..fdd406e309 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -182,6 +182,33 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
+static void __iomem *get_pba(struct vpci *vpci)
+{
+    struct vpci_msix *msix = vpci->msix;
+    void __iomem *pba;
+
+    /*
+     * PBA will only be unmapped when the device is deassigned, so access it
+     * without holding the vpci lock.
+     */
+    if ( likely(msix->pba) )
+        return msix->pba;
+
+    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
+                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
+    if ( !pba )
+        return msix->pba;
+
+    spin_lock(&vpci->lock);
+    if ( !msix->pba )
+        msix->pba = pba;
+    else
+        iounmap(pba);
+    spin_unlock(&vpci->lock);
+
+    return msix->pba;
+}
+
 static int cf_check msix_read(
     struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
 {
@@ -200,6 +227,10 @@ static int cf_check msix_read(
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        void __iomem *pba = get_pba(vpci);
+
         /*
          * Access to PBA.
          *
@@ -207,14 +238,22 @@ static int cf_check msix_read(
          * guest address space. If this changes the address will need to be
          * translated.
          */
+        if ( !pba )
+        {
+            gprintk(XENLOG_WARNING,
+                    "%pp: unable to map MSI-X PBA, report all pending\n",
+                    msix->pdev);
+            return X86EMUL_OKAY;
+        }
+
         switch ( len )
         {
         case 4:
-            *data = readl(addr);
+            *data = readl(pba + idx);
             break;
 
         case 8:
-            *data = readq(addr);
+            *data = readq(pba + idx);
             break;
 
         default:
@@ -275,19 +314,31 @@ static int cf_check msix_write(
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        void __iomem *pba = get_pba(vpci);
 
         if ( !is_hardware_domain(d) )
             /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
             return X86EMUL_OKAY;
 
+        if ( !pba )
+        {
+            /* Unable to map the PBA, ignore write. */
+            gprintk(XENLOG_WARNING,
+                    "%pp: unable to map MSI-X PBA, write ignored\n",
+                    msix->pdev);
+            return X86EMUL_OKAY;
+        }
+
         switch ( len )
         {
         case 4:
-            writel(data, addr);
+            writel(data, pba + idx);
             break;
 
         case 8:
-            writeq(data, addr);
+            writeq(data, pba + idx);
             break;
 
         default:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f3b32d66cb..9fb3c05b2b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+    if ( pdev->vpci->msix && pdev->vpci->msix->pba )
+        iounmap(pdev->vpci->msix->pba);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index bcad1516ae..67c9a0c631 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -127,6 +127,8 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
+        /* PBA map */
+        void __iomem *pba;
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B664247C104
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 14:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250432.431330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfY1-000719-Dt; Tue, 21 Dec 2021 13:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250432.431330; Tue, 21 Dec 2021 13:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfY1-0006zM-Ad; Tue, 21 Dec 2021 13:51:21 +0000
Received: by outflank-mailman (input) for mailman id 250432;
 Tue, 21 Dec 2021 13:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w49/=RG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mzfY0-0006zG-6q
 for xen-devel@lists.xen.org; Tue, 21 Dec 2021 13:51:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f9bdf67-6265-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 14:51:18 +0100 (CET)
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
X-Inumbo-ID: 0f9bdf67-6265-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640094678;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mLUuyYgh1ENVwKR1L/hg//jSLwLUQn5DQVr5oWVxwI0=;
  b=NPuRHdSLf9/NKaNNMppLvi48Nrc4tHeent+VHVYOdjWO5Wfg16R7KqZP
   IK1QA7ZEbTbgq4HumLMpmVmDRA8kKVtbWXPfeeNGZx5V8Si6FW55IF3Jt
   5fKlpfeWlVTLYVMp9IFz+2OfL9cAO1A5cwcT22FK9dAqgFe2WIOwIOEjA
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PIMJ1xatvSClbQ/gExxd5s5R1j+LqADOcujVm/0rxln1jqbv70ezjdPkC0ncbBxxXsIVaaWyjl
 b62mIKMFnrQnXxa9pzjyVjveNbrLB3dlgWxDJ6DjWN3v8/K/bN5nID2kAAuiF0JWCU60loTLSq
 A0mWi/2ur11K4W631B0qcaqwDLViCLYSchBZYOOdw0Ozbl23qDnbcDiXueSGc8ueqYth3k2kRj
 JA1cnKMhZZJ/L3UMt7JI41jLU1hDo4OIT37glf4AV5K6wEbDYm7HGX+mn4Fyyi4yxTpLNcwQpG
 BNXQR13Njw/AYZbzXjtHxO0E
X-SBRS: 5.1
X-MesageID: 62594793
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LIA/fqsC06p1GKn8Pj3HcOnaXefnVIVZMUV32f8akzHdYApBsoF/q
 tZmKT3Qa/2MMWunc9giPYq29U4C7ZbRzN81SAI//yljQyIa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy24HhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnLOMUQxuEYf1w98hQxkEDTBAFpVW0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JoTTKqBN
 pFxhTxHTzPFXD9mZg8sGcgjg8awuXPWIjZikQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcctuFxlKt/HO2i+rCgS78QqoPD7Ci7bhxh0CJzWEdDwcZWB29rOXRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFerggYXHPV6KrYB1BGNlrTF3S2hFkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8oDGJGT9bxgbQ+0RqmBNzBJrVml
 CJb8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdgIumwheB0waZxsldrVj
 Kn741s5CHh7ZiTCUEOKS9jpV5RCIVbISLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwlTITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:3Ik7lamcZOxHyOyM4zSrYjeJ8HDpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.88,223,1635220800"; 
   d="scan'208";a="62594793"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhjAHBoPzWOdIy3KVZnwp13axeUcRqUjYoVHWSpFeoBRXkR1hfXyFLWYPzpF2IX05WhFHZsousnw4vxU2zBfnE/lySMCQjGybCQsVTKlDPamlEgHg5PX0EBfDgYhqyqdLyDCfxFT+pCaIFLIKlZiuUMFjy3VDuXrGQpZtCzVjTzIl0GM/Xf2uz14aQzwakd6IoWO9LBRLPL0uJfPVmGCXr1lHa/ER3sSsLl62LeYPtBLV5IUfR80k0sHiquIZLCwQ57aFNOsWkYIEelL4XeNNTiOfUEMXoC2RjP8cHhQ0a5imxDm5/wlI5Mux6zNoaRsmjPyayZDqqpdsNog0iJmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aPr7tAxVoIO109CZE9Sx2d5M4gRuBgasxla9D/Qt84=;
 b=csmCvZkvUIxQShQ1rGKfZITEFFalu/o2X73RZgU+yUIUdOKLuIj5N+h9inzoO/JsXDJAZAXFBJMczZSqHZVl2MNamakFMmhLQINIKGWoWZmiIPYJhQTmLJt/SEvdejCWNsKbkvriEgO2aH4XVDmsr56GvHOH5gIRIUOZTId9H+5+nCO8Hb7WoPWkCgbT6AVUyAm58W45wsGqWrSqCs0rRzP65YxQ9FKBCR400D2SpmU4Lg2xcbKs33M7XB2i1se572W6haSaSy3DAG/yosF3VfQwAJCxkIBJhjO1taj2g2nI+kGq2TIpa7TRmTj8l5VenKSWQdpnIN4Vtt+9HbENGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aPr7tAxVoIO109CZE9Sx2d5M4gRuBgasxla9D/Qt84=;
 b=AuIdrLYYGgPmFyAy3isXQ4Fc8zYRoOor5OZgdX1kn8bOVYp3ilOTb6B/Otv5bWTTaaNNmVhjmNefGzn1Vy1vSPIeUc4xkDZ50LM+ajgpXseHbtauxBOx1vKCZFNtxvbcWI2Y63bm9791Pn0u4hjRmaaUQ35k0yqdcJ6t8DUMtwE=
Date: Tue, 21 Dec 2021 14:50:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: xen-devel <xen-devel@lists.xen.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YcHbuug9AECvKXm9@Air-de-Roger>
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8764393b-2aeb-4770-15d7-08d9c488e9b7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4539:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB45395F044B3B3F60ABF70F758F7C9@DM6PR03MB4539.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: otliLXFBC8BaWx8q3BpByYnEzqpo7MV02MOHBuIhaNQ8wrRrcLd3Z85+xb9D7GGZJ4QcrAjRByc035sGxoh/t1jtQwHjVthDtNBtBEPlOrgWtd235/JPVGdgjkmwUPI6M2YTx1nhLM+z+/B6qkl5YY+T9M2rfYAF7gNNFLRai26GLVSI1sPwo29LjSSO2OsABQfVoFvbWleHFeB9Hj5OLrIUc+CChES/lsKCBigxwoWQV+fk/QkNzGcG+7w+uXftXiZIesi1jtKk3UaQhOqOb4xsnuXaHxrtvbc+cNL2+i8Bl0OlRBqLATK7M+sDfr2bPr8LvPQ9OnbSpBs/HCcZ/TlX8vfFF0j1kY0SBxQT20LD99URm7xJL9Cmvvx0w+ViAAlxGfa4+dcr/HAiDkwUUHbg//F9a0E8tzV4lKLU/EPak4+pyxFIsD5UnKp2dUZDtzIJrYAgYwjRxRXqIp02uRTTemSLsx2gbqKtwPMQBT80tA1Cbsa7dgtxR++il/nutodSGMva03/iOc5v46fvHLTN2VgbxJ3K5BMiMN9fFS/01Cml+KMEZyIFsexjSp6szlugxkjiAhG8e8tLFro7xbBbGKZCQsYNaKrttOQRoRovq8hkhXk6iM1LzzlfibpcpEE/3WQJX3VKtU4Qf5J1Cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66556008)(66476007)(66946007)(38100700002)(86362001)(4326008)(5660300002)(9686003)(2906002)(186003)(26005)(85182001)(6506007)(316002)(6512007)(6666004)(6486002)(508600001)(8676002)(6916009)(82960400001)(33716001)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkQ5cjBlTlhXUE15ZnlBZWRzVDJVYUdhNkxpU3FxM2tKMDRLQUxMNkZtcEV0?=
 =?utf-8?B?OEl4TFdaQkUwM1NKZVJGZlowZnByd09jLzJhZ014bjdJVCtwcWlUQlVyc29L?=
 =?utf-8?B?WVgwYTI2U0hKcGVPdGNWbG00NnFMcGU4T3M1UXNybEdUQzlPMEwzc1JhRFVk?=
 =?utf-8?B?dDJlU3FEajF1ek01TGFRczlBSURyNFJUZXFFUDRkL1Y4RHJmdXdoeTZmNzlZ?=
 =?utf-8?B?UXRCODdGTVFnUDRwaTJJN3ZMN0d4VDU0ZjhwcUNMMFpJQTdTdjZYNkxTNmcv?=
 =?utf-8?B?UllOSzU0MmlTRnBXdFhXNnJaQkVpWnFWcFJsTUJJV1p6MEdNVWt5RzJZdTQ5?=
 =?utf-8?B?Zk1PQ0JGWk5iNDlGVGVzc0tWSWNBZTBoMGcva3pKeTlZa08xdU9YaGNmYUhC?=
 =?utf-8?B?OGtVSGVVejg0cDhEdTVobktQei9RMGtpM2dQZXI3MTVnYlVRbnIvMTA2SG1J?=
 =?utf-8?B?MFFVOHNuUkxuaVNRQllpcys5VTBCRHdyV205UWxHR0hXUWpNM3BSck9kSmVo?=
 =?utf-8?B?NnM1Tk5yaHBZQk1JN20zSVBZajBKRy9hT3dzNUhyRUtEbmNpMWJqenhCL3VF?=
 =?utf-8?B?UDlUZmpYNlNhVHU4UWVmSnkzTm1JY1Zsc1g2ZTN3bWovcGxnek15ek9nelUr?=
 =?utf-8?B?ZG1TWHZuR1B2dHFQQnM5cjNtSWlvVmFIbnlZYXZVVmVEWFBQNTNjcWlPcTQ0?=
 =?utf-8?B?Zmt4SGovdTJrWTFFRURuSXFKYWhIOUdqdE5tVDNSdFdzWkg0WW1BazcwVmJv?=
 =?utf-8?B?SEJHMUsvRGxwREg0WVRSQUN6MkE2RzVEQXE5NTV2RnBmUjBtUEE1di81OVBn?=
 =?utf-8?B?cS85YUtZN3JwUVBIM1Z4NmxPdTdUQjZPWmw0OG45RFhEQ1NyeVRSeEw1QWhS?=
 =?utf-8?B?eURYY3J3Qm05TlJ1OUo5bDZ3TENyUG45WVhaY3l0dXJVZ2VMUWxXbXpoQUFW?=
 =?utf-8?B?YUg4R243QWV0eko5c2pKaGpOdTRJZFI4dUV3R1RlN2xHTVZORlNJeDAyaWVC?=
 =?utf-8?B?VitMc3c1TWF1Y0FNWWVtL3YxOXR3eEROeFpsbXpGT0p4blZPbFk0cnF6dHht?=
 =?utf-8?B?SlhUNXRsc0ZsK2FtSlhGQWxLcUtkenZTOEUwaWFSYkNxZkpIZWFuMkF1NThh?=
 =?utf-8?B?U2VwdDRQcE9SMzQ2R1VuNlBlU2JPcEdIeDRCbkRpR1B2ekVSaFZSOXZIU2R4?=
 =?utf-8?B?NzBYZEhVKy9tOHh6M3BROGJ2U1BjTC9RNG5SZ2lIeCswc0RCcDdlRVZsYTc4?=
 =?utf-8?B?bFBQYWFqOFFtekh1S2ZtVUd0bFE0WG43RUJwazR0bDBPbVFCZkt4TTE3TWpM?=
 =?utf-8?B?dFZ2eGVHM2p5dTlXazI0alg5UEZGUnFEdW81UEVmakd0dE1jRTVMZnBEb2Yw?=
 =?utf-8?B?OFZuTkFVdDZxN2hZRFVNcE1sWGdKUG9oWEQwSzdUU0ZpQ2p0bmdodTJGc0VF?=
 =?utf-8?B?czVXdGppbUlWTzc3ZVZLdHVubXJTSUZMYXpIamRSbFFQM3FCMXMxSFRQaWJS?=
 =?utf-8?B?ZThHNURzYnVnNXY4czlIeGhFK0twVHdZMUNLdG0vUlN3djNmZEI1dEpCZEx0?=
 =?utf-8?B?ZW1MYWx2QWxYQ1g0U1ZGU3RJajJXNnRHSVQrbEJUakpKWTFFVDZGaWp2b2lJ?=
 =?utf-8?B?VlBjR2RtWlRnUFEwZTgwQUlPN25TYmJEV0JzSEVrdTBneTduU0FyUFdzQ0xQ?=
 =?utf-8?B?UUpoWVNhUnU2UXBreWFPYVVSejA3cUV6SS9yOFQ5UjdqM3I5WDczRVI3aFlQ?=
 =?utf-8?B?djNPeWMxSDBVYmMwTXY2NmJZWjVxOHVoajZZMzRqT05HZXJmRFBJejN2ZHNU?=
 =?utf-8?B?ZW5uL2IxVFdTNUh6eDhvcmQzTXdmN2p1YWM0YU5jOUpxTzJKSCtsS0REZ2l0?=
 =?utf-8?B?ZHNEanFnMkUxUmVGaE9Jdnlxd1FOQ2piY0RzN1M4b3M5b1JUVkI3SktwTHQw?=
 =?utf-8?B?cWozZFdxV3d5UWpndW9WMFZ6T2UrNTdQSDQveEhGQWJyTTlmRUJVbDhtWXNn?=
 =?utf-8?B?U015VlBrKzl4Mlc1d1YyZnJkM05HckUyLzUvNm9kSWhXZ0FEZUNLOUE1TmpG?=
 =?utf-8?B?ZUQ2MHQwQXNEM2lKNEV6UkppS2JXSnlMTVFzTGJuRFlPNW1kclFNYUxkVDJE?=
 =?utf-8?B?UUI4RGVmblFIVUFGSHZuRWRUVUF5UFd5MUJtaDNOK1h3TktGN0ZRY3hraVJ2?=
 =?utf-8?Q?VSCGJDbkoCT7CsRc38XdJ1c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8764393b-2aeb-4770-15d7-08d9c488e9b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:50:56.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo2gFOGOnk0owVatDKftp1ASqggDnsi+SEydKKLLySKWjlq9LKK77VnNgF+CzebofCZ7o/yOoTg46vKdTJV5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4539
X-OriginatorOrg: citrix.com

On Tue, Dec 21, 2021 at 01:13:43AM +0800, G.R. wrote:
> First of all, thank you for your quick response, Juergen and Roger.
> I just realized that I run into mail forwarding issue from sourceforge
> mail alias service, and only found the responses when I checked the
> list archive. As a result, I have to manually merge Roger's response
> to reply...
> 
> > > I have to admit that this trial process is blind as I have no idea
> > > which component in the combo is to be blamed. Is it a bug in the
> > > backend-driver, frontend-driver or the hypervisor itself? Or due to
> > > incompatible versions? Any suggestion on other diagnose ideas (e.g.
> > > debug logs) will be welcome, while I work on the planned experiments.
> >
> > This is a bug in FreeBSD netfront, so no matter which Linux or Xen
> > version you use.
> >
> > Does it make a difference if you disable TSO and LRO from netfront?
> >
> > $ ifconfig xn0 -tso -lro
> It does not, the fatal error still show up after this command.

Thanks for testing.

> >
> > Do you have instructions I can follow in order to try to reproduce the
> > issue?
> I don't know if there are any special details in my setup.
> Hopefully I don't miss anything useful:
> 1. Build a TrueNAS 12.0U7 DOM-U by flushing the OS image into a vdisk
> 2. Create / import a zfs pool to the DOM-U
> 3. Create and share some file based iSCSI extents on the pool
> 4. Mount the iSCSI extent through some initiator clients.
> The domU xn0 should be disabled immediately after step #4.
> 
> I omitted all operational details with the assumption that you are familiar
> with TrueNAS and iSCSI setup.

Not really. Ideally I would like a way to reproduce that can be done
using iperf, nc or similar simple command line tool, without requiring
to setup iSCSI.

> For step #4, I can reproduce it with both ipxe initiator and the win7
> built-in client.
> As a result, I assume the client version does not matter.
> For #2, I actually have a physical disk and controller assigned to DOM-U.
> But I suspect this is probably irrelevant.
> For #3, I'm not sure if the content in the extent matters.
> So far I have been testing the same extent, which is formatted as an NTFS disk.

Can you also paste the output of `ifconfig xn0`?

If I provided a patch for the FreeBSD kernel, would you be able to
apply and test it?

Thanks, Roger.


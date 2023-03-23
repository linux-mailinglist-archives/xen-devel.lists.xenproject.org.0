Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900586C6AF8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513916.795664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLxY-0001Lk-5j; Thu, 23 Mar 2023 14:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513916.795664; Thu, 23 Mar 2023 14:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLxY-0001IN-1o; Thu, 23 Mar 2023 14:30:32 +0000
Received: by outflank-mailman (input) for mailman id 513916;
 Thu, 23 Mar 2023 14:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfLxX-0001I6-44
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:30:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bdeb3a1-c987-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 15:30:21 +0100 (CET)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 10:30:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5692.namprd03.prod.outlook.com (2603:10b6:806:11f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 14:30:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 14:30:14 +0000
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
X-Inumbo-ID: 3bdeb3a1-c987-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679581826;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3i38bzmdLGCH8TZ+3SE9xdpT7LC3B7d7XeF11esEVKg=;
  b=MN8BrHPMaVtrqDmKu+PxCb6gcENgnlSBayUdX4t28yaqO2Av02nvZyKS
   6rCk2fchKstW9fcvt0rUe9aug5fzYFKO0+/kRB04TPgyByhLGzNj7xxPb
   LSnKCvFoqr8NIKfNv2yYZdMi/ltb+S3TGB7pceJmhAH/tnStZyok6hX+u
   o=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 100834531
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xTKAJ6p660V1Te0G+49/VZFJBpReBmIoZBIvgKrLsJaIsI4StFCzt
 garIBnTP/zYYTejf9xyPdyzpkwAu56AmtJjSVdsqH1mFXxA8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSJNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA8RSj2Kguen/KPhSbho3eQKBfn0MqpK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqY62wHOnTV75Bs+RVKD+eXpr0eFcMtNG
 WkP/xggrppp6xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRutPQAFIGlEYjULJSMZ4tzLsIw1yBXVQb5e/LWdi9T0HXT7x
 GmMpS1n3rEL15dVhuO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComV/lhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:EGWxDai3Pgfrv3gD/bxbFKp8+nBQX8Z23DAbv31ZSRFFG/FwyP
 re+cjzhCWE6gr5BktQ+uxoYJPwMU819fZOkPEs1MSZLXrbUQqTXc9fBO7ZqQEIdBeOitK1uZ
 0QFZSWTeeAfGSS7vyKvDVQcexQv+VvmZrA7YyyoxgCLGEaD9AG0+46MHfkLqQcfng8OXNNLu
 vg2iMxnUvbRZ14VLXDOlA1G8n7i5nwvreOW29YOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SKqZiAu17h/l6Wy64TtMrqy9NFCsDJoNMSMC/QhgGhY5kkc6GevQoyvPqk5D8R4Z
 nxSlYbTodOAkHqDySISCjWqk3dOfEVmjjfIGqj8DneSArCNXQH4oR69Ntkm1DimjgdVZlHod
 d2NiSixsJqJCKFpT/64dfQURFsiw6bnVoO+NRj1UB3YM8mc7lWopUY/ERJVLE6PAy/xrwGPY
 BVfZrhDNA/SyLKU1np+lB1xtqiR3IyGQrDfk84ttKo6B0+pgEl86Ld/r1Aol4QsJ06UJVK/O
 LCL+Bhk6xPVNYfaeZnCP4GWtbfMB2BffvgChPYHb3cLtBMB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8Wo/YVjnB8GC1IBCtkmlehTzYR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5/ESGNfSVf
 q/MI9fR/XjMWztE4BU2BCWYegfFVAOFMkO/torUVOHpczGboXsq+zAaf7WYKHgFD41M1mPSk
 frnAKDbfmownrbLEMQ2iKhL08FUnaPiq5NLA==
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="100834531"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnDd6HS1QaxltrpWsIxmVVm/uK6KvSRY7XuXRdTswc73MO7ZhMXoIHwAZm0Qwv0ExK6SDVFo9YagGKZ0nOnByHlsJOknVaHElfPGPKKrQb5Clr3fzYKJfth1LDYvHy3IcbKnG0THmoKmBFvcxfnCuoWrJ3OvY+WESQdpkJXhx7Bh5CauAMLjnkgLmLzzfHOW+HneZo8Qm2zJO2Qn0xUtPvOLGIKasFcRVU1sN1H77JaRgLk1aln8eIDMQPAWt83BW56yeyErXNLVokowKDg1/uyGWj4eQ52647LaCRHSct86xQpx3+No3U9uxzjAWpJN2sqAKkMjQJ+v3nvLjvvoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IFYq3fktJo5N4IqDV1lY8tYrnN47dNITp0LYdAAAaA=;
 b=Cj4Tn2mTfrF/nhEN8ap8A7HbMxhywnM/gSsDEhc4CBW3pcxufRctVb6pTYJ3qcfnUCwg3QiJW8kDbOCa2ucY8I+n+V7/ZKKMFEcBXt7WFJGWRfpoSI7KXGLK89eM/Uonzer705wK4/isL3MKEZvxeYm//+3pZeFOTS7N7jiEzLmnHUFn/Q65y20DsppO/G6bS5xOyA/w6VRrJ2ka6L+GraXdyVRkbOpZOhp2y6llcettgtxOalYVYsvw9Wet9guhmDAk3qkOg19frw16Jtx3CW5bVDtl6M5sV/RSH5xG09T2Q6HRcpTIcEwlj6SdLLdSM20EU00jToj6Jj3gCx8KYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IFYq3fktJo5N4IqDV1lY8tYrnN47dNITp0LYdAAAaA=;
 b=pNuj3ZX9p7ww1SltLZ5wwTuB03ByKKvz6sxndTdwZoCfHkNDI5N8P+XJ8vHfJNUM57dXy+ZLq+BNWSPbgT7z1P2eOlg5xurfRNRULEhdJEsfgI3O5w0Orr4vYmUC72HWC1tsxhc9cXkK4KJur5HSWRKKuOqP5OjJUdfrmwJBWx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <253e45ae-4b66-a618-6385-b0fa018e693a@citrix.com>
Date: Thu, 23 Mar 2023 14:30:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 10/16] x86/shadow: move OOS functions to their own file
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <88be7d2e-325b-2a32-fe9f-ce762bb7b606@suse.com>
In-Reply-To: <88be7d2e-325b-2a32-fe9f-ce762bb7b606@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c308c6d-3475-4688-5f9e-08db2bab1dba
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jdfxk7wadUoTE2hZjTq0akT+EH/j67UQ6nej2ruiZFKqSq2yRHOU9CzUFdnYV1ieXSqde/XQJ/nL5DBRjn3D8GIuvuVBthoAsNpjpNj0f/tTQcU5eeWaBKtln7n39LsmTEoiHUswo6hMJlKhZRqfMPJSGX2PBuMhN7LLbxldev6UDelMa3cc0zvutm3JMKJL4CTBU6sio00i/x8y1p3R+ZOIyuQUeFgjbMlXqPjggNILamIyhhQsxtfT+ZzErkVHGATg4WxEQmdNwXiHxO0CBoEXmelKlaFFXOQ8s0Skarf0WGPWM4Vi/VHI1Fqy5XKn07G/hLvKh5x/qQk36IRaO4kUzjq2qOw88hm54JiGnhCoIqmttsSKHRbjKhpkkcY6sRGC46fdtgPUxHJhJi9fr+ri4L+V26eLiGaXx7nRTODsU795yXoJVN6Rts3tDZOuOYaieolObm0XdPXJu15eaPfxDXPcFuILSkW9a31JAIAKoDeEItUaQGfNeUuPf/XWEuboNiIbVrCqKEQClzf9d06Ku6x2My309vyTWWVGDBPYokDKFj7W7YlaTJoUN3dSa/ma45cdh0we4jN+sjNQuCt22yYGmORPGEgZCTh8Tu0VE/bS7rcq5b742PsW+DxMZXujNosNvjw0xeB5BAL05ir5FzuWnXO3SWtqaxLpnSoNktVCBlCw30x2XU4hsWrUY9DoJIP0QUcyEc25usJnEhKiHPhHuSjjTtz/Kt1X12kFCj4N9/UuiToKVAMKFbsrL5uKHsEQqp1+v4SxxL3ZEDI5CQac2MORMnUoo46Hz8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199018)(31696002)(82960400001)(86362001)(36756003)(38100700002)(2906002)(41300700001)(66476007)(4326008)(5660300002)(8676002)(30864003)(66556008)(8936002)(2616005)(66946007)(53546011)(186003)(6512007)(83380400001)(6506007)(54906003)(478600001)(110136005)(316002)(6666004)(26005)(6486002)(66899018)(31686004)(45980500001)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1k0dEJzY1VmNjZKZVJsdG9LeGFoTjRxK3lqc1ZPY25MeGxhcWNmVlJyZmFw?=
 =?utf-8?B?UjFYVGRXTG5Mbm82N2Z6N0NGdkhUMXBqazhvc09TalM5Q3I5cGcvWUFzcDZp?=
 =?utf-8?B?N25uUzFmVEtOdTFEemxmUnZiSVNoZGpCQytEWmtKQXFreG5yS3RFdmVIUlll?=
 =?utf-8?B?TmlkS3ZlbDl3R1VOZWlSRkNlMFAxN1VzWnBoRWxFVmFFbWQ2aU9LVE51MmNh?=
 =?utf-8?B?cDJQRmZlRmY0MVpPZHVoc2ZacEpKbHBXTWRVU1YrRm5obzJpcGx2TEdXQm51?=
 =?utf-8?B?enNXK3MzZE8vUWI4MVpIUm83THZMQUJFaFFQN3FpeVhadUx3OHVmQ1pKMFVa?=
 =?utf-8?B?cFJkcDFVZnlrcDFXV2hjUC8wSnJBcHY2Yk1EdWtQbTVDRENQOHFPeDZTZnhH?=
 =?utf-8?B?R1Jtd2V2aWgyT3dRZ0tTb2U0YjBhMU1YaFQ0enlrZkZTKzdhY3BsZUV6bXZz?=
 =?utf-8?B?OVp4am5aZGJsQW53NlZYTGdZMUFzSG1zUW1NdCtxdTVrcDJ2NXdKSDdCbTc4?=
 =?utf-8?B?ekZtZ1B4UDRncW5KMXFMd3VrOTdzN3ExT2FnL1RaeTBHK0dOQTR2U0ZOd0Jt?=
 =?utf-8?B?aGxTRjZEbmNOMk5tOE9OQXY5Vm9YWlM3T1ZlWHIyRnJkRHRXM2lkczBYN3I5?=
 =?utf-8?B?aDZYdHBQMjFvS2VWSThib2FzazBDTHhsTzVEbEZXbTdTNXF4Zjk4b1VXbUFX?=
 =?utf-8?B?a1pkUFlIRDVCeUdsNjN5THZQd2VJTkFzTk51MkhpeVNObkFDRklJTVlVdlJT?=
 =?utf-8?B?T3MrcmZVcndHQlJwalBnUE5MN0dpNmw5SSsvWmRjeFFPR3lEMkdqQTE1VUVS?=
 =?utf-8?B?bWRHWkowN3doMFJrcHVINEtmQkt5UXdJZ1llb29IcXBobXhtVUhCR3hGTkdY?=
 =?utf-8?B?QVNGWHJCRHducVhCVmdzaUN6b3ZhVTltc3hNM2hSdW4yODQ4b2ZyNmJPZjZZ?=
 =?utf-8?B?alRkVmRwMXpXREpCRmQxeldHejh1ZnlKZjI1MmsyMkIzdXhPRloxSE5RdXF2?=
 =?utf-8?B?K1dhclA1d2Y5dFRaZmVtYjY4c2FqWnpDSkpVb0RZSmFLSUdIcDFVNnRKN2J5?=
 =?utf-8?B?YStoR1dxRG9ralNOMG84MWN3VkdTdytzQ1F4Ly9aNW1pNDF2N0FHSFVYc1BR?=
 =?utf-8?B?NjAvL1pzZm5VL2E3aFRhSVZTQ3BJUGEvK2IyblRxelNESGQrZmFlcis4SE52?=
 =?utf-8?B?YmxmbWRiQUExcldmbzE4eDhzWEVVRzdFMDAxc1dWY0hNVzNTaHhkT3E5c0I0?=
 =?utf-8?B?OTRhWCtiejRsUWFCZCtuSVU4dDAxT25mM3BnTGFvbk1RK280ZDBYVjA3NllJ?=
 =?utf-8?B?M3ZRL0VkelBJT3BzRUREYzFGVWQ5aVBTWnBvRWdtdnM5eXVxY3AxdmNHeFhn?=
 =?utf-8?B?Ri9JN1VoR3pMTnBIQkZDUXM3WmUvS1hhQTk4MDYvOExNNFZ6K1NQeWNuVDhS?=
 =?utf-8?B?d2JkRW9MMWhUM2tCUUZ6ZS9xVkVBU2FRV2JiOEJCWHpNam5MbTFyREt6UnEx?=
 =?utf-8?B?RDYva0EwSXV5WWFWTFkzRzFLTFBrT0t5M0hKQ3Jpbm1UWnZjZ25wOUhPYTdC?=
 =?utf-8?B?d2FpNVcrWkUwRlpDK0QzRVVMQjA3RERYdk44T1dHZ1k1bVZUTmVOVFIrd1Er?=
 =?utf-8?B?d0djOWk5V0xlemI4S2JXS1dlaENTQUorSlg3b0doNXR3Z3hNUitrd0tUWmtE?=
 =?utf-8?B?cnhDWDZmb3ZtcWpGK3ZYMkVXcVFCdGIxTHQ4dXJvaXFwSkQ2MkdRR0ZWUDRI?=
 =?utf-8?B?T1RZZlR5Vjk4QWRIMWZiVlV0NHpYQloxdzRUdzVJdmtWS1RZcGFhRjI2RzRI?=
 =?utf-8?B?d0FiQUtVS2t2bnBqR0hDQ2VoZ0oxM285VGNqYXBzdU9SOWxJZHkyOFMyTXJD?=
 =?utf-8?B?L0w4MCtNeEhURlhGTlIyaWdNazl3K1hFOVZEZlVCckxMMjNYbCtBbndNNHl6?=
 =?utf-8?B?S0dLbFRIWXc3MXJTY0crVDFGcWlKTFRqOHN6TkVRUDZzaFpBbEtDdlh0QWww?=
 =?utf-8?B?UFh6YjdDSWZCWmdoK2Z1bzBScVJIZFhRWUJiV0l3ZVk1ell3YlFydU5jcWFP?=
 =?utf-8?B?Sk1PMjlVRW16YzMzOENZWWZwa04ydTlueHk1RFBzQ0IzbGkxRS9ZaDBNTFNQ?=
 =?utf-8?B?OHFZbFB4OGZTMDJ4Q2NaTWt3UGNHaHB1djRTbFFaeWwwU2tnVzVrN3J5dk4z?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U/oag0P/Ospo07Nfb9Jiubnkxu/T+VBeO1OCiJrQoNkHCBahwr3LaW1JI0MEXlRsmD9NFZ0PAhl/9W7Q2F10kMgcIUQp4E45qIOt5zogRrosa4UEaqvEOPTjYzhpq32IecRk0hYtt1JTuMNkU00ng9ztwmaP5h23HnpOuM5X2/Vhh4Gg4mSr2MAVp6468GOjRdog6dxHYokcCOkO97gM/QKs7M+7L6x4iTrP6iVu79dzS/uAsF8xxYujH5Y9RoP9BMI2n8C2zEpOMDfyLtdcfnIW2ktUtR5xe9RsotF0lhZ+DWM4JPdRNovkhPwnSJKFSmXz9K2sVwW0W3i3ubat0FHb/lNeMaZlQjYeM4bjy7sGJZ/RRK3nYm5Cg4j+wXJ7tSAa5QTYYU2QXzG9fRtXXiZ8pm9Bk51FZ0S5UjtbovyTYB/OO3rIvtQA0izEXRo1YzWQUThK7o46umZGch2M7pTguKl/P5tPLqEbkZ9JQ/KMK4hZjoQ9obTofnIUkg+bN51bYAjxntl0c1APp/xWR7a8ROmAGldTOP3iz4ABrQ2oxUhjG59kQfNVXsHNRhszrPe1IXlrk4tTVjrrkybEn8Y5VDIBwmog6oQreUIVEUUMwU50b49OMmW2NWt7jnADcOtLTSjrIM0TRXhLxbv52kbrSr6PBUFDE9TToGRNacGSQ1Thnn73mVRSnhTzIa5Oa/qpTxX5vVSsPG4D+AGDAWXPXMgyVsa/R9e3+YgRh6T9Qn4nWc/mXqZ693utnjJ+36aB72VZNs86/rgUOIo0+KJOt5erqqAzUlG7tIK0mSqeQrmzj1UWx0ikSVQkNQWp
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c308c6d-3475-4688-5f9e-08db2bab1dba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:30:14.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZ91+Lu+9476CKPQ86KAtHF/FFXuBWRNGco8CI4N8r+D5uXOJ0t4iB9AbG8421DIvYVKMgxH7YYWX1i49Kr+2uxFB7d7CBeqAo7s/2bfM7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5692

On 22/03/2023 9:35 am, Jan Beulich wrote:
> --- /dev/null
> +++ b/xen/arch/x86/mm/shadow/oos.c
> @@ -0,0 +1,603 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only

The unqualified form in deprecated.

> +/******************************************************************************
> + * arch/x86/mm/shadow/oos.c
> + *
> + * Shadow code dealing with out-of-sync shadows.
> + * Parts of this code are Copyright (c) 2006 by XenSource Inc.
> + * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
> + * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
> + */
> +
> +#include "private.h"
> +
> +#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
> +
> +#include <xen/trace.h>
> +
> +#include <asm/shadow.h>
> +
> +/*
> + * From time to time, we let a shadowed pagetable page go out of sync
> + * with its shadow: the guest is allowed to write directly to the page,
> + * and those writes are not synchronously reflected in the shadow.
> + * This lets us avoid many emulations if the guest is writing a lot to a
> + * pagetable, but it relaxes a pretty important invariant in the shadow
> + * pagetable design.  Therefore, some rules:
> + *
> + * 1. Only L1 pagetables may go out of sync: any page that is shadowed
> + *    at at higher level must be synchronously updated.  This makes
> + *    using linear shadow pagetables much less dangerous.
> + *    That means that: (a) unsyncing code needs to check for higher-level
> + *    shadows, and (b) promotion code needs to resync.
> + *
> + * 2. All shadow operations on a guest page require the page to be brought
> + *    back into sync before proceeding.  This must be done under the
> + *    paging lock so that the page is guaranteed to remain synced until
> + *    the operation completes.
> + *
> + *    Exceptions to this rule: the pagefault and invlpg handlers may
> + *    update only one entry on an out-of-sync page without resyncing it.
> + *
> + * 3. Operations on shadows that do not start from a guest page need to
> + *    be aware that they may be handling an out-of-sync shadow.
> + *
> + * 4. Operations that do not normally take the paging lock (fast-path
> + *    #PF handler, INVLPG) must fall back to a locking, syncing version
> + *    if they see an out-of-sync table.
> + *
> + * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
> + *    must explicitly resync all relevant pages or update their
> + *    shadows.
> + *
> + * Currently out-of-sync pages are listed in a simple open-addressed
> + * hash table with a second chance (must resist temptation to radically
> + * over-engineer hash tables...)  The virtual address of the access
> + * which caused us to unsync the page is also kept in the hash table, as
> + * a hint for finding the writable mappings later.
> + *
> + * We keep a hash per vcpu, because we want as much as possible to do
> + * the re-sync on the save vcpu we did the unsync on, so the VA hint
> + * will be valid.
> + */
> +
> +#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_FULL
> +void sh_oos_audit(struct domain *d)
> +{
> +    unsigned int idx, expected_idx, expected_idx_alt;
> +    struct page_info *pg;
> +    struct vcpu *v;
> +
> +    for_each_vcpu(d, v)
> +    {
> +        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
> +        {
> +            mfn_t *oos = v->arch.paging.shadow.oos;

Newline.

But the variable placement is weird.  oos ought to be one scope further
out to prevent recalculation in the for() loop, while pg and the two
expected could be at the inter-most scope.

> +            if ( mfn_eq(oos[idx], INVALID_MFN) )
> +                continue;
> +
> +            expected_idx = mfn_x(oos[idx]) % SHADOW_OOS_PAGES;
> +            expected_idx_alt = ((expected_idx + 1) % SHADOW_OOS_PAGES);
> +            if ( idx != expected_idx && idx != expected_idx_alt )
> +            {
> +                printk("%s: idx %x contains gmfn %lx, expected at %x or %x.\n",
> +                       __func__, idx, mfn_x(oos[idx]),
> +                       expected_idx, expected_idx_alt);
> +                BUG();
> +            }
> +            pg = mfn_to_page(oos[idx]);
> +            if ( !(pg->count_info & PGC_shadowed_pt) )
> +            {
> +                printk("%s: idx %x gmfn %lx not a pt (count %lx)\n",
> +                       __func__, idx, mfn_x(oos[idx]), pg->count_info);
> +                BUG();
> +            }
> +            if ( !(pg->shadow_flags & SHF_out_of_sync) )
> +            {
> +                printk("%s: idx %x gmfn %lx not marked oos (flags %x)\n",
> +                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
> +                BUG();
> +            }
> +            if ( (pg->shadow_flags & SHF_page_type_mask & ~SHF_L1_ANY) )
> +            {
> +                printk("%s: idx %x gmfn %lx shadowed as non-l1 (flags %x)\n",
> +                       __func__, idx, mfn_x(oos[idx]), pg->shadow_flags);
> +                BUG();
> +            }
> +        }
> +    }
> +}
> +#endif
> +
> +#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
> +void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
> +{
> +    int idx;
> +    struct vcpu *v;
> +    mfn_t *oos;
> +
> +    ASSERT(mfn_is_out_of_sync(gmfn));
> +
> +    for_each_vcpu(d, v)
> +    {
> +        oos = v->arch.paging.shadow.oos;
> +        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;

Same for oos and idx here, which would shrink this function overall.

As a tangent, do we really want all these modulo 3's all over the
place?  It's a lot of divide instructions in paths that are fast-ish for
shadow guests.

> +        if ( !mfn_eq(oos[idx], gmfn) )
> +            idx = (idx + 1) % SHADOW_OOS_PAGES;
> +
> +        if ( mfn_eq(oos[idx], gmfn) )
> +            return;
> +    }
> +
> +    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
> +           mfn_x(gmfn));
> +    BUG();
> +}
> +#endif
> +
> +/* Update the shadow, but keep the page out of sync. */
> +static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)

inline can go.

> +{
> +    struct page_info *pg = mfn_to_page(gmfn);
> +
> +    ASSERT(mfn_valid(gmfn));
> +    ASSERT(page_is_out_of_sync(pg));
> +
> +    /* Call out to the appropriate per-mode resyncing function */
> +    if ( pg->shadow_flags & SHF_L1_32 )
> +        SHADOW_INTERNAL_NAME(sh_resync_l1, 2)(v, gmfn, snpmfn);
> +    else if ( pg->shadow_flags & SHF_L1_PAE )
> +        SHADOW_INTERNAL_NAME(sh_resync_l1, 3)(v, gmfn, snpmfn);
> +    else if ( pg->shadow_flags & SHF_L1_64 )
> +        SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
> +}
> +
> +static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
> +                                            mfn_t smfn, unsigned long off)
> +{
> +    ASSERT(mfn_valid(smfn));
> +    ASSERT(mfn_valid(gmfn));
> +
> +    switch ( mfn_to_page(smfn)->u.sh.type )
> +    {
> +    case SH_type_l1_32_shadow:
> +    case SH_type_fl1_32_shadow:
> +        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
> +            (d, gmfn, smfn, off);
> +
> +    case SH_type_l1_pae_shadow:
> +    case SH_type_fl1_pae_shadow:
> +        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
> +            (d, gmfn, smfn, off);
> +
> +    case SH_type_l1_64_shadow:
> +    case SH_type_fl1_64_shadow:
> +        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
> +            (d, gmfn, smfn, off);
> +
> +    default:
> +        return 0;
> +    }
> +}
> +
> +/*
> + * Fixup arrays: We limit the maximum number of writable mappings to
> + * SHADOW_OOS_FIXUPS and store enough information to remove them
> + * quickly on resync.
> + */
> +
> +static inline int oos_fixup_flush_gmfn(struct vcpu *v, mfn_t gmfn,
> +                                       struct oos_fixup *fixup)

inline

> +{
> +    struct domain *d = v->domain;
> +    int i;
> +    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
> +    {
> +        if ( !mfn_eq(fixup->smfn[i], INVALID_MFN) )
> +        {
> +            sh_remove_write_access_from_sl1p(d, gmfn,
> +                                             fixup->smfn[i],
> +                                             fixup->off[i]);
> +            fixup->smfn[i] = INVALID_MFN;
> +        }
> +    }
> +
> +    /* Always flush the TLBs. See comment on oos_fixup_add(). */
> +    return 1;
> +}

This looks suspiciously like it ought to be a void function.  [edit, yes
- see later]

> +
> +void oos_fixup_add(struct domain *d, mfn_t gmfn,
> +                   mfn_t smfn,  unsigned long off)
> +{
> +    int idx, next;
> +    mfn_t *oos;
> +    struct oos_fixup *oos_fixup;
> +    struct vcpu *v;
> +
> +    perfc_incr(shadow_oos_fixup_add);
> +
> +    for_each_vcpu(d, v)
> +    {
> +        oos = v->arch.paging.shadow.oos;
> +        oos_fixup = v->arch.paging.shadow.oos_fixup;
> +        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
> +        if ( !mfn_eq(oos[idx], gmfn) )
> +            idx = (idx + 1) % SHADOW_OOS_PAGES;
> +        if ( mfn_eq(oos[idx], gmfn) )
> +        {
> +            int i;
> +            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )

This is a case where "for ( int i = ..." would definitely read better. 
Luckily, this example is simple enough that the compiler has already
optimised properly.

> +            {
> +                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
> +                     && (oos_fixup[idx].off[i] == off) )

Given that you mention style in the commit message, it would be nice to
move the && onto the previous line.

> +                    return;
> +            }
> +
> +            next = oos_fixup[idx].next;
> +
> +            if ( !mfn_eq(oos_fixup[idx].smfn[next], INVALID_MFN) )
> +            {
> +                TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_EVICT);
> +
> +                /* Reuse this slot and remove current writable mapping. */
> +                sh_remove_write_access_from_sl1p(d, gmfn,
> +                                                 oos_fixup[idx].smfn[next],
> +                                                 oos_fixup[idx].off[next]);
> +                perfc_incr(shadow_oos_fixup_evict);
> +                /*
> +                 * We should flush the TLBs now, because we removed a
> +                 * writable mapping, but since the shadow is already
> +                 * OOS we have no problem if another vcpu write to
> +                 * this page table. We just have to be very careful to
> +                 * *always* flush the tlbs on resync.
> +                 */
> +            }
> +
> +            oos_fixup[idx].smfn[next] = smfn;
> +            oos_fixup[idx].off[next] = off;
> +            oos_fixup[idx].next = (next + 1) % SHADOW_OOS_FIXUPS;
> +
> +            TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_OOS_FIXUP_ADD);
> +            return;
> +        }
> +    }
> +
> +    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
> +           mfn_x(gmfn));
> +    BUG();
> +}
> +
> +static int oos_remove_write_access(struct vcpu *v, mfn_t gmfn,
> +                                   struct oos_fixup *fixup)
> +{
> +    struct domain *d = v->domain;
> +    int ftlb = 0;
> +
> +    ftlb |= oos_fixup_flush_gmfn(v, gmfn, fixup);

Oof yes.

With oos_fixup_flush_gmfn() changed to being void, it is now obvious
that ftlb is unconditionally 1 throughout this function, which can be
simplified to just:

    oos_fixup_flush_gmfn(v, gmfn, fixup);
    if ( sh_remove_write_access(d, gmfn, 0, 0) == -1 )
    {
        shadow_remove_all_shadows(d, gmfn);
        return 1;
    }

    guest_flush_tlb_mask(d, d->dirty_cpumask);
    return 0;

Maybe we don't want to go that far, but it is overly complex in its
current form.

> +
> +    switch ( sh_remove_write_access(d, gmfn, 0, 0) )
> +    {
> +    default:
> +    case 0:
> +        break;
> +
> +    case 1:
> +        ftlb |= 1;
> +        break;
> +
> +    case -1:
> +        /*
> +         * An unfindable writeable typecount has appeared, probably via a
> +         * grant table entry: can't shoot the mapping, so try to unshadow
> +         * the page.  If that doesn't work either, the guest is granting
> +         * his pagetables and must be killed after all.
> +         * This will flush the tlb, so we can return with no worries.
> +         */
> +        shadow_remove_all_shadows(d, gmfn);
> +        return 1;
> +    }
> +
> +    if ( ftlb )
> +        guest_flush_tlb_mask(d, d->dirty_cpumask);
> +
> +    return 0;
> +}
> +
> +static inline void trace_resync(int event, mfn_t gmfn)

inline, and this reminds me that I *still* need to sort my series to
avoid stack rubble leakage in the trace subsystem.

"int" event really ought to become unsigned int, but it doesn't matter
in this case because the timestamp (bit 31) doesn't need setting.

> +{
> +    if ( tb_init_done )
> +    {
> +        /* Convert gmfn to gfn */
> +        gfn_t gfn = mfn_to_gfn(current->domain, gmfn);
> +
> +        __trace_var(event, 0/*!tsc*/, sizeof(gfn), &gfn);
> +    }
> +}
> +
> +/* Pull all the entries on an out-of-sync page back into sync. */
> +static void _sh_resync(struct vcpu *v, mfn_t gmfn,
> +                       struct oos_fixup *fixup, mfn_t snp)
> +{
> +    struct page_info *pg = mfn_to_page(gmfn);
> +
> +    ASSERT(paging_locked_by_me(v->domain));
> +    ASSERT(mfn_is_out_of_sync(gmfn));
> +    /* Guest page must be shadowed *only* as L1 when out of sync. */
> +    ASSERT(!(mfn_to_page(gmfn)->shadow_flags & SHF_page_type_mask
> +             & ~SHF_L1_ANY));
> +    ASSERT(!sh_page_has_multiple_shadows(mfn_to_page(gmfn)));
> +
> +    SHADOW_PRINTK("%pv gmfn=%"PRI_mfn"\n", v, mfn_x(gmfn));
> +
> +    /* Need to pull write access so the page *stays* in sync. */
> +    if ( oos_remove_write_access(v, gmfn, fixup) )
> +    {
> +        /* Page has been unshadowed. */
> +        return;
> +    }
> +
> +    /* No more writable mappings of this page, please */
> +    pg->shadow_flags &= ~SHF_oos_may_write;
> +
> +    /* Update the shadows with current guest entries. */
> +    _sh_resync_l1(v, gmfn, snp);
> +
> +    /* Now we know all the entries are synced, and will stay that way */
> +    pg->shadow_flags &= ~SHF_out_of_sync;
> +    perfc_incr(shadow_resync);
> +    trace_resync(TRC_SHADOW_RESYNC_FULL, gmfn);
> +}
> +
> +/* Add an MFN to the list of out-of-sync guest pagetables */
> +static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
> +{
> +    int i, idx, oidx, swap = 0;
> +    mfn_t *oos = v->arch.paging.shadow.oos;
> +    mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
> +    struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
> +    struct oos_fixup fixup = { .next = 0 };
> +
> +    for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
> +        fixup.smfn[i] = INVALID_MFN;
> +
> +    idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
> +    oidx = idx;
> +
> +    if ( !mfn_eq(oos[idx], INVALID_MFN)
> +         && (mfn_x(oos[idx]) % SHADOW_OOS_PAGES) == idx )
> +    {
> +        /* Punt the current occupant into the next slot */
> +        SWAP(oos[idx], gmfn);
> +        SWAP(oos_fixup[idx], fixup);
> +        swap = 1;
> +        idx = (idx + 1) % SHADOW_OOS_PAGES;
> +    }
> +    if ( !mfn_eq(oos[idx], INVALID_MFN) )
> +    {
> +        /* Crush the current occupant. */
> +        _sh_resync(v, oos[idx], &oos_fixup[idx], oos_snapshot[idx]);
> +        perfc_incr(shadow_unsync_evict);
> +    }
> +    oos[idx] = gmfn;
> +    oos_fixup[idx] = fixup;
> +
> +    if ( swap )
> +        SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
> +
> +    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
> +}
> +
> +/* Remove an MFN from the list of out-of-sync guest pagetables */
> +void oos_hash_remove(struct domain *d, mfn_t gmfn)
> +{
> +    int idx;
> +    mfn_t *oos;
> +    struct vcpu *v;
> +
> +    SHADOW_PRINTK("d%d gmfn %lx\n", d->domain_id, mfn_x(gmfn));
> +
> +    for_each_vcpu(d, v)
> +    {
> +        oos = v->arch.paging.shadow.oos;
> +        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
> +        if ( !mfn_eq(oos[idx], gmfn) )
> +            idx = (idx + 1) % SHADOW_OOS_PAGES;
> +        if ( mfn_eq(oos[idx], gmfn) )
> +        {
> +            oos[idx] = INVALID_MFN;
> +            return;
> +        }
> +    }
> +
> +    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
> +           mfn_x(gmfn));
> +    BUG();
> +}
> +
> +mfn_t oos_snapshot_lookup(struct domain *d, mfn_t gmfn)
> +{
> +    int idx;
> +    mfn_t *oos;
> +    mfn_t *oos_snapshot;
> +    struct vcpu *v;
> +
> +    for_each_vcpu(d, v)
> +    {
> +        oos = v->arch.paging.shadow.oos;
> +        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
> +        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
> +        if ( !mfn_eq(oos[idx], gmfn) )
> +            idx = (idx + 1) % SHADOW_OOS_PAGES;
> +        if ( mfn_eq(oos[idx], gmfn) )
> +        {
> +            return oos_snapshot[idx];
> +        }
> +    }
> +
> +    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
> +           mfn_x(gmfn));
> +    BUG();
> +}
> +
> +/* Pull a single guest page back into sync */
> +void sh_resync(struct domain *d, mfn_t gmfn)
> +{
> +    int idx;
> +    mfn_t *oos;
> +    mfn_t *oos_snapshot;
> +    struct oos_fixup *oos_fixup;
> +    struct vcpu *v;
> +
> +    for_each_vcpu(d, v)
> +    {
> +        oos = v->arch.paging.shadow.oos;
> +        oos_fixup = v->arch.paging.shadow.oos_fixup;
> +        oos_snapshot = v->arch.paging.shadow.oos_snapshot;
> +        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
> +        if ( !mfn_eq(oos[idx], gmfn) )
> +            idx = (idx + 1) % SHADOW_OOS_PAGES;
> +
> +        if ( mfn_eq(oos[idx], gmfn) )
> +        {
> +            _sh_resync(v, gmfn, &oos_fixup[idx], oos_snapshot[idx]);
> +            oos[idx] = INVALID_MFN;
> +            return;
> +        }
> +    }
> +
> +    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not in hash table\n",
> +           mfn_x(gmfn));
> +    BUG();
> +}
> +
> +/*
> + * Figure out whether it's definitely safe not to sync this l1 table,
> + * by making a call out to the mode in which that shadow was made.
> + */
> +static int sh_skip_sync(struct vcpu *v, mfn_t gl1mfn)
> +{
> +    struct page_info *pg = mfn_to_page(gl1mfn);

Newline here, and ...

> +    if ( pg->shadow_flags & SHF_L1_32 )
> +        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 2)(v, gl1mfn);
> +    else if ( pg->shadow_flags & SHF_L1_PAE )
> +        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 3)(v, gl1mfn);
> +    else if ( pg->shadow_flags & SHF_L1_64 )
> +        return SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, 4)(v, gl1mfn);

here IMO.

> +    printk(XENLOG_ERR "gmfn %"PRI_mfn" was OOS but not shadowed as an l1\n",
> +           mfn_x(gl1mfn));
> +    BUG();
> +}
> +
> +/*
> + * Pull all out-of-sync pages back into sync.  Pages brought out of sync
> + * on other vcpus are allowed to remain out of sync, but their contents
> + * will be made safe (TLB flush semantics); pages unsynced by this vcpu
> + * are brought back into sync and write-protected.  If skip != 0, we try
> + * to avoid resyncing at all if we think we can get away with it.
> + */
> +void sh_resync_all(struct vcpu *v, int skip, int this, int others)

This is begging to become

void sh_resync_all(struct vcpu *v, unsigned int flags)

because, if nothing else, it changes the callers to be:

sh_resync_all(v, RESYNC_THIS | RESYNC_OTHERS);
sh_resync_all(v, RESYNC_THIS);
sh_resync_all(v, RESYNC_SKIP | RESYNC_THIS);

which is far more readable that the raw numbers currently there.

I don't mind doing the patch, but I'll probably wait until you've got
this committed to avoid churn.

~Andrew


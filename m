Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD0672795F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 09:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545157.851431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AX3-00055L-V7; Thu, 08 Jun 2023 07:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545157.851431; Thu, 08 Jun 2023 07:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7AX3-000534-SR; Thu, 08 Jun 2023 07:58:09 +0000
Received: by outflank-mailman (input) for mailman id 545157;
 Thu, 08 Jun 2023 07:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlTS=B4=citrix.com=prvs=5169c035c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q7AX1-00052y-SC
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 07:58:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31283a2e-05d2-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 09:58:03 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2023 03:57:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB6941.namprd03.prod.outlook.com (2603:10b6:510:156::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Thu, 8 Jun
 2023 07:57:51 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Thu, 8 Jun 2023
 07:57:46 +0000
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
X-Inumbo-ID: 31283a2e-05d2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686211083;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mLra20I4PusolTicxcb34kFEYtwPrsNxNgfFIBX4cis=;
  b=KN7P91eMhMcv1JNw+ky4Out53+62YqSTf2ivZyKy+iiz+/XSXZmapkDo
   P9fOWvt2Eq3rwab/G9dnwz2nxbDhKHMLk4Wkm+qQdhf5ngKUMKPIN2Ecq
   HCe5D90yCX+QYDArHdGVc3D7L1IMy3GblLlGiuMTK5dkiPhLx0OTLA3mE
   8=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 112443163
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xn2DRaDqs5S2NRVW/wjiw5YqxClBgxIJ4kV8jS/XYbTApDtxhGEAn
 GdLWG6GOPaJZGT9Kd1wOdmx/B8C6MLUyYVkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3LksXn1D8
 sUjOBc0cAHb2tO1+J2xRbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDC7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyjw2rSWw3iTtIQ6SJGEtf5tgFqqn2EwFAxJcXW3nte3hRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGUENSkNSFJf58G5+d5ryBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjOeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:SnGx8qA5hmvU987lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:JlNQGGOA0C/ryu5DfnY8q1IZHfkeYlrk0maIfn67MUljR+jA
X-Talos-MUID: 9a23:64KxKwuETMKWlpj/3s2n2B1ed8dv46OXUU0ujYRZn+eICgJ+NGLI
X-IronPort-AV: E=Sophos;i="6.00,226,1681185600"; 
   d="scan'208";a="112443163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix/EYztl/2t2Vxt2b0YOL2+ymai6PfZHyQaKQKMDlpjt9ZCMurvRSUTSnTVBdDXqbWz8oJDDpUzh02j6mPjZKfo1RenYQZbOSAa7JXID/yO+duUF+Zh0LvTZw5Og8C4HjVnpL9PjagjxAHQ0h6dGglr96zXT0/k3DRJZxwjJmQq4dvMIFEWrKKbajMAtu+QuI4T8gYCTb8xfp0Qkk7xqvpWNP8yWfmSBnNPNq53DB3fWslThdCi9DPyC/icQbwZr3NNNcF2IUeYda2a+shZpaVjeABttD7Asuq5hhpuaicIj9352rEsXJitawNT3qMH5Rr2d1Wp6/BVFY13wfNbO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve2oKjF/o8rEcHfMYjsFlKjExdHYjnictDl38XxXMEE=;
 b=nfQmAsMpVR1TV9x9QRq+/W1x5bjkIkvy47ydB5/QNL8gTGSeOKjTeO44s4+LF8aNSpbXuKGsg0HEUI8efyK9CXGSy/H06frs5lNFWM3HxLq57pn1ej7nN8z9bEvIcfWOhDANWmH8MWalcv+h1U1daS6W86FoA7JzamsOfUywcbkgSNZQUBbJq0rlptoP1ihG1Suip1/wjsyjbPskKpFGcodvjhuk62uAzD61NF5UqeQGMLKapwhIdYd2MsdGKwV+MlRAvFO3MztEKAoo9q5jNDwciMGIvbsVN73VjzfB0fOtiv8cYUsmmSwsnTH3B2KRKWaw8hXF0mNkh+SGgKfyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve2oKjF/o8rEcHfMYjsFlKjExdHYjnictDl38XxXMEE=;
 b=ghqbY9GClyBVMMhYvQWQGACA57MjVz2+Iq5Xe1SKPBk4/HhB4mPC18gXJu6AISz8kf3qnAitX3Zwy53IXroflfpIgc2XgLuwBwLs151xRdxU2+VA+M3gkQLEIDAwfDYbn5iK2k7U1S/z2npJ7/yUgYkUtK9mHHc7fTKA7atJ2Uw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jun 2023 09:57:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: print valid CR4 bits in case of error
Message-ID: <ZIGJ9ZYlGQD/oydT@Air-de-Roger>
References: <20230607134638.53070-1-roger.pau@citrix.com>
 <728efea9-2d30-fa55-473f-df3a18742ace@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <728efea9-2d30-fa55-473f-df3a18742ace@citrix.com>
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa119fe-fc56-4d4e-7c74-08db67f60bd0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pGHVA+X2bNQ1VqR+tE7qt6fgfM32x+9l1jJ8PM5USXbzAnNk1mlxyQLf0KvfYp6R7kYT3cKdWCgCUPr6PyIsqrre3LUfH6y5zpSUo6EiMaJQZFsUR4S8ArJCEOz2cK/TBUadRuQvMNlOffW0TUoKE5s/nSYo+zvjUh/jbHz36FokyjO8D/yuoMl8ja+cQWnoKUvzR3OzEp/kNq7ZUzDqLtc7Bi3N8JBBOQ/ttU4CI8xYSsrSD7L09deB2TZYct12VCU8Nfg7aM8vh9quFceUTXnqhHOm7G/tuNqAYATm2Hn/oepAFEALF+qo3BBqNRVVdsh+5GW9XpwWmkJrk+b7JYp7JI0RKvIvMFX2kOSPVr0EpjWM2q5pck58G9brnWg/l7/8yJW4MFpFkkfEM18/2pnryDSdoHb+z2rIQ9nK/nr8BRzg3RbOhiD7cI95lyOIIeeKnSgAbamETgysTL7D9bjAMTdsQqPP7ABVDZL9NUdgq9F1cbwOklwdiJTHr/Gbj104HorCSTsNwLBtwwnOk+55YSCLKjI3n/Di4zdVH4fV0Ro/IBN1dV21SAYAKPH9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(85182001)(2906002)(86362001)(33716001)(5660300002)(6666004)(83380400001)(186003)(9686003)(6512007)(6506007)(26005)(53546011)(6486002)(82960400001)(478600001)(54906003)(66946007)(316002)(66556008)(66476007)(6636002)(4326008)(38100700002)(41300700001)(8936002)(8676002)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTVBUGN5ZmlXQ0hZVFYwcVpRZ2RvTG9HZWNKcDZ1cmcrV003Z3Z3VmJia2JY?=
 =?utf-8?B?YVpyS21NaGZsK0VYbzQreVBpd3p3OVlWWFBOdm5wYmJDVmVHVUVUZmNmcmxv?=
 =?utf-8?B?cWpHeUVGY2VtZU8rOG9pdi80SjU2UGVsN0FoaVQvRzkrTkNPeUppeFpWUkN6?=
 =?utf-8?B?S0lIcVVRT0tsWTJETGk3Ykx3YTVKeVdEMlFnWlJ6NlgybjdpTUZhdXQ3M05K?=
 =?utf-8?B?aTZSeThpWTZKMW5oUUc4a2FOT2k0ejVjdEpxeFJxQWo3elpGZlFROG9sRWdY?=
 =?utf-8?B?OXM2QmF1L2MxMHRWbUNkMmFmaloya1RtWWtRS3lMendWajRGYUJPdklSMUJM?=
 =?utf-8?B?SUxuM25UdjFySzQ5SjFKZCtGNUpZY2JCUXcwVHl0bnVtTVQ2cjJwdmoyKzNv?=
 =?utf-8?B?bmh6MjcrcEpla2IyNkc1QVM4ZnFwdWVqOUp5Z3p2Z0NuTHNtbitVVi92ZFBP?=
 =?utf-8?B?aUY3ZkN1MERLOHJNMTVZbWgvMzdGeG0zT2l1S2lOdjY2S09Ta3ltWnVUZmtO?=
 =?utf-8?B?cTR1cnpTMlovbHB1QS9CSkRPUG81Unl0WFUxd2JWREdTNDRrNVV0UzRkcWJr?=
 =?utf-8?B?OWpEOUd1QVRTT0p1RFM5ZXl1NER6MGhSSW9ZcWxCbWh1OUthbVhiaTFOaWJo?=
 =?utf-8?B?VmhWekpVK1UvR0pqYy90T1FtL2txRTQwVG9DaWZtQlZCUkdKMXRzUTRialhz?=
 =?utf-8?B?dTh6cXhhVzZyTXliTGozbnB6WHYzTUhoZG1GdEdnc2ZIWFI1c2NtRGNpSWU3?=
 =?utf-8?B?QW1rYkJmY0p1YllmUHBraUx1SGFRS3N0L2dNNXFXUUJkL1oxbHZXbDM5SjE0?=
 =?utf-8?B?TmtGZmp3Z0JSSEVoQ3RVNEIrYUtubzZhbzBmblg4NitKNDUwM3BpV3Bma0Zz?=
 =?utf-8?B?blozc3VxRGw1cDhKd3NjeURReG1HbENnd0N1YjNldHd3c2ovZk13d0lDeS9E?=
 =?utf-8?B?Y3Y5QzBIYVdVelVhRUhIS0lUeno1eE1YSmtIOUhxTmJ1bWFSRjlWNXFMOGxP?=
 =?utf-8?B?cFRublkyUEpyVmhVcWdIVVN2REdEcG8xeFhTbG5Ua0c5MExWd2tBR05aR3Bi?=
 =?utf-8?B?dHdsd2JMSlZ3RUpRUzR3ZlRJRGkrVzlvLzBrT2dSZ0VDM1hJbFdDdi9HRHdy?=
 =?utf-8?B?S21UVkxRMVhFMzVJZ1hheS84YnBweGw0R0tDdXorSTVBWWZvMHh6bTFCTm5u?=
 =?utf-8?B?MFBwZzRnRmFmeno4SisyaHpqWllPUjVYRS9QZ3RGNWhodDl6TzBkZEc3c1ZY?=
 =?utf-8?B?UnBDQVlsRXNQd2FHRXdQaE4wcWM5endjQ0IvM1ZVM09uekhacjNKNGxEcnZX?=
 =?utf-8?B?RFVFTzZMdnNCNE0rb1ZaWFBqQjZINjF4UVFXbkVlN2F2U2w4RHlnWnBDSnRG?=
 =?utf-8?B?M1QvcU9FZW5TdFJpVUM3VEgyRWpuc3h2STk1QmpGaTY5Rk1SdGN5YVpDVzRn?=
 =?utf-8?B?VnJOSlZ5L0NNWDdkdUdMK3RQbjhISjBlSzlobzhaMlJRUC9ZUStQWmpkRExi?=
 =?utf-8?B?dFN2R2ZCdWxucmNDRVBOMUxyRXRwcWs3REE0QjY2NGFVREhJZFI3clJSWWs1?=
 =?utf-8?B?SW9vdWVGN2FZUUw5UXVaZHVzUHdRMUJSeDY4WTEyQmJZSVY5Y0htNWcxNW54?=
 =?utf-8?B?SmFsdWFWb1RKalNKejhkZWFiS1hPWTdqQVZxKzhST0pXMHdEKzBGNUJ0cXdo?=
 =?utf-8?B?cEZJTjREbG9MWURVUFdoTGlRZmFuRUdsODd0QzY0alpOUWhYcVZaQm9qNS9W?=
 =?utf-8?B?eXAvVmJsc1ZCaGJTWWhUS3pqd01NRXpnOGFHeFloNnVkUGpTcFlrNWR6RFBV?=
 =?utf-8?B?eFlrODhxTXltUnI5eDRZMDh3NE9yZC9nVHFFR2d3RjBxQXEyMVZldjkvNDBF?=
 =?utf-8?B?MXo4ZStVOTgzRFlsVnExM3pnZkttaEphUDZDdnI3c1RzS2JiUmNUTHNyODN3?=
 =?utf-8?B?UEk5bzJveDd5YmowMWVjbGt1ZEtlNUMvMHdqTmJFYm5LeDdwTmF3QVF4ZkFF?=
 =?utf-8?B?YVpBNkRqd2N3Q1FNSkJBR0VMYW11WS9PeGFrWkk0Mm9ua2Rkd01BcjZSc0l0?=
 =?utf-8?B?d3ZRazBnT0tvUmp5dXBQeGNtSEJEUGhDd1JQanp4RHUxK1ZmUVdKUXBsbWhU?=
 =?utf-8?B?UDI5N3lOdHBQNEhQOTVZKzIweFRKQW5PL1Jna2xEdUYyWGZSN1VUS1dBNW1h?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xrGrH5DQs6yY/wry7JEUw3ncs6opJnySQULK37n5V/FB2hRujXiF5Y+KUJmLJ2Wd2mPCfu1Ub9Ka/oQo3Ck2v4J47oV4oS7U2ilo/w/5UwdOjZN9DtLTcrk1XWNLN2Z1BrDS8nVCCeTNZjuukRJFrjxVDdS/pKfbW53bNZrbd1AmWAfmnviSvzpdGA1QdZySY1sVjWVg6QJgAMQihvQaUPQG6SZqx/+Dv614T0LcsGfpTm9RpvMx7B9qdKDuGFV+NIysQmH1BzjGvr2Lg90172SxSaJbst0T9iuUTJjB3dMr7ng/paEBI3AUZbxj7mlhjCCpPAEl78vhH7aIAkUEkicgOsIMhfoxlEe4QRatvKUbnvETSRSf+YAYRutWUetECN6Buunu+zYe3vp8+YyGl5lPzIEvlQblYJPpo0JbkmNLs+UjQZitW6PSE72g+MGOpViq1GQQQi7Hc9YqJe0eNL7MUF6BOBN7mixiTF0p5nmZb4k8/2FisVfhi3+lIAXOJAdDRznFqkfdZ8buLhNGkvmkLtOhc63Mr6QXhI6NmjrqZ7rPA9/GlzDMU2/xYXGMz+oOgoX3WEBE8vCB87fWYMY0XizfIjPHh4XOUuQMGZDnNL8K1um6126oeAsCbORMdU4XfV3/3m0+uHQiGJ6v2u/9VohDoC3F3QXzKhDsFUVajacFWg7T3Gp+WTvjWtFozXn5JAs95dL4ajitr/wuHY44MSva/R0MHKmF0YLKedTkV81JfwMZv3n/uftsk2ylDb/Ol3zwDJfjIVrm0rtWci0LMQmu9rdAWfXlqtbw0HSENHZ25jXXMncdpZ0+SU1S
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa119fe-fc56-4d4e-7c74-08db67f60bd0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 07:57:46.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5MSXbJWmi9z8GdYgF9pz9Gg2v+4M1I12rBST1+JFcg5Pu4JPIDAQuK5bOLcMnY6x1jb2GjH05qEM/2UwCQPZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6941

On Wed, Jun 07, 2023 at 04:48:42PM +0100, Andrew Cooper wrote:
> On 07/06/2023 2:46 pm, Roger Pau Monne wrote:
> > Some of the current users of hvm_cr4_guest_valid_bits() to check
> > whether a CR4 value is correct don't print the valid mask, and thus
> > the resulting error messages are not as helpful as they could be.
> >
> > Amend callers to always print the value of hvm_cr4_guest_valid_bits(),
> > and take the opportunity of also adjusting all the users to use the
> > same print formatter.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/domain.c       | 4 ++--
> >  xen/arch/x86/hvm/hvm.c          | 8 ++++----
> >  xen/arch/x86/hvm/svm/svmdebug.c | 2 +-
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> > index deec74fdb4f5..8951230a9f52 100644
> > --- a/xen/arch/x86/hvm/domain.c
> > +++ b/xen/arch/x86/hvm/domain.c
> > @@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
> >  
> >      if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
> >      {
> > -        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
> > -                v->arch.hvm.guest_cr[4]);
> > +        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
> > +                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));
> 
> I suspect you want to call this once and store it in a variable.
> 
> It's a non-inline function which also isn't marked attr_const, so it
> will get called twice.

I wasn't specially concerned about this, it's an error path where the
second call will happen, and there's already a printk which will make
the cost of calling hvm_cr4_guest_valid_bits() negligible compared to
the printk.

> Also, if you're extending like this, then you actually want
> 
> (valid %lx, rejected %lx)
> 
> passing in cr4 ^ valid for rejected.  It's almost always 1 bit which is
> rejected at a time, and the xor form is easier to read, not least
> because it matches the X86_CR4_blah constant of the bad feature.

I will adjust as requested.

Thanks, Roger.


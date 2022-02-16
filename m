Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2274B8390
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273788.469079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDm-0006KJ-DD; Wed, 16 Feb 2022 09:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273788.469079; Wed, 16 Feb 2022 09:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDm-0006Gg-81; Wed, 16 Feb 2022 09:03:34 +0000
Received: by outflank-mailman (input) for mailman id 273788;
 Wed, 16 Feb 2022 09:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKGDk-0005Pr-Hb
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:03:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fdf0724-8f07-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:03:31 +0100 (CET)
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
X-Inumbo-ID: 4fdf0724-8f07-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645002211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ysl9wQiGoIFjtZscKuJah+YD5LjaRX0Moam5blmUa6I=;
  b=KhDWnuf42kjh1JVGnYsADY3UASBEp1bG3WKlIOdQ/tqC++HEK0yLVZ59
   uqM9YzYRGvnO/cTklahJ3aocXdnlrJ+lDijLysk697v/P7hZHY3M54l6t
   0FfvIMoFjj4xu6hz3+ULEfj9JoecQtsvJrF70AD1bP2XxWjdXfitjoJyM
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NT3IIB7BoZF+xfFJ1xAmPmWgjtNH0yfIS6xM6snXFJiEFAquhx6jroHqbuIYf1o/PYOKJcbYqF
 gc0DYiY03d7qmf7KoRl/v9QxoVaHTs2Dtsb9jcXJOqutbGdpCqpDXFc/7/Cl9s6qQ/5nVmQL3q
 ORuNaXVOTYS/y1E9NNMvOoF4CQoDLjnDtCwv1JEb7LHt9bb0ibOEP0vuvN3QKbu/fk3w/Cnv+h
 hA6Vj4phUo75UFNoTP+VFPQe6J2mAynlViluIoVmWWezadab98v9GcBSkngYcG/4cPzK9xZ4hC
 t6NOoyiAgY6R8HbCOuDpkqxH
X-SBRS: 5.1
X-MesageID: 64219153
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fNGr/ar3e2YvkiwgmT87Mr9+5RheBmKcYhIvgKrLsJaIsI4StFCzt
 garIBmFP/rcN2X0fYtwa4Xj8U0GuJ7XytA2GwI4pClgE3lE+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYPuQgowBoDVovRDdjNxNDhCY4dG1rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4SR6+PP
 pdCAdZpRBn7ejlyY0lGMq8vl/mIrGbSaAZDkk3A8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3uFuqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmKLLQn+EzpqNlyPsHAI8CnY+OwUEYwRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r4tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWW0bb1HRcBJG9GRF5iLJ904DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IMosTO8IgJV7epkmCgHJ8OUi3zSDAdollZ
 /+mnTuEVy5GWcyLMhLqLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwPxreSp
 SDiABYFoLc97FWeQTi3hrlYQOqHdb50rG4hPDxqOlCt2nM5Zp2o4rtZfJwyFYTLPsQ6pRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 u3yzB7fTLoCWx9mUJTcZsWwwg7jpnMagu9zARfFe4EBZEX2/YF2ACXtlftrcdoUIBDOy2LCh
 QabCBsVv8fXpIox/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egMlqPyKvwKmlpOorFQKbczwPJs/cbrqp9b0h9gQCfBYWO0B+4yOXKBx8RO6PFAn+cLpQusV
 0uT0dBGIrHVatj9GVscKQd5POSO0fYYxmvb4fgveRio4SZ2+PyMUFlIPgnKgytYdeMnPIQgy
 OYnmcgX9w3g1UZ6bofY1nhZpzaWM3gNc6Q7rZVLUobkhz0ixkxGfZGBWDT954uCaokUP0QnS
 tNOaHEuW1iIKpL+TkcO
IronPort-HdrOrdr: A9a23:gpCxPauY+oIQpdjHGveW3hRL7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64219153"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y57smHyNjswL/rrZxeiZJlEn7OTTE5UCwY25BiMAyKxnTgspi3rRj30ugokJaX/B4ESLEyD4zSyflIek36Y0zoJlqMVcHG6A17742bVt30zbZjQwmsHOtAnB9XK4BWLPAtlCJmExoqCWhlbpqnA71Rw6G+ViWE0Xhjmzo1oqqzrBTpwnO7DeTVrE33kU0IBeD4OmeadUhb5ekYyK3MTCv45jP++Xu/gbH1PBVxV65sY10gop3Vx1J5fKSF1YHX38Km1E90K3Ajys1AIAB7HtYH26gvfOWCo+hozQnSU/4O0bpnOBdIuDNTbx1SH6S5UKf8ASfCYWxqmjlRwsvCthew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m/NbrA9jbWPANH40Z1eu9xNS2W1mVadFn0RNk2u6CM=;
 b=l9HXLmIgDgrpd1UsTSGvBV81KayWufCo153hi7CJAIIRygRzig+/zr7DgsuqMBRMBya7WN1Bw/1eNiWLGZZ32X7k1WL1T9CnYj+bdtIdxSAobz/MPu71+KYTQC99q8A2NUj/1N7cAoY3mNaJt0PvhQxKz6FFtt1XGeIyMCIJZrZPoNVSsK4sUZ4aqTgd97cdtWtk75z4vqsIDtzEDzR/pb1DKdT8mKJgvVUFIYjv35O0EH0bV//t8pw4tptrztg0VwIsTKonHFcm3XLx0Yiq2JVal0dQT94hf9DppBI6hcUpfVrrghA0ZhS5LM2p+bW0GvA5Zo7uloIpdGoLCpJdpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m/NbrA9jbWPANH40Z1eu9xNS2W1mVadFn0RNk2u6CM=;
 b=ByURqYu+ugQWke5TsaWEwM2jOn2Cfvp3cV6Ud+rXRb6iRzUVWKZAKvhtnsek+jU0uKv58l9g0c5j1c155qvoakEAPm/4laDhurG2XgTMuUhL1BBwpe2pMU/Ug5FnKJjGxXGfnQc/T4EhaUsxFpc7/ZCfWMrlUv9jDsTR8zV8TIA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] x86/Kconfig: introduce option to select retpoline usage
Date: Wed, 16 Feb 2022 10:03:00 +0100
Message-ID: <20220216090300.9424-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216090300.9424-1-roger.pau@citrix.com>
References: <20220216090300.9424-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0310.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::9) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0c5e71c-1e6b-4c65-73b0-08d9f12b31ff
X-MS-TrafficTypeDiagnostic: MWHPR03MB3104:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB3104355E93F0D2C98E6F5E898F359@MWHPR03MB3104.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bvGSBYj6zuElY7Lf6NG2bQ4oVRbBh137cnGHznSaAz5Q9TTViV0eHcHsTOPnSynR54lTimPNCnZXu6k3ViXeGbHCprVMPbgK8QP9y8fkINsveBYRjPxi1sXZhRrbdCLkUG1NRXrVEdFxltsaO3av0+9GZMwvhA1UnUV7yAhZ0z9+yzoI+AXW4WLu72ikIBVo8b1Dgc/yOmgSJkIRJQEltoBvLZMQma2N61m6twXO6IyMMYYvPzZ/iY5WSvJfkZ7aG4RK6oaZqBP2fVk/+L0t5CFop6VNC/AVRTaOEu3PYJP6WQL6XLXNvvfP1txeg606OwLTwNcXhQR26yHat6IvAc9UWEbaLH9i2HmPtiH4Jiv6tr5nSjxfEA0njclDeTYhtC4r+RMf3I2dMsyUXZWDIL4BM8UOGAQFaBYgIT5xbFtMMB7YYaCRBVGU7oF7/0gthhid0+M3pJYKMNDMWWlAfr6X+il2sV6LDiBXiMG68ldUoEgzuso5Z8wpqJUD01hl9/MRBtuaF7sskEaOgZjd3AAJExp0+oPtslqhmMKxyrLRCy0K4XOAP/btfW8vUcPEzDYA46upBwmLCsdpUlSLWEWMpensZvK1RxgQ4pAM+x8tEnR+rTrMd8ittIGcxfl7ug6u5K+qGMpCuNoNhQwqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(6512007)(2906002)(86362001)(6666004)(8936002)(6506007)(5660300002)(83380400001)(54906003)(508600001)(82960400001)(6486002)(38100700002)(6916009)(66476007)(36756003)(66946007)(316002)(2616005)(26005)(1076003)(186003)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZwMmM2NFFnYzBrb25JeWlFblVMS3R1Y3lrbGVlSGRRR0NZM3RJMUlzajZI?=
 =?utf-8?B?R3JyN1ovekZTa0pCOGcxanlaRFp1czRQdWRQeWp2YVV5d2dES0FaVDFCV0hm?=
 =?utf-8?B?NS9aNGRzdjFRYXMrZXdBdmRtOWxVUUtYd2hCOFoxSTNWOU1NNEp6c1A1M0Jh?=
 =?utf-8?B?aDBNSFJudlEvd1VRdjY4dVBzZjVLYXkrTFBkT0lzNHMwaVN6SFc4MXExYmpq?=
 =?utf-8?B?QTlpWkt5VmpncGNkTkE4WFRjZjdUZ1VSZmw0L2NkQmdTZElXb055YU05NStY?=
 =?utf-8?B?bmFraUp2R2dmL1dVcUVFSEtIaU9nYndQNGUvWGt5NWR4cnR4ZFlmYnlOSzZG?=
 =?utf-8?B?U1pkaGZ1M1NHQjhKdS9rc2s2MzJyZ252bzBkVXBUNGh0dUdyVkVsaEhpVmpR?=
 =?utf-8?B?L3ZEdGJOMnpJVEJqTUhTc0FCdTJSTFNEMldIN1N4YTcweEMrdE9ZeEpNVlk1?=
 =?utf-8?B?RFkvVmp5U3FET2k1Q2g3N1gvelVIMG5PbXQ1akdSbUVzK3JoOE1wS1AzS0VO?=
 =?utf-8?B?bldFdmc4QVJBWE03NG04U2VqOENaa2FpUjZOZXRrZXI5YkxPa2MwQnZDN0t3?=
 =?utf-8?B?Rk8yclJNcHVlcTJQb0dxemk3dzgvYTMwaWl0SjIwZkQ1QlIzL0VjWU5iQ2pn?=
 =?utf-8?B?aGNveUtaaTR1ZFFnOS9udE1Sdnl3YzR3MEhFNnVFYmY5UVFMc2p4NGIxQWRR?=
 =?utf-8?B?emlYbXU0Mk1YMkwzYlZ2N3o4OTBZTFFSZHB6cllib09YTlBGUmJram8zaTEx?=
 =?utf-8?B?enU0cjNCVXR6UzVjM05NbnlmdzBvdnl3UlVUNXBQejhZR2MwM2JQWUc3bnZV?=
 =?utf-8?B?aW5RTTRCbVFGNHJJb3lQWVVpL09iL1k3NGc0TDRIQkVXbGJsS1VUd25jbGh5?=
 =?utf-8?B?RlB6WjNDZi9ZTmFjOXhDZWYrd01WNUtMOC9McnJJdXZXSzZsdjRtTnNFQzln?=
 =?utf-8?B?UGRCUzY1OHlka0VCSko4RjJ3a0Zkb3UwVG1qR3lRYWFGek9rS0RDQ0huVlNJ?=
 =?utf-8?B?cS9QSG1wSjBIbzJacHY2U0JuUFNkZCtkcEUydWRLNCtvYWhJNjVuVEJJbkYw?=
 =?utf-8?B?cktNMkRNVkJ1SVlDOUV4Y28vSE81d21FN2ZrQkRkRlVTazNpbDVhNzhweHNa?=
 =?utf-8?B?TDJhM1poZ3V5eGx2cmgrT1l5Vy9CTVpuN20wRVZsOHd6SWc5RDE4S2NvSFJ4?=
 =?utf-8?B?angzTmMraG1rSTdWMXNyRWVFOWpETjVQV0xOTUZHYUtkM0U0V0YrZlZ5bkhl?=
 =?utf-8?B?dHIzYzhudVZkKzB4bitBMjkycVJWUVlNbUxobmxVTE9LNHU0WmV4M2xKd3JO?=
 =?utf-8?B?UkErRnE3dW1EcWVoYlQzajgwTmk5bG95K29acE5CbUtPeVJibGgwRm9HMnB3?=
 =?utf-8?B?WDhrZ1ZOY0cwVVRoenJqUWNOTXI5b3B0YkxnSURNQ2xOK2JYZ2VkbXlqZ2ZR?=
 =?utf-8?B?VUlTZUtZNDNKL2lZdm1EZUprVksyYnNNM2FBbERZTjlMTm9IS3AyL3VJM0Iv?=
 =?utf-8?B?c2ExNERJbUlOT0E3UllYN3pGVkFqQWlaVDBvWHFrLzZlcU92NHp6RFlzcDFD?=
 =?utf-8?B?WjNYa3Fvb2c1MDhxT2lOd0ZLbXp4WlpPSWRna2pGdXErN25QQkVLMWVuaXRP?=
 =?utf-8?B?a1JpSzNNZUljVTlLaEY2dGV5bE8xNkRNREthdkxJeW5PellKUWRIUWpicUR5?=
 =?utf-8?B?VVF6Q3pMK2MwckVnY1l2VE4zY25adFpYWThEUHQ2dldvTlVBdEpXWDFYSGE0?=
 =?utf-8?B?bGlDVCtVaUZidVVWbCtUaFdrOUtONXkrOTE4M3ZERnZreVYxd29tOEtqa2ow?=
 =?utf-8?B?KzdVVHRMQ1plOEdySzJpZWgyaHl3bjQvY2NBby9rQXFrUHdINUlqeVBqOXNX?=
 =?utf-8?B?c3QyeUx5Wi9Jd3RHRThJVS9LYWs1SjgycXo3WEZqTWpweWJHQTJXQWd0UGNV?=
 =?utf-8?B?QnF2WXJ6bGduMFJTOTBJc0IzQldGMHhEaHd5MnJlRmZUejdiZVF3Z0twcFk2?=
 =?utf-8?B?YUtmMm9WelplQkM4b000ZzFFbjgvZno2OUpwSlA0N0oyS2xKc1dyaGgyMkRl?=
 =?utf-8?B?c04rUE5UVDlUUzJGNGRDNTRVZk5BQ0E1VUxBMVRWOVNBRHBhNWhoZDRyczUr?=
 =?utf-8?B?bEVZMWVlVTJ1OHdHb2twWWMrU0RXaTJ0b1ZkdHhCcWhJcDE1Wkt6WXdBYUE0?=
 =?utf-8?Q?jmC74iw2FgyMmiucVL1N+Es=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c5e71c-1e6b-4c65-73b0-08d9f12b31ff
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:03:27.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Chk3v1fORFTYRO5g18Tl53vY4D/hsFc8YOT8SkNGmfKE3lYQUfQwN0srNSr1yXho67rLMDNV3trG6TwkHt0zmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3104
X-OriginatorOrg: citrix.com

Add a new Kconfig option under the "Speculative hardening" section
that allows selecting whether to enable retpoline. This depends on the
underlying compiler having retpoline support.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig |  4 ----
 xen/arch/x86/arch.mk |  2 ++
 xen/common/Kconfig   | 16 ++++++++++++++++
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index fe00b4598b..7c73802adc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -38,10 +38,6 @@ config GCC_INDIRECT_THUNK
 config CLANG_INDIRECT_THUNK
 	def_bool $(cc-option,-mretpoline-external-thunk)
 
-config INDIRECT_THUNK
-	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK
-	def_bool y
-
 config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index f2aa2a515f..0597e714f9 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -42,6 +42,7 @@ CFLAGS += -mno-red-zone -fpic
 # SSE setup for variadic function calls.
 CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
+ifeq ($(CONFIG_INDIRECT_THUNK),y)
 # Compile with gcc thunk-extern, indirect-branch-register if available.
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch-register
@@ -49,6 +50,7 @@ CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -fno-jump-tables
 
 # Enable clang retpoline support if available.
 CFLAGS-$(CONFIG_CLANG_INDIRECT_THUNK) += -mretpoline-external-thunk
+endif
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index db687b1785..3b0ba16a6a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -146,6 +146,22 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
 
 	  If unsure, say Y.
 
+config INDIRECT_THUNK
+	bool "Speculative Branch Target Injection Protection"
+	depends on X86 && (GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK)
+	default y
+	help
+	  Contemporary processors may use speculative execution as a
+	  performance optimisation, but this can potentially be abused by an
+	  attacker to leak data via speculative sidechannels.
+
+	  One source of data leakage is via branch target injection.
+
+	  When enabled, indirect calls are implemented using a new construct
+	  called "retpoline" that prevents speculation.
+
+	  If unsure, say Y.
+
 endmenu
 
 config HYPFS
-- 
2.34.1



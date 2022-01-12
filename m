Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D483048C227
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 11:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256438.440031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7aiD-00039q-Eh; Wed, 12 Jan 2022 10:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256438.440031; Wed, 12 Jan 2022 10:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7aiD-00037D-BG; Wed, 12 Jan 2022 10:18:37 +0000
Received: by outflank-mailman (input) for mailman id 256438;
 Wed, 12 Jan 2022 10:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBVB=R4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7aiB-000377-U5
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 10:18:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc78d1fe-7390-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 11:18:33 +0100 (CET)
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
X-Inumbo-ID: fc78d1fe-7390-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641982713;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IphW5CWxgm7688SXgN/oJV1DNT6qRo+BJRn5pHg6ffQ=;
  b=PtCiKuEiMC5Jfye4ucGa2mVyGmoVsVhTrcWGy2055tpvEHvKf0eXU0ZC
   nBFT9ROA+9h5OgkIXrSJB2sQeAGq6nxf/uvGCU1D58pVy0mFVaKp8WRBO
   AGutWg/dkaPmtPhBWZhYKmTdJYM+Ar6dvQSD3LJLyyyVXggvep/j/tp/d
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LjZW5b+8WJh1LlYCCAy5WxL3iCXNmYscL30ajkGnqMBHIkj7rv30Gd2x8Sfvsr3CLG8wxi3Gt0
 pYzcXxienmu2268Z9EP4oWNtWHZ8W9p5CoxsU/kMrqJZsGBPpA0D2WKgWV29SraLhyyQuzbnW6
 b1XxxWr5huoip0FibaazHCAWFOMdWaE4gtdmW/YkRVLqm2g3GgRxL8gqzgyEPY992KwMwsz7dU
 ZJNypUehvXF0Q4zNzwrbO99cN/USnmwdEpHEvMvfZUqZ2GUv4UP+wGK3U2tl3amzn3RA1uAu9m
 A2Auu+qeKRzOIvq9haVB1pwN
X-SBRS: 5.2
X-MesageID: 62222237
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UF2v7KNKBneH9NzvrR1DkMFynXyQoLVcMsEvi/4bfWQNrUp00GZTz
 2cZXTuFPP6CZzP3fY9/bNzkoBkHv8XXndJiSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es5w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2TTpOB4+
 OpPjJaLVEApYKLtutokXBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uQv4UChmxv7ixINbGGf
 M4DZTl3UC//IDhuMXIrMLAPl8790xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVDkeDkHe0gRwlUeFNVO1k5yCv9JPb7FPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNxr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2LDwpJDSsjPeZJgrBED3CBvJ6sy67DHzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj0qiT9I9AIv2ovTKuMDiriUWW4C
 KM0kVkAjKK/wVPwNfMnC25PI5lCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrlBuZd2mHFW7T6DFPjTkkX8uZLDNSH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WlM3aHqtBCfAlaRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:bYw7tql1pMjaYAioEwSjoetv4MfpDfO2imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftW7dyReVxeBZnPHfKljbehEWmdQtsJ
 uIH5IObOEYSGIK8voSgzPIY+rIouP3iJxA7N22pxwGIHAIGsNdBkVCe32m+yVNNXh77PECZe
 OhD6R81l2dkSN9VLXEOpBJZZmIm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTuj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZsA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv0nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLVU5nghBgt/DWQZAVwIv/fKXJy//B9kgIm00yR9nFohPD2xRw7hdYAo5ot3Z
 WzDk0nrsAIciYsV9MOOA42e7rBNoX8e2O+DIusGyWTKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="62222237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjBGu167EeI4QidVfQLk3hHXrSjvcTk7GwD6h4kZZzmjXClFpsXER9fzzCe2jqjMSSGtVngk9JbjBiXtaZytLJWZKac4iDIqKYYfGOyFh7/vuQE/4NIlr4gE6YjV5nYrHK2N95ZILxSolUAPgSj2cFszvhQT6RgQ70bnWo7cIhFB6ledJIuafXrP8no9bJ8eH9jbNvAsxOZnK7R5gvIzNooMZEi9j5f6KVeBgXBzaQhrvssQQl25Yas9iyliTsChIRNv0NfcUU3Yw8Zwoi3pEyG6IbhLQDRuwSsEUFfjOXgKee30e3veQ2hIb0CxqCNJ2wtIKpqp62phoV+7rFTnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVVzIEZJ7nGtCbr4qtZ4tFdsPCecFgSJRYeur6mmDBc=;
 b=C5hnJQgXiLIKrfr5iUazOBKj6ZodHREmpJP1Gia0T8Vp0FpJ0Z+ryte+dkfGHxZdOQ+Mc7od59ygukpFuL7ZtgZBhOfDYp48jhp6zdmFJ5ilqtTQRGK3eTUpMbgKto1ZJ7DYlDyDaZSvtm5+YNuZgXSDolya1h2PEsuO19SaRxrLD7HlldGS3TzYFe6SgC+kzxkPtxmN7eFvGfl+A0kGPBRVsJT82SaUNyFlkQDLoLV1EEyW4Bguavf/DD1vw3ltXI33SHZFyRCrOD0RPABWjBxL0F0XblpWqFK+CuQKMcxG94zH/0tfz5FAcNC1d9qKSq0VIp8IdW0dm0qPPpqiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVVzIEZJ7nGtCbr4qtZ4tFdsPCecFgSJRYeur6mmDBc=;
 b=XJFo2cerxDElQqLs29hZx91/Prg6GSwQFQRjrY7jjspTi3WqgvjR77p91bYSwWOmEH+2iNR0XR6amcP0DF8Ex4xjO5F4P4DUzBhFA2uXc8rV+tJipkn439sX11s25WR1g9dQrBlfHAiBypHSm1Dbkyps41/hvbcSpht1apQsjLE=
Date: Wed, 12 Jan 2022 11:18:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/time: use relative counts in calibration loops
Message-ID: <Yd6q6+mT7n0yL0Mp@Air-de-Roger>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
 <34662095-6f58-4471-8bbf-1bdf67650fb2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34662095-6f58-4471-8bbf-1bdf67650fb2@suse.com>
X-ClientProxiedBy: MR2P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::18) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa36e3cd-1e26-44b6-7ed7-08d9d5b4de29
X-MS-TrafficTypeDiagnostic: SN6PR03MB3646:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3646139B86B0A9EBE5484F9A8F529@SN6PR03MB3646.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmzXH1nJGruwcFMqVLJ7IQO1RopBt/RYJpgPblY7i942vroTFyAlAgv7INmHM5QVSAgWMZqeV9iUiJMx5NaOdHx9UeCWGIqtOUJsER+nOSXM60trK7jPHyeTo0gfj2km4xsVGvQg71CudOqddn6+JhmOPjeA2FdGq1QLUhiwNnlnlnyFa+w0FAc/IZnDShSNq2nKkhIVkUFADpbKS118GfJmT7QikLoFSFX099L3JPVgEAlHbY4NeklFYBWB/+nOHyOmewXB05gyyDtZws6Q7CFDtscZ7ozfSMgIK1o/9aHofLMNNnkdQgbrJz+JMNGe+36V8K9NM387oEbdFtLZDd4yyWSUr1+lAh7juOg2h9Rkesp81T9/Gi8zATZ84fLHgFBmU6/s0yHHat03aYEMKuaXWc8cddPdRzTQi567brpKkkkA9ExSTsPmlHv8lC3lRpwia2xHKU5UxvFor079TvP+Rcd6C2tk7qneIkRdlZTaaqssQ9ylQ3fPbY3MHI9a2fDqiakJuAxflyGb7yffJ8iHaex0Dh7rSZlnRAtQ/eJcgFI8+LJQ8CP6aiFCVqSzABBrYwySdLOu7qCXcj01INd8rhwV38yi+BwSeuJRZUAxIAyaevsQ9dmZNO9pbc7ex59lg26tXqVjTaCGnahDynzzkfUU3YWngEuiB8m6dOqEMS6MHVUjkwdiNM+IsAGYm8QSCjw6PGE0qGUZFcqJIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(186003)(6916009)(6486002)(26005)(8936002)(8676002)(2906002)(66556008)(82960400001)(66476007)(6506007)(66946007)(86362001)(4326008)(85182001)(33716001)(54906003)(508600001)(83380400001)(5660300002)(316002)(6512007)(9686003)(4744005)(38100700002)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpjR2xKanhyVTVTdE9aV3REZUtGcG9idXQvY1RqVytEcGdRVXpLZEVlcUht?=
 =?utf-8?B?dG1JUHNsUklKNG14UnR0WEljbW9oYXpIVjl0bVdLMXVCb1V1dkZlcjlINnZ0?=
 =?utf-8?B?SFpYeWh0VFllSFFqNDNXLzFlR1ZXWld6RCtMc2Rvakk1RnRlTGZhTWc5c2JV?=
 =?utf-8?B?ZDJkckFwUlR0ck40Ym9MTmt6Q0RUaXV4djJXamNqWE1sWHRrcnZva3dxSm5o?=
 =?utf-8?B?MFYzY3d5UExaR2pVL005YjZhdmZVU1BIdHJJVEdFU3NyZndSYjlRNlVnRy90?=
 =?utf-8?B?endaZTQvL21xNndwVzZPK280VWwyNkhlVEJnY3FwZFpXZU9oQm5iWTlNRFRG?=
 =?utf-8?B?WHVGNXhYaUFQRlBqVFVCWlVSa3hJcnVkcEJDWVJlQWpKeE1FUmNJd0dVSW9X?=
 =?utf-8?B?M0o3cUQ3TzBiRkNpMEdLL3FJUUJvM2Fuc24zRjFQaGs0VjV4MnU4NzRMZXIy?=
 =?utf-8?B?MzErRW5RdzNuTGc3SUtESmpvdzc2U3lITzkyazZLQTF3STBNbEV2MlFDaVRM?=
 =?utf-8?B?MGkweS9QcEFYbThEMm55ZktqMTZhYWJjU2YrWDJLLzJvRW1ZYW1vaXVHTXUz?=
 =?utf-8?B?emRtTHd4VC9YeTJwQk40WDR2Wlptd1Y1Uys5S2tCTGJaRnZ2OW05cjd5eHZ4?=
 =?utf-8?B?a0lDT09ablMvcFF5K0p6NUl2YjB2T01CL3NDN0VoUWNkbW1rVWVqQTdIQVQy?=
 =?utf-8?B?TFU3T3lvN1hkM0puSUp1UlN6K1hwcXRDeWd4Q2NXVkRwalFhTW5LWGM4MXZo?=
 =?utf-8?B?VGdGRkNLUmJPNFZIaitjTVVYU0g5Q0h1eGl6QjFRYk51ZkRoV2Y3WDc4TEJV?=
 =?utf-8?B?eEE2RkpTT1dnbXpXb2FZTjM2c0czdGJtWTBRVDFKc2o0QWNHRXNsdWo2YTFw?=
 =?utf-8?B?VUhuUUJ5anAzUkZwOU5zYzhBODJjanhvR0VYQXVWSW9xWTRUNGRBdHJjMkc1?=
 =?utf-8?B?bHJaSGFGeEtpTW03Z1JyMTlsWVkyNWdQM1J2cGpHQjVoWWUrR3dlYm02SW1H?=
 =?utf-8?B?bVh5TnYyUnpEblFEdklFMDdYK2dSZGxtM0pKc2UxWk1OSUxLU0ZMaFprd0J3?=
 =?utf-8?B?Q0VJL3NUUlZudkp2TDBKREFMYU5aVXR5TnJrUUMyV29INnlDbFZ0VFdQeSt4?=
 =?utf-8?B?UWY1NEpoRWdZSDhRZjhsd1NTUDYzejJ5dUQwV2g3TmlKOGhJYld3RjhnVlV5?=
 =?utf-8?B?aU1GcTBLS0ZoMHdWVEdVQklkNGFENEJRTUVIdHRnQVdDT0RWM1lmbkJRU2dK?=
 =?utf-8?B?T2x3S0FIaTdCYkNrTnh2TFpuOCticzloWXlFZEZNY21QNEk4bEw1ZTZZckhE?=
 =?utf-8?B?c2x0ejdvaWhNZmVqMUoxRk8wcGFGemFONThkM0tMYlZZZVJLZ2U5TGJFSlk0?=
 =?utf-8?B?NWxFeU1CUGIxSWlOMldlRVp5UGlnbzJMK2EzQXFmc2tORXo2dzFNajF4alVh?=
 =?utf-8?B?Z2Y3NmRZL2dDV2g1emcrdlhZa3k3OUsvZXI0VWsxbVhqc1lkZDhNbC9mOGk5?=
 =?utf-8?B?dE1VdnZmdHR0TUJRUjA4UUhUMUdDVTFoSmVDaGYxV0VWOS9XMlVGSlZIclZ6?=
 =?utf-8?B?VEFvMGJXajM0bm54bUxBeFVMT21LTUNpQ1Bubk1KU3drbkwzSmpacnpoK0NQ?=
 =?utf-8?B?NWdQTlY2RTdmWDAydkZqZnFSaFdmTkYydWJnWnN6aXdrYjZOUG41N1JXSm5r?=
 =?utf-8?B?M3cvVzlHUzVsbFZFVFBqclpUMk1JS3E3QVluZXFBSGRMRG9FbVpWZThVZzdT?=
 =?utf-8?B?azRQQXk5bXhHT0lzOE9aOGpZZjJIZTc3NWt1bk8wanc3eTF2U29GRnQ1NEx1?=
 =?utf-8?B?Wkgxb1lmNzhsSWVGWHIvRnhoMExmV2E4VVpNcWZKSnhaaWUwM2Z1WXFad3JM?=
 =?utf-8?B?NDNHWnNSbUluMmxESXc2eGRDQVQ1WE92cW1kZmQwRDRScGszWEFkdTJmalh2?=
 =?utf-8?B?bUhBSGZRZzBzc0tJUUxOZzV3Q1MvZ3JLU1ZlQzVUTlVNeEVpUjM4UmM2a3Rx?=
 =?utf-8?B?N0I5WkZNRFJ5K3pXNTY0ci9taDdma3JBUHJ4all5UGlBcU00ZkRBRVBIOW8v?=
 =?utf-8?B?cWp5OVFtYTZPSjYrVlI5V1BqcG9tS0FURzFGUmlQY3ZVVUt0WmNIWWUvTkM2?=
 =?utf-8?B?R0llYlBxeCt0Y3ZWVGF6b0JMd1ZiNGd5Q3ZIemFNb0p0aEZTTnJmczdSUWw0?=
 =?utf-8?Q?d52kWFRVqNTyfVnmn3LXhp4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa36e3cd-1e26-44b6-7ed7-08d9d5b4de29
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 10:18:24.8820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKfutMSqoQf2LF95KB3/9MeA8Y05uz5HyAzEZqnK+ZYt0fcT8cFAn1j20Dph7R7ed/wMseCPb7ZS5IkML8P7mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3646
X-OriginatorOrg: citrix.com

On Wed, Jan 12, 2022 at 09:55:17AM +0100, Jan Beulich wrote:
> Looping until reaching/exceeding a certain value is error prone: If the
> target value is close enough to the wrapping point, the loop may not
> terminate at all. Switch to using delta values, which then allows to
> fold the two loops each into just one.
> 
> Fixes: 93340297802b ("x86/time: calibrate TSC against platform timer")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


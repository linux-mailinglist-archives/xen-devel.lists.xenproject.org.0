Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9757203D3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 15:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543146.847850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q55Hl-0003Gr-9D; Fri, 02 Jun 2023 13:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543146.847850; Fri, 02 Jun 2023 13:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q55Hl-0003Eg-6M; Fri, 02 Jun 2023 13:57:45 +0000
Received: by outflank-mailman (input) for mailman id 543146;
 Fri, 02 Jun 2023 13:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q55Hj-0003Ea-UB
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 13:57:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fe26946-014d-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 15:57:41 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 09:57:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5805.namprd03.prod.outlook.com (2603:10b6:a03:2df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 13:57:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 13:57:28 +0000
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
X-Inumbo-ID: 6fe26946-014d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685714261;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KbaIwqTarrycL7QRGWv0CwZ98lashMBWsYaWFDBtbHc=;
  b=b0/i5kj1mKxue8LQgzM1KAUUXTKkhqaCOZtuc6T22AKfqbSWE1B0ATMC
   es2ECHo/rtd8f8K/L+cKJeD1Idwtsk7Fr74np2IFregAEZiE9s5WFdmmb
   PxJIPeObqmCdZ8v/ocxEnHvgqK18zJc4WvQyns30JLV1LNazLEVYo80cG
   g=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 113867953
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:abUYe6AAwotVGhVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApD52gjUAz
 GVKXm6PPv7bMDD1LY8laITk9E9S7JLSxtAxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A5ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpeJMDU9s8
 NMiAQtdMzGAnu7twuvhc7w57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxnOlB9NPT9VU8NZzrn+pwlQrBCFKWFG0nPypjWeVcI12f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBRw1a5dDm+dk3lkiWFo8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:vSBv06AuINx7UxXlHeixsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ4OxoS5PwJk80kqQFnLX5XI3SJjUO3VHFEGgM1/qA/9SNIVyaygcZ79
 YaT0EcMqyPMbEZt6bHCWCDer5PoeVvsprY/ds2p00dMj2CAJsQizuRZDzrdHGeCDM2Z6bQQ/
 Gnl7Z6TnebCDwqhoPRPAh2Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6e071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6u9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW22/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLQU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6UsoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPTHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwLzvn0ehT+Yd3R8LAa23Ag0YeMAIYDcBfzBmzGqvHQ4Mn2WabgKr
 GO0JE/OY6WEYKhI/cO4+TEYeggFZAvarxlhj8FYSP/nivqEPydigWJSoebGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHfZpa/ummfZ0/Q
X-Talos-CUID: =?us-ascii?q?9a23=3AcHGl22t5ClOswuA9d42+EI7H6It6dkbR4lXVDHW?=
 =?us-ascii?q?RMjY0ab6MRQSSofldxp8=3D?=
X-Talos-MUID: 9a23:1lQGmApZG4qdym0etB4ezyhMFv1s25yiNBwAm5o7vtmDHAdbZB7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,213,1681185600"; 
   d="scan'208";a="113867953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHmAaJH4WGCnNES+n+PiKt3qC7NPC9YDwpOXHooBFfzyYdUZJhaWjMBXYlxB6w2fW780Zlpg6sv9KwjVpPy5fsFc3/2NKVpHdggTyMg0M21grfxdzll4ZJKe7BJKiLJih+TizupcmzHHedP8boHwxdKmVviFuPBIsr6CkFRvKvOYYOjXUoz4kIbeseA47XKbqbEExYh1F/mm/x08GNtfSpLLt60poXONJeSDUg2kPFy7cKPGMKL8ilY+apIDtwl42SH1OmYxNhBAeU1qJp9iqJ+6txETgsGf7D2MmNbTPJr+wUvpc/RV63CBR7Y270hvgFm3Byo6hZi3AifMXXdVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9qJjWJJC/OsBSkDD2k4xmfgM5IDLUZlUv33oXvl3Og=;
 b=HMaQt7U9saxael+KvEos612GPKMcm7elH18jegj9WLkE+Ia5QO+QjcRo3L3lP1flXYdOPSayoLnR3pKfQm0ilWiu2n//z+tzVRCyLmrO15cznpuEnuizxb0O/BGYoWVWL6mdQRdcbUHiBhBH6ra/jKIbqi04xYUNgPYgr5k6u1GzcDQed/ZHb9YWyQw3/5dx2CRDU/2Npc8qP2Lazk/apU1gbB9/5sbaSfhGjigfmtLG1/yT3LIo+QfiPnVB3hsthPoXiAWDDh2o+JwfWnmtGxzj5X5m5tAOZGtIADvM6dhJWrls3xmZ9XdxUfnVJYbsrVtxuDBJ1xi63QYyCn6/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9qJjWJJC/OsBSkDD2k4xmfgM5IDLUZlUv33oXvl3Og=;
 b=bhdZnXhOQgduHMNLIh1Qvzp4vYzbvBXST19X05trJDPn/wKxh3pBAeDzUdcDu1VlWdAO+kht5E8v6EXMWc+yLmQGvqXfXzWeKXJn5oeLslwKEAiRby0/zIDG6lvL2WEeoEUkk7h9Szh2dL7jwhB2dxRA3x/wN/uPEuw0UAKimGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b7f848ed-5336-b3f4-3011-da10bc335d5b@citrix.com>
Date: Fri, 2 Jun 2023 14:57:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-3-andrew.cooper3@citrix.com>
 <36b016e2-b378-f97c-42da-86a330471bf0@suse.com>
In-Reply-To: <36b016e2-b378-f97c-42da-86a330471bf0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c00c57b-4a6e-4765-7711-08db63714cc5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dB492f8/XzXF9QXpXAGPX6rKaICGro/xlxEX5UVhPTtaM2jGfvlTfhnBpST9Zh1VDycqBZiSoukj1semlBMaQbj4nlZkCjPwmudiE3i+TDA614CH3RQqNZPhLGcRxwNN7GYOImlBOvhq/J07uLf6j1uZfptD+WIm6UdJ1s1WdSZQVVlRdzbSaBbHYgOVKPrVTIGgk8zfah1agy8D9yaVDyyTCz6nuOnr/PMoznKUQCnPe4EHSu5Gu4OrwOZ40C3RCRH+IvGCadjMGc+3acoTu9apdupU1j3VICGd+L6nqvEqw1ighKd64U+QoTHKzImgWjltVBPI1IvSaHZxe1OZtgtkAJC/iPNS8pqfKNKezGKdXMm5kX4iyvM/Qvxby1oVJZJcG2y3IHucNxgaUYowV3dpDFC2ZiDqstvdVUJyiFvXKuFvqV3bcb0xOoLesCERXrMsJUkGX/wI2rtmFIdLRT7ONUB5xTLM5kJffsREmEmEiJN8CHKeuKW9rfjRNOBikU9STKYblgMcpyIUozNnIn8UfQLMS8HAe1aiNeg7D9ZJULKfrNIHkMGBajawZNmF69wBmDI5K3NQBovC3LEeHmkf2CoeVQ5y0daYCRMKHX7tC41Ep5LxbR7cVAMpfgKE3DHHU5vybdHGaWlnE7VBXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(6506007)(53546011)(6512007)(86362001)(31686004)(31696002)(186003)(66946007)(66556008)(66476007)(6916009)(4326008)(2616005)(5660300002)(8936002)(8676002)(478600001)(83380400001)(66899021)(2906002)(6486002)(38100700002)(54906003)(82960400001)(316002)(41300700001)(6666004)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnRSSTMrYWNOa24yK0t4T3Joc3pRMzFJc00wZ1gydzVBNk9EbHBQS1JsZ0NS?=
 =?utf-8?B?bm1Pai9oWDZ5K1JwQlpLRWovb1o4T2tHM3B2UEZNdDFyQWZBNDJZeTB3d0dz?=
 =?utf-8?B?SXQ5ZGJ5bC91UElUR2pYWTU3WHNYUUFFRXlFOFVhc1J2SklpcHJQY2V1VDBk?=
 =?utf-8?B?bUNPemhwb0hDa3RUNFE2MEFrSjRFSnRrMmZzUlpuc2pIVENpNGpBUUtCcXE4?=
 =?utf-8?B?MElwWWswR3ZHZ1FjV1RZdDQxT1hXdzZnVzRkcEkvTHpvWTJOZVRCWkJBMmJC?=
 =?utf-8?B?NjIrdHE2blQzdXJZT2I3Q2cvVys0a0ZoaTlwaUFyOHRoQVQ2TXo5Z0xVeTZL?=
 =?utf-8?B?dGplbzQ3MXZxbDd2UjF5SGFzRHRzako2V3gxb0NVYkRaQlllVXhOcjhydlVN?=
 =?utf-8?B?ZXBYbWkrZFFWTTdmamg0SDVNSzVxZ1lEZXRGNFEvL0ZaMm5ZQXFSazNibGw1?=
 =?utf-8?B?TExhczRQUGIxOXRURVZPdlV5SjcxVEtWKzlOQTlHWWRjbXRZZmZoaHRzNXhN?=
 =?utf-8?B?cjJydDdLWEtlWnIyYWlXRnRoUVZ5TFdqMlA0WEdKN1FkRUN3eUhHb1lqT2Jk?=
 =?utf-8?B?aml3UzhIcTk4MWtGM3F6Sm04SE9VL2R1dU5RaC9NSFpHZHJKODhkTEFZaHFh?=
 =?utf-8?B?SS95d0ZGMk1zM2c5c0hrRGJhKzc3WWtUNldMb1lvK3pmL05tTmFnYWo4ZTIy?=
 =?utf-8?B?Y3hzcWdTSmR5RXpvV003NkZPZk1Lb3hVc0UzcTdRMEdwclI4UThzMk04NlJl?=
 =?utf-8?B?S2J6a283VUdGSVNpYUFYOW5CclpOMkx6UGR1YyszL0daUXB0dmZBTG9Kb0FT?=
 =?utf-8?B?OGZEcmdIT1RFTGVkNWR2UzczNHhBTUJtQkUwMC9BSmx6Q0xvckZ5SzRLNlFD?=
 =?utf-8?B?SWJnZHBRejh1NDM1YitWY1V2Y3VvWm90eXBvWkRwZS9maUI5Uml0dWZjZVU0?=
 =?utf-8?B?Y3Y4Z2FFc2xRWUF6VmNsZ00rQ0tuNFRIWnAzd1FYcUQ1T0dCU2lkeXZGc3VF?=
 =?utf-8?B?aXpFYURZa3ZDVXVVOEg1WGtpekk0dTdBOVFtZ0lKdHVlV0Q0NUhMai9vaEJE?=
 =?utf-8?B?U2d1bmk0YnRDNmVEbUV4YThZcEdTRkRsZnQzZ0toQ3dWR0FVRHMyS25lTHdI?=
 =?utf-8?B?cW9udnI2U1ZqdEZDUXY2MkxvelhTL0pTbjY4aGpPZ29TQmorRTM5SGpLdjdy?=
 =?utf-8?B?cmN2aUtHcU8vdXA4ZXNZd3ptKzBLdG9EbHNtSWRYK2hkWTlxMDZnck00dG1J?=
 =?utf-8?B?ZkJxN3hReGVFTm1NSWtOVDhyVjhHUHdNZjNvcFJTcWlsRGFKbVZJbmZsdE9v?=
 =?utf-8?B?alhMVzNOOFNEeGR3MHZ2TG9vNFZ2dzY5VkdnV0Z2Qjhka2dFdEJkVk8yczgz?=
 =?utf-8?B?cmJDS1IrMjNiemlPalNHTkM2c01GcklteEZQOGM5RnpYMnY2ZW9rUHZWNW5v?=
 =?utf-8?B?eWV0dURVZGJxSXB5cTlrc1duU1VENVEwUTBxZFdxOUZ3N3BFT29PenhKNm5H?=
 =?utf-8?B?TkVBR3RLQy9JUnRYZGhSVURCcmJ6N3h4S1NIMXlEUWdtVHBVOEpsSlU1VzlH?=
 =?utf-8?B?TDJpTWxNMkpKYTVDVjYvVlFVeEwzVjZRL0xkTHRiczNUeWdhN01RRVdrVnpS?=
 =?utf-8?B?SFY2R3ExNmlQbGdoUGhiMDA4c1ZzQUtZM0dmSjV1S3kzcTYrOEZhOTc3OHVS?=
 =?utf-8?B?YkZvTHlndUQ1R1k4WmgxbG5xY21wNENsR2hWTTIzcGpaN1BmQ0NOQmRDQ3Zq?=
 =?utf-8?B?Vlh3MEV3Sk95ejBmUnltMWtiaVgrbnJON1lxbGo5UkUxNDAwNjYvWGhTZFhT?=
 =?utf-8?B?NEVSMFRKQmdYZ1pTQktqZitnOXpFOTN1RmtPVkh5L1I4R2hPQ1E5blZQUHk3?=
 =?utf-8?B?WHNsZHJOWitzNWtYSVpYbW1wODJJNUZ2Mll1RFpJZE00QXltc3RZbWpiRFhZ?=
 =?utf-8?B?aEhvUlBZQ2tTdlh3K0tFL0I4a1RFd3kzbHVOQ1Jkc3ZxemgwcDRQR3BuaEpm?=
 =?utf-8?B?UW5IQ21uK1poVWpvWjlXRXFva08wS3hoaDJJVjJXTjZOeEtmYnJwU3gwSGJu?=
 =?utf-8?B?YmllMnhjWGd6WThwU3czYzgrRW9iNzloSGE3aDVNcGhuY045YUliU01ZZ0NV?=
 =?utf-8?B?eW1xMFduOWVWZ3l6c3JndnFCb3BCVmMyMnNmV2J3Y1VNYU9pbUxHQ2RXT1Z4?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7eWLaGWdOIsizaj7RqDBXnHu4avHQ9H8IqWDzPh57QLYThxYxz+34/umrV6eCiF5CYMSfkM2i4haa/k/iMT39IoXh36mtT4NPIDMrFZSqOANlfWvvwkiw3aOSsAYVW4H5D972B2keURWJLv7UwvRzqAkLtzhhOn9/qmOdoM53a4Mzxq1hp28GoDMdxM+E/l/sJddJ0YHxnNIpId5eZJzA/pFGUDwc/WdLPzO9cVaf7AYycGL2GFkLe4hK/cfD0Pl6sCP72Ll6LEOeuaF2GCZsiC17Lc3HSOLainJyZEsEGAVTVlUiuwC6/yeRalu7+TEfHvFOWwvOvNPVyKM2XqruG5u0W+o/47F1ulCuR9frMl+qQd/4UuERjF7mFgGKFIt+zolbXpgnGHwpxL3YSKKXoieWCOOzDeUQ7oEON+EyzSyyaAx0X2z8aI8+uOwwYAydqMBt8Jm6Ysna0hi5XyFfw/KLlWMF7jRsbx8F+jjL/R86aWcyqkyWZmqElWUWtJ3eBZL86QiqqaZ/FenCd3Bw3V4XPy9CXtjvC7PMvzzWdE4vXo9i8yLWtZBVfP2nyfjnt0qIo9CbKwGjNFs+UPxj9iHspudmWXp0VNhOvW2c/1JZgH3RCFQ+QMsu8NWwbWUtlIBmhoXMspHYo3pJej0u/6WSrMks8osV8ENCrfXdrKKMjILscGVGvfNohJzGPlN0mRr4DTJLYD63UMwjZm2WF41VvucMGsaFBJFF3TWruBd/iUCUe6rdpFofmbL3bfB9KncFjOxckpUzu8BCO0/jSeBd8MF8rF4N7XLBfVbsYftRgJ4o1pO4SxvwpjTsd8q
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c00c57b-4a6e-4765-7711-08db63714cc5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 13:57:27.8187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGMZEfceI/GAWsXgqb3d9hFBZjO1aC/9oWJfMNpWx9w0BW11k6PXcajY8/vYqZsApDB+XvPjuRTO9FqjTOl1e9yu5a+kQA3SusMwJLqbyQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5805

On 02/06/2023 10:56 am, Jan Beulich wrote:
> On 01.06.2023 16:48, Andrew Cooper wrote:
>> @@ -593,15 +596,85 @@ static bool __init retpoline_calculations(void)
>>          return false;
>>  
>>      /*
>> -     * RSBA may be set by a hypervisor to indicate that we may move to a
>> -     * processor which isn't retpoline-safe.
>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>> +     *
>> +     * - RSBA (RSB Alternative) means that an RSB may fall back to an
>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>> +     *   this property.  Broadwell too, when running microcode versions prior
>> +     *   to Jan 2018.
>> +     *
>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>> +     *   tagging of predictions with the mode in which they were learned.  So
>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>> +     *
>> +     * - CPUs are not expected to enumerate both RSBA and RRSBA.
>> +     *
>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>> +     * behaviour directly.  Other parts have differing enumeration with
>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>> +     * to guests, and so toolstacks can level a VM safety for migration.
>> +     *
>> +     * The following states exist:
>> +     *
>> +     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
>> +     * |---+------+-------+-------+--------------------+---------------|
>> +     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
>> +     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
>> +     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
>> +     * | 4 |    0 |     1 |     1 | OK                 |               |
>> +     * | 5 |    1 |     0 |     0 | OK                 |               |
>> +     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
>> +     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
>> +     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |
>>       *
>> +     * However, we doesn't need perfect adherence to the spec.  Identify the
> Nit: "don't" or "it"?

Oops.  This used to read "Xen doesn't need".  So much for last minute
changes.

>
>> +     * broken cases (so we stand a chance of spotting violated assumptions),
>> +     * and fix up Rows 1 and 3 so Xen can use RSBA || RRSBA to identify
>> +     * "alternative predictors potentially in use".
> Considering that it's rows 2, 6, 7, and 8 which are broken, I find this
> comment a little misleading. To me it doesn't become clear whether them
> subsequently being left alone (and merely a log message issued) is
> intentional.

It is intentional.

I don't know if these combinations exist in practice anywhere or not. 
Intel think they oughtn't to, and it's quite possible that the printk()
is unreachable, but given the complexity and shifting meanings over time
here, I think it would be unwise to simply assume this to be true.

But at the same time, if it is an unreachable code, it would be equally
unwise to have a load of fixup code which we can't test.  I've still got
the fixup code in a separate patch incase we need to put it back in.

I have checked that this printk() doesn't trigger for any of the CPUs
and microcode combinations I have easily to hand, but it's not an
exhaustive test.

>
>> +     */
>> +    if ( cpu_has_eibrs ? cpu_has_rsba  /* Rows 7, 8 */
>> +                       : cpu_has_rrsba /* Rows 2, 6 */ )
>> +        printk(XENLOG_ERR
>> +               "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RSBA %u, EIBRS %u, RRSBA %u\n",
>> +               boot_cpu_data.x86, boot_cpu_data.x86_model,
>> +               boot_cpu_data.x86_mask, ucode_rev,
>> +               cpu_has_rsba, cpu_has_eibrs, cpu_has_rrsba);
>> +
>> +    /*
>>       * Processors offering Enhanced IBRS are not guarenteed to be
>>       * repoline-safe.
>>       */
>> -    if ( cpu_has_rsba || cpu_has_eibrs )
>> +    if ( cpu_has_eibrs )
>> +    {
>> +        /*
>> +         * Prior to the August 2023 microcode, many eIBRS-capable parts did
>> +         * not enumerate RRSBA.
>> +         */
>> +        if ( !cpu_has_rrsba )
>> +            setup_force_cpu_cap(X86_FEATURE_RRSBA);
>> +
>> +        return false;
>> +    }
> No clearing of RSBA in this case? I fear we may end up with misbehavior if
> our own records aren't kept consistent with our assumptions. (This then
> extends to the "just a log message" above as well.)

Well quite, which is why I've gone to lengths to state what our
assumptions are.

Right now, there is nothing in Xen itself where RSBA vs RRSBA matters. 
Until this patch, we don't even have cpu_has_rrsba, and remember that
Xen was not vulnerable to CVE-2022-29901 (Intel Retbleed) because we
chose to use the microcode IBRS implementation on early Skylake, rather
than hope that Retpoline was safe enough and go with the faster option.


In v1, having RSBA and RRSBA (working as I thought they were supposed to
work) *did* matter for the default cpu-policy derivation to work nicely.

But that was invalidated by the clarification to say that RSBA and RRSBA
should never be seen together, which in turn completely changed the
derivation logic.

In v2, it doesn't matter if Xen ends up seeing both RSBA and RRSBA.  It
explicitly can cope (by treating them the same WRT Retpoline), and the
derivation logic now calculates both completely from scratch (and based
on RSBA || RRSBA).

If Xen's assumptions change, then of course we could end up with
misbehaviour, but I think it's unlikely, and I don't think this code is
any more liable to misbehave than anything else in spec-ctrl.c.

> Also the inner conditional continues to strike me as odd; could you add
> half a sentence to the comment (or description) as to meaning to leave
> is_forced_cpu_cap() function correctly (which in turn raises the question
> whether - down the road - this is actually going to matter)?

Look at the single user of is_forced_cpu_cap().

I am not micro-optimising a single branch out of the init section on the
blind hope that the contradictory behaviour it creates won't matter in
the future.  Every forced cap is an abnormal case, and it's almost
certainly my future time which will be spent unravelling the
contradictory behaviour when it comes back to bite.

>> +    /*
>> +     * RSBA is explicitly enumerated in some cases, but may also be set by a
>> +     * hypervisor to indicate that we may move to a processor which isn't
>> +     * retpoline-safe.
>> +     */
>> +    if ( cpu_has_rsba )
>>          return false;
>>  
>> +    /*
>> +     * At this point, we've filtered all the legal RSBA || RRSBA cases (or the
>> +     * known non-ideal cases).  If ARCH_CAPS is visible, trust the absence of
>> +     * RSBA || RRSBA.  There's no known microcode which advertises ARCH_CAPS
>> +     * without RSBA or EIBRS, and if we're virtualised we can't rely the model
>> +     * check anyway.
>> +     */
> I think "no known" wants further qualification: When IBRSB was first
> introduced, EIBRS and RSBA weren't even known about. I also didn't
> think all hardware (i.e. sufficiently old one) did get newer ucode
> when these started to be known. Possibly you mean "... which wrongly
> advertises ..."?

ARCH_CAPS equally didn't exit originally.  ARCH_CAPS, RSBA and EIBRS all
appeared together - see how they're bits 0 and 1 in the MSR.  RRSBA on
the other hand is bit 19, which gives you some idea of how recent it is.

The original intention (AIUI) was that ARCH_CAPS would only exist in
CLX/CFL-R and later which had EIBRS.  But it had to be retrofitted to
older parts in order to enumerate energy-filtering to fix the RAPL
attack against SGX.

The guidance (again, AIUI) was always that if you can see ARCH_CAPS you
should trust the value, if for no other reason than "your hypervisor
will want you not to use a model check".  And this is also why it's
taken so long for us to ARCH_CAPS advertised - advertising ARCH_CAPS and
getting RSBA wrong is worse than "sorry, you're on your own".


None of this is perfect - it was put together in reaction to emergency
situations, where "doing the best we can, urgently" is far more
important than missing the deadline.

Personally, I don't think the RRSBA bit is useful, and I argued against
introducing it.  It literally means "RSBA, with EIBRS restricting which
alternative predictions to select from", and IMO adds complexity with no
benefit.  But others wanted it, and the rest is history.

>
>> @@ -689,6 +762,15 @@ static bool __init retpoline_calculations(void)
>>          break;
>>      }
>>  
>> +    if ( !safe )
>> +    {
>> +        /*
>> +         * Note: the eIBRS-capable parts are filtered out earlier, so the
>> +         * remainder here are the ones which suffer only RSBA behaviour.
>> +         */
> As I think I had mentioned already, I find "only" here odd, when RSBA
> is more severe than RRSBA. Maybe the "only" could move earlier, e.g.
> between "are" and "the"? Then again this may be another non-native-
> speaker issue of mine ...

Well, that is something which has arguably changed between v1 and v2.

Originally, this was really just the Broadwell and Skylake case, and the
point was to explain why we weren't adjusting RRSBA too.

But yeah, I think the "only" can be dropped given the other
rearrangements in v2.

~Andrew


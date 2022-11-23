Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C4636458
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447636.704122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwp-0001Ia-4n; Wed, 23 Nov 2022 15:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447636.704122; Wed, 23 Nov 2022 15:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwo-0001Ew-V2; Wed, 23 Nov 2022 15:46:02 +0000
Received: by outflank-mailman (input) for mailman id 447636;
 Wed, 23 Nov 2022 15:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nECt=3X=citrix.com=prvs=319181206=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxrwn-0008Tb-7d
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:46:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec1a544e-6b45-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 16:45:59 +0100 (CET)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 10:45:56 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:45:54 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:45:54 +0000
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
X-Inumbo-ID: ec1a544e-6b45-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669218359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=UrpvtpZaeWpkhTDTGxJ8y1lv9LpWbxzT4fLSQ71R7qo=;
  b=dfpAgKsqAdVSrmoHu6XQFg1DfI1Uk9Gj33/LjIe0PFz1FLkJnkvL1PUN
   d4Onv2ZVRIq99vJNMuE6JDQuP//IWN+vHVywOG8zKOZOEJOMJJGgrPzBN
   BADnvsu1WZfl7RMfKCdQRDyNph+1scfyKip7yySCZMgBuzaXCRp2mJiX1
   Q=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 85444277
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jQqrQa46PrhZyfr1gISE9AxRtP7GchMFZxGqfqrLsTDasY5as4F+v
 mtND22FOK3fMDTwf4xxatmwoBtQuJLTm4NgSlBsqik0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 9kdcGAcUSu619mI2Lu5VshvhMoSI5y+VG8fkikIITDxK98DGcyGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0oojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwH+nBNhNS9VU8NZIngC4yW4PNiQSemmGoOOfk3aFcMpAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpbdU8scYsSD8C1
 1mXnsjoDzhirL2UT32G8r6e6zi1PEA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhC03hrFWiNFR0ay+pQzDm2j1+MiPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:MqGD56CHgYC7yVblHejMsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOuIP6bQUADxsH7hDLqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k5spfCNeKgs01LCyprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTo9OwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mhcDiXjo1B+dImIocK3LimgIdleA59J
 gO83OStpJRAx+FtCPh5+LQXxUvskavu3ItncMaknQae4oDb716q5AZ4SpuYd49NRO/zLpiPP
 hlDcna6voTWVSGb0rBtm0q+9CoVmRbJGbyfmEy/uiulxRGlnFwyEUVgOYFmG0byZ47Q55Yo8
 zZL6VBjth1P4ErRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+Ig4Lr4Y8y+PqhdPUzvdQPca
 z6IRNlXFMJCgHT4ZXk5uwIzvmNehTwYd3V8LAe23Aj0YeMAYYCMkW4OSITeoWb0rEi6/bgKo
 aO0aJtcoHexFTVaPd0NnXFKv9vwFklIbkoU4UAKiWzi/OODLHWncrmV9uWDIbRMF8fKxDC6z
 04LXXOGPk=
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="85444277"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/KeZbFRiSnLUe9BC3VTc4e3xSQQZ7b+SScNopmXXn9wYsyvVNcyhNHMEOzHpKl+QpA9sVjbzTt42jYI5+t6iPPkGHbcjxZx7M1iPpGKanj10SElI2zGAyOSS0fWCKabbKL655BEYuj8RXWKiXVibHQe4vuUOEP14w2GcCvoLb7Tcoln94DGduT/Vq+wZLiyMp19C/MgaCf3X9VziAw1xX9vNSht9DCJdArRvHun6iELfYSr4hmTYKnuEEzjgZM8MIq90I8dE/BxPs13G1brWWh9BvtP/3fDWSMIXjQWBf36D3enCrgmiZm6UEKKPDG1DntRV8SKoTlfSz2wQBDfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aga1YY/munjCHPbgajSJWWRT0kc52lET3HS0iDBN2nM=;
 b=BSCR+YFCYZJuoLaJPJB/nARdNDbWJQIedkq1UCRU1JkjlzAqdbNTt4Bmm1nsAWVsP+CpetyIAHN2yZwl7y0hsE8AkKiH2eeJbEDI3pKg/vFc0gjYpVK7pS6czK0EqlPU+fc/FWB/oueZ7SrYtoE2OvQJEVbGm/VjsBJdTEbNJNnJF9qaXcDUM6NyqrK9mYgb5oiQqWICs80AYkmI6SikqSLADiRJX3v19pVQSRZAaLjfWMFA4pRSr9euon992pdwITRkoDzLAIEUC7hFz1CEn/6ZeJ8gkTABuzeXW9l3XolVJNyJmfyW+zyAaF4dwsooF1Y0mCpV7DEha5Jt+yHBfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aga1YY/munjCHPbgajSJWWRT0kc52lET3HS0iDBN2nM=;
 b=Vz2pWkqEdIRaRUxNk7MknTJ9LFBteycWuRAkMN/qROtElL+9WyXm8z2Z+PcvY9mUkDHwAyqq4CwZtSHw/8PtpTRbfsrFV+A9fS3Y0XpuieBhn76EmZDIgUmzc7MAwvPbnYAmv/AWuzSuhUQRqenhGOPNyYe6cA4Nh5QQ3cVYYR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] multiboot2: parse console= option when setting GOP mode
Date: Wed, 23 Nov 2022 16:45:23 +0100
Message-Id: <20221123154525.63068-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123154525.63068-1-roger.pau@citrix.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a06453-8767-4139-bfb7-08dacd69ce55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xFxqpbXkR9wGVTnTAAI7qL6lhGQX363BxkHt3GDRUDGiUD5e/x/A9DRVTu1ZHYHaFBOk3zTZkPLcYxwfuyksBsLrJznjeQUE3cD027LCnP6mp87FkHNcPvhRaDlWT4ct+izb8GTTqQjbyNfjpwa4VhiQFkjZZOUP3Ar/AbVterjaU0ciEmdDAZeEp3V+pAJOuMlhB1Bc7/rWMnszGDQw3XdBEryqriRt0dgOuvYMwkbkx4HFRd7a0suY136yxBniik+en7XGVXCN2WwV3v0gtIJ59bwunbbIdC1FgrD5vqsMeLFBtD6aUszZ8PqqVNLjBxlqBAQnhgKKdoZIGB2up967pQ3BVBGX4KAW/ZUTpTQgg+xPccbLLmMc030NY45BQkyMG1THm4LOJ6waOmWnmXXqP3QvweR0fbQK19c9D31qrhgMjeMD5e8HkBtzQoVxJkoOGF/yjkPsCdUaTRtP20VBWxHQ+JYxBRInLQnEtYLUIIl7SqAg9WRPQIy3BOGdkEX8Z25eWc8Xh98GAXXsxbpavNFhAOa8grAXz0GzrfejAYWi0EmdZ+sP5CdZlUe/jlo24ee5F+xTp97b67OkRnWB/dDBUlcseFhcbaPlws73VFMM14k+reorUnLljjRDB2kTKe+8In0kYVx6PbJ5Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(36756003)(86362001)(41300700001)(66556008)(66946007)(316002)(66476007)(4326008)(8676002)(82960400001)(38100700002)(6486002)(83380400001)(54906003)(6916009)(478600001)(186003)(2906002)(5660300002)(8936002)(6506007)(2616005)(1076003)(26005)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejlZaWcvc3EyZGxScm5oMVVyVnBTanBnY3VLdzFKVFl0Y3lRVnpEak1qYmta?=
 =?utf-8?B?VndxM3Y3dCtvQ2ZqalhESnBFTWZGTHExdE1yOGJJQnF3dHFCam9NK2tGOExH?=
 =?utf-8?B?TlBoZUlOMkk5d25FUHdycUdSNTFxanZjczMzQ0NIZm4yQVQxcVBlbWo1RzB0?=
 =?utf-8?B?M1I0a1VSOHlmUlNFa3pFZTdsQ2FPaTBsY05CWnZoWnMveGNvSmgySjhPbEVi?=
 =?utf-8?B?SVp0S21OZ0F4RWlNcFFLNUdUUFJ0RXRWZTBpZUNucHdQQUEvZXFzbUg2L3gv?=
 =?utf-8?B?Yktmc0UwTlJJeUEyWnpVVDN3eS9wV28rejNTSUhiUFhoVUdJaUdROEgyQXpS?=
 =?utf-8?B?R2h1OWtFZlc2STVyTXBTc1UxZld6U0RpazN6OGdPQnZCU3hrcmkrVXU2VWJM?=
 =?utf-8?B?NlVkZzBjSm52QUhieWdaK2pmSHE1bUNaeEdBY1FQUVYzRXIva0VDb01rWW94?=
 =?utf-8?B?bkZPUUpMeVJ1Kzl1Z0RtNTBLc2ZIN3EvdEQ5UHRjK3VmT0wvQmpsTXUwTHhL?=
 =?utf-8?B?b2xWRFFhV0FwQ2JwMENuaE1lWlUvN2lTWGx4bzVqVHpFWDFvOWRwSjZ1SG5J?=
 =?utf-8?B?ZndmZmpzOE1uMUtWTnVoQVM5TnQ2L1VmYXM2NnBYbjhkQnlEOXRndkVPQWs5?=
 =?utf-8?B?K0V4a0JENUt4NWlORWMrYkd0TnBPZE5YNUF6MUw4S2t2Kzd1Wnlnd2NUeWV3?=
 =?utf-8?B?WDBPMkQ0dzA2dVpXQVFpdjNYRlFRQjNlYkVDNGNFRGdWdnlsN3VFdFFRNGtu?=
 =?utf-8?B?dnlOT0dkLzRhQ1hJYThmQVUzM0gvS05oYXRmVGtBa01pZUxVbkxwWTZFT082?=
 =?utf-8?B?Y1lxaTZ6UTZRK2pCMU43M1VtYTQ3U3Jva05mcjh6QkR6MHRPOHhweDRwNVp5?=
 =?utf-8?B?RmJDSjZ2ZnBWK1FGT0V5YXJhUDZkNE4zY3RSMmx6cEcvK1dNbnNDOWQwSUZZ?=
 =?utf-8?B?L3FKNERPT1ZnTnUrQ2txSkUyYk9udjhmZWFaMk5rREl6dTRGcmxTSmJGUjZT?=
 =?utf-8?B?cDJYbmZGVEp4WW9pNmozOTlpM3pZMFhER2ZvVVJoUEFpcjlYUjdkR2FVNzZa?=
 =?utf-8?B?Mkp4cE5rUUNtdnVXeFVINUNWem9pZ1B3V05wSTJNWE9uZkovbENldEppdVV2?=
 =?utf-8?B?OFJFZmN5V2JONUJFRjFqSDRGcy9IRnloVkFhU28zVDBIZFVJTUF2aHFvWjIr?=
 =?utf-8?B?R1lTOG9KN0U2N0ZxNEoxRVpKdXZ3VFc5bEZVMVVDSzRwOGlNUFFSWUc1ZE1Q?=
 =?utf-8?B?UnhlT014ZjV1djlSeUZRSDdqbVM5N3NYdkE3ZG5ld3VUZXBLZjBuOVc3RklE?=
 =?utf-8?B?QXhpT1hIK1JuNmZsY3NoL1RMTk5NNm82R1g0Ujd1QjJiSzlyT0FDMUw2bFlO?=
 =?utf-8?B?Uy85RisyUFNydzZNdExkVEdaTnhLOVBjNG9rSHI1N3RIbkJwdGtUZ1BlbjhV?=
 =?utf-8?B?b0E5ZkovdHhQWEV1Q091QU00RUJhMDRMcmxFWEhHMzY0dStWckNCQmt6Ny80?=
 =?utf-8?B?SXphQ0o3SGJ4NmNIc3ZjNFJjcTFyNHF3OUxCbU9UZ2VXQktLK1M5RkswcGlj?=
 =?utf-8?B?VzFOY2hZbDJ5cnNMN0dCZFB6cTRqRlR1Yk5zdGQwU1ZwY0FId1NzaGRCWUk3?=
 =?utf-8?B?ZEYwSzI1OW1CMzFoeGtmU3YyeERBaEV5Ui9yeXhYaVYybEVZek5WUkRnVmMy?=
 =?utf-8?B?aXk2SzVwb3Z4QVpmaWxOanE5cDVqWjk0ZFJHYXpBL2JpYmN6ckEwbDRUQ1or?=
 =?utf-8?B?M1FRTGhvbkltR1p0R3pUMlA0U3JWYzVvTXVkMG5NVVFvVjltUFkxSmdGMUdJ?=
 =?utf-8?B?eU5qd3YrT2ZTMlFKZjFCS3RjSGswZW01UitGdC8yTjYyb240T1lTMCtGYjVk?=
 =?utf-8?B?ZTNuRzliOER6MlF4dTBUWC9LTDlXcGNZYkc4bEpWc1FkWFh1TmpKUWVVMnZi?=
 =?utf-8?B?TnhvYzhwTGNtTnR6aFhVdGtuNEJZb1Y5T3Q2K3hrWm9mY21LSmpIZzYzY2Jw?=
 =?utf-8?B?V3BHNDdOTE0wL1VESzB6dThCOGR2UzJRY0dqdGNtcysxazR4ZzNVY0RJaUdw?=
 =?utf-8?B?cXg5R2RsdEtBYjg0Q2VqQ0dxbm9teEVyaEVHZUtGcGlYOU40alNPTW50NGJI?=
 =?utf-8?Q?qAB6L2JBewmi5a8fU7vaLVHUe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gb5MDNE+BbBNrfzJy6US4OeW10Cl6oxvbFkfOC12Ye8Rd7rsF3wqgeMrgDhDQqD3OxMHoiW6GhObBcjWGzeQ7krf83n8rmlPqdjzc1bdWkOUtrx9T19/INO7ZS2Ovv0JLeyitdm7OvNmWxu/IuR5uln9SISkEQWwK1AlRP8V2ohod4H5hDkP7zqqokm8/zuaQc9iZL1s59Up7vWiw+CCSqN2Y64MMwD8TIbGbI64HHIUY5vu/HU6nvxKQ4s2tBysqQqvxNyBvXOVsa/ZGvrfAA2yc18rvMvrfo8uQi/JkspH5ldnX05GwEkqGhlb8QvmOuYn2Bqm2b4IWSxU+IWTY7IyjOuWeP0ceFRLSozdBetY5AFHSUN1IFMFqdhBANT4/ybmxnzjXBNt0/NE+3gfaMxeIbxCUoLZUzAOb1BWD63RHsZH2gpaIkZm0sbSREwVC459D2BoNDWiJQbqqZ/W+OIakStHCWy4dXW2NtP/0rrqKx7zrGRzwa8TrVojYp+VsZM8BMMSmmFCXY9O1wF3bhJaBGKevqlT815NM3e+B32obuXJHmbInpzx8Z9/KwawwUIP2U05ca4X+mpBS3pkGDiGIRu8UjsnzwiF6DyNv1KpPVtIxhnFhH+Uzy9W/K+IOmdoAmRri3PqHEChPHn5r9pWz9BQ8D3qvEsUgvC+4TI55pVN/WgEXg6HGOkLyt3PVtPIE7ne03HshR/ayOP2d1Nxc8+V3+YwU/3XyZgsyqIy2dEH2vkuBqmQA4YACtfTMRB7ssVdUweXl+KTGaryj4WkW3OXFPNYhcJvfLUhGD7iNVR6igycD5310hHuaDfjRLkmKD45GVsQzn+J5/5YzbL8N7Qr0flLbSioFzMLr6NQuazt0uM/B7XU8Sz7rLe9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a06453-8767-4139-bfb7-08dacd69ce55
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:45:54.5988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 451QL4Jm0CowGmfOUnJRFhJRT1H84J+IRBNyWDzWiHtBv78TewFAytn6w26r8ssT5khRwZT4G5VkcPGGSsZqCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

Only set the GOP mode if vga is selected in the console option,
otherwise just fetch the information from the current mode in order to
make it available to dom0.

Introduce support for passing the command line to the efi_multiboot2()
helper, and parse the console= option if present.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm unsure why the parsing of the multiboot2 tags is done in assembly,
it could very well be done in efi_multiboot2() in C, but I don't want
to switch that code now.
---
 xen/arch/x86/boot/head.S          | 15 ++++++++++++--
 xen/arch/x86/efi/efi-boot.h       | 33 +++++++++++++++++++++++++++++--
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 0fb7dd3029..6920ad08d1 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -221,9 +221,10 @@ __efi64_mb2_start:
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable and EFI ImageHandle addresses. */
+        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
         xor     %esi,%esi
         xor     %edi,%edi
+        xor     %edx,%edx
 
         /* Skip Multiboot2 information fixed part. */
         lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
@@ -265,6 +266,15 @@ __efi64_mb2_start:
         cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
         je      .Lrun_bs
 
+        /*
+         * Get command line from Multiboot2 information.
+         * Must be last parsed tag.
+         */
+        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
+        jne     .Lefi_mb2_next_tag
+        mov     %rcx,%rdx
+        add     $(MB2_tag_string),%rdx
+
 .Lefi_mb2_next_tag:
         /* Go to next Multiboot2 information tag. */
         add     MB2_tag_size(%rcx),%ecx
@@ -324,7 +334,8 @@ __efi64_mb2_start:
 
         /*
          * efi_multiboot2() is called according to System V AMD64 ABI:
-         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable.
+         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
+         *          %rdx - MB2 cmdline
          */
         call    efi_multiboot2
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 27f928ed3c..695491a5b7 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -786,7 +786,22 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 
 static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
 
-void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
+/* Return the last occurrence of opt in cmd. */
+static const char __init *get_option(const char *cmd, const char *opt)
+{
+    const char *s = cmd, *o = NULL;
+
+    while ( (s = strstr(s, opt)) != NULL )
+    {
+        s += strlen(opt);
+        o = s;
+    }
+
+    return o;
+}
+
+void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable,
+                           const char *cmdline)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
@@ -807,7 +822,21 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
     if ( gop )
     {
-        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
+        const char *opt = get_option(cmdline, "console=");
+        bool vga = false;
+
+        if ( opt )
+        {
+            const char *s = strstr(opt, "vga");
+
+            if ( s && s < strpbrk(opt, " \0"))
+                vga = true;
+        }
+
+        if ( vga )
+        {
+            gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
+        }
 
         efi_arch_edid(gop_handle);
     }
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 287dac101a..fbd6c54188 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -175,6 +175,7 @@ void __dummy__(void)
     OFFSET(MB2_mem_lower, multiboot2_tag_basic_meminfo_t, mem_lower);
     OFFSET(MB2_efi64_st, multiboot2_tag_efi64_t, pointer);
     OFFSET(MB2_efi64_ih, multiboot2_tag_efi64_ih_t, pointer);
+    OFFSET(MB2_tag_string, multiboot2_tag_string_t, string);
     BLANK();
 
     OFFSET(DOMAIN_vm_assist, struct domain, vm_assist);
-- 
2.37.3



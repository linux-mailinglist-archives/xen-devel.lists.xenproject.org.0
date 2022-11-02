Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5C6164F6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 15:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435953.689922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqEbM-0002Og-Na; Wed, 02 Nov 2022 14:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435953.689922; Wed, 02 Nov 2022 14:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqEbM-0002Mx-Ge; Wed, 02 Nov 2022 14:20:20 +0000
Received: by outflank-mailman (input) for mailman id 435953;
 Wed, 02 Nov 2022 14:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+cO=3C=citrix.com=prvs=2981f1107=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqEbM-0002Mr-12
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 14:20:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c0615d-5ab9-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 15:20:17 +0100 (CET)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 10:20:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5721.namprd03.prod.outlook.com (2603:10b6:806:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 14:20:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 14:20:13 +0000
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
X-Inumbo-ID: 78c0615d-5ab9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667398817;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Gk+1qxE1/RsLDG9ozR69RKKHZaooRnR1lsHp0T+oddk=;
  b=TB1X7ypyGjIujZCaZe1sxQdJSJeEgZqIL4vdbGxSD8o/cKg0tQqJTWXx
   /9R5cwmP1j1nRE8CQBR7k/LHRhKHhQ6Z21kNYjEW68xLuA1AeSp1KeP9Z
   51mUluQZUyjm3j2m8iZTO/sBdePxFRfj67GO8r9bXlw7BuiDvJbKrEDA6
   E=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 84031891
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nqT0t6sgF5RVYKQdPxEH48qSAefnVGhfMUV32f8akzHdYApBsoF/q
 tZmKWnSPvbYYmT3fI9/OYW3900PsJKEzIVlQVZprC1nEn8W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5Vv0gnRkPaoR5QaGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKh8/diCJm/yPmomDZsJSo88cJsrsBdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4C9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3krqUz0AzKroAVIDIkeByQj+LisR+jC9ZiF
 X5X/DYwlZFnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQK2
 1mTjpXWDDpgmLSPTDSW8bL8hTG4NDURLGQCTTQZVgZD6N7myKksijrfQ9AlF7S65uAZAhn1y
 jGO6SQ72bMaiJdR073hpA+dxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:oq5zKapF92uGbhjy58dggx4aV5uIL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AbeSITCNU4H4ox69Mxkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pWVFZ9l/1pwKpuKuZ3IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkcoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWuKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnieffFmHKc7hywlbF/NLggFkPsulqSRkoeMNIbDIGmEVE0kldemrrEWHtDbMs
 zDSq5rPw==
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="84031891"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQpHE628SrfpSiLfSy1QG2pE0KDV5JjTc/YfNvSFvdnQgQDbx+dfFiBs+KwZbj5hxU0Y5Lcizv32V97bK9jg+2qvTWaBLWKAWY2JixKuAarMg5HmhKVkfwQOOp39PXsdEovosRid5ThJAzxC0Fg9nbYU1J+dmtpv3+V/91LuCpG63sQ2Y4aRFoga1N+01vqaX5u49PWlBANxgnvCFyHY+HelExeyW/a0Ka6Wh+fTJCgb7OxR5Xc45wJ2iH3oo9f+1DyDg39tTE+mfPVtWy0YuqhESK6ud8RhX1e2a5YhwBzD7ukvPL7saLqai5gRVrfyFnSg1Mh8SFlucGsfyfVwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk+1qxE1/RsLDG9ozR69RKKHZaooRnR1lsHp0T+oddk=;
 b=HsqgJxa6sVq+3P0USnEfTss26aThSryuCJzkSPomla7oONsYB2GiDz5ipltLT78J8fM/X/RR+dBv+CZw/olCWED+PevzME1l6xpPeo9YEnbpavt57Skd7C0ucVnOVNLuGM8mQM9q/ceSk0UUP6j7rAja5TN7sSHWgWWdLfbv4qwze/RIflU0LFPpilx8F5GE3jrYjaS1UKsAmomqL+KAVaFY+dZ1nPf1wj3Lz7ZYfxR4q+5eugZyNLJ2hNir/BUriZsqJeFd29bXREPyDFRxrkm6wcLE4TotPcdXJK/FDk5bRLi/y9R6QuxyKZJv9TnZ4IiB31pkab47V/jotN0tLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk+1qxE1/RsLDG9ozR69RKKHZaooRnR1lsHp0T+oddk=;
 b=u2+IwBonDSME7femV2Z5tmVTF917cSAyfLsqNVorCLjt/BdH3CtG6uj0RZHZD3OqzsJ468ETWbw3WB4yCNO20E16sbyHRBYiAA+mc6UfxMVByNnfQk82S0TcBLJSAzJf+p8IOfyaazsjuN155m0DrWiBWVxKKjhWi7fh8sbtkBU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 v2 1/3] hvm/msr: load VIRT_SPEC_CTRL
Thread-Topic: [PATCH for-4.17 v2 1/3] hvm/msr: load VIRT_SPEC_CTRL
Thread-Index: AQHY6sNZyDs+pahU70+VbMHdR6akRa4rtukA
Date: Wed, 2 Nov 2022 14:20:12 +0000
Message-ID: <f93e36f5-7539-b5af-5585-9184bff2c0be@citrix.com>
References: <20221028114913.88921-1-roger.pau@citrix.com>
 <20221028114913.88921-2-roger.pau@citrix.com>
In-Reply-To: <20221028114913.88921-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5721:EE_
x-ms-office365-filtering-correlation-id: 78951c65-71d9-4547-66c8-08dabcdd5b31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QKNPtbcge/rbZvoeUB6S8nMSQKY6u/0GZt7zxznrG78am8tdnV+Sa4u7zBBApSh7RtP1HG9WlYoIhs4xSXD2VKZNvvdtyeJgwTUz0zba1t2sHV3w5OBP8NfUXVhRm93KyJNQMl0zIfuLRz5mSUi8GftQMQLFWVol0aaSX/3+kRyFTLKaieNhpLpaorA/rbpL0QQUR0hTJtdDkOosSCHd4YHoq+XgOdG6HaYx/lRr+YwotBw7Ue5jB6ESNaUwiRa7rW99xnpLTOczNNVwZErAqL64tVJDMLfRNnxpSm871d4Z+YM1V4iMAvJtzwHPosf0gov/FL19kS1QM6WKhKBwP/GHHPhMF9Z/s4J7f/xFpOMxNzjQOsZKhBDKbbf2nh82q0O/RE8Z0E7wMjbHL2ZaUNy49Lc+9IfpVwXbeIQISRlRmqcXfYFFZEFtgxFjTDFisGWqV/hIIl7xkqtF611gMHbjNvykKP0UNOr/S674UmfP/iE8K+yxQxDP7oNR731Yw41nGWq3xgtmGyojl0GG6AAn37XQ0yq2JeoOeMTuH8ClEPdm5Tkt/L3D4yrrSsOK8nwiHGHGyKVCCcxy1M5jax6ZNqoyTFiqlowLmfRkjnQj4ltFSaIwbbiENZHZXw8cegramP9UuWVjDjCrbAFd86Zvs9N1ffwfYQdUYT8S84iygNU8B/xwbPo6tHeG68AB2UToCF6G83aKaNQiml4YuBOdLGJyQ6a2bWcy5Vu2VCjUxKFBeb4W1JD1yAuQt0nGhyP8ccIY5otHbsg+pnDR499K1gXZupfvWVLZ04v++CbFRz2I0mnwdzZCUNpZgzpL8Cgnu8XPCWw/C4oEzekgOw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(316002)(54906003)(110136005)(71200400001)(66446008)(8676002)(478600001)(66556008)(76116006)(6486002)(4326008)(91956017)(66946007)(53546011)(31686004)(66476007)(6506007)(64756008)(26005)(6512007)(8936002)(5660300002)(4744005)(186003)(2616005)(2906002)(38070700005)(36756003)(86362001)(31696002)(122000001)(41300700001)(82960400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXdqQ29RU1U1akZrTmhzajAyZWxoSkhrbWcwWTVvMStSbUdWVUJrNlM0eU9s?=
 =?utf-8?B?NzdvWUw1bHFDalpDYkVWRmpHQmx2SU5pZUE5MjhlbkxUYnFZdUZIWTZMMlBY?=
 =?utf-8?B?WXdLQWdrN1Ryam1ENkNQL1lTcVBCZng2SlZjYjYrODA2UDl0bU51TVJxeHBn?=
 =?utf-8?B?cUJUTTd3VkN0TjJsaXVBUXM0ekpRZkszWDVCZVZyTEhYRUZCU0sxTTExUkQ3?=
 =?utf-8?B?TlhXUFhhVmRZTGhpMGtHUnhjN2VQNVlNRGZBT2lqSERCSXgwMFoxcDRHdm5H?=
 =?utf-8?B?akdlbkUrMktrMGVGVm5yUkpzZlREdVUxb1BFdnprNWJZMnRoRFBnM3l3ajhv?=
 =?utf-8?B?aWIzVGhzWXFMVlFES2xXOVdoMC82NzJocGNackpKVTVnQ3U3Rk9tYld4ai9N?=
 =?utf-8?B?ZEN0OU9CeitDbjU4b2lVbVJBenZ6WkNwdTZ6UkRwdkhYTVpkbWRDYjhSdm1N?=
 =?utf-8?B?ZGxEZFRxeEZtUkc0RkRPVG1VcnR4UFQ5OHdaMEZyYmxMeHNKU1ZYaWRYRVRm?=
 =?utf-8?B?U0o3eW9qTWp2OGh0MVcwMFpVRzFOeEJOS2swaWNPY2ljb3FRL3VjNEpScFJD?=
 =?utf-8?B?OEJFQzNGb0ZsbXhLcUVCYWZLOUE5a2tPZUdtdmVoOEVnWndab0cwb2h1bTNL?=
 =?utf-8?B?WGxhODl6ZWgwTHJyL2svdmRtN0wwNXZCSGc5TjkzbTVSaXN3aVl2My9JbXRS?=
 =?utf-8?B?dENpQmRsdlIzWWs1RTNrdmRDQS9oVnQ0NDBJSjNBd2JKM3BzZExoSTVhUTBB?=
 =?utf-8?B?NmxkWlFGVFJQR0U5WWdOVDdBMlZQL3JWWTRlZElKVTNiYThlY0N2V2tjc3RD?=
 =?utf-8?B?Q003MnNpeUlVN0hvRkxzUUlhL2VpcTRlY05nalZ0emhyTDBBM3FSMWFsM084?=
 =?utf-8?B?WHBvNXU1VlhJeUhqOE9zcVdIL2dTUkJVb24yd2NWVDE1SmJiUG5GS1ZqdFNZ?=
 =?utf-8?B?c1BndXBtcmZDam1ZeEdmUit1NWE0c1UvZ2ZlSThSNThMNFFnejk1MkpVMXlw?=
 =?utf-8?B?R21CaWRaelR4dVF4di9UZHlSUEMySWsvUHk5LzdtVU5jbWhXbjB5R2xIVVNq?=
 =?utf-8?B?NzVDNWxIKytuUnVqM0lUN1JzUVF6SHlVS1MwN1RMbFA3c1dWcnZYT1Zlc1B6?=
 =?utf-8?B?M0w5eGFqbzNtbzJ3MnZDNEFOVHFacWYvN29BeDhleDI4SHpxNGgzNW16clVs?=
 =?utf-8?B?MXJzRS9WSDNuSy9CK08vZlBsbktwOHQ4T1JXTGZuMmpCQyt1bXdhdHkxR1Zm?=
 =?utf-8?B?YmY5S3NQVjJPNUsrWVNjNDhLM01HVUQzNVM5aFVwaER3ZUtWWkY5c0gxeE8x?=
 =?utf-8?B?eFpoZ1ZjQ1Bib1RnWTZ4WmZSRER2WkpaNis4Q1Zzc2MvV1hWL2ZQa3hVOHNI?=
 =?utf-8?B?NFdoK0Vabk16WG9ZQzE1eUlUOEFnc0JZSENYMTdQdTBHbkhDR2VtTFluWm9L?=
 =?utf-8?B?dUQ2RkhuRVlNSDRTY29JVWlBYlJCWGdkRTA5eW9MbHdEbDk4dzljbnpLK2ta?=
 =?utf-8?B?RE85M0o3R2czUVZXWWNDNnNPSThkOTNjcUhZcDM2M0FrM3gvc0ZBZlIvUmVz?=
 =?utf-8?B?T0F4TStiU2Fsa1pxWHd0M2cycStJeDRxUG4rYUc0c3lnQ0Y1aXlDUVB1OFBm?=
 =?utf-8?B?aklMS2tJeU5vZVl2ZTVGTjNXaFhKTkQyaXVwVXBDNjZQdGxWOTVjbHdQdDhJ?=
 =?utf-8?B?cFVPbEg5TitXdGgreTF4d2JTUVdIcThYb3BBY2lTcy9JRHBnV2ZBRm9RSlBC?=
 =?utf-8?B?YWxYb3V6ZVQ0anBOOEd5eXBMU2phekRYbTQ0V3VIM3R5K2ZPM3k2U0NSQVZy?=
 =?utf-8?B?ZTk0ellEUUltUEhrWlFxQ2JGdlVHcDJEYnhvd1hmQXlIblIyRnk5WmlSMDJB?=
 =?utf-8?B?VVJCbytYcXEvRGFWZGZMczdOc2xNUlZoV0dTRndxa2ptTmlqUHJlNnhOVlhv?=
 =?utf-8?B?QTBubFJKbWFEeXFHNU1Gc3FYeFg5cHhYY0dFWmtoQ0VsVjY1RWRJTjVQWEE4?=
 =?utf-8?B?dXJ5WTRFdDE4ZU9XYjRLcEdicjBnMnY1UmNaOVkxTngyNDMwREpBQWhMZkl4?=
 =?utf-8?B?SUswNDI3aVZGNVdYZkRnejdPdC8wcS91anBISjVXaTd1OUdUdXNtWStrWHRV?=
 =?utf-8?Q?gu3Gacqz5uaooPLeB+ama4PVb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E4191424160314C8D35F46213C0C27A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78951c65-71d9-4547-66c8-08dabcdd5b31
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 14:20:12.9948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1Dfb6z6XPqXvxmAmZ6m4NdWEw3S9d2rq45F3K/j87CGCQP9c4dBcDfK3wqjPGXxAb6osCqcVoq/Ssy3QAViTfr3tJRcj+o+grdonl+oppA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5721

T24gMjgvMTAvMjAyMiAxMjo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBBZGQgTVNSX1ZJ
UlRfU1BFQ19DVFJMIHRvIHRoZSBsaXN0IG9mIE1TUnMgaGFuZGxlZCBieQ0KPiBodm1fbG9hZF9j
cHVfbXNycygpLCBvciBlbHNlIGl0IHdvdWxkIGJlIGxvc3QuDQo+DQo+IEZpeGVzOiA4ZmZkNTQ5
NmY0ICgnYW1kL21zcjogaW1wbGVtZW50IFZJUlRfU1BFQ19DVFJMIGZvciBIVk0gZ3Vlc3RzIG9u
IHRvcCBvZiBTUEVDX0NUUkwnKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IEknbSBjb25mdXNlZCBhcyB0byB3aHkgd2Ug
aGF2ZSB0d28gZGlmZmVyZW50IGxpc3Qgb2YgTVNSIHRvIHNlbmQgYW5kDQo+IGxvYWQsIG9uZSBp
biBtc3JzX3RvX3NlbmRbXSBhbmQgdGhlIG90aGVyIG9wZW4tY29kZWQgaW4NCj4gaHZtX2xvYWRf
Y3B1X21zcnMoKSwgYnV0IGdpdmVuIHRoZSByZWxlYXNlIHN0YXR1cyBpdCdzIG5vIHRpbWUgdG8N
Cj4gY2xlYW4gdGhhdCB1cC4NCg0KSXQncyBuZWNlc3NhcnkgKGZvciBub3cpLg0KDQpndWVzdF93
cm1zcigpIHN0YXJ0ZWQgYXMgb25seSBzYWZlIGluIGN1cnJlbnQgY29udGV4dC7CoCBUaGUgY29u
dmVyc2lvbg0Kd29yayAodG8gbWFrZSBpdCBzYWZlIGluIHJlbW90ZS1idXQtcGF1c2VkIGNvbnRl
eHQpIGlzIGluIHByb2dyZXNzLg0KDQplLmcuIGd1ZXN0X3dybXNyKCkncyBjYWxsIGludG8gdm1j
ZV93cm1zcigpIHdpbGwgbWFsZnVuY3Rpb24gaW4NCm5vbi1jdXJyZW50IGNvbnRleHQuwqAgVGhl
cmUgYXJlIHByb2JhYmx5IG90aGVycyAoYWx0aG91Z2ggSSB0aGluayBtb3N0DQpvZiBwcm9ibGVt
IHdlbnQgYXdheSB3aGVuIHJlc3RydWN0dXJlZCB0aGUgaGFuZGxlcnMuKQ0KDQpUaGUgbGlzdCBp
cyB0aGUgbGlzdCBvZiBNU1JzIGlzIHRoZSBzdWJzZXQga25vd24gc2FmZSBmb3IgcmVtb3RlDQp3
cml0ZXMuwqAgSXQgc2hvdWxkIGJlIGRyb3BwZWQgd2hlbiBndWVzdF93cm1zcigpIGlzIGZ1bGx5
IHNhZmUuDQoNCn5BbmRyZXcNCg==


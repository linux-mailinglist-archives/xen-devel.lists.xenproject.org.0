Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9CB65862B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 20:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469554.728931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAbgj-0002kx-0g; Wed, 28 Dec 2022 19:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469554.728931; Wed, 28 Dec 2022 19:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAbgi-0002iW-Ti; Wed, 28 Dec 2022 19:02:04 +0000
Received: by outflank-mailman (input) for mailman id 469554;
 Wed, 28 Dec 2022 19:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfAD=42=citrix.com=prvs=354503da8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pAbgh-0002iN-MT
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 19:02:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b74f1eb-86e2-11ed-8fd4-01056ac49cbb;
 Wed, 28 Dec 2022 20:02:02 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Dec 2022 14:01:58 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5180.namprd03.prod.outlook.com (2603:10b6:5:1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16; Wed, 28 Dec 2022 19:01:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 19:01:56 +0000
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
X-Inumbo-ID: 1b74f1eb-86e2-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672254122;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1soFpZrWdYNL4VKp39xcpFQ6p6KHCzOyo35X7acf83Y=;
  b=LhNaTyGO4TvfLF/w9Tn87U2DXxaDzwNn6Z190yMlQ/P7pU85qSKe+jKj
   o65miTRJP1/xph7MeVnKItnpH+kYFEllKmADOwGB7MnJZloD1GI0crn/u
   REqTmlO9d7qgb2p8xn/VfP5A8ecY3/LG9+gzAManASczLK8ahxc0QconY
   U=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 90372584
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ftpJVKKVI567K3CuFE+Rl5UlxSXFcZb7ZxGr2PjKsXjdYENS0DIPz
 mUWD2rTP/zfZTf0LtB2Ptuy/EsPuJLdxtU1TwplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AZuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c54Rmxo7
 f5IBAxUf02pv9qM2Z2lWsBz05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHugB9hPROHQGvhCnwGOzWUaBxMtDla68ce7uHKuHPBfN
 BlBksYphe1onKCxdfH0WxyjvHeFpERHc9VVGuw+rgqKz8L85AKUBXMFT3hCdcYhv881QhQl0
 1aIm5XiAjkHmL+ITXOQ8J+EoDX0PjIaRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ihDMlm7wZgMoP1qO61VPKmTShot7OVAFdzgrWV2Sh8whwTJSkeYuz6F7Qq/1HKe6xRF6Lt
 mkJgMia4eUHC7mCkSWMRKMGG7TBz/+BMSbAiF91WZc7/jKm+mWLYoxbpjp5IS9BOcECfzjrb
 EbNuBh565paPX/sZqhyC79dEOwvxKnkUN/iD/bda4MXZoArLVDZuiZzeUSXwmbh1lA2lr0yM
 ouadsDqCmsGDaNgz3y9QOJ1PaIX+x3SDFj7HfjTpylLG5LFDJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:51PI96lLGDrOkpnytFMgtyY1rSbpDfId3DAbv31ZSRFFG/Fw9v
 re+sjzsCWetN9/YgBEpTntAsm9qArnm6KduLN/AV7AZniAhILLFvAB0WKK+VSJdxEWndQtsZ
 uIHZIOa+EZajBB5/oTQmSDfuoI8Z24/KuzhfrTi1dhJDsKV51d
X-IronPort-AV: E=Sophos;i="5.96,281,1665460800"; 
   d="scan'208";a="90372584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWcCfx6GsQUxOfbNcZnkz+Kt5ADdtfm9EnnjkUbO5MQO2Br890EmDqc4X+5d15KyDrxRjTwll9rrsown9+dlPShU1bjL42xB91qz0XXEjyk33fqB5beQZRltxnZVubJL2SGE/d4xtQh8oxy60pW2vWWF8sk3ght3qyR5cGiIDqcBDVDLGxHWKh0jYzObQ1Zl97xcFTcwm1wxTyQIYOwHq784HqjalJvmksF//w6qC9H9cwZZBePshx4SC7sMfRrxKUA06Jbq+JRfpKyPu1aNtofmRt8WJa0FJ2s0de/VR02XfMkti7rzWY0BkgsSQfyPoG8/AC6tNAdr/reU6N24tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1soFpZrWdYNL4VKp39xcpFQ6p6KHCzOyo35X7acf83Y=;
 b=RN2ANYUS+TVqst6NAOeGLI/m9kn8/ni1up2fyi2Ar8cLFn8creY8TR9+PoxG0KNjPcSAXiNI1ypt11QeA7ZMeIhZKD+Gv7tOazGoSEHV3oQl+UpYkdJxyEVixuQKJjm0K/5y5CyKf+Q5JaEEoWP3e+AXaQAyT6m6tDZnExVOU9pIIJkqmpMnmAcIa0B74XjvsK4eJrJkapAQBFFfKO7VkwiVX/8v4RZ58zqJWMdvRSat57B2L+i4P4Z73pake+myCaAwzFb5xovmkNi1jesV55zitZ9G2XnChixp8CSggdEIRn+INeUqvlXfM+6h3r/ZizfUWJLzZQ6ppPahSd4c4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1soFpZrWdYNL4VKp39xcpFQ6p6KHCzOyo35X7acf83Y=;
 b=ujU7p+wwXzm4grdW0sInbdmJ8sd2FGAb30XqMB1yxZNttA7kUHI0iDoDRSXL/BdiVlhXqhZmwDQ6wPHCReWszRe4SzDCMLMYlhKOaainxuFcESV6J/rSRWB0NeZM87ZBI2Mkc+9ak8rnOKmagaAfS9E1uhw9wp/QUN3855auEnY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Alistair Francis <alistair23@gmail.com>, Oleksii
	<oleksii.kurochko@gmail.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Anthony
 Perard <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
Thread-Topic: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
Thread-Index: AQHZFsAJYhXYxlPpRkqmFf35I9Ktpq57fXsAgASLWACAArnQAIAA7ZIA
Date: Wed, 28 Dec 2022 19:01:56 +0000
Message-ID: <0a60dc57-080f-4210-d9f8-4688308cc5f5@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
 <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
 <CAKmqyKMmW7rRXymMD6dNeLTLbUaSwO5nw=hJTk_xNvsZ3pg7jA@mail.gmail.com>
In-Reply-To:
 <CAKmqyKMmW7rRXymMD6dNeLTLbUaSwO5nw=hJTk_xNvsZ3pg7jA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5180:EE_
x-ms-office365-filtering-correlation-id: cf5b6526-e522-48d8-d902-08dae905fd95
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tULF4fU5D3YbBc1h48d34rW63EJIgB96jA0m/al9Dr8exPANd3z+Sam76Bcc3lAIukHqoc2Y+VG+2GSZOUmTZfBpPd3PO2Tf+KxdFraAxduuNom1eCCJvJnfrq37aV32VJ3rhJHkP60bEqrz1jiU0j1cRmNGaouoFYgdt0NZTU6hpnUpI2HPf7Diuvly/OXzyCbcRyPHF/Ls7myV7M0WMqkrjSrhkbT0mmByyz3EERuLBw+qgDXTcgXIaY3frgITIO0/5341l+9e7rgRPf7sOvcq/hJNklWo6hkLTbOax7R0EzfB6u05lg68ChJWpk88B2z523D94oSAsZmqzejlD2u4lWyhXoT2SZikh0dxoN+3Vwgk0vWO/nWwu0XjVR2YnxkUwI9iYKt2KmJXslkGmWxEDAmqJdCdvbfinAPbdkxLONWd3jjErM8jNxYIBqBqc7Ek4UMGUDaa+5GGuQ7qMaTVLmmylSHGRoLlxtq5zzqjKADAt8HO5N1rTgcc3HlvgzbXwlNvaiqJB0EkXVCsWJzpkjstkVlhnUtzrcQhBBca2inJZjCR+izZaDmYMj9aCYdrOHqVJy5e2k6ExNiO2EiwoOFwvyTnZggRQoI1j/CFwvGMNPgsYbsFJXmwR/V57aya72WT7OLE8LKZaLVsEjoFQtxoSMCkvvLuZnpax4hGuVakGEpIzGuJuyHVRWKD2yMd5xgW165AMIlChBDyMqppypA7ITz9NJR9IaRds81dUIw2iS2zpAm8IhlEk7Dx5k3ZsaJqS5AbbMg9OR0lHA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(38070700005)(478600001)(6486002)(41300700001)(36756003)(6506007)(53546011)(186003)(26005)(6512007)(316002)(110136005)(54906003)(86362001)(31696002)(71200400001)(31686004)(2906002)(4001150100001)(8936002)(5660300002)(83380400001)(107886003)(7416002)(8676002)(4326008)(76116006)(64756008)(66556008)(66476007)(66446008)(2616005)(66946007)(38100700002)(122000001)(91956017)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVZFQjAreHp5Mys3YjRBTlc3NnQrUzJkNVQ5MG45aTI0bzZSSXpRSm1kb1RF?=
 =?utf-8?B?QW5XUTh4eUVxUEYwTit4ZVNTWnVCbFRaOHZNcUVEWmxRL1lDTTUvWjJFZE93?=
 =?utf-8?B?YlU0Tis2bDIyRWM0QS9TMGFuT29IM00yVmU1RWFPQ0lDaUlYQlVsVW91TTkr?=
 =?utf-8?B?Mm13UXRQNnRydlplSG96UkVNN0ttc0tnd25NTkswdENHT3hTamdFZjhMYmJm?=
 =?utf-8?B?MzVRZ01BQThjQUxBbWVDK2lKbFlkNVluOGFKQXFNMU1rWjl5WHJrVFUrOGww?=
 =?utf-8?B?My9rSFJoQWxrWjNTOUJtYkdVU3d1a2c5bUttOGJvQzNWNWZxOWE3cVdjODBm?=
 =?utf-8?B?STJPWGF5QjlhWWZOSWhhMDg5Mm1WaU9YdzRENCtJY2lJczFtdDlHc1hHdWRm?=
 =?utf-8?B?WEtHbmtHakZzaGU5Y0dNazZaUEFpT0FJbkQ0RUV3T1JOOVo3Mm16bEhYcFJJ?=
 =?utf-8?B?NGxzS2hPL3IvZThtVE40eEY0SGNxeUNLUVNacm5icHA3aWlvU01jYmozYXJ4?=
 =?utf-8?B?TmRsV0hFcDlzaHN0b3J1TkU5SElEenpTWnpmeGVjZGNodXkrckxUTGRqZk16?=
 =?utf-8?B?aVhwNHVYUmVBS2c1a3dJbUtsWHlQMWpDK3ZrMG1BOGJQdmJzREZ0cHg5WTFG?=
 =?utf-8?B?UjNRSVR0Q1UzU3hIOUxJZTVHR05wc1J3ZFNyVFBKR1B4RXllbzFpOFBBcVV1?=
 =?utf-8?B?WHRZZWZLVVkzcGFYWmhtY2xZVjdrSEk1M0R2SkZabkQ2ZkM3Rm0yeDZFcHVi?=
 =?utf-8?B?ZHFST3VheEJjQ1hyU2VCMDlDVkFlQ1c1UTAzZzR4TGFJdEVybTM1SERpc080?=
 =?utf-8?B?V2pIOTdVaklCcExSK0U0MXFvMXFKeCtiYVRYOUlmZmZvSGFCOE9NRnNTWEpp?=
 =?utf-8?B?bzI3NHBlQ2YxM3greVNjdWRmVHFYYlJxYTEzaUJhZmx2VVVFMTNLaEJuZFBJ?=
 =?utf-8?B?Ty9sc3haV1RBOGtNNHl2ekJLcHpqOW1RZGdlS3htcGkrSlQvand1azQvQkcw?=
 =?utf-8?B?OEV0OHVETFUzY3RlV2VEYWFZd3R6WEZsTkhIYVd5aGdidzRvZGgyaDZTa2dl?=
 =?utf-8?B?VTlLczBPY1BOTTlHZ0U3R1U2MWM3anl2Z2lQWnFJSEM1WnhkWVF3ZG92a3hY?=
 =?utf-8?B?eE1jSWJ0cGRzN3k1RUdkSmFWRlh2VlZsOG9ORjlXakkrUmVrOVlPRTZDTG9T?=
 =?utf-8?B?ZGROL3cyeEtlTlhDWHZBZDdLd3VsbDRXU2gxZVcyZTFieVJxREZ1MGx0cUZD?=
 =?utf-8?B?YXd0SHhodWVvR2xFQ1lrMHNVY2NvajJ0RWptcXZ3c1F0NFJKK1NBVmpZZGFM?=
 =?utf-8?B?Z09xY1pyeE9adm9FaVlGQWhBRUZ5TjNNODBBVWo0S1R3WmowVnBZdTdaRWk5?=
 =?utf-8?B?T20xOGVDeVBpdEEramduNTlXdGIzV1RhUThmbGpUNVpjRGd3YTZacncwcDBI?=
 =?utf-8?B?cjJJZjl5WUN4VUhhZHlVd0l4MnI5ajEyNUJxUjF4WlJvOHhDdEt0SW5qWlhG?=
 =?utf-8?B?enRNK3lzMGthTFBVVWE2a3ZCaTYwRVU3elhCaFZQNXNZS0luang2cHpOWlJ1?=
 =?utf-8?B?K1lpakdaVlpvYytXNTRqRjJIVTAzenNScmQzMlFOVk1HYnRkVnNDQ0RrTDJ6?=
 =?utf-8?B?eExhUUdBUVZxSGFWdnowaUN3WUZ2ODU3SDBkWVlJR01EMThpWjFxMFAyM1B1?=
 =?utf-8?B?Mlk0MU1WcUl2SmlNbG9JaXkxNTVlV3ZLZ3YzeG1WRkZtNk42MlNvaC85Wlk0?=
 =?utf-8?B?VTMwUnN4ZDV1MlNKWXgxanRKZHVLamxnWGRNcktQYmpMYkp6MEExMFZDbHJS?=
 =?utf-8?B?WTdaVDEwWVdzN3NLa1R3cTQ2ZDJveEtlWDQ3QktBQy9wYkE2VG15MHU5SW9x?=
 =?utf-8?B?Lys2SmF0SVk0d3l5RzlDWHA2OEdLWmdyWmpJQk8veWxrMDZwZlBxRDRNZ2Ju?=
 =?utf-8?B?YzRnd3gzRk5YLzZ0WlVoZWxVNlNIR1pMQ21Tc2tGcUxIdDgzRGdRUHJ4b3lq?=
 =?utf-8?B?NEl2V0ZIMndFU3QvTWZTUFErQmVGL01vb0hRV0l2STlIQjl3T3g2NE8wZGY0?=
 =?utf-8?B?Qlp3L1FRZkxnZVJ1V3c4aUJWc1VPWTFXUmF2d2RneHRQT2JiRGJaQnZOOG5D?=
 =?utf-8?Q?QFdVd2enY86kK2L5j3LfdEed2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <413489D61E830C4180D148121AA152B4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5b6526-e522-48d8-d902-08dae905fd95
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 19:01:56.4442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XLRYpLnFU5wr1I+SHTmgNcj7xVOtoYglG4miAOGSZPhqX6MOEKW9JcgrDfK+7HbG+ztFnTrhA08F0IIWVQMUlOtiw6vWB7xeIa7niaDb5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5180

T24gMjgvMTIvMjAyMiA0OjUxIGFtLCBBbGlzdGFpciBGcmFuY2lzIHdyb3RlOg0KPiBPbiBNb24s
IERlYyAyNiwgMjAyMiBhdCA5OjE0IFBNIE9sZWtzaWkgPG9sZWtzaWkua3Vyb2Noa29AZ21haWwu
Y29tPiB3cm90ZToNCj4+IE9uIEZyaSwgMjAyMi0xMi0yMyBhdCAxMzo1MCArMDAwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOg0KPj4+IE9uIDIzLzEyLzIwMjIgMTE6MTYsIE9sZWtzaWkgS3Vyb2Noa28g
d3JvdGU6DQo+Pj4+ICsgIC4gPSBBTElHTihQQUdFX1NJWkUpOw0KPj4+PiArICAuYnNzIDogew0K
Pj4+PiArICAgICAgIF9fYnNzX3N0YXJ0ID0gLjsNCj4+Pj4gKyAgICAgICAqKC5ic3MgLmJzcy4q
KQ0KPj4+PiArICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsNCj4+Pj4gKyAgICAgICBf
X2Jzc19lbmQgPSAuOw0KPj4+IFNhbWUgYXMgLmRhdGEsIEkgd291bGQgcmVjb21tZW5kIHRvIHBy
b3Blcmx5IHBvcHVsYXRlIGl0Lg0KPj4gRG8geW91IG1lYW4gdG8gYWRkIC5ic3Muc3RhY2tfYWxp
Z25lZCwgLmJzcy5wYWdlX2FsaWduZWQsIC5ic3MucGVyY3B1Kj8NCj4+IE9uZSBvZiB0aGUgcmVh
c29ucyB0aGV5IHdlcmUgc2tpcHBlZCBpcyB0aGV5IGFyZW4ndCB1c2VkIG5vdyBhbmQgb25lDQo+
PiBtb3JlIHJlYXNvbiBpZiB0byBiZWxpZXZlIHhlbi5sZHMuUyBmaWxlIGZyb20gQVJNDQo+PiAu
YnNzLnBlcmNwdS5yZWFkX21vc3RseSBzaG91bGQgYmUgYWxpZ25lZCBieSBTTVBfQ0FDSEVfQllU
RVMgd2hpY2gNCj4+IHJlcXVpcmVzIGR1bW15IDxhc20vY2FjaGUuaD4gKG9yIG5vdCA/KSB3aGlj
aCB3aWxsIGluY3JlYXNlIHRoZSBwYXRjaA0KPj4gd2l0aCB1bm5lZWRlZCBzdHVmZiBmb3Igbm93
Lg0KPiBJIHRoaW5rIHdlIHNob3VsZCBhaW0gdG8gZ2V0IHRoZSBsaW5rZXIgZmlsZSBzb3J0ZWQg
cmlnaHQgZnJvbSB0aGUNCj4gc3RhcnQuIE90aGVyd2lzZSBzb21lb25lIGlzIGdvaW5nIHRvIGhp
dCBhIG5hc3R5IGJ1ZyBhdCBzb21lIHBvaW50IGluDQo+IHRoZSBmdXR1cmUuDQoNCldoYXQgbmVl
ZHMgdG8gaGFwcGVuIGlzIGFjdHVhbGx5IGZvciBYZW4gdG8gc3RhcnQgdXNpbmcgYSBjb21tb24g
bGlua2VyDQpzY3JpcHQsIHJhdGhlciB0aGFuIGEgcGVyLWFyY2ggbGlua2VyIHNjcmlwdC4NCg0K
VGhlIHZhc3QgbWFqb3JpdHkgb2YgdGhlIGxpbmtlciBzY3JpcHQgaXMgbm90IGFyY2hpdGVjdHVy
ZSBzcGVjaWZpYyB0bw0KYmVnaW4gd2l0aCwgYW5kIHRoZSByZXN0IGlzIGVhc3kgdG8gcGFyYW1l
dHJpc2UuDQoNCkJ1dCBpbiB0aGUgc2hvcnQgdGVybSwgaXQncyBtb3JlIGltcG9ydGFudCB0byBn
ZXQgc29tZXRoaW5nIHdvcmtpbmcgYW5kDQpwcm9wZXJseSBpbnRvIENJLCByYXRoZXIgdGhhbiB0
byBibG9jayB0aGlzIGNoYW5nZSB3YWl0aW5nIGZvciBmZWF0dXJlDQpwYXJpdHkgd2l0aCBhIHdo
b2xlIGxvYWQgb2YgZmVhdHVyZXMgbm90IGN1cnJlbnRseSB1c2VkLg0KDQp+QW5kcmV3DQo=


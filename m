Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56AD4CBBB2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283106.482009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPj0p-0003He-9K; Thu, 03 Mar 2022 10:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283106.482009; Thu, 03 Mar 2022 10:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPj0p-0003F7-60; Thu, 03 Mar 2022 10:48:47 +0000
Received: by outflank-mailman (input) for mailman id 283106;
 Thu, 03 Mar 2022 10:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++p5=TO=citrix.com=prvs=054f29298=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPj0n-0003Ez-SF
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:48:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e5c77b0-9adf-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:48:44 +0100 (CET)
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
X-Inumbo-ID: 7e5c77b0-9adf-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646304524;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OLKWxR3en0CGDa1SgIFF2e0D1MifvJO0mWnZVNHeRpQ=;
  b=LHJ/V6NSUj4bs6/BCWxmV68CFS5IBuNe6fOTiLaGyWDp+15FPr4qpak5
   SGkpllObV8QD/j8Bw51mgISwzsgL43lAQT9PIG6NHWfHNWih6uSNilaZg
   E324KMkm6hR5ZdT0GmhhNaJ3dvvrSxfaM6OT40rtQP39K5um1DQkkFzih
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65383199
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t7tOmqtLRZR7ZejaDh1FJiwdDufnVEpeMUV32f8akzHdYApBsoF/q
 tZmKW+GafrbZjOjKogka47l908Fu57Qz4Q3GQFu/i5nHitH+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi80G5Dexs8vWiBpSWIjOL9P6b3BDDuG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQyN0SbOkweUrsRIKhgg7u6v0D/SGxdkGOMpvMt5Hjx3gMkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZ1hHWDy2pVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l14/p8ViyNGE9f2QCNdk0vd40QxFp7
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 23S9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94ddO51rXHb5
 RDofvRyCshUV/lhcwTXHY0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2O3O
 hON5VIKu8IKVJdPUUORS9jrYyjN5fK9fekJq9iONoYeCnSPXFXvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQtSfChjWMuv8JQ/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOqzNXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:laEvhau9xT780kcPrGi/wvqt7skC1oMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKceeEqTPmftXrdyRSVxeZZnMrfKlzbamLDH4tmtJ
 uIHJIOcOEYYWIK7/oSpTPIburIo+P3sJxA592utEuFJDsCA8oLgmcJaTpzUHcGPjWubaBJTq
 Z0jfA3wAZIDE5nF/hTcUN1OdQryee78a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MmTvKQ0TtQgDg76t
 MX44vRjeslMfuL9h6Nl+TgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVh4SxbpXWN
 WGNvusr8q+sGnqGEzxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0q9
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gacaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltFEU33HNczW2AG4OSUTepGb0oci6+XgKo
 KOBK4=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65383199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZQdv7CONbkEKkHCk8iql6LBL2WLYXBpNjLeQF98Ugw171+oKk4M08HkIdwfDORMQEGJcZ9GPjQ4C9hiDzMTojkBdhh4WN7L5X62ADNsKvbRelamgGfYoy5ae0C97kGvBjs1MG0GKHwWY2Cassss+4h9U9q55isINoS6hNpnYO7N8eC+sufxdhate+vaPpv512ZnG6G6/Jk54eRPfAYOFH7OSGhK9SAYmop4o+X47F3gB6HFmbV6D5CSi925eFUzKP/hSKd7ZBWi8RIULAACeqZ4N4z7KdhkpPXINExzM7EoXnNjz34ypA+OMWRd/UV38eXbEdwk6sNqVpQBPdPylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLKWxR3en0CGDa1SgIFF2e0D1MifvJO0mWnZVNHeRpQ=;
 b=A6zm7pxmTSIla9eXbUjNdz0bpgg9vVSvfhvFXNawtIVsnvHPprv2FMMcd3qffk3cRx80GrPS1CRboXEPf2OVOAAvGw7QE4getnV8r88QJNroV+5dbu72VWImCZ3Fj2x13Yo/l72lG3x/vXRWH6WQFKw3b3aHDzbUS6KAcn+CYWG+u2pO4B1//kFiCC23AcGf/6Tu89lA7zghwtYJAVh+xvTKBo0hMQe8NmXG0JNyLnJXiSY/tSsJsuxZePCpLHeIT7Ls5qSFSr1Ueoddrbv2lSmGYB6bJdYLtbq+V2wNn2O6TUH3Gj+KAgbkfSoR2iKSDJirQeyt4znfGADJ6KZxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLKWxR3en0CGDa1SgIFF2e0D1MifvJO0mWnZVNHeRpQ=;
 b=oO4xgF/iJbA0EnUiWB8wm1vHLt72ZfQnjcA2l8dbDRVrcl3hwg/NzsaOCBMnRrrXfDOmyj3HaIFIW8D8xfIWui9W2o239I9Ne9Izq2fDX/OO0C44++gjxY+IXJDUDswTpZgWPFDbqeppu6s36+ufpiJPCUsuDzH/dTb8J6ah+mo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cmdline: Interpret 'vpmu' as a positive boolean
Thread-Topic: [PATCH] x86/cmdline: Interpret 'vpmu' as a positive boolean
Thread-Index: AQHYLoKhjt6lbGTIskelwxGk8I14LqytR+SAgAAzewA=
Date: Thu, 3 Mar 2022 10:48:20 +0000
Message-ID: <bd6dda42-fc33-5958-31e7-741853c85c9b@citrix.com>
References: <20220302221157.17246-1-andrew.cooper3@citrix.com>
 <6ffbc025-758e-bb7e-4e87-0b6b9e1bc2e5@suse.com>
In-Reply-To: <6ffbc025-758e-bb7e-4e87-0b6b9e1bc2e5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 971bb2a5-d7bb-4b53-7a6f-08d9fd03551c
x-ms-traffictypediagnostic: BY5PR03MB5031:EE_
x-microsoft-antispam-prvs: <BY5PR03MB5031F7F1C2F106C1186CDD12BA049@BY5PR03MB5031.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f0SwqlULu7KgthJFhpKdqw6VrsV1ssBhpMKovwHlLin6diSIBnDh/KXzJvU02YSIADseDT5UQoS3SwlhLHtMFAhbbLHNQ4/tWDM3+5r5Et6wLNz0gmPaOuXbDAS8fDCa8RWUMWJvv+Y+dp9nVAIcfG8PKOkSiXSDRdtjjo1KGMTV+GddLkOUqI6WeuPa4/MSKCxbtm/dZj+GUk3xX9O7RYuODgsAQLStnGkk/0k9y8DkNcbEk+lNzAGn54/SidxpRlj3N+NZEh2nD4Vu8D1UW9+Cmu8VanF1lioaMGcZnreXeX65NgPwKsvzq4cEIa+MPSqImviOdUeAxfdVIZ/Eol49kKv1TUTeXWDuz8gMZE911bmzzB+vSYJ4TAF6sKbtrtcgakJhnDKvZetCKDGaNXU7Vhc+sIPkFlEjfD/ifkUJmm3VtpIJJkXp51s11kJCaf7VRmoCq2MYAUXY1ia7iccnf+LG5Wn0TRtYAJESV2LPmaXO25aSkOXR3K/7J7w6HPvM4uILEkkuY/xYIgW7a2+xJD9rvH6cUW0L9cfAocIc4fgvRLCvp5yJZcuUs2PQGhjxLtJmdp5Ogcq6gbvPw7FX1ALYdbvMQ1ff6VqFYV8zEs13AZNaS4eSnaJVgpAXhK4YlkHu8Zidu8tXcU5mxTakVKJA0ntOXGuEHKu06+bRbkxuDF5u5OFlpg8xRWYtbtD7GJnI0IVP11gE4lV1T3PAPuWDnZ93SK/N+HtPEZDcBaeOPVFgDm5dUr2iAINTBrjFR79wfhpz0B3QbThnVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(122000001)(6512007)(66446008)(76116006)(71200400001)(6486002)(36756003)(91956017)(66476007)(66556008)(66946007)(64756008)(31686004)(508600001)(8936002)(8676002)(4326008)(4744005)(38070700005)(54906003)(6916009)(53546011)(31696002)(186003)(316002)(26005)(5660300002)(2906002)(38100700002)(86362001)(2616005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1RlMU5CUVVxcGk0b3l2UjZiWW9FNm5DWUkwZVVSQXBUMHRSOTJaT3pGd3hO?=
 =?utf-8?B?L1BjczFuTWY3emtWRnFmclVza0c0eGIyeW8waDdVVTlnV2RrYVQ4bGRDU3RS?=
 =?utf-8?B?SEtuU1Ezb1drc3FaVGlETktTUkdLdDFHKzVnbXhxVnFxdkkxcjl6cXFMYTNR?=
 =?utf-8?B?MCs0SVVQak5RRm9pR280MVNjRHd6VUUwTnp4OHNUeG1OWEplQXVEWmhXQ1pE?=
 =?utf-8?B?OUl4SVBPMHpGaTNNZzkzY2krRFpraG42MFpuWDNLTTl3U0ErYkprb1UvWTRQ?=
 =?utf-8?B?elBiL2IxbExwZXJTcURTQXcwZ1ZpV0R5RDV1bXZ1TFRiOXNrcWpPUGdVNE5Q?=
 =?utf-8?B?STg4b1Q4cGU5a2ZsZE5jLzd3YmN1VnljODM5TU5PeWZnUGRiZWtYRGZDK2VI?=
 =?utf-8?B?eVFnakR6dzlkVFNhU05IM0kvdFdNb3VmU2I0ZnpTTW0zTVNZQ0o2cmlteTBD?=
 =?utf-8?B?QjJuek5pL1RLaTVUWGVnOFN5di9BMHMrYnV4bjVaNWJ2NUJ0REJIRGJPcWYv?=
 =?utf-8?B?WUhtQ1RwQ29jQUhqNENaaC9iTU5XMUMyWFY5RmFvVUYyS00yb0RyaTBxaWxa?=
 =?utf-8?B?VWFKOWpJOVMzc3pDS2lKYkJaeFNkRzV5bDY0U0g3ZS9jSDBHNVVveitqS1d1?=
 =?utf-8?B?QUJMQzlqbFB0dk43NUI4SnpmNGNnL2FRbkJWRFBGWEZHdm1QR0xIeFkzdFYw?=
 =?utf-8?B?dmdaandYcDhaOTMxMWcwZ2F4OERqN214bXFPcmFIeDFVSmJuaUtVQ3REVzFl?=
 =?utf-8?B?TlFiSzNBbTZ5bnM2S0d3SDE2TzFRZG1uRUhzaGVGbWpNNkNkWlUxeG03SzZa?=
 =?utf-8?B?b1NsZDZaMzBxRTBnVnpWaXIxYkd4VThyRG15MHBvSmF4UTJ1WVRxNXY2ditq?=
 =?utf-8?B?YndlVE5OaEJXZm11R1U0Rm5od1dmV3gxYXNwQzF1Sm1mczlSZGY4RHUvNkRI?=
 =?utf-8?B?RVVyMjRBdldKdlJDTUE0VWJYenVnZWswTDFQVGlORDkvdG02dUh3T3VMNTNS?=
 =?utf-8?B?SW1MbnpVTnlmeXduRjdzS3ZicFdnVVRLanlhM0NkZGRIWCt2N2Vuc2lZSFJt?=
 =?utf-8?B?R1VFNlJFNDJHU3Jqbnd5NGdBNmhTZmorek50ZS91ai9oWWdweWdiMW9IMWlY?=
 =?utf-8?B?RjQ3d3RtTnh0N0FHM2tKUVR3VE1KcHRhT1FucmVic2V1QnUzNjRmOXcrQUlV?=
 =?utf-8?B?YlBlMXhhV0Q4a2djbHFMMzFqSWd6WU8xUHE3ckxCOW9qTmJxVnFmTzlMVGF6?=
 =?utf-8?B?dG1LWE1sbXV1TWtuc0VCUmdLUy9OczEyZUlDS0F1cURGdzBLQ0RhV1JDOXdJ?=
 =?utf-8?B?WFhGSGZwSTB5akFka1dGU0JvUnhlMlh2TWg4TTNpdy9VaHFPVDl5NGJGRHpa?=
 =?utf-8?B?ck9HWmoxK0dhQWV3VFlMQ2tRaFVKc2FVeDJVQm9zbk5XQ0tNQTdmN1c2OHA3?=
 =?utf-8?B?V2NDRGN1WFJpVU9uaWNOY2JydTBoN0lKakoyVlYwbzJQT3pnMFJuYnVuRHJJ?=
 =?utf-8?B?eVE3dWtVWlVrZHBGTjBYK3RXMDZkekVwUzNNSzRKYmgrNkhJQUV6UHkwZFI5?=
 =?utf-8?B?dDQ2VmUrOFRWKy9LNWZvRHdKeTE0eHFiS0F5Y0lTbUlESXpJa3FoazhJaTFZ?=
 =?utf-8?B?MG9zZ0VmNUFYMGpZaXg2aWtBRWtxaG5PamtxaEZTNUoxalFFS05ic29FYi9j?=
 =?utf-8?B?S0VlaGNOd1R5TU5wc29nQTZjK2F0OEE3dzFXUXhRV3BFWmM0Z29LNjY2Nzd0?=
 =?utf-8?B?N1h5U2hOOUFnMlV0SHN0YWdDSEVaTmRndk52N1B3YzF5UTVUWkZBaTNnR2hp?=
 =?utf-8?B?RlNKRmN5Wkh5SE5xVVU4Y3V4c0RJQWJGVEU4cEFFcjdTbVdGMFVHbEZCbDFD?=
 =?utf-8?B?cUNXT1B6VjVYdWY3Mk5Qb1VIR2c2aG10T1pCR1NmSG1UeDlMc1JBaitqdmRS?=
 =?utf-8?B?N3FNcGlZTm1BMmU5N1BRNEtTMFFrK2YyUk1kbDVSS0E5TWRGVDVacUQ3aEJk?=
 =?utf-8?B?S2tRRitzaStyY09iUjNDWEVLQ3V4YXJINmxBTEdlc1E2UjFpakpLWEJmbERM?=
 =?utf-8?B?Um4xRlA5TEFVWlBMSlZmcjVNVWJqNjZRWTEzNXJCcU1RNGMyWHR6TWZJbjdv?=
 =?utf-8?B?aG9SZlJPRWlTN00wcExHTi8zNjNVSDhJWTBqZHFXb2VELzdKN1BtdWh0V3RY?=
 =?utf-8?B?OVRCQ1pzSHBQcWN4VHkzSnVCRXJjRDVoUEpBTkNNdkgvUTQ1Y21GQjZMVzF5?=
 =?utf-8?B?eEFYRlYvRUJGejIzenFFdGg4WlhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B85C04D3F65376489A6A0F04BAF6FFDE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971bb2a5-d7bb-4b53-7a6f-08d9fd03551c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 10:48:20.3513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ukZoz6nbFurHROdS4OyKUQXfbEs5FDkvPnfoGHc0KI8f+vgyPCsWjMEBcLjYvaT27SsRhtBkDrW98koaKUfd7JEKfZnkyxNAzuHJtm1wb1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5031
X-OriginatorOrg: citrix.com

T24gMDMvMDMvMjAyMiAwNzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjAzLjIwMjIg
MjM6MTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGlzIG1ha2VzIGl0IGJlaGF2ZSBzbGln
aHRseSBtb3JlIGxpa2UgYSByZWd1bGFyIGJvb2xlYW4gb3B0aW9uLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+DQo+PiBTbGlnaHRseSBS
RkMsIGJlY2F1c2UgdGhlcmUgaXMgbm8gZWFzeSB3YXkgb2YgbWFraW5nIHRoZSBvcHBvc2l0ZSAi
bm9ybWFsDQo+PiBib29sZWFuIiBjYXNlIHdvcmsgZm9yIG5vLXZwbXUuDQo+IFRoZXJlJ3Mgbm90
aGluZyB0byBkbyB0byBtYWtlIHRoaXMgd29yayBhZmFpY3Q6IEdlbmVyaWMgY29tbWFuZCBsaW5l
DQo+IGhhbmRsaW5nIGNvbnZlcnRzICJuby08b3B0aW9uPiIgdG8gIjxvcHRpb24+PW5vIiBmb3Ig
Y3VzdG9tIHBhcmFtcy4NCg0KT2ggLSBJJ2QgZm9yZ290dGVuIHRoYXQsIGluIHdoaWNoIGNhc2Ug
dGhpcyBwYXRjaCBhY3R1YWxseSB3YW50cyB0byBiZQ0Kc2ltcGx5Og0KDQpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9rZXJuZWwuYyBiL3hlbi9jb21tb24va2VybmVsLmMNCmluZGV4IGFkZmYyZDJj
NzdmMy4uMmNlYTFkYTc4MWFjIDEwMDY0NA0KLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYw0KKysr
IGIveGVuL2NvbW1vbi9rZXJuZWwuYw0KQEAgLTE2Miw2ICsxNjIsMTEgQEAgc3RhdGljIGludCBw
YXJzZV9wYXJhbXMoY29uc3QgY2hhciAqY21kbGluZSwgY29uc3QNCnN0cnVjdCBrZXJuZWxfcGFy
YW0gKnN0YXJ0LA0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzYWZl
X3N0cmNweShvcHQsICJubyIpOw0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBvcHR2YWwgPSBvcHQ7DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKCAhKm9wdHZhbCApDQorwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzYWZlX3N0cmNweShvcHQsICIxIik7DQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0dmFsID0gb3B0Ow0KK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByY3RtcCA9IHBh
cmFtLT5wYXIuZnVuYyhvcHR2YWwpOw0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBPUFRfSUdOT1JFOg0KDQp0byB0
dXJuICJvcHRpb25cMCIgaW50byAib3B0aW9uPTEiLCBubz8NCg0KfkFuZHJldw0K


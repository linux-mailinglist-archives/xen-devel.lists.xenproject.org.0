Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE904BA567
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 17:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274888.470512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjJ2-0000zy-BS; Thu, 17 Feb 2022 16:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274888.470512; Thu, 17 Feb 2022 16:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjJ2-0000we-8J; Thu, 17 Feb 2022 16:06:56 +0000
Received: by outflank-mailman (input) for mailman id 274888;
 Thu, 17 Feb 2022 16:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+1Z=TA=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKjJ1-0000wY-7D
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 16:06:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d96364e-900b-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 17:06:53 +0100 (CET)
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
X-Inumbo-ID: 9d96364e-900b-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645114013;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ypmZqLLCvaipn6/0EIASn2jU1PCFp3n5XIdOL8ylKdQ=;
  b=QLn0p1eHCNYQ8hdqGv50nBt24c29L8F9fppbjLcN6Uh3ArJapZ0L904u
   6c90N7JxYb69E3xq0UnylhZZj3jMYNfQvZ+hong5wFCafRyhvWX4Uoex/
   YkfDxuCd07EUplnK3thqkM2GpkDLl8vRvBrESdHLp9Sey6K1jFs7didoW
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iM40Q1ZZXA+4pQJ9wfRrPuTg+kuY25QKWMn5iMU9CgiIvCa3nnXc3Si7k7FRjjaEY8IkiTke40
 fy+JsGQRMPanOPwaMEyeOJkqFc0QFVOiw/yeOgdqPDmnMBOQhtBxmkF8SxVjo+HpRaFqYL9gkd
 e57lJLFTlaXRDLG7otOUfwOMrTQxVElRrpcvFTiIRrSFfMlV9X6/iw3EFFfJ0Aj8CCNRQ0l2y6
 cJp6BFOtFl4A2J6VLZUjJM6Y4Z8+jpB4pmOcEX3Zd4gq68w7kMT3G3qKllggqKttSC9sSBJhn0
 I6MyHGAcnU0/tSfFitmNpkrT
X-SBRS: 5.1
X-MesageID: 64343431
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DrNUNqPXb6yYzwTvrR1+kMFynXyQoLVcMsEvi/4bfWQNrUp032RUy
 mdOC2jUMq2LMWCkLdhwbYiwpEMG7ZKHy9JgTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s8w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozLOvdN84
 uRHj5WxcyYzErDpptYdcDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmtr2psSRq+2i
 8wxNDhhYTLkZh51anAJGJ8jt9WVukDkSmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3ErvDLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaD+TwfVvBhGdcz6Tus0IbJxjirBkstG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8oDGJGT9bxgbQ+0RqmBNzGJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Id0Iu24geBoybZtsldrVj
 Kn741w5CHh7ZibCUEOKS9jpV5RCIVbITrwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEQFD7OgM3KGqub+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwljITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:r1zu2a/oqF4nbyLOUaluk+F8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFr7X5To3SIDUO31HYbb2KjLGSjAEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadh/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHjWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNENyMIv/MmTvKe0Tt8gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvtn+9Pa1wVB4S0rpXW9
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNcjW2By4OScTepGb0oYi6+XgKo
 OOBK4=
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="scan'208";a="64343431"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMhuMzJVwavUTu+gFfH4hNxeQlYpaMkJrowBOsj06dubc5gmoXdy/ArspUKIFZdeRk++m/aKRtaopKEQ+V604tbgJ+uq5vH1hC9MgrlqMIGKld9vNLc2fxeresVqK7OBZaQ0cULIXKc/dCqEWPVZL9EY8XZ7QfsO+drxStJ84xJoiGhvH+NspWlPrwq9omSWWnnMJxNEZcM/4mZ2kHcyLXm4gOFharUExkrjziwvh7fyjkAIWPW6QxIgT/moDLe1/HAXLUpJcrTGvhr1oujcSlM3oiPn2dkCVeSp+O5A9VKc9aeM/XJnoYkZa3EpBTCiOOflmabRp9f0XhgiSuFK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypmZqLLCvaipn6/0EIASn2jU1PCFp3n5XIdOL8ylKdQ=;
 b=MvllHHb8u27NuvAVx5f6gXMWrl3IT4tMwlqa170YnwM1tKYZvZW4vIh/Si/NduZu7TyEEXEk4TVHRMbTHUDUjmi2ir6sYjcV/c8jg7wmu+CbmNVr238I4UpiVa4oI6XcwvtlMUGNVOJVsIZNOUrg6EjGf0O39nDe4lUZ3QRziqrTbkLv5regdYNgEcdM+FAAVrrNpkm+dz++hRwX6q+eYS7lAdSnwTskkoLOQAfuu/SESrziZOGcWFix+c/aKj1rVqttSLGSwa4zhKABVR05zNQlbv2vMraeEykoEQIiixtn8vomcUXO5NI0dNCnXKyw/NgFLmjjQqDsBx8cIKLVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypmZqLLCvaipn6/0EIASn2jU1PCFp3n5XIdOL8ylKdQ=;
 b=Dw8p2Pe0w+qG9jVAt6qOYjttrc9ZGdTv1PT1+Gq0sc1iwvfhn8pHtoVy/wcXr9tK7dnwYKztl4p9Ioc3PIVLaIEmWJTX1vAfn67RrPgHN27lkQrftwqXlrsjAv5fTp8j5tW4hCQWs2gAYQEoWzk6wGQcAbQTYZLpU6cbpjLlWBw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.1 6.5/70] x86/kexec: Annotate embedded data with ELF
 metadata
Thread-Topic: [PATCH v2.1 6.5/70] x86/kexec: Annotate embedded data with ELF
 metadata
Thread-Index: AQHYI+WIB3ag8ccQV0mMbUcu9Q8VKKyXjjSAgAAXo4CAAC0dgIAAFfaA
Date: Thu, 17 Feb 2022 16:06:44 +0000
Message-ID: <19446d4d-b4ee-e26c-10b1-b2c49a1950ad@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220217100158.22402-1-andrew.cooper3@citrix.com>
 <4e9924f7-fdfa-c3c3-7b6c-e5cbe77ff9ac@suse.com>
 <826c97dd-dda9-b6c2-37bf-451354fcfde2@citrix.com>
 <e35ca83f-12ad-0c28-075b-82ff08b2bf1d@suse.com>
In-Reply-To: <e35ca83f-12ad-0c28-075b-82ff08b2bf1d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e3eb858-7560-496a-01f7-08d9f22f7e76
x-ms-traffictypediagnostic: BN7PR03MB3604:EE_
x-microsoft-antispam-prvs: <BN7PR03MB36040769F60DFF809B82832EBA369@BN7PR03MB3604.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vpd9HVp8oAbzrTFlOahCPrErJGmp4EkmSKVeql/F41/Wvg8qBjvmEUgM2mkRex3aXPvburAr687+nB5fICpwOyEa4cXOM6tr2ytAsVXI5s2s5EutcVYSCKaByMoxTwomWJYUWDUYkRo/oWrMMq6dIax2tAcGEjkVrKdpCoQmuBgzDjTt8MExydVSsIQLmPe/iTWbt7MPblZdP7iakRCoAD64zMM5v/ziID1sFDwAD6ZooHgxkk8SijLZl6xuxHg1HpaNPwxxtMQAiecwNly1wkc14AOZ0iGq0seSVakgrLz8HBxEJIjLvWk+zkxwBl/ZB5BMHVIgBGhe/EWLGlLwfGA3tI6IKTYXasNwjG87mClHNy5qVocEhCrafBR+hMvCEx0/ZmlnmkWt4G3hqPKnqhxP8wRPwnR6C4kG52QD1+gi8rn5qEIvaP+Eranjez4tgHIm20jdZ6lz56KQ4jqmW8csz+KMTkE5W8dMWOIdq54HgdjrxrHIzCxQI0bFoHBxWkD5QPlfFu+7ipBrA5dZQMJ6fxSbBn5M230m8TCXxXY2MWs7LP+ftCLQ7phTI9Lv59UPUonW7M3luu1nuzsr/MMKn0RULArLfXi+NhqvakR98m0azjFgsRlL7D9jbj1/6cnSLMRy8DY724eaUm9Q/MkSZ0tJrYNqaIL/1060nlpnugzwIXejKvgCJ/i/nAOTUtfbch9a3AKmKsUDTQsFetbenhf+sk1hAOe1rkI/qwcPfvoFIF/gGfQKmijehnRyomxNjWTISTyWIkgOqJsVxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(38070700005)(122000001)(6506007)(2616005)(6486002)(53546011)(71200400001)(508600001)(38100700002)(31696002)(4326008)(6512007)(83380400001)(82960400001)(86362001)(8676002)(2906002)(31686004)(36756003)(316002)(76116006)(8936002)(66946007)(66556008)(66476007)(6916009)(64756008)(66446008)(54906003)(26005)(91956017)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVVZZVQvQ3pGR2M1TnZ1MXhEeklWK0ZWSVI4SGdXQ0JTc0xxYWwyQTBtR1pF?=
 =?utf-8?B?bW4rQitsa3dhQnAra3pTSXgxQnppbDA2dm9IUGoyM3VQK1hjb2ZnUW1tVWdB?=
 =?utf-8?B?Y3lhemVsUVNJUDlRVGpRRGZGZTc5aHVwcjRxdmZicFkzWGF3SzJ3NHVWMXM3?=
 =?utf-8?B?QUhyRVpkLzFxL2lvRzltc2djeVpBV0o4bGVoUE8xSENadjBhendzRk9udmpn?=
 =?utf-8?B?VzdCQm5UNFNGYzUvMUVqejlhRWd1QjFlZTFBNEFPRWtoazJSRDdaelF4YVNz?=
 =?utf-8?B?d0VZdlArODUrMTJDanp5QkNIS2RxenloTk83akVGTkZ6L21HQldZZ1FuNGFs?=
 =?utf-8?B?R2JFS1FKekpuRGhhaEduU0Y2cTB2c2ROdFJTMUR0T3dsYVhScVdjVENQVGZT?=
 =?utf-8?B?bFdXc01aLzMzQjRUeERucGg1Unc3VjUzdHYzZzRlczBGY1RYK2llRWx1Sklm?=
 =?utf-8?B?VHVCUjh5K0p3TW5DWE81Qkk3N2h2aXdCMW44ZERtQSt1M2M4WXZySEg0a2FX?=
 =?utf-8?B?SWZvcmRGTmpwUWtVYTloYm11VzM4ekRBbEphYTlJeTREemtaajY4MFdzUWRG?=
 =?utf-8?B?UUgxOFFkMitoa212RU1ieThleGRibTVnb0lUV0lITE9yRlRIazhDMHZVSHdI?=
 =?utf-8?B?b1pWQVpFZVpaYmxIdWphMFkwakFSakpYVkhJN3NTdndIZ0RSNmpPRUpCMmNN?=
 =?utf-8?B?aXRhNVZuc1QvUjgrQjVFZjM3cHkxaHlpaGI2NVY3VzVzbWhDUlVERWhXUlpm?=
 =?utf-8?B?ZkdwTDVJQjdvVmlUVGxudDhFaFRmQld1S2pjeHFPNDB5c0VBUUZaT0Z1bEwz?=
 =?utf-8?B?SVlZUmhXcHJPVEtVZ0FEV1lLTEU2NE9Reld6NFhnTUtVQ24yUjR3amtJR2xi?=
 =?utf-8?B?b2ZHdTR2ZE9VWjJRSG9sZXBiVHBRRHpHMnI5M09VVEl5MVR1RU1URlYydVNQ?=
 =?utf-8?B?cjFLQnF4MUk1enRBNllzM1VZNDVOSlBrdEIwWWNqc2hTL3o1RDdlQ2xwZTJq?=
 =?utf-8?B?UDNwSTd4b2M4VmoxSG40NjRNL1lsbXJWQ3E1eTZnQ3cyK0oxbUs4MHFudUs5?=
 =?utf-8?B?cVQrdGNpNEc4QSt1dnZUYzBwNWR1N3FPVmNvTzlBcDRYVC9ZMktoSFljSURH?=
 =?utf-8?B?dmN4eE0zWjBOZUYwRUZjSVJFeHp3QlY2T2o1bldhUjZ3UE9VL0ZRamdRVk5I?=
 =?utf-8?B?Z3FzRjFadzlDYlVWRUlkRWF4eFZneUdmWENZRmRTMStSUnh2NVAyVlRaZEE1?=
 =?utf-8?B?RnlDc3ZlYlVzbnJiSFJvM0JBS2FubkVrVCtEcGJ6YzRPODcwZ2I4V1Q1YU1s?=
 =?utf-8?B?ei8xYXo1bklZR3plOTdNbVZLa0dja3BoSnBHNkNhOWQycThTNlNDN0t0Z1lS?=
 =?utf-8?B?blhyL25mMHllSmJibmlDcnBFRzF1VHZxd1JzWk96dTQybWVYRnJ2eDM0UUw1?=
 =?utf-8?B?cVdMS2dhRVFMdXErVzZ3blNaSlJwSmFTUnBJVDBEdHBwcHI1OTA1OEpkSUs2?=
 =?utf-8?B?clRVc3FoMXp3Q2R2dE4vdU5pNGIrd2VaV3pTemhEVVJjUTRaYU5nS24vb2lS?=
 =?utf-8?B?ZWlVNVVQTVg2T2thNktNU3hnaktkcWN0dGxGTWdCSndJQ05TZHFtb3IrZWJ0?=
 =?utf-8?B?eGliY25IRnVWd2grRGkrWmZuRE9HWkJOMkZLVWxmVm9PQ3AvUVVZUkNhODBq?=
 =?utf-8?B?UTVkMUZlQ0phYUdQOWJhU3VJeklaeVRXMHFKVGt5M2NNK0tNSmF6bEkrZEdL?=
 =?utf-8?B?WXZxQWFKR0kwSzY0c01HL29VVXhkNW1yZUFlR3Z3MlBIYkJxaGptYWNVcWxD?=
 =?utf-8?B?eERGeUVWNjNnMEd0dmhmNXJCcDRTL09WY0N2NXlNREp3YmhlZnlpYm1CRXRS?=
 =?utf-8?B?ZnQ4UXdGakNxWFdqVkdWamloZEl4OE9zeHhoL1FLTnlGRysyQ0hqR2xmYTRy?=
 =?utf-8?B?amZKTGFQeW9aQWRqTmZPVDNCSEF3SGNOMW5vdlFEOEpMT3Z1MmhFanIxeGxT?=
 =?utf-8?B?VGNCY1JvbmM3d2lpd1B5bHNOTWJCb1JpSUQ3c2dJNkdhdTA2VEZLMk5oMWhp?=
 =?utf-8?B?N3BLZFBnaE92K1AxUVQ3bXBzVjJtRmtva3Jic3daeUNjbWpNNWZ2aUY1UGk5?=
 =?utf-8?B?aE9lcDV4TVF6NVlUS3J4bVRPZ3dSU0FvWXF3UEx3VnJLYy9LeUt5Z0ZTRGZ1?=
 =?utf-8?B?eTBxeit4TitvZFo4VXJuZkZCaUE4NXpJeVRyTmdCTXdIV2JVQ1hNNDlLNmsv?=
 =?utf-8?B?NTcrWWpZd01UV2l4dG1odkc0UDZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2529C01C7422BB49ABE43A7C7180ABE9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3eb858-7560-496a-01f7-08d9f22f7e76
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 16:06:44.7746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWh/VT+PYewj4o1BqBgtFlhTEoZkh50IxVvN+IXaA6SqI7oZHeA8TagWhycXn52RMiBb7WvBPiQnq19dxbbiw/7IFVjIYUALbqrDCJj3NTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3604
X-OriginatorOrg: citrix.com

T24gMTcvMDIvMjAyMiAxNDo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjAyLjIwMjIg
MTM6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNy8wMi8yMDIyIDEwOjQyLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wMi4yMDIyIDExOjAxLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBTY2FubmluZyBmb3IgZW1iZWRkZWQgZW5kYnJhbmNoIGluc3RydWN0aW9ucyBp
bnZvbHZlcyBwYXJzaW5nIHRoZSAudGV4dA0KPj4+PiBkaXNhc3NlbWJseS4gIERhdGEgaW4gdGhl
IGtleGVjIHRyYW1wb2xpbmUgaGFzIG5vIEVMRiBtZXRhZGF0YSwgc28gb2JqZHVtcA0KPj4+PiB0
cmVhdHMgaXQgYXMgaW5zdHJ1Y3Rpb25zIGFuZCB0cmllcyB0byBkaXNhc3NlbWJsZS4gIENvbnZl
cnQ6DQo+Pj4+DQo+Pj4+ICAgZmZmZjgyZDA0MDM5NjEwOCA8Y29tcGF0aWJpbGl0eV9tb2RlX2Zh
cj46DQo+Pj4gV2hhdCBhYm91dCB0aGUgKHBvc3NpYmxlKSBwYWRkaW5nIGFoZWFkIG9mIHRoaXM/
IFNob3VsZCB0aGUgLmFsaWduDQo+Pj4gdGhlcmUgcGVyaGFwcyBzcGVjaWZ5IGEgZmlsbGVyIGNo
YXJhY3Rlcj8NCj4+IFdoYXQgYWJvdXQgaXQ/wqAgSXQncyBqdXN0IGxvbmcgbm9wcyBsaWtlIGFs
bCBvdGhlciBwYWRkaW5nIGluIC50ZXh0DQo+Pg0KPj4gZmZmZjgyZDA0MDM5NjEwMTrCoMKgwqDC
oMKgwqAgZmYgZDXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FsbMKgwqAg
KiVlYnANCj4+IGZmZmY4MmQwNDAzOTYxMDM6wqDCoMKgwqDCoMKgIDBmIDBiwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVkMsKgwqAgwqANCj4+IGZmZmY4MmQwNDAzOTYxMDU6
wqDCoMKgwqDCoMKgIDBmIDFmIDAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vcGzC
oMKgICglZWF4KQ0KPj4NCj4+IGZmZmY4MmQwNDAzOTYxMDggPGNvbXBhdGliaWxpdHlfbW9kZV9m
YXI+Og0KPj4gZmZmZjgyZDA0MDM5NjEwODrCoMKgwqDCoMKgwqAgMDAgMDAgMDAgMDAgMTANCj4+
IDAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLi4uLi4uDQo+Pg0KPj4gQW5kIGZvciB0aGlzIHByb2JsZW0sIHdlIGRv
bid0IG5lZWQgdG8gY2FyZSBhYm91dCB0aGUgYmVoYXZpb3VyIG9mIGFueQ0KPj4gcHJlLUNFVCB2
ZXJzaW9uIG9mIGJpbnV0aWxzLg0KPiBJIHdhcyBhYm91dCB0byBhc2ssIGJ1dCB5ZXMgLSB0aGlz
IGlzIGEgZ29vZCBwb2ludC4NCj4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCg0KVGhhbmtzLg0KDQo+Pj4gIEl0IGp1c3Qgc28NCj4+PiBoYXBwZW5zIHRo
YXQgdGhlcmUncyBubyA0LWJ5dGUgZ2FwIGJldHdlZW4gY29tcGF0X21vZGVfZ2R0X2Rlc2MgYW5k
DQo+Pj4gY29tcGF0X21vZGVfZ2R0LiBDaGFuZ2luZyB0aGUgLmFsaWduIGFoZWFkIG9mIGNvbXBh
dGliaWxpdHlfbW9kZV9mYXINCj4+PiB3b3VsZCBlbGltaW5hdGUgdGhlIHJpc2sgb2YgcGFkZGlu
ZyBhcHBlYXJpbmcgaWYgdGhlIGNvZGUgZnVydGhlciB1cA0KPj4+IGNoYW5nZWQuDQo+PiBHYXBz
IHdpbGwgYmUgZm9ybWVkIG9mIGxvbmcgbm9wcyBiZWNhdXNlIHdlJ3JlIGluIC50ZXh0LCBhbmQg
dGhleSBtZXJnZQ0KPj4gd2l0aCB0aGUgcHJldmlvdXMgZGF0YSBibG9iIChzZWUgYmVsb3cpLg0K
Pj4NCj4+Pj4gICBmZmZmODJkMDQwMzk2MTM2IDxyZWxvY19zdGFjaz46DQo+Pj4+ICAgICAgICAg
ICAuLi4NCj4+PiBOb3cgdGhpcyBpcyBwYXJ0aWN1bGFybHkgcHV6emxpbmc6IFVzIHNldHRpbmcg
JXJzcCB0byBhbiB1bmFsaWduZWQNCj4+PiBhZGRyZXNzIGlzIGNsZWFybHkgbm90IEFCSS1jb25m
b3JtaW5nLiBTaW5jZSB5b3UncmUgZmlkZGxpbmcgd2l0aA0KPj4+IGFsbCBvZiB0aGlzIGFscmVh
ZHkgYW55d2F5LCBob3cgYWJvdXQgZml4aW5nIHRoaXMgYXQgdGhlIHNhbWUgdGltZT8NCj4+PiBP
ZiBjb3Vyc2UgdGhlcmUgd291bGQgdGhlbiBhcHBlYXIgcGFkZGluZyBhaGVhZCBvZiB0aGUgc3Rh
Y2ssIHVubGVzcw0KPj4+IHRoZSBzdGFjayB3YXMgbW92ZWQgdXAgc29tZS4NCj4+IE9oIC0gSSdk
IG5vdCBldmVuIG5vdGljZWQgdGhhdC7CoCBMdWNraWx5IHRoZXJlIGlzIG5vIEFCSSB3aGljaCBt
YXR0ZXJzLA0KPj4gYmVjYXVzZSBpdCdzIHRoZSBjYWxsL3B1c2gvcG9wJ3MgaW4gdGhpcyBmaWxl
IGFsb25lLg0KPiBBbmQgdGhlIGVudGl0eSB0cmFuc2l0aW9uZWQgdG8gaXMgZm9yYmlkZGVuIHRv
IG1ha2UgdXNlIG9mIG91ciBzdGFjaz8NCg0KVGhlcmUncyBubyBleHBlY3RhdGlvbi9ndWFyYW50
ZWUgb2YgYSBnb29kIHN0YWNrLCBuby7CoCBQdXJnYXRvcnkgaXMgYQ0KdmVyeSBtaW5pbWFsIGVu
dmlyb25tZW50IGJlZm9yZSBpdCBzZXRzIHNvbWV0aGluZyBuZXcgdXAuDQoNCj4+IFdpdGggYW4g
YWxpZ24gOCwgd2UgZ2V0Og0KPj4NCj4+IGZmZmY4MmQwNDAzYTcxMzggPGNvbXBhdF9tb2RlX2lk
dD46DQo+PiBmZmZmODJkMDQwM2E3MTM4OsKgwqDCoMKgwqDCoCAwMCAwMCAwMCAwMCAwMCAwMCA2
Ng0KPj4gOTDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuLi4uLi5mLg0KPj4NCj4+IGZmZmY4MmQwNDAzYTcxNDAgPHJlbG9jX3N0YWNrPjoN
Cj4+IMKgwqDCoMKgwqDCoMKgIC4uLg0KPj4NCj4+IHdoZXJlIHRoZSA2NiA5MCBpbiBjb21wYXRf
bW9kZV9pZHQgaXMgdGhlIHBhZGRpbmcuwqAgUmVjYWxsIGMvcyA5ZmQxODE1NDBjN2U2DQo+Pg0K
Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMNCj4+Pj4gQEAgLTg3LDYgKzg3LDcgQEAgU0VDVElPTlMNCj4+Pj4gICAgICAg
ICAqKC50ZXh0LnVubGlrZWx5KQ0KPj4+PiAgICAgICAgICooLmZpeHVwKQ0KPj4+PiAgICAgICAg
ICooLnRleHQua2V4ZWMpDQo+Pj4+ICsgICAgICAga2V4ZWNfcmVsb2NfZW5kID0gLjsNCj4+PiBE
b2VzIHRoaXMgbWF5YmUgd2FudCBhbGlnbmluZyBvbiBhIDQtIG9yIGV2ZW4gOC1ieXRlIGJvdW5k
YXJ5PyBJZg0KPj4+IHNvLCBpbW8gcHJlZmVyYWJseSBub3QgaGVyZSwgYnV0IGJ5IGFkZGluZyBh
IHRyYWlsaW5nIC5hbGlnbiBpbiB0aGUNCj4+PiAuUyBmaWxlLg0KPj4gVGhlcmUncyBubyBzcGVj
aWFsIG5lZWQgZm9yIGl0IHRvIGJlIGFsaWduZWQsIGFuZCBpdCBpcyBhbnl3YXkgYXMgdGhlDQo+
PiBzdGFjayBpcyB0aGUgbGFzdCBvYmplY3QgaW4gaXQuDQo+IFlvdSBtZWFuIGl0IGFueXdheSB3
b3VsZCBiZSwgaWYgdGhlIHN0YWNrIHdhcyBhbGlnbmVkPyBPciBhbSBJIHRvIGltcGx5DQo+IHRo
YXQgeW91J3ZlIGFtZW5kZWQgdGhlIHBhdGNoIHRvIGFkZCBhbGlnbm1lbnQgdGhlcmU/DQoNCkkg
aGF2ZSBhbGlnbmVkIHJlbG9jX3N0YWNrIHN0YWNrIGJlY2F1c2UgdGhhdCdzIGEgbm8tYnJhaW5l
ci4NCg0KV2l0aCB0aGF0IHN1aXRhYmx5IGFsaWduZWQsIGtleGVjX3JlbG9jX2VuZCBiZWNvbWVz
IGFsaWduZWQgbmF0dXJhbGx5DQooYmVjYXVzZSByZWxvY19zdGFjayBpcyB0aGUgZmluYWwgb2Jq
ZWN0KSwgYW5kIEkgZG9uJ3QgdGhpbmsgdGhlcmUncw0KbXVjaCBwb2ludCBwdXR0aW5nIGFueXRo
aW5nIGV4cGxpY2l0IGluIHRoZSBsaW5rZXIgc2NyaXB0Lg0KDQpJdCBkb2Vzbid0IG1hdHRlciBp
ZiBzdWJzZXF1ZW50IHRoaW5ncyBmb2xsb3cgaW1tZWRpYXRlbHksIGJlY2F1c2UgdGhpcw0KdHJh
bXBvbGluZSBpcyBjb3BpZWQgaW50byB0aGUga2V4ZWMgcmVnaW9uIGJlZm9yZSBiZWluZyB1c2Vk
LsKgIEluDQpwcmFjdGljZSwgdGhlIHRoaW5nIGltbWVkaWF0ZWx5IGZvbGxvd2luZyBpdCBpcyAu
aW5pdC50ZXh0Lg0KDQp+QW5kcmV3DQo=


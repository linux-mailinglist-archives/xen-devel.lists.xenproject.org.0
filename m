Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFED4BF74B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 12:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276726.472995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMTQr-0001N4-FZ; Tue, 22 Feb 2022 11:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276726.472995; Tue, 22 Feb 2022 11:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMTQr-0001LE-C8; Tue, 22 Feb 2022 11:34:13 +0000
Received: by outflank-mailman (input) for mailman id 276726;
 Tue, 22 Feb 2022 11:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMTQp-0001Kp-FT
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 11:34:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37611047-93d3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 12:33:13 +0100 (CET)
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
X-Inumbo-ID: 37611047-93d3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645529649;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tpzYAYIGtBlCj4TZTKnv7P9xIXLEigiuEVLZ+ryIB7s=;
  b=agt324C01TNeWnF6iaA+thSzqwSqu5KURZ/pBNL7IC88DZ/Xy5RzwwqD
   7jUj/bmsit62owIxjM5eGp+DvCnynnQo9dXEeYQjJO+IZYuydMGJrqQsq
   vBsluq+YAtSkvhueUva3D4gOrHtJRIo5Sdn0mWqsxJHCEUcIUJmLTWYPJ
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64714177
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:15rS7q+CmBcyoq8UTqodDrUDkn6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2QZCzrVMvuCazCnLtF/atiyp0IF7ZLWztAxHAZury88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24LjW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYSubgw0AredodY+AkJ+TB5QOaNs8bCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZGMGY2M0uojxtna2UFK9FhmbyRm17QQj92q3CqiKMJyj2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PKK83u5nhhuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUi9iaG15bOsj+rJTlfaGF+RtgonsY5EGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bptYJ260P
 RWP4Fs5CHpv0J2CN/Qfj2WZUZlC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/q9BLdglSdSBhbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:W2h3E6//8mfchfzfCVBuk+F2db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFrrX5To3SIDUO31HYYr2KjLGSjwEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadg/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHzWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mEryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczAgNl1mpDs1L8Zqq
 iJn/4SBbU115oXRBDynfLZ4Xik7N/p0Q669bbXuwq6nSWzfkNENyMIv/MmTvKe0Tt7gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvt3+9Pa1wVR4S0rpXWN
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcjW2He4OSMTeuOb0oAiPvE=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64714177"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaIqluOBqEpgx4pybWig0HyQj7vthdUV1BR/Ub0sC+hdXV1jaAF0k+G5ff2YxlSSBu2tewqntYNcHwbwYGuDtIksjp6kyelHoSPiIsbJ78xtm+9B4O8WLibqUFWgpZytAzfQRPgCfSgNXxM4KCC9sO1Ft8eC3v7UAakFxCC9p5JVQkvSI1lTIZb/PcYInXd1i9iO7NvrPqI8nzSuWHJdAbOmLFIdCW6hQndzb+j9Mnc17oTSJdgvfjg0KP/WLxVsMDOiCui8Y1s+AyI7EvsUcN5LyNqriPLK20im/Zap20xW+042sJ5if/U0Kmxv9dizDAmejvFe0BsqQMhRl5ct6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpzYAYIGtBlCj4TZTKnv7P9xIXLEigiuEVLZ+ryIB7s=;
 b=gMYRTqjDQJBIWY2KbLpwLxKQo2QETwYHosRTol9dJg8gUQbhBM6Tqh16oHSy9G/k35wM83qiMyscz1HPoNdb+nPWHE39ROuu3mTol2nH5y933BrqwzQYRv+f3l+5jfuIyWnxA+yiF8zxvaX+TdMGhut+ML4hSRmilQkLCA8SwKVZDpoYxynmAF4Ko07iN8AJNfiR1kJVfjGOX7V5Abuy+7Vd62TFqrA/yCSzgLbyl6DAb6z4BD/T+J5wupWzFOPfVxEjtlNkH1qqsQpi55BMLzkc4zGd/LpsbsZ/j4c93nu3nPzfRxGkJLFSJRhbWp00kpDMZHqDfyxtW65Lkb2r2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpzYAYIGtBlCj4TZTKnv7P9xIXLEigiuEVLZ+ryIB7s=;
 b=uImmHGR5Uw2VleNyYrlke11YLzMuBvzVNKK1+1YGmEZXpBW2Clmb9kRNrteWFmvhLk5pnZdUhA/61JPsdbcFJWzlFk9RkDNq+dCjTzA/m2OsasOIh8/bbclt0pUYp4lFIGZK0TZDSpaPx8ourhfQ3As7nKX6UHsEcnOzr1D1YS0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Topic: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Index: AQHYJ011tWngdwKc2UG3RuxDqKou56yfTukAgAAXlACAAAIiAIAACPWA
Date: Tue, 22 Feb 2022 11:34:03 +0000
Message-ID: <bd88d0bf-1459-0600-ec22-a4b0797b8f32@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220221180356.13527-1-andrew.cooper3@citrix.com>
 <0c253fda-c5f6-b7ea-df6c-8b43b86c6a59@suse.com>
 <9e442a8d-ef71-3776-e655-8c8a226af706@citrix.com>
 <61efbf17-b07e-d513-7430-d0549e1384d7@citrix.com>
In-Reply-To: <61efbf17-b07e-d513-7430-d0549e1384d7@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06911ca3-011c-48d2-baca-08d9f5f73aad
x-ms-traffictypediagnostic: BN7PR03MB3889:EE_
x-microsoft-antispam-prvs: <BN7PR03MB38893EBA06A747BCEA5A6842BA3B9@BN7PR03MB3889.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: keJR2WLts+tK5OznMtS9RpxdxUbYAKRer5YZykXMrliXidfdf29ThSJXCt6tdkdCWeGTAvIIFUH+SVry7rUkjysCPOVxm7ES7uiyA0dhmqj05ReL22pByFudtp6xvvkUoith/mnBrQLNzvvES0dFwXQKjld9q9yae+vX/QUp1n897ESKF6m+vGEMZmKDLVGyJpgqRs7TkfPtnSFK4WSPXnCtLyyIivmR+zgzLfrrVZnhgpG/sKg5bUFO97QC43IerIlHHLByCdVejygKBILxVPuhBaNf49K7UiqDBZwV3x5M1gDU5rE+0X/kiFC0cmFjv6oa0v1JplQQ5OZpAue5Mubvx6nDBdiVuwXGvSnsmNHwLY172Md5IqvkXx7HASgkJ0Rn/tfErsgOtX2xNErQkdtr1mx7fyqXbKlOEMRh06sHV4FPYLyY6x53H6Es5qs7CWW5Z7y4B7T4EcZcBjngeLuMH8BMRy8DhO877tbhRDELBMWsgfb41drX2BrsAem12vPcaFVSUYCUHzdxsaJidoFnWO329P1AZRI/XyQf+dqngfUHIVH0kMpwHzG8azRbSDg04XKTWGm/YJIcc2LR/fFLZD6LLXy9OiMHWEIfwebb1m0i8MD3L9YlVY62JVfXgyGFKA2vEfwSg61Bc7k2qDDJ17IaABYGjoLdQVt4EeKAB7tVa63mKBvZf7dHueO2DKH2g1QgSI/5zjnL42DxnKrQuAWc50wcAnpTTGTsNgC97vKBQgaYP6cOdEOBScUk6NaNAwV2YDFDGVeNaOFDDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6512007)(316002)(66476007)(66556008)(66946007)(91956017)(64756008)(4326008)(8676002)(76116006)(53546011)(6486002)(2616005)(5660300002)(6506007)(66446008)(186003)(71200400001)(26005)(82960400001)(38100700002)(31696002)(86362001)(8936002)(36756003)(6916009)(122000001)(2906002)(83380400001)(38070700005)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFNNUlBpZklFYWI0eS9JY3lKQ3B4aVZ2Qy9TamNQRytJL2dUWk9iZ3ZPWWdP?=
 =?utf-8?B?c1M3dFI0MUhHQm1LT2tSTWMreWhEdWIyUjVhTmhQdEVLZnhlOU5CblRJdkpa?=
 =?utf-8?B?RzNRS0F2SUhWT0RuMWwzTmlCbjVPc2VlamVTazNQZWc4cXRuVjllNTNNdlJj?=
 =?utf-8?B?MFVGbC9DUTZyNWVnL1I1KzBidVlWdUQxQ0Z0bnJCcG45Ym9jSFhOenZJbTF5?=
 =?utf-8?B?bkZtbWJQUDRJQ1B0SDlaY3ZsVE9DaVJ2bDNURFVvcHZSNEloek9iemphWVgw?=
 =?utf-8?B?UkRIZm81N25pNHZkeW5rQ1loeHVDNHEzTE9MaUV0ZVdsSStNNDFmUGFiUmRN?=
 =?utf-8?B?WXN3M0tOQUdOUmtBNkkwbGkwT3M0NE5IWWhoeFNBNitwQU5TUVBpb1duZER4?=
 =?utf-8?B?MGYrN0JoMWIwNUFNSmpXY0UzMTNqc25URmpDZnJuKzhia3dWMGp1S25QYndz?=
 =?utf-8?B?ZkRoTGpWR08yUkdLaDhpVmswcnR4cGx3ZjlRUXF6OWJsU3pnL1NwVnNiMGk4?=
 =?utf-8?B?L0Jya3NOeDNOdWZoRXJSdFdlSTNmakFieXp4QS9ZUG12a3FRWHdaaGRYNENZ?=
 =?utf-8?B?ZFZDQ0Fkb2NpZEFxSUZRbDRVczR3a0pHb0JXQ2xhVVdlejhudzlxbEthODBK?=
 =?utf-8?B?eDJWQ1p2eGlwcjhJeEx0MUdLQkduMVdZMUljVjhYTWc4THlUdG5JQlRvNGV2?=
 =?utf-8?B?ZExRQ3oxWUNIZlhHYVk0VGtYaEl6TDdyUVhnSFlCa2FlOXBhYlJRSC82emU2?=
 =?utf-8?B?ckR3eVl5eXo5OTg0aFI4MVBmMVB5M1hyYUhQVjlvdzRXay9Xd1N5T29yTnZW?=
 =?utf-8?B?YlBtS0R5TFZYRElqdGVMc1EzelRqQW5KYm1hUHpNTFM2Vi9FZUZab25RNnBz?=
 =?utf-8?B?SUx3MHc5Vm1ZWmhzUlcyT0ZNSzhLMnI5U0htdW5pcDRYb3BWNWcyZ2p3Q0FB?=
 =?utf-8?B?MHZ0SDdvM1NUcGpJZFJDMEVQMzRIYWVsVVlpUXN6anBZK2V2eWZRaHlrZWMy?=
 =?utf-8?B?eDNwWVpSbjcrc0YzYmNsUEVNQW1lTXIxM1hoM2xuSkZ6dTE4L3dMQlIyTWFm?=
 =?utf-8?B?ZzJLTXlaQlpNUWFmK0pENHRtMU5hVUMrTUQ2bDRubHgyNThvbENXZ0Q5aVJN?=
 =?utf-8?B?aUtsR3g3a05NWFNWbEdPR09OVTF2VGM1UUZUZ0pzcU11Sy9OSzBYbVJvLzEw?=
 =?utf-8?B?TXU4UzZ0RHlyeFNMWTR6MXA1eGl5azRLQmdKRDVDV0dxeDJPNFVpUlRDb0RQ?=
 =?utf-8?B?Z0p3d0ZWK0c4TmNPZnJTSTBFcnFMZmVMcXFlTDJ0YW9Qd3VkazlpZHF1K3Az?=
 =?utf-8?B?L3FqVnlOUmZ2OEk4SHBVNkpwZnRZQ2FBK3RFZm5LcFVUeTBNR2FVdGhQeFhn?=
 =?utf-8?B?VlYvZTNaeHd6ZXJVZnhCMEp5SzRibUVWMU9TdUtJVmRNc0RqL0RCVTg3S05p?=
 =?utf-8?B?MGNYbTc5eU9EZjlJTHQ2Vm9iTHpEMnFBU0ovSXUydmp2SFhnRG1CelFiSXhS?=
 =?utf-8?B?cWpIVXdyVTgyV1lyak4wc3dnZTJUWWhVR2xLYmZXNkFnSis3alBhZEc1NHZp?=
 =?utf-8?B?a0tkVjg1L0FTM0swbnBUUWZsVUxzbHBtS1dLL25Xa01LRmtHY0ZMczJQK3pW?=
 =?utf-8?B?ZkU5eXpZVnI0NkpyU0dVSXV0V3grWW8zbGtMYmNwOHRGaEN3UlVMSmtHcDhE?=
 =?utf-8?B?MXZtaUduK0xPeTRXaTZLZ1lWTy9TTjF4VTlKVlRwd3RlMmZHdzE4c1orVHU0?=
 =?utf-8?B?Y0NQbytTMk5PU1NuWXFZT0NwNURhdHV3UHpSVnlQZzdQcm9XbjY5YzNJK3By?=
 =?utf-8?B?SVdSOEZZdS9TS2FkWGpadDV5VW9CdmV3cytnQXpPQkVZUmJKRktoZ05QU2tv?=
 =?utf-8?B?YnkzKzcrKy8zeURVajY5OUVuaVpVRll0aEJNSWF3OUhtaDc4NHpRWEpOUHVM?=
 =?utf-8?B?anY2WHJlZUhXUURQejdZM3lQVlNBeVM4azBMd2lKS09CU0JMeVh2SlY3RnZp?=
 =?utf-8?B?K0ZsbExDN1Y5d2x6NzNudmZ0TFI0RFdHeHZvSzc1SUw3SWFpOGhRek1URmZm?=
 =?utf-8?B?dmlJTW1GdXk1Sjduc0JNaVhORC9BcWYxNDlVN2FQWjdxNUx0cTc1OU10TjB4?=
 =?utf-8?B?QW43OXZDcG44d004TU1PcTN3VkVhaXFPN0JFeDVSajdKbHZUdFVzU3ErbVpm?=
 =?utf-8?B?cjE1eWZDMzd5YzJ1YTFLSnRCTFVSVHpiT0Irb3BCL3BnbmRqMm9rSGFXSDR3?=
 =?utf-8?B?cDlOaFZMall4Q0JJNllUbVRHMDdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A503DC3D223D74468CB4C0F80E571DE9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06911ca3-011c-48d2-baca-08d9f5f73aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 11:34:03.8733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPwq5KfuJu3rcVcJ7/pTFAnRaKkZS5ywAjDkF70epzYJKckQoMkb7E4sBE7Dt8fupO6F7yHGS4JPWMFxdvavcTPYLTXoCYqhNj3Jth+q+aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3889
X-OriginatorOrg: citrix.com

T24gMjIvMDIvMjAyMiAxMTowMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjIvMDIvMjAy
MiAxMDo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDIyLzAyLzIwMjIgMDk6MjksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIxLjAyLjIwMjIgMTk6MDMsIEFuZHJldyBDb29wZXIg
d3JvdGU6DQo+Pj4+IE1vc3QgSU9NTVUgaG9va3MgYXJlIGFscmVhZHkgYWx0Y2FsbCBmb3IgcGVy
Zm9ybWFuY2UgcmVhc29ucy4gIENvbnZlcnQgdGhlDQo+Pj4+IHJlc3Qgb2YgdGhlbSBzbyB3ZSBj
YW4gaGFyZGVuIGFsbCB0aGUgaG9va3MgaW4gQ29udHJvbCBGbG93IEludGVncml0eQ0KPj4+PiBj
b25maWd1cmF0aW9ucy4gIFRoaXMgbmVjZXNzaXRhdGVzIHRoZSB1c2Ugb2YgaW9tbXVfe3YsfWNh
bGwoKSBpbiBkZWJ1ZyBidWlsZHMNCj4+Pj4gdG9vLg0KPj4+Pg0KPj4+PiBNb3ZlIHRoZSByb290
IGlvbW11X29wcyBmcm9tIF9fcmVhZF9tb3N0bHkgdG8gX19yb19hZnRlcl9pbml0IG5vdyB0aGF0
IHRoZQ0KPj4+PiBsYXR0ZXIgZXhpc3RzLiAgVGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBmb3J3YXJk
IGRlY2xhcmF0aW9uIG9mIHZ0ZF9vcHMgYW55DQo+Pj4+IG1vcmUsIG1lYW5pbmcgdGhhdCBfX2lu
aXRjb25zdF9jZl9jbG9iYmVyIGNhbiBiZSB1c2VkIGZvciBWVEQgYW5kIEFNRC4NCj4+PiBUaGUg
Y29ubmVjdGlvbiBiZXR3ZWVuIHRoZSBmb3J3YXJkIGRlY2xhcmF0aW9uIGFuZCB0aGUgYW5ub3Rh
dGlvbiBhZGRpdGlvbg0KPj4+IGlzbid0IHJlYWxseSBjbGVhciB0byBtZS4NCj4+Pg0KPj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaW9tbXUuaA0KPj4+PiArKysgYi94ZW4vYXJj
aC94ODYvaW5jbHVkZS9hc20vaW9tbXUuaA0KPj4+PiBAQCAtNzIsNyArNzIsNiBAQCBzdHJ1Y3Qg
YXJjaF9pb21tdQ0KPj4+PiAgDQo+Pj4+ICBleHRlcm4gc3RydWN0IGlvbW11X29wcyBpb21tdV9v
cHM7DQo+Pj4+ICANCj4+Pj4gLSNpZmRlZiBOREVCVUcNCj4+Pj4gICMgaW5jbHVkZSA8YXNtL2Fs
dGVybmF0aXZlLmg+DQo+Pj4+ICAjIGRlZmluZSBpb21tdV9jYWxsKG9wcywgZm4sIGFyZ3MuLi4p
ICh7ICAgICAgXA0KPj4+PiAgICAgICh2b2lkKShvcHMpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwNCj4+Pj4gQEAgLTgzLDcgKzgyLDYgQEAgZXh0ZXJuIHN0cnVjdCBpb21tdV9vcHMg
aW9tbXVfb3BzOw0KPj4+PiAgICAgICh2b2lkKShvcHMpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwNCj4+Pj4gICAgICBhbHRlcm5hdGl2ZV92Y2FsbChpb21tdV9vcHMuZm4sICMjIGFy
Z3MpOyBcDQo+Pj4+ICB9KQ0KPj4+PiAtI2VuZGlmDQo+Pj4+ICANCj4+Pj4gIHN0YXRpYyBpbmxp
bmUgY29uc3Qgc3RydWN0IGlvbW11X29wcyAqaW9tbXVfZ2V0X29wcyh2b2lkKQ0KPj4+PiAgew0K
Pj4+PiBAQCAtMTA2LDcgKzEwNCw3IEBAIGludCBpb21tdV9zZXR1cF9ocGV0X21zaShzdHJ1Y3Qg
bXNpX2Rlc2MgKik7DQo+Pj4+ICBzdGF0aWMgaW5saW5lIGludCBpb21tdV9hZGp1c3RfaXJxX2Fm
ZmluaXRpZXModm9pZCkNCj4+Pj4gIHsNCj4+Pj4gICAgICByZXR1cm4gaW9tbXVfb3BzLmFkanVz
dF9pcnFfYWZmaW5pdGllcw0KPj4+PiAtICAgICAgICAgICA/IGlvbW11X29wcy5hZGp1c3RfaXJx
X2FmZmluaXRpZXMoKQ0KPj4+PiArICAgICAgICAgICA/IGlvbW11X2NhbGwoaW9tbXVfb3BzLCBh
ZGp1c3RfaXJxX2FmZmluaXRpZXMpDQo+Pj4gV2hpbGUgdGhpcyAoYW5kIG90aGVyIGluc3RhbmNl
cyBiZWxvdykgaXMgeDg2LW9ubHkgY29kZSwgd2hlcmUgLSB3aXRoDQo+Pj4gdGhlIHJlbW92YWwg
b2YgdGhlICNpZmRlZiBhYm92ZSAtIHdlIG5vdyBrbm93IHRoZSBmaXJzdCBhcmd1bWVudCBpcw0K
Pj4+IGFsd2F5cyBpZ25vcmVkLCBJIHRoaW5rIGl0IHdvdWxkIHN0aWxsIGJldHRlciBiZSBvZiB0
aGUgY29ycmVjdCB0eXBlDQo+Pj4gKCZpb21tdV9vcHMpLiBQZXJoYXBzIHRoZSAiKHZvaWQpKG9w
cykiIGluIHRoZSBtYWNybyBkZWZpbml0aW9ucyB3b3VsZA0KPj4+IGJldHRlciBiZWNvbWUgIkFT
U0VSVCgob3BzKSA9PSAmaW9tbXVfb3BzKSIsIHdoaWNoIHdvdWxkIGNoZWNrIGJvdGgNCj4+PiB0
eXBlIChjb21waWxlIHRpbWUpIGFuZCB2YWx1ZSAocnVudGltZSkuDQo+PiBJJ20gaGFwcHkgdG8g
Zm9sZCB0aGF0IGNoYW5nZSBpZiB5b3Ugd2FudC7CoCBJdCBvdWdodCB0byBvcHRpbWlzZSBvdXQN
Cj4+IGNvbXBsZXRlbHkgZm9yIGJlaW5nDQo+IEJhaCAtIHNlbnQgdG9vIGVhcmx5LsKgICJmb3Ig
YmVpbmcgdGF1dG9sb2dpY2FsLiINCg0KU2FkbHksIGl0IHR1cm5zIG91dCBpdCdzIG5vdC4NCg0K
JCAuLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgLWMgeGVuLXN5bXMtYmVmb3JlIHhlbi1zeW1zLWFm
dGVyDQphZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDEzLzAgdXAvZG93bjogMzY5LzAgKDM2
OSkNCkZ1bmN0aW9uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9sZMKgwqDCoMKgIG5ld8KgwqAgZGVsdGENCnBj
aV9hZGRfZGV2aWNlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAxMzUywqDCoMKgIDE0MTbCoMKgwqDCoCArNjQNCnBjaV9yZW1vdmVfZGV2
aWNlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDcxNsKgwqDCoMKgIDc2McKgwqDCoMKgICs0NQ0KaW9tbXVfbWFwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAzNDHC
oMKgwqDCoCAzODLCoMKgwqDCoCArNDENCmlvbW11X2RvX3BjaV9kb21jdGzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTY2NsKgwqDCoCAxNzA0wqDCoMKg
wqAgKzM4DQppb21tdV91bm1hcMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyNzbCoMKgwqDCoCAzMTDCoMKgwqDCoCArMzQN
CmRlYXNzaWduX2RldmljZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMzUzwqDCoMKgwqAgMzg2wqDCoMKgwqAgKzMzDQppb21tdV9mcmVl
X3BndGFibGVzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMzEwwqDCoMKgwqAgMzI5wqDCoMKgwqAgKzE5DQppb21tdV9pb3RsYl9mbHVzaF9hbGzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDE4McKgwqDCoMKgIDE5
OcKgwqDCoMKgICsxOA0KaW9tbXVfaW90bGJfZmx1c2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjYwwqDCoMKgwqAgMjc4wqDCoMKgwqAgKzE4
DQppb21tdV9od2RvbV9pbml0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA2OMKgwqDCoMKgwqAgODbCoMKgwqDCoCArMTgNCmlvbW11X2Rv
bWFpbl9kZXN0cm95wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgNTTCoMKgwqDCoMKgIDcwwqDCoMKgwqAgKzE2DQppb21tdV9sb29rdXBfcGFnZcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDUzwqDC
oMKgwqDCoCA2N8KgwqDCoMKgICsxNA0KaW9tbXVfZHVtcF9wYWdlX3RhYmxlc8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDI2McKgwqDCoMKgIDI3MsKgwqDCoMKg
ICsxMQ0KVG90YWw6IEJlZm9yZT0yMTk0NzU2LCBBZnRlcj0yMTk1MTI1LCBjaGcgKzAuMDIlDQph
ZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvMCB1cC9kb3duOiAwLzAgKDApDQpEYXRhwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgb2xkwqDCoMKgwqAgbmV3wqDCoCBkZWx0YQ0KVG90YWw6IEJl
Zm9yZT0xNjk5Mzg0LCBBZnRlcj0xNjk5Mzg0LCBjaGcgKzAuMDAlDQphZGQvcmVtb3ZlOiAwLzAg
Z3Jvdy9zaHJpbms6IDAvMCB1cC9kb3duOiAwLzAgKDApDQpSTyBEYXRhwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgb2xkwqDCoMKgwqAgbmV3wqDCoCBkZWx0YQ0KVG90YWw6IEJlZm9yZT0wLCBBZnRlcj0wLCBj
aGcgKzAuMDAlDQoNCmlzIHRoZSBkZWx0YSBpbiBkZWJ1ZyBidWlsZHMsIHdoaWxlDQoNCiQgLi4v
c2NyaXB0cy9ibG9hdC1vLW1ldGVyIC1jIHhlbi1zeW1zLWJlZm9yZSB4ZW4tc3ltcy1hZnRlcg0K
YWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzMgdXAvZG93bjogMC8tNTcgKC01NykNCkZ1
bmN0aW9uwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9sZMKgwqDCoMKgIG5ld8KgwqAgZGVsdGENCmlvbW11X3Jl
c3VtZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAzNMKgwqDCoMKgwqAgMTbCoMKgwqDCoCAtMTgNCmlvbW11X3N1c3BlbmTC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDQywqDCoMKgwqDCoCAyM8KgwqDCoMKgIC0xOQ0KaW9tbXVfY3Jhc2hfc2h1dGRvd27C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA2NsKgwqDC
oMKgwqAgNDbCoMKgwqDCoCAtMjANClRvdGFsOiBCZWZvcmU9MjExMjI2MSwgQWZ0ZXI9MjExMjIw
NCwgY2hnIC0wLjAwJQ0KYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzAgdXAvZG93bjog
MC8wICgwKQ0KRGF0YcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9sZMKgwqDCoMKgIG5ld8KgwqAg
ZGVsdGENClRvdGFsOiBCZWZvcmU9MTcwOTQyNCwgQWZ0ZXI9MTcwOTQyNCwgY2hnICswLjAwJQ0K
YWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzAgdXAvZG93bjogMC8wICgwKQ0KUk8gRGF0
YcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG9sZMKgwqDCoMKgIG5ld8KgwqAgZGVsdGENClRvdGFsOiBCZWZv
cmU9MCwgQWZ0ZXI9MCwgY2hnICswLjAwJQ0KDQppcyB0aGUgZGVsdGEgaW4gcmVsZWFzZSBidWls
ZHMuwqAgVGhpcyBpcyBhIGxpdHRsZSB3ZWlyZCAtIGl0J3MgYmVjYXVzZQ0KdGhlIEFTU0VSVCgp
LCBpbiByZWxlYXNlIGJ1aWxkcywgc2hvcnQgY2lyY3VpdHMgdGhlIGV2YWx1YXRpb24gb2YgaXRz
DQpjb25kaXRpb24sIG1lYW5pbmcgdGhhdCB0aGUgQlVHX09OKCkgaW5zaWRlIGlvbW11X2dldF9v
cHMoKSBkb2Vzbid0IGdldA0KZW1pdHRlZC4NCg0KSXJyaXRhdGluZ2x5LCB0aGVyZSdzIG5vIHdh
eSBJIGNhbiBzcG90IHRvIGRvIHRoaXMgY2hlY2sgd2l0aCBhDQpCVUlMRF9CVUdfT04oKSwgd2hp
Y2ggd291bGQgcmVkdWNlIHRoZSBpbXBhY3Qgb24gdGhlIGRlYnVnIGJ1aWxkcyB0b28uDQoNCn5B
bmRyZXcNCg==


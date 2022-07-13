Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60E572A28
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 02:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366122.596765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBPom-0000Nb-9E; Wed, 13 Jul 2022 00:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366122.596765; Wed, 13 Jul 2022 00:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBPom-0000KU-5o; Wed, 13 Jul 2022 00:01:28 +0000
Received: by outflank-mailman (input) for mailman id 366122;
 Wed, 13 Jul 2022 00:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AHIX=XS=citrix.com=prvs=186aa51bc=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oBPok-0000Jj-Mo
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 00:01:27 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eccd233b-023e-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 02:01:23 +0200 (CEST)
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 20:01:17 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM6PR03MB4988.namprd03.prod.outlook.com (2603:10b6:5:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 00:01:14 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b4c7:a1fc:f10d:8b9d%3]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 00:01:14 +0000
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
X-Inumbo-ID: eccd233b-023e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657670483;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=VWV9f7tdlhMaiR06iI4EqaoHuqpClHZLxVZBWEgf6AI=;
  b=K07YEs24XwRzccxyFrt5Yuot2yh4A2NWmEO+RjqcOHpMuaNMbIzl4uM/
   TRUYKoFjN5tSmiJO6feUkey/X58VYdfk5RV0pyexiU/QG+V9hUfz3dPtD
   9+nXiY2l/mPNvBmvR8QVSry7Fy5wSzGtoiH2oi3xWgrBVBTgBP4sE33PD
   I=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 75648911
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:R1/e9qsud2tqsI9oEh7mTqDxRefnVFpeMUV32f8akzHdYApBs4E2e
 1ou7Vv2eabdPDOxPpsjdtz1pnqyiubUmoQ1SQJtrSg9RSpDopDMVN7IcBiobn6cJMfPEUw+s
 p9GZoCecJllRHWF/RnwaOTr/XQlifyFG+qkWb6ZYit9LeMIpF/NrDo68wJuqtI40bBVej+wh
 O4eg/EzGXephmEpajtJ5v/co04/7fmo52hF5A03OKwXtgaOxylIUcNDKfm9IUWjT9gPFIZWZ
 QpiIJJVXI/9101wYj9wuu+jKiXmepaLYU7WzCA+t5GK2nCunARrukoAHKdaOB0/ZwmhxYgrk
 o0S7MboE2/FA4WX8Agje0gAe81BFfUuFI/veRBTZuTKkiUq21O1qxlfJBle0b8wo46bMkkXn
 RAsExgfbwjrug6D6OnTpt+AJCgUBJKD0Is34hmMxNxCZBosacirr67ivbe00Nqs7yzn8Dm3i
 8cxMFJSgBr8jxJnJ3FPGNVuuNmRliOkYSBAlH28tbI+yj2GpOBx+OCF3Nv9XPWvHZ8QtGDB4
 2XM8iL+Hw0QM8GZxXyd6HWwi+TTnCT9HoUPCLm/8f0si1qWroARIEROCR3n/r/k0wjiBLqzK
 GRNksYqhYc/81akQ5/RQhu8qWastR8AQdtAVeY97Wlhz4KLvljFVjldF1atbvQ368w6Hy4z7
 WW2vOuqLjJr65nOaECCo+L8QTSafHJ9wXU5TSgAQAge/8j4oKk8ixvOSpBoF6vdpt/6Azbr2
 BiRsTMzwb4UiKYjx6i9uFzKnT+ojpzIVRIuoBXaWHq/6QF0b5LjYJangXDc6ftDN4+fQkO2o
 Gkfm8Oe4eYNCrmAjCWIBu4KGdmB+PKtIDDax1l1EPEJ7TO28WSkeoNWyD57LUZtdM0DfFfBe
 1TPsAlc4JtSOnqCbqJtZY+1TcMwwsDIF8nhV/3SRspDZN52bgDv1B9pYUmczmX8in8GmKs0O
 YqYWcu0BHNcAqNipBK8Sv0By7YtymY7zHnKWJHg5x291PyVY3v9dFseGF6Hb+R85qXdpgzQq
 4lbL5HSl0oZV/DiaC7K94JVNUoNMXUwGZHxrYpQa/KHJQ1lXmomDpc93I8cRmCspIwN/s+gw
 513chUwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:VQq3p6vueFtbbGl+SQD5ngoG7skCwIMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKdkrNhR4tKPTOW8ldASbsP0WKM+UyGJ8STzI9gPO
 JbAtBD4b7LfBVHZKTBkW+F+r8bqbHpnpxAx92utkuFJjsaCZ2Imj0JbjpzZXcGITWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/HyVwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5V+7Y23+4kowwfX+0WVjbdaKv+/VfcO0aSSAWMR4Z
 nxStEbToBOAj3qDyaISFDWqnTdOX4VmgPfIBmj8DfeSIXCNUwHItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3GlpH1v4EDrDvKnZMOq59ls5Vka/ppVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV5Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0LtOUsgVZ6RgA/ppe7r+NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woPqnfZQZpaFC7K
 gpkGkowFLaV3ieefFmhqc7gywlaF/NLgjF24VZ+4VzvKH6Sf7iLTCDIWpe4fednw==
X-IronPort-AV: E=Sophos;i="5.92,266,1650945600"; 
   d="asc'?scan'208,217";a="75648911"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OktGPvDC/s1/ayT7yqrb/pFTn9MC2Qlx1NgzI2QT1rauAab9NUuBA/uTDqsxYLds4Sn2MRpEiOz0dzxCxhulSUPbu32qcpOBHspK/mnx8opP7pk5ubcLZkuD66Rqd+Qy6zO0WQo/Ac8UnWKZetTTBuvZ76X+dTMrzI5dtJg6Rr/Ev12Yb+MEIbPQiwXZx8O1+1zTsh0n0PjlIV2H7ldAxSjSP8nlbTPEIW/pdXV9awAODByc+0PIloVzat9/1o+zIHc7BqL09u1iYgJTasWyL+8A6teEDqhc4cUC5U8wTVgag8fI8hrTdQtS/GhuKDv2KvPZAID/6/f2okHqXZ8Bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w9DfuIotNNjTdgeTIyTRaLbgdwlv2YuodbvsWR+3E8=;
 b=a3UxRN8E1kWfMJ+Y36Gu0ObCFV4LHeBxXm74XOChVh8FMBcj69fhX8hdhlTcciDgVDbTQBC1rCNlT1bj4yadXGnssbHY4yzFC5mWLOJyRb5yLWjnIezeNFuSEdYoU21wPM+eInPRckKA4649Xbg5f8AVDlZsmzJG/lHx6+HQDqRA+6g4tTEMLYa3W7nIsUbYma88dhCNBvhYfnmLUTm14kTSU2GhcPteHBa46sc9eCk3Bglfu4ClszTy4o5GeNWgSdrTur6xXagR8XLAz4NtjYAV4thg/SFy9JI5SC73cUrFH9sw+TXrvTipCvsaXgZKHi3JOVtg7ClWKdkOiPmFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9w9DfuIotNNjTdgeTIyTRaLbgdwlv2YuodbvsWR+3E8=;
 b=f7nuSpHqh41RVhLqDvcchLC4bJwZlNm9rISVJcdOG8n6TxsWgXs24MgQ0o9yZSaorkosgciv/8He2g28bRmqghU4J7eNS493mQvTB39M139J7c5QnDpKuzIVFdP+W0lOTlF9azL1Yteammg51L+cDEgciM6albn7/WV053TsIBE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
CC: Anthony Perard <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, Nick
 Rosbrook <rosbrookn@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Topic: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Index:
 AQHYf1BHHIj+DWvN90eGeepJ4klT4a1QiHQAgAAkCwCAAwIpgIAAEjOAgAALK4CACsnDgIABrEYAgAe2TICAE6BDgA==
Date: Wed, 13 Jul 2022 00:01:14 +0000
Message-ID: <CDED6C13-E0BA-4F4F-A739-82611CF5D886@citrix.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
 <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
 <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
In-Reply-To: <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2dc68ab-7c61-4a0f-ddf0-08da6462cd8b
x-ms-traffictypediagnostic: DM6PR03MB4988:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yW4Jgw0CFJkuoYOQjuFvApT7HQlwpXA+8EPon5drA64rynu1PSMcbuyTqNxeClOj8rut4Gpn2csAleN9G3vzG4vNtgyRGBiFmS1KZWhskiDId9dQpOm9Wnv99Wrh5dP1LmjuWvjCjWeNwZOMZpGjiCWQHwyEzu6EBdpSRQjuirClf5xqKhtYBHpaWpgXMt54kVPaWXlPN0xoTxCleICMeV2rzw5ROt6FA0FP5nAt2dJXzChrNN5N3MBqoFUR43GYvE7mQScM0RSlPEfcR9R5M6kuK4IIq35wm8QjPWVM57od7x2qlOtWYo73nTOmSeFgVvYTnAKgKgWDZKJG4H73aWhSuiZvkbX7H4ctcftPYJla9Tg/oTyrTiNnvy8cOOE8jTWpyvxfI8u+D/56QLwsDJgSuB+rA1QG9uSOB9BWiW/UnL+bd6Eqw3N/+uQKtfd77TZglf9BxWFbGkxKYs7oWMkp3vWr/Ho4+byvoci/htqYHxL/hnGztibpHw9UCRpfswLXR4FrjBEg+QrpMedXRaL0vrxg84HkJhZx8YSxwDUixUc3LH+U+8AOs0XIAZ25MnWVVQeZyMzbCHbqitVi+x43XpgZl5wxin6Ulg+y0mzq9pgCWBDKvquT7fupb/Azs6xSy0vUi1NQ8EW21TVoLP9ryGzOY/YMdoiz4QjQSFei8hDe+imk2H67iw31UMhfnhIFZTpMqqKu3FlRigTr0xZw/xbkjRx+j7aRIzlzeBjbPYi7bOJI0pPpdKvn0pacBgN6FIgS5Ik86zbKKjTHSnLievFGCukOEa/n/UDmD3QxrrHgRC5ugFhC6dOGihihhVdfBYsrPVbWLaYX6vfu0Gs/wp2u1IQlOQSG9lrDlTo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(6512007)(83380400001)(38100700002)(33656002)(2616005)(186003)(53546011)(2906002)(26005)(41300700001)(36756003)(478600001)(6506007)(316002)(5660300002)(54906003)(6916009)(122000001)(7416002)(8936002)(38070700005)(91956017)(6486002)(4326008)(66556008)(71200400001)(76116006)(86362001)(66946007)(82960400001)(66446008)(8676002)(99936003)(64756008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXpiM3E2L2JtdjJheWMxSG94cVcreUZ4RkxhVTJsL3RnZURJZHhQWnI2SlM2?=
 =?utf-8?B?dW15T1lhWkhzeGo5Z2hCQkJYaFFkRm1KU0hEcWd3VTRBY0thUGpXM29uMy9n?=
 =?utf-8?B?djNCT0g3azBURm54aFBsT0JnNndYQ2x1WTg2UnNweTk4QTBSOHVxQTVMKzVU?=
 =?utf-8?B?cVkwamRPYmc3SkVDQjF3RWVrUEVobjFEc3lFY0ZLMjRNZnFGV3JQZndORWx6?=
 =?utf-8?B?eVVCNzNCcWRxQ2Z3TVdXTHRkbnUwbUZ4RXV0a0s4K1h6TlF0MERoY1M3aXZn?=
 =?utf-8?B?T0VTSm5sbVN1ck12N0xTNlZ2eUE3eUR2empwWjMrOVFpOWhGV2lLWG00OVMr?=
 =?utf-8?B?c1FGamR5dzRBakllMGF1OE0xc0Jkb3ZHNDFHTHZnR0pGNjZPbFp4MXg4MVR5?=
 =?utf-8?B?Wk0vZ1pXNmFzdHpkbHB0aDcrbTQ2ZW9ENTdod2VJbVJETEk5NkU0TmVmUTli?=
 =?utf-8?B?SUhURHpEZnVWZXUwdkp5aDhOK2w5K3JjcjI0YzQ5RXoxSW94a21qZ1kzV3dL?=
 =?utf-8?B?UFFxTFJHT2Y4Mk5NU0hBNzlZcmhaSjNzK1JWTStBNWp6UFdXU2NQeUsrUWRG?=
 =?utf-8?B?L1NyckJZNSs3SnJTazZTZTFJd0RFblV5WGRrQ3VTbFN6emhEUVluQUhHUkdN?=
 =?utf-8?B?dTI4R1lldnpGdTZ2eXNUdnJtU2JRbDBOMUwrVithTGEzZjhXeTBaM3A0WkJE?=
 =?utf-8?B?TjJrSHdlVFlvL0l1N3A2MTBIZXYyYzlEc3RGMDdKRWxqbzgyNnVieDdQQStZ?=
 =?utf-8?B?d0FXeHpUdFFuRTVmZFNWOHpxN3BnOStPUHBDYmhKQVdiQTJjaHFvOVc2QXl3?=
 =?utf-8?B?WG1qaHpreGhwVEpwSUtQVFhjaGQrRmdrQUtYeWZGUlVRYXJ1Y3kwbWtsM0J2?=
 =?utf-8?B?YzUzQjE5YzRmUGV5WTY5d3pwQktMOVlzOGZvT2hna085UTZ6MmtJZENXTitD?=
 =?utf-8?B?a2orTGdtM2U0MWRGL1JOdnVSaitPK1l4R2JDdkxSZ0FydGVjdmtheDFKd3ZD?=
 =?utf-8?B?UjR1S1lsRmo4b0tTUmZ1eEYxYS9TNmJTa0ZxRTV4cnBWZWd0OVcreHpuVXJJ?=
 =?utf-8?B?ZWhrcWN4cUJkemphbm1xUFJyUVEzdEltb3hHdTBTelZKOVFMV0tQaVVhZUV4?=
 =?utf-8?B?SVV4OVFTQW5rdVFqUEIzYjlYMjlweGg2SmlKVW51NE56ZTZzV2RhK1R1by9I?=
 =?utf-8?B?UnRHenV3TzlWdERta09rZHJtenRhWVFFQUVod2plaURyWHQ5OWxwWGsrazVn?=
 =?utf-8?B?UGNDamY2c2svdkVaeDhkYit1WkFXbVM0dVpmN2g1OGtsVWMzQ051aTBPUUVC?=
 =?utf-8?B?NTV0WnJ3MG5FZmd4MytCQjUyS0FqUkhyZ2dweVViWGFrVWRwNklXcHVsN2Np?=
 =?utf-8?B?SEw2blJPSHV3aUpZMk1veW5USGxYMUJlK1FMUW1jcEJRd3Z2QjBSdkV4Nk1R?=
 =?utf-8?B?b0ROdWpJc2FYeTRVKzB1WkIwY2ZVRVVaMGlMT0ZSNzl6ejFBdHd2dGx1empT?=
 =?utf-8?B?QWo3NXpWaFZ3WEZwaHhXZkNMci9KL0RTMUZlMU1UVStpQTZWc1RrNmQ4cHN3?=
 =?utf-8?B?cmVFTE5td3hvUm5kZGNkZGVIdCtWSDNuRlh1ZUZWYXF5b2dTeFhDdGJrbU5D?=
 =?utf-8?B?cjZrazFRRWZ4NUlSbUtjVUVWNWxCa1ZTMCtFYjgrZ0NiYlYwbGlMVHlwYUFq?=
 =?utf-8?B?NklNR3Q1ZWRZYWZVKzNiWVYyN3hiM2ZUWXdCcjZHeldYOHZqSjVsUEZoUnV0?=
 =?utf-8?B?Q2JnL0o1RThGR2JJa1IrY1NxSDRJYVYxeVY2SVgxZkRnai9mYi9wT1hLNTlK?=
 =?utf-8?B?YWFuNHlrSUpBdkhPRlVsK3VVUXhNYzZjR1VVTU5mRmRTUit4cEZwMVVXWFdl?=
 =?utf-8?B?emEyWmEwTU9iS0VKdjZueVZ5N2tYbVN1eU45VlJPR0NJOFJlRmJlenV5dFhZ?=
 =?utf-8?B?SzFNVkJGSEFjQWZNdFNWUjBqY0ZUMWVWTXZzS2ZMeWNCa3lQdldQcjRNR3Fv?=
 =?utf-8?B?L0lYekpSZk5ZRVNXT01SVUhBQXVlMEdENXcxdUxLSlEzbWNtdVpGeUdjQkVu?=
 =?utf-8?B?RG5NcVREcERQNnZaN3RJNlBrdFZZY3QzeS9KZUF2aVk1K0F2SkRMS2VlMUlz?=
 =?utf-8?B?L1I5QkdLNlRrQjNmR3d3Z1FsNXFjc3BwMkt3MlE1MEMyMlpTTXladUd6c2NR?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BEBE3246-5124-4F53-BD3F-2AA083BAADE7";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dc68ab-7c61-4a0f-ddf0-08da6462cd8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 00:01:14.4258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmoELV9WQX5Cs6eMvia7dB0wDgo2jSMga0hCa6AE+F7bVrHIR+WSuDGXeLd/zWh6i2hDRveRkydXcNq47fUg0tJfC8mq0reX1Um5bfRcNbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4988

--Apple-Mail=_BEBE3246-5124-4F53-BD3F-2AA083BAADE7
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D93ABC06-56D5-4D59-B30A-D6D360D2C149"


--Apple-Mail=_D93ABC06-56D5-4D59-B30A-D6D360D2C149
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 30 Jun 2022, at 22:18, Oleksandr <olekstysh@gmail.com> wrote:
>=20
>=20
> Dear all.
>=20
>=20
> On 25.06.22 17:32, Oleksandr wrote:
>>=20
>> On 24.06.22 15:59, George Dunlap wrote:
>>=20
>> Hello George
>>=20
>>>=20
>>>> On 17 Jun 2022, at 17:14, Oleksandr Tyshchenko =
<olekstysh@gmail.com> wrote:
>>>>=20
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>=20
>>>> This patch adds basic support for configuring and assisting =
virtio-mmio
>>>> based virtio-disk backend (emulator) which is intended to run out =
of
>>>> Qemu and could be run in any domain.
>>>> Although the Virtio block device is quite different from =
traditional
>>>> Xen PV block device (vbd) from the toolstack's point of view:
>>>> - as the frontend is virtio-blk which is not a Xenbus driver, =
nothing
>>>> written to Xenstore are fetched by the frontend currently ("vdev"
>>>> is not passed to the frontend). But this might need to be revised
>>>> in future, so frontend data might be written to Xenstore in order =
to
>>>> support hotplugging virtio devices or passing the backend domain id
>>>> on arch where the device-tree is not available.
>>>> - the ring-ref/event-channel are not used for the =
backend<->frontend
>>>> communication, the proposed IPC for Virtio is IOREQ/DM
>>>> it is still a "block device" and ought to be integrated in existing
>>>> "disk" handling. So, re-use (and adapt) "disk" =
parsing/configuration
>>>> logic to deal with Virtio devices as well.
>>>>=20
>>>> For the immediate purpose and an ability to extend that support for
>>>> other use-cases in future (Qemu, virtio-pci, etc) perform the =
following
>>>> actions:
>>>> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>>>> that in the configuration
>>>> - Introduce new disk "specification" and "transport" fields to =
struct
>>>> libxl_device_disk. Both are written to the Xenstore. The transport
>>>> field is only used for the specification "virtio" and it assumes
>>>> only "mmio" value for now.
>>>> - Introduce new "specification" option with "xen" communication
>>>> protocol being default value.
>>>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>>> one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>>>>=20
>>>> An example of domain configuration for Virtio disk:
>>>> disk =3D [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=3Dother, =
specification=3Dvirtio']
>>>>=20
>>>> Nothing has changed for default Xen disk configuration.
>>>>=20
>>>> Please note, this patch is not enough for virtio-disk to work
>>>> on Xen (Arm), as for every Virtio device (including disk) we need
>>>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>>>> them to the backend, also update Guest device-tree. The subsequent
>>>> patch will add these missing bits. For the current patch,
>>>> the default "irq" and "base" are just written to the Xenstore.
>>>> This is not an ideal splitting, but this way we avoid breaking
>>>> the bisectability.
>>>>=20
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> OK, I am *really* sorry for coming in here at the last minute and =
quibbling about things.
>>=20
>>=20
>> no problem
>>=20
>>=20
>>> But this introduces a public interface which looks really wrong to =
me.  I=E2=80=99ve replied to the mail from December where Juergen =
proposed the =E2=80=9COther=E2=80=9D protocol.
>>>=20
>>> Hopefully this will be a simple matter of finding a better name than =
=E2=80=9Cother=E2=80=9D. (Or you guys convincing me that =E2=80=9Cother=E2=
=80=9D is really the best name for this value; or even Anthony asserting =
his right as a maintainer to overrule my objection if he thinks I=E2=80=99=
m out of line.)
>>=20
>>=20
>> I saw your reply to V6 and Juergen's answer. I share Juergen's =
opinion as well as I understand your concern. I think, this is exactly =
the situation when finding a perfect name (obvious, short, etc) for the =
backendtype (in our particular case) is really difficult.
>>=20
>> Personally I tend to leave "other", because there is no better =
alternative from my PoV. Also I might be completely wrong here, but I =
don't think we will have to extend the "backendtype" for supporting =
other possible virtio backend implementations in the foreseeable future:
>>=20
>> - when Qemu gains the required support we will choose qdisk: =
backendtype qdisk specification virtio
>> - for the possible virtio alternative of the blkback we will choose =
phy: backendtype phy specification virtio
>>=20
>> If there will be a need to keep various implementation, we will be =
able to describe that by using "transport" (mmio, pci, xenbus, argo, =
whatever).
>> Actually this is why we also introduced "specification" and =
"transport".
>>=20
>> IIRC, there were other (suggested?) names except "other" which are =
"external" and "daemon". If you think that one of them is better than =
"other", I will happy to use it.
>=20
>=20
> Could we please make a decision on this?
>=20
> If "other" is not unambiguous, then maybe we could choose "daemon" to =
describe arbitrary user-level backends, any thought?

Unfortunately I didn=E2=80=99t have time to dig into this; I=E2=80=99m =
just going to have to withdraw my objection, and let you & Juergen =
decide what to call it.

Re the golang changes:

Acked-by: George Dunlap <george.dunlap@citrix.com =
<mailto:george.dunlap@citrix.com>>


--Apple-Mail=_D93ABC06-56D5-4D59-B30A-D6D360D2C149
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 30 Jun 2022, at 22:18, Oleksandr &lt;<a =
href=3D"mailto:olekstysh@gmail.com" class=3D"">olekstysh@gmail.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta=
 charset=3D"UTF-8" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Dear all.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 25.06.22 17:32, Oleksandr wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">On 24.06.22 15:59, George Dunlap wrote:<br class=3D""><br =
class=3D"">Hello George<br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">On 17 Jun 2022, at 17:14, Oleksandr Tyshchenko &lt;<a =
href=3D"mailto:olekstysh@gmail.com" class=3D"">olekstysh@gmail.com</a>&gt;=
 wrote:<br class=3D""><br class=3D"">From: Oleksandr Tyshchenko &lt;<a =
href=3D"mailto:oleksandr_tyshchenko@epam.com" =
class=3D"">oleksandr_tyshchenko@epam.com</a>&gt;<br class=3D""><br =
class=3D"">This patch adds basic support for configuring and assisting =
virtio-mmio<br class=3D"">based virtio-disk backend (emulator) which is =
intended to run out of<br class=3D"">Qemu and could be run in any =
domain.<br class=3D"">Although the Virtio block device is quite =
different from traditional<br class=3D"">Xen PV block device (vbd) from =
the toolstack's point of view:<br class=3D"">- as the frontend is =
virtio-blk which is not a Xenbus driver, nothing<br class=3D"">written =
to Xenstore are fetched by the frontend currently ("vdev"<br class=3D"">is=
 not passed to the frontend). But this might need to be revised<br =
class=3D"">in future, so frontend data might be written to Xenstore in =
order to<br class=3D"">support hotplugging virtio devices or passing the =
backend domain id<br class=3D"">on arch where the device-tree is not =
available.<br class=3D"">- the ring-ref/event-channel are not used for =
the backend&lt;-&gt;frontend<br class=3D"">communication, the proposed =
IPC for Virtio is IOREQ/DM<br class=3D"">it is still a "block device" =
and ought to be integrated in existing<br class=3D"">"disk" handling. =
So, re-use (and adapt) "disk" parsing/configuration<br class=3D"">logic =
to deal with Virtio devices as well.<br class=3D""><br class=3D"">For =
the immediate purpose and an ability to extend that support for<br =
class=3D"">other use-cases in future (Qemu, virtio-pci, etc) perform the =
following<br class=3D"">actions:<br class=3D"">- Add new disk backend =
type (LIBXL_DISK_BACKEND_OTHER) and reflect<br class=3D"">that in the =
configuration<br class=3D"">- Introduce new disk "specification" and =
"transport" fields to struct<br class=3D"">libxl_device_disk. Both are =
written to the Xenstore. The transport<br class=3D"">field is only used =
for the specification "virtio" and it assumes<br class=3D"">only "mmio" =
value for now.<br class=3D"">- Introduce new "specification" option with =
"xen" communication<br class=3D"">protocol being default value.<br =
class=3D"">- Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as =
current<br class=3D"">one (LIBXL__DEVICE_KIND_VBD) doesn't fit into =
Virtio disk model<br class=3D""><br class=3D"">An example of domain =
configuration for Virtio disk:<br class=3D"">disk =3D [ =
'phy:/dev/mmcblk0p3, xvda1, backendtype=3Dother, =
specification=3Dvirtio']<br class=3D""><br class=3D"">Nothing has =
changed for default Xen disk configuration.<br class=3D""><br =
class=3D"">Please note, this patch is not enough for virtio-disk to =
work<br class=3D"">on Xen (Arm), as for every Virtio device (including =
disk) we need<br class=3D"">to allocate Virtio MMIO params (IRQ and =
memory region) and pass<br class=3D"">them to the backend, also update =
Guest device-tree. The subsequent<br class=3D"">patch will add these =
missing bits. For the current patch,<br class=3D"">the default "irq" and =
"base" are just written to the Xenstore.<br class=3D"">This is not an =
ideal splitting, but this way we avoid breaking<br class=3D"">the =
bisectability.<br class=3D""><br class=3D"">Signed-off-by: Oleksandr =
Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@epam.com" =
class=3D"">oleksandr_tyshchenko@epam.com</a>&gt;<br =
class=3D""></blockquote>OK, I am *really* sorry for coming in here at =
the last minute and quibbling about things.<br class=3D""></blockquote><br=
 class=3D""><br class=3D"">no problem<br class=3D""><br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">But this introduces a =
public interface which looks really wrong to me.&nbsp; I=E2=80=99ve =
replied to the mail from December where Juergen proposed the =E2=80=9COthe=
r=E2=80=9D protocol.<br class=3D""><br class=3D"">Hopefully this will be =
a simple matter of finding a better name than =E2=80=9Cother=E2=80=9D. =
(Or you guys convincing me that =E2=80=9Cother=E2=80=9D is really the =
best name for this value; or even Anthony asserting his right as a =
maintainer to overrule my objection if he thinks I=E2=80=99m out of =
line.)<br class=3D""></blockquote><br class=3D""><br class=3D"">I saw =
your reply to V6 and Juergen's answer. I share Juergen's opinion as well =
as I understand your concern. I think, this is exactly the situation =
when finding a perfect name (obvious, short, etc) for the backendtype =
(in our particular case) is really difficult.<br class=3D""><br =
class=3D"">Personally I tend to leave "other", because there is no =
better alternative from my PoV. Also I might be completely wrong here, =
but I don't think we will have to extend the "backendtype" for =
supporting other possible virtio backend implementations in the =
foreseeable future:<br class=3D""><br class=3D"">- when Qemu gains the =
required support we will choose qdisk: backendtype qdisk specification =
virtio<br class=3D"">- for the possible virtio alternative of the =
blkback we will choose phy: backendtype phy specification virtio<br =
class=3D""><br class=3D"">If there will be a need to keep various =
implementation, we will be able to describe that by using "transport" =
(mmio, pci, xenbus, argo, whatever).<br class=3D"">Actually this is why =
we also introduced "specification" and "transport".<br class=3D""><br =
class=3D"">IIRC, there were other (suggested?) names except "other" =
which are "external" and "daemon". If you think that one of them is =
better than "other", I will happy to use it.<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Could we please make a decision on this?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">If "other" is not unambiguous, then maybe we could choose =
"daemon" to describe arbitrary user-level backends, any =
thought?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Unfortunately I didn=E2=80=99t have time to dig =
into this; I=E2=80=99m just going to have to withdraw my objection, and =
let you &amp; Juergen decide what to call it.</div><div><br =
class=3D""></div><div>Re the golang changes:</div><div><br =
class=3D""></div><div>Acked-by: George Dunlap &lt;<a =
href=3D"mailto:george.dunlap@citrix.com" =
class=3D"">george.dunlap@citrix.com</a>&gt;</div></div><br =
class=3D""></body></html>=

--Apple-Mail=_D93ABC06-56D5-4D59-B30A-D6D360D2C149--

--Apple-Mail=_BEBE3246-5124-4F53-BD3F-2AA083BAADE7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmLOCzcACgkQshXHp8eE
G+01oQf+N+ypnqT0QZDWSI7lT0kF2pTSfcab7+xUj17XPsEKhXu4nOW+IYeNqYYo
M4v/oNQQXHI2nzBMSOxi4lD4DmLqzhUpKfKsGHRa8l55AYNdbmpzx/augUNb9v40
K4TXwnK1Fv65ZV2j41T56279jeOGeHugHeKYd7hQ36yIFstCDo1WXThvClbkxIek
HaEONut2wLk/n5qZYp2+Tw+ddPnzsPcRt7aprUl828WtMFGiFB7OmbnZLVve5A+s
RXj25SPkASJBfvqA9iXLaeE+K2CWcSTGP5ARvRBjd2W+vdWjharHfNE8Ds12v+WH
8ZvJH0DjquG/b+NcUTuwHUdh4T1qNQ==
=yOpa
-----END PGP SIGNATURE-----

--Apple-Mail=_BEBE3246-5124-4F53-BD3F-2AA083BAADE7--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3E49E8EA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 18:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261679.453282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8Wb-0000a9-VE; Thu, 27 Jan 2022 17:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261679.453282; Thu, 27 Jan 2022 17:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD8Wb-0000XZ-S4; Thu, 27 Jan 2022 17:25:33 +0000
Received: by outflank-mailman (input) for mailman id 261679;
 Thu, 27 Jan 2022 17:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nD8Wa-0000XT-94
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 17:25:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e12855d-7f96-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 18:25:29 +0100 (CET)
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
X-Inumbo-ID: 1e12855d-7f96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643304331;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GRlBy3Hcfv97HnRoqUHBr/B7nT/6blkzJcUtfOazMys=;
  b=fju2I4e9ipym/dYa09bEZeNYa1tEM9HUZMLdzgjbljqiNDdNXJZLnkSq
   okoeM6QCL/2WeMoLYN56gj4XWLXKubjFiEVcc+0C8U/1Vc1DzTXsfkLMH
   F1yPey5TVa4hHOsTOr9Tt5uxbQyygLbCDkpmFNeecPPwgiy0Xt5bpdF3W
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: B1qimpH4pyBd93MQKgm/MspG8Hlr+M7HQteMCpgVQgAauF66rvFtXcV5HFgrI7VDJe0WWNQPTn
 4Y6G28ZAgCT2VO69mAsbDehg03Sz9Se5/504DfYaqWTMbYu8zVp2n1gWlMSPkSc1FZ8n5YDHKX
 ctQ+vG8gsXr3sHNfc5WaojinWWE2FsiZ+iX/byo396YAFc5wlxx9CGchEfoCJeyVO1S40QWhQJ
 15qPfrF0VYR3iiQ5rJ4TmuOEamOUY1RsZ16toH4OIfsOa+Nrx/qgSoztiIxN83P7vcN611Iajo
 Xv1mj1RaEniWn21XTWnW6KGb
X-SBRS: 5.2
X-MesageID: 62385864
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5Fw4l6AYg2dDnBVW/8bkw5YqxClBgxIJ4kV8jS/XYbTApG90hjFSz
 DdKUD2FOf2Da2SgLYhzO4qx/ElUsMTdydNnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940007wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ghSrrvFdx
 Pt2noWBSSl3Do/sqeInekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGhmxg25AQQZ4yY
 eITbTExRRLtTCdAZFtKMZllkOCGnmDwJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHelnC89d9Z+KMYj2QGjlJr2wzefPEFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtvxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtoLuGogeR80Y67onAMFh
 meJ52u9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMSE6AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:N/WmHaMGSGEaXMBcT2X155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90DHpewKTyXcH2/hsAV7EZnimhILIFvAs0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUmF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfALqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPQf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcZcsvy5zXUISdOUmREXee
 r30lEd1gNImirsl1SO0F/QMs/boW4TAjHZuASlaDDY0LPErXoBerR8bMRiA0bkAgMbzaFBOO
 gg5RPpi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4akWUzxjIcLH47JlOw1GnnKp
 gbMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Sol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+73JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9CVlVnQ6dvP22y6IJyIEUdYCbRhFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62385864"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQlOzfKD+Czfo8wDB5wegPl5kWkqf2/9pQHNxZYA8ocDSlWViZpj89qT7ldIL+vTSCpk0sSrKTOtxc2aRO8ldnKnSlDmtY3qRpOpvtlouwwflDAfbNEFfpzQpHbPPI4BolJdmdNV8m+dVB7/sPmijgsbfGOAdGNu/bMHeKWqIrS7stq+nSwIOrry6XArAmcXtbgtlJ3tskKol5RWXlFqDHwwDEHrQ2lUxV0DWN768q+t1t0zLLurLLqm0q+YQXI4nFSIEsuWZVs3GWiiklV6zp0akFTQfXFPSO9p58s6yFGA6etpckt5jkAMVhCdZAPos3sWOYlJigWxTdHrrjS7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRlBy3Hcfv97HnRoqUHBr/B7nT/6blkzJcUtfOazMys=;
 b=YAJTkOyzWvUrXYymqzf9IyaLGjtKAm6k7GNOdgQDsc+Rq38VYLKr6uTVgMVFD8xhH4Q54pRF+F1xhaCn3+lxZLyku7VNKdPKnnwnGu1s5CLhTFTMh6FG8yE4Omhbq/nNFf5zj9i/aV9U/T0OYmg2fYzdmVHNq9eCmphmtMawWg1AMF0bR5gZuMGoMJFZLg2wNm9GNPm1dvuLBXy5sDC+9Tm5T17nIGKv0L3jEpOT4wcscOW6kMpasE/J9cnLHIojKYQ1v+sdodGgpyrZOgmDlm3cwHbQymXh59Gh6+qtbtdeOOI/AKYvCu5e5/N2Kpoh64X+elcCklWwgsgZebMSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRlBy3Hcfv97HnRoqUHBr/B7nT/6blkzJcUtfOazMys=;
 b=gSk9AFDpw0sSGXPZauQPsU1LMLSVtfeZO2c/UIuRSzAZvrN6aoNuiX6o5oGm3df3ku/roz7Z2+gv9YXuB2HDxut28LW7VLhsIOo963Cu/Ppkv++IB97qE1UZsfpPOn2p/a4OLC44GQuBq5d9D+ZBaP2A0Jz7cDfYln+HUlizqPI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 8/8] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Thread-Topic: [PATCH 8/8] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Thread-Index: AQHYEpESkkbYY5JPR0iMlxtcJtQdZax248qAgAA7a4A=
Date: Thu, 27 Jan 2022 17:20:25 +0000
Message-ID: <dcd5acf4-1f16-4314-4ff3-427b205e7b2f@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-9-andrew.cooper3@citrix.com>
 <4a9c11b0-1564-9014-2185-01318a98b334@suse.com>
In-Reply-To: <4a9c11b0-1564-9014-2185-01318a98b334@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2bac889-65bf-4915-a478-08d9e1b94ecf
x-ms-traffictypediagnostic: DM8PR03MB6231:EE_
x-microsoft-antispam-prvs: <DM8PR03MB6231490C677057844E655128BA219@DM8PR03MB6231.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 42U71UbcFuKUDRHGSL+KYIbZOGQU8b8dYhNmKPCI3b3Gtjf7oXPcHcvqhR3KL4uhLst7CzgulXkulLI/owKsD1MhCCEb1Axvqnp2WtJJpl48De1/mnPITPqNNxlybwaAgCo9tCH+RHeYKBzmYXgQyOSg1fQLAaLhSDIcT8W+mffIivHSScNhqT7GTyaOUpGJXngkf59iRmMaGjJwUZJpldDAv0CnsNeEok/Kkrp22yBwsbJ4A5zv1b9C2vmg/8QIAifLbq3ioMHDBJwpxoXW99BkCBM5Oj3lr5T7On17LMbNUX7/7THOZAg2pAy8xGTYRRT5DYK45bBkq+WyPvxodu5CZsjeMkRgSBMqfgPS9LkTSTKjIZsbFvI+O7Um0Htewf3BHoSr8N/uRI0Foqn1W+PiqXW42bEHIVc3iXzTMmWKvqxeQMdo3Eqg9l4Z7HmrQsRcgaog1TTjMOPcdPGhH5ri6wYZ4xp/9wiv1dX6b2+vONGB2mP9KoRQpdCmED7FlIbI1ulOy1NYiwyKxxLmbT6CuQQ+9xuxSkCM/jRNTlfcidHKLTzjIpB0bywNu6jqBNviLIxjKdU7GA++85nW2tr8yG5C0GoVTI09m/FowtSrSExnQfuWnrEspD1P330Vdk+cELvxCB93ECqYJf67rRA3V1LxVhFcbd6s1n2/kJ5XFoMqQBe+E3NIkwslzhUC93iEU2WxmlabPpROeMtELFqDqqYteZR35GmedsKVOTsDBRqeJbCqK1o89uiyLZeV1peT7ISVY3zOJBM2ZVrorQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(186003)(2616005)(26005)(66476007)(66556008)(122000001)(66946007)(38100700002)(86362001)(66446008)(53546011)(64756008)(6512007)(6506007)(83380400001)(71200400001)(76116006)(31686004)(2906002)(6916009)(82960400001)(8936002)(54906003)(5660300002)(8676002)(36756003)(508600001)(316002)(6486002)(4326008)(31696002)(38070700005)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNFd3gwcENtcUk5RzBVMzdTL0xhTHMzcFh4c3JkQVFzYitrc0xUQktvSDNl?=
 =?utf-8?B?dGVPdlhrK3ZOL3p5MStiZGlaeUJhSHNvSUp4REtKckZadVJuQ0tzNnkzaFVC?=
 =?utf-8?B?VXlEcjJYczVabENmSlExUnRRN1pwRjR5NkYxZDhMbGFQTldLMFdmZ1RnT0JC?=
 =?utf-8?B?QzJobVhEeTlPelNvVEpwZTg1cEtUcER1U0krR0QyQ1FYeFlvS0hQb01sNVNO?=
 =?utf-8?B?NGN6eWxYNmczVUtCK1FtM1hkK1NSa0YxNjFNQnBtbUp5a29yS3NyWVB6MFU4?=
 =?utf-8?B?ajJONTU1c0ljUnhpS096emhvZFZFbU9sY3Q2bjhER2dwV0ljY3hoSkplV0VD?=
 =?utf-8?B?MGFOVTQrMEtiWkdtbE96WmtBbXhYK1VQMUptT1JQU0RvRlJLMGVlVWNKdUtM?=
 =?utf-8?B?WG1MdUdYZXdqZDJPcnVBY2QxZ0RabUZnWlYvamdXTkdVbVhxQ0hIOEhOQXhP?=
 =?utf-8?B?elZzZ1JNSU1NMWxQcG1NYlk2NDhHNDJNRDBiR2o5dXpwazlad1pHN3RJc2p2?=
 =?utf-8?B?R1ZqOURaNmw3TjFVeGt5Vm5nT0pJQXVtZUJRdXZ0dTBQbzdHRzNyOERkcDRB?=
 =?utf-8?B?c3cvME5HNWsxdUlKUTNoY2RkK0JwUWwwTlNiUk1IL0h2U0FSVlk0QzRrMlND?=
 =?utf-8?B?U3p2UVdUSU5icHFXZ3ZaY0ptSzN2VUEwbDN5bGxYOG1TcjIzd3NReks5dUt5?=
 =?utf-8?B?Q3V1bEZ2dnYvK2FLem4xWFlxcGZwT0w4M2Fac3lkR1U2dEZ1TjMveVpzd2R2?=
 =?utf-8?B?SzRKa0x4RHhNYXRPa2ZuNlMxNjAvd3hNMEkwdFhRUTdIa1VMaGp6NlVZSDN2?=
 =?utf-8?B?S2U3K2x2SUpmZ3FOeS9EUzBOTkhqY3o3cVlJdVFLaHdLOUdneDBwOGN2S3pG?=
 =?utf-8?B?SGxsemhjcnpDdjN2bFhrSzhGcy92eUUzWkwxQktHcWk5ZkpKZzhZM292WjFV?=
 =?utf-8?B?djNmVit4RnJjR0xWQU1LTlAzUGw3QnBjczdvMDVCTG9tZmdXWjZ3dTdUblA1?=
 =?utf-8?B?VGZMNFBqRy9MbFE2YWp0UmZzOGVNY3lWRGxRRXdoeDIxeXczRklNTGhONjdI?=
 =?utf-8?B?ODhxZXJYQWR5akI0by9aOHE4QzJXNGR1eTVnemhHSnZaeXYzN3NwVEdKc3Bj?=
 =?utf-8?B?bkxHWndyeUs0VC9URERSZ251STFpbk1XU0w4d0U3eGg2V1IvUnBSUmYzUGUr?=
 =?utf-8?B?N05MWFJ0dzZsajFjK3NHMTYzUktOaWR3czVOSVliNFJwYnY5Sk1MRDFVcSt5?=
 =?utf-8?B?U2VudGt0cCtsOGR5bWtoUEU4VzF2ZHcxYm9QaXQ5ZnJHa3NVekVCSzlqR010?=
 =?utf-8?B?T1NvNk5RYmovRE5vTXhQUE9lanJNaFFvSG9ZQlh6YjRkeG1SVGlXMnAzSEdn?=
 =?utf-8?B?cFNkVVllS3IzZzdwbWZUdEtCUGNCVGcrclZWY1ZHNnFvQ09PTi9tNDBuY0w0?=
 =?utf-8?B?RmEyUTNXMnBJZUpkQzQ1Y3NHNm1jQkhQRVFnZ05XdU1ORmp2azJ5b0sxTVQw?=
 =?utf-8?B?RUtSZXRaaWNtdU9SQTZHSnNNb0dVZ2FXa2h3UUl0TExycEN0ZVoxQTRUMlc4?=
 =?utf-8?B?L2cxQ1NsdDkzSDZDUWVRS2hYRTJoeHVrWFZFM0N0RTNsU3Q5Q2xtTU4zSCtL?=
 =?utf-8?B?eHU0YWdpV294YUwxaXpCcGlKSEtmdzBnUFIvVE1ESzBEN1Q4ak1xTVN6VEdF?=
 =?utf-8?B?K0U3SnN2dVU4NUlrNFhNbnZrR0M5U2VPc0JYbTM2ZitTTVpqN2dCbkpmdytX?=
 =?utf-8?B?bHh2S2pGa0pDaGFZenlXN1J4NGRYQ1FTU1BFL3RERkkxWjQwdVlZN0NSMG9q?=
 =?utf-8?B?SDA1NWlnNllHTjg1RFVNN1ExbTh5U09jTEZUd05oYlRudS9aa2tJUFpaKzFq?=
 =?utf-8?B?RUFOdUdxUXBibFBYMEpRV2ZjaVMxbW9NZDBUaiszSVlKb09rbU1NQ3NySXRK?=
 =?utf-8?B?bm91S2pFTjRQQkJ0b2FEM3R1Tml3bWVxTmdGZExvZnc4NkNCTnFNT04zekRY?=
 =?utf-8?B?YUZhYUJ5RmtscHA3NXpPbSt6dVNYd3d4aEdtWXZieGgvRlRBRjRrdWlzdTZX?=
 =?utf-8?B?d1ZMSmYwakxQZThGeEZxd1RwMjZ6TnFxclRkYXRWRWhuMTFMTTBnaDQ1Vm5p?=
 =?utf-8?B?RWE1NDVkQ3lodVZHMEV3MGMxTlpFVmYvOGNlMnJuT3o5VnA1d0l3bGJyaFZl?=
 =?utf-8?B?YzA0aURrQmFmcFc5K0NpTzBteWhOOFdCVWEwSTk1cElGQktCd2xOQXFTaFlY?=
 =?utf-8?B?b0NqODM1eGozTGlkdjlQNmt0Y1dBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34AB4909204B1B489F3966928C90D36E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bac889-65bf-4915-a478-08d9e1b94ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 17:20:25.5816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aApn84IbQVVefYUnrZHlOdg54ODWN0s+b2zen+dPciKo5fOkD8r0t/4r8FIQFs6m5DfqeENMLNrzVQgtcZBhjgQGCZIOVl/Fx9sXfJ4WSKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6231
X-OriginatorOrg: citrix.com

T24gMjcvMDEvMjAyMiAxMzo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjAxLjIwMjIg
MDk6NDQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXaXRoIGFsbCBvdGhlciBwaWVjZXMgaW4g
cGxhY2UsIE1TUl9TUEVDX0NUUkwgaXMgZnVsbHkgd29ya2luZyBmb3IgSFZNIGd1ZXN0cy4NCj4+
DQo+PiBVcGRhdGUgdGhlIENQVUlEIGRlcml2YXRpb24gbG9naWMgKGJvdGggUFYgYW5kIEhWTSB0
byBhdm9pZCBsb3Npbmcgc3VidGxlDQo+PiBjaGFuZ2VzKSwgYW5kIGV4cGxpY2l0bHkgZW5hYmxl
IHRoZSBDUFVJRCBiaXRzIGZvciBIVk0gZ3Vlc3RzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4+DQo+
PiBHaXZlbiB0aGUgYWRqdXN0bWVudCB0byBjYWxjdWxhdGVfcHZfbWF4X3BvbGljeSgpLCB3ZSBj
b3VsZCB1c2UgJ0EnIHJhdGhlcg0KPj4gdGhhbiAnUycgd2hpY2ggd291bGQgYXZvaWQgYSBzZWNv
bmQgc2FtZS1zaXplZCBkaWZmIHRvIGNwdWZlYXR1cmVzZXQuaCwgYnV0DQo+PiBpdCdzIGFsc28g
YSBiaXQgbWlzbGVhZGluZyB0byBzYXkgJ0EnIHdoZW4gdGhlIFBWIHNpZGUgd29uJ3QgZW5nYWdl
IGF0IGFsbA0KPj4geWV0Lg0KPiBJIGFncmVlIHdpdGggdXNpbmcgJ1MnIGF0IHRoaXMgcG9pbnQg
Zm9yIG1vc3Qgb2YgdGhlbS4gSSdtIHVuc3VyZSBmb3INCj4gU1NCX05PLCB0aG91Z2ggLSB0aGVy
ZSAnQScgd291bGQgc2VlbSBtb3JlIGFwcHJvcHJpYXRlLCBhbmQgYWZhaWN0IGl0DQo+IHdvdWxk
IHRoZW4gYWxzbyBiZSB2aXNpYmxlIHRvIFBWIGd1ZXN0cyAoc2luY2UgeW91IHZhbGlkbHkgZG9u
J3QgbWFrZQ0KPiBpdCBkZXBlbmRlbnQgdXBvbiBJQlJTIG9yIGFueXRoaW5nIGVsc2UpLiBBaXVp
IHRoaXMgY291bGQgaGF2ZSBiZWVuDQo+IGRvbmUgZXZlbiBhaGVhZCBvZiB0aGlzIHdvcmsgb2Yg
eW91cnMuDQoNCkhtbS7CoCBUaGVyZSBhcmVuJ3QgYW55IEFNRCBDUFVzIEknbSBhd2FyZSBvZiB3
aGljaCBlbnVtZXJhdGUgU1NCX05PLCBidXQNCml0IHByb2JhYmx5IG91Z2h0IHRvIGJlICdBJy7C
oCBJJ2xsIHB1bGwgdGhpcyBvdXQgaW50byBhIHNlcGFyYXRlIGNoYW5nZS4NCg0KPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2NwdWlkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jDQo+PiBA
QCAtNDMzLDYgKzQzMyw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBndWVzdF9jb21tb25fZmVhdHVy
ZV9hZGp1c3RtZW50cyh1aW50MzJfdCAqZnMpDQo+PiAgICAgICAqLw0KPj4gICAgICBpZiAoIHRl
c3RfYml0KFg4Nl9GRUFUVVJFX0lCUlNCLCBmcykgKQ0KPj4gICAgICAgICAgX19zZXRfYml0KFg4
Nl9GRUFUVVJFX1NUSUJQLCBmcyk7DQo+PiArICAgIGlmICggdGVzdF9iaXQoWDg2X0ZFQVRVUkVf
SUJSUywgZnMpICkNCj4+ICsgICAgICAgIF9fc2V0X2JpdChYODZfRkVBVFVSRV9BTURfU1RJQlAs
IGZzKTsNCj4+ICANCj4+ICAgICAgLyoNCj4+ICAgICAgICogT24gaGFyZHdhcmUgd2hpY2ggc3Vw
cG9ydHMgSUJSUy9JQlBCLCB3ZSBjYW4gb2ZmZXIgSUJQQiBpbmRlcGVuZGVudGx5DQo+IEZvbGxv
d2luZyB0aGlzIGNvbW1lbnQgaXMgYSBjcm9zcy12ZW5kb3IgYWRqdXN0bWVudC4gU2hvdWxkbid0
IHRoZXJlDQo+IGJlIG1vcmUgb2YgdGhlc2Ugbm93PyBPciBoYXMgdGhpcyBiZWVuIGEgb25lLW9m
ZiBmb3Igc29tZSByZWFzb24/DQoNCk1TUl9QUkVEX0NNRCBpcyBlYXN5IHRvIGNyb3NzLXZlbmRv
ciAoanVzdCBleHBvc2UgdGhlIENQVUlEIGJpdCBhbmQNCk1TUiksIGJ1dCBJSVJDIHRoZSBpbnRl
bnRpb24gaGVyZSB3YXMgdG8gYmUgYWJsZSB0byBjb25maWd1cmUgYW4gSW50ZWwNClZNIHdpdGgg
SUJQQiBvbmx5IGFuZCBubyBJQlJTLg0KDQpUaGlzIHdhcyBhdCB0aGUgc2FtZSB0aW1lIGFzIHRo
ZSBidWdneSBNU1JfU1BFQ19DVFJMIG1pY3JvY29kZSB3YXMgb3V0DQppbiB0aGUgd2lsZCBhbmQg
YSBgMTogd3Jtc3I7IGptcCAxYmAgbG9vcCB3b3VsZCByZWxpYWJseSB0YWtlIHRoZSBzeXN0ZW0N
CmRvd24uDQoNCg0KRm9yIE1TUl9TUEVDX0NUUkwsIHRoZXJlIGFyZSB0aHJlZSBzdWJzdGFudGlh
bGx5IGRpZmZlcmVudCBiZWhhdmlvdXJzLsKgDQpUaGlzIGlzIHBhcnQgb2Ygd2h5IHRoaXMgc2Vy
aWVzIGhhcyB0YWtlbiBzbyBsb25nIHRvIGdldCBvcmdhbmlzZWQsIGFuZA0Kd2h5IHRoZXJlJ3Mg
bm8gUFYgZ3Vlc3Qgc3VwcG9ydCB5ZXQuDQoNCkF0dGVtcHRpbmcgdG8gY3Jvc3MtdmVuZG9yIGFu
eXRoaW5nIHJlbGF0ZWQgdG8gTVNSX1NQRUNfQ1RSTCB3aWxsIGJlIGENCmRpc2FzdGVyLsKgIEV2
ZW4gaWYgeW91IGNhbiBtYWtlIHRoZSBWTSBub3QgY3Jhc2ggKG91Z2h0IHRvIGJlIGRvYWJsZSks
DQppdCdzIGdvaW5nIHRvIGhhdmUgYSB2ZXJ5IGJyb2tlbiBpZGVhIG9mIGl0cyBTcGVjdHJlLXYy
IHNhZmV0eS4NCg0KPj4gQEAgLTQ1NiwxMSArNDU4LDE0IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBj
YWxjdWxhdGVfcHZfbWF4X3BvbGljeSh2b2lkKQ0KPj4gICAgICAgICAgcHZfZmVhdHVyZXNldFtp
XSAmPSBwdl9tYXhfZmVhdHVyZW1hc2tbaV07DQo+PiAgDQo+PiAgICAgIC8qDQo+PiAtICAgICAq
IElmIFhlbiBpc24ndCB2aXJ0dWFsaXNpbmcgTVNSX1NQRUNfQ1RSTCBmb3IgUFYgZ3Vlc3RzIGJl
Y2F1c2Ugb2YNCj4+IC0gICAgICogYWRtaW5pc3RyYXRvciBjaG9pY2UsIGhpZGUgdGhlIGZlYXR1
cmUuDQo+PiArICAgICAqIElmIFhlbiBpc24ndCB2aXJ0dWFsaXNpbmcgTVNSX1NQRUNfQ1RSTCBm
b3IgSFZNIGd1ZXN0cyAoZnVuY3Rpb25hbA0KPj4gKyAgICAgKiBhdmFpbGFiaWxpdHksIG9yIGFk
bWluIGNob2ljZSksIGhpZGUgdGhlIGZlYXR1cmUuDQo+PiArICAgICAqLw0KPiBVbmludGVuZGVk
IHJlcGxhY2VtZW50IG9mICJQViIgYnkgIkhWTSI/DQoNClllcy7CoCBUb28gbXVjaCBjb3B5JnBh
c3RlLg0KDQp+QW5kcmV3DQo=


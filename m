Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D524B8784
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 13:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274084.469428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJLg-0002Te-KL; Wed, 16 Feb 2022 12:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274084.469428; Wed, 16 Feb 2022 12:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJLg-0002RJ-GB; Wed, 16 Feb 2022 12:23:56 +0000
Received: by outflank-mailman (input) for mailman id 274084;
 Wed, 16 Feb 2022 12:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nrBo=S7=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nKJLe-0002RC-SE
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 12:23:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9bfc7b-8f23-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 13:23:52 +0100 (CET)
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
X-Inumbo-ID: 4c9bfc7b-8f23-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645014233;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=IOBG0mozRR3ylbC1U79NcMu6uSkiP/h1NDKzeJcUcKc=;
  b=M1ARRRsiRTF9MdcQjT0g/8EtH0bWezPdvPTu5tDZcR0PUZi/LRSLLzFF
   uCv0382ND2KDJNDWQIxC0NFjoikDgzTmOcPip0tlZmWPWlC5x0HXd9JZp
   t+7lUffnay6ByL7lKgwJ9EY+mmaYiXuaPeWxLwY8SEAp2KyY+lxQjs6Yw
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WyRLp+phUGUkVr3/caxs/2Pg0CwCFDiccR0MdB97HpqLUssYPJoq52BXDzicO50R8J+rA8aJAn
 xHIJqkJ1l/azenYQ8Mk0tQbu+IToV/UScV0hurCH3BZaANMgjpJ7TCN1UrZ4qJRvmuJL8ClW7I
 IN73duJD9RKMR963sQ+ptSJn1CRWbeS1MrTQvf2C+nbvEeM7xtD/SKgGrJaJvv+CCGROjHOzmp
 PmcOHFI27qOe3TEXHVlPQbbDe8jcKY9PEAdLukMf9y1cfgDIqHjceSPoimvky02AFY+0tzioCz
 w+nTVXTbdW3YjpbGbaGaUsRe
X-SBRS: 5.1
X-MesageID: 64739947
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:viJiI64RFPrRXLBAcomosAxRtCXBchMFZxGqfqrLsTDasI4TYg02e
 lBvGjDRZK7OJyCgZYg1O70CxjoFu8PRx9cxGldr+XoxQSpH8JKcX96VcUqpZi6fccCfFhw7s
 JhCZIKacJ5sQnXQrEbza7Gw9ykmj6zYGeGgAeKeUswdqXeIbQ944f40s7Jp0uaE+OSEPj5hm
 e8eguWBNQX5hmEqbThLsfnSpUoztamp52xH5gZgPKFA4gCCyyhJAMoTK5/qIiqjSOG4PAIbq
 8Uvbl2d1jmEl/v4Ior9yt4XSqCOK1LrFVDmZkB+AsBOuTAf4HxiukoHHKBEMx0P0WzXx4kZJ
 Ohl7vRcdy94ZsUgp8xFO/VoO3kW0XpuoeKvzdCX6KR//mWeG5fe66wG4HIeZOX0zt1fE2BWn
 cH0HRhWBvy1a0Ba95rgIgVkrpxLwMAGp+rzsFk4pd3SJa5OrZwu38wmTDKXtds9rpkmIBrQW
 yYWQTh0cTH4Xy1JAGgGAb8kse6qgCDjegQN/Tp5pYJvi4TS5Al40byrO9vJYN2aA85Smy50p
 EqfoT6/WEtDcoXCl3zVqRpAhceW9c//cK0fE6e3+7hGnVuXz3Q7AxwKT1qr5/K+jyZSXvoBd
 xNPq3ty8sDe8mSmcfKibSWDmUW0hSERAoBTDf1msgq0n/+8DwGxWTFfE28phMYdnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hSy2ETgYKykFfyBsZQkY59jupqkjgxSJScxseIa3hNDoHTD7w
 xiRsTMzwb4UiKYj/aih4UrOhT7qg5HTVxM0/S3eRGfj5QR8DKa1aort5VXF4PJoKIeCUkLHr
 HUCg9KZ7u0FEdeKjiPlfQkWNOj3vbDfamSa2AMxWcl6n9iwx5K9VYJL/RRGGHdvCPkVcBLzT
 UbRv1pN7aYGaRNGcpRLS462Ds0ry43pGtLkSu3YY7JyX3RhSOOU1HowPBDNhggBhGBpyPhiY
 snDLa5AGF5HUfwP8dagewsKPVbHLAgazHibe530xg/PPVG2NC/MEudt3Ldjg4kEAEK4TOf9r
 o432yiikUw3vAjCjs//q9N7wbcidyVTOHwOg5YLHtNv2DZOFmA7EOP2yrg8YYFjlKk9vr6Wo
 i3sBxYCmQuu3CevxeC2hpZLMu6HsXFX9yxTAMDRFQzwhyhLjXiHsM/ziKfbjZF4rbc+nJaYv
 tEOetmaA+Qnd9g00291UHUJl6Q7LE7DrVvXZ0KNOWFjF7Y9F12h0oK1JWPHqXhRZhdbQONj+
 tWIzB3Ae5MfSmxKVYCOAB5Z5wjq5iZ1dSMbdxagH+S/j222oNgwcH2u1KZqSyzOQD2arganO
 8+tKUpwjcHGopMv8cmPgqaBroyzFPB5EFYcFG7ehYta/wGDloZ66YMfAuuOYx7HU2b4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LynUx9RLu41M2qRd5Vm8V
 HWQ94QIIr6OIs7kTgIcfVJ3cuSZ2PgIsTDO9vBpcl7i7Sp68ePfA0VfNhWBkgJHK75xPN93y
 OstopdOuQe+lgArIpCNiSUNrzaAKXkJUqMGsJAGAdC01lp3mw8aOZGFU334+pCCbdlII3IGG
 D7MifqQnalYy2rDb2E3SSrH091CiMlcoxtN1lIDeQiEw4KXmv8t0RRN2j0rVQAJnA5f2ud+N
 2U3ZU14IaKCo2VhiMRZBj3+HghAAFuS+1DryktPn2rcFhH6WmvIJWw7GOCM4EFGrD4MImkFp
 OmVmDT/TDLnXMDtxS9jC0dqpsvqQcF16gCfytusGN6IHsVibDfo6kN0ibHkd/cz7RsNuXD6
IronPort-HdrOrdr: A9a23:Up4ji6DNdEirPsjlHegbsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEDyewKhyXcV2/hfAV7GZmfbUQSTXfhfBOfZsl7d8mjFh5RgPM
 RbAuZD4b/LfCBHZK/BiWHSebdB/DDEytHSuQ639QY0cegAUdAF0+4NMHf8LqQAfnggOXNWLu
 v/2uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qinl1qTmf/HOind+i1bfyJEwL8k/2
 SAuRf+/L+fv/ayzQKZ/3PP7q5RhMDqxrJ4dYyxY4kuW3bRYzSTFcFcso65zXQISSaUmREXee
 z30lUd1gJImjXsly+O0ELQMkLboUkTAjfZuCGlaD3Y0JfErXsBerp8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJltXftrdmwtSrQc/tQ0WbWIlUs4bkWXfxjIgLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3Y7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPeHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCMn4Gyff+qqGj3iq9MllVbA6dvf22vaIJyYEUbICbRBG+dA==
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="asc'?scan'208";a="64739947"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EATn1/qh1FdD7XTATLN5HbxeSkU3HQc2GAzNtSX77Sz/EqXu+q7gQdJlzCLMjqFdlFLbLleSbvGfXBadQSe3x5hKUJ5Mo+54wfPRTIrCWWxlYvoc08YbMIWMssgMGmo7k/EHILP4CdGY4bqCzL1blAK3XZS2cjzawapgbMaC1KQtjmOGbiVv6/qpg02fg7TUC6iQPbCxQqmDkmZpIXaO3aCfsDOb5zYlu/RpFveUJLwLH+/l7r6CUTXQXHdC231qMRjQhjnmz07hJdWq8FvDzjQz9FeKzH8hpw568iwYDXEjMGIiI5EH3nQbSQfCLAlrEw2lo4gWzPfYigmq+MoQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZslmnCZbH+Dwlon09I1JD2kLv+rewuSwj369UdN1pVI=;
 b=i6wtUpy4Qq8cxLN5VjSEVFm07ugJ/jY6EqMJ+EZ0LWoE8a2CpSeXVzFACRbthaOXDSoC+vZVsXBw65B0+yAv55S55BrIPB3VrUxUSJ2tjpRjUWBbtOwf1c3SPQ984W4z5qZuCCeeXpehg/aX3bqU8x7cMrdiiEybcRCzTubFlbGOW7bmO1UIzyGLIBoFWUNJHrg17X5ppiYeuUvgC/hTGhxwyRuxERA6z/WJCgSz71kawwkxyso4UczpcRHWY6dQmKYbz7Tr7CcJLbDllye49pkNarDAuOc1cYhpWOBgy7DFG9s+5D1OBeAJ0XHwXapWEc+fK/QE9l8ztqdPqQ1TIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZslmnCZbH+Dwlon09I1JD2kLv+rewuSwj369UdN1pVI=;
 b=EZLvLFGEe9UjeuJllK6oGroH8Q04z9elHb8ClA1qlhCQdwfWlJZqfV2FemUK7QA0WpdCG7bwNTV7miZC0XkVfpLdWqL8snZA3lvIZwF9xNbHSiT4TA6vCr0NLpp1CPbcKxngViAyQP/D6r1u9SvMgOmoY5j7GcsXYyEyySxwWtA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] lib: extend ASSERT()
Thread-Topic: [PATCH v2] lib: extend ASSERT()
Thread-Index: AQHYE4shsIFDV42A206yi2y9mPx4ZqyVNw0AgADQCYCAAAHgAIAAIi+AgAACZYCAAAt2AA==
Date: Wed, 16 Feb 2022 12:23:47 +0000
Message-ID: <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
 <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
In-Reply-To: <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfe9cd17-3778-4b17-9aed-08d9f1472ecd
x-ms-traffictypediagnostic: DM6PR03MB3468:EE_
x-microsoft-antispam-prvs: <DM6PR03MB3468EAD16E8DD45DFF3E667899359@DM6PR03MB3468.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: akNKT0mw48qU/d5xiDa7mDfTOUhyObRGiv9keUy+tmNNivFmELONbjjQ/cMben5oihzucf/a6OCU++mS04g5BfUQAEs9mKRnkwq9DsH+jNXtqZBuUG3LlmBJp/lqEF/PEkpNKsbshYG5QKypg88k+C99zmr/ZrIq+XmGvE0URT4FC7PCKIhXjxFHGLbYJC+NlS8BeQ27AgoPbGhkmsl3B9xnAk7FCFCKvMD7DWmf4yxIm+PTXWgxfprHQnWGjf9jXH6ihvpfglkEVK6G3VFoRVftppfS32znMqI1sNHMAAvIHYDbbywiERM3Y/a8XtID3R0SFdHjR6Pv15ryaYlvwjQc+kgdcy6mb4Q3Qq+5gjLbNAPwWOp7TcSLkY1Kpc54+X82OVBWB5JwyBiTN7l7onH3Alz3g7YOjpjhcho9NvPG+YyI09dVYfw5PRLheBdR6O3vCMvPAY3ftJZGfjrmQbr/Z5gZTjkPOvej9LwsTTIdpIhdp+drKiw8gvMaugx4lKkloZ04olPY/9LLl9Z/NlnC5Mn9e1x0l5K+rFVG0V4B5QmladJsYAkhJygz9pftWVyJN43jCiamFH5rm1ZOqmj4rHnT4PF5k85GKw1WKxsQ1PD4FXPz8k1zkigTfKtSYN/mhLI7YB7lj7x4QuWk9QJ/VGeuAGP57r0rGmVpfU29M5yjVBhakCIdOeyVY0cU6Hi+EwbN5Yx4wOo7iZV/uCuHqM2CIZGBfd7oYxqVnYO3Y/HyHl/vZo6SglvIP6mq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(66446008)(83380400001)(66556008)(5660300002)(64756008)(2906002)(316002)(66946007)(8676002)(122000001)(6512007)(33656002)(76116006)(26005)(4326008)(53546011)(186003)(6486002)(508600001)(6506007)(38100700002)(91956017)(66476007)(2616005)(54906003)(71200400001)(36756003)(8936002)(86362001)(38070700005)(99936003)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkV5ZjdZVXlIWUZOZEhVZHBKY0xpVzBQV1IvQVNKUXg1QWVIcGtPeUtudUlv?=
 =?utf-8?B?RjM0ZkdpbDFsZjVGalgrWDZua3dmZm9JVmVqbHZibFhIWE1vYjdVMlF1dk1B?=
 =?utf-8?B?SitOeGw2Mk9RZzBKTSs5Y0tLSm9GdEFwYUFudW5rS1ZPUjRyK0VKdDB1S0dr?=
 =?utf-8?B?RURnZnJiSlpsTlFyY0NxTWlVN0lDOXJTUjRGSnlrZUt0dDdTQmlCejRKTTZi?=
 =?utf-8?B?b2JodzdkZFNpaXlob1E4NStkbU9HZGFLWnErc2JyWXlOZlVqK0tOUE5aeDc5?=
 =?utf-8?B?K01ZVDN6ZUhIZWp5ME5OUTc5NEVJeTNuTzE1UmdMOFVDSUZxamZRK21KMXNN?=
 =?utf-8?B?SDByTXFSdFpjZEJ3d0RjZ0dscEdFT1R1NWFFUDUxTDg4T3U2dFRoaXduUGJv?=
 =?utf-8?B?dE8zMXFhWUI0NTk1RE02TEN2WFRCYlN0R1djbWhRdHE3WnNGSnQvTUtkM3dX?=
 =?utf-8?B?R25VRFY3N3B1QXo3NFVvU3NNaEFOd1ptQkh0bFhsY09pRGpCY05tOS9IajFV?=
 =?utf-8?B?OUpsckNReEMvcUpDczk4WWVTYUxZWTVtZUhGejdLT3o0NnZNNmdxVE5ySUV3?=
 =?utf-8?B?c2lvL0ZiaWw0Ym9RK1FHQVNxdW9FR2srcEhuZ1dyeWZ2ZENlbmNITmRVTjN0?=
 =?utf-8?B?dTNYZFZ3R0FoZCttQXVZbGlLK055SmNzdzZXWklkL3JseHoyeFhkeGU4c3Zs?=
 =?utf-8?B?dXhQREhJcVBvSTBpd1ltVmhTVEdzVm1xR3I1aGZkblZRYm1tanpHQ2FmVFZr?=
 =?utf-8?B?UTZFdXlFdlZUNzV0aDRIdXl2cHg4ZW1SUEsxSWwzS2Q0SmJwaDN1MWRGd080?=
 =?utf-8?B?aWFuSTVreVpjUEVENzVJcXEwRHpVMytMYThMMFU4WDNwS1hzYjNyWVZtY0Ux?=
 =?utf-8?B?MXNWd3dnRm5zd2pjc0VoRi95NFRCYzR2U05mVVhnOGtNL2VJeEpQby8wbXhU?=
 =?utf-8?B?N1JvWnFYd2ZzZWN6RmwxVW5XenlsRjhRY0MxOTAyNTVwS1owOXIvTHg1clV4?=
 =?utf-8?B?cTB3ZGdDcXU2eUltTmNGVXdsN3ZYS2x5bCtFVGh3bUQ4UUh3WFF0S1NwSDFa?=
 =?utf-8?B?OS9EZjVtbnRBMU1udVhLaFR5dVlsM25vRTFaUzdFdlBxaVhtbVV1QUVuOTgy?=
 =?utf-8?B?Y2pOeld1bUE3TGFPUmhncENSa1dNU0IvcVBybUJJZmF3TEliSnIxdjVXMWo2?=
 =?utf-8?B?SUVMTlV2UjdtYXZvKzdaMXg4dU85dlhSc0J2K0p0RWJ6c2twV3BUbENUS3V5?=
 =?utf-8?B?ckhTajRzb09UYmpsWGk5WkpFb1c5VS9HRHpOWGQ0b3NWdEFKK0tMbDUwVG5h?=
 =?utf-8?B?TzNzc0c4MWJjN2pmaEdvejN6VVR2cm5RRzgxVGtiWXZ4VDVYZHcwdGFMK252?=
 =?utf-8?B?NDJRYWdFeERBb2JtcFZvTjNGdmNYVkNnN3lWVmdWR2kxcjJHclY3dUROazBa?=
 =?utf-8?B?RkdGdmp4R01ueXY3a1JxWWNmMCt1R1JyczlpYlcyc3RsUWRWaGo2Zk1jVjNq?=
 =?utf-8?B?RFZtSzRENVNSblFkRGUyUDcwZmlGRFlpcldzZ2Zid0lSdHBZSU9FVmM4NkI2?=
 =?utf-8?B?YUZxNHEyOGZnMDIxekY1Nk85QnlidDZvay9nbHFYY0F5T3hyaS9wTHFpVm5P?=
 =?utf-8?B?UXpONXgwbTFUajA3amdJOGdBMG1nV2JsSnlxSitFZ2FneFRFZFNrc1krano5?=
 =?utf-8?B?NUZlRnVxSnFZdFptWDRHSGE5eWdKNmlTRHYvYXUvQm5uMFREcVdiRm4rTjdZ?=
 =?utf-8?B?dzA0QUdPUWFQYmczd3FQdllTbGVWUjFtbklURmVvU3B0WWRFbkMyMmxMZ0NQ?=
 =?utf-8?B?NllzbWZSR0V1L3UvZWNhWTd5WUx0anlIelExQjU2OXJQR3grK2dHTTNiTlFt?=
 =?utf-8?B?dkhrdFFUR1NGaGxCckx3ZGF6eWY3bXVqWmFwRk9pcDZHVmc1TVVlMHE0OXQ4?=
 =?utf-8?B?ajRzMDRLRWErZTlEQXRZYlJFcXpCd0lDcmdSNFU1MTV0c3UvK3VmMkhadTBj?=
 =?utf-8?B?eitCbkx5M3JMUWFueU9qRVFXODFGd3MvNTcwSGFTc2d6ZmpZZHBkRW02VnMy?=
 =?utf-8?B?ODFGMDJxZm1maVRyTEJPcGJyU0ZXT0tuS256RlRvQWlEYjRPb1ZGWW5WVEZW?=
 =?utf-8?B?dmlvRDlOMFJ5TjcvSk1hL0xPaEp5dmxOZXpZbTNTSVFJb0pvajNNZlQ3VHdY?=
 =?utf-8?B?alJka1laNVRsVkpOOTNEVG1vYW5ra09CVEd1LzZWSGswTkxYeW5WeklkNFdK?=
 =?utf-8?Q?7sypfzYjyk9bFKQPTHxbthPEBQtf3btFcchZvHxe7A=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8A8214E3-19D3-43CE-A54A-B2288D06B6AE";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe9cd17-3778-4b17-9aed-08d9f1472ecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 12:23:47.7502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABrp0SHTIsho7qgqZ6eaHmj88qCXFbBDVyZ4DzsfFjOZG6tlDFbttqm5fPCejm/TNu/vne6UjtZVKrVEENwR0gjHnoTr1RYxAKYVwigphzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3468
X-OriginatorOrg: citrix.com

--Apple-Mail=_8A8214E3-19D3-43CE-A54A-B2288D06B6AE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 16, 2022, at 11:42 AM, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 16.02.2022 12:34, George Dunlap wrote:
>=20
>> I am opposed to overloading =E2=80=9CASSERT=E2=80=9D for this new =
kind of macro; I think it would not only be unnecessarily confusing to =
people not familiar with our codebase, but it would be too easy for =
people to fail to notice which macro was being used.
>>=20
>> ASSERT_ACTION(condition, code) (or even ASSERT_OR_ACTION()) would be =
a bare minimum for me.
>>=20
>> But I can=E2=80=99t imagine that there are more than a handful of =
actions we might want to take, so defining a macro for each one =
shouldn=E2=80=99t be too burdensome.
>>=20
>> Furthermore, the very flexibility seems dangerous; you=E2=80=99re not =
seeing what actual code is generated, so it=E2=80=99s to easy to be =
=E2=80=9Cclever=E2=80=9D, and/or write code that ends up doing something =
different than you expect.
>>=20
>> At the moment I think ASSERT_OR_RETURN(condition, code), plus other =
new macros for the other behavior is needed, would be better.
>=20
> Hmm, while I see your point of things possibly looking confusing or
> unexpected, something like ASSERT_OR_RETURN() (shouldn't it be
> ASSERT_AND_RETURN()?) is imo less readable. In particular I dislike
> the larger amount of uppercase text. But yes, I could accept this
> as a compromise as it still seems better to me than the multi-line
> constructs we currently use.

I see what you=E2=80=99re saying with AND/OR; I personally still prefer =
OR but wouldn=E2=80=99t argue to hard against AND if others preferred =
it.

As far as I=E2=80=99m concerned, the fact that we=E2=80=99re reducing =
lines of code isn=E2=80=99t a reason to use this at all.  As our =
CODING_STYLE says, ASSERT() is just a louder printk.  We would never =
consider writing PRINTK_AND_RETURN(), and we would never consider =
writing a macro like CONDRET(condition, retval) to replace

if (condition)
    return retval;

The only justification for this kind of macro, in my opinion, is to =
avoid duplication errors; i.e. replacing your code segment with the =
following:

if (condition) {
    ASSERT(!condition);
    return foo;
}

is undesirable because there=E2=80=99s too much risk that the conditions =
will drift or be inverted incorrectly. But having control statements =
like =E2=80=98return=E2=80=99 and =E2=80=98continue=E2=80=99 in a macro =
is also undesirable in my opinion; I=E2=80=99m personally not sure which =
I find most undesirable.

I guess one advantage of something like ASSERT_OR(condition, return =
foo); or ASSERT_OR(condition, continue); is that searching for =
=E2=80=9Creturn=E2=80=9D or =E2=80=9Ccontinue=E2=80=9D will come up even =
if you=E2=80=99re doing a case-sensitive search.  But I=E2=80=99m still =
wary of unintended side effects.

Bertrand / Julien, any more thoughts?

 -George

--Apple-Mail=_8A8214E3-19D3-43CE-A54A-B2288D06B6AE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIM7NIACgkQshXHp8eE
G+0MrwgAjDmCq15MrTU7fJTqwpH6CfRwl5AW43eELgJ3cpZC5zeKsg5jtbhNYj0Q
Ejs0mv/oNCOuZg1zDdgcUG4XjU39te3sFJHF+75nI9nTrXKOVbx46yyGfSoNVEmd
PxAPxcySGRX2buTfkQJY928deC6MyakqMIzo79nN82AVJ6H2U2CMfYBwemuWU+OJ
P/mSpneqSBViOTJwTersOHrtFTX4rT3Mx7TlpxDAadHq1MsCpWRsz2G55XVvVD21
TQUmPFkj1luRFfmXzc1o7djmC/SMP5rk05bazrQ6PfivatoCvniHyDMS9oklAkul
ObJv/AyiP9FeBvnKJ5yCTMPdxODXHQ==
=hlW+
-----END PGP SIGNATURE-----

--Apple-Mail=_8A8214E3-19D3-43CE-A54A-B2288D06B6AE--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEC4D1CFB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287176.487041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcVh-0005x4-LU; Tue, 08 Mar 2022 16:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287176.487041; Tue, 08 Mar 2022 16:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcVh-0005uq-HL; Tue, 08 Mar 2022 16:16:29 +0000
Received: by outflank-mailman (input) for mailman id 287176;
 Tue, 08 Mar 2022 16:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibIM=TT=citrix.com=prvs=059cca470=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nRcVg-0005t9-OA
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:16:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a12332e-9efb-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:16:27 +0100 (CET)
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
X-Inumbo-ID: 1a12332e-9efb-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646756186;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9BrTw2P807BlUNiaWeVrBK2zTf7ICJnk2VvsQOBaIP4=;
  b=aPXgjM9tlSoY3KQSuxNiaKfOdjZR4YlGrYotJf1LkO/WqyjgENJny3/v
   7erJQvtzaNOeY0CyPvOGJumH1GmpHYWNpHqGMPIIP6qqvyzXyBKPct7ae
   7nIpcpHy+g3zlV7Hi6gfE9Vli3JOFR+pnXcXsu5ZenRhmDil0XbMpmjFk
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66121364
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8PWc+6LMF4oiA4HLFE+RKZUlxSXFcZb7ZxGr2PjKsXjdYENShjxRm
 GVKXjqBOPzcZWTzetoiOt+2oBlQupDQz9M1GQJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dY42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NoWhLGoQCcbBazFiLwgVTd0ISZ3FJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBOviOo5Zn3hkxDXQC/sOSpHfWaTao9Rf2V/cg+gQQ6+EP
 pFHNVKDajzPWUMTA1NKJqs4s9qkvUnucy98lW+a8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2nCxgu7CmwvrVYRUE6e3ntZUh1mUyn0WGQchf1KxqvmkiWazQ9tab
 UcT/0IGoaEs+WSxQ9L6Xhn+p2SL1jYDX/JAHut87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCX+6qQrDiyETMINmJEbigBJSMH7MPku5oblQ/UQ5BoF6vdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqz33l7XRRy4H3QTeTjqY6C1VVomsTrX9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgNuGkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmP8AZmOyvpngGiausM4bFyhBEfUYXY
 8vzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDJF+laYAbVN7Bkt8toRTk5F
 f4FbKNmLD0FDIXDjtT/q9ZPfTjm01BhbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6/DP5X8CNgVQRxbAnA5pTWSdv2hEvpX8BsJudPGS0K5aMcc
 sTpjO3cWqQfEGqWoW9BBXQ/xaQ7HCmWacu1F3PNSBA0foJ6RhyP/dnhfwD18zIJADbxvsw7y
 4BMHCuBKXbfb2yO1PrrVc8=
IronPort-HdrOrdr: A9a23:riy47KpLFigVerZwSI08NQYaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="66121364"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0IgoaBIbmBo/DKfUtYXlbVo/AGO+QmFTCrTDImG5po9Y4h+ft6Lx5zwxGs3ULTHjbwhYwJ+uZ3XTlnpehq7eURK1qTzjM8LTAGe38zd3vmCADvxkPtwgbr2M6fDTO+C6EPr943BQBfFDq7thwPSi8/eL58J4fE9mq6B2g4sQ/J9s7UDaNfrDzyILEvVWcl+9iSSL+FUI789rVDmz/VORN7lIdgxyduGJ7rAqi846Ff85K7L9W404pFcYX1DASW9vh36mqUHSc5v9R85GIXw+J0QkRR21mamCMteJF9MdO8ptlnT6mytU8abvSdTQUTOgrPeFZSWw+p9lJ26BsApLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BrTw2P807BlUNiaWeVrBK2zTf7ICJnk2VvsQOBaIP4=;
 b=YKVPh6tc2bYp3i9Irz+k8uWl5B/8eBm7ACaUgDZPRQ8xE784Qt5MfvQquCxllLLRpEtPEVNxAZePpgpCrbmpI+I6S3Nf+nb0AO3x2xTwG2/ZArTt3T+NJ6LLcEjMoHAe0wPBAfoBoaCUKkaVuj1czveoWID1uygOxe5zrLPu7l91VDC1cwCocFxCZDdyxlJDBoVrCiREYllBiy8qk6p3uS53Wx+3juKFJw/SRSrGcPwHePonmYbDuk5xIFhMgr3Xq9KhWO10UJ7YORzGVGW7/aUFMWGfhrdi6h9G4Z80lGllMO5FuBHVltZYz7UVTW9cz2fRC0DlMPRO1B58kTRW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BrTw2P807BlUNiaWeVrBK2zTf7ICJnk2VvsQOBaIP4=;
 b=XRJI1rNHw3priDFn/Ka6kF+Regixmm21X3QkgCRaqEW6MxtyWhmXo9CSS/IcVBX6OpBsN4UjyBMN7CdFFbRq+PcL5zI498LfoyJGgTEjbjcuL2DoR4TMvI+IbeYuzOj+5VZMkzYdjMivZmZvxwhWpDo9cHLgObQnvAMIF1X/RIc=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYMjUEaMoAwzVpzE69n4F8Ciyydqy1XcmAgABEiACAAAUagIAAA9uA
Date: Tue, 8 Mar 2022 16:16:21 +0000
Message-ID: <07334c85-92af-4986-d8a0-7b61f785c22d@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <c20a3e9f-770c-3d2a-a332-ce836a4192da@citrix.com>
 <Yid+F5LdtMhs01tM@Air-de-Roger>
In-Reply-To: <Yid+F5LdtMhs01tM@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41248063-a34d-42f7-c621-08da011efc28
x-ms-traffictypediagnostic: BN8PR03MB4596:EE_
x-microsoft-antispam-prvs: <BN8PR03MB45966049C18DA5F20473050381099@BN8PR03MB4596.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BxxX6jt77QTIhzskQCycdh/bWeSdgc5OUZB524EcfG3yi/PymT9iSDV7tiq4ERrNNvkS2dQK7MvdJQt7koOdZ9x4csG2SbOiXLKR6R70gu1kZtij2gI7rJohBy9BcX0NMNhuvuSn1ocwEWYyKnwP8toK6bXTfkzGL8ia3pcAcMdcF5rR2go5lLyLoudqG66upoAgVXOTR7QW92Vo9iwQxUpXdDkdbngthzZpBT+YuPlx8m+pQjf1Z01u+Ojn0nLKqxRi/s8Q0WrrAM8tkkAbVoC1n10D57B7Oo1NkMPxQXYL3I4M7NTeGug77V/Z8HFiJDjc/eSMJd/dv25j9xH6Cn+3SwAWSvSh/Dj9eg2tBnHCDT07efvcZhmTfh8OqPl1jHT7lwyitF2cX62p2XuXyS1uoGpu16mqDW/7H2P8VIi088oXoZiWapm10HKT8up6QXafkcISOyxHG7DQg3YEzR3wCJ0CEAnybR7XiatLkeGi6MDGgSRC2gV0CSEDEg+XoZS43eSQCFDEW4IClp8IhTOABWifuWSTc0YBc4G5/ja9ZT6FQrcs8p87oUZN+AdF41BxqbC97Gp2a2Co+JpS4f/U9ivdzpPVfy5hifpTGvJE/GvKKQs/yqM+9sWp0566j0TdjGf63jxEbWxCLbMHz5a4byOxe9Z0MfgYMgLHd0oUl0c4bxuvv8iSkAwTYX9NNh6hppHV9r01S8viJ1yBuoMuw3X39kcgQ38CnZf50R1fue1kOJye3wPgC2+O2cnp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6636002)(26005)(2616005)(37006003)(186003)(31696002)(6486002)(55236004)(6512007)(6506007)(71200400001)(54906003)(38070700005)(122000001)(86362001)(53546011)(38100700002)(83380400001)(316002)(82960400001)(36756003)(2906002)(66946007)(76116006)(91956017)(66556008)(4326008)(66446008)(8936002)(8676002)(64756008)(66476007)(6862004)(5660300002)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekRDK0YwTXUrM2IxczhUQjUyQ25IcUlZSDQvcmdYMkV1MWFodVZCYVJ4aGdE?=
 =?utf-8?B?NUFPTnMyYks3WUFLc3ZzMW5mL1Z0UnVxUDVvMzBZRjQreUJOcllYeE9waTdP?=
 =?utf-8?B?U1QvcjlCdzVKMTI2NkVWR3IweGJxcnVrUVpVUENqdEF5enpQd3ZoSElIak9P?=
 =?utf-8?B?Um9WTzVISEc0WlFtaVV4bElKVUdVRVJOSll5bjVYeVN2L2dCekNQWnVzZHlM?=
 =?utf-8?B?bjlUYmdUR1RFNENLK0VJcHRHL3FVU1hHd3hGNVFoeFJMODk1bHQyNlF6NERF?=
 =?utf-8?B?eUk3bUxZaWhZYjlCVVNXbzNhckFjN3VkQmM4ek9WSTVKS3JNRGZ0L0RrSitO?=
 =?utf-8?B?MDNFRFZybGtrMi9uaWR2bi9Dd0VDcURPSis0TXc2YW9zVmN2ZjEwR1ArMTVz?=
 =?utf-8?B?WFVPTTFLUlBFR09XbDAxSGROVFY1Nmdlc1IzTHZTVzNKVHE4ZHhhVlZtZW05?=
 =?utf-8?B?UFRXNkFIOFEzMk5rRm0vS3JxclduVzlORXlFenM5WWQvZUMzQTNxT1hRUlhm?=
 =?utf-8?B?VUZyNzdzcHdGbXhKUW9vODU3NUtQR3RacXVGSjR6bWpsYjFXYTllU205ZFBp?=
 =?utf-8?B?d0J6SVVRNnpGNDY4Qzk4Mit0RmU5RktkRFZGYldCaDBvY2ZEQXhSTDZqYUFN?=
 =?utf-8?B?cThrTHRqb01aRElqTkw2VVY5US82R2x4aTdQaS9helJBT0IvYjV4bTNpNGpB?=
 =?utf-8?B?RDNhWWJUQStiSzh0Q2E3dWVsOTVvaWJlcXd0VjhLNjBoaXBubDVqbTNPZXdu?=
 =?utf-8?B?bExhMjhOTWhGbVhNK3FpUVlkT0tISm5tVmtQcWxNR3BQZmJPRnZ4aVdGbXAw?=
 =?utf-8?B?UjZXZkt6bkdNNmkyV2s5NzFUYlk0SHE3dlptd0NqaUtDbktuWHVpYWNvR3h4?=
 =?utf-8?B?akZXZFZXeGJhcUR0TnFhM2ZneUZJUnlOdTRYeVZWRFJTdjlBVlNoN0xEV3g3?=
 =?utf-8?B?eklXZFAzekZUSjZlODBtMnl2eHNrbVQzODQ2K0VqVUo2M3EzUlRjWWovN2VT?=
 =?utf-8?B?U3k3R2pmcUQ2QkNYV1diWEphazhhMlBKQ0R4M091T2JyN2ZnazZwSFFrYUYw?=
 =?utf-8?B?NTYxTzJIQmtvUGhXOU11cDFGMktQR0pzdk1makMxNitWbm8yNSswcWliU0hI?=
 =?utf-8?B?aStlNmxBYVlSN3RpNjBWZG5nVXJEelNidmt5OEhZdGZCSExzd1V3SnJSb3Nj?=
 =?utf-8?B?dTRQQjRRK05PSmU4ZldCbjQ4YXVXMmxlY2NoVHVDM292dDRpLzR0OGpwZHFy?=
 =?utf-8?B?MEMvWWlISDhKbkcreTVZY1ZlNjhnUEV6c2k3bzBtemtxWXVvYU4yOVRWWkZR?=
 =?utf-8?B?akJKbDRzTG43aHFrdDY3c3dLV3czMVJtVm1OZWNycDZrWDZaSG4yKzdPa3kr?=
 =?utf-8?B?WW16NUR5TkQwNzZMbFlTbURsRmxyT1Q1SVNWYXVSQlc0UjUvVFFwWnhTcndv?=
 =?utf-8?B?aHZRT29IdzFReW80NlA4bE9QZ0J4QU1PUkxNTWg4SU5aTFgzWmdQNTc3NEFS?=
 =?utf-8?B?OEdaN3JxTTRhTWxoNFZOeWpFc3M3aEpnaVZIM1FCeEdpWkdtM1MzWmNQUlhh?=
 =?utf-8?B?NzExYm5KSmZ4dy9PaVZYM2VsS1JDbkVmVkYxNlZ0OGQxZnh4Q1p6c3Nlemg0?=
 =?utf-8?B?TzBrM1p6MElGbXErRTR1N3UwSWMzRENNTktuaGpYdTB0UGRrSFZHenB0OXJU?=
 =?utf-8?B?TWtaK1oxL3p4ck03UmJTUDd5dEExZmJ1eVZhWDkwUlh2YVlLSVVzT3Y0dVVR?=
 =?utf-8?B?Q3g4MmduVkVRbHRHVzAxSUVhektSdXY0S3pUakMvVkN1U01FQlFLM285UEEw?=
 =?utf-8?B?dG1nRDNXMUJZZXhaYTZkSzZIOXdlTktnTkF0cHNMNmoxMU11YjJuL29QZFM4?=
 =?utf-8?B?YnZURWNCQzRYZnBFeGorb1NrZUdUSS80bjZ0M2NSNUlnVGpwdWVlTEN0NlhN?=
 =?utf-8?B?WDhqdURrOHJqN09VNWIzeGE0M3MxOTZTYkJCZ21oNDU5SVAyV3h2RmM2L0pq?=
 =?utf-8?B?MHNkb0xtalZveWMzTzFNbUFiV3BTNjNndytUbXJJWUN1eDZvbHFrTE5TdkJJ?=
 =?utf-8?B?ZVc2ejVRVzgxa1l4MG9CMUhOMkVPTGhjckRyWTZTUjVob2ExY01vUklpVENY?=
 =?utf-8?B?RXJ2STVKU2s5Y2FzNGR6OFg2T05JMGYyaTh5L05Fa3hTN2R0NFpVMXdaSmpi?=
 =?utf-8?B?M2J4SUM3K21ZbFJ4ZC9kOEJIeHJ1QXBDWGdjVnkvZHMvdnYwOU1Fb2xiMHZH?=
 =?utf-8?Q?fEmZJqrBuqg1BpPCq/xUqaIwo0hoNAjo+RfGolGJGI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D35FC727C236C24DBE31626773662C0B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41248063-a34d-42f7-c621-08da011efc28
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:16:21.5961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4puqCdLjbKNq3lkcq29T74HwnK2nFLO/rmv7GuANTEUDIsB86mccRLRLugKIJpelfNRXoy1X0cI/H1NTGVpblcuYfBXuenPaoOHDou8f3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4596
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxNjowMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBN
YXIgMDgsIDIwMjIgYXQgMDM6NDQ6MThQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+
IE9uIDA4LzAzLzIwMjIgMTE6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9u
LCBNYXIgMDcsIDIwMjIgYXQgMDM6MDY6MDlQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToN
Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vdm14L3ZtY3Mu
aCBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vdm14L3ZtY3MuaA0KPj4+PiBpbmRleCA5
MTE5YWE4NTM2Li41YjdkNjYyZWQ3IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5j
bHVkZS9hc20vaHZtL3ZteC92bWNzLmgNCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2h2bS92bXgvdm1jcy5oDQo+Pj4+IEBAIC0yMjAsNiArMjIwLDkgQEAgdm9pZCB2bXhfdm1j
c19yZWxvYWQoc3RydWN0IHZjcHUgKnYpOw0KPj4+PiAgICAjZGVmaW5lIENQVV9CQVNFRF9BQ1RJ
VkFURV9TRUNPTkRBUllfQ09OVFJPTFMgMHg4MDAwMDAwMA0KPj4+PiAgICBleHRlcm4gdTMyIHZt
eF9jcHVfYmFzZWRfZXhlY19jb250cm9sOw0KPj4+PiAgICANCj4+Pj4gKyNkZWZpbmUgaGFzX2Fz
c2lzdGVkX3hhcGljKGQpICAgKChkKS0+YXJjaC5odm0uYXNzaXN0ZWRfeGFwaWMpDQo+Pj4+ICsj
ZGVmaW5lIGhhc19hc3Npc3RlZF94MmFwaWMoZCkgICgoZCktPmFyY2guaHZtLmFzc2lzdGVkX3gy
YXBpYykNCj4+Pg0KPj4+IFRob3NlIG1hY3JvcyBzaG91bGQgbm90IGJlIGluIGFuIEludGVsIHNw
ZWNpZmljIGhlYWRlciwNCj4+PiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vZG9tYWluLmggaXMg
bGlrZWx5IGEgYmV0dGVyIHBsYWNlLg0KPj4NCj4+IEFjdHVhbGx5IGRvIHlvdSB0aGluayBodm0u
aCBjb3VsZCBiZSBiZXR0ZXI/DQo+IA0KPiBJIGd1ZXNzIHRoYXQncyBhbHNvIGZpbmUsIEkgZGlk
IHN1Z2dlc3QgaHZtL2RvbWFpbi5oIGJlY2F1c2UgdGhhdCdzDQo+IHdoZXJlIHRoZSBmaWVsZHMg
Z2V0IGRlY2xhcmVkLiBJIGd1ZXNzIHlvdSBwcmVmZXIgaHZtLmggYmVjYXVzZSB0aGVyZQ0KPiBh
cmUgb3RoZXIgSFZNIHJlbGF0ZWQgaGVscGVycyBpbiB0aGVyZT8NCg0KWWVhaCwgdGhhdCBpcyB3
aHkgLSB0c2Nfc2NhbGluZ19yYXRpbyBhbHNvIGdldHMgZGVmaW5lZCBpbiBkb21haW4uaCBmb3Ig
ZS5nLg0KDQpUaGFua3MgYWdhaW4sDQoNCkphbmUu


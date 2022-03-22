Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548DE4E428C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 16:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293536.498657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWg9v-0003K7-Jo; Tue, 22 Mar 2022 15:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293536.498657; Tue, 22 Mar 2022 15:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWg9v-0003Hk-G3; Tue, 22 Mar 2022 15:10:55 +0000
Received: by outflank-mailman (input) for mailman id 293536;
 Tue, 22 Mar 2022 15:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDz8=UB=citrix.com=prvs=07344700e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nWg9u-0003He-5h
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 15:10:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 425d3835-a9f2-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 16:10:52 +0100 (CET)
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
X-Inumbo-ID: 425d3835-a9f2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647961852;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rJ1Xk2Smqnac0gsdG/9UAo8/R8+S4fhGVD96K3UI1Ig=;
  b=FMImZy2x9bdAn7w80XWyxz3EXsoPzkarUXCrjVxDOeCcF9UHiLkRO/+z
   ONnKSjs+C9vHejKGb8yGN9LmNMsSZ5RayqqDBTgWs0kzTnMwVDO835jpw
   Te8qGG6kzLqoEud/S4WWRvzH+f0eH9oy4ygQw1gJTWqFS/sATUz0Mvsyw
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69244296
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:esOCOaDJAGSajxVW/97jw5YqxClBgxIJ4kV8jS/XYbTApGgn1jwGm
 2AaUGrXOKuDZDGge9x0bt/i8RwDu5LQzdVqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhx1
 PAdm6OKEjwJL43Dx90UQxRlTgZxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4fR6qCP
 ZtHAdZpRCvMURlOFnccMYNkteaHnnbzVxYJkE3A8MLb5ECMlVcsgdABKuH9eMGMA8NcnU+ap
 2fP12X/HhwecteYzFKt8X+yh+mJgSLyXqoTEqG18rhhh1j77mANEhQcWF+TqvC/lke0HdRSN
 yQ85S4GvaU0skuxQbHVQxS9qWXCuhMaVMtdF8U77h2Azuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8rzm/JCwUJm8qfjIfQE0O5NyLnW0opkuRFJA5Svfz14CrX2Grq
 9yXkMQgr7UPqJ4l6J/gxnDWoz3zn5HZQzNowQqCCwpJ8ThFTIKiYoWp733S4vBBMJuVQzG9g
 ZQUpySNxLtQVM/QzURhVM1IRej0vKjdbFUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6ex3lMAM9vy/D5g4i+aihLArL2drGwk0OSatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17Qmrghnmz+MFcCkkkv2i+TDDJJwdVvjGAHSBgzexPnZyDg5D
 v4Fb5fao/mheLOWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l6Y8I9NYgJItQ/94wMz7+g1
 ijkBidwlQqu7VWaeF7iQi0yN9vSsWNX8CtT0doEZg3zhRDOoO+Hsc8iSnfAVeJ+pbI5kqIsE
 aVtlgfpKq0ndwkrMg81NPHVhIdjaA6qlUSJOS+kayI4ZJluW0rC/dqMQ+cl3HBm4vaf3Sfmn
 4Cd6w==
IronPort-HdrOrdr: A9a23:o7DTTqAsop+J8Q7lHegIsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsu6KdkrNhQYtKOzOW+VdATbsSorcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj5Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSHGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZgzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUiZ1TChkFxnAic0idsrD
 D+mWZnAy210QKJQoiBm2qo5+An6kd315at8y7CvZKpm72HeNtzMbs+uWseSGqF16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh57D3U3klZKvoMRiKoLzPKt
 MeR/00JcwmBm+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4hjDlhCy8vBrZbQQF++oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="69244296"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdGEGu6tk6FB1jHKd0nejgHG+jQZqM1u7nzPJ+Ar9QLKI0dbcerJhlZe09+hToKFqMnnfbpjGZ0RL86cjv8X9qpHZFc40LDr+SOejAkmo48tQ8CjDNfkCceB4+9eLY784u7+oGpMJgL6Vy3u0J4GFyVs9Dg8/+sBApgEu1Wa3pHV9rj/28oi6yZnKmXXOszRaCfiRRJeD+/jMkFu/XV0RUrhEtJZy0KD/LofeAoKlhx9kSE7w1MVMfwOFvZUdbt/QCQmZyBW2+Szsr+B9fE/MZE+V90UdjP+0ovnjiFJj2OxX5A6nLcVxVy/EatHf+jLuywDWd3Cgse2DAg9BRJICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ1Xk2Smqnac0gsdG/9UAo8/R8+S4fhGVD96K3UI1Ig=;
 b=TKJXOnSZXRvNO3tyI9Icr4qm9fRK6qpcoNPO73i6hU3sOGrZa/6hi+sW5r/tu0V8YhkworHGXMuMQ6u4zaB/znL4wH6eiuYMNZRFIkwJvYX2RcR5dIWF8SosJ1UUBkmKveE+8RehI60WQH+U/IdgO4H/z68IDdhriItHwz6ZhcgR/2twd2ZO0qXT41YJRDbxCCWnUZ5rETZBbhtE84AXyyGBP89QacsurBVTpVAIhMG/3XcxxOrXkm7enfPaSkQcegkfj9KYv7+cNBr//3tT+kfW7V6PlRq17IV8TmyElR6FA69YW8joxPFeHguxDzX53B+9C10yxdMw+kafrbYWeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ1Xk2Smqnac0gsdG/9UAo8/R8+S4fhGVD96K3UI1Ig=;
 b=fZRuz+q4tvDFIHH3TxdBmfkq1/wSUHbd4c5r1aamGjoUZ1bjwl+Ho4UGzBzkPlHNFSQaOavuGtW35CVSQMnOQ6nWk0iy9cQzLIQ7MGMbGq2o/jYYb/xJE6eZQ/YbrnUQwgZOKn6maw5gYAW39NHd/TGnypd22Sg63Vxj6t3CAtI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, David Vrabel <dvrabel@cantab.net>
Subject: Re: [PATCH v4] x86/vmx: save guest non-register state in hvm_hw_cpu
Thread-Topic: [PATCH v4] x86/vmx: save guest non-register state in hvm_hw_cpu
Thread-Index: AQHYPWhtORpQ2jUrTESMnz8fIDv8cqzLgyyA
Date: Tue, 22 Mar 2022 15:10:42 +0000
Message-ID: <72c90101-55ee-b749-625f-004e40bd2745@citrix.com>
References: <a8828d68c308fa7ecbfe4387ca753ee0f80a2a7d.1647897016.git.tamas.lengyel@intel.com>
In-Reply-To: <a8828d68c308fa7ecbfe4387ca753ee0f80a2a7d.1647897016.git.tamas.lengyel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32d0796e-d6f5-4804-8eec-08da0c1621df
x-ms-traffictypediagnostic: DM6PR03MB3866:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <DM6PR03MB38660F801B9CE9159314FB61BA179@DM6PR03MB3866.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IxDsFqiypmQ2cPSuAqOV03Fay2BJZu4UYrAlLR3zhnzrMKBZD4pMDSkjimKh2MVC5iSnUu+y0w251OesDg+syXtTROaPYKNK72bAsbIdPNu5ciVWsckgDgBWQbMId/7snCwJueLXh8iBFJ8GydBX64W3wTrZ0CurkeVCtTm+Wwd+w0Mr5aMD6cfzODGMrw9UYn4cYHdMhJZGhMeVXt4IOgF5EZQdenxYAQdyYmTdFGF2xctZeeoQKuPFZp+rGZcSL9ZM2VnPRPvaRmULJNzeVjSqp4OW9l8zPE3dhd5E0cMtLJjDAvYB6Sl3PlSh6zQyZg6HnEtOO7XrpI6aYZ/ZRXMSpmbM9wqtAdFTNk1Rtcowtz41nKirGEBpYxGXRqY9Q49a757imzVq+pV8w6zP9QCSmapyvd9SUO5KKz5NBpXTphqBhxj/86G6/bjXOB/PFgBnc9InXLTjZDI6A8LZRjvSnhnzctCYYmK/IMnp2y8ICezB/maokXn2QMiud65m+XFl5qnsOP41hYFjNpWKHXRRmTt15nxp46TYg2KDmLtS3Us2ZE3Ebn8ZpC6R4EGv5KloBpIiel8+NDReZ4++270EPUZglPBQNjUnwjieQ8blRwTLH13hkg83aJphYJPmjgrFX/Hr0o16CiilQTEr6WZMk4ZHma/DojZgmJeIV//li/ETZk7eZVC0uSdFCMxewVzieZGHbvv+3w0UQzBBXQTmOmWHCd5twxEV0kTXH2fjmZdDD3v5835Lc4b8ANkwT0OZIj4OLnGI9BSJvNKZeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(54906003)(8676002)(4326008)(91956017)(76116006)(66556008)(66446008)(64756008)(66946007)(38100700002)(66476007)(122000001)(316002)(82960400001)(2906002)(508600001)(6512007)(38070700005)(26005)(6486002)(186003)(83380400001)(5660300002)(31696002)(86362001)(8936002)(53546011)(55236004)(36756003)(31686004)(6506007)(2616005)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnhsZExEZ0JhaGJzSkNnZWRKMjFTYlgzQ1didWtoclBjUU9sWFY5QUswMUdO?=
 =?utf-8?B?dldSanlTd1hYckxWTEpoc09Pay9sZ0gzZm0zdWZyZ0dwMEE1bnlnYklINHQy?=
 =?utf-8?B?OEFrQzltWHdDWHVFUG1MSEdHbUZhMmNNUWNQVE1zQVBSc2c0bmJrTElZKzdD?=
 =?utf-8?B?Q2VZQUFKTkkzNENpR2MvVUZVMzQ5QklNb25oVDBWdFFmbllvRS85MmdvOVhO?=
 =?utf-8?B?WlU5alFNL2lMNm1PWDVad0czNDdWTGorMUdjc282c3BIWks1R2ozQ01malA0?=
 =?utf-8?B?QzVsVGkyTXRrblErNnVOcUtYUUt2TVhoZ2xtZXVIRFU2ZllFd2szWlplTDFi?=
 =?utf-8?B?cjNpd2V2RWMwelkwZHZhb3hSeVgvTzFLZll1eGZzT1p6aFBtMzVnT1p5dFJF?=
 =?utf-8?B?S0Q1TkVETnV6OVFBQUVwL0cyd2thM3BWaG8xL0t6aE5XZFdEb1FFWURBcjB2?=
 =?utf-8?B?RFFRZWNCWDF6TStLOEVTUUtoUS9GQ0N0aDY0cnBFZG5nNCtWay9XU1dBd01E?=
 =?utf-8?B?S2pFZ2swSDNXaXBlNDhRamtONWxqclNRL3pwU1MvRlVxb3U0cWtvN3Y3Y1JY?=
 =?utf-8?B?MENWalFpWmtQUVZ6Z1c2OHZ0VHdsWk9iNlVMVXhqeUgwYzA2N1lwKzVOWi8x?=
 =?utf-8?B?V3RzTE4ySEt6L01sb0xmZjZHeXRUWVRoUXhHa3lDaldVUWtBOHl6Q1lzSGJ4?=
 =?utf-8?B?cjVUVWRMRmVtSXFVYkN3UStFUnhua0JrUk1kRnlucUFnMnY2NUF4Uzg3VDZh?=
 =?utf-8?B?YTBPbkFrbTRnNjVpamx1M1p0NVN0ajRKd3FGamRyTXpLNHQvbGdWWlFuSzhv?=
 =?utf-8?B?Z05EenA1QVpXWlZERGRyci91Tzg1TEhra1RtTWZhN0xrTVk4Q1NsS0wwWDVx?=
 =?utf-8?B?aW0zNjg2dExveURUSTEwNHMyakNFU1IwSWZQbng2YjB0NWhoSWpTODlTZlY2?=
 =?utf-8?B?OUlDcUJiTmJ1R2ZHRHN6MU1GTHd1V2tqd3k3QXFDVXIwaWEwbjd4aGZIWWZt?=
 =?utf-8?B?Q2VNZ0NaTEQ5WG5Wd3FhVGM2SnY4QnhlczlSbmMyeXU5YUU2VkFnWjBtMDI3?=
 =?utf-8?B?Sy9KTy9ubVJDSDNKRnRkN1l0Ny9lSU04bXFpTmZiWmtLMWdKTzA2V3Z4anEw?=
 =?utf-8?B?bHZJYlhtdkkzbCtMR1IrV3FybmJVQVBRYTN1ak9RcC9GcEFITHJCVlB0LzJr?=
 =?utf-8?B?OWhMTnZlbjdoaUc1ZHdFMk5SQkRLVkVWbmc1VjhOM0p3aWt2K2ZCazl0QjA1?=
 =?utf-8?B?STlWbk55WUIzcUptVFJHVFNPc2cybFh1bkhFV3psc0c0VU14V0xzZ2s3bjhG?=
 =?utf-8?B?Zy9tWGRNdFpmVHlsVEFVK2hodXJXVjZ3Qzg3Z2YrU1ovdzk0MGtkK3JFZzNm?=
 =?utf-8?B?Yjcra0xFamRKbVFrK084TWNUN3ZQVEJCY1ZnVFdxQVBYMHgwSzNCN2pyRkE2?=
 =?utf-8?B?ZmVZWjFiQ3NaQ2RodHZvQ1hZd093K2FydWhlUWs5ODBoOEtLRzUrRFQwYUsr?=
 =?utf-8?B?OHJ6TCtMOUpKUWpHNUdtY0h4a2h3ZmlEL0NuMlBvNnVUcWRGMUVYRzlxbjlM?=
 =?utf-8?B?Rm8zRFBBUVZ3SyswTmpNeTVab3l1ZWNnWFM1SVpPd29ZWHhLZ1l3dEFFNlpr?=
 =?utf-8?B?UXF0NHBQVkViOUFZRzk5anFIenMrZDhlalo5SkNxV1ZNRGFjK21iamp5OWlj?=
 =?utf-8?B?WnIreURFcW82dGpUT3ZUYm8raCtDTUtOMC9ueURiV3BuRXA2eVlhQ0hJU1Fm?=
 =?utf-8?B?MWZZenFnbFo2blNaSFhQblBpR1N0a2NzTEp4amJqQjV2TG94bklxT05HdWcv?=
 =?utf-8?B?L1lvUFdCcHR6T1QvVVVhcG1OU09vak04djRtQi9LcGpTazU1UUx0RjVUbFg5?=
 =?utf-8?B?eVRZRE53ZlkwcUNnOEUyRzZhaDYyVXlFQ3BuTG5kS3FoOGpFNFFpOFNDVlgx?=
 =?utf-8?Q?GyyIvM5wePY9Poq5szHOJu0PY5BEdHAg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CFBFC24D79E7E40A9105FF8B02EBE06@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d0796e-d6f5-4804-8eec-08da0c1621df
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 15:10:42.2522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nF+Tixh2xEbX8BcVtzqZhSBp/Tft3utdzNg5u6Nl1ezujWwLFSf4VpxzmLO3+pmveEsxFO6u4JmuzqQo+2spAph/geKC31wgcCjY5SbgG00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3866
X-OriginatorOrg: citrix.com

T24gMjEvMDMvMjAyMiAyMToxMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBEdXJpbmcgVk0g
Zm9ya2luZyBhbmQgcmVzZXR0aW5nIGEgZmFpbGVkIHZtZW50cnkgaGFzIGJlZW4gb2JzZXJ2ZWQg
ZHVlDQo+IHRvIHRoZSBndWVzdCBub24tcmVnaXN0ZXIgc3RhdGUgZ29pbmcgb3V0LW9mLXN5bmMg
d2l0aCB0aGUgZ3Vlc3QgcmVnaXN0ZXINCj4gc3RhdGUuIEZvciBleGFtcGxlLCBhIFZNIGZvcmsg
cmVzZXQgcmlnaHQgYWZ0ZXIgYSBTVEkgaW5zdHJ1Y3Rpb24gY2FuIHRyaWdnZXINCj4gdGhlIGZh
aWxlZCBlbnRyeS4gVGhpcyBpcyBkdWUgdG8gdGhlIGd1ZXN0IG5vbi1yZWdpc3RlciBzdGF0ZSBu
b3QgYmVpbmcgc2F2ZWQNCj4gZnJvbSB0aGUgcGFyZW50IFZNLCB0aHVzIHRoZSByZXNldCBvcGVy
YXRpb24gb25seSBjb3BpZXMgdGhlIHJlZ2lzdGVyIHN0YXRlLg0KPg0KPiBGaXggdGhpcyBieSBp
bmNsdWRpbmcgdGhlIGd1ZXN0IG5vbi1yZWdpc3RlciBzdGF0ZSBpbiBodm1faHdfY3B1IHNvIHRo
YXQgd2hlbg0KPiBpdHMgY29waWVkIGZyb20gdGhlIHBhcmVudCBWTSB0aGUgdkNQVSBzdGF0ZSBy
ZW1haW5zIGluIHN5bmMuDQo+DQo+IFNWTSBpcyBub3QgY3VycmVudGx5IHdpcmVkLWluIGFzIFZN
IGZvcmtpbmcgaXMgVk1YIG9ubHkgYW5kIHNhdmluZyBub24tcmVnaXN0ZXINCj4gc3RhdGUgZHVy
aW5nIG5vcm1hbCBzYXZlL3Jlc3RvcmUvbWlncmF0aW9uIG9wZXJhdGlvbiBoYXNuJ3QgYmVlbiBu
ZWVkZWQuIElmDQo+IGRlZW1lZCBuZWNlc3NhcnkgaW4gdGhlIGZ1dHVyZSBpdCBjYW4gYmUgd2ly
ZWQgaW4gYnkgYWRkaW5nIGEgc3ZtLXN1YnN0cnVjdHVyZQ0KPiB0byBodm1faHdfY3B1Lg0KDQpJ
IGRpc2FncmVlIGhlcmUuwqAgVGhpcyBidWcgaXNuJ3QgcmVhbGx5IHRvIGRvIHdpdGggZnV6emlu
ZzsgaXQncyB0byBkbw0Kd2l0aCBvdXIgQVBJcyBiZWluZyBhYmxlIHRvIGdldC9zZXQgdkNQVSBz
dGF0ZSBjb3JyZWN0bHksIGFuZCBmdXp6aW5nIGlzDQp0aGUgZXhhbXBsZSB3aGljaCBkZW1vbnN0
cmF0ZWQgdGhlIGJyZWFrYWdlLg0KDQpUaGlzIHdpbGwgYWxzbyBjYXVzZSB2ZXJ5IHN1YnRsZSBi
dWdzIGZvciB0aGUgZ3Vlc3QtdHJhbnNwYXJlbnQNCm1pZ3JhdGlvbiB3b3JrLCBhbmQgdGhlIGxp
dmUgdXBkYXRlIHdvcmssIGJvdGggb2Ygd2hpY2ggd2FudCB0byBzaGlmdA0KdmNwdSBzdGF0ZSBi
ZWhpbmQgYSBWTSB3aGljaCBoYXNuJ3QgYWN0aXZlbHkgZW50ZXJlZCBYZW4gdmlhIGh5cGVyY2Fs
bC4NCg0KKFF1aWNrIHRhbmdlbnQuwqAgU2VyaW91c2x5LCBjYW4gdGhlIFNETSBiZSBmaXhlZCBz
byBpdCBhY3R1YWxseQ0KZW51bWVyYXRlcyB0aGUgQWN0aXZpdHkgU3RhdGVzLikNCg0KWGVuIGRv
ZXNuJ3QgY3VycmVudGx5IHN1cHBvcnQgYW55IHNpdHVhdGlvbiB3aGVyZSBJbnRlbCdzIGlkZWEg
b2YNCkFjdGl2aXR5IFN0YXRlIGlzIGFueXRoaW5nIG90aGVyIHRoYW4gMC7CoCBUaGlzIGluIHR1
cm4gaXMgYnVnZ3ksIGJlY2F1c2UNCndlIGRvbid0IGVuY29kZSBWUEZfYmxvY2tlZCBhbnl3aGVy
ZS7CoCBBbiBhY3Rpdml0eSBzdGF0ZSBvZiBobHQgbWlnaHQNCm5vdCBiZSBiZXN0IHBsYWNlIHRv
IGVuY29kZSB0aGlzLCBiZWNhdXNlIG5vdGFibHkgYWJzZW50IGZyb20gSW50ZWwncw0KYWN0aXZp
dHkgc3RhdGUgaXMgbXdhaXQuwqAgV2UnbGwgYWxzbyB0ZXJtaW5hdGUgdGhpbmdzIGxpa2Ugc2No
ZWRvcF9wb2xsDQplYXJseS4NCg0KTmV4dCwgQU1EIGRvZXMgaGF2ZSB2YXJpb3VzIGZpZWxkcyBm
cm9tIGludGVycnVwdGliaWxpdHkuwqAgSWYgeW91IHdhbnQNCm1lIHRvIHdyaXRlIHRoZSBwYXRj
aCB0aGVuIGZpbmUsIGJ1dCB0aGV5IHNob3VsZCBub3QgYmUgZXhjbHVkZWQgZnJvbSBhDQpwYXRj
aCBsaWtlIHRoaXMuwqAgQU1EIGRvIG5vdCBoYXZlIHNlcGFyYXRlIGJpdHMgZm9yIFNUSSBhbmQg
TW92U1MsIGR1ZQ0KdG8gbWljcm9hcmNoaXRlY3R1cmFsIGRpZmZlcmVuY2VzLCBidXQgdGhlIHNp
bmdsZSBJTlRFUlJVUFRfU0hBRE9XIGJpdA0KZG9lcyBuZWVkIG1hbmFnaW5nLCBhcyBkb2VzIHRo
ZSBibG9ja2VkLWJ5LU5NSSBiaXQgd2hpY2ggaXMgZW11bGF0ZWQgb24NClNWTSBhbmQgb2xkZXIg
SW50ZWwgQ1BVcy4NCg0KTWlub3IgdGFuZ2VudCwgYmxvY2tlZC1ieS1TTUkgbmVlZHMgY3Jvc3Mt
bGlua2luZyB3aXRoIHZtLWVudHJ5DQpjb250cm9scywgc28gSSdtIG5vdCBzdXJlIGl0IGlzIHNv
bWV0aGluZyB3ZSBvdWdodCB0byBleHBvc2UuDQoNCk5leHQsIGl0IHR1cm5zIG91dCB0aGF0IE1T
Ul9ERUJVR0NUTCBpc24ndCBpbmNsdWRlZCBhbnl3aGVyZSAobm90IGV2ZW4NCnRoZSBNU1IgbGlz
dCkuwqAgSXQgaXMgaW1wb3J0YW50LCBiZWNhdXNlIGl0IGZvcm1zIHBhcnQgb2YgdGhlIFZNRW50
cnkNCmNyb3NzLWNoZWNrIHdpdGggUEVORElOR19EQkcgYW5kIFRGLg0KDQpOZXh0LCB3ZSBhbHNv
IGRvbid0IHByZXNlcnZlIFBEUFRScy7CoCBUaGlzIGlzIGFub3RoZXIgYXJlYSB3aGVyZSBJbnRl
bA0KYW5kIEFNRCBDUFVzIGJlaGF2ZSBkaWZmZXJlbnRseSwgYnV0IHVuZGVyIEludGVsJ3MgYXJj
aGl0ZWN0dXJlLCB0aGUNCmd1ZXN0IGtlcm5lbCBjYW4gY2xvYmJlciB0aGUgMzJiaXQgUEFFIGJs
b2NrIG9mIHBvaW50ZXJzIGFuZCBldmVyeXRoaW5nDQp3aWxsIGZ1bmN0aW9uIGNvcnJlY3RseSB1
bnRpbCB0aGUgbmV4dCBtb3YgaW50byBjcjMuwqAgVGhlcmUgYXJlDQpkZWZpbml0ZWx5IGJ1Z3Mg
aW4gWGVuJ3MgZW11bGF0ZWQgcGFnZXdhbGsgaW4gdGhpcyBhcmVhLg0KDQpTbyB0aGVyZSBhcmUg
YSBsb3Qgb2YgZXJyb3JzIHdpdGggaHZtX2h3X2NwdSBhbmQgSSBiZXQgSSBoYXZlbid0IGZvdW5k
DQp0aGVtIGFsbC4NCg0KQXMgZGlzY3Vzc2VkIGF0IG11bHRpcGxlIHByZXZpb3VzIFhlblN1bW1p
dHMsIHRoZSBjdXJyZW50IGxvYWQvc2F2ZSBtZXNzDQpuZWVkcyBtb3Zpbmcgb3V0IG9mIFhlbiwg
YW5kIHRoYXQgd291bGQgYmUgdGhlIGNvcnJlY3QgdGltZSB0byBmaXggdGhlDQpvdGhlciBlcnJv
cnMsIGJ1dCBpdCBwcm9iYWJseSBpcyB0b28gbXVjaCBmb3IgdGhpcyBjYXNlLg0KDQoNCkF0IGEg
bWluaW11bSwgdGhlcmUgc2hvdWxkbid0IGJlIGEgVk1YIHNwZWNpZmljIHVuaW9uLCBiZWNhdXNl
IHdlIGFyZQ0KdGFsa2luZyBhYm91dCBhcmNoaXRlY3R1cmUtYWdub3N0aWMgcHJvcGVydGllcyBv
ZiB0aGUgdkNQVS7CoCBJdCdzIGZpbmUNCmZvciB0aGUgZm9ybWF0IHRvIGZvbGxvdyBJbnRlbCdz
IGJpdCBsYXlvdXQgZm9yIHRoZSBzdWJzZXQgb2YgYml0cyB3ZQ0KdG9sZXJhdGUgc2F2aW5nL3Jl
c3RvcmluZywgYnV0IHRoaXMgbmVlZHMgZGlzY3Vzc2luZyBpbiB0aGUgaGVhZGVyLCBhbmQNCm5l
ZWRzIHJlamVjdGluZyBvbiBzZXQuwqAgQW4gZXh0cmEgY2hlY2svcmVqZWN0IGlzIDAlIG92ZXJo
ZWFkIGZvcg0KZm9ya2luZywgc28gSSBkb24ndCBmaW5kIHRoYXQgYSBjcmVkaWJsZSBhcmd1bWVu
dCBhZ2FpbnN0IGRvaW5nIGl0Lg0KDQpJJ20gbm90IHN1cmUgaWYgd2Ugd2FudCB0byBpbmNsdWRl
IHRoZSBhY3Rpdml0eSBzdGF0ZSBhdCB0aGUgbW9tZW50DQp3aXRob3V0IGEgYmV0dGVyIGlkZWEg
b2YgaG93IHRvIGVuY29kZSBWUEZfYmxvY2tlZCwgYnV0IEkgdGhpbmsgREVCVUdDVEwNCmRvZXMg
bmVlZCBpbmNsdWRpbmcuwqAgVGhpcyBpbiB0dXJuIGludm9sdmVzIHRyYW5zbWl0dGluZyB0aGUg
TEJSIE1TUnMgdG9vLg0KDQp+QW5kcmV3DQo=


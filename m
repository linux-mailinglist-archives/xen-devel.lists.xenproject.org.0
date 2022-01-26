Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5AE49CBEC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 15:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260938.451256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCj1a-0007LE-VZ; Wed, 26 Jan 2022 14:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260938.451256; Wed, 26 Jan 2022 14:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCj1a-0007I2-S5; Wed, 26 Jan 2022 14:11:50 +0000
Received: by outflank-mailman (input) for mailman id 260938;
 Wed, 26 Jan 2022 14:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCj1Z-0007Hw-DG
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 14:11:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5230daf-7eb1-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 15:11:47 +0100 (CET)
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
X-Inumbo-ID: e5230daf-7eb1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643206307;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=O0VPRRIR7g94oQYfkrE2T0t+ndBvrkeDXsZBZcV8i/8=;
  b=hE7WygAonAVYTny1WaCS/MO9ATEklden2Isq0yV0Z3kHMyDmQnFZEsdV
   rjPUPmoOq+bKHwywttgZjKbd42hSztfhgXLw90C82mXtqiNJYIRMohYsR
   OXPxzMhMnKJyWbvSdzTmhBxYJD9/OWMJCzBkaq7IqCXJYRqoNTu1hoIaU
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HgXj5yys1vk28GxWA93o5P9/XUaCFluh9EmjtoUIivJByqn2+cpYU/nfPpLdBZ7301MNAyez6Y
 CuD3o90rDori6HBcDefvKf2hGXqsFOjz3MGrhXSH4pcXo9fejeYX/Yr8OA4yaAAozWuIw/7pof
 UQB0dX2Jc0pyhnGqMlA3A3br8edmWCnrCfltmIVa+eiP92nuvuzO7czZ6P1bj1lJqxTuAMfxdh
 zVQJ8m3JdF9tZRGd0PuYDqI91DO3c75+OKe0B4cgu4VDnnVae+24rYY+zU8e+N6qWP0JXdUn12
 wmLEnYV3k79fZWioJyvMNgov
X-SBRS: 5.2
X-MesageID: 62801743
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:29fG4KtWrkUFb9mduih/PZD9W+fnVLtZMUV32f8akzHdYApBsoF/q
 tZmKWGAO6yONDejfdkjPYvloE8CvpCAyYRkTFZvrChkEH5H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltaeBcj9xM4T2w+00YURcNio9P5AYweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 ZpBMGUzN3wsZTVuOXwXGYkdzd7xqSLWbS15sVOfl/s4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+0B2Tq1kqf92V2QL1pZShtKK94b6vZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQmzARVodt/xory9U
 J4swZn2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZ9fJGG1P
 BKD5mu9AaO/2lPwPMebhKrqU6wXIVXIT4y5Bpg4kPITCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXMCv9JcPJ7fde2KL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX8RrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:+3DDJq8U7OFyGmhPpW1uk+F+db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQ0dcdDpAtjlfZtFnaQFoLX5To3SIzUO31HYbL2KjLGSjQEIfheeygcz79
 YZT0ETMqyTMbE+t7eG3ODaKadi/DDkytHSuQ629R4EJmsGC9AC0+46MHfgLqQffngaOXNTLu
 v62iMznUvYRZ1hVLXcOpBqZZmnm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k7Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXUISaCUmRIXee
 v30lEd1vdImirsl6aO0EPQMjzboXETArnZuASlaDXY0JbErXkBerR8bMpiA2rkAgwbzY1BOe
 twrhGkX9A8N2KxoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIZLH4sJlOw1GkcKp
 glMCgc3ocgTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNzd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDnRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dgv22J6IJ84EUaICbRBFreWpe5fdI+c9vcPEzc8
 zDTK5rPw==
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62801743"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgyPRqjRuTl8lDauI8OB4KxTKsC23Pb+792olYQZn+cacuF8hbcofzA/Wts9n/54JOnQHvWezvm/1ZK40RhElyMLvbOXOgBUQJIXaQ7Gn01MuIKjLNccfMMmbXu7kqyD6VKt/fywvpjZ5Ru3OoAiIVMJqFA++hQ/gMypncA+v/h6os5gJEd38D7tTkzgESy2FcTtQMr0xPRK6sUBw4pQpGricWU05ohP6pG0KtHZrk9phBaaho1TQQ57sJYZ8Tt1xTVBKEQDzk2zZB8f+UZj5+4GdY2G3j5GjAPIsOzlrrRwODqyiCJp5QCPvKRJ/ApcNr5RaFL+UuUUAzEmRvs0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0VPRRIR7g94oQYfkrE2T0t+ndBvrkeDXsZBZcV8i/8=;
 b=Fg0RIjRvFs1YFoiPS98IRcfWtqN89+f0KCdJH+kFf4KhRIzY24D87cnCgpd85LzRSr82jpa5eWyFu2eZuZXCFQDag61CRJyW1j36Z5nIKbNySFMffIkC/hDGNd+CFkAjPzEKna6LKc1K9Qo7ZB375GuF/S1rFXDv4DYVSDQP29/CQSe/Zh7G7aiwdaAiQJemgIewLuqapvOesTPIhzxdsuyeyHqeIG4FSbH0q6t9elWwmvSiPOUtOvVLeVguWYFRMr5Wnp270jiIgs9bWg6u732AzxqTYyEdnau6OtacmXa5rRobSYfclEkbowQBj2IlXu7szoQDGPeGTY9c8ymGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0VPRRIR7g94oQYfkrE2T0t+ndBvrkeDXsZBZcV8i/8=;
 b=tK6FQLJ6GZXUW3xc072ENacAJE1LMkgqecAY0k6yVtrW4oeLkvRRJ2LGGjZVpXbjsYhpOiE7x82vXL79xg45tkEBu2AhziNpkJ24OsO40UWc4mViRLqWZbPetz8DIpoDBzV6GFlOaCP83jgM5oCmDuy+cfAM/QIsw4TNp9T5p7g=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Thread-Topic: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier
 during boot
Thread-Index: AQHYEpEIIirjIKT/SEuiwA9Vczaqaqx1P8uAgAAO04CAAAK1AIAABtCA
Date: Wed, 26 Jan 2022 14:11:40 +0000
Message-ID: <963deb3c-5ee8-1d11-e315-8c0c9a1e0fce@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-3-andrew.cooper3@citrix.com>
 <YfFCLxnGDeuk/va0@Air-de-Roger>
 <0d457a94-64bc-bbd4-e7ce-59c3b1c1d2f4@citrix.com>
 <5de84014-b1a7-7ddd-70e1-9aadf0387ee1@citrix.com>
In-Reply-To: <5de84014-b1a7-7ddd-70e1-9aadf0387ee1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e7a3a64-4bd9-417a-8a8c-08d9e0d5c5fc
x-ms-traffictypediagnostic: BN7PR03MB3668:EE_
x-microsoft-antispam-prvs: <BN7PR03MB3668805AF93103E2C75C7528BA209@BN7PR03MB3668.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hBt+8b9heJK91kGwLN26sO2wUfs07wLBTO1Ix+sk3/Uf7J0kjjWnLlwEM/GvmSUW/68829G88bOuRQ5SMEobwdwv2S5Cf3+TbCUYUiNy/0BOkR6CFGS/paiQmvfBiaDlvNor6lhvtWcpd4ptiR37MDSJMOS0Q9JH5s2yFrtlbfHep+6CovYG5mY2xa77xv/JhUGkxsmG9SxdR0ueGL2FB1TJrQyHHXlQlf9g5TPcPnr+csT6ZGP0+ChWpdLO0NXEz6oD20LWO7c86HGW1Fg2L95GrATaffHdjql2wIbfLDkneTc4ov4diCb6hkpQ/4+aeBtO7k5Yyqajx5JHeEFjYUHpV4Z9QMgAEt2JhA3lPtgoC/Y6HfXvG2lzgO/6uBflsPuD0zEq8IlWEKOvgeaWqwwRK+FTJc12exFCyddx4zL9vJ1Wo9tjH8lxNXYngeOzxc4+Bmt/TUxhzs0iQazV5CmDeQdIz8UQUtbhr86y5fp5XzUaf3FILAHYVm98pdPhNrXl8aXwMuqQ67Hgh/A36jJ5LW67fflJO26z60150tfVLnU2dlLc+ORDqafaBXuRf0TW35q7vvuT5SyYBBZ88Y7KIFQ9NzbAC7YEqU23PWyTsN+8MmT/zGXSqgPoMz0tsYAST3JHfwJAgIJYNrGaiou2djJhmqekiD/F2UJoSTD9UzQpnCeMZXDwMw6gCssc/JnNp1ClYwikLaMJu8m5TZHjL7bGoXosKG6eIoaBQBkdHbmARsL+88zqQSdae1IxAMfPQ0t+9aGDUvWVITix3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(91956017)(508600001)(54906003)(37006003)(6486002)(36756003)(316002)(71200400001)(186003)(6636002)(66556008)(66476007)(26005)(31686004)(76116006)(66946007)(2616005)(64756008)(66446008)(82960400001)(38070700005)(5660300002)(122000001)(6512007)(6506007)(53546011)(8676002)(6862004)(86362001)(38100700002)(8936002)(4326008)(31696002)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dU1VME9ienpuTEdGUUI4V255Rm92VlNBN29jcjhKOFYxSnVoaC95R2ZtSlpG?=
 =?utf-8?B?RUJ2L1QrVE9kTWRFM1laWEJLdE53eXcrL250SWYwWVpZUCtYbEdaVHcreDNx?=
 =?utf-8?B?MWtOVEI3RGE0QTF1eVZsRStGV3RmamlVK3p5ejl6VXpaQ050TitDWHVFeEtY?=
 =?utf-8?B?VU44c21rZ2hXQ3BBQTIxU2s1Y21UUm1VdHhQUGdVVlhSbU9iS3lsdVU4MmE2?=
 =?utf-8?B?VGNZYkYrdHR5bVZKaEpKRy9Tc2phcmVnVTBESUgwbVZwcDN0WkpORFk4a3Fj?=
 =?utf-8?B?NSt6MFlZRjlOWCt4YmxvZVJ6cmc3TzBhdGhDYXZTN0hxMUN3dHhubjVOK3hW?=
 =?utf-8?B?UURiakh0Tjh6M3phb3NGak12MXN0QlBCZW9GK2lzcHNoSVlVV1h5d21IU0RB?=
 =?utf-8?B?UlJOUThqN1FqL1FjS2NQTUJZNEpLVjY2dER1dnl3UUlreHM1OUwxVzlrM29Z?=
 =?utf-8?B?ZFhjNEFic0pPaXlKdVRrZm81b1RzWEdsa2srR0NuRVN2STBzYmxCUlVCeGlX?=
 =?utf-8?B?QnR1N2ticnJlcHpjMGViUEdKcWFwQzI4V055MWs5bE1qNlhoRVFKM3JHaXZK?=
 =?utf-8?B?My9DMWZjQmxibkpxWjdqTzJ0TEJpZUtya0pYekdSTWp4V0UvUkVFRzVQUVF3?=
 =?utf-8?B?ckxKWUZYNFBsVFg4cDZWekhFNEREdm55T3ZZKzJTMm1XKzI2T0Vna2ZrQkcv?=
 =?utf-8?B?REl1RWFrZSt2Y1EyT1UzRW1wOUFhc2hGOGUzRzhHb2RqekJiZG4zNjZIc3BK?=
 =?utf-8?B?dDA1ayt6OEpTN3U2QU5KYmluVDFwaXFhaFVwSTRRYjdjV3owbSt2Z2h3STV0?=
 =?utf-8?B?L1FYc3RGS05uR0J2ZFBLWW9WR1hMUEVhY05KV3o0YW9tNzdTU0hHTGRnWC9z?=
 =?utf-8?B?TVp4NzVKR29iQzNFSjVDcEhxWEd5WFlNSE9IODQ1eXppdEQrYnRaVVNQYTR2?=
 =?utf-8?B?eU1XY2hGWk1JbUp0SFBNcTg3c0NUbUNYYmVNRUxoaWxZT3Z1WkhwKzl0bEdy?=
 =?utf-8?B?ZksrdTZWaDdEZlA3Ty9LWnI5dmFhQm1Xb0NFUnBFd1lDNW5Wa05zY0JWUnA4?=
 =?utf-8?B?blk2OVNrOW9SbE9iYmR4SnlBRjgzaDVDb05kR3kxL2xEei9lRmFJTElaRlNu?=
 =?utf-8?B?OFpxajVlakZrd3R0K0F3QzBESGhyUVZjZHlpTFQ5QlJXVjdwNG9Mb0tBRktz?=
 =?utf-8?B?cStDeVJVVUxmdjFRVzBJakF6bGFkY3MyMjJNK29ldEIxUVlJdU5oY0lZS0Fw?=
 =?utf-8?B?S2xoc0pjQ3lEZUtjbXZ5SFlSWllEOTF1R2kwUi9ZZldUS0poZWlhZy9DN0dF?=
 =?utf-8?B?a3BEZWk2aHpLQk5WZVFOb1ZJY1BnWC9aKzRkK0xEUGh2R1hWbmM2b0tBME1i?=
 =?utf-8?B?enNQR2kvaEI2U1cvWWlxNTFNOFc4MkhlbFl4amk0VTA1NlFRQTBoSlp2TTB6?=
 =?utf-8?B?VVZvb0xVa0lzQzFDZkRmdlBZREtLeGN1QnZKL0k1YVZVbFpWblY2ZWdIc1FT?=
 =?utf-8?B?VWdMMzdkUmU1cFV1a2RlODBEWWpJZGFraTNaY3F3eVdkU3JDVVRqbWZYTkRN?=
 =?utf-8?B?VmFPby9HTmFBMmd5UXo1Y01zYWx6QjZPTXpCSHE3Mlg0L01CZnFXd0V4RHQ5?=
 =?utf-8?B?MUJLRWZzUFlFayt6WDA1cm5CTEE4R1ZDV2k1NjJqNVVBOHoxWG1ma3FFUGJK?=
 =?utf-8?B?alBXa2xQbmNFWU1aa0xwVm9LajB4aFBKY0tWcDN1dGZWN0Nka0I0RUw2WGo5?=
 =?utf-8?B?RGllR2tSS3NSbWorNE95VnZVZnRyeUhGRzdQNmhhYVVZb3g4ZkgrMTVMR2da?=
 =?utf-8?B?cHJtb1NkQW1TY1MyU1FGdGpUbEg2YU8xTVJuSEwyOVM0Q0g2UjY2OExpRWRm?=
 =?utf-8?B?TG5nQlpQNURUa2ZmUHc0a0NsdWpHcEJML0JJZC9kb2o1Wld6WDVXekxZVUZL?=
 =?utf-8?B?VnJmSnZkaW5yQTRNZTVHNVliYWJXRVB1QXg5L2luNE5WenFzeEpiTllCcFRi?=
 =?utf-8?B?M0VLSWQvcUd1WFdzMTB1Zzg1WmU5c2wxODM1Sy8yN0JOZzZLYmIrT1g0TE1J?=
 =?utf-8?B?ZnIyVXVUTWlnbHV6WmxBRVRzRnk0Q2pTQlBhY3hXSndDVjJ5aE9DZHcyVERp?=
 =?utf-8?B?Y1RMVzV0OVVWZENmbkI4TGc1V0Ezak1wTlNjNlk5WkFkSUw0ak90SjRZbDlh?=
 =?utf-8?B?aFN3THJHVUdZWmNxR1VZUk5adFBMVVlPb2M1cFh2eVNKbmpwZVlTNVpwOW9Y?=
 =?utf-8?B?OTkrUis3a0UrWXRlT2ZHZXJSc2JnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05DDC3687A886E44B6D1A2A9F5054068@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7a3a64-4bd9-417a-8a8c-08d9e0d5c5fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 14:11:40.2860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDvz61I0SKrK6Z2nYjoHv92elTfV+057a1n8CnfWhgWFDPG/F7vSmM9bc3Qla/tLwPErH1tw0ZG3IR/VyA4+mZ0YeLZ5EdkOLxqdWCogums=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3668
X-OriginatorOrg: citrix.com

T24gMjYvMDEvMjAyMiAxMzo0NywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjYvMDEvMjAy
MiAxMzozNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDI2LzAxLzIwMjIgMTI6NDQsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gV2VkLCBKYW4gMjYsIDIwMjIgYXQgMDg6NDQ6
NDZBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+Pj4gQWxsIEFNRCBJQlJTLXJlbGF0
ZWQgZmVhdHVyZXMgYXJlIGluIENQVUlELjB4ODAwMDAwMDguZWJ4LiAgQ29sbGVjdCB0aGVtIGlu
DQo+Pj4+IGVhcmx5X2NwdV9pbml0KCkgc28gaW5pdF9zcGVjdWxhdGl2ZV9taXRpZ2F0aW9ucygp
IGNhbiB1c2UgdGhlbS4NCj4+Pj4NCj4+Pj4gUmV3b3JrIHRoZSBleGlzdGluZyBsb2dpYyBzdHJ1
Y3R1cmUgdG8gZmlsbCBpbiBjLT5leHRlbmRlZF9jcHVpZF9sZXZlbCBhbmQNCj4+Pj4gc2VwYXJh
dGUgb3V0IHRoZSBhbWJpZ3VvdXMgdXNlIG9mIGVieCBpbiBhbiBvdGhlcndpc2UgMHg4MDAwMDAw
OC1zcGVjaWZpYw0KPj4+PiBsb2dpYyBibG9jay4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+PiBSZXZpZXdlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4NCj4+PiBJdCB3
b3VsZCBiZSBnb29kIHRvIHVwZGF0ZSB0aGUgY29tbWVudCBhaGVhZCBvZiBlYXJseV9jcHVfaW5p
dCB0bw0KPj4+IG1lbnRpb24gaXQgbm93IGFsc28gZ2F0aGVyIHNwZWN1bGF0aW9uLXJlbGF0ZWQg
ZmllbGRzIGZyb20gQ1BVSUQgaW4NCj4+PiBvcmRlciB0byBkbyBlYXJseSBzZXR1cCBvZiBtaXRp
Z2F0aW9ucy4NCj4+Pg0KPj4+IEkgdGhpbmsgeW91IGNvdWxkIGFsc28gdXNlIGJvb3RfY3B1X2Rh
dGEgaW4gc3BlY19jdHJsLmMgcHJpbnRfZGV0YWlscw0KPj4+IGluc3RlYWQgb2YgZmV0Y2hpbmcg
YWdhaW4gdGhlIGNwdWlkIGxlYWZzPw0KPj4gSG1tIC0gSSBtYXkgaGF2ZSBhIG1pc3Rha2UgaGVy
ZS4NCj4+DQo+PiBCb290IHRpbWUgQ1BVSUQgaGFuZGxpbmcgaXMgZ2lhbnQgbWVzcywgYW5kIEkg
aGF2ZW4ndCBoYWQgdGltZSB0byBmaW5pc2gNCj4+IG15IHdvcmsgdG8gbWFrZSBCU1AgbWljcm9j
b2RlIGxvYWRpbmcgZGVwZW5kZW50IG9uIHhtYWxsb2MoKSwgYWxsb3dpbmcNCj4gU29ycnkuwqAg
SSBtZWFuICJpbmRlcGVuZGVudCIgaGVyZS4NCj4NCj4gfkFuZHJldw0KPg0KPj4gaXQgdG8gbW92
ZSBmYXIgZWFybGllciwgYW5kIHJlbW92aW5nIHRoZSBlYXJseS9sYXRlIENQVUlEIHNwbGl0Lg0K
Pj4NCj4+IEhvd2V2ZXIsIGluaXRfc3BlY3VsYXRpdmVfbWl0aWdhdGlvbnMoKSBpcyBjYWxsZWQg
YWZ0ZXIgbGF0ZSBDUFVJRA0KPj4gc2V0dXAsIHNvIGU4YiBzaG91bGQgYmUgc3VpdGFibHkgY29s
bGVjdGVkLsKgIExldCBtZSB0cnkgdG8gZmlndXJlIG91dA0KPj4gd2hhdCdzIGdvaW5nIG9uLg0K
DQpBbmQgdGVzdGluZyBzaG93cyB0aGF0IGV2ZXJ5dGhpbmcgd29ya3MgZmluZSB3aXRob3V0IHRo
aXMgcGF0Y2guwqAgSSBtdXN0DQpoYXZlIGhhZCBzb21lIGJyZWFrYWdlIGR1cmluZyBkZXZlbG9w
bWVudCB3aGljaCBoYXMgcmVzb2x2ZWQgaXRzZWxmIGFzDQpwYXJ0IG9mIGNsZWFuaW5nIHRoZSBz
ZXJpZXMgdXAuDQoNCkFueXdheSwgSSdsbCB3aXRoZHJhdyB0aGlzIHBhdGNoLg0KDQp+QW5kcmV3
DQo=


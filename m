Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160164C12C9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 13:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277365.473830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMqpT-0000PV-Dp; Wed, 23 Feb 2022 12:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277365.473830; Wed, 23 Feb 2022 12:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMqpT-0000N3-AA; Wed, 23 Feb 2022 12:33:11 +0000
Received: by outflank-mailman (input) for mailman id 277365;
 Wed, 23 Feb 2022 12:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMTg=TG=citrix.com=prvs=046033a78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMqpS-0000Mx-69
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 12:33:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0380aed-94a4-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 13:33:07 +0100 (CET)
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
X-Inumbo-ID: c0380aed-94a4-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645619587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1Wetn+zddTJITpG8eRN2BGHMe/qZpbS3LX2iByw6EHY=;
  b=cWjDkJ5PXOyeCDfHnlubF2dc31o2Gz2NJNM8sW6P0gYfh6aHUZdvd+2G
   uIKVyNuY8cuCdEPK6aEf+X+y6N0F2XG5lbI8/JH/aDX/DSpGJYjGFOG3V
   ao8mGEik5XBi9LnhHx0mqTBdaAEil/DgMjFg96IyZK9BUglIzDRLCWTPE
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64805068
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ptcQAawYHrn08QnTwGt6t+clxirEfRIJ4+MujC+fZmUNrF6WrkUHm
 GIZUG3SP66NZzH8eYxzYI6yp04Bu8fSnIAwT1Zo+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy24PhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplj7qBVDkmPof1qt8dXkJnCRF+MKJk5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5pBNGIxPHwsZTVjFQZGEIMHv9zxg2PDImJpl3y34po4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9cc2Ryzxar+2jSiBmVfcSRxaNEpltBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZT2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1b5tZJ2e5O
 hOM6Wu9AaO/2lPwMcebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGNr9ZIdAhSdSJT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:RfFN9q+3nNB3z/oIF1Fuk+F2db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFrrX5To3SIDUO31HYYr2KjLGSjwEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadg/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHzWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mEryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczAgNl1mpDs1L8Zqq
 iJn/4SBbU115oXRBDynfLZ4Xik7N/p0Q669bbXuwq6nSWzfkNENyMIv/MmTvKe0Tt7gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvt3+9Pa1wVR4S0rpXWN
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcjW2He4OSMTeuOb0oAiPvE=
X-IronPort-AV: E=Sophos;i="5.88,390,1635220800"; 
   d="scan'208";a="64805068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBuwGofTIRDemmoqwuT9LZpFne1P4sgX5MSVXEGIbj2bnQdc3xGgKt5gWUDlaPi2gJlh3dQKXKctWEKHswE+sywNoDxbfO79t1hkXgg0gyw8G3CybL6uzZXqBjpsDGx5+3efWkKEZS5kKwbJztIBnAEoHCBVZt0eE5mklqSjaXES4P59hSrjUY1rZwMcvkyqOrAWi9Rtpff0sE3GodRqls2/sDCVeSSRFlgc1scWrR2IMn195eIQ7ia6j9u1VglxXuSuApX6WRchbFg6suV/Rcv2zogEXz0U5cllc7ajB5lw6Xt6PxymCtc/4MhMQalpX+TPfVZCxSbAg93/hJvzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Wetn+zddTJITpG8eRN2BGHMe/qZpbS3LX2iByw6EHY=;
 b=ZJsSuQMPwby0hq9JQWbS9zpai4H70XaMGsZstJEgDfrgwDaPyoIVhkEb/W4h0AKh697ApN0Tg++XkNtB+GQ8QigYMUfKpgPFzLmn2af4Ym65pT1z3IQvtKo5IZDgJ8d7K0M5ie/li+4+valmajO8paMMsklfP6/CtvRORYdAC6oM36bvogj/j06WiMFRY8EHzDiMnZUblEieni6A+o/aoLDdZyTW7lz6OG7JnYdxGO8MF6qcUDcWQZTgurckLcD48Mvgu1kphJAdq8ENCn74Ia3SgZKlv2BLrx2fDyZILfqm6BTjbshdmLSAD26uqdKUj502xv0LrOecm1VmeplYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Wetn+zddTJITpG8eRN2BGHMe/qZpbS3LX2iByw6EHY=;
 b=HAN276tSslO8dw0W5Q6thTsaY3ISglZsPreZ63awx72pVDPpcw7F8EDHpp+cb0ZufWsU6P640z+58q9JOkuXLnkhQK+jL5+2rNHOzMw4IEOqL8sGS5E/PADQM85X84UsLD0QXpift9C9XZxpnbXCLlqcKu/w382BvPkNhBx+A5c=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] x86: correct fencing around CLFLUSH
Thread-Topic: [PATCH 3/3] x86: correct fencing around CLFLUSH
Thread-Index: AQHYKJ4ejcG5b0mVokmgaQG/G3Z+sqyhEcAA
Date: Wed, 23 Feb 2022 12:33:00 +0000
Message-ID: <e81ea521-b0fb-e1b8-5db8-025d35077cc3@citrix.com>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
 <7026f7df-1f70-0018-a6eb-b7e043b279d8@suse.com>
In-Reply-To: <7026f7df-1f70-0018-a6eb-b7e043b279d8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46bcadbc-128e-4e9d-fbfb-08d9f6c8a122
x-ms-traffictypediagnostic: BN6PR03MB3060:EE_
x-microsoft-antispam-prvs: <BN6PR03MB30608B0B8F460EF4C0B067AFBA3C9@BN6PR03MB3060.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lczfjsMMkvL7o4zPD03UAJhmwNvadLVKVHlqW/vGCAjkFbF5JoJ3DDFXD+wwJpaYd71DFhqX+mA6IXtdhL7PJm3oYt/2gGH559MsnH8aU7VcKw2ArsNArnTJLMs+2yP61RO3b9gll3j+6d6L3EqOBcd/oLaUBGsIsv87ntCSgG3ycrGpX0bb3oJvfFFzz3vi4CZbhlMVssNUXHJYK5+sGKBdXOzamA0/Cx7UAa4js3CYGctsq56KeI15OJcVsdwGJn8aEyQyN3SG4D9IoAs2uu3rn3vSIF9XIC4+7tOJZdckzBit7turnz5CiDoASrGtpNoOBe9BxVRWafVPcVig1JzRYMyI2F926KgiT/m16GeVU8dpkLbdxNLsBfzxjY5+p9UlT6Ie4Wck9AJv3/C7zJAbBSuq4xv27K0E4JF+LtGiFjRsD7iPRAud+CPZyPnieTptIPEm54QJ5my6M0xxK8pYuBETtpfsjmZrlEXAeH+IUr4htMArX8wI2HgrTYlrxiz8qci7v92z+OldDxZau8ZSJgvcOSGZMi4x8H6OvN74WD+Uu6q1msRDw1o2hSUXfAG077uUlo5b4tzYiNcQ0qvvO0+Cm+EGpgvxpJD0fcLXSmg6SnrqhMJ7WavSnOkh9iKpOjScYBmuC4Rqt9rZL0VjCFEVCrmJM3bm5XDdkTLkT5Vo71tGtqfAeXDPh9yf7Saga1GdEknDXfk16qjTTenTUPp0aXnjeIKUExT8TCyWiANJolmX8xbi0THUb7Q/Om8VVPa2a/7+lQWqbhH4HA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(86362001)(31696002)(508600001)(31686004)(26005)(6486002)(91956017)(186003)(5660300002)(8676002)(107886003)(71200400001)(36756003)(64756008)(66556008)(66446008)(76116006)(66946007)(4326008)(2616005)(66476007)(38070700005)(53546011)(82960400001)(6506007)(2906002)(54906003)(110136005)(122000001)(6512007)(38100700002)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWRJQ1FMeTBKa1ZUcEhKNTlzYjNRamk2TllkVzJ3UW1jZXJXdjc5Y2pYem13?=
 =?utf-8?B?YmlKNkw1Qjd0ZFZ5NTVqTUNlU2VkZEtxU1BZZURvcW41TFRtMHFIZzhTNGJr?=
 =?utf-8?B?dlEyOGZXSTBoMnNuSlpBTHlNK2tYRXpxbEQ1NjVncHpLN2ViM1pMUk52SWhy?=
 =?utf-8?B?QTViallJZDM0YVlQTGVEMURCNllNdm1Gdyt3ZUlrbDE0aTBiamJPV1J4d1dn?=
 =?utf-8?B?a1h0cDZxQ1dBTHJJMlEwR2RUb1pvaDYzVkROMEh5aTFnVW1FZWhXdWRNZ0tF?=
 =?utf-8?B?UmRINXplL1EzSWNrWWtqNk1HMzF2N042dW5lM2JQLzRBSWtNeWc4TkxDZFRP?=
 =?utf-8?B?R05xeERiQjJ3ME5kbzdxTndxc25qWm9hUVhwdnk4YjdZVXlHcWh5OEJiV0R2?=
 =?utf-8?B?TzBYK2JvdDN2cndtR1dvSnlkanV1dldVOTBoMkRWUUJPVTY5YVNUSThVbmEw?=
 =?utf-8?B?ZWRKdWVCcElOazdpdWR3N2xtRFlGdmxtMUdZMTZHaUJ6RXV4eXFJeXVwc2h4?=
 =?utf-8?B?WTJkRkNoTzYzYnJJUWpFYWhGWkNHWFBYSnB0d0ZEMnZxTld6L0Fnb0x2aUVt?=
 =?utf-8?B?R1RHYWRlalBPbGRraTR2S2g3b280QXlqYVBDNVh4dENKRFRMbXFramU3K01J?=
 =?utf-8?B?VzBpMzlNOUphUnFkRDl0OVJKMGpqVy9TY3E0MHd3cVRsRnRMM200d0t6cFVx?=
 =?utf-8?B?aThYWXRrSUllQkdkMkJXUzdnYkxlaFRNNzhJQTl6UEh2WmdhYXpWMnhBVmxV?=
 =?utf-8?B?QVg5QU1zdmpLRmpnUDNVTGJuREhFTDJYV1VLU1pMWndGRHhBTVR5d1RDVEkz?=
 =?utf-8?B?czNzZ21zbXBsMkVBdWZtMXRFUVM3R3luNHA2T0p5Q240YkY1VzVYT1JnMGlL?=
 =?utf-8?B?aWxvdDdtZlFKam5SNzFTdEprZjVLWThxMkNXZUl6WjJ2RWc2WGhGS3hBd09G?=
 =?utf-8?B?emgrUlU1Nng5c2VEc2FlZWpEY3lNcitOZk9tZk5IN1dIZ0N5QmlQZjI2ZTVX?=
 =?utf-8?B?RVgyeVM0dW5HTm1PV1RDalZXTEpFWWZ0NzczbUZqYkNuSXdKanJyQVFhellK?=
 =?utf-8?B?VEQ2NGFQZ05IeEdjd0tUdFVCYm1uVmptWTJ3ODZaWUVBM3p6WUM5NFRqcmVD?=
 =?utf-8?B?SXhvakErZGJhdC9qRVlmOUdMWCs2eDVmWGhUSlp3VklPSGlhSUsrQjRMdFlX?=
 =?utf-8?B?VjVhb0EydG52a3Axa3R6YWZJYnBaTk9wQmZDYVVJdDY2T0lRdkxIWXNkK25N?=
 =?utf-8?B?QkNEQmZHVnRpaXBzZGlBdFhWcXZ0d3IvbWxwOTJmalVocFRCZkhVeUR3UFg0?=
 =?utf-8?B?THYvdXJKYWp3b09ZeE5OMEhhRmk4MTlwM2NiUmJjSW1aSnVVQUZEVUcwcWow?=
 =?utf-8?B?QUpidWFBSS82SU51bk93VjRIU0xEdTdFaVZqOUI2aURqZkthUnh1dVFJemJt?=
 =?utf-8?B?emNxZWRPMkx1bWxMY2piL1lENTVvMVQ5cGpwNStCVmpoZkdiWm9YVzlRMm5x?=
 =?utf-8?B?UTZVNElHcURkbVVlUm5qNjBXcnF3cmYyUzlIR3RpbmFVMFBnc3NySDIrY1hm?=
 =?utf-8?B?THVwM0FKMFVUQjM2Tkw5RTBpam5rNkNjNlNDTUV6dUF1MDIvOWg2TVR2TDZE?=
 =?utf-8?B?c0g0S3FYbGFCSE1uWEwxSnRqTmM4NG9jL1FNaGZScE9uNVVZOCtURFNsVmJq?=
 =?utf-8?B?STdhS3hQdlpKM1RSQ0pxZ3BvSDR5VDBLWHZpbWo1b0J4V25PMUd6MG5OaHpr?=
 =?utf-8?B?cGUwcTlFbU42NGs3cHducVBKSUpwTm01a1o0RUZWSmVIWWUwLzZydHVwNFhw?=
 =?utf-8?B?ZWJ0TFBoNk9ybFplREJPWmNOVjZ0Y01BeWRHOE9NVkpPYWVnampmam9BWDkw?=
 =?utf-8?B?aTlMbTdyK2kxcnZ5VTRjMUUrM05yYmR1L2pCNUFpZStJSTIvcy9QVitRUUtS?=
 =?utf-8?B?L3dKclRxOHB3Y1pLZVc1d1RCNTh5RFgxdlhWMzlVeE1CVFBtZjF1Z2l4cXln?=
 =?utf-8?B?cHBZSFZXWkpUbzRFY0hXbjU1bC9QTEZubzlIUW9wWStCV2FUdGo1cGFOWWlm?=
 =?utf-8?B?d1F4SCtXVHFXa3BJOUNGc1VaNlRGcDdvN05hWXFDd1pVdjVLOWs2NExmRFBw?=
 =?utf-8?B?elpENTVudnJBTVRpQ3F3NXp5TkNpSzh3YTcvazk2WitjRElrUVdRQmVaWU9N?=
 =?utf-8?B?M3VHQ0d2T1FlZWJya05HUmszamhOc2NrOHZ3VHNqT204bVNSMUhGM013RkR5?=
 =?utf-8?B?dDg2VHVRbVJVVElmL1k5aVl0VXl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <956EAA7E84EDC347A70636A25CAA2C91@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bcadbc-128e-4e9d-fbfb-08d9f6c8a122
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 12:33:00.5702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zjVN7VL3CpkgFEjruM/vT2czMstWF52O5Y5axIwcJJAMtYlhWkOedK5DrjnMx+rOL2wB4tUfelL3x6WDmRa7ehddYW2xblCF/n4QFNIxH5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3060
X-OriginatorOrg: citrix.com

T24gMjMvMDIvMjAyMiAxMDoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFzIG5vdGVkIGluIHRo
ZSBjb250ZXh0IG9mIDMzMzAwMTNlNjczOSAoIlZULWQgLyB4ODY6IHJlLWFycmFuZ2UgY2FjaGUN
Cj4gc3luY2luZyIpOiBXaGlsZSBjYWNoZV93cml0ZWJhY2soKSBoYXMgdGhlIFNGRU5DRSBvbiB0
aGUgY29ycmVjdCBzaWRlIG9mDQo+IENMRkxVU0hPUFQsIGZsdXNoX2FyZWFfbG9jYWwoKSBkb2Vz
bid0LiBXaGlsZSBJIGNhbid0IHByb3ZlIGl0IGR1ZSB0bw0KPiBsYWNraW5nIGEgY29weSBvZiB0
aGUgb2xkIFNETSB2ZXJzaW9uLCBJIGNhbiBvbmx5IGFzc3VtZSB0aGlzIHBsYWNlbWVudA0KPiB3
YXMgYSByZXN1bHQgb2Ygd2hhdCBoYWQgYmVlbiBkZXNjcmliZWQgdGhlcmUgb3JpZ2luYWxseS4g
SW4gYW55IGV2ZW50DQo+IHJlY2VudCB2ZXJzaW9ucyBvZiB0aGUgU0RNIGh2ZSBiZWVuIHRlbGxp
bmcgdXMgb3RoZXJ3aXNlLg0KPg0KPiBGb3IgQU1EIChhbmQgSHlnb24sIGFsYmVpdCB0aGVyZSBp
dCdzIGJlbmlnbiwgc2luY2UgYWxsIHRoZWlyIENQVXMgYXJlDQo+IGV4cGVjdGVkIHRvIHN1cHBv
cnQgQ0xGTFVTSE9QVCkgdGhlIHNpdHVhdGlvbiBpcyBtb3JlIGNvbXBsZXg6IE1GRU5DRSBpcw0K
PiBuZWVkZWQgYWhlYWQgYW5kL29yIGFmdGVyIENMRkxVU0ggd2hlbiB0aGUgQ1BVIGRvZXNuJ3Qg
YWxzbyBzdXBwb3J0DQo+IENMRkxVU0hPUFQuIChJdCdzICJhbmQiIGluIG91ciBjYXNlLCBhcyB3
ZSBjYW5ub3Qga25vdyB3aGF0IHRoZSBjYWxsZXIncw0KPiBuZWVkcyBhcmUuKQ0KPg0KPiBGaXhl
czogNjIzYzcyMGZjOGRhMyAoIng4NjogdXNlIENMRkxVU0hPUFQgd2hlbiBhdmFpbGFibGUiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+DQo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9j
b21tb24uYw0KPiBAQCAtMzQ2LDkgKzM0NiwxNCBAQCB2b2lkIF9faW5pdCBlYXJseV9jcHVfaW5p
dCh2b2lkKQ0KPiAgCSAgICAgICBjLT54ODZfbW9kZWwsIGMtPng4Nl9tb2RlbCwgYy0+eDg2X21h
c2ssIGVheCk7DQo+ICANCj4gIAlpZiAoYy0+Y3B1aWRfbGV2ZWwgPj0gNykNCj4gLQkJY3B1aWRf
Y291bnQoNywgMCwgJmVheCwgJmVieCwNCj4gKwkJY3B1aWRfY291bnQoNywgMCwgJmVheCwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYy0+eDg2X2NhcGFiaWxpdHlbRkVBVFVSRVNF
VF83YjBdLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjLT54ODZfY2FwYWJpbGl0
eVtGRUFUVVJFU0VUXzdjMF0sICZlZHgpOw0KPiAgDQo+ICsJaWYgKCEoYy0+eDg2X3ZlbmRvciAm
IChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pKSB8fA0KPiArCSAgICBjcHVfaGFz
KGMsIFg4Nl9GRUFUVVJFX0NMRkxVU0hPUFQpKQ0KPiArCQlzZXR1cF9mb3JjZV9jcHVfY2FwKFg4
Nl9GRUFUVVJFX0NMRkxVU0hfTk9fTUZFTkNFKTsNCg0KVGhpcyBpcyBzb21ld2hhdCB1Z2x5LCBu
b3Qgb25seSBiZWNhdXNlIGl0IHByZXN1bWVzIHRoYXQgdGhlIGVhcmx5IEFNRA0KaW1wbGVtZW50
YXRpb24gcGVjdWxpYXJpdGllcyBhcmUgY29tbW9uLg0KDQpJdCBhbHNvIGhhcyBhIGNvcm5lciBj
YXNlIHRoYXQgZ29lcyB3cm9uZyB3aGVuIHRoZSBCU1AgZW51bWVyYXRlcw0KQ0xGTFVTSE9QVCBi
dXQgbGF0ZXIgQ1BVcyBkb24ndC7CoCBJbiB0aGlzIGNhc2UgdGhlIHdvcmthcm91bmQgd2lsbCBi
ZQ0KZGlzZW5nYWdlZCBldmVuIHdoZW4gaXQncyBub3Qgc2FmZSB0by4NCg0KTW9zdCBpbXBvcnRh
bnRseSBob3dldmVyLCBpdCBtYWtlcyB0aGUgb25lIGN1cnJlbnQgc2xvdyB1c2VjYXNlIChWVC1k
IG9uDQplYXJseSBJbnRlbCB3aXRoIG9ubHkgQ0xGTFVTSCkgZXZlbiBzbG93ZXIuDQoNCg0KSSBz
dWdnZXN0IGludmVydGluZyB0aGlzIHdvcmthcm91bmQgKGFuZCBJTU8sIHVzaW5nIHRoZSBidWcN
CmluZnJhc3RydWN0dXJlLCBiZWNhdXNlIHRoYXQncyBleGFjdGx5IHdoYXQgaXQgaXMpIGFuZCBs
ZWF2aW5nIGEgYmlnDQp3YXJuaW5nIGJ5IHRoZSBmdW5jdGlvbiBzYXlpbmcgImRvbid0IHVzZSBv
biBBTUQgYmVmb3JlIGFsdGVybmF0aXZlcw0KaGF2ZSBydW4iIG9yIHNvbWV0aGluZy7CoCBJdCdz
IHF1aXRlIHBvc3NpYmx5IGEgcHJvYmxlbSB3ZSdsbCBuZXZlciBuZWVkDQp0byBzb2x2ZSBpbiBw
cmFjdGljZSwgYWx0aG91Z2ggbXkgcGxhbnMgZm9yIG92ZXJoYXVsaW5nIENQVUlEIHNjYW5uaW5n
DQp3aWxsIHByb2JhYmx5IGZpeCBpdCBiZWNhdXNlIHdlIGNhbiBtb3ZlIHRoZSBmaXJzdCBhbHRl
cm5hdGl2ZXMgcGFzcyBmYXINCmVhcmxpZXIgYXMgYSBjb25zZXF1ZW5jZS4NCg0KDQo+ICsNCj4g
IAllYXggPSBjcHVpZF9lYXgoMHg4MDAwMDAwMCk7DQo+ICAJaWYgKChlYXggPj4gMTYpID09IDB4
ODAwMCAmJiBlYXggPj0gMHg4MDAwMDAwOCkgew0KPiAgCQllYnggPSBlYXggPj0gMHg4MDAwMDAx
ZiA/IGNwdWlkX2VieCgweDgwMDAwMDFmKSA6IDA7DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9mbHVz
aHRsYi5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jDQo+IEBAIC0yNDUsMTIgKzI0
NSwxNSBAQCB1bnNpZ25lZCBpbnQgZmx1c2hfYXJlYV9sb2NhbChjb25zdCB2b2lkDQo+ICAgICAg
ICAgICAgICAgYy0+eDg2X2NsZmx1c2hfc2l6ZSAmJiBjLT54ODZfY2FjaGVfc2l6ZSAmJiBzeiAm
Jg0KPiAgICAgICAgICAgICAgICgoc3ogPj4gMTApIDwgYy0+eDg2X2NhY2hlX3NpemUpICkNCj4g
ICAgICAgICAgew0KPiAtICAgICAgICAgICAgYWx0ZXJuYXRpdmUoIiIsICJzZmVuY2UiLCBYODZf
RkVBVFVSRV9DTEZMVVNIT1BUKTsNCj4gKyAgICAgICAgICAgIGFsdGVybmF0aXZlKCJtZmVuY2Ui
LCAsIFg4Nl9GRUFUVVJFX0NMRkxVU0hfTk9fTUZFTkNFKTsNCg0KQW4gYW4gYXNpZGUsIHRoZSBh
YnNlbmNlIG9mICIiIGlzIHZlcnkgd2VpcmQgcGFyc2UsIGFuZCBvbmx5IGNvbXBpbGVzDQpiZWNh
dXNlIHRoaXMgaXMgYSBtYWNybyByYXRoZXIgdGhhbiBhIGZ1bmN0aW9uLg0KDQpJJ2QgcmVxdWVz
dCB0aGF0IGl0IHN0YXlzLCBzaW1wbHkgdG8gbWFrZSB0aGUgY29kZSByZWFkIG1vcmUgbGlrZSBy
ZWd1bGFyIEMuDQoNCn5BbmRyZXcNCg==


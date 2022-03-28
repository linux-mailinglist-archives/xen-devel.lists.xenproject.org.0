Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DA4E8F4E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 09:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295336.502528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYk9O-0007KU-S2; Mon, 28 Mar 2022 07:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295336.502528; Mon, 28 Mar 2022 07:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYk9O-0007Hw-P2; Mon, 28 Mar 2022 07:50:54 +0000
Received: by outflank-mailman (input) for mailman id 295336;
 Mon, 28 Mar 2022 07:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynyj=UH=citrix.com=prvs=079c560b7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nYk9O-0007Hq-2c
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 07:50:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b5b4fb-ae6b-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 09:50:52 +0200 (CEST)
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
X-Inumbo-ID: c9b5b4fb-ae6b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648453852;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4UjNDulGzboOiTbl65nP85sjXJdb2GiEO8mpSkYvt8M=;
  b=fxVlovIG/wdH1bQDldMoBWDAuOYVn2DncgckBwpJ2xr0iVIIag5wNoLz
   mboC2aB64yPVOzEtr3kL95so5Ic9bjXf/1GYRxWdEsYvnyf9tMMKbxKg8
   z+296ujZ2ioa4MV2m8VRDbavt9dcPptS/ot3ddbanmuQqIKsYiOKCnUpm
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67315326
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cmPupavC2s9ftGs8g7ARxfCAAOfnVEJeMUV32f8akzHdYApBsoF/q
 tZmKT/UP/uKa2P0cot1OYS0o0IDvcXUxtBhGgJlq3xjRiwb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX5
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9zJIPsoPQEfyVIOHx8D6NiyoD6JmGW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 JFANGE1MnwsZTUSKkVUBI8lxN2Wn1nPSxtnllaqivEOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO7cgxiG12rP43xayW2o2QBpzV+EhreZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sjA3Dt4ade51q2VtW
 lBewaByC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs5bp5bI2W3O
 xGD0e+02HO1FCHwBUOQS9jsY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnSOqddIdwFTdxDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:qih2X6kv6O1jIU1d8m9m1WFoD5fpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,216,1643691600"; 
   d="scan'208";a="67315326"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JarBm6uzgD1Y+nVDyJa4jo+PvNJgnjepjvfDPU857wtBRm+1Vti5uwMTxwZkWNmJSqNmRk7zxH0/poHoiNz1yvEerR7wUlEXsYbr6jy39Jwejv/zmKpayxFHumvkKY/b1maXr8w9kN0qU5bWpowIjNUkKHQCGmdaoU1hystMs3OXgdFRLc4xjphp5gYkFAHchtlbC+wtmJiwyK/INs+Mu0UTegWMwHF9MfsNSZXmj/eUGRZ4iSFAlNAl7u+Ndqfy5hv5gl9NIMnwgp6SVcV0Y3uZDmqMA10wFPKAAhoz6IqXslaQqEhyNd0mv92+qDsLx7GA8wlcLdy95tyBybAuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AbC7knwkr9OM/U4DIdCaRzquPvlEcZh0+2NPAHksDM=;
 b=LLHJkG2GIoAaC3/fVDPumNZ0kwVgIoAytasS27j68IYrxxjGRGX2YaZnE50uJ6daTjjwftSHdujmar4UYeIXZVQD3D50SoOb8ep430QStTrK7iYdPo1Fnq/ou5UKmaSruieznOnCa6SeHwdYuQGO6OUiFKhtDj1EQkMVt+XhqParkQ21cUAImmiCet7+lKJq7U/0HDhYp2AzrZIEpj/1l1dmfQybCafsSuwZbjZiCe2KoxQS9E8LqoJRUfb7pDJt+Wo9T2Tq7io6ZnT4CLOVtlPbPJaR9Ec7X0mTmO52jl/4MbzZJ+fa5TmIyTNmLl++azxkrZfmihP7dVB/i0h/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AbC7knwkr9OM/U4DIdCaRzquPvlEcZh0+2NPAHksDM=;
 b=R7h7Jkh7ATXMsWFsx8TD6qYkXfLf2D9XgXtUcfADGlWRsJLIvDbc+cAEgD0PZjSdQuKjTBDbhsRD/aN3gYhEfGo8qA4uZUPTDhfVpPUIByNg1M6BiwESh3gAxOGgTOsxlCxQ0wavdcycIE6hfJXJoJSmmWuSd1QFdxm2rE/ccDs=
Date: Mon, 28 Mar 2022 09:50:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/CET: Remove XEN_SHSTK's dependency on EXPERT
Message-ID: <YkFo0P8Vl+XpgOgW@Air-de-Roger>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309123936.16991-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PAZP264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 527689a3-387b-46ac-7122-08da108faa54
X-MS-TrafficTypeDiagnostic: BN7PR03MB4548:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB4548EBE01AE14BCCCE3569208F1D9@BN7PR03MB4548.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKVHoL0aWrsnSG7PLR0eHDFBtQPj0cZWS2GonFo+Citfrqx/rxqn2c2Z4WLpzh4j3nDzrIdctT3g/UyfkhjFR/UNBpyPauigG2ivpfLTU00MfT7OYDD0EtbsaxZFLRKHfUQ+jCm8GIflqhxXonToB+WpIaAaYecjdNc4I0Du0lD+Rq0nvv+J6d1M/k6oKbsz5CZoyHqBZdopkIVDrrgIgIsV2h4wTf3AT3CGV7dX1TYMY14m5xM87qWexYCAKMI0MM3oC/kGMTFh79NGrhtHrZHnOkmSNjukKHjxcq3OUaMPAI+oLJt8adu+Gag7aAlxiGiXGvkCVf4UrDhJCCUc7PQ5jq+3uVmDklaWrKuU3rEbzhqpiwjASbXFMkw1Cm+CasL26yj6YUR4Pn8ioE83oi7B1w0fN7eZJSoMhYKZiJ4Ty7Niee25rcCzidYde4RMyUOoXjut/uFRWEWU+AGlFVztKq51WLxzB26xB75xwDeQo+nRgRx75heAlXqNw9s6+7JSU+fV+S2+PuJp/vhmiKBdRvh620okSAt8ZleQ/uhF3unH6hcKaNcvYtmKOSTpxAQ1rU9pC/u43zJLmSCmrbYZ0j17DwPykJtP6hxuqKEWDdhse4fsDGeow3oR4OAiHGp3ykMeLcCxiGtrz3/DjxW6q8/zL614BlArDRD2OEermV6ERzGUfmpalOvSo3C/fRgo7sXRCGZs3quX8U84iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(38100700002)(316002)(6512007)(9686003)(6486002)(86362001)(54906003)(85182001)(6636002)(508600001)(8676002)(186003)(66556008)(66476007)(5660300002)(33716001)(4744005)(66946007)(6666004)(6506007)(8936002)(26005)(4326008)(6862004)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnRKeUNXbUZuNUV5VVNUMVRqc05lOGErNGQwVkEwRXVTdjBxa0sxRlh3emhR?=
 =?utf-8?B?Vkowd2I5RmVXdUtQbStoZW9XeFVPOHgwazI0NUpiREhNMzJxbUZpNVI5YlNL?=
 =?utf-8?B?WUNsc3lKZkVIcURDWWtwSzJxVW55RXBZRE5oUDVxZ2hnMXhhRlZsWGp5OVRQ?=
 =?utf-8?B?WCt6OXh3UUJ3OWpkYUdtb1YwNUJBd3R5Rm9tSmk1dDNOZEpyZjd3a1Vrdktw?=
 =?utf-8?B?VEZVbjROYlVFTFV0eFlUeXRQaXZXRUN0VkZ4bWlaelNWcStZWXkrWFI5OWt2?=
 =?utf-8?B?T256RWhqN2lYU1ZHb2Izb2pIcDVuU2Z1dDE4MGJEcHI3T3hYU3cvTkZ5M2Qr?=
 =?utf-8?B?djR3My90dzQ5cmkvejlIQ0FRQ01mZThVWGxJZ3lLUEF0c25veDVRT3U0NHBG?=
 =?utf-8?B?YUtQcS92RkVzLzdYNElZZE9zcHplMFZlRlkvWDZZc0JRRGc1YWFNL3l4NGhS?=
 =?utf-8?B?L2V3anNEdUl1U2Y4U0x6WTl4bGdjRHNGbnV4MjB6L0w2bnB1cGpSeHZoblJq?=
 =?utf-8?B?OWFNZXlzMUFuT3R1ZENrSkNQZGZwek5PSXNmK1RudmloZ2V3SGROVUo4ZExJ?=
 =?utf-8?B?eEVjek5JOW9nU0w3Q1BNUE1DNlZFT3BURndqTDZRRTYrMUVld2RUZ0lYcGNr?=
 =?utf-8?B?d1lPd09DK09hc3FxeU8yYnk1OVJHTERVMlE0ak1zU3A5QnQyOENIMVlUUFVs?=
 =?utf-8?B?WHVpR2tsUkozbURKSEVLZHp4dEdxZ3dWMXE0M2VIdC9pbnFrYy9ZK1BMSjh1?=
 =?utf-8?B?ak9nVzF1SUFrcDl4UUw4VC9aWXR1QVdaTHlieGxLZTlCc2VmUmZkcXppRlBM?=
 =?utf-8?B?WHRRTzV1N0pJSU8xemUzVElOYnhvbGJhZFpKWW02bHdab0l6YXMxeHpDajE5?=
 =?utf-8?B?eE80WWN6K3JGa3h5QUF0bks3Lzh1cHJ5UmhibGR3c0FiL3hkUmY3YzJxTDFC?=
 =?utf-8?B?aHFBRWZQSERibGk3VEFVTXBpdHVIOVdYajdaTmxtWXBhcFpVRm1XSHJUVEpM?=
 =?utf-8?B?T2hrc3ZTUEhaZVcycGxuVWRVSDUwcmU5S2RnYmlhSFJQb0RTejI3K3lOMjdm?=
 =?utf-8?B?RnkvTXVIbE9nZWtBK1k2ZXlIN3hKQnNDRS93UFpwQ0t0TVo3dTM2N0xOUjBT?=
 =?utf-8?B?OTYrMmF5NWtYNWptRmFOeGVtdzZ1SXVsTm51ZHI3MGlXQmx3UnJPNlNYN05N?=
 =?utf-8?B?YlJ4NUU5QXNERExaL1ZRL3VjUHg2QmhWMzMxa2FIT0h6dU9mRG83Ym0rNXhk?=
 =?utf-8?B?UUlRcHU0MGNlak9rd3FrNDVoMlZHaUFMVkJtZEIvVjNJRklOTzhsdmJ5MGFp?=
 =?utf-8?B?TlNsbFA0THhMaklQbEVHdk5mSzBQUXBDRGNWRjc2N2I0d3JQWWtWREJEUzFj?=
 =?utf-8?B?WVVIUkZidnd2b05HVjVvc2NPR2U3Y29MbTNISXNOSjZVWWR3OVFwQUo4Q1gr?=
 =?utf-8?B?RHVTeXh1OWsyenhpK0tJQ0E0UEFHVTgxZTBXTURhNUZ2eEtycU12dnhkckRu?=
 =?utf-8?B?MmsyekowcWpxaGNqYmdSaXpIa0hIQVBpd1FOSnB0SkVLdk9uTnlYWHhZNnZW?=
 =?utf-8?B?QTJyZmp5RTNyNTFDeE5VdzBGbDFzMGJQMjZOQnVrZFNrMWw4RFNUeGJabk5C?=
 =?utf-8?B?WERZMDZ4Mkdoc081SzMyNTRITno1MUh0VkEvdkhtQitUWnJGRTU0USs1OEJ2?=
 =?utf-8?B?bEt0dGF3RWlnQUdRMlZ3Y1ZhcHFNSWI1RmJZVUhsNDEydm9zaXU0WmhRdGZY?=
 =?utf-8?B?UEJpVzNvbW53MGt4WVZsc2RYTEJFZWdzb1VEQkErcThPS05oMER6ZnhVTjcw?=
 =?utf-8?B?OU5mdzZWbWFIM091UENKWGgyVUM1UEZKVk40VVZlYUptOXFaTmdjYk1nbjl6?=
 =?utf-8?B?YlUrVDlGRlVzWmhLbDNNcURCamdnQWh4T2hGOG15clRFVGNaUlhvb2pBTnhq?=
 =?utf-8?B?dTN4VGU0YVVhSGgyNFNKNGMwODI5bzFZUVRHZFBneHVNOXhYblN3TVdVZk5M?=
 =?utf-8?B?TFBTTDM2UzA0UURURElzNGk3cWN5aG1BSW9JL2hVenhsRHJZZkJ2a2VmYmFi?=
 =?utf-8?B?ck1MUGhZQmNxQy83WTJpdXpoVkVHK2h6ekZ5U0F0a1BndlZPVlVyTjJRSlAw?=
 =?utf-8?B?WTdhYkg0Mmh6c3pHKzlrQlgzSFV4Rk5IWmJPdHNDMW1Ud25BU04rYUxqZmNw?=
 =?utf-8?B?T09iVWpacGNMK1ZZdG1IZmY4Mjh5bklYK2MzTVJELzRFY3h3ckJaaFdxaG5z?=
 =?utf-8?B?WXAweGdBRmJ0dnduWDhtV3E2bmhFbXlQVFNYazJXSmFMYTlOWHVaRHNTTEdt?=
 =?utf-8?B?Y3VxQjB5U3JCcmx3NmFmSkthL05MUy9IeXR5ZzNObXNiTUtBVUxHcWxJaTJG?=
 =?utf-8?Q?U1jy0nb3e7q8QURM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 527689a3-387b-46ac-7122-08da108faa54
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 07:50:45.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vR8tOoBdT9NRXZ6NwsXUvAdg5z8GzReXzT84lYQMTlH9OZjPThuESlADhm6UIPyICziXYBechG4w1kLZYjqORQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4548
X-OriginatorOrg: citrix.com

On Wed, Mar 09, 2022 at 12:39:35PM +0000, Andrew Cooper wrote:
> CET-SS hardware is now available from multiple vendors, and the feature has
> downstream users.  Enable it by default.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

CET-IBT is already available out of EXPERT, so also having CET-SS
seems natural.

Thanks, Roger.


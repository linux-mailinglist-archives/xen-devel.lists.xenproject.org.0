Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD34A42D8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262976.455477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUeW-00074W-Hs; Mon, 31 Jan 2022 11:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262976.455477; Mon, 31 Jan 2022 11:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUeW-00071t-ED; Mon, 31 Jan 2022 11:15:20 +0000
Received: by outflank-mailman (input) for mailman id 262976;
 Mon, 31 Jan 2022 11:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEUeU-00071n-Mn
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:15:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f29259-8287-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 12:15:17 +0100 (CET)
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
X-Inumbo-ID: 10f29259-8287-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643627717;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Si8/Z9LH9gQK8hZEwEu2Y6Xu3RYJGTqCrMFavIwSsbA=;
  b=U1CJ8D54dC95EWFdgUmqKDiyJUnBIkv39kEDRcPXIbPapNOvSvGFbf/G
   QeeTqXF5wLK3/My78DfmNxc+sc+d2RbvFKs6IUWYvhBKvaBbQqgcH/RqC
   +serzb1XFXRycAQr+vtsM2OWmhCw901ZzHzNofMXnkeNP2lxCnbk+6mEb
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ffwuu/CA4Cj/Ib8bQdX9OJ0lfKGvnB9WW7+Msv7L+3/Ufj3yZFhBYksOE1gUvxgULEVmhn1KyY
 hOx3vUz2RgIgHObjsZbkJ3V3N/BXW/qDBGxDPwPY7DlBJ2Rm9uPf9/9pHkHWOdqfR9XsY5e8AD
 zu15+DQcXgTnBYSZuIkqznrdVdnq78fzEmXqrVTzLwF1wL8lMo3ir2J6qmzg/UdffUZkOY8fvo
 DztB28EOMx6vXKkiNyP00SQxTbDqJKfGIo0tX7VkAf/xc55EVhIhKLYKmFVdA27IUaHTY385C4
 jPQlbdLgue4PQd3WEu75nOFf
X-SBRS: 5.2
X-MesageID: 63521542
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZMEpzatwvSQ/9gyDD6+taj7wwefnVLtZMUV32f8akzHdYApBsoF/q
 tZmKWmPbv6MZ2LweNp1Yd7n9RlS6pfSn9JqSlA4+S0yFHhG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2oHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplsbq8QEB1Irf1x74zWDl+E2JSII1vweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 JdDMGczNnwsZTVPEFcFJpQljtv4i2fWLGEFkVTEprcotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+kc5AjKlrbO2lnDKGMkaD4CRMEGnfZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAKzARVodt/xory9U
 J4swZL2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZtUJme5P
 h6P6Gu9AaO/2lPwN8ebhKrqU6wXIVXIT4y5Bpg4kPITCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXM6u85IPKr/cc2KL2ggJUpfs/F/oQKQ894x9nebU5
 HCtHEhezVv0n3rcLguWLHtkbdvSsVxX9BrX5AQgYgSl3WYNe4Gq4PtNfpc7Z+B/pudi0eR1X
 78OfMDZWqZDTTHO+jI8a5jhrdM9KET31FzWZyf1MiIie5NARhDS/oO2dAXY6yRTXDG8stEzo
 uP821qDE4YDXQlrEO3fdOmrkwGqpXEYle8rBxnIL9BfdV/C6o9vLyCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWtO/kOzPb82yvxZ57fNyJJT2NBnnp/KiCZ
 PlOy62uOvMwg1sX4ZF3FKxmzPxi6oK39aNa1AltAF7Cc0+vVuF7OnCD0MRC6v9Ny7tetVfkU
 06D4IAHa7CAOcejG18NPgs1KO+E0KhMyDXV6P00JmT85TN2o+XbARkDYUHUhXwPNqZxPaMk3
 fwl6Zwf5AGIgxY3NsqL03JP/GOWI31cC6gqu/n22mMwZtbHHr2aXaHhNw==
IronPort-HdrOrdr: A9a23:e33QPqB+n0vgh6jlHemQ55DYdb4zR+YMi2TDsHoBLSC9E/bo8v
 xG885rtiMc5AxxZJhCo7690cu7MBThHPdOiOF6UItKNDOW3ldAR7sSj7cKrQeBJ8TWzJ8l6U
 8+GJIUNDSLNzdHZGzBkXGF+q0brOW6zA==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63521542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJcjQbAgudfZGD+saFqxLNetoC38ui/k6BHYZqVH96JRvnsFo0oGSUp2UUbRKSA7fCfCsFcHUII7zk7etGoVAU6S0qcras1V2JfqqsaX82SyxN8USu5Y5z74VRdrEh6AkgUyG+DEPpIJ1XaEC1A5lFckeEat/l+7faUCnR4n1dkT5vxx7n7XYGzHcyuhz1cSi6wjTvytKYwTERxp5T+qhx6xM730GK+RVp/h6ATgzmR9FVApyIwCIL/+FpOSR7TG7iQ4uVozwznng+QWQmpQK7fKSxelngttU/iZ8mJ52LlPe895ZfHrsr4xLCDf7feNNsjtXz7p5ZkKibGXSUW5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si8/Z9LH9gQK8hZEwEu2Y6Xu3RYJGTqCrMFavIwSsbA=;
 b=TuTEhoIbBZzcTY+5HU1Jj0kwmeOiXWC0NeyWPVkGGQAOYW2O+uEJCO7pbBcGSj5ygdT/LsVA92DnmUFMPpZ5h1L271UIEGKuo6O2Yj9hAGk9tY2T7trN3asSEtLxAunscLtxwjp4Iih8ntrFjOgtbhJg5VVwv8gqqTcNUJUyk9BAqlU4YetFg57hy8ROakLaidkMmxaqNc+6d75rTJXDkl4Vu6y6xK5nFJGlwuz/FLTwTJ/I9Q7vhzosYc/ITFJJwJBXQzoucCs8TRupFT9x8L6ZIrPFxoURTkItPo6gVoFWvkwCOGWdOGn5NL6ZTxr5kFsJhPXUq5NZjOBDnWsbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si8/Z9LH9gQK8hZEwEu2Y6Xu3RYJGTqCrMFavIwSsbA=;
 b=a8xKvyH+R3NpysMHnBzq3DIjFSGuYACsuaDIbaBVDapOoyDMHu8xERpEl22MCdGpTK7DaAdUrtnT5alzgwWQO7CZnC+yDVsJdX1b+TMDma2UVbh/AvUnEUE3fGFC1guHfIzmq2i92Pu+TiqBc2LozrZVK8poPOIjdzet8ntECtM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/9] x86/cpuid: Advertise SSB_NO to guests by default
Thread-Topic: [PATCH v2 1/9] x86/cpuid: Advertise SSB_NO to guests by default
Thread-Index: AQHYFEsmQ2uEcZXHMU+pjtqph82oMqx85LgAgAAaTQA=
Date: Mon, 31 Jan 2022 11:15:09 +0000
Message-ID: <f0f04ff9-e54c-0442-692f-573b6c191e14@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-2-andrew.cooper3@citrix.com>
 <YfeurBLIrtSpifuo@Air-de-Roger>
In-Reply-To: <YfeurBLIrtSpifuo@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2dabe65-2b5a-40af-323d-08d9e4aaf13c
x-ms-traffictypediagnostic: SA1PR03MB6514:EE_
x-microsoft-antispam-prvs: <SA1PR03MB65140901BD6CC4AA77F850EFBA259@SA1PR03MB6514.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p7779kdRgR9mMhXvlnjbKQUzaxHPkUhD16RONHUQ6NBfvMYt8iqcxAEne45WHwQtBzGod79ckHPdB/blstU23VDIPl1YBJVNxyfbBz1vhza6vPWsePC1EijnSMMpxG194iFOWI7AruMurj18hF3QGTlOFlLOvaJzPW0Ljxi6pWJ7Bof1HuPGp/Qg4jyRk3giZWKz6d4UGdYvu30qCb0S9/AoJiEI8f8AvHgTkrlmAHHbMSjuv0ZdcTSF9s4FfGkwSEYYhDSpwXcdqlPDPOtKrPgt9oCEZSlZcDLd2UTFVY2iORN6OGPxulEJPgZRs9zG2OkqcL+jn3GqU5CB6EQy5fIk06mSdztchnn6iSo6jF2uSbqkXAriHOdSLrBhrY9arYel5vMmgjet1Dii0o7jdpNli4/zjhj8vxSOvnv8DRxYbtcBxqsQwrVSymv3iwp1sL36CKccDBQHP2FTps1k+juQUsZfViGRHy4dzeiISHJ78WeUHtrGW46SVg5PSGJe9olruWi41vSLFLdd0eGzAwXy/fJ/PtAfhQ+KVW6bJHKaNu/z+YnBHc2b0GXNbvGTUKYd8FsX9GdiwOu+JeC7dCbc+As54Qb4xc/HiQp5bYdwzFndjzAiw0a9bjDBL3NxQBzslsmX8E2dem/T+eGN7X8uNSrQ0w6el4xP0p+XmJm+FqqC92dqdkQAo9et9AjO10quuHVW43tCu7bqTGfBw+PazlgNViBkKqO5eUpYVYZXkqsItzGppwPr5gFkK+PCdGj/uaoqK3XLlPlBYRTN0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(53546011)(316002)(38070700005)(38100700002)(8676002)(6512007)(4326008)(76116006)(6862004)(64756008)(66446008)(66476007)(66556008)(8936002)(66946007)(71200400001)(6486002)(508600001)(86362001)(6506007)(54906003)(37006003)(6636002)(31696002)(82960400001)(5660300002)(2616005)(4744005)(36756003)(2906002)(26005)(186003)(31686004)(122000001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wmo0SUVRQ0oyOTZOeWp3RDA4aHNzWC9GdUNkcDdpZllKdldGSlVOL2psL2lC?=
 =?utf-8?B?TXpCL2M1ZmVXOXcxVkpOVkUvVXBNbE1Kd25xS1R3SytaSU9XWVZyb281UThR?=
 =?utf-8?B?MTRoY1g5RERMMUpvMXdqMURsMEpzdm5JdGpyTTJUeSs4Y0VIbWU1T3RGRzVw?=
 =?utf-8?B?SXdaSXUvdUFjTzNjMVd6MUlkN1V0ajlpUmFuK0FKK0NYc3RUVFlxTnNJL0N6?=
 =?utf-8?B?TGVUNTA1WEFpRDZYaURscUZFMlFzRFNuOVdsd0poNUZDRlF2cWdtZ2ExUzYv?=
 =?utf-8?B?Qy9WVmFEeVJvWHF0OHJYUWJYS2xmNnVIQVdNa1FzLzRNTHREaVJtOE8zWHVw?=
 =?utf-8?B?d2I1WUZYTTBzOFc0akdOSWFlNEo3L2FKS0hjMXhCSis5TjEvaFlGcEFGOWtz?=
 =?utf-8?B?aWFtT3poOW5EWEt3dERQOTZQelNiQTE3YlVKbXBzTHdud3h4OWx4QytrUzM5?=
 =?utf-8?B?eHhiQksxR1JUdWp4TE12NTBqZXdjd0NYWnp5LzkyVG8rdkIvOFFybHFyd3pO?=
 =?utf-8?B?ZUdMdlRVSFpQcWFicXZPQWtKUGR4aFVGWTIwVStJSHRFazE4NmJnZnZrWmdY?=
 =?utf-8?B?enVib01rMVZ2bm84WjA1LzE3VWRDemM4WWsrRkR1WlNCRHJpcXFOYm00Zi9q?=
 =?utf-8?B?ZUNibVl4bWo4cVRpWnZzRHNlM3p5NUc2dmg3LzNXUXpWWFZjcE1ibUkzcUc1?=
 =?utf-8?B?WmpQL3g1QW5BYUFXSWZMdzVmZXNYSFptaEE0MEJuTmU3OWx4RGprSTVpSi9j?=
 =?utf-8?B?QzRObHZNTDZNVFFhTmtnVzFJTVNuaUJvUTNMR01WaFR4SGIwNWJiL3MwUW9K?=
 =?utf-8?B?TG9EdGNka0EyckNCMGRwS0hQbkppTldGZ3BFTVc0Tmx4Q00zYVpMMEZQZ3Fa?=
 =?utf-8?B?bzZjTVRLVEY2aHhnbnBNUmxuWlkvQUR6UUYzOVN2NmFMWnhnNGdWTEJqSXow?=
 =?utf-8?B?WVBrdEIyTjBEVUt3YXNUSEJoUStwaC9iOVl4U3ZtOTI2WlFCRUk4VngyUlcw?=
 =?utf-8?B?QzkxTGJDR09XZjVuQkk1VUVqaTBXN1YvUkZaOUsvYlBMbGZlYUtWb203ZS8w?=
 =?utf-8?B?cXZCQmtjNTdZVk8yazBJKytDZjFKYjh6UllPQU5zMWZTeUVQSVlCd2Q0cytW?=
 =?utf-8?B?YitHbWpTUmRBcHlDRDdNTUU4ZnRHT080NmJ3ajhIL1pKMXNRcEgzem9pY2l2?=
 =?utf-8?B?aWt3VytyRkhUSzhBWis1dll5ZlFsTE0zY2Iya1BPUkYzdnhhRGZFWlFMc2lW?=
 =?utf-8?B?cy9DOHhQeSsvL1FEUnpGMSt4TGJWNjBOUm9EbElEZ2RlaTYwQTh5bm5hb1E2?=
 =?utf-8?B?Q2VtZlBVUU5sUjJiS1doYVNmaWVKN0tBM1ZISGxna2oyNlY0M0VVamdlUE9i?=
 =?utf-8?B?blFLYlJIckh1QlNXcUphWXpqUld5eXZ1OHdGQy80V25peVhpUTFjYjUrVWFk?=
 =?utf-8?B?K3U3ZGlYdVo2UUxFLzQ3TXZwMkhiNTdUV2R3d0drMURGdkRiTW5WUWc5a0RC?=
 =?utf-8?B?RzFJR2ZjVHJTWS9RNGVscG5tVStvamJ2U0NUdTJ4NVJpVzR3NmJleTlTNFNo?=
 =?utf-8?B?TEpkSlVHZnBiaUdyUktLc2MwaVdOb1loaDlqdkNZZnJ2RVA3V3E5SVB5YUdr?=
 =?utf-8?B?aHZsQWJ2NlpIbUJXL0Zla0RYNTlBeVNVOGd2d2pGczIvdkFBcnFMcS9lSTJt?=
 =?utf-8?B?QXpCRktiNGRFa3FjNFdqcGpoU2RwUmV6dFNmemczSkZzYmM5OFZsZlhhSTNJ?=
 =?utf-8?B?aERPTTVUdjE4SWlNQ2dnMUprODJJS0xUT0Z1dUpvV0RZdmRPTy9xcWxTRVFQ?=
 =?utf-8?B?NHloOWd2YkRiaGdhODZGQ1dYWlBQdmFSd3RzeDM3bnQ3YjJyOVI5V2k5RXRk?=
 =?utf-8?B?VnpOZTRGeE1VWnJPSHlpU21URDVWZUlEWE0vQjF1dmgzU2VnWDZPUm9HdDhI?=
 =?utf-8?B?SDdxMHJpbnF0QUlmWUxTUlRwY3RpMGFXT29vWDl5N1JucDdiOGNBelpDY2NZ?=
 =?utf-8?B?bkRoN1RLZlRaSUpzZjF1T3EzUHdvSUVzbmhMVVFVdG5xVGpIdUcvNlhrWjNa?=
 =?utf-8?B?VGd0cEZOaTVOTHhLM21rZGJxejVVWWVCMmVqTjE1Sm81dXI0RVlKbllHOXNC?=
 =?utf-8?B?VTA2eEc1SlltTzNqcTlwZnJFN3h1TGdWcUVLdTExUnJKMmZybDlXWkJ6QjV4?=
 =?utf-8?B?b0NQTExQT0hCODN4b1lTU1BzZ3Jya2UxWEtmNFJHdWIyaVFqMklLdVdReDRQ?=
 =?utf-8?B?YUt5dDd6Z2ptK0c3NnMvY0puK1R3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABE26C3AE7CE0C4AA3CA2D096352E2B6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dabe65-2b5a-40af-323d-08d9e4aaf13c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:15:09.1525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x77J5eUaXKxmXlP3Ez4d/i19RDfO9mIE1T1p+aRCxlAthgDNNABf0l3A4Xd4i3KJNMkPOE+TM172Ya/dPPL1fijEZkUJp2iujO4Z8LKcy10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6514
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAwOTo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gRnJpLCBK
YW4gMjgsIDIwMjIgYXQgMDE6Mjk6MTlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IFRoaXMgaXMgYSBzdGF0ZW1lbnQgb2YgaGFyZHdhcmUgYmVoYXZpb3VyLCBhbmQgbm90IHJlbGF0
ZWQgdG8gY29udHJvbHMgZm9yIHRoZQ0KPj4gZ3Vlc3Qga2VybmVsIHRvIHVzZS4gIFBhc3MgaXQg
c3RyYWlnaHQgdGhyb3VnaCBmcm9tIGhhcmR3YXJlLg0KPj4NCj4gTm90IHJlYWxseSByZWxhdGVk
IHRvIHRoaXMgcGF0Y2ggcGVyIHNlLCBidXQgSSB0aGluayB3ZSBzaG91bGQgZXhwb3NlDQo+IEFN
RF9TU0JEIHVuY29uZGl0aW9uYWxseSBmb3IgU1BFQ19DVFJMIChhbmQgVklSVF9TU0JEIGZvcg0K
PiBWSVJUX1NQRUNfQ1RSTCB3aGVuIHN1cHBvcnRlZCkgaW4gdGhlIG1heCBwb2xpY2llcyBhbmQg
aW1wbGVtZW50IHRoZW0NCj4gYXMgbm9vcCBmb3IgY29tcGF0aWJpbGl0eSByZWFzb25zPw0KPg0K
PiBJIHdvdWxkIGV4cGVjdCBDUFVzIGV4cG9zaW5nIFNTQl9OTyB0byBkcm9wIEFNRF9TU0JEIGFu
ZCBWSVJUX1NTQkQgYXQNCj4gc29tZSBwb2ludC4NCg0KV2h5P8KgIFNTQkQgaXMgYW4gYXJjaGl0
ZWN0dXJhbCBmZWF0dXJlLsKgIEl0J3MgZmFyIG1vcmUgbGlrZWx5IHRvIHR1cm4NCmludG8gYSBu
by1vcCBvbiBTU0JfTk8gaGFyZHdhcmUsIHRoYW4gdG8gZGlzYXBwZWFyLCBlc3BlY2lhbGx5IGFz
IHRoZQ0KTVNSIGlzIGV4cG9zZWQgdG8gZ3Vlc3RzLg0KDQpWSVJUX1NTQkQgaXMgb25seSBvZmZl
cmVkIGJ5IGh5cGVydmlzb3JzLCBhbmQgc2hvdWxkIG9ubHkgYmUgb2ZmZXJlZA0Kd2hlbiB0aGVy
ZSBhcmUgbWVtYmVycyBpbiB0aGUgbWlncmF0aW9uIHBvb2wgd2l0aG91dCBNU1JfU1BFQ19DVFJM
Lg0KDQp+QW5kcmV3DQo=


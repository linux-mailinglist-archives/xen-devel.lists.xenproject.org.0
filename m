Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E14DCB1D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291672.495225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsqT-0000xR-8n; Thu, 17 Mar 2022 16:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291672.495225; Thu, 17 Mar 2022 16:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsqT-0000vF-4Y; Thu, 17 Mar 2022 16:19:25 +0000
Received: by outflank-mailman (input) for mailman id 291672;
 Thu, 17 Mar 2022 16:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUsqR-0000v9-DL
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:19:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff828e64-a60d-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:19:21 +0100 (CET)
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
X-Inumbo-ID: ff828e64-a60d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647533961;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=A0rxCl6BuqrJGmVUpAJ5lvZd2V6Vom0RNBwPgn/WC3s=;
  b=IjKtrcDHiRkOS3y1dhIu3zvQE+5X3ZDHRoLr6/7Z5p5T1SCOzO3kBqoG
   KsoZSr2iXhVTOM3XfFV/MviNylOWdaJL2Y680GM0Z7qYuE0dJWMcLeJYw
   iHrR4DdSr88Bw/91xRy6/arPy1W3Baj0EAkr4KsWsUYGZ15Pw1Jr4+scH
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66923984
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3dd4xqzmtArB3q9Iq716t+cKxirEfRIJ4+MujC+fZmUNrF6WrkUCx
 mdMW2yOOv+OYzejco9yPITi8UgA7MCGyYNhTQY4+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplu8S8RiIuN5bwnOUHTSN3KyY5bJYf5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZtDMms/MHwsZTVQGw4ONK5gh9ymm1jvWBQA92O5j4A4tj27IAtZj+G2bYu9lsaxbcBchEORv
 G/F12X/HBABNdabxCaF83SjnevGl2XwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c8VUO/037keK0KW83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTI3vLKwTnumyrOVty2IFhASaj45PDBRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNERz3pxZPmqgKvFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i6Cq2LN4AQOscsHONiwM2ITRTMt4wKuBJw+ZzTx
 L/BKZr8ZZrkIfkPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9c8zvoPybuQo
 C3Vt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeVPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:Kajvma75SawlHsKelQPXwWaBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+873WBjB8bfYOCAghrnEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpcdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwseOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNU0H4oJ69Pxkm13imhAdVZhHod
 J2NyjyjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1VwKp5KuZIIMvB0vFuLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZMyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR+2Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NKwgFCvsukKSRloeMNoYDaxfzO2zGu/HQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66923984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8/iHo9GsqtAq+dKn+Y2WxKsnCrQlaDT3S4pBPm8kAuFTUYw01s+vkZOksX5DDjjTVcP0WXHkn2WTb39ukGwIsKXsBVn0QZXmCigixOJDxZqegvMlJe1ls4xO9wjik5/SuBjDhvde/b2KFdsodDMAHVHHLwzrpHkAFn8oXy94jY3ldrFq3+y1HjC6S97C39yeqzlF0K5Aib4nlTPn1Y1eUIpjfYP3iVNmoEnNN8Yj/Hv/2S8SsOnH4mTHZs6avCXvdFdn0mv9Az9xxoh86gw6dhm0bZ/5uJX9eDrl70AD3YfPI0tXQTFomToRaWJajgYk/VNCfawc4JuCNMJCVFBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0rxCl6BuqrJGmVUpAJ5lvZd2V6Vom0RNBwPgn/WC3s=;
 b=npnrySYyew/mCTQw54YYVEJf8B1ODqxbyxxEXwr8PThu7q6jmbmhCngb/gHESAd0Usrfvsl0+1ycwulZ1cbEAuovlc4OZ5Lt7tmBreIKBia4tLMMpoPmQuHh6nuv3ZJAMxN8MVLh55P/Y2ye8T4LU5uT9+BTbmFAyu7Wyhww1EZWSp8E46Je8qi+IEZYRA80CJCKVL5hR9glBWq9Wf2Mjz/1t/sUM01nDGKFURiaev5fJeVdT2pZiVuVti7sLLlCX+UyAhUeR4TTd1qEqepEw/6erhCCBHzNMCrilOTxMqFThHYsfbFAjAlShi0LKlphbAGQrIQJEn8DkJoPH9fSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0rxCl6BuqrJGmVUpAJ5lvZd2V6Vom0RNBwPgn/WC3s=;
 b=uFXDSdgFiV523KFHn1ElaeG7Gl+i5LPuIxa57Zug8AE7T8Ldm+iH+x1qp5mA9PhA3zvaEcui8yWsUZdwYRaArlU1OllLx0ZjCEm4jGACeuG8cwU5W+qakIy+8n9BKX0YgiMEeScDwZt5vFavbrff7Qi0faW9DB+rHIw9oFUqoys=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Thread-Topic: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Thread-Index: AQHYOI1bRL6jiuzp4UWoineooRKJ46zBsAOAgAC1YICAAOkogIAAdcwA
Date: Thu, 17 Mar 2022 16:19:07 +0000
Message-ID: <f6d2ce09-5a02-5e73-7232-5f0f79e8b39f@citrix.com>
References: <20220315165340.32144-1-andrew.cooper3@citrix.com>
 <345b2f17-5fba-5dba-f7f5-c1634fc69a6e@suse.com>
 <101d1e70-51c7-036d-c5e2-fd382a2be7a8@citrix.com>
 <2adbd1dc-38f9-21b2-b38a-06835aa164d0@suse.com>
In-Reply-To: <2adbd1dc-38f9-21b2-b38a-06835aa164d0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 379fc85b-5710-4f06-4b38-08da0831dc75
x-ms-traffictypediagnostic: CY4PR03MB2773:EE_
x-microsoft-antispam-prvs: <CY4PR03MB27732F6AAD4129CBF573EE88BA129@CY4PR03MB2773.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: goD1ibtoi70EOVjklunY3govIxW7HuF7D3JBYgQYicgUEHVA2VeueuC+DBDkc0wXZLOGtES9gYVHwJlW2pHPediDB5VJwOuirfUdzbORDPS4TrW6O7wmHt3YHmpEeZOsMpUblnEG2D0uCAmKRHWbjkffhsWv6Q98aJdzr7qZ01N+oY/rqHAe5SeaySxjFFyPyUcIaUch5xQaoZfhTjQcoDF2Bg1bS4QYsR3H4LZsKyrIqsUFCrr1Kr29ImzX70mhDPCCM/TEZ33Zi6bAhDOxQKmYzEwLxE7rIRx9ICQVdyAhQ1wL8403EkWq4T08oaxEGhRI/Cq3kt+fhkDXqjVcvrt3nDOQsYQv7hvmxXDbm9A2zEtihGB0ZNdRLw1G0ce9OIC+nDKbSKd3yvuHscpf0W6xxZ/2psLvbFE/Ga5xpK0qZXFMhaIJsDknmfT1+dAQUrM2iUQekWNhwo/ngyP8ICvCRn46k5GrlSixDltgOwlwZVWtfodFGPgNtWvddebUQ42q021Ocn/7p0k0gcvxLH2ETh0XcmNITCjoEZbbSLDrALsJNB3f1rQYWSXspZJy/7qw4/6yY3I2X6f3+F8pq27Fj9uJg//J/+1TiZiIukKNt3jkbGCcPO+xvr3Gc0AP3bbg5zVvKo0Oc2Q46iRcnZl75Qwh4yYFOvAuU4ZHSMOWl0ZmG3Yu0MggBD2yBuD6aPw4w1Vu+JYjzIVSBiO/Vg98Z+wLwHze6pLF75kqUMBaEB3HSWuuzCadOm5AJoszKA5fHMbbba8tyV16EPb6yw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(38100700002)(53546011)(82960400001)(5660300002)(122000001)(508600001)(2906002)(31686004)(6512007)(6506007)(71200400001)(38070700005)(91956017)(4326008)(2616005)(76116006)(6916009)(6486002)(8936002)(83380400001)(26005)(186003)(66556008)(66476007)(66446008)(64756008)(66946007)(31696002)(54906003)(316002)(8676002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2JrQmNVU0tYTzlaam0xODE5R2lXa21hNXFhbi94WGYyUEJLZFVUWlBINFJI?=
 =?utf-8?B?TTRQVUtkUWEyd0dmQ2cwb2ZYSjJJU29vRmhCMk5FNFh3ZHh3bWlsZ3NzeEta?=
 =?utf-8?B?V0pyR0RHejVXUGFIaTRPcU4rZkpxdjJXeCtzQUlZVW51dlE5MU54M1BLMmF1?=
 =?utf-8?B?UlVDL094YmFGSFNHclFKUjlSVjZEajZXNWRaOXhibjRmOXJyYkM2eGh6Ym1a?=
 =?utf-8?B?c3k1MzI3OHI0ZVZxLzdRNTcvcWNNNUN4RTg2RnZHZ0VqUmhiUEd6VjIvbEZr?=
 =?utf-8?B?OEtCUVFQakhYT0JJVm9tM1hPTW9iYWk5b3ZLejllVDRwYXBOSzQzRE13T2ww?=
 =?utf-8?B?TWxSZnkrOFI5bzhEZS9TTFl2N1I5Z1hrcTFvenY0NlBqbUpTTE5LQ3RsSTZv?=
 =?utf-8?B?SVZPem1uOGpvZ0NPalFNWlhpRS9yWnk1NXF4OG40aUhtT3FhY1czNWZ6cXoy?=
 =?utf-8?B?Z3BEVTBXVEZxYVNnZUp1dkpHaFBySXY3dHlzTHZkT2xuNTRmZEQ4bC84M0gx?=
 =?utf-8?B?Nm9RRXJQNmlPMVEwSnRvUWNRUGQra3cySzZEN3NxWWpLZHladm43elYyZjN2?=
 =?utf-8?B?cVJzNjhGOFNjdkxPdUVCZkhNOVBER0RZbmtoZnFWVERqWmVpeDVjenFGZkkz?=
 =?utf-8?B?VTRwdTl4RG00U1kxa1NCQmt3R2dac3JjYVRZQVlYU0ZHY2RiUTE5L0Q0N3BD?=
 =?utf-8?B?VVBGcWhkTU1LdGVDVWFxd1hRZ3NQa3NNTWlhVTVJcUw0UHRuTkIzdFJ3MWlz?=
 =?utf-8?B?SndUaEdYcXloVlhLQlBpQVBvcGJ2UlFkWjV3T01obUwyeEI1RlF1Uk02TE9u?=
 =?utf-8?B?UWNhWFRQdFAyRnhROU8vMFdPRis0VEtmUFNnb2RSV0xtUkx0MkU2Y3dCa3NO?=
 =?utf-8?B?N25MZHg0cDg5cXdza3czc3hXbDRTYlRKeFNXeE16M1ZCN1MvZUNsSDhPMitK?=
 =?utf-8?B?U21DbUFQVjhkZi9qSk5zM1VIL3JYYkF4NHdQQ3A5eWFnT3V2dDBidzA3aGhS?=
 =?utf-8?B?ZWhsajkyVDJoek9oci9MSlppbWx5VmJsTWpxSHZCQ2oxa0xRdEgrOTFLcy95?=
 =?utf-8?B?Wmk5VEYxQVA4eW93NWczRnNKaTlRTnpDWEJpMlFDb2NENklvZXp2Vm16UkIr?=
 =?utf-8?B?SzFGZTRaZlpLaXEwK0NhTTVNVTZzNEpBSDBQZnRlZ1BxVjdMeFFsQXY4SVZv?=
 =?utf-8?B?Rjlrd2c0YS9vRmNpWVdVU0pJY2p6NTh5K1pVdW1vb0ovM1kwcmJhR0xaem0y?=
 =?utf-8?B?eUhWZDhETzAwcnZhK1Ywc2V3YmVvVWhsdzlXWkZnYWl6K1VGUHQwZk5Rclhw?=
 =?utf-8?B?Q0k0aHA0NGRLMEUyblpLMUV5SEU3cnM5SEN6QnpwVUVuaWdwbGNzdzZBY1lR?=
 =?utf-8?B?bEhQdU90MktLSlIrc3pVdS9HeGIvOFZsdmZTNWM3UW8xeCs0QjFaemI0NWEv?=
 =?utf-8?B?eE9rK0hNOWVITzhvRlZib21yNzJnbUFNQ2Vyc0xaZUNVVitYOU01eXlaUCs3?=
 =?utf-8?B?V1RNL3M3Z1V4Y3doQXIxNTE4aVJ2NEtOZTY1a2d5ZGRZWmQrS0pIVW0wbnc0?=
 =?utf-8?B?QnhLOVJGcXF1QVFSc2VwNU14WlNwSzQxbXF3NWZrYkNUT1p1WDRPYmNZcmdI?=
 =?utf-8?B?cDlnRzVLVUt1Mk1JSUt3dXBmMnN6Z05hSWttRk12dTBrWWFOV2tPbm9YVG4r?=
 =?utf-8?B?QThzd2tqcW8wRlV1WGpUaWprOU1MOEJHdVJzVG1FRkxHK3M5aW1XWW8rQmJh?=
 =?utf-8?B?a09kN3JyaXltNncxMDlGcWR0S21QSWJBeXRINndtTDg5Zk5XRWFQNHl6OW80?=
 =?utf-8?B?YnFWa1lmZUh2bUlkYzl0aTVHZVBCcHQxWmVUZHBVNno1aXI0RlBjeTlXLzRQ?=
 =?utf-8?B?MlhTNG02Y00zQnRyLzJIMUxKeU0xVXhMcmdBYWxCK2g3RS8ycEgreElXYTIx?=
 =?utf-8?Q?zpAiOaZUhJ+zhocODSCdbmvTkORSJWx+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F34CE0DA9EB0E044858465F763A7EF4A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379fc85b-5710-4f06-4b38-08da0831dc75
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 16:19:07.0503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sux/Yd2IG4VUUCzazX4I2nxk852LEzbKpizTFschxYouAy015nnV60BRy0oGJfYIGD7h3DrUrTqvZTUPGAMcD7RE+hwuvVkapo4alwXGhO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2773
X-OriginatorOrg: citrix.com

T24gMTcvMDMvMjAyMiAwOToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjAzLjIwMjIg
MjA6MjMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNi8wMy8yMDIyIDA4OjMzLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNS4wMy4yMDIyIDE3OjUzLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni94ZW4ubGRzLlMNCj4+Pj4gQEAgLTIxNSw4ICsyMTUsOSBAQCBTRUNUSU9OUw0KPj4+
PiAgICB9IFBIRFIodGV4dCkNCj4+Pj4gICAgREVDTF9TRUNUSU9OKC5pbml0LmRhdGEpIHsNCj4+
Pj4gICNlbmRpZg0KPj4+PiArICAgICAgIC4gPSBBTElHTihTVEFDS19TSVpFKTsNCj4+Pj4gKyAg
ICAgICAqKC5pbml0LmJzcy5zdGFja19hbGlnbmVkKQ0KPj4+IE5vIHJlYWwgbmVlZCBmb3IgdGhl
IEFMSUdOKCkgaGVyZSAtIGl0J3MgdGhlIGNvbnRyaWJ1dGlvbnMgdG8gdGhlDQo+Pj4gc2VjdGlv
biB3aGljaCBvdWdodCB0byBjb21lIHdpdGggcHJvcGVyIGFsaWdubWVudC4gSW1vIEFMSUdOKCkN
Cj4+PiBzaG91bGQgb25seSBldmVyIGJlIHRoZXJlIGFoZWFkIG9mIGEgc3ltYm9sIGRlZmluaXRp
b24sIGFzIG90aGVyd2lzZQ0KPj4+IHRoZSBzeW1ib2wgbWlnaHQgbm90IG1hcmsgd2hhdCBpdCBp
cyBpbnRlbmRlZCB0byBtYXJrIGR1ZSB0byBwYWRkaW5nDQo+Pj4gd2hpY2ggbWlnaHQgYmUgaW5z
ZXJ0ZWQuIFNlZSBhbHNvIDAxZmU0ZGE2MjQzYiAoIng4NjogZm9yY2Ugc3VpdGFibGUNCj4+PiBh
bGlnbm1lbnQgaW4gc291cmNlcyByYXRoZXIgdGhhbiBpbiBsaW5rZXIgc2NyaXB0IikuDQo+Pj4N
Cj4+PiBSZWFsbHkgd2Ugc2hvdWxkIGNvbnNpZGVyIHVzaW5nDQo+Pj4NCj4+PiAgICAgKihTT1JU
X0JZX0FMSUdOTUVOVCguaW5pdC5kYXRhIC5pbml0LmRhdGEuKiAuaW5pdC5ic3MuKikpDQo+Pj4N
Cj4+PiBXaGlsZSBJIGNhbiBzZWUgeW91ciBwb2ludCBhZ2FpbnN0IGZvcmNpbmcgc29ydGluZyBi
eSBhbGlnbm1lbnQNCj4+PiBnbG9iYWxseSwgdGhpcyB2ZXJ5IGFyZ3VtZW50IGRvZXNuJ3QgYXBw
bHkgaGVyZSAoYXQgbGVhc3QgdW50aWwNCj4+PiB0aGVyZSBhcHBlYXJlZCBhIHdheSBmb3IgdGhl
IHNlY3Rpb24gYXR0cmlidXRlIGFuZCAtZmRhdGEtc2VjdGlvbnMNCj4+PiB0byBhY3R1YWxseSBp
bnRlcmFjdCwgc3VjaCB0aGF0IC5pbml0LiogY291bGQgYWxzbyBiZWNvbWUgcGVyLQ0KPj4+IGZ1
bmN0aW9uL29iamVjdCkuDQo+Pj4NCj4+PiBUaGVuIGFnYWluIC0gdGhpcyBibG9jayBvZiB6ZXJv
ZXMgZG9lc24ndCBuZWVkIHRvIG9jY3VweSBzcGFjZSBpbg0KPj4+IHRoZSBiaW5hcnkuDQo+PiBJ
dCBhbHJlYWR5IG9jY3VwaWVzIHNwYWNlLCBiZWNhdXNlIG9mIG1rZWxmMzIuDQo+IEhtbSwgeWVz
LCBhbmQgbm90IGp1c3QgYmVjYXVzZSBvZiBta2VsZjMyOiBTaW5jZSB3ZSBtdW5nZSBldmVyeXRo
aW5nDQo+IGluIGEgc2luZ2xlIFBUX0xPQUQgc2VnbWVudCBpbiB0aGUgbGlua2VyIHNjcmlwdCwg
YWxsIG9mIC5pbml0LioNCj4gbmVjZXNzYXJpbHkgaGFzIHNwYWNlIGFsbG9jYXRlZC4NCj4NCj4+
PiAgSXQgY291bGQgdmVyeSB3ZWxsIGxpdmUgaW4gYSBAbm9iaXRzIC5pbml0LmJzcyBpbiB0aGUN
Cj4+PiBmaW5hbCBFTEYgYmluYXJ5LiBCdXQgc2FkbHkgdGhlIHNlY3Rpb24gaXNuJ3QgQG5vYml0
cyBpbiB0aGUgb2JqZWN0DQo+Pj4gZmlsZSwgYW5kIHdpdGggdGhhdCB0aGVyZSB3b3VsZCBuZWVk
IHRvIGJlIGEgd2F5IHRvIG1ha2UgdGhlIGxpbmtlcg0KPj4+IGNvbnZlcnQgaXQgdG8gQG5vYml0
cyAoYW5kIEknbSB1bmF3YXJlIG9mIHN1Y2gpLiBXaGF0IHdvdWxkIHdvcmsgaXMNCj4+PiBuYW1p
bmcgdGhlIHNlY3Rpb24gLmJzcy5pbml0LnN0YWNrX2FsaWduZWQgKG9yIGUuZy4NCj4+PiAuYnNz
Li5pbml0LnN0YWNrX2FsaWduZWQgdG8gbWFrZSBpdCBlYXNpZXIgdG8gc2VwYXJhdGUgaXQgZnJv
bQ0KPj4+IC5ic3MuKiBpbiB0aGUgbGlua2VyIHNjcmlwdCkgLSB0aGF0J2xsIG1ha2UgZ2NjIG1h
cmsgaXQgQG5vYml0cy4NCj4+IExpdmluZyBpbiAuYnNzIHdvdWxkIHByZXZlbnQgaXQgZnJvbSBi
ZWluZyByZWNsYWltZWQuwqAgV2UndmUgZ290IHNldmVyYWwNCj4+IG5hc3R5IGJ1Z3MgZnJvbSBz
aG9vdGluZyBob2xlcyBpbiB0aGUgWGVuIGltYWdlLCBhbmQgdG9vIG1hbnkgc3BlY2lhbA0KPj4g
Y2FzZXMgYWxyZWFkeS4NCj4gSSBkaWRuJ3Qgc3VnZ2VzdCB0byBwdXQgaXQgaW4gLmJzczsgdGhl
IHN1Z2dlc3RlZCBuYW1lIHdhcyBtZXJlbHkgc28NCj4gdGhhdCBnY2Mgd291bGQgbWFyayB0aGUg
c2VjdGlvbiBAbm9iaXRzIGFuZCB3ZSBjb3VsZCBleGNsdWRlIHRoZQ0KPiBzZWN0aW9uIGZyb20g
d2hhdCBtYWtlcyBpbiBpbnRvIC5ic3MgaW4gdGhlIGZpbmFsIGltYWdlIGluZGVwZW5kZW50DQo+
IG9mIC5pbml0LiogdnMgLmJzcy4qIG9yZGVyaW5nIGluIHRoZSBsaW5rZXIgc2NyaXB0LiBCdXQg
YW55d2F5IC0gd2l0aA0KPiB0aGUgYWJvdmUgdGhpcyBhc3BlY3QgaXMgbm93IG1vb3QgYW55d2F5
Lg0KDQpTbyBjYW4gSSB0YWtlIHRoaXMgYXMgYW4gYWNrIHdpdGggdGhlIC5pbml0IHR5cG8gZml4
ZWQ/DQoNCn5BbmRyZXcNCg==


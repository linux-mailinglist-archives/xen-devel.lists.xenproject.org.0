Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5041708E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 13:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195304.347949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTivF-0000V1-IJ; Fri, 24 Sep 2021 10:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195304.347949; Fri, 24 Sep 2021 10:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTivF-0000Ri-Ec; Fri, 24 Sep 2021 10:59:17 +0000
Received: by outflank-mailman (input) for mailman id 195304;
 Fri, 24 Sep 2021 10:59:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27y=OO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTivD-0000Rc-RV
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:59:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 745d2c8a-1d26-11ec-babe-12813bfff9fa;
 Fri, 24 Sep 2021 10:59:14 +0000 (UTC)
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
X-Inumbo-ID: 745d2c8a-1d26-11ec-babe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632481154;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FlwNEC52HeN95IM3kjyUNPqzSxw77wc9w4VwtcGC+pA=;
  b=YWwQxxnxmzlYQlgJR8DwJA02UzUOtgPEcyMBmPxylTDfO6GbM1icDDX5
   I7vVdRIn+hQqTGEEWmHE8hG9qU0Bp7nCd7MO9CFIQLy3N/lMSP5ytcg/Z
   bFVIlRUDJrXbliIOOdXgFzeVsQHdKfpdwU5IlyviL+8dcbpXLTYwSQ+N7
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TyOn3jP3+h8p18ls447RQWQkuy0t6ljSkRfr1JlZscvEID/oWuXdZnPQwBpiNbAS1R2Kr4TX6u
 bVq0l3H5/hr3V5QHaQ2VS2cSpxjFvpyiZV8hgYD1kI8m8O4mAc3YIusIuRQJv87Rcg1Nb2rp44
 SoEKsMQqSPKE3wzCJwFHPLXDgFTMYKCKvHimyzY2IU6TMaON7PFg8FuiKpQS2ytjpGm6fLRId1
 lJD6OAcj1l+RHZZed1/xvxU/08mNzmbiQyiom3Ny2Zn8sG9utAWsnqXPW1aK3wjOt1o9Fq3sGS
 j9KM0R4Fs7B/mzMgkQ/8tbXN
X-SBRS: 5.1
X-MesageID: 53126583
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:n82gU68TAONO6zREhsmZDrUDWHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 jBMUG7Qb/uMYzemLtAiOti0pktVscCExoRrHVdppXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhey
 9hs5LWUcz1yFa7Mv+E0Ax1GTRthaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFh25q2J0eRp4yY
 eIFYxd2QUnqZSQWOw4OVLE7nO2StGnWJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCskR0Reot5N9cAsyqOyo3RyladGDY+UWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYndOcDVcDcMQZU5cuYCy/d1q5v7aZos7SMaIYsvJ9SYcK
 txghBM3gakaxeUP3r+ylbwsq2Px/sWRJuLZCwO+Y45E0u+bTNL5D2BLwQKChRqlEGp/ZgPa1
 JTjs5LChN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu2sifh00bZtYJWWBj
 KrvVeV5vsQ70JyCN/MfXm5MI55ykfiI+SrNDJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 c3zTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CrajPXWHrdBJfTjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX2RUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:nQzN+65+GXxnguSJHQPXwVmBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L52gkBrsA7ciYsV9MOOA42e7rANoX8e2O+DIusGyWTKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.85,319,1624334400"; 
   d="scan'208";a="53126583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGu5e44a/HA3S6UT4ywYX8gvbV5YlV3tF3V+W8RdVuRPMOrQnNlLlpx2+8jmmHYS2cR+06TcSy9Iq1uvp577EFrg+3SSHOzo4rnzhSkVBBCROnJT7snT/KvXqrvweOCawmG+a/NglYLm41qA0QrTc5lRj6fVxtwW51j5k6g5UD+uS0z816M3FkKSlaVghzyJhhRkOg9bLeaC/iZD3ijVYv4yscN00ZP/tFCXE5a9/H0uErVlecHeuv4rKquApLWLTSAhTWSznZWPfxauae+MWtwjLG7rPNyyJbFoBiCyegM+fzP/jVSs37A2W3skh/GYon5GHtF8APhnEnxNCE7rKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CLNmb92P0u42Xt8YjmX35du58AFKhSE3OO/HBV0QoXM=;
 b=RzCnb8czC/LKifAIoeWv5lGfLvb3SlWXCuSow6qst31q691bxj2FSbOYPMJX8HxiBsme9hazEPmQP+yNPAc0lEPl0yWkuEUFKiVew8GNZE+AfyB63JI9Z7HPrLp+9pOmIo/zPVmrF2s8RuebPzvp+UDKHfJWJfZ/anynDtGIwKRVpWgjEoLDQ37zOYWmXffILSf+AcoOh57WBYQTIwY0O9CTLZKpeGCcoP7jN+m9azVGE5L1tkzZGxGZL4gC8LTIMEALNaaH9bXkxQOy0N9spSTkxqD/dyp0ZhddykBaGQX8YnC1qWGGccc1t9m9TqkT7HfP1ny7N9zVychoxss01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLNmb92P0u42Xt8YjmX35du58AFKhSE3OO/HBV0QoXM=;
 b=glFg20pk+Ted/9NrSpbTfdKuYFlJFCKVLFeHlsxLZI9b2c90Gik1bFdddYEnIzQDeDlESFNhSiKdM9ox2fjdHp3G37uqbmQK/x/y4YWyXsZWZVHxsarS0z7YvnJKCJ5hWMjW9qD+8MfAhPOF7RVORWm41ukey3TW9JYMzuQzFL0=
Date: Fri, 24 Sep 2021 12:58:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 01/18] AMD/IOMMU: have callers specify the target
 level for page table walks
Message-ID: <YU2vXU3UffSQ/iQX@MacBook-Air-de-Roger.local>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <57abd488-1fa1-8eae-66b9-196f32f7f4be@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57abd488-1fa1-8eae-66b9-196f32f7f4be@suse.com>
X-ClientProxiedBy: LO2P265CA0409.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16726403-a766-4491-8324-08d97f4a4650
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB48413071098E162063D9B4928FA49@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t75TIxo1YRrmX22yGU5+cQUC3zPV+T7Pj8CbBNl5FzTfqcqQeHxldUmpT36394ZELJ2lOz4idJYDc+wRDCDXPYsabqJCiyddYhsu+diuCudyocKZ5EB4oTrlCU4NKJyQ2tD67/gY5NIl+PU/tbdmf7Pu8wuPqVTgY7WPN8xKxMG5sWHGQXib0x18oW3f6JFNYeAdA7+Gm4vZZQrtx4XphxVaVR4/cP56mmBQ2Sgtwv+BPifPc+uB3CUgF4RQw6S2zVYkEGG9SjgBhQ7F2BnfmBJ9IUCkcMueMyAaQy8PKSvu9mdmtOeQvhaYO3952L0mGjMbquKD05wKP/4o9/I52//PV65toz64Q8EFE2mWxZG7rkF1w200/TtUzudN3YMbbwu0ywKl/kD2pqA15bqbfk7U+akSnSQ2UPIPUh+5cOeyhAtG9rPHicmawuVv5w5DPkylRgAtvEkyH5ryviZ/zT6p/isP4nM3axxK/yBOaoz3J3UZFnCrf+htw/NOKifF+Blp11avdxpj0K5+0w3hZiSQPXxhzl+Qn4HgNMez69S4TPahM3/wozsdrJ/JEq/Do9MctV/KxV61wd2ddskMRi4qfIDwhpnLg0S41dHuYMZmkg9Yer4+AqhEnJnNbwW6q6MUJ3OW8iW8LQQLU/0/ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(66476007)(6486002)(66946007)(66556008)(508600001)(9686003)(83380400001)(316002)(186003)(6496006)(38100700002)(54906003)(2906002)(5660300002)(85182001)(86362001)(956004)(6916009)(4326008)(8936002)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXU2aEpQa0dNRDVzc1dOUHowL3k2d2xhOE9TWDdxcG9CbDBQeitzaWhCcFFS?=
 =?utf-8?B?Y0RPRlhnSTZBdVRIcDZWU3I5cTlYVWtGV0Fxb0ZBdWsvbnBoMGJxUnJGejlS?=
 =?utf-8?B?K2NpczdiVTdMNWNrcjVONXVrWjlMOHJZTGJ2UHdSTWVvMHBqU0JxK2dJNGt4?=
 =?utf-8?B?VS9OQytEUmo5a2htWlhESnZ5NUNUS1p3YzNjZ3Uxc2JRZkFQLytkK0VKaWFL?=
 =?utf-8?B?YjNXME9uNThMamhlQmRLSXY2RzExamlmN25yUTFZVDNJOGUvVm4xVXkrcHVv?=
 =?utf-8?B?Z1didEJXTnRjWW9KbFU4MzZveGczS1ZWUmRzbkRkcG9Bc0g3UWs3YWxkTjhu?=
 =?utf-8?B?N1UwMEFJcGVLbmhhZUZlVTVYMUQ1NVY5cUE2YjA5RVBhbXRGWExXZVpLUjdr?=
 =?utf-8?B?eDl2OS9ERFVWRmRLTnlESmlMSVQ3TnpuTHdCaG9PNkp1N3B3VXEvSGFpVW4y?=
 =?utf-8?B?eVFUSWEyTGFzZGhSVlBMdUw2dUZqTUhWQmwvdDRpTWRXOE8yMHllWjZ5N2pC?=
 =?utf-8?B?Y0FDQXcwUFlsRTJDdzRGVXZMK2ZIQ1lKdzZaTzU0eTZTNmVCSlZYRzdtVlpS?=
 =?utf-8?B?VWZuMVJjWUJGdUhhYnFTbStUNll2OVJ3MFhrN0tWcDZNY2NlN2Fxblpqa2dE?=
 =?utf-8?B?aDlFTzk0d04ySWpLalVRd0Z4VlAyaHdEZkpnTGhBY0Qwdm92Nm9iMlRRWGdo?=
 =?utf-8?B?TCtxZU5GNXFNZW1ndzVrbnFCZnI2WjZXSlUvNzdmekM1WnEwcENLUFpYQy9Z?=
 =?utf-8?B?QlB0NU9Gd21CVE9oZ3hXa2NQU2RLcXJMVDBYREVnNDBxSTFTSStNbEJEOHBh?=
 =?utf-8?B?ZUdwMUhFb3NEWkl5L2dDK0JMYmlxVlFkUnpLdkJzd0VWU2ljVTZOeVFMWnli?=
 =?utf-8?B?VlYvNUVyT0cvWnU1bGl2VzFUSlpYTUV6NytmQkRnUTJqcklkeE9IaXhPNFk5?=
 =?utf-8?B?SnppSVl0UTlPMWxXU2lYRGdmcE1JM2tSR3FBRDBJSmFMY1NGQlVQSmRPOHBY?=
 =?utf-8?B?ZVpicmpjcHk5NlRXdVJlU0ppQ1lLZGhRckJ3YVdKdVczUG9sT0RmRmVWTFpP?=
 =?utf-8?B?WjdjbmllbTh3VmVMT1VId1VhUXZ5c2h1Qk5CQXhpcEtROWVTU3o0N2F0ZUZV?=
 =?utf-8?B?ZWRvOGU3OVNvRXhKMEtGQVhndHdKUitqVDRBYzU1R2IzY2ZzL0VKaVFsbWhz?=
 =?utf-8?B?eUZtWjdyQlVjT3F3VU5qeHp0a3Vkek9RYngzQ09xdWVkbzUvcTFaWldKYWx2?=
 =?utf-8?B?emdXSmlHRURHdDVNRDVweUJlVVB4TjNMajVzK0E3YW5TaWtGcDRHYUdjZno5?=
 =?utf-8?B?bXZOaTJoeVlrWFJaYUZ0MUpvU2d5OTFzVkdGZHR4cnc1dms2bjZMeWxGTWxi?=
 =?utf-8?B?clppUFl3OXpFRG1BUHRWWlUremVnMTRlb2xmRThZV2FVN0dQTWRKQmw2V1Nz?=
 =?utf-8?B?RU1yU2t1cUhJMUVyU2J5aGcycUkwc3NiSS82QzhwTG4vNTZSK0puVWZRQnQw?=
 =?utf-8?B?UWF5cTlwNjEwdjJvc1hIRTVYN1BXSVB5OFYzUk9uNjlqVlp4OXRBemp5UEoy?=
 =?utf-8?B?amloNE15MEdoRmU0eEdXb0t4cUhTbUVyUVBQSDQrTGlzY242V20rVWpwNXRJ?=
 =?utf-8?B?c0pQS253TDBRcG00cWh0Si9yUVF6NnBXUDdGT3dQVXl4THlJbUZqM1Y3NEwz?=
 =?utf-8?B?Wm0zb283aUFjNXdHS0FiZ2VEYm13dzBwWE5sS3p2UjB1S1ZOejBJeUtCVGUy?=
 =?utf-8?Q?6KSKc4ERmh70QjtCptVMU2BVD+N/hW87rOXFWvR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16726403-a766-4491-8324-08d97f4a4650
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:58:43.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+KDbdT6tMWlTKo8uDmIV0sUMca4c0SVjSqqZ9O1FyVJRRKeutg/9e957h1VcaOrVYR2jZ4Z4/rN9MCYFRBD3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:41:14AM +0200, Jan Beulich wrote:
> In order to be able to insert/remove super-pages we need to allow
> callers of the walking function to specify at which point to stop the
> walk. (For now at least gcc will instantiate just a variant of the
> function with the parameter eliminated, so effectively no change to
> generated code as far as the parameter addition goes.)
> 
> Instead of merely adjusting a BUG_ON() condition, convert it into an
> error return - there's no reason to crash the entire host in that case.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -178,7 +178,8 @@ void __init iommu_dte_add_device_entry(s
>   * page tables.
>   */
>  static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
> -                              unsigned long *pt_mfn, bool map)
> +                              unsigned int target, unsigned long *pt_mfn,
> +                              bool map)
>  {
>      union amd_iommu_pte *pde, *next_table_vaddr;
>      unsigned long  next_table_mfn;
> @@ -189,7 +190,8 @@ static int iommu_pde_from_dfn(struct dom
>      table = hd->arch.amd.root_table;
>      level = hd->arch.amd.paging_mode;
>  
> -    BUG_ON( table == NULL || level < 1 || level > 6 );
> +    if ( !table || target < 1 || level < target || level > 6 )
> +        return 1;

I would consider adding an ASSERT_UNREACHABLE here, since there should
be no callers passing those parameters, and we shouldn't be
introducing new ones. Unless you believe there could be valid callers
passing level < target parameter.

>  
>      /*
>       * A frame number past what the current page tables can represent can't
> @@ -200,7 +202,7 @@ static int iommu_pde_from_dfn(struct dom
>  
>      next_table_mfn = mfn_x(page_to_mfn(table));
>  
> -    while ( level > 1 )
> +    while ( level > target )
>      {
>          unsigned int next_level = level - 1;

There's a comment at the bottom of iommu_pde_from_dfn that needs to be
adjusted to no longer explicitly mention level 1.

With that adjusted:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

FWIW, I always get confused with AMD and shadow code using level 1 to
denote the smaller page size level while Intel uses 0.

Thanks, Roger.


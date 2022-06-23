Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC3557656
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354675.581926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ipy-0001DU-JE; Thu, 23 Jun 2022 09:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354675.581926; Thu, 23 Jun 2022 09:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ipy-0001A6-Ei; Thu, 23 Jun 2022 09:09:18 +0000
Received: by outflank-mailman (input) for mailman id 354675;
 Thu, 23 Jun 2022 09:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4Ipw-000897-MM
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:09:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26a19b9e-f2d4-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:09:15 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 05:09:12 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5934.namprd03.prod.outlook.com (2603:10b6:a03:2d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 09:09:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:09:10 +0000
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
X-Inumbo-ID: 26a19b9e-f2d4-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655975355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=OF2CzC+bWI3f3T0/eu9SANLSdkZxiLCzkxGgWpLBBxI=;
  b=hwq81MrLzia6qQmuCxCOLZIWQjsY8w+47qVGqCMaesdZ0qOWKguAk9HX
   Ev1VeJMM7IRnqp+dK+M88w1D1uehg8jsoOsp9NwOwYWMdnW6Kz6ejqyqF
   61XIFdM1+ZliUD0DC8aQU+Ej5HnGD4V9wxgW8uooP/q1yQjv53y70jGgJ
   o=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 74238752
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6I60TazxyyBFzM3BUTF6t+crxyrEfRIJ4+MujC+fZmUNrF6WrkVSy
 2AYX2qDOfqOa2Whf9x+O42x/RtSvJeGm4UwTgU/qCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY224LhX2thh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6oeCTyMYPrH2vr4nTCUCFCdyMoZLweqSSZS/mZT7I0zuVVLJmq0rIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTvYcwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgL2cD+A3I/8Lb5UCN6iFy9ITkG+beRfCvHptut2ikq
 HnZqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZtvgWxy1plaUsxhaXMBfe8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQ10
 neZktWvAiZg2IB5UlqY/7aQ6D+3Zy4cKDZaYTdeFFNdpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2MNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:Vx0PcKjQOC3+o6eAX85nC6/Lm3BQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hqAV7CZnichILMFu1fBOTZslnd8kHFltK1kJ
 0QCpSWa+eAcmSS8/yKhzVQeuxIqLfnzEnrv5an854Ed3AXV0gK1XYdNu/0KDwUeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74238752"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWJ7k2bBkOkTZTd3ye3feMu26XbxTtzJl0seZxBPAE0LPm4CA4Ma/MZ8OL+Y95vj+JPf68zYZzfXss8bL+Ch9KwyI/emSAvIbfhgPUR75Ehw/uvEVLiCU7DQHObOtoU3ZVVQ12sUygsr8/Hzft4IZ9kTZcs31bL0s3/Lb3Shv/LJmzwLoFbHi9AOW5XByeNTYmkkghm6zGqPf8/eHiy0hAx1vV9h+tTr6w3zRUhzIzFn/BG+Trjw46nHy6FDX2yrz22BfIyydnWNYogKWPjSGQiRH1k4D6od4CE6+2HdKeNqyg3ujxVKw65bHw2qQWiqmynLd0XUnS09ef51psYcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2oFt1bNuAp5BzqF/NN2ssNn38HZUPDDFxLmM49o1TQ=;
 b=WwQEPX8CH5YJo9imTWpSHZSkOSu8KgOxTd7zjYri+ZTIe8m9iXVD+KQeYNHrn8hwSRnW3lFuZ8orpE/ht7CagJODoyC4/IamAEfZV8LY8AzPb+iEYOnzRXF6OBGxs67q7u2Anmmz81k2cLuF/XwjWDHf2Sm8AA02taVGPOsMDcsg6iUaKIjTB3s4cNi6TVf8kxhrzPr6OgCdwV+1vcs/urN1ipXQLCup5HQpnbr8GzUMyf1PNTFWA9RZQqgKUV9ShQwmTgak8s9LHaa/DGH0n6mhyh3MEXo62TaVAPZ9A9UOXgT6RjnU2dLyJDmXt7u24HZBZoMNztYgancKww9crQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2oFt1bNuAp5BzqF/NN2ssNn38HZUPDDFxLmM49o1TQ=;
 b=OAl6eRHqVB7np4WUjXpx7gyT1ZEIlmJAJETClTJp/OmjLHLO/5yadDUJ3j7BlFzvZtZHeJ0pQ6Ygxed+8Qz3dydG4r/bHo3TNLI/kysQeSQtgWzJ20I8Qp+q2R9BIwuTc87c2SJQ9EJApR4zeL4TOk/ALsKAGyOX95qLU4ebE7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] console/serial: bump buffer from 16K to 32K
Date: Thu, 23 Jun 2022 11:08:52 +0200
Message-Id: <20220623090852.29622-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623090852.29622-1-roger.pau@citrix.com>
References: <20220623090852.29622-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e418b339-c4a3-4ce6-d492-08da54f808ff
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5934:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB5934BC3B61D9E4ED7717A7BD8FB59@SJ0PR03MB5934.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DgALAtNb46lUg3x5ZOiFyZbCi9L6mzrVaQd6oCpsrASfGU9y0BTr/pXZ5dLzZguCJrdqBL38CivgXdaZPhoZ6BbBacYCc6/IS8nbv7e07F8OQNZUjrnkuXI0KH0fSCIQBEkLuCKdNqlYd0r7apTfxYkyvukiSG7gXPie1m+Z4FSSfhHO+Yc1FvJzeoNDJVik1qRpvG3JOveBJT8JjTPiJxXTVVkfOM86B90sng8Sr82ATCsVvVGEVl0hsmqvtAQ3ad1gocuOlEH3NsLP/bbioe32hyRYgL5aYyZ/5fTrzHVqwnW2Rsw2C1eh46ymDs7CVyzIvzbI/jzgIbl5+89RDco9fbF252q134IcwXrC7b+DcUgNeqnTuvhiWuR+v1nEuP71rzrZl5ycJnNFcWUJazEKJjbbtyuzse+ISbfAAHsjeXQDF0ZJXjM2grkxSER/6HeIdQzqZHBd+z2cVWx8ykDDtLAOPNaO3f3NLC39cUI8VfA2F1jqFc+pK3SsXkKZN2gVk6mAxIdwc789YbNHB8ztnXAiHvIzqxInVVDnXtFYtkgnStVMfleifVyriqQmjxuvWH8iwE9PMNDQCLsmmwp0+SjDO/HvGrXGXY0DjZtRJ8bNeDhSvlvCXw6SiJSpOdUzS855WHZf8/c5Hf2i+FI9yV4nhOZVJn805ox23ki9KN6aRoPNB9Nz8ru5qnXbGoRw4VIpSmvZJa+B82Jspg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6506007)(1076003)(8676002)(4326008)(83380400001)(6486002)(66476007)(6512007)(54906003)(86362001)(66556008)(6916009)(2616005)(26005)(66946007)(41300700001)(6666004)(186003)(478600001)(316002)(5660300002)(38100700002)(36756003)(82960400001)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU16SmV4dmphK1dIQ3JjTENyY2ZUL1g3eXZjNjNESy9yc2lVeGFyZXNlL21j?=
 =?utf-8?B?Sk5GUmV5anVoOTVpK2wwYTBlV0oxaFk5TU96U3VDY2FZN3Q4SGxtZ3V4c3oz?=
 =?utf-8?B?ZWhOYVlpRjA1d3Vhck9jUEpQWFhXNnRJMmxTLytmZ1BOMG90eUdoRWd6OE93?=
 =?utf-8?B?ektJeXk5QnhFQnZkSW5RUGI5eWJTVmx4MkxXT0lIaWpzZG5Sa3kwNkwxc0pk?=
 =?utf-8?B?UXhqRFJ2bjMzT0dQWGl3V0NKdnIzVkVGSEgyVFBiYUxJQTdqNEtqeTJtRG43?=
 =?utf-8?B?UUdvNnpXZFdhc3NxQVlMK1hWcXN6TUlNT1lrR3lpKzAxdmNGc0V5bmZDVkVm?=
 =?utf-8?B?ZnlyWHgvZjNGSUlEU283NVRqbDVScXpOOER2dkF1WHQ2VDZibmxOVHVra1hj?=
 =?utf-8?B?V0ltWUN6Z1lpUGpDK2hWMnAvaHVjYUtDc0N0ZmRYMHhhT3NJbjJTMWVBcUl3?=
 =?utf-8?B?YktGVTZNT1RWamZrTUc3VHZHdnNSUzNsU3ZUSE1xLzRobm1Mb3czV2JDMUpo?=
 =?utf-8?B?K2lzRVNMOHR3akE5QndtSlk5bGgxWHVKV2l2U2MvMnJrWUZPRFNYSVdWM2J4?=
 =?utf-8?B?UEZMS2lramNBdjlBRDd2NmJmVXhjTkZMeGxJNXlYZ1RFRFFDSzNSM3hhTmdW?=
 =?utf-8?B?T0VGbTRod2RyekgzVTZoUmo4a1lzNGRRMW1CeHIwcm8vaUdxekduU2VUalQx?=
 =?utf-8?B?eWNiMUlPSzlHYk1sVlhBT1dPTGRWNjQ3eU9iMFgyM0JSMUVkL2ZsTXpZcmxr?=
 =?utf-8?B?SzNOMUlrTTFIT3RKWHNzdTZ3RnRyeFhwRUJmN2NYS3U5R3NDalBXYjJZcFJE?=
 =?utf-8?B?bmZvMUNuZjMxdWNadTFRZXhvVTFER3VCQm5zbi9NTXQ2QkdRVC9SWXpackFY?=
 =?utf-8?B?dXlmelZzRWJiVWt1WGxmY2l5Y3lua0NaMlBZZzhDQVA4cWVyWTF3ZDZLd2hx?=
 =?utf-8?B?VmFDenJPNmo3ZzZ1dnJSZkxqNDNhU0pKMG8vYXpZZnp6NGYwWGN5QU5UdHdp?=
 =?utf-8?B?cjUrZEZMUWJrZzcxYVVKRzZvcHZJekkrcmU3ajlKRFROWlZ2WVM0SnZzVlhq?=
 =?utf-8?B?R1RWNjJIcHlYcHQvY1pHZ2xCeHFseGJLKzRNU3FvaTVhbWt0QWFMOHpjL3VO?=
 =?utf-8?B?aDFTYWhRTi9EUDNrK0VwOWZkcm95REhwbkhCNnkyQ0hkSFEzZyt4Z2djWWRw?=
 =?utf-8?B?UGp5M08rMTRLclhPQUZRWWpPUmFZMWh5eWErR1BLd0tsTVRUR2pDVDdKL05x?=
 =?utf-8?B?NFBmRitySTZMRGFxbUhsTEdLNVk0cWRsMHhLTWRZeEJmdGhDbHZLZ0pBMkg1?=
 =?utf-8?B?Y2pteHZRMnMxWEpaN25IeUhXcjBpbW83V3p3bWU5Rm1XTVcydmIrMFlMRm5K?=
 =?utf-8?B?M0hjenU3TlE3VFpOcGU0YldnMjk3VmMwdlBGMjdCcjgzRTE5R3ZUczFob2w4?=
 =?utf-8?B?dmNrUE9YekdxL2NZa1k2QlVVcmJmVXNiVEN3bDdOWVNVWjBlNTBPcnMzclBz?=
 =?utf-8?B?WmYxMjFTenFrbkROdHpheWN6NnM1QVhBemE2ekpCc04yUHpkVmtOUmlpa1Zn?=
 =?utf-8?B?amtSTWdHNzBkOWtidllrRFRTenlkVHJYWURjVURCZ0w3Qm9RcVBycUNRWXRN?=
 =?utf-8?B?TnZ5YzVieHVUWWoxcXAvWHVWb2x6Rzd1dS9ZcURDaXJkSG5lMDVqOTVDZmhF?=
 =?utf-8?B?WUJKR2tyYnh6NmlyOEpaRXBnR2ptZ3czWFpqTXF2R0ZNR3BpalByYlAvaU1D?=
 =?utf-8?B?OFFLbmR1Szg1MGZmRTRiTytPYzFTVUU3bEZkcm9vQnNKV09mREtocERvMkM3?=
 =?utf-8?B?ajExMkVCcTVweTh5S2VDUmtJSTNKYzdreEZ4YmR5WE95UlhUc2hmcStyaks5?=
 =?utf-8?B?ZTVESzc3NkdBZXNxeURjeElPMis4amJDQ3laZTMydisyTkZ0b1RSSUNhci9D?=
 =?utf-8?B?ald6OWNjeDJWclhRQ1Q4Rm0zUlZ3TTlGTmM4YUVYMHhQSS9LemgxYTNraWFD?=
 =?utf-8?B?NlRQSldqQVR3UHYvNlpHM2I1OEQ1bDF4OERVT01DY21UMDJ2L1ViZXB1cHd6?=
 =?utf-8?B?M1NLQkFLaXcrWU85d0xoaHNWWDFITFB0aEtDcGEvNUp5V0tWcFYvdHBpT3VW?=
 =?utf-8?B?SlVoL1VWTkkyOExRTGMxcDhxMWdKY3pORUhBQk1uRUdKR1Q2UEtqWllkeWxj?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e418b339-c4a3-4ce6-d492-08da54f808ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:09:10.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIdflgEXJUP2m6xcouL0nUgROLF2Nq1w39Mt/llJSEr1bUaPXUM93imyMXD/9Ex6LN4SZbvGgwhS9fXna64olQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5934

Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
being filled halfway during dom0 boot, and thus a non-trivial chunk of
Linux boot messages are dropped.

Increasing the buffer to 32K does fix the issue and Linux boot
messages are no longer dropped.  There's no justification either on
why 16K was chosen, and hence bumping to 32K in order to cope with
current systems generating output faster does seem appropriate to have
a better user experience with the provided defaults.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index a349d55f18..a8ac667ba2 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -77,10 +77,10 @@ config HAS_EHCI
 
 config SERIAL_TX_BUFSIZE
 	int "Size of the transmit serial buffer"
-	default 16384
+	default 32768
 	help
 	  Controls the default size of the transmit buffer (in bytes) used by
 	  the serial driver.  Note the value provided will be rounder up to
 	  PAGE_SIZE.
 
-	  Default value is 16384 (16KB).
+	  Default value is 32768 (32KB).
-- 
2.36.1



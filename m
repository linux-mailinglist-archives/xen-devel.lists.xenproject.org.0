Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F540A764
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 09:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186179.334902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ2t3-0005ks-6u; Tue, 14 Sep 2021 07:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186179.334902; Tue, 14 Sep 2021 07:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ2t3-0005iv-39; Tue, 14 Sep 2021 07:29:49 +0000
Received: by outflank-mailman (input) for mailman id 186179;
 Tue, 14 Sep 2021 07:29:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ2t1-0005ip-30
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 07:29:47 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83102463-03ba-4f55-a9b9-950082d133ce;
 Tue, 14 Sep 2021 07:29:44 +0000 (UTC)
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
X-Inumbo-ID: 83102463-03ba-4f55-a9b9-950082d133ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631604584;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6Ms2wkGWXtw/1UqTUOgMRL2u4IZIASPlYnlYFIaSUHE=;
  b=TotGWtPjlR+SIlQ3t81e8Fakcyg91xPY1KF5HTSL9QxL4UtplflAxY1V
   uQydR0ZMPDxvK+8Z1UD9Z7Hg6YKHwX2hSmj5XieQCfty2DziqTeaHAlvG
   e6WB6ZGNqECQDWfatTVxdockDH63jU/UmTpt0ZqPXMNOq8DAGtE6OXJFL
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KlRtiMKY5cso7l0MHzs8szn2l2JVCYyOrXieB59tck8ytrHSlbWQswemxurKBxglDUo6Jv2ZRI
 sZqYA5l5pPvCNsMUwm9FQRKk2mJt20OmWOLJmcxmCi7mjdHrbSqPjhTnaOizjCvZ8co8zTftlK
 cUaFDB0KD1yyt0hg8yxL+pjguWKciD5U75bTNPubNw+d+Vyr176nDlJ9uVKYO7A3U5dpNPtNEJ
 hFZpMVax3OxMlirvx0KV7yGUTaO3CCg5XORvieHaZ0kZmR/+MilfbtTI8X8YMkDVjDEgYuvats
 J6+3fW1IKSGmK5p+gw39CCko
X-SBRS: 5.1
X-MesageID: 52244988
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3w9W0q8ooOcxYHUFmsi9DrUDnnmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 TEcCmjXPa2MZ2KgLogkaoqx9hxQvMXXytA1TlRtrHg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79g3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgs7
 ex35LCtRT4KP6rKsflFUSAbHHphaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFhm1s2pEeTZ4yY
 eIfewtjUQ2QZydjZA8aIcIAmdiWlnbgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiCOhhyRNd8dcKs477wek1/LW2kWWXXdRG1atd+caWN8KqS0Cj
 wHSxomyWG0z79V5WlrGqezF9mra1Tw9aDZYPH5aF1NtD8zL/dlr5i8jWOqPB0JcYjfdIjj23
 znChyw3nbx7YSUjhvjjoAyvb95BoPH0ou8JCuf/BTnNAuBRPtfNi2mUBb/zt6ooEWphZgPd1
 EXoYuDHhAz0MX1oqBFhvc1XRO35jxp6DNEsqQE2RMRwn9hc01WiYZpR8FlDGaudCe5dIWWBS
 BaK4Wt5vcYPVFP3Pf4fS9/gUKwCkPm/fekJo9iJN7KilLAqL1TZlMyvDGbNt13QfL8Eyv1mY
 sbHLp/3VB73y81PlVKLegvU6pdyrggWzmLPX5HriROh1LuVfnmOTrkZdlCJa4gEAGms+W05K
 v5TaJmHzQtxSur7bnWF+IIfNwlSf3M6GYr3u4pccevaelhqH2QoCvnwx7I9etM6w/QJx7mQp
 nztCFVFzFffhGHcLVnYYH5Ud76yD410qmg2PHJwMA/wiWQje4um8IwWa4AzIes87OVmwPMtF
 6sFdsyMD+5hUDPC/zhBP5DxoJY7LEaghB6UPjrjaz86JsYySwvM897iXw3u6ChRUXbn6Zpg+
 +Wtj1qJT4ACSgJuCNftRMiul17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK2J89WpHu95EhYIFmXX9+/rZyzT/27lyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPJs/cbrqp9b0h9gTSfCYFmcA799JmWLgJtUvapXy74F4Qa7V
 ypjIDWB1Wll7C89LGMsGQ==
IronPort-HdrOrdr: A9a23:7YCuA6+3GiFC2hMV9bxuk+FLdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhUdPj2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2Evp9/oGOtF5Dq
 r/Q/1VfBwndL5gUUtHPpZ1fSKAMB2Fffv9ChPhHb3ZLtByB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52244988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nten3braosCehQW+2h1iyRct6b6CASKHrcCeH2xLjtauiK9AWxMBpSyifa+sQKTh9re/AdwMfJHbDqsavNQtP8aEuPzXF4OYfdHZbI7Ccypa/tWSjgDYB1d0jmeiMi7QM/u4/F4Ink7D5BALWghd5JLDoMJBNqFIyjku+tyCcEB2svkEhj/HHeUyTqDT70C/VJWPW5hj6XNTbsBECjyPHOYA+IY/yxPl4oc8bb/h3uQABLY7qh8xX0fF6ZocyVqZKJDTy6+SF9NEL6aE5I3LVoBJH0s7C6cr2B4HcqbwhcOGMuCzhkmq90SIsP28R9oNnuzwV9nHBmEKNwRceTNeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dAY+uZGV42lpJtZXtU0lvoXV0hBjXdyR9G7jZEG1zJw=;
 b=DLaIVI9FIFDI/x4AeSp8/9z+iO5AGreVsVZqdDRZo5E7/j0fy3DSeH0NHRPM1lNZCm1zDlfJAsDDRGlN1yOSQc8VFUSQE/rSuWg28Xv4lVOKw32SNVFSP+sdaPysbYkb37YbjU9EkGKqDfWNXChk7jfaZzMnVIKd9f17REJc1K5hCCW1gd4a/HKtahAum9A8Gh58Sd76vjMi9Ef5+455TgEKwOJCSjLh1mxBAZnX8y5ZlSJ0ndSmAcJt/Q5MdFK4R5DBYHuvCWf5HBNu1N1TE/DKA6VFviVoMx9sqnic/JD8SQYY0Q0Gn24KNFCSEMT8n1Th5Pc0lOT/pQAw3hT4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAY+uZGV42lpJtZXtU0lvoXV0hBjXdyR9G7jZEG1zJw=;
 b=eP9K0+iEWQtO4JZ+DWT8jfBfih1Ca407qhKYlLarJgZAAvul4GiMCka621iDwRpBe89iLY6NMWv312qhL69ZrBcTblenEV3IFt9fkNEu3my9PIxPr9Q/eRvieOTsPSnS8p7bcjteB0wKriHk3k5A3tYekSqxy8/fvW97VJ+wR7M=
Date: Tue, 14 Sep 2021 09:29:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
Message-ID: <YUBPYBGsgK6nwgnf@MacBook-Air-de-Roger.local>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
 <YT9UADtkz00JJkuB@MacBook-Air-de-Roger.local>
 <7c97de87-9687-a088-406b-33faf037244a@suse.com>
 <YT9hHPpt+SRU/Cv0@MacBook-Air-de-Roger.local>
 <4c8ddad3-e01f-06b0-1544-cffb477641b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c8ddad3-e01f-06b0-1544-cffb477641b5@suse.com>
X-ClientProxiedBy: LO4P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2868e34-cf9e-4550-b2ce-08d977516a34
X-MS-TrafficTypeDiagnostic: DM6PR03MB4220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4220432C45A19F2028071F5D8FDA9@DM6PR03MB4220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBBUY5GsIYAYW488tpdqqgoa/aRtZcpV0jvmEiVmbHwiGv25RBWEVEyWaoKj/MTrZOueik1PsQc47LySlL408HCACGbxF2znWk3etWZvMDulf4+NSlviejA64R0fpuDP+kdllz2eJc8QUYGQUnTpL77lGMmSoKqLirrpdPkFRi6E8xlBg/OztPuKr6ZkNzpORmEs3QDgtB7hy0a2oO1tTPJg4fUARuSkOfPsi7bmlD1SWqihL3L9DvzUJIXfhxd9wHYJT9TtPwohc9MyNDyYY7uQ+hYb01yB9t0GDM6KoEi+pynf2pQl5FSPw2sgJLH+G6JD2zmF9OK3QY5aDUCaxZEE/0cwJcDv7+7OyGiRARp+YILxvNMnya5UDacjhc8DN9sjSrC5HyzOt3IDFmgv6SXAwmDy9t2Tzia88jD2uq+LOKBCshDoxqRFIlA+XYIOCmMsD8nNv0GMU2uHBBVOBoGJ80Gih35w2bRYbnLP2HuEzT/sV+OFpHSauA9lI5Tdiw0czMSPGQbhPsSR8XEkVOZRC0iZLQAn7svwvBTyDikg04jlH9Gvcf4JMb4xp0UF3ROOXYJzl12SArNQ0nXwdrouQPQHbqrH80O6/8C94/brotFNd7Qvajfvlb7IqdWuOrYyFHFepyi+TXqYGzXV0FDhrDNbR/zUUW7Kmtt8gqXrh8wkg1jCFGJLC/pHX4OzUhiHmxA55cHMUmFBABfu0JBs2zGAErfEqjqSIAq3YN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(478600001)(8936002)(2906002)(66476007)(66946007)(54906003)(66556008)(4326008)(26005)(316002)(86362001)(6916009)(6666004)(186003)(5660300002)(83380400001)(6496006)(6486002)(9686003)(53546011)(38100700002)(956004)(966005)(8676002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5oWW1DSXFTN1AwY3V0K1FqK2ZPUE14dzRIRGhIMDhjTEx2ZHU4R3doMi9L?=
 =?utf-8?B?UkNyYTIwclgzRlNKalUxQnB4cTgrUEN2TitXdkVoVUdNanZwcC8zd1UycEVC?=
 =?utf-8?B?ZzlCaGk1YTJMNGtDS1FYZXNCbURuNFlPQkcyWkZERDBaQ2dDMnRwVXNNNi9v?=
 =?utf-8?B?dGluQnF3WGpwSTVqNUpoNFB4a1BCNzI5Rm42MnpPbVJLdGYwQ3lmc3lvZXBl?=
 =?utf-8?B?TXB2SVNRSHVhYi9kOGNTRTRiWjFMWmw4K0ZkS3VUeC9jdWoyZko3ckVzejJ4?=
 =?utf-8?B?RnRCZm9RMmZheHhQVDkwREFoRlp0UW81MitVbGUyamFXeDI0TXlYSVlZam1o?=
 =?utf-8?B?RGM3YTF2WUNzSVhmRGdzV0pFL0k3OHlvUkZlUHhvcXpIUW9qTENWdHNjZlcx?=
 =?utf-8?B?MDByNEtGMEc5Z01yZzNyVWw4MXpCakVTOW9GVXM4ZkNRNE15V2dKZmR6Z3kv?=
 =?utf-8?B?WWdLcHR4aEJNVmIyMlVXb0pWYmFubjBXa1Y1Z2dJSXZLRmdLWkx1dHhraktR?=
 =?utf-8?B?eUdxNmN4aXdJVjJ3WTNCQTRTcGZiT0hYazBtUUF6OGtlb0lXZVlJTjZvUkZL?=
 =?utf-8?B?c2REc2tUKzBCOE9XSjJ1RWFPajhTQmh5aFdsU0VNZ2xOQnJaVGZDZkVhUHpt?=
 =?utf-8?B?RTZHVTROem9ORVM1Sm9lZ0pNZzAvdC9Dc0hKWk8xQWxQRTJGSmFyV0VYcjVx?=
 =?utf-8?B?NnR5NTJOOS9KM3FQM0NyaWF6N0k2OUR5MVN2cHhBSENwOUJuMTFUcGoyTm1E?=
 =?utf-8?B?UHRTZmlEYVJVaTl3MnpnQjNNS1BlQ3J3MzVyQXBiMkJSbDU4TVNPajlhbnl5?=
 =?utf-8?B?eDYvSjdvaDlYcHlSdGpQRi9ndWdtVEplQXhJVGovS2E1RnkyTU53eW82ME9H?=
 =?utf-8?B?R01HZ2NNZnBkZVRqOE4raENEKytpbGZ0SlRWcVYyOWdxcm5mbHd0dXkwMXpI?=
 =?utf-8?B?M2lCSDNiSGNMc24xOVZrUHFSVWJROTFuTHFaSW9mL3hEMkRxM05HZnVyb1N0?=
 =?utf-8?B?QjNObEU2cnBDSlppTVpFWWJ4L3JyYjlmMkdzUGtnNTM3a0tyZEQraEN1bEp1?=
 =?utf-8?B?SDB4QmJWNDN6Zm5wN09landhSElHRTlNakZEQ0RXNDFLWTM1Sk9TTXVadElK?=
 =?utf-8?B?WFNlcklDSmJyY0hnZE95YitDQWYvaTRPcWtZRXNJYmFuNGF2Ni83clFwWGhQ?=
 =?utf-8?B?LzJkb1lzUDlOU2VVN0p3ZzROMGhEcUNuZVZoR0VOWnNFbTc4cWQ4VWUzaXN1?=
 =?utf-8?B?eGlTU0NEYmhhL2hZd2RvWEFJRVZwTHJ5L2I1M054MXQyWnorNmFJRm9hS1Bv?=
 =?utf-8?B?SXNGSnE2QjhCQmxROCtMa3E0S2Zma2QzUktySTYrNmR6V2Qvd1VSdDZIQUVa?=
 =?utf-8?B?Q2VPYlZqbDFHQlZQRFJITDVGMXp0VGYwSWdPVWVuZG1Pa2d2YzB0cElZRmU4?=
 =?utf-8?B?aThxM3J3WFhTNHRyMjBBdklrYzY1dnFhaDB6aEI5RUQ0SUlWdWdRZXBWOUs0?=
 =?utf-8?B?eS9PRjJWbmdYcXNCelloNmtqTEVXbmRFTEo4L3FRL3NFNGFpUzM4VjR6OVcr?=
 =?utf-8?B?emhEaTUrM2VqS28vbzF0cThRVlpZaXhDZGZLL3BrUHY0N3dKY3ZkdjRvZW9G?=
 =?utf-8?B?UEtKc24zVFZIWWFtVWthcDdzV2ZWNXhyVW5WZmRRVjJPeVZYUktWbytLNGkz?=
 =?utf-8?B?NC9iOHMrbTVNeEFnVWhFaUExdHlTNGRWbmpKdWMwOUZHV25lOXBUaVpvYnQv?=
 =?utf-8?Q?WJxDfW3Q1I4mi3bsHlwkSSlAVeZd5kUTUl5iR+1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2868e34-cf9e-4550-b2ce-08d977516a34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 07:29:40.8551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6et7Ecfv3M12zRRiy2GQqSbPr1fVTLz2qtRM6FdrxPWJ0CNZqO4BMf+7IW6Opdzj+x6d6sf7FMNZiV/kOTC09g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4220
X-OriginatorOrg: citrix.com

On Mon, Sep 13, 2021 at 05:07:54PM +0200, Jan Beulich wrote:
> On 13.09.2021 16:33, Roger Pau Monné wrote:
> > On Mon, Sep 13, 2021 at 04:05:15PM +0200, Jan Beulich wrote:
> >> On 13.09.2021 15:37, Roger Pau Monné wrote:
> >>> On Thu, Sep 09, 2021 at 04:35:49PM +0200, Jan Beulich wrote:
> >>>> I haven't been able to find an environment where I could actually try
> >>>> with lld (ld.lld); all testing was with GNU ld (ld.bfd).
> >>>
> >>> Thanks for fixing this. I've been able to test with LLVM ld and the
> >>> workaround is fine.
> >>
> >> Oh, good, thanks for trying this out.
> >>
> >>>> --- a/xen/arch/x86/Makefile
> >>>> +++ b/xen/arch/x86/Makefile
> >>>> @@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
> >>>>  
> >>>>  ifneq ($(build_id_linker),)
> >>>>  notes_phdrs = --notes
> >>>> +# Determine whether to engage a workaround for GNU ld 2.37.
> >>>> +build-id-ld-good = $(shell echo 'void test(void) {}' \
> >>>> +                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c - 2>.check.err \
> >>>> +                           && $(LD) -T check.lds -o .check.elf .check.o 2>>.check.err \
> >>>> +                           && echo y)
> >>>
> >>> Do we want to make this a Kconfig option (ie: LD_UNQUOTED_DASH) and
> >>> then use is here?
> >>>
> >>> We already have compiler and assembler checks in x86/Kconfig, so it
> >>> would seem more natural to place it there.
> >>
> >> The question of whether to record tool chain capabilities in .config
> >> is still pending. I'm not convinced this is a good idea, Andrew keeps
> >> shouting me out for that, and an actual discussion doesn't really
> >> happen. Yet unlike back at the time when I first raised my concern,
> >> Anthony meanwhile supports me in at least the question (to Andrew) of
> >> when such a discussion would have happened: Neither of us is aware,
> >> yet Andrew claims it did happen, but so far didn't point out where
> >> one could read about what was discussed and decided there.
> >>
> >> For the few uses we've accumulated I gave (if at all) an ack for
> >> things happening under some sort of pressure, with the request that
> >> aformentioned discussion would happen subsequently (and, depending on
> >> outcome, these would be converted to another approach if need be). I
> >> have meanwhile realized that it was a mistake to allow such things in
> >> on this basis - the more of them we gain, the more I'm hearing "we've
> >> already got some".
> > 
> > I see, that's not an ideal situation from a review PoV, as we don't
> > have a clear placement for those and that will just cause confusion
> > (and more work since there are potentially two places to check).
> > 
> > What's the benefit of placing the checks in Kconfig instead of the
> > Makefiles?
> > 
> > As I understand Kconfig is run only once, while the Makefile could run
> > the check multiple times.
> 
> Right - as many times as a directory would be entered for building,
> times the number of evaluations of a respective variable.
> 
> > The downfall of having them in .config is that .config could suddenly
> > change as tools are updated or as it's moved around different systems
> > (yet .config already contains specific compiler version information).
> 
> Correct: Tool chain specific information may get updated, but then
> further options may get silently turned off. Plus to update tool
> chain specific information there needs to be a trigger to invoke
> kconfig in the first place. Merely relying on make dependencies is
> not enough there. Iirc we don't have any means in place yet to
> actually enforce this even when there's no other reason to run
> kconfig in the course of re-building a previously built tree.

Indeed, we would need something to trigger the (re)evaluation of
Kconfig options on every run, regardless of whether they have been
set, unless there's already some magic for options using cc-option or
shell test macros that does it. Linux will surely have the same
problem with this, and they recommend to use Kconfig to check for
compiler capabilities [0].

My opinion would be to go for Kconfig because it's IMO cleaner to
represent the options there rather than mixed into Makefiles, and
should also prove to be faster regarding build times due to the single
evaluation. We can always bring the environment related issues to the
Kconfig developers in order to try to find a solution for it.

Thanks, Roger.

[0] https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html#adding-features-that-need-compiler-support


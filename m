Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532854664EB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236608.410460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmn3-0001yf-7X; Thu, 02 Dec 2021 14:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236608.410460; Thu, 02 Dec 2021 14:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmn3-0001w6-4B; Thu, 02 Dec 2021 14:10:25 +0000
Received: by outflank-mailman (input) for mailman id 236608;
 Thu, 02 Dec 2021 14:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tajg=QT=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1msmn0-0001w0-NZ
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:10:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9432bced-5379-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 15:10:20 +0100 (CET)
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
X-Inumbo-ID: 9432bced-5379-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638454220;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5m7riEBINI153SiZ7lnLcBUlTyzs912rG9Gmv2i1tZs=;
  b=hMGDQz7TbQQ9Rkuc/qwPs6K2Fg5R+woQ+x7xgEd11EQyPuH6WQawTIiM
   oq2rTWstYrDLx2qRW2DSOd4lpZv7KtjBzPPx7igCwM1H0FJLO2LgUAH67
   k27WQ4mRxNggihCi01TYjr6wHF212NuHbRNuTeVmhMIIBvYb8Qqjb7xwM
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: D6C1QonRY46sQIO9HGl6DpNfDW3k6HuVD5LtQac2YrvUmU7K57IyCGDExwxOBe8m6mEq6elvR+
 q8pF+WF/fqzWohzRNZUeRx92x0QcVIkaQcld4NkrRno92k4IuP9CyPmc1c/iYRM3DZqEeplnbD
 +T43XieGyZTtseSVcOMqvsxfy/DnJJMmeIkkZ/ZJDW1qhu5n7IsdxTTUyC4bFDFmwuh5q8DYEc
 a0QIeSGVTjTcNKspr3Vf5ODzS9iIXl78KOdoj6I3+JeelRhWXLPyqTlJvIQY0AluFI2s4bAcnE
 2gWq/EbJ7M6t9excVXH6Aea/
X-SBRS: 5.1
X-MesageID: 58626458
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+zj44KIBNB978ExQFE+RPJIlxSXFcZb7ZxGr2PjKsXjdYENShmMEm
 mVOWGmPbv+IMTb3KN90bN7loElQuZCHztNrSwNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eg7wbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB22vu5Tx
 OUVsqe5CgwxAPLmgrUsbCRhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XtYECgmtt1qiiG97QT
 ewyMWpLcS7rIBgRBHAXCZQkoKSB0yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19gUKwt
 m/AuWPjDXkyNtaS1D6E+XKEnfLUkGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS1yCz6KbkuwGiDysPVgAeQsZ3hfALfGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWiom
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsaYowGWxFADpU
 J04dy62t7tm4XalznLlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfKWS5O
 xOM41oKufe/2UdGi4csOOpd7Oxwk8Dd+SnNDKiIPrKinLAuHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdw1XdiZiWsitwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg5AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:SYHS2K2fyhBer19R2U+rSgqjBVRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YdT0EcMqyAMbEZt7eD3ODQKb9Jq7PrgcPY55av854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,282,1631592000"; 
   d="scan'208";a="58626458"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0JzENMQXYXmrDvcafsfbDtxASTYG7aFzsYtkWLQPJ5oxbB0Cb3VZvcofXYWuiHs72c6W3gCOrYSn+Mr91DI7tx1rZrgZtr/zRhNhbqPtsez2r5bTyHkkM9UD3tTH424yJpGrHh+IQ1TX064sa/ITMT/wBSNav4AI9Nd/l7yN4Yvn13xR5SeB++TesIT1QqxUa8SlWb5dQuwqySD306rB+sY0cAnchfRdHsU1EuP/3MPZ5n2REEl8wC5PmOcxZ0EAD76h/+fNYH+bjo2vsUwLjMo4uf1EZ5+C212JbNloaAL/tQ+J1Sm+Rp7JpEgv5Qs92YvnSbfWZxmn989+PDgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+FpX2gHjqb7gQ02q2MTEGl7YjvPNyg3I58FUTOwgcE=;
 b=McM0YArOruaNQ4dEArvHQ9zGyk5giJyI+Yi0WistfCx4JTF1Bripc3J766hO323E8LjTRm4bQxAygOEwryL/i1lVGHHqIuJt6jSYlC07eJVijqbvPNwJb/f2dVBQnU3y9DB0nwUF6DIn98fbIGWxrOl9oZH3RPsAmf4OvpMQp+Nq3B4mJsM6i64HYMOJ+VvulFvG+nC9sTS8aiMlhyoA8o+NuDjmQeK/cYQVzZcxPWPp83jCdnUexS0+J5zYRDGsAikpNtP1woamUyRBvfPY5Fq7FwNuDsi0ZukGu4Djziuj2/wcJ0NlAsR6/FUVd0QI1o3La+PIjP4HxA3mUGN4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+FpX2gHjqb7gQ02q2MTEGl7YjvPNyg3I58FUTOwgcE=;
 b=DSi8Ng1De9aSsx+i8ETbARrqFy9/GeHch8mRBwD7GPYjCuJ86DpcX1BVGcvwa4Uk61dJ9ggkSNIzJxwt7TiQrgBXWIqwPj/PbwxAqu2+bQv0J6SLhtLBSVDvK8cf6AJGIiBPqqDVI19dR5hPtw1aeF5KdaaDQtunQusaQf1jCTQ=
Date: Thu, 2 Dec 2021 15:10:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 07/18] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <YajTvrZz0xGOR3vT@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc183d61-f4ed-1cf5-185b-0673c9927892@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc183d61-f4ed-1cf5-185b-0673c9927892@suse.com>
X-ClientProxiedBy: MR1P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d119bfa5-bab0-4d6b-63a1-08d9b59d73c6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4138:
X-Microsoft-Antispam-PRVS: <DM6PR03MB41387065220E1D66EAD199758F699@DM6PR03MB4138.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhH9Bas/EjMzUrOYRbqutaEiWVAzHd4bgJ1wtZ/Kcs/WHRInWMdYDOeH/3qFiILu8+MQ8eoOVJAOFkZEEiLTz9tPJvzkM/qUvLM31XkBS4w7QAjfLjImPj6Cb+Psq5izjxBguILfWQ90I1sXRpEnnlDZdSVe9vFOAeVoj6oOTqeiIMKVgGTJvimfzsKs0EpKLoeNcqKDj9UnsSUcIe46+QAW9kyG+BSmR67poluWB5dSsbfWueQwKiMf4JJp6HbQ4qiaFzVjK9/k0iTrowF4ygpCz0L4ok0804BulehhNa78vBuF1NVoHQpok0p51SNAWeBGEH+kl30xCZbD8OC151FhiHYQzlpK3j7fwttDLpjJ6imFy30X4WhwB0+G2IBsT/upkgjXOOzS/hrbJ1d6Ev5BoGfn1dKBoyXUldd0UOCHZ6NZa44BIeEbBDVaAhrUebHYmRXuZnGxiWzNsnvQCHHTbgOTMKzcnfKHW0caP5CnyFVdiRMIJzfBWubGxh4xHHIBRa4ABJgOA+bwaXs+UGbiP9Fp4iuoB5YK+RF7xUQAHkHv+qV/ADnT12i82BBCz276B+zBvFm5etjJ0frXo/6m3Bs1ncQtYrEyX91cPC0E/SyhDei1PSI67Ydm2+8S3V9FOLZzVOOCi/GCt59rsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(5660300002)(54906003)(6916009)(86362001)(2906002)(26005)(83380400001)(8676002)(316002)(85182001)(82960400001)(9686003)(6486002)(30864003)(6496006)(33716001)(8936002)(66476007)(956004)(38100700002)(508600001)(66946007)(66556008)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUQrK2QvRjVxdDV6VWdXL3FDZ241N0JkSG5MRXlOc0FaQU1LemZXRkREU1Vw?=
 =?utf-8?B?eXJKblYrQlR6WkwrdnV2ME43TzErczJSbDE2WStJUUdya3E0eVRzK0pNSURs?=
 =?utf-8?B?MlZRWFA0alNPbGlrRCtKeCt0YUJvVnBaQldGcnkxaEdwZnVGc0wxV083T3dL?=
 =?utf-8?B?VFhlR0tTSEhVSWZoNUJlNU4rbzRuWWxjOWNTREMyUmVweDJKNFdTdytXdm9j?=
 =?utf-8?B?aTVtVG16ZDQzQlFsMy9HbXI5OVBxN1lxd1lUYWJXbjdnK2h0dDRnb2VQRHF4?=
 =?utf-8?B?dHpYVDBMUUYrbTYvVlRCVFZvTWoyYWV4eFlPZlFoK0RWTXJrUG5DUFhYWEly?=
 =?utf-8?B?MnNhaDJucnlDa200N0t3bGR5a0oxUEpMTnN3MC9hT1RHN2IyM20xZDJTZnlG?=
 =?utf-8?B?NFczZ3F3L1h4MFFTYW1hTlZmbTB1N3JXMG80WUJMa0xIcnRaWU8rWWE4ajU3?=
 =?utf-8?B?UkFFM2xpSnUrTkJHbVVhSEdNczh6RTJZM1hsa0x0Ri9kOU10USthWTF1bktP?=
 =?utf-8?B?d2d6dHUxSWxPMWc3dG1PNHpWbGpYd2o4UDl6OUs4cTVsNWcxVzRvRmtyU1cz?=
 =?utf-8?B?OFBYN1JTZm5FeHFWMXI2QitLSnpFUXJ4WEN0bGJ2SGN0OGFkRmVyb1JGVGVU?=
 =?utf-8?B?Ti9FeThOckhSalNVY1B0NmJKMG00Mk1rRXU2bi81NWhxVUNVUStCaHB2MTc1?=
 =?utf-8?B?OXBoMTNURmhqZUNJMnBzeUpXUERwZUlZclY0RHc3UVpQdmpYd2hZM01ISnFG?=
 =?utf-8?B?cnR4d2JLYlpCV2ZibWg3MjRxQnR0alZOakJobUQwcHByQ2k5Q29nVHNzaFQ2?=
 =?utf-8?B?VnpZbVJDM0gxYTdHWlBUZE5ScmdoU1BZUUZwYkJTU01JdVN3dW1CV1hrdVJZ?=
 =?utf-8?B?ZnN2RDBNL3VSTTFJL1VOOXZrbzdJeEhDcnpTajJHSWRyQ0lVQU5tV2VGVE44?=
 =?utf-8?B?d0JZdXFzZzROYXdvZS8ycjJTOGIzWkxDODVJNW1SYjFSOWpOQnhmcTVoUC9Z?=
 =?utf-8?B?WGxIV1c0d0R5M09GcUNEM0FBVVYwSmYrbDQ4dDJKSnNiSGltWWVyN0FLaWM4?=
 =?utf-8?B?SVRJN3JqKzQyV2NveVFQY0dyVmVYRDBFOVNPdy8vZDV3Njk5SEw1QTg2L1Zx?=
 =?utf-8?B?MndnU0c5bkFmTENOcXBQQjU4ZkwrOVQwb2IrcExvNVpOL0syeWVwaFhlYU9Y?=
 =?utf-8?B?SC9VYU5kT2tqWC82SlFwSnVUUjQ5NDcrM1lRaE5BQ2JQZkMxZDh5SkxwejBS?=
 =?utf-8?B?NjRUbjQ0dWZwNEVzZG1YSkRpYUx0VmF0T0NOS3dudHU4MFBodEQzSFl3MmVH?=
 =?utf-8?B?aUFPbWxKZWI1M0QzOFNsaUI3THVONXlIUnFZK0pRakhWSzVYR2x3cUZhS1dH?=
 =?utf-8?B?YStGNStKWFd3ekQ2bjNzWUZyQk83c292bm1MOTN4MWF4MVNYcDBMS05ZMVlW?=
 =?utf-8?B?Ui9OWDNlQjR1YzV3UDBOYjVLVldabjlYQTQ2aGl1dFo4eFcwN3Bqc3Y0Smdp?=
 =?utf-8?B?ajdORk5iSnJGUFc2MnpBKzFmcTdpR3g5MXFaM2Z2enBCUVQ3U0xRYTZmMisr?=
 =?utf-8?B?NENULzMzWXFsWSt3QVd5ZXJmMHFmVXRPZkllWXplNGJuOWtZM0V1b29yS0Fk?=
 =?utf-8?B?Z09ma3FabFZSWnB2VjhqY0dzRFM3NnRPdUFRQ0F4VitVV3cvdnl2NjFKaTRw?=
 =?utf-8?B?WGhhWDJEaFUyUFlVMW5wN0FMdXZ1bUQ3bmlLNGhrdFpZTnp3VjhVVk1ERmpq?=
 =?utf-8?B?TW01czJVUVlQMjl2TWJQT3ZSUlowZWJ1V3h1S1B5NUM5bkJpb0w2TXJSdFZK?=
 =?utf-8?B?S0F2b3NoVmpRMjNBSnVqZVV6MHlCR0xpTUEyZGQ5UHVlRENSQ3o0V3gyZnFy?=
 =?utf-8?B?dTQ2cVNmTDk0azh0eFlTcHN4LzJDT0xXV3JYNThqK2NYczc4SmE0YndnS2xK?=
 =?utf-8?B?b0xaN1YyYkNYVS9qcUhPM2ZMMlNzeTc3RE9FTFhKWjhoMmxUNTJ2ZkxRditI?=
 =?utf-8?B?R3VQVmFoYlRsOXNFanlURFpGOXFrRVB3ZThLOUNmQTNnczd2MjFWZWtPV0Rq?=
 =?utf-8?B?WGJ0VmcwNGZPTlp4bmo4bk4vbEtwRTFmNWI2VEZOT2ZUMFAxMEgyMDV2WFFN?=
 =?utf-8?B?T2tQUnRabFdCem5WSHdyMEF0L0VkY2FGL2Vtd0djS2VRdklOY3VpOEFDS1RU?=
 =?utf-8?Q?nQSgagrPX3KYFzea8rJPHgs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d119bfa5-bab0-4d6b-63a1-08d9b59d73c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 14:10:11.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jbhnhDA6NEBn0SuGFhYH98b64p9KfVTWtD9KSWwltZMFWukvJ3ik8M7YBRa0/2DjHkL8L++myR7P2Ls/XnZhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4138
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:47:41AM +0200, Jan Beulich wrote:
> For large page mappings to be easily usable (i.e. in particular without
> un-shattering of smaller page mappings) and for mapping operations to
> then also be more efficient, pass batches of Dom0 memory to iommu_map().
> In dom0_construct_pv() and its helpers (covering strict mode) this
> additionally requires establishing the type of those pages (albeit with
> zero type references).
> 
> The earlier establishing of PGT_writable_page | PGT_validated requires
> the existing places where this gets done (through get_page_and_type())
> to be updated: For pages which actually have a mapping, the type
> refcount needs to be 1.
> 
> There is actually a related bug that gets fixed here as a side effect:
> Typically the last L1 table would get marked as such only after
> get_page_and_type(..., PGT_writable_page). While this is fine as far as
> refcounting goes, the page did remain mapped in the IOMMU in this case
> (when "iommu=dom0-strict").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Subsequently p2m_add_identity_entry() may want to also gain an order
> parameter, for arch_iommu_hwdom_init() to use. While this only affects
> non-RAM regions, systems typically have 2-16Mb of reserved space
> immediately below 4Gb, which hence could be mapped more efficiently.
> 
> The installing of zero-ref writable types has in fact shown (observed
> while putting together the change) that despite the intention by the
> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
> sufficiently ordinary pages (at the very least initrd and P2M ones as
> well as pages that are part of the initial allocation but not part of
> the initial mapping) still have been starting out as PGT_none, meaning
> that they would have gained IOMMU mappings only the first time these
> pages would get mapped writably.
> 
> I didn't think I need to address the bug mentioned in the description in
> a separate (prereq) patch, but if others disagree I could certainly
> break out that part (needing to first use iommu_legacy_unmap() then).
> 
> Note that 4k P2M pages don't get (pre-)mapped in setup_pv_physmap():
> They'll end up mapped via the later get_page_and_type().
> 
> As to the way these refs get installed: I've chosen to avoid the more
> expensive {get,put}_page_and_type(), putting in place the intended type
> directly. I guess I could be convinced to avoid this bypassing of the
> actual logic; I merely think it's unnecessarily expensive.
> 
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -106,11 +106,26 @@ static __init void mark_pv_pt_pages_rdon
>      unmap_domain_page(pl3e);
>  }
>  
> +/*
> + * For IOMMU mappings done while building Dom0 the type of the pages needs to
> + * match (for _get_page_type() to unmap upon type change). Set the pages to
> + * writable with no type ref. NB: This is benign when !need_iommu_pt_sync(d).
> + */
> +static void __init make_pages_writable(struct page_info *page, unsigned long nr)
> +{
> +    for ( ; nr--; ++page )
> +    {
> +        ASSERT(!page->u.inuse.type_info);
> +        page->u.inuse.type_info = PGT_writable_page | PGT_validated;
> +    }
> +}
> +
>  static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
>                                      unsigned long v_start, unsigned long v_end,
>                                      unsigned long vphysmap_start,
>                                      unsigned long vphysmap_end,
> -                                    unsigned long nr_pages)
> +                                    unsigned long nr_pages,
> +                                    unsigned int *flush_flags)
>  {
>      struct page_info *page = NULL;
>      l4_pgentry_t *pl4e, *l4start = map_domain_page(_mfn(pgtbl_pfn));
> @@ -123,6 +138,8 @@ static __init void setup_pv_physmap(stru
>  
>      while ( vphysmap_start < vphysmap_end )
>      {
> +        int rc = 0;
> +
>          if ( domain_tot_pages(d) +
>               ((round_pgup(vphysmap_end) - vphysmap_start) >> PAGE_SHIFT) +
>               3 > nr_pages )
> @@ -176,7 +193,22 @@ static __init void setup_pv_physmap(stru
>                                               L3_PAGETABLE_SHIFT - PAGE_SHIFT,
>                                               MEMF_no_scrub)) != NULL )
>              {
> -                *pl3e = l3e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
> +                mfn_t mfn = page_to_mfn(page);
> +
> +                if ( need_iommu_pt_sync(d) )
> +                    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn,
> +                                   SUPERPAGE_PAGES * SUPERPAGE_PAGES,
> +                                   IOMMUF_readable | IOMMUF_writable,
> +                                   flush_flags);
> +                if ( !rc )
> +                    make_pages_writable(page,
> +                                        SUPERPAGE_PAGES * SUPERPAGE_PAGES);
> +                else
> +                    printk(XENLOG_ERR
> +                           "pre-mapping P2M 1G-MFN %lx into IOMMU failed: %d\n",
> +                           mfn_x(mfn), rc);
> +
> +                *pl3e = l3e_from_mfn(mfn, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
>                  vphysmap_start += 1UL << L3_PAGETABLE_SHIFT;
>                  continue;
>              }
> @@ -202,7 +234,20 @@ static __init void setup_pv_physmap(stru
>                                               L2_PAGETABLE_SHIFT - PAGE_SHIFT,
>                                               MEMF_no_scrub)) != NULL )
>              {
> -                *pl2e = l2e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
> +                mfn_t mfn = page_to_mfn(page);
> +
> +                if ( need_iommu_pt_sync(d) )
> +                    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, SUPERPAGE_PAGES,
> +                                   IOMMUF_readable | IOMMUF_writable,
> +                                   flush_flags);
> +                if ( !rc )
> +                    make_pages_writable(page, SUPERPAGE_PAGES);
> +                else
> +                    printk(XENLOG_ERR
> +                           "pre-mapping P2M 2M-MFN %lx into IOMMU failed: %d\n",
> +                           mfn_x(mfn), rc);
> +
> +                *pl2e = l2e_from_mfn(mfn, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
>                  vphysmap_start += 1UL << L2_PAGETABLE_SHIFT;
>                  continue;
>              }
> @@ -310,6 +355,7 @@ int __init dom0_construct_pv(struct doma
>      unsigned long initrd_pfn = -1, initrd_mfn = 0;
>      unsigned long count;
>      struct page_info *page = NULL;
> +    unsigned int flush_flags = 0;
>      start_info_t *si;
>      struct vcpu *v = d->vcpu[0];
>      void *image_base = bootstrap_map(image);
> @@ -572,6 +618,18 @@ int __init dom0_construct_pv(struct doma
>                      BUG();
>          }
>          initrd->mod_end = 0;
> +
> +        count = PFN_UP(initrd_len);
> +
> +        if ( need_iommu_pt_sync(d) )
> +            rc = iommu_map(d, _dfn(initrd_mfn), _mfn(initrd_mfn), count,
> +                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
> +        if ( !rc )
> +            make_pages_writable(mfn_to_page(_mfn(initrd_mfn)), count);
> +        else
> +            printk(XENLOG_ERR
> +                   "pre-mapping initrd (MFN %lx) into IOMMU failed: %d\n",
> +                   initrd_mfn, rc);
>      }
>  
>      printk("PHYSICAL MEMORY ARRANGEMENT:\n"
> @@ -605,6 +663,22 @@ int __init dom0_construct_pv(struct doma
>  
>      process_pending_softirqs();
>  
> +    /*
> +     * We map the full range here and then punch a hole for page tables via
> +     * iommu_unmap() further down, once they have got marked as such.
> +     */
> +    if ( need_iommu_pt_sync(d) )
> +        rc = iommu_map(d, _dfn(alloc_spfn), _mfn(alloc_spfn),
> +                       alloc_epfn - alloc_spfn,
> +                       IOMMUF_readable | IOMMUF_writable, &flush_flags);
> +    if ( !rc )
> +        make_pages_writable(mfn_to_page(_mfn(alloc_spfn)),
> +                            alloc_epfn - alloc_spfn);
> +    else
> +        printk(XENLOG_ERR
> +               "pre-mapping MFNs [%lx,%lx) into IOMMU failed: %d\n",
> +               alloc_spfn, alloc_epfn, rc);
> +
>      mpt_alloc = (vpt_start - v_start) + pfn_to_paddr(alloc_spfn);
>      if ( vinitrd_start )
>          mpt_alloc -= PAGE_ALIGN(initrd_len);
> @@ -689,7 +763,8 @@ int __init dom0_construct_pv(struct doma
>          l1tab++;
>  
>          page = mfn_to_page(_mfn(mfn));
> -        if ( !page->u.inuse.type_info &&
> +        if ( (!page->u.inuse.type_info ||
> +              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&

Would it be clearer to get page for all pages that have a 0 count:
!(type_info & PGT_count_mask). Or would that interact badly with page
table pages?

>               !get_page_and_type(page, d, PGT_writable_page) )
>              BUG();
>      }
> @@ -720,6 +795,17 @@ int __init dom0_construct_pv(struct doma
>      /* Pages that are part of page tables must be read only. */
>      mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
>  
> +    /*
> +     * This needs to come after all potentially excess
> +     * get_page_and_type(..., PGT_writable_page) invocations; see the loop a
> +     * few lines further up, where the effect of calling that function in an
> +     * earlier loop iteration may get overwritten by a later one.
> +     */
> +    if ( need_iommu_pt_sync(d) &&
> +         iommu_unmap(d, _dfn(PFN_DOWN(mpt_alloc) - nr_pt_pages), nr_pt_pages,
> +                     &flush_flags) )
> +        BUG();

Wouldn't such unmap better happen as part of changing the types of the
pages that become part of the guest page tables?

>      /* Mask all upcalls... */
>      for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
>          shared_info(d, vcpu_info[i].evtchn_upcall_mask) = 1;
> @@ -793,7 +879,7 @@ int __init dom0_construct_pv(struct doma
>      {
>          pfn = pagetable_get_pfn(v->arch.guest_table);
>          setup_pv_physmap(d, pfn, v_start, v_end, vphysmap_start, vphysmap_end,
> -                         nr_pages);
> +                         nr_pages, &flush_flags);
>      }
>  
>      /* Write the phys->machine and machine->phys table entries. */
> @@ -824,7 +910,9 @@ int __init dom0_construct_pv(struct doma
>          if ( get_gpfn_from_mfn(mfn) >= count )
>          {
>              BUG_ON(compat);
> -            if ( !page->u.inuse.type_info &&
> +            if ( (!page->u.inuse.type_info ||
> +                  page->u.inuse.type_info == (PGT_writable_page |
> +                                              PGT_validated)) &&
>                   !get_page_and_type(page, d, PGT_writable_page) )
>                  BUG();
>  
> @@ -840,22 +928,41 @@ int __init dom0_construct_pv(struct doma
>  #endif
>      while ( pfn < nr_pages )
>      {
> -        if ( (page = alloc_chunk(d, nr_pages - domain_tot_pages(d))) == NULL )
> +        count = domain_tot_pages(d);
> +        if ( (page = alloc_chunk(d, nr_pages - count)) == NULL )
>              panic("Not enough RAM for DOM0 reservation\n");
> +        mfn = mfn_x(page_to_mfn(page));
> +
> +        if ( need_iommu_pt_sync(d) )
> +        {
> +            rc = iommu_map(d, _dfn(mfn), _mfn(mfn), domain_tot_pages(d) - count,
> +                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
> +            if ( rc )
> +                printk(XENLOG_ERR
> +                       "pre-mapping MFN %lx (PFN %lx) into IOMMU failed: %d\n",
> +                       mfn, pfn, rc);
> +        }
> +
>          while ( pfn < domain_tot_pages(d) )
>          {
> -            mfn = mfn_x(page_to_mfn(page));
> +            if ( !rc )
> +                make_pages_writable(page, 1);

There's quite a lot of repetition of the pattern: allocate, iommu_map,
set as writable. Would it be possible to abstract this into some
kind of helper?

I've realized some of the allocations use alloc_chunk while others use
alloc_domheap_pages, so it might require some work.

> +
>  #ifndef NDEBUG
>  #define pfn (nr_pages - 1 - (pfn - (alloc_epfn - alloc_spfn)))
>  #endif
>              dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
>  #undef pfn
> -            page++; pfn++;
> +            page++; mfn++; pfn++;
>              if ( !(pfn & 0xfffff) )
>                  process_pending_softirqs();
>          }
>      }
>  
> +    /* Use while() to avoid compiler warning. */
> +    while ( iommu_iotlb_flush_all(d, flush_flags) )
> +        break;

Might be worth to print a message here in case of error?

> +
>      if ( initrd_len != 0 )
>      {
>          si->mod_start = vinitrd_start ?: initrd_pfn;
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -325,8 +325,8 @@ static unsigned int __hwdom_init hwdom_i
>  
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>  {
> -    unsigned long i, top, max_pfn;
> -    unsigned int flush_flags = 0;
> +    unsigned long i, top, max_pfn, start, count;
> +    unsigned int flush_flags = 0, start_perms = 0;
>  
>      BUG_ON(!is_hardware_domain(d));
>  
> @@ -357,9 +357,9 @@ void __hwdom_init arch_iommu_hwdom_init(
>       * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
>       * setting up potentially conflicting mappings here.
>       */
> -    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> +    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>  
> -    for ( ; i < top; i++ )
> +    for ( i = start, count = 0; i < top; )
>      {
>          unsigned long pfn = pdx_to_pfn(i);
>          unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> @@ -372,16 +372,30 @@ void __hwdom_init arch_iommu_hwdom_init(
>                                          perms & IOMMUF_writable ? p2m_access_rw
>                                                                  : p2m_access_r,
>                                          0);
> +        else if ( pfn != start + count || perms != start_perms )
> +        {
> +        commit:
> +            rc = iommu_map(d, _dfn(start), _mfn(start), count,
> +                           start_perms, &flush_flags);
> +            SWAP(start, pfn);
> +            start_perms = perms;
> +            count = 1;
> +        }
>          else
> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> -                           perms, &flush_flags);
> +        {
> +            ++count;
> +            rc = 0;
> +        }
>  
>          if ( rc )
>              printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
>                     d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);

Would be nice to print the count (or end pfn) in case it's a range.

While not something that you have to fix here, the logic here is
becoming overly complicated IMO. It might be easier to just put all
the ram and reserved regions (or everything < 4G) into a rangeset and
then punch holes on it for non guest mappable regions, and finally use
rangeset_consume_ranges to iterate and map those. That's likely faster
than having to iterate over all pfns on the system, and easier to
understand from a logic PoV.

Thanks, Roger.


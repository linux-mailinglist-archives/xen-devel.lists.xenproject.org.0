Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21F6F6128
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 00:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529480.823947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puKpi-0000ig-Bc; Wed, 03 May 2023 22:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529480.823947; Wed, 03 May 2023 22:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puKpi-0000fe-8F; Wed, 03 May 2023 22:20:22 +0000
Received: by outflank-mailman (input) for mailman id 529480;
 Wed, 03 May 2023 22:20:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puKpg-0000fX-R8
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 22:20:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae0ccc2c-ea00-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 00:20:17 +0200 (CEST)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 18:20:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4959.namprd03.prod.outlook.com (2603:10b6:208:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 22:20:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 22:20:10 +0000
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
X-Inumbo-ID: ae0ccc2c-ea00-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683152417;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h+x/L9PuPiMriAfHyORNjFM1aZwyLjAAJ6seYpBIHio=;
  b=Bed0PDqWUobGG15Dv5GLNiEcQHL0vY2LJfm/Ji+gg3EkFB9/DUuAgX6o
   PLZCJRrNkSsxuqHwmC81th7d8mpYbvmEBFqihA9HTRMoQvXeVyQtCj8Rd
   vbs0I1zMRRBAwfvnq5InAm/qDQKIHcLqcHvtygb8lEDHTP5vCwE/Y/w5k
   Q=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 107802591
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:De1B3Kx7fGXxTxK1Mph6t+d/xirEfRIJ4+MujC+fZmUNrF6WrkUHx
 2pMCDyCaf+PYWbxfdpxYY63phgAuZLRx9RlGVE6+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPasT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWxK/
 PwmLC1OVRug2P718qqga9JPjNt2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMouFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAN1CTOflp6cCbFu75jYNJSYESXGB4vTkh2zgW49vO
 1I/9X97xUQ13AnxJjXnZDWju2KNtBMYX9tWEsU55RuLx66S5ByWbkAGUzpAZdoOpMIwAzsw2
 TehltfkBzVpvKeSD2yU8rOZrzSaMiwSMGNEbigBJSMO5NzmoZ0vgwjUZsZuFravid/4Ei22x
 CqFxAA7hr4ThMpN0L+p8FTvijeg4JPOS2Yd9gjRG26o8A59TIqkfJCzr0jW6+5aK4SURUXHu
 2IL8+Cc4/oHCZWlnSmEUuILWrqu4p6tMjLGhkV0N4I87Dnr8HmmFahS6jxjIEZiMu4fZCTkJ
 kTUvGt56ZNMPX3scahtZIGZAMAt0KSmHtPgPs04dfJLa5l1MQqYpidnYBbM23i3yRd116YiJ
 Z2cbMCgS24ADrhqxya3QOFb1qI3wic5xiXYQpWTIwmb7IdyrUW9Ed8tWGZipMhghE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:2ULlAKgkYY3/fRYsCbTs6P2rynBQX6F13DAbv31ZSRFFG/FwWf
 re+MjztCWE/Ar5PUtK9+xoV5PhfZqiz+8L3WB8B9aftWrdyRmVxf9ZnOnfKlTbckWVygc379
 YCT0ERMqyUMbBw5fyKnjVRe7wbrOVum8qT6ts3AB1WID1CWuVYy0NcNy7eK0txQWB9dO8E/F
 j33Ls3m9JlE05nHfhSwxM+Lpj+Tqbw5fXbSC9DPQcj9A6NyRuw8dfBYmCl9yZbaSpL3bAhtU
 PYkwn1j5/Tz82T+1vnzmrO6JYTv9PkxrJ4daqxo/lQECzolgGrIKJ+XLGY1QpF2d2H2RIRid
 zRpBVlBeRfgkmhBV2dkF/Wwgz91zRr0XP41lOCpnPmraXCNUgHIvsEv5tdbhzar3Utp8t91q
 Uj5RPli6Zq
X-Talos-CUID: 9a23:fYlJAmMXLilnHO5DVS1u9HAQB4MeeV6C0DTiO1SZMkVjV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AcK8zxw4zo/cLFLvQr8o7LeUVxoxIubqDM1IRu69?=
 =?us-ascii?q?FtpSJF3JwZgeNkh+4F9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,248,1677560400"; 
   d="scan'208";a="107802591"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyzEKcg82G7OwiUeZsD6hDzF6oh6pS/cvCF4caKthD+TavpElqoe2p1JUgoWGBsVLjyCwb8rBizpEGf7mJ7/GqvPpnSn4zRKYGxahV2V4fzmjvMKcY8zyqqQtXdrdrebtZDtk5cz/2kcHbToSJDjjhyYn5NPwPleHMaTjSEO0rYziHSY0bMsO95aQgyVKgZLgY01Y8oKzFITAW21NomGYaMaZ4hE09ZI4/XS5mTpThgfuJL7HJQAUFqnWc8otgMxkbp0Ad8raEcrWZ09KgENzAB/9mtQtGFuqRrZBgnWGESDmROxPaqxqmcpjts2Y8dHEov37KIBeukszso0MKXs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+FFpobbSOiQkMF40Buh+1T++dobOOXyl+bvvWhtG1I=;
 b=RREHfe/DMvhOuBlrJGa8OAlhlX16G7F0MPoe4ORX/iiTbA/cXlWVM1GmrwHYbDqdwsIEgtyZvn17qk+4mN+wPScUAt3WdKIHqcnXv8uJECfye97DV0tleLfB82+co1k9YLaS601eHO0t83hBc+hFwA2GGxsTszZHt2e//in/3e4Of/5G21AVV2ACp0SSgw3OvjzzZ6DvyYWWCIKmhWdvZYsQWzUWqt0BnvHyJlMbBvKppOfu9tf7yV/8P2ddY6q5j9ZE300YTgNdGq47g+l52rvSkNhYveF23ObLe3G8eVxcSP15gxn/EwNwxx77SB6K9XZa8NbaKhxp8x/LNgrY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+FFpobbSOiQkMF40Buh+1T++dobOOXyl+bvvWhtG1I=;
 b=PVF1rO0bByYj/mCGVm813GVh/xLSatiChIYHAuzn9ULSqe1k2frMik5skkQZuvcn77du0fEdAh7qw8JIHMXFjovAAFKIY0ur+8pLIJXiTt5WUNc+qxr6CqrpMyqYktXxYWWYC3q/QHSKH+E+meQB4XdORF2yqPCNKeU2hc8mE/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2c1c83be-19d8-34cc-113a-36245adac07e@citrix.com>
Date: Wed, 3 May 2023 23:20:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: andrew.cooper3@citrix.com
Subject: Re: dom0less vs xenstored setup race Was: xen | Failed pipeline for
 staging | 6a47ba2f
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: alejandro.vallejo@cloud.com, committers@xenproject.org,
 michal.orzel@amd.com, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com>
 <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>
 <alpine.DEB.2.22.394.2305031451130.974517@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2305031451130.974517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: a251c83d-89d4-46ac-38bb-08db4c248e51
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9jYhAAqlr8fmn/5uvT6XBDSPtej+imosfm+wtPePrBuVHISWWBbtVKv8J6/A+kEsA+VfbwDnKcl87qKX2JqORfYQkCKNnVivnNee18CGt7OKpdkbYJHduBWK3gcdNp1+1JcR6atf1vBFHeeOGrWJqH4Mu7TmE2KJoEP3LCN119xpcAS3QfSgVc8wbaa2qheQ5qZuL0/Ax9TwyEF4einO50HG3DJAjkbLpLIE8bbI2gN2fE/d1JzxkUAx7dg4mJicCk255sIdlh91aWOSaGWmJa8bZtylvLC/KeUVQMqI1HydQ7koOMUo3D6leMi40n/h4ANwp1RPPMg5jF2LHlTMrZL5O6H3X74tLNbBxP7gBx6QveOCrWd0De7ut8BZMjXlQkiXF7L4Z0vF7I2dJih8CI5A//mYljxudE6TyTOrKXQecgwufLP+/Q6X9NRE8Web39cLs2ps5LYMR8IHVbnq3+KLlUelvXfnd5UomS+VxSjx7eBgXbucCrpklzQNL2+3wZB+xS6HAoINS5B9HrK2S65vIGJBTaACM3MXzDbJ9TUCPbMEPUDeSXEeN14TuFMz4IjXk6ZN4tkDSj5lTg0AzJ0ipibyeFC0Vs1TzJPecuQEFIy0UBRBDFYVYMkN7W8sGIsbSO5DePY0Vbl+DjJnrMc+efWnbFHNJGvSXylyOAg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(6666004)(6486002)(186003)(83380400001)(31696002)(26005)(53546011)(6512007)(9686003)(6506007)(966005)(110136005)(54906003)(36756003)(2616005)(31686004)(478600001)(66476007)(66946007)(66556008)(82960400001)(316002)(8676002)(8936002)(38100700002)(41300700001)(5660300002)(4326008)(86362001)(2906002)(7416002)(32563001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2ZCQlBpeWczdThYY24wOVA1NEl2Zi9EUW9QeTg3dDdQTVRNRXRvcEdPb3ZE?=
 =?utf-8?B?eFg5cEtUSGRBM1JkV0V6MWpSS3dRM20wYkRQQVFtMVJKQWlMSkhKT3lvN0FY?=
 =?utf-8?B?TURiSGdCRWZYY09seDdiNzQzMktQUFIzQVdYM2pYNENxWENCTktqTFdENm9s?=
 =?utf-8?B?RzNleGRnV1lBc2NiWHBWblRhZ2lVV0xXNlZvZm1WTkdGSmpKc3VQRjdHSWNE?=
 =?utf-8?B?U09YOUtINzFMYkY2R2JXUWdaRWVCWHp6RUZvUXEyYmNVS1ZIZTUvTlpTc2p2?=
 =?utf-8?B?Ky81ZElhSHVPcGl5TGJmVENkYW5IQUdZUzI3NzY2L2lTTkl1S2NRWVBZdG96?=
 =?utf-8?B?eDlOWTZIOEFIQ0NzcS9NRkRoSHNDTXZBMUxPWnFJbFJtYWYxVEc2V0ZGbHhD?=
 =?utf-8?B?VGVNN0YxNXBJZjlDc3VIRmxmVFpIQmkxdlVidTlZK2ZvbVFzQVN0ZTJvOCtt?=
 =?utf-8?B?aFBEaWxoa05Jb21INjBkWHBuVmJPOVN1YU9hWFAwcUhVa3RsSjVCcmNuNkg4?=
 =?utf-8?B?a3ZNbU5SRTlSZHprOVVjSUVqcHdvN1l5U3NpakFXS3ZjQlMyWVlkZGlEc1ov?=
 =?utf-8?B?ZnlCRUNiRmlmeDFLZzBJYXYwNXBnUEZWMlpVbUQ0RDFreFhxd21lejV3TjZI?=
 =?utf-8?B?RW5EeVNtVDBjRURrb3lHMkZTSy9nVTNvSHZnUWxMRE1wS1B6ZEFiWC9qYWor?=
 =?utf-8?B?M1dXK0wzak8vRFV3WC8xdkh1TDA5ekFMMEFSZU85YTF1SlQyQWd4MkRSdHJu?=
 =?utf-8?B?bE5Sek9aZU5qbVRqRVg1R21iUWx0U0NDcXVYYlNQZEtNdEFhQVZJaHpqL1ZF?=
 =?utf-8?B?WExSQUxCVXd3Zm95TEhXUEVadTZzbElUK3hIMkVGS1gvUWViTy9iR2hOQlBY?=
 =?utf-8?B?UHJSd3JhNkhwMGdGQVduelNmKzI3eTVwanl2V2ZMaE81cm4vZFVqZy82SHZa?=
 =?utf-8?B?Wi9URTF6N0VmUVlld1pXcDNBemZIZ1RvYWRVaEdXWVJuUTJKcU1nTDFsYWFP?=
 =?utf-8?B?b2tzSUpYaHYyRit2TkN3aE9zNXNZczZDVGgxS3VDc3Y5MFUvU1liM2NpVVVy?=
 =?utf-8?B?YzBINFBMMStYdkhhbGppVFRDam1WOFVkbWppTVBZNGZndCtCOENTSXNteEpE?=
 =?utf-8?B?VmZGbXFRMzRqRDlxNDAva1UzQkwrK2p5S2RGeGpxSDU0NVJwbHF5SXcwSFhz?=
 =?utf-8?B?NWMzV1A0RHRYN1FaSUhVQ1NqVGFwR2licG16dmFpZy82bEVDbXVLeFNyZU5t?=
 =?utf-8?B?a0lUazFKd2JtYVBPejd2SkZjU2FQdDI2ZGtjTDRTZE8zREhOL093NWZ4Y25j?=
 =?utf-8?B?OVd6cmRhZTRzSFlGSVFNRUs3NHJKSkxNanNRbVFBT3lsY3VIK01GK1BIOUpH?=
 =?utf-8?B?T2RxQTlpd0t1RGJrNUw0M2hJemRXL1VVTGI2TENVN0lBM1BzaDNaZGZtd09F?=
 =?utf-8?B?SVJKbk5oRFVGdDRpeEdNaHZWWm92WnpMTFVobjRabGxoRkFXUlpZalY2T1JK?=
 =?utf-8?B?ZVNWRkZ5WndON1dTcXRDUHV1Y2taQ1FWWGNxKzNmTmwzV0k2T3d5cENCWmNw?=
 =?utf-8?B?VGY1VXJmRTAwbHdCWXYvQXAzMXd6anBIaW5ZK0lPZFJMVk1wSW1XSE9nS042?=
 =?utf-8?B?SDY0T3ErdGg2V0k4ODhMWDVuaitZVmRlUm9wd2xQZFFBNkN3cXUvTFJQb1VE?=
 =?utf-8?B?YjVFNEhMQmZQSEhCbXd6STRPVGt3aWJPek90c05UTWxNMmw0K0ZmSXkrWEZU?=
 =?utf-8?B?TjFoQVZTbWNsSzhZMUR1M09GdkUxbU5lZnN1dVdpMVlDR3E3Yzk5Ty9FajRl?=
 =?utf-8?B?WW01NWVYb1ZaNyt2WjJkdU5BWXU2ZG5xNnl3SVFNRjRkUG10MW9zN0kxME5Y?=
 =?utf-8?B?UmxxNzVFYnFveXluVzRqSGIrbldLdTdTM1IwM2VoTlhNczFwcTZTMVUveEJj?=
 =?utf-8?B?OFBLenVBN2NxdDFhdTlHbHNWTzZSZDNOb01wWkhOV2ZNb0E2Vmk0dzBJYm9u?=
 =?utf-8?B?QjFueCtEck8zemJDUXp2UU9teDFLUmovY0l4SFpPNUpSSGFyeEVvQTR1bWZB?=
 =?utf-8?B?bjhPMlRXREJaNDhBSHczaFlDRW5LajZWb0hQUVNLeHAyUG5QbmhpMHlXMDAw?=
 =?utf-8?B?R1ZvaFcxRmpTQWZEd2FKSzNuVS9ScDN3K1RjYWdOMThLc3RiY0N4NFk0Zi9T?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?L0tqaFZhcXRZOHNaSmZLMzZBMEJGZ0lzSlo0WjdKc0ZuSlNvVGlqUkl4aDNI?=
 =?utf-8?B?OXFGQW50bStWVG5Xb1ZPTEtCc204ZkRsa2JmTFZucWwrblZjcmsvRmlMZ1li?=
 =?utf-8?B?cFQzaFBGQndydTBpMlhSaEdJQWVNZFZRUyswQUxFUWtpUVgrRUk0NnJSL3Yx?=
 =?utf-8?B?M2Q5bUo3S0poQ0JWNi93SEhHK0VwK3UwSlVwSVdLbmJoV0UxTlpnSlpCdGli?=
 =?utf-8?B?eVNpNTU5d0s2UWhLVFV2N2RiYm56b3l4MlprV0t5R2RLaUhMSTBzdXhDUllI?=
 =?utf-8?B?d2U0V0YxOEtrcGdGRDNLaGNYY3Q0dHFRVENWVElrTXFWL3NTeUFNcEcxL0c5?=
 =?utf-8?B?WHBicTVJVFFrWlZEcDRYdUN2dlpqbGZFTUhmVE1jUmp3azg2UjBUN3E2Zk5h?=
 =?utf-8?B?M0svY3d3TmZWYzJFbDFsZjFPR3crZW5HVndMTDhhamphWk96dHV5TEg4akxR?=
 =?utf-8?B?SDlkeVdRbHFZRVB2Y2xnakdiQVhmVE9PMW5Pd3NxV1l6dlJ3VWFBNkJYOTYw?=
 =?utf-8?B?ZFRuSmJMSEdWT3c2cTQ1TzR2U2lXeUg4eDBYVnB4Vk9hd0NDc093U2l3VUlt?=
 =?utf-8?B?RHpUbkxOSGRUdCtrWHZRcmtnTVlUdktQY010NnhyaXMzSGQ2WXBiYkx3NWd2?=
 =?utf-8?B?VXJzL21jR3ZXczIrSGFtY21KR1VHUEFJUU9HQ3pFQVhxVW81aTZsQmJaZkdo?=
 =?utf-8?B?Sk9RN1RQaU1hN0JZYXVsU0p4Wm16RVphV0tlWjJtVjJvNEZlQXBUTkRJWnBa?=
 =?utf-8?B?d3B2UlRvQ3FmNU9hM09vVklibFVhTXd4bEZ4UDlMU3FPaHc0ckJkdVNub3I0?=
 =?utf-8?B?eVhNZjF2b0dyWEowaWtRRURMZ1Z2SjVoNmVJaVJFWU5iYTZhZG5uY2lMNTNx?=
 =?utf-8?B?L2xMR2gwVzR3VTFsTWdzaTB0OXlVNnZNL1NjVlhnelVVUnZYckJLQzU4bEtL?=
 =?utf-8?B?M2xXcUZyZU0vRFF2N252Mjg1QjNJSGFqQldMZlU3WTZYcHVaR0E1amVjam04?=
 =?utf-8?B?WnhpSnNOMm5CSW1HZU14cWpIOVhaYzk2UUp0MjVIc1pVL01RZkt1aVJOSlQx?=
 =?utf-8?B?UGxmQmEyQytyaStjSUczZXU0KzQzOHBCODRFT2JTdDBwYW1ibksvTEhTVmIz?=
 =?utf-8?B?V0x1QVhSdUdib3M5Tk50cjZOM2U1cjVwSXpPSEJZc2hTTzliTVE2TE9ubWVH?=
 =?utf-8?B?ZERNYWF6VVl0YVprblZYSEhxTFBDVW9VY1hYNWVUVWJhbG1pejZpdkhBa1lD?=
 =?utf-8?B?YVREeXV3RS9QTTZMaWMrQmljWjJWVnhsYjY0SHJaMzFubUtGZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a251c83d-89d4-46ac-38bb-08db4c248e51
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 22:20:09.6884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/j6Km3Nug55maPlR4m5AT/bwHWj91Nfn8icpJ93j2jzVmdhf4NubkLj6jncQngVKkrfu4jqPFhK/Dt4fgjoBuT+/BCu2vHV3KweLrafRuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959

On 03/05/2023 10:53 pm, Stefano Stabellini wrote:
> On Wed, 3 May 2023, Julien Grall wrote:
>> On 03/05/2023 15:38, andrew.cooper3@citrix.com wrote:
>>> Hello,
>>>
>>> After what seems like an unreasonable amount of debugging, we've tracked
>>> down exactly what is going wrong here.
>>>
>>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4219721944
>>>
>>> Of note is the smoke.serial log around:
>>>
>>> io: IN 0xffff90fec250 d0 20230503 14:20:42 INTRODUCE (1 233473 1 )
>>> obj: CREATE connection 0xffff90fff1f0
>>> *** d1 CONN RESET req_cons 00000000, req_prod 0000003a rsp_cons
>>> 00000000, rsp_prod 00000000
>>> io: OUT 0xffff9105cef0 d0 20230503 14:20:42 WATCH_EVENT
>>> (@introduceDomain domlist )
>>>
>>> XS_INTRODUCE (in C xenstored at least, not checked O yet) always
>>> clobbers the ring pointers.  The added pressure on dom0 that the
>>> xensconsoled adds with it's 4M hypercall bounce buffer occasionally
>>> defers xenstored long enough that the XS_INTRODUCE clobbers the first
>>> message that dom1 wrote into the ring.
>>>
>>> The other behaviour seen was xenstored observing a header looking like this:
>>>
>>> *** d1 HDR { ty 0x746e6f63, rqid 0x2f6c6f72, txid 0x74616c70, len
>>> 0x6d726f66 }
>>>
>>> which was rejected as being too long.  That's "control/platform" in
>>> ASCII, so the XS_INTRODUCE intersected dom1 between writing the header
>>> and writing the payload.
>>>
>>>
>>> Anyway, it is buggy for XS_INTRODUCE to be called on a live an
>>> unsuspecting connection.  It is ultimately init-dom0less's fault for
>>> telling dom1 it's good to go before having waited for XS_INTRODUCE to
>>> complete.
>> So the problem is xenstored will set interface->connection to
>> XENSTORE_CONNECTED before finalizing the connection. Caqn you try the
>> following, for now, very hackish patch:
>>
>> diff --git a/tools/xenstore/xenstored_domain.c
>> b/tools/xenstore/xenstored_domain.c
>> index f62be2245c42..bbf85bbbea3b 100644
>> --- a/tools/xenstore/xenstored_domain.c
>> +++ b/tools/xenstore/xenstored_domain.c
>> @@ -688,6 +688,7 @@ static struct domain *introduce_domain(const void *ctx,
>>                 talloc_steal(domain->conn, domain);
>>
>>                 if (!restore) {
>> +                       domain_conn_reset(domain);
>>                         /* Notify the domain that xenstore is available */
>>                         interface->connection = XENSTORE_CONNECTED;
>>                         xenevtchn_notify(xce_handle, domain->port);
>> @@ -730,8 +731,6 @@ int do_introduce(const void *ctx, struct connection *conn,
>>         if (!domain)
>>                 return errno;
>>
>> -       domain_conn_reset(domain);
>> -
>>         send_ack(conn, XS_INTRODUCE);
> Following Jurgen's suggestion, I made this slightly modified version of
> the patch. With it, the problem is solved:
>
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/856450703

This fails to solve 3(?) of the 4(?) bugs pointed out between this email
thread and on IRC.

Stop with the bull-in-a-china-shop approach.  There is no acceptable fix
to this mess which starts with anything other than corrections to the
documentation, and a plan for how to make startup work robustly given
all the bugs introduced previously by failing to do it properly the
first time around.

~Andrew


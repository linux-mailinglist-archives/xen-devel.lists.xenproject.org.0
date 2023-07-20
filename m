Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B05975BA4F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566758.886029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbtl-0008Ky-HX; Thu, 20 Jul 2023 22:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566758.886029; Thu, 20 Jul 2023 22:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbtl-0008IK-Dz; Thu, 20 Jul 2023 22:13:25 +0000
Received: by outflank-mailman (input) for mailman id 566758;
 Thu, 20 Jul 2023 22:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV2r=DG=citrix.com=prvs=558cdb244=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qMbtj-0008IA-Is
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:13:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c39dab-274a-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 00:13:20 +0200 (CEST)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 18:13:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4947.namprd03.prod.outlook.com (2603:10b6:408:7b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.26; Thu, 20 Jul
 2023 22:13:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6609.026; Thu, 20 Jul 2023
 22:13:14 +0000
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
X-Inumbo-ID: a1c39dab-274a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689891200;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RmjLTghnezze+nyOnyPG/c/N8Q3wwOZyAB0bPZaALzU=;
  b=N87rNx6DSx/oEMoHd0kHtXgwr2zDGfg74viI3VbvlzmkywUWgD1Bzkvx
   /9tS4/X+Njp5d5zCQbEuSjqkhP69K+soPOD93iJDJjJp4+z7BlMEMhuHN
   Xz/pE0CRXrv2oCZt0m6n0IFntfLrbIampPT0uvV/OpQ2khxKLuiV36vqa
   c=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 116942674
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Hdl6NK894CnCIZgnwreNDrUDJn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zAcXmqOP/jcN2qhLo0nPoSxpEwDsZ/RmtRnSVBupCE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkex
 fcTJWkOVCrTpOWz6u/rCcUzmJoKeZyD0IM34hmMzBn/JNN+HdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtMReHiqKE26LGV7nA4JSYRVXuBm9WgrE6ueZVbE
 hIf2yV7+MDe82TuFLERRSaQomOAvxMac8pdFas98g7l4qPQ7gSQAGQeSXhfYdgiuc0xbTcu0
 UKF2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85jrNRNt+FK++jvXuBCr9h
 TuNqUAWnK4PhMQG06G6+1HvgD+2oJXNCAkv6W3/QWaN/g5/Iom/aOSA41XB8exJKorfS1Cbp
 WUFgOCX9uVIBpaI/ASzR+EKEKCs9uyyGjTWil5yHLEs7z2ovXWkeOhtDCpWIU5oNoMBZmXva
 UqL5QdJvsYMZT2tcLN9ZJ+3B4Iy16/8GN/5V/fSKN1Tfpx2cwzB9yZrDaKN413QfIEXuflXE
 f+mnQyEVB721YwPIOKKetog
IronPort-HdrOrdr: A9a23:WFnsfaPKn44MQMBcTt2jsMiBIKoaSvp037BL7TETdfQ2Gvbzqy
 nKppkmPHPP5wr5OktNpTnaAtjjfZq0z/ccirX5W43NYOCMgguVxe9ZjLff/w==
X-Talos-CUID: =?us-ascii?q?9a23=3A9BTalGhtS5h48mzHnn6qMUeJlDJuIk3Wx3qJIHW?=
 =?us-ascii?q?CWUVuTZfIGRy8p706up87?=
X-Talos-MUID: 9a23:yHWV4goFmRS97/ijLXkezy1JGfxv44SUMmwUt5UWmY6ADHJ7GjjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,219,1684814400"; 
   d="scan'208";a="116942674"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRqM/LRmQDSyENmh/bpsv86P85e1ZoxDnB+D1ZW/CRbNpMVVd707HbFmHgwLrFFuxFGVuJiumu2+o6zJN7EVf0xHih2cTCVxyzUG/QASeRLFDnvTTjbaF/8jkFqyVFS+puNO8G+9ZL68bNVCBDUiDqSiXlJTK61KSbMRP8v5PhMWckffxxAMArWVVkMe8KN/2kVv+VEyciwmdww3WxVaRMcbSrCRytkPnVML6C8RVpvIYTtNpkI+flNxYIUBldoDjbsY+hYi8dCM5Nr2N+cesvgY4/sYKr4WKOo0jiZj7sYmjAE1h5eCjOnvfILE3+h0P84RyICaLXqSAjhWik0k+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmjLTghnezze+nyOnyPG/c/N8Q3wwOZyAB0bPZaALzU=;
 b=iSsfsOv1GJntJi/h6eiZ611IyZYU35kH1Jv/nY/an/Kl/dUUgq0cCqdWCIetP0GF+yU8SloaFd3Gwk5RF+CCGI3Do3dBiB42WedoO0IBY6dLIv85fW5eqF+HymIuCMoksl9Fyl+0nKECoe2qNibBGWwy63TVnzE27VY0QIWQ0YhLiDXiChmS7YRqEkBUlLEyZ121wzzCtC9Cdek5IawLMO+LPXuE9gfMu2WG6Tdgo0ciEh6FjDuNnaofOd+/mKBVYTfdYHzCP0V0bAVW0fP1qebp2843j1KS7SnkJxy4R9PRJ6azW856v5Y7W7fUMQSq/0mEvjqJEcgdScOQBG4tPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmjLTghnezze+nyOnyPG/c/N8Q3wwOZyAB0bPZaALzU=;
 b=C3B3jIVRG6edZEB7R957LsJlNj253UP1Xpy7V+GAwuyQTxEeJ3iB2hL1Vt1Us3M2BBNPp2zW+l95DWSMx/JOaG2l3va75wXX5cPdiR0B1P7qE2dgQJrZfjJ4ZmERoM7sNLiL9jwAhD4697Xnrjlcv7Qo2ZMDIzZfvOUrw6eO01o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e7e05885-01e6-4e65-023b-2361cb84bb8c@citrix.com>
Date: Thu, 20 Jul 2023 23:13:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/8] Make PDX compression optional
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <f962d1ce-4cde-e1b5-59b3-5e71d2e83109@xen.org>
In-Reply-To: <f962d1ce-4cde-e1b5-59b3-5e71d2e83109@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0257.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f738746-4a2f-4e46-0c32-08db896e830a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jt5N5lGM9wgvUY34uKW1YaIykOH0aVQVki0xC9podFLu3QAb796z1WfLbSHCyPCMws+ZKY95YxRDtP7pGMghcYEmO+VHJFWfQrCuuJXncPeHs5E4PCCp/KxXsRrfrl2qQQdsMptaHa8ZDwaOc1AOds89ghBwoVUpoRXQo0q1UcjxqawMQbLRFtb3ULQEvSMjmbbSQ3P+czeb2I/6ALrt3ukAgoOqP/K3fJ3eZDfidb85FZg21icMUXUxrxpgiUOFrP5TUTPXgPUN+xwSUjvw+AcVnBA5opvnKqB//Dk5Q0GnQTAwPHagzYm8U2aGYZyo3lS7AbPyKbsEnWYcPgpxfed59Rb8QZkurypFmlG1hKNQYW0GnVPA3+uygZ7ME1PszflyY5+SNKHu/cs8I6eSvlAm2E6UmDhgULZtOIKhUPGQ730B8AN+DocpAZCaWRSX3X/YAWXC8iwxMKuWnC314p2+W3AP69vGBLDYVjAppAOiT59ullDVBqvKD6IkwxwkK9WoCy2AknF4EOpLieWFtQDLmMOGUQaKuY7f4PVLlYwhirjkw1wDNtrxbt58UoFV0fy0bhBHLilxdp0T5ngCnvfXZJowTpUmUXbSGTv227sFS5L60kJg7ibZnv9J2yuctY1V9oEzexYnBxGLt1peVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(2906002)(83380400001)(2616005)(86362001)(31696002)(36756003)(82960400001)(38100700002)(41300700001)(53546011)(6506007)(107886003)(6486002)(66476007)(66556008)(66946007)(316002)(4326008)(186003)(26005)(6666004)(6512007)(478600001)(7416002)(8936002)(8676002)(54906003)(5660300002)(31686004)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1oxMWl0bXNBK285YjdsbCsvUzFseTlPcmtnVEtUMVl0cWhuRkJzVEJsNFFq?=
 =?utf-8?B?WlRJdlZWeS82LzdMMDVsT1RCQXR0RmFOZ042Q3hwN1d6UlVlYzdLNXZ6RzVt?=
 =?utf-8?B?d3k0YWRTKzMxbkovTURTTkRlcEdiQ0N0aGk3YmpSNjdWY2NGNmlmUWZ1S2FS?=
 =?utf-8?B?czFjU1RmTU9YSTZ6emJzYzA5bld5Nmw0Zk14WUwwckR4TW9KQUJ1VGsxNFc4?=
 =?utf-8?B?RGovVXhPTU5zdnJkRVBIdU5mS2ptVE1QU1hLbHc3L1NNSy9mWjZSeVBRa05F?=
 =?utf-8?B?NUIyZUpqVW9FUzYwWlB0MWsrZWZpUHRobVVTb1FVdlJPOXptbktVcEdYeGZa?=
 =?utf-8?B?RFRFV1hOYXgzcnVxdm41cTlCcWIvajdSalkzZTZBV2pxNS9OQjJDNmRrRUJV?=
 =?utf-8?B?em9IT2NPdDFXSWRJaFBYakFtTGFMR1dSV2txYnY5UytNT1pkRDRUZnhjRExh?=
 =?utf-8?B?YlFHMXRzZ3k4d1V4T3lrQ0NFZzFSWHd2L3QzczV6YVhlUlhMdDlIMXBHVC91?=
 =?utf-8?B?amQybzRqbEhzdWtKa3ZDa0QxYTlQc0RYZU1ZT1oxdHRXNEF0QWUxd2tDdmdE?=
 =?utf-8?B?N20xdjlYZ00vRTZDcU1DcW4ySi95N05FWXJ3all3WHI4Si8yS0xOR3pwdW9F?=
 =?utf-8?B?aFVBcWFYampQMHNBcFA5NTFNaEJmUytrOE9XWDZ6MmFTYUFJV096bG1nN3Vt?=
 =?utf-8?B?K0ZzQkJ4a2ZNbGZVOGxpNHZxQW8vYkxOcEZsRk93NjRQL0h5VS9EL1Q5NGJq?=
 =?utf-8?B?TmJIYmRPcW1WVHAyeUxldUZVbHVoOEtodjlrZXZ1VGx2bTJ4Zlp5VnFXVXF3?=
 =?utf-8?B?OGd5MXRHRlFvZi9XRnNTVklsM0VmUjBIRDgyL0VZNnhRMnoxT09CYTZmTjFk?=
 =?utf-8?B?K1dtMllTaE01Z0U0Q0FqR2s0QTR0RFM3QlptRnFWZ2xKT1NWOTRrVGMrMGxV?=
 =?utf-8?B?OEVrSUF3V0Z1NkNNNno1Q3duem1pQVRObUpWSGdDQXpjMWs2c2NXRlhxZVFU?=
 =?utf-8?B?NkNJTlZhcFN0aVVxUVk2UGYxUVZ2bFpVZ3lNYzlHamNibnp0QmN1VnhGbHdB?=
 =?utf-8?B?ZkVjMDJ1VTZBc1A1clhhdzRLeWFBMFgyd0VVSEpNV3hCRklYNGowUDlVcSta?=
 =?utf-8?B?cXVKa3pEL1dkUFVxSjZEVUVDMVlLNmQyOTFZOFVFWlVtWk9QWXpBazV4SmJP?=
 =?utf-8?B?WGNyQ0VxMDZqUTF4SXNjTTFGY211bWp4WDdQYlVxTkoyNHpjbjA3V2k2c0N1?=
 =?utf-8?B?Q3ArQm8yUytuUWhrQTVPaFhpN0dtN2ZpT0pVeGFiRUIvNWdwRUNYaTlQVS9H?=
 =?utf-8?B?cTI5ZXlDTklCZW0rZWpHMDBFVmhwQUFNcktxaXFiU0RzU08ySjZER3JNK0x5?=
 =?utf-8?B?cDQyZzBTTmh4YXJlYXlyK1ZGRG4ySWlPc1NNWFg1c215Q0NUV1IxbUpKN2Np?=
 =?utf-8?B?YVYyQmRFcm1KeXREYVZZWi9vb2t2QzFjeUw3QkxkTllTZEZlWVdhWmZuRFlk?=
 =?utf-8?B?U1FJQzZxNXFKSjVWeVh2WlZGT1E3bFlFcWFOU2FhL1NhVnJIK0djNUptS0M2?=
 =?utf-8?B?Z09FclBaZ0xiQ2oyT3M0clFmb3ozQ3RybE9LNUhONXhlRDRSVXR1enBrUUZN?=
 =?utf-8?B?TDVOSnJscDJKVjZkWm51RzBNZ2xKMjkycjFoT0htQ2JNc2xVUVBsTTNseTZq?=
 =?utf-8?B?bkZSMUN3ejZtUTlGMEM0WjFaenJQcFJxWEtxdU5hZU5ORTMwTGYvTVBNeVdW?=
 =?utf-8?B?bHdVeHhDWld5UmFqVjlNL0Y2YTh0NU1hYzNQdDFjMGJCMHEvTUV3M1JJN0tM?=
 =?utf-8?B?VVJTS1BDQytOckJGa1dVZHJCbWx2eXdrR0NRcVB0elordWZ1OHdHRUVNTHgz?=
 =?utf-8?B?N3RKZTdGQlV2RHFhVnQ3RTZ5MkZOQmQ2dElJS0VRK2N4NFAxOGxXSzJHUzZp?=
 =?utf-8?B?QzNtSE9FZXJTKzgvczNnM0laSy9SVFcwaWhPdW92cjNrOFBsb0lISW9xcC9J?=
 =?utf-8?B?M2hTSU9UaTN0MlExMjBLanlFZmdsbWt0S1hrWDZWeUpSdnJudnNUOTg3ei91?=
 =?utf-8?B?bEtXYks1YjBGOW52UkR6L3Zwai9iVGlIUXUrR3krZVBRemkzTmdPamxQdkRw?=
 =?utf-8?B?NDZqZXZpZFROckR1TUFKaTlScGUwTGZJczZldTJ1UWloZGFTU2J1TDJCSlA5?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L2ydFhPB06MHf9i2rRP4hwD84s81M8O+S74Ja9qEfpAHs+XJILQEWxkQPc37XAsD5xG58ggS8lw4Ml+CHE/ebzgOQpCn5W0Pwu2m9sRyVCkX2x1MvWySSO/oUWISGs/RyGa7VzrRQ6yF/9gqZIqs/hUqqLndbw6JYSvOhzKB8KBznUUo2HkAnnASNyTe6eVFe4fuZdvEa+OpGpokty/DlgtJrIZ1vP588X27QcNXS2ZAyAKK1g7NJEe12lqRFtKSPerFGWX3QrBdVSRW8d2FW4tjX8U6JK8CEgRPXpgw21KLCRjtgmf2E4dsJafj0ToxE9E6Uz72COgBIZyxF502yNZast1iCd+0Q1Ch7PcgU2qFy3B0tdnea4CEI1h/rcPFovw4T2eRFxasCEFXBnentOqDoIbKWebD3R1NF24UDtVFtta7NAuNNwO/GPTR9fArzopg9QzYQt27StCC+NYWreFbuktMfL6m/GDp9GdO+Hwq4EBWHJjb6qq0Ce6pcX9kqN5a+HIh6ZQf35gQR/nX61L2XUeysWc2g1vgkCg3bvkaOZl1n2XHLbi3SpRSucrHGpGzqriYcfw0MENUsqxc3fDoxTAS+O6oYc7QS0Julpeq7r7BDNdPUg7ZGeGZ37OU7srFpcL2m9R6EuARDT2Zy1tETDy7lrTkj8uBjRIuHfHRCxmmjsxTs/zEGJnKovvKzrbNE8IM78di/Q+T01571/xEc/5G0Rib+ypA1TZM51RqeVRV22bwIW6DNuxXeuCsQjwbGitV/Tu4gvvPFJPoAYPLpru2lqmKb9c2WPMfnrEyfCYqrvgMGQOdedjpFbxTpiJZCKbv5LQQHHhI9kkQ/bRFBkrmgocwZWgvjpGDNDUMFu6nVTo2OSOa5ozLo61QPzOge1rvfMmybLMuc1X0WNMOCJC2II0Kpk36ma/u0/0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f738746-4a2f-4e46-0c32-08db896e830a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 22:13:14.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+dzlRDa1J+AWk8YW2XExlmXM05SEF7jDUFcTrHYUHzWVdGai4/1hiFObuWkfr5WwRF5JFWzXmfg11PlZ3kAQyAmrXQKE9jgNJGtCl1Pr7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4947

On 20/07/2023 11:00 pm, Julien Grall wrote:
> Hi Alejandro,
>
> Great work!
>
> On 17/07/2023 17:03, Alejandro Vallejo wrote:
>> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's
>> impossible to
>> disable it because the whole codebase performs unconditional
>> compression/decompression operations on addresses. This has the
>> unfortunate side effect that systems without a need for compression
>> still
>> have to pay the performance impact of juggling bits on every pfn<->pdx
>> conversion (this requires reading several global variables). This series
>> attempts to:
> Just as a datapoint. I applied this to a tree with Live-Update
> support. From the basic test I did, this is reducing the downtime by
> 10% :).

I'm not surprised in the slightest.

We've had many cases that prove that compression (of 0 bits, on all x86
systems) is a disaster perf wise, and its used in pretty much every
fastpath in Xen.

Look no further than c/s 564d261687c and the 10% improvements in general
PV runtime too, and that was optimising away one single instance in one
single fastpath.

It's also why I'm not entertaining the concept of leaving it active or
selectable on x86.

~Andrew


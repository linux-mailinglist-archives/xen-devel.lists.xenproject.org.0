Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00C785961
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 15:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589241.921073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYnxR-00033Y-Ak; Wed, 23 Aug 2023 13:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589241.921073; Wed, 23 Aug 2023 13:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYnxR-00031O-86; Wed, 23 Aug 2023 13:31:37 +0000
Received: by outflank-mailman (input) for mailman id 589241;
 Wed, 23 Aug 2023 13:31:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmRg=EI=citrix.com=prvs=59206e676=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qYnxO-00031I-Fc
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 13:31:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e472337-41b9-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 15:31:31 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 09:31:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB5966.namprd03.prod.outlook.com (2603:10b6:5:389::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 13:31:27 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 13:31:27 +0000
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
X-Inumbo-ID: 5e472337-41b9-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692797491;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5RfTx1J1XvZqRy6wl+tk1NMB4UY6EpcATgAX4Vw4GvQ=;
  b=PZC+brhiPpAZxlWym3QOUsg8purfJ+I1hhV3a4PCfcNTLcuh/wYafMo7
   T5zRga4FFtvcxrSLGJdwQ26UJ2q0JhRzaLua3m8IdRZn/GgMZ3J53u8uo
   BuTRYPX6qcxqdJUJacmFN2LB7GxGPewVoXkx91sEJOltfDStD6GMIYmY2
   c=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 120404847
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Rz2B1qPhCrAursvvrR1xlsFynXyQoLVcMsEvi/4bfWQNrUomgzcAm
 GEWX2mOaPeNNjDxKN4kao2+9UhQ7JTdm9NqGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5AdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rdQEFFq/
 +JDFBMqVSiSuLzt8vWqY+Y506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCMpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj02reTzX+kMG4UPJaD0e5lpVGd/2w4KEAqSkahn+ei2kHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+8ry60fy4cLmYAZCoNZQoD/9Tn5oo0i3rnTdt9Eajzktz8Hxnxx
 SyHqG41gLB7sCIQ/6Cy/FSCjzfyoJHMF1Yx/l+OBj3j6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:8HjxgqoeBlbvGAN5RMrBpLkaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-Talos-CUID: 9a23:GTZxOm47oCcoAOPyTNsspWkFKuQvbCbh71DrG16HVz1bD6y8RgrF
X-Talos-MUID: 9a23:id288QU28wd3Sbzq/BTXoyFtEctm2qSFKB0xjogchdefZSMlbg==
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120404847"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkTDPLz54CEy7/VZfoo6jpugBB4kIIgfLVlOE/HUjpzUiHUEeiUmt5pUFVxoNIZXa0saTKhlHies/CkZiU3+X1BY4hrzNw7X2QTTpvUDGkzmasZMUeBBVGLKdJh07GhDRiF59fP1+w0rfJgX+Kim38dkrLUtnwHtpf7cQxPFlZ4/G6K9v5HIyTYyVDPYMmiceLwXVNkvHWwWEQyDd6DeCS4zTEKUw2idrJCDU3n6L69/orlcj3lppT8cGLK0P67F5g5XQPqT1GqyyZuhts0DZ6hm5ETWl0qz2+SWtotJ7F8OxpaOofCpSmC0uSrdapMBS0A20iax4jb3vMnTSOuerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IhcFbDYVzEkZuOzrHZ8RaicR1GnnISMLxAUpr9BDOE=;
 b=Utes5OKlqQFEFKt1NcJIFDBkuSRxzgIJcBeSi5teFeAXmXqvs/7k+xLmRyVIOZYPB6hlygt5iAZXKAxKOBMzIQpgXGnsvl2nxJuJDYPPff+/nNWi7NFA6nGbxjww4uiIQJRPvtNtfJcDN/HKocyDqiWprOOHvO5SsUG1LoW4nmOV6EJPIQHeIPr9ZB71ot5Ohm6Vcwukof/2w4gaoxsWVnr9WXoexSucL2PJfH1995Hf9j+RdANMDAKfNTvEAhnsH9hW9y0xI0bD/9T+sktdXXFsxsfLxqfChre/ZeBI0FBG3HMf5jGMK8onJBVVEvDlFY/iZBLz4pQHS3Cmbj72NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IhcFbDYVzEkZuOzrHZ8RaicR1GnnISMLxAUpr9BDOE=;
 b=k8zo9GfZtupW5BsGzhXDSQR9H+FL+QltGlqtG1d72t4bo1XN/U8gIOwyA311Lk3C99WpxQAv9G0w/uN6E6z7muMJxYxyOoNv8C/i90+18cFsnRr0OcIek6DxZDza+3wRHxC/aHQB0uxlRyDH44YXymJiC7zcliFoPaJgYvzXHkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 23 Aug 2023 15:31:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before
 re-entering guest"
Message-ID: <ZOYKKS60iWq6Zx51@MacBook-Air-de-Roger.local>
References: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
 <ZOXqQrFOpofVR_B3@MacBook-Air-de-Roger.local>
 <327109c1-f8ad-f8c4-01b9-ea19dc5df247@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <327109c1-f8ad-f8c4-01b9-ea19dc5df247@citrix.com>
X-ClientProxiedBy: LO4P123CA0139.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0ec529-ecec-43fc-eb49-08dba3dd406b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h6CXW2P1A+5GHNXNBTEX1og1EGZeWMItiDMSCr/SL/+b4TIiPQQhy4/HlD9XS1qvx77Sr1HNi9BlKcWnhN9xTL6q/lKrilxSBBeuN4ftNhhCcpUFcZ66ueEeMVxEoOsyBdd3LpeCjd2Tdp449xWwZHPHTdfzDqR220908AgObpj9YGqzIIZ+PZOpFNc9BtL7JXjE5AgI2I0rGBqzejRfB0RKy6NZ4DIBr53oAGAmKxmEFq0QrlIwhFdFLOYAUbltZRkwbPb6DCN0dM7LnvWphzQEOE7ZSZP1ap8vBUizOIsNYW9/Nl8Ndgnk2MRAj1pn9xn/Evmh811A6lvxERM/1g7ve+T0TezjDIhXeXayxTGLOcWVsTjnknc1CZCL1RyT4DDYgLb6P5srQwLB+IqNrznHeuq8vUipyIx0Rf0ckzJujiYUkBQ38X64qKP1LeEKXkFPXmhBfpotOvgHBPmdeG/djpfCY9UUuKEZZaIK3r9Kvc7FHNrc4uwqjzWOuornZoWYWRWeQrKOpeHk+iKDh3OrdohepTjTCL7gWuGrXsGTugY1himlE4iRyO+HyrLt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(1800799009)(186009)(451199024)(83380400001)(2906002)(66946007)(6506007)(53546011)(6486002)(478600001)(5660300002)(26005)(6862004)(4326008)(8936002)(8676002)(38100700002)(6666004)(66476007)(9686003)(66556008)(54906003)(316002)(41300700001)(6512007)(6636002)(82960400001)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3hiKzg5QmFxeDJOWjRSZVJVVVpCZDQ0bUc1NkRjUDd2bVYzd3JjS2UxZnBO?=
 =?utf-8?B?ejAzK0lxM2d4N3JBQXdsdnF6b0UzdENzZkJnTjdkcXZoOVYwOXlmQTBaeDc0?=
 =?utf-8?B?WlJsd01WQ2x6UHJMN3FYekNQc1htU1I1WWFvdWl4TVVEKy9rd3RvR0Znb0p1?=
 =?utf-8?B?akdRN2VDSS96TmVMN1RkNFdNZHpNNS9Va21tZUVpbkRUR3JHZUFsL2lNdVhq?=
 =?utf-8?B?SXREejhLSUFPR0N6cWtWb1hWRG1LbG5weUl4aE01QnR1djVNL0duaXlaVWQ1?=
 =?utf-8?B?ZFBic0pGM1N0UGJrbHhWSC9oS0x6WHpsWS9zYUVxYUFGckhzT2w0R1lnN3FK?=
 =?utf-8?B?Uk1uMmpCRkk5RHF6YitFYkZpQ3BBbjVzbkJkd0NBdCs1WGFuSUhkTWFMWmdB?=
 =?utf-8?B?SzArUkEvU2QyOXRsZ3NLT2kxc1lHQ09iNHdPYTlHcmFnVmk4VnRFbUpNSzVN?=
 =?utf-8?B?Q2EzbTJna09OemdiY0ZPYWpHdy91SWN3elA4blNZRy9lZWJKVWkvNkRqaERl?=
 =?utf-8?B?UGhMYU5OcEMrWnlsTktvNFIzRDlNUVVJaFhKS0RNZTljZXZPV3ZTRHZjVC9U?=
 =?utf-8?B?WlU3RzZwWVI4UWRlcFYwb1BTK05GSGJCTENCMVg1NzF6YlFoVU0yd25tanRj?=
 =?utf-8?B?U2RIbkRCMlRPTStqa3poOGNyYTFneG9XaURkNHFCeGhNMG5kYVl0bE5zaUdq?=
 =?utf-8?B?K2tYbHg0dzZJeVNUWmErT3l5YU5Pb3NPSGZuWG10ZWJQekZFK3BwNFc3T2VD?=
 =?utf-8?B?LzB5ZmxuMklXY2JqOTlDT3p6ZmlvUC9NR2N3cFhVVnVHS1hEZTN4VlExQ200?=
 =?utf-8?B?dWpQdU4xS0szNGF0MW15Q2dzVU1wOWVPVDNPeERIcVZtYml2TWp3Vm01QU1W?=
 =?utf-8?B?dTFKaUMvUDgyY3k1YUlnRk9xMXgwOFJORG96K25aSXNOcnZUNXNNcGRsQTdS?=
 =?utf-8?B?KzhxOStrV3hScDVyN2pkbW0wc2t1S2pEODM1WWJlQ3NsUzFrcG96d01VUnJv?=
 =?utf-8?B?UmtKYUExUVJlS1Y5RWhqQVMwY0F1UXRQeXUxNE00WjNaTWZZNks1cmd2UHV6?=
 =?utf-8?B?OW16Z01nSHVXKy9EYjFvREtHN0pGMkFNQnQ5d1NHRTFXT2NOWTRUNzBsQ25L?=
 =?utf-8?B?Q3NvVWh6Z09PN1NMUXZVY2x2VzlzbjkxbWxXY0FTSmdCWkNyb3A4N0FnVC9x?=
 =?utf-8?B?U1Y2OUd5dC9kZmVpY0U4eGJNRW81eS9lQ25nZEFFNThXcHNCU3ZRZlVDbmI5?=
 =?utf-8?B?eGFqTUJHVUJHQlRmK2RjTnVaWU1IeitMUnFDQ0JuTkc4a2VjNFBFb0lRdUl0?=
 =?utf-8?B?K1hzYno1YzY4YzhzekoxcEUrd1hFaFlQUnQrL3NzNHMrbGdsMkNySlNVYkxY?=
 =?utf-8?B?Rk5scFNCQXZ6dmNtS0d6Uy9SVk1aUXZTRG02T1cwWVdkUWJpVU90VmVVUUY5?=
 =?utf-8?B?V0RZMEVpMXpQK0tPRmU5TzlpUDRoRzk2Y2JWMFFqUmVKWlJBcElnSjY5ZFQ1?=
 =?utf-8?B?R01ic0lOM1dOSWVGMGJ2R2VsYkVYemI0elNSQ2poNDlkL255alpCcjl1NFFk?=
 =?utf-8?B?RXZrZnEwalNWOUxmV3lZVzlaN0ZMQTBRZGJDTU5PeFhvZEJ4SDdVc1hPQlpN?=
 =?utf-8?B?b1BvSHF5YjdUZlhaNFgvZE8ya1ovd2k1V1JEeXFELzI5TjM4bTZxV3B2Y00x?=
 =?utf-8?B?bW1RMXZDUmd1SEhZTkpHa0VjUGJUSGpuRFErbmVNWkpmK3oxT1F0c2pHSWdV?=
 =?utf-8?B?cCsxaU10dlpNNWxwaEdVdHg0TTlXeHpFaE56WkNjOE94QnFpVVZ0amlxSk8w?=
 =?utf-8?B?aTQ3ZndPYTFUbUZFK2QzbUFGd3ZxQVptOGEzbERJSlRhaTJ5NStNQ1lKMkp2?=
 =?utf-8?B?QmU0a2JESVFDbThFSkdWMDlFbWtDTkxjVWJQbFE0b2lwMEFlYnlmai9ONjVO?=
 =?utf-8?B?WjUvMUloRFJTNkF5QUt1RHNvazl1VnNJR0pKMFp5dDZzYmNhZmZ6dmFRUDRh?=
 =?utf-8?B?UmJiWWZiYlEzVnlGNmtDRTRnM0QvZy81SVVjUFordkpsZUp3U0paWUV6YTVa?=
 =?utf-8?B?TC8veVVEbXpUN2xOeUNUdks5SGZreHMyU2FURWZEVHcvT0U2ZGVhR3doc0JK?=
 =?utf-8?B?cERUV1F0Mk5pNCtvOS82Zk5Edm1PZXRodlBmeEVxOUx0NDZxUWZEREliVDg3?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9v2PqdsZrTV5U1fopFfSdaJJNY3bFlS9PY4N9CfnoQecnXRm6dbAomTb5rpLzjUEF798cVXEhf+aMrWp3UScwcX46SoqxXdtldT/kkv4j5fXTuND1VX5E2qw2Gu29Zx2eM+0TXdNNdZ/qFber8Fza9tg8z5P9GWuShiz07QzkmttQzWoUUIXTHZ7aqr3TlTiGyU89KnrRB5dd37J81bgARyhRCPSSLy8rIo60pQ3pMrMTa2JP+HpoJyR95InXfcvw3fM7iOSlTzpK/tyxfmnhrlvzU7GE0cI0Dolb7lvstg7mjHvfp+4xcQ6hxYjyts2rj2dlFTqXPJbmGvQcJ2CN+xV63agI3wTwwK1yliZ0wGbbXe4uw32ihsSmnY+zdykiQh7dT3MEH27cwYXJCd4WZgupLppAegSrZFw7Caa8psfF4m1crZ/W0OBhuagKPyQaYRAms/oMerDI1KqNIzPvMZJX8s9RsJYk3L/QFc2/wm8ACsiguN+9tRq6lWfp2WlUhmgcj86uKNOxgfbSgYZilyesfIIWunDEYsaCtYOTu7v16c1+MqBE554Md7vZ05J9fDD7EPWZrYxugBoBNnlXVknzxmsKCDA/dAh68pbhz0+atcoi0N63Tgev2cympnMB8Ql1F0dhI2PMAqcU7zOfURDjTKp0Agzm46ifiBbCb746+8Pgs2DUpD2ZE1cW31AlmLMAi81GrGZ0+HuiYdiKBwHtxMbHVckWv5MLeW1L2qdOApRIjVXANwlyt8EQMLBpPLxaxM3HBITlJBz2kIxH+2hHct42lgUy6Qw6VwGufS31iDealMVTtHf9OSGLIjVaDcWW3449Oe99dnHH8SNnekUsgIYjJR6/O0zkrGlxpY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0ec529-ecec-43fc-eb49-08dba3dd406b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 13:31:27.0331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vl5DATY3SO8nv+/sqI/Pl8B+bDPTVpTB/EtcQ6VIZ1Ies6ZnT/KbtpHU5YEbDyWpm5xGm4IkMMDO3aK91WcA8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5966

On Wed, Aug 23, 2023 at 12:56:48PM +0100, Andrew Cooper wrote:
> On 23/08/2023 12:15 pm, Roger Pau Monné wrote:
> > On Wed, Apr 05, 2023 at 10:52:45PM +0100, Andrew Cooper wrote:
> >> At the time of XSA-170, the x86 instruction emulator was genuinely broken.  It
> >> would load arbitrary values into %rip and putting a check here probably was
> >> the best stopgap security fix.  It should have been reverted following c/s
> >> 81d3a0b26c1 "x86emul: limit-check branch targets" which corrected the emulator
> >> behaviour.
> >>
> >> However, everyone involved in XSA-170, myself included, failed to read the SDM
> >> correctly.  On the subject of %rip consistency checks, the SDM stated:
> >>
> >>   If the processor supports N < 64 linear-address bits, bits 63:N must be
> >>   identical
> >>
> >> A non-canonical %rip (and SSP more recently) is an explicitly legal state in
> >> x86, and the VMEntry consistency checks are intentionally off-by-one from a
> >> regular canonical check.
> >>
> >> The consequence of this bug is that Xen will currently take a legal x86 state
> >> which would successfully VMEnter, and corrupt it into having non-architectural
> >> behaviour.
> >>
> >> Furthermore, in the time this bugfix has been pending in public, I
> >> successfully persuaded Intel to clarify the SDM, adding the following
> >> clarification:
> >>
> >>   The guest RIP value is not required to be canonical; the value of bit N-1
> >>   may differ from that of bit N.
> >>
> >> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
> > I think the fixes tag should likely be "x86emul: limit-check branch
> > targets", since it's that commit that missed the revert done here?
> 
> Well, not really.  ffbbfda377 really does have a bug, irrespective of
> the changes in the emulator.
> 
> The presence of 81d3a0b26c1 is why this bugfix is a full revert of
> ffbbfda377, and not just an off-by-1 adjustment.

Right, but taking this patch without also having 81d3a0b26c1 will lead
to a vulnerable system, hence why I think the dependency would better
be on 81d3a0b26c1.

Anyway, I don't think it's worth arguing over, so if you want to leave
it as-is I won't object.

Thanks, Roger.


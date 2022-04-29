Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425FD51507D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 18:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317504.536863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkTDX-00006L-VQ; Fri, 29 Apr 2022 16:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317504.536863; Fri, 29 Apr 2022 16:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkTDX-0008Vt-S2; Fri, 29 Apr 2022 16:11:39 +0000
Received: by outflank-mailman (input) for mailman id 317504;
 Fri, 29 Apr 2022 16:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkTDV-0008Vk-Tp
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 16:11:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09f8cb76-c7d7-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 18:11:35 +0200 (CEST)
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 12:11:32 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM8PR03MB6229.namprd03.prod.outlook.com (2603:10b6:8:24::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Fri, 29 Apr 2022 16:11:30 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 16:11:30 +0000
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
X-Inumbo-ID: 09f8cb76-c7d7-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651248695;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pnmiXEdkPy+j/yyXERPZ2YcxcYtBea7dAQcsZ3jmo1M=;
  b=cUbrrb8/7dxjFurPS4K7YRuXcT3ruNLN6icfLP/HKuAEWbKuNJmUhJUp
   Ayg5ZftKzyQ6np4y/MNMB2cr505TQgNUwilO/t/FQQZTf4XT+AmF/zk6u
   l5dBrlfJ/tnErfnOrEO5CsLFDLwUgdQrhD2WhvWIggDHpiersZSptadHg
   g=;
X-IronPort-RemoteIP: 104.47.58.173
X-IronPort-MID: 69646308
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/NDqUarAfB83wlPnXTQV0fLprDxeBmJsZBIvgKrLsJaIsI4StFCzt
 garIBnXM/feNzb1LYt0boy29kwD65TTydAwTgRkriA3QSwT8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvR4
 4Kq+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBIL/PgKMgfEdjLyxPF78Y8+DKemGlmJnGp6HGWyOEL/RGKmgTZNRd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp2Zsm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrL9PRrvTOLnGSd1pCzM8PcIMOpXvxKl2Gdv
 UTd5Um+GVIFYYn3JT2ttyjEavX0tTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiGGAlg4RXZxXCeJS1e2W4q/d4gLcDG5USDdEMYUirJVvGmds0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poed9e3Yq
 9xSkBUDug==
IronPort-HdrOrdr: A9a23:D06Iyq9VVmzpgm402Z1uk+FRdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nKdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInly6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXsIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6U9bc16UGT0vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNId3AL3Z
 WBDk1SrsA+ciYnV9MCOA4/e7rGNoXse2O7DIvAGyWvKEk4U0i92aLf0fES2NyAXqAu4d8bpK
 nhOWkowFLaPXieRPGz4A==
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208";a="69646308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcECdsA++g/oSAh3At5bVxQPm0R03chN5+XLr9I/g0m1CHZL1wnSHhmV/dXMIulallWWmXfuZSH20Phw7B9PNfDF/2VwzyRijQ7//KrG7p7QhDI7BFe5/ty/k0BStfRULu3aQB7d+/jypeonGeaMqAvCve7L9zmVj+V/ApZ7nxqUsgIytVIcoE43eurnRR62QrOJmzbG1YX6AFHx8JPW0C+lX1nEjBMWNKcNJ1zmaBIZ9sopKt9vFrhZraO8bj9YF64IKrWRQ+EJ8EaPydOfpmSEAw1EU2t5y1qU6g3S0yoNEwOSRd6cfN5PK/JJqcIBiP44Z+Yx+REoiVfPF46Z3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t1EP7t4LaXUWLbcjhMeSu/sj0eW1jRKE9liAsTWpIs=;
 b=DYMina32b7Gc7s3Tps36QBgaDfkjtsDT7AMZbGf5JSZeNyB8RZVQc8OiuIs64sd4TvkDRcqk2NI5prNp4zU6G4imDTv3kUdpM9dKjxxf+GiqPmh+MSFrKpKHn3RjkdxrjMQTp3Zcnt1C9zv6DOr+NZbqMOR6vrLFu3RwJs4k6pASzm+bWb6IdgqzB/2gN6hAp8rJ5iWu3OgFEHWAiYfLPqYHAjrbLNN5JpgZytGvcGMZxmaqItLpNEuREhbNcXhPmttrcpNcrfosO8vvUw36JHD+xI9Awitdgl4xYJmq/mXvdrxHdzE6tqbFkUopq5o6O5TjWyEkUW/CrDXkE+GL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2t1EP7t4LaXUWLbcjhMeSu/sj0eW1jRKE9liAsTWpIs=;
 b=L5DQfTdVGbVYB4f9SbAgjtRyotQjFE+uy4ktZwGbnUqrrmDy0da7CjEhFwKUqbZT+re31SSJymbyaC/8mZAekRCh8/FMzB4QG71UY/NTIZG2HsuSUdgkc/epOz2gn+wIMFTEFvh5m4YHTfI8DkamV3o4FAgiuXX+BX2zcbKIRF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 18:11:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Message-ID: <YmwOLRUz/mgjOBt6@Air-de-Roger>
References: <20220427104718.81342-1-roger.pau@citrix.com>
 <20220427104718.81342-4-roger.pau@citrix.com>
 <38f0e56e-f72f-698f-c4c3-5973ec9e46a3@suse.com>
 <YmwJFqcfOX8oFcyI@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmwJFqcfOX8oFcyI@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0465.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11760ffd-541e-4a79-666e-08da29faebaa
X-MS-TrafficTypeDiagnostic: DM8PR03MB6229:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<DM8PR03MB6229EC80D1A708F1B6AB319F8FFC9@DM8PR03MB6229.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jn4M/V2zfv4072o2ZDdj3gXzuQSzpnzkAWWEyJijQZlsn+0rNcuMzXzFVlhTXLVxKqPUpAl1rvRcB/Hel0VrNc98ykthTVaFyKanrUXXDOnbWCB043OrlgRHDjVv+iIu48MATkgXbD3p93czD9rfavgsB/YbDDDmaMEc5uHVIVc4YOOvCtH1zOLg/YtEXXx91pSUbLqDeuBrk5iBHvtt+WjKhtIE2FVQcbSjkqAoA8KvRgJ4+Nchrd9wFiMcjElEL6ZeT5dw6AyvLCrPG9ZwF+uxTB7ySSZkvIqhtnH5tQeFtK4t53m/9+Co4kusyRtkrkbV8KdZwnG5wQ8/FUdFw0Zzzt1h0nnn6KMaG6Tz3DsKIOspnW16sr8P/XtLSXGbkOpx8WlKZsIpL1112fwnYQnrNqoKeg4b4tSogNJLyDNtXtIAIp05UCHt2M3ne/QyCBIFyquGk2pALtS+KSrrOObl/G2zBI6KOA+Qmv1QWUvXrvRVFnjGfHx1TeBxNOA5zyG0IjvcRCNtmkgni1tvDiob3umlPIO89XvwOw6sul3Vm0btD+4CDxspMe/3ocgPdKdog7apgmdzqjEHGyFc8y2pqe9nv27gm1U5Cy79FKb962QwddnaCSmGZ2nqvc5Lp1FKW+ZqJ8zRZLsQvcjkGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(2906002)(4326008)(83380400001)(316002)(54906003)(8936002)(6916009)(8676002)(6486002)(5660300002)(66556008)(66946007)(66476007)(85182001)(26005)(6506007)(6512007)(9686003)(186003)(6666004)(86362001)(38100700002)(33716001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0Uyb044Q1c4cHhZUURpc2NRR2tNSVNadTRCZ1hjVG92QXp1S2FXbXJJZThn?=
 =?utf-8?B?cysybU0yeUxmRTRXRCtENml5VHdlQ2NnVk5MZk1CdkcxWUJmTmpNUElZSHJL?=
 =?utf-8?B?cmozZU55Yk5ZYTM2V3o3ckpOZERGUFB0QjEva25iSWpQWjl1akcrQzMyQlQ5?=
 =?utf-8?B?QVV3UmlIR0VSNVhKdDV1L3pmdTlhRjJBWkMwc1FPK09KTkR2Q2x4dDFKL25I?=
 =?utf-8?B?VnlNTENYZFRRd3ppMmt4SjJCamNJYnExYngzdlZjRjZ0NW9uY1NnYnZWMXVQ?=
 =?utf-8?B?TERrb2JxV3pqOUZJTXBXNjFOM1B6dXgxSWNIYXRGUzJVYWFLbEl0MEpobE1K?=
 =?utf-8?B?ODZFanpUUGpneGVpcTl2bThrOU94cGVwaVM5SHdLeThuci9pOVBiSG5sY0hr?=
 =?utf-8?B?ZUJtb2x6bkIvYjR3eS9kSWhFazhGM2ZZVWNnekd2eGNOWHdKeUFRUHlOaEo5?=
 =?utf-8?B?eVV3KzVrTVV0eUhXVHFYTXRoMXd2QXRWbUNEcXlxbFczNU1wZk8zb2ZkY25N?=
 =?utf-8?B?bExhL1RvMTNzQWRwMmpzS3l4TmlmazhjdG53emVNUVl5RlFyT2U5aDJaOG1x?=
 =?utf-8?B?RUJLd2tUaFJzSFJoSlo2UHJqbWxmenFIUWRtZGRUenhZcVhQc0Fsejk5OHJq?=
 =?utf-8?B?WGQ2SDJGMEwzaW83dXdYamg4THFHUEJXOWFpYzRPRk51anY3RnJ5WUdYMll4?=
 =?utf-8?B?aFBaY3gwSldHTTF4eTR5MjZINUhkS2cyRzQ5TUJMUXZUSjhxYld4RVlyNXpF?=
 =?utf-8?B?MnB5ay9tREhmbkRQSmhkZEJaQlEyYWQ2OHlQdXJBTnJlVnFEWUdyS0lCRkJi?=
 =?utf-8?B?blpieDY1MDhxS1hOLzA2RFcycmVrY2h4cTc5UUlDVHVjenVST0lZZjB0eTBj?=
 =?utf-8?B?MGNFL3ZwWGgvbkRzc3N6M0xhQnhkZ0xuWGNsS1pFYmxDT1JMTENrVTNtU1pX?=
 =?utf-8?B?aWYvalJlTzVsMFZ1Ukl0NFd5L3M5SnN4RDRWOVE1OEx2S2ttZmoxWjhhanFV?=
 =?utf-8?B?YlRWVWY0TW8rZjJmOXZpRDJ5V0R5ZE1LbmJJdUFqanRpc3NWM2JSYWpGSGI5?=
 =?utf-8?B?dnpiVHdxL0d3MFdOdFBSRTFxK0s2emVPdlQ5SGl5S1MrN2tzM0x2RmdnTHNt?=
 =?utf-8?B?U0JFZ1RxV20yNWdKZWVPZ2Q1U0FmckhQdnI4WmVMdkpPTzhGa3Q4S1pFNGpY?=
 =?utf-8?B?MEVEbnBmWDMxd1VOcnk5T0RIUm1kemVIck9tWCtmeDRReXZ6QWQ2dmtrMXd4?=
 =?utf-8?B?cUlzWlNDZU9ibnVxZzlmUDF4QTNYSVQrUVVDeFNFZi9ZTmV3YkhlNjBrWnp6?=
 =?utf-8?B?WUlldm9mMHNuZGs2RVFPT0E0TlB0WDJoWnllSUVmSDRycGIwTkZkUi9icUVT?=
 =?utf-8?B?TitFVVBodXZFZjdWRHhTTHJLQXhFRWRqZXk0ZS9oQlc3a01EakVNL0EwOGE3?=
 =?utf-8?B?Sy9QaC85ZEE3eGlGWW9iVTFWSUY2cHMrSDNvNEFDZTRFd3M2RFEzbHU1UlV2?=
 =?utf-8?B?VkJBeEFwQjZnYmdhV1cwbmVvQlRPWWtkc0JLVExMS21vVGxUVUpEclVzU20v?=
 =?utf-8?B?NXEyUmZkeVhVWVI4WnBybUE2STVjTXJIR1NLU2RVeWpEd3d6VWxDaXFKRENs?=
 =?utf-8?B?N2wwRXFJLzFuT3BObUdXWXdGcWhTTEFyWmwwQnRCMXIrQUtRQ2FGb2dSVmJ1?=
 =?utf-8?B?NHpQM2s5RXZnb3FxZEw2WitvZGNyQnkxMmZzenQrc3QzNDBVbGZhRzV5NDQ1?=
 =?utf-8?B?MFNGUnJOT3puK2lTd2JZTVNDN213NC9PS1FXcDhNM3p1NE4zSG9KNS9rTVJj?=
 =?utf-8?B?V0xIdm1YRHJLdWVZZ0laQlovS0FGOHJXanBjS21mZkovekJWQW44MzcwQWIx?=
 =?utf-8?B?RkU0L3FWL0pOMEZBVlNzMFZHQnY1dVkrbVh5UFFNWTQ3bFJlYVV6T0cvM1dN?=
 =?utf-8?B?R2F1d1pIbnZBcnZhTlN5dXQxS1lxTkhHSGZENlB1ajVwQkJ5endRNFMzUkJz?=
 =?utf-8?B?Q09ibVV3WG1EUzVndnovNFpXWGUxQkVXSlhFenNyVnRaa2NnczFwcHh0V0Vq?=
 =?utf-8?B?eG13T1R4YXhiRGkxMGkrQmJHUEJRZmJjYmNueDFQbSt4STV1RDdpUXZVbno5?=
 =?utf-8?B?b05JVTkxYXVmSzdjaWFhak5FbGxlVFlwVTV3MS9pWE4yT0R6aUxsZ2E0K3hq?=
 =?utf-8?B?VlpJZzRWamxuUXAwcjhUazBhbEY0emMyNnRRT0JYMDhNb0tJbWdQZlA4akVK?=
 =?utf-8?B?RlgxVjRrNlQ5RFpCUDJVenltMzZlNjN2YlFGNzVRK3pLbXNrWnRmSlF6WWFK?=
 =?utf-8?B?eWVNZWxMRjRXY3FXdEh1R2k0eG1JTENjRWsxT3MyWEpaUXYxVDRVUml2Umx6?=
 =?utf-8?Q?RWtZ6UFE2YCIxPq4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11760ffd-541e-4a79-666e-08da29faebaa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 16:11:30.0284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqinjmRj/OexvRkjXNKhl5SfrWuVfwS6NMIdBrIeRjAYb5GHNsfrUgWufsJy5LdLp2gtTUz4HeEhMH5SUpV4Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6229

On Fri, Apr 29, 2022 at 05:49:42PM +0200, Roger Pau Monné wrote:
> On Fri, Apr 29, 2022 at 12:59:58PM +0200, Jan Beulich wrote:
> > On 27.04.2022 12:47, Roger Pau Monne wrote:> Changes since v3:>  - Align ssbd per-core struct to a cache line.>  - Open code a simple spinlock to avoid playing tricks with the lock>    detector.>  - s/ssbd_core/ssbd_ls_cfg/.>  - Fix log message wording.>  - Fix define name and remove comment.>  - Also handle Hygon processors (Fam18h).>  - Add changelog entry.
> > What is this last line about?
> 
> Hm, seems like I forgot to do a patch refresh... So new version will
> have an entry about adding VIRT_SSBD support to HVM guests. Sorry for
> spoiling the surprise.
> 
> > > +bool __init amd_setup_legacy_ssbd(void)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
> > > +	    boot_cpu_data.x86_num_siblings <= 1)
> > > +		return true;
> > > +
> > > +	/*
> > > +	 * One could be forgiven for thinking that c->x86_max_cores is the
> > > +	 * correct value to use here.
> > > +	 *
> > > +	 * However, that value is derived from the current configuration, and
> > > +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
> > > +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
> > > +	 */
> > > +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> > > +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> > > +		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
> > > +	}
> > > +	if (!ssbd_max_cores)
> > > +		return false;
> > > +
> > > +	ssbd_ls_cfg = xzalloc_array(struct ssbd_ls_cfg,
> > > +	                            ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS);
> > > +	if (!ssbd_ls_cfg)
> > > +		return false;
> > > +
> > > +	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
> > > +		/* Record initial state, also applies to any hotplug CPU. */
> > > +		if (opt_ssbd)
> > > +			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
> > 
> > Perhaps flip if() and for()?
> 
> Indeed, thanks.
> 
> > > +void amd_set_legacy_ssbd(bool enable)
> > > +{
> > > +	const struct cpuinfo_x86 *c = &current_cpu_data;
> > > +	struct ssbd_ls_cfg *status;
> > > +
> > > +	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
> > > +		BUG_ON(!set_legacy_ssbd(c, enable));
> > > +		return;
> > > +	}
> > > +
> > > +	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
> > > +	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
> > > +	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
> > > +	                      c->cpu_core_id];
> > > +
> > > +	/*
> > > +	 * Open code a very simple spinlock: this function is used with GIF==0
> > > +	 * and different IF values, so would trigger the checklock detector.
> > > +	 * Instead of trying to workaround the detector, use a very simple lock
> > > +	 * implementation: it's better to reduce the amount of code executed
> > > +	 * with GIF==0.
> > > +	 */
> > > +	while ( test_and_set_bool(status->locked) )
> > > +	    cpu_relax();
> > > +	status->count += enable ? 1 : -1;
> > > +	ASSERT(status->count <= c->x86_num_siblings);
> > > +	if (enable ? status->count == 1 : !status->count)
> > > +		BUG_ON(!set_legacy_ssbd(c, enable));
> > 
> > What are the effects of ASSERT() or BUG_ON() triggering in a GIF=0
> > region?
> 
> So AFAICT the BUG itself works, the usage of a crash kernel however
> won't work as it's booted with GIF==0.
> 
> Maybe we need to issue an stgi as part of BUG_FRAME if required?
> (maybe that's too naive...)

Well, better in panic() or kexec_crash() likely.

Roger.


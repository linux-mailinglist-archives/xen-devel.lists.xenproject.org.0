Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9DC7223AD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543650.848803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67be-0006US-3p; Mon, 05 Jun 2023 10:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543650.848803; Mon, 05 Jun 2023 10:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67bd-0006SF-Vz; Mon, 05 Jun 2023 10:38:33 +0000
Received: by outflank-mailman (input) for mailman id 543650;
 Mon, 05 Jun 2023 10:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryrp=BZ=citrix.com=prvs=5133587e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q67bc-0006Q9-Vu
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:38:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c38c1f0-038d-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 12:38:31 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 06:38:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB5969.namprd03.prod.outlook.com (2603:10b6:610:e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 10:38:22 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Mon, 5 Jun 2023
 10:38:21 +0000
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
X-Inumbo-ID: 1c38c1f0-038d-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685961511;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=zBS/pW9sdLdnZCkqYcKyEc4GNp0f3rgZ4SyunGGeGus=;
  b=f9Dpn0O7r9sSLAjChZzDzOpqANHvz2Cf47LGZzjdKWitpNtRBmAi50T4
   bUtJDUNunU6yY/o3DgY9YCiG36HyhMvDjNA5xlDdCu34XWvsInKEMvopH
   cSGzED/CitLhU9Gl1gE4C6zBa4B6CpK9ZNEJs1UcMrctHnE+siy8MxBvM
   o=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 111623404
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M+Xpcq+ljx7KXn7stekdDrUDpH+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2QWWmCDPKmNNGr2eNt+aYvg9kJX6sTVzdYwG1doryk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6gX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklQ9
 9AEODAKXyq6nrnu0PGlRsd9oOoaeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpitABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWxH2hA95KSNVU8NZshmyazE8NWCFOenqW+MWZuGCiZelQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpd9gOpMIwAzsw2
 TehndzzAid0mKaIUn/b/bCRxQ5eIgAQJG4GICobFw0M5oC7pJlp10qVCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:mhYeJ62+97oFKdyUfRI21AqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:d14pSm09BVOxwYJM4nHgtbxfBMIJbm3dy0bqGlbjUXYqVrG7WHm+wfYx
X-Talos-MUID: 9a23:p3mfSwkEadErPSWZqRDvdnpkMvZh6YewWHxVvrQr4vWkBwJsBQyS2WE=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="111623404"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5sHoQkDM2IzmkcY3eVF84MlU8BiwbJX0do7gdHONGgEM3eTG8AdnVtmbi7Rxb47sdEZsU6r0/SrrtCmGJfuAFZ6i4MrDIS/2EnFNgOEYMWWZ/eLQmhJUi0i4PZNGZKESt/he3U6dRNUfQjWEHPkYWHuHS0no3ZqeJmbf9chlh8MTxalACFzr32OgMe6T2OqDup37N3ZCTYAypDzIUxf4A18xulg/z0i6lm3lk0ueI/sUjGFffQ3BTtN8KEHseyTeey7r2qksgnUWqxKW9++SOJ/ZZo0sWGTrml26qFv8aoIsJyddA/+DPS7VbGpAMEYkKTMmQnQk3sFz9PT+drIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0A6/MlXea4oVIiw2TcuL+a4qhAfgQOqJqAG1U0n19o=;
 b=epQD8xpkKlvrt8NkdBl6QE4P7wWIchREqhv31dmng8CWsxwqu4bUsBpup5n+GdCVDbN9m/AyeECOFWgqC0t4ExFlK/WxMYuqTrMRCTDmVJNAtxt3c6q/2XrWzc5sN3KmoohxKFZZ7Opn7NMi/Nebv7D2ABy9Cvngvz55F2TT1+rD0toqKuC2UFDehLhFOhUp9O+PY1+/CVYAW59DofgO7ezATg4VM1QzYqWH/TZBnUc4FGrlvF6Ng+BZFeBQbCLr908GwNipS9fO4zX/spibRCjaTkELgQiyUsIBtWe2yC3OE0kW1q/aPiQyb448FHyKtU0foBMqTW2MocC+AUByZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0A6/MlXea4oVIiw2TcuL+a4qhAfgQOqJqAG1U0n19o=;
 b=oQONEX+navE2F+9GZ5GanYSTxTGCJm/GZkpwbo7CEq78hNfypks0Uqn7Bt+rr6n1hxIPuU6/UZQSyQc88SUlEFnTA2OipWNEdrHOZHIXrgJfdh6Q4pR1hxJJqXIHRNf/obzKrlJaPSMl4tWXD2EHfq6h3fTnHjq69WTdvke0Rkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libs/light: use the cpuid feature names from cpufeatureset.h
Date: Mon,  5 Jun 2023 12:36:57 +0200
Message-Id: <20230605103657.14191-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0100.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: a16970a6-3738-4317-8df3-08db65b0fba8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f3PjJBE4cbxB3o+lBgHi3L9gC8cIvdNGiE6hunv9aD8rhUssIaGwJ6TC31DatGWAwvcF0QuatB+4aX175oOP9N26BOvg+zQJN6MnTunVG3WWFxMxW1UPXYTEb4biNnwLkKSDZmf+tP70/35trZHoMr5rtpNtai5vkwzH1tJqBUXOnljmPVdTNPTvOVTtOAbjuLtXZc5Izttn6/reHWGM65RJBB4ifjIB94vcqThH4R2DqMWCADSxb6Q22GW/m+Zb6nxKdpJKj2lIZhG4XQLh/wn2H7TQK2/dFxE6sfbBsOkhhRi/fMWBsTdyVdZX6jM16LBj7riEWX4fxIjHrvCNanc+3RdK1FJLn+R5kzBa9lNRWDj4JnMmDumgGsY8fCVtS2yGGSGodX1sxKF8OUBkvsOJdtU+wQ9CDnTs/qvvvGZdyNThCaoknK5YQKu7c2/dI9zPKiEOYiflyhZ0UNLO7HRowu+2CmWThoBy+IoloXCr+VHRNKt5fJ2LhwMCEMzsMqOpKBdjlQon4DGJMXu+6AgidQZpnDr6Ni9s/gcmfg4/YfZXq5WTgM74pYNEjg980kgJoKXCKKIL4msaDp+YuFqYEj7EZe+ntYnUTVpri3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(478600001)(30864003)(2906002)(36756003)(6486002)(6666004)(2616005)(66574015)(83380400001)(186003)(6512007)(6506007)(1076003)(26005)(86362001)(82960400001)(38100700002)(316002)(8676002)(8936002)(66946007)(6916009)(4326008)(66556008)(66476007)(5660300002)(54906003)(41300700001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVJTamNXdkd1YzhvQVFEaVdqZUNFanRPMHRJNlFHa2VPY3hNZDBuRHRtY0Yv?=
 =?utf-8?B?Wkw1dWhaOHZMVkhHN1doTTBUT2Y2QldqRWtIcUY5VTRCSUkxdXVsdy9YNnJ5?=
 =?utf-8?B?RnZOaCtRTmhqWnoyM0FyUUFYOGgxQm03aDQwb1NXWUIrRThyYzc2dE1KQ2hm?=
 =?utf-8?B?Wk9LeDZHc0o5Mks3Q1pINlZvM1liY3R1WUdCSGhQRDFqS1BJQUVSaXZUSy9T?=
 =?utf-8?B?MDFkV3Z1MWtJK1JOT3JicW5BOTMvNkRVcnFDbVJvczRxaDlpSG9tZWt3VW84?=
 =?utf-8?B?ZGpTMnQ0THdxRjlDVjdoM2hzK3UzVmJUQTBIR1dIYVRTU1hJM3VveDM1YWVs?=
 =?utf-8?B?UklWSFpmNzcrRGMxMk0xa3ZzMktPU0dXR1ZiUC9ZL0g4YXpHYUJHaXFNYks3?=
 =?utf-8?B?TWRXM2plbi8wVXE4TVozS0tRdWh5TTlxcDhHb0RZT2FGaU94MFhobmgrUzF0?=
 =?utf-8?B?cmVJaldqTXgreXk4bGk1Zk1wUm5NR2VQWHpvN3Y3SndhV0lVbHk2SlJGWXZG?=
 =?utf-8?B?NkZJc05Sak4wOWhpT3FFQzhqTkQrcU1NanB0UmZGQmpGcWMyWU5VVDF1endv?=
 =?utf-8?B?cit2Njd3bTNoV29Fdng0TmYvWEtrL0djcG9RUVh1dmk0QUcrTFFXRjloaTlB?=
 =?utf-8?B?ZHJzVTBKbFNDWFBlWlhYN2tCWUtXaEtucnFHWkhoMkFUQzRlVm43UnJyeXhW?=
 =?utf-8?B?WERncWZnNXoxZE5OME5GOUR3T3lwYWhZM2trelJnU2ZWb2k5dTNvbnQralR3?=
 =?utf-8?B?NzllQU1iTkQxeEI5TXZyZWFTNVZ5bkVXeEtHR1JtUGc2MFpUUkxkN01xcisw?=
 =?utf-8?B?YldRUHdaVnVVcFBNb20wSlpqbFhldGg1R2tpU0xNS0VNdEZWZFlNdUNYN0M2?=
 =?utf-8?B?ZlJrK2NIdlFIRlZIRGpiR0Zvc3FLVHpoNFZJMjVMT2VxRzY2Uy9FcFpMaU8x?=
 =?utf-8?B?SEQrenNxSmVTZ2ZxZ2FxR3FSZ1NLWWRxa0FKYk1kM3FVOCs1RnJaQkhtZGk3?=
 =?utf-8?B?akpXMGw5WnRuenc3YnJjcXRuYzZrWU5QWlF2SGx1OHVhb1paV080TGg0WFl1?=
 =?utf-8?B?bWZ4YzREOWhaRU9zdE0vUkt4ODBMN21yNHBBNXRzbldnMHJwZzFILytod2ll?=
 =?utf-8?B?Y1QrSm4zTlZOejBoZXVzVHEwbWtXNnpqOE5jRHlOczhzWUg1ZVJDYWJGUmF2?=
 =?utf-8?B?cnN5djZVWnViYlRIOFFkWWN4NEJKRHQxTFh0eEFYWU1ZRFZ1NXpkcnBXOVZH?=
 =?utf-8?B?OThmbVNWc3ppcW1QSE9EcmNyakpZNlc4Y2FrV0ZUN3ZOUGpseURYYjcrSmk0?=
 =?utf-8?B?TGFYRXUwTFh5ZGl4Y2NNbTVvckIvZjhQbG1QRm9Ra1B1dWJtOStiTGZNajJh?=
 =?utf-8?B?Z3UrdkxPS3RRakRhWnFiOG5DcUx4dklvN0dab0tzcVppY2RuOVBhdXFSVFNZ?=
 =?utf-8?B?NERuRmRUbUJLM3FBS3lBTEZOcGxFUkRQSWZBWUhWcVdja0dUN3FyNXhwT29M?=
 =?utf-8?B?dHhrUXFpRUs0aTVzY003aEFsQjBhMWpES3FpdERYTE0veEhMTXRjTitYVmFG?=
 =?utf-8?B?QjNCbmNERi85SG9QYk9oK2l2aW5jVmRKRUF2TFgwV01BdmJPdFF2eDd3Q3Fq?=
 =?utf-8?B?MGNqa05TUGE1ZHlOYjE5bkVkTFJObUp1T1U1S1NEeTJPQWNpeGMyQnU0ZGd1?=
 =?utf-8?B?L1R5UVVuMlNFdE9xUHdnMU9CQm41TkowWk04SDRYWnM0TTBSZ3g4Tkd2S05B?=
 =?utf-8?B?ZkU0VlRZRjFMNXBSNEh2RmtkT2JKcStWd1FhWnV2R3k1U1o1WGFvbnFBalhY?=
 =?utf-8?B?T2RiU3kwZDdOell3dFlwT0REVCtCR3E4R25JdVQwOURTVDdyVmpIMHZCOVFn?=
 =?utf-8?B?dzlYZHNtMFhkek5EYU1PbGc2SUg2QTFCTnFrY3dySXhCY1N1TjF4MmlEamlh?=
 =?utf-8?B?YWZUWDVyRWRVZHhpamhjeEIyWGZZQWVHSWQ0UjlpdmU2R3J4UU0wODZndHB4?=
 =?utf-8?B?MXJ2eG9wZDlCSTlUa0hlQ200cExKMGg1aGc2TEYwVUxoZGhGL2xMYkVSRFlW?=
 =?utf-8?B?UW5oVjVWKzJvY0pnZ3ZWL0VPdjRRaG5GVlpiSjhmRVk4eXY3UGczU1ZObkFE?=
 =?utf-8?Q?67oeVLfUF7by+NTSLCgdG29p2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RkYryTtPHl7zyMx74pg49+ho58pckIvhw+h0D9pkJy8xWYel13HXeV2VwPRZAZsOk5pxb7IccscKeyb+bc3m2gDlHCeXMcV8iK5dy9RcbrZWbu3ZjQlzwd65X72GffpQ0HDXi3yjw/xjfGON/mIKNGH0u1b5l/jKzMO7aoke1OQKpzIK03S5NHyk72oo3wKUtHNZ6f3yCR7GcIsy3NMKKXTLuDy5rR82KrsheTZ2Egzd95fiopvQ2PIOGexemTEeKmAVLvxIJrHFiZPyn0nCJGpZwIfJHqZNdahMOok8zFR41l3cJpogxhq5izVgHkq3JMqYxjMCkiFR6+vYDXHgMxaKUOWHSBwqxsvxvxIAi4te9ieLPILedWZ9oFWmEaOIAYZocAzslVTkNuVVA3KmibTKpD7pEE9Qnx/dfFY4FrB/1dj1xZ/Bfk5HZQrbQrfVAk4s8aiQRTmalsdL0rgEhhdiIc6NpXUIhqJCotiNsuYYXOBtWIg0eIKtmZQnHk39nDgmSZQpBxqPtt2u9sSy9mX1Othljxjs4okH1lhwrR71040nM3V8HWANEjGX140JTDS/T5YkK7DdtKV637A9+pDl4qLzQFu2RF9DOiVnPjjhK8YVFalgSw6IQvN84Os9DJYAfyUbAE79+jx2L7MOw91FbG/6Nw0lI0/FPkWxGT31d9PeMhY41kPjLYZUOWdSp9/PCV8tsd14oHvgooA/emU4nhpgSkAkp3sLiEUxxjsBJkopD9R91o40qIZtmHZl2W3W1lFMBje0pkIg4bldvFgBILOpI/PiZk7rkYyTRxSBarJchrjAb4ugcvl9rjaD
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16970a6-3738-4317-8df3-08db65b0fba8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 10:38:21.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7sKF9XyZ3piJhNnh6MLyZRUzNUVmCTzoCCZOG8ea4MgRDhmsK/U0E6q5F/pujPbGmgtL9doAasOdrCn5G7CrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5969

The current implementation in libxl_cpuid_parse_config() requires
keeping a list of cpuid feature bits that should be mostly in sync
with the contents of cpufeatureset.h.

Avoid such duplication by using the automatically generated list of
cpuid features in INIT_FEATURE_NAMES in order to map feature names to
featureset bits, and then translate from featureset bits into cpuid
leaf, subleaf, register tuple.

Note that the full contents of the previous cpuid translation table
can't be removed.  That's because some feature names allowed by libxl
are not described in the featuresets, or because naming has diverged
and the previous nomenclature is preserved for compatibility reasons.

Should result in no functional change observed by callers, albeit some
new cpuid features will be available as a result of the change.

While there constify cpuid_flags name field.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's currently no table to map from featureset word into cpuid
leaf, so open-code one (feature_to_cpuid).  Otherwise we would need to
parse the comments in cpufeatureset.h in order to obtain the
leaf/subleaf/register each word maps into.

One possible way of improving would be to use a cpu_policy and
featureset in libxl_cpuid_parse_config(), but that requires adding an
xc_cpu_policy_t object to libxl_domain_build_info, and the proposed
patch is already an improvement over the current status.
---
 docs/man/xl.cfg.5.pod.in       |  22 +--
 tools/libs/light/libxl_cpuid.c | 246 ++++++++++-----------------------
 tools/xl/xl_parse.c            |   3 +
 3 files changed, 78 insertions(+), 193 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 24ac92718288..c5c5b8716521 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2010,24 +2010,12 @@ proccount procpkg stepping
 
 =back
 
-List of keys taking a character:
+List of keys taking a character can be found in the public header file
+L<arch-x86/cpufeatureset.h|http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,arch-x86,cpufeatureset.h.html>
 
-=over 4
-
-3dnow 3dnowext 3dnowprefetch abm acpi adx aes altmovcr8 apic arat avx avx2
-avx512-4fmaps avx512-4vnniw avx512bw avx512cd avx512dq avx512er avx512f
-avx512ifma avx512pf avx512vbmi avx512vl bmi1 bmi2 clflushopt clfsh clwb cmov
-cmplegacy cmpxchg16 cmpxchg8 cmt cntxid dca de ds dscpl dtes64 erms est extapic
-f16c ffxsr fma fma4 fpu fsgsbase fxsr hle htt hypervisor ia64 ibs invpcid
-invtsc lahfsahf lm lwp mca mce misalignsse mmx mmxext monitor movbe mpx msr
-mtrr nodeid nx ospke osvw osxsave pae page1gb pat pbe pcid pclmulqdq pdcm
-perfctr_core perfctr_nb pge pku popcnt pse pse36 psn rdrand rdseed rdtscp rtm
-sha skinit smap smep smx ss sse sse2 sse3 sse4.1 sse4.2 sse4_1 sse4_2 sse4a
-ssse3 svm svm_decode svm_lbrv svm_npt svm_nrips svm_pausefilt svm_tscrate
-svm_vmcbclean syscall sysenter tbm tm tm2 topoext tsc tsc-deadline tsc_adjust
-umip vme vmx wdt x2apic xop xsave xtpr
-
-=back
+Note that C<clflush> is described as an option that takes a value, and that
+takes precedence over the C<clflush> flag in C<cpufeatureset.h>.  The feature
+flag must be referenced as C<clfsh>.
 
 =back
 
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f5ce9f97959c..0c7ffff416fe 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -14,6 +14,8 @@
 
 #include "libxl_internal.h"
 
+#include <xen/lib/x86/cpu-policy.h>
+
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
     return !libxl_cpuid_policy_list_length(pl);
@@ -51,7 +53,7 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
  * Used for the static structure describing all features.
  */
 struct cpuid_flags {
-    char* name;
+    const char* name;
     uint32_t leaf;
     uint32_t subleaf;
     int reg;
@@ -81,6 +83,14 @@ static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
     return *list + i;
 }
 
+static int search_feature(const void *a, const void *b)
+{
+    const char *key = a;
+    const char *feat = ((struct { const char *n; } *)b)->n;
+
+    return strncmp(key, feat, strlen(key)) ?: strlen(key) - strlen(feat);
+}
+
 /* parse a single key=value pair and translate it into the libxc
  * used interface using 32-characters strings for each register.
  * Will overwrite earlier entries and thus can be called multiple
@@ -101,208 +111,37 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"proccount",    0x00000001, NA, CPUID_REG_EBX, 16,  8},
         {"localapicid",  0x00000001, NA, CPUID_REG_EBX, 24,  8},
 
-        {"sse3",         0x00000001, NA, CPUID_REG_ECX,  0,  1},
-        {"pclmulqdq",    0x00000001, NA, CPUID_REG_ECX,  1,  1},
-        {"dtes64",       0x00000001, NA, CPUID_REG_ECX,  2,  1},
-        {"monitor",      0x00000001, NA, CPUID_REG_ECX,  3,  1},
-        {"dscpl",        0x00000001, NA, CPUID_REG_ECX,  4,  1},
-        {"vmx",          0x00000001, NA, CPUID_REG_ECX,  5,  1},
-        {"smx",          0x00000001, NA, CPUID_REG_ECX,  6,  1},
         {"est",          0x00000001, NA, CPUID_REG_ECX,  7,  1},
-        {"tm2",          0x00000001, NA, CPUID_REG_ECX,  8,  1},
-        {"ssse3",        0x00000001, NA, CPUID_REG_ECX,  9,  1},
         {"cntxid",       0x00000001, NA, CPUID_REG_ECX, 10,  1},
-        {"fma",          0x00000001, NA, CPUID_REG_ECX, 12,  1},
         {"cmpxchg16",    0x00000001, NA, CPUID_REG_ECX, 13,  1},
-        {"xtpr",         0x00000001, NA, CPUID_REG_ECX, 14,  1},
-        {"pdcm",         0x00000001, NA, CPUID_REG_ECX, 15,  1},
-        {"pcid",         0x00000001, NA, CPUID_REG_ECX, 17,  1},
-        {"dca",          0x00000001, NA, CPUID_REG_ECX, 18,  1},
         /* Linux uses sse4_{1,2}.  Keep sse4.{1,2} for compatibility */
-        {"sse4_1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
         {"sse4.1",       0x00000001, NA, CPUID_REG_ECX, 19,  1},
-        {"sse4_2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
         {"sse4.2",       0x00000001, NA, CPUID_REG_ECX, 20,  1},
-        {"x2apic",       0x00000001, NA, CPUID_REG_ECX, 21,  1},
-        {"movbe",        0x00000001, NA, CPUID_REG_ECX, 22,  1},
-        {"popcnt",       0x00000001, NA, CPUID_REG_ECX, 23,  1},
-        {"tsc-deadline", 0x00000001, NA, CPUID_REG_ECX, 24,  1},
         {"aes",          0x00000001, NA, CPUID_REG_ECX, 25,  1},
-        {"xsave",        0x00000001, NA, CPUID_REG_ECX, 26,  1},
-        {"osxsave",      0x00000001, NA, CPUID_REG_ECX, 27,  1},
-        {"avx",          0x00000001, NA, CPUID_REG_ECX, 28,  1},
-        {"f16c",         0x00000001, NA, CPUID_REG_ECX, 29,  1},
-        {"rdrand",       0x00000001, NA, CPUID_REG_ECX, 30,  1},
-        {"hypervisor",   0x00000001, NA, CPUID_REG_ECX, 31,  1},
-
-        {"fpu",          0x00000001, NA, CPUID_REG_EDX,  0,  1},
-        {"vme",          0x00000001, NA, CPUID_REG_EDX,  1,  1},
-        {"de",           0x00000001, NA, CPUID_REG_EDX,  2,  1},
-        {"pse",          0x00000001, NA, CPUID_REG_EDX,  3,  1},
-        {"tsc",          0x00000001, NA, CPUID_REG_EDX,  4,  1},
-        {"msr",          0x00000001, NA, CPUID_REG_EDX,  5,  1},
-        {"pae",          0x00000001, NA, CPUID_REG_EDX,  6,  1},
-        {"mce",          0x00000001, NA, CPUID_REG_EDX,  7,  1},
+
         {"cmpxchg8",     0x00000001, NA, CPUID_REG_EDX,  8,  1},
-        {"apic",         0x00000001, NA, CPUID_REG_EDX,  9,  1},
         {"sysenter",     0x00000001, NA, CPUID_REG_EDX, 11,  1},
-        {"mtrr",         0x00000001, NA, CPUID_REG_EDX, 12,  1},
-        {"pge",          0x00000001, NA, CPUID_REG_EDX, 13,  1},
-        {"mca",          0x00000001, NA, CPUID_REG_EDX, 14,  1},
-        {"cmov",         0x00000001, NA, CPUID_REG_EDX, 15,  1},
-        {"pat",          0x00000001, NA, CPUID_REG_EDX, 16,  1},
-        {"pse36",        0x00000001, NA, CPUID_REG_EDX, 17,  1},
         {"psn",          0x00000001, NA, CPUID_REG_EDX, 18,  1},
         {"clfsh",        0x00000001, NA, CPUID_REG_EDX, 19,  1},
-        {"ds",           0x00000001, NA, CPUID_REG_EDX, 21,  1},
-        {"acpi",         0x00000001, NA, CPUID_REG_EDX, 22,  1},
-        {"mmx",          0x00000001, NA, CPUID_REG_EDX, 23,  1},
-        {"fxsr",         0x00000001, NA, CPUID_REG_EDX, 24,  1},
-        {"sse",          0x00000001, NA, CPUID_REG_EDX, 25,  1},
-        {"sse2",         0x00000001, NA, CPUID_REG_EDX, 26,  1},
-        {"ss",           0x00000001, NA, CPUID_REG_EDX, 27,  1},
-        {"htt",          0x00000001, NA, CPUID_REG_EDX, 28,  1},
         {"tm",           0x00000001, NA, CPUID_REG_EDX, 29,  1},
         {"ia64",         0x00000001, NA, CPUID_REG_EDX, 30,  1},
         {"pbe",          0x00000001, NA, CPUID_REG_EDX, 31,  1},
 
         {"arat",         0x00000006, NA, CPUID_REG_EAX,  2,  1},
 
-        {"fsgsbase",     0x00000007,  0, CPUID_REG_EBX,  0,  1},
-        {"tsc_adjust",   0x00000007,  0, CPUID_REG_EBX,  1,  1},
-        {"bmi1",         0x00000007,  0, CPUID_REG_EBX,  3,  1},
-        {"hle",          0x00000007,  0, CPUID_REG_EBX,  4,  1},
-        {"avx2",         0x00000007,  0, CPUID_REG_EBX,  5,  1},
-        {"smep",         0x00000007,  0, CPUID_REG_EBX,  7,  1},
-        {"bmi2",         0x00000007,  0, CPUID_REG_EBX,  8,  1},
-        {"erms",         0x00000007,  0, CPUID_REG_EBX,  9,  1},
-        {"invpcid",      0x00000007,  0, CPUID_REG_EBX, 10,  1},
-        {"rtm",          0x00000007,  0, CPUID_REG_EBX, 11,  1},
-        {"cmt",          0x00000007,  0, CPUID_REG_EBX, 12,  1},
-        {"mpx",          0x00000007,  0, CPUID_REG_EBX, 14,  1},
-        {"avx512f",      0x00000007,  0, CPUID_REG_EBX, 16,  1},
-        {"avx512dq",     0x00000007,  0, CPUID_REG_EBX, 17,  1},
-        {"rdseed",       0x00000007,  0, CPUID_REG_EBX, 18,  1},
-        {"adx",          0x00000007,  0, CPUID_REG_EBX, 19,  1},
-        {"smap",         0x00000007,  0, CPUID_REG_EBX, 20,  1},
-        {"avx512-ifma",  0x00000007,  0, CPUID_REG_EBX, 21,  1},
-        {"clflushopt",   0x00000007,  0, CPUID_REG_EBX, 23,  1},
-        {"clwb",         0x00000007,  0, CPUID_REG_EBX, 24,  1},
-        {"proc-trace",   0x00000007,  0, CPUID_REG_EBX, 25,  1},
-        {"avx512pf",     0x00000007,  0, CPUID_REG_EBX, 26,  1},
-        {"avx512er",     0x00000007,  0, CPUID_REG_EBX, 27,  1},
-        {"avx512cd",     0x00000007,  0, CPUID_REG_EBX, 28,  1},
-        {"sha",          0x00000007,  0, CPUID_REG_EBX, 29,  1},
-        {"avx512bw",     0x00000007,  0, CPUID_REG_EBX, 30,  1},
-        {"avx512vl",     0x00000007,  0, CPUID_REG_EBX, 31,  1},
-
-        {"prefetchwt1",  0x00000007,  0, CPUID_REG_ECX,  0,  1},
-        {"avx512-vbmi",  0x00000007,  0, CPUID_REG_ECX,  1,  1},
-        {"umip",         0x00000007,  0, CPUID_REG_ECX,  2,  1},
-        {"pku",          0x00000007,  0, CPUID_REG_ECX,  3,  1},
-        {"ospke",        0x00000007,  0, CPUID_REG_ECX,  4,  1},
-        {"avx512-vbmi2", 0x00000007,  0, CPUID_REG_ECX,  6,  1},
-        {"cet-ss",       0x00000007,  0, CPUID_REG_ECX,  7,  1},
-        {"gfni",         0x00000007,  0, CPUID_REG_ECX,  8,  1},
-        {"vaes",         0x00000007,  0, CPUID_REG_ECX,  9,  1},
-        {"vpclmulqdq",   0x00000007,  0, CPUID_REG_ECX, 10,  1},
-        {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
-        {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
-        {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
-        {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
-        {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
-        {"pks",          0x00000007,  0, CPUID_REG_ECX, 31,  1},
-
-        {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
-        {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
-        {"fsrm",         0x00000007,  0, CPUID_REG_EDX,  4,  1},
-        {"avx512-vp2intersect",0x00000007,0,CPUID_REG_EDX,8, 1},
-        {"srbds-ctrl",   0x00000007,  0, CPUID_REG_EDX,  9,  1},
-        {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
-        {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
-        {"tsxldtrk",     0x00000007,  0, CPUID_REG_EDX, 16,  1},
-        {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
-        {"avx512-fp16",  0x00000007,  0, CPUID_REG_EDX, 23,  1},
-        {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
-        {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
-        {"l1d-flush",    0x00000007,  0, CPUID_REG_EDX, 28,  1},
-        {"arch-caps",    0x00000007,  0, CPUID_REG_EDX, 29,  1},
-        {"core-caps",    0x00000007,  0, CPUID_REG_EDX, 30,  1},
-        {"ssbd",         0x00000007,  0, CPUID_REG_EDX, 31,  1},
-
-        {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
-        {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
-        {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
-        {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
-        {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
-        {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
-        {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
-
-        {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
-        {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
-        {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
-
-        {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
-        {"ipred-ctrl",   0x00000007,  2, CPUID_REG_EDX,  1,  1},
-        {"rrsba-ctrl",   0x00000007,  2, CPUID_REG_EDX,  2,  1},
-        {"ddp-ctrl",     0x00000007,  2, CPUID_REG_EDX,  3,  1},
-        {"bhi-ctrl",     0x00000007,  2, CPUID_REG_EDX,  4,  1},
-        {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
-
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
-        {"svm",          0x80000001, NA, CPUID_REG_ECX,  2,  1},
-        {"extapic",      0x80000001, NA, CPUID_REG_ECX,  3,  1},
         {"altmovcr8",    0x80000001, NA, CPUID_REG_ECX,  4,  1},
-        {"abm",          0x80000001, NA, CPUID_REG_ECX,  5,  1},
-        {"sse4a",        0x80000001, NA, CPUID_REG_ECX,  6,  1},
-        {"misalignsse",  0x80000001, NA, CPUID_REG_ECX,  7,  1},
-        {"3dnowprefetch",0x80000001, NA, CPUID_REG_ECX,  8,  1},
-        {"osvw",         0x80000001, NA, CPUID_REG_ECX,  9,  1},
-        {"ibs",          0x80000001, NA, CPUID_REG_ECX, 10,  1},
-        {"xop",          0x80000001, NA, CPUID_REG_ECX, 11,  1},
-        {"skinit",       0x80000001, NA, CPUID_REG_ECX, 12,  1},
-        {"wdt",          0x80000001, NA, CPUID_REG_ECX, 13,  1},
-        {"lwp",          0x80000001, NA, CPUID_REG_ECX, 15,  1},
-        {"fma4",         0x80000001, NA, CPUID_REG_ECX, 16,  1},
         {"nodeid",       0x80000001, NA, CPUID_REG_ECX, 19,  1},
-        {"tbm",          0x80000001, NA, CPUID_REG_ECX, 21,  1},
-        {"topoext",      0x80000001, NA, CPUID_REG_ECX, 22,  1},
         {"perfctr_core", 0x80000001, NA, CPUID_REG_ECX, 23,  1},
         {"perfctr_nb",   0x80000001, NA, CPUID_REG_ECX, 24,  1},
 
-        {"syscall",      0x80000001, NA, CPUID_REG_EDX, 11,  1},
-        {"nx",           0x80000001, NA, CPUID_REG_EDX, 20,  1},
-        {"mmxext",       0x80000001, NA, CPUID_REG_EDX, 22,  1},
-        {"ffxsr",        0x80000001, NA, CPUID_REG_EDX, 25,  1},
-        {"page1gb",      0x80000001, NA, CPUID_REG_EDX, 26,  1},
-        {"rdtscp",       0x80000001, NA, CPUID_REG_EDX, 27,  1},
-        {"lm",           0x80000001, NA, CPUID_REG_EDX, 29,  1},
-        {"3dnowext",     0x80000001, NA, CPUID_REG_EDX, 30,  1},
-        {"3dnow",        0x80000001, NA, CPUID_REG_EDX, 31,  1},
-
         {"procpkg",      0x00000004,  0, CPUID_REG_EAX, 26,  6},
 
         {"invtsc",       0x80000007, NA, CPUID_REG_EDX,  8,  1},
 
-        {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
-        {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
-        {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
-        {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
-        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
-        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
-        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
-        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
-        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
-        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
-        {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
-        {"amd-ssbd",     0x80000008, NA, CPUID_REG_EBX, 24,  1},
-        {"virt-ssbd",    0x80000008, NA, CPUID_REG_EBX, 25,  1},
-        {"ssb-no",       0x80000008, NA, CPUID_REG_EBX, 26,  1},
-        {"psfd",         0x80000008, NA, CPUID_REG_EBX, 28,  1},
         {"btc-no",       0x80000008, NA, CPUID_REG_EBX, 29,  1},
-        {"ibpb-ret",     0x80000008, NA, CPUID_REG_EBX, 30,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
         {"apicidsize",   0x80000008, NA, CPUID_REG_ECX, 12,  4},
@@ -316,22 +155,55 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"svm_pausefilt",0x8000000a, NA, CPUID_REG_EDX, 10,  1},
 
         {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
-        {"nscb",         0x80000021, NA, CPUID_REG_EAX,  6,  1},
-        {"auto-ibrs",    0x80000021, NA, CPUID_REG_EAX,  8,  1},
-        {"cpuid-user-dis", 0x80000021, NA, CPUID_REG_EAX, 17, 1},
 
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
 
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
+    static const struct feature_name {
+        const char *name;
+        unsigned int bit;
+    } features[] = INIT_FEATURE_NAMES;
+    /*
+     * NB: if we switch to using a cpu_policy derived object instead of a
+     * libxl_cpuid_policy_list we could get rid of the featureset -> cpuid leaf
+     * conversion table and use a featureset directly as we have conversions
+     * to/from featureset and cpu_policy.
+     */
+    static const struct {
+        uint32_t leaf, subleaf;
+        unsigned int reg;
+    } feature_to_cpuid[] = {
+        {0x00000001, NA, CPUID_REG_EDX},
+        {0x00000001, NA, CPUID_REG_ECX},
+        {0x80000001, NA, CPUID_REG_EDX},
+        {0x80000001, NA, CPUID_REG_ECX},
+        {0x0000000D,  1, CPUID_REG_EAX},
+        {0x00000007,  0, CPUID_REG_EBX},
+        {0x00000007,  0, CPUID_REG_ECX},
+        {0x80000007, NA, CPUID_REG_EDX},
+        {0x80000008, NA, CPUID_REG_EBX},
+        {0x00000007,  0, CPUID_REG_EDX},
+        {0x00000007,  1, CPUID_REG_EAX},
+        {0x80000021, NA, CPUID_REG_EAX},
+        {0x00000007,  1, CPUID_REG_EBX},
+        {0x00000007,  2, CPUID_REG_EDX},
+        {0x00000007,  1, CPUID_REG_ECX},
+        {0x00000007,  1, CPUID_REG_EDX},
+        {        NA, NA, CPUID_REG_INV}, /* MSR_ARCH_CAPS.eax */
+        {        NA, NA, CPUID_REG_INV}, /* MSR_ARCH_CAPS.edx */
+    };
 #undef NA
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
+    struct cpuid_flags f;
     struct xc_xend_cpuid *entry;
     unsigned long num;
     char flags[33], *resstr;
 
+    BUILD_BUG_ON(ARRAY_SIZE(feature_to_cpuid) != FEATURESET_NR_ENTRIES);
+
     sep = strchr(str, '=');
     if (sep == NULL) {
         return 1;
@@ -342,6 +214,28 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
             break;
     }
+    if (flag->name == NULL) {
+        const struct feature_name *feat;
+        /* Provide a NUL terminated feature name to the search helper. */
+        char *name = strndup(str, sep - str);
+
+        if (name == NULL)
+            return 4;
+
+        feat = bsearch(name, features, ARRAY_SIZE(features), sizeof(features[0]),
+                       search_feature);
+        free(name);
+
+        if (feat != NULL) {
+                f.name = feat->name;
+                f.leaf = feature_to_cpuid[feat->bit / 32].leaf;
+                f.subleaf = feature_to_cpuid[feat->bit / 32].subleaf;
+                f.reg = feature_to_cpuid[feat->bit / 32].reg;
+                f.bit = feat->bit % 32;
+                f.length = 1,
+                flag = &f;
+        }
+    }
     if (flag->name == NULL) {
         return 2;
     }
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1f6f47daf4e1..80b189dea0c1 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2620,6 +2620,9 @@ skip_usbdev:
                 case 3:
                     errstr = "illegal CPUID value (must be: [0|1|x|k|s])";
                     break;
+                case 4:
+                    errstr = "out of memory";
+                    break;
                 default:
                     errstr = "unknown error";
                     break;
-- 
2.40.0



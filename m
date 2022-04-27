Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58220511C0A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315207.533643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjw7-0007uQ-Mv; Wed, 27 Apr 2022 15:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315207.533643; Wed, 27 Apr 2022 15:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjw7-0007s6-Iz; Wed, 27 Apr 2022 15:50:39 +0000
Received: by outflank-mailman (input) for mailman id 315207;
 Wed, 27 Apr 2022 15:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njjw6-0007rz-HA
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:50:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6e094f7-c641-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 17:50:36 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 11:50:34 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO6PR03MB6306.namprd03.prod.outlook.com (2603:10b6:5:35f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 15:50:33 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 15:50:33 +0000
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
X-Inumbo-ID: c6e094f7-c641-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651074636;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=t2jJHmpPnn/fy8zsKnvrO6EytiJHwVLm7Gh0v9RApAk=;
  b=AuR4dzXkfJzI8c0wTyZHwVL73INbjaAhfc+EEWpxu1pkfjoP8LfbpI59
   5+ynsCyxI4QjtxumpJJ5WtPXCExnw4H+cFqGpjdD+Qz+naRJbjaIjsA3X
   50CDmgerrpTGhGv6h1gfM8UovAAGnuTxdpt/fVbWDxYCs0coRcWotkmYM
   E=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 70462325
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JLJXp6OC9XviEmrvrR25lsFynXyQoLVcMsEvi/4bfWQNrUon0D0Cm
 DcdDD+Da67eZTT3e4x3Oovj/E4F75CDytA1GQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 tBWv525ciAVNIb1gMcHUEh4KBMlBPgTkFPHCSDXXc276WTjKiKp6NI3SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7H9aaHPiiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iWhKWYC9Tp5o4ITuEzo71V17oHNbvCIaOOAasUIlRaX8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3E62StjwWTWorXjCuQQTM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OcpQRQ62
 1nPmMnmbQGDq5WQQHOZs7yT9DW7PHFMKXdYPHBZCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZsjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:uY6XtqPnvxb0JcBcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ulfq
 WV9sjzuiWatN98Yh8dcJW7Scq9qBDnhPpICOsqXYtKNTOO0AeVxcNZnOnfKlXbcBEWndQtsJ
 uIHZIeNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70462325"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amehbEuHfr+NqzgIa72mFuW0/gAV0uqMD6BRDfF6xEbZrJQydCeuMzWf1Et3NoajH5CPpz9YjW7zS3UzESWdU5gHD8ug4GlpbwAubLV3AzVJxhrw4k9Gleo0vI3N6kCchp4cRkirBKyg+AlClAUm74cUNvfFIXtEf69cigjigMqNh6x0moOMGlgR002QvByC+jdvyDa6gCebGjj58Gmt7H/7CSScFhSfkgjiqCLIWJmPe2RabclOU5Ln+AchizczIKEzWOG4HDg8x1SeHsiVua9JeCP8fzlE2ktNTBVotTabYKjeFKjT0s8VF4zxBhe158eVnT/ra+Ov25XwDPmz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v83QwxLu8ckEOBPEItK5bDOSrud7YU+ikNBd+lWDON4=;
 b=divKZ17nvMWuqxrgNblwgEHO9ufUdJg1BwIqyoVfmLknhxOBnesmb3osvxGbJBV79qcxru4btKs2JPcZc3MNo/9/UrEKFYuFYInwt5f8e60ARu4j0ulXI1q94Lka8Wpb2fWozTFR7SeMGRjjJFPq9G96ItZid4WZQM+WrT04zessGyU3ARrgErK0d4PNAEKi1EydNv3ZWgoBG71IrvLReFmFy0RjHGhuh9Fxg087BiKpq6nnKgU5Aweer3K0h8J6DHGolzfSwj1IceRWtWumXfdbxsIb/3U1hX8O85w/9bNuC0Wr+EYDm7jJTpkXKg/01wYRUPQo3SlZFz5GFtdGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v83QwxLu8ckEOBPEItK5bDOSrud7YU+ikNBd+lWDON4=;
 b=fPAB1xD3pixasvFFh/FVhkY3NVB3Y4B/zfwWonFxPvOS/x3plW6v+GIRh6SixktXS65SFkpvLcElKLfKDhKJ9AYYy7pcqzC8m/sb27DCp03Gxy7S7gCmRfeFv5LBWg3B41jzvo0d7Jv0+7oUbbmD6sAT5feH92oC4ti3tBlapiQ=
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
Subject: [PATCH] cirrus-ci: add FreeBSD 14 task
Date: Wed, 27 Apr 2022 17:50:23 +0200
Message-Id: <20220427155023.84403-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b90dfef2-add5-4e11-6f86-08da2865a9a2
X-MS-TrafficTypeDiagnostic: CO6PR03MB6306:EE_
X-Microsoft-Antispam-PRVS:
	<CO6PR03MB6306D5EB21109C12BF375DF08FFA9@CO6PR03MB6306.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wdzut5saBnrouL7oQlEXvNzenYW9FPtH+PT3KFT7/3La8QxiBmI2X2ATuCnE45LP7CnMhTBY3GvV/lqNB7LJzoT1RwLQrGptcUW0GRR5PhntpUPdtxFDH2AYZ6FmibJYivPqL0xELdugyXjTWTtuoUeEA6CIYMbnS5hQ9kblom+JCehh9kbUDblNoViX73kdFmUmrWFQUY5aP5wHwxo2D7jI/ibPWEIFkDozYQHN4qW4Th6sR/5VwrWAe4C9hJrU+5Fu1ry7shTyxMMwMsJXFUrf1R6atpwxlRMh8cvcKUQCIs9rewftwyp9la6qpy5pu9xkraD/cYGK+LclqLkU5GME9jP+ZF4f99czvwmFo6XfFPvK3+12VccNJ+vZ2/fFhbWKxQrW1BrV7QtpNSaxpMZc3oHPYmK/fyPxcUlSLLJ2Npg1p9nLqLjgVTJpmlqyrBJPBqP88I5/0IUHlG2FwPEA1R0bQ5idxRFA08C6m41/s4ynV6lx18Bu9lgZETPg5DFsVKICjrhWlAo21eqUclMGjdwPSSZZTq1D0pDt32i0hqxOT3WZgEUff7xgJ48n+KsDEpEER/Ucc39be853TtXVNyAmS0QNiKqVXVVIOa1lDjkv2+Yudkw9YG3SB95RtZBIWpE5Zp+kGXgwJAWgaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(2616005)(86362001)(6512007)(6506007)(26005)(1076003)(38100700002)(82960400001)(6666004)(186003)(66476007)(2906002)(4744005)(66946007)(66556008)(316002)(36756003)(5660300002)(8936002)(54906003)(4326008)(6916009)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3RrQmEzM2VEMjdjZzY0a014NEpEbVdLOEhzcnp5b2R3MFBwUDYzUWVhTTVE?=
 =?utf-8?B?Zkc4VncwcnJPZmIyVWtsc2FNZGQ5S0xpZGFqVm9obVNOV1B0ZCtwakh1Q0F5?=
 =?utf-8?B?b0s3WFRtMnpLblZFaWVqTytaN0d0M0ZUL1o1QmlvcWFJdm1RRkU2d3ZtaVkw?=
 =?utf-8?B?SkNsQWcwYkpQelRuaUFSQ1ZVbnpiWkd4RlMraFNCUHZHdC9EWE9IS1ZSbCt6?=
 =?utf-8?B?VzFTRllLWUpWMHRFY0pSTWI3amtpWGdia3FRK3M2Q2UrajhaT0tUMTFRY3h2?=
 =?utf-8?B?ZTY5bmhzdWlQc3JpTmtvSTJ6dUxFb3ZYOThPeVZvQ05teDlGKzhPeXVnZnl5?=
 =?utf-8?B?VU8wbkNnNk9SVXBNZm96SlBKZzh1VXlSd3RVdDc1Q0dCOWZLSlBmRkVHVEQw?=
 =?utf-8?B?bHZGNURvZUhuQUF0T2xsb3FDclpGNkhHMW1yWFJiVDA3Z2xGcGFYc0F3U3Vs?=
 =?utf-8?B?YTlxdVJWaDF1MFowU3dBM3ZvMG93N3piMHFEM3k2TkFoVUNTdEhvYkU5TVh4?=
 =?utf-8?B?WS9sRWhOMW5EdElyaUpVQW9NVU5Gcmp6NnlWU3g3YThoZHVvcE50UXNUYmo5?=
 =?utf-8?B?eFk0ZkNLU0YrdnBiZDdRR0swUkhXY21OUUNOQ2U3RnhENWFyT01kNkc4RmFx?=
 =?utf-8?B?VjdHWWdXUjlUcG5HRUQ5Zjg1TUJWckNUVHpCeTFET2lCQkNyeHVtbncxTXF0?=
 =?utf-8?B?WjVkQmtueDFSTi9HUnUyS0xxSVVHdmhSTHY5RnFENy96QXdsMjc3QlJRbktJ?=
 =?utf-8?B?M1hQUDZxSWREeDNaUjdjMGFoMEVOYnlJSmZRNXVaUWpKbFJleWExWUQ0UW5h?=
 =?utf-8?B?OXRqcXh5NFR1b1NFU2RRTDVMS0NlMnBPMzJ5YWdqT2xIaDRlK2R3VU53NjhZ?=
 =?utf-8?B?cjg1QWdNUU1SZU80Z1RyNFA2WGVHNGp2RkRiY1ljVmREeFByY01ra094Z0Fy?=
 =?utf-8?B?RERnOUhOR3VZbXdQbGVJNlhwUFlIN2xxU01Jd1lvQVFSazRBMlNJRGs0Zjc1?=
 =?utf-8?B?TWMyaW1rTmJGMUxxZldvOXZlbmxPR3BWZFZYTDVCYzlibmtxNUNnZytLOExS?=
 =?utf-8?B?VUVQZ29pNEw2ajdxM2Z3NjUvTGdYZkYvZW56K0V1UDN6cGkwUmtPNFRJakFM?=
 =?utf-8?B?eFFTUGljRFE3T0dJK0ZUVUs1WER4bS92MXdHd0dOdzVEUGRjdUsxVWN6THBN?=
 =?utf-8?B?SHJTSlFZNmlZakd1ZjZOQ0R0YWRJdm94SDlHeU5LVkRHb3JhV1UwUWpGMElz?=
 =?utf-8?B?N1puTEZ0czltdG1JRlBYcyt3bWtMQk5GcEtjam5uQTdmdktTV0tFaW1BNXFO?=
 =?utf-8?B?TlhDdDNVSkZMR1VzWWhqL1VCdW80VmMrbVp6VlVQd3grK01QcUVKbXJueVZv?=
 =?utf-8?B?ZW8wa0t3K0V5aDRxejZnTjBhVjlXdm00VnF2Z2lQdVUzN3FNRkpBLzUwYU5G?=
 =?utf-8?B?Z2wwQzJnZXdHM0I2WjREbEkvOFhQQlRYM0JCVEhWRCtIMkZ2QUtQcDFJaTBL?=
 =?utf-8?B?bDB3emZxclpNbEtjbUVJeGQ1TENlNVlrd2FjdndtWEoyWmdnejQ5QzR2djdr?=
 =?utf-8?B?RHUwZHBKeGhEclZLcDBObWhsVFhMT1J4WjlmMFYxYm9CV3IzYzR0SHFLL2dL?=
 =?utf-8?B?cHBoZ2FhdXorM2RHblEwaS9qNk82djRQOEkwZzFoQUljeFZkTnljaVVnUzRZ?=
 =?utf-8?B?Z25UdWp5Z0xmZkJ4dlg1am5zOW5xZ2hNbEx4cWdjMmlNSmN1TDlkY1dDV0E5?=
 =?utf-8?B?NUZYNWFlWXZSR0Zab0grd3loUzFUUklxRDZXelBJYTlLNExPV0xJQ2I2d0hR?=
 =?utf-8?B?TWlPQXZlTzlHeTlEd29SWFk0UjJ4cFZmRHd4SHExZlNObi90ZFcvQ1BPNjl3?=
 =?utf-8?B?Wk56M0lTWlcvRFBXdG9wMGdsZDB6SVZZZ2JMdE5CM0N0UXhKQy9wMk51di93?=
 =?utf-8?B?NGZKdm5zV05mU2JRZm5mRU0vWVM4bzJoNWpxZjliMEYrd1VScG9jSnN1YmdE?=
 =?utf-8?B?NW5haUUwaUxrWmtlYzZFRHhTRXlxZlBLU3ZYYVZGck9odHJpaWViVzRpbEdM?=
 =?utf-8?B?L2Q0RkgyeWhBZTNYYm1TcDluOXpuSmhiVVJ5b0N2Y2ZMVEFGaDRoT2ZsNXh6?=
 =?utf-8?B?eDdCTXpmRGQyTTg2T3RuWDQvUVdLRjlRaXd1eWo3RWR2OUg5UWtxVGkwYWdo?=
 =?utf-8?B?M0gzbGNyMHQ0dy9kTjBmMStBdko2MDFiRXZrRksvc1RMR1VxQlExRml6VFp4?=
 =?utf-8?B?WGxNbHBBUy9tLytYUlBxN2lUekN3U3Mybi85NnNtS1d5a2tFYzRoMmtrN0pn?=
 =?utf-8?B?SWZ6Q0M3c0RGeEkzOVJ1dCswaHI3UGtheHd5NFlQL3dTU1huMFlGTFpFb1BV?=
 =?utf-8?Q?uP3cWTzUex7F41Mc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90dfef2-add5-4e11-6f86-08da2865a9a2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 15:50:32.9943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZbtQPiGpTcWIR9g4gqNJngAV3gZU/Hn3uuqKZdDi/J5XSzmilNfgiKW5OhDQWGOMGnwgbFTgHFTgVy8tck9yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6306

Introduce a task that uses a FreeBSD 14 (HEAD) snapshot.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 4ae719136e..c38333e736 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -24,3 +24,9 @@ task:
   freebsd_instance:
     image_family: freebsd-13-0
   << : *FREEBSD_TEMPLATE
+
+task:
+  name: 'FreeBSD 14'
+  freebsd_instance:
+    image_family: freebsd-14-0-snap
+  << : *FREEBSD_TEMPLATE
-- 
2.35.1



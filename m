Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7898A532838
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 12:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336495.560825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntS8X-0007G2-Gm; Tue, 24 May 2022 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336495.560825; Tue, 24 May 2022 10:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntS8X-0007DK-D9; Tue, 24 May 2022 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 336495;
 Tue, 24 May 2022 10:51:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpOU=WA=citrix.com=prvs=1362cb858=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntS8V-0007DE-Uo
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 10:51:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 793eb684-db4f-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 12:51:34 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 06:51:31 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB4996.namprd03.prod.outlook.com (2603:10b6:408:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 24 May
 2022 10:51:29 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 10:51:29 +0000
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
X-Inumbo-ID: 793eb684-db4f-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653389494;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=g4+j8U8TBjBAQVO7fIRSanIHLfBm1pa13uJ6y1NSEKY=;
  b=JsnjiBQqm0eLy/4VwDXV2v9IpC6FMURyppHIApeCTpBuW51/A1qraBok
   fdUSwvSwkrkXWGnRD5H10hUovGj/L26x0wUTtwsO99yawt3B1l2eWilHN
   SugpptPjzQgSXX0DJHmstJuy8IfqDWPS1xDfLyOW4TeOhypDmxdjCTJWv
   I=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 71404634
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:o3ZJG6lX/9dIEEc5reaGqALo5gz1J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDGzTbquLZWHwc4ojaI3i8UMD68XQn9M3QVRvqX0xECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWV/V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYEg0nP43AuLomU1pyPA15ZZMbw6GcGC3q2SCT5xWun3rE5dxLVRlzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBhG9YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8Q7N+fRsvwA/yiRw4YrBEPWOR+WOQNkIxWCHg
 nngvELQV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdwK8iG6JuFgbQdU4LgEhwASEy66R5hnDAGEBF2ZFcIZ/7JdwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPfdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:EyIH0q+mFacnuU15s2huk+E+db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsjaKdgLNhRItKOTOLhILGFvAH0WKP+V3d8k7Fh5NgPN
 lbAs9D4bTLZDAV7PoSiDPIaerIq+P3lZxA692urEuEGmpRGtpdBkpCe3GmO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+InUeReDMq/DCiZqjOHc9dlcawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZ/W7O6JZ9nsfn17J4dbqxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbUA11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1bkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMEjgYdq3MMiFX5uYdk99HqQ0vFnLA
 AuNrCW2B9uSyLXU5iD1VMfgOBFXRwIb2S7qwY5y4+oOgNt7Q9EJnsjtbAid0g7hewAouF/lo
 L524RT5cRzp5wtHNZA7Nloe7rHNkX9BTTxDUm1HXPLUIk6BlOlke+G3Fxy3pDjRKA1
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208";a="71404634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMNMTybpOQC3ALUhEQ9X96+gp1C1R5Fcp9v6MS1Uc64D6M6GEEMeDPx6xBrR4+S01qh9rErfx0vaYQCcxBtKqRPhNTnk7dprwBm/GqjFpyPnTcquEzh5lz7XyklUOj94mtu5xBgNmwD6mKi/B8Qc4GyljBLkQO+Ds81lgeVz1qzrjubGQFKFHByyIQOnV/6G0tWnFkaQV9eAc86LjidsrpRdmz4O4GGEVqTA85fwMMVEhmqb4v2GP63NugzlIuQJLLuzBongMssByDcYWu9AOzF/w3TUi0FJ8bEx0X1A/+HMGWR3Jqun6Vg4tOImAKx4RPcpo5LY+wZQn2oraesjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cybg82+tSXW9GZoMvvUXlCaNCT87z5QGSCbDcrZvh5Q=;
 b=XD4Ajtyq/NS8EwRgoxkTJTfM/mv3C2hcOU+ZIdIj98LQdiO6Tl5pJBELZ8piUKRYV4T9T+z8gVK30Jywkrvk2fdIM62EB99VBEvPlbKQ6R0HU4QUafVUjw6RwvVWV/zBYWGbL7RWamEdpAOSa3HFP1NNCO/PQEs/PJBQBebtRJb2/fXHTq5cexWKK1n9KX49WKBMY6XzAC2ZURIrRQ5UW0r6i4fWZTmjYPR7skZ5pOF/wQopIuHYrEZpv2sohEqoQRdPthry3geltS4Z679x/G4p7zUbKSVxIGI1Gpbm3WXh6Cil7lnh1La7jf3fqaX5KNOv0/fCNeD8HiSG6EtZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cybg82+tSXW9GZoMvvUXlCaNCT87z5QGSCbDcrZvh5Q=;
 b=pFmY7n1JQLjkbFXLZHG0/cYuEgffa8nkiP7b2fYF5ls9NQr/XWzzNbEk6XGHptQ+GbCPIRkb6/WxEzsMTPbZAZwKsaRK9Asz423IYXVp45UxagnGaoWw5G9b4EVlug5Z8AM+2tTbIzSZAwlB+GNApJX4XIT0OtGVnDu/gJbh8zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Date: Tue, 24 May 2022 12:50:52 +0200
Message-Id: <20220524105052.5210-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1bf97e5-54d8-4491-f713-08da3d735baa
X-MS-TrafficTypeDiagnostic: BN8PR03MB4996:EE_
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB499658796DC6BB73C4C7896C8FD79@BN8PR03MB4996.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t4EmSKrWuMHdkUHfn3QySuqdE8tQXXRG09kC0WDd+PFuu54A8EHhRdgmCudiKSOuGrr18qeR+rfP0Wr+3aT2d147pWxzGNp0hNCDSkYlnkWJ580Ly13SvqasO94LNfErWDLDy6m19FFAWRZy4yN+1PWdFBAkxuOI0VxXFbUCPc+Tb6VlzIznIB9Tus8tL10XzlcvZnhRNyxB2YjXQU7ZwnEWlVzMROoqyDIhEUijmyOTrDmBo3QAQr6HKUZ0yRZXA0pOcHeELUN3fUm3fWDEIpFPDFYHmIBC1LtqP5ll9nywIRGM1zB7gk/VBubLxUK6+wkS/UIkr3Wje6krsMZY391l2vaAyEgiVyLIZew9cld8ObKeNAItsNiqFjzBRo4coB6rAQUtFG8nnKTBqSLHJUPvDB1qgLVrXPZFsHpXecjMjHmHQ6rSN6c4uRcWy2pZYf/2uDQx2CJLVgIukHPMXl+4wG3ReYV3UHzXzhmMauYyonvijt6P4EC5lEAh5kePW5odIMnefnMRffwZwGprjGaH/fVmB2U60aQC/f+3i9Lfborvnd59YI4kFmU1NfVCSa/r5LEP5pw2qpQHm4dnwso13iffL74K+ZhSuWz3pfgNdebqVnxpNQeOkk0DRArNTd5LaolvXjePZkNwqgVIXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6916009)(54906003)(186003)(83380400001)(26005)(6506007)(2616005)(1076003)(508600001)(6486002)(8936002)(5660300002)(2906002)(66556008)(66946007)(8676002)(4326008)(66476007)(82960400001)(6666004)(316002)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxYVkQ1NXE3L1U4Y2YraWVhM25relFUTzFTVFZ5VXN4SmZtd2g1RWMyMUNh?=
 =?utf-8?B?Ylc2cS8xeUxzMTd6MEo1ZTBtU3ZvWWhqZFNGeTd4aWJid0RNVndFWjBpN3E3?=
 =?utf-8?B?aE9ON3Q1SzlSbGJXOWhqcDU4UlRGd3RzdjU5SVYwNkNkTGZUMDMzZmQxOG5z?=
 =?utf-8?B?N1c1dEdLbUp1TC9PRlRXWnkyYVNoM3Q0K0tZeVNha1c5L3p0ZmNLRmhpOEh1?=
 =?utf-8?B?YlR4TitNYWg4Z0RFK2FOT1ZyUDNtRGFEcmN0U1VibE5XaXhnb212dEVQYmY4?=
 =?utf-8?B?dld2N1FRanZOcGx6SjMrUVB3U2llYy9UVFVoVnA3Z2RqV21BRVVmLzRINFhM?=
 =?utf-8?B?V2w5dUQwVk8vSW84Y1NCRWt3bmN2aGdhZlJuNCtIRDRxRXJmQnRCTm13OW5M?=
 =?utf-8?B?NTZvYk5hYzVreGRtKzNoTFowQkhIUlZIc3krMjVMMmVoYkUwN2lDdUNVNFhI?=
 =?utf-8?B?U2VtUDdaS3RKeWRUZFNZZjZRUC9MQ2Z4Y3EvcTJ0bTVOYXlTMFBsQ0JtTTU0?=
 =?utf-8?B?TjJxMm9TL1M4UWZiNjV0TmRlRU5acnBtVlFsQlo0UFhYVEhPZm9VS3JVWkFw?=
 =?utf-8?B?QWwyTEErUkx4TlZoekpKUDdRaVdxcWZmWEd5SWtBak9PY0FvNFJuMzkxb0hJ?=
 =?utf-8?B?TmZJV3VaNG9URjI0M3dGZnNNUHB2R3VhbnBQU0JuRWk2SzN1TFlBalVLQWYy?=
 =?utf-8?B?Sm1BRlpId1crSlloZjVYNXJRaFllK2FkRVRtMVhvZEpxWE9IYkgwbFBjL01J?=
 =?utf-8?B?VWJNN2tZc1hiR1ZHZkVRd1FSR2FOTmZ0cGw5ejFhUzE0NVptUXhLS21XMTFS?=
 =?utf-8?B?RGxtVDh2ZHhMZGFhczBtdHZUQU9PWDBkWEcvV3hNWUxmdzFPK200NXdsOFVs?=
 =?utf-8?B?dXdqR2JUcUVYOVIvc2VmNFo1bWIvZ3NTZGt0UWR5c2grNEo2UW9qRFkxTWJ5?=
 =?utf-8?B?MTdEaTVwZDhPY1RTM1FKQldjUUFQSENKV1V2RjlDMzFDOS9MS2VIT3hxVXNo?=
 =?utf-8?B?RFJqSEdlTlRsbUFzY2s1Z1RkbVljRlNuZ3N3Rm43LzlLS3NvRFpWVStKeEpJ?=
 =?utf-8?B?em4xL2oxV1FpdWZncXk4SFh0OXc5eVFCS1JtU3ZvZGljMk5seW5NdVUrbEU1?=
 =?utf-8?B?d2dwZXZNK2c0Y2lldkczT0F1MGZ2RHVpL3dCbncwL1BzV1dlRWQzSmd4eXhl?=
 =?utf-8?B?eGNGRDUrbnJnMExIL1d2RWtObWV3SVZNaDcvaXVETHArS2VwU011ZUI2WWJN?=
 =?utf-8?B?cDhGb1p1OUhxc21GNE9sZ3ljckM4UzJNQ2lXU1c0SVBJVHBlL3ZTcXB5bEVq?=
 =?utf-8?B?eHNEOUtUODJ5QXRUenFGMHRZbUtkRDhhOXRxTUlqREd6ZjY2aE5ISmJZdGdG?=
 =?utf-8?B?d2NPeks3cURNU3pVcmNGSm5NWlVYNlgzSzJOV3J3ZVVCMnpnWHU3UnNnSlZM?=
 =?utf-8?B?UDNhK1pGa282RG1Xa3cxVmJUVGxjWElRVFQ2NG1HZ3hiam1jU2RDenRSMytH?=
 =?utf-8?B?V1dPVGdrY3pldU5IK0JzWWEyVjVZVDFkVkJNWklVbHhSNWpEU0MrL1JDcXF4?=
 =?utf-8?B?SXJJSHFwYlFMQ1hocVlka2NIanh3OE41RHh1WGQ0WlY0SkdXZ1hBQUdIMnRJ?=
 =?utf-8?B?R1JHVlF4bmlvRFpSNU5oT2VUcHJqek51SFFpaU1uaWNISTlnSUpFTVN0aFZC?=
 =?utf-8?B?ajVCNVFyRDRHTERITGZYSHdUVmU1SUJxV2xUSFoyU2NnRzFyWVMzdjR0WFRx?=
 =?utf-8?B?SXBhQkxPZWRsM0RDWGx4di9iYzZITjVKc1lWRGdXZUtXVGRGcG1vcVFFTW1O?=
 =?utf-8?B?ZUdCL1V5S2VnM3l3VExtdlJEOS9QWEtZUlhLenJyVkdmZnhsOFpodGt0YjE0?=
 =?utf-8?B?UlEzRFBKdTNEQmhkbXRnSmpQR3hIZW1xZkRwWUUxV3QzSHdyYzhQUU1wRU9X?=
 =?utf-8?B?V1JQUVVaekQ3a0trc2crYzlZY29ITitoM0JSRDNKV0gzVWtBSkFrdy9uKzkx?=
 =?utf-8?B?NFZ0WlRCaVE5V01FVlNVOEs3RmR3Z1dtbk8vWnZRbHUwVDlMalpMdjBXZ2RL?=
 =?utf-8?B?d05uWmpxQ3diYXRnWWpZK1RndzB6bHdYa0FGeWhSR1c0TzRPSnRHSTgyWE9T?=
 =?utf-8?B?V2U3aXRZQWRFT2Z3V2RZbkcrdm5sSThlT1F2ZmNOSWsza2xpd1ExQ2xKYVMz?=
 =?utf-8?B?ZWRsaW1rUFN1TUF5L29KS281MXFNU2F3V1F1cUc1b2dZdWpsNUtqU0I1eFR1?=
 =?utf-8?B?Zk41angwSFJWMDJ3aFBuM3ZSVHFsWWRLUEtyZXl0YXFpVlZlVzdydUhzeTJu?=
 =?utf-8?B?WXBKVGFNUk5mSEo2cTh4VnY3VlA4V2V0OWFleXVQK2pjVS9DSFBobGFMbkFY?=
 =?utf-8?Q?hRC0XxMxJbMCXzy8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bf97e5-54d8-4491-f713-08da3d735baa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 10:51:29.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2q/F0kXFJeZ3Y9+XrQ2QbydqKZTF7035DeqEeJeZOa+Qht7P1iIBqraf04P73/mLm6oWTLa8xF694lWVTH04w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4996

Booting with Shadow Stacks leads to the following assert on a debug
hypervisor:

Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
CPU:    0
RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
[...]
Xen call trace:
   [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
   [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
   [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
   [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
   [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
   [<ffff82d040203344>] F __high_start+0x94/0xa0


This is due to SYS_STATE_smp_boot being set before calling
alternative_branches(), and the flush in modify_xen_mappings() then
using flush_area_all() with interrupts disabled.  Note that
alternative_branches() is called before APs are started, so the flush
must be a local one (and indeed the cpumask passed to
flush_area_mask() just contains one CPU).

Take the opportunity to simplify a bit the logic and intorduce
flush_area_all() as an alias for flush_area_mask(&cpu_online_map...),
taking into account that cpu_online_map just contains the BSP before
APs are started.  This requires widening the assert in
flush_area_mask() to allow being called with interrupts disabled as
long as it's strictly a local only flush.

The overall result is that a conditional can be removed from
flush_area().

While there also introduce an ASSERT to check that a vCPU state flush
is not issued for the local CPU only.

Fixes: (78e072bc37 'x86/mm: avoid inadvertently degrading a TLB flush to local only')
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add an extra assert.
 - Rename flush_area() to flush_area_all().
---
 xen/arch/x86/include/asm/flushtlb.h |  3 ++-
 xen/arch/x86/mm.c                   | 32 +++++++++++------------------
 xen/arch/x86/smp.c                  |  5 ++++-
 3 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 18777f1d4c..f0094bf747 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -146,7 +146,8 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
 #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
 
 /* Flush all CPUs' TLBs/caches */
-#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va, flags)
+#define flush_area_all(va, flags) \
+    flush_area_mask(&cpu_online_map, (const void *)(va), flags)
 #define flush_all(flags) flush_mask(&cpu_online_map, flags)
 
 /* Flush local TLBs */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 72dbce43b1..96d95a07cd 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5070,14 +5070,6 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 #define l1f_to_lNf(f) (((f) & _PAGE_PRESENT) ? ((f) |  _PAGE_PSE) : (f))
 #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
 
-/*
- * map_pages_to_xen() can be called early in boot before any other
- * CPUs are online. Use flush_area_local() in this case.
- */
-#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
-                         flush_area_local((const void *)v, f) : \
-                         flush_area_all((const void *)v, f))
-
 #define L3T_INIT(page) (page) = ZERO_BLOCK_PTR
 
 #define L3T_LOCK(page)        \
@@ -5213,7 +5205,7 @@ int map_pages_to_xen(
                 if ( l3e_get_flags(ol3e) & _PAGE_PSE )
                 {
                     flush_flags(lNf_to_l1f(l3e_get_flags(ol3e)));
-                    flush_area(virt, flush_flags);
+                    flush_area_all(virt, flush_flags);
                 }
                 else
                 {
@@ -5236,7 +5228,7 @@ int map_pages_to_xen(
                             unmap_domain_page(l1t);
                         }
                     }
-                    flush_area(virt, flush_flags);
+                    flush_area_all(virt, flush_flags);
                     for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                     {
                         ol2e = l2t[i];
@@ -5310,7 +5302,7 @@ int map_pages_to_xen(
             }
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
-            flush_area(virt, flush_flags);
+            flush_area_all(virt, flush_flags);
 
             free_xen_pagetable(l2mfn);
         }
@@ -5336,7 +5328,7 @@ int map_pages_to_xen(
                 if ( l2e_get_flags(ol2e) & _PAGE_PSE )
                 {
                     flush_flags(lNf_to_l1f(l2e_get_flags(ol2e)));
-                    flush_area(virt, flush_flags);
+                    flush_area_all(virt, flush_flags);
                 }
                 else
                 {
@@ -5344,7 +5336,7 @@ int map_pages_to_xen(
 
                     for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                         flush_flags(l1e_get_flags(l1t[i]));
-                    flush_area(virt, flush_flags);
+                    flush_area_all(virt, flush_flags);
                     unmap_domain_page(l1t);
                     free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
@@ -5415,7 +5407,7 @@ int map_pages_to_xen(
                 }
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(virt, flush_flags);
+                flush_area_all(virt, flush_flags);
 
                 free_xen_pagetable(l1mfn);
             }
@@ -5430,7 +5422,7 @@ int map_pages_to_xen(
                 unsigned int flush_flags = FLUSH_TLB | FLUSH_ORDER(0);
 
                 flush_flags(l1e_get_flags(ol1e));
-                flush_area(virt, flush_flags);
+                flush_area_all(virt, flush_flags);
             }
 
             virt    += 1UL << L1_PAGETABLE_SHIFT;
@@ -5481,7 +5473,7 @@ int map_pages_to_xen(
                                                         l1f_to_lNf(flags)));
                     if ( locking )
                         spin_unlock(&map_pgdir_lock);
-                    flush_area(virt - PAGE_SIZE,
+                    flush_area_all(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
                     free_xen_pagetable(l2e_get_mfn(ol2e));
@@ -5532,7 +5524,7 @@ int map_pages_to_xen(
                                                     l1f_to_lNf(flags)));
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(virt - PAGE_SIZE,
+                flush_area_all(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
                 free_xen_pagetable(l3e_get_mfn(ol3e));
@@ -5784,7 +5776,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 l2e_write_atomic(pl2e, l2e_empty());
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
+                flush_area_all(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
                 free_xen_pagetable(l1mfn);
             }
             else if ( locking )
@@ -5829,7 +5821,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 l3e_write_atomic(pl3e, l3e_empty());
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
+                flush_area_all(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
                 free_xen_pagetable(l2mfn);
             }
             else if ( locking )
@@ -5837,7 +5829,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         }
     }
 
-    flush_area(NULL, FLUSH_TLB_GLOBAL);
+    flush_area_all(NULL, FLUSH_TLB_GLOBAL);
 
 #undef FLAGS_MASK
     rc = 0;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 0a02086966..b42603c351 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -262,7 +262,10 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
 {
     unsigned int cpu = smp_processor_id();
 
-    ASSERT(local_irq_is_enabled());
+    /* Local flushes can be performed with interrupts disabled. */
+    ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu)));
+    /* Exclude use of FLUSH_VCPU_STATE for the local CPU. */
+    ASSERT(!cpumask_test_cpu(cpu, mask) || !(flags & FLUSH_VCPU_STATE));
 
     if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
          cpumask_test_cpu(cpu, mask) )
-- 
2.36.0



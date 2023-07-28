Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D6476698D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 11:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571411.895177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKEl-0005Co-QZ; Fri, 28 Jul 2023 09:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571411.895177; Fri, 28 Jul 2023 09:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKEl-0005A9-Nf; Fri, 28 Jul 2023 09:58:19 +0000
Received: by outflank-mailman (input) for mailman id 571411;
 Fri, 28 Jul 2023 09:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UUpw=DO=citrix.com=prvs=566eed887=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qPKEk-0005A3-1g
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 09:58:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b9a934-2d2d-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 11:58:15 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jul 2023 05:58:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO6PR03MB6258.namprd03.prod.outlook.com (2603:10b6:303:13f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 09:58:07 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 09:58:06 +0000
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
X-Inumbo-ID: 44b9a934-2d2d-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690538295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dcnZ2LN3zCS7EKFPsmGQMsR+P9INz7Tc7jfrkUhwE0k=;
  b=UDnlwIx/phmMqzvTpQqztvGQBTXOaq8kAc/N0xeyzaIuWtHufzGVTSsZ
   sukht+DTd7EsYxOyrE8B43u189+VpZccLjIiaizVkDlkZf3IY+xQEJImG
   oI5jcggFMhC3swWntoF1dfLQv2Qsy43yrt0zvpzNnF7xCD+vT0MiISoWW
   o=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 117047316
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:idobO6ws6MZlGFGiBkR6t+f1xyrEfRIJ4+MujC+fZmUNrF6WrkUBn
 TMbX2/UaP/YMWP3fNAiOYi1oRgCucfWxtVgTAFk+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP6AT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU8Q6
 6IqcjQqVTKCnNOsmbyYR9Vvgst2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQpuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aQxX+kA9tMfFG+3tR1qXeN4zIwNEQfSByxgfWLp0qCUd0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluaOiULLGlEeS4NSyME5cXupMc4iRenZs5qDaqdntDzXzbqz
 Fi3QDMWgrwSiYsOyP+99FWe2za0/MGRFkgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:oTdGO6uc+lvj4rXkDX83eK777skDRtV00zEX/kB9WHVpm62j9/
 xG885rsiMc5Ax8ZJhDo7290di7IE80nKQdieJ6AV7IZmfbUQWTQ71K3M/JwjX6ASHin9Qtt5
 uJOMBFebnN5CNB/KXHyTj9F9o72tGI/JyVpcq29QYJcT1X
X-Talos-CUID: 9a23:SloUnmxAcWHos5EWAf9FBgU6RN57QCfZ60zyIlSJEz9na7CpSlufrfY=
X-Talos-MUID: 9a23:rNqBkgsGjlBGgoYk382nri5LHtlNvYeSUUkQ1p8mt/upMRB6NGLI
X-IronPort-AV: E=Sophos;i="6.01,237,1684814400"; 
   d="scan'208";a="117047316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLyM6R9JdEOOCrZSNjqB+JnayMabX1eyDs4SnJRZWtUlrgn6BEs92x2nMnq8uDaNbjL60K7gGmGDxs/jKdtKOySiHXDqiV6pKvRYE5Ol4c7OhsBv97YqKnb/oK7aBBpI+a7HbOCPySfIQV3CtlFHC6h2jkA7JVhidSKtbjjc0YOMRBvyzXBnZOXqU4487tbiPK/Yfy0ijJ9ht8ZHrKgeqfpn4uOHxNGM2n+x+mPKNn/k6uwsb4INSHi7CVOb5MdbG6P74ldlgepZWUt8xmHBIqHxTMJ5hUzD8u6dtn4Q/U06w9iM8qh6JqqgsHZKCHGdEA3HT9NF/qano0DlSqqF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTTeB9/o2lRk6wToEn0bcKaCOHRDiuR968v7zHe4rH0=;
 b=ZW70orpx4sQRXoxXiZGAMBTHL4DxLWZv3EMdc4G5PNu3roOsBZoXF0wgRBNBsVwrdnqrBH6+grcghHLUz13UNLhSU8FlQJUQZ8UmzbmFh2EhEltF+btzpvfCYGZYJBKbbULKpbfl6xHCkEjvWLcK0BD4KSTsQD2O/Do4ekQriPFOSENqyAu84KEqc8EobhJ7WlFTINkDEXASy3tO4dZRAo2VnMnBKqaPX1vU7g8Pdjd8O9+WXyQFfL85Z/7GQIUSz1A9RuC3m4v1Phj7vWINDHPUxPcJGEO97139yREBph3YqgB7J6pQysGJ3AHRBjMOxxApS8Vyq2X7qV3h4nCPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTTeB9/o2lRk6wToEn0bcKaCOHRDiuR968v7zHe4rH0=;
 b=NAetWdFAnbUeZ/TxLRdV4ipD7NV//Qzb4rDE5gMWMp2kqWTz7hpX2t8Fc3ZcSaP1MXMOLk6AcrXRzTMjuEN//pKcsrXa/g5yl6CUhZFhJUU1ON2xva0hQ++9uYf3TaFSN7tG3bnV+OD8prXUSNg/9nXaqpRM2/w9ggpodct1MeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 4/4] x86/iommu: pass full IO-APIC RTE for remapping table update
Date: Fri, 28 Jul 2023 11:57:16 +0200
Message-ID: <20230728095716.13779-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726125508.78704-5-roger.pau@citrix.com>
References: <20230726125508.78704-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO6PR03MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ddd679-f65e-4c31-9b03-08db8f5123db
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mlE5PBVcx/8N5r4bYmZKx9C2zuMtiHwrBWNQ82MGNORLhKML9iBq6I13tRKyHutjBIj3oCNbezD0iUgQgJuxd1T2OZX0Ib8VIYdJLMsQMivtZAqY/AEZBOzC2f6uYD4RhQL/YeuJpWc3UNzLMeh4VEpaWrQplT3+X0eetlSTYpAJOBi2cGhCFeHPYln0t96TpqqOQNw79qAVllDo5/ggAqU2uq87EiaMymo4q0V0GpsM1sPPWuwQH+WnJdYQ5duyLDs78Tb5oP5X06NlXo+w9IC+arCC04WGM8CgUFAk0biudRTNM5VmDdFHNQ9SqrLh5N3ruHZLMJ3liIjf8hN5h+mJk4rIrApIlYAChMvPF53WHALv6yKb9nnk5x8fC4j8QzQxsNlJvcwIJoe2S2+7CJbmFgk0AfaR+WPdTC1OyKru3pN/ngZzE53tztkk/VG2XdsVaodLtp88l39IZYKTLNDl2OqGJLsTDG9meq0dtCVbpICfCTRKDTgmAXzUIEO8c6PKDnRod3fDpP4Eu31M4WRG7JmwBR2bJsSchUkY+p9I1KmT01RNX90ZQ1sVM6mM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(5660300002)(478600001)(54906003)(66946007)(38100700002)(316002)(6506007)(4326008)(66556008)(66476007)(82960400001)(6916009)(26005)(6666004)(186003)(6486002)(1076003)(6512007)(8936002)(8676002)(2906002)(41300700001)(30864003)(2616005)(15650500001)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTltdVZzKzRYUDBCcDU2T1E3SzZjZGI5Q244MVZVQkxqenRiL3EycHV2WlhW?=
 =?utf-8?B?cnpGQ0ZlMDZncFY1MkVHd1ppT09vKzJtWDk1emdvS21rT05MNVhFVHZYckIz?=
 =?utf-8?B?RFh2aDBKOHVXTlJBRFoxRzFwRWQ4Uk5NTHJMdkQ1dUpmUzhTanZPSEg1Yk5l?=
 =?utf-8?B?NWU1UGNTOGhFcTlFemJ0UFB3TTArRm5COXdlbTZjclk2dFdDdkJ4NEdoMXdW?=
 =?utf-8?B?a3AxeE1rY3V3cDcxSENYQk9XYmtiQU5kMzRnZUlEWC93VG1VTmwzK3NGT2FI?=
 =?utf-8?B?UktCS1ZOUHNtcHVtbWI3aGFRYml2VzN2L0k4c1B3RG1aRFQxckdQdUFjTkdy?=
 =?utf-8?B?eDJ3czREUWFEWVpwZDh6VEQxZ0h4WUdXa1dPZ0QrcnZmMmN6RlpyeXF0UTdP?=
 =?utf-8?B?TUp0UkFxYjJoOENiYW9iTEJHK3ZkVkszdTZmZk53ZkRyeUJmUkVkbUJwTk5m?=
 =?utf-8?B?N3NNTXNoMWc4V09UdUdtbVRvaHg1c0x2eGYycG5SY2hHYk10M0lMUmpIUG8w?=
 =?utf-8?B?NDRqWEgxblRvUURFR1VjdkJhSnQxdGZKUzFuTXVtQjVwOU96ODIyZ09QUFVL?=
 =?utf-8?B?a0U0NzJrS2NOYzNkV0JpZ2hIU2VJL3AzQzRaTnNDZ3FFbll2SkxYenNFS2Y2?=
 =?utf-8?B?eFNuWVNyRmdvVzZzeUwvVU9TMlpDNExqTDJrYXpHbkRSRUtWUy9JNVhIK3lu?=
 =?utf-8?B?QWg3ZUUyL1h5WTVLbThKbjRVWlh1Y2RQSDNwc0tQOUlzTXhldVFqWU9LLzR0?=
 =?utf-8?B?TVdYTjl4Q1ZpTGg5ZzcySkpaVUlXTXJEOE5TZXF4QldiY0R5a3Z3aG5vcGNJ?=
 =?utf-8?B?MXBZZThWVnBVMnFCanlXQWdlYVJHTjc3YUgwOW9OSlViaWpFOUtvU1djaXgw?=
 =?utf-8?B?YjVQays4TGJxWnhiZ2JPVjl4Q3F2dEhsRWx0c0E4NFpDSDlKcG1OeU54RjYz?=
 =?utf-8?B?cHVqNlpaTndvWWVnTm0xQldSR05xa2RNSXIrOERvbHdZODZCOGs5ajNIVmo5?=
 =?utf-8?B?RHp4ekhUMEl6OXR0cU40ZW04anM0SzdTL09rSkIvUnU4TC90TGZmQ0hKOUlC?=
 =?utf-8?B?YnZBSW5VdXY3aW1SZENuV1AvNk5lSXlkcy9JWVJ1MDczaG5MTTdLQXdlMDNM?=
 =?utf-8?B?UzBhR2JQQUFhUVhGOWdGQVpVSmJ6RHd0UkRuSVNJTVlUSnZIL1ZuZkxUT2lp?=
 =?utf-8?B?R0cyQm0rQS8vOUM3Q2ZPTDlyTXBmTEg0cG96dll0MzhFb1B3bzJCRE9CWlNO?=
 =?utf-8?B?MjEramFyYXhnb3lTL01LYWZ1SXd2Z1NtSG9wd0Z1U1Y5Vlg2WkNkVzdMbkVT?=
 =?utf-8?B?RE1ma2lRYXJLM09YSjZiR3d2MzIvQWNaR0lPOW1vQ1lJV2dFRDgyWFQzQ0NQ?=
 =?utf-8?B?c2pNdmJ6Q2YrQk5LNFhSOW15eVcwUmJNYXFpWDVKWlArVkFTNTIrU1hvVDJu?=
 =?utf-8?B?b2dyTWtaWE40bXd1R2Q2MVM0bzNwTFZObWVTVzhkaFFxUkt3ODUvU1ZZUWJE?=
 =?utf-8?B?blZGYWZ5b1FFMU80WTJFN2VmMHRJZ2VVVWtSVTZTb0NEZGdlYlAzTVBadlNI?=
 =?utf-8?B?bC9oYy9sNGJra2tGdVlnSXBJVzF6dlN0S2lTS1g4d0lCUFZqWXE1U3hYdXRU?=
 =?utf-8?B?eUp4a21QQ3BJOEk1ODdpdCt2TXA1YWdaNXNSbGtFZlRDUjd1bjlGNDJsaFNj?=
 =?utf-8?B?dnRpSzN4cjI5NTh2QlBDZXd5YUZiOHBNV01LWmFpQ092bDlQa0RobXBzWDhv?=
 =?utf-8?B?Q1Q3dUh6ZkhiSkpZZ1dsMFBmaXF6YTFna0NwZE1OeUMvUkVpb3NpM21EWE9j?=
 =?utf-8?B?VkQ2ZEhHSkY5ejZqWlgrN3VxOE5CNDhWbnlxSG91Q1dxQ2xlWjFlTVBGNVZ5?=
 =?utf-8?B?UTROTVgyUS9CbXBWQ3NCWlBUdmN3T2Y5OXZsakhlSlY5anZ6UHgyNjRFQTRR?=
 =?utf-8?B?Qy9CZXp4WHVybGdzMHlXSkNoSTlJRy90eU9iUU1GWWhXVStBUSs4N21DM3h4?=
 =?utf-8?B?WlFQa0x1TjF4QnRGODB4blhpbXBQNVVORFpEc0psYjlnY2w3RGVIYllXaDFr?=
 =?utf-8?B?OHJEUnBtdnhxbmo4c2l0RkMrK0U5K1d0anZVcktaK2N2ZXJmT3JsRkczTkFK?=
 =?utf-8?Q?vNxBRjioXWxEg3W1CwW57XJCF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hiQE091rWOu673JpWBVLdgf7kd/2+60xSW4WnJxwEkD11AHnoptmKS6D/zuVeyVeydT20umOECZm1AIa9E5BroZWvHomUW7CJrMVR1dUO7B4+RBGZbjBat1UbWXxrSdjZZzjvRia+ZwiKBqMmaHLkCwTU6wxs/Y4Y4TWMn48m4LB+V/e2U2jt9JHUT78lncf/4DN2ZYsyL6gtgh1EZjdCXs/9BnMUu5f6SZ33NWalL2aQD180i1TIuS60Gx+nqCniOTBzr39O+FYJvo2tYFK+zxxoqWA2qFmVqThICpOj5PY6ClAfE23rlsNskRt72XMYGAjA3d3ZicwJTfegtP7uiSioRiKYRuqis1ZMMXAPa3jf56bYb9kVin2adX2d18Bs5rSPLzRFOvC6yO0coPza6Z7GjmPkJZ9ggUCg1qpDcfwOLyTwjfSS/uaE2tE4OYj8XmnK6jxqS7QOhFFY8CG+ABsG1b0JrGlgKU7a4Bd3eT0k4DmXq59OU9iZWc0QpmvJh0zQeSd6VFuwVu0CXKlAxBOpCR7HpeMsWBweiHZnPdg7huvIl2eQkqVP2SWUczQaoeVusUmrgPKhJlM6A/EoAitcOzgJ8Oa1zywWXWcCLRJEz9P9PDSlDCk1PQPVt0Tf48LcjZjjomieg81XajtD71lk4hzv9l9+HxDZEKj7pbbeE6Qa6o0OZEton3ITy1vX2bRZF87hpiHVIm8CV0ci4gU8t5uaGg0gPCJg6YH5ymx50DloYSZtmAHd84NlUzYom3f1aMisi7bEPdajAZESOtYpOBRbtq3fjQmMo8dBJgavyoG0Yy9FaNbHunL8OTHgu/MjSOXVAp39dksxU3LpI0ZAXiGXFIMDx4u5GA9RQc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ddd679-f65e-4c31-9b03-08db8f5123db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 09:58:06.1439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/TepATXzgZcd/Fm3UIRa6QhyeqvlBrQSw4+sVPGtEvJkQeVnuyk68KE3/X+R72/maT0a4JXAYudup3VOKzK/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6258

So that the remapping entry can be updated atomically when possible.

Doing such update atomically will avoid Xen having to mask the IO-APIC
pin prior to performing any interrupt movements (ie: changing the
destination and vector fields), as the interrupt remapping entry is
always consistent.

This also simplifies some of the logic on both VT-d and AMD-Vi
implementations, as having the full RTE available instead of half of
it avoids to possibly read and update the missing other half from
hardware.

While there remove the explicit zeroing of new_ire fields in
ioapic_rte_to_remap_entry() and initialize the variable at definition
so all fields are zeroed.  Note fields could be also initialized with
final values at definition, but I found that likely too much to be
done at this time.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Fix prototype parameter name to match definition.
 - Use GET_xAPIC_ID().
 - Remove duplicated error message in io_apic_write_remap_rte().

Changes since v2:
 - Remove unneeded initialization.
 - Use 'rte' as parameter name for update_ire_from_apic()
   implementations.
 - Fix comment style in ioapic_rte_to_remap_entry().
 - Fix requirement for atomic write in update_irte() call from
   ioapic_rte_to_remap_entry().
 - Remove remap_rte from io_apic_write_remap_rte().
---
Note that certain combination of changes to the RTE are impossible to
handle atomically. For example changing the vector and/or destination
fields together with the triggering mode is impossible to be performed
atomically (as the destination and vector is set in the IRTE, but the
triggering mode is set in the RTE).  Xen doesn't attempt to perform
such changes in a single update to the RTE anyway, so it's fine.

Naming the iommu_update_ire_from_apic() parameter RTE is not really
correct, as the format of the passed value expands the destination
field to be 32bits (in order to fit an x2APIC ID).  Passing an
IO_APIC_route_entry struct is not possible due to the circular
dependency that would create between io_apic.h and iommu.h.  It might
be possible to move IO_APIC_route_entry declaration to a different
header, but I haven't looked into it.
---
 xen/arch/x86/include/asm/iommu.h         |   3 +-
 xen/arch/x86/io_apic.c                   |   5 +-
 xen/drivers/passthrough/amd/iommu.h      |   2 +-
 xen/drivers/passthrough/amd/iommu_intr.c | 100 ++---------------
 xen/drivers/passthrough/vtd/extern.h     |   2 +-
 xen/drivers/passthrough/vtd/intremap.c   | 131 +++++++++++------------
 xen/drivers/passthrough/x86/iommu.c      |   4 +-
 xen/include/xen/iommu.h                  |   3 +-
 8 files changed, 82 insertions(+), 168 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 0540cd9faa87..eb720205e25e 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -84,7 +84,8 @@ struct iommu_init_ops {
 
 extern const struct iommu_init_ops *iommu_init_ops;
 
-void iommu_update_ire_from_apic(unsigned int apic, unsigned int reg, unsigned int value);
+void iommu_update_ire_from_apic(unsigned int apic, unsigned int pin,
+                                uint64_t rte);
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg);
 int iommu_setup_hpet_msi(struct msi_desc *);
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 041233b9b706..b3afef8933d7 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -275,10 +275,7 @@ void __ioapic_write_entry(
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
     }
     else
-    {
-        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
-        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
-    }
+        iommu_update_ire_from_apic(apic, pin, e.raw);
 }
 
 static void ioapic_write_entry(
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 8bc3c35b1bb1..5429ada58ef5 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -300,7 +300,7 @@ int cf_check amd_iommu_free_intremap_table(
 unsigned int amd_iommu_intremap_table_order(
     const void *irt, const struct amd_iommu *iommu);
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int pin, uint64_t rte);
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int apic, unsigned int reg);
 int cf_check amd_iommu_msi_msg_update_ire(
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index f32c418a7e49..e83a2a932af8 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -247,11 +247,6 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
     }
 }
 
-static inline int get_rte_index(const struct IO_APIC_route_entry *rte)
-{
-    return rte->vector | (rte->delivery_mode << 8);
-}
-
 static inline void set_rte_index(struct IO_APIC_route_entry *rte, int offset)
 {
     rte->vector = (u8)offset;
@@ -267,7 +262,6 @@ static int update_intremap_entry_from_ioapic(
     int bdf,
     struct amd_iommu *iommu,
     struct IO_APIC_route_entry *rte,
-    bool_t lo_update,
     u16 *index)
 {
     unsigned long flags;
@@ -315,31 +309,6 @@ static int update_intremap_entry_from_ioapic(
         spin_lock(lock);
     }
 
-    if ( fresh )
-        /* nothing */;
-    else if ( !lo_update )
-    {
-        /*
-         * Low half of incoming RTE is already in remapped format,
-         * so need to recover vector and delivery mode from IRTE.
-         */
-        ASSERT(get_rte_index(rte) == offset);
-        if ( iommu->ctrl.ga_en )
-            vector = entry.ptr128->full.vector;
-        else
-            vector = entry.ptr32->flds.vector;
-        /* The IntType fields match for both formats. */
-        delivery_mode = entry.ptr32->flds.int_type;
-    }
-    else if ( x2apic_enabled )
-    {
-        /*
-         * High half of incoming RTE was read from the I/O APIC and hence may
-         * not hold the full destination, so need to recover full destination
-         * from IRTE.
-         */
-        dest = get_full_dest(entry.ptr128);
-    }
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
 
     spin_unlock_irqrestore(lock, flags);
@@ -350,14 +319,11 @@ static int update_intremap_entry_from_ioapic(
 }
 
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    struct IO_APIC_route_entry old_rte = { };
-    struct IO_APIC_route_entry new_rte = { };
-    unsigned int rte_lo = (reg & 1) ? reg - 1 : reg;
-    unsigned int pin = (reg - 0x10) / 2;
+    struct IO_APIC_route_entry old_rte;
+    struct IO_APIC_route_entry new_rte = { .raw = rte };
     int seg, bdf, rc;
-    bool saved_mask, fresh = false;
     struct amd_iommu *iommu;
     unsigned int idx;
 
@@ -373,58 +339,23 @@ void cf_check amd_iommu_ioapic_update_ire(
     {
         AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
                        seg, bdf);
-        __io_apic_write(apic, reg, value);
+        __ioapic_write_entry(apic, pin, true, new_rte);
         return;
     }
 
-    /* save io-apic rte lower 32 bits */
-    *((u32 *)&old_rte) =  __io_apic_read(apic, rte_lo);
-    saved_mask = old_rte.mask;
-
-    if ( reg == rte_lo )
-    {
-        *((u32 *)&new_rte) = value;
-        /* read upper 32 bits from io-apic rte */
-        *(((u32 *)&new_rte) + 1) = __io_apic_read(apic, reg + 1);
-    }
-    else
-    {
-        *((u32 *)&new_rte) = *((u32 *)&old_rte);
-        *(((u32 *)&new_rte) + 1) = value;
-    }
-
-    if ( ioapic_sbdf[idx].pin_2_idx[pin] >= INTREMAP_MAX_ENTRIES )
-    {
-        ASSERT(saved_mask);
-
-        /*
-         * There's nowhere except the IRTE to store a full 32-bit destination,
-         * so we may not bypass entry allocation and updating of the low RTE
-         * half in the (usual) case of the high RTE half getting written first.
-         */
-        if ( new_rte.mask && !x2apic_enabled )
-        {
-            __io_apic_write(apic, reg, value);
-            return;
-        }
-
-        fresh = true;
-    }
-
+    old_rte = __ioapic_read_entry(apic, pin, true);
     /* mask the interrupt while we change the intremap table */
-    if ( !saved_mask )
+    if ( !old_rte.mask )
     {
         old_rte.mask = 1;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
+        __ioapic_write_entry(apic, pin, true, old_rte);
     }
 
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
-             bdf, iommu, &new_rte, reg == rte_lo,
+             bdf, iommu, &new_rte,
              &ioapic_sbdf[idx].pin_2_idx[pin]);
 
-    __io_apic_write(apic, reg, ((u32 *)&new_rte)[reg != rte_lo]);
-
     if ( rc )
     {
         /* Keep the entry masked. */
@@ -433,20 +364,7 @@ void cf_check amd_iommu_ioapic_update_ire(
         return;
     }
 
-    /* For lower bits access, return directly to avoid double writes */
-    if ( reg == rte_lo )
-        return;
-
-    /*
-     * Unmask the interrupt after we have updated the intremap table. Also
-     * write the low half if a fresh entry was allocated for a high half
-     * update in x2APIC mode.
-     */
-    if ( !saved_mask || (x2apic_enabled && fresh) )
-    {
-        old_rte.mask = saved_mask;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
-    }
+    __ioapic_write_entry(apic, pin, true, new_rte);
 }
 
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 39602d1f88f8..d49e40c5ce7d 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -92,7 +92,7 @@ int cf_check intel_iommu_get_reserved_device_memory(
 unsigned int cf_check io_apic_read_remap_rte(
     unsigned int apic, unsigned int reg);
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int pin, uint64_t rte);
 
 struct msi_desc;
 struct msi_msg;
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 05df6d5759b1..706abefaccc2 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -328,15 +328,14 @@ static int remap_entry_to_ioapic_rte(
 
 static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     int apic, unsigned int ioapic_pin, struct IO_xAPIC_route_entry *old_rte,
-    unsigned int rte_upper, unsigned int value)
+    struct IO_xAPIC_route_entry new_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
     struct iremap_entry new_ire;
     struct IO_APIC_route_remap_entry *remap_rte;
-    struct IO_xAPIC_route_entry new_rte;
     int index;
     unsigned long flags;
-    bool init = false;
+    bool init = false, masked = old_rte->mask;
 
     remap_rte = (struct IO_APIC_route_remap_entry *) old_rte;
     spin_lock_irqsave(&iommu->intremap.lock, flags);
@@ -364,48 +363,40 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
 
     new_ire = *iremap_entry;
 
-    if ( rte_upper )
-    {
-        if ( x2apic_enabled )
-            new_ire.remap.dst = value;
-        else
-            new_ire.remap.dst = (value >> 24) << 8;
-    }
+    if ( x2apic_enabled )
+        new_ire.remap.dst = new_rte.dest.dest32;
     else
-    {
-        *(((u32 *)&new_rte) + 0) = value;
-        new_ire.remap.fpd = 0;
-        new_ire.remap.dm = new_rte.dest_mode;
-        new_ire.remap.tm = new_rte.trigger;
-        new_ire.remap.dlm = new_rte.delivery_mode;
-        /* Hardware require RH = 1 for LPR delivery mode */
-        new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
-        new_ire.remap.avail = 0;
-        new_ire.remap.res_1 = 0;
-        new_ire.remap.vector = new_rte.vector;
-        new_ire.remap.res_2 = 0;
-
-        set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
-        new_ire.remap.res_3 = 0;
-        new_ire.remap.res_4 = 0;
-        new_ire.remap.p = 1;     /* finally, set present bit */
-
-        /* now construct new ioapic rte entry */
-        remap_rte->vector = new_rte.vector;
-        remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
-        remap_rte->index_15 = (index >> 15) & 0x1;
-        remap_rte->index_0_14 = index & 0x7fff;
-
-        remap_rte->delivery_status = new_rte.delivery_status;
-        remap_rte->polarity = new_rte.polarity;
-        remap_rte->irr = new_rte.irr;
-        remap_rte->trigger = new_rte.trigger;
-        remap_rte->mask = new_rte.mask;
-        remap_rte->reserved = 0;
-        remap_rte->format = 1;    /* indicate remap format */
-    }
-
-    update_irte(iommu, iremap_entry, &new_ire, !init);
+        new_ire.remap.dst = GET_xAPIC_ID(new_rte.dest.dest32) << 8;
+
+    new_ire.remap.dm = new_rte.dest_mode;
+    new_ire.remap.tm = new_rte.trigger;
+    new_ire.remap.dlm = new_rte.delivery_mode;
+    /* Hardware require RH = 1 for LPR delivery mode. */
+    new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
+    new_ire.remap.vector = new_rte.vector;
+
+    set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
+    /* Finally, set present bit. */
+    new_ire.remap.p = 1;
+
+    /* Now construct new ioapic rte entry. */
+    remap_rte->vector = new_rte.vector;
+    /* Has to be 0 for remap format. */
+    remap_rte->delivery_mode = 0;
+    remap_rte->index_15 = (index >> 15) & 0x1;
+    remap_rte->index_0_14 = index & 0x7fff;
+
+    remap_rte->delivery_status = new_rte.delivery_status;
+    remap_rte->polarity = new_rte.polarity;
+    remap_rte->irr = new_rte.irr;
+    remap_rte->trigger = new_rte.trigger;
+    remap_rte->mask = new_rte.mask;
+    remap_rte->reserved = 0;
+    /* Indicate remap format. */
+    remap_rte->format = 1;
+
+    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
+    update_irte(iommu, iremap_entry, &new_ire, !init && !masked);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
 
@@ -439,36 +430,42 @@ unsigned int cf_check io_apic_read_remap_rte(
 }
 
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    unsigned int pin = (reg - 0x10) / 2;
+    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
     struct IO_xAPIC_route_entry old_rte = { };
-    struct IO_APIC_route_remap_entry *remap_rte;
-    unsigned int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
-    int saved_mask;
+    bool masked = true;
+    int rc;
 
-    old_rte = __ioapic_read_entry(apic, pin, true);
-
-    remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
-
-    /* mask the interrupt while we change the intremap table */
-    saved_mask = remap_rte->mask;
-    remap_rte->mask = 1;
-    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
-    remap_rte->mask = saved_mask;
-
-    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
-                                   &old_rte, rte_upper, value) )
+    if ( !cpu_has_cx16 )
     {
-        __io_apic_write(apic, reg, value);
+       /*
+        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
+        * avoid interrupts seeing an inconsistent IRTE entry.
+        */
+        old_rte = __ioapic_read_entry(apic, pin, true);
+        if ( !old_rte.mask )
+        {
+            masked = false;
+            old_rte.mask = 1;
+            __ioapic_write_entry(apic, pin, true, old_rte);
+        }
+    }
 
-        /* Recover the original value of 'mask' bit */
-        if ( rte_upper )
-            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
+    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, new_rte);
+    if ( rc )
+    {
+        if ( !masked )
+        {
+            /* Recover the original value of 'mask' bit */
+            old_rte.mask = 0;
+            __ioapic_write_entry(apic, pin, true, old_rte);
+        }
+        return;
     }
-    else
-        __ioapic_write_entry(apic, pin, true, old_rte);
+    /* old_rte will contain the updated IO-APIC RTE on success. */
+    __ioapic_write_entry(apic, pin, true, old_rte);
 }
 
 static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index be71a4c4641c..d290855959f2 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -158,9 +158,9 @@ int iommu_enable_x2apic(void)
 }
 
 void iommu_update_ire_from_apic(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, reg, value);
+    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, pin, rte);
 }
 
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg)
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971c5..9335cd074cff 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -278,7 +278,8 @@ struct iommu_ops {
     int (*enable_x2apic)(void);
     void (*disable_x2apic)(void);
 
-    void (*update_ire_from_apic)(unsigned int apic, unsigned int reg, unsigned int value);
+    void (*update_ire_from_apic)(unsigned int apic, unsigned int pin,
+                                 uint64_t rte);
     unsigned int (*read_apic_from_ire)(unsigned int apic, unsigned int reg);
 
     int (*setup_hpet_msi)(struct msi_desc *);
-- 
2.41.0



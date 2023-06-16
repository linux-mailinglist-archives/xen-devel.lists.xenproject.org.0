Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41073320E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550230.859227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9N4-0001XM-JK; Fri, 16 Jun 2023 13:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550230.859227; Fri, 16 Jun 2023 13:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9N4-0001Tm-Eb; Fri, 16 Jun 2023 13:20:10 +0000
Received: by outflank-mailman (input) for mailman id 550230;
 Fri, 16 Jun 2023 13:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9FT-0001xG-BD
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:12:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69968e84-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:12:16 +0200 (CEST)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:12:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5736.namprd03.prod.outlook.com (2603:10b6:510:37::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:12:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:12:12 +0000
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
X-Inumbo-ID: 69968e84-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=sjKlgl/yPyFkCKYOe4mhWoUddlmkQUo8Y8MV7rKkmHo=;
  b=aCb32IaL1FA99tG6dUFZ9mfRtuOllU6/QJBEOUEqP9Kr8qDAl/CQBYEU
   ZVMkc2+Ze6dkgz4kUNbI6UKutE0OE1gubxiZCgDxQv3HIzcCGr5Zr00sy
   9nWuLZpy99FQcABw1MNAmmb1lfo05BWkC743M0pR+9x+S5sN11eF2mmsl
   o=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 113086008
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1Vykq69hXgOhhk2GjRAXDrUDpX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mcbCDjUOq3eYWD3Ld0lPozioB4H6JCHytJhHANvqHo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6kV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklJ9
 aMeGi9OcSyjoP69m62hVuhzv8EaeZyD0IM34hmMzBn/JNN+G9X4ZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilAsuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aUxXOlANpCfFG+3ttmpgyY6TwzNCIHfkHmsPe1hEHhZ90Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHfildSwIAu4PnuNtr0k+JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:1fClgasnnZJ5u6rD9odxz2PA7skDRdV00zEX/kB9WHVpm6uj5q
 WTdZUgpH3JYVMqMk3I9ursBEHvK0msjaKdjbN8AV7aZniehILKFvAA0WKB+Vzd80yVzJ866U
 4IScEXY+EYa2IUsS+Q2mmF+rgbruVurcuT9IDjJxgGd3APV51d
X-Talos-CUID: =?us-ascii?q?9a23=3AucmUVmgXi0gadljmG5G4fEVr9TJudX2CykXPYFC?=
 =?us-ascii?q?EKUF1Q+aKU0OR55phqp87?=
X-Talos-MUID: 9a23:HYXLVAUP34qip4bq/BrgomBpG5dI35u/I1pQgJsKtcbbCSMlbg==
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="113086008"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezHsxC/PxitmDLy/AuvHFOeg6NRsGJ6zUok5QoNuN0g4dzNeKYkep8m9NXpoc8pPaWKkxhgD6zBp3s2CiR+7CC+JaDtkRMXh8PQUggycD3mO8wxLlaqvH9X9qLfa1tBV03zT1Kqs1nbFf57QiX7CeZxD2n+AgSSgHjlAZ/RP3PWsElCyHzV+zDvOaWVM1xOibPPEfpQjvdOyT91sz/WGuNLwsI528OZkz4EhZIipxo+HNKm9mkf3TgIkD2vUc7VQbwi/JpU2/S94dsQxkeEKJV2qx+b0fm5QHL8S58aXOFEdvkjD7W0JPBYatepYAGppSaQrw68ll6ovHnhAE3HR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Mor47Tk+HAkXO06D3oYKwBm48TJAA+Ss+RoUvUbsSI=;
 b=kk8KKI5/kwVelY1+iDPYKOqSaRhrUhXyN2trk7svgCWuOH0oQsatxdfm08cKfYqyWs+hFJz8IPc+0XxBJk8Z/XCLFm+M/JMZOv4V7+Zw+WIXG0sw3zuxIScBHbZrCuqlFsLE8I8mXn+7QcOJPZUwTmLaCbCC3L2RydqUNjtoaJNojIklyyRIUW1S0EtJbT6jVjYdzM9wzeOC2jSZsNMIobALb4oLxaNENk5BNeWilur09JJnfXV0EFwzqPv1e/HvMpX6zbeZ5NpKDn6R0tiDWBXrzcy2JrC98MXuD2Dnqkk1xUwAXUOsD3ocdKN1Bc7/CanUT3RP/xK03PBMCL1LXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Mor47Tk+HAkXO06D3oYKwBm48TJAA+Ss+RoUvUbsSI=;
 b=lMY7IT8VgZrbN2vL2/bwOBCj173Lv2Xa3A29wkNIcTg6KKnUlTBxEgKbcpDp5M1qV5X0gncc3JLd+4HuAW239Ahn9ctp/Y6XhBy8wbdks+Ln/qEqX8R9SWk/PZry0lmaL8RJ4pNsUQ3dDQOJeO62i2jaf3XaWcTxhyR6pNE7K6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 13/13] libxl: add support for parsing MSR features
Date: Fri, 16 Jun 2023 15:10:19 +0200
Message-Id: <20230616131019.11476-14-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: aec05583-0ffa-432a-6ccb-08db6e6b4c21
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	chK8S6k+M1WYhCkZlWouMVZyRmb8/CkNZCZz0W1n3zZoFbXhK8NNsP7eZJxQr75NAEahY8+8vFn2rS4OKokXISaY9EqY0PTGfRxuiTddN/U8xd6okGbzvjolE5HeYzwUiT83f6VeJreSMEaFFKCRnD+c0bprsF/opLkJ3L4ZXasIxZXl16G+GRt/s4h70ICC6xKeTeTNh7aa11/zKL1wiWWL5SlzPus8qz927K0oqI7PdjVo+21Os53LtTGSSMY4QSQ1JysemSJo4K7SGZunwtK4l4uA4yHkoVGHLlMAxQD7+H4vOs03WJ9WJJ4PwWaXCj9k0DowWe3HQelz4wzFFthShaHDR009STWlN3ilUCrCM1LoWoiuidzTWOzX2sOmpazeYz/q9WocEIJ1JvF99j0QGVMOwypx/wfG7sYaqxLcilPXTbe7D7jYLTWtOa189/VzR/VMZZQHtbzVZ6wlGHra9d4RfqUaIl/sQfetpoXxpYEujcTHkGkNCmfM4VreEx5k27OanDHYw5mT59CYTIHEZShUn6+eZAwSw/SbD4w78pD8P6ib7+i8dBXAwPkb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(54906003)(41300700001)(8676002)(86362001)(66946007)(66476007)(66556008)(6486002)(6916009)(8936002)(316002)(4326008)(36756003)(478600001)(6512007)(26005)(5660300002)(83380400001)(6506007)(1076003)(2906002)(186003)(82960400001)(38100700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3QwK3YwbVFCOTV2U21CK05HWmxzSTZHVlhMbVhTUVBkdCszUEg4Z1RGZHc0?=
 =?utf-8?B?ODA3aVpUMTlFZm9SS1N6bEwwd1pRU082VjJBalVKRkliN1RHZnlFTDJ2dDBl?=
 =?utf-8?B?Wk8rVnhxYmdyQjFMOG1CT1cyRHVzNXhiUEFzN3dRbFFqVGxYSnYwbEsrdkJM?=
 =?utf-8?B?UVpBdnRuYkpoYlFmeGpOZ1dDR0JFdGVORUtxZXBIMDd6ZGI3SjA2eWV4VUwr?=
 =?utf-8?B?Tm8xTW00TlV5QkRzNCt1elZxeUJTeXpNUG5VUTV0SGdvQmtmODNBem1zNmxl?=
 =?utf-8?B?cUtXRzZpYzVWUVROSld5SmN3M0JYSy9CbWdoWURyNTUyMUVwdXpyeDdoYXpQ?=
 =?utf-8?B?WENKMHlYUU8vVUtnQk5PZXZqUHdkY0Z3VEhLenk3NUdVL3N3eCs5L3EyUThS?=
 =?utf-8?B?aHNoYnZrZG51UFpYRG9EYUExYlUvUDZGbzZlK3lrR0tUME9kL2RrWDdZZGkz?=
 =?utf-8?B?T1Y4V3o3S3hLL3ZxeTRDRVlvWUM1WkJTTVBWdGZ6OEdDM3Erc1JEYk5aZUd2?=
 =?utf-8?B?Wnp6Z245WEhDWUJmaDZXaWFRblFkeG85a20vQmdxa29RRjB4NmU0ZU9DUXBH?=
 =?utf-8?B?alFwMklFQ2xqM242QzJET3R0RjJFZmo1WDlLQzdNU3NFZmpYRHJGZ0EyTmd2?=
 =?utf-8?B?WHBPaE4wTUxCQllVd3JXd3hKLzdTZitmNGpYTzRzKzlDbGYxUjFZN2lpaHh2?=
 =?utf-8?B?a0hTeXdPYk1VRXRkZUo1UEkvUnN4ckEvQm5pRG5RT0xTU2ttTnpBUXdOVFVm?=
 =?utf-8?B?bTBTRWh1MDcxN1R3Zkk3LzdjOEM4d0VmOUd2YndIUUFMS20xVW9nNkI3L3lN?=
 =?utf-8?B?emY4c2dhN2pzL1FqRjF0VGw4NWhuaXpRSWlXVFVYWjFOenA1ckVqTXNTZEIv?=
 =?utf-8?B?OFR5WG9iTGtXYjZ0Q01JdVRzdDQraFdwWlpkN2RrZytaMEVvUmVrNC90NmVt?=
 =?utf-8?B?Qk1lMFNCa2pYbktyK2FoK2REVFJNaGduSEJIR2dVa1BxZkQ3N2pKTjA4Y1cy?=
 =?utf-8?B?d3puai8wSXVYQmtBQ2NiajBDUlRsK1kxTWlicGdZK2FYNTdMNUNtd1EyQi9m?=
 =?utf-8?B?T2Y0dTFLdjQ3Y1hhUHEwZWdRR0p5MEppa3M5M3JaVXFVS08xQnhGdTBNL2FO?=
 =?utf-8?B?ZTY0L0hFNTMrbHNGeHhFa09FVVdTRkFuMGNyYVVRMTlLVFZReVE5Rndja0JN?=
 =?utf-8?B?WDFXYXg2eC9HMElabzYyQ1p6a3pacy9FUlBvSkRjMjROOFZsQS8xVHIxekht?=
 =?utf-8?B?TFNTenVQbU8zRGhnSnNaZmJ2Ly9aT0Z2cDl5eU5uem41SEVGSVE4eHpKSGtP?=
 =?utf-8?B?YzgvcGFCeTQ5cTZhSUMzMWlwWDk4UlFlNFFwUzBJWjRxdExCQ29GRTR3RFl4?=
 =?utf-8?B?dXNHRFkzZzBDNERFM1YzRWhDeHpWeS9sUmo2WHRnbi9nSXNGT2hYS2Q2QUZR?=
 =?utf-8?B?TlpiYmc5Z0pNWFZUVk5XT3JPelRKWTBJQ2QzMlZFYm0zTHhUb1ZNL3RoSVgv?=
 =?utf-8?B?SGI5NGJYNUZHSmJoOEkvTzJaYzdpYmM4VzZrTzIvS0hxek5GTEU3VFFmSjEr?=
 =?utf-8?B?c2NkV1U4Uk1MQVJoNjlpdVc0b1QrU1Fmd1lCM0FwaG1vUHBkdSs2NmtLSFow?=
 =?utf-8?B?Qy9CY1BwV2JhSFRhdXM3Lyt6aHZPdWhFVW50VFNVellUdGorUW1WbE9YZm5n?=
 =?utf-8?B?dDZscmloM3NPV2ppdlFxZkR5SHlZMDFRWnNEL21OcVE4bzIrL2RsUUthK1VN?=
 =?utf-8?B?UDB5ek5YZjN5QlJFYUE1UExYVjJheTVaa0RsN2k5Q0ZRaXlzNlR4Z3JNSHUy?=
 =?utf-8?B?Wm52TzVvSzF6UUpPME55NWpHUm92a0lrVUl2SzdzcUZWdi9OaWJ4YnRab1R1?=
 =?utf-8?B?WFZTQ2JrNEtQc01RY044cjVEd09heUNVdUZsRHhiU3FLS2VzbkswdG5oaEEx?=
 =?utf-8?B?RXZsNzFDeGppa2tuUUNmdFdUSHNScDZNbmZnUm0xZ2MyRjY1N2pGVDN2dTNx?=
 =?utf-8?B?c0hCby9mbStDOEhXSXUzSFJjZEtoYUdvQk9GS1RkWVlpQS85VTBzVWhHVkhU?=
 =?utf-8?B?dTRCODlGVmxCZGF4SFE0a1haUDRpVGpIWXZTZElyRjBzMVpEZkNqL25sK0c4?=
 =?utf-8?B?RnFrRkZFMG9BZTVUWGFCbk5VeWhvNEdIZS82TmJ4dkFpaVFvRXZqc25kWUt1?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ob+pv/Gj0wQn2PP8hTHv3d+eI1/lERKhxREVpJNrW3MwuOMz1QvKTsdA9MgtUxlhYuaEbeB3EnCEWYnFAonClM8kzwF4PufxKWiGywR3jezTvoO3ni678JbX22bKx20Yb1RgEKc4MFI/SThJ832kqXPYVlynUGq4maBPoPwQbEiSiyZW83+tFYAXgMAVWre6mG1ePcWCHAjLnc3laqudF1sTuRNj487a75T6mrgliFmljXiJaT3BI8ytUOHgOyn/SBDW3N+uned2OqlNtNvcPZFcxtZqago/e4pVLdawMe1gKQwscBD72QAd5Q77gM86C8CTQOy3Yxi+eJgDHRgMyzQlKkw2U42wT2k5WZzxiABN+cjnAaouXZv3tfgKNpVqpwbT4/qiLFeL44MsN1blz7Tw99rbAn+AhCpB7XWegEAzcUMJw/ZKFEMDjzfhhz2uLomKadVmq7A6tyrIm84VwIXQZauOplk+HGAvP5Zi13LVFKhyKfbeE+Oo9noqtBNSv4s1bXTedXikWgq6fiPO7VKkWVwUHBrC5f1V5VZnFkcgwth+nyNTYskylWrj13V9Cm4b58GK++4rIwdmQC6qLVTA3CtVDBWT37Hvg55jtBwzspGbDD+HI1MufGFJF/pzywsMPwXEw4o8xi30KctKjPNfPfeg43mCx0Zcgns/MAXXFZzGzj7yX91JsiknKdyiMRtOyM7uJh+yPicUHi5q1ezE3gxtuMbOKP4fmQ54lFZEKIaKZkGup0GlDgvv/rMWQhU5yybVCB83DGSkpklSSMX12AG/COGuf19kNKGI+hCOpvMfioFvHX80fCnHixTb
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec05583-0ffa-432a-6ccb-08db6e6b4c21
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:12:12.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvQgu7h+LCuFlVox6aW1Cy0VWysTw+Fi5DVTf+xB6Sxnbcn6LA8caUpY+Gz3ofQfNVnzsHa08Txc++kyyTvpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5736

Introduce support for handling MSR features in
libxl_cpuid_parse_config().  The MSR policies are added to the
libxl_cpuid_policy like the CPUID one, which gets passed to
xc_cpuid_apply_policy().

This allows existing users of libxl to provide MSR related features as
key=value pairs to libxl_cpuid_parse_config() without requiring the
usage of a different API.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_cpuid.c | 57 +++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index cbbd5d31d63b..804dddb446c3 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -149,6 +149,53 @@ static int cpuid_add(libxl_cpuid_policy *policy, const struct cpuid_flags *flag,
     return 0;
 }
 
+static struct xc_msr *msr_find_match(libxl_cpuid_policy *policy, uint32_t index)
+{
+    unsigned int i = 0;
+
+    if (policy->msr != NULL)
+        for (i = 0; policy->msr[i].index != XC_MSR_INPUT_UNUSED; i++)
+            if (policy->msr[i].index == index)
+                return &policy->msr[i];
+
+    policy->msr = realloc(policy->msr, sizeof(struct xc_msr) * (i + 2));
+    policy->msr[i].index = index;
+    memset(policy->msr[i].policy, 'x', ARRAY_SIZE(policy->msr[0].policy) - 1);
+    policy->msr[i].policy[ARRAY_SIZE(policy->msr[0].policy) - 1] = '\0';
+    policy->msr[i + 1].index = XC_MSR_INPUT_UNUSED;
+
+    return &policy->msr[i];
+}
+
+static int msr_add(libxl_cpuid_policy *policy, uint32_t index, unsigned int bit,
+                   const char *val)
+{
+    struct xc_msr *entry = msr_find_match(policy, index);
+
+    /* Only allow options taking a character for MSRs, no values allowed. */
+    if (strlen(val) != 1)
+        return 3;
+
+    switch (val[0]) {
+    case '0':
+    case '1':
+    case 'x':
+    case 'k':
+        entry->policy[63 - bit] = val[0];
+        break;
+
+    case 's':
+        /* Translate s -> k as xc_msr doesn't support the deprecated 's'. */
+        entry->policy[63 - bit] = 'k';
+        break;
+
+    default:
+        return 3;
+    }
+
+    return 0;
+}
+
 struct feature_name {
     const char *name;
     unsigned int bit;
@@ -328,7 +375,15 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
     }
 
     case FEAT_MSR:
-        return 2;
+    {
+        unsigned int bit = feat->bit % 32;
+
+        if (feature_to_policy[feat->bit / 32].msr.reg == CPUID_REG_EDX)
+            bit += 32;
+
+        return msr_add(policy, feature_to_policy[feat->bit / 32].msr.index,
+                       bit, val);
+    }
     }
 
     return 2;
-- 
2.40.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C9707EA6
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 12:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536284.834470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzbKg-0008JA-9j; Thu, 18 May 2023 10:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536284.834470; Thu, 18 May 2023 10:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzbKg-0008G9-6g; Thu, 18 May 2023 10:58:06 +0000
Received: by outflank-mailman (input) for mailman id 536284;
 Thu, 18 May 2023 10:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joHs=BH=citrix.com=prvs=495b323d3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzbKe-0008G3-VE
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 10:58:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dabbb531-f56a-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 12:58:02 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 06:57:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4959.namprd03.prod.outlook.com (2603:10b6:208:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 10:57:51 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 10:57:50 +0000
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
X-Inumbo-ID: dabbb531-f56a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684407482;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=A/uACWFhkkV9jxcmRWs6ZXnElUREbuI1UGoYrXPWvyI=;
  b=SsXcxyfcbQ1Ju8/QEx6rwjnPPJWvtYeIbh/zwHWgJSabPwiHQPIVgJNJ
   TIANUAM3ttXaRptuEREGemmI1KD6Ebz6x0Ln4cTOyxO63yJZACc/eyVKp
   c1ICFHVNdjjQETlY5FVbZjdp2tBOYC46HrCob12cq//8mMzbLL3S0EZtd
   o=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 111964818
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kT5up6JUbJK1qGgYFE+R8ZQlxSXFcZb7ZxGr2PjKsXjdYENS1jdUx
 zEZXD3XPPbZNmv0KYx3boXk9ExTvcOGx9VnGwFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5SHTl20
 6VCLAlXSSKl2uS98LOmbeJV05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLkmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv1376RwXOiCOr+EpXg3LlwrXiNmFAwNycREgOC4si20VKhDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSRmrbm9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+IUr1EuXEJBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:19f0m64C2qo397cRugPXwN/XdLJyesId70hD6qkRc3xom6Oj/f
 xG8M536faWslcssRMb9uxoUZPoKRjhHPVOj7X5U43PYCDW/EWBaLx45Yz5yzf8Gyv4/us179
 YCT5RD
X-Talos-CUID: 9a23:eITz6GNZxoIPBu5DfTU/zGhNQMQcKFrv6irWKH+5FEFicejA
X-Talos-MUID: =?us-ascii?q?9a23=3AUeL9twyj97afxORxAOHgO+ApvbCaqPyET1ogtIt?=
 =?us-ascii?q?Yh+q7Dys3Yw7evTvsXpByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="111964818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFeESLyG2xHmsQSif/RAtG5zgpFpmir2qRF+YY5jJhEC+Qw+BXqoYPlRn/110n2uCQY2UswMaDdvI2yz4LzuLmJQF3i/hUkr0jps20giWGShLPvCObOFC+xcuHihUNHh49A6ZsFIbxZY3NlnLN/2Qt4N3VzgzF+u9dnvM/iRKtkjQeMb7EmLufs7vPrIbTkv1OVoDmMK8s2ZdGc/vTIct53j6aPGRUkgjLwkGvS+KCSqL7/tRY5xwVE4GfX+i3yTcyJpev9cW2rgahuMnYeVuJvdNUctJ1OLzn/DAlK+wrT+93412+f4ds0vfuUwEUImnrI8O+MseiHyypXjCYn35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z2b5omfJztJFPLzPsbCzsdAso5yPlwMiZXcEZ1CNcM=;
 b=NLp3DzxW6+BM+rQRLdqMeVwCvlIk6BKMwA6sZopC8SpLW/m7ECcMJq9gJelqs/EYnfe9eQYmbwezfV6v7TncEKGqvTyWGn1GYbEPOuOpMPm+2em9fgV+4Cg8F0hA5L20mfc5v5LGXYwWvJOwACXPZoXAl77YT2/3rpnIaqRElVYc3Xj2gWziwkm+iURK2yYqIzuuSzoCBCWm/obcwUz91VgI26N66ZycM6Go/9C3os/nyWN9/CgCoy/Vp+5sLGb8yp5mABo3fWG6iSQptPpaoWS20Fo2MjQN2MeqqrVO0w4zxaz0miFIazsNKNZalK4fpQBuOFlod5cgzaR8+YpS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Z2b5omfJztJFPLzPsbCzsdAso5yPlwMiZXcEZ1CNcM=;
 b=Ve3bvosAmrdsU1/KEyY+P4K2X6n4qytysE+e+io4AiHgjGdluFp4uiZB7vxKLZPu9GZJq3WCuwA7ohm5qDKOJrDuWXvMuK5WKbS+lwU0vbKgVjFhNmxlH40XAcasgdpCCUcwEn+OYsXQEcuvuMHBryXa8suXTboZNMHhbcoNkeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] pci: fix pci_get_pdev() to always account for the segment
Date: Thu, 18 May 2023 12:57:38 +0200
Message-Id: <20230518105738.16695-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::25) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 460b8e72-1681-4ab1-f415-08db578eb91f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DsTWOTGezYHSO72n1D9voV463VBMohyNRxGRgXs4phIe2VzSjluopIuefZxrOMmi612xnistC2nZQPW8W7X+C0NbhCP7YaFVc3M2Wwh/bcYisVcXv71/MjPELQOQkVXKsLvTuTlFxKxQ5gwggATzfX3UAwKYFCEDbnz+I8cIcRG6V4A8LA1l3kjmzI/awW7YSUFXdGw4RSKBjvenruUzVJ9MYYIv1kwX4mlerk523qBZq5bILyc6oRU3aYNhgXmTg3ICJu1tQPPU7ivtpjfzIBVf+MTV8joEo2Hc2/zKMQ+5H2PiXF8LZf885gCe+fmdBNZnKhASyDFyw+75nXS5sYG/4MpB+wWwH5rVxUbWSC8yvI/hnfRFZMzcCbioFAWLSuaCY4sBeAUHd7SUaZM6ym9EqQatyu2aVu37tsmIZV90qJ5K3bRdp7Quf2iduQp3IB2lDwV8c6JHp4jpPXJ/fjlBsgTswSPFYAUceHJ0Tb5c7qFF51WvPo5y12275JxFZrA/oQ2CUTbw+6s+2uuSYt+DYPPPZhdRchE/Krt5iwYnBQQU0jQj1oUA7ffMlRHa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(2906002)(5660300002)(82960400001)(6486002)(15650500001)(54906003)(86362001)(41300700001)(6916009)(316002)(66476007)(4326008)(66556008)(66946007)(8676002)(38100700002)(36756003)(8936002)(6666004)(478600001)(83380400001)(186003)(2616005)(6506007)(1076003)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3k5VWxOb0FLMWRWam5na2RxQ2VjQVRPVXB0SFBZVnlyTEdMRkpKRS9SbU1S?=
 =?utf-8?B?Uk9tYkpyTXBKTVlMaURidXd4bHc3N3JWeEpManorUFZEVWd5WjhIdCtqcHo4?=
 =?utf-8?B?bFp4M01WSm1tOHF5ai8rNUkySmVIR1RZZHJWL3FRZWVSK0xqZzlrNlNLZE9K?=
 =?utf-8?B?NlhOOWovRWpuRDlrZVFNUEs4TTNwdlU4ajlxUnA0NVgrOXhDdDVxQStscTFR?=
 =?utf-8?B?citCMWRYbzdCNGo5c2pCejNja0RrbHlKVHBIVk5HaXUxNkt5VXBxNXVEMW5s?=
 =?utf-8?B?VC9VZlovYlhtOWdMdTlPWWdGOW8zVWlKaEZGckxYUFV4MTFFMU9vV0lqQlh5?=
 =?utf-8?B?b3ltU051SzhqUS9GSjh4N3VxeTFLYnJpMnh3UVZ0UG9MVDhDTkY2VkV4cEtY?=
 =?utf-8?B?WG93MzJ0SnU1YTNlVVFBQlRhTy91TSs4VEpYc3JTWElCSE1ucnhhYWFIYmJu?=
 =?utf-8?B?TnFacXdNZ2trclk5MEdKWWE0dXNmWElVQTAwMGRFZ0tvdkw4UkxBb0NUakRt?=
 =?utf-8?B?YVRhM3hZcnFxOXJ4bHpneHNkU21FZGYzUVEwN05EcThGc2d5bHFJeGVLMEU5?=
 =?utf-8?B?WUdXazNnTkh5d0huc3NMeHA2TnJUUmJ3SlVqRmR5bFpiUnlEREx4RGh1aFpD?=
 =?utf-8?B?RGFsMUp3QzJVekFPK04xc1JoVklTQm9sRk10cHUxVnc0R0p6aG85TVdLT1c1?=
 =?utf-8?B?azdCTG5hazdBMlVETGRiSDhmZG1ieFArUW5NL3Vta0t1TGVDamlvTFRwV0xI?=
 =?utf-8?B?R09TY252aCtJR3JoNDV4U0dGQW9ONklBTFlNK0NNY1grYUttUTFaTGNOa09w?=
 =?utf-8?B?bzhjaEJIaC9XbkNrWi9pa0o0MDVaOXErK1R5bE5vT3dtVzVTTGJhOHh3VCt5?=
 =?utf-8?B?eG1GWXRXcXpxUWc4cGxoeWdWc2JRcnVMWXJsTGt3a3VMOFZKMEl0RkVMY3Zz?=
 =?utf-8?B?Tzh1bGs0ci9hT0l0WCszbVpZTXFOYXdaa3g1bjZOQ0tnTjdBZkh6dDJ2RGZT?=
 =?utf-8?B?cmdiMVVqc3NFcWlmSk9WZmEzdC9GUUNGeUo0Z1dVUUVPVFBNRWE5T2ljRVd0?=
 =?utf-8?B?T0hFSnRtekxBWHpLMUlscmtaTW1GOXA4UkNEQ3pVR0tIV2pDMEFBMVlRRHp5?=
 =?utf-8?B?T3BJNzdqSHdabVVFUzJGeFdYREJjQWx4WjM0NmViS2lXTmxCYVJtK1lMQ3Vl?=
 =?utf-8?B?LzVZT0JWMWZYK3AyRWZwVnpBVFJ0OHhRYnVNSzZ2K2xVeGNQWGQwR0p5bnEr?=
 =?utf-8?B?eUZ6SWx4UzlpQ2V1cUlZZ3JtdTA0UVlLbzhvb3UrdTdpV0tISEtDZ3V5QXBq?=
 =?utf-8?B?OW9tMWNUNHdlZ2tlZkl4UlVKK1FHWGJ5c2paTlpiZjFsODRZRUlZVUFGd2p5?=
 =?utf-8?B?SHRQSjU1Z0Y4cExDR2U5cXZGYno4UmFLVnhDYWhmRkQzcEFxTEQvbzk1VXNQ?=
 =?utf-8?B?cXhHOHlycnEybHhrUVRHNEFVSnpkY0k4NnJYQU1BZWpFbDdoUXNvQWxXYTlE?=
 =?utf-8?B?amJyVytubmJucHdYZXNnNWgyZnpwejVXWGFXOW1wTGpQeklDQjFoVlpibTFF?=
 =?utf-8?B?OXN4USt0RHB1dXhTQmRwcDdDLzFBbTBUQ2d1YkYyUWNMSnEyZitzb1o4U1Nx?=
 =?utf-8?B?bzlYZndNbi8vREJlYW4xcHVhbnM0ZUt3cEVnZ0NzTExFL1YzWWZaMFBZMS9a?=
 =?utf-8?B?NUtLWkpJbVpGeWwxcC9BY2JyZ2FRd1YrSjVwN2JOQjBCNS8rdEQvMWtJKzNq?=
 =?utf-8?B?NHRnRVM3V3dybTd2Q3ZLdjZwUmRlc2U0TUZwakRFVGxPNDFrY3YyaTV4citw?=
 =?utf-8?B?NUlaODgyaEFnaWVValVuVDA1OENzZG85MUo3azQ0N3o2aVdzdytvN3RLeFp4?=
 =?utf-8?B?cUt2eVJBSUY4S1piaWR3S2ttM1dMd214aHpYd0txTEVyd1J5dmluYUVVRTZW?=
 =?utf-8?B?M3hDUVh3aGRJZ0ZBM3dsN3k2Ung1TFcyL2JPZFl4Qkc0UmlsSXJabytOa2NX?=
 =?utf-8?B?RitvWitEd0I4eFllSmFVcG1TVmZRd2ZCbndBNHJyZFZpeVhhV2xIakM5ekJt?=
 =?utf-8?B?SEl6dXRzVDZQVzhLTEsxbmswS2liaWx6Uy9tS1BiS1VtaHFNd0trRC9DYnFG?=
 =?utf-8?B?Szg4OUlXZTFlaEJpNjZDVDQzUVNNQi8vaHppWDVsU05WSTlRM3pMVlgxNmhx?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XfzXPg2QoQuBWsGBiKJ9WQJk7wTKOFWhGbW9dexZOMxwy9akVc9eJepG5zNyGQA+YkBR5+ZB+GqPqWMveYGhiUS45hychxYAVRvjduPvKDeRQ8E/Y9X5jOtg5O7AVDV6sBNJ96CskS0O7xIpy8AParTbg3oVdzpfxJ/uqw2A5zTSvZ2gTeIIU8or7ibfBfK57CUJETk5WvfTCencE444QzL66bk1PgUIE3+jlK1Jgp/vP+/o5+UtuMzCpBDPpt/hUikdKvx+PcslAJzngggU/xP9HQI27oNTgmrOkAV6/emZzux0K2qzmnWqZpOzL9ufExnkAQMpXV6V24LKXZd7R01WPZGy8HhV/PTlzCZ8DQorIWV18zsbbl0Q0iQVpZN++Ly2KYS6b5k2tnRcaz1ZI54ngu7rUXy6+i8SFOTWI0fOqb2k/Fpi4P9c8b1l2cFSZm4RmOF4jabTEyAA4pmB2E0Arpaae7HdcmAZyvVQoaTw0l2beBED6FGR59DJ0frV+VPDlCqrZ4OluQsRyEmMuAHtEWggYLEdWhZ7/ph4Xs1MlSN+8x5qeIHcdmn7qkzZ15/pP85m+VynPK8VUoT1uijgEn8qbFbTkF6cISZQvXz7o8WcoMbUK8AuFXbpTj4pazbBE+xhK3JRp+eerxxkQnPxj1IolNmpI9QxD1P//SmFcR3OvffKVP4P26m+R0qnBhGz/4wIWSMvqmKidb4cwh4aTWJ2LPYmiN8plI1tl+Q/N+e91EYRDr5dVRzEeHVuP+tvFCIXi0LQ77omMokn+ijEKcQyvm6aahqmz9KUwJQntlpJicsB1ILYFjswv0wWY3qQ266cr8OOxon/Kurl3Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460b8e72-1681-4ab1-f415-08db578eb91f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 10:57:50.7338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYT8p4i95o4rVXretaqylsSG6RX65/g00YRflWnHz439cud4oxdnE9zDOP+T5dgbEJi8C5SjZlEqeAOELGZLwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959

When a domain parameter is provided to pci_get_pdev() the search
function would match against the bdf, without taking the segment into
account.

Fix this and also account for the passed segment.

Fixes: 8cf6e0738906 ('PCI: simplify (and thus correct) pci_get_pdev{,_by_domain}()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's no mention in 8cf6e0738906 that avoiding the segment check is
fine, and hence I assume it's an oversight, as it should be possible
to have devices from multiple segments assigned to the same domain.
---
 xen/drivers/passthrough/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b42acb8d7c09..07d1986d330a 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -552,7 +552,7 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
     }
     else
         list_for_each_entry ( pdev, &d->pdev_list, domain_list )
-            if ( pdev->sbdf.bdf == sbdf.bdf )
+            if ( pdev->sbdf.sbdf == sbdf.sbdf )
                 return pdev;
 
     return NULL;
-- 
2.40.0



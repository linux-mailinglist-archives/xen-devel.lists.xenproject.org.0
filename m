Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D57BB877
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613596.954237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokT1-00089T-18; Fri, 06 Oct 2023 13:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613596.954237; Fri, 06 Oct 2023 13:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokT0-00086m-UK; Fri, 06 Oct 2023 13:02:06 +0000
Received: by outflank-mailman (input) for mailman id 613596;
 Fri, 06 Oct 2023 13:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qokSy-00085i-Ja
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:02:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f0fef1-6448-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 15:02:02 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 09:01:59 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6024.namprd03.prod.outlook.com (2603:10b6:208:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 13:01:57 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 13:01:57 +0000
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
X-Inumbo-ID: 89f0fef1-6448-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696597322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=q9WWfWAkLiKL9bTKZOYna340S9McrAJSBpCBi1mBNvA=;
  b=EGHNN/PNQZP1EIkTBEySCDlo03g5Fh9FhLhKYk9HF13KF8SRgXjRDvnS
   jf/oqkYRouxP1erelI4LjVCz89aY9drPCUT2ZJpZoREcLJq4sKO9B6vSY
   aQZiPLaquJDHH7OOoiiYMb7XoovwQKfN4JkVQsxmTIhoMvNWQ4hRlFGlA
   E=;
X-CSE-ConnectionGUID: zdvHY1jERRuCuGZJFk+JRQ==
X-CSE-MsgGUID: GGINF2EgRgmDxN9CXK/EQA==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 124080232
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:e7XWda0w9Tg9/YvWa/bD5Vdwkn2cJEfYwER7XKvMYLTBsI5bpzVWz
 2IdD2vTb6rcZWD3eIh3PN/k8ksF7ZLWnd9rTFY6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRmO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE21Q1
 c1BKh03VA2oms2E4py4CctWv5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LOXzXuhA9h6+LuQ2dFLpnPJ62MpBxg6RX3qismazWOHcocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZh5MbsY38vA/QzMC3
 0WM2djuAFRHu7qQTG+b96uF6za7PyEaIHUqdSICVREC4dTovMc0lB2nZtRpHbOxj9b1MSrt2
 D3Mpy87750RkMoK2qOT7V3BxTW2qfDhVRUp7w/aWmak6AJRZ4O/YYGsr1/B4p5oM4KxXlSH+
 n8elKCjAPsmCJiMkGmHRrULFbTwvvKdamSC0RhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLIT7wJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:p+rzR6kZNHpblk8cR2G7NAyqSOfpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:lmLoHmPxBUPtRO5DSiV51H9NGO0fSGD20VjiAWG7SkRTcejA
X-Talos-MUID: =?us-ascii?q?9a23=3AfmOl4wxNm1Z5tL0Ew+rlyVIYLOyaqIuBKWYjy7g?=
 =?us-ascii?q?JgcaBGTxWahytr3Oae6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124080232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HatLaQaf9607+FPTCsxftOShzFdcrc1ouuD0TJEZ2iTwAAZKbKI56q2yu3UQG8YFzI+h1sfMfMphVdr3Px8rTAdPBE2r7EoSqShJAolHQabSHz8B+ftuTWIyAAXF0iuBJeqfLhYeOywXb1KYeGlG2jrw+fog8EOtfjCeoeM07hrWNHc7Yccxf8WMCzvIv7N7ukFnI0KaXd1I7HyIiJ5AFP+oC22dKRJ3CDKoMDQsjk9jUpND4RLNWmhLr0d2yY+VdiXGAcWpFmCmSrUYoVt9Hz3EROYa4QotlJWmI+8TgUxTF76FRuZyN15LhYdGC78POg3DLtF1mUmTiLRFRvCHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbrwg8wsku3XWRoPqMOqqdVQ5jyqnzvdDHhWtg8wd3g=;
 b=Nroz2+rygCqf8ioxstX+9Yof6InIkVKEHZ3uO43VZvS7sE5p/5Y+T7j6KNvOnTXIz19ILa5QGiFe0Kq8t8R0c0/3Hj6vrf2aBe/E8JxgJSTKanDy0oHM7lZAbYdMgQSQAX5K/m8nojCM/hhrGvxsMTZHvBMDKvb+Rtfbbs/sslhFXbfFW0amw7aKQYllAMo1rZj3aLqYeoSjkaHyL9SIbpH+Al4CEvpjg8kdUdws2DKs9O2grwOPr2ZMFRr5+q6T+c4W45aZ3gFylmH5Tgvu5S+gSNpC9JH7/+51qUhtCYySZBFe9K8NGLqHYlhi+ZQFrVBD6B3c3+sT8thN/rbQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbrwg8wsku3XWRoPqMOqqdVQ5jyqnzvdDHhWtg8wd3g=;
 b=B9XqkiQFnYj3edAP18lcuYImDjLE1w+fpsqMNXGAzY2va9HZowCvumj6bFN56jiXMBzkPN73Rh7K0rpXkV/fnwmIYv/5dHqPQsaLxKaygGs8YdjT9J02yP/aHnvUUV4B8AaYStY01G9WrrTIseP7f9lx7NWQdSf2eIhvIBCZujI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] domain: expose newly introduced hypercalls as XENFEAT
Date: Fri,  6 Oct 2023 15:00:59 +0200
Message-ID: <20231006130059.97700-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006130059.97700-1-roger.pau@citrix.com>
References: <20231006130059.97700-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0328.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::28) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 2146d73b-e0ed-42cd-12af-08dbc66c6bf9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EnCAHMxvhf00WK+y/jtXeMnQMsXXkaAD4mKaVoGRakloD9uZmoCPcM9vu2218yULl7QgHjJrv9dBPt4dkgmeeDFGnM+jikxAegnvEz21WxOpu49FNdBV+IihOAK2n6fLLVq7+0IxgRnD6dDcMB9KgvW/h7MpzmzJxaIS1V/VDitMl7rB/U6h+sif0CgqXG7WK1Z2cU7vOtqtUw7Gr7Y859wpZsFtJjQhcVi+rJ3jsKUFMVPhb54k6Dub2QZ14Y2a7kSSlXxN47f1JWqM/OREexLlQBIIvymcK45wa0vv5iFQZn9KuJMTV2EU+zMWUaYdnyHCZMxdTDzxW6n2uRdV7XGzNRelLvB1EpyzSF9++6h5ONl6AcUEfCjyP/L34tsx4ZDiXF8+kRctVDzqmPPRNv5SooVP1O9mBACjl1l8vZe2ioCYLMjpexv4cmIOW0gpb2OBAgHFWNcl/8YynrV6TcIyWv4uhWJ8OTOHM04LlUV+Y6Jsg2g+gKVRZimjYijQqrNpy5sRSos7IXRm6JXoMBa5omcjYuzByA+9UWJLHIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(83380400001)(6512007)(6506007)(478600001)(6486002)(86362001)(82960400001)(38100700002)(7416002)(2906002)(1076003)(26005)(2616005)(36756003)(316002)(66556008)(66476007)(54906003)(66946007)(5660300002)(6916009)(41300700001)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1ZtVHdUaGFoZTFlc1hlc2pSZzhQSnNJVWpveEIxcmFycnZ2S2wyZ0w2eVJE?=
 =?utf-8?B?cHQrbVdXYUcxVTBPWGw0dU51RXQzOFdDRmNiYlc0QWdLUEJFeXFaVVh2VmJn?=
 =?utf-8?B?VU1TZHp5cy9HS205a0VYZW1KaHc5K0RXMjZoUVN6aW0vb3JITDRKaE9tOVYz?=
 =?utf-8?B?THBkaXVpWFRWYnprbkNtWlVQdUNjbzJiVGFUQzF0ZHBNYy9SRmZRZXBkWnRt?=
 =?utf-8?B?ODV2eTRpcVc4VUZraXpmbmkrQS9kb2NkYUpxeUUxYW8rSHhMUUJ2R1dsc1BS?=
 =?utf-8?B?ODQ5UTBTajN2R0t0d2h6aTdHUkZ3MmdIZjNxTzhkVW15cTdXd1NYV3pocGZX?=
 =?utf-8?B?cnEzK2pJNUFXZjFvRnBYdXl3cTIyQnI5eHZNbEZKQWZqWm9acjJlOW5RNzZa?=
 =?utf-8?B?Wm9wNkRYZTlhd2RhNGcrUUw5YktQekcvV3Z4RzhIQzNnYVM5NU5DM2VPTUxJ?=
 =?utf-8?B?Vm5xeEEyVkpReG9FcXJOd1dQNzRPR0tuaWdWL2V3MU5TMU1MeEF4Q2h2VmhK?=
 =?utf-8?B?QUdhVE53RTFSNithaW8vWHNOOU8xUyt5RWdhWGRXV3gyZUcyVGpDRG5EMjRj?=
 =?utf-8?B?TU16TnB4dkdhd1NCY2R5Z3pBWitCLzBWYWNuNDBBaHRNTU9ibVhVemZWT0lL?=
 =?utf-8?B?TWdRSloreWNud2ZOMUdsMGx0TWVZZHAvOU5NTGpMQkVhZ3lzaVUyemFkRCtj?=
 =?utf-8?B?VWhMMXNUVFo0amxsSkkzSUFyTzFkNDYycUZkaDE5Uk9ueHUwNG45MFo5ckxW?=
 =?utf-8?B?VGlQRVJ4VndFaDhzenZXZjZFTWlaTDJYOWozeVdZZDM2T3VWdXNyUHI1OXRL?=
 =?utf-8?B?bUFtVm1rL1VWOGNNY0JtUW9welFGMjdtRTQ3dmlhVTBaRmwvSXpDaGpGeDlH?=
 =?utf-8?B?WnJCRFI5bVdKbEhGL21YU2p3UEdsK29WVG5KR0xtcng4eGRlUDNxMmlpclVL?=
 =?utf-8?B?WjJMSXRGLzQ0bU5LL0Rwc1dmcFNpTlQxV1lzdUYvTGdqVlV5WHlmQjhNYkVw?=
 =?utf-8?B?MElQWGRweE1tWU1TNmNCMnIzc25LbHRqai9kR2Q2cFh0aUowWkx5KysvS0ZY?=
 =?utf-8?B?bzdaR2V2KzIzZytjd2E5QUVIMWgzcGI0Ykpjblp5b1R2RnMwNno3elJTNnhP?=
 =?utf-8?B?bG42djFNdDBBOVFHbDRwcDJMbXdTZ1Zib1BnUlViYnVaS2xaVThadHgrUXV1?=
 =?utf-8?B?RjhKU3YyY0U0MlRWUFM2ejN1R2NuT2IvQXB6eERLQVVMMElwMk9sS0NWcVhK?=
 =?utf-8?B?NnUyR3NtWWh2Z0Q2UVl6YXVta21uS0dFaGpiWTdETWcrSlZVZWFORmlxZ2l3?=
 =?utf-8?B?QzZDMmJaSm9kTEh2dmE5L0k2Vk5TNVZjYjlvZkU1TWNRWTVaQ2VDblpoaDZV?=
 =?utf-8?B?cGI2NEk4dkV0TnF4V3ZlRlB4Tm56SVpuS0ZKQmdsQmU2aFl3b0lRRktkZUxI?=
 =?utf-8?B?dzVIcmk1dmZ0R1JZKzhsTnY1SkoyUU5VaWxxeDcrait4Q2lCNmM3c1V5RXpG?=
 =?utf-8?B?UXRHVDFDb2EvZFpnVWhpYnl0ZDNONFIvNkt4VzVTVEFLOXdrUnBWcWovN0lH?=
 =?utf-8?B?TEF6OVBIV0VFMHBId1V2RGw4N3Q3VFV3T1ZZWHBPaGo4R0l6US9jcUZwekUr?=
 =?utf-8?B?UDhDNU9iNEFBV2xXWnJqQitRRGcvQys0QXNQZWxEU3hQSUY4QUFmdDY2VXpq?=
 =?utf-8?B?TmRadzk5R09JQXhYZ1dPLzFoYndPUVNJekRIRElEZDhOaHA2LzJxTVFISEk4?=
 =?utf-8?B?ZEpZb2c4UDdNMXBwS1BJdXBpS2pJUnFaOEdGUVl0WndLRm9xQzdZbC9KdnFU?=
 =?utf-8?B?TkZsaDBTZkJMTG9tWE1XaUhVcHpucDNsUkt6Z0xZL1VQbi9ubk9LUlJpOGoz?=
 =?utf-8?B?OGQ4Y0pJNWNuRmVVVW50c1pQbGw1RnN1U3FVdE4zOHVWeUFWbmxWb1lTM084?=
 =?utf-8?B?NFV6Q1QxM21BY3pDVEdWRWVXYzUrZ01jUDJEc2tyVTU5N2hOSUFRNFNucGNX?=
 =?utf-8?B?ckFjL0RLZUV4T2x1c2ZFOFBQRGs2NFNoR3hBRHVReEN5Z2FlUkZKZzNDcmxK?=
 =?utf-8?B?SGZqaU5TR2JFMi82STlVNFA3QlRyejFCQlEwYnVsd1lVWGhJQzh4T2FFaTJh?=
 =?utf-8?B?SlAxQUZFVVpwUEJCdHJSVExMMkNUYWtqMmtNV0ZOUG82SjdQTGRWb2tZK1l5?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lWVx//C5v7sauqCuaLbPewzuOzw+wZsIsWPxKaCN7PjwE3uWwTFsOcluh/mqx7Dvn+/PUYifsXAiU9yf4G0BYccifQ36DCP1/X0n6UtOiNp7rInlc2dN90suEe7A6QXyalg0Qs/XIjtr0L7pJ1Hr8D5VKUsR+375YlYVhgQkqcjzLnOx4zfw1WF8r6V5P9bwvU4CRgkX2suvuB3myHzRNgKtmA5UfIj7sXaQ9nadnkO/B9QTDtjr8LE14KYUfCL2Qp9h6fx0mcV7snoIL+E4lAT9EfVtw7lwU+h0GqThItBn3crVs6+2laJAH3HkqPLbG+rFoGC+AO2WBg4gXCOwXHv/zmJypwTilpYwKI0/kkEB8VzBW/u/rDuetAT61FML5VCNXSV3tldiWK81ZvKpQ5CD+S32vuHji92+Aw4zGUByTxkkFDM5E5LhlzNyNzgc23W9BrZ0mWiXEaEhNNThqwTFABHX093wCT5bg61D/XLv0o61zLAeqot6jP/Jrmyjxw51JDTZMNQHY/5Dp81jSZNXTRvkNPyDtxcjMQceluPqow+47BQU25g/ZptAVie83oJSkqfUWL9mH20fhBjI4iuk/ZQwovErxzf0jXQs2XzxeSQSUZ/s4TnOM6bZBA8WUXar4t+5h7oeZAO48yTGovcebSH4lhmG7WV0NrqYD4ZKwX+pj7v0ZMndOxQQ7FiCIVfQpgj3TAJi7L9J+wxJEF4LZI1tPsh6bnsVIFdtM3xPmBIqlpgreTFHtnLYFwvGvZHlPnEK/AqwUT0ak13hQfvpVRP53UbY+U3sxR5ODRd77fc5nrJjQCJPYA0V91+cLXXMB45+fAB9eV4ZIbOqE2d2pSRM2TfrtxzFvHA5jErKIleKMz5zRlMvxq7HaP1NBO+nByBx4gpQzTVqRaxMf0aFPWpl8PiTMqVKEaP0py4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2146d73b-e0ed-42cd-12af-08dbc66c6bf9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 13:01:57.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j71tUMVBDrCLpoPzMPcI0apc201kAy1Zh5YBPSFKK1iDUEfM9gUUpfxGecJBjAUB6KrQqOLsWqc7rKrVjemd8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6024

XENFEAT_runstate_phys_area is exposed to all architectures, while
XENFEAT_vcpu_time_phys_area is currently only implemented for x86, and hence
the feature flag is also only exposed on x86.

Additionally add dummy guards with TODOs in the respective hypercall
implementations, to signal the intention to control the availability of those
hypercalls on a guest-by-guest basis from the toolstack.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Adjust comments, and add new one in vcpu.h
 - Add dummy guard with TDOD in hypercall implementations.
---
 CHANGELOG.md                  | 2 ++
 xen/arch/x86/domain.c         | 4 ++++
 xen/common/domain.c           | 4 ++++
 xen/common/kernel.c           | 6 +++++-
 xen/include/public/features.h | 9 +++++++++
 xen/include/public/vcpu.h     | 3 +++
 6 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index e33cf4e1b113..47ea9e275462 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -31,6 +31,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Add Intel Hardware P-States (HWP) cpufreq driver.
  - On Arm, experimental support for dynamic addition/removal of Xen device tree
    nodes using a device tree overlay binary (.dtbo).
+ - Introduce two new hypercalls to map the vCPU runstate and time areas by
+   physical rather than linear/virtual addresses.
 
 ### Removed
  - On x86, the "pku" command line option has been removed.  It has never
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8e0af2278104..8d3d52034a6d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1580,6 +1580,10 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
         struct vcpu_register_time_memory_area area;
 
+        rc = -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_vcpu_time_phys_area setting */ )
+            break;
+
         rc = -EFAULT;
         if ( copy_from_guest(&area.addr.p, arg, 1) )
             break;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 1468638ade8b..8f9ab01c0cb7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
         struct vcpu_register_runstate_memory_area area;
 
+        rc = -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
+            break;
+
         rc = -EFAULT;
         if ( copy_from_guest(&area.addr.p, arg, 1) )
             break;
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 52aa28762782..b6302e44b34e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -607,7 +607,11 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         switch ( fi.submap_idx )
         {
         case 0:
-            fi.submap = (1U << XENFEAT_memory_op_vnode_supported);
+            fi.submap = (1U << XENFEAT_memory_op_vnode_supported) |
+#ifdef CONFIG_X86
+                        (1U << XENFEAT_vcpu_time_phys_area) |
+#endif
+                        (1U << XENFEAT_runstate_phys_area);
             if ( VM_ASSIST(d, pae_extended_cr3) )
                 fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
             if ( paging_mode_translate(d) )
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index d2a9175aae67..22713a51b520 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -111,6 +111,15 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
 
+/*
+ * Signal whether the domain is permitted to use the following hypercalls:
+ *
+ * VCPUOP_register_runstate_phys_area
+ * VCPUOP_register_vcpu_time_phys_area
+ */
+#define XENFEAT_runstate_phys_area	  18
+#define XENFEAT_vcpu_time_phys_area	  19
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 8fb0bd1b6c03..03b031a3e557 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -236,6 +236,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
  * Note that the area registered via VCPUOP_register_runstate_memory_area will
  * be updated in the same manner as the one registered via virtual address PLUS
  * VMASST_TYPE_runstate_update_flag engaged by the domain.
+ *
+ * XENFEAT_{runstate,vcpu_time}_phys_area feature bits signal if the domain is
+ * permitted the usage of the hypercalls.
  */
 #define VCPUOP_register_runstate_phys_area      14
 #define VCPUOP_register_vcpu_time_phys_area     15
-- 
2.42.0



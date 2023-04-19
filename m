Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A36E77AF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523328.813292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5KG-0006ZG-Q8; Wed, 19 Apr 2023 10:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523328.813292; Wed, 19 Apr 2023 10:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5KG-0006X5-Lh; Wed, 19 Apr 2023 10:46:12 +0000
Received: by outflank-mailman (input) for mailman id 523328;
 Wed, 19 Apr 2023 10:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp5KF-00068C-CI
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:46:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6400a856-de9f-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 12:46:09 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 06:46:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6384.namprd03.prod.outlook.com (2603:10b6:510:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:46:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:46:01 +0000
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
X-Inumbo-ID: 6400a856-de9f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681901169;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sRJMMnPXqbaJlwY33BBH2w+YPuH75f9ViKa8ZhNd4VE=;
  b=RAm2SjGw2qjjbBjSPdwNf8Nu064XICNkPG7+xdMhoxB/fCAx9VQmoltI
   YASt/KbKY4BWMvEjHjghIOQwU6QLdYXkugSgXp1EzW0v1aZHaFg1+EIZ7
   3xSrUi4pFXfHveDHF/Pz15xlnNomoFW1fd6FD7g3IMkiIVJAubM8yCwdP
   I=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 104858999
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oAHBEqNana7V16XvrR2RlsFynXyQoLVcMsEvi/4bfWQNrUok1GMEz
 GBJUDuGPPqNazH2ft52Pd+28EhQ6JXdzdVnHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5wxmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uFeAH5/r
 fxAERxOQhqx2e+57ryQceY506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeOpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyrw1rKfzHKqMG4UPLuF6OBJ3Xm0+jAWFzpGfAu6j+mVoFHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBHTVytJWFRHTb8a2bxRutPQAFIGlEYjULJTbp+PHmqYA3yxjJHtBqFffvisWvQG6th
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:jXsePKAPxzJUPw7lHem/55DYdb4zR+YMi2TDtnoBKiC9Hfbzqy
 nDppkmPHzP6Ar5OktPpTnoAsDpKk80k6QY3WB7B9aftWfd11dB6OpZnO7fK/qKIVydytJg
X-Talos-CUID: 9a23:ULB9aGEs4vxo46ZhqmJg3U8LK5glKkTxj1vaERG1BkhnY4aaHAo=
X-Talos-MUID: 9a23:fPy51ASryz22fePuRXTquS98F5pMxJjyDV8qwbxWuueUGQZvbmI=
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="104858999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWk1ENDP/xHohS7ijWIOU3uU6yaXCYCG1rSCvWZj3+Ee6XV7MpuDpBES50RufscUUn5Yf30A/YvmICkSKvDuNDR5YLeBfGAFij3BoWH0MtxW7QnxTMBdgFQR73E00NNZmPCIzOxQkxyCpswqyXTsBsoHaLFRlH8GcwKnIbBYFvnNJCUqpu0N0daOCHAT1XIZxCnua9dVpywvvpwRM8XfrscA9gxKH3dm30EuBjFeHGzQYWBGQC4wzITh5f/qqaPlCYEVlB5sr5DS1uKOi6IOjmTJn0LMYU2DHVz9K1XSTaruRZwm23wcV3CZ8A/+Ivm3VaIcEw15IJSptTqhqJkmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y/7nfPu7Jt5V7w1e68TRs5UVJfBzH6kPoJ14h7ZpPU=;
 b=j4jWTPRAAKNVOgz9A86lv71wm1uNTXXVTb8HpzjkxjbMqmTTI+EqrvQN5wH9DyMGcpn0O9gazolWI25oLD7PNThVB1vohVwtFBcjLg0ngM089vC1pBjCESESZgdAoo12EU4X0HgFi4BI8QHaSZWYlz65bepK8NS7ZeD40Ol+u/LMqCSmFvM2Lny0UH/IBCUl4l4qsN5CLsrl45JzhyRbu7oL+SBjm202zsWGj8Om6jMrVAluvB7qmwSDayF/zj6gc341TgGwXg/J/sC6PxkMtPWmZEXl7SCyN+KjHex5yfzYdVDTJRxAurwzKk8onQ03hPy/0ojomAC9Ws6+l1Lnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y/7nfPu7Jt5V7w1e68TRs5UVJfBzH6kPoJ14h7ZpPU=;
 b=Tys2mAjiEVpHqQp38/Bcj9+rKMLwFLDG2jzKMVUvjJ4fN9oRjEvOH0pkboLnO3+Fw+Dg3t8Ioxm43i/fbdzAp6biZbQVup3uW4bNLOUUuc00XPmVscSqhOWJoWDbHVbUsHHLYGhzPYjX7O+314QyrlqK4Rg1rDysHoXbdyKD6sA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 12:45:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZD/GY9ru4RtfK5RU@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
 <ZD6AejXJxQxAyrx1@Air-de-Roger>
 <5e90e951-20bc-3ff5-30b3-da17cb14d260@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e90e951-20bc-3ff5-30b3-da17cb14d260@suse.com>
X-ClientProxiedBy: LO4P123CA0567.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcd88d7-3455-40b3-d9d0-08db40c3444e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E5gDOqzUk/EPmSDvMfHoEWbbSnOIR+XnQ1dmGYI4841nLz7jkvCBvEVrK5xIQ5EIvNFWt7g5U+H1YEzYjzMaZE2P2TK1oj22C/WhMNPC0c6vGJvXCCOPfQ9Y+gon+o1dgemVo04E9fZnIbwkvxSBVxfDFX5g5oYLPK6SHGcpyXwaknRrunHZIqvgET0AKvVpPg9Daotk+5TEgqB5iW7UL11wGBp0uI6VGtiteuYsftdzcElFNVjyu7Ku4jIKFv+/Sg3G3mFNrqlzYZljZfxwJ6g5Dhf3JH856PRej/A2UVaFve/yehs+xL7DgLVQ/8BD0wITw0gw4Sb9ktjV8Ryk2LcyKtv11Wnzr49iW5ObF9OUaKBZqLa8GKJZ7vuotVuQUYwTqOuzWUFbMKwExXz8hAXlPkbrNTQd/AoljzKm3XcJG1fnp6Hhoup5i+7xm/TmDZxS26Uw/I8UnpWaoWaA31I1cBxRmVcOTdVLBwKqn60j9KAyWJbp1Pzp6n+3/toJfP1p9XAoa4TH2N7Q6LbDSniRcftwq5kwq/IM7n3NYvQOe2euh9XhpDVRMIXvnBCh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(26005)(2906002)(6666004)(6512007)(9686003)(6506007)(186003)(6486002)(53546011)(4326008)(41300700001)(5660300002)(66556008)(6916009)(316002)(8676002)(8936002)(54906003)(82960400001)(478600001)(38100700002)(66946007)(33716001)(86362001)(85182001)(83380400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1hOY2x3RDUya2ZqWjV3b2JyTVlUSnlnUXQwM0lxMTMyek5sdGZhWXc5bWt6?=
 =?utf-8?B?L3lBaEJUMGMyYU5lSk9hWWhGTmxXamk3cjJMK2QwOU1hZW9XVFRTRFFTVDZJ?=
 =?utf-8?B?QmFtNnladVU5dWhxVnVMVHJ6bHk5QnRYaXVvNkJ2VndJcm5OcitXSHA3aHIv?=
 =?utf-8?B?M3UyUG5hVVRjSlRJallvdEx2SCtOOFhsN0tXem5ScDYxbWtieVlaSmxmK2pP?=
 =?utf-8?B?ZlJ3U2cxQUVUcU1GZVl4YURtR0NaUzNEejlSV0tUREppWFo3cERreER1ODA3?=
 =?utf-8?B?WGtzYnZTZmdvZUlFS1pPa050NEdOVnZRZkpkbnZBR29MWGJwRmlidVUvMUZG?=
 =?utf-8?B?QmtRWFg3NUVBQmg4R2V2ZGVLYlNteVpoZ3AzaEtxL0NxZHZhYkl2V2ZMSGhw?=
 =?utf-8?B?Tk9mNVNDbGVyOGNFYUNnVk41SnU2d3k3SEdiWEFrK2NRRTlpTjVCbWhaSFRI?=
 =?utf-8?B?SmMyT0lHSEFZMDF5Y3piNmtFaFZFY3dhS29MRW13QTFNTUdLK1lYL0RoTWJU?=
 =?utf-8?B?dkd2US9xUEo2cWV4aktrOGR1cDd6bFFaVi9ucndNbXhQaVR2TVErQW12RS9R?=
 =?utf-8?B?S3NsUHpvVkJqdEpXVEdoQk5ma3NydDNMYlJvRGYzSDJwamVidHd6alVwY1JJ?=
 =?utf-8?B?emhjTzVFR1BwTG1taEgyV2VIZzhOR05jRW9ZRXhPYW1ndDdOcTgwbzdGWWhR?=
 =?utf-8?B?MGZadjY5RnpoclJDUHFKaVlhU2hUbWFyUWZ2U2RkUnN6ZG80emdRTFE1ZnhX?=
 =?utf-8?B?VlB2NlMvTTNubnNqeElNREFQcWljSnpsZmxMeFo1bU9Ib1FVSWFlRGR4M3ds?=
 =?utf-8?B?UDlJNkpCc21sWUVrMGZCRXk0QmJKbHhjVUtLVzRFbEE1Qjg3Rm1qZEI3Y2ZI?=
 =?utf-8?B?UHRoNW5IbHgxR1daWVV4Y0VpQmpVVkhTKzB4WW5nMWRqYU1rbXhkWURqVGwv?=
 =?utf-8?B?RU9zRDR0bk03M29ESms0Z240UmNReTdVZzFBa01mYmx2dHcwYkIwWFZtS0ow?=
 =?utf-8?B?Z0toQmtNS1gzQzNicTZsc2lJeTZTU2VEZDQzdmVNTVEzai9NcWxrdm5rSGU2?=
 =?utf-8?B?ZXU5Mldlcm5Rc0UrUXhoVTljUWlBQUI4cFZIaTlnRW0wRFQ1RmFYVmZ5bUli?=
 =?utf-8?B?ZFhNcy9rN1FiamsxYTc5RnpsSlBSU0tXZGdscjFCQXA2ZjhlcHZWSVpicnJS?=
 =?utf-8?B?RW9aaDBkME9aT0ZOYzhCU1FnK3hZVmRGRFlveCtOOUlaaCt2QnN4aW11NW5U?=
 =?utf-8?B?UGtsSmN0aFY5VGViRXFzSGpSKzAxSDcrNS9DSmljekpCQzdFSU93ZUlPWThD?=
 =?utf-8?B?YXZFVVF5dVlVTWtqOUNSMEZFRzdHdTRrL0FXZzhiMVFidUJKb0hPYXVOZnZw?=
 =?utf-8?B?RzZadlZpelRqTllNbFRmOHAwTTFwMGVkKy9GS240eG8vby8raHovay9MNmFB?=
 =?utf-8?B?YWRxZWFqa1ZFYUtLT2k3VnppbjZoUFpEN1pIeDI1R3hSS05mZUpWaGt5S1dw?=
 =?utf-8?B?dDlxTVgyRUdXSEYzY0NEZTR2WGRkRytGcXlueHFic3lSWEZRQ1NzcnhsUU9G?=
 =?utf-8?B?aS9JQ2t6WkNhNXFqUHJERHpIc2pWZFRiaThTTElGeHMyUktjTHR5eG5FMUJZ?=
 =?utf-8?B?TlU0NWFGbEpXVklMZWtnODRqV0RNRlF6QmtRNEhBckFJQ21BdUJuaW9NdlRY?=
 =?utf-8?B?R2QyTGFYbW9jZ3pTdURra1NKbndKRHl2NUFFaldMcVJBNnY4aG9yb2RXWDlu?=
 =?utf-8?B?WStJZURkRndBdmR4bVcvS2RlaGJ5QzdZYXhldkN5Zk9IVDNaaWw0NStpM2VJ?=
 =?utf-8?B?d0JTeThIN1dzQzJTK09PQ1pmeXJUbGVOMWd1alozY012eXV6TGlDK0s3bEIx?=
 =?utf-8?B?V0VpazlseU5NWkFoTTZzOXM4bW1VLzJoL0g5NXR5Y3E2TXVHTnNLclcrK1RX?=
 =?utf-8?B?L0VsMjkwZW8wL21uV3gyU3JBZzZwdHRJK0pHS09qN00xR3MxbU94dXpOQmJa?=
 =?utf-8?B?TXZaMmhNbWNtRE1rZXk4MVAxM2VmVzI3ZWF6Z21MdDBPU1BGTlNPMm0yVjIv?=
 =?utf-8?B?ZWZWL2JXRVlWbDZkMGc3QnJobjhEUWZ6KzZzQjBuUkg5eVk5b3V5YjlWMDBn?=
 =?utf-8?B?all0NGRiUXM1eDJvQzZoZzczWmdWQ3VhaXBCSHBiVFF2bHBLRVpNSkZ0YXVB?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P6TH2IAFUBQuC0Qtj6tsnupGMe4mFMW6JRaw/Q024DonyyNnr4TCCJue/1zYBy3xUsKxnkNKX4wtPAUdzMtpwdN43bKE+kIF7O6emUl5zhmQzZaRrDAWf/RKcoXNJXAFJIkvEB42gScmggTYzvBn9suA0M6aKvScBX/G1EmuykigSMZCDGXkasIYPy23Tz/8vLs5wW5qfdPzl2EII8dHG/xVzpqJpsuc1URaL3efDNNYufacV3Ql/RzujoWL4Y+Ri45BT3AMTgJ1KxIibgmVb3jMfPV8E/KO3eNKSLsf28e3aq2PCCh7qX1tj72x3kChZIP6FTpKvgg2+t3vpNIOBC+WRqiVnsjZhnxxqr4C+ob4VQ1QeA7R7a2Zx6J8c50EoRfDLoNLxoFigmu8iSJ3rwgpq8Sb0mtOpOlTvVFgD6ZJt5RVuWid/6X45FcI0R7/BO3UKBCgftlvh7Cv6FZ4z9SpNuT7GhHrHcgsF9ouwlxNR+SLsrxulwNOBBop6E/qX5IxTuG2G2M34irX/0PRocYVnQeX01kJ1sZjKjuUwkwBC6QkfbCNNf1KzE+gpy/x5sOyijisclDfwpNFJtTVgqDjhs/39GRTXfQV3x+QnXL6ZhsVgXXdgJhZAb9yUbKDDS73nYXdGuk9HtQPkHtYoNy+9Z/IleAJX5SmKmjjSl/6sP/CGmCJDM8qyVzaGb7lK/MNHTglNmOjBsSD779tw87shWgHP1aizvr8DAWj2R4proVUPuTFbNAGN2MO+ALfhOQluaXn+1BwZpCbhs6cXmQiW6fLTC3V6AydXeNaQyY64Ntwos3UytmiWB08hvSMwCat2up0OqM66fkPbuLbnw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcd88d7-3455-40b3-d9d0-08db40c3444e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:46:01.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qz/oe5PfltxS/9Fg+WBB+WYdBAZtLbK0H5Lmo4j2Zp2WLCZ2wE4Z1hRg2bZ8AJalIA7287nnRMaHpFO9Ya3AiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6384

On Wed, Apr 19, 2023 at 09:56:35AM +0200, Jan Beulich wrote:
> On 18.04.2023 13:35, Roger Pau Monné wrote:
> > On Tue, Apr 18, 2023 at 11:24:19AM +0200, Jan Beulich wrote:
> >> ... in order to also intercept Dom0 accesses through the alias ports.
> >>
> >> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> >> use the CMOS RTC, because of there being none.
> >>
> >> Note that rtc_init() deliberately uses 16 as the upper loop bound,
> >> despite probe_cmos_alias() using 8: The higher bound is benign now, but
> >> would save us touching the code (or, worse, missing to touch it) in case
> >> the lower one was doubled.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/arch/x86/pv/emul-priv-op.c
> >> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >> @@ -208,7 +208,7 @@ static bool admin_io_okay(unsigned int p
> >>          return false;
> >>  
> >>      /* We also never permit direct access to the RTC/CMOS registers. */
> > 
> > Hm, it's unclear to me whether the comment above would need updating:
> > we don't allow direct access to the RTC/CMOS registers, but we allow
> > direct access to the RTC/CMOS ports if there's no device behind.
> 
> Right, but those ports then don't allow access to said registers. So
> I think the comment is fine as is.

Yes, that's why I wasn't really sure whether to comment.  The comment
is formally correct, but it might lead to confusion if one doesn't
carefully read 'RTC/CMOS registers' (vs RTC/CMOS IO ports).

Anyway, sorry for the noise.

Thanks, Roger.


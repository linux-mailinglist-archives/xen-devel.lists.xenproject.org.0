Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC247CA630
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 13:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617467.960067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLKD-0000Zq-TJ; Mon, 16 Oct 2023 10:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617467.960067; Mon, 16 Oct 2023 10:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLKD-0000XJ-QG; Mon, 16 Oct 2023 10:59:53 +0000
Received: by outflank-mailman (input) for mailman id 617467;
 Mon, 16 Oct 2023 10:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsLKC-0000XD-3l
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:59:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f703c61-6c13-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 12:59:49 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 06:59:42 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SJ2PR03MB7526.namprd03.prod.outlook.com (2603:10b6:a03:555::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 10:59:41 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 10:59:41 +0000
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
X-Inumbo-ID: 1f703c61-6c13-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697453989;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2rAwcMmJ+wrEKU79MZ+st2MhnPf/Bk377+uGYPe3MeA=;
  b=FKdXzrLgrqTuzSSi6OC0xbGfregBzVdpHgsYHngxA0ELmq72alic4nzH
   jSrIZ8gPaxc70K8W6667aFJqmnL1B/033aXOBEDm4kYjGa8KSr71sZj3b
   CbRbVbgsvw3aEOdHDUe+D9XqvervlpVYtXwMkhIaV/QOsiEGpy6L/NKiH
   c=;
X-CSE-ConnectionGUID: 0iGx+9iXSzeJUhKy7ky1wg==
X-CSE-MsgGUID: ceUMZ5i1TpyO/KyfLLaRrw==
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 124935812
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Ycamxql4VUopU0ZzjnfKEQbo5gxkJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXz3SOvrfa2qkKY9yboW290oO78fcz9M3SgJr+C5jQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5QGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aQZByBOPxGzvPC74o+7afgzhdV6M8a+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmnCdlPROTinhJsqFae+0khVRxPaUOqhr6am0Caf9tlM
 VNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rbd5g+CLnQHSjNHZ80rsIk9QjlC/
 kCNt8PkA3poqrL9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRngz
 jbPoCUgirE7ic8Qy7797V3BmyirpJXCUkgy/Aq/Y46+xgZwZYrga4n271HetK5ENNzAFgHHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGp9slePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:njOjt6yYIX1u0mOmrS2/KrPwFr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I4OrwXpVoI0m9yXcF2+gs1N6ZNWGN1VdAR7sSjrcKrQeQfxHWx6pw0r
 phbrg7KPCYNykcsS8i2njbLz/3+qjjzJyV
X-Talos-CUID: =?us-ascii?q?9a23=3AVDcBzWsBxHch98lvQ3mPlJFf6It9c1LNjybRE3S?=
 =?us-ascii?q?qBERUSJ6EFlyBobxrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ApGVfHA4vCaLz8L7LBPzpOQUcxoxj7pmLOh0MyKk?=
 =?us-ascii?q?equ7DFj1+HxOUti6oF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="124935812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkUhlcvrQVFTPK/9pkvq2HE9JfhdbjFL1m3ftXNXSMQrNm/0D30we+KWrTmctdAxVD3zRbRXX2u0gcdqPAkolS8b2hk1ZMJFf8itkTeWHG5hBsYlRlhMoV76DNc0ogjWuFPFN+52HyZ9qNmLiy/2V6nwhZvxqRVlPhburfGbEXu7kJyboKJ7VB8ixMJybonyufKdWesWIzhhtvqfhQxlwvUQ0Oa4THGWi52q+WNjzBGOwhoomUqOvLtdul/ZJpWm99tgvyQcgXl8KlZ2J/IATYHC+mH6b3rN8W81cV32pciuaEW4k8LRuGZmc37hLo40kquzVCkzdDxqxLnf2RK1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gh1Des8IlSF9yyXu7opSsAM+fjHaM6UD8nirwQDchA=;
 b=Aqb2rhl7Wj3ztt13HIBxwVszeQzJf/L+rZrr0pPfTxfGJftB1TYfKHmcmVI706zyi9qe+ON+4RCM5mEiLTKAzLOzXkeFQNifK1pTknqRzW9wUVKjKns9z5X/gCcuZ4CiskYCiaUzIqGqc7LQZkBwghVRMS+oNBSe28zHKA4xDGZQ6jYXX9OxvYN2ogEnRP8biP9GL84PQmThRUicd62UNCYzio67h9nSr0leEy9Tb1anYfrCcEw7gzBefFLwODYjCh0/nXATk1+ynwKfnlkSmelx1GiujGnHXYDQXk/ooJwqjaDbiHK/+FHqo0kPBJoyJ7DWFJEoPyO4sQGM+cgBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gh1Des8IlSF9yyXu7opSsAM+fjHaM6UD8nirwQDchA=;
 b=M6Lric8BaMnlL3aetOEBXqvYZAvKQsi+K9W8ULpjij4Uw5Mh2dwEkYWJ/G60ITde14k4YEH2vtUmfQkjC8KvpnBxkUQgah7bv+wp0Ev55vrCdVZDvUbaaWm+j8NJ4Z4ZtUO5ODKjbGpLnjUAg9+PZkltW3vS2O0/pQD46C9TWwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 12:59:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZS0Xl3UkgRibzDT1@macbook>
References: <081ae245-9d47-4cab-ad64-54b33566429c@xen.org>
 <20231004135331.83736-1-roger.pau@citrix.com>
 <66f7bf81-2bf0-cdd8-8dde-6439c4991468@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66f7bf81-2bf0-cdd8-8dde-6439c4991468@suse.com>
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SJ2PR03MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: ac01dee1-3e42-4258-83e5-08dbce36fee6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uGYlWnQZm9DHPHinNpvJLab1UyG0wV5VJvMi3KoFDKYPLcWIjJAL8wc0OWFSH4fBWAWAc2boHE43Kztd0QZOFdcYph/FEPwS3DrGfyJ6+EGMkks3iXgIYFIhIDbSwAeYG1sVfkMeTmNBvlP7nBW0fzP4E3RfQLmOxowvYlEMlN0m8bBtvzoRv4AOq5CgkkDzTPpmJE3kEYfLq9spMN7/q098puFyQ82mWZ/0qVmGtDTpAkVxVS64KydBy0PHiDSZMsLbgY8ZpyV5k7Mjh1bT2HccBGQF5dmzyAVvSdLv8mN+FW42pIMLKnBKWCi9e/OY/RpNyi/oFaKGdg+z6bJw91aGh8EH6LRaPae6HLJkh3VZAT/QpJIu2wpG1t8mIVRQp92k/KNwnWFZQhlyDsnL90ELqCkC4/oy1eGnFII5RAnTS7E5w3Zsb9pSmBUzVklYHM0EIUOcfEjgPO/7Q2/YXsRyTpnudUtK/vPRFLQWu5FGtYC1H47bxUGaEPr+Q87K2uobtmyr3LO6YQoLuYZMQbCZdLfR9ToVxG8C8hpopkZYCI/Drg9LRqRhCHKs2AD2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(9686003)(53546011)(6512007)(478600001)(6506007)(6486002)(6666004)(26005)(2906002)(8936002)(4744005)(41300700001)(33716001)(66476007)(66556008)(5660300002)(8676002)(4326008)(6916009)(54906003)(66946007)(316002)(85182001)(82960400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDc4ejZpOW5XYlFBdDFndDdaWHRacDFSTGRzMkM5QmVQeDQxdkFwV0R3Q2xv?=
 =?utf-8?B?Skt3T0NYamU4RjJKRWI3d0E2bVdRRVJpYXZMOXZqc1NXRlYyVWFkVEhvVnlt?=
 =?utf-8?B?WEZtMlFKUEtUTTdhWlkzWll6QWdqMklyMlpNandDRzhmcnN4R1lsSGpOamho?=
 =?utf-8?B?VnFFZ1hRM1R4bFEzN0pwQzQvN0crYmJTRkNHUmU4SGl6M0VYdEVkMDFBeWVD?=
 =?utf-8?B?TkZ5dTcyWUVLdDZ2S1lDNWdudW9TdG5QWmhTZFVoSkFISmMrL1phdzVhbllt?=
 =?utf-8?B?ZTg2aWZuVU5YVVBTaHBSQXIwdE01RFQ3V1lQcWNCalQzUUdzU2pWV3hjdktO?=
 =?utf-8?B?eWFBTkNOZzVvc0lNK1MyM014bkswalc5WlZySWZwNDBLMkFkWVovYlQxQTNs?=
 =?utf-8?B?RkxDWFpGKzd3SjJvbklJNUcvdnNMSTFsUEdab2tQTU1qZmVycFRzcXROSEJz?=
 =?utf-8?B?a3pjMUZIeXc1d0xmOHFzWExqTWNPMlYxeGl3UE5jM21yVW53Rm1WMHNOTmV3?=
 =?utf-8?B?b0FHaFAyeXlGKzBmTHpDeitDbVpvTE1GMGJGMEp3OVNROTYrQW82QlYwY0Vq?=
 =?utf-8?B?OEo3MWgyYk1NdlZCbVVrUE9kMXphQzBCZS80VEo4TEp1OFdiY3VsVVBvZGVp?=
 =?utf-8?B?ODZzRGRpQUYxWGpqeWpSTTZiNitKOXZmLzg0YXF3TDJJWjRHQ0hOSnZxNnFU?=
 =?utf-8?B?SldieWtRYVpuRGJXNlk0L2VKZngzRXltSjB4eGR5MFIvU3BvSjNKM015UzNP?=
 =?utf-8?B?S0VoUnVxSk0xUVhlZ0dsUGhMb1hHZGlnM0lVNkltQVJHWjV5cGJKWUM1NnhO?=
 =?utf-8?B?TGZDR1ZlWUpsR1JpY1paWkZrNllmOUsvcTNFWndTdlpObmtFVWJ1TnVrY0NU?=
 =?utf-8?B?U1J3dHpJSUZhOWxzUGpSd1JOREZqQm9yVEtZZnMzbG9McG13M0dxQmx4ZmR4?=
 =?utf-8?B?T2lXU3V3bERCL3crYVlkRG5Pdm5QVHA3Y3plc2ZqUmJXYnFlUHZQZlUxUFpJ?=
 =?utf-8?B?Q2R6QW1RRkpuVFNaOS9oVnBRMVh6TDVOOTVMd0JYVkdaSENJaVhmRTFnNFA1?=
 =?utf-8?B?TGd0Um1VZm0yQlJOa1JRQkxGdDRDeGRKZit1Z20wekxHeU5RL0R0SUJidUdY?=
 =?utf-8?B?b1hMempiUU53cVYwdnJEdjQ4Rk85Um1UZXJzbjNUWjI3bXlOV3BEakswbWJW?=
 =?utf-8?B?YmdoTHB3c0l6aWEvL0ltNzNBWTFqOEs5WmREUkRIVTRScjhsVHVMcER1dkVW?=
 =?utf-8?B?L0dhclhwRTBjL1VOcGJSTE9XaFB4T2lIRE9mVEdLNjJqNDB6UXl3SFlqV2xq?=
 =?utf-8?B?eUJFbEFNaTJueXhYZTY5eWJLVUtOZEdQWGluRUMzU05iSXBmUXM3NFhDVFhI?=
 =?utf-8?B?SFlhd2hFVE1ZNVdIWGpGeXpvUW9NUXFoNGc5UTlqcE9iaXFDUlJvY1BsYnI5?=
 =?utf-8?B?YWVySXlRQmFqSGV6blF1c2NZOENkUjRUNFh3bG5MeGloVWRtVWhtVWNZeE5G?=
 =?utf-8?B?elczekRyQTFBMXJZcktoTDV6aGJiaEVIbVVHalRYTVYxVU1WMGU3cHYxVis4?=
 =?utf-8?B?c1JBN3RwS0ZTNHRKYkd6TnV0OXF5UHJPSkx6d3F2cFhVSFVoU0FHTzBSb0pM?=
 =?utf-8?B?aVh1OFNhS3VEODBrZ3BpUFovZDhoakhlMjYyUWpocFVLSjVwZWF2ZWQrOTRS?=
 =?utf-8?B?VjJtWEdMWGdncWZ4Y3p6VThwQXc5M2xoREZZZGFpQzlRcDQ1ZDhweGYvVlk3?=
 =?utf-8?B?c1o1dzRaM3NxKytWWnNmOWVUMHR2RW9SUTlGZXBjZHJXK1drMGczeWdSNW9w?=
 =?utf-8?B?VS9TSitsL1NvSmk3UXZudlVKWnE5MzdXemx1cDc5S2NNRVVWT3RUSUQwbXdv?=
 =?utf-8?B?Z2d2RUtneE1ISXg1TytpZ0NZZEdGVXNPczFrNEd0NWNUdER0bXpNQmE5b2ov?=
 =?utf-8?B?dHFLOXlIajUwUGJsSmlPeDdybTFucVQ2ekN3Q2o2ejFSZmZRSVBoU0JTNWgr?=
 =?utf-8?B?MlRMaFZLQUQ5YXNKTjlJL0pTZUNqc3RYeFp5WFlHd09hNlFad2tNTlJFT1BS?=
 =?utf-8?B?cDBQZEFEMklaNlFGZXJmM2VkdTlOL0hHbkhocmNFNHV0TUtpL1NINjVQRm9a?=
 =?utf-8?Q?ZBVVlmJgP6jK6f3vxozPabqIZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JySQq73HFG3tt5Yr5LhrInQWY+IP2QyezIjtH+wPZW0Sj2Yn4wyuEgxmgzhLid3TQJcz8pEAdQ1fv1Xm9vGPrAnyS1NSsMZFjITEFrHzgna8VxeUn3sIVqQ3s/0al8ZlPSzrNX+03otggsaXETmc2bTofxvxD7PzBshlAyj98oPNx0k3uz5NFbrdGDByH1hKeSql482wWKhTESU2VceOf20nBmuLmp0zlgkgLBuNl9LacIm/78obusKumUZH+KwuXsR0W7v5xwWKmaQsC18tIYJDAYbGc5HjmPqMZ0GCVA3uSHvVzybeZX/wPHs/8m8att9/HR5CDakIvFmAG8VHSACXTmLjEHfiIS+vC30KYXY+xwDUSlg36kVqniMS9pMGdGR0jyzLPtD4Yc+S00bUJf9l5yqAhqU9/nNStOZZDCGwPUqnGtAFHXq2TBSWWw9MKhN8FFJsAjd71ARmeyV9oagebjZZrvFrCypgGEqfz6nh4//F4vMljGOxQKLD/gy1uU0KyV3RsGZCH9UUJ6+qVCfTSO6NqvLCJ0KINt/hcDkt3G65QNiSKbbuqi2KmlLWPycw2xuBNyGF4Ccu1wuxFq2CJT6/xGjOLKWzPISJrskrO/COqcpekDZqxCjw7sas6Q7CSYMTebj1TO6mMFycHLvxPJZShp4xAgLaO+YJK5zg+0kzhXa9xudtJ7QzhprL9vateZ1y+UUZVj9fyDBz/mvGkbdgkoR76fWOpzvAzzxbIdsKlbMid6Y0uwTC4UbIupwm4gZsc81/7ZTsKyezmuxzvB9H1VeXBhpRZSZA+H7Uve3g4tyje9vBD+4YiczWeenOyVbLFodpxwzg962zT1XwEIA9ZSvWq4Qcc+6QWiwAexD1Wu7lgCb8IIS21TeXAGhKtvjlOsWbtXg2F4hG6Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac01dee1-3e42-4258-83e5-08dbce36fee6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:59:41.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d8/exaULsiiE7qwRtLfTzIBD3WY6oD5ld5v6gTtd+bz40LK2hPBcl1HKZdGfiOTxgT5ghA/9EMEFMZ2nTWQ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7526

On Mon, Oct 16, 2023 at 11:55:25AM +0200, Jan Beulich wrote:
> On 04.10.2023 15:53, Roger Pau Monne wrote:
> > @@ -1950,7 +1978,15 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> >  
> >   state:
> >      if ( reset_state )
> > +    {
> >          rc = copy_settings(d, pd);
> > +        if ( rc == -ERESTART )
> > +            /*
> > +             * Translate to -EAGAIN, see TODO comment at top of function about
> > +             * hypercall continuations.
> > +             */
> > +            rc = -EAGAIN;
> > +    }
> 
> Are existing callers known to properly handle EAGAIN? I'm worried of the
> verbosity that was no lost here.

No idea about the callers using XENMEM_sharing_op_fork_reset, but it
did seem the best option rather than leaking -ERESTART to callers.  We
have no callers of xc_memshr_fork_reset() in the tree.

vm_event_resume() will trigger an assert if mem_sharing_fork_reset()
fails with any error code, so doesn't make much difference there if
the return is -EAGAIN or -ERESTART.

My initial proposal had -EBUSY IIRC.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD774617AE7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 11:37:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436330.690359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqXaH-0001i4-9Y; Thu, 03 Nov 2022 10:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436330.690359; Thu, 03 Nov 2022 10:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqXaH-0001fz-6Y; Thu, 03 Nov 2022 10:36:29 +0000
Received: by outflank-mailman (input) for mailman id 436330;
 Thu, 03 Nov 2022 10:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB6F=3D=citrix.com=prvs=299187ae8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqXaF-0001fo-RL
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 10:36:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d1476cb-5b63-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 11:36:26 +0100 (CET)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Nov 2022 06:36:22 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6778.namprd03.prod.outlook.com (2603:10b6:a03:40d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 10:36:20 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%5]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 10:36:20 +0000
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
X-Inumbo-ID: 5d1476cb-5b63-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667471786;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=07Y6xmf+d46i1QrVg+lGFCq4Hhz0Ac+JJLWYw9JyAUQ=;
  b=T2Z6wkM+/TDmlcXaeHGVjj5kj2mvNEoXaZV/gYLU4+PzOowFu5FXS9ej
   xyEgsTrErfIRPhBiEXRTHOBzJMY+FM3tE8m9mfduVZ76HlGRQKxFVbuvR
   dhRHw2eOaynyUbnz0JOhWEp1kQUYETbhRqaIfmqtVEx5R1rdOJF8/hggq
   U=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 84508631
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:90WwYq6RSBC53ty9eCf9lQxRtOPGchMFZxGqfqrLsTDasY5as4F+v
 mAWCziPOfyIamT1edAibo6xpkoF6J6HzdYwSQI9/C41Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKkT5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 sI7IxcrTzO6tu+5h6qyavVtqNkpBZy+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOCF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwX6jCNxJTdVU8NZBuVqsmGYPJiYwVECb/N271UDjdPVAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmtx6zO8kCmD24LZjdbbZots8pebT430
 l6Emfv5CDopt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKksijrfQ9AlF7S65vXlFDe1z
 z2UoSwWg7QIkdVNx6i95UrAgT+nut7OVAFd2+nMdmes7wc8aIv7YYWtsADf9awZdN7fSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:x+aJZ6sY051RKnQ2g3CaT9Kv7skD7NV00zEX/kB9WHVpm5Sj5q
 aTdPRy73HJYUUqKQgdcLG7Sda9qBznhPxICOUqUYtKGTOW31dAT7sSk7cKoQeQfhEWn9Q1vc
 wLHpSWSueAaWSS5vya3ODMKadC/DDxysCVbInloEtFfEVHUY8lwyBSMTajLwlKbCcuP+tIKH
 PW3Ls+m9PpQwVtUu2rQnQMQuDZp8fInpfvewQHCB4s4BSPizTA0s+GLzGImhgGXyxGxN4ZgB
 n4eiLCl9meW0bQ8G6n61Pu
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="84508631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d17MZRDXkUUIAJnJxtQZM6sj86vLZ/4utr/yK932tKModGEVLkNjsynX0g/ki3uBwOGzCOz6M2Y/4jyBp/QqbHf7/UXItGGjGNflDDSV7o/WZ/kErdsS13KfhoMGpd3vKJYheYpVgfdLptn2seTuP/DUuOxg6HGhY94Qse7biIR03f4PoMMZcj4dZmH9MfI+uYcUszJhSszaF/OgI5hbjsCYcQhHOZxQdt7jJe0Q/8VQwc4U0EbHtwB20gS0yavZi6yZkSs+KtiOWKH7HCzrVlVKu8CeBK8NBoYY65fZyNNsN2ngxtzpq0vlvB8rL3i/qr0DGKW5ZyJU6jboQeXQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOlqFFdlqkSrSuHO7CBiVu6CfT8Hc2+Tr2HU8NrDTG0=;
 b=MuAUXhJBU1m33lkhypHozFLHNnPpAa4dVj7g/vm+TAxP4nxpyHOpTJS2AnL08C2MVyO5/ZAv4SO2dI9w3H3VLFi1r41MSaawNUMNesJ9xHqpdWZV0Ev4Gv5ivR+mwNlgvKs+G9Pyad3tbDCb+vx2bVfcLyDUS43W6hS1Tytrpay9Kgzk/tnHHec6sXaz2xtmFvsmKDQfcEJHq7WTb6QEYndDMFSN8uMLEhtChzK109BzR+k2fbmoMrle0V6uexBcQDegy3qsbTO4Y67I9KzTrZnV60vd0QLR7UoeMLW085ISC+5Zoyq1g704U7MC65c7BvkrMU2ry7/+aO+B5D9aMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOlqFFdlqkSrSuHO7CBiVu6CfT8Hc2+Tr2HU8NrDTG0=;
 b=F6d0dHFIIoh+/Xdf7uqYeiykgLP4q+kmmaD2JtEXTfaY+5jUZn0tkWX6Vi4PQsu63qS10VF7IkFfMv8wb1JLS7Ui+U3ia/P93AUgjt3AiCZvveSu6+QtIumYOj4NS4S2OIFSwmOSEkxr82GkP3iaOt45QXvU2Chcg/K3Z/SlvR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 3 Nov 2022 11:36:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU
 context switch
Message-ID: <Y2OZn7GvnfMt/r0Y@Air-de-Roger>
References: <20221028114913.88921-3-roger.pau@citrix.com>
 <20221029131258.95811-1-roger.pau@citrix.com>
 <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
 <Y2KrF+0ns174JC7S@Air-de-Roger>
 <20869a2c-224e-698a-b927-96d6ad752b9a@suse.com>
 <Y2OBRg0cpVkgu1iP@Air-de-Roger>
 <37c145b3-9667-200d-c13b-912f3d9b8a0f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37c145b3-9667-200d-c13b-912f3d9b8a0f@suse.com>
X-ClientProxiedBy: LO2P265CA0430.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::34) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc42ae8-1ea5-4160-7905-08dabd873f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DijVg3qFJMbkU3hOLOM2ArpNopw44BpeAbpsGRTcXp4/Q31rJo/Pkk77KI10FVP8UxPKvSGGc+6otRxYdPjItDr5fiDWMj3+/4GjPkwcb/cJIUdEXP7tZoGhud3R6FPEcUjqM4JLaZwabOb38loZKd5ZEeUw5GnJ3movlN7Ti4Ah+OA167KEAXPOpFUKczGcIW2nxJK0tLC7lHZ4VXarW5MixCthcW5x42NJRiPtZai4qCcyziHK3hpPTIFVfoiyoFjb+HtqHqyaqKaosFICqikK4jd9EssEfGWX+mCHUySMXJJ35ARLmm2qW22CoWEFEpknK5iI4GT66R6TVybE74VGP51I8a7kLXgV2vnA53RXZXyZWkq3govntjaTHNV3iF9p+0ctFx7UhozgC3AY7ufCTq+Vh+aB5OWIlu82XVbRvl9lz/LODDtz8hnNFELqLdsW2HpHtqDsuBFFU8uIkBXU0wZVpDwRk7AicxptTSuSuAPR6I5c4N1NVZzKTvPM0lsQvGpBBIp5iJHPLPjuuVqYv/exb0V58qpQbrHbxg0N+fXH7l8JGAoZawm61Wt0Pl28IqJ3oa/S++2ut/0BplJF2EYIEUAwPeJoAZ5RXEIgt9kXgxDyYtmFYoy4dE7tnH6iQPKMmgVZw51wdSKHXrikJ9tg3Zmh5P2F3qmVOcbD+s5zjThFPTpJKL6UY0/KY46smiQpr1+1JuvhM7kjIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199015)(85182001)(6486002)(66899015)(9686003)(86362001)(5660300002)(8936002)(2906002)(38100700002)(186003)(316002)(53546011)(82960400001)(54906003)(6506007)(6512007)(6666004)(26005)(8676002)(6916009)(478600001)(66946007)(66556008)(4326008)(66476007)(33716001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjhLZ2RTM3cwOStuRzZJSDM4MGRsZ3lQLzdndDZ6dHZya3ExK2dRU1JPelNn?=
 =?utf-8?B?L253anJWNUdRRk9QQ3RJMVJQYnBOVWRucHI3M05qS25Xck5OUFlsVVFFRHJj?=
 =?utf-8?B?NHNZRlRCUWZOcFdBZ3F3d3hsU29iZ1JiZTZ4Qk1NU29QRENrMEdYNjNlM3Q4?=
 =?utf-8?B?RWZQczQ3RnRLekRYSlgzelJyWGNqRlR1WnFrZFJPNVQzWXE3MXE2UEVkaC9Z?=
 =?utf-8?B?ais4clBsOEhvSXdZUTBFU0NOR1Y2bTk1QlU4UGlTbm5SbC9sQmFrL0dnM0NW?=
 =?utf-8?B?ZU9veWhQRFAvbFU3RVlrQTl4dXFEZ1dDYk1WaU5ybDlXOHMzTjQyNUNKMTI4?=
 =?utf-8?B?aEIza0ViZDdYNi82c3VEdlg5Y09TK3NxSStmc0ZCWDZoeXZWaXNkRmEzWWJO?=
 =?utf-8?B?Y2d3blA0NUExbEFqSGQwZVh5dFBnQlJiWnFIM1lXTnoxOXFvN29nTkljaUdj?=
 =?utf-8?B?bnd4OEdyV28zR0NsZnlLRmFUTStaNS9CWWZHUWZjNlN4QjZmUzQvUllva1Nm?=
 =?utf-8?B?cU1sN0JLM09qL2tqME8vZW1hd0ROUnZFaGIrVFNHNDNuYmpkQU9SSmpkK0xx?=
 =?utf-8?B?R1h2eHVTbUprdVpKZGJ1cHVHcFBuQzl0VnFWYy9lR3ZuNmJCaE5MMGtBTWZG?=
 =?utf-8?B?TG5YL1RJU21ybk5xcGkzSWVIdXExM09IQldBRS8xUDNJcjg0N0RyRGhHM0xp?=
 =?utf-8?B?WTV3WW85aENIMFdzV2tvY29yMzRGcEdJVXEwSXRHWWtNY1NiU0ZoQmFKTEhM?=
 =?utf-8?B?SmEzK0dKWjZ5LzJ6RU9FS2U3LzVEMzJ5Nm91aXF4UUNpUjVhQUFzYjAzUHpT?=
 =?utf-8?B?UkRwanVLREo3VEs3VnhaVjJRUjlPUlZDRWNuUlpMdWlXVmU2TkNUMC9xcmE5?=
 =?utf-8?B?aG9KbExrVHNnNXJaZEpCMWphc0IrMVBieGtwYXBabUttdlA3QTVXcW55bEFn?=
 =?utf-8?B?VFh5WWM4RlNuTUx6R294Y3Q5QzlTL01HUXhNUk5jRnBRN2NRd1pjdVdyRzdy?=
 =?utf-8?B?NFppSzZxcXhvS1FRRHhmWjE2QVEzYlVzVW9uUVA3eVBESGsySXVwdklhWTFo?=
 =?utf-8?B?eVZJNXdYaXM5MXZRMmFLOU51dkY1V3Vna1BkQzkwM3AwaThPWW1KaytTek1u?=
 =?utf-8?B?QXhaV2ZlWDJGN2FJbVhIc0t2SHRSVFUwVjBEWCt0QTlNVkNnaHZmaEZEZjlR?=
 =?utf-8?B?Q0UxNmQyZmFwMk1pVTBvQnZCVE1LRG8xOEJLSVJNVDZ4VC8rZXlUUVNHRGc0?=
 =?utf-8?B?QjBjNmozOVdpeENyZHB5eEFtUFBXemJJK1hGdC9wcC82Z3c4VkNsOGREYlVs?=
 =?utf-8?B?d1RhRmV1K0V1emJTcDloS1E0SDd1SkNVcXVRdlJKeGVzMDBVaHNiSVBhYkEz?=
 =?utf-8?B?WUQyL3grRjNrSjd2QVJ2YlZ4NlE2alM2VHhndGJwRGZqODJlTy83Rzcyb3U5?=
 =?utf-8?B?RHEyTFJNb0hLZFZtNVFnRVNyQVJaMEc5NEQ1TytzNFdWcjBzVWJ6L2Z0ZzJM?=
 =?utf-8?B?WnJIcFUwUHpUWTNlcWxrb1FURzE5K0FZNnBWak1MMEpudk9FVXEvcWVFeWgz?=
 =?utf-8?B?QWhzRDl4RWZoY3ZlNHZSdVhjTnBZdlUwUDdvNTdRUVZPdm0wVVFMeit2eEZ6?=
 =?utf-8?B?WXVGQjcvSHdxcUNHeUpSc1NQYVlIc0p0cWljVFZJdjg0VXRSYk9oaWlnVnlo?=
 =?utf-8?B?TEU3SE9VVnlFTm1ldGRZTHM5WElDLzdEQnNVejM3QW1oMWZRaTh3eTFUVmZH?=
 =?utf-8?B?WVRIdHRLUGE5bjNLdTdRZjFLaDlzT0pWVkpwaGdDdzl4T2lBcXM2T05udit4?=
 =?utf-8?B?RmdPRnA3b1ByRktiYWJoaUtEalJ3MnBrV3UwRG1ndG5jVEw3NlVObGlUS0tl?=
 =?utf-8?B?YUJoZUp0cWlONXVXc242L0VHOXRKd3BhcjJhNXlDcDVQSmxyV0pyQ1Y1NGNX?=
 =?utf-8?B?ZTlOOVNVM2prbGJmcEFSSFdHdGpsa21jQVhiMTZBS0dlRlEycHYwM3drZ2lK?=
 =?utf-8?B?aUsrNDg3a3FxUFVQcmdXU3ZQYlVDUEFIN29XT3FISk5vOGRiNi9iQlIyYURq?=
 =?utf-8?B?VFc1UGtWWFhKTmxiZ0h4RU0xbTcwZGl1K1hCL0Q3WEVTUDA0aDBSWjdUZEFU?=
 =?utf-8?Q?SutNLjAt+85nochH+XeTfSgU/?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc42ae8-1ea5-4160-7905-08dabd873f38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 10:36:20.8058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikCGYHiXZa7Axjz4yD07D/eq/jXr+Dzr49AroImMPGhjH14/yaPlYUNtru2vqrm3oo9HKPTNa3NlQXfX4MD6LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6778

On Thu, Nov 03, 2022 at 10:01:49AM +0100, Jan Beulich wrote:
> On 03.11.2022 09:52, Roger Pau Monné wrote:
> > On Thu, Nov 03, 2022 at 09:09:41AM +0100, Jan Beulich wrote:
> >> On 02.11.2022 18:38, Roger Pau Monné wrote:
> >>> On Wed, Nov 02, 2022 at 12:49:17PM +0100, Jan Beulich wrote:
> >>>> On 29.10.2022 15:12, Roger Pau Monne wrote:
> >>>>> --- a/xen/arch/x86/hvm/svm/svm.c
> >>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
> >>>>> @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
> >>>>>  
> >>>>>      /* Resume use of ISTs now that the host TR is reinstated. */
> >>>>>      enable_each_ist(idt_tables[cpu]);
> >>>>> +
> >>>>> +    /*
> >>>>> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> >>>>> +     * is already cleared by svm_vmexit_spec_ctrl.
> >>>>> +     */
> >>>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> >>>>> +    {
> >>>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> >>>>> +        amd_set_ssbd(false);
> >>>>> +    }
> >>>>>  }
> >>>>
> >>>> Aren't you potentially turning off SSBD here just to ...
> >>>>
> >>>>> @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> >>>>>  
> >>>>>      if ( cpu_has_msr_tsc_aux )
> >>>>>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> >>>>> +
> >>>>> +    /* Load SSBD if set by the guest. */
> >>>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> >>>>> +    {
> >>>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> >>>>> +        amd_set_ssbd(true);
> >>>>> +    }
> >>>>>  }
> >>>>
> >>>> ... turn it on here again? IOW wouldn't switching better be isolated to
> >>>> just svm_ctxt_switch_to(), doing nothing if already in the intended mode?
> >>>
> >>> What if we switch from a HVM vCPU into a PV one?  AFAICT then
> >>> svm_ctxt_switch_to() won't get called and we would be running the PV
> >>> guest with the previous HVM domain SSBD selection.
> >>
> >> Would that be a problem? Or in other words: What is the intended behavior
> >> for PV? PV domains can control SSBD via SPEC_CTRL (only), so all we need
> >> to guarantee is that we respect their choice there.
> > 
> > If the hardware only supports non-architectural way (LS_CFG) or
> > VIRT_SPEC_CTRL to set SSBD then PV guests won't be able to change the
> > setting inherited from a previously running HVM guest. IMO it's fine
> > to run Xen code with the guest selection of SSBD, but carrying such
> > selection (ie: SSBD set) across guest context switches will be a too
> > big penalty.
> 
> Hmm, perhaps. Question then is whether to better turn it off from
> paravirt_ctxt_switch_to() (which would take care of the idle domain as
> well, if we want it off there rather than considering the idle domain
> as "Xen context"). Or, yet another option, don't use
> *_ctxt_switch_{from,to}() at all but invoke it directly from
> __context_switch().

I consider it fine to run the idle domain with the guest SSBD
selection, or else switching to/from the idle domain could cause
toggling of SSBD which is an unneeded penalty.

If there's an specific issue that needs dealing with I'm happy to
adjust, otherwise I think the proposed approach is an acceptable
compromise to avoid excessive toggling of SSBD when not using
SPEC_CTRL.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C26D8ADC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 01:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518672.805447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkC9J-0004VT-8N; Wed, 05 Apr 2023 23:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518672.805447; Wed, 05 Apr 2023 23:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkC9J-0004TE-3M; Wed, 05 Apr 2023 23:02:41 +0000
Received: by outflank-mailman (input) for mailman id 518672;
 Wed, 05 Apr 2023 23:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkC9G-0004T2-If
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 23:02:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f349e007-d405-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 01:02:35 +0200 (CEST)
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 19:02:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6224.namprd03.prod.outlook.com (2603:10b6:a03:303::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 23:02:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 23:02:29 +0000
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
X-Inumbo-ID: f349e007-d405-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680735755;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kggSEvmhTi06QG6RXgFMaSfrTmF1WUs8NNX6yajr5Kk=;
  b=FK6itah18DsoGv7nQCrxsMZedTmhXnCKqeJt3l+cKCu0DcwYtsSek7Sn
   hl5HiXOJ5CEGKO7wdIZkgFw0MmaRaPniuY+919sbARIaMb5GGxIewJpCt
   ZJVKJzPisYAoGsjuO5iZ4El5bwBpvtpGkCmFfBuZWcjp05ifp1/c5lCIE
   0=;
X-IronPort-RemoteIP: 104.47.74.40
X-IronPort-MID: 104395586
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NlpvgaPgVMcJTwjvrR1AlsFynXyQoLVcMsEvi/4bfWQNrUpx0D1Uy
 msbWGzXbPnYY2T0KI1wO4/kp0wA757cmt81Hgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gFmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rsrX3hEp
 achEykEaznY1v+5wruDVdA506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzC7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwXiqBd9CStVU8NZU3n+hmVRKGSZPD32k/vuJs1+BasJmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZDZ8Yhr9QeXiEx2
 xmCmNaBLT5ytLyYT1qN+7HSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIalg9uwFTzuz
 jSiqCklm65VncMNz7+8/13Mn3SrvJehc+IuzgDeX2bg5AUpYoegP9Cs8QKDsa4GK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGoWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:5AiwL63u4W4NBoYU04Bf+QqjBNEkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWYtN98YhsdcLO7WZVoP0myyXcd2+B4AV7IZmXbUQWTQr1f0Q==
X-IronPort-AV: E=Sophos;i="5.98,322,1673931600"; 
   d="scan'208";a="104395586"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh+YcL7tJ4/AgFonvFWWacxR03k2a22euro7a3B5DxHMrHyGszhPpCd8Z8ozehzrh5GD8FdeLF5x2zi1zFL+a77ZcwOJCHNqyPp/bnTdrebgFs6vaworcPG3G+o7rD2xK9bB1WOL4/DbisnEp3rTnlVEK3nrsjzxphFhS9i538uTwwSQcyK8ONXezQfUixkW4HqD0SG8ZirhyjlLZgqTdo48YnML2xmmGiI1vw0hma7BGJ4bjJ6uU6T9ABWH6Y9MtHbML8MmqjPxIZxErGDzoOy8FIc+m5467pvduDrGQxek6aXso2sKbD4OMtg8dH//zrdeGm24X9AMDL/Pp4ll/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjqZEF+WjGnPfuswrQ6zTxKr03umwBBR1PBsIS+Rk/I=;
 b=ERsV4lnJTQnRDh+djIj34od6yaqhA2TqsTlXI4bUjPEi8oIg8Qg++CpZkqDJmYYaRJonqP41b5+s1tR3eVhSNsY5qUzJeXjg4jqRX0akPkn+v3On7qAqYvGCVgMTZ8+OIJVLIr1Mqa//aoFc2Me++I/OeekymSHnx0K/QkvtSEXOcPN3Xk6h2h19XMBN+mutDJ2noaQR32ifjk3GvgOC3xlK3fKRqRshYrFkwzDy3vIVk1u35GhddqjRPDJAPUuFthB/keMoyahDv8ReZyi/icsyoJ2LJ7EBAmdwBY3hBFeKySNqOU7Z6W8iCU14oQDicD1AkcbNWHN4IOYEa4GxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjqZEF+WjGnPfuswrQ6zTxKr03umwBBR1PBsIS+Rk/I=;
 b=nbEvXB5dvwBhZjLux6RwGzMDUlztqWm4NyFxSdhC1my6uqq3gsLz/9kKxWretGWSs/nKK+yt6eXu/YIbo6YXDN9F+rkvYh4vURbWK5ZHU4q4bP3zry4YHZEpxpmb0zu+RSs+grbzVqw5XfdARfqAcc7Jsi9tKfb4rjeAYqlrdWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <724da9d4-2c8f-dc45-78de-5a50e87adba1@citrix.com>
Date: Thu, 6 Apr 2023 00:02:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/3] x86/platform: introduce XENPF_get_ucode_revision
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
 <20230404160655.2354-3-sergey.dyasli@citrix.com>
 <a1c16028-3f33-36bb-36cd-b1ad2664b0f9@suse.com>
In-Reply-To: <a1c16028-3f33-36bb-36cd-b1ad2664b0f9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: cb537f57-3064-4997-b1db-08db3629d45e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zhIOvNl8iQqGcbQymec4lerj+seL6/NFq85kvLgHAaEmnMFLnaZJ/Ptq9U4sAOHH7q0imXKGE/nJritr8sJwPAZjCZzLQkfakD2jJeTP7itIRaOSchFhXRMBKEzok1zdR+Xw7NvhrVMZyDT/wa3F5aOB1GPVNuvM7m6OaV71jdoCeah0Qx/LYcpokJ4FNoazY9BoF9lbfgYVkCyvtmsjohz4KdbpuvClRtoPyiChMHGD6LSpRTAwH36cHsRP9gtfzm8nI8EzLg65tlUMvjecpnVSnq+GPPqyxxWR5aLN4OMLMFzNs5N4dq+hoT/8VLj46q+NovqRSr9+wUFrwITQm1Wtg0F36WaIr0gzEh/99azn4Rb1vIVPsxJw3yePCCRwhioOTJWcIVCsY7r+UwGii1Lk+ZUT5UzU3+bDNr3fQvET6+9YCBqjJN3bYVx7hlu6OeTPyuCIwm60w29yKXWz//DE9fVMNqrPPvK/csmXY7tT3XZCtKv3I8hSkeThQ1e7iC7jekpByIhOp9eDIb9QXoPAXSAG331LhWVr9Zu6jxkQqiPYSs2ckLfshexsVzjFksDf2mz0ABegcz0d7IhBlztIcK+0BmfQGVGa7i6xMptnHkiCX98xKsBVgt5O0AQv7KcMGrwKA0IVc1po9RruNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(478600001)(54906003)(110136005)(8676002)(316002)(66476007)(6636002)(66946007)(66556008)(6666004)(4326008)(6486002)(2906002)(5660300002)(7416002)(41300700001)(82960400001)(8936002)(38100700002)(86362001)(31696002)(2616005)(6512007)(26005)(6506007)(36756003)(186003)(83380400001)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nkw1WTVzKzZvVzVJdE0xNmZhaEFNRnZaL1RFcCs4Tmx0T21idDViQTF5VE41?=
 =?utf-8?B?cjRPWWlVYjlBbFZwa1kvTTl1c0dkbzZ6OGRhUXl2dlo0YnQxWnpCOWM2NkJT?=
 =?utf-8?B?UDNtaVlHLzdlaTdRMU9ZamQ5WnJSODRyV0FWdldBTXZxQ090NVo2UjM2Z1NF?=
 =?utf-8?B?dzJiRXpWK3JEUjlpd1ZTZndYWVBxQmx1T2FVS0hZbUtja01UbTRzRG5VOGc0?=
 =?utf-8?B?cmg4VThBWkxvQ0xBU1V6bmU2TmxXeVdjUmh0K0N1RS9LODVxdlZIRk1jTld1?=
 =?utf-8?B?dDNHQ1ZKc2lQdksvOFQwb214WitJMWY5eGVpQlNRUjc5cVpNWHRVZGxuajhE?=
 =?utf-8?B?ZVVzK1QzbHp1MmtITzlLSVpBY2Vuc2l0Rms5VmFoQmlkWTBiWVdBQUd1NlNX?=
 =?utf-8?B?cHpBS0cwNXExUHlYWmlMVStxQzVaRjNWK3oxb01OYk9vVGVWSllia1MyK0dD?=
 =?utf-8?B?ZG4yRkVQTkdac2haTUlSbEdFREF6a0pGdFAvcFcwM1pZV0N6NEYzQWZxWkI5?=
 =?utf-8?B?WUNmYjVWcmI3bUhaejVaSTlTem0ybUtRSS82eGNVVUk3a2VFRWZiUmdnVkJC?=
 =?utf-8?B?SXFBL1ZJbkNKUUZCQ2wxUVN1RUh4bmRnU0hScXpFUzA5elRiT2R0WWVReGZL?=
 =?utf-8?B?NFBpRnMyZlRUSXZxU2ducTdMN1o3d0dLbmpmSC95SlpiOVVXS0tFT3NOVXBz?=
 =?utf-8?B?OVJHZDJlSjNpODVsbS9jUGZnUXQzOVVhUTYvOGJ2TnhxRnZ2VkszRnZ6MnVv?=
 =?utf-8?B?QWg5M3ZWUUFEc21rcm9xYjArQUsvVE1mNlhSdzVwMENNNUNIK2NLbE4wSnpC?=
 =?utf-8?B?RzFScTlyNkdBRkNQWm5zYWtnZEZvSmVWVWd1UXBBTG5ibm1lY3J1cHpFc0gr?=
 =?utf-8?B?SDdPRmwwU28zVldGZDBqNnZSdmJRWjJrYlRrQ3ZxcU93V0wxTS9IdE9IZFJP?=
 =?utf-8?B?bGJkSDZiQWxINnpGeXNUWWx2L0ZZVCtMMUE5UmdsZkY5c0hEK3ZoeXM5b2NS?=
 =?utf-8?B?QlZGQ1RRbjQwblRNbW94TElSYjVvU3dISkNseHdBSmRjNlppSCtQb25CU0gr?=
 =?utf-8?B?eE9YaHRpd2xyVDF0UnEvbmZGNExqbVFsUmVBQW5VZGp3TStXc0R6YnVjWisw?=
 =?utf-8?B?bDh4TURtT2RqZ3pYd0cvSHlESkIvTm5kTzlBMmJhLzBsbFRJZzZxZlkyMDE0?=
 =?utf-8?B?MUZwYkg0Yjgyb3RaL29nYUtPaVM5UmxvY2t1dGpRemxDSFRpTE1KTElzcGpw?=
 =?utf-8?B?TlBhQ0tlZSs3ZkNqVXZuVTFGUk5PSDhKZzhBNVhadmU0cWw3QkdVQW1VYUox?=
 =?utf-8?B?b2l1bFZOczlacVZSeGhxeDhZR21KYzJjR251Uy92ODlnK1VSNDlnUkNBcW5Q?=
 =?utf-8?B?SzZZRWpNU2orRUJIVWdJb0E0ZjFZTC9ENVU0WXdadjY4bno5b01nb1FUdWRD?=
 =?utf-8?B?dmFGbURYeFJ5ZDhWdUdjMnpMVnZJTkUydFk3WXRZVlg5VUhFRjd2UGtkdFNj?=
 =?utf-8?B?cmlWSnRCbzk4bHU3dDlNVGFUdVFPS3VoOFZpY21hYXk3bEVHZXZLcTZ4UURw?=
 =?utf-8?B?VzE3bkhzMS9UcnJCdUVDTmd6L1pQbE90T2VmY2pGRVg1dDdrSlg3U3gwRmZw?=
 =?utf-8?B?NmZYcmd6b3g4akI4U3M1QlBQakIrRm9JWEJ1cXlxc0FCUHhQcjh0dmJJNUU1?=
 =?utf-8?B?dHdFbk00SThqTytPMmx3RG9WUVRrRjBWUnd6d2FZN3Vsd1FwZDJqNDArNUw2?=
 =?utf-8?B?NTN2VFRUdkxPZXpYT1VtZHkrdWRMQWcvYVNwWWVnNHN4bVorM1hHQkNoLzlK?=
 =?utf-8?B?aXMvR1BKVFM5RDIzQlRldTNJdGtieVFrQjhsSEhSdXJSS09QbmEzem11b09p?=
 =?utf-8?B?SEs4R2dnMjVkdGFONWoxQjlmSFFObjJ0bENWakc4dml4RnV6eUtmS1RjdUJR?=
 =?utf-8?B?OVNFTHcrWWhYWmdzZnozVG9UV3d6Y2NpMEphV2MrTmJMQy9za1FDNlFPc2tF?=
 =?utf-8?B?d2dxYjhENnVabW5RUDBlb2RjVTZTaEV6Q0NLRnZ2ck5nRWZXRTVUa25QbG9n?=
 =?utf-8?B?VXZ1QmgweUtkQ3JFc0hHb3lSeVd1c0RVRE5MY1VHSE1mZ1FvV21iYjdIaktr?=
 =?utf-8?B?MG9ZcGJ6Ly9keXJxZnE5d1VNY3l1Yk13NXg5dGIvcUpmWnM3L2FoY0hxVjg4?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zwTcy4TTKFLSjd3IiBQ7SCC5uOR2jxyXl8rsSAIwR2mxA8+AP9h+J+8L6UqIKfydzUqs242jtNeORtj6AG+gQi/jXkOR8JEMdkUhDd84UFRaQvEUOojoPtY4IgxFet8sM4+Y7in4e6VmfiPHCHkNzLUcBJBfIQgUYoXsarNdEo4PnH489T19bmXNHYll79HoYjAL68prXIE1sMViucjynRqGAZbexhCAO70VW9ah1Mjq3Nfhj/uwCHtDE/PvFGsen5hB2cLGDK4O1yOqxTPNfOnxbGg66rPlEYhMf2EsHPUFmF3gyHBDdxOqbdoSAH/ZVZCoVfGqhiGb9rGxNnqGx9MN+3Bd97LGQDNCRZFhUKXv38u2KDLLibGKmugbTq7gBMCMMrOWEJW2/poduCg17ptb3d2r/oobZIb1H4wgHALqvepJXdrf1y/TaV3drhJoWfBTNLzOnJz5Z0+lAKmWx51cWQ+P759JEDaZ9c1NFUZOC2m5qIqM86rIXrcZVCrB+7f90bdI5JdUO5mYNOBqBsbdJnn621c1n9SAwfJb+P6/OfMJEw6tVAoycjUL1RIbiYzQtzpGCt87GnrEYyaz+7+U4Tty7NtxEQvgvg0BHLW4PAuM7kPbTP9uU5/mZ0t7AjlKfIx48oAukb+WipbqT2zgtJmp9M8jRQTsBlnjEPr/+VQcBM84hRulgCxO/pmSvOFGnBVq8GPitfyyDpZnmB806A+lD4LeGB+yUkIReXtQo8tKrQHGxfbmA7jkHxWmUEluvN5AO6Egs1jM6RxJW5W1VDctCSbj+2VlBvSg/POzZ2mayi0q3JLCEg2Zjw5Yf/ufR4d4PoWcj7MDpj8e7Udvxh+nJOTfXt7P3R280dY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb537f57-3064-4997-b1db-08db3629d45e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 23:02:29.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWk2ccMoiNjqBD2hJbdD/Xkdjs4obLRkua+HUqZh7ZvINGfQnV1Nda1DdGJXLOkREUeB09r0KU8ipNmkyaM1v4JT1m2rGLQPF2FNgtc90Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6224

On 05/04/2023 9:56 am, Jan Beulich wrote:
> On 04.04.2023 18:06, Sergey Dyasli wrote:
>> --- a/tools/libs/ctrl/xc_misc.c
>> +++ b/tools/libs/ctrl/xc_misc.c
>> @@ -243,6 +243,24 @@ int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
>>      return 0;
>>  }
>>  
>> +int xc_get_ucode_revision(xc_interface *xch,
>> +                          struct xenpf_ucode_revision *ucode_rev)
>> +{
>> +    int ret;
>> +    struct xen_platform_op op = {
>> +        .cmd = XENPF_get_ucode_revision,
>> +        .u.ucode_revision.cpu = ucode_rev->cpu,
>> +    };
>> +
>> +    ret = do_platform_op(xch, &op);
>> +    if ( ret != 0 )
>> +        return ret;
> Is there anything wrong with omitting this if() and ...
>
>> +    *ucode_rev = op.u.ucode_revision;
>> +
>> +    return 0;
> ... using "return ret" here?

Conceptually, yes.  *ucode_rev oughtn't to be written to on failure.

More importantly though, what Sergey wrote is consistent with the vast
majority of libxc, and consistency is far more important than a marginal
perf improvement which you won't be able to measure.

>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -640,6 +640,35 @@ ret_t do_platform_op(
>>      }
>>      break;
>>  
>> +    case XENPF_get_ucode_revision:
>> +    {
>> +        struct xenpf_ucode_revision *rev = &op->u.ucode_revision;
>> +
>> +        if ( !get_cpu_maps() )
>> +        {
>> +            ret = -EBUSY;
>> +            break;
>> +        }
>> +
>> +        /* TODO: make it possible to know ucode revisions for parked CPUs */
>> +        if ( (rev->cpu >= nr_cpu_ids) || !cpu_online(rev->cpu) )
>> +            ret = -ENOENT;
> While the cpu_online() check needs to be done under lock, it's kind of
> misleading for the caller to tell it to try again later when it has
> passed an out-of-range CPU number.

Honestly, I think you over-estimate the likelihood of the cpu map being
contended, and over-estimate by 100% the chances that an out-of-range
CPU is going to be passed.

~Andrew


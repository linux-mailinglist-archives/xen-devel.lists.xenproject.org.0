Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9876E68DF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 18:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522994.812705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponn5-00032i-Oa; Tue, 18 Apr 2023 16:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522994.812705; Tue, 18 Apr 2023 16:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponn5-00030N-Lc; Tue, 18 Apr 2023 16:02:47 +0000
Received: by outflank-mailman (input) for mailman id 522994;
 Tue, 18 Apr 2023 16:02:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ponn4-00030H-W2
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 16:02:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74123969-de02-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 18:02:45 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 12:02:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 16:02:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:02:35 +0000
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
X-Inumbo-ID: 74123969-de02-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681833765;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=N1krN1ooRmqcggwJyqWyLtHWJy0g0Cn4AoVgz6SsMG8=;
  b=bFSd9v/iX5NWIQzrtWJG7q53i57ED+SQ6Rpbn5IJe6R9OAI9VSGY9Zui
   wygIhz4HMXhhZwD0p+5QqTHSEo8JYnBp8poLQDQ0TtjZsBG7RgNzVlul9
   VF3MGyF6EpNXcao4OyNCV2zNnxceDP1sEFZvjQ2zGrztUSeQcT0NfXb6N
   I=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 104760151
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/pz1tKnkFhUlj60hze4WBEPo5gwFJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeDGjUaamCYmKme4p2PI3j/U4PuJHRmtRlSgA/rHxnFSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5Q+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fUaCzVdMz+Yu/qv/I2AZ+lylv0Ad9a+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee2WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHunB9xKTeDhnhJsqFy9llIeCh8ubkqij9+irmu7HMBRN
 nVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YXma87KJqzKuKG4QJGkLaiIeZRsI5cH5p4M+hQ6JScxseIa3hNDoHTD7w
 xiRsTMzwb4UiKYj1bi//F3BqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZkaFl
 GgJnY6Z9u9mMH2WvCmEQeFIELT34f+AaWTYmQQ2QMJn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqu8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:HQKxf6BlCsZT1MTlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:RQdOwGHM26UkxSrQqmJu9m0RSp0KaUHF1UvvGGK4F3ZQa+aKHAo=
X-Talos-MUID: 9a23:hihEzQgBeDx3B+g8amgwWcMpNek43amsCng2gIwondKgECk3KTmAtWHi
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="104760151"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFq17xOadN19rDjjQbxlctf06EQ3MmRjzz6SAIhOV7dtaknppqHGB3uNr3BQDdMQVm7HBRPUJiZZyhYbUJY/Kyi2uB2ajUIdabNQVgXSbkaR88SLBxtwioH0KLcZ2xl2Qd2tV5edMZzDFg/xX4nJGtYpr5/TY82rBDsAq6acSj6akhTLxQ+1fzY+raz1nlzEJu895oGcvpBpM3nmmpLZ3v1i4OgooIBwyShC4nKcALLfFJsgMp2ASrivyE4oUeAzt0mLAVF2t6ZJeAB9XFgPSKJPkxQXh8Xsx/aJ57E+V4+/s1kpFi4DoFEL20uU72fO8VoYDaLIIuTodMRcHfUW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+YHflBB5WhGYW9CALxtTnbjAYuGnnaW8Gd6ckZPrug=;
 b=POdoVM0fLNuGsuImy/DQndp2khF+PYe0dBUcEeVl2WyYwByRmeQ+f3MgSOKl0kRKG08b1VIyZ7N3Xz8HBxvzFZm4h88nBFvllyoP6bUAcLCYMKatZqmyBlUiBP1oZjx/ZF7V+HMH9wDJumTw4Y1Zn+OSRdfoId+pCyADb0g6mvrjU5INo6SagPUe+DtAQVdiSI/v2mf3jvxQAx75DtXLntzOEgo5/S6AO1mIbG2L2xJ+zIOjV1ydEncXTOVE/HBSY6BkkCacGHm21LFzxnaWQVjYzybgGOu5mQs1JIzuQlJSHwVK4ycVe6uTDfH5/0CfwKwy79GgkpJpaf61CTlrow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+YHflBB5WhGYW9CALxtTnbjAYuGnnaW8Gd6ckZPrug=;
 b=ZpDV0apxQuzGzMG7LD1qm66ghm4nlOd/j23sXMnAONCOxYvDBsjh19xV7hcqTViOnADgqhMwhbCDmpxiHuzSen1srmN3rNCdML80ezEmm9h3AXpsx+zMFfTQL+cN/Pj8Fr/5hrLaBnYSqQmpoFJq38wD0h2C9pg880zig/pR9XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Apr 2023 18:02:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Message-ID: <ZD6/Fk6S6D421AgE@Air-de-Roger>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
X-ClientProxiedBy: LO2P265CA0122.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df2920b-22c6-4a49-4c7c-08db40265374
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hg58Ffi2RWeRP6VTvTFzmzzlTtx+DbunAPjYKQAHKSRpi96VQ2zjnbnXhVhrByrrHLe53ebv4NLaKWBo8lzZKh8mQ6+TcYHcO9aQrMGfnZ8mjRBNELIl1Tb+txZn4DtTxwyFoHCywhoS+7oyRtrSbajA7IOyCQwUF9g1JQaKljMPmGfjWv47EBj0h/rDYkdzM/zGuvVBCRwTlDH7PPzIU1V+zbTBQ0VQHOPuTwCzoSHoWk/u7qDQ/vYf4Rp8AmwaRXM/zsPCCGkk7G00PclmIfOhItqk9UGNZFXlKWpIxx5GTMLEN6av/LEo+TfNTselm49Z/AnDkZd7uvF4tzCsnj3wHc++SX81lolnL2Bcek7X8nrLAglzDhJks3z1NNT2T53rf1+5948EQgim+oGcLi8qGpOGLeMV1r+YMffnMlN+znx85wr+PtGIPN3wM1hfBIa9+mkrGRHr3wRl/dBjO17LO0trQPdx5bYnd6qSJNkT7lCjKAo1ENesdRZzb36PQWB64GCF81lD0eHfgr8IfdxMK4dgfNnuohik9VKepK+l80NCXn89AORucZbFkiKJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199021)(82960400001)(6666004)(6486002)(6636002)(54906003)(2906002)(38100700002)(478600001)(83380400001)(33716001)(186003)(6506007)(6512007)(26005)(9686003)(53546011)(4326008)(5660300002)(316002)(66476007)(66946007)(66556008)(41300700001)(85182001)(86362001)(6862004)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVlaazBnSkJoT2ExSlNydXBZdUpDTFlNbWpJcWlFZksyZ1FqWDdPbXJCUUxn?=
 =?utf-8?B?UmxIcDErWEpBOS91SjQreGpHYUZXcXQrdjkrQ2UrQmhVQlhYV2JCZTFzeTRm?=
 =?utf-8?B?VUp6ZGcxR1kzNnFmdWo3U1ZYeGdCbWFaZitRUmRsZzkvajgvQ3BuMW0zYlB2?=
 =?utf-8?B?OStlSkUzdmVodElaWlpDbmRwTUxPNUVYOUxSSlE2VWpPN21tTWNidkYrN2ZN?=
 =?utf-8?B?c2c4YVZFN2hTd3FKak5aNFA5RkV6TlZDcUJhWWNSc0Q5akp2RHBXdUVmMDg0?=
 =?utf-8?B?MUNwZUNjT3NTaDVmaFl6QlZJZ0hEa1NMM0hzUzlRbitHOUNXVkpNRGsvc05U?=
 =?utf-8?B?dkF3empQcFhrMVJRcW0zYVN6c2dZZWE4dVhyRkVZNnNuNmwvcGRrMjl5UnB2?=
 =?utf-8?B?L21mRGs1UWFDUVQ1OStPUWc4WTB5ZWdZazRaSDgxbTJBWlgzekZkZGhTVTNy?=
 =?utf-8?B?MzI3T2tqYUZ5TjZmMk40REs0bWxseHR6R2pHWWVHeWluc1JxYUk1cEFKbXVO?=
 =?utf-8?B?OWJxOW1kMjREYUhCSXNGdTZsWVlBWDJ1NnpkbU1IUGFUcXRNQWVna0pjakhs?=
 =?utf-8?B?bVdZRU1Ndm5DN1FGWFowK1FrdDVncDcyU0M5OUtaZUlGRWtyZVMzZ0x3U3lY?=
 =?utf-8?B?TnI1c2tDVTFESGhIazgwTzFDSCtycVFaS0xBMFRvMHNMM2VtRWdDTGgydmxU?=
 =?utf-8?B?dkk4VmNocEcrV1ZLeTQydkFFQkhlT25LUHBDK1RERzg5eFJiaXQ2ZnN2UFlD?=
 =?utf-8?B?WVlqeTJMOFBxQmdNNlNGUTZGTmhLQzlGS3lIVDd3WXYvUnBkallIbG5tamtC?=
 =?utf-8?B?VDR4TS92NFUwcDg2bENZZXhDWWlQK3dqdG1hQjhtdXdoWXFnVkJIVjhYdjJM?=
 =?utf-8?B?QTdZZW9RTHM4RUhQeG9VVUFqNzNtZXI1MGc4dGZrRUU3Z3NhRWg4aXJRWnh3?=
 =?utf-8?B?SFBLMzJhSldPYUZmVUdHQ2VicFRPS2grWVIyQUR1NjVLbmkvQjYxRUtrcWlR?=
 =?utf-8?B?SFBXdCsrSE4wQ2JYS0t3aHRJcUl5bG4yUjIxSXE4ZlNib0NBRkYrS0JMWEFI?=
 =?utf-8?B?aW9VQWNZVHFQc1kvR3dPNDdTMmw4aUZ0dytRTXliVXRWamF5eERvWXEyNkgv?=
 =?utf-8?B?dFVxelNMcm83blpIOEsrZnQxbjF4M0w1UHl4UVVlMVdDSUtsRXpsZHc4QTFV?=
 =?utf-8?B?VjIwS3RhM3hrL09XZ1RFR0NpM2lnK0VleE0zaGpveHd6UThDbUJBa2g4Zm9J?=
 =?utf-8?B?QjAwTWhXcWZPRExjYUsvZ01idmJRKytmdGU3bXZnVERIeW04RHA4QWdUU0R0?=
 =?utf-8?B?VkQ4eDhVUVBvQk9NK0cydzNRd3JwblpYTG5XYU9ncy9uSjdJMGtmYmlIaXdk?=
 =?utf-8?B?dmtqVng0MUM2YWhmbTNHVDF6eUFvSGRjL1M5SVVrL3AvaXc1NnJGYzQ1N3o0?=
 =?utf-8?B?ZkJUZzJEaE9lQXd5TFBIQUx4QXYvcjYwejVuaEtnRStpQ2Z2amNWeTNVTXdK?=
 =?utf-8?B?a3JXckFuTE5aQ0Nxd053alJMZGN0NHUxYmNWZmNIbGFnbHQxVDdMK3BwTnZo?=
 =?utf-8?B?Y2c0T0pUWVpVSXJrd3cvRGhXNitJY21KKzhOZjl3MjA0dHBWYmJBaGp0dUpW?=
 =?utf-8?B?eXBlejZocWx5RHViY1dlWUFIS2J5RDBCa0hhT3had3pBR2wrTk1OWmVIQUhw?=
 =?utf-8?B?dC9NRzk4V3hsMzlTR2tyNUxFeVdrYktSWTFYbVNEa0ZoOGFXdnBNdmdYMWND?=
 =?utf-8?B?REo5bTY4RDRnMm8yRWZmZ1dLbGoxdDhISlF1TXJlNzNsY3Y4S2ZFaUIzUFBn?=
 =?utf-8?B?ZVJzQWRQMlhTdGpKTWZ4SGNtNk9OVEx2b2I2WlJ0L1U3RFVFYkM4OVp2Zkhp?=
 =?utf-8?B?OVhINERrWHl4WXEzSnhBWndhZHlQTUhkclZqZEJNZnU1K1RWeC9vbk9oeXR1?=
 =?utf-8?B?UU9sZWlYN0VUNzhSUVVRMUY2OXlWTG1vTFdybTkrVWZ0ZTlGY3M2alBJSHBv?=
 =?utf-8?B?R05yMzNocWxrUnlkeDh2SDdXZUtWTDhmQ0h2M1hhSzJVVEJCNEpKU0dtckhJ?=
 =?utf-8?B?RU5FeTN6OUsremhWbGxQNVFUcHA2SUY0cXEwUUNqN0xDMDBZd0ZwSkF1RDhN?=
 =?utf-8?B?dXZTamVnN21YMlpHUW5oakR2dmNDamtRZG14OGhESnBkVlpnZjFyV2RhOUxY?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cn1/mFb2oJ1bXQ0lqleNVmHMs+69yO7NMnqjRPASoflD4tL2srzYiqb96Y+mZ6omRVcBcE8L8q61iIVQD9EmnevIjIFwXFYHbghUnMnqluy1mpireGhlDNioJDyJcjEODfdGXvQJJO64JbZudnuBsvXg6i8xFlq7qD3nZ1NZK0VWPzs5ujppW3zWhrLIGxhlz9kQGhkVMrTbCdgpbghRGY6rWlFS/9e1k/x/B3f+SVybPmF9sYFsHn6Mvp6zmO/CHPtXDDHK6GFlsNR6cuYSJsIJt14he0Gej5Xd7yfAkzTM7Bz/5MfJAeXfBmkMEw6yisAl3AHrvbMT+nKnfVGKQFeBKpTA2U3lfeYOoqUoH2QQiNBQMz2cjpm3c485bEbvB+gA8bjBWgGWhzpE8vLmltPjYtUVrWusykZAwod6BMND0RM0yYQqy/XlmtDss3x7U0VVIAwl6Cl4dtPg4pNoJq/l46uTjgQ5u4/l6cHlaQAAyltc3DNOAzcBhkcIvKH1vXVwr9BFVy+9BLiJxIYd9oc9yYEOtSPkLo7w3Q5sUBq9uUfqVp1eD3gRDoOnr/JABpKBOBKJLHJ6kdn2bCmAEgI6n0w93LN69vwa9sHeTAmf9SLlBhvDXFyeBMw/U6KE7A+1hg5BYTZZsb/TRj53dnOagSAeEhSymS3f3jIGEVv7k3H4iDAohoZnfleGdv1pgeeO9k28RRJ/7z4iF0wdhOhfPeHXAarsZ6B+YDst48YzW0U+JiNlaw7zN/biiApLnmjgJR/bmd+lQvwlWf++N5XR4ViahkFUQqw3mawpFKSygWwff2RrflGt/+1D7Ja1kgQW6G9kl+c1aZtLdYHPWO1a9FtF8GewiPuQ2np3W/h6KIhch+eMMcIJR8GY3+mG8UMqjR4PkzgCuf+MvA2rsElQXcVumk87L61VXdZ4xEU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df2920b-22c6-4a49-4c7c-08db40265374
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:02:35.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RwDx6E0NyAgihiA9fqlhP16yJsYykIAjlshBu7mfNfWyre1nzzqioIqmZQ4KgDZD+bRr9Gs38sBagnIfOehjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4927

On Tue, Apr 18, 2023 at 04:54:49PM +0100, Andrew Cooper wrote:
> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
> > The addition of the flags field in the vcpu_set_singleshot_timer in
> > 505ef3ea8687 is an ABI breakage, as the size of the structure is
> > increased.
> >
> > Remove such field addition and drop the implementation of the
> > VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
> > value just inject the timer interrupt.
> >
> > Bump the Xen interface version, and keep the flags field and
> > VCPU_SSHOTTMR_future available for guests using the old interface.
> >
> > Note the removal of the field from the vcpu_set_singleshot_timer
> > struct allows removing the compat translation of the struct.
> >
> > Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> While everything said is true, this isn't the reason to to get rid of
> VCPU_SSHOTTMR_future
> 
> It 505ef3ea8687 does appear to have been an ABI break, that's
> incidental.  It dates from 2007 so whatever we have now is the de-facto
> ABI, whether we like it or not.
> 
> The reason to delete this is because it is a monumentality and entirely
> stupid idea which should have been rejected outright at the time, and
> the only guest we can find which uses it also BUG_ON()'s in response to
> -ETIME.

I agree, but didn't think it was necessary to get into debating
whether it's useful or not, since its introduction was bogus anyway.

> It can literally only be used to shoot yourself in the foot with, and
> more recent Linuxes have dropped their use of it.
> 
> The structure needs to stay it's current shape, and while it's fine to
> hide the VCPU_SSHOTTMR_future behind an interface version macro, we do
> need to say that it is explicitly ignored.

Oh, I think I've dropped the comment I had added next to
VCPU_SSHOTTMR_future that contained /* Ignored. */ (just like for the whole
flags field).

I can elaborate a bit on why VCPU_SSHOTTMR_future is not useful in the
commit log, and add that Ignored comment to the flag.

Thanks, Roger.


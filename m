Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2336D64B9D6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460893.718910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Cf-0008VZ-RH; Tue, 13 Dec 2022 16:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460893.718910; Tue, 13 Dec 2022 16:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Cf-0008Sg-OS; Tue, 13 Dec 2022 16:32:25 +0000
Received: by outflank-mailman (input) for mailman id 460893;
 Tue, 13 Dec 2022 16:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeL=4L=citrix.com=prvs=339e21e18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p58Cd-0008SV-M0
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:32:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6386d7b-7b03-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 17:32:21 +0100 (CET)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Dec 2022 11:32:12 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH0PR03MB6146.namprd03.prod.outlook.com (2603:10b6:610:d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:32:09 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:32:09 +0000
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
X-Inumbo-ID: b6386d7b-7b03-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670949141;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Rb0PVpyO6UZQphC7ePHW6gyjvHs/esSEaC34+2Mr6Eo=;
  b=BTTWTES91ggOjBYjYf8hGpyFxRBt5/BjCv111X2+J8qBPAO2XtKuAHFX
   IN8Ja06GiPqjtpFPlCSf4ebuK6z+GyWv+/jzuFJ1bCGC46g5r7MqEB5Tc
   5mscQoK3WvMZCjASQWulQcdnRmKI3E4ZGdE2rJXFCjLyxcPaOZjjjG2QN
   s=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 87683692
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cKXaDKhbnY/zPjWphRfZzpEBX161khEKZh0ujC45NGQN5FlHY01je
 htvUWqHOvuCYGXzedhxYIq18ExTv5LWyIdjSQBk+SgxEHwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gaFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ2B3cKMRGuxNiRxZS3DbhMrOBgKND0adZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS9WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzXylCNlMRefQGvhCr2yC/2grFzgvXEar/9fiuhHmYfgDA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN47sokwTD8j1
 F6MlvvoAyBitPueTnf13rSZszK0fzQUJGkqZCkYQA9D6N7myKkxhB/SStdoEIauk8b4Xzr3x
 liisywWl7gVy8kR2M2T/03Dgj+qjojESEgy/Aq/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpg
 ZQfs82X7eRLCI7XkiWIGb8JBOvxu6bDNyDAi1lyGZVn7y6q53OoYYFX5nd5OVttNcEHPzTuZ
 Sc/pD9s2XOaB1PyBYcfXm57I51CIXTIfTg9as3pUw==
IronPort-HdrOrdr: A9a23:wOtk3qGE6m4ccrnKpLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb7N5fkRt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.96,241,1665460800"; 
   d="scan'208";a="87683692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIEzDnoBAqE5SgKMItUevIebhCQ8tIA6zGupskCgXQlt8gLee9DZ/xZgoyekmq3k7g8RbLo5U53JzqYv4Xt9XpgG2fTSaTfMcpkqWqRfEYLMacoeX8ShF5jtyzs/jfqpoorfCm5aL8i3mBFydwDLzG1hzeTCIDxcCxDD1ep2bbnbVPhAbmwqzkMhTC7Vg4vSApB+HUTMK1iJ6Mrq0R4V1ww7D6+lTJ9/ekHfvTn6EGZ7MpEDqA/HIC+OpzH0DitkfKYiwjXiHSYh0hpIpXU3ADmLwEf4Tclk/uCX8nNyiwWL9f6ZYqIYL3NhgSpy3Zyxd/ydXsay0/TifcGjgqeLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig8V4x1i3sBd5WtBFvDALy6avUXFdyviSX2qFVqoJgU=;
 b=HmUvZl4MP06xPp+EyUFi8bD5lkn0fUHnZgbXVeBfWQm/4/169ZRqYuYBAX3qYPrTL7x9D+NUFgX68LGr6wjDDMkM3xUWBwFbzYN5RDGK18cLkvRacza0OXmQKnz4HpW5EdylzvpGh/9utnuxZyUVxmjQju/Y0CyHam6iFpv5jF/nd4OMZuz9LHs4lANFSc5rbkL05DL/8DBjHNDKq3sLANWE4+VcvspG6WbVViHk8L+GwEu5m68R+aO28WyEmKvYtf4G2ie9nRn48ni90Q69TsDbf2ssnRXB83uZGkAY/+8ZPPi5bl5Td4BKm+DSKSisSXTQKvCLHQBGXzkhrBh88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ig8V4x1i3sBd5WtBFvDALy6avUXFdyviSX2qFVqoJgU=;
 b=pb26ViSVwUuKUIQlKvMcf1+6NMIzMcz71RR10/zeZyMo4RTBGb6Iq32U3v40YRg2lJz7yXbund7V7/GL4IvVXDU3XhSxGfNeSO3m16Hnz8Jcyt27XBQhPfh043fuBK+WFazIzXeMi/sZz62oils6w/1oo9el+z+meibwPhwoNh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/3] x86/vmx: implement Bus Lock and VM Notify
Date: Tue, 13 Dec 2022 17:31:01 +0100
Message-Id: <20221213163104.19066-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH0PR03MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fd18c6-0f6a-4b3d-961a-08dadd2794b1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDSEa8cnC+mbctzCPk8QDgAy1uC0s3A03rK7mN3IS3kZ3z5pZTY5Yqxe0QBBCDRhthX9Ygrz94sMuJCo13CFZd2juoth4Cs0HBh20A/NLi9IgKNkTF4X70t0jwQuSWcQrqFUxyPF4Dr1K2dJO2croCTid5Wmrbi0e2pvzkEXjnIYUKGRk89L2mrSqTRvq0ixjzau31zVVyXPUNC7iVh8fRBn7YIgFk9jmAJpdfDIRebiGu3uKz0vC2+VhrBCtvcuPaRM2DZ2iL37Eujexbr20hZwhQ6mG9atNixWqCZzd5fSBY73CVONmvQw2g3ldLVIua7qqtWNJPjbtF2EwoJBbKMdn9Bgt5+qfUpo6A8gsjz0z0ZIyswIe93pknRf9wGM9eC8D+rhJxnKsmMqIB1Xm2DKvliZ3Q4akI3f1U9lonVsW7aFoMFs3Wf9td7XZ9vYef9+GiYkda1xYgVACYIXwQGfu1iKhCRgfR0itbS31dksuAwzQcKINjEIwF2T6+LRuaK0ORfB8YveJqgNRUkEx+LxbvyQvamxdaqcqSsJQQmdh9AAOS4gO8hC6ZUj6Mhwejvr73EDg5V/tdrmwQmswnP3ygp62cr7VsX5e6HHROB0VYN3ZM2H8O26skgO07YL6i7L8J/s8XUsHhUES7vnfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(86362001)(66556008)(83380400001)(7416002)(82960400001)(66476007)(54906003)(38100700002)(6916009)(316002)(8676002)(66946007)(2906002)(4744005)(1076003)(5660300002)(8936002)(26005)(2616005)(41300700001)(478600001)(186003)(6512007)(4326008)(6486002)(6666004)(6506007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlFCLzFJN0E4eUJwRm0rL0tFbE9iN0p4VGdYdTNyNmVsb0FuazhjOGROU094?=
 =?utf-8?B?M3o0UXhDMDlMZmFZTTRVa3hhN2Z6d3RITEppaWdHMjZkUncxTCtNOUNWZmFN?=
 =?utf-8?B?SjY4dDFGcTMwd2ZMN0pOcXJmd2s0c09GU0krOHFrWE9mcUJXUjhLZFZQK1ls?=
 =?utf-8?B?bmhtTzVWN0pvYktMTTNTVG9RUDQzcVdxVzgvZjZuRzdML2ZHQVc1aFZpdU1M?=
 =?utf-8?B?d2ZUUkhUMlRIR09VaVJYMGI1U2t4V09vZ2hSZ1hZWUtxTGJzNUZlSlFETExz?=
 =?utf-8?B?alF2UTBNeVVVQlJaWjEya3dybXZpL2YyVmY2emFMQlZzZEszQU1GcFoxck9t?=
 =?utf-8?B?bWl0VWtCdG9HeVk2Wm9aVkt0NWpNYXQrWklhUU5LZGF2ZC9pbzlXWFp6Qkpy?=
 =?utf-8?B?WkhXdXV3MTFVYzdkSnl4VzY1RTloRTg5UEhnWStMNEpPL0UxSStaeGNSVG5i?=
 =?utf-8?B?QnhtUUxxZ1dvYWk2OHhic1lUL3p2Sk5yMVhwOHRJazNOQ1VVU3REQ0hHT2Ev?=
 =?utf-8?B?UmNod3J0NEhRYnB5OHdSUmZDbjk5ZUs1WXFQRHoyblEwSHU5ZEpXWHpLeE1w?=
 =?utf-8?B?Y3BIYUZIMFlmaDFVVml4VVYrQ3N2VkV6S2x5eHVBck1aUDNSM3gvSkoveHFY?=
 =?utf-8?B?Rm1Ua0Y5OCtOZFU1VTNIQUxOZ3hoZ1ZXY3oxYjRiTTJkTW5OdXFNQ05zVEg1?=
 =?utf-8?B?dWxwWTBmODl3ejd5UXRkaU9mYm0xSS9uR2N4c2hqWHd5QmZBcDk2U1h2aTdX?=
 =?utf-8?B?WmxWYkZQWWdSSCttZG16aUVjVlgzNEMyK1plblM4UWxqU094RFpkT2RxM003?=
 =?utf-8?B?UU1EWVArd005RzhHcHlHREZaTDlFaHcyeEVmNUhpWHUrY1RhWHVZZnRjRE9u?=
 =?utf-8?B?QmpnUzIzRXNLdk5seWVuTllNaktyZXcxdlBUeVVialExejVXYjVmNld2QS9k?=
 =?utf-8?B?MEFZZWFOU3FDWTNkTTIvOUYyYVdSUDhNY0hqU1RHZFp3QTVtYXc4NTdDckJs?=
 =?utf-8?B?MjJpOFNiKzNJNVhOTGs4ZGxJUkgycStleVBGbU9TZFZ2OHYrZjRvQmp6U2dV?=
 =?utf-8?B?MlJtWUlRZmIvSnBxRi9JZEZ5YmRhN0lyRnZxY1ZOS25VQVZDN05mN1RQdEFE?=
 =?utf-8?B?djJReHlPQ1dVckdGWEdHM2V4cWo3S3J1VWFUeDZjZnU1Vkx1OC9CUlFzaDQw?=
 =?utf-8?B?cTA0STY2QVhuMzlkbDhoeDR6dDRrQmlZdEFaeldHMFF0VlJqYTVrcjYraHRD?=
 =?utf-8?B?b2ovSjJlVVdrSDhWalhDd3JsTXlXNVp0R3RVOXIvSWtEMDdENXBvVnZuOGdY?=
 =?utf-8?B?VGhxeWVoUXpMeERKckRRZzNOVXB5Q21GUFpYOHFIeDFMUHM4UnBxaDY4NHJj?=
 =?utf-8?B?M2U1MFcwbDVXUVpvd2pUVmhwOFhYR3BvV1RIKzJVVXZDNXFMNUpwQitaa2dB?=
 =?utf-8?B?dXY2ZUt1a091UW1Ta0ZEaFNibnNCVTlqblN3a1BJbWVOM0I4N0wvRHN1V28v?=
 =?utf-8?B?UGhQMVRkQ3pEQnRmMUxXU24zb3FHbTg0SzBHOXlHRk9sWWt2VmJMcUY2QmJR?=
 =?utf-8?B?d0x2eG5NRS9Gdm5KNXhQV0VnVW1adE52cEZFYjBwZE1ZNkVXemlvWE1xLzJV?=
 =?utf-8?B?TXJ2VnEvcGd1SHZ0Zjg1NzFMVm1QZS9zeTNtRVU5b1BOcndBL2Q2NTQxNTdz?=
 =?utf-8?B?WUNHT1pmajc1ZmkvUHRra1pvbE0wSnFFQU02UStWblRFKzFVRCs5ODZXWWVa?=
 =?utf-8?B?dU84K1daTkpiWkk0MmJMVXM0dEs1eFU3Zm1MZjRjRW5kZXVKaCttZDJndmkx?=
 =?utf-8?B?eDhQcndleE1WMEIzb2JWSXd0RytPU3dyT3drck4zbmhMeG5TbXY0VDdmd0dl?=
 =?utf-8?B?aVdhdFpLRVlpcnVnaDBJNExWb2NCN29wRCt6ME03VWxsR2Z1Z2hxSDhqWXMw?=
 =?utf-8?B?SVY1WnVwekZpdFRzcjRFK1ZBbzVvVjVhV2FXWVhneW1ZQ3ByNHFiT1ZQVyt0?=
 =?utf-8?B?OVNsMDFlN1hpbE1NclVNdzF3VHVxYVFQYTduYm5LUzRvaVNrb0cwMHlRRUx0?=
 =?utf-8?B?QlJaZXJIWFBoZDZvTzZ3bUkrYmRYczQvbmRkUzJmdWNPVGpnOEgvdk9hTVBt?=
 =?utf-8?Q?JxIz7ph4tiE8z5OpsCqQw4coh?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fd18c6-0f6a-4b3d-961a-08dadd2794b1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 16:32:09.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmofeYxfLhCAY3/vuyjSBqvAIsEjm0kgpg0kDdw028BTfogMYMV+1dP6KCQcT220yGrEgyt/bvAOxpxfG42b1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6146

Hello,

Following series implements support for bus lock and notify VM exit.

Patches are not really dependent, but I've developed them together by
virtue of both features being in Intel Instructions Set Extensions PR
Chapter 9.

Thanks, Roger.

Roger Pau Monne (3):
  x86/vmx: implement VMExit based guest Bus Lock detection
  x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
  x86/vmx: implement Notify VM Exit

 docs/misc/xen-command-line.pandoc       | 11 ++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 21 ++++++-
 xen/arch/x86/hvm/vmx/vmx.c              | 75 ++++++++++++++++++++++---
 xen/arch/x86/hvm/vmx/vvmx.c             |  4 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  7 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 11 ++++
 xen/arch/x86/include/asm/perfc_defn.h   |  5 +-
 7 files changed, 122 insertions(+), 12 deletions(-)

-- 
2.39.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667474EA5A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561670.878181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cY-0006NR-TL; Tue, 11 Jul 2023 09:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561670.878181; Tue, 11 Jul 2023 09:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9cY-0006KO-Oz; Tue, 11 Jul 2023 09:25:22 +0000
Received: by outflank-mailman (input) for mailman id 561670;
 Tue, 11 Jul 2023 09:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJ9cX-0005tR-4D
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:25:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9930b5e-1fcc-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 11:25:19 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 05:25:13 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7465.namprd03.prod.outlook.com (2603:10b6:806:39d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:25:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:25:11 +0000
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
X-Inumbo-ID: d9930b5e-1fcc-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689067519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zcBQQHuX69ZClb6ynraVcgSiCzPG8VCSbHtg2XmHXBM=;
  b=UVCW8ESbpVxrUPQvxtMFVAG30+U0zuxnISB4qpN4HPZyMhIfOXLcaNza
   +aCI1dQnVbTHMsGpQVH8GfsKZ5RfRKhD3s/n5ir1V9g78GrDAVwlaotCW
   28eDa7QGdnU6SMJXlLUVtFhZaMtcJHJm3Caeh8qCyKEIp89NKFcSZIMAt
   0=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 118383217
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q5fHUqrrbsD6+qZYj579XtTjZAVeBmI8ZBIvgKrLsJaIsI4StFCzt
 garIBnVPPreNmPzeo1za4u+oE4O6MPTyoViQVY5+ywxH3kSoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBziBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB0rUi2hgMmv/LGYVsR33soIEZf7GrpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWOEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtCT+3jrKc16LGV7lRNORw5CmH4msGWqGu+XNMPK
 Q852SV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A79y9pog210jLVow6T/XzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:y/H3N6NsVOvdT8BcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AUeHprGgErCFVQs3SnRrSqHzDLTJuX1vh8VXXCFa?=
 =?us-ascii?q?ECkV1ZabNR3StprNCqp87?=
X-Talos-MUID: 9a23:hv29Hgbiag4ElOBTj2HdhR49DoRT24uMLUAKkMUE+OSnOnkl
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="118383217"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9je+inFL8aJOQP1MpEy2u8Nulzg2ND7kkchoNN5ipebuf0nsrNqUWsYhWe6bajWTEoQ8s7X7SZ5G1hIJ4wK5+B3YLhahIf1+KhlOmhV9/Jb+GS9L/Hiu7H5MqTW3OK3eBEXXvmvXdaOXz3EoA6+PqQEVMHhm38Hd9MBYxZLLRzh/MKQjvFDA0xw4rdetVlVhIZDry+vHjz99fu5QgcrLsmyBJRZ+BjkA3gKtAk2hPeeB9IZQZAFgW+skx0zorfItoSHQV9Zo8bvkBJ5vUResYUHbodVHWXHGFhw5sByC1x4Z1PuCkXUKA5jFm5DG+yajvvceASPUZQYWl/Xro4www==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uHuVNwA5xpYjOyrRWFL+DwpVoS0En8vtpwS2o709gg=;
 b=BH4W3RvOsH3yoJlC6r1zDDrqUt3uZ8ltUeSw3uB6hPVAvL41hki+pw3y07nHz2Jegbd5ZamZZyFOTUAq7Spk6fPIy7n1paqibw/zBkX2s4AD57yJ2Z86Y5nyP/Mi/3uZFNZTzVEFq55n/2H0KyuZhRf7MYGctQvpsugsDU2uDIruBjVRMwWB6kXMerI+8bZueIY0Qmkg2TCBCT9SmkvWuUzus28+MzvGit3vCccBP+KIQfCFGE1Ms3su8EoBfG7nV/e5d8iI68dM4ILwpMAuswQU05JUeeYKjUYTOQb+MgZf+mdfAcXniwMt568tfZDsHf8oYSoY5IoEUpsxtd3q3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uHuVNwA5xpYjOyrRWFL+DwpVoS0En8vtpwS2o709gg=;
 b=HsNWrxQv6ABUDYI3neD1u7SwfvL48Q+PRWvxUmivNAnxfqLRgZ1W9H7nELRSawsj99WI94QPnKa7KFegYGn3VDlchroCL0WiHiDLBXg/dbDxve6OCz/b9bgTqIbPzq1Rx21BGmFu0LHH5ky6Ao5IWwkYtiRIyuIgQ/JrmBv1Ang=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 6/6] libxl: add support for parsing MSR features
Date: Tue, 11 Jul 2023 11:22:30 +0200
Message-ID: <20230711092230.15408-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711092230.15408-1-roger.pau@citrix.com>
References: <20230711092230.15408-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::27) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4bfbb4-e930-4c7a-4de7-08db81f0b9e2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+vFeM/qHTEkffKKEdmWTh8k1WVMoumP7dsf34LxaHCpWKMAK/RxPEDRmlsjmoRMyGW1JKsUcjFAKxIY3LRZMvfm152N8tNsfNnsP4NcpR0CKaFiz6aARvL8j6IPbz9W/E1yvKIcg/3YymCktX6J5RWY7nNxxXHgbXKFtkJSLwBqjGFuGu/Y4+CTs6AtWBvvFSUhXV7yncoyL1c9ZbbwM7gwQxRouvsiN1rZjs8fbjS1Ct7puONpci9G75qdIQtAjvH+38KXfiLgXa/js/uweB/cF5GJphzKepyMK1wyFZvIXGyR4YnRrZ4leQSTCD/cKRufGcQPKa6n0USld84DtVJQ+2HBCoSOCwgBqjePlJDBG04nNGZKmpJTcAKfKxhTmEDo/lmd+9y/nVkqowE+/TzUZOl+YoPEFKnLUtpmDoJr+1jBY6GP85VyYKMihfYXOL4MNDjCwHyNjwYIx2G8q1fayBNBItTqORSLjsex8yPXtnIQCYaqoSCU0mhacC+b3fSJvHPD73JaQ2HIuy1bHgwdwkgSj2KU49Rz9xzopF81BBujNB8r2kiZ/e6rjVAo5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(38100700002)(86362001)(36756003)(6666004)(6486002)(54906003)(82960400001)(2616005)(26005)(1076003)(186003)(6506007)(6512007)(478600001)(316002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(8676002)(2906002)(83380400001)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjJmd0NMTHJmVUg2RHRERTFzT1F0ZjBJbGhRdnhZVHAwUXQrWm5sWHBOQlEz?=
 =?utf-8?B?ZGdVeXdabHBUSUZYOEdjbStodmZKQkF2SGM0QkdHcTdCWnNjcC9FYlYrd3l5?=
 =?utf-8?B?M0JYSTVpVDFNRTBCTWJnd3p0RVd4czlRbVRUNkxuWUpXQ1M5TmhQaEVwbXg1?=
 =?utf-8?B?NnFEUHA1RG10VlV5bi96YTVuWWpyTy9oN2N0b2sxRGVjNVRGOFgxejJMejBh?=
 =?utf-8?B?MUp3Tm1IYnVWVUo0dHUreitPNjlTeDJIcjZuQ1FobGJMNzZOcXhXTWNURGhu?=
 =?utf-8?B?SEh4clptVGR3YStaMk1NWWxNT2szWFZjbUw2dUIrQ3hna2x5YjlSQ3VKZWJX?=
 =?utf-8?B?VnZxaWErTVJMWmNNSkw4c3h6R3RjRWtYRjlKaSt3WWplUVdOUFkrUUlITVpv?=
 =?utf-8?B?N0VBbHJjdWdJRXpRTm5qWGVxWDFYYTRXaVdYOSttZmx2S21wa0VtNXdhM2hs?=
 =?utf-8?B?TEJlZnNJUEVJVkFhTzZEd2MrR3RJV3hoclZudkF2UExlQ2VDa0szdGdybEhD?=
 =?utf-8?B?U2RSUHZ1QjVkRTJGdzJmajE0a1pEc3VENytrN0l6UXpCYXdOOFBnQ29OME9n?=
 =?utf-8?B?bk11dVdtL2tuV0h3OWtXZzd5VDI5MWNsdDU5b092N2c5S1NhMDRSVUVMM3NB?=
 =?utf-8?B?M2JzbmZmTjlyQzFiL0NTRkcrTURXVitOT2FxQmVlSkxLTVRsblhydmtJS25n?=
 =?utf-8?B?OVA3UzJiM0NxbGt4UXh2dWxSb1dYTEI5ek1SdVN1SWMwK1h3Wm1pYWVSbUhr?=
 =?utf-8?B?eko1ZCtMZXBZRnkxTUc1cmFjalpjWk1qTG9SaGtIWDJRdlo3RWFMYnhHclNG?=
 =?utf-8?B?TEE2NHRXQ1owN0Z4dXF0ODc3ckw0QlRMM29NS1l1bVhtRTJNMWRUTFM0MVow?=
 =?utf-8?B?RlF2c1JxU1B2RktORlI2NGw0YzFCNHJLa0VISlh6RUNXV0JIVW12SjhBOXAr?=
 =?utf-8?B?VHU1c0JVSjkwNkdRZTM5VTArRmRNbExLdW9sSzM4ZE1aMWhmV2xsOFNnVkx0?=
 =?utf-8?B?YnhKekREbW1xTlExNjdBOVFSRUh5QWxGb0FDSGIreFh1VFl3a0dTbEVHcWxa?=
 =?utf-8?B?aVA2cjhQbUFIT0RaT1BCc2g5YnV1Y0xUNmFqcUxRcEpoRGVBK0xwOEhXUi80?=
 =?utf-8?B?WVdEQnJ5NFloZnNiakk3YTNaRkJBYmpJMDZwZHl0K2Jhd0RxYlpCTW9RczRz?=
 =?utf-8?B?T0N1Yzh6bzNIdy9UbjBxZy9Wa0tCMk8xZG5kZGJEd25QNkIxYzN4Q1V1N2hH?=
 =?utf-8?B?N3NZWVlDY3hlanV6ZjRzUXRRbzNaWVRISmIrNW9sWHZLTG1uVVBLQThmTzVm?=
 =?utf-8?B?bUNEZ2RwNEk0NDZabWpLQ2dTa0FjaC9JU3RYMkZuNVErZFZTcWpXaWJ1aTZG?=
 =?utf-8?B?VWdidXE3eGJTZXJRT09aUVVXVXgyN0F3ZzZEcnlHQXgxTWtzMFdJVmliWnhS?=
 =?utf-8?B?cjRzZGRLNlBjOHVsV21pc3YvYXBzcHVzNytJQjVxNitUaVNKRlRucXVXZC8w?=
 =?utf-8?B?QUZMZytlcWxqK3l3SklKdVhQNkNncnpTeVE4RnhrcHo5VnJZQ2g1L052eHN0?=
 =?utf-8?B?QUxDVmg5MzdMbElDY3ZIRFVlOExmRDVpTzlSQTI0bDdjOFBxL2lHR2g4cmtO?=
 =?utf-8?B?d1cwZlFqTHIwK1hHcjc3bUU4YTljUlE0cCtNeGpleTZoOXZ1MFNwRDlTdW1l?=
 =?utf-8?B?cEU0V0RWRGZSRFplMktvMzF2VjlZcnF4ZXZKMVhtUlRzakh2VEtKdWxRcjFh?=
 =?utf-8?B?dWZCVlBublNXd2xVVEhKQ2xjNGZQUStRQklBRkUxVnJBODNSRkUvVkNXK0Jq?=
 =?utf-8?B?OXVybHl2dVZpV3IrMzUxQy9sYllqTVk2K3ViSmVUaW1VZmxvMURDL0l0eFNN?=
 =?utf-8?B?djFVVEk1eXNWQlJVRDEvck1mdnlUY0phaWMwdEJQc3ZEMmUwMW9leFlCUk83?=
 =?utf-8?B?U0xwU0lyVGtvREd0R0FoQUpvUU9lQWRUNUMvOGE5NENoMWVXaVVJcTByMW9t?=
 =?utf-8?B?U0JiSThHUEdWUDdueEI0SWk4cE9penE2SGhOZ0hrZXRzeEYwbmFwQ3Q0WWR6?=
 =?utf-8?B?d1o2aHFNaWhmSGUxZkNGTlpyYjJ1SUZrSFl1ZjVlREJQSmQ4MUZ6VFdaVmhG?=
 =?utf-8?B?SEFaM0w1dXJvZHozK3dvdUNic0JvZVV1YW5VVWpBQ2dabWtoZm91SUFpQVRJ?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZnKW7byNavBYXyO8aXct7QgM201v7V5HD0ry2uR9sObgRADxuZXulCl/GF91SMGk8oPpbmW9iWW8d9JAs59iaG7CaVtuPevcZqy2FoWQ/7shsdJpFTQsLrX9ecHqfEgFhejKGYBDKfgmFuADeqNnSqryeVu6twatzm3VRybHRnfynmk5GC5esfhpGmkIb21YIA2LVrWu03moH6vRvbGI2T0YOsdL9SgYyL2EIRC9r9IW1YQ3EvNDQP+3r9UqUEAS7ai5/m5bLHdv6qINREWI4PMK0yJZiz7CAis7mFkK/I+kF5bk/K05lHiAbhXDy2hzE5IFd15nCxFZywhP+LTqMFDOzcxRX4HMb/9KpXG1g8AjdZb7RdBwjNUUKhRYuMwcWVK3PgMOygZpMXhjKEAg0YSWxN13VgdFSxTiKJkPNJDV/ls45g2pSj2AlPiVrwzkjCIqgYKA9Zr6R/0V+dUM/cCN4dO3+w6ofTpZqGzBGqDqATujEDxKx6w1wh9mxPj34FFSU/7d3g4vfEmCPMAV2fhM4N1WxMJermOCHYTnt6ARH118gwq30vgrMKE8jkqZ2SvI3VR+5+X/8i6zajKHK1+yV8nhliX8tVplXbKVVUDznTpIBce17st+hY+8l6ZCPqD8HTYFuTZBmEtXqPOqDLCPZ2NTCyb58WA1mEc5Zv8LqZu4mi/0gHL78EJJqNRl1TkIjBo/DojERSHRxuwswISy0Zur+G+2JTByEa3puOgKUWtgqH/xZ+NBepJeKrAUtyFCwru3CbVJggshLAvypLSkIg+094xAkBmeQgVeQL2sCOicXYL5hIStlKGeaFbk
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4bfbb4-e930-4c7a-4de7-08db81f0b9e2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:25:11.6152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 963P+Oblz+m//J6WELeVkKneosEKZCyPiIfnF8tAnJ5IFdukcoUl0ODEi9LT3i7FYBkwcPT3PMONFN9Y6v1KQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7465

Introduce support for handling MSR features in
libxl_cpuid_parse_config().  The MSR policies are added to the
libxl_cpuid_policy like the CPUID one, which gets passed to
xc_cpuid_apply_policy().

This allows existing users of libxl to provide MSR related features as
key=value pairs to libxl_cpuid_parse_config() without requiring the
usage of a different API.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_cpuid.c | 61 +++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index b1c4f8f2f45b..86a08f29a19c 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -158,6 +158,57 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
     return 0;
 }
 
+static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t index)
+{
+    unsigned int i = 0;
+    libxl_cpuid_policy_list policy = *pl;
+
+    if (policy == NULL)
+        policy = *pl = calloc(1, sizeof(*policy));
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
+static int msr_add(libxl_cpuid_policy_list *policy, uint32_t index, unsigned int bit,
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
@@ -337,7 +388,15 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
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
2.41.0



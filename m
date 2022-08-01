Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE8586D53
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 16:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378924.612224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIWox-000078-6s; Mon, 01 Aug 2022 14:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378924.612224; Mon, 01 Aug 2022 14:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIWox-000052-27; Mon, 01 Aug 2022 14:55:03 +0000
Received: by outflank-mailman (input) for mailman id 378924;
 Mon, 01 Aug 2022 14:55:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIWov-00004w-S0
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 14:55:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaaf7cf0-11a9-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 16:55:00 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Mon, 1 Aug
 2022 14:54:59 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 14:54:59 +0000
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
X-Inumbo-ID: eaaf7cf0-11a9-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvVmJQ5yTwAeB5xczC3dBu0a4nM6AOAu+pb3rNc7Y4KAqJN2QJrLQ6xubyoKso3tPoUMdmiI2b1ULM9SN3Y1n4pIYtc5p/mAbM4fjtWmkBRPuOuyrGknGq1N0fZESXbVAbCEbpb23xtdwrbhEcW47n3Go+8v6d1l7sG6DXJcK5ZsAUpVpcSXxjLaAcr4Qj5v2ZuA5WNbvmIuHShVGIxEwC28Ha5fOUxNQjsPxQwIqnyyQsqoBPuTpFFXtNPPGNm+eoEUJ+iVlIdXCtv0k7EtVJ4LjXev0DoH5+pIpm6qxk0+nLYfwF+EmZbZZL/sj7dgdSUOTVq7xBIOOYsAqb+pKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qadgjDDaoPjckW3Yk+8L5p2Pq7NGdumoHePsZbmzN7Q=;
 b=GWUlmjXOkx21fRIKu8NgpS1FoT77HNU/8rd0OOn7ZzPnVg1MeAU5rown+r6vW0+pUWxVU+HHqv8S2Nhe1ts7xmOTacpR9ZjpVjQ0QGbxjisNnHt0oHcM9wBfH390Sy5bBO9Ks/Bbf1MwC/hdXcOZFYrOvEPedBfp0e5hv+ueARfdhQZCeLqHaogcQh8W6zMgmLscsHYyMUP54MPeVq6sHimH6BOh8UARs01zyI60HZK3mVbLtG2olF7XvCBYI8zjCn5KI8UQK1QIdJcbcrUNK6PjdY788idVcV26tw8semZY8eDRrJnMTNpqJE2b7P8biVfajBlk7WZNeVKoT33Tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qadgjDDaoPjckW3Yk+8L5p2Pq7NGdumoHePsZbmzN7Q=;
 b=kHx1P2J/tgifUH/yuG5oUUoo0uh9sAO8y6AHCQrYguCxyR/LR0GwCIQGJSkegXMJeYyDHmscy67P92cWsXoEooofIWzfp3WJLMiKdDqAHH+JTXkhBMGkXgSvyfWWULtDNVxUmRYczpH+ylEKZDjUQU6JOSKJlHwU2WQFQ8k77SKgqxwF3gYKnSgGnnNNt1YdzoB/0Jx5V48oDRm58F1zJ+gntq7UFCviXWHxxZQnTnkRuAaJNFxfo3ASARyuDLAhijsqeIEAJldzdwT2PC7TALitMyYBf1oka0/AQU5+YC9ZPxxtDn3w0269QzZI9T2QdBzezQWpEOCZGHxjdsF8wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b5ab7dd-d38a-835e-947e-67e1be263cf3@suse.com>
Date: Mon, 1 Aug 2022 16:54:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: qemu's deprecated -soundhw option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 705f2ec4-9dad-4812-9b96-08da73cdce0b
X-MS-TrafficTypeDiagnostic: AS1PR04MB9261:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QNstGMIhL1WxPXtecAP1sAxyz6LdsqbF/eB7ueRHs1G/H3O5dTb8G0mqHdl7/u5Gl7fRKjwtSiUq98FDphz0NpbotqYODPmZKhfjiiffm+07F3L/eRHDw9Zz796LSDuCQtMi5q3P8f1Ww5XHOOxj1dwgbEVTo2vnKovp9j+LRqNWAhjwW6+FPSq8SEaZpmZMSOqcTO8BvzRvUMWffLISIY5r5WgxiBnS042NhXhgbdPVpAELGJLFqHDKdNrPbT/BT1/EmV35RpuHWGvjau4ybkAHiCk6CvDIZuDzCBYrwMX+lLUtjvULgbptvFUknjruUZHRJ2DTqUDrzUj3zNXZSFD795HlMGxF5VeShxzIhLrnZJK4WzqwFOundFqE9OgeSVB1XV0FiP+6PqBjI/PXUeXEqbSp/Loo/YI2+e5YqKkxeN/jO1zRmoHjq8hAdjP9g8w+L+lhw/hv2IMFAWdmQnvpHhuzahCBfe3gVb9A5WjI1BwLLNiN74CezLHUpA2QeojQ8DXO+N5hYwC5hNQ7ggPH0tVFon5derJjt4WwzRDO5rBterSXxJMrzQNL/S5eMX2e2RaK0XF84NpN9x2/80jDmSDLxHZglXZLWb07yCP8OOoXbDRvgLi59ykPs+++6o5uycKCV4Ef0vSGhbKEjZHCsXvCIVShpM4skrZAot30VWa84zb+hQ8OVgLhjV8cRKUU5ymmTHt3ewUW51GsT0n6T/sxbwpcxinKtlErdHqBSFumJTyRDGUG2B6ID1lwT0ceAKq8PDlNCXdfiqh4n5v83LnjeJ5qZOPc3bl9jkuEBsTvjXgnlQkqcPK9sUi7uwsqKQqY0vZR96zRC3hwdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(366004)(39860400002)(136003)(4326008)(8676002)(66556008)(186003)(66946007)(66476007)(26005)(6512007)(41300700001)(31696002)(86362001)(2616005)(6486002)(478600001)(4744005)(5660300002)(6916009)(54906003)(6506007)(2906002)(38100700002)(8936002)(36756003)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVd1ZzRXNVFOWmNOeGljMlJiOXpyeDBJUlgvb0JhWElIc29OcmIzNU96T3lo?=
 =?utf-8?B?aTlkc3lCaVE3YU4vR3FuQTZjUkhmUVR3ZHgwRkJ6dHByS1FBQ0p3eFBCYmgx?=
 =?utf-8?B?aVFpQnZhNFI4QVBveFJmSUZrck9TdFZIUUFNQldRMHFaU0dWQlpGUmtKT3VU?=
 =?utf-8?B?ZWJZdE9TRG9kMWE0djc1QklHWTNyQ2Z0dlZPTWYyVDF0V0JxVXhyTk9sWWQ2?=
 =?utf-8?B?L2FEYmtvVlZlMEU2VWhVanVINFVveVBMOHR3WXV0eGZrR3o1eElNUEV5MWJJ?=
 =?utf-8?B?Z01hZHpOWHdqdDZCYWtlcUl5Z0ZzclJzem84cHRkMGlmZTZLaFllT1JWNmM0?=
 =?utf-8?B?dlZGVkpCT2pHUkJBUHZlQkZOK3dCU1p3MGIzbWQ2WWpmWUNMUmtiRWxReTNI?=
 =?utf-8?B?SmZLbVBJdUxsc3NDY3diUUk1N1ZSckZ3WERtQndodDIvalF4WHlWRXpDQzNa?=
 =?utf-8?B?K1JUd2F2MHlidWtodjRZaWJpbml2ZzNvVzNISjU1eTdMU0tCeVVEYVFzM2hE?=
 =?utf-8?B?MkpSTFYxNjJzZmhuKzBuTFZxTU5vNVhsbU12ck80YzFKMlNwNjEzR3RvTVdk?=
 =?utf-8?B?L0JpMUhLVFVnbVFlbDRVT0l3T0FCbExuaHF1TkRIc3hQWXJSS2tsWHVwZjgx?=
 =?utf-8?B?NVV5MUs0SU1DVjgxenladGJtRWU5RmJtWXhiWnVqL0dWbFdWVlFBb1NrTFk4?=
 =?utf-8?B?UUFVU3pLSVgySTBFNnYxZnBvZzJKelhCK0NFQ3JFZGFIemRXNWxwa2wrWHQv?=
 =?utf-8?B?YllTZGl3dUgraExYMlBlOW5yQUFIRUdOVXRhNS9MUzE0QnlmVTVMZXZVd2Jv?=
 =?utf-8?B?eENEMnpUc1JGdDVFL012UzlxTnJEM21iRTZUWnJWSm01K0FhYmJMbFZkY0pR?=
 =?utf-8?B?ODJKK2hMZklDbEpCWGhkNDFTM3FDYWt0UWRJRC9hL3YrMHpGbG56VFdqcERI?=
 =?utf-8?B?VERNRzRQZVl2dkgzT3BBdzNMYU5vNUpzdUpnWTF2aGk2NkJZdFNPR3dhNVQ5?=
 =?utf-8?B?bzBMdTM4cFVyZ3g2MGE4VGk0bGJMY0l2ZXdRVklLUk5rQ3BtbE5yeVR0dWR1?=
 =?utf-8?B?T0o3VU1iSjFQNU95a1NpWXVRdkJyQ25kZkpmUHZJS1gxcFFGNGNIbFlYSEVG?=
 =?utf-8?B?V1l1VXFhTkhGbUJ6aHNJS0tBU3RRdGNsdTZLTTNFUjJBaG9pM1FOSDBKQk5i?=
 =?utf-8?B?c2NvaTFLMnVYRmVZb1hQU3MxM2NQUE5paWNFd1VyUjJkSXhkNUd0dkE0aTQ4?=
 =?utf-8?B?dnF4VnkxaXZTSlJ6eTNISDR5aXVFK0htU0didEUwUkRjaXhab1QxZGJTVTRP?=
 =?utf-8?B?dHZpeFIrMnM2ZUdMSGx1NmtxUDN1aFdQZEtIZDNlUGtxMFZ3KzA0WjdPanU1?=
 =?utf-8?B?dDJDdndLYnZDaDk3YTBTaUlhYjhrY1loZFRmNWJ2c1h6TlV0VnpHM2ljTUdt?=
 =?utf-8?B?aTlIbm5xWHIweFFmMzlhRUNjQkl3NURXN1lPWGJMemk4alc1cG1vZHhld1c0?=
 =?utf-8?B?bDduYkZUQ1ZuN2pMNklEWmJ4a0NSUUNsR2c3QmtyZG5MSVlzMlh4TmhIS01a?=
 =?utf-8?B?ZGh3aW9CdlF5K1MrV3ZXeUlMSFVDS25OeHo1RHJBUTdtQm9zVjZhUGhEQUdY?=
 =?utf-8?B?aEhDRW1qQ29rQ0JkTVFSdnJLL1dGSmYzclpqdjNaUWRONng4Y2tkWnBWVHpS?=
 =?utf-8?B?TFFKUll4RXVCVTJwNFg3Z2o0elVkZ25PSGIzSWZCaTJtSGgzYUJidjJuM25E?=
 =?utf-8?B?VFh3cnJGaDU3ek1YRHV5cSt3bnI4bGhNTTM4alRIWkw4RTYrWTVESWwwQ1FV?=
 =?utf-8?B?QlF3THVaaVRNU1hLVm9lNDVJNk5odU1iS1ZSTXNrU0U1VS8xWHREemVlYzVw?=
 =?utf-8?B?Uk85RVRCeStwVXNGalpIbnN6VXhDVVlDUndVaHk3ZmptVEIrVWNjVTlqOFND?=
 =?utf-8?B?c0c2U2JnenYzUUdaM3NzcjhEdWY0anpaQUlyOUNCUjNUWnNXdW0wenJuTkxx?=
 =?utf-8?B?eUVHZmxrQWN3NmVGYVg5MXE3SmhMTHM2U1dmQ3QxbTNWTjZNWFpxWVJSQTRN?=
 =?utf-8?B?d0dtZ1MyZ3MxbGQ5R1hwYTNEMnAvVCtrOVgzU0xYQURra0lzVG9DRExQdElu?=
 =?utf-8?Q?yJvbS+ZdxDKEOBP7QexJUOivj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705f2ec4-9dad-4812-9b96-08da73cdce0b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 14:54:59.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJduNK8oOriEC4snDsDKs89hFe93mUeIqQcTWBI4wK/fJuxpFIuOF/dX6i3f3H1zwPTaXOfHw9J7RA1DtP9ZcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261

Hello,

a user was making us aware in a bug report that qemu's -soundhw command
line option is deprecated (and apparently going to be gone in the next
version), replaced by some form of -device. libxl_dm.c does not appear
to know of this yet, so I wonder if this isn't something that will want
addressing for 4.17 (and then likely also backporting). Clearly I don't
feel capable myself of making such an adjustment, first and foremost
since I have no clue how to know which variant a given qemu binary is
supporting.

Thanks, Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C4B16E90
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065139.1430482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPXY-0008Cq-81; Thu, 31 Jul 2025 09:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065139.1430482; Thu, 31 Jul 2025 09:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPXY-0008A4-4z; Thu, 31 Jul 2025 09:25:32 +0000
Received: by outflank-mailman (input) for mailman id 1065139;
 Thu, 31 Jul 2025 09:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPXX-00089y-2r
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:25:31 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cbfffad-6df0-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:25:29 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9197.eurprd03.prod.outlook.com (2603:10a6:10:471::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 09:25:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:25:27 +0000
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
X-Inumbo-ID: 4cbfffad-6df0-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXHb8j20KrbE2pOIB7mDk3RI7elDK9zywCMlhOOA4Oh8j/AvoFyFrs7xqnaKuZkEFSCbbLTsJdp1GKTgacv8nH3fvsqAAnTXL9kXqO8Cl4zHVigs68P290W1JJsgbxtFdR7voC5C/XfHxWjK1ZzHJbXNtqli+WOEFy0UAj+ryFdaP+GQlsWKCmTNhxVl3+bWkDAGzuKcRvCNOmcsNthpklsBfE72o3Q2XMlvg7F2rXAG2OOBF4oOEXTGoM9S/ma6A8vTB9yQc5IrGJi7J5nJ2lMh4lXyAeD5/FWxFvtQRWoSpukyKUZgdlGI6UIHegWluI/fnwYCIOWwVq/9FnERAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geAGLi3Tc2wYaE/CQVlj8pBxL0paoW1uMoDN/Q+7UHY=;
 b=k1PaBhU2IJI4nGxaz0NJwLn5+Hg6gTw7oCQf7EIiZERwJ26sJ2qHFvIVbhJxJPeKaDMWZhVIctXNGSnWuvkvUhrDguNwPdE46/VvcqI/qaSepE686Dd7KQ45UaGBxCSCNBITWnVtP7nOrgY2Jof7pSxSfg1Y3J2rBA0i6EKmf3kzH0n/Ig6cwCfllSQ9kwb/r6Oa/gJTHWAZ2EDJsHtQF5uHdjXH41amzm2VfsSzJGL3LhzqNQlyO//S9SttwvhG0876kFKi1rl5y5/HU2qJzptxqLDMHtdLc4GJH9CRF99AzedxxKDhcsvP8QgpRCB8PY5zNn762L77cLUZ7O02aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geAGLi3Tc2wYaE/CQVlj8pBxL0paoW1uMoDN/Q+7UHY=;
 b=M9O/bXmLPOoy/gp8pVbwvdHkEytzeFWH8ojLbhVqLE3SKR+IqzM6bRCchnOPLVbGLGyy+6IbP28t26zwmbp1zq+0TX3SRQgNBZJFkKAgAtel+3LQ/rBg+BIIFO07dSQ3UMLLDY4muH24130dsoHYPbVt2gQHqlXOGTs74ohRoZbjJ20JQRNl10lh15Qu+SdiG04FOM7k/geoC46JcxQJY+TxsAG3rDSq9W/9xNOnjf9RI8G9JU2Mv2ANxJv5KXXRIjN55YkmlD0O4O7LDlXIEEHY3bE97eSb1D0snoQSM2gymvO0JDbkcspSOHY4gew/DYnc7QZ4ybpPbDCq55VZ/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2d4fb9fc-7fa4-4dcc-b68f-d067793d5c30@epam.com>
Date: Thu, 31 Jul 2025 12:25:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250718101149.3107110-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e90b2a-afdd-4543-56a1-08ddd0142fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk9zd09NeTlkZlpnb1FVWDJhSHROaEwyN3hRdWs5MjlGT3UrQmFYajFZb3lX?=
 =?utf-8?B?RzlCdThqSWpYVytjWHdybjA1V1ZkeTVrYWR2blA1K085a2FBNFE0c0ZvMHZV?=
 =?utf-8?B?QTFwZExkWGxUN0hJZ1lITUtmWmE0Q0hjMUVSc0VXcjFBSnB4aERjck9IY1o2?=
 =?utf-8?B?YzBwRXBaeUw4Q0VwTytycFZRc25iVGM3T0FLMGlYcEJsUmxpMk1WcTFrRm1i?=
 =?utf-8?B?dVF0eXN0Y20xMHR5SVdHZU9kYUY4aDBmcjcxVWprZHl5Z0Mxa0p4dUhsNHk0?=
 =?utf-8?B?dkM0aFV4WHNqcDFSUjFyQWFuZGYrd3VLZ0ZJVXZxZTNxUXdoTnZINXdHVUV2?=
 =?utf-8?B?Q1ZDUnlTM2JFSlZlVU15LzQxaVZxSm1tTHgyUzk5YnlIc0hjOTJoOFpLQ1lO?=
 =?utf-8?B?RjRmc3cySnNZZnNSV1pGeWpneXhHSHJhQnFoUUF5VVZSekZlQ25xamYreHB5?=
 =?utf-8?B?cDZDRm9PSFVZUDYyR0FFRmw2OW56V3JDaVI5dkFKcmhFZHFYSXg0aEpLd2JE?=
 =?utf-8?B?LzhHamEvMUhIOWJiM3E2TzNKbjh4WmhIcHNKWUNERTJmZ3hzSXo1RmdWTVVz?=
 =?utf-8?B?OHYxeCttWkpJbVV4dmgxdUY1T1lzV1M3dS9kNDR4eTJjMGF3RVUzSGY1M05a?=
 =?utf-8?B?Nm9ReUk5T3VCWGNVNWY4N3VEWndZOXBKSXlUNDZ2Q3BPaHpPUUFSVUFabnZG?=
 =?utf-8?B?YTlpSUM5UHQ0U3duOENSWVFkbUhDUUpnRVdJZTZFWmE4TXJqUUJxVEJTczh0?=
 =?utf-8?B?emxxUnhmUHc0T0hDZjgwVDB1U2JocHJxZUo4a1F3YldJSnVtLzhwWEdtVk1E?=
 =?utf-8?B?L3FGTEtsYklWY242a1JQRWwzMElwaEh5Tmp6bThBOGlrZFE0NXNCeEExUzdo?=
 =?utf-8?B?UkhyenBUM1dwbnZQd0MrcjZOQUFib0ovN01LUndqVVEzNzNUZGJsU1RrdDA4?=
 =?utf-8?B?dzBQYnVOdlY3K21ieXV3M0lHRGxoZlF6SkN2d1dRNjBFMlVlUVkzRDU4Q280?=
 =?utf-8?B?Y3h5eUlUWndkQVFZUjhIMkFjTWpRL0MyMG9aSDJPQkgxMXVWK256VzBZQnlw?=
 =?utf-8?B?ZmRmOHdvRDhuNWRUdlZrYTBncm9TU0I4eEpVdmpXZE83cVZJR0ROMlRUNFlI?=
 =?utf-8?B?WWFBU3FYRTlndVJ1RGRlWUZENnRoZXFRYnU0aUJkRE1keFQrMFJ4d09TSVdF?=
 =?utf-8?B?cThpZ09iZXdQWjk1NmZjbXgrNEhtTHg3eUhFMmxERGluT1d1ZGk2VmRQQ25r?=
 =?utf-8?B?bkEvT2tZdEtwbXc4djRKbVgvaDN3cnJaUDlBb2lsRlg2TEVjd2gwbzF6aENu?=
 =?utf-8?B?c3hza05WOGUxVThEUmJCRWtZQUtjR21FK25zZDBpTUFFVGlDVGVWQU4wUEpa?=
 =?utf-8?B?ejl2NnNORC93RmJRSlJOYk5RREFNK1pSZnpPZkRuTGxXVHMyRHcyU0x1QjBn?=
 =?utf-8?B?Sy96ZFk1bk5iZ0dxVHI3UmdPMGRtZndQQ3VBS2h3ZVdmblJRbklSMExhZ1JO?=
 =?utf-8?B?VW9UNk5SOTJCZjR2UG0vdW0vK1FKdkRUTVZkMUJoOVFDOGFDalBSRmFVMEpK?=
 =?utf-8?B?akxLeHVwdmJrQW5vTERtYStHT051Q1dsOGI3NWJVQkdtZ212TDh2QVhkYi9t?=
 =?utf-8?B?c3JvSG9rbHIrMzNHaTQzMkM5UzgwV2ZlN1RlTFR0cEFnYmRGSnJ0QlR6Nmp0?=
 =?utf-8?B?K2tESUFwN1lSVnM0WXJzS3pldHFkTW9MSjR3dWg3aDlHNVVMZjRGaEkwRlFx?=
 =?utf-8?B?bzZNV3pLM1g4MDV0azBMaVpOb0ZFY0VoZ2RaWkczSUtERWZJMWZrQzV3aTN4?=
 =?utf-8?Q?rbvvDrmTDnvRxUNY88R+O+aU7vdBttI7FQTR0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTYraDJlay9Hc2N2T2ZIbUNjZ0lyMTJ4MHo2dldPTUNWbUdZQW5Ld1JZZWhW?=
 =?utf-8?B?V1pKUFFFa3BjSVFjTjY5N21Ia2g1MzF1VEpDK0FYcTAyaHM0Y1o5aXJzNjdS?=
 =?utf-8?B?aEU1RWF6b05vK1RnNmdPTkZYT3dMQ2tWL2d6c3NIVmE3ZDhPMmhYWEZyT3JS?=
 =?utf-8?B?UVlObVZ1Z1RyRkhKY3huS2ZDeTVmbkxYRUkwbWx4L2tsaE5lWGNieFJpMkp2?=
 =?utf-8?B?Mm9FWFJaTmltKy9iaFJCc041ZS9naEwwbk00NERqd1BndjBPTVEveXU2QUFF?=
 =?utf-8?B?Zkx4SHprVGdSV255N1B6ZldaVllTQVZDbGt6WWw5dnVWcHZyWk1NcUROTDJr?=
 =?utf-8?B?Ujl0UThjVldmZ2dQQjROZ1NidnUvMVRScjlWbkRpKzVsZlNnRmRvMEl4eUc2?=
 =?utf-8?B?ek5VMDhRYnptcWkrZHJIUlJkUmg0eGRVNitpRjJhTS93cHh3N2xvS1o2WkZE?=
 =?utf-8?B?RVRaTHVRTGxGQmk4RHRaV1hUbVEyZVhWdW9QemhUT2FtNUtMSEpaTlVWbFNp?=
 =?utf-8?B?TWczbTBpVjN5TGdIbDJVdG0zUVZ3Qk1CbHRqQ1BnLzRhaU40T2JaUEdMUDRq?=
 =?utf-8?B?OFJEWWpsS3JDNlpleHdrSyszaGIxMUFTV1JsdG4wWFJhY2xCdGUxdzZxSXc1?=
 =?utf-8?B?U0tzMytLRG1ZVG9EUzlzeENNeTROVHZtSE5rc1M5UFEwRDA3QVcwVmNjemlw?=
 =?utf-8?B?MHJKblFHTGdoMVl1elJtY2RhRFFJM0l5NG9qNmRRbHNFR1NzU0Y0SVZJMDhx?=
 =?utf-8?B?V3VOL2VkS3l5SkRSeVFLVlVoQ3ZlelcyYm1WVmtoL0MwaFdUVVhBR1NpUGlY?=
 =?utf-8?B?OXJDRGJDWTBUZEJjMlJjdTJnR2FhWFB5QzI3WmloYURXQkwxbm83eGQ1T0hH?=
 =?utf-8?B?MC9IVkZ0NHhXUlIydnJWcm1EaSt3TXJaOXVCUU92cFJLY2xpN1gwbldHQ05z?=
 =?utf-8?B?UmkyeHp6emtwT2ZWOXJEbEJaSmJyWm5nTnZaay9TQXExUTlId1lNMGJoejdR?=
 =?utf-8?B?Qjc2S1lkQU4xem14eEQzdU5JOVIrTDIrT1hWRSswOTZnQXJtdUx2cnRXMFYx?=
 =?utf-8?B?NUt2eXQ4bC9xdE5tR1lONk1wZDZNbTZNRUZLd0k1eURNa2Qyb1RsOGRDRmJE?=
 =?utf-8?B?OHRBTjhoMnVUQnFlZzBmV1h0a1lVQzhtU0J4NGpqVzhPSXBha2kzekxDSU1J?=
 =?utf-8?B?L1htTnMzQ3NXeEdYbXF0T0k0WWN6VGVHV2g4Zk9RUUxEcnJCOEhDeGhkN0dQ?=
 =?utf-8?B?MzJ4TmRhT2gwbHM2ZmIwUDhPR1BURlJUemZwdnRlMkJvbnB2c2tnNzE5QU9Z?=
 =?utf-8?B?ajdRTWlZaW1VSUx0eFNPVktucyt6SittdUk5WWl1YUdYMlhLNWpkejJDa2tw?=
 =?utf-8?B?WE1kaE5wdVNhdVdxOWUyRmdBeHErODNKcHpMSVFVK1hMYW9TWDlXSTg5MHBn?=
 =?utf-8?B?VzlUVVJTOERacFgxN1FSTG9VSEk0QnZFcHFDLzZpNXZVVXh0aWdnY1B6MlU4?=
 =?utf-8?B?Q3hOV3lGa0FqL2Z6Smg2bVJFcm5pMmIxUVVMcklEZjg5OUxkMXdFQytsRXVZ?=
 =?utf-8?B?ZmRmRHhhbk1ES21wQkFKUU5BZ09lRDhUL015NHdwQms0N1dIcTFwa2NiMDND?=
 =?utf-8?B?NFVJcVYyVjBWRXB0YUZpTVNPcm5UcTgwa3FoZzhuUHJieGcwMldaYXRUQWlq?=
 =?utf-8?B?Zzl1SjZ5cHgyaEZKa083bVhHNyt1dUVrQTdlWnh3UmZtS1c1MG1yUlNINS9X?=
 =?utf-8?B?eDE0aGIzK1JZTU9qUjlHaTRUMHVhTnRXYWNRdDlSbDU0ZnBleWhrUzBSbjhH?=
 =?utf-8?B?SWRWeEx3d1Z6MVhQdTdBbjFzWHJZVSsvZDZlMEhiU1VmSEwyNlN3SXdQUXFC?=
 =?utf-8?B?QkNBOGhjVGFwdDlGSDE1a3Rkekt0VUdIbndsalRQMFg1a1kwRGVsbTBSSGpr?=
 =?utf-8?B?am5sbzlZTjRHa000SVh0eURpdVp0K1FhanJyTnB5cktVOWN5T0lqMzlVN05x?=
 =?utf-8?B?UUZpMUREcm5Td0NaWW5YaDdIbHJlZVFtWTdJWmx1QklGZkgxVzlJTTQ4amcx?=
 =?utf-8?B?V00yRnhQL3BDSnRxZEFUWUhxSU9seWlOMHJZc0lxTEEvVGkyRGZ3WkoxeUJ5?=
 =?utf-8?B?aXR3T1NBUlhmVGRKSGQ4MXpEWEUrVDFyc3dmdWZFZ0dxMG43SlFWbFVvaHZG?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e90b2a-afdd-4543-56a1-08ddd0142fb6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:25:27.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXRxAuMCmzxKfWnXRjN36ozOgnW0zMbRJdyQD+nA7mU+RvoH3ZXbE7k5uEVWTFL+a6Elu1sCSwAajSs10eUiiUc+8IfCo0z+PTiOY9XBR28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9197

Hi Juergen, Dario, George,

Sorry that disturbing you.
Would it be possible to take a look at this patch as it
has change in common/sched/core.c?

On 18.07.25 13:11, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> On platforms without PIRQ support evtchn_move_pirqs()/send_guest_pirq()
> functions are unreachable (Misra rule 2.1).
> 
> Move these function under CONFIG_HAS_PIRQ ifdefs to fix Misra rule 2.1
> violation and resolve call of evtchn_move_pirqs() from common /sched/core.c
> vcpu_move_irqs() code by moving evtchn_move_pirqs() into x86
> arch_move_irqs() callback (which is converted to define).
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
> - functions fully moved under idefs
> - evtchn_move_pirqs() call moved in x86 arch code
> 
> v1: https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01207.html
>   xen/arch/x86/include/asm/irq.h | 2 +-
>   xen/common/event_channel.c     | 5 ++++-
>   xen/common/sched/core.c        | 1 -
>   3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index 3c73073b71b3..8c81f66434a8 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -224,7 +224,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
>   
>   bool cpu_has_pending_apic_eoi(void);
>   
> -static inline void arch_move_irqs(struct vcpu *v) { }
> +#define arch_move_irqs(v) evtchn_move_pirqs(v)
>   
>   struct msi_info;
>   int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index c8c1bfa615df..aa5cf41a8d6d 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -970,6 +970,7 @@ void send_guest_domain_virq(struct domain *d, uint32_t virq)
>       read_unlock_irqrestore(&v->virq_lock, flags);
>   }
>   
> +#ifdef CONFIG_HAS_PIRQ
>   void send_guest_pirq(struct domain *d, const struct pirq *pirq)
>   {
>       int port;
> @@ -994,6 +995,7 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
>           evtchn_read_unlock(chn);
>       }
>   }
> +#endif /* CONFIG_HAS_PIRQ */
>   
>   static DEFINE_SPINLOCK(global_virq_handlers_lock);
>   
> @@ -1707,6 +1709,7 @@ void evtchn_destroy_final(struct domain *d)
>   }
>   
>   
> +#ifdef CONFIG_HAS_PIRQ
>   void evtchn_move_pirqs(struct vcpu *v)
>   {
>       struct domain *d = v->domain;
> @@ -1722,7 +1725,7 @@ void evtchn_move_pirqs(struct vcpu *v)
>       }
>       read_unlock(&d->event_lock);
>   }
> -
> +#endif /* CONFIG_HAS_PIRQ */
>   
>   static void domain_dump_evtchn_info(struct domain *d)
>   {
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 13fdf57e57b9..ad6032fb2865 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -642,7 +642,6 @@ int sched_init_vcpu(struct vcpu *v)
>   static void vcpu_move_irqs(struct vcpu *v)
>   {
>       arch_move_irqs(v);
> -    evtchn_move_pirqs(v);
>   }
>   
>   static void sched_move_irqs(const struct sched_unit *unit)

-- 
Best regards,
-grygorii


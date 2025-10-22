Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D71BFD15A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 18:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148394.1480469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBbTr-000381-1x; Wed, 22 Oct 2025 16:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148394.1480469; Wed, 22 Oct 2025 16:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBbTq-00036Y-Va; Wed, 22 Oct 2025 16:14:30 +0000
Received: by outflank-mailman (input) for mailman id 1148394;
 Wed, 22 Oct 2025 16:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XfCa=47=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vBbTp-00036S-FD
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 16:14:29 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e919da9-af62-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 18:14:28 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB5864.namprd03.prod.outlook.com (2603:10b6:510:38::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 16:14:24 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 16:14:24 +0000
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
X-Inumbo-ID: 2e919da9-af62-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJKk7hzK7XqI9RIWXCXmFQG8kKte3gnyKHxLIphKzDTeYzNtuq/37atiXSOJpMDUeodRGYGjLqtbV8JGOAnXMPLK2nlKNYzsiYJnd+wSo2M7oodZryEYvZnEra98LaE8lyEU3rEzG8DcpITWmjofydZYQ3onTqtDjGv3WqcEocuNrq+Es3ox2f097uNYvKzsxz7Qgz+gRvhNtMq4PjLkQUth/MmOJPfTtSBph5PM4fjSe4NlhkaW5d5Fs1Gv5SlD21c4w8lz9KUZxEdaivToIyDo2VpS4mBWr8IZNqjvNisuGVVIZ6qajfIJdTUP3ENEFmK4X0miUqWAAFZA/t8+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIbqXo1tC881QVNAHQMGyj+F4ltBbM0TK8naUtJLPtY=;
 b=VwBB1BoiGHDnVDRSYue8mnGK7eRWG4D45UsxhKxj4PB/UvcFJirVqOfX6yOnjVHOTX+S3aCfXbYGbZlW+0/I/lHL4jLtk//zSoIpYlTxFKL5PsSnqr0gDfROuDDtqeqdlJRAou1tOUaMEOLPeRTklfqJSCimqSPanTcCzE6Tpgfir+8VHLzSCdgEYBxe/YFL/+CYrkRYHVFmdN8b4/Plyvy4FLQQBkDollyca4ylpfkYY1uz0T8/mfRzsDGq3UJdZrggf6PDFazL4oP8LRne2Dl0Y8Txjc1LHWgGCLOjyEkP7TRZXDUeGeH0uH+0F0Djlt7gwxhlhBg+x9PuKeZdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIbqXo1tC881QVNAHQMGyj+F4ltBbM0TK8naUtJLPtY=;
 b=beS2UgV1PShTGhYJaYqnFctcs8E9l0IRzetD6qjgv+KTO2aiACT/OudJ+LS8SS0n17M50HE4X87nnrK4lZhdhIRC83bVk9nCbqSGkonuV1d/ijno2FkeURwiSJO7ajii6MoH+jwiG4ibOr6dfJYEYluveAm021xYT7hj+ABywK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Oct 2025 18:14:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: stewart.hildebrand@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.{19,20}] xen/vpci: fix backport of 53859596c0d3
Message-ID: <aPi23q1S5cj02wvi@Mac.lan>
References: <20251022085909.76402-1-roger.pau@citrix.com>
 <1f05b129-3cb7-485c-a441-88cc17d4c84f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f05b129-3cb7-485c-a441-88cc17d4c84f@suse.com>
X-ClientProxiedBy: PA7P264CA0405.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::14) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: f1eea22b-ed1a-4d6f-6914-08de118610cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1VXMUdLQW9tTllQdEtVem96WjdPaXpZR2dXaWNFYlphTGhvTGVQUnhTY01W?=
 =?utf-8?B?VHZRei9vTEl3cWdJL1A2V2ZOazFHZW8zcHVlaDRmNmpHaDJhcHFSUVAyWHVD?=
 =?utf-8?B?ZnBpMGl0NG1WMFl1QXkvYlBPYXJUd3lJUEpYQmpPZ3NkRjhNNzZXcjEvSDlh?=
 =?utf-8?B?WFBteGdUQm1kN09JWE0xRHAvT2ZMamFUL0VvM21iV0N0SkFjRUVEek1XbTBj?=
 =?utf-8?B?dkI3R2FqRTkxc0lvTXdlMThmdW1VL2FFek9aeC9Ba0M2YUtVWm5zSjhxd2xG?=
 =?utf-8?B?Q0paUHJBNnI3emhzbUViVy9yWkt3c0V4dzRvTGZXRTFKY25sSGlMRUZzc0Jy?=
 =?utf-8?B?bnpHdytoRC8vTktvL0N6ZjE5KzN1L1hUMzdpZzJZUUc3NzNOeW1JdXRSVjRI?=
 =?utf-8?B?YldIdkVQeW9CMmJtQkNzaStrSVVKUk5FZlFvY3liRnRKRmRVSFkvVlZvVUFu?=
 =?utf-8?B?TEZ3bUdGOUtQZmdwdDlTQjJLckQxQjk0TWs2NTU1c3VZOWh0MmU1eVZWcGpL?=
 =?utf-8?B?U2I1RTNadmovQ0NoZVZkU2Rvb2RuQmRCSExlbDd5blZEUXlCa1JGTWFKMm9a?=
 =?utf-8?B?MXB6MmhCNFFkb1dVekpHaEpKRVlnMU0vS3EyWUg4am8weDIzSktpdkwzNWF1?=
 =?utf-8?B?Y3Fac1VNUFlweW9veVRKQUJQRmUzUjV6SnRYM1J1YkpZc3pwK25CamlGL2pt?=
 =?utf-8?B?YVVDeXEwSFBlR2JPRHhPaHl4b1pFN2hreGpnTXpnZ0VTdml4bWwwRmlQUWV4?=
 =?utf-8?B?SHFpbUpDNXE0WHhSVDEvR05vMDBNKzEwQmhvNFZNY25CR2hFcmRnM3dhWm5h?=
 =?utf-8?B?ZXMwQlFBa2dqaUEzYjd4NGNRRXcvSmhXeEgycmhPNjR4VkhxTERTUVZEdFRQ?=
 =?utf-8?B?N2hPdXRpS2V4dVhYc2IzRExQNkNudlJUcy9ZYlBIODJDUkk2RFVTM1JjdWxN?=
 =?utf-8?B?UThJVUoyK2dmMm5wN2JmYVQ5WStHVjBqUVBneWFiTmdFMndBNzNkMjBidXZh?=
 =?utf-8?B?UWtQalRBTU1nNUFRYWtDSmlhTzdTMWYzOU1xczhSVnZuT2oxM2J0cmpuYlhv?=
 =?utf-8?B?VkFUb2NEaENBc0txZmtZNTJGc3N4VE4vYnBVSDBoM0Znd25waHZWbVVhNWtO?=
 =?utf-8?B?bTAycmpuY2gzWUlHTE92b2tWMnQ0N2VaOWtrMjNGL0REWWlhTXErd2thM0Ni?=
 =?utf-8?B?R002SWJDQm9LTXFRZmR1elY0M0srQXR6Ym02RUUrWVQrR2xnUitaUzQ0RGlp?=
 =?utf-8?B?WWFLSHB1L3I2K1dIeUpmNG0wRTBDTGRKditIZjdseFJUb1lwRjBmZEFTZFFG?=
 =?utf-8?B?Q1U0U2ZrZTdBYjJUTlU5cWd0UkwrZEtPbEFiZ0JBdWk2VThMU24vTGNxS25L?=
 =?utf-8?B?TnFmbzNrZ1lIazh2M0tlcWsxQjZSWXV6SjBKZXhMcGxHOTRhU045bVRhUFJr?=
 =?utf-8?B?VEt2YThqMGZyRHZUb1ZteGVwSGpJS1lVL0JaRkF3WGRReWxiMnk4dDJVQmN0?=
 =?utf-8?B?TWN2NFBzcUJpVFBWVVpmYk5TQ05JaFRueGpYOEwyVHNZbmYybHhOUEk2c1lY?=
 =?utf-8?B?Y2JxdHQ4YUQ3U2RzSGhreFhzL21KcGZLeHZ3Z3M0TUtDOFNYejRmTnJYYVlh?=
 =?utf-8?B?TnhQcUlhdkNRMi9FN0JWNHBXYXBMZjI4QzI5TThEUkEveHBKek01OHpjQUpW?=
 =?utf-8?B?Ry9EK1BMeUJCUjZveFpSakZRSGJuZkUrOW1HL2JmMEc5TjhHdDIyMWtIRWln?=
 =?utf-8?B?ZXlQU20yMDNBSVh4YUlXZkNJTnZtVE9OcVR6bEFTcEJEVnhIN1UyS1k3UnJF?=
 =?utf-8?B?QTQxMDI4V2ZkcFJ0QSs2YTFvU0JtYzdFcFVBRGE3L2pkM2t1dFlwVFkzRnhV?=
 =?utf-8?B?eWczK2p0TGVxSEZLeUVWakQvejJydGF6QVRZSEtrR2R4RytOZDY1cGEzOExW?=
 =?utf-8?Q?VTAGGgoMnyB64WfvKQtpEY32Njwou4Ao?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTdaSVY1NjA1Zi9zbGpoTmIwMHBCOWZlZ2NLR1JXSHlGRkh0VnIyV0FwbEJh?=
 =?utf-8?B?MnhCSFN6NkdtL0dCKytSOFA2bzlOWkRkT216Y1dsMm8zeHBzeXovSWtIM21H?=
 =?utf-8?B?ZHY1RXloQWt5VEIwaHV0T1hob1o1MUhVOEROL0diSXdRZ1JUNC9YaWxGMmJv?=
 =?utf-8?B?alphNXQ2eEk2ZHh3VEV6RzU3TS9oUWJHdjVtcFZnbVZja3lWaTd5OVhKeGgv?=
 =?utf-8?B?VlAzUjFIYXdLR0VDQ0tiMlZuSWZyenRHNTVkcTZiMjJBRytPeitlanA1Mkht?=
 =?utf-8?B?Q01BbEZERHREZGwwTzFhWW1qL2twbWNwLzhFblRqL0xmWG5TbHVBNDFWNmNY?=
 =?utf-8?B?TjJ1cjNVRFArNzcvV1JSbzJMUThSM3hjSU9KV00zaVZKblp5aUNpRkl2SnMx?=
 =?utf-8?B?dEY0V0pJczVNWEhlbUt5NFliOWJjd0t3ZmlvSlV0V0xZQXhrdS80NFJnMnV0?=
 =?utf-8?B?TExxcXNmaHlIcDRPLzA3bXZkZllQNjZqY1JMOHNWRlZvMDFDY2JnVDFYem5B?=
 =?utf-8?B?YnhraEpQYjdwWWF3WjRlY2RuVXpjZDd5Y1lEMFN2bGN1dzhDRE10ZDBLUW93?=
 =?utf-8?B?ZE9PZEVsUitobUVuNjVxU1VvSEdMYnY5SFdFVHZNaXQ4NmtjRDh4b05Kd0l2?=
 =?utf-8?B?WmIxM0lGRjByL2xxVVdzZTNWYlNFQ0M1ZEtjSzVHTEUzN0MwRUZMcVZNaWZI?=
 =?utf-8?B?SllaaWI4OWVlMmxUVDhoeko2akZKWlpJd2xxUGg5Wm9lOWl1S0VhKzNGV3o0?=
 =?utf-8?B?TjJrUEJFWkV1NE9aaFRsQVFieWdHZnhVa0EyOGlrTllmZmZSNy9FcG54Mitk?=
 =?utf-8?B?dHpWTHBXOW43Q1c3TzhKbkNmcFlpTVNtVFBUd3drdnc2K0xZNmVETmlScDlV?=
 =?utf-8?B?cjJ2OGhRVXROdFJmM1g5ZnBJQUlJd05LUUhjQnQ2MkphTHNrVGxoZXRjL21P?=
 =?utf-8?B?VXlPQXBLN05OTzNlREtYdm9XcHE0K29PeCthUXdKU1pRMUpCWnZnWmZENFdl?=
 =?utf-8?B?eUl0VjZKVVEvdlArcXBDY2RVQVB1OWhvcHRrM05zUUFUYzhkRFVtbVVZSlNi?=
 =?utf-8?B?dHlLNWxMeVhMVU5kMGd1UVZwc2I4aENXUUcxeUxOdTlZTDlHMXk0dGdVekVj?=
 =?utf-8?B?d3Rwb0x4UkpNa2dhQVVHK1Y2LzgxSlN3TVhiMlRFd3pzSE94MzJjTzdIZFBr?=
 =?utf-8?B?N1RsREFsTE01aHNxaDAvNW5wclNVNkVYL3RhWUZIaDh2Y2RLdHRvYllVbkxK?=
 =?utf-8?B?UnZxdjVnSDY3RkFQWUcza3VWYklqNjR2Sm13OVpQTGd2Sll6VTd0VE5TclpG?=
 =?utf-8?B?MGR0TWVRYjhmRnM1ZXJudjZUL1JjUXpqUU8zWHVVYmdhMFkvNVdTV1pVYUJL?=
 =?utf-8?B?SDd5SGpPSWIvUGhYbEZmZ1F6aEd0TFZxVk5kTWJBUmdpc0xhVHBFNk04YVZH?=
 =?utf-8?B?cEw0MEhKSEh5WENxNEMycnJxN21laUN6TEFSZUNvMFRISDJkelZYYmg0ckh0?=
 =?utf-8?B?Y0xKS05GUnlOWWJjWHVyeEh0Y1hHNlQxQVgzVHluN3R0aVNsQWp0YjVyRmpH?=
 =?utf-8?B?SDE5dmJEcUNZMU04Nm5idXo5RXJPSlBXUkFlcmIvM3R1RDRXSFhERXNPT3dX?=
 =?utf-8?B?YlBVdE1uWUZld0ludkJBSHFyNmlxQWliR1pZTG05UzNwMXVzN0E0NXl5RDdM?=
 =?utf-8?B?UzV5WWFIVTQvSklWb3FMd2tEcENockNtM2Ezd0xmSTFQajFwUGI2VncxRkFO?=
 =?utf-8?B?SXNUQTJxWjJMSk44ZXBMQUVNOTJpQlUyVjJ4alJGQ3ZDendmTEpWVWFRRVg2?=
 =?utf-8?B?SFhrdXRUSGZZN0NhR3ZjUXN0d0tQenlrb1lXZjlJVjR3V25jL2ZyTUxmbGta?=
 =?utf-8?B?cm54QUR3bzF4NlNsT2NPa0ZGZDFkSjJRSmhWbm84dVBXdnllR0o1SE16YjVF?=
 =?utf-8?B?dmlzUTJrckJpYlFQcnc0OUtwTmhwUUtXN2xTQ0RhY3dQSCsrem8vUTBUTm5N?=
 =?utf-8?B?WEFYVmVQa2hyRGRoaVhKZmxpY1hpb2t2UVl2SkRNeUZWOFNmSnRJdllDYW0y?=
 =?utf-8?B?NHphT2RnU3JnUkx0VzhEUTA3OUs4MklTK1ZqWlFEczlFV25mZkU2NHN6QUV2?=
 =?utf-8?Q?JtpBJ8IzHb099aJfCap4kcrZl?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1eea22b-ed1a-4d6f-6914-08de118610cb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 16:14:24.1220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVDiH4NDMGgG+evHGOY7EOkfJfS9AEeJklxnXICUpollooi9Yeg/xJaTggP9jic0fRYKX9PVgOQtl5Qhxg/87A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5864

On Wed, Oct 22, 2025 at 11:28:42AM +0200, Jan Beulich wrote:
> On 22.10.2025 10:59, Roger Pau Monne wrote:
> > Commit 53859596c0d3 depends on the behavioral change introduced in
> > ee2eb6849d50 that inverted the initialization of the MSI-X and header vPCI
> > handlers.  53859596c0d3 requires the header to be initialized before MSI-X.
> > 
> > Change the order of initialization and adjust init_msix() to carve holes
> > for the MSI-X tables if necessary, since it will now run after the BARs
> > have been possibly mapped into the domain p2m.
> > 
> > Fixes: f9aea52a9747 ("vpci/msix: improve handling of bogus MSI-X capabilities")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -1016,7 +1016,7 @@ static int cf_check init_header(struct pci_dev *pdev)
> >      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> >      return rc;
> >  }
> > -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
> > +REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_HIGH);
> >  
> >  /*
> >   * Local variables:
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -792,9 +792,14 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >      pdev->vpci->msix = msix;
> >      list_add(&msix->next, &d->arch.hvm.msix_tables);
> >  
> > -    return 0;
> > +    /*
> > +     * vPCI header initialization will have mapped the whole BAR into the
> > +     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
> > +     * the MSI-X table here, so that Xen can trap accesses.
> > +     */
> > +    return vpci_make_msix_hole(pdev);
> >  }
> > -REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
> > +REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_MIDDLE);
> 
> Aiui this could as well be VPCI_PRIORITY_LOW now, much like in staging init
> order between MSI, MSI-X, and ReBar isn't enforced anymore?

Yes, that's my understating also, I however didn't want to make that
change to avoid any surprises.  This way MSI-X and header are still
the first ones to initialize.  Also that would render
VPCI_PRIORITY_MIDDLE effectively unused in the code, which might be
confusing for readers.

Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B146ABF0B09
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 12:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146106.1478577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnZ2-0007XD-SD; Mon, 20 Oct 2025 10:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146106.1478577; Mon, 20 Oct 2025 10:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnZ2-0007V3-PY; Mon, 20 Oct 2025 10:56:32 +0000
Received: by outflank-mailman (input) for mailman id 1146106;
 Mon, 20 Oct 2025 10:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vAnZ1-0007Uv-67
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 10:56:31 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e804b1d-ada3-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 12:56:30 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH7PR03MB7105.namprd03.prod.outlook.com (2603:10b6:510:2b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 10:56:25 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 10:56:25 +0000
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
X-Inumbo-ID: 6e804b1d-ada3-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkEKtVKtK1Esz6rEHZmimu8I4qUIwOxFjRehK8nutK29aavxtkoHMeHuzG5MVgMcPshJJJGfaFB4mbx0JMj9gp5s0cWV3aPc+Uf+Xkqb4g0+Bp9BjXzACBCvd/kXixEtArWJmtDn0wcSPQ2Mpji1zsmZfMp4gdGXgguAf8timyw5rZjZdKxMFBHKWxIw/THt9YnzU+MaAuZJv2J7IVBINM13lD1ZignHv8Nozurw3fkukvBDzQTzt8S1C8uYitrZ8YhG/FWdD/seY3iZ2ABkvwuW6a6Z6oHAd4oslu9SCy2S9VH8WWyQYyN+76WpW6qHwwxvBLXx8gaH4KXODYM6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrwlop6MtEn8afNsBgXKFqQUKS5/2hoBvFlRGPQ9hmY=;
 b=sdEOM0NEwf4jPDx4wqHc7MZz3Fqe9ymfdIy6kMkLKkbquFzwWu39nY9sOvmjGxfFMSAtusmbL/S8VK5HJWMSCUkWjpEWe1AUwrNJzOcG0MJK06/jSUTVu4l/ax4tpfvue0AO22uyzYTcJbfa+rD1dMUrzr3LSAT6PoTuKUEdtNzKmsjePnzEmWxmBudG8Jg0dSFQoSSew57m0Rpm7/vt0kl8f55/yXI467dO9rRGXauWwzbsX2C1mWoVLS+biQLGJ+GF4v4MecI+3Rj+DjtJ6C0Tn0p5CJtgtKzsmkq3n9kDii7oseqYAXNqEDGtufrfNFMEY9RVAESukqriRr4AnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrwlop6MtEn8afNsBgXKFqQUKS5/2hoBvFlRGPQ9hmY=;
 b=lZjIfuhGr5iL8keL7N5OD998pJue147ctfMpbtVarYd8+dF1IyTZh1bo1MOzc0ZJohmemYvknfAh4LG5gE8SFMGyllG030N3Erl9eAem2UxRx6Zpgx+nZDtvMbmXBDjCPvJpK/b7L1oTL8VNJx0NCkIsM06/9pB85oyOzUvUjuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.21 v2] tools/libxc: fix xc_physdev_map_pirq_msi() with PCI segments != 0
Date: Mon, 20 Oct 2025 11:56:13 +0100
Message-ID: <20251020105613.53636-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0029.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::16) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH7PR03MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a170b08-aad0-461a-9091-08de0fc75027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkhGSE1NUEhyejlseEpyVnJUeXdRTGJVdjdibXgxVW1QRnY4RUhTVEZteXJJ?=
 =?utf-8?B?cjZOUmhIVy9EY2ZyMmZVZTh0UlIxdlkrU2tSTEh3dlg4N0Q3S081ZVpIU2Q5?=
 =?utf-8?B?ZmVmZkg3MlR4WUNucTNwY0MzS0pGc3ZzT0E0VXVMNzFvTmJxaUNjbisvQ3Ex?=
 =?utf-8?B?eFpza3hjVVhtbEF4WkdxdFI4VVFuTGhoVzU0V2NLRmR6SEQ0L0lCQUhlbVFI?=
 =?utf-8?B?bUVWWlVENjJ2SXRERXB2RS9TcnUydmd5Z1NFREovekpIYU1RNytRd3JMZy9k?=
 =?utf-8?B?dU4yOGxwc05MYkxlNlFzZnNkdVNQbXV3eDZtQjlvOFpNTzZFbVk4d2pmdkxN?=
 =?utf-8?B?QzZ6YVBKamRTa3VpWElxYVpGUnAwbDVaMnpMSmMzT1RhcTdGUndpeGs0NkJv?=
 =?utf-8?B?TXRXTDkvTys2b1o0ckowanR1by9qbXV3djlpZmYwb2hCWUl5SFdTemdEWEJD?=
 =?utf-8?B?eVoxNnRqRWQyczBwR3ZmQk1FSVRLU3NnQmNSbG9FMGo4SVp3YXJRRXhISUZV?=
 =?utf-8?B?Z09ZS0ZxOStMcE1ZeE5pRWpXQmVMbzBLamtqTXBBMTVQTURoREs2dE1wVlJ1?=
 =?utf-8?B?K3dJQ0tCSlZuSFhKUUJHT0VidThkVlZ1U2thYVlwQkZKMXVTL2hTdlE0aXBy?=
 =?utf-8?B?TVE1RVFJQ01qTFdpYURGbFB6dGszbzZqMVk5ZzNtRUI4dGNWWm8zZGtsYmRk?=
 =?utf-8?B?T1oxcnNRSCtlajVwaTdCYWpXdGEybGdWUi9DQURJZ3p0ckZQeDRJS3dBL0pF?=
 =?utf-8?B?eUdPVXVOTWk4OHhyTlZUSVhzcGkrVWR2anh6OEJoT21VZ2h5MWVXRlNRK2VH?=
 =?utf-8?B?RjJJR1cwNTJiWTRZODU5VFlZbGJXWDNOT05HaGxiOVFmUk9XSlhxZ0prc2hi?=
 =?utf-8?B?UFJyM09iNVpZUE5WaTNkeXpqbWpnQUUyTFRWRFlMZXdDdURnQWNONTRyV3E4?=
 =?utf-8?B?ODlVV20yS2FmUzJQaW52emFqaDlMcnJ5OVdreDYyMjNFUG1nVUlIMmthdG8w?=
 =?utf-8?B?SGlVUXJyVGtJVUI5Y2FMcUtpaTltSkJ1VGxzaUFwazFGZmEvYTI3a2lTL3JC?=
 =?utf-8?B?Q1BlTVNhdlBLREUvZDU2L0hzdWhqRHlHZjlRT0hOdmRPZkUySjFlem9objk1?=
 =?utf-8?B?NHBGcmdwcmNtSmlneS8wYmJDQ08zRy9tSXUwZjJIZTA1TlJnaElqNzFKbDBM?=
 =?utf-8?B?OG1wbXpNTTd4ZHVIZ1U3Z3pOZzg5Q2hYZElXeEh6MWk2ZUhjKzFvckUwQlV6?=
 =?utf-8?B?MjR2Rng3QjFrNUQ0YXZwWkt6SHhTalhOSE0veW9pQ0FlY0FUQlpOTjVIajAy?=
 =?utf-8?B?b0NSVlNpSFF0WnRTaGRBQXVONERwVXI2M1Mwa1JiRjdjSjhrbjh2OGtjUGJK?=
 =?utf-8?B?b3M3cmZQQitDRmE0TFJLVkR6SkJXYTZabWxnNDVtNWMwaUtLejBuSnhJeFNW?=
 =?utf-8?B?WHdCRFUwQ2ZFYVpoTlh4anlWMzZnQVJJaVVYMEkxK2tsUE8yTzF0NVNiL1dT?=
 =?utf-8?B?cWE1a1BCTy9wSlZEV1JEOGdISXNVTHNJbTdZQTNLbWxiUlpEOFQ4YW5TUVVs?=
 =?utf-8?B?Uy81dmdmZEVVbEdHUWppWHBLUXZjUHJ1RWkyM20rTGFxQmovVVpxTFNqN0N5?=
 =?utf-8?B?Q3VxZUVUdnZTTmt1N0VoQStDK1ZoRzZDT0Q3ZXFQUW5USHZqS2lYd3duWTJV?=
 =?utf-8?B?VFRJQ2dmWldNWXovWWE4QWxtdXZkd29lZzdTeVVvR3VORDJuZzZEWU90ME56?=
 =?utf-8?B?VEh6ck1FWHlMcGVsNC9Kd1I1MGpZUXpWNytubXpiZjFISy9LWmdFemM4Ty9l?=
 =?utf-8?B?TWMvODVtZGJsOFVPVGd0YzVkTjlTZ3BFSzkzcVFkb2xnY2Z2WGZybElHMVht?=
 =?utf-8?B?SFAzb3NHbHRGd2R5VkNEbTcvK0ZKSVRDb1AxVEs1NGltcU1lOXdFRnpIbE9L?=
 =?utf-8?Q?l6hNXeq5EsawgcoBWUcMQ5gkKQLdnY9u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enNFWkpWOTJnMTIyaTRENVVpcGtPV3BBdTd3S3JaNGxVbmpyMElVL3JxYUNS?=
 =?utf-8?B?TjRlVlNDL1pmYWl2Z1YyNVZiZWpYeFJhb3FMQWxvaGZEMXdrdzQzMTV4UjVn?=
 =?utf-8?B?UXBpd0w1VGxpTU00WU9JSjVVcGpPRldqRXdXN0dmai9POVlJSy9oOFIxcmVX?=
 =?utf-8?B?RytOQ05oMXB2Uk5uZ0xYMU5NRzFwTk1Yby8yanpsUUsvM2JWdFh6bFpkY0VF?=
 =?utf-8?B?M1FYZkN4YURyK0t2Zk5sU202UXQyV284OGNvSW52L3VwVitjVXkwM2RXYzJ0?=
 =?utf-8?B?aG9xaUFWSmYzd1lDWHB6WWNqTHBabVVuNE1rWk9aKzBVUEVKcDJSR0ZUMm9w?=
 =?utf-8?B?bmlRMVBCODVlTDFTYXJiYi9zN3NZSEs0SUI3aEFlTldETjlXdDhIWUhkNXFy?=
 =?utf-8?B?TTlkSVc1L0ZuTG5pdXgxbk5HUjU2NGZ5NGZTb3lBQ2VrTzUvREpIdFlMVEVV?=
 =?utf-8?B?ZnpXSHVlQWthUWNjNVhMQTlMdVE5aWszT3JuQ2c0ekZMaE9Bd1J0Z1Q0cVBJ?=
 =?utf-8?B?SnU4S3RYUERVeVdJUFpmT0FKYWZEY1ZKLysrVjcwVGdnQzB6YnZKc0FUeGlL?=
 =?utf-8?B?Q2J6bkhrS2U1RU9LS2U5RXIvWTRLVFNjR1htakx1bDQ1bGlkMGdPUndvTTN4?=
 =?utf-8?B?djNicFEweGlBY3lCWUJKRGNheEZuUTcvQW04aXdNVmhDdG5xcmtETmlxRnRv?=
 =?utf-8?B?d096dVliQ3AwV1RUU0pWd0JOMm95WjJwczJJZ1lDdXFZZ2pDczNwOVc5ckdp?=
 =?utf-8?B?V0N1VStETUJIMnpTQkxKMTRkVlVWY0NHTDR3dCt2UXJKUlo0c21CMWExWnYz?=
 =?utf-8?B?dVpmVGZnemMzUmlWQmZ1alhodWVzOHRtcWRYL0tYM1pYdGw3Wk9LellGRkNK?=
 =?utf-8?B?eHdlOEhBYVJnMGY5UFJ2QmpVZllqWTlidUlWTDZrUGhYRTRsdjRPUWtCVVpn?=
 =?utf-8?B?S1VWbW00S2k2b1dnQTA3cDZxeHg3SWdNUFpXamFDNnFqY1dUUzg3Z2NWL1Za?=
 =?utf-8?B?NnQyN2xHaE1iY2xiWUw1UEQ4Nk80K1FCK2t2SDQrclh2eEpkZUZjdytUTGdP?=
 =?utf-8?B?c3RTemhwQjkxZGFPeG5Ic3Y1UXdyY2dKNXYwbldrTGw0SzVxOWpkT2pXM2M1?=
 =?utf-8?B?cGVKSkhldC91ZktPcHVaOHNqb3FheDJpcXUyRjAySDc1ZlJ1UWtGL2pXeEFW?=
 =?utf-8?B?SmE4U0FRdUFJbGdjQVJTQUlUYys4Ujc0RzJtazdsSjdZaHhKUDJHQ3ovNlhK?=
 =?utf-8?B?TjQwbXhZT2NCYWVWRGxWZ0U1OXkvVHJ1eUNjcTR6MjNaajlPd2FXOU1EdHFw?=
 =?utf-8?B?a0JoY2UyclpaUEg3WnJCY0Eva1cva3FXWHBEM2ZHa1h5UzIrOUs1VGc5NlJi?=
 =?utf-8?B?dFN1a1RUOG1abm8yeUN5c1J1a1JsOHc5VTFTRldtZnRnS2RhOUdPeXoveWxo?=
 =?utf-8?B?cnQ0MEhBOWxvMkFncFdRRWsvSVBodGxkY09KaGhpeHgyUTBBb0cwOW8yNWx0?=
 =?utf-8?B?UHJNN3VIa0gveWJKNXp4WThhckhUUkVSQmJTUTJIOEloV1d3VWlxSGZSMnUw?=
 =?utf-8?B?UXU0bkNPMFFhQVc1aXZSTlNPYzBsSERzbnM1aEVVWTZzbTJmTjdUTnNhSHdx?=
 =?utf-8?B?bnNPMlduNzhhTUZkbkhFY3ZnempQUUlDSGsvaHQxUzJHUlhURTBXNU5HSEpC?=
 =?utf-8?B?T3h3UzhCY292eFFvclJ0TmNTY0N0Z1E1T3J0Z1cwdDg0RGZtYmtDNTRGdGt1?=
 =?utf-8?B?L05XRW5XcEMzWTRKWmM0bFdCSnRQdlI0WW9GQktmYlBDSjc3S3RWWUFobEdX?=
 =?utf-8?B?OGVlWWwrK1dOR1BrUUlQT1Myc1oveXNpQWZtUzNOZHJaZnJQZGJGRWxReGMx?=
 =?utf-8?B?ckdOR0F1Tmh3N3NrV2tFcUNSQ1pEaE1qSWFtd3JSNWRNSjBRdEdIQURwR2di?=
 =?utf-8?B?NU1RWU10bk5JdU4yajU5dWo5RGtQQVhnMzhOMjI4aEN5Mm80WGJhcXVOOTht?=
 =?utf-8?B?ejhBTEZneGFxM0pJREgxbU55eGZhTUwrb01SbnJpeDdCQUhaRUR6aitZUHZL?=
 =?utf-8?B?T3FiOE5VT0xDUFVUM0dzYWordFM2WU9KVENKNnJlMkd1U3hleWNCS2lORHFa?=
 =?utf-8?Q?Xj+WkmA/pcI5WoWqWWDINeEld?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a170b08-aad0-461a-9091-08de0fc75027
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 10:56:25.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X959JoRdNqD3IKbMzld7RamvTXYHn+DuaaU9rDp34jlDwFZZCRqJQkHkYrPWbUXqciphQsENfOlP9vYgdMOHCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7105

Otherwise it's not possible for device models to map IRQs of devices on
segments different than 0.  Keep the same function prototype and pass the
segment in the high 16bits of the bus parameter, like it's done for the
hypercall itself.

Amends: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/include/xenctrl.h      | 2 +-
 tools/libs/ctrl/xc_physdev.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index c14ecd66aa9c..d5dbf69c8968 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1623,7 +1623,7 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
                             int index,
                             int *pirq,
                             int devfn,
-                            int bus,
+                            int segbus,
                             int entry_nr,
                             uint64_t table_base);
 
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 25e686d7b389..9fb78536ea7b 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -65,7 +65,7 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
                             int index,
                             int *pirq,
                             int devfn,
-                            int bus,
+                            int segbus,
                             int entry_nr,
                             uint64_t table_base)
 {
@@ -79,10 +79,10 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
     }
     memset(&map, 0, sizeof(struct physdev_map_pirq));
     map.domid = domid;
-    map.type = MAP_PIRQ_TYPE_MSI;
+    map.type = MAP_PIRQ_TYPE_MSI_SEG;
     map.index = index;
     map.pirq = *pirq;
-    map.bus = bus;
+    map.bus = segbus;
     map.devfn = devfn;
     map.entry_nr = entry_nr;
     map.table_base = table_base;
-- 
2.51.0



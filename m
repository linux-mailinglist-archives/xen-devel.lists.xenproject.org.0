Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9025AE5DD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 12:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399787.641100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVW9l-0005ns-G0; Tue, 06 Sep 2022 10:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399787.641100; Tue, 06 Sep 2022 10:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVW9l-0005kp-CN; Tue, 06 Sep 2022 10:50:13 +0000
Received: by outflank-mailman (input) for mailman id 399787;
 Tue, 06 Sep 2022 10:50:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVW9j-0005kj-DV
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 10:50:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad6d70ff-2dd1-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 12:50:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7871.eurprd04.prod.outlook.com (2603:10a6:102:c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 10:50:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 10:50:08 +0000
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
X-Inumbo-ID: ad6d70ff-2dd1-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFnQvHIcKpip0Rajs3YxpaUkAXm3VOWj30EeZiyaEpXGTG5xx0ulsiY7rcC5/ChWQlgtSBYLNCAzS7IvXDddwykEKHrq518RGL5YnW58FKwdr2n1lulm923PaEUA0+re2A5ANTVFuVDaRMJQsXF0XoslrS9zSlotSJQZgaXRXx49hdkIdUxq+iyqpC2jAJzb0yLlh+uWCvkvXxx9VlGLlnuZ+iSNUEuIQMNXYWW+zQxeWuWHi1bm1KuC9/SjqxD0Xg4pV9MKppDQNKu97PBiGwL9Al7jPpryHWJJefguIWKoEtMv8b5hgjPMyVx6U5yn3CuZPDFuq0wLu5TXPSf4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVHFEzJy2bZkqN9lRm6SJEK5Ukvew4+JJEP8co6PMog=;
 b=hE6ePl/606ZrOJehSjs6x0MXntlzuv46bvzrRHCJ2mbLzx2PHiIV2Ai+ZFuwgEVIzotJK84e5U/xIgETOdRbiGy13P2kFxuHsOY3dDHKtyBQUXug/uthW3iE/qE+eRzxwBxWXPcCwP4cXMhZ9bzb6bA/yISooJ5t4eQmg++dcZ8zUm8mLgVsCdA01CF8YwMNFQgq1T1Aw4fvzAkK9AeHaHpBjQMqkQJc+IRfThXbnO759iUaiEd9puC1dqtMxQEO/1AuGEuJUhUCvtl4UCmT0unJgxIEB/3SmfHqKwkhImdlsHrc0UIOHgWHQmyQwmmQIt6uHQi7k64Lep0IIzt4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVHFEzJy2bZkqN9lRm6SJEK5Ukvew4+JJEP8co6PMog=;
 b=Ypb2/ouYFyZgp6vZg6xUr8sttB4uN/KJl7XdRuZDkZjHHn0IhQgK7z5cwh/Yng6g7zRGMRzlPEMRFm09B6uYMuoXznXG5GY8n7WHqI21NXwNp3Pl5M6lqBeL/ol+pNu+86vRBJPNAOuHKugRyc0z7x7B2xHKjBi9N23mVuzPBXVcKeV8XNugLPs2J+Uj9Fs2dFniVemegjs/6q1o+Q7RJFdqXNs8c44EDIWesqf8MQCECU+gRmUnqe43/wfjkPSYsaDp6BlpMzjJ55ufKJl65kJMuGKpdxSJDKmdWbSpLKHsNDZdwcFW8vWsqibZvRjMPaTPq2NkIDQ9SzOJrjZiNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d4367ac-f853-ff32-115b-55fb0fd159a4@suse.com>
Date: Tue, 6 Sep 2022 12:50:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
 <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com>
 <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com>
 <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com>
 <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com>
 <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
 <qTp5d-Cn3519Lu7CMaJJBDaSFsBq27wHEYa8IsNWzJKlsnzBZ04KU9yh6IgBGGvGeWn50kdQeKSPYoiQeg3ohs0C_wewbSNGUwQbR3HhGhw=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <qTp5d-Cn3519Lu7CMaJJBDaSFsBq27wHEYa8IsNWzJKlsnzBZ04KU9yh6IgBGGvGeWn50kdQeKSPYoiQeg3ohs0C_wewbSNGUwQbR3HhGhw=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04099840-2f8e-4ada-ccf6-08da8ff5907b
X-MS-TrafficTypeDiagnostic: PA4PR04MB7871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iNEvaEywImMQlp4wCvdqUzRjFwqLvKI2ZkoBbEAeSyKzN2uC03JB2Gg9MiGaJDbOO8lCPMmotKn2eVsmSAO2CIADgjcJ3mye0w6ueqk3ta41XgA437oxAlk9KdTw0pqLmX2cEGWk1duDq5iKq88+omkQyZZsN/mEEufFF1Uz/lfzTn5h7ZG+ccxmY1lXy3vf15cUn2Iz1v167XDfJBmtOdnci5m+q06AjI491gW2ZC5KIlAPN+alUsLnHisyXmtAvtiq8ZKCPx1+VASpQv/4eSVo7CMEemnCXGQHiiRatPZ7mcz5KGV6lIVqlznnk0FGEc6tU4UJ6aB11w1d8w4aNF0Azg7p/F9LDyLcwZiAFOTgaF+KjuC1VKK2qBEH8vvzJVhLHjCLaklPp3A4YsH6lw9H2KTU63oN/igWOkpSecJu3fDlz9b0Qr0G7xTYngQDB6gS+2wRTRPigI0CHaBF082nCLYmkXEXgD4AIu1KOWSYclBCoYtQN1r15xMS5YBIjfPVp7YGx+djmqnZVvIu1JPOXVGcIAjlLBfUE96xKVbkjyyRo7GHc1aNpMe1WfU1cvAL1l0ZTJwtcYG08N1kSbxmd57mKqo+d4z1UeWfSSweacGZR6YnRZbXyaHRW3f6E3Lu56QKC3q4jsFXx51JFCJx5drwYgHzTiLgsB/BmGyn3LHHdFog5vUyK62XdWRcimGadLO1pG+F9Vhzo7B3SQ7mQq7K4ug2PbbTyNGa8KhDbJpDKFZfbGIodZMLILSt69hmoRiJ4XTB6kH8FZ0+3YxGpQLeesIrWlozdlJjDTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(366004)(396003)(6916009)(6666004)(38100700002)(66556008)(66476007)(8676002)(4326008)(66946007)(316002)(2906002)(4744005)(5660300002)(186003)(8936002)(2616005)(53546011)(6512007)(41300700001)(478600001)(6486002)(6506007)(26005)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDRkRytSSzUxRy9BWnhOdGZPcnpSN0o1ZVJNWEZBS1l0U3RXWnFNL3MzVElJ?=
 =?utf-8?B?NzR5djNlTzVTdW1LV01pWjd5aERLbVpBSGJCU25ZUG9OTzRFUVVVYnZIVjVw?=
 =?utf-8?B?TlE3UlRYQVRrKy9VdVNkNHZQb3FwSW9qeFNBUjRoV0ZLdVhUK2R4eitHRDR3?=
 =?utf-8?B?ZTRaWjJmWk03Ry9vUjk1cXd6bjBYVEEwT0hzY1JSK1BCODhMRmNBcnJVZThP?=
 =?utf-8?B?bGVzQXFRZG1GTjRPbjRWcWlXdWwrSlQzS1hKaWlWR1dtOU5pNVczSlZPNnZk?=
 =?utf-8?B?VVN5Mnk4bkdUbHRZWFN3WWZjY1Z0TytvRUx4c3d3Q2FqTENyUXBiSTY0WnZY?=
 =?utf-8?B?OFVtbkxWaUcrS3BiWEEwNGhhYUxicHYyVDE3blpjQXZqdWpkbHNnSkhudHdJ?=
 =?utf-8?B?YzI4MFJNb2RreGJqR3BtUUNUUVV2TlpjVzRGNER2UG1IL2xPeVFLWWZwYmts?=
 =?utf-8?B?MzFXeHlFS1ZLOGc0VGVySE1uY2hSUHJYUVliQTdXNk90ZTRrd01KK1hCZjNp?=
 =?utf-8?B?WUhESS9IaDh4Wlc0dE1lQkFkM1AzSFk1dlpMMWQyd2tYcFJEYWZIZ2dsT3Q1?=
 =?utf-8?B?RGZTMDdSN1ZZMVZVMkdoWVp4QVVoZlIwT29XNHlQRG5leG93UmdOWFdIS1hO?=
 =?utf-8?B?cmorMEZTcGY3ejNMUVJSM0NsRGlqSVc2V2xJQXFoK0MwUVdoM3BzUFhBdGdX?=
 =?utf-8?B?TFVrNDF3eWxFdnErVzlNaXRmNWpENUx0Mm01bXlINkR2RXhCdGRlNDFydWNY?=
 =?utf-8?B?VElkbnQ3aW9lMUhUekxtNTNoUVlndHZFQ09xdmVNTDU5N1lNcjl0UXpyWmU0?=
 =?utf-8?B?eENhY2IxQjBrM2xrTDFhZUI0cmlyU2wzdU1ud3hQZlNOR0ZLWE9tc3FJN3Qx?=
 =?utf-8?B?TXJYS0lVcWJSb1Q3R0VodTNxMzlzZWxueG41dUl1MVdQTjVIeTdFL2Y3OC83?=
 =?utf-8?B?bkVpN3R1LzFCODJTa2ZVV2QxN2xwV3NDSVZVRU41cnhEVTUycFpsRVI4MzZm?=
 =?utf-8?B?eFZpZXJRdm9EbFZlbzlWUVRtUjhqZlVBME0wVFp0cHFBL3BkWG5MVW9TcXNH?=
 =?utf-8?B?bVM3NnJoSW5HNU5yTDB3WFlwRjhMcUZEMXZMdS85c0Q4M3RQQnA0aElJelNr?=
 =?utf-8?B?clhCOVhLakpoazE2M2VnN05HeDRyOUlxRlY3TUZaMGFpU0praENxQWdNdUpm?=
 =?utf-8?B?VDlkRXlyOWZZcWZqSVVFNUl5d2hVeXROWDBDSVI0bG16NzErNEtKK2pPTWVa?=
 =?utf-8?B?WGQ0aEM1Ni9ESnhUZ2NKS0x3cC9iNThQd25zcjMwbkFTQXVQc2IvRnhMVjdX?=
 =?utf-8?B?aTJYVlNMSEVyTVNjSEpqMUtsc0RjOXV2Y2lDRzNBZ1ZVSmcxNVdDL2NvTDlh?=
 =?utf-8?B?bkIyS0JZMHp2ZjYrQlZxTVp1bTFmdEZXcU1oR0llZjBaY2hGTVZ1QUFac3gv?=
 =?utf-8?B?RjhZaGVuTWFsYTBhaHVaeEVMZVhnZDF3TXNMcUl4MDZUQXBQTkNhcmtuR1pM?=
 =?utf-8?B?SW1yaCtJcnIrK0lwNXhZWHBGS2x1M01TWEpWMXZBOWxYRHh4QUIxYmR1YXFS?=
 =?utf-8?B?TWtBL1NpSERaeFo0WXVGYmQ2MmkzTjlPYTlraDduTEdkUHFPY2xYN0tTSDlN?=
 =?utf-8?B?NFJEOVhBd2hJbUd6RjhKc3IzVkVTVFlsRzdEYkNid1Q4bTQ4UlpiZit4UHJ2?=
 =?utf-8?B?a0FzSGtudkJuSjhTTDZtY1hmQVVyRDhXMjNPNUdJTkRaNW96aWJpcW9jcHNR?=
 =?utf-8?B?VW5SZjJDbkV3YVNyaGRhZ3o0Nk5yNDB0a3JjVUdOMUQxWGlqSGIySHova0Nu?=
 =?utf-8?B?T3owb3B3L3Qzdm5VNTB1YTJsd0c5L1EzaHNYRXFuQ3VzVzNpSGE4QUorWTVE?=
 =?utf-8?B?R24vNEc2aS9tN1FYdlQ1ZXhiQ2xIZi9vVnlKWVN2TmtncUs1L2M2RkYzbFFN?=
 =?utf-8?B?SW1udFptNTdsR1IvQW9FT2lhZTEwQ0dqREg3Q3JDQWpZbHFhVCt6VXFVKzJo?=
 =?utf-8?B?VnIwcFhGeUpRcWdtZzcvclhwQ1lxQWoxbC9sYVlDUHJXZTUxSXVLaE1WWjZm?=
 =?utf-8?B?aFR2QzVueUZSZ2l2NmNwTGYvV2ZRQU9zbjVmeHB5WkZqdGRFdUd4RVV6TGsw?=
 =?utf-8?Q?Fie60OircFg3s1MaD4KIG+3IV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04099840-2f8e-4ada-ccf6-08da8ff5907b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:50:08.2325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 481YdGljtY4cclPmC3V9k1u+zydEiOIIfa2P+b6bMgEBG9M9XknJ140e7AtuMy8FNyOpiKIXvKLOnrsKwb0ONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7871

On 01.09.2022 00:12, Dylanger Daly wrote:
> I think I've narrowed the issue down to a PCI device, if I start 2 large VM, then simply run lspci in dom0, it'll trigger a crash.
> 
> This makes sense as sys-net works fine until I start a larger VM, then I see a 'chip reset' error in the appVM's dmesg, I assume the entire PCI Bus goes into a bad state.

Sounds like this wants investigating from the Qubes site first then.

Jan



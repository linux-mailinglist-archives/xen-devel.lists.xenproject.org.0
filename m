Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539198F454
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 18:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809644.1222080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOsJ-0001rM-FS; Thu, 03 Oct 2024 16:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809644.1222080; Thu, 03 Oct 2024 16:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOsJ-0001pG-CO; Thu, 03 Oct 2024 16:40:23 +0000
Received: by outflank-mailman (input) for mailman id 809644;
 Thu, 03 Oct 2024 16:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ein2=Q7=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1swOsI-0001pA-Bf
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 16:40:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20612.outbound.protection.outlook.com
 [2a01:111:f403:2608::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d509156-81a6-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 18:40:20 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by DB9PR04MB9449.eurprd04.prod.outlook.com (2603:10a6:10:36a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 16:40:16 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 16:40:16 +0000
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
X-Inumbo-ID: 2d509156-81a6-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYvVXHaTUXOLWCWDbqvMo1LK2JTfi5j16bjQP7gX8DrVyRe+jIz3S5uct8YnuN9GF2hZqJApliPoamxkZ/R+gwvRYCnGRkJFl7MllrqhcZP5SFxTFs8QjvWoS8T65WgckDOnP0/xSjHMt42sIseiNhIX30fFrBsrtf+zOWtcYdQWZRuDmbVEZGunpH5nJMwC7vc3qup3VR4RhJnJma0jqmARlus+244hS4RjTAQibwxzeeuH9BtdzcaYvEGa01tTO+C5f8B0QJBSKaDycNkA0lRDgYHTtfV90PL6ywLWjLmlvGka0/wLvdBhu4SyEcarciek4O2W1lsgH7qPMocXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2BvPJa+sqdpKzgSuybKmHwz7GSCbD4LhmLoqoF4IBI=;
 b=R00pXHkiE3Kt/SWxAhVym0qGOEFbStcVITKhMufSuQgfnqPqT6egZ1OdHt2oUvx+FyRgZwbDbr5zQpgkxtPrmxc/KH4xFFc8ylTVOzMoGpWdxLa49XJY4+mNFXjLr8VKzAfo8uinLE92kIEF0cTRbPuFsvIR6CJgJX+a7teQYBiOZmBwMQzRb3a0iipTGrfvID8gRy2Xfi01WxyMiLZma6/eIGnlaYyRYX34dO9K/ZAmiI/b893IfIApRiZ8cAl9tH1n4kKNKuEByhhNtnBoT57YnmQEx+UG96YYne15mroH4J0aTY15RdI7vyd3x11ox5qdUWJi1HLNu3hbUxEujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2BvPJa+sqdpKzgSuybKmHwz7GSCbD4LhmLoqoF4IBI=;
 b=CtO+gxlVj+ToddTWsJcqqObu3ynJSY0v7G3hObVydIvxuj7o3oxnrI2Ccg4HHURsT0bDX1JDmB1ojji64zSZW5vgVd+yZ9dkDLOByNvk5y/1Uk5FhyWJKgIgnwVa013yDEoH7sDfVX0rRwzruD7VJpJK25LkrJNcdfO790l9i5ckbI8naPXcClmxOh6eT/LwS57EUY1X37CKQE5AbzaCn2z7OC5hQjFRbMyLwsaADK4HR0F5Q1DmyH5JLKu6J2kd/4/P+LGwFJgFRHOOo13LXsywfeZ1T7rGbp4yoZq6uHJYhLG4uZO/KzX+3MLNLkYBUxJ6nbwP4Xwasw0GKagNqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <206efc95-7ba4-4df3-99ea-d40b4540c5aa@oss.nxp.com>
Date: Thu, 3 Oct 2024 19:40:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
 <e713ae46-104a-4414-8ad3-02ca8b0a521d@xen.org>
 <3092497c-8626-4e86-b28a-16594eb2a4f0@oss.nxp.com>
 <45a70cd4-f7a0-4ef8-ab90-c256ec6e544e@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <45a70cd4-f7a0-4ef8-ab90-c256ec6e544e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::8) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|DB9PR04MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd585d6-1186-4d6d-c909-08dce3ca0f70
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmMxd3pKZ1dzVWlnS0FFcUVmckFoQ21jNStZbHcyL2Fka05WZmxOd2ZKYlFu?=
 =?utf-8?B?YTFBem9XWk5DcnZTZ0trS2pudUpnOHdrYjB0d0JMOUMwL1FxRUswOVhGWnd0?=
 =?utf-8?B?ZGNITkpMdlR2eDNyaURsaGptZWw5VFJUUWl3SW9kd051c25QSXdZeGFaVUpZ?=
 =?utf-8?B?Y2VRd3dRVUxhUFgrLzRKU1psZDVFTUdSWDJpZVlUeWNsT0xMRi9LZkZXL1lR?=
 =?utf-8?B?TmV2Y05ET3ZJcnBITW5LQklYQTByVG53UXhaeDQremhoNTJKejlqcXZGZWJY?=
 =?utf-8?B?NGovMXFZT1JBeXcxT29pKzFTak05RlQvUlNpUlB2OGxSdHA1Z0czeVkzUFRO?=
 =?utf-8?B?MzJPbHljeDRFdU5mQXQxUlQ4TG5PVGN4amFpdytqdkpTMWtnNFRCWDZVem93?=
 =?utf-8?B?WjdFTVMxZ3QvTmpobHR0dW1pK0tXdnhhMTZYN1l0TnZOZlkvYjAyWDVzb0do?=
 =?utf-8?B?cGVBb3RlMjNWN09PVkg3NTRJWUl5ODFtN0tBZ2xMVlUydTlMT3dZYlVidERG?=
 =?utf-8?B?UnFRU1ZGQzJLSkdmM1ZmTkJsS1FMdTRQb3Z3RzJ3bUNMclYwSGZWNmFtcmxm?=
 =?utf-8?B?N09kNG8zOFVtTDhDSHpFcUwxc3hSNEFYak9sM1dxdUdoNWFrQVpVWTU3S1ds?=
 =?utf-8?B?Z3gvenl0MWpaQmc4NlRXZzNySWZKZHF6T0JtUFQxTWtQTWlnY1BFMXNIZFVD?=
 =?utf-8?B?YUo3L3FRYmdkVmpyS25uNXZpNGlrZmpoak4rRzNCVFRod25NV3BRbDFWM3No?=
 =?utf-8?B?bTRBNUNnY2p5Y0t6TXJnNCt0c0FzaGdNQVQyMmtWQ2JHT3AxUTByZUhPQjV3?=
 =?utf-8?B?SkxpRW9FT1JIYXFOdW1oVFBMMCswY2poSnpYZEtPWDNub3Znc3ovNXIvU3VO?=
 =?utf-8?B?THRmdjJ2QWlGV1ArcjdJemdpOTJVQkduZzJYOUc3SzVJNFJHUk9XUzl2SXBZ?=
 =?utf-8?B?MTNTakR4blVNdGlzODdMa1FWR2k4WHhuK3R0dThXa2RzRlk4RjNYSDFGYjND?=
 =?utf-8?B?cHVaK21pZmNJYklWQmJ6aTZqNjEvbkg3WE94YVFCZ1N3c3pMUkYxbGo3NDZl?=
 =?utf-8?B?OG81bzJ6dnFza3N6VkpqMm5LR2lwOHlzT0hJb24rZFlTY09pbUVDU1ZIdCtB?=
 =?utf-8?B?Y3hHaTZSbWpaNmg1WmloKzRKUkxFaU1kVktHRXpXNnFLTUR0eTRSK0xKUmdC?=
 =?utf-8?B?RHFTQXMyb1FoTGFuZlFwVzVyazIrUnFCNjlyMTNPWXA5d0JmRm1McTZMaEVR?=
 =?utf-8?B?M1lEb2ZQZlRVTHJMNlFyUlZpQ2VmUURKa2hJUkc2QkhUTHg1L3ZjdkhhdGVN?=
 =?utf-8?B?aWh2QkwzaTdBTlZSc25tdFY3eGhQY1FUVzZnOEhUbVRNT1NjTTdObE5vdlVE?=
 =?utf-8?B?eXMrMVNjL3h4MklBWUFCN0FvL0JpUjNaeFp3ZzJSeVBRVEp6SnNPbUFTWG5O?=
 =?utf-8?B?OUtrNTVBcE9Cd1Q4dlg3Qi9LK29icEhXYU1qTWx2cG83cUtRY1cvdHpMSURC?=
 =?utf-8?B?cW1WQnJZbUhha0p0anJXSmpSR0t2OGR6NnJxaU5zWmFGNEZKdDNkOHNncGM0?=
 =?utf-8?B?cUI2VVBSNnAxVXZWbzVyczBGZDJkQ2NUZ1VBaklzMTZVcmFzaW1ENXV3QTZn?=
 =?utf-8?Q?dcabZySlyj03S7bmJsJPDLPwcMG/QA6oIiXuX1EV/lts=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXFndUNOdWVQZmx6K0VtOXZWcmVKM08vMFAxQnJqc2NoYXd0WXNrQ2JCN3VP?=
 =?utf-8?B?dVFzM2FWUVk5Y2VObnVRcmhTVlBUeSt3eW1ZYU9yYkV0cmZiN1M4T0tVV056?=
 =?utf-8?B?L1RQUmlKTit5bkJ1RTJUYmxqQzRsdklybTVkSWVnVWZTQ0M1MXY2b1o3ZzJX?=
 =?utf-8?B?ZUFrOFduczY4OUttM3FhRk9Ba3lRQlFlQ3pDVnRzTUJtTGo0OWxBTVI0aWtZ?=
 =?utf-8?B?WHBkelJTR2U4TjQrR29oQXluL0g4b0M5L0h3bkFMVUtJcFRBMzlxNmt5a2dx?=
 =?utf-8?B?V3hLZXJLMmJZaS9HUm82eEFJQTZROHZERmFqd09QaDVUbkFCNHlKTlNGRFRt?=
 =?utf-8?B?VWJ6L0h2ZDBhcWtSY2Y2TkVGeUM2cU5Qd3Z1UVRkMXVkc1F0ckZIeHgwMTRz?=
 =?utf-8?B?YktpNXFyR2dGejZFS2dwbitBelJqUnlxdHZxNkFPR3prbkFubENXdGVmdC9r?=
 =?utf-8?B?aE4xS3J2RkJrbFB2cW5VR2pyZkJxVGsvQXhkSHF4QUtvNFpjRzZzY1V4R2Jw?=
 =?utf-8?B?QnNNYUdaeHhjT1I1dzdiLzZ0L1B0WEtIWkpqUmNHT1dQSFRXMCtmMk5DVkFt?=
 =?utf-8?B?aFZ2cHZ5SGt3cmFjTnVhb2FDQ2FQUGFqRmc3d3pHK2RlYU1XZ3EySFVPL0p0?=
 =?utf-8?B?Z0lncXVHRytqVUVON0lySXVMenZLQjVpdWRtSEoxUWkzb3NHRnFaejFUTlhX?=
 =?utf-8?B?bTFJOElMN0JxWk0zNk12ZCs3OGtLVnkzNDNDK2tFVDFEZEVYYW1BOTR6ZEt3?=
 =?utf-8?B?eTVkandHdlIwbzM3STlxSEYzSDEwNkNnSmlFZTVOcnl6d1lZbWRMYUhXVUc4?=
 =?utf-8?B?a0JwVThlbU1MV0tuK3gzQXlpVFJhZFBoYkxwUmFFcGdpSXFsbFF5RkZMQ2VO?=
 =?utf-8?B?dE9Sd0E1dmdkT25UT0I1b3hJeTJyTUpmUktXanE2R1FvNTcwMmdpTkw2STd1?=
 =?utf-8?B?dkFOU0phNGgxN0x3YktPOHFxWmxpR1pmbjVLa0JueFNYeUdQcnBCU09DUU1X?=
 =?utf-8?B?b0ovUVFFYkNabE5BQUNpTlEzdXNLRXZSUklON2RpY1VmaEJJdHowaHRNMHRx?=
 =?utf-8?B?SGVxYU1ZOGQrdlMrc1JEUktRelc4ZlRHTGc0bXVTNG4wckQ4a3dkVUlPM2Vx?=
 =?utf-8?B?UjlaVXkxVlhNZXFZRUh5L3NHUDdxVWFtcXVBTENvdjl1OXNQUE5zNzd2T2pw?=
 =?utf-8?B?c0RHVTNvS0EvMHpkeWYxVGpqV2g0alFOWmd5NnJGT0RzS2RLTVBkVVZoaFZQ?=
 =?utf-8?B?RGRyLzR1U1pyQTFqMFlzbDRkOTk2bkp1VGlHbWViZUIzVEEvK2lZejJEWXFj?=
 =?utf-8?B?bU1TQ01Pb1BEbFBCUWhCN2ExRWYvajdxckwyQ21YS090dFNFRGRMUE1ZV3Bs?=
 =?utf-8?B?bEx3VjBXMHRnVkR3cVh6SmZXODZvOWZJeUVwMzlFelBUWUJCYXhDK0FWVXNn?=
 =?utf-8?B?V0Z2YXRxSTdlTGVTbFNqaHJWQ2hQa1RlbmIxcGpLbStwY2tTaDZtUFR3Zm5O?=
 =?utf-8?B?VllWMmFSU0Z5RmgvQzVGem5iRG50K1ZiZzFPS0FQU1BXTGVvM29FSVR1RG1W?=
 =?utf-8?B?QnM3WGNubjhSaWM3N081bmlUQ0pveDUxY0JPQWVCQWZSTmJWRk5DSEhzNndV?=
 =?utf-8?B?bkpoSEtQcmVFc2YzQ3ZkMGJ1eEVlSmdNNGxybjgvUlRBcHRwMSsvTDdZU3Av?=
 =?utf-8?B?U2k3Rys5ZWdRYVRsR2o0N2xTMHl5WHNUeGhndzFIUXFlQjRNaXBqcEhOMm1N?=
 =?utf-8?B?WkFWZUhQdnJpSXhmQS9NR1lxVEozME9IMExKb0l1RDhGclQwVS9ibkJzc3Rq?=
 =?utf-8?B?QndKZnF6KzZ4K0F2TUl1NnZURzhmaVIrRUtmdThjZDRhcWdLVXlqZlRLUWhG?=
 =?utf-8?B?U202VThoNGFMcE9SakpLYmNla1FrdGtpbHB2WlU1OFhUSTZMMHhlRCtJeU1N?=
 =?utf-8?B?Q1hheTl1UXdWK04xa3d6MW1WSXdJdFZybDF1c1l1YWpVUXl5OS9FR1lJK09H?=
 =?utf-8?B?QmJmSncvYTVBeXBFMXBGdkZtVkt4T01vd01QeU1HM0ZMVEQzSjdheTVOcjVY?=
 =?utf-8?B?QUJJdWprWVlDOEU2MENzYkhJK1VFTkdqSG9LV0R1cVVES1FFQ0w2WTdIMS9J?=
 =?utf-8?B?OVZZeGRIWkR0MHRsYjhNbnpnQlMzR3ZoYWJ2SmNOZk1YZ0ZSL20rVTRBUHZl?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd585d6-1186-4d6d-c909-08dce3ca0f70
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:40:16.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLoxbHy4QCh47PBmbD6nPf7mi2dZTg51PGdz3XV09/N8ChXNgK/Ns0dze9Cw/8KUzHgmffV16QJSSJ3AwC5tidMLJoSAqhNd4rLfJ0Q2GXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9449

Hi Julien,

On 03/10/2024 19:07, Julien Grall wrote:
>
>
> On 03/10/2024 16:27, Andrei Cherechesu wrote:
>> Hi Julien,
>
> Hi Andrei,
>
>> On 01/10/2024 12:35, Julien Grall wrote:
>>>
>>>> , the initialization fails silently, as it's not mandatory.
>>>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>>>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>>>> are not validated, as the SMC calls are only passed through
>>>> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
>>>> running.
>>>>
>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>> ---
>>>>    xen/arch/arm/Kconfig                |  10 ++
>>>>    xen/arch/arm/Makefile               |   1 +
>>>>    xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>>>>    xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
>>>>    4 files changed, 226 insertions(+)
>>>>    create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>>>>    create mode 100644 xen/arch/arm/scmi-smc.c
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 323c967361..adf53e2de1 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>>>>          not been emulated to their complete functionality. Enabling this might
>>>>          result in unwanted/non-spec compliant behavior.
>>>>    +config SCMI_SMC
>>>> +    bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
>>>
>>> Strictly speaking you are forwarding SMC from the hardware domain. For Arm, it is dom0 but it doesn't need to.
>>
>> Well, SCMI is Arm-specific and so are SMCs, but I agree to change
>> to "hardware domain" / "hwdom" in order to keep the language generic.
>
> To clarify, I meant that it would be possible to have an hardware domain on Arm. This is not used/implemented today but most of the code is adhering to the language. The only reason where we would use dom0 is when we explicitely check for domain_id 0 in the code.
>
> [...]

Thank you for the clarification.

>
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret = scmi_check_smccc_ver();
>>>> +    if ( ret )
>>>> +        goto err;
>>>> +
>>>> +    ret = scmi_dt_init_smccc();
>>>> +    if ( ret == -EOPNOTSUPP )
>>>> +        return ret;
>>>> +    if ( ret )
>>>> +        goto err;
>>>> +
>>>> +    printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
>>>> +
>>>> +    return 0;
>>>> +
>>>> +err:
>>>> +    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
>>>
>>> In the commit message, you said the SCMI subsystem was optional. But here you use XENLOG_ERR. Shouldn't it be a warn or XENLOG_INFO/XENLOG_WARN?
>>
>> Well, SCMI is optional, in the sense that if we don't find the
>> SCMI firmware node in the host DT, we exit silently (-EOPNOTSUPP)
>> and we return right away (no error printed).
>>
>> But if we do find the SCMI node, it means that we should initialize
>> the SCMI subsystem, right? And if we're trying to do that and we
>> find that the DT node is not correctly formatted (i.e. the
>> 'arm,smc-id' property), I think we should print an error.
>
> Correct me if I am wrong, but from the doc, I understood that the property arm,smc-id is only necessary if the transport is SMC/HVC.
>
> So I don't think we should print an error if it is not found as this is effectively optional.

I believe your understanding is correct, the 'arm,smc-id' property
is needed if the SCMI firmware node has either "arm,scmi-smc" or
"arm,scmi-smc-param" compatibles [0]. We only support the
"arm,scmi-smc" compatible with our implementation, though, as you
mentioned there should not be any addresses passed in the regs
alongside the SMC call. That would need to happen with the
"arm,scmi-smc-param" compatible.

But, by "if we do find the SCMI firmware node" I effectively meant
"if we find the node in Host DT with 'arm,scmi-smc' compatible",
since we're only implementing this specific variant. And that's
why I implied that a valid 'arm,smc-id' property is equivalent to
having a correctly defined SCMI firmware node. Having found the
"arm,scmi-smc" compatible node (which IMO means we should commit to
initializing the SCMI layer), shouldn't we print if we tried to init
the SCMI layer and failed (due to incorrect formatting of the node)?

I hope I explained it better now. If there's still anything unclear,
let me know.
 
Anyway, I'm fine either way regarding the prints. If we consider SCMI
layer initialization optional we could also not print any errors if
it fails (no matter why). Correct me if I'm wrong, but IIUC that is
what you're suggesting.

[0] https://elixir.bootlin.com/linux/v6.11/source/Documentation/devicetree/bindings/firmware/arm,scmi.yaml#L359

>
> I agree...
>
>>
>> However, I think we shouldn't print an error if we return
>> with an error code from scmi_check_smccc_ver(). And the print
>> inside scmi_check_smccc_ver() should be a XENLOG_WARN.
>>
>> So, I think we should print a XENLOG_ERR only if we figured
>> we need to initialize, and we started to do it but it failed.
>
> ... with the two other points.
>
> Cheers,
>

Regards,
Andrei C



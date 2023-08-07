Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE137727AB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578559.906119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1CC-0007Su-K3; Mon, 07 Aug 2023 14:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578559.906119; Mon, 07 Aug 2023 14:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1CC-0007R9-GP; Mon, 07 Aug 2023 14:26:56 +0000
Received: by outflank-mailman (input) for mailman id 578559;
 Mon, 07 Aug 2023 14:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT1CB-0007Ol-7v
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:26:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 754e469f-352e-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 16:26:54 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:26:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:26:53 +0000
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
X-Inumbo-ID: 754e469f-352e-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DE4XC/8cIjxiV/GwJwTVnEacRbqaq1MJFwJDoq9hvsV+v100DqBS/lpsUOVQYxjFKZ4ZC+Dvn0E/JEW4xg+oNrhpcHvnmUtcAvhnD0zob6n44yoJQTytidssZYwr6fsy3klg7wD+LY12yPVxQsXJRbJxC5RtOCCwvJNJxlU8+co6/Gp60SZgyF99ouPPyJEbgfh5vvmF/ZOHBVcSSpX/lQkegtjVONr2DaCehaY8ZfEXIcqX+zh9tjctRa4v3a59JF6OgBnOmA6+OYFnsZJPLznMkeGr99FNcG+w63NWEcTnkAsKMtDf9C+0cmMxmA2kNjLt/ed9h8i/LTjK06gBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdnpZtp31egot6MdvjKnbtXivBcvxTTU9tvAR241fWM=;
 b=gq6+edGU809L5XOGlKnGYLtsKif1zAV/pSOE1RxXUH4CURQz1l6fmL/FZ0M89I2Aakhls4h70o8Pby5+1+SIECNq7+nQE2ky5L9b+21AEnn5MaWEHPWR2u621H52WQmwERrUSfJIf1tiXag96vR8VtuRxb7Hodfq8xdmM3igZQ9e9Ovr5288K8KF+yC7JoNTpOJIFMojY4lc2A+9RBNx26iq8mPiOXyT15FU5CC+6N0bq+5AqJ6M9Zmx63IYIGjeVYX6FdoNd36gdnWwWaJ9MgUrcRyJOzEgYqKkrNqYUeFdOhYlcnm+wjBhSqFKnnJ7QwEr7FNtvMovBuIAnFA85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdnpZtp31egot6MdvjKnbtXivBcvxTTU9tvAR241fWM=;
 b=35rR9XffCN01SI7KuYC+ElQNKSpgWk5PpMI8yaTLKFGZkX1SSGXfTxvSuHRBGqRIFQZPX51b7BTiSl5pOrYgq6KxqRm/Ugk5LEoJH9vz4Al31TNcRJ5JQdfcHNnnfLV/33lUa0JgQwu0h1+rdiflqFPbnA94h35AwXJjxTZjPTMhCUPJ4X/2F2uLV1E2pak3MBnDpLp4CEjRo1o/nquoAgobK952OyCuCzhPrcJ6qZGFytqVOTVRH/MoKXjZ0nY/PuZNqJIwVuzYpHzYXVmlMuUisEpOxDPJfyJZ3eXsuVEgtaOaz7MZgpCgyvZHm9wwV6nURDTLTO9z/aFfVDtxwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a61ba3a-1cd9-082f-bb3b-efff69da68d2@suse.com>
Date: Mon, 7 Aug 2023 16:26:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 09/13] x86/mm: address violations of MISRA C:2012 Rule
 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <feae9122f4fc761f24bed0d015f30849f52449bd.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031751360.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031751360.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da9c6e9-c527-4a6e-3962-08db975258bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+YAeY3HWXOA93aPPw/8Yib8opnwZS7aNZq/WEQ1O8VZBA5Uzgtnt8qBgdnJdlc4xWNP/afWJbD7VFlNBD2bktayHy7dLLaKJbQok7kb1rmi4/uzSPp8ndt1iyNyFfRvhSnQ/JwuD1m6MPXsMFOm1/iYlyx4bnR0DDI6/b07KMsWrm9O3jIq42MG0XiSGg0U9n0of4jgG0EeZDvsL2ePEmM5eDlITutyvSmC+bA55cnm8mfkxlmjidkEQW0Kx8Cx0SFGuDRb88aMheDSIFnOuzEc7CoQz4MB/f67hKA9hgWVXMadYhwSaRpE4+egb0XX3Flnn4OvKOnFnBKuzw8L0l3KjtRetsFS1tQP+mfPJsIqSKhqHdzS6S/bBqR6SSI/vK9NxC4fVLG/QxP6VncRwO5uFJpq+cIapf1ZZ5pAncW/d/oau+IX+UL+lrlqR+bwIbpycsgg/nSayT6EZWwSb2WyUfoGRSPP0Nx62KNMpMgOmZJKwVrHOEjyXDuSOqJSFbqEPeNdtIxRitY7L/G5/LeRIdtGfr/56e1jMRegfUbTqDYD+BgOCCCyknKiNrWXE5p44XZ5kY5qkHbSeZ3h6vddYLtnsbupJIWsZokCIQIEWRiv5UFqVvhOCSX9Ey+9BeLkcr/bE52keZSxLsqYeSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(5660300002)(86362001)(31696002)(4744005)(4326008)(2906002)(6916009)(66556008)(66476007)(41300700001)(66946007)(8676002)(316002)(8936002)(478600001)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djVxUVI3TjVkcWYyUTk2b0NlWXlSclNhb09lTnpmaDF4TnBxa1hnUDlteVNj?=
 =?utf-8?B?MkxLVG1JNU9iRXZnTUFYa2VkVy9XM3NkSzdzL3R1U1pvc0xuWDB0MURtaVR4?=
 =?utf-8?B?dERZamlqa2RwY1Q3YW9tMUFwTmpvOWJJaW5XN2ZrWUtaTjY3QW4yc1BJVUlm?=
 =?utf-8?B?TXNFY25MVERMZStpQUs0K295Y25qeGs0SUorMktRUU9BRzFyTkFQK3lVYzIz?=
 =?utf-8?B?UWJubkJxYlhVdWZRdmJubzZSREppK1RxdnRCdVpQaURiOGZKb0ErV04xelA3?=
 =?utf-8?B?aG13RGdsdlV1clZJYmlteEdUbHV6L29zOUt6azBsQU90emxPRXp6L0hMYmxt?=
 =?utf-8?B?dEZDVEFyWkJNSUE3UVdEeVZMV3FqVVZyckJESSsxaGFmaEVidlFyRHRFOS9s?=
 =?utf-8?B?bXRsc0xxVUk3dS9yemRUWFpIeUZwNjhyM3ova1EwL2twMFNWMzl6MGxCWVlX?=
 =?utf-8?B?aGZ3ODF3NU1NRkN2N251NE5aUXJwYjBvenlFdUxXeWRSbktyaElwajdQSEVk?=
 =?utf-8?B?TXptMk5BZUNVdElRUk4wbnk2eSs2N1M4aDZwbVdtUmUyMThDSVBvbmMvc2RT?=
 =?utf-8?B?ZTl4eUJSVEgzdjE4bjhwcVFBanlmUlluUTZZdlhQRjZsU1MzR3RBOHFKQkZk?=
 =?utf-8?B?L2ZkVkVPV0plTVZ0SjZwYmd2NTFPbS8zN1JCNjZacUJsbVZkRmYwcWNFZktQ?=
 =?utf-8?B?LzZjYzFUMjVIRmdpU2R4Z0NwWGtNOUoxVHlVQ3dCV0Y0SllQdXNTZkg3QWN0?=
 =?utf-8?B?YU9WRkZyd2VtVzhCMmtmUnNDaFErTjBZSjMxT2pyTHNEMi8vY2dxYmg0VE9x?=
 =?utf-8?B?aXRObWxQR3V0Ym5jK2lKdWtYVHJUdlZ5dHQ2TTRYd2pmemhnaHdTZi96bEZG?=
 =?utf-8?B?ekRETFlBR0k4V3Z2NzZHUEFyWjlNTUtLNy9nNDd0Z3RFdkJaUkR2c0NQL0tX?=
 =?utf-8?B?eno4MXUyRmh5L2NOWUE1S2pZMzN1RzY0a0lJYzVvOUdPVDRUczI0YWc5S1FY?=
 =?utf-8?B?Ym13KzVLRHI1b2VlcWpQN1JxR290RTN0VlNyZnZ4WjlMaEZtb0lYMzg3VHAv?=
 =?utf-8?B?b0tsbzk4cWN2bk8ya0VDK1lMSERGenpLb1k5VmNORmk1dVdSdXJYSEUreVlZ?=
 =?utf-8?B?S3dGdmVIaGp6M3p1ck5ndWdtTWpENUFuQVBvTEZUblpEVXJZY04ycEFmUklR?=
 =?utf-8?B?UlpmdFhocTA2Z0RGL1BCdlJLNGtWV1NJU1JhSkd3MVdOR3NlVm13ckRiR2hu?=
 =?utf-8?B?enBqN3IzVnJQMTY1TXo5TUxJSDBDWHBVcnMzR0NuQXNzOFcrTXJWRFVmcmJw?=
 =?utf-8?B?Q0xFaWFxN0pueENoamxSU3JBMlVoVzhyTlExc3RJUENiZEpveitHclp6VVpX?=
 =?utf-8?B?b3BFK1hnc1lmeisyMzZWL2tBeWZlL3M4eTlUa3BmelA0UEZXSGdwT1VpUFl1?=
 =?utf-8?B?NEtidkFPeXJSVGJ3ZHAzM3RPZEYrUm9WNWxhaGtFaWJqbUxnU1lsL0JqNFNB?=
 =?utf-8?B?VUVBbWN5NENicEw2MlpUV0NCc0c2cXZtUFkzaHNZK2w3dnhORnhLbGNGam1x?=
 =?utf-8?B?dTBOcnplNC9rcGNhTGJqSlBaWERvWFRHTFhRd1JpVWJHNnhJYkgzcTZCOE5N?=
 =?utf-8?B?anJRSUdnb0pWWFpiL2VPVDlTclhCSytOTFRyYXZJVkpDR1FSYXo5UzRabnN0?=
 =?utf-8?B?YjJFWHBVSzJ1ZENHTjhrazBzRXhaazVvZFJ6akZQaGxlcVFBSmc2NDBDNEdv?=
 =?utf-8?B?SUROOGhyTmZXb09GbXF5ZWZoN2RzdkorQ2FCQXQvbEJDa0lsK2hNalVZd2lV?=
 =?utf-8?B?YU5wRlladnk0M3ZObG5qZ2hNbDVmVWd2Q2hTdVloMWQwSnlLL0xYTzh6ZTJn?=
 =?utf-8?B?b0dTaHhiTHlJZE9mMEJnbXFzb3VoQ2pyd1hnRlVnc2hWa0U2VVlqd3krbWIx?=
 =?utf-8?B?WGZDdnBObFZJQ3dpOUtjbVd0TE12emFQVDE2RC9oZlkrNktNcFBhRzhHREpK?=
 =?utf-8?B?SlRZK01BdkhXWG80S21EUDRHcnRFV0RWd0RVQkZRSWZBSTQySUo2QThuUndZ?=
 =?utf-8?B?alJnV0lSbjNOakVCQXBZK3lET0tZVzB5NHJzNXJOQWpOUU5QZUtiMDBWZVRt?=
 =?utf-8?Q?lvbyFryxwGg90X/MtGy3CSdlL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da9c6e9-c527-4a6e-3962-08db975258bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:26:53.6066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuOeOxYqBHmMocdToLekBgpSEiTWdqhRPGyc8KSART6HoQyok+ypPo3OmBavm4f6rTtBfvcjzFvPm+0xwYzFXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8539

On 04.08.2023 02:52, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>> states:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> The changes in this patch are mechanical.
>>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552C7AFB1E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 08:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608673.947309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlO5q-0001CY-VZ; Wed, 27 Sep 2023 06:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608673.947309; Wed, 27 Sep 2023 06:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlO5q-00019Q-Rh; Wed, 27 Sep 2023 06:32:18 +0000
Received: by outflank-mailman (input) for mailman id 608673;
 Wed, 27 Sep 2023 06:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlO5p-00019K-E1
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 06:32:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ab251b-5cff-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 08:32:16 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 06:32:14 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 06:32:14 +0000
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
X-Inumbo-ID: 99ab251b-5cff-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yna8xz5bRP6OT393iFOJiBMhnmucEFFmhcgj4w0PkWNX0LiJc9jtFWo/CfYEdxIAvoVYDfElkGQjA5D5y4pf6OCwW4ltKQuv4XiKpSSDUyKbbI6s79hu1r2JCg55Q0pi91TDwez8jA4fs4jI80tBBoUG4tXPfEghYiCf822Xls9MHM0o/lPcZ5aOPCdwgzJ5bC+FSyjost9Vf9plRyUH1FhVREiqh9q61iDkgpSXIxlje5WTDaVj5Ol0AdNmbCUIzaKW1zeJd6geNyExPtpXdsdhDozVlFu7uUZSlcAqCsi3jdOHengfEkPbJPVNPaoGAd+/xHgt5Yah/WrXomyF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEr0MeIkFNkWcgF+GCZsIIGm7csp0+zR7DJHwWhIUEQ=;
 b=e7wnP/kA3+4ku6r5JuME1NLIytYeDPMrz32kHg3q94zukzSAuq+LHhIfcXD00jy8zplfEA3b2vtkNi+q4WBE3yop0imckBKHbUzjplT73qlALnhSukHiNZlAFKSKuCMXiunGhpADhQUPDBrn0pPmeHf06AqmKQ/iQgN81YrUM215vWb0qFaA+fWGQiMVGCRHqS04+X0zAboYdFFJbVAktOisn89HU86qROOSEcESmmLxFH13EZRN9NQQBumYAUqJyTO4439We5UO0JpKkKEzSxfFXwOplENglk5Tsq/QRmiFhBIr48KaY+7jfMlwwC+JtyhGciNxDrx5VdYgWzQyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEr0MeIkFNkWcgF+GCZsIIGm7csp0+zR7DJHwWhIUEQ=;
 b=PBpn7JAB71dnnvnXbnnVEkZz2jJh841Gw73LHeLI4AAuYGiTuL/aYTM0XD6yw5b9wwt8Po3C6aYCYXvKoSPfpA+YTnIoEzpc9obUXGJl51DHfgcvBdTn4PQSTC+vPbUW+BSoh2UE+sRO2q696Ye9C5mOAXWc9hF2KL7CkdZjsMhw7a4Zwqrlol3n73Y0BkDho+64OMI6Vk76eTVGsBhPbCwvNUPmG/4084sdXLK1WbFcQKky2/xWey9GxGUZXPJKkoep2gQMXWqDLN7W+OvoMe0DMNj85x1XJ0CrZ16Q5NbgMViCCIFiIq4xtlUz1O3LA6IO5lBSzjVbK+ENyDodeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43be87e9-d947-c6c2-a70d-c6ba947cacbf@suse.com>
Date: Wed, 27 Sep 2023 08:32:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1695767747.git.sanastasio@raptorengineering.com>
 <d16b2f8749b65e303f531776d303586336ef1729.1695767747.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d16b2f8749b65e303f531776d303586336ef1729.1695767747.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6b45bc-67b8-428f-16f6-08dbbf237cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HODdfyXBPZ6Tmwh89fDc/CpE4YwE+G/drLCOKfkbw8Hnk74ypH7fMYwukS01e6v1qAlD09ubgYodU27PYOkLhrEhJByIlRiju1zthVCDasR5OJeGB2T+s5QTY/6pb2gC4Saln6yywvWlQl/IapzxWSUCMq4wh72R5Me24oxOLVIvf0KFAOalRuXQU/tVGdxXTnLx4LpjY1q2gviEGV3HVKSlJOPmsPOL7xKTmjeVgrVb1oIL8EsHF9m6OUK2A23fhlcjnmbnf76phRbm/jo6cH+mXhy0W5uNJ9Txs6wAb91nJhsjlEOFtA/dtsnECRFcMdPotM8iKOOwWKtcYTpjzMBkPweG7ZwAbMkcC3Pr8iiwm51KndS3qeY1cmYEwlOjuTCxU00FhRQir8J8lUeC/nJ+maKv0nghbxvPgozVvZc3N485XdyJyy42ldVFxRdS3hdsmIlSWgwI8ANQWOQ7tbqaPkAP5BY3PgwNaEZNKLMX5Oh3s0fE98TSg26KPimmdRhN3kbUwmr2ma5QGsAj/jZ8PBfhYxkn8Q6/n9gFaOeKVqCrOFsbSRWEl7SX4HnSF5lgAmpjCmTlsNar/6UFiGa+cScFpYGETCTJt1UmhuEXNWulkOBddcD/5fb0RN/GMZ1cpaCf76/ZjNK+SK/jog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(1800799009)(31686004)(4744005)(316002)(5660300002)(54906003)(83380400001)(6916009)(41300700001)(8676002)(8936002)(36756003)(2616005)(4326008)(66946007)(6486002)(31696002)(53546011)(6512007)(6506007)(66476007)(66556008)(26005)(86362001)(2906002)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRUN0NaVEFrSHN0bmNFanlvYWx6TWpEZHNZalo2VER6TDkzYXlyZ3VOWDRK?=
 =?utf-8?B?bXYraWM2cTUvYkJiWjNuK1JiKzNwQVNOYnpoVlVBVTVENEorRjcrTGc5ZkdU?=
 =?utf-8?B?S3I0RnhTRS93VzNHMTRYT1hBUEM4RGNONngyMjhHR0FJMURvU0hmbHhCcWRF?=
 =?utf-8?B?M3dlUHF5V1ljUXJ5VUZpWUtoU1ZyTkhpSzZic0duLzVwRERZaU9uUGxMSlB4?=
 =?utf-8?B?Y3YxdzZjU2N5VVBlT0tlRWVvSXpOSjlFMk54bVByc3JLbnpFRmZIYVViQjE3?=
 =?utf-8?B?QnY5eUtrVXFmNXc0U3Z3eVo2RklMc2RsVDZQbkhqU1JSKzNqaWVTTG1HTnAv?=
 =?utf-8?B?U0tGN3F1Q0MvV25BaVYyaU5sUk9tNUNOSTUrdHhBT09PVWZMRzJaZ0N0dmFy?=
 =?utf-8?B?MWZPL0pwZXFlQWI1cEpCOHJjWjh0eXZYbUpsWGdyL3UrZ3orbDhXaFBIenZB?=
 =?utf-8?B?ZGw5M0dnM29RSmxqajVlc2ErZHIwa2tyVElqTmtmckMzUy9ENEJ3bVhuTVBC?=
 =?utf-8?B?SVRCSkE3amR2L3ZRYkFrZFV0ZDR3UzJyL1E0ZzFvd3gwc1BScVFuWmo0YlR2?=
 =?utf-8?B?OTlSd1hKV1krQmdzU0R0b2R4WjlaanFjbVJQd0VkWHhVWFh6SHo3aW0wVUkz?=
 =?utf-8?B?REIvZGRHS0RaKzJHaGlPd3dDV2pRMFZ1NjRIbkloaHJ6Zk9yT0NOYkVidGtz?=
 =?utf-8?B?YWxQQlc1dzgrQzhBbkR3c1hnakV6UldZbENkMmYrcndyQ1J0VkhhUktVbDNV?=
 =?utf-8?B?TzJiKytVR2QxTnd6MXk3MmMzS01LVzdmVnRocFZLbHRlZ0JEQUU0b3lTWnBM?=
 =?utf-8?B?VFhHdEhuSnlRN1RpVTZDS0RNSUVvOFAvVTg1YktYUHE2SWROMW5Zb3gxTjZ4?=
 =?utf-8?B?Q3pMakxlOU9CQnVSRHU0eWM5TDZZd3dmb2lnb0wwSCsvTExRRW4rTDF5bUJR?=
 =?utf-8?B?SytpZXpJYVNhOGFITE9YUjFiRm8xS2J3dENDNTJ5SytiTDk3V05sdXZzLzFx?=
 =?utf-8?B?c0FLQU9Sd2dzQXdrYWwvQ3hYTVNobzF6QnBFelprVFJTQXhkVllmWlNTNTk4?=
 =?utf-8?B?Zlh6S2c4M0k1WmZQWVZMODZJeHFmNHRWVittSHNneHVGZkt3L0VQVHdJZzAw?=
 =?utf-8?B?RlRKWXVXOFczSXhEU2FsVThYcVZ1WUxUTHhyU2Y5VGlJekgxenZXYWFtTmQx?=
 =?utf-8?B?YThpMXc5M3hUdFViRllxb3lBL1RvTmVKcE1FWHlYV2dJQVF1dEpuNGlVczZa?=
 =?utf-8?B?bEFRMy94RWhYUXZBZUZ6Y1pHM3R4c0QwQjBPd29FMTE3N3NrRXVIdTdLeTBL?=
 =?utf-8?B?ZUdpakFRZ0FXaHcvUmFURWw4d010OHBFYkZZVkZic0hhVHZNemRYdWVhaXdx?=
 =?utf-8?B?UGtabUVZeDlvczIrelB3RjZyd0dMYUJ4VHNJeVQwaXk2U3IwdUVCc1N1dURW?=
 =?utf-8?B?QXFva0ZWczE5TVdpRGRUWGhJeTN2N2VRVmhsU2pjTk8vN0VwTUdEaXpmc0E4?=
 =?utf-8?B?d0Z6Y0xzaG1DUFo0S3ozZDNvTVdyL1VjNnJZQ0lidWNYWmV6bjRPdUx4RXV5?=
 =?utf-8?B?NEJDWkVXOTFOUGhFT1lEWUlhNVEzSy9WbXB5bnlNUnV3QTFzaHpHRXBQdlRa?=
 =?utf-8?B?ZzBiKzhFNTBPQktEWW9EUjFZallVTmMzMnVoSnBhMWZVRHIrbi84N0gvc0Rw?=
 =?utf-8?B?V2FuQkNwTyt1M25KTk92YnZJYWJQK2hiTFJuR3dzVU01b3cvaUxHMjVSbXZn?=
 =?utf-8?B?SmlvRHZ3a2Qrd3ZHbWRmRjkvcVRBVTNjK2JVdjA1ckpObDN6NDQ2U1dnUlFt?=
 =?utf-8?B?MXZ5TStsSW1EL1lPMFpnTTBkd2t4ZFdnMGZmOGNTQW03dzJIa0wwQ0V2NG5h?=
 =?utf-8?B?UmJyRC94bEJqaWkzWHArZ1dyMWlkbi90TS9JZUVZaW5XOTNyN1lOVnorQnlI?=
 =?utf-8?B?YWVmUlY4aFNGUTJXSjJpaHUxZGhNTVVld0g0eS9ySks3UnQ2Tmx5OVFCZVNK?=
 =?utf-8?B?MlNQREI4TlJKWTVtbm9tSzdQbHBhTVJ4eGhWaVZ2Z3p3aUdSSS9yTXBIaHVG?=
 =?utf-8?B?blJiQnVzZkV6bHRBT01IeXN5M3JDaktSWHdPSnBnUHEybzlGT0FkOFZpWEMy?=
 =?utf-8?Q?Tl1CtWHnOrF0QWckt6GlO5cTv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6b45bc-67b8-428f-16f6-08dbbf237cb5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 06:32:14.1087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9MzPnrVEQSPZFxZQ1HUKbB4Mek/Db7vThafw1X/pRzTwaP8TLJ2a/3kPXKTK4THIBGjWIzwLah1tC+jutBWww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

On 27.09.2023 00:37, Shawn Anastasio wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1211,6 +1211,14 @@ static unsigned int node_to_scrub(bool get_node)
>          } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>                    (node != local_node) );
> 
> +        /*
> +         * In practice `node` will always be within MAX_NUMNODES, but GCC can't
> +         * always see that, so an explicit check is necessary to avoid tripping
> +         * its out-of-bounds array access warning (-Warray-bounds).
> +         */
> +        if ( node >= MAX_NUMNODES )
> +            break;
> +
>          if ( node == local_node )
>              break;

My comment on v1 wasn't addressed, either verbally or by a code change. Imo
that would move us a tiny step closer to what Andrew was asking for as well.

Jan


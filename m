Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22171959E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542328.846049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dhE-00060Z-Gc; Thu, 01 Jun 2023 08:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542328.846049; Thu, 01 Jun 2023 08:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4dhE-0005xn-DJ; Thu, 01 Jun 2023 08:30:12 +0000
Received: by outflank-mailman (input) for mailman id 542328;
 Thu, 01 Jun 2023 08:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4dhC-0005xh-HS
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:30:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 848a9659-0056-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 10:30:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Thu, 1 Jun
 2023 08:30:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 08:30:06 +0000
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
X-Inumbo-ID: 848a9659-0056-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzLfWot1tHmNHNcweig2G4JP5G06rer9xc1PhXBq4Q0hc5Dl38P5uv1PqZI+43pTEcdMLlq+cvZhI3XaKI/IJenR3lsG4b4WbGP1ReaOvDrzyWnJ+X2keUxcklYfvhhApEbRuyzgY/ce00TE5SOq9Ohu/UGXJZqqGap2zcgE2mgqVYKTB1hpC/HgHAfPCeNohjm2JiqAP7cN3tfj1mqzGLYgEw+DdXe2EsaFyVa4jfCu3XurQOIhpiTGogmsAEmmay/FBiRkMyA7sA5EgQ3fp30+/GmT+BXdsxLG+PL4DYfyiPW2h757xcXI5QddwCuaTdhGt912zlXJfAHJOBvrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+68SkHRQpN5NmJsCohX6rG1ARTheBpEAZzz9y7lGK4=;
 b=MwIM8d/0OF58p86QwPtnL+EGccT/IHa1vG2NHabz/m1kZ52KoXi8xN7sUeKonqOskQgBpd+mqL15CvBNE6A3q/BpWtxttz6awd0SzUrAxGhO7ZWMApSTS3cOYfQktXYsyWJ7gIBbs0GzqUJr7wxMgmqgYBVYHToyb67w9VPF6DOQFGqpBijQ5G9WyhZ6dYcnmiWZTiUU5x0vTvmXmp75cykP2FaYZz+Nqt3dNmVE3AbkVif54qGKVWjNdqttdDBYkKumdqeGk4y8u3iAvBwwtQ1RQbzuZ6H8ZP8oEWsutFshh8NKXou36ygp7meq+tAYv1oJOvf7ULIvdeE7NsKWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+68SkHRQpN5NmJsCohX6rG1ARTheBpEAZzz9y7lGK4=;
 b=E81SiRXQu8bG76A2EZeABN9FKH9dOCOszlqSig3pd8gYNNe6EG8vnT6l30sIxxVE9wKEb1fxD8ZqfXGa5Rfp/Mj/4OBBZUpRu/qoxJQ+yhorXTUxKl3QCnZQ5H3WsRa23Wgb+b/42Yw37ZKBDTgvHso503LYmFP4UmXKrQVIN7klarm8EmnQCFue3OXEwQo4OzqjdbxllLlDf+fdMfz+1yyXIj/IICmVd193vruEmxAX6JWbBbC/YbDWRplgVbQElorA4uGJ+4efDNTfVtotyxlXUsuGZQF91J7BH6Iv9TuM840E8hRSy50IqkqkUdnbYu7ShMp6xqzJ+5GQSEwKrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d6ce0e8-d12e-ed32-ef4d-8a90165d5360@suse.com>
Date: Thu, 1 Jun 2023 10:30:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/cpu-policy: Add an IBRS -> AUTO_IBRS dependency
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230531153028.1224147-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230531153028.1224147-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc45f01-1a1d-4c66-a7bd-08db627a6734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ab5cUBq22IWvOrX+6HAZHsdDi7vYtCd7FdPE9ZG7a8QGlgFXy1CiUIgsynH665mkaibvk8ecwwczWguWePicAd9bNTapPG5aFsoSGIHV3PLm8/GmqBJMIiFd4H6PKI+MKzhPoTkoZyDsheG4CasxqKKc0oNdKGItyZxa22ucbyMtQotmSSeCvtqGaF8PkV4Q2Z5dRnvz7kuvIfIuyyBE37LeWDkTjVj/MawJ/fdJ4BUzlwzh11Nl7lNP1Tk7Y5JVnhSSODd32314hrd/8s7Q2bC3LWBYaHfCU1mh+wqwoKLS7GzYAtSVQ636uAQDkk/v5jmrRFRTHOAsAxF3gfFEirboZoyd71Lq2AOWBWMclszO64mhcnO9kq+VLor5WKvjvl6xcCURBABHH1idkXf3o6y+DQ1KMfiXT46yAkl1ISlqOc5jwPB6mSoX2gjqv2souy17/EnoNan0B9pY3WwygZLvYJ7RoBxZdduZdyvL9JyUcLRrNhXnpI63Uo4BjRA2ag1K4FbNWdjQGiccbA3ksR1fbH1BnslvIJp7+++cn7JHJPXaXSFpWyGmoaQbhKo14wND8cGANZ8hUuYbfgAVqRGgJlFqbwF8HL/h+G89RWOWqkb0GoRT20TfhzGXSyW70itzh1ikU+hlTleLBYK5VA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(38100700002)(2616005)(41300700001)(31686004)(186003)(6512007)(6506007)(6486002)(26005)(53546011)(54906003)(4326008)(66556008)(66476007)(478600001)(316002)(66946007)(5660300002)(8676002)(6916009)(36756003)(4744005)(2906002)(31696002)(8936002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG9jQ2t3eDNPQXBSUkE1K1JVTG9CTHVRRUxyQm9DWVQ4RXVpUkxDODlwb1VD?=
 =?utf-8?B?eVc3R0RUL1Fwcm1acnFLWk1kc3pneTRaZ0JrVkNzT3BBWkRGMHh0c2w3aGh6?=
 =?utf-8?B?c3F5eENvdVRtUlFXTERGV1J4bExyOTJRY3NXVVVyQUNRamZ3OUhQRkZpZDdO?=
 =?utf-8?B?TUU5ZXAxaDRQcjYvd1pabndNWmtKVzh3NFBZU0FsdS9aL1J4a2FJTkNkWVRt?=
 =?utf-8?B?K00vYm1aMEVZcDlwcTQxUlVwcGQ0bzhrWTVSSlQyc0VFb1owYlBHL2hPSmpQ?=
 =?utf-8?B?eWFEVXlzY0VSMG8vRytSSzdFRHZDSUl4b3J3U2ljTmcvOW1OTUU3bmx3MzFF?=
 =?utf-8?B?cU8ySHNMcExheitNWDM3ekkyU1hBOThQMVprTTk5dHdKTWhrbXpZaDA4d0ho?=
 =?utf-8?B?WXFIeStvTVRLWXB3blJwTjJ3VklIMkJFOUpYWTFmWGhiWjNGeXFUYXIxeE9w?=
 =?utf-8?B?VFkxWHMxLzNHRXdRRU0xZ0NBeXJSVHQ1bGxjWHhjK1gxR1Exb01HZVQ5ZFVW?=
 =?utf-8?B?b3R6Z0pzODZmNmpFTDlGa3k4Z0NGd3R0eTBGOUFjQkJveFNoWlB6ZmxmNHZM?=
 =?utf-8?B?dmllZDRaTFkrZVhOZEw1MXdWaXcxYzdXRXNYaWdIZVN2TVhCQlkyZENOY3Bv?=
 =?utf-8?B?d0VpQ2hxR3pId3h6TUJXNEp6ZHQ1K1NKWFpKOUJTYVBoWldORVNBNnRpS25B?=
 =?utf-8?B?TkhnUFBpZnp3UVh2d24yOWlhSUFPSjUvTXR1d2grR2pTbFFEYWc0RFNabHZt?=
 =?utf-8?B?OHJ1NWQ1KzluRWZVTGczaTFKbm1mR0cxQWNnYXNtUWNyNHExN1hKTWZudXgw?=
 =?utf-8?B?ZjZuM005UzJraEJOeFZOS1lmYWdZUnMrMHBXYUtDbmlIYXVjVWcyVTR2MElP?=
 =?utf-8?B?UzM3M0tLcjZoQWMvekd3RlZEenZnUzFuQTQxNkM1RDRYWDVUYnZULzI4T2tw?=
 =?utf-8?B?TUJZY1hIZmZvcEgxUHRQSUI3MDVJOFJMVVhoaUx5T0pZb24rNWNFamlJUjdl?=
 =?utf-8?B?TGVjeEk2L0NkUExrT2lsSFROcStOcnV5cnBKc2pYVTR1dFUzVkZvWERiWm1P?=
 =?utf-8?B?U3E5ZytubU9wQ1FtM1pTUmh6clpjT21uU1lOUmxuVytYZ0FhVkhpYmJuZkhR?=
 =?utf-8?B?UU5Pa0xOMFFkYXkyVk1tbm84eTlvN216UnVHK29tYUZOZXJhckZIbWFhTE1o?=
 =?utf-8?B?RnBIUmROYXBockRzeHNTL1lKVTBxV0tFR2RZU1VsS0xnQ3ZuZGR4MFRrOXkx?=
 =?utf-8?B?SUcvQmZDdDYvZDJrenpYdnVMRkJRVCtBeVFUMjlIMkliRStwNWJJV042VmRs?=
 =?utf-8?B?bVc1elBOU2pKb1RZc3FOSUpGRnpLYS9ZNm50SklRdWRhZG1SYlRhMGYwNXpR?=
 =?utf-8?B?MmF3dWFLekVWWjNkKzF3Yzl4UE9WUVFnR0lYYmsxdkhkU0o2OVlTd3FEUWFB?=
 =?utf-8?B?SFpKdHB6ZU9JN1Y0ZWNZQmcyZlNKQjMvc1ZHL0o0MFA4OXkwNkhRbGZqeFB1?=
 =?utf-8?B?Ni83c1NUT1FVOEErUUw4a2NvV3l1RWZSaGdXd1dpbmxDd1ovRUlOY1RZWWlQ?=
 =?utf-8?B?d3JrYlhxeG81SStmUHIyenlDb1lvL2k4UWMrZEZJRkhQNXU4aHErZnpYQlF6?=
 =?utf-8?B?NHdld2FjTG1JYVlhNXdHQXBsZFFNcjdIYXhuRld2NjFUMEU0eVFBUnlOUGha?=
 =?utf-8?B?czlBKys4Q3FsL1AzeEJSSEJwRVZpQnpGaHJrTG0zZnhvVDh0QWdCaGNwYXBB?=
 =?utf-8?B?SXpCODZNN0xocXNYUFkybUN5SU9oYXg3ZkdQVEVXR1pPSjl4NXBKc0Q2d2ZU?=
 =?utf-8?B?WmhzWEI1bUg4bUZ4dzRXSkEyeXNBSHFqMzJjMktBZy9CWnU5MzhhVjRabUE1?=
 =?utf-8?B?VXJTTWtBV0lCdDVPWkN4aTZ4VFFwdS9YWk51K0syM240blFFQW5TeWwxTWly?=
 =?utf-8?B?NC9aMUNGYzZ1V3E0U1lDZk1obU5rNzQwUmpsa2FCSVV5LzVPZFBHUDEvVmF5?=
 =?utf-8?B?UnlGdmlVSU5Tc0J3Uk5oQjNzOUhUWkh4c1p1aGtMb1lHa011TjJQb2swL0Nz?=
 =?utf-8?B?NHByN1FISTgyenMrV0w1SXYrN20wdkJEM2QrdElwdk9QdGZEMEZmU1o4dUI1?=
 =?utf-8?Q?x2+P5oSj/eBFs2KcBASwAtT7c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc45f01-1a1d-4c66-a7bd-08db627a6734
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 08:30:06.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgXwaWsr3+99EquR8b5VVCNQ8d9r2HxL0TG4s2ugbg8WCn4qmuTVrXg0ucbxgI7i2+d7QUxRjnPadSwRu+SaMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971

On 31.05.2023 17:30, Andrew Cooper wrote:
> AUTO_IBRS is an extention over regular (AMD) IBRS, and needs hiding if IBRS is
> levelled out for any reason.
> 
> Fixes: defaf651631a ("x86/hvm: Expose Automatic IBRS to guests")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




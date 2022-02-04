Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F064A9805
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 11:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265361.458715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFw9f-0005cp-8y; Fri, 04 Feb 2022 10:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265361.458715; Fri, 04 Feb 2022 10:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFw9f-0005ak-3e; Fri, 04 Feb 2022 10:49:27 +0000
Received: by outflank-mailman (input) for mailman id 265361;
 Fri, 04 Feb 2022 10:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFw9e-0005ae-20
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 10:49:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1de07ad9-85a8-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 11:49:24 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-Q72iVPDvPjmYGSoXh66qQQ-1; Fri, 04 Feb 2022 11:49:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Fri, 4 Feb
 2022 10:49:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 10:49:21 +0000
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
X-Inumbo-ID: 1de07ad9-85a8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643971764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R4JsFwGJrWfrpVEX8jSVVG428BXVo5vvWtIQ1qFK6Z4=;
	b=aHuR9xqGjpGFSFh1kkpj91y80QAKBXqraLXlsVSksKZjgdrds/UkvWWkSTH/hEElph9/JB
	VFy3LICeO69U5KBiz7wCBwNT3xHV/Y+8g6MFLP3M2UhAoowQAuRHWsBtYE/rOwwBzvdXMC
	7z7qdW8p8zxvxMlk8IkyUXfAdF3tPaE=
X-MC-Unique: Q72iVPDvPjmYGSoXh66qQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLQskWNagmRbbQMFKsV2whVS/MptsdcBWzSrbbPgjl++Sf+lMoALmEKWsuFcPyuxPjWH4tCwcgyrZ06eMqtM3xlhjB60tCK6wi3Z/vVkTthyD94NtsuRw+mWiCDCQEld6mKsQBRej4/jdqxqiBetS+ARuo9m/dYid4WLqXSjVN0pg9XhsV332+7vKbnI/mG9wRW3Nls0S6mllQ33TZGtjy9VavRU9cwwgp/M5Y0naPbxbezbr34Gug6bY98LvbDJ7oRAdIDlyVtLf+vVaFPfzRcByVMzFCrxbeCt7XZozh79rMjQGkkdCBb/dK5tTpuSY6qGzE5L3gvRHsqKTXMaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4JsFwGJrWfrpVEX8jSVVG428BXVo5vvWtIQ1qFK6Z4=;
 b=Y45CsXG/wl9derdYT53URXOXkiGtsiMiyCJygFqHYam9HDMjuFEo/sBQLnwOQGhtWYkkSZd99O+g9GqstNf2CB1bDaeMbWm/s60331ZwqUiNI3dJhI+6SnnFPGltbUxk8JnL5ZfzDBMzkJ7Q614d7XdlRrYOJeh9SNxKxFs/z6Gl4yTNmrI9pwuMD5Dl8n5oYhuaN1N7ENjITqsrp0lQ7m0kz3rnKMgpwMfs2bnSItxAXKpxWrfGyEocPxA3TDrPK0WZYkokh7IPsdmH/erARhiVE69Q8fUP4c4nFVvbcmzUm81nU8ILxQDsIOKRW5Zpv1zx5nbUC4uUe+NAXeg8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
Date: Fri, 4 Feb 2022 11:49:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0032.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5c9a316-ee08-44b7-db50-08d9e7cc003c
X-MS-TrafficTypeDiagnostic: PAXPR04MB9188:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB91885C58792E4FBAA7327048B3299@PAXPR04MB9188.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yBD6mO6TlTtI3/zz3xttriTNGqi/pbIqpJXE4JXFmv3pd34JZo7O3lhPPpGp7IvAvwYkRE4ks+jbxXUqkVO3VsmDQJe0ADnMbQpX1ke9UY045lhI2DSnHf9ACoT6Ww9LAcI/mEeaAkDPrsZKRhcJSJnXXPHp/M4/6s1mp43VQHGN6Rhs6z2wELvzVTn0Vopk48awAOSWtl2OkQ5W8QtmZVH43vS6FDmKVm4P4BdkkeFxYO/BLhuAi18prdPKUYlpAEKSluKbQrhx290AMBRAEF3oTbZb5OCmzoLI9K3fGJKNr8JdC622JYxrmXDxT3GCreOSAikBYyZbLKQD2XhICMqlTEe04x1YklBYss4laR5F6swArF+k3EdV8Z6IAimD1KF6R6dHm/r97ArYwcknJQ3KXLGPZUhCPwZDIqeGgZBdEi9Ax2m6YGpRY2sz8KC1o6rTKCOO3wYRBt3yxDbcUZSaQ2S2ZcK1ODGrOmqsi0674oI5R6WhObBaRaGjMDHvVZmYT/nm/qXOGUvcG4NNvUoQlUb4kZQJ0J7CT4+FMrUX3kE7fFj7tq1EFE5cET41DJxAOSoQjuW5nn70YL0AFpCecbb5B1oIpXXroWZQj7h87pUNctYR2D0FQo0RW2TqQakP3klJ+6ov0ISQB2rtRb8jDjnPYhEmsbv2pAZsJdiJpoiOEQHwo4DIyohS6TkqJH5KwLEQ1jOMGQj6Yu6R8HxRalRoM+lWXMwauQCk2r4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6666004)(2616005)(53546011)(5660300002)(26005)(6512007)(186003)(7416002)(2906002)(36756003)(54906003)(8936002)(38100700002)(83380400001)(508600001)(66946007)(8676002)(31696002)(4326008)(66476007)(66556008)(86362001)(316002)(6486002)(6916009)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFNrN2U1b3oybkMxcU1PUitNL0RibDhzUzR2NUlaNUh4Z1pEUytSM3VHQTBT?=
 =?utf-8?B?QkxiTVd3dDZKUnV0TEdjU2I1VVZnWWdnZy8wL2ZPb2FuODhHRTBNZWZCRVNI?=
 =?utf-8?B?QVNpR0RRckQ1djZ4UTdYREw5Kzl3YVpkSFF3TDhJUVYvenhsWlozcGRybTh5?=
 =?utf-8?B?aFlFSENGeHU5cm9EWmRLTnFBNklmTFAxRzBQZldvT0hYZlJtUHRYeTBBQUxo?=
 =?utf-8?B?djdKeFdDVlpGbzAwSmJ1VEtCYjI1dVpkb3pmTlhiMk90WW14bWZEUlhoZ1dY?=
 =?utf-8?B?a2NCVGNSdXpCTm1TY0lUNHowb09lL1JURW9KdzlMY0g3SjliSGFBOXlTUzVz?=
 =?utf-8?B?ak0vNE40YTVsbTl3cHl0Y2tHR09DR0lXbXlUeks2dFBobmxHelBVRlZweFE4?=
 =?utf-8?B?bitZRkc2U0xUWHkrcHIvR1RrWnU2dHZ5eE8vWkhmYVZLcHFkL2tXSU9LN3Mx?=
 =?utf-8?B?UDh2T29RcHZFTXNKd0owN0wyS1ZDZUtCVXIxUUo5L28xenpIRmRISGlEVnNJ?=
 =?utf-8?B?VjdVZTl2VzdWY1RidGFjcVN6Q0d3WDRtc01xdkVFU0RTNi81Vno2amwyRTQx?=
 =?utf-8?B?N04vbEk0cEUzN01mWnVxVC9ZY0NwK1Q2alZJMkc2bFdLcDNWVkh0SWFJaUpj?=
 =?utf-8?B?NjFBWndnVU44ZEkxblJoVDdoVXZsRU9tdUxLbVVvdkJBUElheTFIcmE1aWVQ?=
 =?utf-8?B?TjhSRldSVnIvTDlPS1ZCYkFBUWtiSC9WTW54TGZzL0RpcjE2TzE3Qm82Ylk0?=
 =?utf-8?B?VXVRbTBtMFZmbzNiUWgxOWJpRm1CeCtQQkI4TDQzM1pmNjAxbVFzTFNnZGJ6?=
 =?utf-8?B?RHJ0eFh1eGtHZGhCTUZ4TXFWdnV5ZGtaRVU2ckhpU3E1bDRIMHpZTHVhUkxh?=
 =?utf-8?B?M2FYRWNwNjdWbjJKbURsYUNRdWNVR1AydzlUbHVtNmJ3SHhEK3dHNCtlajhW?=
 =?utf-8?B?LzFBZndUTG5Rem1DczJ2a1k2MmJPSkl3TDlQT1hKUGdCK0xiYkNJbThqVjRY?=
 =?utf-8?B?TWhxQk1peEgzQjh5OFVmU0N6eEpFWWhGTURtZzBTMkNURkNkaHg5UytrUjJs?=
 =?utf-8?B?OWVPUFg2TXBUY2FudkhXeVFtYjM5WkxpdHlxSTRLRE8xWkFZb3A1UlFZenJN?=
 =?utf-8?B?WUlVL0ZMZUg5aG5hbzdqM3lkRUZ3L2JtMTNNMExQZzdBMmp4dG5XSmdCN0M4?=
 =?utf-8?B?cVhUZlFnMDhEV1BPcVA0WThIY3RaZzU0ZzlraHMyakljd2R0UlNBZmdtaEZ1?=
 =?utf-8?B?dG1qWjdiODlVT1pxd3lMTEExV1pYZnFYd2E2YU1Wa2hKZGVXNC85MXQwaFVl?=
 =?utf-8?B?WlBVNjhKSFlET2E4VkdROGVZemEvSHExa0E1VCttN3VqVXIrN2ZwS3p2RGxJ?=
 =?utf-8?B?YVNvQlJ0eEhqVFA0ZGQ5NkxBdk9ZTDhBODB2eXRuK2QxZEM5aCtsUCtKQ0Ni?=
 =?utf-8?B?OFZFV3BHa093aFU1d2ZNQW5vSGJ3S200SEZiZTV6NXB6V2laT2d3eEc5LzlI?=
 =?utf-8?B?ZDcxT2g0bC94KzhwdmpGSVZ3b1QrTTc0ZXNyQWNrSVdzbEh2cWR5aVM4NlJo?=
 =?utf-8?B?N3NqSUJtZGFRTGROV2V0cU9qSDZSNGlTUjVhSGh0VDgwdWVjQm9FR21PQmtz?=
 =?utf-8?B?MWduVW16bFo3Q1FEUXNXS3lSYy94aU5LNnZlcWhtTWJRZlVrM1NDMXhvOGFL?=
 =?utf-8?B?TG8wbkZOcHhoSjU3VGdIWmY4bGJzYWRYOVlPSjdvTG9ZdHNwWWlqZVVvb0tr?=
 =?utf-8?B?ZUZSVmZYOWZoN3VJMDAzM1lqMjIvUWFldWhHZW5PVisvU0E5eVFhK25tL0wr?=
 =?utf-8?B?aSs2Wm9EaFBaNUQxRG0rWXBHTGYwZVNYSG1YYnNheWJ5ODBLeGU0U2h3cGo0?=
 =?utf-8?B?VjFaODBOQUM3WldDVElxdzNGc25PbzI4ZENUNHFRbTBsNGQreFRyTk9Pb3Z5?=
 =?utf-8?B?V3ZmejI3U0ZsWDZFRlRwRGdOZCtkVGhSMDhiY3FNRjhLeUdWSjFhd0duUVdq?=
 =?utf-8?B?cW1jR3hHbGtJQ3gzcXZ1cCsvbVRQRC8vNGZpL3Z5djc1OUVJeE55Z3Q0OUpC?=
 =?utf-8?B?dG5YUm5Ua0NnRUFpWG1MUHJoeFUzd1c1bUFVd2REZVB4VC9paFJ1ZUlvUFVC?=
 =?utf-8?B?aWFMSzVDUEo5ZU4yMnRHekZYUUdrc0VzOExOTmk3UWFYV2RrWkN1c2VEdmll?=
 =?utf-8?Q?qqgRkAcfKRuIrR43baYhkQI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c9a316-ee08-44b7-db50-08d9e7cc003c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 10:49:21.4218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2WRD60dHOvfSuVMqMbGaXW355Skv0x58VMFyqA0C/NVL9/5+Zz+zt+3snYwTLo8BXHLHF8YNqXDCel8uQmg7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188

On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
> On 04.02.22 11:15, Jan Beulich wrote:
>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
>>> On 04.02.22 09:52, Jan Beulich wrote:
>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>>                    continue;
>>>>>            }
>>>>>    
>>>>> +        spin_lock(&tmp->vpci_lock);
>>>>> +        if ( !tmp->vpci )
>>>>> +        {
>>>>> +            spin_unlock(&tmp->vpci_lock);
>>>>> +            continue;
>>>>> +        }
>>>>>            for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>>>>>            {
>>>>>                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>>>                rc = rangeset_remove_range(mem, start, end);
>>>>>                if ( rc )
>>>>>                {
>>>>> +                spin_unlock(&tmp->vpci_lock);
>>>>>                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>>>>>                           start, end, rc);
>>>>>                    rangeset_destroy(mem);
>>>>>                    return rc;
>>>>>                }
>>>>>            }
>>>>> +        spin_unlock(&tmp->vpci_lock);
>>>>>        }
>>>> At the first glance this simply looks like another unjustified (in the
>>>> description) change, as you're not converting anything here but you
>>>> actually add locking (and I realize this was there before, so I'm sorry
>>>> for not pointing this out earlier).
>>> Well, I thought that the description already has "...the lock can be
>>> used (and in a few cases is used right away) to check whether vpci
>>> is present" and this is enough for such uses as here.
>>>>    But then I wonder whether you
>>>> actually tested this, since I can't help getting the impression that
>>>> you're introducing a live-lock: The function is called from cmd_write()
>>>> and rom_write(), which in turn are called out of vpci_write(). Yet that
>>>> function already holds the lock, and the lock is not (currently)
>>>> recursive. (For the 3rd caller of the function - init_bars() - otoh
>>>> the locking looks to be entirely unnecessary.)
>>> Well, you are correct: if tmp != pdev then it is correct to acquire
>>> the lock. But if tmp == pdev and rom_only == true
>>> then we'll deadlock.
>>>
>>> It seems we need to have the locking conditional, e.g. only lock
>>> if tmp != pdev
>> Which will address the live-lock, but introduce ABBA deadlock potential
>> between the two locks.
> I am not sure I can suggest a better solution here
> @Roger, @Jan, could you please help here?

Well, first of all I'd like to mention that while it may have been okay to
not hold pcidevs_lock here for Dom0, it surely needs acquiring when dealing
with DomU-s' lists of PCI devices. The requirement really applies to the
other use of for_each_pdev() as well (in vpci_dump_msi()), except that
there it probably wants to be a try-lock.

Next I'd like to point out that here we have the still pending issue of
how to deal with hidden devices, which Dom0 can access. See my RFC patch
"vPCI: account for hidden devices in modify_bars()". Whatever the solution
here, I think it wants to at least account for the extra need there.

Now it is quite clear that pcidevs_lock isn't going to help with avoiding
the deadlock, as it's imo not an option at all to acquire that lock
everywhere else you access ->vpci (or else the vpci lock itself would be
pointless). But a per-domain auxiliary r/w lock may help: Other paths
would acquire it in read mode, and here you'd acquire it in write mode (in
the former case around the vpci lock, while in the latter case there may
then not be any need to acquire the individual vpci locks at all). FTAOD:
I haven't fully thought through all implications (and hence whether this is
viable in the first place); I expect you will, documenting what you've
found in the resulting patch description. Of course the double lock
acquire/release would then likely want hiding in helper functions.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386274D179
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 11:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561137.877494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInBl-0005cj-8N; Mon, 10 Jul 2023 09:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561137.877494; Mon, 10 Jul 2023 09:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInBl-0005aC-56; Mon, 10 Jul 2023 09:28:13 +0000
Received: by outflank-mailman (input) for mailman id 561137;
 Mon, 10 Jul 2023 09:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qInBj-0005a6-LM
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 09:28:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15b77a5e-1f04-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 11:28:10 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 09:28:04 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 09:28:04 +0000
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
X-Inumbo-ID: 15b77a5e-1f04-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARLk4+zNhBSyir56a1aQYkT2rSp8qbQhsE9XLQdTMYHKMUwgSEtDdMu/f4K7/IwrR6PSm9J6gzHQpMXew1aefDdlmzrxNkvIhXvS6U6yNg7RKtP+V/8Ii/TmjuHC8ZwwqXC4z/HKLrgrkf5JPw0DKRGABpUunVAgamNO2vZkCDDqInCK3jkd0AzMLxs3o+VDlgVcdtkPW+xzi6wrx/Y933h3SLxMpLjOztsEG2P0NWz7EJTsU+463CzlEqKUGyVpTLwibMUPjYcftSxwdJtNxIiW6cM6NDKmpsQWLNoToKXboT2YI+RYVLyogXiNwoM83B1SLSazq3fV7d98FvjzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmzfiCX7uDWW8xlqM2WZN/jP3jlHIPnTueprN3WrKiU=;
 b=oFjQ1bJ2+y/euNP2h3xDOzz4USuZXjJfcBaVIXCPoa2U/mzpUL/j9nexwKiR73TDpW2kQYZ3CGUkgGHVFNbHCWWRGH+IcbUvXwi3SQNNKRaFfeUiWlk8aHl4e/KKvovdpya+9lAz9jPV0/DLeje0R+nJodAjWkBKZkHCr45oTM++HGxR9UUPCEO5Cmtmmt5dQAgaUI1e+QdNH67gCLQuzR2vmRmn1gwmmsgZj+SRPfAXUB13Kajnel1PhnHLU4sKDvVp5TvXJdd4FuaP2ZdK7EOoR4ODDgtBe2yM4FJ7jZfp3Y1yJgw/UzY9mFjYzSIoGrn4nUaQzp+XMBWk6FGBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmzfiCX7uDWW8xlqM2WZN/jP3jlHIPnTueprN3WrKiU=;
 b=mqfAcFn39Fk8t4PUSSz9GBP5UrognNnOnSW+90yRc8mLBJ0xFUycnIeb+LhfwiGsXUejY71gA4pPJt+TrxmqFAn2MS5dYh8p20xqW/3uMGPY8qgjZEr+9TuHrVbN5QIAI6oZzqBopOdwAkKfqPiZFA6pkAxq9HQUrojFLBYiaFvBlJHHLmsiOjIRmWaH/U9qqHFiZlx/YXTE6fJdGMnjh/9f0WqextMgK0gNgDQz8qQiUaJrtsii70fIQjCtMyudyP8bBT5uqoVJgaeXfvm0nSRw6ZReaNJMd+YpGDzOjiZaSMMnYCMwAJCBapkd8T1jzhhut/UBPd5uiAtVRMYeHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41e03f85-2916-d220-8d6c-b20c424d409d@suse.com>
Date: Mon, 10 Jul 2023 11:28:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/8] common: assembly entry point type/size annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
 <e685d0d4-72a0-e628-c0af-75849fbdab67@suse.com>
In-Reply-To: <e685d0d4-72a0-e628-c0af-75849fbdab67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VI1PR04MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 527aab16-ec49-4b8f-4f90-08db8127f6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+L7zP6gWpvcr80s9GlhS6jhCPBAD1NNIIE0gzRgtg7dTWN1v/JBRIWqEJm/g1+v2BlwMPobw0fE9gmEOVZckQ6QfX85TDUq80g6apge53HxD9oVPtfZfg8dVkDrrJHH8GYzR0wB9hoo26WfOffUMk7Bh4kqOcNlDtA+ysDZEIdOAe9qVnYMPJgkN8Zet0o691y05ds3KtsNM+jLvld2wgHmfgLRq3nyQOnMded0wtJ+RZQlqLd+Y0VJUwlmWx9Fen4UtAVNo51+JtU96s3GZqH4Jh/QpQcCgeC1fu1WvacN5vZc+pSbdo8cVX8/NfRmaBO5xaWBloKdSU73syQOhJ9+D5wixGJwJFcTrGQ6S/eyYzxj/7xq/dYCsiCHUgZcTPlVbqt36o3wcbxSpIIvbIODI9RQX84fRm7pTwuw0nggyb7AjfF6mGfK1OG0Qa1hj8cLnmwApxVd0rK8gUJG//7K+vGG2juilmwM2fZh1LMoMdlq50ChK8THhNobgipeqhzHgmlH65PnUHf14nBzgY8AJ68qvFDGXzZJrlyFNOiuzidNp+6ZrFDnDnaiv5brOtfSpIZH0evG60JRkFR7BrnGwZmTQy3pw2Ud6jgwAaaKB4EHHo9sqY72o77jsaHNPrPSPNFcXFQWfAefVEx+g7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(366004)(136003)(396003)(346002)(451199021)(31686004)(6486002)(478600001)(54906003)(83380400001)(36756003)(31696002)(86362001)(2616005)(2906002)(4744005)(66946007)(26005)(53546011)(6506007)(186003)(6512007)(38100700002)(8676002)(4326008)(5660300002)(316002)(6916009)(66556008)(66476007)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGNuRmFXdHJMVjBsTUk5eG9pMFBsRHdoeVRGTUQ1d3hwdDhOMHJxM29BT3pM?=
 =?utf-8?B?NlNZdGFjVmQ2Y1NJZ29jT0hLLzFxMGNPVTVLOFB6ditVckxxVndqNUYzQzNj?=
 =?utf-8?B?eGpZaGRVZmZlMU1qK0xYVUYwQUFwWU5VRmE0UFd4ZXBEN0twcHRzOUlpTUxx?=
 =?utf-8?B?dTQ1b3hOMEM5OEZ6T09JUUo3K3dxaWVPclFFZTlFQWV0TzlTaVV4TlFEMXJB?=
 =?utf-8?B?YVBkRHZOeTU2b1F3Z2lRS0pWRFp6bXJiM2xCYVBzMVNuT3pqMlk2eU9wMDlj?=
 =?utf-8?B?aUkyc2J1andSSTVLOVJrZkltdlJKQ1VtRk56b0dFNTZOUHpRbEEwOTZZdjVH?=
 =?utf-8?B?Y1FIdlgrVnJQK3VIRElsWTAwRjBUVGg3YlVTLzVBL0p0MVJ1MHBFT2FXMzhr?=
 =?utf-8?B?YlM3ekhiZ0NOTmgxdVVhcXFvYjBVRnUyUzBlSEtOVDMzWWM3YmJla3lUWG9O?=
 =?utf-8?B?WlhPSXVtdTZKR0wwWFRXcjhxbjBoekNJY1BYbjZZYUNFOFRLdjludXh5bXQy?=
 =?utf-8?B?aWFXejg0TG0za08vREMrNkR5TE96Z3hkbUdicklTTUlJOXBYeElSb3dyZnZy?=
 =?utf-8?B?VjZiYVFnNUErNzhvajd5NGFYc1c1QWtWcGtuRWpOSjNpT1VyL0xPTGllcGNk?=
 =?utf-8?B?MDYwaDJCdVYwUzQrbDVNL0VrZFRKNnMrd0YyRGRiU0VZbm5jSjhmQjhrNDJW?=
 =?utf-8?B?bGlTZWFJWURsMGlEV1BGQ1I5K1hHQkRTYm9ibmJ3QjNVOGlFZ3hRb1BFRjRZ?=
 =?utf-8?B?eGxMajdqZGtoa2VRTERWYlB0QmQ5RWUvQ2M3NEhzRFFSdDg2eGMxd1lWdFF1?=
 =?utf-8?B?Q0lyWnZkL1Q2WjVGZWtyVGlveWp0WWpTT2VIS2lvZ0x6dHRpOXJ1R21nQkJO?=
 =?utf-8?B?NTI0OVBmQWlFelA1K296Y2laS2IzZU9pb1FlS3lZOVFZMlFoazI1Y1l5TE5l?=
 =?utf-8?B?Tkp6V3VZRU02VzgzUlZGbW1scnltYmtFWjk4U2lPd3IvNnpjR25yOWRWWHBX?=
 =?utf-8?B?RGVIbHdqWnBFTzZMWmNCN1gvZ29IMG5vY0RKZTZkam5BbHJKSHg4SHkyWkpy?=
 =?utf-8?B?YWdZSEpCOUtSL1VTQ1dWZ0MyVHlKRmRMdUt0U01jSUtDc0xVZ3V4YVViWkNL?=
 =?utf-8?B?UTBoL0M2bDI4cVNzTW9ycGhXcUNkOG1LNHduWlBHTy8vem9OYmxIVm5pTXZD?=
 =?utf-8?B?M1VxN0EzUFBzb0ZWbGk2YjNNRk4rRWhoRmVxR3R1aUJNU1BwTzVtNEJxT0JL?=
 =?utf-8?B?RDZveUt1bTNpaUl6V1l0NEZqMGNnUjd4SHQzaTFxdUFnN2xMa3VjUXlLRWEx?=
 =?utf-8?B?emNkci9jSXcrUzhFNUp3SkNNcmF2R0pOanJnWERGRmt3Q1NRcy9jY0pVd1pG?=
 =?utf-8?B?OVcxQ3hKRmpTTXp3N3V4TkxpUVdhQmhVSFVXMWF2RmtBbHlsbGZIUUswRmpF?=
 =?utf-8?B?TGlqNURTTTEwdDQ2L1FobnE5cmJ1UnRzSzVWUko0UFdqUEh1ZXJHMEZJamt5?=
 =?utf-8?B?SExtc0N0L3BQYWpObjdrMmVSY25rR1hpLytNWmpDbFlKeWJKaWFhK2xwdG03?=
 =?utf-8?B?QnJZQnYwMVdITi9yQURQcTlCRk5wV0JPR0ZUc3NrVm02M2NFc3hxYzJKNzVn?=
 =?utf-8?B?VzN2Y0JJbi9OV2Q4SVpmUGVkWWtEVjdkWHVuZkkxSTFScjJ2bXlxb3d0ZlV0?=
 =?utf-8?B?TEI3Z2VPODFhMDB2bTRROHF6MVpRL3JJUzhLY3hiZy8vVUJTeWliaEgzRm1n?=
 =?utf-8?B?V1pSN3NuOWhmQnlrZEFLNGNQY0tZelNXT0Q2WlpnVzJ0NWQvU3E1QjVWMzBr?=
 =?utf-8?B?SGFiRjBaQUhkVXNXNVRMaFNFaWVzV2lIcy9qQ3k3bG5UbmY0KzF5dGZpVzNz?=
 =?utf-8?B?NTVoaVQ1Z0d6Ym80YXBKcWcwY0hJVjBIYXh4bklaMmlQTVRmVDJJS2pja3Fq?=
 =?utf-8?B?OFJ2aDI3M3pxcmtNcklraExBVGpPaTBCRHlOVTZyS1hGL1JrU0ZNZ3VVR3pa?=
 =?utf-8?B?UlVLOUFWcmRGa1NKbVZKdGRqS2pBOUJ3UEZGMCtrb08zY1VhQjQ3ejNGQW9V?=
 =?utf-8?B?RVJELzEvc21wMFVQbTFaclAySkxsWjYxZG5EWmNsRE01a3Azakw4ZTR1Lzgw?=
 =?utf-8?Q?SHdfnHf1eS+Q1pWQBbe4mraZy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527aab16-ec49-4b8f-4f90-08db8127f6b6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 09:28:04.7008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7cKK1gVfgjMxUNTs3L7TMGW7PiwujLqeq8RTeOYD23SlVjfr8sW4ahv5s9I0KpYtfy3WyLPkb5VXm1tJABqkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 10.07.2023 10:52, Jan Beulich wrote:
> Recent gas versions generate minimalistic Dwarf debug info for items
> annotated as functions and having their sizes specified [1]. Furthermore
> generating live patches wants items properly annotated. "Borrow" Arm's
> END() and (remotely) derive other annotation infrastructure from
> Linux'es, for all architectures to use.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looking over my action items from Prague I notice that I forgot one
aspect here that was asked for by Andrew: To have the new framework
also respect CONFIG_CC_SPLIT_SECTIONS. I'll work on that next, but
perhaps better as in incremental patch on top.

Jan


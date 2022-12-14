Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E364C7C2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462103.720274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pih-0001sb-8n; Wed, 14 Dec 2022 11:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462103.720274; Wed, 14 Dec 2022 11:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pih-0001qR-5l; Wed, 14 Dec 2022 11:14:39 +0000
Received: by outflank-mailman (input) for mailman id 462103;
 Wed, 14 Dec 2022 11:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5Pif-0001qL-Sk
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:14:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2087.outbound.protection.outlook.com [40.107.6.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e98279f-7ba0-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 12:14:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8838.eurprd04.prod.outlook.com (2603:10a6:10:2e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 11:14:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:14:34 +0000
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
X-Inumbo-ID: 7e98279f-7ba0-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uwmd5ATdoA2bdxQeqF9LEZ7/jN/8gWIFNIt1NrS80Sk3k7mrjFht/7JuHxbunIlY8fRr9bLG4KcwHxC9CGenJ8ao+L4FlE4JfGoVxJsgBk87gyOsPaNrJgoc0Npx9ToesKpOgfHj0Ob9P/PX4kVMRpFiJJC2EJBkERTWPvpX0tDfPUkiKK91WIMqCFL8a2A3ot2KMW7bLcXI+mES4hoUBu5t9YttSBjCkgEePzynJ3EHFS7dKf0c/YkNaf6F9RvBumnMwVndXuNDbDFE1dMislvCTzvmNSPnY9QVilaD0P4sg3UspTFwWaxLakPScN+dxdOvjOWQaGfz/hJXM4BoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oj2yZvdIO+hFPGZx/OLVEkuVaEkfKG9rEVa0u2i/1ec=;
 b=Qjc4o3EqHuT9EN2/0KltolnpsDMnJHp1z+yn9lrX25G2BlxTNNtdNAl/8UVDLxnFdwKqZN/gcyRYHxHVyufUXnVLh0CgkBwZYfAFY2LW9OwtimNhMCvbUzbyubDdA1x2yTub69gWkdAw2gQQ1AEjuxFG2DjfTDQNdpXICNNY7ziATPZYkv3QVRaHM8cpGEDcryVduMSwhiBX+XcnnXLJa4WnPYum4C7vM5kHZLRvWC8RgTtPxHh1ZN++7AhcSy1EEoKQsTyR9HmTD4gNHggdcmDa/dm3GtKhWo88rf2/SlHlQex3hmMnQjIoX5FE4evM5UFgoifNZc1svrPavMg7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj2yZvdIO+hFPGZx/OLVEkuVaEkfKG9rEVa0u2i/1ec=;
 b=kyTl/MMGcyRkvusD1NnBHsBxn9BBb4LD3q69jyO151/7pqWBhhd0lIGcbvFmkruSu+m9I+M/o3IrHGxdFJlb7w+k3A9RzbVdkHIGzdOBzHw8CsOrd24I1cv4eaRSYVVEXmH6hO0sF3t004fFWI0Snq6Q0w5olSW05sMKt0FT2w/eJMq+oSQ2gb/b3nT3kKUUWNiIiq5nzesFRUwBfoDdnLVTMyQePBwYZ+1YSRtm3TxOoR7MZJi5tGm/aIfjtxNBdd9unoudpZiQH9n171/Gmu+WmDIZMXLEOLFZZwu8LEgj881brWniGB0AM35rCDP+mkqC1pz/6YEupSdWVx476A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3a0d72a-0209-3d98-5054-6f1d02dca1a5@suse.com>
Date: Wed, 14 Dec 2022 12:14:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 02/14] p2m-pt: Avoid hard-coding Xen's PAT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
 <f23de83cda04312c84c14bf475d7050d3a384650.1670948141.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f23de83cda04312c84c14bf475d7050d3a384650.1670948141.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: df66f86b-e7c9-4712-deec-08daddc46162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3mH3rB6yeae4aAVyHWQRfNK5Aq8vMw41WOzPRWgNiRJ0uqk3TtshmHqFIkMjW//XcWuweq5YGHm0cVtKOEbAGH/6kkafVF8HTAIWX6WtwvQw47Oi+tfoj5UVWsPuoRKJnhfXx8mtLnA0sckSHajW6mRprdxfV72azpOZv+9uvTK0l2CEEfTvo3atUDwwnQYO5DT+1zh9wk6qGgQgmYrKpHZaqbqHt+8nrB4/JrjiUAAut1bfK1J1SPQvijXdAmxOmvurRhr6W1cX69Sf/l+kzzvXKQk8yFcuvINOw5ZPR+NhGlMINgp7g/APIt27JWn5w3ExW+kXYX05pvnXfm+3L0ZYqd/lWVDGXzEKAofyENuivBsEvzrQtIk57dlGFurFaGVpss9ltXrB60tyD2vrWjEDjtOVOjBBDSaJdSKlQvhylx5uMKU1C/AbNRPySkizEC+R56OvJ7a4t3PybHxXBgttO3LQXwQ9wBi6EHAg683EGXPkK6I4VQKb1Yvl40X9VAv+oKE7N5QEAjBj7PXqffOWZPGB9JJjIO/4bHSL5P6gYCJx13GY/bZRjuj6yVl9aCXdKrslySAFVC7ydvLgaKpFVPGsinL7ahZc4qmcToXTLKN4KqaYwSI7fzYilxZmnXxlDPa1+O5qgsLwUkVaevDXcIriKQ2oHJ2hy+c6s4VsR38OqyHg9eGRQxRUSCVebm6y6eC9ZFul6AQwgIN562GFTQ1yAcgwLbSuFu/ciAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199015)(5660300002)(6916009)(7416002)(2906002)(4744005)(86362001)(31696002)(2616005)(6506007)(186003)(6512007)(26005)(53546011)(6486002)(36756003)(478600001)(41300700001)(38100700002)(8936002)(8676002)(316002)(66946007)(4326008)(66556008)(54906003)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODJDRnBpWmIrODNyVVRJTC9IMXdvTU81anlQeHpDWnNNNUhEa2gwMVVnbGNa?=
 =?utf-8?B?TXpTOVZVdFRDNXZOQitWNk1UVGhXVmVvaFk4d1BvSCtac1NTT2c5amF0MDlD?=
 =?utf-8?B?eSswQmZlWUhkMDVpM1FPaUltd2RaeG1QRVJ4SlJUVGhRSHpOakt4blJjUXEr?=
 =?utf-8?B?cmlJdmtQWHEwNWladlR5TTFXNXNiZ3NyQitRcW9yajRWeHlHdXNSQ1E0b0dh?=
 =?utf-8?B?Q0xZbkZETXJGOVIydjRVOWluemdMUzQ1R2dPZW9hY0VMQkEzdDh3TzJyNWdT?=
 =?utf-8?B?YUl3LzVLTzJLNGJwSndLb0xYR3hzQnVJZ3NhY0N6dEQ2V1BRMFFwNXpVLzM3?=
 =?utf-8?B?QUdnMmtGZjFOdENEOEVtWEhyL1E1REppL2pyWlcrVzFKSnRTUm1objNNOXc0?=
 =?utf-8?B?MGRDMG5XeVlZbTBRWDI5RWlIVDFBL1JKZ1VSUWdvZnNnUDMzQ0RmOVhtaHlP?=
 =?utf-8?B?cnZVWXJwU2tPalBlZTBDQlBVMEpaRjhsZ3ZkWlBXdW1Sa1c2YjRHei9naU9Y?=
 =?utf-8?B?WlZSWVREREd0WjN6TFdLVVNUZU9CeEtLZDNyV0dpVU1BelBoWHVmMUJlYy83?=
 =?utf-8?B?aGovZ0Vmb0pwdUNxTno0RlltQzlpWkNQYitCaEc3KzNPRHNlR2FTMlJmTEpy?=
 =?utf-8?B?M29GWGFPSTErcWpzUFovYTFHNnlEZ3lLeGY1TzlDek83OHRpRlN3Y09YVklj?=
 =?utf-8?B?QU5IcW9uandsOGFscGU1SnRNMDd4WFF1Nm1pVXBCWDcvdENPMkx6RlR2RS9p?=
 =?utf-8?B?a2lBSjRMMDlXcndOSjk0VW4yUmd5MzB4ZDR0bmVnRmFMcGVpV2JVeVgyU3cw?=
 =?utf-8?B?TGlLTXJOZlIyclYzS1RwQys3SjZaZzh2VUJRR3dHM1FCZFZpeGpLWEY4c095?=
 =?utf-8?B?a1hQR0kvT1ZZWEJWMmI5RlJFZnM3UFQ5OUdFMEtDZkx2RzN5TlVVWGh1ZzBU?=
 =?utf-8?B?WER1Ym5sUmJkUXYyNlIwVWpLUk9RTjBla1hWUWZObmlJWHpTd3JJdXNaempP?=
 =?utf-8?B?VjMzcjF6SHJ0SDY1R0E4cDhTR3JKRTd2dkZvQ3c0WlJycG5rQmd2SStNaFNr?=
 =?utf-8?B?Mnh4aHNkOGdGbS9pSGRwRTFwRmlVdnFHV3M0ZUU4NGsyb3NsWG9KYVZDYnFT?=
 =?utf-8?B?YW1JRThyTDRlZ1U0eGt0YlRYQ29ibGUzcUZ6VktDOFJCeGs5ejN5Nk85eTlO?=
 =?utf-8?B?UEZySEh2M3VKTWc4YWVYOGlIcHhDekY2Nml5TjBPU0hoSHdTbjFpbXQwZ3JP?=
 =?utf-8?B?OWoySWt5Q0VVWjR4Z2tZRTNIMWNDWFdhOVE4aS9tS0Q1UEJxMjNsUnhsc3R2?=
 =?utf-8?B?NUJDMk8wU3lxV09aUFVEWkt6QUlFUksvazZBN0ZHdFNxaitVQ0ZmOVo5NnlG?=
 =?utf-8?B?ZC8rS0pLNVhWZVdtbm8raU83M0E3M3RnQ0tRQVdVSytWZktsQU9NNnBHSVdy?=
 =?utf-8?B?ZHd3aXYzV3lHZDAvcmJITjlJc013TW5vamx2dTZhaVYwMS9xbGtUMis2QmlF?=
 =?utf-8?B?WTFTdzRPZjVHSitocEtnU3RTTGhXZWpxNDZFTmQyalBnWTM2c09tMW1ac3NL?=
 =?utf-8?B?ekk2QkxxRC95bDRSL25hUVdLVVdjS0lISktTbmQ1R0ZIZTZwd3RBZThCR2pi?=
 =?utf-8?B?czQ1Z1NsVVR0bjlUT05LZmZTaGZVRVVaSElwTW05ZW1EWjBsUkxURGpjQThU?=
 =?utf-8?B?RGFDTUhJeW9EWWxKU1dkOXNqWUtCaHZkajBYaXpBUDljU0RDb0dINjdWSXRQ?=
 =?utf-8?B?UUVrbnFDSDZtTkdYN2MrdVNFRDlhQkMvVlNuaElZMTA4M1EvU1JuZUxCSVow?=
 =?utf-8?B?Sy9LWU1OVzIvcnh0Y2JKVXZiaUo2R0U5alFqQjB4ckswb01jeFRMeUNIVGtm?=
 =?utf-8?B?clVxc3BhSjc1Mjd1OHEwY2pHdWhyN0t6WFg4aHcyYTcwVjhQZFgwTklYRXkz?=
 =?utf-8?B?OG9GbG1pNFdnMzhzRmJ1L0NMZExIWUl6TXczYTgrUXkxbm1WY0VUYzJrTDZo?=
 =?utf-8?B?M0FJRWZ6YWREclNZT3dvbU02QzFIbk1MbkNncjh0dyt4SjlBdUlYeEw5ZE5L?=
 =?utf-8?B?SzRxV0VOcEd3eTNTclREbVNjZHo2cmJ0ZVkreFpBVmgzOEw4OWU5RURnbXVM?=
 =?utf-8?Q?qFxfZ12YMZtDvvJQJupee9mpx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df66f86b-e7c9-4712-deec-08daddc46162
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:14:34.5106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0g9KbJIAyHIFp1cQLjo0sx83uMWA+RxxMup5GxbyFHodSVQful0PTGCnp7m7bJl3oPmJgjNPdg/hic2Y6Ajwng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8838

On 13.12.2022 23:26, Demi Marie Obenour wrote:
> This makes the code much easier to understand.  No functional change
> intended.  As per Andrew Cooper, the existing logic is incorrect, but
> this does not make it any worse.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm inclined to suggest to prefix "incorrect" by "(now)", or say
"questionable" instead. This would give at least a vague hint at what
the problem really is (and that the code is merely stale, still
matching intentions we no longer have).

Jan


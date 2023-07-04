Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA946747645
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 18:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558558.872767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGihl-00059C-0c; Tue, 04 Jul 2023 16:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558558.872767; Tue, 04 Jul 2023 16:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGihk-00056d-Td; Tue, 04 Jul 2023 16:16:40 +0000
Received: by outflank-mailman (input) for mailman id 558558;
 Tue, 04 Jul 2023 16:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGihk-0004yL-73
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 16:16:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272615f5-1a86-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 18:16:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9517.eurprd04.prod.outlook.com (2603:10a6:102:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 16:16:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 16:16:35 +0000
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
X-Inumbo-ID: 272615f5-1a86-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dToEMdClDj7BfeDOGuYViJkHw9ah+c6JzxTAJfROepAGuX75Ap/cmoYIKoHBuAy2LqhxtDl0xWFSoZsql9RdQJrCyxrJQfQ0fWJKb1ohAO462oJf1hSY9t8YHnDPe85Ti0dk25kpqTaRNS/bdAF4VzuYFIrSKzHHYmbWdY25OM9cxRoOat7qyvAzjKyFtqbXtE+0D4IwYy8aZzh105Dntw3eh5O88nr+MyQjUscCU1hGVQt0fC7Qn7NOviFyBhuIBLR1W2wB25jZ77Ft6/hFQ4OtDMf2oxUbta/7+zjP2SE7ld3uCO+KjxQgX4y39BRzmrx4tDcutlVAtdWzliFomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by9dNAtVxlZdy0Y9TdvuDIz6tOBX7yrl8a2VU5AbR3A=;
 b=L4FwodA53QSEc4Y19L55ixgKKLQG8RCOTU8cpVkDO2SG/uGWyU/iA2kMZFMuGkyHKz+2V+EQSH3hehyGfLZEOOyXRAQBu+5kVzLlOUrHgoMXSIjID48QTTdwxE1F0/g/fDlbYt5mFb/oH2/x1O1tuFcBkeWQNRyTwNbHH/anvSx/UzFJnYbOjm1Pte7c8cUiYhHRYWDpJrofeU8iQavqEIIu2EFXs4H/gnw23BHIxZb1P0nHF2iJHjQH27Hby06fqk9inenyZnbGM9I4P/dP3eJkY4oUad+duS3XmihG21NE0Y+OQzsrih9JwhotpFuXjQz2us3wbNdFHogYBmZBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=by9dNAtVxlZdy0Y9TdvuDIz6tOBX7yrl8a2VU5AbR3A=;
 b=4vX4WghEc2yuf2nP9laUpNIyFBCwftcCWpO1a9L3XgcXK5J5TkoAaQF8U6KOSX0pFa93FY4tAmMVnL4pPL6seFLLfQLyiyNWINcC9rF5ycHquWJ2XB305/7GwBvoG7EsdI7ytp5yKSXqbp/qA/pApz2M4StdGAfoEsHSG4HZSg6KWkceQfb5Kiig2T5ISxJVVagA1sPMtnTLyFsuFJwMXrdcytj8cZ4t23Eb3jKf7NVtVPXtorcfuPzZ7USlK2go0ttSEZvqKFHatiY5kEQE4Pib93mORxW02P5pq7TcJlCD7eeV8xF1hyDKT97DgoEHoqykyhBZEwTGz3TPDy6ZVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cbca26b0-b6a8-c529-8a41-6fc58965eaf8@suse.com>
Date: Tue, 4 Jul 2023 18:16:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Backport request (was: [PATCH v2] tools: convert bitfields to
 unsigned type)
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20230508164618.21496-1-olaf@aepfle.de>
 <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
 <4d049335-71fd-8fe0-0f9a-dfdd16fcf41e@suse.com>
 <ZKRA_X9uudh6TRov@MacBook-Air-de-Roger.local>
 <39e5b62b-d863-ad2b-5e9a-461fab6c9d31@suse.com>
 <ZKREeO2XJ9C8FYOM@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZKREeO2XJ9C8FYOM@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 977987fb-6d7f-4228-8261-08db7caa0977
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	evq+/dWFY+2CDFGm4x7JpYM/ZWnZGsYE4mKsHe3TJ9qbpW/izTkU2+PTxKlfYjB+nVoik66Kl11a2HBOsI4AvInctfOQ86f71MpVUkf+akuTtY+kJHwrwt+Xw2Rt+03vKxoHZi8zT61XyBEPqzQKWPzE4St+5tlp7pjEQy75EbgnnItivADh+6+FIMaMdxYQip8TX5Je0hTJL2DtnrzkIcoJy2KY1CWlSp58Q9W+OLsCq6ZsPKVGPDVKdrjYUJYgOZVbvurAa1/7bcq9T4g73tUC9FpVu6YumHpBSbbABZM4DKVfrC31wtn47FOngAoaQzU6qKZe51ulsWkQeBW2OwnCTIvG/yhPUlU3JC2kqXDel+OA9Fs/36H2QDunPPUU6SDoqG/Mxn0NVeC+ZiVqTYzs81cGm8J8NOR6oUKyP8eDFioynSDfrJYQxD73xjxhDo/IsMnihgNE2xcIEIO6LYpyUPG/wNYmDfEU+1zYaUM+PHnXVwTSdTllc78jeaN/uuEI2Ol5CZ6lyQi9+rIhm5VdOTd0pVH4Sgcaxd2U9QnVRqCeUHR9mhTCF9jimYHM3w637YAdCMKSY7mGPSmMDPVY9Ja2Mh2r+0liMA9C/2a8k2a50ZcYtSCPWBLtplRQKP8TzJY5QhpZdix0lSLDaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(31686004)(6506007)(53546011)(186003)(36756003)(110136005)(2616005)(54906003)(478600001)(4326008)(41300700001)(316002)(66476007)(66946007)(83380400001)(66556008)(6486002)(6512007)(6666004)(26005)(8936002)(8676002)(5660300002)(31696002)(86362001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXN4alc0KzMzL2p0OXZkdE5TNXg2QllUNWZNeUw0cWVPbjdkbkFnK1k1aVht?=
 =?utf-8?B?Z3NWWGNadkw1SU5OY1ZhMjRCZ1JiNDBYdkdsMGhzVkVtWnJGeGMyTThnSjFV?=
 =?utf-8?B?dnBKemZZUEpjSXBlTmcxTEljK29PRnhJZVd1amxjL1grUEJleC94WmE5QlZW?=
 =?utf-8?B?emVjVjZ5Rks0UElYcytHWXRaZGt1OGt5bkN3d3F3Z3RjQ3FsajkzZmxxM3dD?=
 =?utf-8?B?dWprSmRPcUszK2pielJlWWMzN0FsbTJBODljUXJpeHpyZjBrYTdneWhoSFJC?=
 =?utf-8?B?RHNLazNPMGQ5bkRCeGkyaUg0ZUUxSlRUQWlaWG9odjA1M1czOXVmNlRMZlpa?=
 =?utf-8?B?VDl6SDVsdWt1RElMeVBDOFliQlk2L25EZXVBZEM4dVBMaVlwZW13N3FvdkFm?=
 =?utf-8?B?b0ZJWXJYdHNjalB6aEw0NjdTR25hZE1acmJNRjhkY0lNSzAyOXRHaFluMXpZ?=
 =?utf-8?B?dEpmcFM0Qm9zeEZTYkptS1VlMjJmekZBSWZJbCtST2VaNGFsN2k2TEFjcks1?=
 =?utf-8?B?NEdQcmpHbklacWF4QS9CZFV4U1lXSFFUK3AzUWFEa3RGZ0psRE5wL0RFRXNK?=
 =?utf-8?B?ZVluVm1GWm5yQ1ZZLzk5eHVxblBHMHdadHk2WG5kRXp5eGoydjFtNFRtYy9E?=
 =?utf-8?B?czJUWHNwZVNKeUFXaXppdXpVT24vQWxMbzIwVkFQdE42RTVKWjAweXRDaXZx?=
 =?utf-8?B?MFgxUU80KzJ3YlAyVmZub1NENTlSanBGOU4ra1V6bkg0Q1FoQUJaNW9PNDJl?=
 =?utf-8?B?YlBNekhiZmRoclZ0T2tXR1Y5azZpKy9zN2NkRXZocU1JTlNBaVE3UjBKdGlz?=
 =?utf-8?B?d1YyaVNtczZCeVBVSW5wM2ZiYjNwSmtJMUhsVm9iTWs2SDFSeThRczdyaks5?=
 =?utf-8?B?MEZidURGZ2VuUUJQNk1KWG00MWdadVJidEs5VGc5NTlsQVhpNmYxUlJVNVQ0?=
 =?utf-8?B?WGZVR25IZHJSSm9lSU90VmpadkVLdlFtbkZSRG52SkMva2RvTHhja0p6OG05?=
 =?utf-8?B?ZnlJMVpIOHpReXB1YlAzSFVvY243eXNQSy9zOEIxcWxndmxmQTBzdkZFTW5X?=
 =?utf-8?B?RUdoVzV3RHUveDY0RlNuSkowTW43bDdFK1RHY0RRNHh1QjdIMUw5dVhybGxr?=
 =?utf-8?B?UFRndTFtSVFzZWp6VC82ZjFDVmppSFo5WVJLK1lwWUpSK3BTUjNzZ3cyZjF6?=
 =?utf-8?B?VFVCb0tYa05sODE4NWlLTjllK1NneGdJUDB6c1RvKzRsL3N4T09lTVU0bmxQ?=
 =?utf-8?B?dXBBYU9NMmZlVHV5R1lESG9ZUmJDQTk2R0JVNlBudnRnRXh4ZVRqT2lHQTN4?=
 =?utf-8?B?MWNYT0trQXZmbXhCSjgxb3ZMaUZ4QnNuN1FaWjg4YVRLSUFHNU50UzYwVkVi?=
 =?utf-8?B?WDlVM0MzblVhSDB3Y1BpckdlTXNLL2J0OUNFeXhaYUFpYVozVGlHQlNEekxa?=
 =?utf-8?B?M20yNUVEUnRGTzRzNE9oYXh5eFhnNkR5bXJTQmNWTWQwRGpFdDhJSXVGaFhQ?=
 =?utf-8?B?QjBRVWp4cHBxd2pHUjltQ01Vd2I4ZWRDY05STm5TWTFMNUFxQXVpTHArWGg3?=
 =?utf-8?B?RC9qeFE5NUY0TUdZRFNuOFAvdFI5VFZSaGQybnBGSEVQekJaSWpORG9NSDQy?=
 =?utf-8?B?MmNDdGh3ZnM0dWN4VkF4VUZuVElhUTdmblF1MjVnUkdBc1o0cTBOeG1QTDR2?=
 =?utf-8?B?dzhzaEt6cGlMYXh2eDlRczdNU1kzYTh1RjBDUjhZV0VVbkxVWkg2SnErQjZu?=
 =?utf-8?B?UU9CU2JZVFRGaWh4Mk5yQWlMdVZpd1l3by9pV0NId3BRdm1RU1NjUlQ3Ynhh?=
 =?utf-8?B?NzBJbjZleGYxOS9ITDBmaHBsaTNjMlVSd1NueWEvaGVmckcrWnY4OURJc1h3?=
 =?utf-8?B?UkZjNURFZloxL3N2T0QreWdPTXZLMStKa1dFSVA5T3hGeDdPbkJ2YkRHRWlF?=
 =?utf-8?B?empiQzhIN3EwYkhKcTNiajJ4elFWK1dVQmQxeGJWWFZ1ZUhuUko2ZDhCQzJR?=
 =?utf-8?B?UXFYL2EzRFlmdW83S0x1UlBqS2JsTEE5YVVYN2FOTVh6eEF2TTdPRWZaaXFx?=
 =?utf-8?B?cDdXYzE0bGRBaEZXd3hBZUNvN0lDSkNJcStZMzRHODdlSXh6VmVnNWpjTCtL?=
 =?utf-8?Q?hw0I+u302ZLg1swlTKuO07O+s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977987fb-6d7f-4228-8261-08db7caa0977
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 16:16:34.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmRygAFLnKxDof1rJnm4HAHjttlNynCTeQiHJQHUgSHWJokaYtstSuRKcxG9NVg6lHEHDFcmfH4jW/0Wske+DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9517

On 04.07.2023 18:10, Roger Pau Monné wrote:
> On Tue, Jul 04, 2023 at 06:04:36PM +0200, Jan Beulich wrote:
>> On 04.07.2023 17:55, Roger Pau Monné wrote:
>>> On Tue, Jul 04, 2023 at 05:42:33PM +0200, Jan Beulich wrote:
>>>> Plus is the mentioned
>>>> "potential ABI change" safe to take on a stable branch? There's not going to
>>>> be any SONAME change ...
>>>
>>> Is there any ABI change in practice? Both fields will still have a 1bit
>>> size.
>>
>> But what a consumer of the interface reads out of such a field would change
>> in case their compiler settings arrange for signed bitfields when signedness
>> isn't explicit. We don't dictate, after all, what compiler settings to use
>> with our interfaces (which generally is good, but which bites us here).
> 
> Hm, I see.  I would argue that sign doesn't matter here, as those are
> intended to be booleans, so anything different than 0 would map to
> `true`.  But implementation might have hard coded TRUE to -1, and the
> change would then break them?

That's a possible scenario I'm wary of here, yes.

> I'm failing to see that, because those implementations would still use
> the old struct declarations they have been built with, and hence would
> still threat it as signed?

Until they rebuild against the updated header, without any change to
their code.

Anthony - do you have any thoughts here?

Jan


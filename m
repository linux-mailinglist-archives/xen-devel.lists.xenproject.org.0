Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5328E6E7344
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523134.812900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1Il-00026U-RN; Wed, 19 Apr 2023 06:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523134.812900; Wed, 19 Apr 2023 06:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1Il-00023x-Np; Wed, 19 Apr 2023 06:28:23 +0000
Received: by outflank-mailman (input) for mailman id 523134;
 Wed, 19 Apr 2023 06:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp1Ik-00023r-2Y
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 06:28:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60e498ec-de7b-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 08:28:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7128.eurprd04.prod.outlook.com (2603:10a6:20b:11c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 06:28:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:28:19 +0000
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
X-Inumbo-ID: 60e498ec-de7b-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBGDIOjIgDDsr0umM0Ohv3XrvY3yeflntmmBwrmzRJDsBAHwqbzOETlSpZ+PrtYsMrLKFWw6SITHGJ/YSlze9WBUWh6wZ5gyUjX/j1uKQJjOPJb+CRk7+ULap8VGB/9JWgmadoeRwfpx+Z/yF9bjYSz0MFxg/X3DkorrOtwg9AYTN/5aG3SwwMSmD/2/odgOxTpp1JZqE6W/8bnFqyLqKm4pBrE0TPDmmOrgpfkLm9KWGqeh0h1N5fXu/f3bvG4xf+2KvjPlBdaYjRoSoK1j58e9sTovDym/extkrngexgajjnI3XYsKA6suhvEKhylMz1NZv4XlqTvenZOw39mLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zppZioHxju2k1rOcyDNlXjKuHYmML04feaRLOpSEdxY=;
 b=FZL9ZCZE6Hg/wUXSyx6mRWXHHWichmXfaX5YHia9DhH0R0RyF8dZ1Cy1A8p7Qaos0jbfXtOJ/MupaE7x42WkVUeDilupu0N/Y4LEVKkY3HUFdXNnA2SX+GB9aoBO3wIzKnccTQmeYFAzOflbz5T0Gn1uroFOfo2iPhItkAGGOhxx5cCz50LEEnowO7DcrrZI2YWBSRdNrWQIY6zmWHwUpdDvcMNISU+mCGt484YI68uzH+YEyU0SnwuS7vmzNk3zRcCQPm6qbqCbQr2Fip37bPHW4DEvCaA6HtRWwocU06x0IyPdG22XNb4Twi+TP0QINLLcljk+d5F2dQKkaTvCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zppZioHxju2k1rOcyDNlXjKuHYmML04feaRLOpSEdxY=;
 b=sZer6Iqf81bMPlzyi+oZUx6pqpB13qre771vs5SlkeCsaMX3Z8px75hcCZB9M3i3Zd2rNQ0c5l2YjtP7idbwPUusnaDpirwIU6saStxK8Rg4TQRbr+S8/7ccLO7aVo4l0UzYs0hQmpqTozf8+GZyhhUx1GZgRyPdJUAzfI74d3oyJ9O+31wjtcWBVMEQb+R9dJJmjDkCcVKGc/K4q9hyCtFmimaaLP3H6zHJodkvq/EozWw9z9/U1VQNk77mUFJVGc4FxP1tmw3/3ARTiVDXjDqXmBZ2h+zhgzlUR95unIVrJ4oYX0o1cXDF+WFaaPma4Gr1pWzg1TzHRPK4nRe6IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cbaaf12-bd11-ca04-eed1-f8848290a692@suse.com>
Date: Wed, 19 Apr 2023 08:28:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 71040519-5356-4ece-d47d-08db409f43dc
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1h/bk+3Zmin+UgtdK05ZodSQ3Y3Gulk8KO8yKh2pjmihF4AROav1zv6XPJwTnc5lJLHsEQC8E2X+MH+ms6+kSlx4UIrQul/34O6HrsW5Uc9oOJzkBaR28v23xyHfb+tMUDTSNpqjpSElevKpDn6uUipNVfdPCKmoOF2630TxrO2P21FzinJAd7yI3bzOwptCJ2rtEZxaVrJK0up/BqkBdU3DDFsInyHXj7WKQ0ftLuM7BERuT25+W8c52iMLlZLZYUoAik0tGPbi0esjIUs3ktU9fViP7ZDp8QTN38tb65Efp4LpIZ6HvrecaLdArCVjK6oGpI51Rr4foI5jnoaDrjPCUDqJz+Vfcrs6mCGj3F5gTibpT/aYzKjFwbl2f02j4/u7H1LqEF8KhFwFfh9EFyIIQ8pW3JuYzdhN6ihUl5JNFjcwFWBRcxYJvdyp8zi2opm5N43/pr94Ehu9naz7zIgK2erlELvZCnUxSUVklfbe8z4jV50N9V2/Ows4UzZE5tCN4Dzm8jSkaSxDRPpsrqK5uosgH2zJmTNQnMHBT5pdvNbjK4M3LzXDA+GKHCGYmsTMHJFndQjAw+1tG9Gj+XkttGr8u4LuAGz/lKiaAGeU8JsoyYyj/glrWtE3b6F094HtPASLBdgC74sMkQGDNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(376002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(31696002)(110136005)(86362001)(36756003)(2616005)(83380400001)(6512007)(186003)(6506007)(53546011)(26005)(38100700002)(316002)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(31686004)(41300700001)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NllXVUsvMStYVXlvTU05bTlYMjM5bXVwQmsyS0kwWUh0THdpc25NeDN4cGNs?=
 =?utf-8?B?dWJZUzY1YW9UczljaW0xNE5SSkNyalhsMFBCL3ErVXAyVWYyWHJaMCt5NHZU?=
 =?utf-8?B?S0xuTUJwZUpVRUk4ejgwdFV3aFNrQ0JhYlhqaDZ6RW9rUm5HUWhpRENBV3Rj?=
 =?utf-8?B?VDhsQTZQRnJiZXI2M1EvUVlLVWJGOEFKWlBlSFZxbmFoNU5EVGRGVUYrbzEr?=
 =?utf-8?B?RStWYVZyQ2syOE1lZGFBMlQ1VDhJUUVxbHpCVmUzaCs1N0dlZFd2aWdUMGt3?=
 =?utf-8?B?U2o4SFM5ZHNKUWdreDFNQkR2UHN1MFY1cmtkTFVXdUdZeko5enpOYXdoOXNF?=
 =?utf-8?B?TmFleExJVWJNblZtWkV6VDArbU5pSmNUcTN1VWZGQjY4TWZSM0xrcXV2V3RC?=
 =?utf-8?B?ZEM4Q1VnbUY4Z0FpdmR3TjlaUnEwRk4xN25lZmV6VTZGYXhtUVJPc2xKTlZC?=
 =?utf-8?B?RzFzZVBoT3RWb2F0cXdYQ0FBczl3S3ZKVjVXd2FuYXExK1Biekp1NTYzVVNS?=
 =?utf-8?B?UEtPMW05QWVwTFE3RCtROWtRa3lHVFNlWldXeGU1cG04MUROdmxyNTZURW5k?=
 =?utf-8?B?NFZIRk51TUc3VmU4ZlZxdWlKRkljaDlvdUxqRWRHSkJzMkpXc3dUUVhoMlZ6?=
 =?utf-8?B?YVJGTWY0MW5pN2kzUVZJNWVkbkJ5TDdZOFZieUttVWVsMG84QWM3bVhsYXlD?=
 =?utf-8?B?VDZZREwyU3pnNlBuMTd1RGJYVGNUUkwweE8wN0M3WmRyVjVRTkJMYTZtWDlY?=
 =?utf-8?B?SzZ1L3dwdFZtYTg3SjZBUWt2Y1ZrUWNzYzRmU1JCS01vMnhZMnppZENxSjly?=
 =?utf-8?B?TDh1bkM3cWYrOFk5UUYyTlFtYjFuWUloWldRQUd6YVhIeHF4RElMdWxxMWxS?=
 =?utf-8?B?T0g1MVFYU3lvUW9nSkZPZU0xVncrdUgzZlg5R3MwUW5rcElMT0dqSmx3SytE?=
 =?utf-8?B?MHJhMzlPUXJnbi9aTjBYVHRRYi9VdGhndnZndzl3Y3VsVS9PUG1DTTNJRDY1?=
 =?utf-8?B?K25Rakp2OWg0TUZndThQbnRTaTlVUHNQUnVKMUZDbk9OZlh5YTlHV1JuOGNr?=
 =?utf-8?B?Zmc1Z2hRNDhnWHFvS1EzVWdqOFQxdTlCMG5LYUxHQmMyYW0yK1l2V2ZnMlBE?=
 =?utf-8?B?M0hoZmwvL09uelFOQ005YTkyMjdPYjRQZjN4b2VHR3hMazNVenpGTXcvT1g5?=
 =?utf-8?B?SzJRY204Q2Y4QThSSDJEZ3RUUytIR1oyeVFCWlB6V2FpT1lMQTlPeUk1L0FH?=
 =?utf-8?B?QjJFYlpBSk1tR3YrUlAwbkJJVlJOdGQzeHYwL2FVSVhhVVlNYTFPSGt2SFpy?=
 =?utf-8?B?Q0tQdWk4QXZxY2g5NmFrQ1dlRW9MTW16czRsRHZRc0k5TC9IdC9FS0VQcytV?=
 =?utf-8?B?b0dod3EyazAxR1kvSmdpcXBMYUxIWkxtUDVLckFSRkFrWFEzeTNLV0pGQUd0?=
 =?utf-8?B?RmVZa28xdzhBUG8yNG5vQjFBcVpCQWwzTXF0UlRrdXB5MC9wOEh0bzhhVWt2?=
 =?utf-8?B?QVZJU0xweDZEWHQ1UHVIYjBSNk54a2xlT2lPNnI5eVh1T3ZXNXNWSnZBeDhY?=
 =?utf-8?B?ZnVtM0VsMVBBbEVWU29SL2lscUk5VDR4elVaaHRDZmNSWkF2T0lIM2k2aXAy?=
 =?utf-8?B?YytWM05qUzBUMit1ZVRSN0x2Tk5yYmpiazRDeGdwSXJPaVQ5aE85RXRwWWgz?=
 =?utf-8?B?SXA2Rlg2OWc2eHlvd2Z5ayt0L1lXTituVDNtTDhuUlhqSlBpNzdZRmVzY3Ra?=
 =?utf-8?B?ZHRUVlV3cmRBaytLajY5SjhKOHRSZkt1RDFBNE1CZGEvOFpBbkNoaG9iSHpq?=
 =?utf-8?B?NnVrQkNsVG9YZkRQUzlYa3RwZXNOV3NhREl2YkdGTUFSNWpoR1ZvbjJzeEhQ?=
 =?utf-8?B?TzI2SU1xcDdTdWJSQTJNaU9HdEpIR1oxVzNkSjlBK1hBdm9CTmp3WjZuRzkw?=
 =?utf-8?B?anRobGNhRFpGRERCQm94WTVDSVg4b21LamVucUNSWS9yOGtKUFRpalFhN2xl?=
 =?utf-8?B?Q3RTS2F2NHBUenVsOW5nTVNGSERDSXp3dGlpSXdJMXdkTmtBaWJBMlgyVnBK?=
 =?utf-8?B?bDV6S3Riby9lOEtEWmQzMWdJUzZCM2pkcTBmRFhaSmhMT2hKaU9mVVhFOFBB?=
 =?utf-8?Q?4jVbFs9VV2niCypNefUc1oneM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71040519-5356-4ece-d47d-08db409f43dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:28:18.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tX9GdR3zJAzh3W6h85zVHlTXCfd0+Wt3RHPwskZMzrzydXv8Oz5EUXMqqUm3ObEabLvUsngu14wxLae2aZbXhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7128

On 18.04.2023 16:25, Julien Grall wrote:
> On 18/04/2023 14:13, Bertrand Marquis wrote:
>> On this serie I would like to open a discussion on how to handle the vector size
>> and the corresponding command line / configuration / device tree parameters.
>>
>> In general the user must either give a vector size it wants or has a solution to
>> just request the maximum supported size.
>>
>> In the current implementation if a size bigger than the supported one is provided:
>> - we silently disable SVE for dom0
>> - we silently disable SVE for dom0less
>> - we do not create a guest when done through tools
>>
>> This is not completely coherent and i think we should aim for a coherent behaviour
>> unless we have arguments for this status.
> 
> +1.
> 
>> Is there any good reason to silently disable for Dom0 and dom0less only ?
>>
>> I see some possible solutions here:
>>
>> - modify parameter behaviour to use the supported size if parameter is bigger than
>> it. This would at least keep SVE enabled if a VM depends on it and could simplify
>> some of the handling by using 2048 to use the maximum supported size.
> 
> My concern with this approach and the third one is the user may take 
> some time to realize the problem in the xl.cfg. So...
> 
>>
>> - coherently stop if the parameter value is not supported (including if sve is
>> not supported)
> 
> ... this is my preferred approach because it would be clear that the 
> value passed to Xen is bogus.

I did say earlier on that this comes with its own downside of preventing
boot to complete for no real reason. It's all Arm code, so you're fine
to ignore me, but in similar situations elsewhere (sorry, don't recall a
concrete example off the top of my head) we've aimed to allow the system
to boot, for the admin to then take corrective action if/as needed.

Jan


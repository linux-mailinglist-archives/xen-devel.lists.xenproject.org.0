Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275F6169E3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 17:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436010.690025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqH4y-0002JP-5J; Wed, 02 Nov 2022 16:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436010.690025; Wed, 02 Nov 2022 16:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqH4y-0002Gq-2J; Wed, 02 Nov 2022 16:59:04 +0000
Received: by outflank-mailman (input) for mailman id 436010;
 Wed, 02 Nov 2022 16:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqH4w-0002Gk-DT
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 16:59:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5de1714-5acf-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 17:59:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7597.eurprd04.prod.outlook.com (2603:10a6:102:e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Wed, 2 Nov
 2022 16:58:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 16:58:58 +0000
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
X-Inumbo-ID: a5de1714-5acf-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvUXTMM+P+jhIsO8H887gdxI15wWmsF82XTmxSq/Bp460v3OLPpOvMbZRyCoAmxIBE1IseGToK3LJlf1z3tgGiXzycenps3dT2397Ok51VFKxBlEph1166cKF6N8oj44a9rsTiDiJiveKqWY6PbjWtSxTi76vzQpLyclISgIey0Dv03CIgpNb3BQCRion8Er5lveXXKWnpu3U40X2nHcnL7U98LNQQ7FTllxg1A2+7y87gz1IdAQq0sAG/dDwojbswYItljjw8pOB6C04ISWhfP1g5qxqcbJDs2zNVVldhUlCW5i1kf2N7F/6ILBJIsJS2ZZGK7kdzC9c0Ho18wzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IomqiuNnTUlFiZ1chlqnwiTLBJlaV13P7OUVhimZalA=;
 b=grkF5cqm8vyg0+rsw67Th5iWewV3void9B/aI3RlZxgrcxvzhv/dlsvSaY8zmW3lj+ZFKfrnb+CSZMVO7nf5ZkoEat2if+iQTOZtYTbSwyBvL+Zz9nxi8bP9XaqAN4OpoV5QyqI4mjVKceSu600f8N7NNkcroHQdqigPc1esmzf2/vJYCqP/gKLzYOeBhdNeIH14RBZ3GVbNgGplcVGCdox//FJ8HA+OBSvSQ0Tgz2Btr/Ajyldi6mmyf7Hs/iY+n6BINUehx8a9P6npIjZ7+hGrtvJQLXrTg/uVOvkaEsJWb7AGsLGdthQnza47Rn0mwPQFOYsQp9SMfyu3eI1KJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IomqiuNnTUlFiZ1chlqnwiTLBJlaV13P7OUVhimZalA=;
 b=W6ES+/IMlbDQ7oXCKnhUPhjM7DNr8ww3l9i6rTfqmzQ7ynZEdMvEL8So1PkWzMwWR/djHGAE0KpFzGZtthqE6vv/+EzpuhGBLylmN9VARLNUOZDsx7X9hUCKjfAzlCv+mV81uA8+h0P01FKAN2a5tnh2gMDsALgG3gyBp+1raK6feoNZxkSQZye2Pl5K4bdLUWc7xRZs4xE08ckPj9/V1oDPQWyih5SIpPXhBC011vTjca+k3MvIIcdeW/iT6Y9XxP8TcEEoBHWLhcDYstEv8tkS2f3cd16t5jAZblRbLatBXe24rcdDPJNzHSRy55VWnZzK4C0MhFQ4TmZUHxFzAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ee2c1f9-a6bf-7641-16fa-ce2ea90f377b@suse.com>
Date: Wed, 2 Nov 2022 17:58:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
 <Y0s5Xvr5PBQq5pVB@mail-itl>
 <AS8PR08MB7991A2F3DE5A5B55ED3D09F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2214fd86-0cfa-58ef-39db-6f913a9de75e@suse.com>
In-Reply-To: <2214fd86-0cfa-58ef-39db-6f913a9de75e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: abc89822-d461-45e6-1687-08dabcf38896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z70dDITH+7ZNlt7cr9FjopGajZIeSqVn3Rhu1rwq5ZYXPFeXHFctixHSOATpvb57ERecWQtp4JLpCBUNdYEy0HcjMUNbQF6zW1IFOwJNQ4V10QQ5hFKnhuubdJFE8IihQWSvb8bS/HxhK50IDNzD+ZLCCzD4VAXRda2e93kOzirdvL2HTM/JbFcsK843aMfuObG7v8MDG56micYHrSz5v7D5VbOxGXbTtjgKgrq5uPK9UqSAjH+iSIUKA9GcPsZoaVz10iPpOByUZkxaxQJUyofEtciSD7lDdCnxNimJIZcT8tPdzIGisUx2nkShyVBhvy0dVAlOH1JCxN7RGiEP10OpbEAOKPk5j85UGGnQMsaCMefM3QpP7PehNhlgxsV2vJSl7AZTyYiEkV/1n7txNwy2e/mH0XfTZ269Q6KHZ02IOtyF6uWIYWhJoyESKPuv9oBKiL7JzvSSeLwoXLwCYGbp/Y7CotdH2FbftZwoDvLIWRMfFrhRgDNSs0YSRD5QimopXyhu95nuu08WqoINYVvGFd08+D9M1eWbajMo7Hx/JOSR4Yf7H5gLNujzbd2aYPeiJF1hBsa+p6AAMZvqBII5MbCdZPWkKwTTg2pkeq7SWcgNmq3aCJCa44kpubdHHdYtfgem5/ttHo6wx2a7hdZJG5k+RAKFz3St5tTZiOtqpxvyK4voIjx7jpKTp2NVQPRqEti1t2fSFoz9VuT70d7Q2TH3EYyz8aZj91VyETScTcnctfyP9YK2Y7UML1TeURo1PzoWmiVhuyCQI3Nud+Tfx7+VcjdsPL+BgIxQJ5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(83380400001)(31696002)(66574015)(86362001)(66556008)(6512007)(38100700002)(2906002)(5660300002)(66476007)(4326008)(8936002)(8676002)(41300700001)(186003)(6506007)(53546011)(2616005)(26005)(316002)(66946007)(54906003)(6916009)(478600001)(6486002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDhNOG1QbU9hSDRiVXB1bjJEY2NpTldkNzZEUGphVEltWGRuS1NrMWwzS2ZG?=
 =?utf-8?B?a0x6TitTejBTc0dza1hkZHZpNHZKbXE1dURVZlVkb0xCY2oyaEJ0YTkvL3R6?=
 =?utf-8?B?aVdDR1czTUFETWU4U1JHOEVRdFZVc0crZU5RQXhNQnFEUEI4Qk5RYmRFdVpy?=
 =?utf-8?B?cStmRXBsV2VvZXRMdzMwU3VZMGRwOG1HdWxvU2lOWFphTnROeFJFZ1NXTk5B?=
 =?utf-8?B?b2tmc1lvQUhpV1VHeS9XcXJWanFORk4rL0dOR2UyOTRyd2tIWkJuUTRDZk5E?=
 =?utf-8?B?SXd1cTZWZ3IzUDJkbUZUTmI3ZGNyZEZaVFFnTk5DZGhnTG1xaTMzQURka2lX?=
 =?utf-8?B?Z29PTDd1WDdFVngzbit3NkdWQVpEN0tSQjRtZ3o3SFM3c2RhSzRSOUtTcFZP?=
 =?utf-8?B?d2VJVHBCV0dzNm40QVMxRDF5bFNmWXhJRjlSRzg5VlcxMlMrYU1nYk5pcXJC?=
 =?utf-8?B?Wk12ZXQvSkViekFnZ3pJMCtISEZoaXRaYnhNT1IzWDN1ZU85RFZxQjdtaGVl?=
 =?utf-8?B?a3dGU2ltSG9kOWIreXZoRnhGMnptSklReWhMZDB6UEViOEV0bXFwTzlVbjFQ?=
 =?utf-8?B?NmdpU3RhRnF2cExPWXZ3NXFZVlprTTl0VGdnSzlWYWpaODBGbmhYY2V4RzIy?=
 =?utf-8?B?WXlocFEzalRXTk5OdG1kZ2VjWHFlTzBndEtRK3h6M0xETG5TdnBxWHBQMUZa?=
 =?utf-8?B?cTd2MGY5SmVHNk0vSFBKeUtzd0FXMVJzeXMxSUcxV1p3VHlCZU02d3ovYmto?=
 =?utf-8?B?eEJ0bG1TYVpCVVgwR3E1Q25KZldQaWJZVzZ4bzVucjBkQ2ptSW5wdkhGNzMw?=
 =?utf-8?B?YW5nWlpmd2tDT2xwbWg3NHVyZWkzb2JyU2pJcUNJakJJQWFZRVZ4KzRJOFp0?=
 =?utf-8?B?eGkvbVJTcVVhbUo0bGY1VllxZldZVHJpaGRGR3I3QXJ6RGt6NlRQOEtmcWlD?=
 =?utf-8?B?cUxVa1lsa3VkNXdwZ2hUL0lRMG9RQllKY0FGMzVxUmNQY1p6ZmNNekMzLy9k?=
 =?utf-8?B?TE54dm1mb2ZaTWN2eE1YTkg4b0taUnhpOUpCakxuYkRqSlFEeVNzdmtuQkFR?=
 =?utf-8?B?Sk5nZHVyTUVTd0p4ZGhGUHVIOTRjUy83UVViWmhkOGFaTzdMTSt0Q3hCdlJY?=
 =?utf-8?B?U0FxK0tsVkIzTVFtY0RONnF4QzVlTkFxVTd3VnlDdXliSE5pOGcyMVhhOHdX?=
 =?utf-8?B?c0E2RkNqdnU3ejgyMUsvdmk5NWdlM2tRYTFuZTBCZU9MQ3FwWVBFc0tqOXhU?=
 =?utf-8?B?b1ozcVZTb0Zkc2U3ZVN0dE16UkJlWEZqYkh6Q0lUZ3JLQ3hreEdTUlB6bkxr?=
 =?utf-8?B?QUJadlZneXl0bVh5RzlremIrakV1TDZwRERHRXBMUnFaRVlWNXhwdWlFRmQ4?=
 =?utf-8?B?UUxIVGYrM2JZcm1MTmczaUkvNnJ0U2xqd25qSDZNQzRuWmNucjVlMXBGQUdh?=
 =?utf-8?B?K0NqYjhweVJxOHgycEt5eE93ZDc1WllLZ2V5WmlTK1MrMjRhenJYWmNrVHBY?=
 =?utf-8?B?U0Q2ait1aGxZS1JwZkxDWnpoWDY3TjlGb1ZNeUhSaW5VMHJQM2pxQ1pDTzMr?=
 =?utf-8?B?TGNvUzNvUTFOdW42UHNDdTVDbVlkTkp0TGN1UUx6ZTFPcW50cWdmU3RxMXg2?=
 =?utf-8?B?enlJMW1Ib210QmFnUEtMeDR5Qk9WRk9FREpadk81OFNXUmtkbUdPUWtHOUxw?=
 =?utf-8?B?Q1U4aWJxeUhENWEvRHA1cTZweUJ6M2xtK09hNHBtOGVDTnpEbWk1YU1rUThx?=
 =?utf-8?B?MUJySXJWL2FhRHVqNGgxTnZVcW01M2JVMTVLd3VxSXdjUFQxRE1aQW50Qm8y?=
 =?utf-8?B?QzV4VGNYaHVxSml5c0x5SWNDbzdFUldsVk5FaTJyWEpTS1FmKzd5Q0hmZmJX?=
 =?utf-8?B?KzNDOXpDZmJWSVRZMmJGZzQ5SnlrNWdGeFlCeVNkeEJCK3E1cnVNTjVid0Fl?=
 =?utf-8?B?Mk1kbUJwSkpvNjdBN0VzQlV2TjdOZWh0aWVpWGZzT3hxY0p2ZnVPMTFwNlY0?=
 =?utf-8?B?MlNGR3ZpdVMrYVNSUGVTdnlSekZHczJLa2Ftamh0ZXFCNnlKVHZiSTNGbDB2?=
 =?utf-8?B?bU5HdFZhamZBV2VRSU8wTi83d1pNVWN1S21WQk9xRHMwd1pPRFRBbUlXeGhM?=
 =?utf-8?Q?d8nRA79ui0JmgL/gsKsNRihio?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc89822-d461-45e6-1687-08dabcf38896
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 16:58:58.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOTY8ht7dxeDq0GDRZVNDXXs+60kHYq6biBQnC4/iTOOTtkUWWVABURBF3JDarqaWw9ayfYgQri7HruqFoMhWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7597

On 17.10.2022 10:55, Jan Beulich wrote:
> On 17.10.2022 03:20, Henry Wang wrote:
>>> -----Original Message-----
>>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>
>>> On Thu, Sep 29, 2022 at 03:33:12PM +0200, Marek Marczykowski-Górecki
>>> wrote:
>>>> Re-use rmrr= parameter handling code to handle common device reserved
>>>> memory.
>>>>
>>>> Move MAX_USER_RMRR_PAGES limit enforcement to apply only to
>>>> user-configured ranges, but not those from internal callers.
>>>>
>>>> Signed-off-by: Marek Marczykowski-Górecki
>>> <marmarek@invisiblethingslab.com>
>>>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>>>
>>> Henry, can this be included in 4.17? The AMD counterpart went in
>>> earlier, but due to late review on Intel part, this one didn't.
>>
>> Thanks for the information. I agree this is a valid reason, but to be
>> safe I would like to hear opinions from the x86 maintainers (added
>> in CC).
>>
>> Andrew/Jan/Roger: May I have your feedback about this? Thanks!
> 
> Hmm, not sure what to say here. Yes, it would be nice for things to end
> up consistent across vendors. And yes, the change here is largely
> mechanical (afaics) and to code most of which shouldn't typically be in
> use on systems anyway, and so should not pose an undue risk. But still
> it is quite a bit of code churn ...

Was this lost, did you decide against allowing this in, or were you hoping
for further responses by others?

Jan


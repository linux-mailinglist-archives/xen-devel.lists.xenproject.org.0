Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77657645698
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 10:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456094.713794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qpp-0002tC-Uw; Wed, 07 Dec 2022 09:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456094.713794; Wed, 07 Dec 2022 09:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qpp-0002q2-RF; Wed, 07 Dec 2022 09:35:25 +0000
Received: by outflank-mailman (input) for mailman id 456094;
 Wed, 07 Dec 2022 09:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2qpo-0002pw-2X
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 09:35:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 789a745f-7612-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 10:35:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8086.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 09:35:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 09:35:20 +0000
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
X-Inumbo-ID: 789a745f-7612-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXcTDaxh8UHHgmJTfbaAcHYa5drXz1Q8iRs+MseC1cMjURDXkAXCAODYrAfBHiFngGit6NZzoRAvi6KfiE44IGOX8BFYIh1SUSUFeh7941/zd8Cylo0kWs/Pwg0l5m09lecZzG3pw0ybR49A8YVNtIRMKIPA51uwuF87BM6TW14v1/6NN0LebXA8FhoixsnMC2To+YEb835L47eE4mwkAINKbN+ZLK5gKvXVKiND/efCrQLaUWOjMTlsYyCPbGhJp4B58xuqGcYDE/ECNaWVkbIvTdsJPXtoYjXsrJdjzgggZ/iuoNJFCNCKbFv4m9JbRG+1iYlKw+mbPdtJdJtIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxae1yATAp6N379dC+tQtCC7DRi5ZvGkIdqojpxhE5A=;
 b=Ds6dQ903qLANkiBhgJxJNZi8ux0UUGcFU+X/vya1Z5xpC2WtFK0qiVsUP8q9XMpaFR/WOtpTZ7v8PMYyg5Uo7+iRrRopVJie5ScDS9RyXxfpYx7jlN0WbNmVSlqqQud+RWhsv+8lOOl3XGc6aJgcLrh9aW98llGBDp9RVmVMBo5XpQ8Q1bRTS5cRJkXWRuFMLJJcekOcxPJBnckdEa0rsOWuFspOjWlw6yY3Qzijatbk8NjVSdcz+IKQzCvDHVpaBzBr3m5i9W4XuCkkp2Et6Wnx1+X3LJD8LGrlQiRaHLAZ20mEFSG+tP9ZMNeb44FWxLO2dBCXmRSOFVIOAVOZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxae1yATAp6N379dC+tQtCC7DRi5ZvGkIdqojpxhE5A=;
 b=35lbKcojGJuO1teWRQta09kAltVkirnJ/jdThlgMV2mygawRjNIG1yYJBDZD/JTmUxUJ6VPpRNc+ZKNaJI9unQsd7gWgxJy9oYv6dxiSMtmXBz1eOVg/HcJumoM5COhiqMBR13wlpUf2ulaNBnR4krZXOjFQfay9M+rB8x8wdwEjZjv86UdmUgaKb9dVFidX+LiS3ajgP6/jWL6Kd9TyE4PnurY22MDd4RbZIZvmsPxzXSjGRLxr+pa4nTwsL5/RP7uztTI6IEG9Gjfhips6dWc4u26tFPOhRcPJhzMhNMaPy3zGYR/aubvx442GpEImEcQ7b+IYct1oYGKb9AIrrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <780ba615-a375-f32c-705d-64560133085b@suse.com>
Date: Wed, 7 Dec 2022 10:35:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
 <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
 <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
 <606aff14-8abe-1788-6bc7-f3b279db8106@suse.com>
 <5bde8110-bdc8-e5f6-8677-8ae23f4990c4@suse.com>
 <e5fa33d5-a82a-606c-2ab0-013a9ed72c08@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e5fa33d5-a82a-606c-2ab0-013a9ed72c08@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d071622-e42d-4fb2-cf2a-08dad8365b54
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JRj5yZKH+SzQkAtL+iMd2mBVOm7+DqktqmdykCMIQPHWgy9pAYhkbCRnHlNShZOmNOTx34AhQeJ1Ku3QkZ8FcCPinEi9j+FDJT2wRUYACy5a1kp53axH78+KZsDOEc7mVQGnXSP8Vs/LlKkjOCXo4IWpHFXjlaG7+bJ2gfM23nxYMvwbuTYoetOB7y9EkEEYqVlpiyWYm4FkqXY+dlJer/OspOo+42kELIENkb+ZU6CPWy/GPh1pmro5q2CUg4CUxOeFDtvIKibobNYueQ8u8XwHWaVZwlsLzhmT2wxtP0p8CpEZS82UR1ts839XQ87IHj8KjBzePdtCrYEC4lIP5EhWHV/C1YwLvK7iO+dpvmAQjbT9pe0u/Pi86DROP2ZPzLiZx0j3Xv82FX2E76W6y9B3LTRAL2RW/8tJElHPy6ThuEPrK6RLkLt4RY6C+FRe4GSFOclz5KXGdbtaNzJkDDe0pmee4F/WAZxVfCO40S2Z+UGuH5GT4bH3TgUWDKe+0afYoJvOl7Sxqw7AT30fd6sHyOWQZuBVHPjdRQLMqe4joSze/6HgOSKg+mkurZBhV/ToTfP2mRO2KhcpI5xiy9INorYfEX/mxfQ7JO8yK0nODlOOJY2CiFTsUxTeDtL5AzTxbu6Sg4OwzJ6STAp9IGvzeSFtFVU7XKdwlySPhyEaW2dz2vv+unfRf3fA/O+gY8GIsmUdxoCi0rkBbVb+v4FGdqWX/jTTIEDfYc9FYP3TQRw8oLxyRQNzF57QupcwNOyW/bqPC/SfZG/XwlZrXGkQQ2SkVuJqTuDTHHLSlK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(36756003)(66899015)(316002)(31696002)(38100700002)(41300700001)(86362001)(31686004)(8936002)(2906002)(4326008)(5660300002)(83380400001)(66476007)(6486002)(66556008)(2616005)(54906003)(478600001)(110136005)(8676002)(53546011)(6512007)(26005)(186003)(66946007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWlkOUZoOWNud2kwcDE0U3JPdWhZNTRJamhId2ZiN25WSXlabm5IMlgzS3Zt?=
 =?utf-8?B?UmVyRW9lTlRBaFovOVpwczk2enhxSHJWTHNQYVVjV0NBcUsyOTk2dHV1YUY0?=
 =?utf-8?B?VHhlK0hGblhhQUtFc2U3WUVVcUF5MWhVa2c1TUEzYlVaNzRiU2FDNlBRb3JM?=
 =?utf-8?B?YndBNjhxV0Q0Z0puLzNGaU1HNzVCTnJ6Qy9jazlhWi9nYjhIRFFZYlMyUkxN?=
 =?utf-8?B?R3VhN256K3U0dXY3djkrL1pEN0IyVklubjkxRXFkN1NkL0x3b0lQRHcyT1NS?=
 =?utf-8?B?YTJkNGRyZEdLdURad0NjSzJwbEphbVdkUlBFbDYzQVNlcW1SdUk0ZlN1WTZr?=
 =?utf-8?B?cjNjalBUWG9JZnFVZjZSZ1BYazdFUndON0gya0sxVUFCbUJVanltUzJLengr?=
 =?utf-8?B?NnBOcHRQdlB0MjgzV0RjNjI2Um1ibloycERJUTVDdHdpdlpKWm9vMkdIV0NH?=
 =?utf-8?B?bXBycDJ1aUNEMkh5NmlXekNvQnBmV3JCc1dWVlJuNUJvek05dTdSRk1WeEk4?=
 =?utf-8?B?elF5RjFMcCtYazdYd2E1aTRObldTRmZET0dPcjQ0ZExtRnpXampOWjV0ZzhE?=
 =?utf-8?B?ejBmRFNtWDVBeHAvYVhpWE5WTEM0NWZTZEcrZ3lpclNLd0NYb1JrbXhrem9p?=
 =?utf-8?B?N1Y2RkdjdzVWZ2lVVERUU3c0M0cvSnA5MSt2djhKd3EwNDdxN1MvTmpKQ0xU?=
 =?utf-8?B?WXVhcHBEL3M0V2k1VWlpdFdGbmxoTEdobkY5NU1GZFVzVVpwZko4aFVLN2RZ?=
 =?utf-8?B?RmdlQXoyTkl6NTdTZXQ0SksvN3ZPWC9kYWlhd3JwaGEzeFVoSmd2d0lKNXBS?=
 =?utf-8?B?azVQSnFrOGg2KzdtaXdORGFrR3l5d3ZtbmRja05OSXh5U2xodEp0eHBoMFVX?=
 =?utf-8?B?RVdKbHkyOFp4QW1hM1RvV1BBaEg4UE9KL2xGSmlZS3BhNjNVcXUvOEhiUklQ?=
 =?utf-8?B?UTc1U3RhcjJnODc2QWpPalFObkp3Sno2a0FRSWpRSk9VcDlQaW5OYWJKbHRq?=
 =?utf-8?B?dmo2bUhSb3R1NGJmcXArS2IzNjFOK2Fwb0RXdkJGeE1LYW9HelhaRUxjYU5N?=
 =?utf-8?B?K0tGOUdqeXE2dHBtb0JRWnNMMHcyWVZFa3BQNkxRZHlSLzVzRXc1YzlmeVcv?=
 =?utf-8?B?Q0RBQjhOUGhwY0lQRFgxVGg1RW92QkhJTi9oOFk0Tm9jbFMxUTlqelNKWjJM?=
 =?utf-8?B?aDJEMUJrSWF5VTNOOTdiMDRxR21wakVBNEpwRW9mN3IvajBBZTF2QmttSVky?=
 =?utf-8?B?K0pNek03dTZsb04ySTlrQzB1bWFvQ1dtNEZQOEFWa1VrTWE5ZTdFQlRIRGJH?=
 =?utf-8?B?dHR6WGlBWlFpQVhHNERqS0FEQXgxTXJYLzZnOHdHcXliY1RuVzFDVU9uaFA2?=
 =?utf-8?B?MDJEajcwU0ZKQW5PNkE1a05yaitlbFJDVTNIb3hCSHdJWk9UUmYwMi81Wk1i?=
 =?utf-8?B?UlQrek1oSU1qeXIvcG9zYkZKUlF1aWlndWZJWWdqWHdOV0Y2dHJBYzFMbEMw?=
 =?utf-8?B?ZHo2VGxLbmRGSzlKbGtjZzVHbXg3UHdHSlhwc1VDb3gzdENNbnlTS1lTenJy?=
 =?utf-8?B?WUtoU2dlcmordDVQSHZBUkJqdDJEZ2FveTVtempqb094UXpBL1FWUnlWOU9E?=
 =?utf-8?B?cXF3MzRBOTBpallpQ3MyblZkbW5YaFBBSUxNREtSUTFZcjI2ZnA2R09hYWoy?=
 =?utf-8?B?RUwwSnZQOUVaM0NxdDR1NUxmTnhmYWlSa2tndTZqVUFWdkRucS9oME5lT3Q0?=
 =?utf-8?B?RkdGZGl4d3Q0MDN5Um93eHQvU2Q0S2xxVFBGUk0yUEt4cWw2SndhT0pZcUlL?=
 =?utf-8?B?MlEvK0pBbTg1OXJGWWFjamF3Q0NhendiZ1VpNlhJcFROL3pCKyswZXM3NzJm?=
 =?utf-8?B?QW1SWTFkU1F4RjVvN0svQTVSRzNxS0dIUUJSaHhJcXhDait3YU9tVm5nZ3JF?=
 =?utf-8?B?ZEZWOXVGLzZsM0pxOURKcW14U1YyTUphUXE3WjA2amxtNm9IVUtHOTRuMDVX?=
 =?utf-8?B?cGlENTVaN1NCT2oycHpUOXJqV3NIWHJSYTVkeG5rYmVOZUtGczU0REFDWWt1?=
 =?utf-8?B?Z3pCcXUzbWNaZzFPMmFSSFZuL04yRkxHc25yN3IxS25sMFhhTm13eTRENEh3?=
 =?utf-8?Q?1jd4KfS5x1tkmkfx1aza2dy9M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d071622-e42d-4fb2-cf2a-08dad8365b54
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 09:35:20.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wQSoCvDCyqMlRJG5BAypkz/BRhgz4fLZpAPMHFr6EWXMhPHBkRWq1AjEgAbeETBJf7sxNPqN7aGdJa3NF6lKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8086

On 07.12.2022 10:11, Juergen Gross wrote:
> On 07.12.22 09:55, Jan Beulich wrote:
>> On 07.12.2022 08:21, Jan Beulich wrote:
>>> On 06.12.2022 21:26, Andrew Cooper wrote:
>>>> On 06/12/2022 14:30, Jan Beulich wrote:
>>>>> Grant table code is unused in shim mode, so there's no point in
>>>>> building it in the first place for shim-exclusive mode.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> nack.
>>>>
>>>> This is bogus, as is every other "depends on !PV_SHIM_EXCLUSIVE".
>>>
>>> But why? Doing things like this in Kconfig is exactly ...
>>>
>>>> The only reason I haven't reverting the others so `make allyesconfig`
>>>> doesn't disable CONFIG_HVM, is because I haven't had time.  This change
>>>> further breaks allyesconfig by disabling GRANT_TABLE too.
>>>>
>>>> PV_SHIM_EXCLUSIVE is a simple option for a bit of dead code
>>>> elimination.  It is not valid to be used like this.
>>>
>>> ... for the purpose of dead code elimination. By nack-ing a change like
>>> this (and by having voiced opposition to earlier ones) you simply call
>>> for yet more entirely unhelpful #ifdef-ary. See the last paragraph of
>>> the description of patch 1, half of which this change rectifies. The
>>> solution on the evtchn side, unfortunately, looks to be #ifdef-ary,
>>> short of there being a suitable Kconfig option.
>>>
>>> Furthermore Kconfig, in my view, is specifically intended to allow to
>>> prevent the user from selecting entirely bogus option combinations
>>> (and even more so suggest entirely bogus configurations by bogus
>>> default settings). If you disagree, then I'm afraid we have a 2nd
>>> Kconfig usage topic which we need to settle on in a project-wide
>>> manner. If only we ever made any progress on such ...
>>>
>>> As to allyesconfig - I can see your point there, but then arrangements
>>> need to be invented to avoid this kind of unhelpful behavior.
>>
>> Thinking more about it, if allyesconfig is meant to be useful, then
>> any "depends on !..." (other than for base architecture identifiers)
>> would be wrong (see e.g. COVERAGE depending on !LIVEPATCH or
>> ARM_SMMU_V3 depending on !ACPI). And this would extend to Linux as
>> well - how do they deal with that?
> 
> Isn't allyesconfig for new options only? At least in Linux it is
> documented this way.

Is it? I only find

     "make allyesconfig"
                        Create a ./.config file by setting symbol
                        values to 'y' as much as possible.

and a couple of instances of "New config where all options are accepted
with yes". What you refer to ...

> Otherwise options like CONFIG_X86_32 (which depends on !X86_64) would make
> no sense either.
> 
> So the way to go seems to have some default minimal configs (in our case
> e.g. shim and no-shim), which can then be expanded via allyesconfig or
> allnoconfig.

... looks to be optional behavior with KCONFIG_ALLCONFIG (which of
course we could leverage for our CI in order to avoid introducing
restrictions on what may be used in "depends on").

Jan


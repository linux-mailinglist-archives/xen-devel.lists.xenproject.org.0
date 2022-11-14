Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B1627663
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 08:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443140.697603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouTvL-0003tW-CP; Mon, 14 Nov 2022 07:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443140.697603; Mon, 14 Nov 2022 07:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouTvL-0003qN-8x; Mon, 14 Nov 2022 07:30:31 +0000
Received: by outflank-mailman (input) for mailman id 443140;
 Mon, 14 Nov 2022 07:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouTvJ-0003qH-SV
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 07:30:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140072.outbound.protection.outlook.com [40.107.14.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 361e5973-63ee-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 08:30:28 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS4PR04MB9266.eurprd04.prod.outlook.com (2603:10a6:20b:4e1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 07:30:25 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 07:30:25 +0000
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
X-Inumbo-ID: 361e5973-63ee-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzhfiW8cvj2XLtrou9Z6utWMzkZEUSOTQeO20JzxE4N4+75rFnd2KbrXhSmKfCJOIjjYy/UEkVF4Zuzh3/lrmM72VU55zXX7h3LeiIs6cB1Nm3UUwh4PAvKBNSCD0Jr4MvYUy05HzWlDRqKqgPR/LCZENZSGXxXxagVYynWHoQfCCs9o4LyhBNGHbzRp4TdLA9TWqPslArdWMgu1xbZYinh14AyWM632njxBg2YjdNXis3DuVqer6JdIxKd7mhYYgFf/HmPRUAq5K5I28xm3+ootmTCYP9lOEhVVQ4aWBW/pcXbuLKjkugiOzGr3qna7YQ1xARGzHLrFZcmOW2NmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta4/jXh/7sjcIT9Cu/F5RZOkPaSpkFsBebUjs20bUxc=;
 b=ah1+SS5/kYmU1akKktdEDP9p3At1l2iHKB3Cjl+7/i7qGZNThnra5EIsmERRICZS+yIFl0NLy1Kt630wus8JPsy2iOUV7pMKFXPmbg5uzqWf4yI3fRPIoEv5LbCdOZ/Im90jMfEu8upN4s8qAlWpBXz/eM+YbwmNMA3M/FMzZoC4y20FiW3McANZRaPydarvPonmG0K0fZnzVgPwWToaQY3gz3vGTCQuW3zRiFXmo7elWhCVkKj7Tf7VRrZmBQ32kukjIs3tTo2wk0n+VrMcLj6Zh1Wr1S71F/h8p96dlZKAqvq/UvIU3ZLPBRk6+AOkA0oWbG798KDY2Gcrz2ULYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta4/jXh/7sjcIT9Cu/F5RZOkPaSpkFsBebUjs20bUxc=;
 b=2sIKQDLEkcP+4bexwG6M6/xt2BK+VXK4qNZ4PAyufAnuWAgoSAB8ZJAD1tfYxHxuy99HhMCNDuxKHJiPY1Bklp2eBTIadQ5dJbC4aqHX+FtcBKXqKu6OM7vNT8eq4QoNLerKhp1juDCoUPsu00k1NCGmjQT6FZO8R3lzyogQnprYIXNMF5OCrgvVKoqKz46czmp313ONLC+M+bJPz+KPMUiprfKxV3NXmAGQwP39/VkjH1WaYQOj0oX4cEfXGv9BZIDe4yFRY/aPWgALCDwa8ZblreF+UnWIaTqTkJdehuPAiMLgXDyRO0Wp02GH9a1VJN0osgWxRT6LKaugYpoxig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6c5d690-4df9-ccc1-6f33-bce8cc742703@suse.com>
Date: Mon, 14 Nov 2022 08:30:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-2-luca.fancellu@arm.com>
 <aa989d27-45c2-6cb8-160a-b0368b1bb2a2@suse.com>
 <8632FA78-B316-4866-8E78-D4CD127C8602@arm.com>
 <d1d5ce85-0883-9217-ada9-71204e02239a@suse.com>
 <B26247E9-BD4A-4868-B977-CC451F7A095D@arm.com>
 <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com>
 <2E0BFEFC-5BEE-4F8B-BD9E-94CB9A5B2BC9@arm.com>
 <aa05f64b-fdc1-ab4e-e751-e19309f88eb8@suse.com>
 <9CE2A214-2D64-4BEC-A78B-393BF7AEDD9D@arm.com>
 <e8cae5b4-82db-cdb0-eccd-36337bc8ae5a@suse.com>
 <E9975528-1600-4F93-8C6E-263FF2A4A7F0@arm.com>
 <826eb0df-fb52-fa25-c908-977285a6ec8b@suse.com>
 <alpine.DEB.2.22.394.2211111245540.50442@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2211111245540.50442@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS4PR04MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: efe9e614-9c0e-4c07-608b-08dac61218b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YqIRR2MZGCn9nRaBspTTlLfBYUCcVJWMUMr5c7UHVZSVfal6r8XET04DGEamGkCuwrDTHipiVOfdotSUzibGqevAYRbSjPQXLByLXMjBjmnWp768rAavynSSFfBZ9LadWwHUb4tvusrLWNBwuQ350wni27d/Z4nC77wFWHLRoZ1uZrx4AXtr7NTp15pQ6wu9C+PtUy0HtszRt8Jx36KidMnwN66Sn4fbgsVybsConD50EXWFRVFlteffqrlBrFXsu37RcIkbXEEhHI6kRHLUEUH+XTDCKrO/cRf/2q+SryLf++ttFQvWpJLkwTTPc7nh9SCoy15eNQ6ct5UC07QaaL+fkJXGP2cOsixjMuV8fpMtGfTAzAURL2TQPf+heogwVM2AX7bDTtk15gZ8rpVfBAxub7DtJjWrDQEIRp7/h11wvcDwRpF3JjpwsXI5cSma915Lj7hKPD+/uoAHX6CiiHxn1mpRMI6IorPeqSsJSUV61iwXJKMWjXYQQNpAp3Ax/vVVH/lom72ZBSqkxaCQutUxUjsHa7xZNOV94/vtY6Z3OYL8+lcK8nhFMmMbz3iuChjx+oXTTkaYY4jIeqlcaVZ1nTACjA/wlTKugfrAV8GxU1F/daE9C7bqsVWTM4peWkvpOq0zu7oaRrETtbGb5hRznTI9Lbl3hMkzZtw+GQIjIWUKzpdTUXtyLr1OZOUoxnCom+tldTKEy1oFHmahrXeeZSZF5OGjlK7s5emhchjDtdH39l6nF/r/2Yqaog6DNpJIB39ga8QsEeYpW6eGeF3W6mNZLL7WkjSZLSplrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(31686004)(7416002)(8936002)(5660300002)(8676002)(66899015)(66476007)(41300700001)(4326008)(66556008)(66946007)(316002)(6916009)(54906003)(36756003)(6486002)(6512007)(6506007)(26005)(478600001)(31696002)(53546011)(2616005)(186003)(2906002)(83380400001)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0xNVWZHc3NCNkRKbXdUZnB6dkp1WksyVDU5REhCamVXZENiaHBZZHJGTVVS?=
 =?utf-8?B?MTgvRyt0bTFoMDNLd3JsZnRYZm16LzVlNjNURDBkY29scjJ2OXA1ZWhBWTFC?=
 =?utf-8?B?dkVjUVBHQUZ6Yld1enEzaHE5aVdheWd1ekI4b1BVdkY2NSttUHF2YVhmdWdS?=
 =?utf-8?B?YzdGODF2cVVRSmVpdlNHQW1aRUdvaFI5VHZhZFg4c0JOSVhIdW95bEZ0azl2?=
 =?utf-8?B?TGhMT0IyckN2bWYyNXBxQnFyNFpNTmthOE1LdFROVnA3dC8rbk9ZSnQ2aU9m?=
 =?utf-8?B?SGlaSGkrZ3Q1V0xqL2NSdUtzY1craUl2Ky9Wc0xhVDFLODdEcXhUbGcyNERE?=
 =?utf-8?B?UklSOHRENWhBS1h2NGlPVG1BQ01GMkczTHQ1dkkybzI5YTkwZkRBSFZuWm1G?=
 =?utf-8?B?RFR3cHZjcEMzVTViall6THprb0pYcVNuM2xENDd4OE5Jdmd2QUd5elhZRW5a?=
 =?utf-8?B?eGxiQXFPNkx1QUg3WGQ4a0c1bnRlMHRMTzM3WjdQeXFpOU5JeUgxTkluYThY?=
 =?utf-8?B?VUlWd25KMXk0dWc4ZHg2UzUwRWxSajlML2ViTURiVU5LYkVjVy9jOUczYXA4?=
 =?utf-8?B?dENMVnFjSnVJUFlvcmgzeEpOa25KVU4zVmhVUitOK3BIQkQ1S2hUaE8xeFg1?=
 =?utf-8?B?a0FmZGJoNVRQUUJ3eVV4Ry9IYXkrTnl3eFdoOXBrUGd1bExxeW9SN05tZ21x?=
 =?utf-8?B?WjQ3UDFLSjF5anMreGQ5SVgzK25YUk5uV2gvUEJwdFVoVzc2bnNhTmlyQmo3?=
 =?utf-8?B?UmUzUVpDdExkVHZGZklRQmRVcUM4RGJmd0dxdVd4SHg0dXN3cEVRY1hQOWdS?=
 =?utf-8?B?VGs1OHNHRS9vajU3aGxZakpnSVdsRkh3UElGWU1ydlc3WnlwQ3RmaHVRc3NX?=
 =?utf-8?B?RG55bzVtTVRzT1JXZlFqVGcrWDIzYnJFV2xEa3k3NThLTG8xSktHVk13SUx5?=
 =?utf-8?B?Qjh5VXJUUFlxazRNbytxV2svZWg4RXlpWGVrVi8zS0FBMWZidGxwOEtPQTd6?=
 =?utf-8?B?eTIyb01xbnFtbHhWVXc2K1Mvc2pndUhKSnd3d2pLSlM1WUdSdzJYaU1zalJq?=
 =?utf-8?B?RE4zVExCM0d1VnVRSFRRK1RxWkl0TGJXNlcvdzg4SGJGOTd0ay9ObU9ramhj?=
 =?utf-8?B?RGhnbDcrNUx0b0Z6QWNMeThsdGZ3YW5MdGppa3NYZTJyQmpLNGVnSjFEelRa?=
 =?utf-8?B?QVByeUtmeXl3Y2RxOXFkRkozVFhLTFJwNHJOcEttd0RPdEVqcUVvTjJ6NUFk?=
 =?utf-8?B?dTdZOWFsU3JsdzRLU2NBb05aRGtEZ0g4NnlLUi8rU2tpTW9EbDc2c1lyWDhs?=
 =?utf-8?B?bzhIMkdoRzl6eHdmMkZSVDI4dnk2Tnl0UXF3QTAzQ0JRSnBXTU1uQVQ0TTVp?=
 =?utf-8?B?bU41VlFQVWVUUVNwWHA2UGIwRjFKTXJMSTJvRTdkRmY4WFZySjdNcTFEYjJa?=
 =?utf-8?B?OTR6aXd4YVhoTnNMeVRjSlY5UXFqWStGN0Nld3djNjhEd21MNGhkc29kZUFX?=
 =?utf-8?B?L1NYSFFDUlF0T2pibHRxSWVxWTd5em9XamtEbi9HaUxEelJpZkZVbTdNcW1C?=
 =?utf-8?B?R2xiSGpTemQ2RTZzY1FxMHVpRXJWME1RMWRIdnZDOTZKRHllYlJJa3NpV205?=
 =?utf-8?B?akFhZ2IwS2J5bEZMTUhaNDlubGtpVWI2YkcwbUtwaUl0YjYycWRDT0pPMDhR?=
 =?utf-8?B?NGlUd05yWWZwVytrdkcvclQyekY4Yk1yL2lpQ3cwTzlpaGtKbFlDeWJUNkc4?=
 =?utf-8?B?SFFtb2E3djJTZXBHTEZRMHduWmg4ZmxEeEtTdGtNTklkZHZPSFNGYkVWM1h2?=
 =?utf-8?B?VzZyTlBtR3YwVzJGUjBNeEFPcVRONTRMWmVQOTYrSE40MGZQZmhiZGNWOGNX?=
 =?utf-8?B?OVJWNDRqc1YrajFIQjA3VUxHamlVMWN4QXdnclQ0YXBMWWVwZmZiL3hHMWo2?=
 =?utf-8?B?V2RQMS93dmFUMDVCM1dPSFluSndkV3lhelhDUEo2ZjlHWm9NMFNHZDNRaXA5?=
 =?utf-8?B?bnVYNlVEN2xKVytFS3hGVVdPbXFQOGFHVEcwTEkxVDBtSUE1NlNQbWwxK1Zr?=
 =?utf-8?B?aWdUa1M0MHQ1VkVQOTRMWjRGMmFXQkhzUm9QbXdvSWlKUE5leFU2djFzQlZC?=
 =?utf-8?Q?/FTaQi/Dl+Kg9kCrV5XxzVvW8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe9e614-9c0e-4c07-608b-08dac61218b3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 07:30:25.4341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yF0OXIk3A5fa6n56KHlwymrOq/ZOSrIyr6XQ2v100Tx50S+Fag5cbcdJgNlEifE4UtfTr8vtULfno5or8l9x7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9266

On 11.11.2022 21:52, Stefano Stabellini wrote:
> On Fri, 11 Nov 2022, Jan Beulich wrote:
>> On 11.11.2022 11:42, Luca Fancellu wrote:
>>>> On 9 Nov 2022, at 10:36, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 09.11.2022 11:08, Luca Fancellu wrote:
>>>>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>>>> Now analysis-build-coverity will be called, the best match is analysis-build-%, so again the dependency
>>>>>>> which is analysis-parse-tags-%, will be translated to analysis-parse-tags-coverity.
>>>>>>>
>>>>>>> Now analysis-parse-tags-coverity will be called, the best match is analysis-parse-tags-%, so the % will
>>>>>>> Have the ‘coverity’ value and in the dependency we will have $(objtree)/%.sed -> $(objtree)/coverity.sed.
>>>>>>>
>>>>>>> Looking for $(objtree)/coverity.sed the best match is $(objtree)/%.sed, which will have $(JUSTIFICATION_FILES)
>>>>>>> and the python script in the dependency, here we will use the second expansion to solve
>>>>>>> $(XEN_ROOT)/docs/misra/false-positive-$$*.json in $(XEN_ROOT)/docs/misra/false-positive-coverity.json
>>>>>>>
>>>>>>> So now after analysis-parse-tags-coverity has ended its dependency it will start with its recipe, after it finishes,
>>>>>>> the recipe of analysis-build-coverity will start and it will call make to actually build Xen.
>>>>>>
>>>>>> Okay, I see now - this building of Xen really _is_ independent of the
>>>>>> checker chosen. I'm not sure though whether it is a good idea to
>>>>>> integrate all this, including ...
>>>>>>
>>>>>>> After the build finishes, if the status is good, the analysis-build-coverity has finished and the _analysis-coverity
>>>>>>> recipe can now run, it will call make with the analysis-clean target, restoring any <file>.{c,h}.safparse to <file>.{c,h}.
>>>>>>
>>>>>> ... the subsequent cleaning. The state of the _source_ tree after a
>>>>>> build failure would be different from that after a successful build.
>>>>>> Personally I consider this at best surprising.
>>>>>>
>>>>>> I wonder whether instead there could be a shell(?) script driving a
>>>>>> sequence of make invocations, leaving the new make goals all be self-
>>>>>> contained. Such a script could revert the source tree to its original
>>>>>> state even upon build failure by default, with an option allowing to
>>>>>> suppress this behavior.
>>>>>
>>>>> Instead of adding another tool, so another layer to the overall system, I would be more willing to add documentation
>>>>> about this process, explaining how to use the analysis-* build targets, what to expect after a successful run and what
>>>>> to expect after a failure.
>>>>>
>>>>> What do you think?
>>>>
>>>> Personally I'd prefer make goals to behave as such, with no surprises.
>>>
>>> The analysis-* goal requires a build step, otherwise no analysis can be performed by the analysis tools, so I hope we agree
>>> we need to integrate that step as a dependency of the analysis-*.
>>
>> No, I'm afraid we don't agree. But like said for another piece we didn't
>> initially agree on - if others think what you propose is fine, so be it.
>> I'm specifically adding Anthony to Cc, as he's been working on make rules
>> the most of all of us in the recent past.
>>
>>> I understand that the analysis-clean might be a “surprise” if not well documented, this comes from the need to substitute the
>>> tags in the tree (to keep the real path in the report log) and to revert them back at the end of the analysis.
>>>
>>> So, such script should just mask to the user the analysis-clean invocation in case of errors (with an option to don’t do that)?
>>
>> Hmm, here you're saying "such script", which looks to not fit with the
>> earlier part of your reply above. (Just in case that's what I was to read
>> out of this: I wouldn't see value in a script which existed _solely_ to
>> make the cleaning conditional.)
>>
>> Did you consider the alternative approach of copying the tree, altering
>> it (while or after copying), running the build there, pulling out the
>> result files, and delete the entire copy? Such a model would likely get
>> away without introducing surprising make rules.
> 
> Another, maybe simpler idea: what if the build step is not a dependency
> of the analysis-* goals?
> 
> Basically, the user is supposed to:
> 
> 1) call analysis-parse-tags-*
> 2) build Xen (in any way they like)
> 3) call analysis-clean

Well, that's exactly what I've been proposing, with the (optional)
addition of a small (shell) script doing all of the three for ...

> Making steps 1-3 into a single step is slightly more convenient for the
> user but the downside is that dealing with build errors becomes
> problematic.
> 
> On the other hand, if we let the user call steps 1-3 by hand
> individually, it is slightly less convenient for the user but they can
> more easily deal with any build error and sophisticated build
> configurations.

... convenience.

Jan


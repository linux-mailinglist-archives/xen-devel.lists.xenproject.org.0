Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C356D49C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364819.594749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmpI-00055R-5t; Mon, 11 Jul 2022 06:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364819.594749; Mon, 11 Jul 2022 06:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmpI-00053T-2J; Mon, 11 Jul 2022 06:23:24 +0000
Received: by outflank-mailman (input) for mailman id 364819;
 Mon, 11 Jul 2022 06:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAmpG-00053N-MY
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 06:23:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5ff674b-00e1-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 08:23:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3597.eurprd04.prod.outlook.com (2603:10a6:803:e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 06:23:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 06:23:19 +0000
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
X-Inumbo-ID: f5ff674b-00e1-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhSHoZmhQhRglT19ftCdng2WVY4tahoP7qPq18q/uRsWxbcJpIALX6P8Sa0pF3kqODJpRw27YpLpQKtoWYTeSNGEQdRIAX7XEVcDd0qSzhQjfZR0ap3hNAtU19ldq/3hOWj0rw+CxRdJehGOrEBJ7nzq9eXu3On/2StTrDhDsR+nt1221zGAdZ6yP1fJK6QPcjomHM6eyal3NTh5e+rq+cWPpAFkA8w3uMZC+BGwV0u+fihKfHtLhUvSr1DmI/Sw6sMyneH4HtJXqfphTFA3mizsJdG3phskgCNdTxFTF73Py2bNrcLUIdbgNhWJshDtxwHplRSbumqCnbX8f3nGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvwOenxpweemvxGZJcNdvRtzt0jhCyCzSNMC8WbtXDY=;
 b=fvcT6zY0KzxxUthjNUgAyYJquC1RkcBcLENlP6u//z//HI/KSYHCxZRlgudKN/gO03xgAWiiKDsXyFcQYrYOyhn08QJBZkYZDrWITIr1D8RZK+mr1jWLdjg4jbDt6Sf4rvpApECrpatxzTIEROjRFhPYaPpYdu5SJlGoPZVvFzdsLTs7RMMTYj1kHrNX18hm8NWWgfS8DsRffqRidXC8PrQs29Ls5xt+8ei75WE/Gx+alsUW/1uhuO9wQkqfiA/6/AHOEFFsJuTplAPc/Hmkva+q51D94S+Ak3LRI6xf/7FAceMK4cQ9wBnF/3l9f3f1jJlfglhXOtAwXb9L1L++zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvwOenxpweemvxGZJcNdvRtzt0jhCyCzSNMC8WbtXDY=;
 b=gXKOaYBEtu3PTxrGQ7CpfohyRh/G+bvsN1mUOmsgn8zaaKLtPcc6a37nYyurQNUZAFjV4leiTVdf7j/i1g27rVZ1NkoncOmhEb6gr44jrj71Bm/Z9Kha3LhrEwU686AhT26aBj+I0eo+XSKrMO+Vyy2ojUdU5npt+7vZBsRXkuBAQbXS6P1Zl/04ETfL6NrhNnb8gr8uonGzrAd3RONymD/aARCW+cwR6uF+4WwEpbYMXIkcXwRYIj1jSKw5SJJbBxwXwGQBM8NrPsu69ND0jDpwZJmblqADfHSkpU/48Txwpd3gVzAgwhP3HtnmpaHUdU0GaaYfhjAwm2hVOMuUFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <042fa7b8-5262-f772-9b31-93b56ef01474@suse.com>
Date: Mon, 11 Jul 2022 08:23:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v11 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, David Scott <dave@recoil.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20220708135559.30719-1-jane.malalane@citrix.com>
 <A226BF44-AE5A-4689-8D56-334A148D9075@citrix.com>
 <94eb45a6-7c84-6b6a-e5c1-e2ced336e675@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <94eb45a6-7c84-6b6a-e5c1-e2ced336e675@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0056.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a1801e1-6b27-4e5d-2188-08da6305d900
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3597:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MwDdJLlq4xYQP7hVb2uHKCur7PGA1VdsqdJ+BueXEJ3NexJugMDyHf4OiueQVaGlUh2WnKRAuunItbdmbKYWDOTZaErjWtzoTet4aR3fmIrJv5+iM3YreJ1cr6cEduANV44dAYrGuWLl6LYROU/V/0Ou2O6l+yz6ztCetPomNPwFxaPsscljn5z4tPTZ/grR5BMAPhqexY2l0ydqGL/VGgekeGQt1Tds6p/TUQcv0ct5JrbA/C2yMrP+5w5K2XWFg6MYKjTaASAT+4LOudw3xN9FItZjeMv1qsw/Z8M/57sveRwRBcH1JZo3t4kbi6d9flVoJMFTz2JHA/P+i8KRWXos8icUf9imoUh2i+Jj1Z8YhN6UmF3OkZddg/NhM4LQVwtihwZmkBC3TtTNTzz0eukNJ4pbLfyI1NCFiaDmHuhMAdvV1TpQvSX87u9dxe7JVdVrLXQoJCloTIku+er7pKc+nVamnMLXbNbEE0I5sE9T2AdszJFBAImu5UQ4F7x3V2xbpHfXtrka8XI79hrBRZzNZOXAYoxqF4HbgbNXYrM+VZvKqzW3Z5ug8qrOvZQuFNdC9e5LGk7JqxX7lx/EVNA5RzDO0p40TtXCPU+aD/gJddYN8NJ21S2oMkdFFbrBekJFYaZeXgexeBbmppCtavlqKjd9ns7iM3NN1qSDxkjuyyEf9EWdfazg/p58tHnWlxKp5s1WXYPRZEjJUNjF9do0JHNy28wj9Ch2b+HSLvXpjqsPK/al6ynruDac1PTNxpZa/LQr2Tj/nGrNCZAKN5t8qNqoCwyeZMgqAIhRY3TrQ1KkB9FsINShRexqKIi3Pn+g6Wn2sOQNqUrM/lg7sqSG9fH6SACcJFsly6ZUFdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(136003)(366004)(376002)(396003)(346002)(66476007)(66556008)(83380400001)(66946007)(86362001)(4326008)(8676002)(53546011)(31696002)(4744005)(41300700001)(2906002)(6506007)(186003)(6486002)(6512007)(5660300002)(26005)(316002)(8936002)(7416002)(31686004)(38100700002)(36756003)(6916009)(2616005)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjR3R1ZCTWluNDg2M3dwbnFKY1gydklaOHlXOE9CVzllVGQrOExZWG9lMDNO?=
 =?utf-8?B?YzRnbFZuUk1NQnhUWXBpZ0JEeFArRHBHQzJHcWpvaGpUbk94Zk9CZ2RUWldq?=
 =?utf-8?B?cjRsa2o3M1hJcEFjUGlzZ2d6UlNQc3V6cW5JckI1cEFCYndXckF6YlpqTUF4?=
 =?utf-8?B?cU0wM2RPeG9vcHBLNUtIZzREVUFTWHhsbzV1NTkyYWdaUHpURlF1Y0dkZjhr?=
 =?utf-8?B?UnRRTVhUaE4zVHA0Y1pYMGtsQnVFeEFIVSsrSU1TcnJZd0VUS3JmaGlSVGhI?=
 =?utf-8?B?RVlwayszWGNsYkY0VzE0bnM4WkpZeUZSR1NBMlFjUDNtZWg4T0xSdXFPL0o4?=
 =?utf-8?B?UUZTWUwwNkZQODVLZi9yVE8xUE8veXhQL3h3K1JXZmVSQks1WTR4Qlh0b3VG?=
 =?utf-8?B?Yi9takNiNEdTS0ExRjNsOTFoSnlTMU42UUpzQ3VzQ1NlaWdxcGRHNy9mU3B6?=
 =?utf-8?B?N2xwb1FWVlhlY0RwOThYV3hheG5RQWtlVmw1QVByakN5ajVSR1JuNVdLNFlK?=
 =?utf-8?B?WmxKOWRaVERKa3A4TEZHTGozQUk5UUx6YUhMdVBqUjRjZEZ3bXA1VUliRytz?=
 =?utf-8?B?R09XQ1JmSC9SamdMUlRzVnpsaHB4RS83cllPeXRNaHZxeHRvRXpNR3grdU9W?=
 =?utf-8?B?YXphZ0hZYlFpbGtWMGpoNm5rcG5YOHVDdUhjVmh6OFQxUGQwbFRLV1E4Q1lv?=
 =?utf-8?B?dWFZc3o5THhlY1BCd29PbHJNclFqTjdBVWRlclZlOGtvMVNZMDRkd2NSWmNO?=
 =?utf-8?B?MmxxNUp1UTdOaHp0TkxYN1hyaGR5M1Z2RzFhSWVBMDBhUDdoZlNaV0lkbFA3?=
 =?utf-8?B?d0JtcU5paTNjV0RGT1pYWkFMZW5Qd2pFVzVVQmhMc0ozS2VwRUJPRVcyQ2kr?=
 =?utf-8?B?bXgxbTUzTmNNbk00c3ZVU2w3c3FNQlc1MVlFV1J4NHVVdmRtRkFsN2RtVy83?=
 =?utf-8?B?Y3Bqc2trcVUxWkQyemEzclY2Sk5DVVJ3azhLZnM5dU9Gdi91S2hDNzdhaFZL?=
 =?utf-8?B?RnNiVDJQaHdRZU1KSHkwZ3Vxc2hBQWVUcFVHaXJUR1o3SnMyaDNGWFVHaWFG?=
 =?utf-8?B?TU54WlJNdjlhTEs3UVpvdURLVXRJYk5ia2t5Mk9RRzNJZTV3TUFwOTB0d1RX?=
 =?utf-8?B?NFp4bnVQMTRkUHlDUXBmdE4wMEhmNUx1SStwbS8zOVB0d0M0a2ZxeUFNcklZ?=
 =?utf-8?B?Wk0xWVBUSTBBMTdWWjFQM1d4Qmw3aGpKRFR5NU1jUlNtRFdYeEdwWHFDZGI2?=
 =?utf-8?B?MFlrR3BrcTI3QklWT3c4YUJhTHpFOFNwdU0yaDJTei9pNFNKbGRJODFWQlJH?=
 =?utf-8?B?cHVsSnFzcTF4RWQ2VkJxbXZUUnFGYkZpKzF5L0I1bjRhTDBqdis3SnNraUJj?=
 =?utf-8?B?RTFwQko3UlA1YVArSUYvWDJDUVMwLyswN05RY2VWN0dFOElYZWNDTXBObG1Q?=
 =?utf-8?B?cXBYdFd3Q0F4dzAwNk82dzRFdFZKdTQxSzhJajlMaUp6bHlCOU5SVEtPNHhz?=
 =?utf-8?B?VHY3RlFRS0NYYTQvNTYrQnZRNmZlczRlZXVxTDZWSnpPSFBlS2F2YlhDOS8x?=
 =?utf-8?B?Vm1CMmpmS0crczlwSmpKWHNFM1V3Zlh2eGp6Wm1aSlFaUzRwNURWUyttdnZy?=
 =?utf-8?B?dVRVVEs5d05ZRi8wajlvcEc3OE0wVUpJK3ZxdytsQ1pvT3dYdUg0S0ZvVW9X?=
 =?utf-8?B?ektKU0JxYnI1R3hqMXZGSUtNQ0NTaUVJZGo4bU5NRytSVG5CeFIvRmk3WG9L?=
 =?utf-8?B?UDdjblVOd1pwZVpPZUYwaTUxYmFxUDU2UUZFaWFrVDBweGorc1YrRUVSYnF5?=
 =?utf-8?B?M094aUYvMVdkLzVTZDlIVzZjMXBXMzBGdllUdk15UDNVbEt1ZkhuTEhzZEYv?=
 =?utf-8?B?S25MUm5hMUN4Q2laVnUxa01jTXdNbDNYN0VCdDJHWjd6UVFsdVpSNTR0NDFv?=
 =?utf-8?B?YlRhcjk4V0pmRnBoZ3JQdFpkVzR6aVB6L1FiaU95SlY5T0lzUjdSM3pBbDNm?=
 =?utf-8?B?c0M5VDBpazQ3TzJCWGNrUitYa1ltcm1TQkxiVEwvRkhhdFRpMWsveEJ2ZHBZ?=
 =?utf-8?B?Wnd5bDFYbU55a0RGZTd6ZXZEM0ltZWVadVBxcXY0MWRCKzB2TW10TGc0V3NC?=
 =?utf-8?Q?Dej/jAAmW6kwWBZYLjnD5HqDI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1801e1-6b27-4e5d-2188-08da6305d900
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 06:23:19.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldcl0oO/a9Q+8dvAeZl/43raBYebXeJIMwVKB12BduhQw/kt/cxlU2xTSdTxVBRBYBYL2FSiFt2bybXMGuSwJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3597

On 08.07.2022 16:42, Jane Malalane wrote:
> On 08/07/2022 15:33, Christian Lindig wrote:
>> On 8 Jul 2022, at 14:55, Jane Malalane <jane.malalane@citrix.com<mailto:jane.malalane@citrix.com>> wrote:
>>
>> tools/ocaml/libs/xc/xenctrl.ml       |  9 +++++++++
>> tools/ocaml/libs/xc/xenctrl.mli      |  8 ++++++++
>> tools/ocaml/libs/xc/xenctrl_stubs.c  | 18 ++++++++++++++++—
>>
>> Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.lindig@citrix.com>>
> 
> I believe I now have all the acks needed for this patch series. 
> Regarding the commit message of patch 2, I thought that explanation made 
> it clearer but I can always remove it.

I haven't seen v11 2/2 anywhere, so I'm afraid I can't check what you're
referring to.

Jan


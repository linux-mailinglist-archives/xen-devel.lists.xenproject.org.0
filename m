Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9D5838A8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 08:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376614.609499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwsq-0007dG-DM; Thu, 28 Jul 2022 06:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376614.609499; Thu, 28 Jul 2022 06:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwsq-0007aY-AU; Thu, 28 Jul 2022 06:20:32 +0000
Received: by outflank-mailman (input) for mailman id 376614;
 Thu, 28 Jul 2022 06:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGwso-0007aR-Tq
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 06:20:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130044.outbound.protection.outlook.com [40.107.13.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60c056bb-0e3d-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 08:20:30 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM6PR04MB4901.eurprd04.prod.outlook.com (2603:10a6:20b:1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 28 Jul
 2022 06:20:29 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 06:20:29 +0000
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
X-Inumbo-ID: 60c056bb-0e3d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKxoOLvhUcVwD0v+ZnAXgmxwcDgJ4ICaDprMwJkXwGXGr5StSz+R7soY+cZwfiU6eCaybLIj6J85gkWXUaw7qbr9eqpOjDUPzXiiNalFHJaBy+RwHf1Snic2dAaoV+Sc3ILUY0pcj4qA8mvC45Umo+ZEOTVQmlhLsLzOocsOBOGYywfSCmDQeygdl/EZKd7I0VYIbfvSCxy/4pmrsJfKJYnLQxckfNUAPUKHcZPnUFt5ib3DBCGKMVhM/SRQ2rEkWYPaXD2tXEW7q9OLXWAPX0RQer7MfGowVAII4sXd9lyTlD2zDC+UL9xmDMlT6iqKBtnkEF9yaV6A4AYRJbtRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjakR/UdeynQV2CjnqJ70tftLPefDvz1RaUbh/BdTcU=;
 b=gQnl5+pop9+5O5C54WcBcijcM5NgJYJgle3riryRTMah/O4dII1/qd1sgLpjzwEKzui+fyuFqdGzzza54rGOfXylCuosG8jahvPS4NmFPGWFba5EtE5zfgJ9X+b/6KRLLESBVNLgCJI41SsGHL4az9jDT78AlsJj1ab7DrJyqMc/XUYvAAUEj755Wpo3TDb1iQeN5RocYP6UZFjJJ8SoDyal3AcYg5f1jhdGc3v6oNomYHa0D2/03ezaQ+/2/giF3yJ6f7cVaprxIclsyMd8vuv7CEhub4gURH5Ijw3BFG5daHJVGmqEH3eLfwZ3BpBaVAbmM33eNd0B5D/w+uGK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjakR/UdeynQV2CjnqJ70tftLPefDvz1RaUbh/BdTcU=;
 b=qEmx2EVotyofBLyz4ciN37Y9Ob+hZS0ZFCRQo+NOVL6mCBGht1yoHgR+5FZ6VTxk1yt3M0zd3in7Qk2pRmGTk54bykHaY3IJ60ceTbW0aNB5pBbkwrZo/wpCPJ+2dV6Q3n4rJOF+dBo4DkuYdh/P2M3it6rsIrKQ873f5jXNvaJHXoAmLzDgCrtjVi/RkvNogmB6bjX0PgBdgcky4/SjtYAzKYnwWJTr5QfOCyiydlXob6R09JqFEZbLAPXaN0qZeAwaWCPX4wkqH5UYFuI8cKZdqYOACJpqBj9pvnyVSrQR7NE9AcJ2AZaO6EE7Uwo6c/ISPA8dpg1yNK9yu56X5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00df654e-2423-7021-32b7-62b12619bae4@suse.com>
Date: Thu, 28 Jul 2022 08:20:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] x86/mm: re-arrange type check around
 _get_page_type()'s TLB flush
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <a8f707e1-528d-b372-72f4-610939acae0c@suse.com>
 <d5b227aa-c846-6e23-c24c-e34861353028@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d5b227aa-c846-6e23-c24c-e34861353028@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8532d716-7560-4291-6235-08da70614488
X-MS-TrafficTypeDiagnostic: AM6PR04MB4901:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A171sJqU4+zkHf0QkU1ApxxgCPyMFaAii48TnSkSzlb3ou9gm2zuaOZOhZdyUwJCE+Ac/AcfHpaj7ftcoav7p/JAwN1aKLkD1fXaPckdX6mwiFicM1hMEzxbjFW2zpKkZWUs1swBX4MoTpUMz5o7DL9+doBCJ7YNfXZciA/FfZR5eszpMAOU/jE9bOorhZWW8U3dVFyMTqcI0+3q8o/m3ZOWCwOtvnwpghGZFj2wjrw/uWvYmELlUafCG9Tqpt6ASbUMKyAdvxQ3p/RRudqv5JNJuNl0GaRP6+9bOmq6QF0LTqJavhgvUatjauILUtjZOdL23NP2EZlvRXs/wqHJBipTfzrvueUCZ6EFfa5Ez1gLnjKECpmMbe23xOUKokW8/5LITgjZK/x3tO+JW+m5AUTk5CJ/rcorK03O/quJ8qhA1NcHN+EErX7dN5uT4IIp4Qr2wV2FM+4BnClnwuulXO7oP8J4Pp+er428XoPtbxOJWoyzcza/DUur1TD58v1KSikcxY7nEIFgJ1LZCi/Iau1rARsku1z+/b8uavBgWWW+6opvsrkOmhTu/yWNFnke2sQPHAN+hXvpiMbdvCOg7C4IeY7ur5GUcwx+j+9Uz2JHGBbamOw6WIsgAlWczOimduLVhRFaTfS/8u35SwJ9jASdeDdCaRezuG3WCKX4YMuIlbOn/lijJidTQQ9E4RR0FQN7jIQR2kU856/sXl/mY028zdsB98pJ04qhXlNECoIysTdq/d1k73y7ztlR4WZdmgVCpOw8ipX1vrnYlFUVcoLANACjrUbKBeFJjBnduytUvTjIx9ArZdTsBmjZFqtRBQ1/q+HD+jfjEDwCjFCNtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(39860400002)(396003)(346002)(31696002)(8936002)(6486002)(5660300002)(478600001)(6506007)(26005)(86362001)(6512007)(53546011)(2906002)(41300700001)(6666004)(4744005)(2616005)(38100700002)(83380400001)(186003)(66946007)(4326008)(66556008)(66476007)(8676002)(36756003)(54906003)(316002)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkFtSXdXWFdtbnRhS2wwVy90Skl0dUxBOHUycHRiUklPNFIybno2KzNkWkta?=
 =?utf-8?B?VUVyZ0h5Y0JrQ0JZbzdUT2FmeTdYL3o5b1V4d29ISXBwajFtOXVUS0dKR1l5?=
 =?utf-8?B?ZUUvOUw2UnNvS1dvYTRBT3g5NHRWaXBuK25BalNMUDZQUERnd21wN1diVGZo?=
 =?utf-8?B?RXFmRkJSRzFjWXV2T29xM04wSEQ0bkMxWVBlZ1dQMUdudytxTUxvVkZIUG1o?=
 =?utf-8?B?ZTZjT1NTcVRrY0NKa0R0NWdwNXhJQTdVZ2hTN2hueHdXd3M0OG44VmVkanRG?=
 =?utf-8?B?ZTdjRkJrWDVubUthTVh2QWlUaHFyTGdYUWdMVzFmYXlYWU40ZUhGem9pUW1s?=
 =?utf-8?B?cm9pUjhZZVArUFBzRXZlYnRnSkVhVGR1T3B4RkVZYnoxWHNHSG9DYnVMTlBM?=
 =?utf-8?B?TGdqVGZrcThyeGxzbHBYN1JYRytNalNMSXVCUjArTGRNcExKMlRTeG5KMjly?=
 =?utf-8?B?M0NaL3FRdWp6NlhtbWpNdGNrOFVNMXVWUTI0WW9IYkVETkdCa3Fua3pMbHF6?=
 =?utf-8?B?RG1ra1g2blRDa2ZBSXFqMzdjUVZZWWduUUU5bS9kWmZlclltK2FwWjdUajFs?=
 =?utf-8?B?cXR2U2FZWElhSmV3cEp6djhKSzdYemE2RU1FWHF2RUg1cloya3F4VVd0Mzlr?=
 =?utf-8?B?RUljTUdVdy96Q2h4d0xZa2UrOVpqaG10R0RLSXk2ZE1zWUJCVFo4dFA5Z3Nr?=
 =?utf-8?B?N3kwNy8xalo0SlJJSUVGb0tXM1pwZnBFL3NhTm9OanhQbGtzd1lCUVE4Q3V3?=
 =?utf-8?B?SSs2d3FhT3ZKcTdmUWNVU09ydG9lK3Z6alhHQzNUQ3NBc2kwaTIrbUdtZ044?=
 =?utf-8?B?cFV1VnZRQlVYYWdRdVV6T1lGQWhUd2pFSmlPVk15ZW43WUhjMHVUa0dIcnFk?=
 =?utf-8?B?MHpORUc0SFdCR2hYLzltaWdvaHFkOUlNblN2K2I1SkNTYktPRzRmbE5MbXNT?=
 =?utf-8?B?VVQ1K1NYYzl5WGF2TUh5Y2hxZHJUUHJJWFlLdGZwdS9SVjRtUmExd3d3L3Z2?=
 =?utf-8?B?V0l2ZWhXbXRZYXIwZDZOVi84R3NwNVgxNWF5SUdjVUhjU1lzZ3M4Yy9NQzN1?=
 =?utf-8?B?M0wybVNPaTQwR0o5dWZUR0lqZjFOVmxmYWlRVmpSNjkvZUhqTUp2ek5DUnBI?=
 =?utf-8?B?RWJSN1R2SXRHck9BOENZTC9pdE0wNWJBaXJlbE85NW1nNVN2elh5clFPU1Q0?=
 =?utf-8?B?MDFUT2s3QWhHamdSY2FQREh5SHVPWlJvNU95R3FTZ3c2ZjhGU3Q4SUpLRmJG?=
 =?utf-8?B?MmlsczM3OTlhZFhjT1UvcXJ4MFZpTC95a2tsSkpEVThkRFRUeUNnYzZta3g2?=
 =?utf-8?B?R0F0clhBS0hWSVF1N1FZZWhaNFcvZUJESHpLa250QzYrTkdxN2JMRndLZTBY?=
 =?utf-8?B?L3JOb2hEU0xwZlh3eTRkYU50UE1lODFyZzNEUkNIUTNOSWhRQXg3TTk5czFS?=
 =?utf-8?B?V3dWYXBFMUdpS2Z5WHEvUjIvcVhsaStzZGdmTk1tc3pHcENZZ1pQcDZ4ZWk0?=
 =?utf-8?B?S21DY0w0SDcwajI5RjFKR3FOSFBKczhWUnE0S28rT25KNFVhZk5hSnVWNi96?=
 =?utf-8?B?aENOQUJxeUZNWGpOLy9GU1k0SjduYWx6VW4vcThHN3dDeWR1MnRmRVBkdUtQ?=
 =?utf-8?B?cHd1WnJsTldoMmlOY09peFFrcFl3Z1RxVVNBMmQ1eFdRZ1FJZUNnWmtLQ0Rm?=
 =?utf-8?B?WVFHY2J1emdwWWgzUWJxTitxQnhrTWZEeGE4V0pQREFjdGdsUnh6NWtOc0sy?=
 =?utf-8?B?Vnlyd1Y0MFZYUjkxNm5jN0F5dzBJSDlhNlZBaGl6bHV5MXU5dXpRNEtSNG40?=
 =?utf-8?B?R2J0R2xGcXF6elp5MHRtWVZKbTYvbEpLZGNuSDVnTkttdno3TmVjRzlpYmUw?=
 =?utf-8?B?NDBUekJwR3FnWlNNNGVXa3ZWWTRNRk55MHZlNnRacTNuUy9lVmV3N2N3VVJx?=
 =?utf-8?B?ZGJKRldpMjJUSGxHckxDNitNV2ROMlNVc2JReENLSEE3VG1GMjBNRnVWYUdt?=
 =?utf-8?B?K3pMQkFpd05oUXBpcUFRTkZKZmRVbEwxOEY4bWZmSU9uV0lxNEQwM0JoZDZj?=
 =?utf-8?B?eElOK21qdzRXREJVZGN3Y2dTTHVtVGhpVWo1b3lZSmFxTTN4WUEyWTZZMzFH?=
 =?utf-8?Q?WqXUDnfK0IXGGPGGgpOBC5czE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8532d716-7560-4291-6235-08da70614488
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 06:20:29.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7OISF5+wgCEoLRA26nExCjii5U2LApA1OMqdJ6NzO0KSulgM40Qw05gkkDAsv4d8qXSeN2JDGUOoC7VUPukFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4901

On 27.07.2022 20:31, Andrew Cooper wrote:
> On 26/07/2022 17:07, Jan Beulich wrote:
>> Checks dependent on only d and x can be pulled out, thus allowing to
>> skip the flush mask calculation.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Do I get a Suggested-by seeing as this was on the very long list of
> improvements ?

I can add one, but you weren't the only one to notice.

> Either way, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan


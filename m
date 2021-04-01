Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A5D351596
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104536.200044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy7P-00037E-DG; Thu, 01 Apr 2021 14:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104536.200044; Thu, 01 Apr 2021 14:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy7P-00036o-9f; Thu, 01 Apr 2021 14:16:19 +0000
Received: by outflank-mailman (input) for mailman id 104536;
 Thu, 01 Apr 2021 14:16:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRy7N-00036d-Eu
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:16:17 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50b111d6-1cab-49a9-808a-7b11de934d13;
 Thu, 01 Apr 2021 14:16:16 +0000 (UTC)
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
X-Inumbo-ID: 50b111d6-1cab-49a9-808a-7b11de934d13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617286576;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/AFZAxvtPkioA0oxc3Q9LLCMrNqNrN7KaPiE+TBdwfE=;
  b=VjPrQXOwikqVXTFQxM6nHeBjmZuk5+iCzA70hKgPRNCfCfiA4yFQC1aX
   Z4jj5VQt4856GOyx9ojntD3VFPPX+OolgWnf7gI1HXjINaMLaLrsQc+bX
   4WZEQaS9bRrt18mzhw1z5s/rNCaDc8F2DUOINNc+FGIJfjtHy2PvgksnQ
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H4ExOqUTVgzKHJLmVWNYKa/9p/bIuv+Gi3OiRFppPL79J+YqAm9E6kvHdWnEMJY835w2HitBKp
 BSWWf8saC2ZGtFSUPyZLGgftc4ktqrS8VSrJnki2/I2x31EhMhIgswAqARQbOg5ftB9wbgAMfI
 ZjUU/IsEyo7yk+o/7z3plmqYVmu48ZUllZQFR/d37nB4+d+AbDrh7E4IVQqNAKYub0ntlbVuBx
 RWvqCy2pFylPQhMUbvSs7tvpXfdidrib12G0aR0vEv4HaimssTSVAALa7sWe9ul19IpRyvrk6l
 shY=
X-SBRS: 5.2
X-MesageID: 40686574
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CdjIK6scf2I5RdIYMK4iOAD/7skCWIYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyAOzH888hPyO9661jenTpk0dNz1CQYsI1XYaNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBEg/RMK9G3UDQqz/t8TG/aiWLCIuKhY75GC1/FWVwZHgFRzw5HcjehNJhYwv6G
 3U1zH+j5/TyM2T7j/5+yvt449NmN3no+EzSPCkrsQOMD3jhkKJSe1aKsS/lQs4qu2u91om+e
 Oky3xLUaVOwkjccW2vrRzm1xOI6kdX11bYxUKFmnymmMTlRVsBeo58rLhEeRjU4VdIhqAY7I
 t33nmUv5cSLRTMkDWV3amuazhWl1G5qXdnrOgLj3Y3a/p7VJZtq+UkjSBoOaZFOBi/xJEsEe
 FoAs2Zzu1Ra0mmY3fQuXQq6MCwX1wody32DXQqi4iw6Xx7jXp5x0wXyIg0hXEb7q8wTJFC+q
 DtLrlorrdTVcUbBJgNStspcI+SMCjgUBjMOGWdLRDMD6ccIU/ArJbx/fET6Py1focLiL8/go
 7IXl8dlWNaQTOuNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dSKZTlQjlNahvuUfDsXXV+
 3bAuMUP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5sLHQ7ea9NDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzv/mxjeW3Tkf0Tl5pJuGK3G/+weobJ9drFkg0wwsxCU98uLITpNvugKZ0
 N4Oqrgib7+j3Kx53z042JgPQd9Ak5Z7K77aW5DoRYHPirPAPM+kuTaXVoX/XOcYjdjUsvdEW
 dk1ihK0JPyC6bV+AcPJJaMNHmAg34auXSQJq1s5ZGr1IPCYZM3DpEvRaprMx7EfiYF3jpCoH
 tfaQMCW0/UHi7vj6Lgl5APGOTDbbBH8XmWCN8RpnTFuUqGo8YzAnMdQj61SMaSxR0jXjxOmz
 RKguQiqavFnTakMm0khuskdFVKdWSMGbpDZT71Lbl8i/TueAtqS32NiiHfgxYvenDy/0FXgm
 D6NyWbdbXKBVVa00oomprC4Rdxdm+HeVh3ZW0/uYphFX7esnI2yPSVfMOIoh+sQ0pHxvtYPC
 DOYDMULA8rz9er1ASNkDLHEXk93J0hMuHUEbxLScCY5lq9bImT0a0WFf5d+5hocMrjteIGSu
 qTcQ6YJjGQMZJe5yWF4nI+fCVkongtlv3lnAD/5G+jxXglHL7cJk9lS7xzGaDo00H0A/KTlJ
 N3gtI+sbHubiH/atuaxbrWaDAGIBXJumKyR/wpr5cRva9ajsoBI7DLFT/TkHdA11EiKc2xkk
 UUSqFy+qrANY9iZNZ6QVMvwnM50NCUaFI2uQn3CPIkdV4jj3XHL8qEioC42YYHEwmEvk/sIl
 GR/C1W4ufdUyaC3bAcDbgsIW4+UjlP1F1yuOWYd4PRDw22d+ZMuFqiW0XNAYNgdA==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40686574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC4lZ+sheUYHanELUSClfLLk+/hQQrPWoPFDngBIvA+5qNXAA48Rf7UIVz21XtOaF+l8cTrwldtKqDmf6JE4zYf7Vjd6nAKJ9QoMaI4LJTWq3ZGACNdxVv8GRiglSGRTXOxZ/0Jt8LVdZfR07M0m6LCJ1euRWnIjYFyrQPSqwbclYwRNeC41bqLjiaknuUzhHW8ypQ5fpDWI/8LWmxlW7P6+WGXJQpwKOYrimSDjQSIYNY9+cnppq6leE6lf0Lv8W2IRShkFKBoQCfyTCZ9YCivVzhqOyXGtEohhHzP7S3TTHUZABGNien0aPdRqOIzmB609iEtnB/FXsKwqsbVmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN5z1D6OE0t0qCn/asYOcJEbcsKHwmaA4C8+DhC2aGw=;
 b=BhEQb/F1A2OaNh/XWsSG+azyKENMKeRMDobkLFjKwAohDxqVAqYHVO5G+CEG6El55tlwHWTbVPS46aLHvHJ37ExbPNvoqzUMVBMdfCkPcIsgwkKJNAEzAhRcycrF1ebh8mS7Hi2fFNXnrvICMy5ymThGPayM0u/KTWyF291fkE5C7xVvim8T7XOMp/3/BmEIo+fPjFXI7Y2ipiSyeZu+QVsh4N8co7VBWTnkYBL2p0en3PU3VFs/lAzdS/J4FijOAJuiRjwM19kIP9DTmcigUB0GoopLVhfECcUa6KPFdCcIS3U18f1xg1saV+xYcLlFfQDyyXP6ILUUBh2vKDhpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN5z1D6OE0t0qCn/asYOcJEbcsKHwmaA4C8+DhC2aGw=;
 b=LLGxGEtyOmMPa8w14rzdVJ7Q8l+wJeXzyuvutwi67p2AiE0cbd5uHeowsQKJwAmNQcTQlExi7Pehgdb8AtJ6upp39//ulwmSbt3oba6URetT67BXZpVIdrLxpp7mBDFzbaLsDReURzIGDKwJu/LoLqzq3JrPVANNF84+uXAJPAU=
Subject: Re: [PATCH for-4.15 6/7] CHANGELOG.md: Various entries, mostly
 xenstore
To: George Dunlap <George.Dunlap@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson
	<Ian.Jackson@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-6-george.dunlap@citrix.com>
 <97d317fb-16d7-a14e-e74e-62fa83159838@citrix.com>
 <07553207-90AA-4AD4-A5C2-C8F36411DDCB@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d3941c9c-cef2-5521-7028-2fde1f727ae3@citrix.com>
Date: Thu, 1 Apr 2021 15:16:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <07553207-90AA-4AD4-A5C2-C8F36411DDCB@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::23) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 190249cf-1351-4dc1-5744-08d8f518b04b
X-MS-TrafficTypeDiagnostic: BN8PR03MB5139:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB51395ADDE712F555492C91B2BA7B9@BN8PR03MB5139.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLR7ydKTB8B3dscs4uTG5IQ9ONnVaclDZjf4n2ymakR+dCf+C/MZGKfzyPX9j6icBt+RuCBkcHt2SkM+Cu0/26eIkJqhAT/fWmj+o9MRfynzIzcIpIlZ6khesQx9y7EkT69cl/SyC9CpEX1MQ1KbWRuCzquzxINkq6ZbE2JNKAToKcfusGLLXf1fp+H9I/MDAojPDecm9S7psEv7fnNlxjQSeHrsHiWzK2FeVgZxL2bY21vVh/ON53I/YSndi7gJYyIuroe2BfIoNyKWdb+3PYyYTB2C03fCJgr5AloTvPf6VHN9Kh6i6t94RfQelXozXQmZtldafTcQektColJjrTToBI2q82nGu0ivnjYbc1su4X6VKvUYJtDD7QWsBuXbaPI2aIbVoVERMPGe2fwTkiEGszV5bO9kNQclCPcN6jjYpqVZRfDVYDvEpDp5i1SAWHpAhR3AVWbkQwBW499fmG5XRZj5ecWkjnSJxq9x7HRnv/gRqyD0QtcX0HWhCXLQi8f8RzMENLPS8ZtUNIWD7d7Z9FoaIix24z9sqSY+1+v5Rmmk7KPFtSzgeKAHeSS2vkxY/NWL1hYlFn2B3nQZwU9Ph+5yZQD++SlbB8q+9jaNmzjuk/STSfJAj6PjOaRSJAw1Knos8pA9BOyLeKQusQplAQPdswPTEMWNDIWAxB7Kv/vUc589Wva3YtuiTpuUW6I3+S9l3HhH+ITPdSD0yc+V7gZjz3G0TtAydUBWdj9AKIUDIKKWO7Ar3qTNFehiFyYGzj7FtjV5H8X+DJvjpcMpgvTCChcFj6kLfOw4AEHa09QtC4j4le+NJmzgtnfpJ3+zzD4nIYF2g7Ob63k7mbLvwAsiC4iX9RszbprYTcebPHJO0lr6p8lhCDKJ83GB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(8936002)(6862004)(66476007)(83380400001)(38100700001)(66556008)(31686004)(6666004)(66946007)(53546011)(54906003)(26005)(8676002)(36756003)(186003)(6486002)(31696002)(478600001)(16576012)(6636002)(2906002)(956004)(4326008)(107886003)(5660300002)(2616005)(316002)(37006003)(86362001)(16526019)(59356011)(207903002)(219803003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXlWeW10eFlSVXdvWmo4SzZWb3RpaWdsWVd3ZnRkYUJzM1hGcThGVWZqRUly?=
 =?utf-8?B?NnZCaXRTN0FWWGhzdWJMUEJlNGhzYTRkaU1BRFpzTlBZUlI0bG9oV0MxczNh?=
 =?utf-8?B?Skl3VWlqY0tRLytaQ3Vqc09VV2pTYWQ4VW80TTg2SlBkVXloWmYrWXM0eStn?=
 =?utf-8?B?T2JxakxWSXNSWFNLZlQ3anJrNDczWFpJMWVKWGc4VFduRDB6Nk1pZjdLdHBB?=
 =?utf-8?B?cVVMSkcrRHNCQXFWaHFscjJvSW1WZnpXR25NTE81S3hneVdQSGVqTXpsclZs?=
 =?utf-8?B?QnlZUUlKcVlONFYwTm9xODZaVjNGNGZRVjQ5RGwyYTRneWkvSFh0VE5lNVlK?=
 =?utf-8?B?dDQzVzAyMHJmMnZvaWh3UWY0UG8vV2QvbXROTE81NUs4SFVqYVluWkpHbTF0?=
 =?utf-8?B?Z256c2dFYmdiOUszanlTSERTT1U0b1VDYWFLeTJGeURNYkV0SHlxeDE5bklC?=
 =?utf-8?B?VmN6eG13ZVlUMGs0dTgrTFZUd3FiMXF5UFNoeHJZUWMxOXY4aE5CS2hyOU85?=
 =?utf-8?B?b0pLS0xWTnBMZGdsa05qOW85ZnptaXBGeDdhNWRmcUU4TGZ0dHRHaDlwcFc4?=
 =?utf-8?B?dWFNaERLMVIyMnhNS0FPbWk0TkVvYlJWT0pkb1R2RjExQ0RhYkRFN0ZyU0VV?=
 =?utf-8?B?NTlqVDlqVXFLWUpPbUFUYW9XQnA3eDdTU3RGaHBRdGlMajFoQXU3L1NCZ2hC?=
 =?utf-8?B?OVVPTDMweWhLNWxDVWRoZVR0cUxOZXcvN3N0Y09xQUtjWm1hRVVhdkg0cURq?=
 =?utf-8?B?eEdtK2ZkYm5FRnFTUlZuS3d4UktQaW1acDYwb0NBbUV2d1Uwc3pTak5UZTBC?=
 =?utf-8?B?Q01JQ2p4QVdXQnREc2lXQmtWRHYwYXI1T1kyYnFrbXRWMHhsay9UMUJ5aEFh?=
 =?utf-8?B?STMvV1J2RjZiMVFhUG9aQ2x3SW9uVzcwK0VqUVowc3V4L1hZdUI2UnJDZXhh?=
 =?utf-8?B?ZFdOWXRKVkVqcER1T0M0T0doTFRtQzdxbGdvNTJDZkRmSmFPM1dOVW5qaUtJ?=
 =?utf-8?B?ejhaZ0VKSGROWUNCTjhIQmVVaFZXMlgxOFRJV05RN21sM256TlZtZDdac1hY?=
 =?utf-8?B?Vys1Vm9oQy8rT1NLQUtNeVlDcmU4VFlVd2UxMEVXQzdBZ3VuOXZmU3ArMHpn?=
 =?utf-8?B?WHRhdXhhc1FFYTFhSkxmYUVTaU1EczRsVEJTeno0eEY5aFZSZGlLdGtVTVdo?=
 =?utf-8?B?Y1RaVkFHZEQrRllKeXhtWFJjUGpLOXl3YitzMkNRdDFIV01iaVpyQi9nQUxi?=
 =?utf-8?B?NWc2WC9hdTBvc2dlYUcxMTNnT21BY3kzNm1oRHpPWlNveUR4UVUzOEJiRlg4?=
 =?utf-8?B?bXMvOTg4NmI3cnZnT1hPRE43VTQyRU1WSmtteXpZOGRSeHBDblFhbnpCNUhs?=
 =?utf-8?B?RVMwaG55SFhUQWxaYmUyZEw1U0ZuSVY1ZjBnTzczR28rNzQ2YnRCWGpWMkhm?=
 =?utf-8?B?VnNzZit3dWx1VlkzTmFKc1RaNUl4SkR6NmhDUlZieHNHb1VwYWw1SytZQmd1?=
 =?utf-8?B?V3FmcytENEZiNEtONGQ4VDBMYjJOTkgrbC9RTEF5NklZVUZJV05OdlAxanhN?=
 =?utf-8?B?a1lBMHlNcUwwcTBSZURvVUU5K2FlVlB6ZVgzVlp1eFRTanVDdnkvSGt0cVFS?=
 =?utf-8?B?NWtkSE5QVWJjaWw2S3gyZE1VMVhkVzN5RWJIbDhIVk02VXNmVlNUaWpXQ3hJ?=
 =?utf-8?B?dy9VZXE1ZzZpcEJPYXV1UUV0andTUEhMRmcvd2JDNzJiWGk3bWEwU2VadXhT?=
 =?utf-8?Q?fbNt17oiH5DmhEcQOoVpSHFSm20nZsz6N0TDotz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 190249cf-1351-4dc1-5744-08d8f518b04b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:16:06.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wA1bIG64Dda4b7kgDcp9Goh5W2EeDZ9zobsF2ACgq23LU6asI9KeHFLuz7X3HlzjfyO6TTy9tnckdl7stWVnuU349tee9M+if0LWnjBMCNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5139
X-OriginatorOrg: citrix.com

On 01/04/2021 15:13, George Dunlap wrote:
>
>> On Apr 1, 2021, at 3:00 PM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 01/04/2021 14:38, George Dunlap wrote:
>>> ...grouped by submitters / maintainers
>>>
>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>> ---
>>> CC: Juergen Gross <jgross@suse.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Ian Jackson <ian.jackson@citrix.com>
>>> ---
>>> CHANGELOG.md | 3 +++
>>> 1 file changed, 3 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 2f26cd5c87..9c272a0113 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -28,8 +28,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>  - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds
>>>  - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
>>>  - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
>>> + - Fix permissions for watches on @introduceDomain and @releaseDomain: By default, only privileged domains can set watches; but specific domains can be given permission in order to allow disaggregation.
>> This is XSA-115, and isn't something new in 4.15 vs 4.14.  (I think?)
> XSA-115 went public during the 4.15 development window.
>
> So on the one hand, it’s certainly effort that happened during the window, which it would be good to highlight.   On the other hand, it was backported to all security supported trees (?), so it’s not something you need to update to 4.15 to get.
>
> Honestly not sure the best thing to suggest here.

We either want all XSAs discussed, or none of them.  Possibly as simple
as "the following XSAs {...} where developed and released" ?

I recall Lars making this part of the release notes in the past.

>
>>> + - xenstore can now be live-updated on a running system.
>> This needs to be very clear that it is tech preview.  It does not
>> currently work cleanly if a malicious VM deliberately holds a
>> transaction open.
> OK, I’ll add (tech preview) at the end.

SGTM.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83B7F9F72
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:20:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642041.1001116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7abO-00035b-LA; Mon, 27 Nov 2023 12:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642041.1001116; Mon, 27 Nov 2023 12:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7abO-00033D-ID; Mon, 27 Nov 2023 12:20:38 +0000
Received: by outflank-mailman (input) for mailman id 642041;
 Mon, 27 Nov 2023 12:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7abM-000337-UX
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:20:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cb437c9-8d1f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 13:20:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 12:20:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 12:20:31 +0000
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
X-Inumbo-ID: 5cb437c9-8d1f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZRSFs3T6EEBL9a6Ta0vPKALNv0f/1/Cxo7LiVJKeegnoc7p/X9O4rd/RdpfFavCIolWpuoOmsyQyqD+Bk8TrePVJDDkT7ldl7VgWGTst1R2xUpkxM6kKEUvmNkMtud+ixpWBvPMPX0g2+qG/iD/LmeVztYKhtLTt3PpqWixCccj7ZCru8senAcg8F9J5hm2+moB0tdDVOya9D20eb0UfOrruJNi8io4XMXAki9t/eAmlv3J1Y6IPNyy3Bel7xeENTRrWq8NAzkhDMtgTaYxb8HjrWEGeQzDo7aoOLZH3MmOyXSOMsrxxhkdbI5NtA5b5qjEM7a4A+1umYKc8wCRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXQSlPQFynbsjDvEqV7wgo7JdDUpKIVIfiU5q9MkQEo=;
 b=g24Wr0hwYdiiQbgyn52kVDGW+LTbFI7k0YzLpx2U+FyZuAiUw1gmdJJK9ISUghuDOQTCzbwx6jorTcmarZWQXZBmtsEk+LQSBAqoYL5U7R9oz7aYg+KPJtC5ZM4rTRXHFElzGdDHCuZdGxfbx0fEbznjCJ9NGFsCf0NoG9xGaHfnJIBpxheKgn8ZXwmq32am+X6V8YTbpUo/1M09ZdeBS9fs8KATgE5Pr0MxtLOdljIRyPgGcyWhlLcrTDGBjxMLfdxlogZLtHWvQED+ipeEErleFh/Wrn7GAxTtIJtcZvA29XGl9d/y7Vlu5yS7Qm6xe21jlCoAi5xn3P4tC5b6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXQSlPQFynbsjDvEqV7wgo7JdDUpKIVIfiU5q9MkQEo=;
 b=UXV1UUkwl6v5cyboqZLoGM+gx4swCbwR4H4lZsN6BpxqiHrgDk+2+QeEWbAw1L4HzALZu+Ob00KxeunSjFfdrppvX3pvvWxMpOzp1IoQshUvTJVjw9pJ/o0+d6ZJjEOWJm4EdIwznxbc+G+3rH+1EqEH8xa2vhPRqNY+LydW98Cmn+WcjBMR/TCjtMFV7FNdRhNr2fWF89NBcn5gQtVF8RI00d3JL8+T+iuCIdALxPMLyZ8AowuZGoDW06hjP1w6iALzuQM3y73trwmQUXExtcXMxbgzcOB93DwJt+hGBg/Zt0uT7YO3v1im7ir71mfxPEgn+JMUa2hy4n7Ra8y8tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
Date: Mon, 27 Nov 2023 13:20:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7d720d-8ea9-4a44-58c3-08dbef433f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	huEl/0M7G0nDpCdDDo6sBweDF2/aghE+X9zyUMrVBoPm+wHSJc4YFMiXFbR5Otyfd+KctwuBTTTnvsL3fsioZusgwHPnkqL8dfMZPZtq4+zq2d3+IDL9koFQGM6XmiTiPkgZd79DQ7lk/ggUxqyfj14iWKNd/sWUsqxC4mOTuw0TH+PyE40ADXkazZYySz/RRTHA7MBcR5BgvVmaQmyGk3QQyyWTnX/J02jPx4JeVsRyZOD3ot6A09zEiyUlo4jXmNxtadlcHlxx9SWSLghXOK4ZiILSWM0gofBUkljJeLQQ3cIxVQ9P/OBb0rB6R3emCIV9B0CPIivQwn17Irk2bLI83paNm3LT0MtIX1xmLh4YMk3mRcq80nX/+BvM0q7T1qvyMlQgRp2BkQrGS6dL4/4FOHYyD6hl4eV5i//oCJt3nkCa1B2hinqYcbmf1aecY/mMnRZBJdVjztJeRDLi2g9tpXEmaBnxguZEyTwT0hz+Hh4HNN0bNYfLpqtPqK/Eg0neWk6yuUrZ+OrhEbxoQCmAHOQCHLP4vcitsUKiGNi/JX7pRuH5n/qZCEa7iOdgAy3T2WrZeU1GAoDYJHIDALYmxtwz/1/x0uZqLBCM0xeQ8UiDoiyX2xs9q9WpyQOxNmnbZQSpnbCugBdJOP0SJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(966005)(478600001)(6512007)(38100700002)(86362001)(40140700001)(36756003)(31696002)(5660300002)(41300700001)(7416002)(2906002)(66946007)(83380400001)(30864003)(66556008)(54906003)(4326008)(316002)(6916009)(66476007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEhzV0gwS2xVVlJ1MFhNaVU5MkphYnd1RUR4YlBtdWwvQld1Y1dybGRQU3k1?=
 =?utf-8?B?anp4ajZaTHEyQ200djlXelY2M3Y1WGV5ckk2M0xNY3prYXkvQlF5THh5M0x2?=
 =?utf-8?B?SXdSQUsrZ0hRVTVyOG9reGVlSG5jdXFUMUZFMHl0am1XNDJqT0cwd3NTajRv?=
 =?utf-8?B?ODR0dmxZZUZuYUJJYUlwL2cwZ0V1MXlXMVNlRjhDYUpmdjM2RzlPUll5R1c5?=
 =?utf-8?B?THZURkdqWUVEN2hkQllvdERvei96Q1p4RUczVWFFZmJiaGhPNzlSdysvTDdk?=
 =?utf-8?B?TTNVK1dIbWF6aERVZkJ1NW1uVkpTSVRPdXh3MVZlZXUzTVoyemZjT29oWmZO?=
 =?utf-8?B?ZTMrVm5rZ1VZOU5TNU5WaTVWMmpQM2RWbGJlSlZscnFqN3hZSEhVWWFIZFJo?=
 =?utf-8?B?WjgwZWFKUHAxZUp6T0lwWWpvYVc4c3hIVVBoRmdPa2FudGZtaU92NU5yYmtV?=
 =?utf-8?B?eDFxOHpwNXR1S2ZNWExCS0RabTZHSDFQbDBiVS9LZG0vUy9LNHRjWVIwYUx3?=
 =?utf-8?B?M3o0VXVhMHdmVlBTUTUwRWZCc1hKUE14Snl5ZjBZV1d4Uk1XRWRYenlKWTJ2?=
 =?utf-8?B?R0dyMmxvTDMxOTlVbTM4akIxYXR0c3ZzL0pXVkNvUERMejRPN2lySWpsQUFK?=
 =?utf-8?B?c1hqOG0yQktOVGNqSHA2ZVRtSklwQ1dwNklJYTI4a1JJMTJUa0RrcEZHUTlI?=
 =?utf-8?B?RGhsaStVZ3ZKZ0tZbURqZlJEQm9hT3MvM3F3ekZBUGdrMzMrZW9TNmIwQ3Y4?=
 =?utf-8?B?ZENqRlNUNGI0b0NLTjlYV1E0K1liVHRpelkzVWp0QUxVb2RVc0xleFE2bGdQ?=
 =?utf-8?B?ZVpmdDZMeGl4R2R4OTArTHZLL01lTmhOdnNQN2R1eHphb2Z1QWVvM2NrODkz?=
 =?utf-8?B?ZWFtR0NZUlNVNng1OUcwYkkxSWcraHBTQ25wb2I0V0VicElOWElqV0Z6S1ds?=
 =?utf-8?B?NXNNbmsrYlpxSFU5RWFMZHdJWTZYS0xyV2p5NHFyUmJFSi9MQ1YwekRBOFp1?=
 =?utf-8?B?UjRyTzk1elVFenFKcmFqNnUzd05aZDVvbmhlVWJxNnNDZmFDOUI2Y0dhTy9C?=
 =?utf-8?B?VlZoUFdyTGk2ci9xbUF0aFpOQkJBR2pXMkoxaVZTY0JLUGRwVXVFeWxJNS8y?=
 =?utf-8?B?Z1ltL3o3MGlSUXJseDcrcHNTYVdvOU9nSWIxc1dmOUF0czlMcnFaZlcyUC84?=
 =?utf-8?B?RHlaaEFRWjBCaGdQdzBTYzc3SkIwWFJ5RDNOYkVHR3pZMkhFMWhQV1pKR3px?=
 =?utf-8?B?UHVEdVhvTnI3bk5rOWd4LzNja2lObHhPWC9laG9nc1d5QnRFRGRoaGNTUHdS?=
 =?utf-8?B?VGtaM2dGN1hQZUJPOWRuMnd1S1ZDa1VWTW45VGJnb3pXRDhSWFdqSFBpeUo4?=
 =?utf-8?B?elV4TUJSMHRHZmg5aGh4eVlyMWkwZStyMWR0QkRNL1lmQy9FZCttNWxvNGkz?=
 =?utf-8?B?YkgwYVQ2M0oxbWdsc2tpUW1Dek1EeVRCVzM4M1duWE5OVGpwRDdwZTk4MThV?=
 =?utf-8?B?MFBla1drME80RU8vZDRTcE1YQnRZcDEzZ1YwUlB1SFJBSERzNDhnNHFPQjhk?=
 =?utf-8?B?RXdscXJkaGl5dnFOQUtRczU3dzZFaEpnWVR2bll4ak9CZFI2L3Z4SEVabmEw?=
 =?utf-8?B?cGJqUGRUdlFUMlRPUlAyUkthbHZEMzlXb2JPaE1YTUxYVzNXd0FsTmRINStn?=
 =?utf-8?B?dzBHQWN4QzVCZzVLcnlhRWxScVJDdWV3cSsxWGU1UEtodUZRVnVSSVhmQ2JW?=
 =?utf-8?B?QlBJbkhhQ0lBeUo2NHVOMnVKQXFJTkkvUzhiS2FjRWhReUMrY0tvZ0RDV1Ji?=
 =?utf-8?B?NDNXZDlnREZRckdSb3RDcnFNNXE2ZTQ3aFJjT0pPMUtPcEN0elZXekU1N2Rm?=
 =?utf-8?B?OEorYXMvd0I2U1V5REZQT2VuN2MyZkk3a0ZaTlNZYStrNS9POWt1c25KYS84?=
 =?utf-8?B?Mm1jSzdodVpzeDJTOEpxRU9tdUFVMU5ESG5yNDVySWpJN000Q0Z3WHBxeVhR?=
 =?utf-8?B?UWZmSzFUeGRmelNmMFA1NkgxeCtxRVZyaWFSQ3FiNWppbWRYM2ZMbk55S3dE?=
 =?utf-8?B?Sm1DdnpCU2hmZkZ2R1hXTkFTOXR6ZUVwM2JMamlyRXVmemdQdUtYclpTZ2FE?=
 =?utf-8?Q?cvqxhDIkt3kVdzG0dGeBjB2DB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7d720d-8ea9-4a44-58c3-08dbef433f77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 12:20:31.0958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRPC3CHBIGtwiEx6cWCWrIjpAcBsJYskAr2vUX/PrN2n9LgQNLM9pYXafjSWfTCl8Bs2xkzlvzUadMtUuBPAEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7590

On 24.11.2023 15:52, Luca Fancellu wrote:
>> On 24 Nov 2023, at 12:47, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.11.2023 15:47, Luca Fancellu wrote:
>>> Let’s continue the discussion about clang-format configuration, this is part 2, previous discussions are:
>>>
>>> - https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
>>>
>>> You can find the serie introducing clang-format here:
>>> https://patchwork.kernel.org/project/xen-devel/cover/20231031132304.2573924-1-luca.fancellu@arm.com/
>>> and there is also a patch linked to my gitlab account where you can find the output for the hypervisor code.
>>>
>>> For a full list of configurables and to find the possible values for them, please refer to this page:
>>> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
>>>
>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>
>>> Our coding style doesn’t mention anything about alignment, shall we add a new section?
>>> I can send patches when we reach agreement on each of these rules.
>>>
>>>
>>> QualifierAlignment: Custom
>>> QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
>>>
>>> ---
>>> For “QualifierAlignment” I chose Custom in order to apply in “QualifierOrder” an order for the
>>> qualifiers that match the current codebase, we could specify also “Leave” in order to keep
>>> them as they are.
>>
>> Where do attributes go in this sequence?
> 
> I think function declaration/definition and variables.

How does this relate to my question? I asked about the sequence of elements
listed for QualifierOrder:, where attributes don't appear at all right now.

>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>
>>> AlignAfterOpenBracket: Align
>>>
>>> ---
>>> This one is to align function parameters that overflows the line length, I chose to align them
>>> to the open bracket to match the current codebase (hopefully)
>>>
>>> e.g.:
>>> someLongFunction(argument1,
>>>                                argument2);
>>
>> The above matches neither of the two generally permitted styles:
>>
>>    someLongFunction(argument1,
>>                     argument2);
>>
>>    someLongFunction(
>>        argument1,
>>        argument2);
>>
>> Then again from its name I would infer this isn't just about function
>> arguments?
> 
> I think it applies to parameters and arguments of functions and macro, given the description in the docs.
> 
> I see your two snippets above but I’ve always found at least on arm a predominance of
> the style above for functions, so arguments aligned after the opening bracket, for macros
> there is a mix.

The latter "above" refers to which form exactly? The one you originally
spelled out, or the former of what my reply had?

> I might be wrong though and so another opinion from another maintainer would help.
> 
> In any case we can choose among many value: https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
> but when we do so, we need to stick to one permitted style only, the tool don’t allow to specify more than one.

On top of my earlier reply yet another reason perhaps that this tool then
won't really fit our intended use.

>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>
>>> AlignArrayOfStructures: Left
>>>
>>> ---
>>> “When using initialization for an array of structs aligns the fields into columns."
>>> It’s important to say that even if we specify “None”, it is going to format the data structure anyway,
>>> I choose left, but clearly I’m open to suggestions.
>>
>> You don't say in which way it re-formats such constructs.
> 
> Sure, taking as example an array of structure, xen/drivers/video/modelines.h,
> 
> With AlignArrayOfStructures: None we have this below.
> 
> diff --git a/xen/drivers/video/modelines.h b/xen/drivers/video/modelines.h
> index 9cb7cdde055f..3ff23ef1f8a7 100644
> --- a/xen/drivers/video/modelines.h
> +++ b/xen/drivers/video/modelines.h
> @@ -42,36 +42,36 @@ struct modeline {
>  };
>  
>  struct modeline __initdata videomodes[] = {
> -    { "640x480@60",   25175,  640,  16,   96,   48,   480,  11,   2,    31 },
> -    { "640x480@72",   31500,  640,  24,   40,   128,  480,  9,    3,    28 },
> -    { "640x480@75",   31500,  640,  16,   96,   48,   480,  11,   2,    32 },
> -    { "640x480@85",   36000,  640,  32,   48,   112,  480,  1,    3,    25 },
> -    { "800x600@56",   38100,  800,  32,   128,  128,  600,  1,    4,    14 },
> -    { "800x600@60",   40000,  800,  40,   128,  88 ,  600,  1,    4,    23 },
> -    { "800x600@72",   50000,  800,  56,   120,  64 ,  600,  37,   6,    23 },
> -    { "800x600@75",   49500,  800,  16,   80,   160,  600,  1,    2,    21 },
> -    { "800x600@85",   56250,  800,  32,   64,   152,  600,  1,    3,    27 },
> -    { "1024x768@60",  65000,  1024, 24,   136,  160,  768,  3,    6,    29 },
> -    { "1024x768@70",  75000,  1024, 24,   136,  144,  768,  3,    6,    29 },
> -    { "1024x768@75",  78750,  1024, 16,   96,   176,  768,  1,    3,    28 },
> -    { "1024x768@85",  94500,  1024, 48,   96,   208,  768,  1,    3,    36 },
> -    { "1280x1024@60", 108000, 1280, 48,   112,  248,  1024, 1,    3,    38 },
> -    { "1280x1024@75", 135000, 1280, 16,   144,  248,  1024, 1,    3,    38 },
> -    { "1280x1024@85", 157500, 1280, 64,   160,  224,  1024, 1,    3,    44 },
> -    { "1400x1050@60", 122610, 1400, 88,   152,  240,  1050, 1,    3,    33 },
> -    { "1400x1050@75", 155850, 1400, 96,   152,  248,  1050, 1,    3,    42 },
> -    { "1600x1200@60", 162000, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@65", 175500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@70", 189000, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@75", 202500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@85", 229500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1792x1344@60", 204800, 1792, 128,  200,  328,  1344, 1,    3,    46 },
> -    { "1792x1344@75", 261000, 1792, 96,   216,  352,  1344, 1,    3,    69 },
> -    { "1856x1392@60", 218300, 1856, 96,   224,  352,  1392, 1,    3,    43 },
> -    { "1856x1392@75", 288000, 1856, 128,  224,  352,  1392, 1,    3,    104 },
> -    { "1920x1200@75", 193160, 1920, 128,  208,  336,  1200, 1,    3,    38 },
> -    { "1920x1440@60", 234000, 1920, 128,  208,  344,  1440, 1,    3,    56 },
> -    { "1920x1440@75", 297000, 1920, 144,  224,  352,  1440, 1,    3,    56 },
> +    { "640x480@60", 25175, 640, 16, 96, 48, 480, 11, 2, 31 },
> +    { "640x480@72", 31500, 640, 24, 40, 128, 480, 9, 3, 28 },
> +    { "640x480@75", 31500, 640, 16, 96, 48, 480, 11, 2, 32 },
> +    { "640x480@85", 36000, 640, 32, 48, 112, 480, 1, 3, 25 },
> +    { "800x600@56", 38100, 800, 32, 128, 128, 600, 1, 4, 14 },
> +    { "800x600@60", 40000, 800, 40, 128, 88, 600, 1, 4, 23 },
> +    { "800x600@72", 50000, 800, 56, 120, 64, 600, 37, 6, 23 },
> +    { "800x600@75", 49500, 800, 16, 80, 160, 600, 1, 2, 21 },
> +    { "800x600@85", 56250, 800, 32, 64, 152, 600, 1, 3, 27 },
> +    { "1024x768@60", 65000, 1024, 24, 136, 160, 768, 3, 6, 29 },
> +    { "1024x768@70", 75000, 1024, 24, 136, 144, 768, 3, 6, 29 },
> +    { "1024x768@75", 78750, 1024, 16, 96, 176, 768, 1, 3, 28 },
> +    { "1024x768@85", 94500, 1024, 48, 96, 208, 768, 1, 3, 36 },
> +    { "1280x1024@60", 108000, 1280, 48, 112, 248, 1024, 1, 3, 38 },
> +    { "1280x1024@75", 135000, 1280, 16, 144, 248, 1024, 1, 3, 38 },
> +    { "1280x1024@85", 157500, 1280, 64, 160, 224, 1024, 1, 3, 44 },
> +    { "1400x1050@60", 122610, 1400, 88, 152, 240, 1050, 1, 3, 33 },
> +    { "1400x1050@75", 155850, 1400, 96, 152, 248, 1050, 1, 3, 42 },
> +    { "1600x1200@60", 162000, 1600, 64, 192, 304, 1200, 1, 3, 46 },
> +    { "1600x1200@65", 175500, 1600, 64, 192, 304, 1200, 1, 3, 46 },
> +    { "1600x1200@70", 189000, 1600, 64, 192, 304, 1200, 1, 3, 46 },
> +    { "1600x1200@75", 202500, 1600, 64, 192, 304, 1200, 1, 3, 46 },
> +    { "1600x1200@85", 229500, 1600, 64, 192, 304, 1200, 1, 3, 46 },
> +    { "1792x1344@60", 204800, 1792, 128, 200, 328, 1344, 1, 3, 46 },
> +    { "1792x1344@75", 261000, 1792, 96, 216, 352, 1344, 1, 3, 69 },
> +    { "1856x1392@60", 218300, 1856, 96, 224, 352, 1392, 1, 3, 43 },
> +    { "1856x1392@75", 288000, 1856, 128, 224, 352, 1392, 1, 3, 104 },
> +    { "1920x1200@75", 193160, 1920, 128, 208, 336, 1200, 1, 3, 38 },
> +    { "1920x1440@60", 234000, 1920, 128, 208, 344, 1440, 1, 3, 56 },
> +    { "1920x1440@75", 297000, 1920, 144, 224, 352, 1440, 1, 3, 56 },
>  };
>  
>  #endif
> 
> With AlignArrayOfStructures: Left we have (I noticed there might be a small
> bug in clang-format since the first entry has no space after the opening curly bracket):
> 
> diff --git a/xen/drivers/video/modelines.h b/xen/drivers/video/modelines.h
> index 9cb7cdde055f..1afe725dcb4c 100644
> --- a/xen/drivers/video/modelines.h
> +++ b/xen/drivers/video/modelines.h
> @@ -42,36 +42,36 @@ struct modeline {
>  };
>  
>  struct modeline __initdata videomodes[] = {
> -    { "640x480@60",   25175,  640,  16,   96,   48,   480,  11,   2,    31 },
> -    { "640x480@72",   31500,  640,  24,   40,   128,  480,  9,    3,    28 },
> -    { "640x480@75",   31500,  640,  16,   96,   48,   480,  11,   2,    32 },
> -    { "640x480@85",   36000,  640,  32,   48,   112,  480,  1,    3,    25 },
> -    { "800x600@56",   38100,  800,  32,   128,  128,  600,  1,    4,    14 },
> -    { "800x600@60",   40000,  800,  40,   128,  88 ,  600,  1,    4,    23 },
> -    { "800x600@72",   50000,  800,  56,   120,  64 ,  600,  37,   6,    23 },
> -    { "800x600@75",   49500,  800,  16,   80,   160,  600,  1,    2,    21 },
> -    { "800x600@85",   56250,  800,  32,   64,   152,  600,  1,    3,    27 },
> -    { "1024x768@60",  65000,  1024, 24,   136,  160,  768,  3,    6,    29 },
> -    { "1024x768@70",  75000,  1024, 24,   136,  144,  768,  3,    6,    29 },
> -    { "1024x768@75",  78750,  1024, 16,   96,   176,  768,  1,    3,    28 },
> -    { "1024x768@85",  94500,  1024, 48,   96,   208,  768,  1,    3,    36 },
> -    { "1280x1024@60", 108000, 1280, 48,   112,  248,  1024, 1,    3,    38 },
> -    { "1280x1024@75", 135000, 1280, 16,   144,  248,  1024, 1,    3,    38 },
> -    { "1280x1024@85", 157500, 1280, 64,   160,  224,  1024, 1,    3,    44 },
> -    { "1400x1050@60", 122610, 1400, 88,   152,  240,  1050, 1,    3,    33 },
> -    { "1400x1050@75", 155850, 1400, 96,   152,  248,  1050, 1,    3,    42 },
> -    { "1600x1200@60", 162000, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@65", 175500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@70", 189000, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@75", 202500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@85", 229500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1792x1344@60", 204800, 1792, 128,  200,  328,  1344, 1,    3,    46 },
> -    { "1792x1344@75", 261000, 1792, 96,   216,  352,  1344, 1,    3,    69 },
> -    { "1856x1392@60", 218300, 1856, 96,   224,  352,  1392, 1,    3,    43 },
> -    { "1856x1392@75", 288000, 1856, 128,  224,  352,  1392, 1,    3,    104 },
> -    { "1920x1200@75", 193160, 1920, 128,  208,  336,  1200, 1,    3,    38 },
> -    { "1920x1440@60", 234000, 1920, 128,  208,  344,  1440, 1,    3,    56 },
> -    { "1920x1440@75", 297000, 1920, 144,  224,  352,  1440, 1,    3,    56 },
> +    {"640x480@60",    25175,  640,  16,  96,  48,  480,  11, 2, 31 },
> +    { "640x480@72",   31500,  640,  24,  40,  128, 480,  9,  3, 28 },
> +    { "640x480@75",   31500,  640,  16,  96,  48,  480,  11, 2, 32 },
> +    { "640x480@85",   36000,  640,  32,  48,  112, 480,  1,  3, 25 },
> +    { "800x600@56",   38100,  800,  32,  128, 128, 600,  1,  4, 14 },
> +    { "800x600@60",   40000,  800,  40,  128, 88,  600,  1,  4, 23 },
> +    { "800x600@72",   50000,  800,  56,  120, 64,  600,  37, 6, 23 },
> +    { "800x600@75",   49500,  800,  16,  80,  160, 600,  1,  2, 21 },
> +    { "800x600@85",   56250,  800,  32,  64,  152, 600,  1,  3, 27 },
> +    { "1024x768@60",  65000,  1024, 24,  136, 160, 768,  3,  6, 29 },
> +    { "1024x768@70",  75000,  1024, 24,  136, 144, 768,  3,  6, 29 },
> +    { "1024x768@75",  78750,  1024, 16,  96,  176, 768,  1,  3, 28 },
> +    { "1024x768@85",  94500,  1024, 48,  96,  208, 768,  1,  3, 36 },
> +    { "1280x1024@60", 108000, 1280, 48,  112, 248, 1024, 1,  3, 38 },
> +    { "1280x1024@75", 135000, 1280, 16,  144, 248, 1024, 1,  3, 38 },
> +    { "1280x1024@85", 157500, 1280, 64,  160, 224, 1024, 1,  3, 44 },
> +    { "1400x1050@60", 122610, 1400, 88,  152, 240, 1050, 1,  3, 33 },
> +    { "1400x1050@75", 155850, 1400, 96,  152, 248, 1050, 1,  3, 42 },
> +    { "1600x1200@60", 162000, 1600, 64,  192, 304, 1200, 1,  3, 46 },
> +    { "1600x1200@65", 175500, 1600, 64,  192, 304, 1200, 1,  3, 46 },
> +    { "1600x1200@70", 189000, 1600, 64,  192, 304, 1200, 1,  3, 46 },
> +    { "1600x1200@75", 202500, 1600, 64,  192, 304, 1200, 1,  3, 46 },
> +    { "1600x1200@85", 229500, 1600, 64,  192, 304, 1200, 1,  3, 46 },
> +    { "1792x1344@60", 204800, 1792, 128, 200, 328, 1344, 1,  3, 46 },
> +    { "1792x1344@75", 261000, 1792, 96,  216, 352, 1344, 1,  3, 69 },
> +    { "1856x1392@60", 218300, 1856, 96,  224, 352, 1392, 1,  3, 43 },
> +    { "1856x1392@75", 288000, 1856, 128, 224, 352, 1392, 1,  3, 104},
> +    { "1920x1200@75", 193160, 1920, 128, 208, 336, 1200, 1,  3, 38 },
> +    { "1920x1440@60", 234000, 1920, 128, 208, 344, 1440, 1,  3, 56 },
> +    { "1920x1440@75", 297000, 1920, 144, 224, 352, 1440, 1,  3, 56 },
>  };
>  
>  #endif
> 
> With AlignArrayOfStructures: Right we have:
> 
> diff --git a/xen/drivers/video/modelines.h b/xen/drivers/video/modelines.h
> index 9cb7cdde055f..539ab7c12d00 100644
> --- a/xen/drivers/video/modelines.h
> +++ b/xen/drivers/video/modelines.h
> @@ -42,36 +42,36 @@ struct modeline {
>  };
>  
>  struct modeline __initdata videomodes[] = {
> -    { "640x480@60",   25175,  640,  16,   96,   48,   480,  11,   2,    31 },
> -    { "640x480@72",   31500,  640,  24,   40,   128,  480,  9,    3,    28 },
> -    { "640x480@75",   31500,  640,  16,   96,   48,   480,  11,   2,    32 },
> -    { "640x480@85",   36000,  640,  32,   48,   112,  480,  1,    3,    25 },
> -    { "800x600@56",   38100,  800,  32,   128,  128,  600,  1,    4,    14 },
> -    { "800x600@60",   40000,  800,  40,   128,  88 ,  600,  1,    4,    23 },
> -    { "800x600@72",   50000,  800,  56,   120,  64 ,  600,  37,   6,    23 },
> -    { "800x600@75",   49500,  800,  16,   80,   160,  600,  1,    2,    21 },
> -    { "800x600@85",   56250,  800,  32,   64,   152,  600,  1,    3,    27 },
> -    { "1024x768@60",  65000,  1024, 24,   136,  160,  768,  3,    6,    29 },
> -    { "1024x768@70",  75000,  1024, 24,   136,  144,  768,  3,    6,    29 },
> -    { "1024x768@75",  78750,  1024, 16,   96,   176,  768,  1,    3,    28 },
> -    { "1024x768@85",  94500,  1024, 48,   96,   208,  768,  1,    3,    36 },
> -    { "1280x1024@60", 108000, 1280, 48,   112,  248,  1024, 1,    3,    38 },
> -    { "1280x1024@75", 135000, 1280, 16,   144,  248,  1024, 1,    3,    38 },
> -    { "1280x1024@85", 157500, 1280, 64,   160,  224,  1024, 1,    3,    44 },
> -    { "1400x1050@60", 122610, 1400, 88,   152,  240,  1050, 1,    3,    33 },
> -    { "1400x1050@75", 155850, 1400, 96,   152,  248,  1050, 1,    3,    42 },
> -    { "1600x1200@60", 162000, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@65", 175500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@70", 189000, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@75", 202500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1600x1200@85", 229500, 1600, 64,   192,  304,  1200, 1,    3,    46 },
> -    { "1792x1344@60", 204800, 1792, 128,  200,  328,  1344, 1,    3,    46 },
> -    { "1792x1344@75", 261000, 1792, 96,   216,  352,  1344, 1,    3,    69 },
> -    { "1856x1392@60", 218300, 1856, 96,   224,  352,  1392, 1,    3,    43 },
> -    { "1856x1392@75", 288000, 1856, 128,  224,  352,  1392, 1,    3,    104 },
> -    { "1920x1200@75", 193160, 1920, 128,  208,  336,  1200, 1,    3,    38 },
> -    { "1920x1440@60", 234000, 1920, 128,  208,  344,  1440, 1,    3,    56 },
> -    { "1920x1440@75", 297000, 1920, 144,  224,  352,  1440, 1,    3,    56 },
> +    {  "640x480@60",  25175,  640,  16,  96,  48,  480, 11, 2,  31},
> +    {  "640x480@72",  31500,  640,  24,  40, 128,  480,  9, 3,  28},
> +    {  "640x480@75",  31500,  640,  16,  96,  48,  480, 11, 2,  32},
> +    {  "640x480@85",  36000,  640,  32,  48, 112,  480,  1, 3,  25},
> +    {  "800x600@56",  38100,  800,  32, 128, 128,  600,  1, 4,  14},
> +    {  "800x600@60",  40000,  800,  40, 128,  88,  600,  1, 4,  23},
> +    {  "800x600@72",  50000,  800,  56, 120,  64,  600, 37, 6,  23},
> +    {  "800x600@75",  49500,  800,  16,  80, 160,  600,  1, 2,  21},
> +    {  "800x600@85",  56250,  800,  32,  64, 152,  600,  1, 3,  27},
> +    { "1024x768@60",  65000, 1024,  24, 136, 160,  768,  3, 6,  29},
> +    { "1024x768@70",  75000, 1024,  24, 136, 144,  768,  3, 6,  29},
> +    { "1024x768@75",  78750, 1024,  16,  96, 176,  768,  1, 3,  28},
> +    { "1024x768@85",  94500, 1024,  48,  96, 208,  768,  1, 3,  36},
> +    {"1280x1024@60", 108000, 1280,  48, 112, 248, 1024,  1, 3,  38},
> +    {"1280x1024@75", 135000, 1280,  16, 144, 248, 1024,  1, 3,  38},
> +    {"1280x1024@85", 157500, 1280,  64, 160, 224, 1024,  1, 3,  44},
> +    {"1400x1050@60", 122610, 1400,  88, 152, 240, 1050,  1, 3,  33},
> +    {"1400x1050@75", 155850, 1400,  96, 152, 248, 1050,  1, 3,  42},
> +    {"1600x1200@60", 162000, 1600,  64, 192, 304, 1200,  1, 3,  46},
> +    {"1600x1200@65", 175500, 1600,  64, 192, 304, 1200,  1, 3,  46},
> +    {"1600x1200@70", 189000, 1600,  64, 192, 304, 1200,  1, 3,  46},
> +    {"1600x1200@75", 202500, 1600,  64, 192, 304, 1200,  1, 3,  46},
> +    {"1600x1200@85", 229500, 1600,  64, 192, 304, 1200,  1, 3,  46},
> +    {"1792x1344@60", 204800, 1792, 128, 200, 328, 1344,  1, 3,  46},
> +    {"1792x1344@75", 261000, 1792,  96, 216, 352, 1344,  1, 3,  69},
> +    {"1856x1392@60", 218300, 1856,  96, 224, 352, 1392,  1, 3,  43},
> +    {"1856x1392@75", 288000, 1856, 128, 224, 352, 1392,  1, 3, 104},
> +    {"1920x1200@75", 193160, 1920, 128, 208, 336, 1200,  1, 3,  38},
> +    {"1920x1440@60", 234000, 1920, 128, 208, 344, 1440,  1, 3,  56},
> +    {"1920x1440@75", 297000, 1920, 144, 224, 352, 1440,  1, 3,  56},
>  };
>  
>  #endif

None of which improve what we have at present, imo. Yet another reason not
to use this tool then, I would say.

Jan


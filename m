Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668276AC91
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574000.899165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlQp-00026w-G6; Tue, 01 Aug 2023 09:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574000.899165; Tue, 01 Aug 2023 09:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlQp-000240-CI; Tue, 01 Aug 2023 09:12:43 +0000
Received: by outflank-mailman (input) for mailman id 574000;
 Tue, 01 Aug 2023 09:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQlQo-00023t-HN
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:12:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 912da532-304b-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 11:12:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6911.eurprd04.prod.outlook.com (2603:10a6:803:12e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 09:12:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 09:12:37 +0000
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
X-Inumbo-ID: 912da532-304b-11ee-b259-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys+2K/JN4yXCRCYGR1ixspZmF2JVpM2ouHjctoWbP+4rH6UvDpdYzudYjD0Da6zJ72VDRAcrw/AGZL83qeBOFXQOkN/0TqdXdDnp7VwQjZOYfczZaEY4Eb9UeYrArJtX89e1rD9kBi5aMc14cQNGtc5+3/5s5sB9EdWKuMU1qbF+2rv4ErVWujUI5qvRqX4HDBSpgAHJ+JCQC3lgIufixMwpknGQUJOpZj9lG8stZUcZaWiTf10e1ODcrc71X+vONyBrYrZ2jzBtA6AFmJ88iiZ3yZA7psf6Reo0mnffHKhk+MBSi8oOvDyWz0PgSujngO/BB9RzRiUtGRTQZpgifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHKD4iMmkPdgbq5iQ88Y4kY4iH5j/1SDkoXotYoUXAs=;
 b=VBhMHQ7fC7CD9Y3OGBwCju+CzEdsrNQbVCNQHvDRA22q4LF2H9TYSuNUEf+fkSMLQBkbdZWUZnRZEcZ7XH2hRJNDPKZtxWNf1wY9HqLUO7W6nCauKbyjYtlK4aCZhKc4D7K5JBeFJHnwlB7uwWVnIL7DwhXmymGt3Kn4g0ADzc0oMaYuUeyMArfVx2zkmqScfCRnrBVFIsINyg9zEG0bVJBZ14ks/ktH/8CMDtcklGB75ykaYo8fEJ6ExSbA4+CxIcdHXx5RkvGOcVHiUwqQuf4YZfBF7cWKEX1vWDLV3Icu7wf5y+b0ffYSeYVNP37FB8FND5Qo0H3jeJA8zLWB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHKD4iMmkPdgbq5iQ88Y4kY4iH5j/1SDkoXotYoUXAs=;
 b=nEutwpJKJzRRSEaKKBW7rBqr+gXCZP5TD7FJ5ti2QIdm6eU7mcf2cvGM1oGBwdeSIn0uRmhzshvZ9I/5gtyBSOTwm4dEUsfgOUhrO/Agfg3VRpifpmemjPLTH9hoQxGZikfu9MY+sxqsfEzY0vHLLBkyTcWIFXKq+ZQP1ue4fS98j0iSWltIU0A4OFPz4gS1N5PAn3ww7T/Vv3lcaiYoAhoEYwdMQbOwNurw3hpLR6kTaMwxMZ9+BdNgXGT/Svm4dUQF9dYcKuxOwCAk1SVYS0VxTRcSxJzPDPID5j0MxbMd4TUdiK02awNp6oxH9ubmFu0zKC/ghFC8lbK1mlBMzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98f49c19-67e3-7a79-7fc3-02d065f50c79@suse.com>
Date: Tue, 1 Aug 2023 11:12:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v5 2/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690464789.git.oleksii.kurochko@gmail.com>
 <ab2e719bbe071c3d5c4e3341573c0848dfcee3ee.1690464789.git.oleksii.kurochko@gmail.com>
 <911eba8e-a92b-896c-e5dc-e54dcd570664@suse.com>
 <0bcbcb53db1f0c9ae279347c3f5c762e5324dd15.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0bcbcb53db1f0c9ae279347c3f5c762e5324dd15.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: d8aa5858-a458-4383-df15-08db926f72c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3dEYwOXZQAiZ5RPpEIqAiWiW2c3LZR1uTI3xjWxH7ChqKqIyz5PRbkMfGPnhupEwaDirZysmKClTE6lKKgNjDWhfR7RpS4WjBIf/Crfckz2cAeauwj9i6KkcgjmF2kmvxDUtLmgZUDi1e3zTohvfcBvwLqa+GzPpn39e3nEVcEJvJwkEw7XIA0bxIZ/CpAbccqHjCoJi6e3JVjn8wpLaauRwSXNvJuGALvKQX2kBKlooUkAGTl3llOUHKLUV4NVvBuajPwYv0YBQ3nTJlmP4DVjB3ySG7E45rqzYtcB9+xMDzEbppztj44jvZvb9JzCoPP2+glvwHM6KmeWtLZx9W7+3HAqjxvZsqDHPFI2javhqaolRvmoAEhLp51gE5rrRCt43+1zKHg5bgSJrjCb73XJuW5VlORemMIxkFzFU5xAZedCWZzzjmgQvW7LVWrFlw950v3rRejncjf9YF+NHbn2CCWo8rxddrcqJnyIOd70syWcihbx2qYSUg1/KMQj1ys4vZKmaL2NaqSPiqt8Shx26hDNlFJLWLme5yK5pUFL1ZiyOL0ZNN2cSHxAFMARBZgNTSm0/cqT05tT2QcczJZOQGG8CfuCw5Bcy70K4E8KL8WQ2t0sjUq1iigAF9umTgPo3eybvg62jiqGAJne83Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199021)(6512007)(31686004)(6666004)(5660300002)(186003)(66946007)(66476007)(66556008)(4326008)(6916009)(478600001)(54906003)(6486002)(316002)(41300700001)(8936002)(8676002)(26005)(38100700002)(31696002)(86362001)(53546011)(36756003)(2906002)(6506007)(2616005)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZjb1l5Q1BlL1hncGlOWHRxM0Q1VjBqNnZHNnEvbW5oU3RSWU9YUXJ4dytI?=
 =?utf-8?B?eVMxd0NJdUpmMWZWZkVzcit4MVUyVVNHd2xodmtzZG1QUVVuQm94UnJJblA2?=
 =?utf-8?B?WVpVcU5CekZ0UHVJK24zOVExdnBPQ0hhWjNReUo4WlJUWXRwdkhkdXlidHk4?=
 =?utf-8?B?bWw2QVA3MCs3RS85UHFMM0xsWWl2MFBsalRmZlRycmlYWDdsTzEyRmVlNDl4?=
 =?utf-8?B?VUltTjZnWG4zdmJhemxLTk15eUdnV2IzTzBUcU8xRitJWmY3TGpJbUxTMmU4?=
 =?utf-8?B?am5jZEhCTHpzRnVFdjlaTU5TZFJUTVBIMG9rSUE3QlZVZWVJWlcyT2VncU50?=
 =?utf-8?B?NXRFZTZLeUlkRjkwczU4eEFNK3hnNkhEbU56enJNTGdCQ211RnJmYXBTQ0l0?=
 =?utf-8?B?SXMzNHEvWmJXL2xXVEdBdDd5WW9tdzdaZ0VSclozcmRhNlVzYXFSVnF4Vkli?=
 =?utf-8?B?QlBaWmJrTUNGbmU0d2Fzcm9TdmJRR0Q1TWFTOVBLVWhwZ280ejg3QzZJd1Ja?=
 =?utf-8?B?MlkvbnZzVVJ5RGE4NEdlTEZXZDRIcEZFWG1lN3IrWFczVXE0WjU2T1RDalRw?=
 =?utf-8?B?VFJBSUFoT1FybFZ0UVRvWlA1Z0tBMHdwd0tTbG5odXcwTy9xTnY1UzFDQWhk?=
 =?utf-8?B?Y3BGUTV3Y1FQOVR5Y09vYjVjV2NFZUJ1Um9CUmw4bmxzV3pITzh0YVBscldX?=
 =?utf-8?B?ZXh6VWhoYUdOcmIxSjJneFkvRHYyS2VmVFk1VjJreTk5dTVOdUtCRG5nWFNh?=
 =?utf-8?B?dGxDVDFYb2hnQ0ZrRlpGbEo1T0dQTjVyVmQ4ODJxdWxRZHNYV29XVGNpUzFr?=
 =?utf-8?B?cy9hQnd0TjZtU3VsNS9WOUVzS3ZGeVB6bzdhbnU0NUhVbFJJamY5VUpqQldr?=
 =?utf-8?B?UHNVN2R3MWRHQXlWakxCOEM1RnpSRmhRY1pyUVo0RE8zQjg1KzY3Y2ZSUk80?=
 =?utf-8?B?Y1NJc2Q4SVNzaFJNd0thNno2a08xL3N3UTQ5Z0JHdTZtUDE0VGRXSE1aZEZI?=
 =?utf-8?B?cCsxUHFsRk13TFFSajFsZUIwZkJFeXNYZXVNWWdXRzErRmZlR3hoMmt0eUVK?=
 =?utf-8?B?empmSlpCMmZoWlcxcFo0QUJjaDVLVFJLMmdWZEJrSFJoWUMvK3B0SjFIamEz?=
 =?utf-8?B?MW83bDJPTCtLQ1R1SGlVeCt4RFNFalZKYmR1ZGJmNk5TMGpqbWE4Uy9WdVYr?=
 =?utf-8?B?NE5xcGtYV1R6b1NuSDVhc1JTU1R6OWx5aDRTT1A5MlN0NkE4TDFveUtua28v?=
 =?utf-8?B?ZGk5eXd6b01uQ3d4Q01QTDM0aFVzRGdtRGRtdUV0Y00vbHlXbUs1MURxQllj?=
 =?utf-8?B?bEJUcGd4b3MwSlpLdDhHdmtvNXVJc3ZjVUtOQ3JWZFdCZGJFSnNpd05JM2xR?=
 =?utf-8?B?THBzc0gyQ2xyODJtaERJcDdDT1pRcmpTVFBOaGVkeHlCMk5rdGxBVU8zREdo?=
 =?utf-8?B?MnJOT3FNTWRNbm0zKzFXWG1PYXFJM01vUVdna2FrcnZkdUl5bEdKSnhyd2xm?=
 =?utf-8?B?MUNwUEplTHplRU9TeGhaNHlGVnpCWXpxYXhydzhwUExEZnBsWjZlR09lMGtV?=
 =?utf-8?B?NDkwYngrMmwrdjZOUnNOSHZrOG5vYVFuSGJXVGV5OGVSWStaaVpDdTI4WDF6?=
 =?utf-8?B?YmltN2xnZTFOVUhHYmRHR1VFS0tONlRFR0YyUWpDS0w1UTc5R29BcnZSc2to?=
 =?utf-8?B?YnREKzN3Q1cxQWh0a1cxazIvNE5XT09rNHNzSWowV1IwVHF3ejluVDcrdjVR?=
 =?utf-8?B?MndDNEljZUx3R0FDMXpxbjAzdWRJb3l3Q3V0eC9RSFM3QTcxczNMY1JxanRV?=
 =?utf-8?B?bEZneFFaTGNDMjQ2N2crQVlHMmxWUlQ3Q0t0UXVqZ2tWcDdQZm5Zb3JPZlFK?=
 =?utf-8?B?YmFpQmdWNVpaZ1NWL01CV1JvSEdiVEU0c0pJMFRDallaSExBZ2xBLzNCR3lT?=
 =?utf-8?B?MlVoUnM0VmU1WHB1TVFBWVJqWWhZek1SRGM5M0d1MklKS2FyT2IyTUFZcVNB?=
 =?utf-8?B?QkxEWEpEVXB6OVRCZTE0dXlWQ3IrL055dFB2MFY1VDBHdHBDZi9xaDNJMzBi?=
 =?utf-8?B?b0J6c240dWZWcGt1T0ZFcERDc1lvTDhTOTl6dVFmRlJLSlc2d2d6SjN3cEF5?=
 =?utf-8?Q?k8TbnE6grzlvtZJwpRDNUmQtt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8aa5858-a458-4383-df15-08db926f72c1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 09:12:36.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0QFHS1xFsVuzR03QmOxg3+zR4Y+oUwzTLcLacumwj9kzHASgAUXH0mlgN8imBqxm0h5iLb3WPrLOfVj6hwzvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6911

On 01.08.2023 10:50, Oleksii wrote:
> On Mon, 2023-07-31 at 16:07 +0200, Jan Beulich wrote:
>> Everything else looks good to me now, but will of course want a
>> maintainer looking over.
> Would it be better to send a new version now or wait for a response
> from other maintainers?

Hard to tell. Maybe send a new version in the hope that that's what
then can go in.

Jan


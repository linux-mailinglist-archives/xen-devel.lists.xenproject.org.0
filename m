Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0BE48C141
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 10:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256420.440010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7aDZ-0007aJ-Ia; Wed, 12 Jan 2022 09:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256420.440010; Wed, 12 Jan 2022 09:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7aDZ-0007Xn-EJ; Wed, 12 Jan 2022 09:46:57 +0000
Received: by outflank-mailman (input) for mailman id 256420;
 Wed, 12 Jan 2022 09:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7aDX-0007WK-HK
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 09:46:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f28b4d8-738c-11ec-ab6a-e16a03e04220;
 Wed, 12 Jan 2022 10:46:47 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-uF4x8qjdPQubxfecNjzUyg-1; Wed, 12 Jan 2022 10:46:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 09:46:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 09:46:52 +0000
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
X-Inumbo-ID: 8f28b4d8-738c-11ec-ab6a-e16a03e04220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641980814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wRJE8r0ttHr+IZQL1eZS+bKHIuMaBvoceWfiwkU7IQ=;
	b=TxIP7IRJW2gmIs+VU1ezsHqQ/Putw1lbn6Xp7TLMP5gYQfQiON78rf0FG+0LNUCnChVgD1
	UcoO75tAHnf+9QAe/wnbi3Wfg8TOspxMuZXLcGw+UD40L93khkELd3q+s8ZWmxS76VpNwy
	U5E3CZdFyGxGGsMzUna37LKNPqSA8WI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641980814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wRJE8r0ttHr+IZQL1eZS+bKHIuMaBvoceWfiwkU7IQ=;
	b=TxIP7IRJW2gmIs+VU1ezsHqQ/Putw1lbn6Xp7TLMP5gYQfQiON78rf0FG+0LNUCnChVgD1
	UcoO75tAHnf+9QAe/wnbi3Wfg8TOspxMuZXLcGw+UD40L93khkELd3q+s8ZWmxS76VpNwy
	U5E3CZdFyGxGGsMzUna37LKNPqSA8WI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641980814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wRJE8r0ttHr+IZQL1eZS+bKHIuMaBvoceWfiwkU7IQ=;
	b=TxIP7IRJW2gmIs+VU1ezsHqQ/Putw1lbn6Xp7TLMP5gYQfQiON78rf0FG+0LNUCnChVgD1
	UcoO75tAHnf+9QAe/wnbi3Wfg8TOspxMuZXLcGw+UD40L93khkELd3q+s8ZWmxS76VpNwy
	U5E3CZdFyGxGGsMzUna37LKNPqSA8WI=
X-MC-Unique: uF4x8qjdPQubxfecNjzUyg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VC+UsErqswww8UFI/xsebg/n6492voGxq+fXa0HpLmClFFchzJEZN7kMxIQugdBtP9zc6ufvoiLVPtky4ooFAU8rPaFn/6X10FSX+mBht195uljlN55TdHOxhZ/Yc7UV2l4uD+15oH5drKEs7FFKrnUPdXF/QU0BHSwqAG8ffdQcaU3c4QaDzx0RIyDIowxQ9j6m2VjTD5D98RMTtxKiB+AUc5/w4n8yqyHLokZviWRcHiMTSfpeTOML//ERTFItvnk1if0MEF0JE32rGftNr26zcI6b9hKvyK2fOJsiljhiA5z+/6GPLli0/00GJeSvGa3kkoaFv3gCikAbHQ+v6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wRJE8r0ttHr+IZQL1eZS+bKHIuMaBvoceWfiwkU7IQ=;
 b=DZM5vBm5SrLttJZLsgV27lp+Fc5MUXvA2XABSNzKlEONHkzdcYWmMfcDW0idpf6CqMS1kTFmH0jYptazk+k8WDveOLsetGgwM53jRZa3mhcaERppnw+3nJyK4+FUIYQtxQhiT+PvVNYJsmMMtpS3AC5GAYmlGOahsNyGi9J2/wqEJzGJudMiRxPbFIkbooszRXhXJDLmd5EQPalPq+P5b21kb+dTnyFASevgWKjbLKHFZpfO4ghvmBCv93LbMSAvhsBt8d7zQXRRDa+FcUVjbjBEqlrksGLfKlqcNqtZLV1txASpAp5CuoXoqjdI+4OYsOot5Bl6613u+kzX8PnjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a93d423f-ab80-5798-1dbe-df3eee0aa430@suse.com>
Date: Wed, 12 Jan 2022 10:46:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/time: switch platform timer hooks to altcall
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <87997f62-a6e2-1812-ccf5-d7d2e65fd50e@suse.com>
 <30213d2c-37b4-43a1-b0a2-a596988e4c1b@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30213d2c-37b4-43a1-b0a2-a596988e4c1b@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0078.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3522c505-ffd4-4671-b6a3-08d9d5b075e6
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039B147450682F0E3B88682B3529@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ab1Cj+mg3FloXbRmiJWbgvWyKRpkUC2xSZhguU4RCxaae5gzQjjM8H97aFWC7Lmo0Z+BzrUNJb6+jPjqGd7AdlaKu3ANuZPd6JW5v3+VTpYr939VcOGbLgGdo749uao/xK8O7ffedWz4vL9vv2HDcg3Rcol5psuUm9Wk+25mdGcsLfKd8hEVkrcATrnMR9cdAZSsNQRZvosQZESv1qlo/3jb2RFRJmXz96OlDZPSMkUg5uQzH8Hxj00MhPUWkQDsszZy9FE5egO4e9/S6G+ksTg4CMXCbZf4LIwnRrDjZdV1DSLstIGTQz1xmrCcXqeHlGP0wQJNX6EEU6pXNxejkMd7KIXZggR6MtZCUghf/jYXsf8Sb2AYQ1LG/07OsVMdEAugkaF8k6ZyHKgoHBJSDsnzLuAastCnzBnoerFKTIAvBi6BMTL2pqR+A8Z4YvjiaIyG17Xx9a8Zi2DuN8hh+RZD2V4ys1JmW+UKzJP3yW3AVbcnccGMYC3kCd/z5Gj8au3aDl7bbvXBmZS5SnLC9HhHQJ1GddIaPCAV3lc3raa2lK4R0KWKHhjwDiNmXpvJ5/IcArUZxb1oLfhL5hjPt+99Zp0bF1Jjvcd2YDjy2JFB3D8PuCAF40NT6D2Amtc1c1cnmP6Wmtk/59lq2gaOR1yj1ifo9n9dHan+yUWRTUHoeITWI2J6X4TbhRQDIgCoOzIYN011IlKQf3SGzSY6IcwQliOb8eoygshw1cLFpNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(8676002)(5660300002)(8936002)(6666004)(26005)(53546011)(2616005)(36756003)(31686004)(31696002)(83380400001)(86362001)(4326008)(2906002)(186003)(66556008)(6486002)(316002)(54906003)(6512007)(66476007)(6916009)(38100700002)(66946007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEgyMVNIOEVkVC9OSFJqbHgrZWpGK0NubGNlQmp5N044VXpDakZWL3k0Znhq?=
 =?utf-8?B?dE0xM2dIVmNwOVlpMGplaWR4bEFaeE90OTZzNUJUS1Q3TkUxUUtHMkx5K3hC?=
 =?utf-8?B?RUJZa0p1elcxOHE3V21HUTBuakF2SUVYQ3pQeEFhdXlkQkJCelQrUjdGc0Q4?=
 =?utf-8?B?cE96REhsNXZ5dkVBclFZNndrK0RSUFM5RU5FMXc5S3VxSFA2Wmd4YUw4c0py?=
 =?utf-8?B?MjZvdXVseC9Ra2FoSjRvVXM2Q3R0bXUxbzRNa3BYMmpQWTh6cXdUN3I4OTJl?=
 =?utf-8?B?Q0t5c0pFSFlHQUxPS3lZWkkzZ1Nta0x1VFlNaUg1bDdsVVljTDBGUDA0LzlC?=
 =?utf-8?B?WS9XSFFTL2JaZ3c1a292ek5EM3dkaVhZeHdrYzhnWWkra2VmcURhY2lhMHRU?=
 =?utf-8?B?QUZJNXovMTArRFhsTDNnekV6SWxQRk1MemZ4VlY3QUxUSElXVUJCaXdTQVNN?=
 =?utf-8?B?TFRHRklLKzZwR1JNU0N0enlvenlhaHJwaVFmMXNmOVNpRU9rSHhFZFRJNWt5?=
 =?utf-8?B?Rnk3R1dkMWZxYk5NNlk5bzk5YzFZTEpta2RZaDZLSnVyT2Rpd1pidk94Mzd5?=
 =?utf-8?B?bFpBdUhIdEZSUUhtR1VVMVViWXhkSzVoQktZTUdxZnhrekcrV2MyMEZJR0Vq?=
 =?utf-8?B?SmZqK0hqcWw3d0xpU0taK3dtaVpPdU5EdlZuUWhmbVpqc1pBMlAzSWN5TG5W?=
 =?utf-8?B?RURzaGg0K0ZNcDh1ZlJvb2lIUW4ra1dSUmJzUFZrOHV2aEZ2NFd6K2lDanlW?=
 =?utf-8?B?TnZudUVsdGd1eG1QSmw2aXZwTWhsNHp6U3c3VmlvQ3ZaK1laOElOZFhWRndB?=
 =?utf-8?B?OFRTcXg4dDZKYjdaVkRGakl3a2EreldoUndPaW55K0hrT0Q0UFZCT3VsN2dF?=
 =?utf-8?B?b2pUYU9OaGI1Q1pwR1RGbEhZdVF6eE11S1EwTWxmUmlsUVdsMWJWM0IyZ2V2?=
 =?utf-8?B?R0tXSFA4Zm13bk1BVjE1ZU95QzAvTDhFNjF4R2lmb21sRnpVN1RMWk1aYUFv?=
 =?utf-8?B?d080RWFUMEdnWDVwbERvSXNKR3lhV3BjeFNQZXhNWjJGU3BCVnBzZ3pBYXFB?=
 =?utf-8?B?Q3pFK1NnTmtJbzBxVlpCQ0tXd3R2VmJVb1k4UzNyWkVpdVMwMXhlcXdvSjlY?=
 =?utf-8?B?TnBGOFdSWkRVWEVuYzd2MTlxMDJ0dGluOHdnME03R1lnbWk3QnEzL2UzWnBP?=
 =?utf-8?B?VEt3VmJVamhsSFBRaHpQSG8yRWVWM0xuKzJQYmtuN2M2UjU0NGJvdUhoRStN?=
 =?utf-8?B?WW9uZjNxNG4rQjB3dVI2UzhIUTV1V2VIbUxvTjZsTzhRSS90b29ZbS9wZk55?=
 =?utf-8?B?aVZXc1BjUVhRK0ZIMVN2OEFScXdRdlRwK0MzRzd0N1Izcm1GdExmSk1xMDVy?=
 =?utf-8?B?RjVZU0lCdjVCbDRoa3ZRSDIrdjNqTnVUZDFGM0s0K3czM3d4SG1MYWk2TFVP?=
 =?utf-8?B?R1VwUGU2dTlEQjFyUUxKeDVKTllySFMzd2k0R1FsT3FTdUNUMzRScVVJU3JR?=
 =?utf-8?B?ZGNmdVl2RjBTZFRFOXNndkRTNUZNcjFjVk5leE56Wm9PUWRtdlRCN3krVmdz?=
 =?utf-8?B?a3Y4bDZNbUVjK05wMTRXWndKZzh5WWVlWmdXRmpKcFQxSWNZbU1VNC9KQmpP?=
 =?utf-8?B?bGpWZHRFQmdzSFB3NE01NHM5eHRzMzFsY2lEdFhJL0gwR2tuTlR1THFEQkV5?=
 =?utf-8?B?SldOSGs5YklHMzBJcUdzbk0xWnppWExRQ3l4VWlXTjdCancxUmtxdHdNNlp1?=
 =?utf-8?B?ZTlvVW81aXVod0thYnJuNUl2Y3hkWW9GKzE5bSsxQTdsdm5vZFJ3dlNURStl?=
 =?utf-8?B?RU1zM2pNaU1TMGxodUlaS0U5dnFJODBjS0R6MUdTdVRNb1JLanp3MVpmcHRL?=
 =?utf-8?B?c3FUSGJ0VHBoYXJ5S2dPb1hYWWcrd3N6Ymc4T2c0Q3RWdkZkSGdCWGFyK1lT?=
 =?utf-8?B?SVhpQjdqVDBFZXFCeElXSWJDQkV6d0RUQ1NybnBvc1BocGYrbkVOdy9SYUxI?=
 =?utf-8?B?QzFSclZ5MUJlYVhUeFJ1ZUdzTUtyOG01amI1SU5KVEtseUVra1JpYWdXdHBr?=
 =?utf-8?B?a0wyWTM2SHoyYjliL2ZGRWM3WENWV3BEM1VGNlVUWU9tZEd3TTRFeEpkZTYz?=
 =?utf-8?B?K2ZqNHRzVXdsZ2FUekgxYkw1QUFKMjErT3JPVmVHYXVtNC9qZmNhU2o4dFMw?=
 =?utf-8?Q?KyDxCSG/562iAmd+q32Nsbk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3522c505-ffd4-4671-b6a3-08d9d5b075e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 09:46:51.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnoKzUlCb/0Q6qTokLci7NoO/zIoG4v+KJuWGEeBSaC9Ib9W46cm2p/l0uflAKVjWlpjuqyILRZimhP19+kM/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 12.01.2022 10:17, Andrew Cooper wrote:
> On 12/01/2022 08:58, Jan Beulich wrote:
>> Except in the "clocksource=tsc" case we can replace the indirect calls
>> involved in accessing the platform timers by direct ones, as they get
>> established once and never changed.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Sort of RFC, for both the whether and the how aspects.
>>
>> TBD: Overriding X86_FEATURE_ALWAYS is somewhat dangerous; there's only
>>      no issue with e.g. hvm_set_tsc_offset() used later in time.c
>>      because that's an inline function which did already "latch" the
>>      usual value of the macro. But the alternative of introducing an
>>      alternative_call() variant allowing to specify the controlling
>>      feature also doesn't look overly nice to me either. Then again the
>>      .resume hook invocation could be patched unconditionally, as the
>>      TSC clocksource leaves this hook set to NULL.
>>
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -268,8 +268,7 @@ static void init_or_livepatch _apply_alt
>>               * point the branch destination is still NULL, insert "UD2; UD0"
>>               * (for ease of recognition) instead of CALL/JMP.
>>               */
>> -            if ( a->cpuid == X86_FEATURE_ALWAYS &&
>> -                 *(int32_t *)(buf + 1) == -5 &&
>> +            if ( *(int32_t *)(buf + 1) == -5 &&
> 
> I'm afraid that this must not become conditional.
> 
> One of the reasons I was hesitant towards the mechanics of altcall in
> the first place was that it intentionally broke Spectre v2 protections
> by manually writing out a non-retpoline'd indirect call.
> 
> This is made safe in practice because all altcall sites either get
> converted to a direct call, or rewritten to be a UD2.

Oh, sorry, I really should have realized this.

> If you want to make altcalls conversions conditional, then the code gen
> must be rearranged to use INDIRECT_CALL first, but that comes with
> overheads too because then call callsites would load the function
> pointer into a register, just to not use it in the patched case.

I don't view this as desirable.

> I suspect it will be easier to figure out how to make the TSC case also
> invariant after boot.

Since switching to "tsc" happens only after bringing up all CPUs, I don't
see how this could become possible; in particular I don't fancy an
alternatives patching pass with all CPUs online (albeit technically this
could be an option).

The solution (workaround) I can see for now is using

    if ( plt_src.read_counter != read_tsc )
        count = alternative_call(plt_src.read_counter);
    else
        count = rdtsc_ordered();

everywhere. Potentially we'd then want to hide this in a static (inline?)
function.

Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67F456F55
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227892.394278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3cB-0007FI-4P; Fri, 19 Nov 2021 13:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227892.394278; Fri, 19 Nov 2021 13:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3cB-0007Ct-1J; Fri, 19 Nov 2021 13:07:39 +0000
Received: by outflank-mailman (input) for mailman id 227892;
 Fri, 19 Nov 2021 13:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3c9-0007Cn-UA
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:07:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa494113-4939-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 14:07:36 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-ip1LzhOvPYGl2N9yNPImHA-1; Fri, 19 Nov 2021 14:07:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 13:07:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:07:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0061.eurprd06.prod.outlook.com (2603:10a6:206::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 13:07:10 +0000
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
X-Inumbo-ID: aa494113-4939-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637327256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WgGQXF5WMV06cM4EQgjw6fXp7dLn34IUF7aKWx5/8c=;
	b=e+in57OyfatkDePPhE8KbFajFm9JBpa3ecy+ai2ZdEd/AbPzUt0SIGW0LttVjRWv7OfN1s
	Y9ZzyNEwMrCWwafY5+NsxaniH2LZf4MJDMIzwk2QjqPoibjQxfeTwZ/UdJ+hrQLyOM4UKn
	X5b7HDgFFPnaDU3fn9Y2CgmTgKLMYSU=
X-MC-Unique: ip1LzhOvPYGl2N9yNPImHA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVtsO0imUkfgCxL6MUVI778khN4B74LSFfdokOSPqNbHVdWmMYqQl8cE0yDemq+O573OzbtWK5X1OoEHITR3VoynCn/o8LeziDqGv4K4TIp5Fd73Z20jxGOQJfu8RKYa+0E/75NIKTSEt8okw55lTmJ/KZ8Ta+sZJ8lJFEmYnAF5XEd14ej7o7bc/m0m9U9OwvN65/Se9g8NV9+i6lvzF5heDz0Nq4fidKNQeB/ZvEU735pzR4KCc3kPg63WRaY8ohXe95X4zGJB7O73v5jQTiAVU6OrL2Cbfr2OUBETJGYqDlOoj7XXBJzUIsV02sccTtD2nDNW0h5RsBCbQGdYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WgGQXF5WMV06cM4EQgjw6fXp7dLn34IUF7aKWx5/8c=;
 b=dN6HOGgEuodh5aPSzjludm1ybkTViVi5idrl7vqBo+pMfNO866dEp8bPo0XFyar8rZZ7lgOKtETVuMSWZSr5krPdu5M3Ed1l+TxC6mtgUMsg6T0Z+ww31qWkguCjDIA1a9Xz6CABKGJ36tcr6YxQg15ROeJJ7ki4oJfEeScQnfPh5XoYbJ7h7uqMlKCukaHsXc2fFs7gzRxFr5asDRwizwdMNEMe8yQ4lc6vp1n+ykM/a6ww7FmC8CNPO54s99sAMKbKdbTJayBOErJLEKn3sR4lkSkSSmnIycAJTlVsl3TdF4u9KUyfbZLnGSJIATmY9VzOVxP8Drg3xsVi7Ef/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a60f0837-3a01-4d87-7816-ae4a0a6a8413@suse.com>
Date: Fri, 19 Nov 2021 14:06:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
 <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
 <76e929f9-2df1-951f-55bf-58caba80750c@suse.com>
 <ea3e52f3-c844-d2a7-2f45-9d4e1bd04d5a@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ea3e52f3-c844-d2a7-2f45-9d4e1bd04d5a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0061.eurprd06.prod.outlook.com
 (2603:10a6:206::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a3dad30-1919-48c1-3ff0-08d9ab5d800d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597967881442FAAC4D65167B39C9@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uUJTSC/Fq7fr191W8ft3/pg2rcQTdcmvQp7vzyN0f0I/tW4Q20t6EQyEooIoTBOuzzjhAFvdy3+EO3q7tk6404FgKdswi/mgNmz9c05ID090L7UbUTKvevGnPoGPUZUCJQTgI/7ipK5qW0C6v0zoSHbud/1jf8ma7YOVP3JbesnI0DthoWTNe/1+0xL2p86UBehsISYoG76dpZEIlRkMjuiC5t8htZcPpl7n53f8PMcUnw04UQidt/a5GSzO8xdlsZEABpcN29pf3zmLWvJiV8tNRMg1NbAWE6wjJEKk6xeKv13FxYRVtN/DknL5N6q/OGdlwV/faSoLmbtBytYVDeJEffyvukZgZW7VOlsslCvTSqDqzXZgee8yqhQiuz87/V3HXKKu7BOISVqSAmxMP6C0/6kd/Wp32PAL1nFfEVpM/olVq8V0GCeD4MnYHTTjTyuwUdxDHDus+/0jzD0FiePwUsIlTT++/S9PTq4Vd9HMmE2IU5WvdUBIG5kFBEAKRKkMB+lh1ZUVsnhiTvcHOyYLKzp6++iV9M0eYJsVvSF/B86kJ6s/PkHbtGOwfpZzfecuFCO3YeZxpAehOi7clBTP4FBERi9S+so08AH8Zi/8Z1WATTYlfi5jdEvLGwqU18orX/ECIU7W1qXAySP10sv7tvPC8mma4jCTYwuOCyDA9XH7U5rQ3yj5gbmyPE+WoUdANMdrHQC6+192NO849IT4aYCbe12HAntw233NFus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(54906003)(16576012)(8676002)(7416002)(2906002)(6486002)(186003)(316002)(26005)(8936002)(6666004)(53546011)(508600001)(38100700002)(956004)(6916009)(2616005)(31696002)(66476007)(66556008)(86362001)(66946007)(31686004)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlVSdk5zS014K0IvSWJXL1g1SUgrTTJZSjcvcUZwQkpLMmlJNy94ME9zdG9F?=
 =?utf-8?B?dExlZlFMSU5ZMWlsRko0YzlnZmRZV2RneTAwSC9RbW9Wak1OK1ZLQkJ0UmFm?=
 =?utf-8?B?eXBHWWVDWWlVT25JRHRFVGY2OEJjUWYzSHV0d0pTbVZvajRhWEdRRUp3UWxr?=
 =?utf-8?B?N1Z5QnI0OUUwWExPd3VUWjRaUmpnUWd4SGhSZnEyekRmOGpKRWxxLzBVcnhl?=
 =?utf-8?B?cGlVN0VJc3QrY0dMaUdHZm91K3RyT2VPUDQ2L2Q3QitpVCtZTnVLaXpuVEZl?=
 =?utf-8?B?QVdsdGhmM0lTSFd3RGRMVmxyejRpRjQvbEI2elZWUjByTUNHUGVsa2VmNU5u?=
 =?utf-8?B?ZTBpNncybVIrS05EdVpBNG81cXB5Q3hRV2lXdzEzT0I1Zmh4L1BNOStLQ083?=
 =?utf-8?B?SDVIZUh6ZWxSQm1RMDhnQlhQdlhRamhnUG8wekJqYnVGTWxsUldKR3ZrRVpu?=
 =?utf-8?B?VzFkdXI2M3RvNm0rbDNCSGsxN3ZmRGdQb1cyVlpINzg4UE5HQjgwOURwcFkw?=
 =?utf-8?B?WGJ5TFJHRWxWUlNSL3hvSFpSMlo0K3RadEJoZ1RabjJvZHJYMnNZeUJyV1o0?=
 =?utf-8?B?Y3ZkSkE3YjBVaW5OK2xuaVFHdDl0N1h4MUd6SUNaNmFtK3VHdkZ2WVVMY2Zx?=
 =?utf-8?B?QXdDZ2hMUUJlR2h3UWZZK082MXhTVnRhWTFHOFRObUFIcjVLWU5xeHVxbUJF?=
 =?utf-8?B?cTBMSGZTNTJkTXhabGNZOHF6TU02Q044NWlxWGwyZ1RIb0VhMFRzS29pcU1J?=
 =?utf-8?B?Y2o4TFhDTjUwdWh0cmsrbEJlUkJWZG1FV05CY1laSEM0VkQyVjNxWTBMa3ll?=
 =?utf-8?B?K05adUJEZmcvR2tCUERia2M2TXF4N0h1M2pXck1lT2RaWGRnZnpGRnRtdTV1?=
 =?utf-8?B?dDFKVFljK1JFOGRCU2R5TGV3T2JCMktwczNxeDc3Q00zTUpFWGhGcTRnVzk2?=
 =?utf-8?B?SjByMFYyZDU4dFp4QTVyajduQ3VQbTU2blpZOXZUT0tFYUdKTVYrdU83dk5a?=
 =?utf-8?B?SFFnZVg0d293UGRsMDNDQmh0SlpnVkNqZzV1ZSswVEtvQnZybi9yaFJha1Rm?=
 =?utf-8?B?djFONUVsbDQ0TFNIeStoVmcyTUx0Mm9FWVFRUGY1VmJzcmdLY1VUVFphVDEw?=
 =?utf-8?B?dk10eVBPcXJLejFKZ2p1aklrY2R1VEp5dzNnak5WNDVJN3VVaUN4dlYxZUhL?=
 =?utf-8?B?dlIrWmF1S1V4NU5nYzZ1TGVkemZ6WTZsUHp1VlZiMXN4K0dOSnRDVzdPdm94?=
 =?utf-8?B?c09GckdJY2FYRjB6TkgwN2l6NXdtV21BemN5b2NTMHhCcG1WTHNtV055dE1F?=
 =?utf-8?B?S2ZQK3llbWd1ZEZ5QXFVSU5TNVArUXEvQkNBUGkyV1lVdEFiWjdwUmN6OHdV?=
 =?utf-8?B?aW1DQjRrUGxLYW9vNlJ5TE1PY0VOem5JR1NnTWRHRWs0OU03SUhua0cvVGM1?=
 =?utf-8?B?aDZHMVE5cVFOZ3RWRWJ1MW0vVTMzNHVEa09oRDBQYjV5NkNwdExLdEo5dzlF?=
 =?utf-8?B?OGVPSW4vSExsOUt2Y2UydVlzR0RYQkFxclNhdmY3eTBITUpSUWFPZytqbnVW?=
 =?utf-8?B?bUJ4R0lKdkJ6UXhQaEI5TGVsUm9VN25NVGNqMTlLam1MaTErbnVlQ21qM0s2?=
 =?utf-8?B?dnlOVnQ2aFBnYitKSXNiOXBNQ1AxOUR6WlQraWR4bVpSTExlZStFUkxjMnk4?=
 =?utf-8?B?SUxrazdVak1EWjY0TVFWUi9GeVd4c3cwd3N2NTJvN3lyV1FCanVGS1YvajZy?=
 =?utf-8?B?VjVtaEJYSXFyZnpOQWpEL0MzUDFvc1JXMi8yYjBIOTlYcWhiQVFGQUcwanFj?=
 =?utf-8?B?ekJFSGtDRjZtc2FRL1hsditVNU9Ba0pTbFk0WC9wajR0emJ1eWlOTlhtQncv?=
 =?utf-8?B?L3VOREx0OG5HUmVTQ1d1dVRleDZLalVBaEh4aGhWRTl3Q3ZqNFZ1UGlkZC9z?=
 =?utf-8?B?NzBsaGNKWUJYM09Rb242QVlNbkNucVhDYTRFclVKWFVXMlRqSDRaNm1pYzd1?=
 =?utf-8?B?VHJjaVVQYWdEK3ZzSjVJSkswUW8vMnRhK1FkRHI4bURJc0RhbjM4KzFtNm1S?=
 =?utf-8?B?QjExNGgyQkJGWEVuTk9HZVBqQUh0MWs3aEJRcmg5V01ia0lPcEV6citob21V?=
 =?utf-8?B?bm50M1ppRnhtZWljaTRqSldvdGdTWDVHSGxMc0tuL3NQSjJRbmg1S2ZmWFFM?=
 =?utf-8?Q?+q4gGqNgO6NnEjkb3vZk4j4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3dad30-1919-48c1-3ff0-08d9ab5d800d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:07:11.9485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHAwCYgO/kmq01cqX4q4s1EGhbatqtzZqDF9SUMBX14tSD+bJPxeBmqDT5oXBcMp1qde/8rxglynShttQZ77kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 19.11.2021 13:50, Oleksandr Andrushchenko wrote:
> On 19.11.21 14:45, Jan Beulich wrote:
>> On 19.11.2021 13:13, Oleksandr Andrushchenko wrote:
>>> On 19.11.21 14:05, Jan Beulich wrote:
>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> Instead of handling a single range set, that contains all the memory
>>>>> regions of all the BARs and ROM, have them per BAR.
>>>> Iirc Roger did indicate agreement with the spitting. May I nevertheless
>>>> ask that for posterity you say a word here about the overhead, to make
>>>> clear this was a conscious decision?
>>> Sure, but could you please help me with that sentence to please your
>>> eye? I mean that it was you seeing the overhead while I was not as
>>> to implement the similar functionality as range sets do I still think we'll
>>> duplicate range sets at the end of the day.
>> "Note that rangesets were chosen here despite there being only up to
>> <N> separate ranges in each set (typically just 1)." Albeit that's
>> then still lacking a justification for the choice. Ease of
>> implementation?
> I guess yes. I'll put:
> 
> "Note that rangesets were chosen here despite there being only up to
> <N> separate ranges in each set (typically just 1). But rangeset per BAR
> was chosen for the ease of implementation and existing code re-usability."

FTAOD please don't forget to replace the <N> - I wasn't sure if it would
be 2 or 3. Also (nit) I don't think starting the 2nd sentence with "But
..." fits with the 1st sentence.

Jan



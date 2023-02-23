Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2D36A0A7A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500378.771725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBbP-00021O-KA; Thu, 23 Feb 2023 13:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500378.771725; Thu, 23 Feb 2023 13:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBbP-0001yP-HQ; Thu, 23 Feb 2023 13:25:39 +0000
Received: by outflank-mailman (input) for mailman id 500378;
 Thu, 23 Feb 2023 13:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVBbO-0001yJ-Sm
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:25:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eda037a-b37d-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 14:25:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7794.eurprd04.prod.outlook.com (2603:10a6:20b:247::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 13:25:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 13:25:35 +0000
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
X-Inumbo-ID: 8eda037a-b37d-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgD2YXWoZ7faIVZIgu0cJlcvaDsMGy6HSdj+F9ARlSoK0bv88Ygh4apzDbiORfu8Lss3IIj2L71KdKeH6oiBXjkAEyNXzfiUYJMvP/XgzgGnB3epznOdzXEzsqZvfhM6h1aIlJ8+hM75ep7tzg+qkv+qqHuIrrtDCJQ4wfsmKk1ZLSoN66UwcYcY2n4EKx1Oq0NrHteWuEGoF8XaS5tiNfSRHrQ9j1Skm7kJCpDzMF1s6U54aL2thiD3yXkSRi8saWo8XvoE6gYqCp/83E9mjZEM5tdvTAoaARDu6PQkpFZv/xNaNG9+4WOhrrcAU4e/+nSyL6bIoUwOFp/rHSNb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeCDSOHsY27B4uBG9IQJ1YATBHPkM0LrgQthGtNA4Bs=;
 b=OIHkx07Z1/ErW7AwqcbWrJqZsERjNpgfEpf528zZvu38s4Yfiv7qFjI+P9c0Dy0c9PBgw0Zv9rUlLbLGqVmaFe2PV6RYoVcN1C8EI3V8suzNP2M9Gjr1PdewllDiDQzISWo/QZQoI54is2Jm7PMS57/LQGPl9GCJ+rN9EuoR8pY+Fd5jOBB3D5Ogrm+V5irtxCAvxIBGYv4bmgDTvM5+JPSg6vPpuTsGxCX4VwhVfRdfOcnX4dEUm5y4TlXA7Cm8yHA4vvRZ+dDI4wB0aWQ0sHUOejlvEcLmxmsXJiewuIYlN+QLtFsq845SwCj8byvrJA6G8DDepMpuT9pVFPnhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeCDSOHsY27B4uBG9IQJ1YATBHPkM0LrgQthGtNA4Bs=;
 b=PhNRepvpH9FfNyLpxx5zICc+Ps1fU/7ITWeW7D92EGKb77tZ9UJ0oe2q7tmSizN3NEDS+nLN0lbFshFMLbcLZPBfdc1FwEJ3001rWv+gaWL83iZ1X4nwLWYdbY863emTzVfChwMzRsVx2cqESEEhdntGSaulFHp5ydnIHORyKGpXly9LTF/XaVuoh0Ct/qy5sR1HhQHHCoN2fjSZC/vxfuDG9a1lbg00Jrs0T45bNAY3rYbZU+6dE4YprbThUWadOoGalwNteImQPDmKbIV/P3pn/Q8iFoS39LQSUpKsS/dEslhQUp5nC7f3lZCcMgjRO5ZFZnS6lVmlaDuRY1/z9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <567cd948-3968-88ff-d4ed-6d5fb65a46dd@suse.com>
Date: Thu, 23 Feb 2023 14:25:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
 <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
 <214973b0-5fe7-9208-2cfc-dd2884583157@suse.com>
 <9d2bbf1821459cbc5c294261a34728cd8aaf99c1.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9d2bbf1821459cbc5c294261a34728cd8aaf99c1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: e6caecfc-ec82-4787-833f-08db15a171df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tQkwAjICwTSi6bejCFptLG/GK5BG6vaMwU+y7pH8uq67Bm2Lq63e3EVxnlxYfX4NkJc18xdgW3iJLPnPL50cIutUQ9FfqY5641KOirrKgTA1gdKMleupx6BcmafFmxNmbTYi4BSd9Mds8jCh1Ug83uG+FHvClCywIoX6tZZGfTawhS3icTf1R8U1x2MX3p57ksuniA5hHTq/UDaVU1OQdpvRt5RsbKDYYgu9kLTmcyf+PnKhMPNNaghV8PYW5LjYV0T/CtuTnMCY0hbl2+aPM/8iQ4CWa9p2pDpI//dtRp0NITexShFcsBgYKkEfpJtL8J4puOInApWjma8+zGD3IXYYlDG/NdeWO+POlCBoGIo5m35HFatm1ICjUtVdZe8bxKPOX4xxQ2lKFukn/YgyuY3y7WbxopdYtxul83o89dBqe8qckl45EEJ0xC+fcIM9qxOu87kAIrETrKSxYUvNfm2TZSA7YBZuZ5vZkSObo/TwXKPJUTtvS4nfgl63aj2LsNnZ5iup61weMIQL/PpZMLJANCECqG3f2ho7Xjb1LcQdcK//XLCcqrAcB8teGGAqU58t6yJMs9moLJsluREgg6cx2Cbn44YXcgxRq1dDe1y3C1y5ssCsdbekH7NjGjGXiw44hvI6HC5MzBdWm/7td1s/yhlilY/aESTCbHToV9pDhale4F97oGEmna/l43sRrg8/U85PrvVG12UHtVPOilRNi34pzYH+5Ak40VNr5FwEQtxO/V1WT/0jHreDNb/W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199018)(316002)(54906003)(478600001)(38100700002)(36756003)(2906002)(86362001)(31696002)(66556008)(66946007)(66476007)(8676002)(6916009)(4326008)(8936002)(41300700001)(5660300002)(2616005)(6486002)(186003)(26005)(31686004)(6506007)(53546011)(6512007)(6666004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGZEWEhVblk5bXkvQUdwSmoxYTdmbnJFRlQvb2gyUnk4eWNZb0JJTnd3cUI1?=
 =?utf-8?B?OGk5djVkUy90SzdmeEsrTEU0Ulg4VVF6RWpWbFpTeUZmUUZtcDZJMW15Smpj?=
 =?utf-8?B?MEl1Q2FsUTFteVZ6ZnF3WldKeFBLa05XeWFpVFBRdmszQ3Z5bWczK1JpTzMx?=
 =?utf-8?B?alVkc2QvTnl1V0FNcCtVQTgyYjllNHFjWGlNMVFnK28vRHRxVWVIY2JCeElr?=
 =?utf-8?B?VVgwWUxnby9SSEZzalhPbVJJVFpyVDdYaEFqWkcxeGNHeVpqOVRVNE1VVmxO?=
 =?utf-8?B?WDQwaXpraG12WGdlcFRXWEd3QWVXZkcyUno2V0dEMEtxYVFuSmZHMXBGQjBv?=
 =?utf-8?B?MWo5WEJxdGRPNDlRNGVNVGVJVmk0eHhMZ2xidGxDU1hLNEtxM3krQ3h0T3dj?=
 =?utf-8?B?OXE3WUFpMy91ZE0ySzN5dEQ3MTZCRHZ3L2hrbUhNTHBpNmdobTNXemtWeHg3?=
 =?utf-8?B?dmw0SzZaZlc5U0lqNlROUWFYN3drQlY5N2dQbE5qSU56eS9WT1FrdGQwYlJO?=
 =?utf-8?B?dFdubTMvUkptUk02bmNnc1BOcE5XY051OVFDSnUxTE1adlpCWE1XM1h0anpz?=
 =?utf-8?B?TGN2SHQ0RSs1emRGdlpicGpZLzNDeFBCbGEyeWVwenNPY0tmdlBjVitaZHR3?=
 =?utf-8?B?ektQZDIyVHpGbXFQY0N0QktpWVFNbUdwUUREdWNJUFlmZDE0cTlTbjlHYWlq?=
 =?utf-8?B?aHRaOFI5UUd3c3N1NXZkTlJ3alVEVUVrd00rckovSjkxZ0NRNmYwRFVoVitj?=
 =?utf-8?B?aXVNbTB2MGtOVzRUSnZlODBrN3RTWmNUdVgzVG9pQ2thZWdkMjQ0NGlONkdB?=
 =?utf-8?B?NEtHSFRYcjA5OXg3c1hqSjdxanpqY3hZdGdWUTQvUnhDYytGUWVLSEhwb3l6?=
 =?utf-8?B?dm9PN0RmakZoT2VBQ1puUkRtOHZYQk0yTWNtS3VMVmJsWDZNMGd0VGcxVCs3?=
 =?utf-8?B?VnBMRExpWmpseTdkZkdPR2dNSHliNllyeHR0dkd3KzFsUWRubEt2R1plSTBh?=
 =?utf-8?B?U0tOSHhYU3Nrd1R2UmRlMURoUEVrRWJzdkYxamZkVGY2TnBoS2hBeDYwTUZQ?=
 =?utf-8?B?NVVXTk8zTUhMbmxLVmxtNVk3QVZHem5HeTVEbUdoSzJ4YlAvSFZ4MDJ6NC9i?=
 =?utf-8?B?SEs2dWo1VDUrTVZNUngzclAzTnU0T05MZkxaT0pCeTFBN3kwTUZvMU9ib3I2?=
 =?utf-8?B?QUkzYzJlMnFNUEVyOXBDcjcwMTU1bzUrQUFpWEg3cmVDM2p3T29BTndWUXZk?=
 =?utf-8?B?TnJsaFBtbFl1aTZLWVE5UEVtNVp1S2RuZ1JOaG1UcWEvOXhKY2xhRWNrOVRa?=
 =?utf-8?B?MVZkSS9jRDlxTG0zVHduS0lTUDRiUVcvMlIxbC9jK1lhS1NZcmhHYlliNTdT?=
 =?utf-8?B?b2g4anpHTi9zeVVXemdXWXU3bVJIR09OcWg1alZPcU5NUHVYS1I5VWdGVXFq?=
 =?utf-8?B?MEd2MkVNWFFWMC9xNDBhQ09UdGJGbFVMMXFzWXpkRmxiakNvVWdNaHZzbTFo?=
 =?utf-8?B?dFV0QUpnUWpXUjdrZUl6ejJqelNiNU1XdnhyQVBNYUw1RFhYMXIwQVpQM29Q?=
 =?utf-8?B?ZUtZR21HVUFGWFRxYkk4MUp0a0hnQUxXWHpSZFRDQ01pNmVHb2N6aXlvWGV6?=
 =?utf-8?B?NWVnRmxhcGM3WWpBZkd5VUJjSkl1QTFJRHZ1OFE1a2xuU3crNW0wNW5qOEZL?=
 =?utf-8?B?S09odVR4cWx5VkFldjN2RHh6Y0lmR0p5L2pJVElMUmV2R0lLVFJUOU5uU3FQ?=
 =?utf-8?B?UWdMQ1A5bnpSMGpkUThjb3lubGlOeUdTakpDZWNWYjQxUlFGL3E4VjAxK21Q?=
 =?utf-8?B?WXdCL08vc2RXRUFOUEhDa2VCN0ZYWEJPT0JEQVJvb0ZHbnQ2SHRIYTk5N3ZF?=
 =?utf-8?B?UGhnL0pKRFU4U0J1K3NDNDJPL3Babk5kM0dRb1d4SVpHNkFxVEluU09TTzNt?=
 =?utf-8?B?NFEvL3ZJSjFYT21GbzNKV0M5WGpLWmxDMVdlWDB2SHpCdHBXcEd1REV3OXQ0?=
 =?utf-8?B?aldJS0NsWjBrR1R2RmlxNExQWHBqN2hoYW5VZWl1OFc5YkxrTHowKzlZUXFt?=
 =?utf-8?B?OHdSakZoMTZsZjZPdmtMNG5XaHA4Y3lKNjYvWjBrL2NXTkx4eUxvczZvSkxy?=
 =?utf-8?Q?ngN2J6SPEfN/wOJsmeHZdyFzQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6caecfc-ec82-4787-833f-08db15a171df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 13:25:34.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuzeVpjgQUid1OKARGQDFzd8hdx42NtkQd9xpMw3OtFNC7gCgP0ayAP2HC6jSVGbzf83zNSeWBWVQgb1WsJcyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7794

On 23.02.2023 14:16, Oleksii wrote:
>>
>>> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs-
>>>> BUG_FN_REG;
>>
>> ... this, wouldn't it be better (and independent of the specific
>> arch) if
>> you checked for BUG_FN_REG being defined?
>>
>> Another (#ifdef-free) variant would be to have bug_ptr() take a 2nd
>> argument
>> and then uniformly use ...
>>
>>> +#else
>>> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
>>
>> ... this, slightly altered to
>>
>>         void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug,
>> regs);
> I think that I will go with BUG_FN_REG instead of changing bug_ptr()'s
> arguments as bug_ptr() is used below to get file name so it won't be
> clear what bug_ptr() should return either an address of file name or
> regs->BUG_FN_REG.

Oh, indeed - I'm sorry that I didn't pay attention to ...

>>> +#endif
>>> +
>>> +        fn(regs);
>>> +        return 0;
>>> +    }
>>> +
>>> +    /* WARN, BUG or ASSERT: decode the filename pointer and line
>>> number. */
>>> +    filename = bug_ptr(bug);
>>> +    if ( !is_kernel(filename) && !is_patch(filename) )

... this 2nd use.

Jan


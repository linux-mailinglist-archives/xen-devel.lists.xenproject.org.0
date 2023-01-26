Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51D67C568
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 09:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484806.751618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxDB-000877-6S; Thu, 26 Jan 2023 08:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484806.751618; Thu, 26 Jan 2023 08:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxDB-00083m-3a; Thu, 26 Jan 2023 08:02:21 +0000
Received: by outflank-mailman (input) for mailman id 484806;
 Thu, 26 Jan 2023 08:02:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKxD8-00083g-Ud
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 08:02:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c02977f2-9d4f-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 09:02:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6923.eurprd04.prod.outlook.com (2603:10a6:10:114::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 08:02:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 08:02:15 +0000
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
X-Inumbo-ID: c02977f2-9d4f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtNvsD/z76VgcckoTJnfYWAECdfk7jyxaTyCUmgOc9eXM9pr1u6LWBbZcQ03f6+L7115/zaMPWmFkk7rTtjqFm+QRQPjM4Alq+uR2kSKkTM5qzJ/API/VdvzuvQX6Jn8pJBst4GL98nHBq6G5O77rsScCHCRog7f4bbMJMUYsq3VG3KpsfCRXyOs3MLmk6DsIYmoYOx3rJ+7lB/y5dbb+ve09Xt+DcZ5lTv5JA4K6KccgkvMmTrvSyKeFW7QAXS9Wmr22JoSv3aAwkprUOr2l/GItlig/UaNLKr2dMFrdfp959uKKfhliJNmCT8ZFadt4VyffkYi/WBuv09hLwdyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meOV+7T8ZQZ/6PKje+wXQ6cgl9ZXye4EOfKH5lcTyQ4=;
 b=OkctuZUuewoh6/Aq01ALyVPv64iNHCMTCD0jPuHpjdnMcd09k8bIIwM7kZlah1B97n8EbPcyYMzeZQWooMb2iHVAJvXrWlXqt2OCgxhtyi7EXBt7V5V4YhRx5Vx+8Txl+LgXY8CmJtVNrvmLNePkmFZwfj043n3opAsZcCu7ETVsYlBNXoi6aw3PSFP5FKlX//mAwLc3ytRDsckFrgXIlEUFobunFsImWjOXG18vpDTFIT+02CSIzDwLu1q5yIbsiK9PCBxD2vRku2g3yF4UNT/yyZmJavt8o6lZa26rmbKn8S1PPedzC2fwfTSUYLddgtx4dT9JJXHfQQO5y5s7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meOV+7T8ZQZ/6PKje+wXQ6cgl9ZXye4EOfKH5lcTyQ4=;
 b=vAfQ411kT6coy+8Ne2NPwDoucLwViuSLXiZF4NFFlHKrh3zMmYz2DHTqfSt7psgMN7ntKQXtVIsu8TWB3XEGMUWebNr/DpxEa0XxzXKICcFSe58FPySfMHYa28JqLI8jecYcHVQsU0v0zDf4oTrqLGNu32WrCdpRRyhEkFjhIzTDZFhiAVBI3Hv2KUH5ccPbctBkDWA7ta12a5bZhIVHSsuM5dKKdOo1SwIUYO5j+d4NosALD5BNh3TbZ/FxGo92UBqvFmJdJSzD5ja5ACTQ51iQTBG91CHfsSpP6F1G649rH+rTPWi6vbTFmbBSsUKE+dyYXlLFuqL3RCYH0GV22Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa38f305-df29-4178-2279-17a084fdf2cd@suse.com>
Date: Thu, 26 Jan 2023 09:02:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <8ee98cc0-21d3-100a-ffcc-37cd466e7761@suse.com>
 <718f6fd0-cb96-6f72-87ff-7382582d89f9@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <718f6fd0-cb96-6f72-87ff-7382582d89f9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b44c0fb-2359-49cb-3d80-08daff73a342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OfxGu+uZkxMzJ15T+g9EM2fPwgeNlSafQyOEYOcjbuDRGu/nAK4nF9UOsoP1+gHhStPXjdwiQoq267HmGTVEB5xXEUcWidxXTHy+lZ6IjR2ioJPvj3XErxv1TMxRhcLXR6yHL3kYRn7MyU34Io/0ZeXgjii2ZkDerKF0rv+EUCUG4BmxFKOpfRJAEjLpdMt1/pa5AJnRSo0C6pZYi8NW2uxyY+0GeeWoRv4Fn+8Fcc55mrtuOVhBRnCAWKdVENpMsoQfykAedt3YsaNfaDgPtu3VyaWbfGuk72IykeijIHSdxO4XIfa9s5TPZaI6SEE5aeD79xYOi6bZCDdMxG1Tf+39rWRCMZO5/L+flr7t+iw14yq/vrdg9VcUO7B63cRZAPFdN1QU4u2ps990nZBKHK6o/iWgBxEy6CS4wMN4Dg6FcRLALJv9eP2OODXyfDD63Frj3+OYV+SwbgvFisCJA2nnb0mXzOGEZUDyfrIokfykjQQUVxTmU2JmoVmupjC/iY8yS7ZtlK11OVffBdMiqqwY9pFn6vIoT9gu1KX3JVVmahvmF0apaUG09JXIEqWIRP0ZUlzEfgC8+CEweaHvt6qq/Ya1pQ7cmENtYP9aYJIJrZtoSMb3C5XkPiD+Gd6xpgwXBKaCiyKkAMji9jNqkZFrkJXJ72y4LpdZBMOFCaXAmFUL0qObfIA3bRW6R3oHeXh1TxgK8FspZ5W4iQls8CvFLnSNj0S05XCOy06gEBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199018)(38100700002)(86362001)(31696002)(36756003)(316002)(54906003)(478600001)(2906002)(41300700001)(8676002)(31686004)(66476007)(66556008)(4326008)(6916009)(66946007)(5660300002)(8936002)(26005)(6512007)(53546011)(6486002)(186003)(2616005)(83380400001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkRqcWJ4ZUdDaWpOWk1ySWFjTWhiUVpkVksvK1U1bGFPcWY3Z3NadEUrUDhy?=
 =?utf-8?B?TnRkOFJJOXRsYnoyaTFhVVFHdkQ3MVQyNGJKSFlxS0ZZVzVmK3BiaXg3VzlC?=
 =?utf-8?B?bnRoMTJQNVdLRHh2THA2Y29uWTZPbXRLTmVNQlE0T3IyWHRaMkMzUlVDekNE?=
 =?utf-8?B?Q1NjRWx1UjFkSXRzZ0QzaTlaOGpBdG9qUEdWSWlWNG1PcnpUallmRFZWanBS?=
 =?utf-8?B?eENmOUdEV25sZktGZnJ4K2ZZWnVwYjNyNnVCWm5JWldQcm5Ydm9scXhDd1Nx?=
 =?utf-8?B?YkdtQXZpUVN0Vjlpd1VYc0JtZlhCbVBsLzJyd0ZibDF5T2MyZEt3a0FxbU1N?=
 =?utf-8?B?UXFVeVFLdGVLYlAvSm1jSHFLc3h3elBTMUNmbFZ5ZldCSXFXeVh0Sktpb3pC?=
 =?utf-8?B?bXJENjR1RlB5UVVoalBpMGMvWGdOeEhYcFFmZ1hNdWFXdWxiWmFxNkZqN1FI?=
 =?utf-8?B?SnhHT2R2VnZidVNMSDZITkpIV0g4STFocnpVaStIeC9Rd1hBaVd5VlJUNkRV?=
 =?utf-8?B?Wmc1d0lWSVoybG1ZT1BiTGtkZVRrL1RTNGVEeHErdUgySUIxUi9ycXBiTTBX?=
 =?utf-8?B?bzNSSlIyWmFRMkxGRkxGK2ZYWlpiVjdidy80LzgwS3dPdkI2NXpiWmhydVdJ?=
 =?utf-8?B?a2l5T0pUNFg3V2lWdm5rZDlXTFBYWmVlVU1ZMVhpMHF2QUduZDQ3ZG5LVVJ3?=
 =?utf-8?B?VXU0bWNvQWVGLy95MmJlZXRDZTZzb2JZbWVHbnk5L2dQa3hBVGVPQ0JhTXlV?=
 =?utf-8?B?ZFZaUk5HandIV0N5RXkyLzQwWnE1ZTlMZ0dLUVFPbS9SN08yQzBVYWpBd2ZP?=
 =?utf-8?B?d0xBSHFMTVZHT1ZCUE1zSUQvKzVSWmN6bWNFYmdVbStRMkNXWTduUE9CalMx?=
 =?utf-8?B?K1laSDV2dHhTQ3V2V1FVdlhQM2pDSlhKbTcxeTB4dGtmMjRzcnZVUS9vRTYr?=
 =?utf-8?B?Tkg2eU1XSnc1N2NXSmRZSVpzOWo2cmV3MWVZZTRFOGlBUStvVXltV2V0UFl1?=
 =?utf-8?B?clprcTgrRHo5K0JvM3B6YVFMek1GaWFUamRWQmxLVnQxUU9uZFA3b2hNTkFy?=
 =?utf-8?B?Vmo5bUZQME9YWFVpcHQ5UWdCWitaNGlPVFIrMWgyd2dqclVKcS9tVldWWG9Q?=
 =?utf-8?B?T3ZCZzBNT2pLSDBzR0hrS2NPZ1ViOWJRbWlUWkVKd2NPYnFTNG1UOFlBVCtH?=
 =?utf-8?B?UkY4YnQyM3BFc3RqUC83MktwNTEvbGd2eTMrRkU5T0VhbmxObUZVVHhLN0Vm?=
 =?utf-8?B?aHN6SnpjTWVka3NySkdiaXRDT0MxS1Z0TWdRMzArcmNSRXZtVmhjaHZ3eEZ5?=
 =?utf-8?B?K21YSVRCZS9GSlpGaFlWWTlSZk5rYUJIdGlzWGJ0MjIwZExDYlVHdmFrbCsv?=
 =?utf-8?B?S0ErTU1JVi80S0FpWUNmQXF1Vkw1NXRaQ0RSbURBaFY3aGFmeHV5bkZpVXlm?=
 =?utf-8?B?SVlJNVJBaHF0N3RsVlhGY2I1WmpSUzZIRWV0NVB0dDAwWCt4ZzFqZGQvUUUw?=
 =?utf-8?B?clhsa0tvbUx2Q3laL2tWb3lmMnpvUmJ4dm9OeExEUXlrb0RqL0FiUE1BckY3?=
 =?utf-8?B?VjA3TkllSGpjZjZXRlVTT2t2RnJXVkllMFFpdTdCRHYzR1V1WlNhSWJDNW9O?=
 =?utf-8?B?VXdLbWoxbE01S0JqWHdnVVJqUnpWaEZCVHRCRlFabmxJVFgydnFXMEUxN3RI?=
 =?utf-8?B?eXhXQ3Bzdm05ZmtSUTBhSzB3VTV4bG90bVJrWGVwbmdoV0lZTWhscG1GZkpt?=
 =?utf-8?B?SkJUeDB3R1NVMDM1WWVZV05oQ1YrSjZPMkRRbVk0ekx1bG54cGpvTG04Y2Jq?=
 =?utf-8?B?REd1T3NFemUwQ0IxN243WUI2alo3c1gyQWlYTWs0QXE2TG1aM09zdzZOb1B3?=
 =?utf-8?B?UGxYYWd1N2U0ZFVtQXRKbFhTeWM2UWMxWEo1LzlNYW9OazY3OGRvZlc4QVEv?=
 =?utf-8?B?S2dBSkFkUFFhMERhbUJESDFjeHdHSHRXK2w0WXl4YkJjcit0VDJuM3RkVVFk?=
 =?utf-8?B?a0ozUWYzdEpNVXNNT0dpOXRqckRQR0xhN0lQTFg0ekpaczRQT0YxMFc2bHRZ?=
 =?utf-8?B?bEJreDNiN1dWRGx2ekNVNG00WHhkOTFxdHJMM0dsZXJUKzlObDVJa2FQNjVU?=
 =?utf-8?Q?3o8t9eFfyOU4XJLhT3Owx/IRH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b44c0fb-2359-49cb-3d80-08daff73a342
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 08:02:15.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqr982xKoqse3k5VxgulOV0XWo91Pz97MS8sTIu3Yzx1sjktekmLQUBeuoOoChPBZmQrJordp+5fArIe8VCP8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6923

On 25.01.2023 22:10, Andrew Cooper wrote:
> On 25/01/2023 3:25 pm, Jan Beulich wrote:
>> In order to be able to defer the context switch IBPB to the last
>> possible point, add logic to the exit-to-guest paths to issue the
>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
>> workaround. Since alternatives, for now at least, can't nest, emit JMP
>> to skip past both constructs where both are needed. This may be more
>> efficient anyway, as the sequence of NOPs is pretty long.
> 
> It is very uarch specific as to when a jump is less overhead than a line
> of nops.
> 
> In all CPUs liable to be running Xen, even unconditional jumps take up
> branch prediction resource, because all branch prediction is pre-decode
> these days, so branch locations/types/destinations all need deriving
> from %rip and "history" alone.
> 
> So whether a branch or a line of nops is better is a tradeoff between
> how much competition there is for branch prediction resource, and how
> efficiently the CPU can brute-force its way through a long line of nops.
> 
> But a very interesting datapoint.  It turns out that AMD Zen4 CPUs
> macrofuse adjacent nops, including longnops, because it reduces the
> amount of execute/retire resources required.  And a lot of
> kernel/hypervisor fastpaths have a lot of nops these days.
> 
> 
> For us, the "can't nest" is singularly more important than any worry
> about uarch behaviour.  We've frankly got much lower hanging fruit than
> worring about one branch vs a few nops.
> 
>> LFENCEs are omitted - for HVM a VM entry is immanent, which already
>> elsewhere we deem sufficiently serializing an event. For 32-bit PV
>> we're going through IRET, which ought to be good enough as well. While
>> 64-bit PV may use SYSRET, there are several more conditional branches
>> there which are all unprotected.
> 
> Privilege changes are serialsing-ish, and this behaviour has been
> guaranteed moving forwards, although not documented coherently.
> 
> CPL (well - privilege, which includes SMM, root/non-root, etc) is not
> written speculatively.  So any logic which needs to modify privilege has
> to block until it is known to be an architectural execution path.
> 
> This gets us "lfence-like" or "dispatch serialising" behaviour, which is
> also the reason why INT3 is our go-to speculation halting instruction. 
> Microcode has to be entirely certain we are going to deliver an
> interrupt/exception/etc before it can start reading the IDT/etc.
> 
> Either way, we've been promised that all instructions like IRET,
> SYS{CALL,RET,ENTER,EXIT}, VM{RUN,LAUNCH,RESUME} (and ERET{U,S} in the
> future FRED world) do, and shall continue to not execute speculatively.
> 
> Which in practice means we don't need to worry about Spectre-v1 attack
> against codepaths which hit an exit-from-xen path, in terms of skipping
> protections.
> 
> We do need to be careful about memory accesses and potential double
> dereferences, but all the data is on the top of the stack for XPTI
> reasons.  About the only concern is v->arch.msrs->* in the HVM path, and
> we're fine with the current layout (AFAICT).
> 
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I have to admit that I'm not really certain about the placement of the
>> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
>> entry".
> 
> It really doesn't matter.  They're independent operations that both need
> doing, and are fully serialising so can't parallelise.
> 
> But on this note, WRMSRNS and WRMSRLIST are on the horizon.  The CPUs
> which implement these instructions are the ones which also ought not to
> need any adjustments in the exit paths.  So I think it is specifically
> not worth trying to make any effort to turn *these* WRMSR's into more
> optimised forms.
> 
> But WRMSRLIST was designed specifically for this kind of usecase
> (actually, more for the main context switch path) where you can prepare
> the list of MSRs in memory, including the ability to conditionally skip
> certain entries by adjusting the index field.
> 
> 
> It occurs to me, having written this out, is that what we actually want
> to do is have slightly custom not-quite-alternative blocks.  We have a
> sequence of independent code blocks, and a small block at the end that
> happens to contain an IRET.
> 
> We could remove the nops at boot time if we treated it as one large
> region, with the IRET at the end also able to have a variable position,
> and assembles the "active" blocks tightly from the start.  Complications
> would include adjusting the IRET extable entry, but this isn't
> insurmountable.  Entrypoints are a bit more tricky but could be done by
> packing from the back forward, and adjusting the entry position.
> 
> Either way, something to ponder.  (It's also possible that it doesn't
> make a measurable difference until we get to FRED, at which point we
> have a set of fresh entry-points to write anyway, and a slight glimmer
> of hope of not needing to pollute them with speculation workarounds...)
> 
>> Since we're going to run out of SCF_* bits soon and since the new flag
>> is meaningful only in struct cpu_info's spec_ctrl_flags, we could choose
>> to widen that field to 16 bits right away and then use bit 8 (or higher)
>> for the purpose here.
> 
> I really don't think it matters.  We've got plenty of room, and the
> flexibility to shuffle, in both structures.  It's absolutely not worth
> trying to introduce asymmetries to save 1 bit.

Thanks for all the comments up to here. Just to clarify - I've not spotted
anything there that would result in me being expected to take any action.

>> --- a/xen/arch/x86/include/asm/current.h
>> +++ b/xen/arch/x86/include/asm/current.h
>> @@ -55,9 +55,13 @@ struct cpu_info {
>>  
>>      /* See asm/spec_ctrl_asm.h for usage. */
>>      unsigned int shadow_spec_ctrl;
>> +    /*
>> +     * spec_ctrl_flags can be accessed as a 32-bit entity and hence needs
>> +     * placing suitably.
> 
> I'd suggest "is accessed as a 32-bit entity, and wants aligning suitably" ?

I've tried to choose the wording carefully: The 32-bit access is in an
alternative block, so doesn't always come into play. Hence the "may",
not "is". Alignment alone also isn't sufficient here (and mis-aligning
isn't merely a performance problem) - the following three bytes also
need to be valid to access in the first place. Hence "needs" and
"placing", not "wants" and "aligning".

> If I've followed the logic correctly.  (I can't say I was specifically
> aware that the bit test instructions didn't have byte forms, but I
> suspect such instruction forms would be very very niche.)

Yes, there not being byte forms of BT* is the sole reason here.

>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>> @@ -36,6 +36,8 @@
>>  #define SCF_verw       (1 << 3)
>>  #define SCF_ist_ibpb   (1 << 4)
>>  #define SCF_entry_ibpb (1 << 5)
>> +#define SCF_exit_ibpb_bit 6
>> +#define SCF_exit_ibpb  (1 << SCF_exit_ibpb_bit)
> 
> One option to avoid the second define is to use ILOG2() with btrl.

Specifically not. The assembler doesn't know the conditional operator,
and the pre-processor won't collapse the expression resulting from
expanding ilog2().

>> @@ -272,6 +293,14 @@
>>  #define SPEC_CTRL_EXIT_TO_PV                                            \
>>      ALTERNATIVE "",                                                     \
>>          DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
>> +    ALTERNATIVE __stringify(jmp PASTE(.Lscexitpv_done, __LINE__)),      \
>> +        __stringify(DO_SPEC_CTRL_EXIT_IBPB                              \
>> +                    disp=(PASTE(.Lscexitpv_done, __LINE__) -            \
>> +                          PASTE(.Lscexitpv_rsb, __LINE__))),            \
>> +        X86_FEATURE_IBPB_EXIT_PV;                                       \
>> +PASTE(.Lscexitpv_rsb, __LINE__):                                        \
>> +    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_BUG_IBPB_NO_RET;              \
>> +PASTE(.Lscexitpv_done, __LINE__):                                       \
>>      DO_SPEC_CTRL_COND_VERW
> 
> What's wrong with the normal %= trick?

We're in a C macro here which is then used in assembly code. %= only
works in asm(), though. If we were in an assembler macro, I'd have
used \@. Yet wrapping the whole thing in an assembler macro would, for
my taste, hide too much information from the use sites (in particular
the X86_{FEATURE,BUG}_* which are imo relevant to be visible there).

>  The use of __LINE__ makes this
> hard to subsequently livepatch, so I'd prefer to avoid it if possible.

Yes, I was certainly aware this would be a concern. I couldn't think of
a (forward looking) clean solution, though: Right now we have only one
use per source file (the native and compat PV entry.S), so we could use
a context-independent label name. But as you say above, for FRED we're
likely to get new entry points, and they're likely better placed in the
same files.

Jan


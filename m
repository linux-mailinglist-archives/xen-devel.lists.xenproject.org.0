Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A254C607
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349894.576079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QEP-0001wF-Lm; Wed, 15 Jun 2022 10:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349894.576079; Wed, 15 Jun 2022 10:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QEP-0001tR-IN; Wed, 15 Jun 2022 10:26:37 +0000
Received: by outflank-mailman (input) for mailman id 349894;
 Wed, 15 Jun 2022 10:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QEO-0001tL-AS
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:26:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a170bfd6-ec95-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:26:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 10:26:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:26:31 +0000
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
X-Inumbo-ID: a170bfd6-ec95-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv+1SRHVMByEIBWYs3A9c2JkqyXIhiZM5s7A8Qqqix4e/Bg6eYGzvYDBnrOb6jQ8CSLPALK3lBxFnJhRFAta/veuX/LUfrnk5WGVOLRGG/RqKkkIZLkpGq9GE+BBRRFzFNn3WX3JIqMSHY1sovlPn6NBAg3ZIao9KL9bZF0Vm8flMiN1QuekBalyd/BSfn7P6nzo4JIX01GVJdPmm7Bl3mhwlXTQskzvpnfQGmKJUjgWrMnrK1TcUWPJJnguRr6NIX/KIbzTzmed/V+UOI4QeDVAO5CgJmKt/Qs5Oc0dQAwCNrrstwpkezxoR34qdFZ3kJjQje0IqRHXtD6TOHpuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1Aznw/NcwLD9NHgQfEIoybRd1YRsR4d6RXDnm7PaIc=;
 b=PENjVeV/jrL+TpjChkckQIWFY6b2iXdJ35KkHCjxNv8dTy8R58v8Nf1hQwDgyP0uh8oI+ATCa94V2s6aNlI5/sbLUW8wihlQCb5ChCKAxB9mOjaItayHuT1k4IPRMfjfTo8RdU/JdrWCVW7JnTjpGMXNDku7Aqv7i/fIi4kn6NriWxXTI9CqUVYgQBVDw9POkDQ4POwlWHLDLGVuXoFFsYpcIXhFQIcdpcYnandjyEcJcrwCOIEoJv+IT/EJVCwbtn/Oi083lXe8EQjih8dLYwe6UCG8TDJ46jFZybLZfKQmZ8C9utkI6jAW/fTivdabvw+IVWppWD9MaSdwJUJPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1Aznw/NcwLD9NHgQfEIoybRd1YRsR4d6RXDnm7PaIc=;
 b=fBp4Q99+ssHLaqDf+Ox5xf9Gh8fPKwhGhWynpjRPwQP5+Vcbxw0bdxeW0kdF5sNYBlyVfsiXTvqDQCOtTYPleISGCRoMQLcvMsPG61sr65XjdFUY3c+bBgUMJGlNeQn4mGgOE1xNOJcCL71MAmLWcGNsrLTz8ekCZZcncdX1j6ctLNO7UKagQRdzDTScuZzAyJF5resetvAGlaUqIl1FkT+h5MECsTrtqge1t9ew7CHSfzjA09QexMpzzCQ9vN60Q07jfPWhToZTmj8oWkTfN2drQhIo3AvubyJXpLJxNU0TG1KcXYhJx9WglDhWOcxpmit9a+0scXiYRKZUj8IVOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Date: Wed, 15 Jun 2022 12:26:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/11] x86: support AVX512-FP16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0164.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04185020-ebce-4ea0-f192-08da4eb98407
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5113046B5ABE75972ACC5D98B3AD9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CIJfiuW8trmbb2SZFF4SqqKOoK1Jayg2ArcZlgQ/GYORctGc2lvWot3Ojosr1ikBb1Goq9NKXbHs0jH3aHUtbMACopS92NlSXSIm7iMWW1YmEwlaqto/a3btsLGNf+ArUf5hTk9Ptczw0ZZJoHgrbkNUgbSgB/cP45MGNEEoXg8s9Nq/DPfIr2tBZT3Et8BA9OjC1KOdmZfmCCxuT5OtHr1h/uXYhlKuflEEElJVSnuk/Ro6dYlRdkl46I44qtS8kscXFqXhm5twiYXpKQrCBAc/X1KcimlElvVRhuEmQUgsvAM3cgMlO3lLil22WrE76bFUS8lcAAYowd5KU7oA0VTIqqb1jEzbYOquijEsuTq5MSrsFz3atJE9wx5+uvFp4b8hbhmgH1iMgbjKY6BxIXA0Gbx09+c2qRSnefOxPRPq7iAOX8u9FcSMc9Xzkz0efLBXzMn9mtroQycAWAy8nb9clk+S8MGI+vOg11ZMQjwGS0Lp5ks/Ed+wEPKLBozxpRCXPOKhgZBqJXOHn7ckICUl3TT5LKRKr8xnCqs3korP60NG7oYrwGutDMcNBjAyho4Bcfu2N3ONo0B9S69JJuq9lVsJh2AzFP861OqxkgXHANnZwkDiX79ovl6JlF1GC7LI58ItZ9OfUSLllNS1jDeS3wMyAflDuWO/qNYSkyA9gppmNV8mTstUwpNE2h73QwXkW8Z7CZ8HuIHBJUnt8Yh+Np9g2aIUFcIA8ZBmNEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(316002)(36756003)(508600001)(38100700002)(6512007)(6916009)(8676002)(31686004)(4326008)(6486002)(26005)(2616005)(66946007)(66556008)(66476007)(2906002)(31696002)(5660300002)(186003)(86362001)(6666004)(6506007)(54906003)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bktKV1VzY2NUL0sza0RjWTV1Nzc1NjAzVVV0VVoyOWxZWHV0YjhZYTN4VXZZ?=
 =?utf-8?B?UTlmbjFIeW1iWDVoYnVXN1FvbnF3WTZZKzMreHBIMXkyL1NqR1lrcGtYREJz?=
 =?utf-8?B?emNqa0FNUGxVT1dFYlJmYlVVTXFTWWM2MnVwbXp1WVFIamFaU1dEV1FJZ2pW?=
 =?utf-8?B?U21aUFJ4ZmNaRExRTUE2ZEQ3VHdCUEpJc21PbmdIak9kNVpHYko5WmVOdEhP?=
 =?utf-8?B?L0ZBQkp5OTlvczVPcFVLSm1GcG5YakZISDc1K004MVRPQVd0ZE5iSVRvdU5t?=
 =?utf-8?B?aHJ6cVQ2S0RFdkxLdHNUS2t3QWpVdytiOEE2eHArU2ZmNk54RnUvVDJvNTBY?=
 =?utf-8?B?Mk04M2tyQXFvdzlVTU1QQ3JXVTduNDNza2w0eU9DWVpPWmVkeGNUYTBvRUZ4?=
 =?utf-8?B?QjBBZXdJN1pLUldnVGpiMGNxNVZmZlhINFB0aXc2TEdlMmhoVS83T3VUL24r?=
 =?utf-8?B?SXBLWDdKS1grL2hDRE80R2dGYlR2aHI5Yk9NUDZHTjd5Q0FSbTRMeGhncmla?=
 =?utf-8?B?Q2JnUzU2VE0xdlRUWXdUZGw4QkZrRUFjZWYvNGJ1Z29NTE9HT0NKdThEV3ZW?=
 =?utf-8?B?bzBUVy9aaEJOZ0hMTVgxMlRLTk11SWdXQkY3TG1mdnRPVzltajF0N1FTQkZS?=
 =?utf-8?B?ZFI1TUE4NFNKZktRSGRUSEtQbGNJem1yY0Exbm1vWTJCOGFORkpTRGZFdDgw?=
 =?utf-8?B?VDhkakIyVVB3UWs0QUl2MUczMmY4SXl0S3JoQ3VyV0ZDMEorQXYrU1FLQWFa?=
 =?utf-8?B?QTkvbEdxdkE1ZmFDbzJZMDZ5bnd1RVhlYXFudnRudERHRlBkdmo0TkZTZm1u?=
 =?utf-8?B?U2NuTjdXWmNEcnl4T1NlVW10UUhnaDYzQ3lWYlhabFdSeHhORnVqY2Q3dmp0?=
 =?utf-8?B?UFpCcTZabk9BN2RDT2hUNEpXQkZPZUMwVG1peFpDb0pXVkhLSFE1SGVQSWQ0?=
 =?utf-8?B?a3dpd3FVdWNueUVCRjdoNndEdFpRVGNvbFdrWUx1SU9TSGxycSsrN3d3cHc3?=
 =?utf-8?B?RUhvSWdZeVVmYVRCcGZNUWluaG90bTZEZllUcTliRUFlUWNKUGNCcFR2Z0JQ?=
 =?utf-8?B?aDR1Y0xLZGJXM1NDdkU4ODFvRE1LSGFJdlVtcVdiMzM3SFVQYk1jYWhnNlRt?=
 =?utf-8?B?Wk9VaDdiRlVKSklMWDF5dnkzOTZxUHEwM3k5eWRJeGFrU2hFYmJoak5sZWl4?=
 =?utf-8?B?UGwzV2ZPKzRrU0pBUFRhRlVZa0pDUENWUkhlZ0xOcVRWTFQraUMzR1NoS3Nh?=
 =?utf-8?B?anN0dkIrcTZFRTk4a1pLY3hoNDROWkVtbW5DNUE4dk9CdzZUeU5xblNkWXdy?=
 =?utf-8?B?WmNZVnNuSEg5V3ZxME1KRWFEY0k3d1VJeVNnaFdFK1ZjSUpKODg3dlRVVUVI?=
 =?utf-8?B?TWtNRGd2TVp0OHhOSnBjRGExeE8vOHd4N0IxN1prRUJRRVhCTG5WYkVPSkpr?=
 =?utf-8?B?Z1hDK01YNlRKQ3kwdDVySC9nSGQ2L3Y0cGRtVC9USDFRNzJhcGpwUW9tS2ti?=
 =?utf-8?B?M1RrcTBNbkZidFppWDZJVW9zT09XMG43eUdyOVk3dGZsMHVwWVZJTjhwOEJr?=
 =?utf-8?B?N3VkMWlGeVlJaldrRmJsMGQxSnNLMXY3V1ZBbDhnTDdFaXRzUk92enArSDhF?=
 =?utf-8?B?MnBnSytnUEplbW1GaENMRGNHeVl4VVB4VjhxZllqcWRrZytlUUZRNUp2VE45?=
 =?utf-8?B?YVBZQTBuVDRaSU1rVmtWUTlVS29FRU5tNlFUR2Ria2pmaEZDN1I1SnVoQkIz?=
 =?utf-8?B?M3kydVI5UitnTkRVeDRkdUgxT3RtVTFYT09JcVJNMWR6dXE0Y1pUWmZXOEhI?=
 =?utf-8?B?aHE2RFVFWEJsTmlmc2xmVS8rTzB4cUNpdUZLanEzdERPMnJtVjZpNjVHLzcx?=
 =?utf-8?B?bG5ZUWlIYzgwYzlXN01Rc2drUnp0V1N5UkNvM1paNFE0U3lQeGZpcHNueUtW?=
 =?utf-8?B?aGpkbDdNMVRXeXNScTBKVmF5K2Z3WnRuaHJSQ2xwUTVJcmx0MWhyNHFYWStG?=
 =?utf-8?B?cUMwSDcweTZMZ1FPdVFqZldZU0FjWE1JR3BpOWp5ZE94OUppOVYyQnJ4SFNG?=
 =?utf-8?B?MkZONlFubnBtUjdOSVBNMjRGVEZWR3E4dGZQbkZ4R1pRRlhWdi95dXIyRnJi?=
 =?utf-8?B?SnA5US9wNHk3Rm5SWVMxeG9HUkREbWV4ZzhkUFNib2lMa0FNMXNGLzl2M1dR?=
 =?utf-8?B?dXdiMU5ub0FPYjVWTWNjUU1hcWlkVUhUc2VLVGovMjlhaXkwdmw4ZmNzRjFC?=
 =?utf-8?B?VVNzMVhmRVV4Q3UwMlN5NWp0K0pVTXMxbHo1NFREeHM0aWNPYXMrbXdmVith?=
 =?utf-8?B?RDNDcHdUQ3pNY0NTWWMzRDBoMS82UjY5cEpzVnE4SjZCc3dYQXowUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04185020-ebce-4ea0-f192-08da4eb98407
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:26:31.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE1e9UEwRHY08pXMDWqv019LNeefjSAHprxbhRn8+Xfnvh7cfJk6J4ldZouFq6GBbKm+H4jDUzp+ApfgWSmK1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113

While I (quite obviously) don't have any suitable hardware, Intel's
SDE allows testing the implementation. And since there's no new
state (registers) associated with this ISA extension, this should
suffice for integration.

01: CPUID: AVX512-FP16 definitions
02: handle AVX512-FP16 insns encoded in 0f3a opcode map
03: handle AVX512-FP16 Map5 arithmetic insns
04: handle AVX512-FP16 move insns
05: handle AVX512-FP16 fma-like insns
06: handle AVX512-FP16 Map6 misc insns
07: handle AVX512-FP16 complex multiplication insns
08: handle AVX512-FP16 conversion to/from (packed) int16 insns
09: handle AVX512-FP16 floating point conversion insns
10: handle AVX512-FP16 conversion to/from (packed) int{32,64} insns
11: AVX512-FP16 testing

While I've re-based this ahead of the also pending AMX series (and,
obviously, ahead of the not even submitted yet KeyLocker one), this
series is intentionally built on top of "x86emul: a few small steps
towards disintegration", which has already been pending for far too
long.

Jan


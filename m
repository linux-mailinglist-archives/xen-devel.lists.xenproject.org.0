Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93E6947E3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494571.764689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZjZ-0003ya-OU; Mon, 13 Feb 2023 14:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494571.764689; Mon, 13 Feb 2023 14:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZjZ-0003wO-KU; Mon, 13 Feb 2023 14:23:09 +0000
Received: by outflank-mailman (input) for mailman id 494571;
 Mon, 13 Feb 2023 14:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRZjY-0001qA-Fi
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:23:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef92a1c1-aba9-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:23:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7976.eurprd04.prod.outlook.com (2603:10a6:20b:2af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:23:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 14:23:06 +0000
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
X-Inumbo-ID: ef92a1c1-aba9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk9UVWC4UHZsVVWSysqCMn5obZYUrvwpwZFN0Riy94AMkw0XJZu+2aTMCOf7oBhtMRRpLNc4v612B75dg3795Np2zBUxLuuwlhi0mVBOsgELYsS3Hutw1fvvFmmPo07cBASi3bksUmsQP3QETzoTZyun+jWdeglvgCXOn24jOB/B4H8IvXzghZ9nGwNJgYOVusy5UC8Iz2dk1QClNsWfDfjHhqN0pjyea28+rpTMqp1OOHArSpUL72mEaI7VNzPhzLYbYd4sMzkAnem+69EM7z0cP+IcEIs32vtgn3WjnEiKQ8zFU61HLpVo2PyXzSR/Gf9kiJgWM4+hLUAEfiRQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfbolgYzCDhcMaxxQAQDX5yOXjbITBK7avB1Hq5jSBc=;
 b=nsH1ObcNy4js9pUCydjkbFgckRr7zFfChrxVYOCaMaMZ/U+k+K/uUwjuN7WxIbsTs8QRBP6L86BhjvovDZEi8Wn2oVz0jp8e4ZM1yuJtMrhHWBW4ouz0HtP0HIXtuU9Jcd6zAdOG9nExazOKUsD9BW+EcRtdyuQMCyFFqQrPbPFDvY7/vZ7xs56jqCVVeoCP8MTZ3FWGNmKmOT+zqhq7ZuRDpyTdLJasR8ADhZkLTAOpEfA12pXDdaFj1LpOXyAqhIly9oZeElYKDIPMvdiFt4VR2n8Rz4JigfZHJzpKaQMOL0x2UHcvjYl8we6EE/exMYWDC2TiJO1LTwGT04824Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfbolgYzCDhcMaxxQAQDX5yOXjbITBK7avB1Hq5jSBc=;
 b=DQZO2Jx5nnK9XISj3GHSeu0nAVufvBZRM8owIvuHmpbXA+rNryAp304uOV3dw0V2oQIrLLnztuF+qWmxv3r+wvZhtoDPCuUM9zOaDnvMloi+2MvduRnN9xgnGZkGnSrwsfOwHzWUzrzV0pOybeWSG2/+EPCAcLp1cYWyKBTJKDRUIrvXhn/5JkrtIMV/aQlsvUqRA7pVyY1779ZkqdWh5M9rwzCQy04QrCWt/NvzZqNfY6YEtIIlAMkgSJxUDml/8iNqg4dgrRoq/AyaR6Iez4pVMbXPhm90elXqMva0BNT9msJaIA09IRabmLLEzsjN+BPZRTuSo7+hZrxisCOUNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <339b59ed-3630-1de8-deb0-5cc9301ca139@suse.com>
Date: Mon, 13 Feb 2023 15:23:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: xen (multiboot) binary gets corrupted ELF notes
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <Y+obpe5nnLybL/8y@mail-itl>
 <9e4e8000-9e2d-6e43-df7d-9a34a75b7163@suse.com> <Y+pFQ5lDhgbSUKMO@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y+pFQ5lDhgbSUKMO@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f0e72b-0a50-4b21-df18-08db0dcdd2c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dO207QkOkAytEbxAOPkb5n6KRnBLAuM8qllFUGa/fGCG8cZhC4MH/aCIcwyZ406P4KeS7XU3c7VPXuePRshX8p0Wq0P1rpkanLGlBeHMnxCyCHUcNR3N8oMgIbeJ78krWlCCbrOy9LHxlZS5gSG4yoQrDEpM4c3Hu9UxePO94ag0Z1q2hCap5PAkuplOl5GPplodV8eTs5il0HP14Q9gYfJL78xH+aFSmCBAgDwrjuLkTppm1TKbhJKb7GIej2XQXqlVbsV9fBzfitySA6bXiu3mEIgLn/iAorCu+qLMe1B9MhntkQwial5vy/neEyvS0LKRwGhGlyCw1FWB6sBZaGRNPMUqWeycuHFhSrpPQN+c3vax7bLc62KFRqFSQRQu1tiV7PyqC58lbQIa4imo3t+vxbHvIeeiuQlLDFIrysPHc3BKKAT8iDgZiajFo47MmjsemXR/fRRQ9kuu60BKcyw4SqkFyOZUp1y++2E7jJLLzlI+KrYCOoepFTvM+c0UZOBRhhaeCnA0vwsQEqKxyKGT7p8HZRpf4v53I6hF69nXwy0XrE9/LYSG/tSanJ6aKwomJ9r29Nn+C7ti2dnyyrA0tccvviUJeEWgsbIvcJBLBIz+HpTk+j0pYnzjN+E1/y7N4ZMYyo9pniAZ0n+khQMUc9CX62HiID2mE/UXzxivVCG/SL2ARk+LMDCbLNXxdA/vjHpJAb3vH5R5vrPDpN+PtZBpJdM+LHQhDcHQRQrqfm8CkKdfsTKeGLEkO9oxKYtBGhlJzKFBGyh/n+GXKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199018)(2906002)(36756003)(5660300002)(31696002)(83380400001)(66574015)(186003)(26005)(2616005)(4326008)(38100700002)(8676002)(6916009)(66946007)(316002)(54906003)(66476007)(66556008)(8936002)(41300700001)(478600001)(6506007)(6512007)(53546011)(86362001)(6486002)(966005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2c5VjhDZHV6UUVlZU5DUnpQamRpMjJxSFBOOXQ5VWdVYk5xNDEwVW9TUmdZ?=
 =?utf-8?B?RjM1ZUl1RDJ0ei9YYnFyb1o3QTFoNzJXRUpUeDJGSW1kd051WUs0WUFWU2VT?=
 =?utf-8?B?OGlmdFUzaDFJMjBrMEMzZDVuU3JMSm9ZSm03bmtySlQwci82VWNGc1oxeVNl?=
 =?utf-8?B?cW1oYjN4endPOTQ0RkpmODE5cHBKUmZWQkI5WU04ZnRzVk9CUTcyQW54THNo?=
 =?utf-8?B?b2Z6U0t3UzZhdlBVSnZod0JvN1RhRTF1V1pUMS9wdGdPbnJEejBhdFVmVStu?=
 =?utf-8?B?dWRVVDI2R3FHMy9RZHpnQmJNSGRDS0VBNmg3YVBSVW1MaVZ5QWY5MFY3RklW?=
 =?utf-8?B?Z2dNWlZJVW5uVS82Z3dsRnpGVWxxSkxPM28vMUxSaEFPRDA1cVBRaUQxL0xY?=
 =?utf-8?B?Y3hWNFBkb1JLdlhES1U0N2xlYzJrcnFENVg1Wk9URzk1NWh3ZkVEMzBvZVVF?=
 =?utf-8?B?WlU2UlZUMkx1anFVRitjVE5GcmZsTEY4YW9WOWZVOFNDVUZha2ZGaldWekdK?=
 =?utf-8?B?WkpXZjgySnE2K3JQUFE1aVp0SFNMUlJxU09ITmxibGtIbDl2d0dDdHpuVXdu?=
 =?utf-8?B?ZHVuZUlZYVpHdXlqOVNoY1pId3FNOU5OMWt0ZWlxcHVxUXZTdThFM0NmeCtK?=
 =?utf-8?B?S2tnMUdqMHNpUjJ3cmVWVkdSenRZcU9QSnJuTHJDMXNtcnBqR3U2U25wOUVj?=
 =?utf-8?B?QUpLN2tQVy9hcmF3S1Nzc1lEQ3JtVWQ2emMrVUF6RmdGWndKRUNLcnNFSE5v?=
 =?utf-8?B?ZUZaMmk1UUwxMEVRTjBlSnBBOFArVVM5Q3FzdCswN0FFTUkrcXZzRFVNcFpQ?=
 =?utf-8?B?WUM0WXR1RDBhQ0VhNisxZC9LOGhLWThLYnQxdXA4V0ZicEV4NTlMdHUvMUVs?=
 =?utf-8?B?bmJhY0ZqSlNqekhXaFRRZGZOT0Q5amwxWWFSZ3JyVzlKVTcrZ3daUE44aUVn?=
 =?utf-8?B?ck5lcURQVElYdGdNVitrbGsvekNNcFBDOEtTOVVtaTRrNVN3ajBteURnb3Zt?=
 =?utf-8?B?NUtKU1MvdDZTT2xvZFdlc0tKWEp1dGlMRUxqcFI0a29QUnptZFdSYUN2YWZj?=
 =?utf-8?B?Qzh2aHJYWFlvV09wc0txYkgxVTRTcXBOME1MZW93V1dCdkgzRzVEbzJlSXYz?=
 =?utf-8?B?RmgvdGtFYmhZbnMwSlQ1UVRUUi9rcklieU9qT0VTQTQzRUEwZjBpeUUvaUhL?=
 =?utf-8?B?OHpOWnRISzI4UUZjYkJDaFlmR0lFejlVWFpKZUoyMVpXUFRZVWxNNCtPclIw?=
 =?utf-8?B?N1VQVnJKckljZ0U4Qmg0OHY2cENxcTUwQU5FUnpKV2oxYlF0RFE5K1BJTlJM?=
 =?utf-8?B?R1hCZlVJMkZRdFZuN0NUNG1HT081QUllbmFUckI3NWRXMlkvdTN1K2pZNDFH?=
 =?utf-8?B?cXZFZ09BcTZvbXpweWNUNE1uU3UyTml5MUZ2Mmw2d1phemM4V2E5MmliK0Ry?=
 =?utf-8?B?MWtVVE9TMVJ5L1VrclZ2L0RURHNwVk9EYkU1NnJWYS8vWUZMbDZkTy92eTJG?=
 =?utf-8?B?TXh5dGg2c2IwYWtUNHEyTkdJRjQyTVFOS3NkMW0vTVlDZXRVbGQxVmZrM2My?=
 =?utf-8?B?ZjJoS0xwYjRKcm1hcGZ1ZkVzWFJGc3ZodG1DcDVXb0s0dDJKYjF2Ym4yTW8x?=
 =?utf-8?B?T0MreW9yUGpMVjBheXJnNVcyenBLRFdIem5IOUg5Y3N3Z0h2QmlzNVB0RjBu?=
 =?utf-8?B?dmdRZkFLa3ozUHREUzhUZ3FXaWxNV3V6ZEZMVWxnczVHbUdValhYV0NSOFJs?=
 =?utf-8?B?eHJhQ2svZW1qOWZ2QnFRMlBnbUVLd090cDNBOC9qSzgrVjRnQzQzcWpsS3Jp?=
 =?utf-8?B?YW1qSEZjbXQwWjlsZTdpVW01VWEzVGJNeVNqMnFrOTZwS200ZGpienIrODNs?=
 =?utf-8?B?WXNkelJTdnpGNTlhd09vMWFJK3RBaVlpSmpraVZXMThVNHdmWmpOSVlveTlP?=
 =?utf-8?B?WUxyZ2hjeDRMNjBLT1ZWeXRjelpLMlFYR1Y0Q2xCL2liRjBpTTJUdEYwNUF2?=
 =?utf-8?B?YWI4WWpkN2dKZlJsVjFnUXl6MmFFRUxVTGdKQy9iMTdGemwxcXY1d1gvY2lT?=
 =?utf-8?B?VXF2d2F5N3h5WHpsclpwQU84NFhORlpvOW9rSzdNdVR1STNmM1hKbmg5b3ZZ?=
 =?utf-8?Q?g8KmPrwTdEiK/6R3OLxyhB6JS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f0e72b-0a50-4b21-df18-08db0dcdd2c6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:23:06.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVgom7+l/Cg4gqnzKZakdqJykH+H9DqbVjVOmAmdncBjM7UNfM5Nvfo4Ca8xDLV2elrFNkBZyFx3Xz1xhUVUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7976

On 13.02.2023 15:12, Marek Marczykowski-Górecki wrote:
> On Mon, Feb 13, 2023 at 01:53:21PM +0100, Jan Beulich wrote:
>> On 13.02.2023 12:14, Marek Marczykowski-Górecki wrote:
>>> Hi,
>>>
>>> I'm getting some ELF note issues on multiboot binary
>>> specifically:
>>> xen/xen: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), statically linked, BuildID[sha1]=f7d2c37a4ad599b268f2f2d94bff3776d12649b3, bad note description size 0xc0010001, stripped
>>>
>>> readelf additionally says:
>>>
>>>     Displaying notes found in: .note
>>>       Owner                Data size 	Description
>>>       GNU                  0x00000014	NT_GNU_BUILD_ID (unique build ID bitstring)
>>>         Build ID: c5825a0d08edc4d11b1138fedca6b14ce8ba7302
>>>       (NONE)               0x00000004	Unknown note type: (0x00000020)
>>>        description data: 05 00 00 00 
>>>     readelf: xen/xen: Warning: note with invalid namesz and/or descsz found at offset 0x34
>>>     readelf: xen/xen: Warning:  type: 0x4, namesize: 0x00554e47, descsize: 0xc0010001, alignment: 4
>>>
>>> Grub doesn't care, but launching such xen with kexec doesn't work.
>>>
>>> Initially found when booting Xen via Heads: https://openqa.qubes-os.org/tests/60151#step/install_startup/11
>>>
>>> Andy says:
>>>> yeah, I've seen the same on XTF
>>>> binutil's recent elf notes for CET compatibility use an unsigned long
>>>> so they're not compatible when we build as 64bit and then re-package as 32
>>>> I think we need to strip all elf notes in mkelf32
>>
>> Instead of complicating mkelf32 (we want to retain at least the build-id
>> note, after all, and for PVH_GUEST builds also .note.Xen) why don't we
>> discard the unwanted/unneeded notes then from the linker script, just
>> like we already do for xen.efi?
> 
> Ok, this seems to help:
> 
> ---8<----
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 8930e14fc40e..f0831bd677e7 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -192,13 +192,6 @@ SECTIONS
>  #endif
>  #endif
>  
> -#ifndef EFI
> -  /* Retain these just for the purpose of possible analysis tools. */
> -  DECL_SECTION(.note) {
> -       *(.note.*)
> -  } PHDR(note) PHDR(text)
> -#endif
> -
>    _erodata = .;
>  
>    . = ALIGN(SECTION_ALIGN);
> ---8<---
> 
> The comment suggests some notes could be useful, but given they are
> broken anyway and nobody complained so far, maybe not really?

Well, much depends on those unspecified analysis tools.

Jan


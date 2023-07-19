Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764275900F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565647.883981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2OO-0002Bu-MO; Wed, 19 Jul 2023 08:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565647.883981; Wed, 19 Jul 2023 08:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2OO-00029O-IU; Wed, 19 Jul 2023 08:18:40 +0000
Received: by outflank-mailman (input) for mailman id 565647;
 Wed, 19 Jul 2023 08:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM2ON-00029G-6z
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:18:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc09b7c9-260c-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 10:18:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8591.eurprd04.prod.outlook.com (2603:10a6:102:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 08:18:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 08:18:34 +0000
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
X-Inumbo-ID: dc09b7c9-260c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsNNqcFN3BtSF7a9OBMndwv/hKzhtxrBTe63bg+x+6L4cOezFga+jy3/bSdxnWA28aWIwaP4+h9nwq2dN+W17KBU6g+WezfVX0I/F8ctFfp+jzIoVlDAEImtCdNzWcRBmtoE5tICwqOo2kA+neZO7yhaqDssEJcyYuTtchjiv+BxaTmkmtj/rzu/u4MXEUwG3CkvQeX4IuD8AETUK1iYxW3+Z6ErbPsTUVwsZPN1Reft1j2cxEAJdCpA2tyYIG5723HRQEsHlQDmLdEe1vPKEETT39GyoQlqIa+kFRj1iBnI3rYZQh0svW4W+J6MyzETtDeK0b+YLK72cbPhZMF0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPNKuFMnJcAtiAwWAFPfnyhTPWJieqK9ZlbNC5TeTeE=;
 b=LVr6hxCFvZGtzO+TYwd3Z3diWomv55MHLxbeXmEtoo8xNZNelBmLCHY02cYQROHLKhGaFyv6sXwY6cUj++yvMQwyczxY5fAXx+/ju+ACTnbwX3EpjZjf/kOtopriw3aO5v3WvdmERwotv5eWg0Yq/xuHZSLeKA/JuJp5elExr5IVKIByos015Asx6QTSl7t5EfVAQNECcC2R5UyUP3HzVWxWc25PVZTYXyNI84YZOIdJUC1zkiHcGBG1hrfUo2vq/Aoj1YvoxzvNQH7yI7HaqonuvyPbkhkSkLsGq/i5+wh3/Hitne3QGPSufYrPMllAYHBn7HOaPf98RyYbYQbBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPNKuFMnJcAtiAwWAFPfnyhTPWJieqK9ZlbNC5TeTeE=;
 b=SHsy2KmIu5fbw90XALRGzykLmwe2nwWFQkRNZwAt4XJigLZm8BQN1qLE1Uvw/mBW2E+MK5/A1rtAnkJ1hKYBja3ShRtsZc++EFsIvFNWrbibEubcFBIhbSW0Lxl4xO+pVd2L9NvJJ+UNY0UxyCmjr0/Pjh4aJGNK5IVH7CFPsRKN5K6fyPjou79k9DgCq6YBAlPxsePLwRe1n/yE3L4HnsbxkEB7+HWXQ4zDGHLrBL6kP0iu/kV358uhIdkoHw3EULmFkGbC5v0Nh5yXB/fjKLgwRBCvbitm8Z9kmyIkWecfXentqTFLwF6rPgGqTJC5rVlWvO/4lxk581iH1ECEuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a974d462-6a7e-39a3-1747-018a519b1fad@suse.com>
Date: Wed, 19 Jul 2023 10:18:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86: fix early boot output
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3913c170-09c6-2baf-ed38-5614f8c6cb2e@suse.com>
 <f9e4d896-fcbb-eca3-ed3d-e7ad886dbc0f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f9e4d896-fcbb-eca3-ed3d-e7ad886dbc0f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a893b2-40f0-4e7c-92f2-08db8830bef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/03qXYee0ZE+hQ26KdR4rBEbndBnnmYfNrlHGSJJvQ5g7EMyAsrITth+lB/T2K5pSAIaFl0QFm/51gPJ6kHs+mdnVYKIKatjJjJnycskb17GF9lWxeY2BfU51oPrNEW+V/+i2HiEh7wjAIXbC+WyP+02VUr/qnZfMDtMhcjduFC+GaIVQwWHv2mOVONm5UYKcP89/RNxOG+Kyo39Yy7FE4cVhF9LKOkZPFo9sXkcjbqpGQGf9KozLjbUiZAxkZwnRbbtbTgjDyKu8jisSivJ67jYHmHSJjK5Q/fqlI0PMPfddwqDbCjtev8pUFE0rouTE517lHOXeNkrkKksVsz+yBYvKxUcBamg1IHqJx2+EzzViiHDswdwHjY0t/Y5GeWV9/o5TjouErL08Ek4+TgYrhIgj9Ww7Gf83Z7/yip1HVrBmdXcGi/shVefsehoBGCc+i2yzvZr1TRgaorfBh7mN/k+wQcVNA2BRbKWjcWpBMY2v7rd5b/zztU/wTUYlyK/1C9so4AusKdDEKQQsjkFj005ZwawdMA2tE7E9uSHct5n9DJ+erMugPNo1pPy6janq50YyIyiYG5DoSQAW58eNIgw/U9BDmOJabSzqAA+S5AUHAnrFKwSsMIV2c5mhyk/yUUA6aX61ZcL8EKnqHrkKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(478600001)(54906003)(6486002)(53546011)(6506007)(186003)(6512007)(26005)(2906002)(6916009)(66946007)(316002)(4326008)(8936002)(66476007)(5660300002)(8676002)(38100700002)(31696002)(36756003)(83380400001)(2616005)(86362001)(41300700001)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE5JSGp4VUNESDRpVlAyVFpHUTBxajRPMFlXUnhycE1WM0dUVTg4WjdMblcr?=
 =?utf-8?B?MzEvK2hsZ21YcklyU044V3drb3FsOW9oNXkzL253RGFzMmVqTjZUMTAzcFQx?=
 =?utf-8?B?S1NDNzREKzUyYVdYbUFUTDZ5bVFFWGd5QlFyWU9jS29MMzJCRkUyVDhNUnpu?=
 =?utf-8?B?dGFSZ1BLbEYwSUtVYjlxY2E5UjB4Ulh5MUY3YUNmUGN4WTdzQmJxVnEvakp6?=
 =?utf-8?B?Slp3YjhZQk1OWWUxM3RTc1cxb3I1Z1kvenkycEFiaDZON3VSSVVZQXVFRytl?=
 =?utf-8?B?emNtV0JzbTlzNHQ4ZlRtbEhSWkJlTkd0SUNqT0tNelNSVTZ5S0FMd3NaQVp6?=
 =?utf-8?B?UjlrMC9LV2w3UEFJNnA5cmlmZTJGMnRnU1RUTE5KaVdkRU16RTVoU0NYVjA2?=
 =?utf-8?B?NmFCa2hXNzZTbUdYekZLeC9YVlVweXRyM3BTaXlLSWd6QmtsMzBGME5oYjNL?=
 =?utf-8?B?cFJvcEZMeTJvZ0NicDRYKytXblQwU3Qwb3RLaS83YmloUmFIczFUeU4wR3Rq?=
 =?utf-8?B?ZnkrT0VEZ1Fyd2FVNXpoQTQxR3FRVXdseC94TUxENmlHTEtkUVZ4UTMrZ3pB?=
 =?utf-8?B?ZkN4QkdQVU5sMUF4V2JsZFJRbjVOQWZKTW9NUnhNVEdzekxyeW9uZXVvMHAy?=
 =?utf-8?B?NWMvSk9kMlNIeElyVmpYTy9SOUVBTnpLWXBlZ3ZNdUhKb2hiK1ZVaWFhUUVH?=
 =?utf-8?B?OVhPNGpzRFg1WTE0SHAyQVJER2RHRDhTQVcweFpCQ0FMS3BNRlZzQWZaSmha?=
 =?utf-8?B?REF3eWtRWGRvZ3lCM3NSVVY1ZWhvL3NSSTlZbldHRlBRcjl5SUtyb1VPVytn?=
 =?utf-8?B?eDlRK3VuVXNBU3NMRHdEaWdhR2VTdFp5MGJTWWwrZE9CaGNubkVObW5VdlJt?=
 =?utf-8?B?TW9Bb2RPdnRHb2JjZlFKeE1udTlTd1BxYUZLbFMxNG0zMEVEYnhFOTFPbUFS?=
 =?utf-8?B?eFc1VGlHK0tMdnJCd1dQWC9td29ZUDRlK3oxemNvTjJDRXp3UGl2eGNVZ1Fj?=
 =?utf-8?B?K2QrSUhHbDdBcytrQTBoSnR3MWV4SEtRKzkvNEoxb1l6Z3pBYWh3VG51TG9I?=
 =?utf-8?B?L0E5R0kxWG5IRms5U09haHJkc2NsbGp2SlJnamN1T3d6ZGgzOWxaM1BXY0dT?=
 =?utf-8?B?Ujhac2syNDZSRDR3VjhYTHNSdndOV3NvUnBQVWFZNTBiMVE2SjFWbHBUc2NP?=
 =?utf-8?B?dFZoN3pLaXIwUENkVUp6RmFkT2U5bmhRelpmZjdKQkhXU0NnYzI4M0poNkJD?=
 =?utf-8?B?SGo2Y3lsNUQ3MFpxbmNvcExvRE9Uc1VZOEhJQUNtNmVsTGZkRytHY0hYTU0v?=
 =?utf-8?B?cnFHT01MMHlJeEp5bHFNdjRLYTMvWkVJN3JQMHZLYkF6QXdyT0dwK0duTUMy?=
 =?utf-8?B?cmc4KzV6NjYzbURGajV5enBzWHBYZ1RaN09odFo0S3p3eUxrWEFRSW4zV0Y2?=
 =?utf-8?B?UWx3azBhQ2lwN3BUSXdubVJ5RDh5Qzh4eWJBalRNVURyek9FLzBSZVFwUEVC?=
 =?utf-8?B?cW5DNGJLSWd1c3pBUGExdWwxU3kyN2RjdXRJRGd1Um5VS09RZU9Sc0dSaFlJ?=
 =?utf-8?B?VFFBKzNJYnN2WWs1QmJZSkd2KzVJWm41SVE3VHdCVVNXWndkbEF6R3pOWVpO?=
 =?utf-8?B?UTd0N2tEclZmOTBhRVdSWmVwUFQ3VHpvWUYwQlgvSmJzUGFWOVBSZkRLckht?=
 =?utf-8?B?R0NPSzN3ZGRZV3pNSHByQ2xCOUdzbEUzaVAyT1pmWVFycnhFbTdVVkowUWdo?=
 =?utf-8?B?WlJsU3AvNGRvb2VVSzdhaXRhUDd4Y1RPcHhpb09kUFhRTHJMTlpXdG9vcW5D?=
 =?utf-8?B?RkRVTWt1OWdUcXBxa2VvclBydFdrQXlNdFlGVnljeTlDSXFKcHZVSmE2bkl4?=
 =?utf-8?B?NGw0Zk15d1NPMHlaOWJuMmdSZER0d2dJVit6YnYzZlVtZi9OYWhQcEsxWWZQ?=
 =?utf-8?B?enI1SWFUY2krY0srMUFHYXdpQ0JaZkp3OTQ2UWZ5MENsUFE3S00yM1U0Smxt?=
 =?utf-8?B?bDhGR3FjQU1vaFB2WUtjYjQ2bUp1VG0xdkFKcDl0VnNTSUwwK2FGWmx2Z1ly?=
 =?utf-8?B?bGxyU0Q0RVQraXlVOEw2SXNOM1lIZlp3YVd5dlBJNjM3TGxmZGhsTXVQemF3?=
 =?utf-8?Q?0DKG1G3Dg72BX57oCNni0+zzR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a893b2-40f0-4e7c-92f2-08db8830bef0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 08:18:34.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alYmRqVSEi2HwtdZB1VWd7R+Pery64UGrU1lmfBlPcPRUZyGhveIFGuK1Uk5D7IZ1qo6PQWCL8gDsA8Y884QMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8591

On 19.07.2023 10:06, Andrew Cooper wrote:
> On 19/07/2023 8:38 am, Jan Beulich wrote:
>> Loading the VGA base address involves sym_esi(), i.e. %esi still needs
>> to hold the relocation base address. Therefore the address of the
>> message to output cannot be "passed" in %esi. Put the message offset in
>> %ecx instead, adding it into %esi _after_ its last use as base address.
>>
>> Fixes: b28044226e1c ("x86: make Xen early boot code relocatable")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> When I was doing the label cleanup, I did wonder how this worked, given
> that it clobbered %esi.  I guess this is the answer...
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> Although it occurs to me that probably want to (optionally) use one of
> the IO-port/Hypercall protocols too to get these messages in PVH boot
> case too.

Probably.

>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -184,12 +184,15 @@ early_error: /* Here to improve the disa
>>           * Here we are on EFI IA-32 platform. Then reliable vga_text_buffer zap is
>>           * impossible in Multiboot2 scanning loop and we have to zero %edi below.
>>           */
>> -        add     $sym_offs(.Lbad_efi_msg), %esi
>> +        mov     $sym_offs(.Lbad_efi_msg), %ecx
>>          xor     %edi,%edi                       # No VGA text buffer
>>          jmp     .Lprint_err
>>  .Lget_vtb:
>>          mov     sym_esi(vga_text_buffer), %edi
>>  .Lprint_err:
>> +        add     %ecx, %esi     # Add string offset to relocation base.
>> +        # NOTE: No further use of sym_esi() till the end of the "function"!
> 
> Minor, but I'd phrase this as "Note: sym_esi() no longer useable".
> 
> It is obviously limited in scope, but "until the end of the function"
> gives an implication that it's fine thereafter which isn't really true.

It is very true. The use here is the first out of several dozen. It is
only not true for the code that immediately follows this function (for
an unrelated reason). If this really was the last use, I would have
taken the liberty of adding an #undef. That said, some re-ordering might
help the situation, but that's nothing I'd like to spend time on right
away.

Jan


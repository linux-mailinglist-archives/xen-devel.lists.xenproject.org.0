Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08A6C2FC3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512333.792280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZom-0001RN-L5; Tue, 21 Mar 2023 11:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512333.792280; Tue, 21 Mar 2023 11:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZom-0001Pe-IB; Tue, 21 Mar 2023 11:06:16 +0000
Received: by outflank-mailman (input) for mailman id 512333;
 Tue, 21 Mar 2023 11:06:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peZol-0001PY-5n
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:06:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63db9dbe-c7d8-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 12:06:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7720.eurprd04.prod.outlook.com (2603:10a6:20b:299::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 11:06:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 11:06:10 +0000
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
X-Inumbo-ID: 63db9dbe-c7d8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxdCieTJ/z0tnAezdNgwz7nFIsp1i4zk4TAvMGx29mYRXwJkOgabKl+aBMPlR/dQ+uEs5BlFECpXAvJGXFDwsz1GcWcHW7I8Vou8R/Lxq1g/IJ9HHqWOUKWSFuRnXuoGLAAWhI5X96IKn7Xpp16prfqb0ANVp6f61QXVDRrEX+bxoFpJq2uYYiQw2O3xdqxEk2Z6X2YwLbxhmRUNiDRRo0X225iDZJ4oM23sH25tb8xh5lSOJlp3MzXnEiCWaEBgxBwZCY8PurT8/DV8sl5PInSET6c4lHgCr9mJnDKXb7Vq+j4MAvCnMYfPqiF7e/k7pNbW22VbvO34G5Upym6tRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSchx/4MgpMuciJuO4p+NjH1X9ySZ+yhPNiUtH8k0PA=;
 b=kf12n19SOLtyclpyguGfZ6T5wuOn2ZpS7tscJ4+AJZjYHIO60OCZ7y4iMGMkRkL0hIplN615CJmG+EO4KdiAxXX4gNPYoC94+6JtL0nWKOK4MQL5yI6xMs8YlRb13VVQorme6YAhxU/ct2p3ljidAdpF9yxTgqxobtkLkjNqo1lCGf1afQnQWSpOs4eI0QZEfo5zIjSarhPFXNbEbQEzm79wyDEPs8keWw+y3tYoPptTALGE565/JfiKpnUFGp6bxA5e3sxdV6BWd9cW9oivjKFzuYeWio5lIL+zVsw3QVxaTLZ41GMgE/fUmJ1yxEaDmH6xFhc8vfdiW6YMNj4cog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSchx/4MgpMuciJuO4p+NjH1X9ySZ+yhPNiUtH8k0PA=;
 b=ljs6u/S/r/rvRBk2gdfO5yMjtA+InFHz7VsuvMVPFsAIjv/mmK6yL8MCSQEHLAHaG/LSBVm28DOs1hd7+3rSTLpWGMDNK/NdtuezGQfHAi616ctVhzy0WmAIJShobMmfoTHtZCeCSXWkMkt2HCJXGKrKe5X+pl4AWSJBi1k9AtfoHDjQIAYjB964TeSyVbXSZpsASdQRy+j0yesTmDdt60UvavPdNs9YpguYX011kmU3mvMgiKm5pXz6zIiiTAiaPlFwcw3+uaX/7KJES3vAi89TYJ8x9hyFkfYSnKNLUjlfq0f/I/EArEUOKBngFfiaNVArihu0x+d4sJ+QkkmM0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2072a771-5aab-22b0-7421-bf061d9bd582@suse.com>
Date: Tue, 21 Mar 2023 12:06:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v4] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>, xen-devel@lists.xenproject.org
References: <1d3e2081fba9a1ce07c3e2a28eddcd6f51d52854.1679348946.git.isaikin-dmitry@yandex.ru>
 <61f94060-010d-2b28-d947-e5790d6d57e6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <61f94060-010d-2b28-d947-e5790d6d57e6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f663d20-f74f-4fe5-946f-08db29fc4682
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eSfNfJKuvu8SOE6PcLYHbHnjx8yH1o7znKofxV09FRbxWFqaKsxD8ZpTJkeYCiY2IkcerEdkxZI0q2pdsAANoWlx0xhFugG9At3hHNqGLlHQOcbrxUvvV7Vzreb7EbQZsEDCqBE40KWNgmEisvBE9Jit7w+8fI51xBepvONIIe06ULK7+wq3EYJjj9iAsT71a9NlsdYbC2rl5C5O9CPvt7M6gkd50tqO+002DZwXMIBYfNl5ISJM32fO1f1a5OHpZnlkHbKIDu8XLBWNUlSf+obW8j9eJg/2hbFnc05Q9Yf8l21Sm0oQbeLWuVyByVGtHxLvskARN/kwtdoD50LU2jq8jrS/NOp0lT8ZN2KHfh3n+juGpTR0ZfCHaPUsvhZL9akiItxOqK3u1WpZrR9fMD3x93MGRey5LRUds21owqnwcfONIQeMYV/cYPVh0pP5VFFVS6Sx4kqSGTXx3VBP5S81o4ejnmUkViNr71QSAWI+MgcidrI3Epfo0YmCY4Y+n+oiynJexwmpqDDHsLvbOQ4WLLAeMOiNRtz2Zc6602TMLbSgThxV5eZCOW5YXoudB+B4cVad+ES81R+9MH90XqBDGVq6yTXqVra2H8sVjdF0y2rffQnDRJWblE+2NOKPR67k9Ry3uU7DLiBSqOy4yBbqOEzYP3IT1sZESbjkD6tblh8/ZXRZJXoBwWXC9qFAM3++B5Mm/VLw1Ie5CONt/A8MnQq0clvvX2KNDmOr43E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199018)(31686004)(2616005)(83380400001)(966005)(6512007)(110136005)(54906003)(316002)(6506007)(53546011)(26005)(186003)(6666004)(478600001)(31696002)(66556008)(6486002)(86362001)(38100700002)(7416002)(66946007)(2906002)(8936002)(5660300002)(4326008)(41300700001)(66476007)(8676002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHpuZE56VE9QUFVRdk1hcFFUYW5ZdHNkVHd0U0hIdkQxR0pvMVpiZGdTOXg0?=
 =?utf-8?B?RHd1eWp2Uml6YzRLRHlnc0F5VjQ1YnpmdDlVQ2F4UzdUUEhnYVM5SlVpeStk?=
 =?utf-8?B?K2RIdFJ1Q3lHOEVsTE9BaElqMUVhd25FL1QzZ254a1Fha0FudXg1eUxJM1Qx?=
 =?utf-8?B?Z1pYU3Z4MTJHSmdVSXZ1a2VPYythOUZ2UFVkTGI4d3dGS2VDVmpBVWlwWk0x?=
 =?utf-8?B?RkZzOGR6R2o0UVphdVY3Y3NXYlFzc015dFhMdXg2TkcybmVkdG9mRVl6cDdQ?=
 =?utf-8?B?ZHlsbkpxM1dZbmJjaEhrNGFjRlpxbFE4bzA0K21oRStOUVdrd0Z0Sk8yc2lt?=
 =?utf-8?B?SWJGRkgvL21IMGNxZlZaUW8vSk9PYmNDSU0vUWZhMWRGamZzNGVhUUhVRFFL?=
 =?utf-8?B?cTFVVjY3M0hLK3MxSXBILzQycWxHblFjRWxBZENaMmZ1WkovaURWSU53UmNk?=
 =?utf-8?B?WURYVmJySkxmZnMvQ1hZU0RkcGlHV3V4TXB0Zk5pc0lGNW9SYThQcXhwMXFi?=
 =?utf-8?B?b081dm5MSy9CRGtiZCsrV0ZlRUliQUlpTU1aUXdTWnhDK0p4blE2KytFd0g5?=
 =?utf-8?B?ekRRY1RRUzdKSlJCOVVCZDlta3pESTYyYkZha1RLaWMvVEUwU3NHNTBvdXhW?=
 =?utf-8?B?T2hoK2N2VE1FY0ZqaFAySlN6dENSR29QQ2N3aHFNMDEzL3FlSi9VaUlxS0xi?=
 =?utf-8?B?WWZ4Q0N6V2pvVFpzYllkb290WlJBdVRkV0ZWdi81K3BTSENjM0dlamVER3Vm?=
 =?utf-8?B?MyswUWNraE5VUmRNWnFYQ1Q0U3N5WWlwUkRFUDNiS0wycWtEVjJ0ak1HWXQ3?=
 =?utf-8?B?bDlZYWxlazBMTDRpYTRJd2F0c3ZtclFMNzRNMUFYVWtTa1VRUkZWTUNQcktB?=
 =?utf-8?B?ZEpZY3JMdG1SdTRDTW1aMzh4bWJ0b2p0dnVMZU1vY0F1RkhzOVBMQnhPdXFX?=
 =?utf-8?B?QW1BUGo3N2ROTEkrb3NGQm9la1dRSzF3UURoTG5na0UyT3ZuRUJrbjZEcHRB?=
 =?utf-8?B?ajlSK0grSHN1bXpTVVFQMi9GSTRVejJtS3ZMSWlqUXJyK3F2TnI0bUFnbnh4?=
 =?utf-8?B?QzZRUmdQM1ZJQitYU2s5U21ETmI3MmlNS2V4bGs2OWk4M0JXdWxYcDVjRmYy?=
 =?utf-8?B?Zjk5NVRYdlhHZmdxczFhelFJd2VTZm02K1RQdXo3MFNIRkJ0Q2toSHBvNFhG?=
 =?utf-8?B?aWx4VGRqNzhQdHhqRU84NUdSOHFseTk3QmgyMkVzQXJrZVFweElpQldtK2Rp?=
 =?utf-8?B?YjV4Rk5zbzA0Qlo5b0RDaS9yeEdXYWJnYTNLVTVVWmliRW8wZkRpR2RYTHJJ?=
 =?utf-8?B?ZGxuZXRqUlY2eUNzcndlUitJMWtJMmhud01KMjJvdy9rc3hzdG4waXZhYjAr?=
 =?utf-8?B?akFDS2JlR1ZpU1U0UHArdzRPcUxmeDVYOEk0dG56eEtmZEVnVDFTNTkzVEJv?=
 =?utf-8?B?N3c4T3dYOTFHWG5JY3ZWNGdKQ2tjN01DbWRWNUlPU0pyVVBQeTg0T3RpcXYr?=
 =?utf-8?B?d1B1U0hHRzF0MDZCZVFWbkQ4Nm5lb08xOW5wQmJrSVNEMHp5dkNYT2NNRWZX?=
 =?utf-8?B?c0RaRVoyWWZKOXB5Um54Nkh5Ylp1MlRZdjlyQlpET1FYQ0pUcHpVV0RhVDZm?=
 =?utf-8?B?WG5iUEtGUzVGU3FnL3o5VFJRZlV3bzF0Rmd4RSs4TzhLN1dESzNoWndMZUJT?=
 =?utf-8?B?SFNNUzdYeXZ3TmJzcmFqRVhmekNGMG5GQytIVnc2R1Boc3lldnRzMzFKM2tm?=
 =?utf-8?B?VnBOalJkMlU0aTFHREdtL0VLMFR6YVlQTzhNTVBVUWFibTJwMUNEaFptVFlT?=
 =?utf-8?B?bFR6dU1CWFEwd0tLT0xta0ZvN0FSS1NPNWJRVlEwL09SaGFCS25Od29oUHpK?=
 =?utf-8?B?R0tWbDR0a2l4MEFGOTRkQTlkOEpIbTk4c01JeFBoS1JMQVhvcm10a0YrY2ds?=
 =?utf-8?B?bUZ1S1ByV0ZOcndlQ0ZYR2lONXVMRkdpNnVZOEg1RDRKVjAyZlVucWplSUhJ?=
 =?utf-8?B?VGFLbm0xSnhVVHFJcnQrcXpYTkY2WStpcUdaOGMyemdCd0Y0K3E1dXNiSklZ?=
 =?utf-8?B?VGNubWZMVlBEa2g1UUo3NnhORko2RDIzQ28zWkJBQzV1akZERmdoVHB0QTNi?=
 =?utf-8?Q?mByh2U0K/rJ5g6YF06x8PlYoN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f663d20-f74f-4fe5-946f-08db29fc4682
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 11:06:09.9517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkehWhashfQxxaPlW2QKnVdke+AqqrHrCe3St0eHpQDEQt5t255EMNaHibRnhEuAUZuMCi7Gq/muj15x9bd/RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7720

On 21.03.2023 11:51, Andrew Cooper wrote:
> On 20/03/2023 9:56 pm, Dmitry Isaykin wrote:
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 00b531f76c..0b7a302928 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -4560,8 +4560,24 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>          break;
>>  
>>      case EXIT_REASON_IO_INSTRUCTION:
>> +    {
>> +        unsigned int port, bytes;
>> +        bool in, str;
>> +        int rc;
>> +
>>          __vmread(EXIT_QUALIFICATION, &exit_qualification);
>> -        if ( exit_qualification & 0x10 )
>> +
>> +        port = (exit_qualification >> 16) & 0xFFFF;
>> +        bytes = (exit_qualification & 0x07) + 1;
>> +        in = (exit_qualification & 0x08);
>> +        str = (exit_qualification & 0x10);
>> +        rc = hvm_monitor_io(port, bytes, in, str);
>> +        if ( rc < 0 )
>> +            goto exit_and_crash;
>> +        if ( rc )
>> +            break;
>> +
>> +        if ( str )
>>          {
>>              /* INS, OUTS */
>>              if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
>> @@ -4570,13 +4586,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>          else
>>          {
>>              /* IN, OUT */
>> -            uint16_t port = (exit_qualification >> 16) & 0xFFFF;
>> -            int bytes = (exit_qualification & 0x07) + 1;
>> -            int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
>> -            if ( handle_pio(port, bytes, dir) )
>> +            if ( handle_pio(port, bytes, in ? IOREQ_READ : IOREQ_WRITE) )
>>                  update_guest_eip(); /* Safe: IN, OUT */
>>          }
>>          break;
>> +    }
> 
> Sorry for the delay.  I've got the Intel side sorted now too with
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=f71f8e95c34fedb0d9ae21a100bfa9f012543abf
> 
> The rebase is:
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 78ac9ece6ff2..7233e805a905 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4578,6 +4578,14 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          __vmread(EXIT_QUALIFICATION, &io_qual.raw);
>          bytes = io_qual.size + 1;
>  
> +        rc = hvm_monitor_io(io_qual.port, bytes,
> +                            io_qual.in ? IOREQ_READ : IOREQ_WRITE,

Here the conditional operator needs dropping; it just "io_qual.in" which
wants passing.

Jan

> +                            io_qual.str);
> +        if ( rc < 0 )
> +            goto exit_and_crash;
> +        if ( rc )
> +            break;
> +
>          if ( io_qual.str )
>          {
>              if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
> 
> 
> ~Andrew


